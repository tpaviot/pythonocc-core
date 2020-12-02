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
%define RWMESHDOCSTRING
"RWMesh module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwmesh.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<RWMesh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<Graphic3d_module.hxx>
#include<TDF_module.hxx>
#include<TopLoc_module.hxx>
#include<XCAFPrs_module.hxx>
#include<Quantity_module.hxx>
#include<Poly_module.hxx>
#include<Image_module.hxx>
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
%import TDocStd.i
%import gp.i
%import TColStd.i
%import TCollection.i
%import Message.i
%import TopoDS.i
%import Graphic3d.i
%import TDF.i
%import TopLoc.i
%import XCAFPrs.i
%import Quantity.i
%import Poly.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum RWMesh_CoordinateSystem {
	RWMesh_CoordinateSystem_Undefined = - 1,
	RWMesh_CoordinateSystem_posYfwd_posZup = 0,
	RWMesh_CoordinateSystem_negZfwd_posYup = 1,
	RWMesh_CoordinateSystem_Blender = RWMesh_CoordinateSystem_posYfwd_posZup,
	RWMesh_CoordinateSystem_glTF = RWMesh_CoordinateSystem_negZfwd_posYup,
	RWMesh_CoordinateSystem_Zup = RWMesh_CoordinateSystem_Blender,
	RWMesh_CoordinateSystem_Yup = RWMesh_CoordinateSystem_glTF,
};

enum RWMesh_CafReaderStatusEx {
	RWMesh_CafReaderStatusEx_NONE = 0,
	RWMesh_CafReaderStatusEx_Partial = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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

class RWMesh_CafReaderStatusEx(IntEnum):
	RWMesh_CafReaderStatusEx_NONE = 0
	RWMesh_CafReaderStatusEx_Partial = 1
RWMesh_CafReaderStatusEx_NONE = RWMesh_CafReaderStatusEx.RWMesh_CafReaderStatusEx_NONE
RWMesh_CafReaderStatusEx_Partial = RWMesh_CafReaderStatusEx.RWMesh_CafReaderStatusEx_Partial
};
/* end python proxy for enums */

/* handles */
%wrap_handle(RWMesh_CafReader)
/* end handles declaration */

/* templates */
%template(RWMesh_NodeAttributeMap) NCollection_DataMap<TopoDS_Shape,RWMesh_NodeAttributes,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, RWMesh_NodeAttributes, TopTools_ShapeMapHasher> RWMesh_NodeAttributeMap;
/* end typedefs declaration */

/*************************
* class RWMesh_CafReader *
*************************/
%nodefaultctor RWMesh_CafReader;
class RWMesh_CafReader : public Standard_Transient {
	public:
		class CafDocumentTools {};
		/****************** CoordinateSystemConverter ******************/
		/**** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ****/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return coordinate system converter.

Returns
-------
RWMesh_CoordinateSystemConverter
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****************** Document ******************/
		/**** md5 signature: f1ea737a8b05f13f2dfa74b0220b3aaf ****/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Return target document.

Returns
-------
opencascade::handle<TDocStd_Document>
") Document;
		const opencascade::handle<TDocStd_Document> & Document();

