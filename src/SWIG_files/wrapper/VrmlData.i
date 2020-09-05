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
%define VRMLDATADOCSTRING
"VrmlData module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_vrmldata.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<VrmlData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
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

/* python proy classes for enums */
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
%template(VrmlData_DataMapOfShapeAppearance) NCollection_DataMap<opencascade::handle<TopoDS_TShape>,opencascade::handle<VrmlData_Appearance>>;
%template(VrmlData_ListOfNode) NCollection_List<opencascade::handle<VrmlData_Node>>;

%extend NCollection_List<opencascade::handle<VrmlData_Node>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
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
		/****************** Clone ******************/
		/**** md5 signature: 38d4971277e3d118e2102169429f1309 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified.<p> * this method nullifies the argument node if its member myscene differs * from that one of the current instance. */.

Parameters
----------
&: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node > &);

		/****************** GlobalIndent ******************/
		/**** md5 signature: 34dc63c04f14bab986cae9b597e23160 ****/
		%feature("compactdefaultargs") GlobalIndent;
		%feature("autodoc", "No available documentation.

Returns
-------
inline int
") GlobalIndent;
		static inline Standard_Integer GlobalIndent();

		/****************** IsDefault ******************/
		/**** md5 signature: 1b7a136faa0c8ac407d7529214546ac4 ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, then it would not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Name ******************/
		/**** md5 signature: 2c4c1f4b45fa5a8704130a64841502c2 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "/** * query the name */.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** OK ******************/
		/**** md5 signature: cb1fbcecf8852bbcc5ef89f9f2e03292 ****/
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStat: VrmlData_ErrorStatus

Returns
-------
inline bool
") OK;
		static inline Standard_Boolean OK(const VrmlData_ErrorStatus theStat);

		/****************** OK ******************/
		/**** md5 signature: 78490ef035e0d10fa78bb02187dae4ae ****/
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "No available documentation.

Parameters
----------
outStat: VrmlData_ErrorStatus
theStat: VrmlData_ErrorStatus

Returns
-------
inline bool
") OK;
		static inline Standard_Boolean OK(VrmlData_ErrorStatus & outStat, const VrmlData_ErrorStatus theStat);

		/****************** Read ******************/
		/**** md5 signature: 1ad536bb6f0a141f658023ed487ae5c4 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** ReadBoolean ******************/
		/**** md5 signature: d7acd275cf78c930f898aae17a29f008 ****/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "/** * read one boolean value (true or false). */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
theResult: bool
") ReadBoolean;
		static VrmlData_ErrorStatus ReadBoolean(VrmlData_InBuffer & theBuffer, Standard_Boolean &OutValue);

		/****************** ReadInteger ******************/
		/**** md5 signature: e68a6013750cd6f9172d2976a08fcd99 ****/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "/** * read one integer value. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
theResult: long

Returns
-------
VrmlData_ErrorStatus
") ReadInteger;
		static VrmlData_ErrorStatus ReadInteger(VrmlData_InBuffer & theBuffer, long & theResult);

		/****************** ReadMultiString ******************/
		/**** md5 signature: e2fb1c34c24297cb83cdb64600a1f3a9 ****/
		%feature("compactdefaultargs") ReadMultiString;
		%feature("autodoc", "/** * read one quoted string, the quotes are removed. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
theRes: NCollection_List<TCollection_AsciiString>

Returns
-------
VrmlData_ErrorStatus
") ReadMultiString;
		static VrmlData_ErrorStatus ReadMultiString(VrmlData_InBuffer & theBuffer, NCollection_List<TCollection_AsciiString> & theRes);

		/****************** ReadNode ******************/
		/**** md5 signature: 879da44ca3b131a6f63b8cf28d587f04 ****/
		%feature("compactdefaultargs") ReadNode;
		%feature("autodoc", "/** * read a complete node definition from vrml stream * @param thebuffer * buffer receiving the input data. * @param thenode * <tt>[out]</tt> node restored from the buffer data * @param type * node type to be checked. if it is null(default) no type checking is done. * otherwise the created node is matched and an error is returned if * no match detected. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
theNode: VrmlData_Node
Type: Standard_Type,optional
	default value is NULL

Returns
-------
VrmlData_ErrorStatus
") ReadNode;
		VrmlData_ErrorStatus ReadNode(VrmlData_InBuffer & theBuffer, opencascade::handle<VrmlData_Node> & theNode, const opencascade::handle<Standard_Type> & Type = NULL);

		/****************** ReadString ******************/
		/**** md5 signature: 10bb9614bca7b920e23bdbdf23c9c677 ****/
		%feature("compactdefaultargs") ReadString;
		%feature("autodoc", "/** * read one quoted string, the quotes are removed. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
theRes: TCollection_AsciiString

Returns
-------
VrmlData_ErrorStatus
") ReadString;
		static VrmlData_ErrorStatus ReadString(VrmlData_InBuffer & theBuffer, TCollection_AsciiString & theRes);

		/****************** Scene ******************/
		/**** md5 signature: 7cd55fa14ff98139c875d8a22b2dae83 ****/
		%feature("compactdefaultargs") Scene;
		%feature("autodoc", "/** * query the scene that contains this node */.

Returns
-------
VrmlData_Scene
") Scene;
		const VrmlData_Scene & Scene();

		/****************** Write ******************/
		/**** md5 signature: cb843c1e0dee6a359cf95725d05270a5 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

		/****************** WriteClosing ******************/
		/**** md5 signature: 0f7fa21c7b0e728fbde404c8b35ba2ee ****/
		%feature("compactdefaultargs") WriteClosing;
		%feature("autodoc", "/** * write the closing brace in the end of a node output. */.

Returns
-------
VrmlData_ErrorStatus
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
typedef VrmlData_ListOfNode ::Iterator Iterator;
		/****************** VrmlData_Scene ******************/
		/**** md5 signature: 1e25ecb1dc18d738bfd2921992deea3b ****/
		%feature("compactdefaultargs") VrmlData_Scene;
		%feature("autodoc", "/** * constructor. */.

Parameters
----------
&: NCollection_IncAllocator,optional
	default value is 0L

Returns
-------
None
") VrmlData_Scene;
		 VrmlData_Scene(const opencascade::handle<NCollection_IncAllocator > & = 0L);

		/****************** AddNode ******************/
		/**** md5 signature: 6a4ae55d6e300286914af41a6d87f1a0 ****/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "/** * add a node. if then belongs to another scene, it is cloned. * <p>vrmldata_worldinfo cannot be added, in this case the method * returns a null handle. */.

Parameters
----------
theN: VrmlData_Node
isTopLevel: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<VrmlData_Node>
") AddNode;
		const opencascade::handle<VrmlData_Node> & AddNode(const opencascade::handle<VrmlData_Node> & theN, const Standard_Boolean isTopLevel = Standard_True);

		/****************** Allocator ******************/
		/**** md5 signature: 4e28fef9a355f8e2f25d143af5e72dd8 ****/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "/** * allocator used by all nodes contained in the scene. */.

Returns
-------
opencascade::handle<NCollection_IncAllocator>
") Allocator;
		const opencascade::handle<NCollection_IncAllocator> & Allocator();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FindNode ******************/
		/**** md5 signature: bb943cbcf67db155aea431d31d5e4097 ****/
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "/** * find a node by its name. * @param thename * name of the node to find. * @param thetype * type to match. if this value is null, the first found node with the * given name is returned. if thetype is given, only the node that has * that type is returned. */.

Parameters
----------
theName: char *
theType: Standard_Type,optional
	default value is 0L

Returns
-------
opencascade::handle<VrmlData_Node>
") FindNode;
		opencascade::handle<VrmlData_Node> FindNode(const char * theName, const opencascade::handle<Standard_Type> & theType = 0L);

		/****************** FindNode ******************/
		/**** md5 signature: feedaf69513e6cee44e38be3fcaedac2 ****/
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "/** * find a node by its name. * @param thename * name of the node to search for. * @param thelocation * location of the found node with respect to the whole vrml shape. */.

Parameters
----------
theName: char *
theLocation: gp_Trsf

Returns
-------
opencascade::handle<VrmlData_Node>
") FindNode;
		opencascade::handle<VrmlData_Node> FindNode(const char * theName, gp_Trsf & theLocation);

		/****************** GetIterator ******************/
		/**** md5 signature: eb2840af7431a8179fe0b1dabdc7bbbd ****/
		%feature("compactdefaultargs") GetIterator;
		%feature("autodoc", "/** * iterator of nodes */.

Returns
-------
Iterator
") GetIterator;
		Iterator GetIterator();

		/****************** GetLineError ******************/
		/**** md5 signature: 99998ea33b6f4845bfd1d9a2f75e8a6f ****/
		%feature("compactdefaultargs") GetLineError;
		%feature("autodoc", "/** * query the line where the error occurred (if the status is not ok) */.

Returns
-------
int
") GetLineError;
		Standard_Integer GetLineError();

		/****************** GetShape ******************/
		/**** md5 signature: ca46f2aa9b54e25e8f902de55e34455a ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "/** * convert the scene to a shape, with the information on materials defined * for each sub-shape. this method should be used instead of topods_shape * explicit conversion operator when you need to retrieve the material * aspect for each face or edge in the returned topological object. * @param m * data map that binds an appearance instance to each created tface or * tedge if the appearance node is defined in vrml scene for that geometry. * returns * topods_shape (compound) holding all the scene, similar to the result of * explicit topods_shape conversion operator. */.

Parameters
----------
M: VrmlData_DataMapOfShapeAppearance

Returns
-------
TopoDS_Shape
") GetShape;
		TopoDS_Shape GetShape(VrmlData_DataMapOfShapeAppearance & M);

		/****************** IsDummyWrite ******************/
		/**** md5 signature: 1ca2d9906b0da72268fcf68070f962af ****/
		%feature("compactdefaultargs") IsDummyWrite;
		%feature("autodoc", "/** * query if the current write operation is dummy, i.e., for the purpose of * collecting information before the real write is commenced. */.

Returns
-------
bool
") IsDummyWrite;
		Standard_Boolean IsDummyWrite();

		/****************** NamedNodesIterator ******************/
		/**** md5 signature: 9b887a7b29ee8caccd653f9a89564086 ****/
		%feature("compactdefaultargs") NamedNodesIterator;
		%feature("autodoc", "/** * get the iterator of named nodes. */.

Returns
-------
VrmlData_MapOfNode::Iterator
") NamedNodesIterator;
		VrmlData_MapOfNode::Iterator NamedNodesIterator();

		/****************** ReadArrIndex ******************/
		/**** md5 signature: d67efde97661473390f579e21524dd63 ****/
		%feature("compactdefaultargs") ReadArrIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
theBuffer: VrmlData_InBuffer
theArr: int * *
theNBl: Standard_Size

Returns
-------
VrmlData_ErrorStatus
") ReadArrIndex;
		VrmlData_ErrorStatus ReadArrIndex(VrmlData_InBuffer & theBuffer, const Standard_Integer * * & theArr, Standard_Size & theNBl);

		/****************** ReadLine ******************/
		/**** md5 signature: 463dc9d784335e0fc4c761b7b8b4ece8 ****/
		%feature("compactdefaultargs") ReadLine;
		%feature("autodoc", "/** * read a vrml line. empty lines and comments are skipped. * the processing starts here from thebuffer.lineptr; if there is at least * one non-empty character (neither space nor comment), this line is used * without reading the next one. * @param theline * buffer receiving the input line * @param theinput * input stream * @param thelen * length of the input buffer (maximal line length) */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") ReadLine;
		static VrmlData_ErrorStatus ReadLine(VrmlData_InBuffer & theBuffer);

		/****************** ReadReal ******************/
		/**** md5 signature: f35136b54565cc98596b8d71e4aff35b ****/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "/** * read one real value. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
isApplyScale: bool
isOnlyPositive: bool

Returns
-------
theResult: float
") ReadReal;
		VrmlData_ErrorStatus ReadReal(VrmlData_InBuffer & theBuffer, Standard_Real &OutValue, Standard_Boolean isApplyScale, Standard_Boolean isOnlyPositive);

		/****************** ReadWord ******************/
		/**** md5 signature: 9f756806cb42b9cf048d618659c2ad43 ****/
		%feature("compactdefaultargs") ReadWord;
		%feature("autodoc", "/** * read a singel word from the input stream, delimited by whitespace. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
theStr: TCollection_AsciiString

Returns
-------
VrmlData_ErrorStatus
") ReadWord;
		static VrmlData_ErrorStatus ReadWord(VrmlData_InBuffer & theBuffer, TCollection_AsciiString & theStr);

		/****************** ReadXY ******************/
		/**** md5 signature: df6a9895b512d9ec7e4f7446fce4675a ****/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "/** * read one doublet of real values. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
theXYZ: gp_XY
isApplyScale: bool
isOnlyPositive: bool

Returns
-------
VrmlData_ErrorStatus
") ReadXY;
		VrmlData_ErrorStatus ReadXY(VrmlData_InBuffer & theBuffer, gp_XY & theXYZ, Standard_Boolean isApplyScale, Standard_Boolean isOnlyPositive);

		/****************** ReadXYZ ******************/
		/**** md5 signature: 29ddf91948c85aaed3290439f77da20e ****/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "/** * read one triplet of real values. */.

Parameters
----------
theBuffer: VrmlData_InBuffer
theXYZ: gp_XYZ
isApplyScale: bool
isOnlyPositive: bool

Returns
-------
VrmlData_ErrorStatus
") ReadXYZ;
		VrmlData_ErrorStatus ReadXYZ(VrmlData_InBuffer & theBuffer, gp_XYZ & theXYZ, Standard_Boolean isApplyScale, Standard_Boolean isOnlyPositive);

		/****************** SetIndent ******************/
		/**** md5 signature: 98895640f3e98b674aa9aa6ddba58989 ****/
		%feature("compactdefaultargs") SetIndent;
		%feature("autodoc", "/** * store the indentation for vrml output. * @param nspc * number of spaces to insert at every indentation level */.

Parameters
----------
nSpc: int

Returns
-------
None
") SetIndent;
		void SetIndent(const Standard_Integer nSpc);

		/****************** SetLinearScale ******************/
		/**** md5 signature: 38cfc9610c04a64446367581600bc8ca ****/
		%feature("compactdefaultargs") SetLinearScale;
		%feature("autodoc", "/** * set the scale factor that would be further used in methods * readreal, readxyz and readxy. all coordinates, distances and sized are * multiplied by this factor during reading the data. */.

Parameters
----------
theScale: float

Returns
-------
None
") SetLinearScale;
		void SetLinearScale(const Standard_Real theScale);

		/****************** SetVrmlDir ******************/
		/**** md5 signature: c61174c1f52c4ff5b725672bce4a62a7 ****/
		%feature("compactdefaultargs") SetVrmlDir;
		%feature("autodoc", "/** * add the given directory path to the list of vrml file search directories. * this method forms the list of directories ordered according to the * sequence of this method calls. when an inline node is found, the urls * in that node are matched with these directories. * the last (implicit) search directory is the current process directory * ('.'). it takes effect if the list is empty or if there is no match with * exisiting directories. */.

Parameters
----------
&: TCollection_ExtendedString

Returns
-------
None
") SetVrmlDir;
		void SetVrmlDir(const TCollection_ExtendedString &);

		/****************** Status ******************/
		/**** md5 signature: f03039d78ccb208df273c1f1f10a8d8f ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "/** * query the status of the previous operation. * normally it should be equal to vrmldata_statusok (no error). */.

Returns
-------
VrmlData_ErrorStatus
") Status;
		VrmlData_ErrorStatus Status();

		/****************** VrmlDirIterator ******************/
		/**** md5 signature: bb38e737d6185ad960925e7bb895ddc2 ****/
		%feature("compactdefaultargs") VrmlDirIterator;
		%feature("autodoc", "/** * returns the directory iterator, to check the presence of requested vrml * file in each iterated directory. */.

Returns
-------
NCollection_List<TCollection_ExtendedString >::Iterator
") VrmlDirIterator;
		NCollection_List<TCollection_ExtendedString >::Iterator VrmlDirIterator();

		/****************** WorldInfo ******************/
		/**** md5 signature: 8ad3acd26207bc3f4cec13dfc2d423ab ****/
		%feature("compactdefaultargs") WorldInfo;
		%feature("autodoc", "/** * query the worldinfo member. */.

Returns
-------
opencascade::handle<VrmlData_WorldInfo>
") WorldInfo;
		const opencascade::handle<VrmlData_WorldInfo> & WorldInfo();

		/****************** WriteArrIndex ******************/
		/**** md5 signature: c4cfa4c75dd78e287d3e23e38ec4217a ****/
		%feature("compactdefaultargs") WriteArrIndex;
		%feature("autodoc", "/** * write an array of integer indices, for indexedfaceset and indexedlineset. */.

Parameters
----------
thePrefix: char *
theArr: int * *
theNbBl: Standard_Size

Returns
-------
VrmlData_ErrorStatus
") WriteArrIndex;
		VrmlData_ErrorStatus WriteArrIndex(const char * thePrefix, const Standard_Integer * * theArr, const Standard_Size theNbBl);

		/****************** WriteLine ******************/
		/**** md5 signature: faafa101acc6388d5340510813b579fb ****/
		%feature("compactdefaultargs") WriteLine;
		%feature("autodoc", "/** * write a string to the output stream respecting the indentation. the string * can be defined as two substrings that will be separated by a space. * each of the substrings can be null, then it is ignored. if both * are null, then a single newline is output (without indent). * @param theline0 * the first part of string to output * @param theline1 * the second part of string to output * @param theindent * - 0 value ignored. * - negative decreases the current indent and then outputs. * - positive outputs and then increases the current indent. * returns * error status of the stream, or a special error if myoutput == null. */.

Parameters
----------
theLine0: char *
theLine1: char *,optional
	default value is 0L
theIndent: int,optional
	default value is 0

Returns
-------
VrmlData_ErrorStatus
") WriteLine;
		VrmlData_ErrorStatus WriteLine(const char * theLine0, const char * theLine1 = 0L, const Standard_Integer theIndent = 0);

		/****************** WriteNode ******************/
		/**** md5 signature: d213e29a668ed5a7ef2dd0142e10027c ****/
		%feature("compactdefaultargs") WriteNode;
		%feature("autodoc", "/** * write the given node to output stream 'myoutput'. */.

Parameters
----------
thePrefix: char *
&: VrmlData_Node

Returns
-------
VrmlData_ErrorStatus
") WriteNode;
		VrmlData_ErrorStatus WriteNode(const char * thePrefix, const opencascade::handle<VrmlData_Node > &);

		/****************** WriteXYZ ******************/
		/**** md5 signature: 0a114bf1ea6405d7e4a3b5c08ea9d7a0 ****/
		%feature("compactdefaultargs") WriteXYZ;
		%feature("autodoc", "/** * write a triplet of real values on a separate line. * @param thexyz * the value to be output. * @param isscale * if true, then each component is divided by mylinearscale. * @param thepostfix * optional string that is added before the end of the line. */.

Parameters
----------
theXYZ: gp_XYZ
isScale: bool
thePostfix: char *,optional
	default value is 0L

Returns
-------
VrmlData_ErrorStatus
") WriteXYZ;
		VrmlData_ErrorStatus WriteXYZ(const gp_XYZ & theXYZ, const Standard_Boolean isScale, const char * thePostfix = 0L);

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
		/****************** VrmlData_ShapeConvert ******************/
		/**** md5 signature: 68e08b4d3980da44c6e1dd4d301de8b2 ****/
		%feature("compactdefaultargs") VrmlData_ShapeConvert;
		%feature("autodoc", "/** * constructor. * @param thescene * scene receiving all vrml data. * @param thescale * scale factor, considering that vrml standard specifies coordinates in * meters. so if your data are in mm, you should provide thescale=0.001 */.

Parameters
----------
theScene: VrmlData_Scene
theScale: float,optional
	default value is 1

Returns
-------
None
") VrmlData_ShapeConvert;
		 VrmlData_ShapeConvert(VrmlData_Scene & theScene, const Standard_Real theScale = 1);

		/****************** AddShape ******************/
		/**** md5 signature: 9597bbe799f71f2931a398e9b8211a3d ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "/** * add one shape to the internal list, may be called several times with * different shapes. */.

Parameters
----------
theShape: TopoDS_Shape
theName: char *,optional
	default value is 0L

Returns
-------
None
") AddShape;
		void AddShape(const TopoDS_Shape & theShape, const char * theName = 0L);

		/****************** Convert ******************/
		/**** md5 signature: f593201deba882e1902592660879f146 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "/** * convert all accumulated shapes and store them in myscene. * the internal data structures are cleared in the end of convertion. * @param theextractfaces * if true, converter extracst faces from the shapes. * @param theextractedges * if true, converter extracts edges from the shapes. * @param thedeflection * deflection for tessellation of geometrical lines/surfaces. existing mesh * is used if its deflection is smaller than the one given by this * parameter. * @param thedeflangle * angular deflection for tessellation of geometrical lines. */.

Parameters
----------
theExtractFaces: bool
theExtractEdges: bool
theDeflection: float,optional
	default value is 0.01
theDeflAngle: float,optional
	default value is 20*M_PI/180

Returns
-------
None
") Convert;
		void Convert(const Standard_Boolean theExtractFaces, const Standard_Boolean theExtractEdges, const Standard_Real theDeflection = 0.01, const Standard_Real theDeflAngle = 20*M_PI/180);

		/****************** ConvertDocument ******************/
		/**** md5 signature: a4a53d2f864346e4690a0bb1f4bf88b8 ****/
		%feature("compactdefaultargs") ConvertDocument;
		%feature("autodoc", "/** * add all shapes start from given document with colors and names to the internal structure */.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") ConvertDocument;
		void ConvertDocument(const opencascade::handle<TDocStd_Document> & theDoc);

};


%extend VrmlData_ShapeConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class VrmlData_Appearance *
****************************/
class VrmlData_Appearance : public VrmlData_Node {
	public:
		/****************** VrmlData_Appearance ******************/
		/**** md5 signature: 78d4cedac9e21834b3e15aeea776897b ****/
		%feature("compactdefaultargs") VrmlData_Appearance;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Appearance;
		 VrmlData_Appearance();

		/****************** VrmlData_Appearance ******************/
		/**** md5 signature: f602ec806c76f8c47b43bd2117d0b152 ****/
		%feature("compactdefaultargs") VrmlData_Appearance;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *

Returns
-------
None
") VrmlData_Appearance;
		 VrmlData_Appearance(const VrmlData_Scene & theScene, const char * theName);

		/****************** Clone ******************/
		/**** md5 signature: 42d9803ab6bf2ca46b0f74ce90b6a996 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified.<p> */.

Parameters
----------
&: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node > &);

		/****************** IsDefault ******************/
		/**** md5 signature: 4ff647a3408e78788bd7a6b5e61c46ed ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Material ******************/
		/**** md5 signature: dfeebcaa22399b65f8e44bab4895f82a ****/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "/** * query the material */.

Returns
-------
opencascade::handle<VrmlData_Material>
") Material;
		const opencascade::handle<VrmlData_Material> & Material();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetMaterial ******************/
		/**** md5 signature: 176aa723bd6d66cb0800eeffc747ec2f ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "/** * set the material */.

Parameters
----------
theMat: VrmlData_Material

Returns
-------
None
") SetMaterial;
		void SetMaterial(const opencascade::handle<VrmlData_Material> & theMat);

		/****************** SetTexture ******************/
		/**** md5 signature: 95006966de79d9897f58d7677e31b19f ****/
		%feature("compactdefaultargs") SetTexture;
		%feature("autodoc", "/** * set the texture */.

Parameters
----------
theTexture: VrmlData_Texture

Returns
-------
None
") SetTexture;
		void SetTexture(const opencascade::handle<VrmlData_Texture> & theTexture);

		/****************** SetTextureTransform ******************/
		/**** md5 signature: ec2b4dc33a369d79ad0ed1ec33f5778f ****/
		%feature("compactdefaultargs") SetTextureTransform;
		%feature("autodoc", "/** * set the texture transform */.

Parameters
----------
theTT: VrmlData_TextureTransform

Returns
-------
None
") SetTextureTransform;
		void SetTextureTransform(const opencascade::handle<VrmlData_TextureTransform> & theTT);

		/****************** Texture ******************/
		/**** md5 signature: 21e8cf614290f83ff95ea00ca14e284c ****/
		%feature("compactdefaultargs") Texture;
		%feature("autodoc", "/** * query the texture */.

Returns
-------
opencascade::handle<VrmlData_Texture>
") Texture;
		const opencascade::handle<VrmlData_Texture> & Texture();

		/****************** TextureTransform ******************/
		/**** md5 signature: bbde9d0f47eddbfab2dfd262c15d6259 ****/
		%feature("compactdefaultargs") TextureTransform;
		%feature("autodoc", "/** * query the texturetransform */.

Returns
-------
opencascade::handle<VrmlData_TextureTransform>
") TextureTransform;
		const opencascade::handle<VrmlData_TextureTransform> & TextureTransform();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node from input stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** TShape ******************/
		/**** md5 signature: dbadc622b80832b75bd4efea3d9429df ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the shape. this method checks the flag myismodified; if true it * should rebuild the shape presentation. */.

Returns
-------
opencascade::handle<TopoDS_TShape>
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
typedef VrmlData_ListOfNode ::Iterator Iterator;
		/****************** VrmlData_Group ******************/
		/**** md5 signature: 4a4b8084283a33ae08c7ae61eaa4fb12 ****/
		%feature("compactdefaultargs") VrmlData_Group;
		%feature("autodoc", "/** * empty constructor. * @param istransform * true if the group of type transform is defined * @param thealloc * allocator used for the list of children */.

Parameters
----------
isTransform: bool,optional
	default value is Standard_False

Returns
-------
None
") VrmlData_Group;
		 VrmlData_Group(const Standard_Boolean isTransform = Standard_False);

		/****************** VrmlData_Group ******************/
		/**** md5 signature: 2872950a619c18ca0020a203419b55b7 ****/
		%feature("compactdefaultargs") VrmlData_Group;
		%feature("autodoc", "/** * constructor. * @param thename * name of the group node * @param istransform * true if the group of type transform is defined * @param thealloc * allocator used for the list of children */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
isTransform: bool,optional
	default value is Standard_False

Returns
-------
None
") VrmlData_Group;
		 VrmlData_Group(const VrmlData_Scene & theScene, const char * theName, const Standard_Boolean isTransform = Standard_False);

		/****************** AddNode ******************/
		/**** md5 signature: 3f11ff6c3809d97b9ed6a1a52fec5515 ****/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "/** * add one node to the group. */.

Parameters
----------
theNode: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") AddNode;
		opencascade::handle<VrmlData_Node> & AddNode(const opencascade::handle<VrmlData_Node> & theNode);

		/****************** Box ******************/
		/**** md5 signature: 79505dc9b66a5350ccdc24c305c2610f ****/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "/** * query the bounding box. */.

Returns
-------
Bnd_B3f
") Box;
		const Bnd_B3f & Box();

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** FindNode ******************/
		/**** md5 signature: feedaf69513e6cee44e38be3fcaedac2 ****/
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "/** * find a node by its name, inside this group * @param thename * name of the node to search for. * @param thelocation * location of the found node with respect to this group. */.

Parameters
----------
theName: char *
theLocation: gp_Trsf

Returns
-------
opencascade::handle<VrmlData_Node>
") FindNode;
		opencascade::handle<VrmlData_Node> FindNode(const char * theName, gp_Trsf & theLocation);

		/****************** GetTransform ******************/
		/**** md5 signature: d12c205b591852c15c62f6d350ce2c60 ****/
		%feature("compactdefaultargs") GetTransform;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") GetTransform;
		const gp_Trsf GetTransform();

		/****************** IsTransform ******************/
		/**** md5 signature: 698d1d2517dd6d50affe948167d5d36d ****/
		%feature("compactdefaultargs") IsTransform;
		%feature("autodoc", "/** * query if the node is transform type. */.

Returns
-------
bool
") IsTransform;
		Standard_Boolean IsTransform();

		/****************** NodeIterator ******************/
		/**** md5 signature: ad0aab1fa703096830ba4e298bc4db90 ****/
		%feature("compactdefaultargs") NodeIterator;
		%feature("autodoc", "/** * create iterator on nodes belonging to the group. */.

Returns
-------
Iterator
") NodeIterator;
		Iterator NodeIterator();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * fill the node internal data from the given input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** RemoveNode ******************/
		/**** md5 signature: 0c90603f2da345adb321b9ac9c94a1ab ****/
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "/** * remove one node from the group. * returns * true if the node was located and removed, false if none removed. */.

Parameters
----------
theNode: VrmlData_Node

Returns
-------
bool
") RemoveNode;
		Standard_Boolean RemoveNode(const opencascade::handle<VrmlData_Node> & theNode);

		/****************** SetBox ******************/
		/**** md5 signature: 80ba51ed8c20e9ee360285534d5b3767 ****/
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "/** * set the bounding box. */.

Parameters
----------
theBox: Bnd_B3f

Returns
-------
None
") SetBox;
		void SetBox(const Bnd_B3f & theBox);

		/****************** SetTransform ******************/
		/**** md5 signature: a79c8b6e3b300aa0676359932262e26f ****/
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "/** * set the transformation. returns true if the group is transform type, * otherwise do nothing and return false. */.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
bool
") SetTransform;
		Standard_Boolean SetTransform(const gp_Trsf & theTrsf);

		/****************** Shape ******************/
		/**** md5 signature: 3cc08b169b52e7f7ede2b7523742bc93 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "/** * get the shape representing the group geometry. */.

Parameters
----------
theShape: TopoDS_Shape
pMapApp: VrmlData_DataMapOfShapeAppearance *

Returns
-------
None
") Shape;
		void Shape(TopoDS_Shape & theShape, VrmlData_DataMapOfShapeAppearance * pMapApp);

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Material ******************/
		/**** md5 signature: bd9d0415c735d2c7ae9052fa93064b87 ****/
		%feature("compactdefaultargs") VrmlData_Material;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Material;
		 VrmlData_Material();

		/****************** VrmlData_Material ******************/
		/**** md5 signature: ae7e51685706df89044aaea15b8f1c5c ****/
		%feature("compactdefaultargs") VrmlData_Material;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
theAmbientIntensity: float,optional
	default value is -1
theShininess: float,optional
	default value is -1
theTransparency: float,optional
	default value is -1

Returns
-------
None
") VrmlData_Material;
		 VrmlData_Material(const VrmlData_Scene & theScene, const char * theName, const Standard_Real theAmbientIntensity = -1, const Standard_Real theShininess = -1, const Standard_Real theTransparency = -1);

		/****************** AmbientIntensity ******************/
		/**** md5 signature: d32af26bf065597070a37499321d5992 ****/
		%feature("compactdefaultargs") AmbientIntensity;
		%feature("autodoc", "/** * query the ambient intensity value */.

Returns
-------
float
") AmbientIntensity;
		Standard_Real AmbientIntensity();

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** DiffuseColor ******************/
		/**** md5 signature: 9c49a8c7f3b34d6fad0a422398d823cc ****/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "/** * query the diffuse color */.

Returns
-------
Quantity_Color
") DiffuseColor;
		const Quantity_Color & DiffuseColor();

		/****************** EmissiveColor ******************/
		/**** md5 signature: a81902b710d4283046e2074f8c68f238 ****/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "/** * query the emissive color */.

Returns
-------
Quantity_Color
") EmissiveColor;
		const Quantity_Color & EmissiveColor();

		/****************** IsDefault ******************/
		/**** md5 signature: 4ff647a3408e78788bd7a6b5e61c46ed ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetAmbientIntensity ******************/
		/**** md5 signature: 71cfa04b401f8be3353ac2a3dc8275a4 ****/
		%feature("compactdefaultargs") SetAmbientIntensity;
		%feature("autodoc", "/** * set the ambient intensity value */.

Parameters
----------
theAmbientIntensity: float

Returns
-------
None
") SetAmbientIntensity;
		void SetAmbientIntensity(const Standard_Real theAmbientIntensity);

		/****************** SetDiffuseColor ******************/
		/**** md5 signature: a706faa79c39966ccc5de82231bccb71 ****/
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "/** * query the diffuse color */.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetDiffuseColor;
		void SetDiffuseColor(const Quantity_Color & theColor);

		/****************** SetEmissiveColor ******************/
		/**** md5 signature: 7e66ad66ed9e2434756333c8dfa79c87 ****/
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "/** * query the emissive color */.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetEmissiveColor;
		void SetEmissiveColor(const Quantity_Color & theColor);

		/****************** SetShininess ******************/
		/**** md5 signature: 004a07a86fd2858f7efa7ec10a36e474 ****/
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "/** * set the shininess value */.

Parameters
----------
theShininess: float

Returns
-------
None
") SetShininess;
		void SetShininess(const Standard_Real theShininess);

		/****************** SetSpecularColor ******************/
		/**** md5 signature: 12ed5001ae01a3cbcd54180d440dda73 ****/
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "/** * query the specular color */.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetSpecularColor;
		void SetSpecularColor(const Quantity_Color & theColor);

		/****************** SetTransparency ******************/
		/**** md5 signature: 17e88f34e47ad9901af84d1e770277d5 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "/** * set the transparency value */.

Parameters
----------
theTransparency: float

Returns
-------
None
") SetTransparency;
		void SetTransparency(const Standard_Real theTransparency);

		/****************** Shininess ******************/
		/**** md5 signature: 983427691a540fd8368535dcb05b594e ****/
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "/** * query the shininess value */.

Returns
-------
float
") Shininess;
		Standard_Real Shininess();

		/****************** SpecularColor ******************/
		/**** md5 signature: be13421d5a460089944a56fa84b44f51 ****/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "/** * query the specular color */.

Returns
-------
Quantity_Color
") SpecularColor;
		const Quantity_Color & SpecularColor();

		/****************** Transparency ******************/
		/**** md5 signature: 9bfecadb0f0bfb252b68fe64205240fc ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "/** * query the transparency value */.

Returns
-------
float
") Transparency;
		Standard_Real Transparency();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to the scene output. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_ShapeNode ******************/
		/**** md5 signature: 3dde003850ddec445b760acddec7977d ****/
		%feature("compactdefaultargs") VrmlData_ShapeNode;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_ShapeNode;
		 VrmlData_ShapeNode();

		/****************** VrmlData_ShapeNode ******************/
		/**** md5 signature: e5acc2d5d906e1df28b1135e2c10a2f6 ****/
		%feature("compactdefaultargs") VrmlData_ShapeNode;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *

Returns
-------
None
") VrmlData_ShapeNode;
		 VrmlData_ShapeNode(const VrmlData_Scene & theScene, const char * theName);

		/****************** Appearance ******************/
		/**** md5 signature: ee08713a55f30954fc7a40ab04da9356 ****/
		%feature("compactdefaultargs") Appearance;
		%feature("autodoc", "/** * query the appearance. */.

Returns
-------
opencascade::handle<VrmlData_Appearance>
") Appearance;
		const opencascade::handle<VrmlData_Appearance> & Appearance();

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Geometry ******************/
		/**** md5 signature: 4835d1901667aa281770c33090c3e6f5 ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "/** * query the geometry. */.

Returns
-------
opencascade::handle<VrmlData_Geometry>
") Geometry;
		const opencascade::handle<VrmlData_Geometry> & Geometry();

		/****************** IsDefault ******************/
		/**** md5 signature: 4ff647a3408e78788bd7a6b5e61c46ed ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * check if the shape node is writeable. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * fill the node internal data from the given input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetAppearance ******************/
		/**** md5 signature: b488e0e7ff5275e40d10ae0678567399 ****/
		%feature("compactdefaultargs") SetAppearance;
		%feature("autodoc", "/** * set the appearance */.

Parameters
----------
theAppear: VrmlData_Appearance

Returns
-------
None
") SetAppearance;
		void SetAppearance(const opencascade::handle<VrmlData_Appearance> & theAppear);

		/****************** SetGeometry ******************/
		/**** md5 signature: 2eebe1602c0ddfeb3e9b0c2cd24b0c4e ****/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "/** * set the geometry */.

Parameters
----------
theGeometry: VrmlData_Geometry

Returns
-------
None
") SetGeometry;
		void SetGeometry(const opencascade::handle<VrmlData_Geometry> & theGeometry);

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_TextureCoordinate ******************/
		/**** md5 signature: 1e0218f2ec543d6d77789d9d5b9ecdb9 ****/
		%feature("compactdefaultargs") VrmlData_TextureCoordinate;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_TextureCoordinate;
		 VrmlData_TextureCoordinate();

		/****************** VrmlData_TextureCoordinate ******************/
		/**** md5 signature: a4102e9b0fb9dd68244eb21ad6fac2c7 ****/
		%feature("compactdefaultargs") VrmlData_TextureCoordinate;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
nPoints: size_t,optional
	default value is 0
arrPoints: gp_XY *,optional
	default value is 0L

Returns
-------
None
") VrmlData_TextureCoordinate;
		 VrmlData_TextureCoordinate(const VrmlData_Scene & theScene, const char * theName, const size_t nPoints = 0, const gp_XY * arrPoints = 0L);

		/****************** AllocateValues ******************/
		/**** md5 signature: 88bf53f92249259a9becd560ef2840f4 ****/
		%feature("compactdefaultargs") AllocateValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLength: Standard_Size

Returns
-------
bool
") AllocateValues;
		Standard_Boolean AllocateValues(const Standard_Size theLength);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Length ******************/
		/**** md5 signature: 57871cd344e2dd1877fbc297250c0f44 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "/** * query the number of points */.

Returns
-------
size_t
") Length;
		size_t Length();

		/****************** Points ******************/
		/**** md5 signature: fba12d84b09cea75d6adf0416f8768aa ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "/** * query the points */.

Returns
-------
gp_XY *
") Points;
		const gp_XY * Points();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetPoints ******************/
		/**** md5 signature: 6c0c72d8d5061b968d0ceb584db20278 ****/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "/** * set the points array */.

Parameters
----------
nPoints: size_t
arrPoints: gp_XY *

Returns
-------
None
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
		/****************** VrmlData_UnknownNode ******************/
		/**** md5 signature: 017effc09a5d619486cc4f798d6e3fb1 ****/
		%feature("compactdefaultargs") VrmlData_UnknownNode;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_UnknownNode;
		 VrmlData_UnknownNode();

		/****************** VrmlData_UnknownNode ******************/
		/**** md5 signature: 57b4673e61eae586704a23ba1fdac668 ****/
		%feature("compactdefaultargs") VrmlData_UnknownNode;
		%feature("autodoc", "/** * constructor. */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *,optional
	default value is 0L
theTitle: char *,optional
	default value is 0L

Returns
-------
None
") VrmlData_UnknownNode;
		 VrmlData_UnknownNode(const VrmlData_Scene & theScene, const char * theName = 0L, const char * theTitle = 0L);

		/****************** GetTitle ******************/
		/**** md5 signature: fd792bcd35ddb15e7f5160d6ea5f7ec0 ****/
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "/** * query the title of the unknown node. */.

Returns
-------
TCollection_AsciiString
") GetTitle;
		const TCollection_AsciiString & GetTitle();

		/****************** IsDefault ******************/
		/**** md5 signature: 4ff647a3408e78788bd7a6b5e61c46ed ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * check if the node is non-writeable -- always returns true. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the unknown node, till the last closing brace of it. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

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
		/****************** VrmlData_WorldInfo ******************/
		/**** md5 signature: ba5f3e416e2336f1c58ba9cf60eb277f ****/
		%feature("compactdefaultargs") VrmlData_WorldInfo;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_WorldInfo;
		 VrmlData_WorldInfo();

		/****************** VrmlData_WorldInfo ******************/
		/**** md5 signature: eb291290f915cd06f1244dcd42ac5559 ****/
		%feature("compactdefaultargs") VrmlData_WorldInfo;
		%feature("autodoc", "/** * constructor. */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *,optional
	default value is 0L
theTitle: char *,optional
	default value is 0L

Returns
-------
None
") VrmlData_WorldInfo;
		 VrmlData_WorldInfo(const VrmlData_Scene & theScene, const char * theName = 0L, const char * theTitle = 0L);

		/****************** AddInfo ******************/
		/**** md5 signature: dc28827f0f74529728a3e3149aec9a99 ****/
		%feature("compactdefaultargs") AddInfo;
		%feature("autodoc", "/** * add a string to the list of info strings. */.

Parameters
----------
theString: char *

Returns
-------
None
") AddInfo;
		void AddInfo(const char * theString);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** InfoIterator ******************/
		/**** md5 signature: b8a6257f9e0a11b87294100742e9b5b8 ****/
		%feature("compactdefaultargs") InfoIterator;
		%feature("autodoc", "/** * return the iterator of info strings. */.

Returns
-------
NCollection_List< char * >::Iterator
") InfoIterator;
		NCollection_List<const char * >::Iterator InfoIterator();

		/****************** IsDefault ******************/
		/**** md5 signature: 4ff647a3408e78788bd7a6b5e61c46ed ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, then it would not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetTitle ******************/
		/**** md5 signature: 41d6771cbe93b9c5e7b0e70d5879c0b3 ****/
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "/** * set or modify the title. */.

Parameters
----------
theString: char *

Returns
-------
None
") SetTitle;
		void SetTitle(const char * theString);

		/****************** Title ******************/
		/**** md5 signature: 09fbe2e16809a7795a7df1384e695b1b ****/
		%feature("compactdefaultargs") Title;
		%feature("autodoc", "/** * query the title string. */.

Returns
-------
char *
") Title;
		const char * Title();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to the scene output. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Box ******************/
		/**** md5 signature: d30516859426c07b2f913fe75ec3f22e ****/
		%feature("compactdefaultargs") VrmlData_Box;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Box;
		 VrmlData_Box();

		/****************** VrmlData_Box ******************/
		/**** md5 signature: 3100b66caab1ba4bb8b2cde8b9df5cbe ****/
		%feature("compactdefaultargs") VrmlData_Box;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
sizeX: float,optional
	default value is 2
sizeY: float,optional
	default value is 2
sizeZ: float,optional
	default value is 2

Returns
-------
None
") VrmlData_Box;
		 VrmlData_Box(const VrmlData_Scene & theScene, const char * theName, const Standard_Real sizeX = 2, const Standard_Real sizeY = 2, const Standard_Real sizeZ = 2);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * fill the node internal data from the given input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetSize ******************/
		/**** md5 signature: 19e2115bbf1402d11970cdce575fce1d ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "/** * set the box size */.

Parameters
----------
theSize: gp_XYZ

Returns
-------
None
") SetSize;
		void SetSize(const gp_XYZ & theSize);

		/****************** Size ******************/
		/**** md5 signature: 7e535208625ee843fb3d514d99dc0e16 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "/** * query the box size */.

Returns
-------
gp_XYZ
") Size;
		const gp_XYZ Size();

		/****************** TShape ******************/
		/**** md5 signature: 93fab9efcf27c195565c5eda2f729711 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Color ******************/
		/**** md5 signature: ae8189262602c6cc2c116135bccd416e ****/
		%feature("compactdefaultargs") VrmlData_Color;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_Color;
		 VrmlData_Color();

		/****************** VrmlData_Color ******************/
		/**** md5 signature: b7e214cf3e454f240b3da18173f2237c ****/
		%feature("compactdefaultargs") VrmlData_Color;
		%feature("autodoc", "/** * constructor. */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
nColors: size_t,optional
	default value is 0
arrColors: gp_XYZ *,optional
	default value is 0L

Returns
-------
None
") VrmlData_Color;
		 VrmlData_Color(const VrmlData_Scene & theScene, const char * theName, const size_t nColors = 0, const gp_XYZ * arrColors = 0L);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified.<p> */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Color ******************/
		/**** md5 signature: 1898eb767daf45418674bf3651393f45 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "/** * query one color * @param i * index in the array of colors [0 .. n-1] * returns * the color value for the index. if index irrelevant, returns (0., 0., 0.) */.

Parameters
----------
i: int

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color Color(const Standard_Integer i);

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetColors ******************/
		/**** md5 signature: 8eff2cd53c18cdcf0826a72535eb4322 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "/** * set the array data */.

Parameters
----------
nColors: size_t
arrColors: gp_XYZ *

Returns
-------
None
") SetColors;
		void SetColors(const size_t nColors, const gp_XYZ * arrColors);

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to the scene output. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Cone ******************/
		/**** md5 signature: 8db8bb078fa51ba51579a6fe8a5e2ae2 ****/
		%feature("compactdefaultargs") VrmlData_Cone;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Cone;
		 VrmlData_Cone();

		/****************** VrmlData_Cone ******************/
		/**** md5 signature: 3c1076725275cf56394c2dd84f2306f2 ****/
		%feature("compactdefaultargs") VrmlData_Cone;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
theBottomRadius: float,optional
	default value is 1
theHeight: float,optional
	default value is 2

Returns
-------
None
") VrmlData_Cone;
		 VrmlData_Cone(const VrmlData_Scene & theScene, const char * theName, const Standard_Real theBottomRadius = 1, const Standard_Real theHeight = 2);

		/****************** BottomRadius ******************/
		/**** md5 signature: 513ae48fc9e9433a4d42d5ab899d8c9e ****/
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "/** * query the bottom radius */.

Returns
-------
float
") BottomRadius;
		Standard_Real BottomRadius();

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** HasBottom ******************/
		/**** md5 signature: 25e14da0c2fbc11e5f9af7b96668446c ****/
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "/** * query if the bottom circle is included */.

Returns
-------
bool
") HasBottom;
		Standard_Boolean HasBottom();

		/****************** HasSide ******************/
		/**** md5 signature: c8a7940100871f9d13e6d4209710b8f2 ****/
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "/** * query if the side surface is included */.

Returns
-------
bool
") HasSide;
		Standard_Boolean HasSide();

		/****************** Height ******************/
		/**** md5 signature: ead56356911f8df313dceca6929dde18 ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "/** * query the height */.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * fill the node internal data from the given input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetBottomRadius ******************/
		/**** md5 signature: 4578a591fab6a97bff75355134dce8b1 ****/
		%feature("compactdefaultargs") SetBottomRadius;
		%feature("autodoc", "/** * set the bottom radius */.

Parameters
----------
theRadius: float

Returns
-------
None
") SetBottomRadius;
		void SetBottomRadius(const Standard_Real theRadius);

		/****************** SetFaces ******************/
		/**** md5 signature: fbbd4f6837038f188c4b930de01bc1a8 ****/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "/** * set which faces are included */.

Parameters
----------
hasBottom: bool
hasSide: bool

Returns
-------
None
") SetFaces;
		void SetFaces(const Standard_Boolean hasBottom, const Standard_Boolean hasSide);

		/****************** SetHeight ******************/
		/**** md5 signature: 390c55787a7bcabd97d84df43b58e6f5 ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "/** * set the height */.

Parameters
----------
theHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real theHeight);

		/****************** TShape ******************/
		/**** md5 signature: 93fab9efcf27c195565c5eda2f729711 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Coordinate ******************/
		/**** md5 signature: 1bbdc4faa9d29da5f1fe7f37662fcb9b ****/
		%feature("compactdefaultargs") VrmlData_Coordinate;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Coordinate;
		 VrmlData_Coordinate();

		/****************** VrmlData_Coordinate ******************/
		/**** md5 signature: 001c403814378e9a41212a101b7087de ****/
		%feature("compactdefaultargs") VrmlData_Coordinate;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
nPoints: size_t,optional
	default value is 0
arrPoints: gp_XYZ *,optional
	default value is 0L

Returns
-------
None
") VrmlData_Coordinate;
		 VrmlData_Coordinate(const VrmlData_Scene & theScene, const char * theName, const size_t nPoints = 0, const gp_XYZ * arrPoints = 0L);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Coordinate ******************/
		/**** md5 signature: 9d6eea96681e77a109b87318977e507a ****/
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "/** * query one point * @param i * index in the array of points [0 .. n-1] * returns * the coordinate for the index. if index irrelevant, returns (0., 0., 0.) */.

Parameters
----------
i: int

Returns
-------
gp_XYZ
") Coordinate;
		const gp_XYZ Coordinate(const Standard_Integer i);

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to the scene output. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Cylinder ******************/
		/**** md5 signature: 898b22af591489d021496ce1afc5b5a2 ****/
		%feature("compactdefaultargs") VrmlData_Cylinder;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Cylinder;
		 VrmlData_Cylinder();

		/****************** VrmlData_Cylinder ******************/
		/**** md5 signature: 0f20848858e3daf2c32cecd2fcbdcf84 ****/
		%feature("compactdefaultargs") VrmlData_Cylinder;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
theRadius: float,optional
	default value is 1
theHeight: float,optional
	default value is 2

Returns
-------
None
") VrmlData_Cylinder;
		 VrmlData_Cylinder(const VrmlData_Scene & theScene, const char * theName, const Standard_Real theRadius = 1, const Standard_Real theHeight = 2);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** HasBottom ******************/
		/**** md5 signature: 25e14da0c2fbc11e5f9af7b96668446c ****/
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "/** * query if the bottom circle is included */.

Returns
-------
bool
") HasBottom;
		Standard_Boolean HasBottom();

		/****************** HasSide ******************/
		/**** md5 signature: c8a7940100871f9d13e6d4209710b8f2 ****/
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "/** * query if the side surface is included */.

Returns
-------
bool
") HasSide;
		Standard_Boolean HasSide();

		/****************** HasTop ******************/
		/**** md5 signature: 2b763f765f4d0a768b40c60677894ed9 ****/
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "/** * query if the top surface is included */.

Returns
-------
bool
") HasTop;
		Standard_Boolean HasTop();

		/****************** Height ******************/
		/**** md5 signature: ead56356911f8df313dceca6929dde18 ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "/** * query the height */.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Radius ******************/
		/**** md5 signature: b6bde1f02875769e3b96869e2c7c3dfd ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "/** * query the radius */.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * fill the node internal data from the given input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetFaces ******************/
		/**** md5 signature: 36e2e2be558fc8fe9ad04c399b820395 ****/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "/** * set which faces are included */.

Parameters
----------
hasBottom: bool
hasSide: bool
hasTop: bool

Returns
-------
None
") SetFaces;
		void SetFaces(const Standard_Boolean hasBottom, const Standard_Boolean hasSide, const Standard_Boolean hasTop);

		/****************** SetHeight ******************/
		/**** md5 signature: 390c55787a7bcabd97d84df43b58e6f5 ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "/** * set the height */.

Parameters
----------
theHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real theHeight);

		/****************** SetRadius ******************/
		/**** md5 signature: 088308acb04b143d2b529239c413a089 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "/** * set the radius */.

Parameters
----------
theRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real theRadius);

		/****************** TShape ******************/
		/**** md5 signature: 93fab9efcf27c195565c5eda2f729711 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_ImageTexture ******************/
		/**** md5 signature: 53e75a67acab7db4ffbdb655f2fd4db4 ****/
		%feature("compactdefaultargs") VrmlData_ImageTexture;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_ImageTexture;
		 VrmlData_ImageTexture();

		/****************** VrmlData_ImageTexture ******************/
		/**** md5 signature: 1306437286f22423cda70151366d3429 ****/
		%feature("compactdefaultargs") VrmlData_ImageTexture;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
theURL: char *,optional
	default value is 0L
theRepS: bool,optional
	default value is Standard_False
theRepT: bool,optional
	default value is Standard_False

Returns
-------
None
") VrmlData_ImageTexture;
		 VrmlData_ImageTexture(const VrmlData_Scene & theScene, const char * theName, const char * theURL = 0L, const Standard_Boolean theRepS = Standard_False, const Standard_Boolean theRepT = Standard_False);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** URL ******************/
		/**** md5 signature: b69bf89decd854d8adc42703c3682ea2 ****/
		%feature("compactdefaultargs") URL;
		%feature("autodoc", "/** * query the associated url. */.

Returns
-------
NCollection_List<TCollection_AsciiString>
") URL;
		const NCollection_List<TCollection_AsciiString> & URL();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_IndexedLineSet ******************/
		/**** md5 signature: 8a125211d4aec3ce066e097fb2ae890d ****/
		%feature("compactdefaultargs") VrmlData_IndexedLineSet;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_IndexedLineSet;
		 VrmlData_IndexedLineSet();

		/****************** VrmlData_IndexedLineSet ******************/
		/**** md5 signature: 44bf6d254fffdb07c24a262da3d9b76e ****/
		%feature("compactdefaultargs") VrmlData_IndexedLineSet;
		%feature("autodoc", "/** * constructor. */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
isColorPerVertex: bool,optional
	default value is Standard_True

Returns
-------
None
") VrmlData_IndexedLineSet;
		 VrmlData_IndexedLineSet(const VrmlData_Scene & theScene, const char * theName, const Standard_Boolean isColorPerVertex = Standard_True);

		/****************** ArrayColorInd ******************/
		/**** md5 signature: c4909a4558d3167469a33463503c9345 ****/
		%feature("compactdefaultargs") ArrayColorInd;
		%feature("autodoc", "/** * query the array of color indice * @param arrcolorind * <tt>[out]</tt> array of colorindex as it is described in vrml2.0 spec * returns * number of integers in the array arrcolorind. */.

Parameters
----------
arrColorInd: int * *

Returns
-------
size_t
") ArrayColorInd;
		size_t ArrayColorInd(const Standard_Integer * * & arrColorInd);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Colors ******************/
		/**** md5 signature: 5b4d455a40cc08c0769667c66599bf33 ****/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "/** * query the colors. */.

Returns
-------
opencascade::handle<VrmlData_Color>
") Colors;
		const opencascade::handle<VrmlData_Color> & Colors();

		/****************** Coordinates ******************/
		/**** md5 signature: dff615ecf03f4916071d4af06ba569bd ****/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "/** * query the coordinates. */.

Returns
-------
opencascade::handle<VrmlData_Coordinate>
") Coordinates;
		const opencascade::handle<VrmlData_Coordinate> & Coordinates();

		/****************** GetColor ******************/
		/**** md5 signature: a020b9dcebdd30dfa4aee7144dc3e7a6 ****/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "/** * query a color for one node in the given element. the color is * interpreted according to fields mycolors, myarrcolorind, * mycolorpervertex, as defined in vrml 2.0. * @param iface * rank of the polygon [0 .. n-1] * @param ivertex * rank of the vertex in the polygon [0 .. m-1]. this parameter is ignored * if (mycolorpervertex == false) * returns * color value (rgb); if the color is indefinite then returns (0., 0., 0.) */.

Parameters
----------
iFace: int
iVertex: int

Returns
-------
Quantity_Color
") GetColor;
		Quantity_Color GetColor(const Standard_Integer iFace, const Standard_Integer iVertex);

		/****************** IsDefault ******************/
		/**** md5 signature: 4ff647a3408e78788bd7a6b5e61c46ed ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Polygon ******************/
		/**** md5 signature: a115c67bc0e3a7674096a0b7bece1f07 ****/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "/** * query one polygon. * @param ipolygon * rank of the polygon [0 .. n-1] * @param outindice * <tt>[out]</tt> array of vertex indice * returns * number of vertice in the polygon - the dimension of outindice array */.

Parameters
----------
iPolygon: int
outIndice: int *

Returns
-------
int
") Polygon;
		Standard_Integer Polygon(const Standard_Integer iPolygon, const Standard_Integer * & outIndice);

		/****************** Polygons ******************/
		/**** md5 signature: e6bcceeaaf838ffe8cef407d5f7d5a45 ****/
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "/** * query the array of polygons */.

Parameters
----------
arrPolygons: int * *

Returns
-------
size_t
") Polygons;
		size_t Polygons(const Standard_Integer * * & arrPolygons);

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetColorInd ******************/
		/**** md5 signature: a8b546e53cea49d49c61298bbbcd6fe0 ****/
		%feature("compactdefaultargs") SetColorInd;
		%feature("autodoc", "/** * set the colors array of indice */.

Parameters
----------
nIndice: Standard_Size
theIndice: int * *

Returns
-------
None
") SetColorInd;
		void SetColorInd(const Standard_Size nIndice, const Standard_Integer * * theIndice);

		/****************** SetColorPerVertex ******************/
		/**** md5 signature: fa366f870d7e3f62742a025e7f4090bb ****/
		%feature("compactdefaultargs") SetColorPerVertex;
		%feature("autodoc", "/** * set the boolean value 'colorpervertex' */.

Parameters
----------
isColorPerVertex: bool

Returns
-------
None
") SetColorPerVertex;
		void SetColorPerVertex(const Standard_Boolean isColorPerVertex);

		/****************** SetColors ******************/
		/**** md5 signature: da46e6673528d4cedf179f062bf01e72 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "/** * set the color node */.

Parameters
----------
theColors: VrmlData_Color

Returns
-------
None
") SetColors;
		void SetColors(const opencascade::handle<VrmlData_Color> & theColors);

		/****************** SetCoordinates ******************/
		/**** md5 signature: bf51adc127a7b2dd3219a99e2901a3c6 ****/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "/** * set the nodes */.

Parameters
----------
theCoord: VrmlData_Coordinate

Returns
-------
None
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<VrmlData_Coordinate> & theCoord);

		/****************** SetPolygons ******************/
		/**** md5 signature: 02125773a51a65ded3e1f69ef3940628 ****/
		%feature("compactdefaultargs") SetPolygons;
		%feature("autodoc", "/** * set the polygons */.

Parameters
----------
nPolygons: Standard_Size
thePolygons: int * *

Returns
-------
None
") SetPolygons;
		void SetPolygons(const Standard_Size nPolygons, const Standard_Integer * * thePolygons);

		/****************** TShape ******************/
		/**** md5 signature: 93fab9efcf27c195565c5eda2f729711 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the shape. this method checks the flag myismodified; if true it * should rebuild the shape presentation. */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Normal ******************/
		/**** md5 signature: a0870e0802e497490081d50051601672 ****/
		%feature("compactdefaultargs") VrmlData_Normal;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Normal;
		 VrmlData_Normal();

		/****************** VrmlData_Normal ******************/
		/**** md5 signature: 9859a50d88d9a4dd95d188b484ca1648 ****/
		%feature("compactdefaultargs") VrmlData_Normal;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
nVec: size_t,optional
	default value is 0
arrVec: gp_XYZ *,optional
	default value is 0L

Returns
-------
None
") VrmlData_Normal;
		 VrmlData_Normal(const VrmlData_Scene & theScene, const char * theName, const size_t nVec = 0, const gp_XYZ * arrVec = 0L);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Normal ******************/
		/**** md5 signature: 4b640cc49ffa8b6ca7801e2851dc585b ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "/** * query one normal * @param i * index in the array of normals [0 .. n-1] * returns * the normal value for the index. if index irrelevant, returns (0., 0., 0.) */.

Parameters
----------
i: int

Returns
-------
gp_XYZ
") Normal;
		const gp_XYZ Normal(const Standard_Integer i);

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to the scene output. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_Sphere ******************/
		/**** md5 signature: 16f1b145583f7c046eeb8523af246c61 ****/
		%feature("compactdefaultargs") VrmlData_Sphere;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Sphere;
		 VrmlData_Sphere();

		/****************** VrmlData_Sphere ******************/
		/**** md5 signature: e2324ed361c04f299e2a4aed36bc432f ****/
		%feature("compactdefaultargs") VrmlData_Sphere;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
theRadius: float,optional
	default value is 1

Returns
-------
None
") VrmlData_Sphere;
		 VrmlData_Sphere(const VrmlData_Scene & theScene, const char * theName, const Standard_Real theRadius = 1);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Radius ******************/
		/**** md5 signature: b6bde1f02875769e3b96869e2c7c3dfd ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "/** * query the sphere radius */.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * fill the node internal data from the given input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetRadius ******************/
		/**** md5 signature: 088308acb04b143d2b529239c413a089 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "/** * set the spere radius */.

Parameters
----------
theRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real theRadius);

		/****************** TShape ******************/
		/**** md5 signature: 93fab9efcf27c195565c5eda2f729711 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
		/****************** VrmlData_IndexedFaceSet ******************/
		/**** md5 signature: 56865c96be521fd297fcf6647ded2447 ****/
		%feature("compactdefaultargs") VrmlData_IndexedFaceSet;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_IndexedFaceSet;
		 VrmlData_IndexedFaceSet();

		/****************** VrmlData_IndexedFaceSet ******************/
		/**** md5 signature: c5db453c541790928e632d73a04d887c ****/
		%feature("compactdefaultargs") VrmlData_IndexedFaceSet;
		%feature("autodoc", "/** * constructor */.

Parameters
----------
theScene: VrmlData_Scene
theName: char *
isCCW: bool,optional
	default value is Standard_True
isSolid: bool,optional
	default value is Standard_True
isConvex: bool,optional
	default value is Standard_True
theCreaseAngle: float,optional
	default value is 0

Returns
-------
None
") VrmlData_IndexedFaceSet;
		 VrmlData_IndexedFaceSet(const VrmlData_Scene & theScene, const char * theName, const Standard_Boolean isCCW = Standard_True, const Standard_Boolean isSolid = Standard_True, const Standard_Boolean isConvex = Standard_True, const Standard_Real theCreaseAngle = 0);

		/****************** ArrayColorInd ******************/
		/**** md5 signature: c4909a4558d3167469a33463503c9345 ****/
		%feature("compactdefaultargs") ArrayColorInd;
		%feature("autodoc", "/** * query the array of color indice * @param arrcolorind * <tt>[out]</tt> array of colorindex as it is described in vrml2.0 spec * returns * number of integers in the array arrcolorind. */.

Parameters
----------
arrColorInd: int * *

Returns
-------
size_t
") ArrayColorInd;
		size_t ArrayColorInd(const Standard_Integer * * & arrColorInd);

		/****************** ArrayNormalInd ******************/
		/**** md5 signature: 26ef190401d0d586c7669e26de222f05 ****/
		%feature("compactdefaultargs") ArrayNormalInd;
		%feature("autodoc", "/** * query the array of normal indice * @param arrnormalind * <tt>[out]</tt> array of normalindex as it is described in vrml2.0 spec * returns * number of integers in the array arrnormalind. */.

Parameters
----------
arrNormalInd: int * *

Returns
-------
size_t
") ArrayNormalInd;
		size_t ArrayNormalInd(const Standard_Integer * * & arrNormalInd);

		/****************** ArrayTextureCoordInd ******************/
		/**** md5 signature: 9cc0663e62ce2eac26a965741dad6949 ****/
		%feature("compactdefaultargs") ArrayTextureCoordInd;
		%feature("autodoc", "/** * query the array of texture coordinate indice * @param arrtexturecoordind * <tt>[out]</tt> array of texcoordindex as it is described in vrml2.0 spec * returns * number of integers in the array texcoordindex. */.

Parameters
----------
arrTextureCoordInd: int * *

Returns
-------
size_t
") ArrayTextureCoordInd;
		size_t ArrayTextureCoordInd(const Standard_Integer * * & arrTextureCoordInd);

		/****************** Clone ******************/
		/**** md5 signature: 95e2aeff203be5b6c751a82b7c3b80f7 ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "/** * create a copy of this node. * if the parameter is null, a new copied node is created. otherwise new node * is not created, but rather the given one is modified. */.

Parameters
----------
theOther: VrmlData_Node

Returns
-------
opencascade::handle<VrmlData_Node>
") Clone;
		virtual opencascade::handle<VrmlData_Node> Clone(const opencascade::handle<VrmlData_Node> & theOther);

		/****************** Colors ******************/
		/**** md5 signature: 5b4d455a40cc08c0769667c66599bf33 ****/
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "/** * query the colors. */.

Returns
-------
opencascade::handle<VrmlData_Color>
") Colors;
		const opencascade::handle<VrmlData_Color> & Colors();

		/****************** Coordinates ******************/
		/**** md5 signature: dff615ecf03f4916071d4af06ba569bd ****/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "/** * query the coordinates. */.

Returns
-------
opencascade::handle<VrmlData_Coordinate>
") Coordinates;
		const opencascade::handle<VrmlData_Coordinate> & Coordinates();

		/****************** GetColor ******************/
		/**** md5 signature: a020b9dcebdd30dfa4aee7144dc3e7a6 ****/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "/** * query a color for one node in the given element. the color is * interpreted according to fields mycolors, myarrcolorind, * mycolorpervertex, as defined in vrml 2.0. * @param iface * rank of the polygon [0 .. n-1] * @param ivertex * rank of the vertex in the polygon [0 .. m-1]. this parameter is ignored * if (mycolorpervertex == false) * returns * color value (rgb); if the color is indefinite then returns (0., 0., 0.) */.

Parameters
----------
iFace: int
iVertex: int

Returns
-------
Quantity_Color
") GetColor;
		Quantity_Color GetColor(const Standard_Integer iFace, const Standard_Integer iVertex);

		/****************** IndiceNormals ******************/
		/**** md5 signature: 04c8a7ae5b8b222d814358fa76706ba8 ****/
		%feature("compactdefaultargs") IndiceNormals;
		%feature("autodoc", "/** * query normals indice for one face. this method should be called after * checking myarrnormalind != null, otherwise exception will be thrown. * @param iface * rank of the face [0 .. n-1] * @param outindice * <tt>[out]</tt> array of normals indice * returns * number of indice in the array - the dimension of outindice array */.

Parameters
----------
iFace: int
outIndice: int *

Returns
-------
int
") IndiceNormals;
		Standard_Integer IndiceNormals(const Standard_Integer iFace, const Standard_Integer * & outIndice);

		/****************** IsDefault ******************/
		/**** md5 signature: 4ff647a3408e78788bd7a6b5e61c46ed ****/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Normals ******************/
		/**** md5 signature: 61ca5f53b490c0bf3f6e489c3df1d2e4 ****/
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "/** * query the normals. */.

Returns
-------
opencascade::handle<VrmlData_Normal>
") Normals;
		const opencascade::handle<VrmlData_Normal> & Normals();

		/****************** Polygon ******************/
		/**** md5 signature: d000b486c964dc6e7dd3c8ce3800da79 ****/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "/** * query one polygon. * @param iface * rank of the polygon [0 .. n-1] * @param outindice * <tt>[out]</tt> array of vertex indice * returns * number of vertice in the polygon - the dimension of outindice array */.

Parameters
----------
iFace: int
outIndice: int *

Returns
-------
int
") Polygon;
		Standard_Integer Polygon(const Standard_Integer iFace, const Standard_Integer * & outIndice);

		/****************** Polygons ******************/
		/**** md5 signature: e6bcceeaaf838ffe8cef407d5f7d5a45 ****/
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "/** * query the array of polygons */.

Parameters
----------
arrPolygons: int * *

Returns
-------
size_t
") Polygons;
		size_t Polygons(const Standard_Integer * * & arrPolygons);

		/****************** Read ******************/
		/**** md5 signature: 43d452e1523643764ed0a3ed08e10595 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "/** * read the node from input stream. */.

Parameters
----------
theBuffer: VrmlData_InBuffer

Returns
-------
VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read(VrmlData_InBuffer & theBuffer);

		/****************** SetColorInd ******************/
		/**** md5 signature: a8b546e53cea49d49c61298bbbcd6fe0 ****/
		%feature("compactdefaultargs") SetColorInd;
		%feature("autodoc", "/** * set the colors array of indice */.

Parameters
----------
nIndice: Standard_Size
theIndice: int * *

Returns
-------
None
") SetColorInd;
		void SetColorInd(const Standard_Size nIndice, const Standard_Integer * * theIndice);

		/****************** SetColorPerVertex ******************/
		/**** md5 signature: fa366f870d7e3f62742a025e7f4090bb ****/
		%feature("compactdefaultargs") SetColorPerVertex;
		%feature("autodoc", "/** * set the boolean value 'colorpervertex' */.

Parameters
----------
isColorPerVertex: bool

Returns
-------
None
") SetColorPerVertex;
		void SetColorPerVertex(const Standard_Boolean isColorPerVertex);

		/****************** SetColors ******************/
		/**** md5 signature: da46e6673528d4cedf179f062bf01e72 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "/** * set the color node */.

Parameters
----------
theColors: VrmlData_Color

Returns
-------
None
") SetColors;
		void SetColors(const opencascade::handle<VrmlData_Color> & theColors);

		/****************** SetCoordinates ******************/
		/**** md5 signature: bf51adc127a7b2dd3219a99e2901a3c6 ****/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "/** * set the nodes */.

Parameters
----------
theCoord: VrmlData_Coordinate

Returns
-------
None
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<VrmlData_Coordinate> & theCoord);

		/****************** SetNormalInd ******************/
		/**** md5 signature: dea75969424aff27642ede98896a91a4 ****/
		%feature("compactdefaultargs") SetNormalInd;
		%feature("autodoc", "/** * set the normals array of indice */.

Parameters
----------
nIndice: Standard_Size
theIndice: int * *

Returns
-------
None
") SetNormalInd;
		void SetNormalInd(const Standard_Size nIndice, const Standard_Integer * * theIndice);

		/****************** SetNormalPerVertex ******************/
		/**** md5 signature: 1662498d2415121aba88aab86fcd4e7d ****/
		%feature("compactdefaultargs") SetNormalPerVertex;
		%feature("autodoc", "/** * set the boolean value 'normalpervertex' */.

Parameters
----------
isNormalPerVertex: bool

Returns
-------
None
") SetNormalPerVertex;
		void SetNormalPerVertex(const Standard_Boolean isNormalPerVertex);

		/****************** SetNormals ******************/
		/**** md5 signature: e32729d2e2c119c2bf7bcd986503d323 ****/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "/** * set the normals node */.

Parameters
----------
theNormals: VrmlData_Normal

Returns
-------
None
") SetNormals;
		void SetNormals(const opencascade::handle<VrmlData_Normal> & theNormals);

		/****************** SetPolygons ******************/
		/**** md5 signature: 02125773a51a65ded3e1f69ef3940628 ****/
		%feature("compactdefaultargs") SetPolygons;
		%feature("autodoc", "/** * set the polygons */.

Parameters
----------
nPolygons: Standard_Size
thePolygons: int * *

Returns
-------
None
") SetPolygons;
		void SetPolygons(const Standard_Size nPolygons, const Standard_Integer * * thePolygons);

		/****************** SetTextureCoordInd ******************/
		/**** md5 signature: 5f7330587b3f6dbea88698c7bb47199f ****/
		%feature("compactdefaultargs") SetTextureCoordInd;
		%feature("autodoc", "/** * set the texcoordiante array of indice */.

Parameters
----------
nIndice: Standard_Size
theIndice: int * *

Returns
-------
None
") SetTextureCoordInd;
		void SetTextureCoordInd(const Standard_Size nIndice, const Standard_Integer * * theIndice);

		/****************** SetTextureCoords ******************/
		/**** md5 signature: 176293ee2ebe8f4fe8657ef1a99f7e1a ****/
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "/** * set the texture coordinate node */.

Parameters
----------
tc: VrmlData_TextureCoordinate

Returns
-------
None
") SetTextureCoords;
		void SetTextureCoords(const opencascade::handle<VrmlData_TextureCoordinate> & tc);

		/****************** TShape ******************/
		/**** md5 signature: 93fab9efcf27c195565c5eda2f729711 ****/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the shape. this method checks the flag myismodified; if true it * should rebuild the shape presentation. */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** TextureCoords ******************/
		/**** md5 signature: 1fff99428932e6cfae23edbe9e4d214b ****/
		%feature("compactdefaultargs") TextureCoords;
		%feature("autodoc", "/** * query the texture coordinates. */.

Returns
-------
opencascade::handle<VrmlData_TextureCoordinate>
") TextureCoords;
		const opencascade::handle<VrmlData_TextureCoordinate> & TextureCoords();

		/****************** Write ******************/
		/**** md5 signature: 1c9d5b990d872d184760c29e6d2e1492 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "/** * write the node to output stream. */.

Parameters
----------
thePrefix: char *

Returns
-------
VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write(const char * thePrefix);

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
