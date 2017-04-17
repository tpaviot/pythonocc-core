/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") VrmlData

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include VrmlData_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef NCollection_Map <Handle_VrmlData_Node> VrmlData_MapOfNode;
typedef NCollection_List <Handle_VrmlData_Node> VrmlData_ListOfNode;
/* end typedefs declaration */

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

%nodefaultctor VrmlData_Node;
class VrmlData_Node : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Scene;
		%feature("autodoc", "	* /** * Query the Scene that contains this Node */

	:rtype: inline  VrmlData_Scene
") Scene;
		inline const VrmlData_Scene & Scene ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* /** * Query the name */

	:rtype: inline  char *
") Name;
		inline const char * Name ();
		%feature("compactdefaultargs") ReadNode;
		%feature("autodoc", "	* /** * Read a complete node definition from VRML stream * @param theBuffer * Buffer receiving the input data. * @param theNode * <tt>[out]</tt> Node restored from the buffer data * @param Type * Node type to be checked. If it is NULL(default) no type checking is done. * Otherwise the created node is matched and an error is returned if * no match detected. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theNode:
	:type theNode: Handle_VrmlData_Node &
	:param Type: default value is NULL
	:type Type: Handle_Standard_Type &
	:rtype: VrmlData_ErrorStatus
") ReadNode;
		VrmlData_ErrorStatus ReadNode (VrmlData_InBuffer & theBuffer,Handle_VrmlData_Node & theNode,const Handle_Standard_Type & Type = NULL);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Returns True if the node is default, then it would not be written. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
		%feature("compactdefaultargs") WriteClosing;
		%feature("autodoc", "	* /** * Write the closing brace in the end of a node output. */

	:rtype: VrmlData_ErrorStatus
") WriteClosing;
		VrmlData_ErrorStatus WriteClosing ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified.<p> * This method nullifies the argument node if its member myScene differs * from that one of the current instance. */

	:param &:
	:type &: Handle_VrmlData_Node
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node &);
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "	* /** * Read one boolean value (True or False). */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theResult:
	:type theResult: bool
	:rtype: VrmlData_ErrorStatus
") ReadBoolean;
		static VrmlData_ErrorStatus ReadBoolean (VrmlData_InBuffer & theBuffer,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") ReadString;
		%feature("autodoc", "	* /** * Read one quoted string, the quotes are removed. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theRes:
	:type theRes: TCollection_AsciiString &
	:rtype: VrmlData_ErrorStatus
") ReadString;
		static VrmlData_ErrorStatus ReadString (VrmlData_InBuffer & theBuffer,TCollection_AsciiString & theRes);
		%feature("compactdefaultargs") ReadMultiString;
		%feature("autodoc", "	* /** * Read one quoted string, the quotes are removed. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theRes:
	:type theRes: NCollection_List<TCollection_AsciiString> &
	:rtype: VrmlData_ErrorStatus
") ReadMultiString;
		static VrmlData_ErrorStatus ReadMultiString (VrmlData_InBuffer & theBuffer,NCollection_List<TCollection_AsciiString> & theRes);
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "	* /** * Read one integer value. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theResult:
	:type theResult: long &
	:rtype: VrmlData_ErrorStatus
") ReadInteger;
		static VrmlData_ErrorStatus ReadInteger (VrmlData_InBuffer & theBuffer,long & theResult);
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "	:param theStat:
	:type theStat: VrmlData_ErrorStatus
	:rtype: inline bool
") OK;
		static inline Standard_Boolean OK (const VrmlData_ErrorStatus theStat);
		%feature("compactdefaultargs") OK;
		%feature("autodoc", "	:param outStat:
	:type outStat: VrmlData_ErrorStatus &
	:param theStat:
	:type theStat: VrmlData_ErrorStatus
	:rtype: inline bool
") OK;
		static inline Standard_Boolean OK (VrmlData_ErrorStatus & outStat,const VrmlData_ErrorStatus theStat);
		%feature("compactdefaultargs") GlobalIndent;
		%feature("autodoc", "	* /** * Define the common Indent in spaces, for writing all nodes. */

	:rtype: inline int
") GlobalIndent;
		static inline Standard_Integer GlobalIndent ();
};


%extend VrmlData_Node {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Node(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Node::Handle_VrmlData_Node %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Node;
class Handle_VrmlData_Node : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_VrmlData_Node();
        Handle_VrmlData_Node(const Handle_VrmlData_Node &aHandle);
        Handle_VrmlData_Node(const VrmlData_Node *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Node DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Node {
    VrmlData_Node* _get_reference() {
    return (VrmlData_Node*)$self->Access();
    }
};

%extend Handle_VrmlData_Node {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Scene;
class VrmlData_Scene {
	public:
typedef VrmlData_ListOfNode::Iterator Iterator;
		%feature("compactdefaultargs") VrmlData_Scene;
		%feature("autodoc", "	* /** * Constructor. */

	:param &: default value is 0L
	:type &: Handle_NCollection_IncAllocator
	:rtype: None
") VrmlData_Scene;
		 VrmlData_Scene (const Handle_NCollection_IncAllocator & = 0L);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* /** * Query the status of the previous operation. * Normally it should be equal to VrmlData_StatusOK (no error). */

	:rtype: inline VrmlData_ErrorStatus
") Status;
		inline VrmlData_ErrorStatus Status ();
		%feature("compactdefaultargs") SetVrmlDir;
		%feature("autodoc", "	* /** * Add the given directory path to the list of VRML file search directories. * This method forms the list of directories ordered according to the * sequence of this method calls. When an Inline node is found, the URLs * in that node are matched with these directories. * The last (implicit) search directory is the current process directory * ('.'). It takes effect if the list is empty or if there is no match with * exisiting directories. */

	:param &:
	:type &: TCollection_ExtendedString
	:rtype: None
") SetVrmlDir;
		void SetVrmlDir (const TCollection_ExtendedString &);
		%feature("compactdefaultargs") SetLinearScale;
		%feature("autodoc", "	* /** * Set the scale factor that would be further used in methods * ReadReal, ReadXYZ and ReadXY. All coordinates, distances and sized are * multiplied by this factor during reading the data. */

	:param theScale:
	:type theScale: float
	:rtype: inline void
") SetLinearScale;
		inline void SetLinearScale (const Standard_Real theScale);
		%feature("compactdefaultargs") VrmlDirIterator;
		%feature("autodoc", "	* /** * Returns the directory iterator, to check the presence of requested VRML * file in each iterated directory. */

	:rtype: inline NCollection_List<TCollection_ExtendedString>::Iterator
") VrmlDirIterator;
		inline NCollection_List<TCollection_ExtendedString>::Iterator VrmlDirIterator ();
		%feature("compactdefaultargs") GetIterator;
		%feature("autodoc", "	* /** * Iterator of Nodes */

	:rtype: inline Iterator
") GetIterator;
		inline Iterator GetIterator ();
		%feature("compactdefaultargs") NamedNodesIterator;
		%feature("autodoc", "	* /** * Get the iterator of named nodes. */

	:rtype: inline VrmlData_MapOfNode::Iterator
") NamedNodesIterator;
		inline VrmlData_MapOfNode::Iterator NamedNodesIterator ();
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "	* /** * Allocator used by all nodes contained in the Scene. */

	:rtype: inline  Handle_NCollection_IncAllocator
") Allocator;
		Handle_NCollection_IncAllocator Allocator ();
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	* /** * Add a Node. If theN belongs to another Scene, it is cloned. * <p>VrmlData_WorldInfo cannot be added, in this case the method * returns a NULL handle. */

	:param theN:
	:type theN: Handle_VrmlData_Node &
	:param isTopLevel: default value is Standard_True
	:type isTopLevel: bool
	:rtype: Handle_VrmlData_Node
") AddNode;
		Handle_VrmlData_Node AddNode (const Handle_VrmlData_Node & theN,const Standard_Boolean isTopLevel = Standard_True);
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "	* /** * Find a node by its name. * @param theName * Name of the node to find. * @param theType * Type to match. If this value is NULL, the first found node with the * given name is returned. If theType is given, only the node that has * that type is returned. */

	:param theName:
	:type theName: char *
	:param theType: default value is 0L
	:type theType: Handle_Standard_Type &
	:rtype: Handle_VrmlData_Node
") FindNode;
		Handle_VrmlData_Node FindNode (const char * theName,const Handle_Standard_Type & theType = 0L);
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "	* /** * Find a node by its name. * @param theName * Name of the node to search for. * @param theLocation * Location of the found node with respect to the whole VRML shape. */

	:param theName:
	:type theName: char *
	:param theLocation:
	:type theLocation: gp_Trsf
	:rtype: Handle_VrmlData_Node
") FindNode;
		Handle_VrmlData_Node FindNode (const char * theName,gp_Trsf & theLocation);
		%feature("compactdefaultargs") operator TopoDS_Shape;
		%feature("autodoc", "	* /** * Convert the scene to a Shape. */

	:rtype: 
") operator TopoDS_Shape;
		 operator TopoDS_Shape ();
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	* /** * Convert the scene to a Shape, with the information on materials defined * for each sub-shape. This method should be used instead of TopoDS_Shape * explicit conversion operator when you need to retrieve the material * aspect for each face or edge in the returned topological object. * @param M * Data Map that binds an Appearance instance to each created TFace or * TEdge if the Appearance node is defined in VRML scene for that geometry. * returns * TopoDS_Shape (Compound) holding all the scene, similar to the result of * explicit TopoDS_Shape conversion operator. */

	:param M:
	:type M: VrmlData_DataMapOfShapeAppearance &
	:rtype: TopoDS_Shape
") GetShape;
		TopoDS_Shape GetShape (VrmlData_DataMapOfShapeAppearance & M);
		%feature("compactdefaultargs") WorldInfo;
		%feature("autodoc", "	* /** * Query the WorldInfo member. */

	:rtype: Handle_VrmlData_WorldInfo
") WorldInfo;
		Handle_VrmlData_WorldInfo WorldInfo ();
		%feature("compactdefaultargs") ReadLine;
		%feature("autodoc", "	* /** * Read a VRML line. Empty lines and comments are skipped. * The processing starts here from theBuffer.LinePtr; if there is at least * one non-empty character (neither space nor comment), this line is used * without reading the next one. * @param theLine * Buffer receiving the input line * @param theInput * Input stream * @param theLen * Length of the input buffer (maximal line length) */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") ReadLine;
		static VrmlData_ErrorStatus ReadLine (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") ReadWord;
		%feature("autodoc", "	* /** * Read a singel word from the input stream, delimited by whitespace. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theStr:
	:type theStr: TCollection_AsciiString &
	:rtype: VrmlData_ErrorStatus
") ReadWord;
		static VrmlData_ErrorStatus ReadWord (VrmlData_InBuffer & theBuffer,TCollection_AsciiString & theStr);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "	* /** * Read one real value. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theResult:
	:type theResult: float &
	:param isApplyScale:
	:type isApplyScale: bool
	:param isOnlyPositive:
	:type isOnlyPositive: bool
	:rtype: VrmlData_ErrorStatus
") ReadReal;
		VrmlData_ErrorStatus ReadReal (VrmlData_InBuffer & theBuffer,Standard_Real &OutValue,Standard_Boolean isApplyScale,Standard_Boolean isOnlyPositive);
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "	* /** * Read one triplet of real values. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theXYZ:
	:type theXYZ: gp_XYZ
	:param isApplyScale:
	:type isApplyScale: bool
	:param isOnlyPositive:
	:type isOnlyPositive: bool
	:rtype: VrmlData_ErrorStatus
") ReadXYZ;
		VrmlData_ErrorStatus ReadXYZ (VrmlData_InBuffer & theBuffer,gp_XYZ & theXYZ,Standard_Boolean isApplyScale,Standard_Boolean isOnlyPositive);
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "	* /** * Read one doublet of real values. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theXYZ:
	:type theXYZ: gp_XY
	:param isApplyScale:
	:type isApplyScale: bool
	:param isOnlyPositive:
	:type isOnlyPositive: bool
	:rtype: VrmlData_ErrorStatus
") ReadXY;
		VrmlData_ErrorStatus ReadXY (VrmlData_InBuffer & theBuffer,gp_XY & theXYZ,Standard_Boolean isApplyScale,Standard_Boolean isOnlyPositive);
		%feature("compactdefaultargs") ReadArrIndex;
		%feature("autodoc", "	* /** * Read an array of integer indices, for IndexedfaceSet and IndexedLineSet. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:param theArr:
	:type theArr: int * * &
	:param theNBl:
	:type theNBl: Standard_Size &
	:rtype: VrmlData_ErrorStatus
") ReadArrIndex;
		VrmlData_ErrorStatus ReadArrIndex (VrmlData_InBuffer & theBuffer,const Standard_Integer * * & theArr,Standard_Size & theNBl);
		%feature("compactdefaultargs") GetLineError;
		%feature("autodoc", "	* /** * Query the line where the error occurred (if the status is not OK) */

	:rtype: inline int
") GetLineError;
		inline Standard_Integer GetLineError ();
		%feature("compactdefaultargs") SetIndent;
		%feature("autodoc", "	* /** * Store the indentation for VRML output. * @param nSpc * number of spaces to insert at every indentation level */

	:param nSpc:
	:type nSpc: int
	:rtype: inline void
") SetIndent;
		inline void SetIndent (const Standard_Integer nSpc);
		%feature("compactdefaultargs") WriteXYZ;
		%feature("autodoc", "	* /** * Write a triplet of real values on a separate line. * @param theXYZ * The value to be output. * @param isScale * If True, then each component is divided by myLinearScale. * @param thePostfix * Optional string that is added before the end of the line. */

	:param theXYZ:
	:type theXYZ: gp_XYZ
	:param isScale:
	:type isScale: bool
	:param thePostfix: default value is 0L
	:type thePostfix: char *
	:rtype: VrmlData_ErrorStatus
") WriteXYZ;
		VrmlData_ErrorStatus WriteXYZ (const gp_XYZ & theXYZ,const Standard_Boolean isScale,const char * thePostfix = 0L);
		%feature("compactdefaultargs") WriteArrIndex;
		%feature("autodoc", "	* /** * Write an array of integer indices, for IndexedFaceSet and IndexedLineSet. */

	:param thePrefix:
	:type thePrefix: char *
	:param theArr:
	:type theArr: int * *
	:param theNbBl:
	:type theNbBl: Standard_Size
	:rtype: VrmlData_ErrorStatus
") WriteArrIndex;
		VrmlData_ErrorStatus WriteArrIndex (const char * thePrefix,const Standard_Integer * * theArr,const Standard_Size theNbBl);
		%feature("compactdefaultargs") WriteLine;
		%feature("autodoc", "	* /** * Write a string to the output stream respecting the indentation. The string * can be defined as two substrings that will be separated by a space. * Each of the substrings can be NULL, then it is ignored. If both * are NULL, then a single newline is output (without indent). * @param theLine0 * The first part of string to output * @param theLine1 * The second part of string to output * @param theIndent * - 0 value ignored. * - negative decreases the current indent and then outputs. * - positive outputs and then increases the current indent. * returns * Error status of the stream, or a special error if myOutput == NULL. */

	:param theLine0:
	:type theLine0: char *
	:param theLine1: default value is 0L
	:type theLine1: char *
	:param theIndent: default value is 0
	:type theIndent: int
	:rtype: VrmlData_ErrorStatus
") WriteLine;
		VrmlData_ErrorStatus WriteLine (const char * theLine0,const char * theLine1 = 0L,const Standard_Integer theIndent = 0);
		%feature("compactdefaultargs") WriteNode;
		%feature("autodoc", "	* /** * Write the given node to output stream 'myOutput'. */

	:param thePrefix:
	:type thePrefix: char *
	:param &:
	:type &: Handle_VrmlData_Node
	:rtype: VrmlData_ErrorStatus
") WriteNode;
		VrmlData_ErrorStatus WriteNode (const char * thePrefix,const Handle_VrmlData_Node &);
		%feature("compactdefaultargs") IsDummyWrite;
		%feature("autodoc", "	* /** * Query if the current write operation is dummy, i.e., for the purpose of * collecting information before the real write is commenced. */

	:rtype: inline bool
") IsDummyWrite;
		inline Standard_Boolean IsDummyWrite ();
};


%extend VrmlData_Scene {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_ShapeConvert;
class VrmlData_ShapeConvert {
	public:
		%feature("compactdefaultargs") VrmlData_ShapeConvert;
		%feature("autodoc", "	* /** * Constructor. * @param theScene * Scene receiving all Vrml data. * @param theScale * Scale factor, considering that VRML standard specifies coordinates in * meters. So if your data are in mm, you should provide theScale=0.001 */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theScale: default value is 1
	:type theScale: float
	:rtype: None
") VrmlData_ShapeConvert;
		 VrmlData_ShapeConvert (VrmlData_Scene & theScene,const Standard_Real theScale = 1);
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	* /** * Add one shape to the internal list, may be called several times with * different shapes. */

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theName: default value is 0L
	:type theName: char *
	:rtype: None
") AddShape;
		void AddShape (const TopoDS_Shape & theShape,const char * theName = 0L);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* /** * Convert all accumulated shapes and store them in myScene. * The internal data structures are cleared in the end of convertion. * @param theExtractFaces * If True, converter extracst faces from the shapes. * @param theExtractEdges * If True, converter extracts edges from the shapes. * @param theDeflection * Deflection for tessellation of geometrical lines/surfaces. Existing mesh * is used if its deflection is smaller than the one given by this * parameter. * @param theDeflAngle * Angular deflection for tessellation of geometrical lines. */

	:param theExtractFaces:
	:type theExtractFaces: bool
	:param theExtractEdges:
	:type theExtractEdges: bool
	:param theDeflection: default value is 0.01
	:type theDeflection: float
	:param theDeflAngle: default value is 20*M_PI/180
	:type theDeflAngle: float
	:rtype: None
") Convert;
		void Convert (const Standard_Boolean theExtractFaces,const Standard_Boolean theExtractEdges,const Standard_Real theDeflection = 0.01,const Standard_Real theDeflAngle = 20*M_PI/180);
};


%extend VrmlData_ShapeConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Appearance;
class VrmlData_Appearance : public VrmlData_Node {
	public:
		%feature("compactdefaultargs") VrmlData_Appearance;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_Appearance;
		 VrmlData_Appearance ();
		%feature("compactdefaultargs") VrmlData_Appearance;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:rtype: None
") VrmlData_Appearance;
		 VrmlData_Appearance (const VrmlData_Scene & theScene,const char * theName);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* /** * Query the Material */

	:rtype: inline  Handle_VrmlData_Material
") Material;
		Handle_VrmlData_Material Material ();
		%feature("compactdefaultargs") Texture;
		%feature("autodoc", "	* /** * Query the Texture */

	:rtype: inline  Handle_VrmlData_Texture
") Texture;
		Handle_VrmlData_Texture Texture ();
		%feature("compactdefaultargs") TextureTransform;
		%feature("autodoc", "	* /** * Query the TextureTransform */

	:rtype: inline  Handle_VrmlData_TextureTransform
") TextureTransform;
		Handle_VrmlData_TextureTransform TextureTransform ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* /** * Set the Material */

	:param theMat:
	:type theMat: Handle_VrmlData_Material &
	:rtype: inline void
") SetMaterial;
		inline void SetMaterial (const Handle_VrmlData_Material & theMat);
		%feature("compactdefaultargs") SetTexture;
		%feature("autodoc", "	* /** * Set the Texture */

	:param theTexture:
	:type theTexture: Handle_VrmlData_Texture &
	:rtype: inline void
") SetTexture;
		inline void SetTexture (const Handle_VrmlData_Texture & theTexture);
		%feature("compactdefaultargs") SetTextureTransform;
		%feature("autodoc", "	* /** * Set the Texture Transform */

	:param theTT:
	:type theTT: Handle_VrmlData_TextureTransform &
	:rtype: inline void
") SetTextureTransform;
		inline void SetTextureTransform (const Handle_VrmlData_TextureTransform & theTT);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified.<p> */

	:param &:
	:type &: Handle_VrmlData_Node
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node &);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node from input stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Returns True if the node is default, so that it should not be written. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
};


%extend VrmlData_Appearance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Appearance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Appearance::Handle_VrmlData_Appearance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Appearance;
class Handle_VrmlData_Appearance : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_Appearance();
        Handle_VrmlData_Appearance(const Handle_VrmlData_Appearance &aHandle);
        Handle_VrmlData_Appearance(const VrmlData_Appearance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Appearance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Appearance {
    VrmlData_Appearance* _get_reference() {
    return (VrmlData_Appearance*)$self->Access();
    }
};

%extend Handle_VrmlData_Appearance {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Appearance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Geometry;
class VrmlData_Geometry : public VrmlData_Node {
	public:
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	* /** * Query the shape. This method checks the flag myIsModified; if True it * should rebuild the shape presentation. */

	:rtype: Handle_TopoDS_TShape
") TShape;
		virtual const Handle_TopoDS_TShape  TShape ();
};


%extend VrmlData_Geometry {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Geometry(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Geometry::Handle_VrmlData_Geometry %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Geometry;
class Handle_VrmlData_Geometry : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_Geometry();
        Handle_VrmlData_Geometry(const Handle_VrmlData_Geometry &aHandle);
        Handle_VrmlData_Geometry(const VrmlData_Geometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Geometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Geometry {
    VrmlData_Geometry* _get_reference() {
    return (VrmlData_Geometry*)$self->Access();
    }
};

%extend Handle_VrmlData_Geometry {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Group;
class VrmlData_Group : public VrmlData_Node {
	public:
typedef VrmlData_ListOfNode::Iterator Iterator;
		%feature("compactdefaultargs") VrmlData_Group;
		%feature("autodoc", "	* /** * Empty constructor. * @param isTransform * True if the group of type Transform is defined * @param theAlloc * Allocator used for the list of children */

	:param isTransform: default value is Standard_False
	:type isTransform: bool
	:rtype: None
") VrmlData_Group;
		 VrmlData_Group (const Standard_Boolean isTransform = Standard_False);
		%feature("compactdefaultargs") VrmlData_Group;
		%feature("autodoc", "	* /** * Constructor. * @param theName * Name of the Group node * @param isTransform * True if the group of type Transform is defined * @param theAlloc * Allocator used for the list of children */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param isTransform: default value is Standard_False
	:type isTransform: bool
	:rtype: None
") VrmlData_Group;
		 VrmlData_Group (const VrmlData_Scene & theScene,const char * theName,const Standard_Boolean isTransform = Standard_False);
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	* /** * Add one node to the Group. */

	:param theNode:
	:type theNode: Handle_VrmlData_Node &
	:rtype: inline Handle_VrmlData_Node
") AddNode;
		Handle_VrmlData_Node AddNode (const Handle_VrmlData_Node & theNode);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	* /** * Remove one node from the Group. * returns * True if the node was located and removed, False if none removed. */

	:param theNode:
	:type theNode: Handle_VrmlData_Node &
	:rtype: bool
") RemoveNode;
		Standard_Boolean RemoveNode (const Handle_VrmlData_Node & theNode);
		%feature("compactdefaultargs") NodeIterator;
		%feature("autodoc", "	* /** * Create iterator on nodes belonging to the Group. */

	:rtype: inline Iterator
") NodeIterator;
		inline Iterator NodeIterator ();
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* /** * Query the bounding box. */

	:rtype: inline  Bnd_B3f
") Box;
		inline const Bnd_B3f & Box ();
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "	* /** * Set the bounding box. */

	:param theBox:
	:type theBox: Bnd_B3f &
	:rtype: inline void
") SetBox;
		inline void SetBox (const Bnd_B3f & theBox);
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	* /** * Set the transformation. Returns True if the group is Transform type, * otherwise do nothing and return False. */

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool
") SetTransform;
		Standard_Boolean SetTransform (const gp_Trsf & theTrsf);
		%feature("compactdefaultargs") GetTransform;
		%feature("autodoc", "	* /** * Query the transform value. * For group without transformation this always returns Identity */

	:rtype: inline  gp_Trsf
") GetTransform;
		inline const gp_Trsf  GetTransform ();
		%feature("compactdefaultargs") IsTransform;
		%feature("autodoc", "	* /** * Query if the node is Transform type. */

	:rtype: inline bool
") IsTransform;
		inline Standard_Boolean IsTransform ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Fill the Node internal data from the given input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "	* /** * Find a node by its name, inside this Group * @param theName * Name of the node to search for. * @param theLocation * Location of the found node with respect to this Group. */

	:param theName:
	:type theName: char *
	:param theLocation:
	:type theLocation: gp_Trsf
	:rtype: Handle_VrmlData_Node
") FindNode;
		Handle_VrmlData_Node FindNode (const char * theName,gp_Trsf & theLocation);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* /** * Get the shape representing the group geometry. */

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param pMapApp:
	:type pMapApp: VrmlData_DataMapOfShapeAppearance *
	:rtype: None
") Shape;
		void Shape (TopoDS_Shape & theShape,VrmlData_DataMapOfShapeAppearance * pMapApp);
};


%extend VrmlData_Group {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Group(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Group::Handle_VrmlData_Group %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Group;
class Handle_VrmlData_Group : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_Group();
        Handle_VrmlData_Group(const Handle_VrmlData_Group &aHandle);
        Handle_VrmlData_Group(const VrmlData_Group *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Group DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Group {
    VrmlData_Group* _get_reference() {
    return (VrmlData_Group*)$self->Access();
    }
};

%extend Handle_VrmlData_Group {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Material;
class VrmlData_Material : public VrmlData_Node {
	public:
		%feature("compactdefaultargs") VrmlData_Material;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_Material;
		 VrmlData_Material ();
		%feature("compactdefaultargs") VrmlData_Material;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param theAmbientIntensity: default value is -1
	:type theAmbientIntensity: float
	:param theShininess: default value is -1
	:type theShininess: float
	:param theTransparency: default value is -1
	:type theTransparency: float
	:rtype: None
") VrmlData_Material;
		 VrmlData_Material (const VrmlData_Scene & theScene,const char * theName,const Standard_Real theAmbientIntensity = -1,const Standard_Real theShininess = -1,const Standard_Real theTransparency = -1);
		%feature("compactdefaultargs") AmbientIntensity;
		%feature("autodoc", "	* /** * Query the Ambient Intensity value */

	:rtype: inline float
") AmbientIntensity;
		inline Standard_Real AmbientIntensity ();
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "	* /** * Query the Shininess value */

	:rtype: inline float
") Shininess;
		inline Standard_Real Shininess ();
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* /** * Query the Transparency value */

	:rtype: inline float
") Transparency;
		inline Standard_Real Transparency ();
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "	* /** * Query the Diffuse color */

	:rtype: inline  Quantity_Color
") DiffuseColor;
		inline const Quantity_Color & DiffuseColor ();
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "	* /** * Query the Emissive color */

	:rtype: inline  Quantity_Color
") EmissiveColor;
		inline const Quantity_Color & EmissiveColor ();
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "	* /** * Query the Specular color */

	:rtype: inline  Quantity_Color
") SpecularColor;
		inline const Quantity_Color & SpecularColor ();
		%feature("compactdefaultargs") SetAmbientIntensity;
		%feature("autodoc", "	* /** * Set the Ambient Intensity value */

	:param theAmbientIntensity:
	:type theAmbientIntensity: float
	:rtype: inline void
") SetAmbientIntensity;
		inline void SetAmbientIntensity (const Standard_Real theAmbientIntensity);
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "	* /** * Set the Shininess value */

	:param theShininess:
	:type theShininess: float
	:rtype: inline void
") SetShininess;
		inline void SetShininess (const Standard_Real theShininess);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* /** * Set the Transparency value */

	:param theTransparency:
	:type theTransparency: float
	:rtype: inline void
") SetTransparency;
		inline void SetTransparency (const Standard_Real theTransparency);
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "	* /** * Query the Diffuse color */

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: inline void
") SetDiffuseColor;
		inline void SetDiffuseColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "	* /** * Query the Emissive color */

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: inline void
") SetEmissiveColor;
		inline void SetEmissiveColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "	* /** * Query the Specular color */

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: inline void
") SetSpecularColor;
		inline void SetSpecularColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to the Scene output. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Returns True if the node is default, so that it should not be written. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
};


%extend VrmlData_Material {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Material(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Material::Handle_VrmlData_Material %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Material;
class Handle_VrmlData_Material : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_Material();
        Handle_VrmlData_Material(const Handle_VrmlData_Material &aHandle);
        Handle_VrmlData_Material(const VrmlData_Material *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Material DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Material {
    VrmlData_Material* _get_reference() {
    return (VrmlData_Material*)$self->Access();
    }
};

%extend Handle_VrmlData_Material {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_ShapeNode;
class VrmlData_ShapeNode : public VrmlData_Node {
	public:
		%feature("compactdefaultargs") VrmlData_ShapeNode;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_ShapeNode;
		 VrmlData_ShapeNode ();
		%feature("compactdefaultargs") VrmlData_ShapeNode;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:rtype: None
") VrmlData_ShapeNode;
		 VrmlData_ShapeNode (const VrmlData_Scene & theScene,const char * theName);
		%feature("compactdefaultargs") Appearance;
		%feature("autodoc", "	* /** * Query the Appearance. */

	:rtype: inline  Handle_VrmlData_Appearance
") Appearance;
		Handle_VrmlData_Appearance Appearance ();
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	* /** * Query the Geometry. */

	:rtype: inline  Handle_VrmlData_Geometry
") Geometry;
		Handle_VrmlData_Geometry Geometry ();
		%feature("compactdefaultargs") SetAppearance;
		%feature("autodoc", "	* /** * Set the Appearance */

	:param theAppear:
	:type theAppear: Handle_VrmlData_Appearance &
	:rtype: inline void
") SetAppearance;
		inline void SetAppearance (const Handle_VrmlData_Appearance & theAppear);
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "	* /** * Set the Geometry */

	:param theGeometry:
	:type theGeometry: Handle_VrmlData_Geometry &
	:rtype: inline void
") SetGeometry;
		inline void SetGeometry (const Handle_VrmlData_Geometry & theGeometry);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Fill the Node internal data from the given input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Check if the Shape Node is writeable. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
};


%extend VrmlData_ShapeNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_ShapeNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_ShapeNode::Handle_VrmlData_ShapeNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_ShapeNode;
class Handle_VrmlData_ShapeNode : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_ShapeNode();
        Handle_VrmlData_ShapeNode(const Handle_VrmlData_ShapeNode &aHandle);
        Handle_VrmlData_ShapeNode(const VrmlData_ShapeNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_ShapeNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_ShapeNode {
    VrmlData_ShapeNode* _get_reference() {
    return (VrmlData_ShapeNode*)$self->Access();
    }
};

%extend Handle_VrmlData_ShapeNode {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_ShapeNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_TextureCoordinate;
class VrmlData_TextureCoordinate : public VrmlData_Node {
	public:
		%feature("compactdefaultargs") VrmlData_TextureCoordinate;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_TextureCoordinate;
		 VrmlData_TextureCoordinate ();
		%feature("compactdefaultargs") VrmlData_TextureCoordinate;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param nPoints: default value is 0
	:type nPoints: size_t
	:param arrPoints: default value is 0L
	:type arrPoints: gp_XY *
	:rtype: None
") VrmlData_TextureCoordinate;
		 VrmlData_TextureCoordinate (const VrmlData_Scene & theScene,const char * theName,const size_t nPoints = 0,const gp_XY * arrPoints = 0L);
		%feature("compactdefaultargs") AllocateValues;
		%feature("autodoc", "	* /** * Create a data array and assign the field myArray. * returns * True if allocation was successful. */

	:param theLength:
	:type theLength: Standard_Size
	:rtype: bool
") AllocateValues;
		Standard_Boolean AllocateValues (const Standard_Size theLength);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* /** * Query the number of points */

	:rtype: inline size_t
") Length;
		inline size_t Length ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* /** * Query the points */

	:rtype: inline  gp_XY *
") Points;
		inline const gp_XY * Points ();
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* /** * Set the points array */

	:param nPoints:
	:type nPoints: size_t
	:param arrPoints:
	:type arrPoints: gp_XY *
	:rtype: inline void
") SetPoints;
		inline void SetPoints (const size_t nPoints,const gp_XY * arrPoints);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
};


%extend VrmlData_TextureCoordinate {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_TextureCoordinate(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_TextureCoordinate::Handle_VrmlData_TextureCoordinate %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_TextureCoordinate;
class Handle_VrmlData_TextureCoordinate : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_TextureCoordinate();
        Handle_VrmlData_TextureCoordinate(const Handle_VrmlData_TextureCoordinate &aHandle);
        Handle_VrmlData_TextureCoordinate(const VrmlData_TextureCoordinate *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_TextureCoordinate DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_TextureCoordinate {
    VrmlData_TextureCoordinate* _get_reference() {
    return (VrmlData_TextureCoordinate*)$self->Access();
    }
};

%extend Handle_VrmlData_TextureCoordinate {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_TextureCoordinate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_UnknownNode;
class VrmlData_UnknownNode : public VrmlData_Node {
	public:
		%feature("compactdefaultargs") VrmlData_UnknownNode;
		%feature("autodoc", "	* /** * Empty Constructor. */

	:rtype: None
") VrmlData_UnknownNode;
		 VrmlData_UnknownNode ();
		%feature("compactdefaultargs") VrmlData_UnknownNode;
		%feature("autodoc", "	* /** * Constructor. */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName: default value is 0L
	:type theName: char *
	:param theTitle: default value is 0L
	:type theTitle: char *
	:rtype: None
") VrmlData_UnknownNode;
		 VrmlData_UnknownNode (const VrmlData_Scene & theScene,const char * theName = 0L,const char * theTitle = 0L);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the unknown node, till the last closing brace of it. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") GetTitle;
		%feature("autodoc", "	* /** * Query the title of the unknown node. */

	:rtype: inline  TCollection_AsciiString
") GetTitle;
		inline const TCollection_AsciiString & GetTitle ();
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Check if the Node is non-writeable -- always returns true. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
};


%extend VrmlData_UnknownNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_UnknownNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_UnknownNode::Handle_VrmlData_UnknownNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_UnknownNode;
class Handle_VrmlData_UnknownNode : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_UnknownNode();
        Handle_VrmlData_UnknownNode(const Handle_VrmlData_UnknownNode &aHandle);
        Handle_VrmlData_UnknownNode(const VrmlData_UnknownNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_UnknownNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_UnknownNode {
    VrmlData_UnknownNode* _get_reference() {
    return (VrmlData_UnknownNode*)$self->Access();
    }
};

%extend Handle_VrmlData_UnknownNode {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_UnknownNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_WorldInfo;
class VrmlData_WorldInfo : public VrmlData_Node {
	public:
		%feature("compactdefaultargs") VrmlData_WorldInfo;
		%feature("autodoc", "	* /** * Empty Constructor. */

	:rtype: None
") VrmlData_WorldInfo;
		 VrmlData_WorldInfo ();
		%feature("compactdefaultargs") VrmlData_WorldInfo;
		%feature("autodoc", "	* /** * Constructor. */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName: default value is 0L
	:type theName: char *
	:param theTitle: default value is 0L
	:type theTitle: char *
	:rtype: None
") VrmlData_WorldInfo;
		 VrmlData_WorldInfo (const VrmlData_Scene & theScene,const char * theName = 0L,const char * theTitle = 0L);
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "	* /** * Set or modify the title. */

	:param theString:
	:type theString: char *
	:rtype: None
") SetTitle;
		void SetTitle (const char * theString);
		%feature("compactdefaultargs") AddInfo;
		%feature("autodoc", "	* /** * Add a string to the list of info strings. */

	:param theString:
	:type theString: char *
	:rtype: None
") AddInfo;
		void AddInfo (const char * theString);
		%feature("compactdefaultargs") Title;
		%feature("autodoc", "	* /** * Query the title string. */

	:rtype: inline  char *
") Title;
		inline const char * Title ();
		%feature("compactdefaultargs") InfoIterator;
		%feature("autodoc", "	* /** * Return the iterator of Info strings. */

	:rtype: inline NCollection_List< char *>::Iterator
") InfoIterator;
		inline NCollection_List<const char *>::Iterator InfoIterator ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to the Scene output. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Returns True if the node is default, then it would not be written. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
};


%extend VrmlData_WorldInfo {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_WorldInfo(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_WorldInfo::Handle_VrmlData_WorldInfo %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_WorldInfo;
class Handle_VrmlData_WorldInfo : public Handle_VrmlData_Node {

    public:
        // constructors
        Handle_VrmlData_WorldInfo();
        Handle_VrmlData_WorldInfo(const Handle_VrmlData_WorldInfo &aHandle);
        Handle_VrmlData_WorldInfo(const VrmlData_WorldInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_WorldInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_WorldInfo {
    VrmlData_WorldInfo* _get_reference() {
    return (VrmlData_WorldInfo*)$self->Access();
    }
};

%extend Handle_VrmlData_WorldInfo {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_WorldInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Box;
class VrmlData_Box : public VrmlData_Geometry {
	public:
		%feature("compactdefaultargs") VrmlData_Box;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_Box;
		 VrmlData_Box ();
		%feature("compactdefaultargs") VrmlData_Box;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param sizeX: default value is 2
	:type sizeX: float
	:param sizeY: default value is 2
	:type sizeY: float
	:param sizeZ: default value is 2
	:type sizeZ: float
	:rtype: None
") VrmlData_Box;
		 VrmlData_Box (const VrmlData_Scene & theScene,const char * theName,const Standard_Real sizeX = 2,const Standard_Real sizeY = 2,const Standard_Real sizeZ = 2);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* /** * Query the Box size */

	:rtype: inline  gp_XYZ
") Size;
		inline const gp_XYZ  Size ();
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* /** * Set the Box Size */

	:param theSize:
	:type theSize: gp_XYZ
	:rtype: inline void
") SetSize;
		inline void SetSize (const gp_XYZ & theSize);
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	* /** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */

	:rtype: Handle_TopoDS_TShape
") TShape;
		virtual const Handle_TopoDS_TShape  TShape ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Fill the Node internal data from the given input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_Box {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Box(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Box::Handle_VrmlData_Box %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Box;
class Handle_VrmlData_Box : public Handle_VrmlData_Geometry {

    public:
        // constructors
        Handle_VrmlData_Box();
        Handle_VrmlData_Box(const Handle_VrmlData_Box &aHandle);
        Handle_VrmlData_Box(const VrmlData_Box *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Box DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Box {
    VrmlData_Box* _get_reference() {
    return (VrmlData_Box*)$self->Access();
    }
};

%extend Handle_VrmlData_Box {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Box {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Color;
class VrmlData_Color : public VrmlData_ArrayVec3d {
	public:
		%feature("compactdefaultargs") VrmlData_Color;
		%feature("autodoc", "	* /** * Empty constructor. */

	:rtype: None
") VrmlData_Color;
		 VrmlData_Color ();
		%feature("compactdefaultargs") VrmlData_Color;
		%feature("autodoc", "	* /** * Constructor. */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param nColors: default value is 0
	:type nColors: size_t
	:param arrColors: default value is 0L
	:type arrColors: gp_XYZ *
	:rtype: None
") VrmlData_Color;
		 VrmlData_Color (const VrmlData_Scene & theScene,const char * theName,const size_t nColors = 0,const gp_XYZ * arrColors = 0L);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* /** * Query one color * @param i * index in the array of colors [0 .. N-1] * returns * the color value for the index. If index irrelevant, returns (0., 0., 0.) */

	:param i:
	:type i: int
	:rtype: inline  Quantity_Color
") Color;
		inline const Quantity_Color Color (const Standard_Integer i);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* /** * Set the array data */

	:param nColors:
	:type nColors: size_t
	:param arrColors:
	:type arrColors: gp_XYZ *
	:rtype: inline void
") SetColors;
		inline void SetColors (const size_t nColors,const gp_XYZ * arrColors);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified.<p> */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to the Scene output. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_Color {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Color(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Color::Handle_VrmlData_Color %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Color;
class Handle_VrmlData_Color : public Handle_VrmlData_ArrayVec3d {

    public:
        // constructors
        Handle_VrmlData_Color();
        Handle_VrmlData_Color(const Handle_VrmlData_Color &aHandle);
        Handle_VrmlData_Color(const VrmlData_Color *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Color DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Color {
    VrmlData_Color* _get_reference() {
    return (VrmlData_Color*)$self->Access();
    }
};

%extend Handle_VrmlData_Color {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Cone;
class VrmlData_Cone : public VrmlData_Geometry {
	public:
		%feature("compactdefaultargs") VrmlData_Cone;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_Cone;
		 VrmlData_Cone ();
		%feature("compactdefaultargs") VrmlData_Cone;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param theBottomRadius: default value is 1
	:type theBottomRadius: float
	:param theHeight: default value is 2
	:type theHeight: float
	:rtype: None
") VrmlData_Cone;
		 VrmlData_Cone (const VrmlData_Scene & theScene,const char * theName,const Standard_Real theBottomRadius = 1,const Standard_Real theHeight = 2);
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "	* /** * Query the Bottom Radius */

	:rtype: inline float
") BottomRadius;
		inline Standard_Real BottomRadius ();
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	* /** * Query the Height */

	:rtype: inline float
") Height;
		inline Standard_Real Height ();
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "	* /** * Query if the bottom circle is included */

	:rtype: inline bool
") HasBottom;
		inline Standard_Boolean HasBottom ();
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "	* /** * Query if the side surface is included */

	:rtype: inline bool
") HasSide;
		inline Standard_Boolean HasSide ();
		%feature("compactdefaultargs") SetBottomRadius;
		%feature("autodoc", "	* /** * Set the Bottom Radius */

	:param theRadius:
	:type theRadius: float
	:rtype: inline void
") SetBottomRadius;
		inline void SetBottomRadius (const Standard_Real theRadius);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* /** * Set the Height */

	:param theHeight:
	:type theHeight: float
	:rtype: inline void
") SetHeight;
		inline void SetHeight (const Standard_Real theHeight);
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "	* /** * Set which faces are included */

	:param hasBottom:
	:type hasBottom: bool
	:param hasSide:
	:type hasSide: bool
	:rtype: inline void
") SetFaces;
		inline void SetFaces (const Standard_Boolean hasBottom,const Standard_Boolean hasSide);
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	* /** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */

	:rtype: Handle_TopoDS_TShape
") TShape;
		virtual const Handle_TopoDS_TShape  TShape ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Fill the Node internal data from the given input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_Cone {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Cone(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Cone::Handle_VrmlData_Cone %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Cone;
class Handle_VrmlData_Cone : public Handle_VrmlData_Geometry {

    public:
        // constructors
        Handle_VrmlData_Cone();
        Handle_VrmlData_Cone(const Handle_VrmlData_Cone &aHandle);
        Handle_VrmlData_Cone(const VrmlData_Cone *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Cone DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Cone {
    VrmlData_Cone* _get_reference() {
    return (VrmlData_Cone*)$self->Access();
    }
};

%extend Handle_VrmlData_Cone {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Coordinate;
class VrmlData_Coordinate : public VrmlData_ArrayVec3d {
	public:
		%feature("compactdefaultargs") VrmlData_Coordinate;
		%feature("autodoc", "	* /** * Empty Constructor */

	:rtype: None
") VrmlData_Coordinate;
		 VrmlData_Coordinate ();
		%feature("compactdefaultargs") VrmlData_Coordinate;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param nPoints: default value is 0
	:type nPoints: size_t
	:param arrPoints: default value is 0L
	:type arrPoints: gp_XYZ *
	:rtype: None
") VrmlData_Coordinate;
		 VrmlData_Coordinate (const VrmlData_Scene & theScene,const char * theName,const size_t nPoints = 0,const gp_XYZ * arrPoints = 0L);
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "	* /** * Query one point * @param i * index in the array of points [0 .. N-1] * returns * the coordinate for the index. If index irrelevant, returns (0., 0., 0.) */

	:param i:
	:type i: int
	:rtype: inline  gp_XYZ
") Coordinate;
		inline const gp_XYZ  Coordinate (const Standard_Integer i);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to the Scene output. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_Coordinate {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Coordinate(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Coordinate::Handle_VrmlData_Coordinate %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Coordinate;
class Handle_VrmlData_Coordinate : public Handle_VrmlData_ArrayVec3d {

    public:
        // constructors
        Handle_VrmlData_Coordinate();
        Handle_VrmlData_Coordinate(const Handle_VrmlData_Coordinate &aHandle);
        Handle_VrmlData_Coordinate(const VrmlData_Coordinate *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Coordinate DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Coordinate {
    VrmlData_Coordinate* _get_reference() {
    return (VrmlData_Coordinate*)$self->Access();
    }
};

%extend Handle_VrmlData_Coordinate {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Coordinate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Cylinder;
class VrmlData_Cylinder : public VrmlData_Geometry {
	public:
		%feature("compactdefaultargs") VrmlData_Cylinder;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_Cylinder;
		 VrmlData_Cylinder ();
		%feature("compactdefaultargs") VrmlData_Cylinder;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param theRadius: default value is 1
	:type theRadius: float
	:param theHeight: default value is 2
	:type theHeight: float
	:rtype: None
") VrmlData_Cylinder;
		 VrmlData_Cylinder (const VrmlData_Scene & theScene,const char * theName,const Standard_Real theRadius = 1,const Standard_Real theHeight = 2);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* /** * Query the Radius */

	:rtype: inline float
") Radius;
		inline Standard_Real Radius ();
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	* /** * Query the Height */

	:rtype: inline float
") Height;
		inline Standard_Real Height ();
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "	* /** * Query if the bottom circle is included */

	:rtype: inline bool
") HasBottom;
		inline Standard_Boolean HasBottom ();
		%feature("compactdefaultargs") HasSide;
		%feature("autodoc", "	* /** * Query if the side surface is included */

	:rtype: inline bool
") HasSide;
		inline Standard_Boolean HasSide ();
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "	* /** * Query if the top surface is included */

	:rtype: inline bool
") HasTop;
		inline Standard_Boolean HasTop ();
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* /** * Set the Radius */

	:param theRadius:
	:type theRadius: float
	:rtype: inline void
") SetRadius;
		inline void SetRadius (const Standard_Real theRadius);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* /** * Set the Height */

	:param theHeight:
	:type theHeight: float
	:rtype: inline void
") SetHeight;
		inline void SetHeight (const Standard_Real theHeight);
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "	* /** * Set which faces are included */

	:param hasBottom:
	:type hasBottom: bool
	:param hasSide:
	:type hasSide: bool
	:param hasTop:
	:type hasTop: bool
	:rtype: inline void
") SetFaces;
		inline void SetFaces (const Standard_Boolean hasBottom,const Standard_Boolean hasSide,const Standard_Boolean hasTop);
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	* /** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */

	:rtype: Handle_TopoDS_TShape
") TShape;
		virtual const Handle_TopoDS_TShape  TShape ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Fill the Node internal data from the given input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_Cylinder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Cylinder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Cylinder::Handle_VrmlData_Cylinder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Cylinder;
class Handle_VrmlData_Cylinder : public Handle_VrmlData_Geometry {

    public:
        // constructors
        Handle_VrmlData_Cylinder();
        Handle_VrmlData_Cylinder(const Handle_VrmlData_Cylinder &aHandle);
        Handle_VrmlData_Cylinder(const VrmlData_Cylinder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Cylinder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Cylinder {
    VrmlData_Cylinder* _get_reference() {
    return (VrmlData_Cylinder*)$self->Access();
    }
};

%extend Handle_VrmlData_Cylinder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_ImageTexture;
class VrmlData_ImageTexture : public VrmlData_Texture {
	public:
		%feature("compactdefaultargs") VrmlData_ImageTexture;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_ImageTexture;
		 VrmlData_ImageTexture ();
		%feature("compactdefaultargs") VrmlData_ImageTexture;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param theURL: default value is 0L
	:type theURL: char *
	:param theRepS: default value is Standard_False
	:type theRepS: bool
	:param theRepT: default value is Standard_False
	:type theRepT: bool
	:rtype: None
") VrmlData_ImageTexture;
		 VrmlData_ImageTexture (const VrmlData_Scene & theScene,const char * theName,const char * theURL = 0L,const Standard_Boolean theRepS = Standard_False,const Standard_Boolean theRepT = Standard_False);
		%feature("compactdefaultargs") URL;
		%feature("autodoc", "	* /** * Query the associated URL. */

	:rtype: inline  NCollection_List<TCollection_AsciiString>
") URL;
		inline const NCollection_List<TCollection_AsciiString> & URL ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_ImageTexture {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_ImageTexture(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_ImageTexture::Handle_VrmlData_ImageTexture %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_ImageTexture;
class Handle_VrmlData_ImageTexture : public Handle_VrmlData_Texture {

    public:
        // constructors
        Handle_VrmlData_ImageTexture();
        Handle_VrmlData_ImageTexture(const Handle_VrmlData_ImageTexture &aHandle);
        Handle_VrmlData_ImageTexture(const VrmlData_ImageTexture *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_ImageTexture DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_ImageTexture {
    VrmlData_ImageTexture* _get_reference() {
    return (VrmlData_ImageTexture*)$self->Access();
    }
};

%extend Handle_VrmlData_ImageTexture {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_ImageTexture {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_IndexedLineSet;
class VrmlData_IndexedLineSet : public VrmlData_Geometry {
	public:
		%feature("compactdefaultargs") VrmlData_IndexedLineSet;
		%feature("autodoc", "	* /** * Empty constructor. */

	:rtype: None
") VrmlData_IndexedLineSet;
		 VrmlData_IndexedLineSet ();
		%feature("compactdefaultargs") VrmlData_IndexedLineSet;
		%feature("autodoc", "	* /** * Constructor. */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param isColorPerVertex: default value is Standard_True
	:type isColorPerVertex: bool
	:rtype: None
") VrmlData_IndexedLineSet;
		 VrmlData_IndexedLineSet (const VrmlData_Scene & theScene,const char * theName,const Standard_Boolean isColorPerVertex = Standard_True);
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "	* /** * Query the Coordinates. */

	:rtype: inline  Handle_VrmlData_Coordinate
") Coordinates;
		Handle_VrmlData_Coordinate Coordinates ();
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "	* /** * Set the nodes */

	:param theCoord:
	:type theCoord: Handle_VrmlData_Coordinate &
	:rtype: inline void
") SetCoordinates;
		inline void SetCoordinates (const Handle_VrmlData_Coordinate & theCoord);
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "	* /** * Query the Colors. */

	:rtype: inline  Handle_VrmlData_Color
") Colors;
		Handle_VrmlData_Color Colors ();
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* /** * Set the Color node */

	:param theColors:
	:type theColors: Handle_VrmlData_Color &
	:rtype: inline void
") SetColors;
		inline void SetColors (const Handle_VrmlData_Color & theColors);
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "	* /** * Query the array of polygons */

	:param arrPolygons:
	:type arrPolygons: int * * &
	:rtype: inline size_t
") Polygons;
		inline size_t Polygons (const Standard_Integer * * & arrPolygons);
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "	* /** * Query one polygon. * @param iPolygon * rank of the polygon [0 .. N-1] * @param outIndice * <tt>[out]</tt> array of vertex indice * returns * number of vertice in the polygon - the dimension of outIndice array */

	:param iPolygon:
	:type iPolygon: int
	:param outIndice:
	:type outIndice: int * &
	:rtype: inline int
") Polygon;
		inline Standard_Integer Polygon (const Standard_Integer iPolygon,const Standard_Integer * & outIndice);
		%feature("compactdefaultargs") SetPolygons;
		%feature("autodoc", "	* /** * Set the polygons */

	:param nPolygons:
	:type nPolygons: Standard_Size
	:param thePolygons:
	:type thePolygons: int * *
	:rtype: inline void
") SetPolygons;
		inline void SetPolygons (const Standard_Size nPolygons,const Standard_Integer * * thePolygons);
		%feature("compactdefaultargs") ArrayColorInd;
		%feature("autodoc", "	* /** * Query the array of color indice * @param arrColorInd * <tt>[out]</tt> array of colorIndex as it is described in VRML2.0 spec * returns * Number of integers in the array arrColorInd. */

	:param arrColorInd:
	:type arrColorInd: int * * &
	:rtype: inline size_t
") ArrayColorInd;
		inline size_t ArrayColorInd (const Standard_Integer * * & arrColorInd);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* /** * Query a color for one node in the given element. The color is * interpreted according to fields myColors, myArrColorInd, * myColorPerVertex, as defined in VRML 2.0. * @param iFace * rank of the polygon [0 .. N-1] * @param iVertex * rank of the vertex in the polygon [0 .. M-1]. This parameter is ignored * if (myColorPerVertex == False) * returns * Color value (RGB); if the color is indefinite then returns (0., 0., 0.) */

	:param iFace:
	:type iFace: int
	:param iVertex:
	:type iVertex: int
	:rtype: Quantity_Color
") GetColor;
		Quantity_Color GetColor (const Standard_Integer iFace,const Standard_Integer iVertex);
		%feature("compactdefaultargs") SetColorInd;
		%feature("autodoc", "	* /** * Set the colors array of indice */

	:param nIndice:
	:type nIndice: Standard_Size
	:param theIndice:
	:type theIndice: int * *
	:rtype: inline void
") SetColorInd;
		inline void SetColorInd (const Standard_Size nIndice,const Standard_Integer * * theIndice);
		%feature("compactdefaultargs") SetColorPerVertex;
		%feature("autodoc", "	* /** * Set the boolean value 'colorPerVertex' */

	:param isColorPerVertex:
	:type isColorPerVertex: bool
	:rtype: inline void
") SetColorPerVertex;
		inline void SetColorPerVertex (const Standard_Boolean isColorPerVertex);
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	* /** * Query the shape. This method checks the flag myIsModified; if True it * should rebuild the shape presentation. */

	:rtype: Handle_TopoDS_TShape
") TShape;
		virtual const Handle_TopoDS_TShape  TShape ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Returns True if the node is default, so that it should not be written. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
};


%extend VrmlData_IndexedLineSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_IndexedLineSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_IndexedLineSet::Handle_VrmlData_IndexedLineSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_IndexedLineSet;
class Handle_VrmlData_IndexedLineSet : public Handle_VrmlData_Geometry {

    public:
        // constructors
        Handle_VrmlData_IndexedLineSet();
        Handle_VrmlData_IndexedLineSet(const Handle_VrmlData_IndexedLineSet &aHandle);
        Handle_VrmlData_IndexedLineSet(const VrmlData_IndexedLineSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_IndexedLineSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_IndexedLineSet {
    VrmlData_IndexedLineSet* _get_reference() {
    return (VrmlData_IndexedLineSet*)$self->Access();
    }
};

%extend Handle_VrmlData_IndexedLineSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_IndexedLineSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Normal;
class VrmlData_Normal : public VrmlData_ArrayVec3d {
	public:
		%feature("compactdefaultargs") VrmlData_Normal;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_Normal;
		 VrmlData_Normal ();
		%feature("compactdefaultargs") VrmlData_Normal;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param nVec: default value is 0
	:type nVec: size_t
	:param arrVec: default value is 0L
	:type arrVec: gp_XYZ *
	:rtype: None
") VrmlData_Normal;
		 VrmlData_Normal (const VrmlData_Scene & theScene,const char * theName,const size_t nVec = 0,const gp_XYZ * arrVec = 0L);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* /** * Query one normal * @param i * index in the array of normals [0 .. N-1] * returns * the normal value for the index. If index irrelevant, returns (0., 0., 0.) */

	:param i:
	:type i: int
	:rtype: inline  gp_XYZ
") Normal;
		inline const gp_XYZ  Normal (const Standard_Integer i);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to the Scene output. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_Normal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Normal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Normal::Handle_VrmlData_Normal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Normal;
class Handle_VrmlData_Normal : public Handle_VrmlData_ArrayVec3d {

    public:
        // constructors
        Handle_VrmlData_Normal();
        Handle_VrmlData_Normal(const Handle_VrmlData_Normal &aHandle);
        Handle_VrmlData_Normal(const VrmlData_Normal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Normal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Normal {
    VrmlData_Normal* _get_reference() {
    return (VrmlData_Normal*)$self->Access();
    }
};

%extend Handle_VrmlData_Normal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Normal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_Sphere;
class VrmlData_Sphere : public VrmlData_Geometry {
	public:
		%feature("compactdefaultargs") VrmlData_Sphere;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_Sphere;
		 VrmlData_Sphere ();
		%feature("compactdefaultargs") VrmlData_Sphere;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param theRadius: default value is 1
	:type theRadius: float
	:rtype: None
") VrmlData_Sphere;
		 VrmlData_Sphere (const VrmlData_Scene & theScene,const char * theName,const Standard_Real theRadius = 1);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* /** * Query the sphere radius */

	:rtype: inline float
") Radius;
		inline Standard_Real Radius ();
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* /** * Set the spere radius */

	:param theRadius:
	:type theRadius: float
	:rtype: inline void
") SetRadius;
		inline void SetRadius (const Standard_Real theRadius);
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	* /** * Query the primitive topology. This method returns a Null shape if there * is an internal error during the primitive creation (zero radius, etc.) */

	:rtype: Handle_TopoDS_TShape
") TShape;
		virtual const Handle_TopoDS_TShape  TShape ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Fill the Node internal data from the given input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
};


%extend VrmlData_Sphere {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_Sphere(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_Sphere::Handle_VrmlData_Sphere %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_Sphere;
class Handle_VrmlData_Sphere : public Handle_VrmlData_Geometry {

    public:
        // constructors
        Handle_VrmlData_Sphere();
        Handle_VrmlData_Sphere(const Handle_VrmlData_Sphere &aHandle);
        Handle_VrmlData_Sphere(const VrmlData_Sphere *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_Sphere DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_Sphere {
    VrmlData_Sphere* _get_reference() {
    return (VrmlData_Sphere*)$self->Access();
    }
};

%extend Handle_VrmlData_Sphere {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlData_IndexedFaceSet;
class VrmlData_IndexedFaceSet : public VrmlData_Faceted {
	public:
		%feature("compactdefaultargs") VrmlData_IndexedFaceSet;
		%feature("autodoc", "	* /** * Empty constructor */

	:rtype: None
") VrmlData_IndexedFaceSet;
		 VrmlData_IndexedFaceSet ();
		%feature("compactdefaultargs") VrmlData_IndexedFaceSet;
		%feature("autodoc", "	* /** * Constructor */

	:param theScene:
	:type theScene: VrmlData_Scene &
	:param theName:
	:type theName: char *
	:param isCCW: default value is Standard_True
	:type isCCW: bool
	:param isSolid: default value is Standard_True
	:type isSolid: bool
	:param isConvex: default value is Standard_True
	:type isConvex: bool
	:param theCreaseAngle: default value is 0
	:type theCreaseAngle: float
	:rtype: None
") VrmlData_IndexedFaceSet;
		 VrmlData_IndexedFaceSet (const VrmlData_Scene & theScene,const char * theName,const Standard_Boolean isCCW = Standard_True,const Standard_Boolean isSolid = Standard_True,const Standard_Boolean isConvex = Standard_True,const Standard_Real theCreaseAngle = 0);
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "	* /** * Query the Normals. */

	:rtype: inline  Handle_VrmlData_Normal
") Normals;
		Handle_VrmlData_Normal Normals ();
		%feature("compactdefaultargs") Colors;
		%feature("autodoc", "	* /** * Query the Colors. */

	:rtype: inline  Handle_VrmlData_Color
") Colors;
		Handle_VrmlData_Color Colors ();
		%feature("compactdefaultargs") TextureCoords;
		%feature("autodoc", "	* /** * Query the Texture Coordinates. */

	:rtype: inline  Handle_VrmlData_TextureCoordinate
") TextureCoords;
		Handle_VrmlData_TextureCoordinate TextureCoords ();
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "	* /** * Query the Coordinates. */

	:rtype: inline  Handle_VrmlData_Coordinate
") Coordinates;
		Handle_VrmlData_Coordinate Coordinates ();
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "	* /** * Query the array of polygons */

	:param arrPolygons:
	:type arrPolygons: int * * &
	:rtype: inline size_t
") Polygons;
		inline size_t Polygons (const Standard_Integer * * & arrPolygons);
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "	* /** * Query one polygon. * @param iFace * rank of the polygon [0 .. N-1] * @param outIndice * <tt>[out]</tt> array of vertex indice * returns * number of vertice in the polygon - the dimension of outIndice array */

	:param iFace:
	:type iFace: int
	:param outIndice:
	:type outIndice: int * &
	:rtype: inline int
") Polygon;
		inline Standard_Integer Polygon (const Standard_Integer iFace,const Standard_Integer * & outIndice);
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "	* /** * Set the nodes */

	:param theCoord:
	:type theCoord: Handle_VrmlData_Coordinate &
	:rtype: inline void
") SetCoordinates;
		inline void SetCoordinates (const Handle_VrmlData_Coordinate & theCoord);
		%feature("compactdefaultargs") SetPolygons;
		%feature("autodoc", "	* /** * Set the polygons */

	:param nPolygons:
	:type nPolygons: Standard_Size
	:param thePolygons:
	:type thePolygons: int * *
	:rtype: inline void
") SetPolygons;
		inline void SetPolygons (const Standard_Size nPolygons,const Standard_Integer * * thePolygons);
		%feature("compactdefaultargs") ArrayNormalInd;
		%feature("autodoc", "	* /** * Query the array of normal indice * @param arrNormalInd * <tt>[out]</tt> array of normalIndex as it is described in VRML2.0 spec * returns * Number of integers in the array arrNormalInd. */

	:param arrNormalInd:
	:type arrNormalInd: int * * &
	:rtype: inline size_t
") ArrayNormalInd;
		inline size_t ArrayNormalInd (const Standard_Integer * * & arrNormalInd);
		%feature("compactdefaultargs") IndiceNormals;
		%feature("autodoc", "	* /** * Query normals indice for one face. This method should be called after * checking myArrNormalInd != NULL, otherwise exception will be thrown. * @param iFace * rank of the face [0 .. N-1] * @param outIndice * <tt>[out]</tt> array of normals indice * returns * number of indice in the array - the dimension of outIndice array */

	:param iFace:
	:type iFace: int
	:param outIndice:
	:type outIndice: int * &
	:rtype: inline int
") IndiceNormals;
		inline Standard_Integer IndiceNormals (const Standard_Integer iFace,const Standard_Integer * & outIndice);
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "	* /** * Query a normal for one node in the given element. The normal is * interpreted according to fields myNormals, myArrNormalInd, * myNormalPerVertex, as defined in VRML 2.0. * @param iFace * rank of the polygon [0 .. N-1] * @param iVertex * rank of the vertex in the polygon [0 .. M-1]. This parameter is ignored * if (myNormalPerVertex == False) * returns * Normal vector; if the normal is indefinite then returns (0., 0., 0.) */

	:param iFace:
	:type iFace: int
	:param iVertex:
	:type iVertex: int
	:rtype: gp_XYZ
") GetNormal;
		gp_XYZ GetNormal (const Standard_Integer iFace,const Standard_Integer iVertex);
		%feature("compactdefaultargs") SetNormalInd;
		%feature("autodoc", "	* /** * Set the normals array of indice */

	:param nIndice:
	:type nIndice: Standard_Size
	:param theIndice:
	:type theIndice: int * *
	:rtype: inline void
") SetNormalInd;
		inline void SetNormalInd (const Standard_Size nIndice,const Standard_Integer * * theIndice);
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "	* /** * Set the normals node */

	:param theNormals:
	:type theNormals: Handle_VrmlData_Normal &
	:rtype: inline void
") SetNormals;
		inline void SetNormals (const Handle_VrmlData_Normal & theNormals);
		%feature("compactdefaultargs") SetNormalPerVertex;
		%feature("autodoc", "	* /** * Set the boolean value 'normalPerVertex' */

	:param isNormalPerVertex:
	:type isNormalPerVertex: bool
	:rtype: inline void
") SetNormalPerVertex;
		inline void SetNormalPerVertex (const Standard_Boolean isNormalPerVertex);
		%feature("compactdefaultargs") ArrayColorInd;
		%feature("autodoc", "	* /** * Query the array of color indice * @param arrColorInd * <tt>[out]</tt> array of colorIndex as it is described in VRML2.0 spec * returns * Number of integers in the array arrColorInd. */

	:param arrColorInd:
	:type arrColorInd: int * * &
	:rtype: inline size_t
") ArrayColorInd;
		inline size_t ArrayColorInd (const Standard_Integer * * & arrColorInd);
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	* /** * Query a color for one node in the given element. The color is * interpreted according to fields myColors, myArrColorInd, * myColorPerVertex, as defined in VRML 2.0. * @param iFace * rank of the polygon [0 .. N-1] * @param iVertex * rank of the vertex in the polygon [0 .. M-1]. This parameter is ignored * if (myColorPerVertex == False) * returns * Color value (RGB); if the color is indefinite then returns (0., 0., 0.) */

	:param iFace:
	:type iFace: int
	:param iVertex:
	:type iVertex: int
	:rtype: Quantity_Color
") GetColor;
		Quantity_Color GetColor (const Standard_Integer iFace,const Standard_Integer iVertex);
		%feature("compactdefaultargs") SetColorInd;
		%feature("autodoc", "	* /** * Set the colors array of indice */

	:param nIndice:
	:type nIndice: Standard_Size
	:param theIndice:
	:type theIndice: int * *
	:rtype: inline void
") SetColorInd;
		inline void SetColorInd (const Standard_Size nIndice,const Standard_Integer * * theIndice);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* /** * Set the Color node */

	:param theColors:
	:type theColors: Handle_VrmlData_Color &
	:rtype: inline void
") SetColors;
		inline void SetColors (const Handle_VrmlData_Color & theColors);
		%feature("compactdefaultargs") SetColorPerVertex;
		%feature("autodoc", "	* /** * Set the boolean value 'colorPerVertex' */

	:param isColorPerVertex:
	:type isColorPerVertex: bool
	:rtype: inline void
") SetColorPerVertex;
		inline void SetColorPerVertex (const Standard_Boolean isColorPerVertex);
		%feature("compactdefaultargs") ArrayTextureCoordInd;
		%feature("autodoc", "	* /** * Query the array of texture coordinate indice * @param arrTextureCoordInd * <tt>[out]</tt> array of texCoordIndex as it is described in VRML2.0 spec * returns * Number of integers in the array texCoordIndex. */

	:param arrTextureCoordInd:
	:type arrTextureCoordInd: int * * &
	:rtype: inline size_t
") ArrayTextureCoordInd;
		inline size_t ArrayTextureCoordInd (const Standard_Integer * * & arrTextureCoordInd);
		%feature("compactdefaultargs") SetTextureCoordInd;
		%feature("autodoc", "	* /** * Set the TexCoordiante array of indice */

	:param nIndice:
	:type nIndice: Standard_Size
	:param theIndice:
	:type theIndice: int * *
	:rtype: inline void
") SetTextureCoordInd;
		inline void SetTextureCoordInd (const Standard_Size nIndice,const Standard_Integer * * theIndice);
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "	* /** * Set the Texture Coordinate node */

	:param tc:
	:type tc: Handle_VrmlData_TextureCoordinate &
	:rtype: inline void
") SetTextureCoords;
		inline void SetTextureCoords (const Handle_VrmlData_TextureCoordinate & tc);
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	* /** * Query the shape. This method checks the flag myIsModified; if True it * should rebuild the shape presentation. */

	:rtype: Handle_TopoDS_TShape
") TShape;
		virtual const Handle_TopoDS_TShape  TShape ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of this node. * If the parameter is null, a new copied node is created. Otherwise new node * is not created, but rather the given one is modified. */

	:param theOther:
	:type theOther: Handle_VrmlData_Node &
	:rtype: Handle_VrmlData_Node
") Clone;
		virtual Handle_VrmlData_Node Clone (const Handle_VrmlData_Node & theOther);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* /** * Read the Node from input stream. */

	:param theBuffer:
	:type theBuffer: VrmlData_InBuffer &
	:rtype: VrmlData_ErrorStatus
") Read;
		virtual VrmlData_ErrorStatus Read (VrmlData_InBuffer & theBuffer);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* /** * Write the Node to output stream. */

	:param thePrefix:
	:type thePrefix: char *
	:rtype: VrmlData_ErrorStatus
") Write;
		virtual VrmlData_ErrorStatus Write (const char * thePrefix);
		%feature("compactdefaultargs") IsDefault;
		%feature("autodoc", "	* /** * Returns True if the node is default, so that it should not be written. */

	:rtype: bool
") IsDefault;
		virtual Standard_Boolean IsDefault ();
};


%extend VrmlData_IndexedFaceSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_VrmlData_IndexedFaceSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_VrmlData_IndexedFaceSet::Handle_VrmlData_IndexedFaceSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_VrmlData_IndexedFaceSet;
class Handle_VrmlData_IndexedFaceSet : public Handle_VrmlData_Faceted {

    public:
        // constructors
        Handle_VrmlData_IndexedFaceSet();
        Handle_VrmlData_IndexedFaceSet(const Handle_VrmlData_IndexedFaceSet &aHandle);
        Handle_VrmlData_IndexedFaceSet(const VrmlData_IndexedFaceSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_VrmlData_IndexedFaceSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_VrmlData_IndexedFaceSet {
    VrmlData_IndexedFaceSet* _get_reference() {
    return (VrmlData_IndexedFaceSet*)$self->Access();
    }
};

%extend Handle_VrmlData_IndexedFaceSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend VrmlData_IndexedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