		/****************** ExternalFiles ******************/
		/**** md5 signature: 1100efdc16f5df4da63f3649f3bae2f1 ****/
		%feature("compactdefaultargs") ExternalFiles;
		%feature("autodoc", "Return the list of complementary files - external references (textures, data, etc.).

Returns
-------
NCollection_IndexedMap<TCollection_AsciiString>
") ExternalFiles;
		const NCollection_IndexedMap<TCollection_AsciiString> & ExternalFiles();

		/****************** ExtraStatus ******************/
		/**** md5 signature: 4be6e997d4880e0ab8cc27428c8f0f54 ****/
		%feature("compactdefaultargs") ExtraStatus;
		%feature("autodoc", "Return extended status flags. @sa rwmesh_cafreaderstatusex enumeration.

Returns
-------
int
") ExtraStatus;
		Standard_Integer ExtraStatus();

		/****************** FileCoordinateSystem ******************/
		/**** md5 signature: d72ac3620d44fe58451d339df9438e6a ****/
		%feature("compactdefaultargs") FileCoordinateSystem;
		%feature("autodoc", "Return file origin coordinate system; can be undefined, which means no conversion will be done.

Returns
-------
gp_Ax3
") FileCoordinateSystem;
		const gp_Ax3 FileCoordinateSystem();

		/****************** FileLengthUnit ******************/
		/**** md5 signature: 14fd56cee1352d70dddb846bfcfdde08 ****/
		%feature("compactdefaultargs") FileLengthUnit;
		%feature("autodoc", "Return the length unit to convert from while reading the file, defined as scale factor for m (meters). can be undefined (-1.0) if file format is unitless.

Returns
-------
float
") FileLengthUnit;
		Standard_Real FileLengthUnit();

		/****************** HasFileCoordinateSystem ******************/
		/**** md5 signature: da4cd60661aeb88dd4b9cedc5dc152b0 ****/
		%feature("compactdefaultargs") HasFileCoordinateSystem;
		%feature("autodoc", "Return true if file origin coordinate system has been defined.

Returns
-------
bool
") HasFileCoordinateSystem;
		Standard_Boolean HasFileCoordinateSystem();

		/****************** HasSystemCoordinateSystem ******************/
		/**** md5 signature: b112fe205acda6f2c67c5b6f44fb07f7 ****/
		%feature("compactdefaultargs") HasSystemCoordinateSystem;
		%feature("autodoc", "Return true if system coordinate system has been defined; false by default.

Returns
-------
bool
") HasSystemCoordinateSystem;
		Standard_Boolean HasSystemCoordinateSystem();

		/****************** MemoryLimitMiB ******************/
		/**** md5 signature: 253eb601a59ae112d72316a149f20351 ****/
		%feature("compactdefaultargs") MemoryLimitMiB;
		%feature("autodoc", "Return memory usage limit in mib, -1 by default which means no limit.

Returns
-------
int
") MemoryLimitMiB;
		Standard_Integer MemoryLimitMiB();

		/****************** Metadata ******************/
		/**** md5 signature: e788e4dbc1ee17e53751666b1c7a1403 ****/
		%feature("compactdefaultargs") Metadata;
		%feature("autodoc", "Return metadata map.

Returns
-------
TColStd_IndexedDataMapOfStringString
") Metadata;
		const TColStd_IndexedDataMapOfStringString & Metadata();

		/****************** Perform ******************/
		/**** md5 signature: fb9d26fc55229f4ce3ada0d70bce287b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Read the data from specified file. the document instance should be set beforehand.

Parameters
----------
theFile: TCollection_AsciiString
theProgress: Message_ProgressRange

Returns
-------
bool
") Perform;
		bool Perform(const TCollection_AsciiString & theFile, const Message_ProgressRange & theProgress);

		/****************** ProbeHeader ******************/
		/**** md5 signature: 62d0d942adff0fd3f5d25c775b2e2dde ****/
		%feature("compactdefaultargs") ProbeHeader;
		%feature("autodoc", "Read the header data from specified file without reading entire model. the main purpose is collecting metadata and external references - for copying model into a new location, for example. can be not implemented (unsupported by format / reader).

Parameters
----------
theFile: TCollection_AsciiString
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") ProbeHeader;
		Standard_Boolean ProbeHeader(const TCollection_AsciiString & theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** RootPrefix ******************/
		/**** md5 signature: 23690698ed70038f8be604f633be3713 ****/
		%feature("compactdefaultargs") RootPrefix;
		%feature("autodoc", "Return prefix for generating root labels names.

Returns
-------
TCollection_AsciiString
") RootPrefix;
		const TCollection_AsciiString & RootPrefix();

		/****************** SetCoordinateSystemConverter ******************/
		/**** md5 signature: 8488d2b612c66076826cc33d2ac72536 ****/
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "Set coordinate system converter.

Parameters
----------
theConverter: RWMesh_CoordinateSystemConverter

Returns
-------
None
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****************** SetDocument ******************/
		/**** md5 signature: 58f652f27d40d8d626eb93e1d1864a2d ****/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "Set target document.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") SetDocument;
		void SetDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****************** SetFileCoordinateSystem ******************/
		/**** md5 signature: 5b98d7175d246de57ccdb9b542ea9abf ****/
		%feature("compactdefaultargs") SetFileCoordinateSystem;
		%feature("autodoc", "Set (override) file origin coordinate system to perform conversion during read.

Parameters
----------
theCS: gp_Ax3

Returns
-------
None
") SetFileCoordinateSystem;
		void SetFileCoordinateSystem(const gp_Ax3 & theCS);

		/****************** SetFileCoordinateSystem ******************/
		/**** md5 signature: 71f77ac32b577862a6651efd59130fc7 ****/
		%feature("compactdefaultargs") SetFileCoordinateSystem;
		%feature("autodoc", "Set (override) file origin coordinate system to perform conversion during read.

Parameters
----------
theCS: RWMesh_CoordinateSystem

Returns
-------
None
") SetFileCoordinateSystem;
		void SetFileCoordinateSystem(RWMesh_CoordinateSystem theCS);

		/****************** SetFileLengthUnit ******************/
		/**** md5 signature: 24dc22ac228a82196016ff9b95bad737 ****/
		%feature("compactdefaultargs") SetFileLengthUnit;
		%feature("autodoc", "Set (override) file length units to convert from while reading the file, defined as scale factor for m (meters).

Parameters
----------
theUnits: float

Returns
-------
None
") SetFileLengthUnit;
		void SetFileLengthUnit(Standard_Real theUnits);

		/****************** SetFillIncompleteDocument ******************/
		/**** md5 signature: c6d0115c05694466da17a9288ba319c3 ****/
		%feature("compactdefaultargs") SetFillIncompleteDocument;
		%feature("autodoc", "Set flag allowing partially read file content to be put into the xde document.

Parameters
----------
theToFillIncomplete: bool

Returns
-------
None
") SetFillIncompleteDocument;
		void SetFillIncompleteDocument(Standard_Boolean theToFillIncomplete);

		/****************** SetMemoryLimitMiB ******************/
		/**** md5 signature: 8047ea1bc715ccac147f78824b0ea73a ****/
		%feature("compactdefaultargs") SetMemoryLimitMiB;
		%feature("autodoc", "Set memory usage limit in mib; can be ignored by reader implementation!.

Parameters
----------
theLimitMiB: int

Returns
-------
None
") SetMemoryLimitMiB;
		void SetMemoryLimitMiB(Standard_Integer theLimitMiB);

		/****************** SetRootPrefix ******************/
		/**** md5 signature: 657f534b70513a001e6c397bdb5a0325 ****/
		%feature("compactdefaultargs") SetRootPrefix;
		%feature("autodoc", "Set prefix for generating root labels names.

Parameters
----------
theRootPrefix: TCollection_AsciiString

Returns
-------
None
") SetRootPrefix;
		void SetRootPrefix(const TCollection_AsciiString & theRootPrefix);

		/****************** SetSystemCoordinateSystem ******************/
		/**** md5 signature: 7c531314d6e79c5583ab16f29a8c9fcd ****/
		%feature("compactdefaultargs") SetSystemCoordinateSystem;
		%feature("autodoc", "Set system origin coordinate system to perform conversion into during read.

Parameters
----------
theCS: gp_Ax3

Returns
-------
None
") SetSystemCoordinateSystem;
		void SetSystemCoordinateSystem(const gp_Ax3 & theCS);

		/****************** SetSystemCoordinateSystem ******************/
		/**** md5 signature: 133ae23cdde9f78e3a390a09a9d30c98 ****/
		%feature("compactdefaultargs") SetSystemCoordinateSystem;
		%feature("autodoc", "Set system origin coordinate system to perform conversion into during read.

Parameters
----------
theCS: RWMesh_CoordinateSystem

Returns
-------
None
") SetSystemCoordinateSystem;
		void SetSystemCoordinateSystem(RWMesh_CoordinateSystem theCS);

		/****************** SetSystemLengthUnit ******************/
		/**** md5 signature: 5f3c8fb3e46edd8048ef8a61eaf32fed ****/
		%feature("compactdefaultargs") SetSystemLengthUnit;
		%feature("autodoc", "Set system length units to convert into while reading the file, defined as scale factor for m (meters).

Parameters
----------
theUnits: float

Returns
-------
None
") SetSystemLengthUnit;
		void SetSystemLengthUnit(Standard_Real theUnits);

		/****************** SingleShape ******************/
		/**** md5 signature: 3346c14111103ab685485d1080bf09aa ****/
		%feature("compactdefaultargs") SingleShape;
		%feature("autodoc", "Return result as a single shape.

Returns
-------
TopoDS_Shape
") SingleShape;
		TopoDS_Shape SingleShape();

		/****************** SystemCoordinateSystem ******************/
		/**** md5 signature: ab4cd81dea76d6e81b65de38738c6cac ****/
		%feature("compactdefaultargs") SystemCoordinateSystem;
		%feature("autodoc", "Return system coordinate system; undefined by default, which means that no conversion will be done.

Returns
-------
gp_Ax3
") SystemCoordinateSystem;
		const gp_Ax3 SystemCoordinateSystem();

		/****************** SystemLengthUnit ******************/
		/**** md5 signature: 649d8789931f8f7ac327c46ab7779ce6 ****/
		%feature("compactdefaultargs") SystemLengthUnit;
		%feature("autodoc", "Return the length unit to convert into while reading the file, defined as scale factor for m (meters); -1.0 by default, which means that no conversion will be applied.

Returns
-------
float
") SystemLengthUnit;
		Standard_Real SystemLengthUnit();

		/****************** ToFillIncompleteDocument ******************/
		/**** md5 signature: cecf92317828330259cbb2f292c7318f ****/
		%feature("compactdefaultargs") ToFillIncompleteDocument;
		%feature("autodoc", "Flag indicating if partially read file content should be put into the xde document, true by default. //! partial read means unexpected end of file, critical parsing syntax errors in the middle of file, or reached memory limit indicated by performmesh() returning false. partial read allows importing a model even in case of formal reading failure, so that it will be up to user to decide if processed data has any value. //! in case of partial read (performmesh() returns false, but there are some data that could be put into document), perform() will return true and result flag will have failure bit set. @sa memorylimitmib(), extrastatus().

Returns
-------
bool
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
		/****************** RWMesh_CoordinateSystemConverter ******************/
		/**** md5 signature: bcb5a19480807e1b0334c5d795c4be59 ****/
		%feature("compactdefaultargs") RWMesh_CoordinateSystemConverter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWMesh_CoordinateSystemConverter;
		 RWMesh_CoordinateSystemConverter();

		/****************** HasInputCoordinateSystem ******************/
		/**** md5 signature: 74c9b0dd8f1c4c5d552747fc4d3ea778 ****/
		%feature("compactdefaultargs") HasInputCoordinateSystem;
		%feature("autodoc", "Return true if source coordinate system has been set; false by default.

Returns
-------
bool
") HasInputCoordinateSystem;
		Standard_Boolean HasInputCoordinateSystem();

		/****************** HasOutputCoordinateSystem ******************/
		/**** md5 signature: 504c950bf18befad9824436f1fe538e0 ****/
		%feature("compactdefaultargs") HasOutputCoordinateSystem;
		%feature("autodoc", "Return true if destination coordinate system has been set; false by default.

Returns
-------
bool
") HasOutputCoordinateSystem;
		Standard_Boolean HasOutputCoordinateSystem();

		/****************** Init ******************/
		/**** md5 signature: 2d7f0ece7e5684e591c591cd3a988934 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize transformation.

Parameters
----------
theInputSystem: gp_Ax3
theInputLengthUnit: float
theOutputSystem: gp_Ax3
theOutputLengthUnit: float

Returns
-------
None
") Init;
		void Init(const gp_Ax3 & theInputSystem, Standard_Real theInputLengthUnit, const gp_Ax3 & theOutputSystem, Standard_Real theOutputLengthUnit);

		/****************** InputCoordinateSystem ******************/
		/**** md5 signature: 3f7a2866294a453a53ad901a303d263e ****/
		%feature("compactdefaultargs") InputCoordinateSystem;
		%feature("autodoc", "Source coordinate system; undefined by default.

Returns
-------
gp_Ax3
") InputCoordinateSystem;
		const gp_Ax3 InputCoordinateSystem();

		/****************** InputLengthUnit ******************/
		/**** md5 signature: e32c18515dffaccbac8950fe43b8f4fa ****/
		%feature("compactdefaultargs") InputLengthUnit;
		%feature("autodoc", "Return source length units, defined as scale factor to m (meters). -1.0 by default, which means that no conversion will be applied (regardless output length unit).

Returns
-------
float
") InputLengthUnit;
		Standard_Real InputLengthUnit();

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if there is no transformation (target and current coordinates systems are same).

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** OutputCoordinateSystem ******************/
		/**** md5 signature: 68af1e5a34cda818e1f3588e3a079334 ****/
		%feature("compactdefaultargs") OutputCoordinateSystem;
		%feature("autodoc", "Destination coordinate system; undefined by default.

Returns
-------
gp_Ax3
") OutputCoordinateSystem;
		const gp_Ax3 OutputCoordinateSystem();

		/****************** OutputLengthUnit ******************/
		/**** md5 signature: 0ae119c03ebef2a4d3b8df1aaeb82d1e ****/
		%feature("compactdefaultargs") OutputLengthUnit;
		%feature("autodoc", "Return destination length units, defined as scale factor to m (meters). -1.0 by default, which means that no conversion will be applied (regardless input length unit).

Returns
-------
float
") OutputLengthUnit;
		Standard_Real OutputLengthUnit();

		/****************** SetInputCoordinateSystem ******************/
		/**** md5 signature: db01175e9c17f68ee81a4c63910ceefc ****/
		%feature("compactdefaultargs") SetInputCoordinateSystem;
		%feature("autodoc", "Set source coordinate system.

Parameters
----------
theSysFrom: gp_Ax3

Returns
-------
None
") SetInputCoordinateSystem;
		void SetInputCoordinateSystem(const gp_Ax3 & theSysFrom);

		/****************** SetInputCoordinateSystem ******************/
		/**** md5 signature: 74ea6fa24c7089026e44553845424883 ****/
		%feature("compactdefaultargs") SetInputCoordinateSystem;
		%feature("autodoc", "Set source coordinate system.

Parameters
----------
theSysFrom: RWMesh_CoordinateSystem

Returns
-------
None
") SetInputCoordinateSystem;
		void SetInputCoordinateSystem(RWMesh_CoordinateSystem theSysFrom);

		/****************** SetInputLengthUnit ******************/
		/**** md5 signature: 8e0d5c594e5311f5a551042dec14a259 ****/
		%feature("compactdefaultargs") SetInputLengthUnit;
		%feature("autodoc", "Set source length units as scale factor to m (meters).

Parameters
----------
theInputScale: float

Returns
-------
None
") SetInputLengthUnit;
		void SetInputLengthUnit(Standard_Real theInputScale);

		/****************** SetOutputCoordinateSystem ******************/
		/**** md5 signature: de7d4cbdce52865d84d9834d06c3af01 ****/
		%feature("compactdefaultargs") SetOutputCoordinateSystem;
		%feature("autodoc", "Set destination coordinate system.

Parameters
----------
theSysTo: gp_Ax3

Returns
-------
None
") SetOutputCoordinateSystem;
		void SetOutputCoordinateSystem(const gp_Ax3 & theSysTo);

		/****************** SetOutputCoordinateSystem ******************/
		/**** md5 signature: ac5577a94bf7ada0d8b3f89d5c80aa73 ****/
		%feature("compactdefaultargs") SetOutputCoordinateSystem;
		%feature("autodoc", "Set destination coordinate system.

Parameters
----------
theSysTo: RWMesh_CoordinateSystem

Returns
-------
None
") SetOutputCoordinateSystem;
		void SetOutputCoordinateSystem(RWMesh_CoordinateSystem theSysTo);

		/****************** SetOutputLengthUnit ******************/
		/**** md5 signature: 9f51cf7920399e3b32715de9cc52e029 ****/
		%feature("compactdefaultargs") SetOutputLengthUnit;
		%feature("autodoc", "Set destination length units as scale factor to m (meters).

Parameters
----------
theOutputScale: float

Returns
-------
None
") SetOutputLengthUnit;
		void SetOutputLengthUnit(Standard_Real theOutputScale);

		/****************** StandardCoordinateSystem ******************/
		/**** md5 signature: 21c5c69c0733e85d1bbad7241f970870 ****/
		%feature("compactdefaultargs") StandardCoordinateSystem;
		%feature("autodoc", "Return a standard coordinate system definition.

Parameters
----------
theSys: RWMesh_CoordinateSystem

Returns
-------
gp_Ax3
") StandardCoordinateSystem;
		static gp_Ax3 StandardCoordinateSystem(RWMesh_CoordinateSystem theSys);

		/****************** TransformNormal ******************/
		/**** md5 signature: 717ef79ac0a987c4ab6a07db418749d1 ****/
		%feature("compactdefaultargs") TransformNormal;
		%feature("autodoc", "Transform normal (e.g. exclude translation/scale part of transformation).

Parameters
----------
theNorm: Graphic3d_Vec3

Returns
-------
None
") TransformNormal;
		void TransformNormal(Graphic3d_Vec3 & theNorm);

		/****************** TransformPosition ******************/
		/**** md5 signature: 54a90bf495fe9cc8bc5bd66216c1c8df ****/
		%feature("compactdefaultargs") TransformPosition;
		%feature("autodoc", "Transform position.

Parameters
----------
thePos: gp_XYZ

Returns
-------
None
") TransformPosition;
		void TransformPosition(gp_XYZ & thePos);

		/****************** TransformTransformation ******************/
		/**** md5 signature: 41d1b592a031279063eb96769f2c6a5c ****/
		%feature("compactdefaultargs") TransformTransformation;
		%feature("autodoc", "Transform transformation.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
None
") TransformTransformation;
		void TransformTransformation(gp_Trsf & theTrsf);

};


%extend RWMesh_CoordinateSystemConverter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWMesh_FaceIterator *
****************************/
class RWMesh_FaceIterator {
	public:
		/****************** RWMesh_FaceIterator ******************/
		/**** md5 signature: 9550d252cfb1a226d1292d60d8012ca5 ****/
		%feature("compactdefaultargs") RWMesh_FaceIterator;
		%feature("autodoc", "Main constructor.

Parameters
----------
theLabel: TDF_Label
theLocation: TopLoc_Location
theToMapColors: bool,optional
	default value is false
theStyle: XCAFPrs_Style,optional
	default value is XCAFPrs_Style()

Returns
-------
None
") RWMesh_FaceIterator;
		 RWMesh_FaceIterator(const TDF_Label & theLabel, const TopLoc_Location & theLocation, const Standard_Boolean theToMapColors = false, const XCAFPrs_Style & theStyle = XCAFPrs_Style());

		/****************** ElemLower ******************/
		/**** md5 signature: 75e86e4f7178164b4c841f30991514ec ****/
		%feature("compactdefaultargs") ElemLower;
		%feature("autodoc", "Lower element index in current triangulation.

Returns
-------
int
") ElemLower;
		Standard_Integer ElemLower();

		/****************** ElemUpper ******************/
		/**** md5 signature: e0dc6bff50b98695db11e36230915b31 ****/
		%feature("compactdefaultargs") ElemUpper;
		%feature("autodoc", "Upper element index in current triangulation.

Returns
-------
int
") ElemUpper;
		Standard_Integer ElemUpper();

		/****************** Face ******************/
		/**** md5 signature: 95406b8d0d556c0537e0768c48713f21 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return current face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** FaceColor ******************/
		/**** md5 signature: 0f3ba9ec202ff58cbc6c3f9b79597b2e ****/
		%feature("compactdefaultargs") FaceColor;
		%feature("autodoc", "Return face color.

Returns
-------
Quantity_ColorRGBA
") FaceColor;
		const Quantity_ColorRGBA & FaceColor();

		/****************** FaceStyle ******************/
		/**** md5 signature: d9c862b92cd1be596d93564678cbc76c ****/
		%feature("compactdefaultargs") FaceStyle;
		%feature("autodoc", "Return face material.

Returns
-------
XCAFPrs_Style
") FaceStyle;
		const XCAFPrs_Style & FaceStyle();

		/****************** HasFaceColor ******************/
		/**** md5 signature: 1c6a60391741d362a0f27578bb7017fc ****/
		%feature("compactdefaultargs") HasFaceColor;
		%feature("autodoc", "Return true if face color is set.

Returns
-------
bool
") HasFaceColor;
		bool HasFaceColor();

		/****************** HasNormals ******************/
		/**** md5 signature: cebae9ec3e325d610c43710c6d20c302 ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return true if triangulation has defined normals.

Returns
-------
bool
") HasNormals;
		bool HasNormals();

		/****************** HasTexCoords ******************/
		/**** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ****/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return true if triangulation has defined normals.

Returns
-------
bool
") HasTexCoords;
		bool HasTexCoords();

		/****************** IsEmptyMesh ******************/
		/**** md5 signature: dca0a5842197db2d84fece9c81db655d ****/
		%feature("compactdefaultargs") IsEmptyMesh;
		%feature("autodoc", "Return true if mesh data is defined.

Returns
-------
bool
") IsEmptyMesh;
		bool IsEmptyMesh();

		/****************** More ******************/
		/**** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return true if iterator points to the valid triangulation.

Returns
-------
bool
") More;
		bool More();

		/****************** NbNodes ******************/
		/**** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return number of nodes for the current face.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** NbTriangles ******************/
		/**** md5 signature: 192b02c351e0888abe52f9e1c6139918 ****/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return number of elements of specific type for the current face.

Returns
-------
int
") NbTriangles;
		Standard_Integer NbTriangles();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Find next value.

Returns
-------
None
") Next;
		void Next();

		/****************** NodeLower ******************/
		/**** md5 signature: 9c1d2453f2b6b57ccd1578c46ed1af11 ****/
		%feature("compactdefaultargs") NodeLower;
		%feature("autodoc", "Lower node index in current triangulation.

Returns
-------
int
") NodeLower;
		Standard_Integer NodeLower();

		/****************** NodeTexCoord ******************/
		/**** md5 signature: 80a58af4175663e02d8df9465dceee98 ****/
		%feature("compactdefaultargs") NodeTexCoord;
		%feature("autodoc", "Return texture coordinates for the node.

Parameters
----------
theNode: int

Returns
-------
gp_Pnt2d
") NodeTexCoord;
		gp_Pnt2d NodeTexCoord(const Standard_Integer theNode);

		/****************** NodeTransformed ******************/
		/**** md5 signature: 81f4327259dabdfc72b3bb97674f28b1 ****/
		%feature("compactdefaultargs") NodeTransformed;
		%feature("autodoc", "Return the node with specified index with applied transformation.

Parameters
----------
theNode: int

Returns
-------
gp_Pnt
") NodeTransformed;
		gp_Pnt NodeTransformed(const Standard_Integer theNode);

		/****************** NodeUpper ******************/
		/**** md5 signature: 007e5075cdc6bf3db6db43f88a5a868b ****/
		%feature("compactdefaultargs") NodeUpper;
		%feature("autodoc", "Upper node index in current triangulation.

Returns
-------
int
") NodeUpper;
		Standard_Integer NodeUpper();

		/****************** NormalTransformed ******************/
		/**** md5 signature: 4e5c062e6c5cc2ad0a73e8c3f66ad4a7 ****/
		%feature("compactdefaultargs") NormalTransformed;
		%feature("autodoc", "Return normal at specified node index with face transformation applied and face orientation applied.

Parameters
----------
theNode: int

Returns
-------
gp_Dir
") NormalTransformed;
		gp_Dir NormalTransformed(Standard_Integer theNode);

		/****************** TriangleOriented ******************/
		/**** md5 signature: 3e3ba0379e88457ac6cf61dd23f25b99 ****/
		%feature("compactdefaultargs") TriangleOriented;
		%feature("autodoc", "Return triangle with specified index with applied face orientation.

Parameters
----------
theElemIndex: int

Returns
-------
Poly_Triangle
") TriangleOriented;
		Poly_Triangle TriangleOriented(Standard_Integer theElemIndex);

		/****************** Triangulation ******************/
		/**** md5 signature: 640157cb50c1198f3e4d8cfb1696811e ****/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Return current face triangulation.

Returns
-------
opencascade::handle<Poly_Triangulation>
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation();

		/****************** node ******************/
		/**** md5 signature: a5ee3d2d51e21f86beeaf53a42ce61c6 ****/
		%feature("compactdefaultargs") node;
		%feature("autodoc", "Return the node with specified index with applied transformation.

Parameters
----------
theNode: int

Returns
-------
gp_Pnt
") node;
		gp_Pnt node(const Standard_Integer theNode);

		/****************** normal ******************/
		/**** md5 signature: 23cb959e15c8427c828bf92d95208d2a ****/
		%feature("compactdefaultargs") normal;
		%feature("autodoc", "Return normal at specified node index without face transformation applied.

Parameters
----------
theNode: int

Returns
-------
gp_Dir
") normal;
		gp_Dir normal(Standard_Integer theNode);

		/****************** triangle ******************/
		/**** md5 signature: 3bb468df958d9e6f86f96995f199fc13 ****/
		%feature("compactdefaultargs") triangle;
		%feature("autodoc", "Return triangle with specified index.

Parameters
----------
theElemIndex: int

Returns
-------
Poly_Triangle
") triangle;
		Poly_Triangle triangle(Standard_Integer theElemIndex);

};


%extend RWMesh_FaceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWMesh_MaterialMap *
***************************/
%nodefaultctor RWMesh_MaterialMap;
class RWMesh_MaterialMap {
	public:
		/****************** AddMaterial ******************/
		/**** md5 signature: 0f9190dda4051c96b8f2a967c00a35dd ****/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "Register material and return its name identifier.

Parameters
----------
theStyle: XCAFPrs_Style

Returns
-------
TCollection_AsciiString
") AddMaterial;
		virtual TCollection_AsciiString AddMaterial(const XCAFPrs_Style & theStyle);

		/****************** CopyTexture ******************/
		/**** md5 signature: ee3e4de94e6fb802152cc8dc6e855ea7 ****/
		%feature("compactdefaultargs") CopyTexture;
		%feature("autodoc", "Copy and rename texture file to the new location. @param therestexture [out] result texture file path (relative to the model) @param thetexture [in] original texture @param thekey [in] material key.

Parameters
----------
theResTexture: TCollection_AsciiString
theTexture: Image_Texture
theKey: TCollection_AsciiString

Returns
-------
bool
") CopyTexture;
		virtual bool CopyTexture(TCollection_AsciiString & theResTexture, const opencascade::handle<Image_Texture> & theTexture, const TCollection_AsciiString & theKey);

		/****************** CreateTextureFolder ******************/
		/**** md5 signature: 322adae0334fbf2be5b65dfb40347f45 ****/
		%feature("compactdefaultargs") CreateTextureFolder;
		%feature("autodoc", "Create texture folder 'modelname/textures'; for example: model: path/modelname.gltf images: path/modelname/textures/ warning! output folder is not cleared.

Returns
-------
bool
") CreateTextureFolder;
		virtual bool CreateTextureFolder();

		/****************** DefaultStyle ******************/
		/**** md5 signature: 0cce26cdd3c825de33af4373c0cf99e8 ****/
		%feature("compactdefaultargs") DefaultStyle;
		%feature("autodoc", "Return default material definition to be used for nodes with only color defined.

Returns
-------
XCAFPrs_Style
") DefaultStyle;
		const XCAFPrs_Style & DefaultStyle();

		/****************** DefineMaterial ******************/
		/**** md5 signature: 7f9586f95701241cc6a6b6f7bad25ebf ****/
		%feature("compactdefaultargs") DefineMaterial;
		%feature("autodoc", "Virtual method actually defining the material (e.g. export to the file).

Parameters
----------
theStyle: XCAFPrs_Style
theKey: TCollection_AsciiString
theName: TCollection_AsciiString

Returns
-------
None
") DefineMaterial;
		virtual void DefineMaterial(const XCAFPrs_Style & theStyle, const TCollection_AsciiString & theKey, const TCollection_AsciiString & theName);

		/****************** FindMaterial ******************/
		/**** md5 signature: 2f57483d42a6c3ddeac51741c6c32190 ****/
		%feature("compactdefaultargs") FindMaterial;
		%feature("autodoc", "Find already registered material.

Parameters
----------
theStyle: XCAFPrs_Style

Returns
-------
TCollection_AsciiString
") FindMaterial;
		TCollection_AsciiString FindMaterial(const XCAFPrs_Style & theStyle);

		/****************** IsFailed ******************/
		/**** md5 signature: 45d22ff81d4ca76a797a854e31d3557a ****/
		%feature("compactdefaultargs") IsFailed;
		%feature("autodoc", "Return failed flag.

Returns
-------
bool
") IsFailed;
		bool IsFailed();

		/****************** SetDefaultStyle ******************/
		/**** md5 signature: 69b73a5756eee96becb5ddbe7670a837 ****/
		%feature("compactdefaultargs") SetDefaultStyle;
		%feature("autodoc", "Set default material definition to be used for nodes with only color defined.

Parameters
----------
theStyle: XCAFPrs_Style

Returns
-------
None
") SetDefaultStyle;
		void SetDefaultStyle(const XCAFPrs_Style & theStyle);

};


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
		TCollection_AsciiString Name;
		TCollection_AsciiString RawName;
		opencascade::handle<TDataStd_NamedData > NamedData;
		XCAFPrs_Style Style;
};


%extend RWMesh_NodeAttributes {
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
