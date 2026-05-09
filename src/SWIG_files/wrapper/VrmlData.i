/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define VRMLDATADOCSTRING
"VrmlData module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_vrmldata.html"
%enddef
%module (package="OCC.Core", docstring=VRMLDATADOCSTRING) VrmlData


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
#include<VrmlData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<TDocStd_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<CDF_module.hxx>
#include<TDF_module.hxx>
#include<PCDM_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TCollection.i
%import gp.i
%import TopoDS.i
%import TDocStd.i
%import Bnd.i
%import Quantity.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum VrmlData_ErrorStatus {
	VrmlData_StatusOK = 0,
	VrmlData_EmptyData = 1,
	VrmlData_UnrecoverableError = 2,
	VrmlData_GeneralError = 3,
	VrmlData_EndOfFile = 4,
	VrmlData_NotVrmlFile = 5,
	VrmlData_CannotOpenFile = 6,
	VrmlData_VrmlFormatError = 7,
	VrmlData_NumericInputError = 8,
	VrmlData_IrrelevantNumber = 9,
	VrmlData_BooleanInputError = 10,
	VrmlData_StringInputError = 11,
	VrmlData_NodeNameUnknown = 12,
	VrmlData_NonPositiveSize = 13,
	VrmlData_ReadUnknownNode = 14,
	VrmlData_NonSupportedFeature = 15,
	VrmlData_OutputStreamUndefined = 16,
	VrmlData_NotImplemented = 17,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class VrmlData_ErrorStatus(IntEnum):
	VrmlData_StatusOK = 0
	VrmlData_EmptyData = 1
	VrmlData_UnrecoverableError = 2
	VrmlData_GeneralError = 3
	VrmlData_EndOfFile = 4
	VrmlData_NotVrmlFile = 5
	VrmlData_CannotOpenFile = 6
	VrmlData_VrmlFormatError = 7
	VrmlData_NumericInputError = 8
	VrmlData_IrrelevantNumber = 9
	VrmlData_BooleanInputError = 10
	VrmlData_StringInputError = 11
	VrmlData_NodeNameUnknown = 12
	VrmlData_NonPositiveSize = 13
	VrmlData_ReadUnknownNode = 14
	VrmlData_NonSupportedFeature = 15
	VrmlData_OutputStreamUndefined = 16
	VrmlData_NotImplemented = 17
VrmlData_StatusOK = VrmlData_ErrorStatus.VrmlData_StatusOK
VrmlData_EmptyData = VrmlData_ErrorStatus.VrmlData_EmptyData
VrmlData_UnrecoverableError = VrmlData_ErrorStatus.VrmlData_UnrecoverableError
VrmlData_GeneralError = VrmlData_ErrorStatus.VrmlData_GeneralError
VrmlData_EndOfFile = VrmlData_ErrorStatus.VrmlData_EndOfFile
VrmlData_NotVrmlFile = VrmlData_ErrorStatus.VrmlData_NotVrmlFile
VrmlData_CannotOpenFile = VrmlData_ErrorStatus.VrmlData_CannotOpenFile
VrmlData_VrmlFormatError = VrmlData_ErrorStatus.VrmlData_VrmlFormatError
VrmlData_NumericInputError = VrmlData_ErrorStatus.VrmlData_NumericInputError
VrmlData_IrrelevantNumber = VrmlData_ErrorStatus.VrmlData_IrrelevantNumber
VrmlData_BooleanInputError = VrmlData_ErrorStatus.VrmlData_BooleanInputError
VrmlData_StringInputError = VrmlData_ErrorStatus.VrmlData_StringInputError
VrmlData_NodeNameUnknown = VrmlData_ErrorStatus.VrmlData_NodeNameUnknown
VrmlData_NonPositiveSize = VrmlData_ErrorStatus.VrmlData_NonPositiveSize
VrmlData_ReadUnknownNode = VrmlData_ErrorStatus.VrmlData_ReadUnknownNode
VrmlData_NonSupportedFeature = VrmlData_ErrorStatus.VrmlData_NonSupportedFeature
VrmlData_OutputStreamUndefined = VrmlData_ErrorStatus.VrmlData_OutputStreamUndefined
VrmlData_NotImplemented = VrmlData_ErrorStatus.VrmlData_NotImplemented
};
/* end python proxy for enums */

/* handles */
%wrap_handle(VrmlData_Node)
%wrap_handle(VrmlData_Appearance)
%wrap_handle(VrmlData_Geometry)
%wrap_handle(VrmlData_Group)
%wrap_handle(VrmlData_Material)
%wrap_handle(VrmlData_ShapeNode)
%wrap_handle(VrmlData_TextureCoordinate)
%wrap_handle(VrmlData_UnknownNode)
%wrap_handle(VrmlData_WorldInfo)
%wrap_handle(VrmlData_Box)
%wrap_handle(VrmlData_Color)
%wrap_handle(VrmlData_Cone)
%wrap_handle(VrmlData_Coordinate)
%wrap_handle(VrmlData_Cylinder)
%wrap_handle(VrmlData_ImageTexture)
%wrap_handle(VrmlData_IndexedLineSet)
%wrap_handle(VrmlData_Normal)
%wrap_handle(VrmlData_Sphere)
%wrap_handle(VrmlData_IndexedFaceSet)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<opencascade::handle<TopoDS_TShape>,opencascade::handle<VrmlData_Appearance>>::Items;
%ignore NCollection_DataMap<opencascade::handle<TopoDS_TShape>,opencascade::handle<VrmlData_Appearance>>::KeyValues;
%template(VrmlData_DataMapOfShapeAppearance) NCollection_DataMap<opencascade::handle<TopoDS_TShape>,opencascade::handle<VrmlData_Appearance>>;
%template(VrmlData_ListOfNode) NCollection_List<opencascade::handle<VrmlData_Node>>;

