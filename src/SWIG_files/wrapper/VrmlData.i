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

class VrmlData_ErrorStatus:
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
		%feature("compactdefaultargs") GlobalIndent;
		%feature("autodoc", "No available documentation.

Returns
-------
inline int
") GlobalIndent;
		static inline Standard_Integer GlobalIndent();

		/****************** IsDefault ******************/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, then it would not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "/** * query the name */.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** OK ******************/
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
		%feature("compactdefaultargs") Scene;
		%feature("autodoc", "/** * query the scene that contains this node */.

Returns
-------
VrmlData_Scene
") Scene;
		const VrmlData_Scene & Scene();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") GetIterator;
		%feature("autodoc", "/** * iterator of nodes */.

Returns
-------
Iterator
") GetIterator;
		Iterator GetIterator();

		/****************** GetLineError ******************/
		%feature("compactdefaultargs") GetLineError;
		%feature("autodoc", "/** * query the line where the error occurred (if the status is not ok) */.

Returns
-------
int
") GetLineError;
		Standard_Integer GetLineError();

		/****************** GetShape ******************/
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
		%feature("compactdefaultargs") IsDummyWrite;
		%feature("autodoc", "/** * query if the current write operation is dummy, i.e., for the purpose of * collecting information before the real write is commenced. */.

Returns
-------
bool
") IsDummyWrite;
		Standard_Boolean IsDummyWrite();

		/****************** NamedNodesIterator ******************/
		%feature("compactdefaultargs") NamedNodesIterator;
		%feature("autodoc", "/** * get the iterator of named nodes. */.

Returns
-------
VrmlData_MapOfNode::Iterator
") NamedNodesIterator;
		VrmlData_MapOfNode::Iterator NamedNodesIterator();

		/****************** ReadArrIndex ******************/
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
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "/** * query the status of the previous operation. * normally it should be equal to vrmldata_statusok (no error). */.

Returns
-------
VrmlData_ErrorStatus
") Status;
		VrmlData_ErrorStatus Status();

		/****************** VrmlDirIterator ******************/
		%feature("compactdefaultargs") VrmlDirIterator;
		%feature("autodoc", "/** * returns the directory iterator, to check the presence of requested vrml * file in each iterated directory. */.

Returns
-------
NCollection_List<TCollection_ExtendedString >::Iterator
") VrmlDirIterator;
		NCollection_List<TCollection_ExtendedString >::Iterator VrmlDirIterator();

		/****************** WorldInfo ******************/
		%feature("compactdefaultargs") WorldInfo;
		%feature("autodoc", "/** * query the worldinfo member. */.

Returns
-------
opencascade::handle<VrmlData_WorldInfo>
") WorldInfo;
		const opencascade::handle<VrmlData_WorldInfo> & WorldInfo();

		/****************** WriteArrIndex ******************/
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
		%feature("compactdefaultargs") VrmlData_Appearance;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Appearance;
		 VrmlData_Appearance();

		/****************** VrmlData_Appearance ******************/
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
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "/** * query the material */.

Returns
-------
opencascade::handle<VrmlData_Material>
") Material;
		const opencascade::handle<VrmlData_Material> & Material();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") Texture;
		%feature("autodoc", "/** * query the texture */.

Returns
-------
opencascade::handle<VrmlData_Texture>
") Texture;
		const opencascade::handle<VrmlData_Texture> & Texture();

		/****************** TextureTransform ******************/
		%feature("compactdefaultargs") TextureTransform;
		%feature("autodoc", "/** * query the texturetransform */.

Returns
-------
opencascade::handle<VrmlData_TextureTransform>
") TextureTransform;
		const opencascade::handle<VrmlData_TextureTransform> & TextureTransform();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "/** * query the bounding box. */.

Returns
-------
Bnd_B3f
") Box;
		const Bnd_B3f & Box();

		/****************** Clone ******************/
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
		%feature("compactdefaultargs") GetTransform;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") GetTransform;
		const gp_Trsf GetTransform();

		/****************** IsTransform ******************/
		%feature("compactdefaultargs") IsTransform;
		%feature("autodoc", "/** * query if the node is transform type. */.

Returns
-------
bool
") IsTransform;
		Standard_Boolean IsTransform();

		/****************** NodeIterator ******************/
		%feature("compactdefaultargs") NodeIterator;
		%feature("autodoc", "/** * create iterator on nodes belonging to the group. */.

Returns
-------
Iterator
") NodeIterator;
		Iterator NodeIterator();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") VrmlData_Material;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Material;
		 VrmlData_Material();

		/****************** VrmlData_Material ******************/
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
		%feature("compactdefaultargs") AmbientIntensity;
		%feature("autodoc", "/** * query the ambient intensity value */.

Returns
-------
float
") AmbientIntensity;
		Standard_Real AmbientIntensity();

		/****************** Clone ******************/
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
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "/** * query the diffuse color */.

Returns
-------
Quantity_Color
") DiffuseColor;
		const Quantity_Color & DiffuseColor();

		/****************** EmissiveColor ******************/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "/** * query the emissive color */.

Returns
-------
Quantity_Color
") EmissiveColor;
		const Quantity_Color & EmissiveColor();

		/****************** IsDefault ******************/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "/** * query the shininess value */.

Returns
-------
float
") Shininess;
		Standard_Real Shininess();

		/****************** SpecularColor ******************/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "/** * query the specular color */.

Returns
-------
Quantity_Color
") SpecularColor;
		const Quantity_Color & SpecularColor();

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "/** * query the transparency value */.

Returns
-------
float
") Transparency;
		Standard_Real Transparency();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_ShapeNode;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_ShapeNode;
		 VrmlData_ShapeNode();

		/****************** VrmlData_ShapeNode ******************/
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
		%feature("compactdefaultargs") Appearance;
		%feature("autodoc", "/** * query the appearance. */.

Returns
-------
opencascade::handle<VrmlData_Appearance>
") Appearance;
		const opencascade::handle<VrmlData_Appearance> & Appearance();

		/****************** Clone ******************/
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
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "/** * query the geometry. */.

Returns
-------
opencascade::handle<VrmlData_Geometry>
") Geometry;
		const opencascade::handle<VrmlData_Geometry> & Geometry();

		/****************** IsDefault ******************/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * check if the shape node is writeable. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") VrmlData_TextureCoordinate;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_TextureCoordinate;
		 VrmlData_TextureCoordinate();

		/****************** VrmlData_TextureCoordinate ******************/
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
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "/** * query the number of points */.

Returns
-------
size_t
") Length;
		size_t Length();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "/** * query the points */.

Returns
-------
gp_XY *
") Points;
		const gp_XY * Points();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") VrmlData_UnknownNode;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_UnknownNode;
		 VrmlData_UnknownNode();

		/****************** VrmlData_UnknownNode ******************/
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
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "/** * query the title of the unknown node. */.

Returns
-------
TCollection_AsciiString
") GetTitle;
		const TCollection_AsciiString & GetTitle();

		/****************** IsDefault ******************/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * check if the node is non-writeable -- always returns true. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") VrmlData_WorldInfo;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_WorldInfo;
		 VrmlData_WorldInfo();

		/****************** VrmlData_WorldInfo ******************/
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
		%feature("compactdefaultargs") InfoIterator;
		%feature("autodoc", "/** * return the iterator of info strings. */.

Returns
-------
NCollection_List< char * >::Iterator
") InfoIterator;
		NCollection_List<const char * >::Iterator InfoIterator();

		/****************** IsDefault ******************/
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, then it would not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") Title;
		%feature("autodoc", "/** * query the title string. */.

Returns
-------
char *
") Title;
		const char * Title();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_Box;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Box;
		 VrmlData_Box();

		/****************** VrmlData_Box ******************/
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
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "/** * query the box size */.

Returns
-------
gp_XYZ
") Size;
		const gp_XYZ Size();

		/****************** TShape ******************/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_Color;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_Color;
		 VrmlData_Color();

		/****************** VrmlData_Color ******************/
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
		%feature("compactdefaultargs") VrmlData_Cone;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Cone;
		 VrmlData_Cone();

		/****************** VrmlData_Cone ******************/
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
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "/** * query the bottom radius */.

Returns
-------
float
") BottomRadius;
		Standard_Real BottomRadius();

		/****************** Clone ******************/
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
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "/** * query if the bottom circle is included */.

Returns
-------
bool
") HasBottom;
		Standard_Boolean HasBottom();

		/****************** HasSide ******************/
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "/** * query if the side surface is included */.

Returns
-------
bool
") HasSide;
		Standard_Boolean HasSide();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "/** * query the height */.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_Coordinate;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Coordinate;
		 VrmlData_Coordinate();

		/****************** VrmlData_Coordinate ******************/
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
		%feature("compactdefaultargs") VrmlData_Cylinder;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Cylinder;
		 VrmlData_Cylinder();

		/****************** VrmlData_Cylinder ******************/
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
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "/** * query if the bottom circle is included */.

Returns
-------
bool
") HasBottom;
		Standard_Boolean HasBottom();

		/****************** HasSide ******************/
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "/** * query if the side surface is included */.

Returns
-------
bool
") HasSide;
		Standard_Boolean HasSide();

		/****************** HasTop ******************/
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "/** * query if the top surface is included */.

Returns
-------
bool
") HasTop;
		Standard_Boolean HasTop();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "/** * query the height */.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "/** * query the radius */.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_ImageTexture;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_ImageTexture;
		 VrmlData_ImageTexture();

		/****************** VrmlData_ImageTexture ******************/
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
		%feature("compactdefaultargs") URL;
		%feature("autodoc", "/** * query the associated url. */.

Returns
-------
NCollection_List<TCollection_AsciiString>
") URL;
		const NCollection_List<TCollection_AsciiString> & URL();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_IndexedLineSet;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") VrmlData_IndexedLineSet;
		 VrmlData_IndexedLineSet();

		/****************** VrmlData_IndexedLineSet ******************/
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
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "/** * query the colors. */.

Returns
-------
opencascade::handle<VrmlData_Color>
") Colors;
		const opencascade::handle<VrmlData_Color> & Colors();

		/****************** Coordinates ******************/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "/** * query the coordinates. */.

Returns
-------
opencascade::handle<VrmlData_Coordinate>
") Coordinates;
		const opencascade::handle<VrmlData_Coordinate> & Coordinates();

		/****************** GetColor ******************/
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
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Polygon ******************/
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
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the shape. this method checks the flag myismodified; if true it * should rebuild the shape presentation. */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_Normal;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Normal;
		 VrmlData_Normal();

		/****************** VrmlData_Normal ******************/
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
		%feature("compactdefaultargs") VrmlData_Sphere;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_Sphere;
		 VrmlData_Sphere();

		/****************** VrmlData_Sphere ******************/
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
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "/** * query the sphere radius */.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** Read ******************/
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
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the primitive topology. this method returns a null shape if there * is an internal error during the primitive creation (zero radius, etc.) */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") VrmlData_IndexedFaceSet;
		%feature("autodoc", "/** * empty constructor */.

Returns
-------
None
") VrmlData_IndexedFaceSet;
		 VrmlData_IndexedFaceSet();

		/****************** VrmlData_IndexedFaceSet ******************/
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
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "/** * query the colors. */.

Returns
-------
opencascade::handle<VrmlData_Color>
") Colors;
		const opencascade::handle<VrmlData_Color> & Colors();

		/****************** Coordinates ******************/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "/** * query the coordinates. */.

Returns
-------
opencascade::handle<VrmlData_Coordinate>
") Coordinates;
		const opencascade::handle<VrmlData_Coordinate> & Coordinates();

		/****************** GetColor ******************/
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
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "/** * returns true if the node is default, so that it should not be written. */.

Returns
-------
bool
") IsDefault;
		virtual Standard_Boolean IsDefault();

		/****************** Normals ******************/
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "/** * query the normals. */.

Returns
-------
opencascade::handle<VrmlData_Normal>
") Normals;
		const opencascade::handle<VrmlData_Normal> & Normals();

		/****************** Polygon ******************/
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
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "/** * query the shape. this method checks the flag myismodified; if true it * should rebuild the shape presentation. */.

Returns
-------
opencascade::handle<TopoDS_TShape>
") TShape;
		virtual const opencascade::handle<TopoDS_TShape> TShape();

		/****************** TextureCoords ******************/
		%feature("compactdefaultargs") TextureCoords;
		%feature("autodoc", "/** * query the texture coordinates. */.

Returns
-------
opencascade::handle<VrmlData_TextureCoordinate>
") TextureCoords;
		const opencascade::handle<VrmlData_TextureCoordinate> & TextureCoords();

		/****************** Write ******************/
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
