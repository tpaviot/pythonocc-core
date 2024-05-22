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
%define RWOBJDOCSTRING
"RWObj module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_rwobj.html"
%enddef
%module (package="OCC.Core", docstring=RWOBJDOCSTRING) RWObj


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


%{
#include<RWObj_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TCollection_module.hxx>
#include<RWMesh_module.hxx>
#include<XCAFPrs_module.hxx>
#include<TDocStd_module.hxx>
#include<TDF_module.hxx>
#include<TColStd_module.hxx>
#include<DE_module.hxx>
#include<TopoDS_module.hxx>
#include<Graphic3d_module.hxx>
#include<XSControl_module.hxx>
#include<gp_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<Aspect_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<Message_module.hxx>
#include<Media_module.hxx>
#include<SelectMgr_module.hxx>
#include<AIS_module.hxx>
#include<TPrsStd_module.hxx>
#include<XCAFPrs_module.hxx>
#include<TDataStd_module.hxx>
#include<Prs3d_module.hxx>
#include<XCAFDoc_module.hxx>
#include<Select3D_module.hxx>
#include<StdSelect_module.hxx>
#include<TopTools_module.hxx>
#include<V3d_module.hxx>
#include<TDataXtd_module.hxx>
#include<TNaming_module.hxx>
#include<IFSelect_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<MoniTool_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import Poly.i
%import TCollection.i
%import RWMesh.i
%import XCAFPrs.i
%import TDocStd.i
%import TDF.i
%import TColStd.i
%import DE.i
%import TopoDS.i
%import Graphic3d.i
%import XSControl.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum RWObj_SubMeshReason {
	RWObj_SubMeshReason_NewObject = 0,
	RWObj_SubMeshReason_NewGroup = 1,
	RWObj_SubMeshReason_NewMaterial = 2,
	RWObj_SubMeshReason_NewSmoothGroup = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class RWObj_SubMeshReason(IntEnum):
	RWObj_SubMeshReason_NewObject = 0
	RWObj_SubMeshReason_NewGroup = 1
	RWObj_SubMeshReason_NewMaterial = 2
	RWObj_SubMeshReason_NewSmoothGroup = 3
RWObj_SubMeshReason_NewObject = RWObj_SubMeshReason.RWObj_SubMeshReason_NewObject
RWObj_SubMeshReason_NewGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewGroup
RWObj_SubMeshReason_NewMaterial = RWObj_SubMeshReason.RWObj_SubMeshReason_NewMaterial
RWObj_SubMeshReason_NewSmoothGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewSmoothGroup
};
/* end python proxy for enums */

/* handles */
%wrap_handle(RWObj_CafWriter)
%wrap_handle(RWObj_ObjMaterialMap)
%wrap_handle(RWObj_Reader)
%wrap_handle(RWObj_CafReader)
%wrap_handle(RWObj_TriangulationReader)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class RWObj *
**************/
%rename(rwobj) RWObj;
class RWObj {
	public:
		/****************** ReadFile ******************/
		/**** md5 signature: 9db0a5dcbc0cfb32dbb5943d609412ad ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: str
aProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified obj file and returns its content as triangulation. in case of error, returns null handle.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(Standard_CString theFile, const Message_ProgressRange & aProgress = Message_ProgressRange());

};


%extend RWObj {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_CafWriter *
************************/
class RWObj_CafWriter : public Standard_Transient {
	public:
		/****************** RWObj_CafWriter ******************/
		/**** md5 signature: 9183f2e4f1660ece2639704d8c151644 ****/
		%feature("compactdefaultargs") RWObj_CafWriter;
		%feature("autodoc", "
Parameters
----------
theFile: str

Return
-------
None

Description
-----------
Main constructor. @param thefile [in] path to output obj file.
") RWObj_CafWriter;
		 RWObj_CafWriter(TCollection_AsciiString theFile);

		/****************** ChangeCoordinateSystemConverter ******************/
		/**** md5 signature: fd10c9e3345c0c11d37ccaa13f77ec3f ****/
		%feature("compactdefaultargs") ChangeCoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from occt to obj coordinate system.
") ChangeCoordinateSystemConverter;
		RWMesh_CoordinateSystemConverter & ChangeCoordinateSystemConverter();

		/****************** CoordinateSystemConverter ******************/
		/**** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ****/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from occt to obj coordinate system.
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****************** DefaultStyle ******************/
		/**** md5 signature: 0cce26cdd3c825de33af4373c0cf99e8 ****/
		%feature("compactdefaultargs") DefaultStyle;
		%feature("autodoc", "Return
-------
XCAFPrs_Style

Description
-----------
Return default material definition to be used for nodes with only color defined.
") DefaultStyle;
		const XCAFPrs_Style & DefaultStyle();

		/****************** Perform ******************/
		/**** md5 signature: b3c8698b77ac74b0d206a2448964d2ac ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theRootLabels: TDF_LabelSequence
theLabelFilter: TColStd_MapOfAsciiString *
theFileInfo: TColStd_IndexedDataMapOfStringString
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Write obj file and associated mtl material file. triangulation data should be precomputed within shapes! @param thedocument [in] input document @param therootlabels [in] list of root shapes to export @param thelabelfilter [in] optional filter with document nodes to export,  with keys defined by xcafprs_documentexplorer::definechildid() and filled recursively  (leaves and parent assembly nodes at all levels);  when not null, all nodes not included into the map will be ignored @param thefileinfo [in] map with file metadata to put into obj header section @param theprogress [in] optional progress indicator return false on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRootLabels, const TColStd_MapOfAsciiString * theLabelFilter, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****************** Perform ******************/
		/**** md5 signature: 1b913d1bf9a15143b50ebedc5b820192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theFileInfo: TColStd_IndexedDataMapOfStringString
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Write obj file and associated mtl material file. triangulation data should be precomputed within shapes! @param thedocument [in] input document @param thefileinfo [in] map with file metadata to put into gltf header section @param theprogress [in] optional progress indicator return false on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****************** SetCoordinateSystemConverter ******************/
		/**** md5 signature: 8488d2b612c66076826cc33d2ac72536 ****/
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
Set transformation from occt to obj coordinate system.
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****************** SetDefaultStyle ******************/
		/**** md5 signature: 69b73a5756eee96becb5ddbe7670a837 ****/
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


%make_alias(RWObj_CafWriter)

%extend RWObj_CafWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWObj_ConfigurationNode *
********************************/
class RWObj_ConfigurationNode : public DE_ConfigurationNode {
	public:
		class RWObj_InternalSection {};
		RWObj_InternalSection InternalParameters;
		/****************** RWObj_ConfigurationNode ******************/
		/**** md5 signature: fef3c64b7b1f08d5903a2e5a76359f5b ****/
		%feature("compactdefaultargs") RWObj_ConfigurationNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all field by default.
") RWObj_ConfigurationNode;
		 RWObj_ConfigurationNode();

		/****************** RWObj_ConfigurationNode ******************/
		/**** md5 signature: b3d5669842004c383fdd24cbede8a505 ****/
		%feature("compactdefaultargs") RWObj_ConfigurationNode;
		%feature("autodoc", "
Parameters
----------
theNode: RWObj_ConfigurationNode

Return
-------
None

Description
-----------
Copies values of all fields @param[in] thenode object to copy.
") RWObj_ConfigurationNode;
		 RWObj_ConfigurationNode(const opencascade::handle<RWObj_ConfigurationNode> & theNode);

		/****************** BuildProvider ******************/
		/**** md5 signature: 732af66bf7bddbff6fa20c9629ec35a7 ****/
		%feature("compactdefaultargs") BuildProvider;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_Provider>

Description
-----------
Creates new provider for the own format return new created provider.
") BuildProvider;
		virtual opencascade::handle<DE_Provider> BuildProvider();

		/****************** Copy ******************/
		/**** md5 signature: 4559608ebdab2961e97de40732291656 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_ConfigurationNode>

Description
-----------
Copies values of all fields return new object with the same field values.
") Copy;
		virtual opencascade::handle<DE_ConfigurationNode> Copy();

		/****************** GetExtensions ******************/
		/**** md5 signature: a58fd9c22a501a38d695eed6406f94bb ****/
		%feature("compactdefaultargs") GetExtensions;
		%feature("autodoc", "Return
-------
TColStd_ListOfAsciiString

Description
-----------
Gets list of supported file extensions return list of extensions.
") GetExtensions;
		virtual TColStd_ListOfAsciiString GetExtensions();

		/****************** GetFormat ******************/
		/**** md5 signature: 3a7e97ac1131aefae2f717c160d31ca9 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets cad format name of associated provider return provider cad format.
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****************** GetVendor ******************/
		/**** md5 signature: dec3ae3842639c0f3f7b51f11891135d ****/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider return provider's vendor name.
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****************** IsExportSupported ******************/
		/**** md5 signature: 7b5a27f839d52b595deb06dd28df5230 ****/
		%feature("compactdefaultargs") IsExportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the export supporting return true if export is supported.
") IsExportSupported;
		virtual bool IsExportSupported();

		/****************** IsImportSupported ******************/
		/**** md5 signature: 54f008ecb7de4dd5dcaeefb3d1d06abc ****/
		%feature("compactdefaultargs") IsImportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the import supporting return true if import is supported.
") IsImportSupported;
		virtual bool IsImportSupported();

		/****************** Load ******************/
		/**** md5 signature: 994009254510d81a5f0f9a326a356850 ****/
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
Updates values according the resource @param[in] theresource input resource to use return true if theresource loading has ended correctly.
") Load;
		virtual bool Load(const opencascade::handle<DE_ConfigurationContext> & theResource);

		/****************** Save ******************/
		/**** md5 signature: d6023e92d8565d8e19b0fc2ce7e2a326 ****/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Writes configuration to the string return result resource string.
") Save;
		virtual TCollection_AsciiString Save();

};


%extend RWObj_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWObj_IShapeReceiver *
*****************************/
%nodefaultctor RWObj_IShapeReceiver;
class RWObj_IShapeReceiver {
	public:
		/****************** BindNamedShape ******************/
		/**** md5 signature: c4a7e1b6b51bf16257e0884d8678f1e6 ****/
		%feature("compactdefaultargs") BindNamedShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theName: str
theMaterial: RWObj_Material *
theIsRootShape: bool

Return
-------
None

Description
-----------
@param theshape shape to register @param thename shape name @param thematerial shape material @param theisrootshape indicates that this is a root object (free shape).
") BindNamedShape;
		virtual void BindNamedShape(const TopoDS_Shape & theShape, TCollection_AsciiString theName, const RWObj_Material * theMaterial, const Standard_Boolean theIsRootShape);

};


%extend RWObj_IShapeReceiver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWObj_Material *
***********************/
class RWObj_Material {
	public:
		TCollection_AsciiString Name;
		TCollection_AsciiString DiffuseTexture;
		TCollection_AsciiString SpecularTexture;
		TCollection_AsciiString BumpTexture;
		Quantity_Color AmbientColor;
		Quantity_Color DiffuseColor;
		Quantity_Color SpecularColor;
		float Shininess;
		float Transparency;
		/****************** RWObj_Material ******************/
		/**** md5 signature: e824e5ca5d324e17a53317770dbbc543 ****/
		%feature("compactdefaultargs") RWObj_Material;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWObj_Material;
		 RWObj_Material();

};


%extend RWObj_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_MtlReader *
************************/
/*****************************
* class RWObj_ObjMaterialMap *
*****************************/
class RWObj_ObjMaterialMap : public RWMesh_MaterialMap {
	public:
		/****************** RWObj_ObjMaterialMap ******************/
		/**** md5 signature: 43c6a416fb61d11b4dd03cc05283f455 ****/
		%feature("compactdefaultargs") RWObj_ObjMaterialMap;
		%feature("autodoc", "
Parameters
----------
theFile: str

Return
-------
None

Description
-----------
Main constructor.
") RWObj_ObjMaterialMap;
		 RWObj_ObjMaterialMap(TCollection_AsciiString theFile);

		/****************** AddMaterial ******************/
		/**** md5 signature: a65de496eac4b0afca748cbe0920fca0 ****/
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
Add material.
") AddMaterial;
		virtual TCollection_AsciiString AddMaterial(const XCAFPrs_Style & theStyle);

		/****************** DefineMaterial ******************/
		/**** md5 signature: 0d9f2bc2c43292ec61ca304ec31c1fa0 ****/
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

};


%make_alias(RWObj_ObjMaterialMap)

%extend RWObj_ObjMaterialMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWObj_ObjWriterContext *
*******************************/
class RWObj_ObjWriterContext {
	public:
		int NbFaces;
		/****************** RWObj_ObjWriterContext ******************/
		/**** md5 signature: 4d2a3a7dd08df290512cc8f3ee97b068 ****/
		%feature("compactdefaultargs") RWObj_ObjWriterContext;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
Main constructor.
") RWObj_ObjWriterContext;
		 RWObj_ObjWriterContext(TCollection_AsciiString theName);

		/****************** ActiveMaterial ******************/
		/**** md5 signature: 5863ab1f6ab96ae1abb4503ebc57e2c2 ****/
		%feature("compactdefaultargs") ActiveMaterial;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return active material or empty string if not set.
") ActiveMaterial;
		const TCollection_AsciiString & ActiveMaterial();

		/****************** Close ******************/
		/**** md5 signature: c16f96eb62ef68503b626b43a99eafc0 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Correctly close the file.
") Close;
		bool Close();

		/****************** FlushFace ******************/
		/**** md5 signature: 4918a9b4883feed992536e8ba2dbd23f ****/
		%feature("compactdefaultargs") FlushFace;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int

Return
-------
None

Description
-----------
Increment indices shift.
") FlushFace;
		void FlushFace(Standard_Integer theNbNodes);

		/****************** HasNormals ******************/
		/**** md5 signature: cebae9ec3e325d610c43710c6d20c302 ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if normals are defined.
") HasNormals;
		bool HasNormals();

		/****************** HasTexCoords ******************/
		/**** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ****/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if normals are defined.
") HasTexCoords;
		bool HasTexCoords();

		/****************** IsOpened ******************/
		/**** md5 signature: d6d5671acf3a396e5229c08ea66ce77f ****/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if file has been opened.
") IsOpened;
		bool IsOpened();

		/****************** SetNormals ******************/
		/**** md5 signature: c17e8893570a40ab30ed9c9800b14305 ****/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "
Parameters
----------
theHasNormals: bool

Return
-------
None

Description
-----------
Set if normals are defined.
") SetNormals;
		void SetNormals(const bool theHasNormals);

		/****************** SetTexCoords ******************/
		/**** md5 signature: 1ccc8f9785a944bcf850c64e7095429d ****/
		%feature("compactdefaultargs") SetTexCoords;
		%feature("autodoc", "
Parameters
----------
theHasTexCoords: bool

Return
-------
None

Description
-----------
Set if normals are defined.
") SetTexCoords;
		void SetTexCoords(const bool theHasTexCoords);

		/****************** WriteActiveMaterial ******************/
		/**** md5 signature: c23019ca84fa7deac83aa86f83157c48 ****/
		%feature("compactdefaultargs") WriteActiveMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: str

Return
-------
bool

Description
-----------
Set active material.
") WriteActiveMaterial;
		bool WriteActiveMaterial(TCollection_AsciiString theMaterial);

		/****************** WriteGroup ******************/
		/**** md5 signature: d33f0a10b0910de5ab5748574f48f32d ****/
		%feature("compactdefaultargs") WriteGroup;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
bool

Description
-----------
Writing a group name.
") WriteGroup;
		bool WriteGroup(TCollection_AsciiString theValue);

		/****************** WriteHeader ******************/
		/**** md5 signature: 145306955b9203346c019851d530ffab ****/
		%feature("compactdefaultargs") WriteHeader;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int
theNbElems: int
theMatLib: str
theFileInfo: TColStd_IndexedDataMapOfStringString

Return
-------
bool

Description
-----------
Write the header.
") WriteHeader;
		bool WriteHeader(const Standard_Integer theNbNodes, const Standard_Integer theNbElems, TCollection_AsciiString theMatLib, const TColStd_IndexedDataMapOfStringString & theFileInfo);

		/****************** WriteNormal ******************/
		/**** md5 signature: e50c1b6f5ea1daef7e39690e78a55c3f ****/
		%feature("compactdefaultargs") WriteNormal;
		%feature("autodoc", "
Parameters
----------
theValue: Graphic3d_Vec3

Return
-------
bool

Description
-----------
Writing a vector.
") WriteNormal;
		bool WriteNormal(const Graphic3d_Vec3 & theValue);

		/****************** WriteQuad ******************/
		/**** md5 signature: 6ec1ecdd2b0fdcce6c29fc362c45dad1 ****/
		%feature("compactdefaultargs") WriteQuad;
		%feature("autodoc", "
Parameters
----------
theQuad: Graphic3d_Vec4i

Return
-------
bool

Description
-----------
Writing a quad.
") WriteQuad;
		bool WriteQuad(const Graphic3d_Vec4i & theQuad);

		/****************** WriteTexCoord ******************/
		/**** md5 signature: f8fa5dcc72781a1705ad419b00eedb5a ****/
		%feature("compactdefaultargs") WriteTexCoord;
		%feature("autodoc", "
Parameters
----------
theValue: Graphic3d_Vec2

Return
-------
bool

Description
-----------
Writing a vector.
") WriteTexCoord;
		bool WriteTexCoord(const Graphic3d_Vec2 & theValue);

		/****************** WriteTriangle ******************/
		/**** md5 signature: 7386d86fd240dee0a67bac21ae95cc21 ****/
		%feature("compactdefaultargs") WriteTriangle;
		%feature("autodoc", "
Parameters
----------
theTri: Graphic3d_Vec3i

Return
-------
bool

Description
-----------
Writing a triangle.
") WriteTriangle;
		bool WriteTriangle(const Graphic3d_Vec3i & theTri);

		/****************** WriteVertex ******************/
		/**** md5 signature: a036bc8f2676c9bd108f1b4aaa49033e ****/
		%feature("compactdefaultargs") WriteVertex;
		%feature("autodoc", "
Parameters
----------
theValue: Graphic3d_Vec3

Return
-------
bool

Description
-----------
Writing a vector.
") WriteVertex;
		bool WriteVertex(const Graphic3d_Vec3 & theValue);

};


%extend RWObj_ObjWriterContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWObj_Provider *
***********************/
class RWObj_Provider : public DE_Provider {
	public:
		/****************** RWObj_Provider ******************/
		/**** md5 signature: 0fbb63395fe5490ac4fe1d1e45033c86 ****/
		%feature("compactdefaultargs") RWObj_Provider;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor configure translation process with global configuration.
") RWObj_Provider;
		 RWObj_Provider();

		/****************** RWObj_Provider ******************/
		/**** md5 signature: 7c5769edee9d0e799fadcc1fa14350f1 ****/
		%feature("compactdefaultargs") RWObj_Provider;
		%feature("autodoc", "
Parameters
----------
theNode: DE_ConfigurationNode

Return
-------
None

Description
-----------
Configure translation process @param[in] thenode object to copy.
") RWObj_Provider;
		 RWObj_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****************** GetFormat ******************/
		/**** md5 signature: 3a7e97ac1131aefae2f717c160d31ca9 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets cad format name of associated provider return provider cad format.
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****************** GetVendor ******************/
		/**** md5 signature: dec3ae3842639c0f3f7b51f11891135d ****/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider return provider's vendor name.
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****************** Read ******************/
		/**** md5 signature: 5da3d196d6292385962a1e60f3dec8a0 ****/
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
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param[in] thews current work session @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: ec9914af037216c0502c72d0c8784072 ****/
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
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: f5c487132f5fe207a43ed7a7e7ce6afc ****/
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
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param[in] thews current work session @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 25ccf35b1d33bce5d3311fc0dff44615 ****/
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
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: d1d3f520ef648333a2d1d51e7ecf7636 ****/
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
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param[in] thews current work session @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 5d65a8a954decd50174318516f7bc4f8 ****/
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
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 0d58c2b5e69c703850ad85ac36436410 ****/
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
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param[in] thews current work session @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 2e3eef7d4e677163a76bbbdf8a15c79f ****/
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
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend RWObj_Provider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class RWObj_Reader *
*********************/
%nodefaultctor RWObj_Reader;
class RWObj_Reader : public Standard_Transient {
	public:
		class ObjVec3iHasher {};
		class VectorOfVertices {};
		/****************** ExternalFiles ******************/
		/**** md5 signature: 1100efdc16f5df4da63f3649f3bae2f1 ****/
		%feature("compactdefaultargs") ExternalFiles;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<TCollection_AsciiString>

Description
-----------
Return the list of external file references.
") ExternalFiles;
		const NCollection_IndexedMap<TCollection_AsciiString> & ExternalFiles();

		/****************** FileComments ******************/
		/**** md5 signature: 5907111e18d42fb1ae04fda50f8a0338 ****/
		%feature("compactdefaultargs") FileComments;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns file comments (lines starting with # at the beginning of file).
") FileComments;
		const TCollection_AsciiString & FileComments();

		/****************** IsSinglePrecision ******************/
		/**** md5 signature: 3d9bd168ea3086792839d0ab7bd5e36e ****/
		%feature("compactdefaultargs") IsSinglePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return single precision flag for reading vertex data (coordinates); false by default.
") IsSinglePrecision;
		Standard_Boolean IsSinglePrecision();

		/****************** MemoryLimit ******************/
		/**** md5 signature: 497f9f79bb3dc4c92ac3499c3f934cca ****/
		%feature("compactdefaultargs") MemoryLimit;
		%feature("autodoc", "Return
-------
Standard_Size

Description
-----------
Returns memory limit in bytes; -1 (no limit) by default.
") MemoryLimit;
		Standard_Size MemoryLimit();

		/****************** NbProbeElems ******************/
		/**** md5 signature: c59d60ae4f689662b396b03b87801ea5 ****/
		%feature("compactdefaultargs") NbProbeElems;
		%feature("autodoc", "Return
-------
int

Description
-----------
//!< number of probed polygon elements (of unknown size).
") NbProbeElems;
		Standard_Integer NbProbeElems();

		/****************** NbProbeNodes ******************/
		/**** md5 signature: a00db32de75db319aa32d1b94016db1a ****/
		%feature("compactdefaultargs") NbProbeNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of probed nodes.
") NbProbeNodes;
		Standard_Integer NbProbeNodes();

		/****************** Probe ******************/
		/**** md5 signature: 26f3d0cdb02ea1bf9a52b60912c48df8 ****/
		%feature("compactdefaultargs") Probe;
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
Open stream and pass it to probe method. @param thefile path to the file @param theprogress progress indicator return true if success, false on error or user break. @sa filecomments(), externalfiles(), nbprobenodes(), nbprobeelems().
") Probe;
		Standard_Boolean Probe(TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****************** Probe ******************/
		/**** md5 signature: 8376516956f14db4066de53fb560bbd8 ****/
		%feature("compactdefaultargs") Probe;
		%feature("autodoc", "
Parameters
----------
theStream: str
theFile: str
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Probe data from obj file (comments, external references) without actually reading mesh data. although mesh data will not be collected, the full file content will be parsed, due to obj format limitations. @param thestream input stream @param thefile path to the file @param theprogress progress indicator return true if success, false on error or user break. @sa filecomments(), externalfiles(), nbprobenodes(), nbprobeelems().
") Probe;
		Standard_Boolean Probe(std::istream & theStream, TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****************** Read ******************/
		/**** md5 signature: 22d0a4b3b93a1e3452e7be9b291128a7 ****/
		%feature("compactdefaultargs") Read;
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
Open stream and pass it to read method returns true if success, false on error.
") Read;
		Standard_Boolean Read(TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****************** Read ******************/
		/**** md5 signature: fdd87a6a5d4e606e047cd74101908aae ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStream: str
theFile: str
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Reads data from obj file. unicode paths can be given in utf-8 encoding. returns true if success, false on error or user break.
") Read;
		Standard_Boolean Read(std::istream & theStream, TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****************** SetMemoryLimit ******************/
		/**** md5 signature: 6570682bb3b681c7b6ede732333556b3 ****/
		%feature("compactdefaultargs") SetMemoryLimit;
		%feature("autodoc", "
Parameters
----------
theMemLimit: Standard_Size

Return
-------
None

Description
-----------
Specify memory limit in bytes, so that import will be aborted by specified limit before memory allocation error occurs.
") SetMemoryLimit;
		void SetMemoryLimit(Standard_Size theMemLimit);

		/****************** SetSinglePrecision ******************/
		/**** md5 signature: 99984d661982e5c23a64361939c67a89 ****/
		%feature("compactdefaultargs") SetSinglePrecision;
		%feature("autodoc", "
Parameters
----------
theIsSinglePrecision: bool

Return
-------
None

Description
-----------
Setup single/double precision flag for reading vertex data (coordinates).
") SetSinglePrecision;
		void SetSinglePrecision(Standard_Boolean theIsSinglePrecision);

		/****************** SetTransformation ******************/
		/**** md5 signature: e3e728f65ab2c16f510366aff5821cf5 ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theCSConverter: RWMesh_CoordinateSystemConverter

Return
-------
None

Description
-----------
Setup transformation from one coordinate system to another. obj file might be exported following various coordinate system conventions, so that it might be useful automatically transform data during file reading.
") SetTransformation;
		void SetTransformation(const RWMesh_CoordinateSystemConverter & theCSConverter);

		/****************** Transformation ******************/
		/**** md5 signature: 71feef5f1946dae77a000bd50a820aec ****/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from one coordinate system to another; no transformation by default.
") Transformation;
		const RWMesh_CoordinateSystemConverter & Transformation();

};


%make_alias(RWObj_Reader)

%extend RWObj_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class RWObj_SubMesh *
**********************/
class RWObj_SubMesh {
	public:
		TCollection_AsciiString Object;
		TCollection_AsciiString Group;
		TCollection_AsciiString SmoothGroup;
		TCollection_AsciiString Material;
};


%extend RWObj_SubMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_CafReader *
************************/
class RWObj_CafReader : public RWMesh_CafReader, protected RWObj_IShapeReceiver {
	public:
		/****************** RWObj_CafReader ******************/
		/**** md5 signature: abe4f70bfb71b45929fc0ef0b7d4c19d ****/
		%feature("compactdefaultargs") RWObj_CafReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWObj_CafReader;
		 RWObj_CafReader();

		/****************** IsSinglePrecision ******************/
		/**** md5 signature: 3d9bd168ea3086792839d0ab7bd5e36e ****/
		%feature("compactdefaultargs") IsSinglePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return single precision flag for reading vertex data (coordinates); false by default.
") IsSinglePrecision;
		Standard_Boolean IsSinglePrecision();

		/****************** SetSinglePrecision ******************/
		/**** md5 signature: 99984d661982e5c23a64361939c67a89 ****/
		%feature("compactdefaultargs") SetSinglePrecision;
		%feature("autodoc", "
Parameters
----------
theIsSinglePrecision: bool

Return
-------
None

Description
-----------
Setup single/double precision flag for reading vertex data (coordinates).
") SetSinglePrecision;
		void SetSinglePrecision(Standard_Boolean theIsSinglePrecision);

};


%make_alias(RWObj_CafReader)

%extend RWObj_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWObj_TriangulationReader *
**********************************/
class RWObj_TriangulationReader : public RWObj_Reader {
	public:
		/****************** RWObj_TriangulationReader ******************/
		/**** md5 signature: 3c004fcddd264c3577c6f2cb0d444634 ****/
		%feature("compactdefaultargs") RWObj_TriangulationReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") RWObj_TriangulationReader;
		 RWObj_TriangulationReader();

		/****************** GetTriangulation ******************/
		/**** md5 signature: c78dd6225813894d19d3b8c88964d3eb ****/
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Create poly_triangulation from collected data.
") GetTriangulation;
		virtual opencascade::handle<Poly_Triangulation> GetTriangulation();

		/****************** ResultShape ******************/
		/**** md5 signature: 2cda1838bd6e38f0292afee2ec85f65a ****/
		%feature("compactdefaultargs") ResultShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return result shape.
") ResultShape;
		TopoDS_Shape ResultShape();

		/****************** SetCreateShapes ******************/
		/**** md5 signature: 4c73f709306991520386237767d81b43 ****/
		%feature("compactdefaultargs") SetCreateShapes;
		%feature("autodoc", "
Parameters
----------
theToCreateShapes: bool

Return
-------
None

Description
-----------
Set flag to create shapes.
") SetCreateShapes;
		void SetCreateShapes(Standard_Boolean theToCreateShapes);

		/****************** SetShapeReceiver ******************/
		/**** md5 signature: 66b62525eaf3c6d46991dcbfa30569e4 ****/
		%feature("compactdefaultargs") SetShapeReceiver;
		%feature("autodoc", "
Parameters
----------
theReceiver: RWObj_IShapeReceiver *

Return
-------
None

Description
-----------
Set shape receiver callback.
") SetShapeReceiver;
		void SetShapeReceiver(RWObj_IShapeReceiver * theReceiver);

};


%make_alias(RWObj_TriangulationReader)

%extend RWObj_TriangulationReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class RWObj_MtlReader:
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
def rwobj_ReadFile(*args):
	return rwobj.ReadFile(*args)

}