%extend NCollection_List<opencascade::handle<VrmlData_Node>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = VrmlData_ListIteratorOfListOfNode(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(VrmlData_MapOfNode) NCollection_Map<opencascade::handle<VrmlData_Node>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<TopoDS_TShape>, opencascade::handle<VrmlData_Appearance>> VrmlData_DataMapOfShapeAppearance;
typedef NCollection_List<opencascade::handle<VrmlData_Node>> VrmlData_ListOfNode;
typedef NCollection_Map<opencascade::handle<VrmlData_Node>> VrmlData_MapOfNode;
/* end typedefs declaration */

/******************
* class ShapeData *
******************/
/**************************
* class VrmlData_InBuffer *
**************************/
/**********************
* class VrmlData_Node *
**********************/
%nodefaultctor VrmlData_Node;
class VrmlData_Node : public Standard_Transient {
	public:
		/****** VrmlData_Node::Clone ******/
		/****** md5 signature: 38d4971277e3d118e2102169429f1309 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
&: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified.<p> * This method nullifies the argument node if its member myScene differs * from that one of the current instance. */.
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node > &);

		/****** VrmlData_Node::GlobalIndent ******/
		/****** md5 signature: 54f2344ecd7a62236eb7d7acfc8a4fc0 ******/
		%feature("compactdefaultargs") GlobalIndent;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Define the common Indent in spaces, for writing all nodes. */.
") GlobalIndent;
		static int GlobalIndent();

		/****** VrmlData_Node::IsDefault ******/
		/****** md5 signature: f6f42927582f41e4152be42a47fe85af ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Returns True if the node is default, then it would not be written. */.
") IsDefault;
		virtual bool IsDefault();

		/****** VrmlData_Node::Name ******/
		/****** md5 signature: 2c4c1f4b45fa5a8704130a64841502c2 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
/** * Query the name */.
") Name;
		const char * Name();

		/****** VrmlData_Node::OK ******/
		/****** md5 signature: 093c3904b5d5e0ed6add236ede2fab71 ******/
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "
Parameters
----------
theStat: VrmlData_ErrorStatus

Return
-------
bool

Description
-----------
No available documentation.
") OK;
		static bool OK(const VrmlData_ErrorStatus theStat);

		/****** VrmlData_Node::OK ******/
		/****** md5 signature: e1f794cd6002039899b9c1804924ce36 ******/
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "
Parameters
----------
theStat: VrmlData_ErrorStatus

Return
-------
outStat: VrmlData_ErrorStatus

Description
-----------
No available documentation.
") OK;
		static bool OK(VrmlData_ErrorStatus &OutValue, const VrmlData_ErrorStatus theStat);

		/****** VrmlData_Node::Read ******/
		/****** md5 signature: 1ad536bb6f0a141f658023ed487ae5c4 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Node::ReadBoolean ******/
		/****** md5 signature: 1734d000ebe297a832400ff06f9d836a ******/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
theResult: bool

Description
-----------
/** * Read one boolean value (True or False). */.
") ReadBoolean;
		static VrmlData_ErrorStatus ReadBoolean(VrmlData_InBuffer & theBuffer, Standard_Boolean &OutValue);

		/****** VrmlData_Node::ReadInteger ******/
		/****** md5 signature: e68a6013750cd6f9172d2976a08fcd99 ******/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theResult: long

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read one integer value. */.
") ReadInteger;
		static VrmlData_ErrorStatus ReadInteger(VrmlData_InBuffer & theBuffer, long & theResult);

		/****** VrmlData_Node::ReadMultiString ******/
		/****** md5 signature: e2fb1c34c24297cb83cdb64600a1f3a9 ******/
		%feature("compactdefaultargs") ReadMultiString;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theRes: TColStd_ListOfAsciiString

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read one quoted string, the quotes are removed. */.
") ReadMultiString;
		static VrmlData_ErrorStatus ReadMultiString(VrmlData_InBuffer & theBuffer, TColStd_ListOfAsciiString & theRes);

		/****** VrmlData_Node::ReadNode ******/
		/****** md5 signature: 8af0d51f8e642c7c39250df4946148e8 ******/
		%feature("compactdefaultargs") ReadNode;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theNode: VrmlData_Node
Type: Standard_Type (optional, default to nullptr)

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read a complete node definition from VRML stream * 
Parameter theBuffer * Buffer receiving the input data. * 
Parameter theNode * <tt>[out]</tt> Node restored from the buffer data * 
Parameter Type * Node type to be checked. If it is NULL(default) no type checking is done. * Otherwise the created node is matched and an error is returned if * no match detected. */.
") ReadNode;
		VrmlData_ErrorStatus ReadNode(VrmlData_InBuffer & theBuffer, opencascade::handle<VrmlData_Node> & theNode, const opencascade::handle<Standard_Type> & Type = nullptr);

		/****** VrmlData_Node::ReadString ******/
		/****** md5 signature: 10bb9614bca7b920e23bdbdf23c9c677 ******/
		%feature("compactdefaultargs") ReadString;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theRes: str

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read one quoted string, the quotes are removed. */.
") ReadString;
		static VrmlData_ErrorStatus ReadString(VrmlData_InBuffer & theBuffer, TCollection_AsciiString & theRes);

		/****** VrmlData_Node::Scene ******/
		/****** md5 signature: 7cd55fa14ff98139c875d8a22b2dae83 ******/
		%feature("compactdefaultargs") Scene;
		%feature("autodoc", "Return
-------
VrmlData_Scene

Description
-----------
/** * Query the Scene that contains this Node */.
") Scene;
		const VrmlData_Scene & Scene();

		/****** VrmlData_Node::Write ******/
		/****** md5 signature: cb843c1e0dee6a359cf95725d05270a5 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

		/****** VrmlData_Node::WriteClosing ******/
		/****** md5 signature: 0f7fa21c7b0e728fbde404c8b35ba2ee ******/
		%feature("compactdefaultargs") WriteClosing;
		%feature("autodoc", "Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the closing brace in the end of a node output. */.
") WriteClosing;
		VrmlData_ErrorStatus WriteClosing();

};


%make_alias(VrmlData_Node)

%extend VrmlData_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class VrmlData_Scene *
***********************/
class VrmlData_Scene {
	public:
typedef NCollection_List<opencascade ::handle<VrmlData_Node>>::Iterator Iterator;
		/****** VrmlData_Scene::VrmlData_Scene ******/
		/****** md5 signature: 0b41ce0ab59f264782b8b4cb9ecb39c1 ******/
		%feature("compactdefaultargs") VrmlData_Scene;
		%feature("autodoc", "
Parameters
----------
&: NCollection_IncAllocator (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Constructor. */.
") VrmlData_Scene;
		 VrmlData_Scene(const opencascade::handle<NCollection_IncAllocator > & = nullptr);

		/****** VrmlData_Scene::AddNode ******/
		/****** md5 signature: f107f63af5a054318ce0f50f52157301 ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
theN: VrmlData_Node
isTopLevel: bool (optional, default to true)

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Add a Node. If theN belongs to another Scene, it is cloned. * <p>VrmlData_WorldInfo cannot be added, in this case the method * returns a NULL handle. */.
") AddNode;
		const opencascade::handle<VrmlData_Node> & AddNode(const opencascade::handle<VrmlData_Node> & theN, const bool isTopLevel = true);

		/****** VrmlData_Scene::Allocator ******/
		/****** md5 signature: 4e28fef9a355f8e2f25d143af5e72dd8 ******/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_IncAllocator>

Description
-----------
/** * Allocator used by all nodes contained in the Scene. */.
") Allocator;
		const opencascade::handle<NCollection_IncAllocator> & Allocator();

		/****** VrmlData_Scene::Dump ******/
		/****** md5 signature: c7b7f3310b5193de5f2365d935cd2c95 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
/** * Diagnostic dump of the contents */.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** VrmlData_Scene::FindNode ******/
		/****** md5 signature: d18e77b09b4b46083dab1edc84afbec8 ******/
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "
Parameters
----------
theName: char *
theType: Standard_Type (optional, default to nullptr)

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Find a node by its name. * 
Parameter theName * Name of the node to find. * 
Parameter theType * Type to match. If this value is NULL, the first found node with the * given name is returned. If theType is given, only the node that has * that type is returned. */.
") FindNode;
		opencascade::handle<VrmlData_Node> FindNode(const char * theName, const opencascade::handle<Standard_Type> & theType = nullptr);

		/****** VrmlData_Scene::FindNode ******/
		/****** md5 signature: feedaf69513e6cee44e38be3fcaedac2 ******/
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "
Parameters
----------
theName: char *
theLocation: gp_Trsf

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Find a node by its name. * 
Parameter theName * Name of the node to search for. * 
Parameter theLocation * Location of the found node with respect to the whole VRML shape. */.
") FindNode;
		opencascade::handle<VrmlData_Node> FindNode(const char * theName, gp_Trsf & theLocation);

		/****** VrmlData_Scene::GetIterator ******/
		/****** md5 signature: eb2840af7431a8179fe0b1dabdc7bbbd ******/
		%feature("compactdefaultargs") GetIterator;
		%feature("autodoc", "Return
-------
Iterator

Description
-----------
/** * Iterator of Nodes */.
") GetIterator;
		Iterator GetIterator();

		/****** VrmlData_Scene::GetLineError ******/
		/****** md5 signature: cae706c3964250f4bfa922d0a41fbc70 ******/
		%feature("compactdefaultargs") GetLineError;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the line where the error occurred (if the status is not OK) */.
") GetLineError;
		int GetLineError();

		/****** VrmlData_Scene::GetShape ******/
		/****** md5 signature: a0d891e2f408d8c0991cc9ced5449963 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
M: TopoDS_TShape

Return
-------
TopoDS_Shape

Description
-----------
/** * Convert the scene to a Shape, with the information on materials defined * for each sub-shape. This method should be used instead of TopoDS_Shape * explicit conversion operator when you need to retrieve the material * aspect for each face or edge in the returned topological object. * 
Parameter M * Data Map that binds an Appearance instance to each created TFace or * TEdge if the Appearance node is defined in VRML scene for that geometry. * 
Return: * TopoDS_Shape (Compound) holding all the scene, similar to the result of * explicit TopoDS_Shape conversion operator. */.
") GetShape;
		TopoDS_Shape GetShape(NCollection_DataMap<opencascade::handle<TopoDS_TShape>, opencascade::handle<VrmlData_Appearance>> & M);

		/****** VrmlData_Scene::IsDummyWrite ******/
		/****** md5 signature: 22673dec8bfadec31a2793f01125c460 ******/
		%feature("compactdefaultargs") IsDummyWrite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the current write operation is dummy, i.e., for the purpose of * collecting information before the real write is commenced. */.
") IsDummyWrite;
		bool IsDummyWrite();

		/****** VrmlData_Scene::NamedNodesIterator ******/
		/****** md5 signature: ef2abbf67f0d0a7e492de83a60149dab ******/
		%feature("compactdefaultargs") NamedNodesIterator;
		%feature("autodoc", "Return
-------
NCollection_Map<opencascade::handle<VrmlData_Node>>::Iterator

Description
-----------
/** * Get the iterator of named nodes. */.
") NamedNodesIterator;
		NCollection_Map<opencascade::handle<VrmlData_Node>>::Iterator NamedNodesIterator();

		/****** VrmlData_Scene::ReadArrIndex ******/
		/****** md5 signature: 31dd1f86312a4c9d9f3fa8068a3d4b63 ******/
		%feature("compactdefaultargs") ReadArrIndex;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theArr: int * *
theNBl: size_t

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read an array of integer indices, for IndexedfaceSet and IndexedLineSet. */.
") ReadArrIndex;
		VrmlData_ErrorStatus ReadArrIndex(VrmlData_InBuffer & theBuffer, const int * * & theArr, size_t & theNBl);

		/****** VrmlData_Scene::ReadLine ******/
		/****** md5 signature: 463dc9d784335e0fc4c761b7b8b4ece8 ******/
		%feature("compactdefaultargs") ReadLine;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read a VRML line. Empty lines and comments are skipped. * The processing starts here from theBuffer.LinePtr; if there is at least * one non-empty character (neither space nor comment), this line is used * without reading the next one. * 
Parameter theLine * Buffer receiving the input line * 
Parameter theInput * Input stream * 
Parameter theLen * Length of the input buffer (maximal line length) */.
") ReadLine;
		static VrmlData_ErrorStatus ReadLine(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Scene::ReadReal ******/
		/****** md5 signature: 21c2213354d84271678d038c3e10ce84 ******/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
isApplyScale: bool
isOnlyPositive: bool

Return
-------
theResult: double

Description
-----------
/** * Read one real value. */.
") ReadReal;
		VrmlData_ErrorStatus ReadReal(VrmlData_InBuffer & theBuffer, Standard_Real &OutValue, bool isApplyScale, bool isOnlyPositive);

		/****** VrmlData_Scene::ReadWord ******/
		/****** md5 signature: 9f756806cb42b9cf048d618659c2ad43 ******/
		%feature("compactdefaultargs") ReadWord;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theStr: str

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read a single word from the input stream, delimited by whitespace. */.
") ReadWord;
		static VrmlData_ErrorStatus ReadWord(VrmlData_InBuffer & theBuffer, TCollection_AsciiString & theStr);

		/****** VrmlData_Scene::ReadXY ******/
		/****** md5 signature: cff49bbbbf48776b151c3c41d433a63e ******/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theXYZ: gp_XY
isApplyScale: bool
isOnlyPositive: bool

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read one doublet of real values. */.
") ReadXY;
		VrmlData_ErrorStatus ReadXY(VrmlData_InBuffer & theBuffer, gp_XY & theXYZ, bool isApplyScale, bool isOnlyPositive);

		/****** VrmlData_Scene::ReadXYZ ******/
		/****** md5 signature: 5c0509cd7d7fdf72b7c8daa0c1d5ec07 ******/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer
theXYZ: gp_XYZ
isApplyScale: bool
isOnlyPositive: bool

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read one triplet of real values. */.
") ReadXYZ;
		VrmlData_ErrorStatus ReadXYZ(VrmlData_InBuffer & theBuffer, gp_XYZ & theXYZ, bool isApplyScale, bool isOnlyPositive);

		/****** VrmlData_Scene::SetIndent ******/
		/****** md5 signature: f26e10ae1e014702aaacdb27bc6b13d2 ******/
		%feature("compactdefaultargs") SetIndent;
		%feature("autodoc", "
Parameters
----------
nSpc: int

Return
-------
None

Description
-----------
/** * Store the indentation for VRML output. * 
Parameter nSpc * number of spaces to insert at every indentation level */.
") SetIndent;
		void SetIndent(const int nSpc);

		/****** VrmlData_Scene::SetLinearScale ******/
		/****** md5 signature: 88c419498009b09f32edfae457ca7097 ******/
		%feature("compactdefaultargs") SetLinearScale;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
/** * Set the scale factor that would be further used in methods * ReadReal, ReadXYZ and ReadXY. All coordinates, distances and sized are * multiplied by this factor during reading the data. */.
") SetLinearScale;
		void SetLinearScale(const double theScale);

		/****** VrmlData_Scene::SetVrmlDir ******/
		/****** md5 signature: c61174c1f52c4ff5b725672bce4a62a7 ******/
		%feature("compactdefaultargs") SetVrmlDir;
		%feature("autodoc", "
Parameters
----------
&: str

Return
-------
None

Description
-----------
/** * Add the given directory path to the list of VRML file search directories. * This method forms the list of directories ordered according to the * sequence of this method calls. When an Inline node is found, the URLs * in that node are matched with these directories. * The last (implicit) search directory is the current process directory * ('.'). It takes effect if the list is empty or if there is no match with * existing directories. */.
") SetVrmlDir;
		void SetVrmlDir(const TCollection_ExtendedString &);

		/****** VrmlData_Scene::Status ******/
		/****** md5 signature: f03039d78ccb208df273c1f1f10a8d8f ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Query the status of the previous operation. * Normally it should be equal to VrmlData_StatusOK (no error). */.
") Status;
		VrmlData_ErrorStatus Status();

		/****** VrmlData_Scene::VrmlDirIterator ******/
		/****** md5 signature: bb38e737d6185ad960925e7bb895ddc2 ******/
		%feature("compactdefaultargs") VrmlDirIterator;
		%feature("autodoc", "Return
-------
NCollection_List<TCollection_ExtendedString >::Iterator

Description
-----------
/** * Returns the directory iterator, to check the presence of requested VRML * file in each iterated directory. */.
") VrmlDirIterator;
		NCollection_List<TCollection_ExtendedString >::Iterator VrmlDirIterator();

		/****** VrmlData_Scene::WorldInfo ******/
		/****** md5 signature: 8ad3acd26207bc3f4cec13dfc2d423ab ******/
		%feature("compactdefaultargs") WorldInfo;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_WorldInfo>

Description
-----------
/** * Query the WorldInfo member. */.
") WorldInfo;
		const opencascade::handle<VrmlData_WorldInfo> & WorldInfo();

		/****** VrmlData_Scene::WriteArrIndex ******/
		/****** md5 signature: 0d09fcd3bb1f3e344328642132abfd9b ******/
		%feature("compactdefaultargs") WriteArrIndex;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *
theArr: int * *
theNbBl: size_t

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write an array of integer indices, for IndexedFaceSet and IndexedLineSet. */.
") WriteArrIndex;
		VrmlData_ErrorStatus WriteArrIndex(const char * thePrefix, const int * * theArr, const size_t theNbBl);

		/****** VrmlData_Scene::WriteLine ******/
		/****** md5 signature: 4e019595344150b78a4b69856f9c9ef5 ******/
		%feature("compactdefaultargs") WriteLine;
		%feature("autodoc", "
Parameters
----------
theLine0: char *
theLine1: char * (optional, default to nullptr)
theIndent: int (optional, default to 0)

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write a string to the output stream respecting the indentation. The string * can be defined as two substrings that will be separated by a space. * Each of the substrings can be NULL, then it is ignored. If both * are NULL, then a single newline is output (without indent). * 
Parameter theLine0 * The first part of string to output * 
Parameter theLine1 * The second part of string to output * 
Parameter theIndent * - 0 value ignored. * - negative decreases the current indent and then outputs. * - positive outputs and then increases the current indent. * 
Return: * Error status of the stream, or a special error if myOutput == NULL. */.
") WriteLine;
		VrmlData_ErrorStatus WriteLine(const char * theLine0, const char * theLine1 = nullptr, const int theIndent = 0);

		/****** VrmlData_Scene::WriteNode ******/
		/****** md5 signature: d213e29a668ed5a7ef2dd0142e10027c ******/
		%feature("compactdefaultargs") WriteNode;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *
&: VrmlData_Node

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the given node to output stream 'myOutput'. */.
") WriteNode;
		VrmlData_ErrorStatus WriteNode(const char * thePrefix, const opencascade::handle<VrmlData_Node > &);

		/****** VrmlData_Scene::WriteXYZ ******/
		/****** md5 signature: 95954e805eefca18b28e8b222cf3640e ******/
		%feature("compactdefaultargs") WriteXYZ;
		%feature("autodoc", "
Parameters
----------
theXYZ: gp_XYZ
isScale: bool
thePostfix: char * (optional, default to nullptr)

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write a triplet of real values on a separate line. * 
Parameter theXYZ * The value to be output. * 
Parameter isScale * If True, then each component is divided by myLinearScale. * 
Parameter thePostfix * Optional string that is added before the end of the line. */.
") WriteXYZ;
		VrmlData_ErrorStatus WriteXYZ(const gp_XYZ & theXYZ, const bool isScale, const char * thePostfix = nullptr);

};


%extend VrmlData_Scene {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class VrmlData_ShapeConvert *
******************************/
class VrmlData_ShapeConvert {
	public:
		class ShapeData {};
		/****** VrmlData_ShapeConvert::VrmlData_ShapeConvert ******/
		/****** md5 signature: 2ca4ace55ece4e082d8872513a6f8f7c ******/
		%feature("compactdefaultargs") VrmlData_ShapeConvert;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theScale: double (optional, default to 1)

Return
-------
None

Description
-----------
/** * Constructor. * 
Parameter theScene * Scene receiving all Vrml data. * 
Parameter theScale * Scale factor, considering that VRML standard specifies coordinates in * meters. So if your data are in mm, you should provide theScale=0.001 */.
") VrmlData_ShapeConvert;
		 VrmlData_ShapeConvert(VrmlData_Scene & theScene, const double theScale = 1);

		/****** VrmlData_ShapeConvert::AddShape ******/
		/****** md5 signature: d7b97d8ee2e04e80f953d93b9a4cb1c8 ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theName: char * (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Add one shape to the internal list, may be called several times with * different shapes. */.
") AddShape;
		void AddShape(const TopoDS_Shape & theShape, const char * theName = nullptr);

		/****** VrmlData_ShapeConvert::Convert ******/
		/****** md5 signature: 4d60bb49c62be9f360168255459b4663 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
theExtractFaces: bool
theExtractEdges: bool
theDeflection: double (optional, default to 0.01)
theDeflAngle: double (optional, default to 20*M_PI/180)

Return
-------
None

Description
-----------
/** * Convert all accumulated shapes and store them in myScene. * The internal data structures are cleared in the end of conversion. * 
Parameter theExtractFaces * If True, converter extracst faces from the shapes. * 
Parameter theExtractEdges * If True, converter extracts edges from the shapes. * 
Parameter theDeflection * Deflection for tessellation of geometrical lines/surfaces. Existing mesh * is used if its deflection is smaller than the one given by this * parameter. * 
Parameter theDeflAngle * Angular deflection for tessellation of geometrical lines. */.
") Convert;
		void Convert(const bool theExtractFaces, const bool theExtractEdges, const double theDeflection = 0.01, const double theDeflAngle = 20*M_PI/180);

		/****** VrmlData_ShapeConvert::ConvertDocument ******/
		/****** md5 signature: a4a53d2f864346e4690a0bb1f4bf88b8 ******/
		%feature("compactdefaultargs") ConvertDocument;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
/** * Add all shapes start from given document with colors and names to the internal structure */.
") ConvertDocument;
		void ConvertDocument(const opencascade::handle<TDocStd_Document> & theDoc);

};


%extend VrmlData_ShapeConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class equal_to<opencascade::handle<VrmlData_Node>> *
*****************************************************/
/*************************************************
* class hash<opencascade::handle<VrmlData_Node>> *
*************************************************/
/****************************
* class VrmlData_Appearance *
****************************/
class VrmlData_Appearance : public VrmlData_Node {
	public:
		/****** VrmlData_Appearance::VrmlData_Appearance ******/
		/****** md5 signature: 096c221a517194971381605605f47d77 ******/
		%feature("compactdefaultargs") VrmlData_Appearance;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_Appearance;
		 VrmlData_Appearance();

		/****** VrmlData_Appearance::VrmlData_Appearance ******/
		/****** md5 signature: f602ec806c76f8c47b43bd2117d0b152 ******/
		%feature("compactdefaultargs") VrmlData_Appearance;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Appearance;
		 VrmlData_Appearance(const VrmlData_Scene & theScene, const char * theName);

		/****** VrmlData_Appearance::Clone ******/
		/****** md5 signature: ef889a1e9c65dfcdb79011a2c5602be3 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
&: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified.<p> */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node > &);

		/****** VrmlData_Appearance::IsDefault ******/
		/****** md5 signature: 064296ab84a2001007d29161b630e743 ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Returns True if the node is default, so that it should not be written. */.
") IsDefault;
		bool IsDefault();

		/****** VrmlData_Appearance::Material ******/
		/****** md5 signature: dfeebcaa22399b65f8e44bab4895f82a ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Material>

Description
-----------
/** * Query the Material */.
") Material;
		const opencascade::handle<VrmlData_Material> & Material();

		/****** VrmlData_Appearance::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Appearance::SetMaterial ******/
		/****** md5 signature: 176aa723bd6d66cb0800eeffc747ec2f ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
theMat: VrmlData_Material

Return
-------
None

Description
-----------
/** * Set the Material */.
") SetMaterial;
		void SetMaterial(const opencascade::handle<VrmlData_Material> & theMat);

		/****** VrmlData_Appearance::SetTexture ******/
		/****** md5 signature: 95006966de79d9897f58d7677e31b19f ******/
		%feature("compactdefaultargs") SetTexture;
		%feature("autodoc", "
Parameters
----------
theTexture: VrmlData_Texture

Return
-------
None

Description
-----------
/** * Set the Texture */.
") SetTexture;
		void SetTexture(const opencascade::handle<VrmlData_Texture> & theTexture);

		/****** VrmlData_Appearance::SetTextureTransform ******/
		/****** md5 signature: ec2b4dc33a369d79ad0ed1ec33f5778f ******/
		%feature("compactdefaultargs") SetTextureTransform;
		%feature("autodoc", "
Parameters
----------
theTT: VrmlData_TextureTransform

Return
-------
None

Description
-----------
/** * Set the Texture Transform */.
") SetTextureTransform;
		void SetTextureTransform(const opencascade::handle<VrmlData_TextureTransform> & theTT);

		/****** VrmlData_Appearance::Texture ******/
		/****** md5 signature: 21e8cf614290f83ff95ea00ca14e284c ******/
		%feature("compactdefaultargs") Texture;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Texture>

Description
-----------
/** * Query the Texture */.
") Texture;
		const opencascade::handle<VrmlData_Texture> & Texture();

		/****** VrmlData_Appearance::TextureTransform ******/
		/****** md5 signature: bbde9d0f47eddbfab2dfd262c15d6259 ******/
		%feature("compactdefaultargs") TextureTransform;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_TextureTransform>

Description
-----------
/** * Query the TextureTransform */.
") TextureTransform;
		const opencascade::handle<VrmlData_TextureTransform> & TextureTransform();

		/****** VrmlData_Appearance::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node from input stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Appearance)

%extend VrmlData_Appearance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class VrmlData_ArrayVec3d *
****************************/
/**************************
* class VrmlData_Geometry *
**************************/
%nodefaultctor VrmlData_Geometry;
class VrmlData_Geometry : public VrmlData_Node {
	public:
		/****** VrmlData_Geometry::TShape ******/
		/****** md5 signature: dbadc622b80832b75bd4efea3d9429df ******/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
/** * Query the shape. This method checks the flag myIsModified; if True it * should rebuild the shape presentation. */.
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

};


%make_alias(VrmlData_Geometry)

%extend VrmlData_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class VrmlData_Group *
***********************/
class VrmlData_Group : public VrmlData_Node {
	public:
typedef NCollection_List<opencascade ::handle<VrmlData_Node>>::Iterator Iterator;
		/****** VrmlData_Group::VrmlData_Group ******/
		/****** md5 signature: 3bc864c704510cb9306416f1258f7906 ******/
		%feature("compactdefaultargs") VrmlData_Group;
		%feature("autodoc", "
Parameters
----------
isTransform: bool (optional, default to false)

Return
-------
None

Description
-----------
/** * Empty constructor. * 
Parameter isTransform * True if the group of type Transform is defined * 
Parameter theAlloc * Allocator used for the list of children */.
") VrmlData_Group;
		 VrmlData_Group(const bool isTransform = false);

		/****** VrmlData_Group::VrmlData_Group ******/
		/****** md5 signature: bc79940aee822d5cf81179687ea18252 ******/
		%feature("compactdefaultargs") VrmlData_Group;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
isTransform: bool (optional, default to false)

Return
-------
None

Description
-----------
/** * Constructor. * 
Parameter theName * Name of the Group node * 
Parameter isTransform * True if the group of type Transform is defined * 
Parameter theAlloc * Allocator used for the list of children */.
") VrmlData_Group;
		 VrmlData_Group(const VrmlData_Scene & theScene, const char * theName, const bool isTransform = false);

		/****** VrmlData_Group::AddNode ******/
		/****** md5 signature: 3f11ff6c3809d97b9ed6a1a52fec5515 ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
theNode: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Add one node to the Group. */.
") AddNode;
		opencascade::handle<VrmlData_Node> & AddNode(const opencascade::handle<VrmlData_Node> & theNode);

		/****** VrmlData_Group::Box ******/
		/****** md5 signature: 79505dc9b66a5350ccdc24c305c2610f ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Return
-------
Bnd_B3f

Description
-----------
/** * Query the bounding box. */.
") Box;
		const Bnd_B3f & Box();

		/****** VrmlData_Group::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Group::FindNode ******/
		/****** md5 signature: feedaf69513e6cee44e38be3fcaedac2 ******/
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "
Parameters
----------
theName: char *
theLocation: gp_Trsf

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Find a node by its name, inside this Group * 
Parameter theName * Name of the node to search for. * 
Parameter theLocation * Location of the found node with respect to this Group. */.
") FindNode;
		opencascade::handle<VrmlData_Node> FindNode(const char * theName, gp_Trsf & theLocation);

		/****** VrmlData_Group::GetTransform ******/
		/****** md5 signature: d12c205b591852c15c62f6d350ce2c60 ******/
		%feature("compactdefaultargs") GetTransform;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
/** * Query the transform value. * For group without transformation this always returns Identity */.
") GetTransform;
		const gp_Trsf GetTransform();

		/****** VrmlData_Group::IsTransform ******/
		/****** md5 signature: 98501a5c4d3e79bd449a9792ecd528bc ******/
		%feature("compactdefaultargs") IsTransform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the node is Transform type. */.
") IsTransform;
		bool IsTransform();

		/****** VrmlData_Group::NodeIterator ******/
		/****** md5 signature: ad0aab1fa703096830ba4e298bc4db90 ******/
		%feature("compactdefaultargs") NodeIterator;
		%feature("autodoc", "Return
-------
Iterator

Description
-----------
/** * Create iterator on nodes belonging to the Group. */.
") NodeIterator;
		Iterator NodeIterator();

		/****** VrmlData_Group::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Fill the Node internal data from the given input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Group::RemoveNode ******/
		/****** md5 signature: 93e57fa9c22f307dcb1a6e4de580b6b3 ******/
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "
Parameters
----------
theNode: VrmlData_Node

Return
-------
bool

Description
-----------
/** * Remove one node from the Group. * 
Return: * True if the node was located and removed, False if none removed. */.
") RemoveNode;
		bool RemoveNode(const opencascade::handle<VrmlData_Node> & theNode);

		/****** VrmlData_Group::SetBox ******/
		/****** md5 signature: 80ba51ed8c20e9ee360285534d5b3767 ******/
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_B3f

Return
-------
None

Description
-----------
/** * Set the bounding box. */.
") SetBox;
		void SetBox(const Bnd_B3f & theBox);

		/****** VrmlData_Group::SetTransform ******/
		/****** md5 signature: be6e21b848756b4d3b858e7cabc81f65 ******/
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
bool

Description
-----------
/** * Set the transformation. Returns True if the group is Transform type, * otherwise do nothing and return False. */.
") SetTransform;
		bool SetTransform(const gp_Trsf & theTrsf);

		/****** VrmlData_Group::Shape ******/
		/****** md5 signature: 82fb76dd3cb3b2666b3353c26cf3cf93 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
pMapApp: TopoDS_TShape

Return
-------
None

Description
-----------
/** * Get the shape representing the group geometry. */.
") Shape;
		void Shape(TopoDS_Shape & theShape, NCollection_DataMap<opencascade::handle<TopoDS_TShape>, opencascade::handle<VrmlData_Appearance>> * pMapApp);

		/****** VrmlData_Group::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Group)

%extend VrmlData_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class VrmlData_Material *
**************************/
class VrmlData_Material : public VrmlData_Node {
	public:
		/****** VrmlData_Material::VrmlData_Material ******/
		/****** md5 signature: bd9d0415c735d2c7ae9052fa93064b87 ******/
		%feature("compactdefaultargs") VrmlData_Material;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_Material;
		 VrmlData_Material();

		/****** VrmlData_Material::VrmlData_Material ******/
		/****** md5 signature: 984ead83d16743d2dc760990f6d26164 ******/
		%feature("compactdefaultargs") VrmlData_Material;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
theAmbientIntensity: double (optional, default to -1)
theShininess: double (optional, default to -1)
theTransparency: double (optional, default to -1)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Material;
		 VrmlData_Material(const VrmlData_Scene & theScene, const char * theName, const double theAmbientIntensity = -1, const double theShininess = -1, const double theTransparency = -1);

		/****** VrmlData_Material::AmbientColor ******/
		/****** md5 signature: 5fbe476d31e03b68b11845a1f91d2082 ******/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
/** * Query the Ambient color */.
") AmbientColor;
		const Quantity_Color & AmbientColor();

		/****** VrmlData_Material::AmbientIntensity ******/
		/****** md5 signature: 6cab8a033d3b7c197e5ea2e83eb65a76 ******/
		%feature("compactdefaultargs") AmbientIntensity;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the Ambient Intensity value */.
") AmbientIntensity;
		double AmbientIntensity();

		/****** VrmlData_Material::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Material::DiffuseColor ******/
		/****** md5 signature: 9c49a8c7f3b34d6fad0a422398d823cc ******/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
/** * Query the Diffuse color */.
") DiffuseColor;
		const Quantity_Color & DiffuseColor();

		/****** VrmlData_Material::EmissiveColor ******/
		/****** md5 signature: a81902b710d4283046e2074f8c68f238 ******/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
/** * Query the Emissive color */.
") EmissiveColor;
		const Quantity_Color & EmissiveColor();

		/****** VrmlData_Material::IsDefault ******/
		/****** md5 signature: 064296ab84a2001007d29161b630e743 ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Returns True if the node is default, so that it should not be written. */.
") IsDefault;
		bool IsDefault();

		/****** VrmlData_Material::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Material::SetAmbientColor ******/
		/****** md5 signature: 873429e2370ae4f721b603f1ebb96dad ******/
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
/** * Query the Ambient color */.
") SetAmbientColor;
		void SetAmbientColor(const Quantity_Color & theColor);

		/****** VrmlData_Material::SetAmbientIntensity ******/
		/****** md5 signature: cd6ddbbca91ece40a3765bffdd6329aa ******/
		%feature("compactdefaultargs") SetAmbientIntensity;
		%feature("autodoc", "
Parameters
----------
theAmbientIntensity: double

Return
-------
None

Description
-----------
/** * Set the Ambient Intensity value */.
") SetAmbientIntensity;
		void SetAmbientIntensity(const double theAmbientIntensity);

		/****** VrmlData_Material::SetDiffuseColor ******/
		/****** md5 signature: a706faa79c39966ccc5de82231bccb71 ******/
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
/** * Query the Diffuse color */.
") SetDiffuseColor;
		void SetDiffuseColor(const Quantity_Color & theColor);

		/****** VrmlData_Material::SetEmissiveColor ******/
		/****** md5 signature: 7e66ad66ed9e2434756333c8dfa79c87 ******/
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
/** * Query the Emissive color */.
") SetEmissiveColor;
		void SetEmissiveColor(const Quantity_Color & theColor);

		/****** VrmlData_Material::SetShininess ******/
		/****** md5 signature: 03418cc53c40b5ced01a38036206ebaf ******/
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "
Parameters
----------
theShininess: double

Return
-------
None

Description
-----------
/** * Set the Shininess value */.
") SetShininess;
		void SetShininess(const double theShininess);

		/****** VrmlData_Material::SetSpecularColor ******/
		/****** md5 signature: 12ed5001ae01a3cbcd54180d440dda73 ******/
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
/** * Query the Specular color */.
") SetSpecularColor;
		void SetSpecularColor(const Quantity_Color & theColor);

		/****** VrmlData_Material::SetTransparency ******/
		/****** md5 signature: 6fa89061ae53b4c2b487d15596b0c767 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theTransparency: double

Return
-------
None

Description
-----------
/** * Set the Transparency value */.
") SetTransparency;
		void SetTransparency(const double theTransparency);

		/****** VrmlData_Material::Shininess ******/
		/****** md5 signature: 5ffcddd5b1fce06592c8ea36797ec8bc ******/
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the Shininess value */.
") Shininess;
		double Shininess();

		/****** VrmlData_Material::SpecularColor ******/
		/****** md5 signature: be13421d5a460089944a56fa84b44f51 ******/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
/** * Query the Specular color */.
") SpecularColor;
		const Quantity_Color & SpecularColor();

		/****** VrmlData_Material::Transparency ******/
		/****** md5 signature: cc6483d934fafd80352fd8cc83ebc3f4 ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the Transparency value */.
") Transparency;
		double Transparency();

		/****** VrmlData_Material::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to the Scene output. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Material)

%extend VrmlData_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class VrmlData_ShapeNode *
***************************/
class VrmlData_ShapeNode : public VrmlData_Node {
	public:
		/****** VrmlData_ShapeNode::VrmlData_ShapeNode ******/
		/****** md5 signature: 75cad890918859fe9a90e2507e75b478 ******/
		%feature("compactdefaultargs") VrmlData_ShapeNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_ShapeNode;
		 VrmlData_ShapeNode();

		/****** VrmlData_ShapeNode::VrmlData_ShapeNode ******/
		/****** md5 signature: e5acc2d5d906e1df28b1135e2c10a2f6 ******/
		%feature("compactdefaultargs") VrmlData_ShapeNode;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_ShapeNode;
		 VrmlData_ShapeNode(const VrmlData_Scene & theScene, const char * theName);

		/****** VrmlData_ShapeNode::Appearance ******/
		/****** md5 signature: ee08713a55f30954fc7a40ab04da9356 ******/
		%feature("compactdefaultargs") Appearance;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Appearance>

Description
-----------
/** * Query the Appearance. */.
") Appearance;
		const opencascade::handle<VrmlData_Appearance> & Appearance();

		/****** VrmlData_ShapeNode::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_ShapeNode::Geometry ******/
		/****** md5 signature: 4835d1901667aa281770c33090c3e6f5 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Geometry>

Description
-----------
/** * Query the Geometry. */.
") Geometry;
		const opencascade::handle<VrmlData_Geometry> & Geometry();

		/****** VrmlData_ShapeNode::IsDefault ******/
		/****** md5 signature: 064296ab84a2001007d29161b630e743 ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Check if the Shape Node is writeable. */.
") IsDefault;
		bool IsDefault();

		/****** VrmlData_ShapeNode::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Fill the Node internal data from the given input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_ShapeNode::SetAppearance ******/
		/****** md5 signature: b488e0e7ff5275e40d10ae0678567399 ******/
		%feature("compactdefaultargs") SetAppearance;
		%feature("autodoc", "
Parameters
----------
theAppear: VrmlData_Appearance

Return
-------
None

Description
-----------
/** * Set the Appearance */.
") SetAppearance;
		void SetAppearance(const opencascade::handle<VrmlData_Appearance> & theAppear);

		/****** VrmlData_ShapeNode::SetGeometry ******/
		/****** md5 signature: 2eebe1602c0ddfeb3e9b0c2cd24b0c4e ******/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "
Parameters
----------
theGeometry: VrmlData_Geometry

Return
-------
None

Description
-----------
/** * Set the Geometry */.
") SetGeometry;
		void SetGeometry(const opencascade::handle<VrmlData_Geometry> & theGeometry);

		/****** VrmlData_ShapeNode::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_ShapeNode)

%extend VrmlData_ShapeNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class VrmlData_Texture *
*************************/
/***********************************
* class VrmlData_TextureCoordinate *
***********************************/
class VrmlData_TextureCoordinate : public VrmlData_Node {
	public:
		/****** VrmlData_TextureCoordinate::VrmlData_TextureCoordinate ******/
		/****** md5 signature: 1e0218f2ec543d6d77789d9d5b9ecdb9 ******/
		%feature("compactdefaultargs") VrmlData_TextureCoordinate;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_TextureCoordinate;
		 VrmlData_TextureCoordinate();

		/****** VrmlData_TextureCoordinate::VrmlData_TextureCoordinate ******/
		/****** md5 signature: 11ecdda5821e16edfe6c44d31853ed37 ******/
		%feature("compactdefaultargs") VrmlData_TextureCoordinate;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
nPoints: size_t (optional, default to 0)
arrPoints: gp_XY * (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_TextureCoordinate;
		 VrmlData_TextureCoordinate(const VrmlData_Scene & theScene, const char * theName, const size_t nPoints = 0, const gp_XY * arrPoints = nullptr);

		/****** VrmlData_TextureCoordinate::AllocateValues ******/
		/****** md5 signature: f73dea77e93e91bb362bbc75f24d995b ******/
		%feature("compactdefaultargs") AllocateValues;
		%feature("autodoc", "
Parameters
----------
theLength: size_t

Return
-------
bool

Description
-----------
/** * Create a data array and assign the field myArray. * 
Return: * True if allocation was successful. */.
") AllocateValues;
		bool AllocateValues(const size_t theLength);

		/****** VrmlData_TextureCoordinate::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_TextureCoordinate::Length ******/
		/****** md5 signature: 57871cd344e2dd1877fbc297250c0f44 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
/** * Query the number of points */.
") Length;
		size_t Length();

		/****** VrmlData_TextureCoordinate::Points ******/
		/****** md5 signature: fba12d84b09cea75d6adf0416f8768aa ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
gp_XY *

Description
-----------
/** * Query the points */.
") Points;
		const gp_XY * Points();

		/****** VrmlData_TextureCoordinate::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_TextureCoordinate::SetPoints ******/
		/****** md5 signature: 6c0c72d8d5061b968d0ceb584db20278 ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
nPoints: size_t
arrPoints: gp_XY *

Return
-------
None

Description
-----------
/** * Set the points array */.
") SetPoints;
		void SetPoints(const size_t nPoints, const gp_XY * arrPoints);

};


%make_alias(VrmlData_TextureCoordinate)

%extend VrmlData_TextureCoordinate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class VrmlData_TextureTransform *
**********************************/
/*****************************
* class VrmlData_UnknownNode *
*****************************/
class VrmlData_UnknownNode : public VrmlData_Node {
	public:
		/****** VrmlData_UnknownNode::VrmlData_UnknownNode ******/
		/****** md5 signature: 94d9b5755645d8cd406cac098fcaec2f ******/
		%feature("compactdefaultargs") VrmlData_UnknownNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty Constructor. */.
") VrmlData_UnknownNode;
		 VrmlData_UnknownNode();

		/****** VrmlData_UnknownNode::VrmlData_UnknownNode ******/
		/****** md5 signature: cb471e33aa82928099429c9b3d1755d9 ******/
		%feature("compactdefaultargs") VrmlData_UnknownNode;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char * (optional, default to nullptr)
theTitle: char * (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Constructor. */.
") VrmlData_UnknownNode;
		 VrmlData_UnknownNode(const VrmlData_Scene & theScene, const char * theName = nullptr, const char * theTitle = nullptr);

		/****** VrmlData_UnknownNode::GetTitle ******/
		/****** md5 signature: fd792bcd35ddb15e7f5160d6ea5f7ec0 ******/
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
/** * Query the title of the unknown node. */.
") GetTitle;
		const TCollection_AsciiString & GetTitle();

		/****** VrmlData_UnknownNode::IsDefault ******/
		/****** md5 signature: 064296ab84a2001007d29161b630e743 ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Check if the Node is non-writeable -- always returns true. */.
") IsDefault;
		bool IsDefault();

		/****** VrmlData_UnknownNode::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the unknown node, till the last closing brace of it. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

};


%make_alias(VrmlData_UnknownNode)

%extend VrmlData_UnknownNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class VrmlData_WorldInfo *
***************************/
class VrmlData_WorldInfo : public VrmlData_Node {
	public:
		/****** VrmlData_WorldInfo::VrmlData_WorldInfo ******/
		/****** md5 signature: ba5f3e416e2336f1c58ba9cf60eb277f ******/
		%feature("compactdefaultargs") VrmlData_WorldInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty Constructor. */.
") VrmlData_WorldInfo;
		 VrmlData_WorldInfo();

		/****** VrmlData_WorldInfo::VrmlData_WorldInfo ******/
		/****** md5 signature: 001543ed921419ccda225d6028ea5e7f ******/
		%feature("compactdefaultargs") VrmlData_WorldInfo;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char * (optional, default to nullptr)
theTitle: char * (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Constructor. */.
") VrmlData_WorldInfo;
		 VrmlData_WorldInfo(const VrmlData_Scene & theScene, const char * theName = nullptr, const char * theTitle = nullptr);

		/****** VrmlData_WorldInfo::AddInfo ******/
		/****** md5 signature: dc28827f0f74529728a3e3149aec9a99 ******/
		%feature("compactdefaultargs") AddInfo;
		%feature("autodoc", "
Parameters
----------
theString: char *

Return
-------
None

Description
-----------
/** * Add a string to the list of info strings. */.
") AddInfo;
		void AddInfo(const char * theString);

		/****** VrmlData_WorldInfo::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_WorldInfo::InfoIterator ******/
		/****** md5 signature: b8a6257f9e0a11b87294100742e9b5b8 ******/
		%feature("compactdefaultargs") InfoIterator;
		%feature("autodoc", "Return
-------
NCollection_List< char * >::Iterator

Description
-----------
/** * Return the iterator of Info strings. */.
") InfoIterator;
		NCollection_List<const char * >::Iterator InfoIterator();

		/****** VrmlData_WorldInfo::IsDefault ******/
		/****** md5 signature: 064296ab84a2001007d29161b630e743 ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Returns True if the node is default, then it would not be written. */.
") IsDefault;
		bool IsDefault();

		/****** VrmlData_WorldInfo::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_WorldInfo::SetTitle ******/
		/****** md5 signature: 41d6771cbe93b9c5e7b0e70d5879c0b3 ******/
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "
Parameters
----------
theString: char *

Return
-------
None

Description
-----------
/** * Set or modify the title. */.
") SetTitle;
		void SetTitle(const char * theString);

		/****** VrmlData_WorldInfo::Title ******/
		/****** md5 signature: 09fbe2e16809a7795a7df1384e695b1b ******/
		%feature("compactdefaultargs") Title;
		%feature("autodoc", "Return
-------
char *

Description
-----------
/** * Query the title string. */.
") Title;
		const char * Title();

		/****** VrmlData_WorldInfo::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to the Scene output. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_WorldInfo)

%extend VrmlData_WorldInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class VrmlData_Box *
*********************/
class VrmlData_Box : public VrmlData_Geometry {
	public:
		/****** VrmlData_Box::VrmlData_Box ******/
		/****** md5 signature: d30516859426c07b2f913fe75ec3f22e ******/
		%feature("compactdefaultargs") VrmlData_Box;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_Box;
		 VrmlData_Box();

		/****** VrmlData_Box::VrmlData_Box ******/
		/****** md5 signature: 6a5fc96c74422915f7a2517c5c30ca18 ******/
		%feature("compactdefaultargs") VrmlData_Box;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
sizeX: double (optional, default to 2)
sizeY: double (optional, default to 2)
sizeZ: double (optional, default to 2)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Box;
		 VrmlData_Box(const VrmlData_Scene & theScene, const char * theName, const double sizeX = 2, const double sizeY = 2, const double sizeZ = 2);

		/****** VrmlData_Box::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Box::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Fill the Node internal data from the given input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Box::SetSize ******/
		/****** md5 signature: 19e2115bbf1402d11970cdce575fce1d ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theSize: gp_XYZ

Return
-------
None

Description
-----------
/** * Set the Box Size */.
") SetSize;
		void SetSize(const gp_XYZ & theSize);

		/****** VrmlData_Box::Size ******/
		/****** md5 signature: 7e535208625ee843fb3d514d99dc0e16 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
/** * Query the Box size */.
") Size;
		const gp_XYZ Size();

		/****** VrmlData_Box::TShape ******/
		/****** md5 signature: 0c7df2e9f08d04f457bc0b8a0b5de4ad ******/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
/** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****** VrmlData_Box::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Box)

%extend VrmlData_Box {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class VrmlData_Color *
***********************/
class VrmlData_Color : public VrmlData_ArrayVec3d {
	public:
		/****** VrmlData_Color::VrmlData_Color ******/
		/****** md5 signature: e23c7df06cd1d648ac77197002e3ee0e ******/
		%feature("compactdefaultargs") VrmlData_Color;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor. */.
") VrmlData_Color;
		 VrmlData_Color();

		/****** VrmlData_Color::VrmlData_Color ******/
		/****** md5 signature: 36e1ec3a71acf618eca30aad686361ca ******/
		%feature("compactdefaultargs") VrmlData_Color;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
nColors: size_t (optional, default to 0)
arrColors: gp_XYZ * (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Constructor. */.
") VrmlData_Color;
		 VrmlData_Color(const VrmlData_Scene & theScene, const char * theName, const size_t nColors = 0, const gp_XYZ * arrColors = nullptr);

		/****** VrmlData_Color::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified.<p> */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Color::Color ******/
		/****** md5 signature: 433cb0317f5d5adf2f920f57809df9cc ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
Quantity_Color

Description
-----------
/** * Query one color * 
Parameter i * index in the array of colors [0 .. N-1] * 
Return: * the color value for the index. If index irrelevant, returns (0., 0., 0.) */.
") Color;
		const Quantity_Color Color(const int i);

		/****** VrmlData_Color::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Color::SetColors ******/
		/****** md5 signature: 8eff2cd53c18cdcf0826a72535eb4322 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
nColors: size_t
arrColors: gp_XYZ *

Return
-------
None

Description
-----------
/** * Set the array data */.
") SetColors;
		void SetColors(const size_t nColors, const gp_XYZ * arrColors);

		/****** VrmlData_Color::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to the Scene output. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Color)

%extend VrmlData_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class VrmlData_Cone *
**********************/
class VrmlData_Cone : public VrmlData_Geometry {
	public:
		/****** VrmlData_Cone::VrmlData_Cone ******/
		/****** md5 signature: 8db8bb078fa51ba51579a6fe8a5e2ae2 ******/
		%feature("compactdefaultargs") VrmlData_Cone;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_Cone;
		 VrmlData_Cone();

		/****** VrmlData_Cone::VrmlData_Cone ******/
		/****** md5 signature: f54573e34a365d83e1143acd35f35c6e ******/
		%feature("compactdefaultargs") VrmlData_Cone;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
theBottomRadius: double (optional, default to 1)
theHeight: double (optional, default to 2)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Cone;
		 VrmlData_Cone(const VrmlData_Scene & theScene, const char * theName, const double theBottomRadius = 1, const double theHeight = 2);

		/****** VrmlData_Cone::BottomRadius ******/
		/****** md5 signature: 6bd63c7079cd480461453889f5e382bb ******/
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the Bottom Radius */.
") BottomRadius;
		double BottomRadius();

		/****** VrmlData_Cone::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Cone::HasBottom ******/
		/****** md5 signature: fd2128ca715f5af5a9b1a33863de7745 ******/
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the bottom circle is included */.
") HasBottom;
		bool HasBottom();

		/****** VrmlData_Cone::HasSide ******/
		/****** md5 signature: fedf99a6b9f927c1c77fdd5860893f9a ******/
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the side surface is included */.
") HasSide;
		bool HasSide();

		/****** VrmlData_Cone::Height ******/
		/****** md5 signature: 855a0930e46fc67c69916e2d8742416a ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the Height */.
") Height;
		double Height();

		/****** VrmlData_Cone::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Fill the Node internal data from the given input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Cone::SetBottomRadius ******/
		/****** md5 signature: ad4f664f1d07760497fc1ef2192d9dda ******/
		%feature("compactdefaultargs") SetBottomRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
/** * Set the Bottom Radius */.
") SetBottomRadius;
		void SetBottomRadius(const double theRadius);

		/****** VrmlData_Cone::SetFaces ******/
		/****** md5 signature: 11de39c3828078c40ba76d0be8497eee ******/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "
Parameters
----------
hasBottom: bool
hasSide: bool

Return
-------
None

Description
-----------
/** * Set which faces are included */.
") SetFaces;
		void SetFaces(const bool hasBottom, const bool hasSide);

		/****** VrmlData_Cone::SetHeight ******/
		/****** md5 signature: 4fc6f9c62501668c561e1f9dd581061e ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
theHeight: double

Return
-------
None

Description
-----------
/** * Set the Height */.
") SetHeight;
		void SetHeight(const double theHeight);

		/****** VrmlData_Cone::TShape ******/
		/****** md5 signature: 0c7df2e9f08d04f457bc0b8a0b5de4ad ******/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
/** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****** VrmlData_Cone::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Cone)

%extend VrmlData_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class VrmlData_Coordinate *
****************************/
class VrmlData_Coordinate : public VrmlData_ArrayVec3d {
	public:
		/****** VrmlData_Coordinate::VrmlData_Coordinate ******/
		/****** md5 signature: 81a1291f0c14a24664b4bc1f268d106b ******/
		%feature("compactdefaultargs") VrmlData_Coordinate;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty Constructor */.
") VrmlData_Coordinate;
		 VrmlData_Coordinate();

		/****** VrmlData_Coordinate::VrmlData_Coordinate ******/
		/****** md5 signature: 4f7599c96fa8f308ceb2474e487e0621 ******/
		%feature("compactdefaultargs") VrmlData_Coordinate;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
nPoints: size_t (optional, default to 0)
arrPoints: gp_XYZ * (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Coordinate;
		 VrmlData_Coordinate(const VrmlData_Scene & theScene, const char * theName, const size_t nPoints = 0, const gp_XYZ * arrPoints = nullptr);

		/****** VrmlData_Coordinate::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Coordinate::Coordinate ******/
		/****** md5 signature: b9c0ee2448b1ae85e926e8be43fc2dee ******/
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
gp_XYZ

Description
-----------
/** * Query one point * 
Parameter i * index in the array of points [0 .. N-1] * 
Return: * the coordinate for the index. If index irrelevant, returns (0., 0., 0.) */.
") Coordinate;
		const gp_XYZ Coordinate(const int i);

		/****** VrmlData_Coordinate::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Coordinate::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to the Scene output. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Coordinate)

%extend VrmlData_Coordinate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class VrmlData_Cylinder *
**************************/
class VrmlData_Cylinder : public VrmlData_Geometry {
	public:
		/****** VrmlData_Cylinder::VrmlData_Cylinder ******/
		/****** md5 signature: 898b22af591489d021496ce1afc5b5a2 ******/
		%feature("compactdefaultargs") VrmlData_Cylinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_Cylinder;
		 VrmlData_Cylinder();

		/****** VrmlData_Cylinder::VrmlData_Cylinder ******/
		/****** md5 signature: a66e756a7505c66e11d888bd1a03f165 ******/
		%feature("compactdefaultargs") VrmlData_Cylinder;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
theRadius: double (optional, default to 1)
theHeight: double (optional, default to 2)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Cylinder;
		 VrmlData_Cylinder(const VrmlData_Scene & theScene, const char * theName, const double theRadius = 1, const double theHeight = 2);

		/****** VrmlData_Cylinder::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Cylinder::HasBottom ******/
		/****** md5 signature: fd2128ca715f5af5a9b1a33863de7745 ******/
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the bottom circle is included */.
") HasBottom;
		bool HasBottom();

		/****** VrmlData_Cylinder::HasSide ******/
		/****** md5 signature: fedf99a6b9f927c1c77fdd5860893f9a ******/
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the side surface is included */.
") HasSide;
		bool HasSide();

		/****** VrmlData_Cylinder::HasTop ******/
		/****** md5 signature: a7866c0d14101c6967cea2414f55eb6d ******/
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the top surface is included */.
") HasTop;
		bool HasTop();

		/****** VrmlData_Cylinder::Height ******/
		/****** md5 signature: 855a0930e46fc67c69916e2d8742416a ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the Height */.
") Height;
		double Height();

		/****** VrmlData_Cylinder::Radius ******/
		/****** md5 signature: a0e5ce77ecf9ae21880b8fbee38993fc ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the Radius */.
") Radius;
		double Radius();

		/****** VrmlData_Cylinder::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Fill the Node internal data from the given input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Cylinder::SetFaces ******/
		/****** md5 signature: 673bc3739f3d29952ba67554cde83688 ******/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "
Parameters
----------
hasBottom: bool
hasSide: bool
hasTop: bool

Return
-------
None

Description
-----------
/** * Set which faces are included */.
") SetFaces;
		void SetFaces(const bool hasBottom, const bool hasSide, const bool hasTop);

		/****** VrmlData_Cylinder::SetHeight ******/
		/****** md5 signature: 4fc6f9c62501668c561e1f9dd581061e ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
theHeight: double

Return
-------
None

Description
-----------
/** * Set the Height */.
") SetHeight;
		void SetHeight(const double theHeight);

		/****** VrmlData_Cylinder::SetRadius ******/
		/****** md5 signature: e4bcd28502b8532058052b63636ba4e3 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
/** * Set the Radius */.
") SetRadius;
		void SetRadius(const double theRadius);

		/****** VrmlData_Cylinder::TShape ******/
		/****** md5 signature: 0c7df2e9f08d04f457bc0b8a0b5de4ad ******/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
/** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****** VrmlData_Cylinder::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Cylinder)

%extend VrmlData_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class VrmlData_Faceted *
*************************/
/******************************
* class VrmlData_ImageTexture *
******************************/
class VrmlData_ImageTexture : public VrmlData_Texture {
	public:
		/****** VrmlData_ImageTexture::VrmlData_ImageTexture ******/
		/****** md5 signature: 9cbd0180cdf35c394513e87078675bc1 ******/
		%feature("compactdefaultargs") VrmlData_ImageTexture;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_ImageTexture;
		 VrmlData_ImageTexture();

		/****** VrmlData_ImageTexture::VrmlData_ImageTexture ******/
		/****** md5 signature: 1fbcb4f0e6348f609c2ff729f3f40c2b ******/
		%feature("compactdefaultargs") VrmlData_ImageTexture;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
theURL: char * (optional, default to nullptr)
theRepS: bool (optional, default to false)
theRepT: bool (optional, default to false)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_ImageTexture;
		 VrmlData_ImageTexture(const VrmlData_Scene & theScene, const char * theName, const char * theURL = nullptr, const bool theRepS = false, const bool theRepT = false);

		/****** VrmlData_ImageTexture::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_ImageTexture::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_ImageTexture::URL ******/
		/****** md5 signature: b69bf89decd854d8adc42703c3682ea2 ******/
		%feature("compactdefaultargs") URL;
		%feature("autodoc", "Return
-------
TColStd_ListOfAsciiString

Description
-----------
/** * Query the associated URL. */.
") URL;
		const TColStd_ListOfAsciiString & URL();

		/****** VrmlData_ImageTexture::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_ImageTexture)

%extend VrmlData_ImageTexture {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class VrmlData_IndexedLineSet *
********************************/
class VrmlData_IndexedLineSet : public VrmlData_Geometry {
	public:
		/****** VrmlData_IndexedLineSet::VrmlData_IndexedLineSet ******/
		/****** md5 signature: 8a125211d4aec3ce066e097fb2ae890d ******/
		%feature("compactdefaultargs") VrmlData_IndexedLineSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor. */.
") VrmlData_IndexedLineSet;
		 VrmlData_IndexedLineSet();

		/****** VrmlData_IndexedLineSet::VrmlData_IndexedLineSet ******/
		/****** md5 signature: 7493f065352a6d408084f58c875d85ae ******/
		%feature("compactdefaultargs") VrmlData_IndexedLineSet;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
isColorPerVertex: bool (optional, default to true)

Return
-------
None

Description
-----------
/** * Constructor. */.
") VrmlData_IndexedLineSet;
		 VrmlData_IndexedLineSet(const VrmlData_Scene & theScene, const char * theName, const bool isColorPerVertex = true);

		/****** VrmlData_IndexedLineSet::ArrayColorInd ******/
		/****** md5 signature: 37874324909bab2a08f12b88c9c826db ******/
		%feature("compactdefaultargs") ArrayColorInd;
		%feature("autodoc", "
Parameters
----------
arrColorInd: int * *

Return
-------
size_t

Description
-----------
/** * Query the array of color indice * 
Parameter arrColorInd * <tt>[out]</tt> array of colorIndex as it is described in VRML2.0 spec * 
Return: * Number of integers in the array arrColorInd. */.
") ArrayColorInd;
		size_t ArrayColorInd(const int * * & arrColorInd);

		/****** VrmlData_IndexedLineSet::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_IndexedLineSet::Colors ******/
		/****** md5 signature: 5b4d455a40cc08c0769667c66599bf33 ******/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Color>

Description
-----------
/** * Query the Colors. */.
") Colors;
		const opencascade::handle<VrmlData_Color> & Colors();

		/****** VrmlData_IndexedLineSet::Coordinates ******/
		/****** md5 signature: dff615ecf03f4916071d4af06ba569bd ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Coordinate>

Description
-----------
/** * Query the Coordinates. */.
") Coordinates;
		const opencascade::handle<VrmlData_Coordinate> & Coordinates();

		/****** VrmlData_IndexedLineSet::GetColor ******/
		/****** md5 signature: 97a016b0666c85c3262b66953d46cc7d ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
iFace: int
iVertex: int

Return
-------
Quantity_Color

Description
-----------
/** * Query a color for one node in the given element. The color is * interpreted according to fields myColors, myArrColorInd, * myColorPerVertex, as defined in VRML 2.0. * 
Parameter iFace * rank of the polygon [0 .. N-1] * 
Parameter iVertex * rank of the vertex in the polygon [0 .. M-1]. This parameter is ignored * if (myColorPerVertex == False) * 
Return: * Color value (RGB); if the color is indefinite then returns (0., 0., 0.) */.
") GetColor;
		Quantity_Color GetColor(const int iFace, const int iVertex);

		/****** VrmlData_IndexedLineSet::IsDefault ******/
		/****** md5 signature: 064296ab84a2001007d29161b630e743 ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Returns True if the node is default, so that it should not be written. */.
") IsDefault;
		bool IsDefault();

		/****** VrmlData_IndexedLineSet::Polygon ******/
		/****** md5 signature: 287bd2cba308bbc325e92ea962dacd62 ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "
Parameters
----------
iPolygon: int
outIndice: int *

Return
-------
int

Description
-----------
/** * Query one polygon. * 
Parameter iPolygon * rank of the polygon [0 .. N-1] * 
Parameter outIndice * <tt>[out]</tt> array of vertex indice * 
Return: * number of vertice in the polygon - the dimension of outIndice array */.
") Polygon;
		int Polygon(const int iPolygon, const int * & outIndice);

		/****** VrmlData_IndexedLineSet::Polygons ******/
		/****** md5 signature: 1b368a2072bd8c2342489e79e1cc7715 ******/
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "
Parameters
----------
arrPolygons: int * *

Return
-------
size_t

Description
-----------
/** * Query the array of polygons */.
") Polygons;
		size_t Polygons(const int * * & arrPolygons);

		/****** VrmlData_IndexedLineSet::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_IndexedLineSet::SetColorInd ******/
		/****** md5 signature: 7acee250114c2b66fdc0b59fed2a894b ******/
		%feature("compactdefaultargs") SetColorInd;
		%feature("autodoc", "
Parameters
----------
nIndice: size_t
theIndice: int * *

Return
-------
None

Description
-----------
/** * Set the colors array of indice */.
") SetColorInd;
		void SetColorInd(const size_t nIndice, const int * * theIndice);

		/****** VrmlData_IndexedLineSet::SetColorPerVertex ******/
		/****** md5 signature: 0e17ccb5f6539dbc67f33160e84fce2f ******/
		%feature("compactdefaultargs") SetColorPerVertex;
		%feature("autodoc", "
Parameters
----------
isColorPerVertex: bool

Return
-------
None

Description
-----------
/** * Set the boolean value 'colorPerVertex' */.
") SetColorPerVertex;
		void SetColorPerVertex(const bool isColorPerVertex);

		/****** VrmlData_IndexedLineSet::SetColors ******/
		/****** md5 signature: da46e6673528d4cedf179f062bf01e72 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
theColors: VrmlData_Color

Return
-------
None

Description
-----------
/** * Set the Color node */.
") SetColors;
		void SetColors(const opencascade::handle<VrmlData_Color> & theColors);

		/****** VrmlData_IndexedLineSet::SetCoordinates ******/
		/****** md5 signature: bf51adc127a7b2dd3219a99e2901a3c6 ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoord: VrmlData_Coordinate

Return
-------
None

Description
-----------
/** * Set the nodes */.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<VrmlData_Coordinate> & theCoord);

		/****** VrmlData_IndexedLineSet::SetPolygons ******/
		/****** md5 signature: 346d6e6d3558e9d7f2add571fe8c9bb9 ******/
		%feature("compactdefaultargs") SetPolygons;
		%feature("autodoc", "
Parameters
----------
nPolygons: size_t
thePolygons: int * *

Return
-------
None

Description
-----------
/** * Set the polygons */.
") SetPolygons;
		void SetPolygons(const size_t nPolygons, const int * * thePolygons);

		/****** VrmlData_IndexedLineSet::TShape ******/
		/****** md5 signature: 0c7df2e9f08d04f457bc0b8a0b5de4ad ******/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
/** * Query the shape. This method checks the flag myIsModified; if True it * should rebuild the shape presentation. */.
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****** VrmlData_IndexedLineSet::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_IndexedLineSet)

%extend VrmlData_IndexedLineSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class VrmlData_Normal *
************************/
class VrmlData_Normal : public VrmlData_ArrayVec3d {
	public:
		/****** VrmlData_Normal::VrmlData_Normal ******/
		/****** md5 signature: 0725fb5c79dadffab706efe71c28db39 ******/
		%feature("compactdefaultargs") VrmlData_Normal;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_Normal;
		 VrmlData_Normal();

		/****** VrmlData_Normal::VrmlData_Normal ******/
		/****** md5 signature: 726d4932bff0b67b4b039bbfe7d3b6b1 ******/
		%feature("compactdefaultargs") VrmlData_Normal;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
nVec: size_t (optional, default to 0)
arrVec: gp_XYZ * (optional, default to nullptr)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Normal;
		 VrmlData_Normal(const VrmlData_Scene & theScene, const char * theName, const size_t nVec = 0, const gp_XYZ * arrVec = nullptr);

		/****** VrmlData_Normal::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Normal::Normal ******/
		/****** md5 signature: 5446fb5cab207f1d839a76d3de4af899 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
gp_XYZ

Description
-----------
/** * Query one normal * 
Parameter i * index in the array of normals [0 .. N-1] * 
Return: * the normal value for the index. If index irrelevant, returns (0., 0., 0.) */.
") Normal;
		const gp_XYZ Normal(const int i);

		/****** VrmlData_Normal::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Normal::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to the Scene output. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Normal)

%extend VrmlData_Normal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class VrmlData_Sphere *
************************/
class VrmlData_Sphere : public VrmlData_Geometry {
	public:
		/****** VrmlData_Sphere::VrmlData_Sphere ******/
		/****** md5 signature: 16f1b145583f7c046eeb8523af246c61 ******/
		%feature("compactdefaultargs") VrmlData_Sphere;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_Sphere;
		 VrmlData_Sphere();

		/****** VrmlData_Sphere::VrmlData_Sphere ******/
		/****** md5 signature: 12d5d8e76da531aa5eab04eef3545e22 ******/
		%feature("compactdefaultargs") VrmlData_Sphere;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
theRadius: double (optional, default to 1)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_Sphere;
		 VrmlData_Sphere(const VrmlData_Scene & theScene, const char * theName, const double theRadius = 1);

		/****** VrmlData_Sphere::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_Sphere::Radius ******/
		/****** md5 signature: a0e5ce77ecf9ae21880b8fbee38993fc ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Query the sphere radius */.
") Radius;
		double Radius();

		/****** VrmlData_Sphere::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Fill the Node internal data from the given input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_Sphere::SetRadius ******/
		/****** md5 signature: e4bcd28502b8532058052b63636ba4e3 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
/** * Set the sphere radius */.
") SetRadius;
		void SetRadius(const double theRadius);

		/****** VrmlData_Sphere::TShape ******/
		/****** md5 signature: 0c7df2e9f08d04f457bc0b8a0b5de4ad ******/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
/** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****** VrmlData_Sphere::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_Sphere)

%extend VrmlData_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class VrmlData_IndexedFaceSet *
********************************/
class VrmlData_IndexedFaceSet : public VrmlData_Faceted {
	public:
		/****** VrmlData_IndexedFaceSet::VrmlData_IndexedFaceSet ******/
		/****** md5 signature: 56865c96be521fd297fcf6647ded2447 ******/
		%feature("compactdefaultargs") VrmlData_IndexedFaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor */.
") VrmlData_IndexedFaceSet;
		 VrmlData_IndexedFaceSet();

		/****** VrmlData_IndexedFaceSet::VrmlData_IndexedFaceSet ******/
		/****** md5 signature: d07317da71b2233679aa2d6a94616e6c ******/
		%feature("compactdefaultargs") VrmlData_IndexedFaceSet;
		%feature("autodoc", "
Parameters
----------
theScene: VrmlData_Scene
theName: char *
isCCW: bool (optional, default to true)
isSolid: bool (optional, default to true)
isConvex: bool (optional, default to true)
theCreaseAngle: double (optional, default to 0)

Return
-------
None

Description
-----------
/** * Constructor */.
") VrmlData_IndexedFaceSet;
		 VrmlData_IndexedFaceSet(const VrmlData_Scene & theScene, const char * theName, const bool isCCW = true, const bool isSolid = true, const bool isConvex = true, const double theCreaseAngle = 0);

		/****** VrmlData_IndexedFaceSet::ArrayColorInd ******/
		/****** md5 signature: 37874324909bab2a08f12b88c9c826db ******/
		%feature("compactdefaultargs") ArrayColorInd;
		%feature("autodoc", "
Parameters
----------
arrColorInd: int * *

Return
-------
size_t

Description
-----------
/** * Query the array of color indice * 
Parameter arrColorInd * <tt>[out]</tt> array of colorIndex as it is described in VRML2.0 spec * 
Return: * Number of integers in the array arrColorInd. */.
") ArrayColorInd;
		size_t ArrayColorInd(const int * * & arrColorInd);

		/****** VrmlData_IndexedFaceSet::ArrayNormalInd ******/
		/****** md5 signature: 26a5185c4fac1e55cf5542ba39b394df ******/
		%feature("compactdefaultargs") ArrayNormalInd;
		%feature("autodoc", "
Parameters
----------
arrNormalInd: int * *

Return
-------
size_t

Description
-----------
/** * Query the array of normal indice * 
Parameter arrNormalInd * <tt>[out]</tt> array of normalIndex as it is described in VRML2.0 spec * 
Return: * Number of integers in the array arrNormalInd. */.
") ArrayNormalInd;
		size_t ArrayNormalInd(const int * * & arrNormalInd);

		/****** VrmlData_IndexedFaceSet::ArrayTextureCoordInd ******/
		/****** md5 signature: af9c9c1d0c6d10592642cd9af780ae82 ******/
		%feature("compactdefaultargs") ArrayTextureCoordInd;
		%feature("autodoc", "
Parameters
----------
arrTextureCoordInd: int * *

Return
-------
size_t

Description
-----------
/** * Query the array of texture coordinate indice * 
Parameter arrTextureCoordInd * <tt>[out]</tt> array of texCoordIndex as it is described in VRML2.0 spec * 
Return: * Number of integers in the array texCoordIndex. */.
") ArrayTextureCoordInd;
		size_t ArrayTextureCoordInd(const int * * & arrTextureCoordInd);

		/****** VrmlData_IndexedFaceSet::Clone ******/
		/****** md5 signature: fac95dd22fe9bd3a8bb314df6fa856e9 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theOther: VrmlData_Node

Return
-------
opencascade::handle<VrmlData_Node>

Description
-----------
/** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */.
") Clone;
		opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****** VrmlData_IndexedFaceSet::Colors ******/
		/****** md5 signature: 5b4d455a40cc08c0769667c66599bf33 ******/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Color>

Description
-----------
/** * Query the Colors. */.
") Colors;
		const opencascade::handle<VrmlData_Color> & Colors();

		/****** VrmlData_IndexedFaceSet::Coordinates ******/
		/****** md5 signature: dff615ecf03f4916071d4af06ba569bd ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Coordinate>

Description
-----------
/** * Query the Coordinates. */.
") Coordinates;
		const opencascade::handle<VrmlData_Coordinate> & Coordinates();

		/****** VrmlData_IndexedFaceSet::GetColor ******/
		/****** md5 signature: 97a016b0666c85c3262b66953d46cc7d ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
iFace: int
iVertex: int

Return
-------
Quantity_Color

Description
-----------
/** * Query a color for one node in the given element. The color is * interpreted according to fields myColors, myArrColorInd, * myColorPerVertex, as defined in VRML 2.0. * 
Parameter iFace * rank of the polygon [0 .. N-1] * 
Parameter iVertex * rank of the vertex in the polygon [0 .. M-1]. This parameter is ignored * if (myColorPerVertex == False) * 
Return: * Color value (RGB); if the color is indefinite then returns (0., 0., 0.) */.
") GetColor;
		Quantity_Color GetColor(const int iFace, const int iVertex);

		/****** VrmlData_IndexedFaceSet::IndiceNormals ******/
		/****** md5 signature: 9245dc9c4d8d6c7bcfd266b8a60c24c7 ******/
		%feature("compactdefaultargs") IndiceNormals;
		%feature("autodoc", "
Parameters
----------
iFace: int
outIndice: int *

Return
-------
int

Description
-----------
/** * Query normals indice for one face. This method should be called after * checking myArrNormalInd != NULL, otherwise exception will be thrown. * 
Parameter iFace * rank of the face [0 .. N-1] * 
Parameter outIndice * <tt>[out]</tt> array of normals indice * 
Return: * number of indice in the array - the dimension of outIndice array */.
") IndiceNormals;
		int IndiceNormals(const int iFace, const int * & outIndice);

		/****** VrmlData_IndexedFaceSet::IsDefault ******/
		/****** md5 signature: 064296ab84a2001007d29161b630e743 ******/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Returns True if the node is default, so that it should not be written. */.
") IsDefault;
		bool IsDefault();

		/****** VrmlData_IndexedFaceSet::Normals ******/
		/****** md5 signature: 61ca5f53b490c0bf3f6e489c3df1d2e4 ******/
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_Normal>

Description
-----------
/** * Query the Normals. */.
") Normals;
		const opencascade::handle<VrmlData_Normal> & Normals();

		/****** VrmlData_IndexedFaceSet::Polygon ******/
		/****** md5 signature: 8391cb2e49ca0a4ec530480f99c6a473 ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "
Parameters
----------
iFace: int
outIndice: int *

Return
-------
int

Description
-----------
/** * Query one polygon. * 
Parameter iFace * rank of the polygon [0 .. N-1] * 
Parameter outIndice * <tt>[out]</tt> array of vertex indice * 
Return: * number of vertice in the polygon - the dimension of outIndice array */.
") Polygon;
		int Polygon(const int iFace, const int * & outIndice);

		/****** VrmlData_IndexedFaceSet::Polygons ******/
		/****** md5 signature: 1b368a2072bd8c2342489e79e1cc7715 ******/
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "
Parameters
----------
arrPolygons: int * *

Return
-------
size_t

Description
-----------
/** * Query the array of polygons */.
") Polygons;
		size_t Polygons(const int * * & arrPolygons);

		/****** VrmlData_IndexedFaceSet::Read ******/
		/****** md5 signature: c656f118a4b6b66dac588cf6b5569d9a ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theBuffer: VrmlData_InBuffer

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Read the Node from input stream. */.
") Read;
		VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****** VrmlData_IndexedFaceSet::SetColorInd ******/
		/****** md5 signature: 7acee250114c2b66fdc0b59fed2a894b ******/
		%feature("compactdefaultargs") SetColorInd;
		%feature("autodoc", "
Parameters
----------
nIndice: size_t
theIndice: int * *

Return
-------
None

Description
-----------
/** * Set the colors array of indice */.
") SetColorInd;
		void SetColorInd(const size_t nIndice, const int * * theIndice);

		/****** VrmlData_IndexedFaceSet::SetColorPerVertex ******/
		/****** md5 signature: 0e17ccb5f6539dbc67f33160e84fce2f ******/
		%feature("compactdefaultargs") SetColorPerVertex;
		%feature("autodoc", "
Parameters
----------
isColorPerVertex: bool

Return
-------
None

Description
-----------
/** * Set the boolean value 'colorPerVertex' */.
") SetColorPerVertex;
		void SetColorPerVertex(const bool isColorPerVertex);

		/****** VrmlData_IndexedFaceSet::SetColors ******/
		/****** md5 signature: da46e6673528d4cedf179f062bf01e72 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
theColors: VrmlData_Color

Return
-------
None

Description
-----------
/** * Set the Color node */.
") SetColors;
		void SetColors(const opencascade::handle<VrmlData_Color> & theColors);

		/****** VrmlData_IndexedFaceSet::SetCoordinates ******/
		/****** md5 signature: bf51adc127a7b2dd3219a99e2901a3c6 ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoord: VrmlData_Coordinate

Return
-------
None

Description
-----------
/** * Set the nodes */.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<VrmlData_Coordinate> & theCoord);

		/****** VrmlData_IndexedFaceSet::SetNormalInd ******/
		/****** md5 signature: 3a24bfcf5769c06081e5b0dce6b6a37d ******/
		%feature("compactdefaultargs") SetNormalInd;
		%feature("autodoc", "
Parameters
----------
nIndice: size_t
theIndice: int * *

Return
-------
None

Description
-----------
/** * Set the normals array of indice */.
") SetNormalInd;
		void SetNormalInd(const size_t nIndice, const int * * theIndice);

		/****** VrmlData_IndexedFaceSet::SetNormalPerVertex ******/
		/****** md5 signature: b95ee9c56ae1f355fe9f5c3a341d6ea7 ******/
		%feature("compactdefaultargs") SetNormalPerVertex;
		%feature("autodoc", "
Parameters
----------
isNormalPerVertex: bool

Return
-------
None

Description
-----------
/** * Set the boolean value 'normalPerVertex' */.
") SetNormalPerVertex;
		void SetNormalPerVertex(const bool isNormalPerVertex);

		/****** VrmlData_IndexedFaceSet::SetNormals ******/
		/****** md5 signature: e32729d2e2c119c2bf7bcd986503d323 ******/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "
Parameters
----------
theNormals: VrmlData_Normal

Return
-------
None

Description
-----------
/** * Set the normals node */.
") SetNormals;
		void SetNormals(const opencascade::handle<VrmlData_Normal> & theNormals);

		/****** VrmlData_IndexedFaceSet::SetPolygons ******/
		/****** md5 signature: 346d6e6d3558e9d7f2add571fe8c9bb9 ******/
		%feature("compactdefaultargs") SetPolygons;
		%feature("autodoc", "
Parameters
----------
nPolygons: size_t
thePolygons: int * *

Return
-------
None

Description
-----------
/** * Set the polygons */.
") SetPolygons;
		void SetPolygons(const size_t nPolygons, const int * * thePolygons);

		/****** VrmlData_IndexedFaceSet::SetTextureCoordInd ******/
		/****** md5 signature: b66c6f00720764a395e43bbfcc797ddf ******/
		%feature("compactdefaultargs") SetTextureCoordInd;
		%feature("autodoc", "
Parameters
----------
nIndice: size_t
theIndice: int * *

Return
-------
None

Description
-----------
/** * Set the TexCoordiante array of indice */.
") SetTextureCoordInd;
		void SetTextureCoordInd(const size_t nIndice, const int * * theIndice);

		/****** VrmlData_IndexedFaceSet::SetTextureCoords ******/
		/****** md5 signature: 176293ee2ebe8f4fe8657ef1a99f7e1a ******/
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "
Parameters
----------
tc: VrmlData_TextureCoordinate

Return
-------
None

Description
-----------
/** * Set the Texture Coordinate node */.
") SetTextureCoords;
		void SetTextureCoords(const opencascade::handle<VrmlData_TextureCoordinate> & tc);

		/****** VrmlData_IndexedFaceSet::TShape ******/
		/****** md5 signature: 0c7df2e9f08d04f457bc0b8a0b5de4ad ******/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
/** * Query the shape. This method checks the flag myIsModified; if True it * should rebuild the shape presentation. */.
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****** VrmlData_IndexedFaceSet::TextureCoords ******/
		/****** md5 signature: 1fff99428932e6cfae23edbe9e4d214b ******/
		%feature("compactdefaultargs") TextureCoords;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlData_TextureCoordinate>

Description
-----------
/** * Query the Texture Coordinates. */.
") TextureCoords;
		const opencascade::handle<VrmlData_TextureCoordinate> & TextureCoords();

		/****** VrmlData_IndexedFaceSet::Write ******/
		/****** md5 signature: e011673aaafe9624bcf427ae568b6b1d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePrefix: char *

Return
-------
VrmlData_ErrorStatus

Description
-----------
/** * Write the Node to output stream. */.
") Write;
		VrmlData_ErrorStatus Write(const char * thePrefix);

};


%make_alias(VrmlData_IndexedFaceSet)

%extend VrmlData_IndexedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetNormal(self):
		pass
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class VrmlData_InBuffer:
	pass

@classnotwrapped
class VrmlData_ArrayVec3d:
	pass

@classnotwrapped
class VrmlData_Texture:
	pass

@classnotwrapped
class VrmlData_TextureTransform:
	pass

@classnotwrapped
class VrmlData_Faceted:
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
def VrmlData_Node_GlobalIndent(*args):
	return VrmlData_Node.GlobalIndent(*args)

@deprecated
def VrmlData_Node_OK(*args):
	return VrmlData_Node.OK(*args)

@deprecated
def VrmlData_Node_OK(*args):
	return VrmlData_Node.OK(*args)

@deprecated
def VrmlData_Node_ReadBoolean(*args):
	return VrmlData_Node.ReadBoolean(*args)

@deprecated
def VrmlData_Node_ReadInteger(*args):
	return VrmlData_Node.ReadInteger(*args)

@deprecated
def VrmlData_Node_ReadMultiString(*args):
	return VrmlData_Node.ReadMultiString(*args)

@deprecated
def VrmlData_Node_ReadString(*args):
	return VrmlData_Node.ReadString(*args)

@deprecated
def VrmlData_Scene_ReadLine(*args):
	return VrmlData_Scene.ReadLine(*args)

@deprecated
def VrmlData_Scene_ReadWord(*args):
	return VrmlData_Scene.ReadWord(*args)

}
