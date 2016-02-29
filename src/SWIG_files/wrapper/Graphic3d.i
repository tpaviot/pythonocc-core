/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Graphic3d

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


%include Graphic3d_headers.i


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
typedef NCollection_Vec4 <Standard_Integer> Graphic3d_Vec4i;
typedef NCollection_Vec2 <Standard_Character> Graphic3d_Vec2b;
typedef NCollection_Vec2 <Standard_Real> Graphic3d_Vec2d;
typedef NCollection_Vec2 <Standard_Integer> Graphic3d_Vec2i;
typedef NCollection_Vec4 <Standard_Character> Graphic3d_Vec4b;
typedef Standard_Integer Graphic3d_TransModeFlags;
typedef NCollection_Vec4 <Standard_Real> Graphic3d_Vec4d;
typedef NCollection_Vec2 <unsigned int> Graphic3d_Vec2u;
typedef NCollection_Vec4 <unsigned int> Graphic3d_Vec4u;
typedef NCollection_Mat4 <Standard_Real> Graphic3d_Mat4d;
typedef CALL_DEF_TRANSFORM_PERSISTENCE Graphic3d_CTransPersStruct;
typedef NCollection_Vec2 <Standard_ShortReal> Graphic3d_Vec2;
typedef NCollection_Vec3 <Standard_ShortReal> Graphic3d_Vec3;
typedef NCollection_Vec4 <Standard_ShortReal> Graphic3d_Vec4;
typedef Handle_Graphic3d_ShaderObject Graphic3d_ShaderObject_Handle;
typedef Handle_Graphic3d_ClipPlane Graphic3d_ClipPlane_Handle;
typedef Graphic3d_UniformValue <Graphic3d_Vec3> Graphic3d_UniformVec3;
typedef Graphic3d_UniformValue <Graphic3d_Vec3i> Graphic3d_UniformVec3i;
typedef Graphic3d_UniformValue <Graphic3d_Vec2> Graphic3d_UniformVec2;
typedef Graphic3d_UniformValue <Graphic3d_Vec4> Graphic3d_UniformVec4;
typedef Handle_Graphic3d_ShaderProgram Graphic3d_ShaderProgram_Handle;
typedef NCollection_Vec3 <Standard_Character> Graphic3d_Vec3b;
typedef NCollection_Vec4 <Standard_Byte> Graphic3d_Vec4ub;
typedef NCollection_Vec3 <Standard_Real> Graphic3d_Vec3d;
typedef Graphic3d_FrameBuffer * Graphic3d_PtrFrameBuffer;
typedef NCollection_Vec3 <Standard_Integer> Graphic3d_Vec3i;
typedef Graphic3d_UniformValue <Standard_Integer> Graphic3d_UniformInt;
typedef CALL_DEF_USERDRAW Graphic3d_CUserDraw;
typedef Graphic3d_Structure * Graphic3d_StructPtr;
typedef NCollection_Vec3 <unsigned int> Graphic3d_Vec3u;
typedef NCollection_Handle <Graphic3d_SequenceOfHClipPlane> Handle_Graphic3d_SequenceOfHClipPlane;
typedef NCollection_Mat4 <Standard_ShortReal> Graphic3d_Mat4;
typedef CALL_DEF_PICK Graphic3d_CPick;
typedef NCollection_Sequence <Handle_Graphic3d_ShaderObject> Graphic3d_ShaderObjectList;
typedef NCollection_Sequence <Handle_Graphic3d_ClipPlane> Graphic3d_SequenceOfHClipPlane;
typedef Graphic3d_UniformValue <Standard_ShortReal> Graphic3d_UniformFloat;
typedef CALL_DEF_BOUNDS Graphic3d_CBounds;
typedef CALL_DEF_PARRAY * Graphic3d_PrimitiveArray;
typedef NCollection_Sequence <Handle_Graphic3d_ShaderVariable> Graphic3d_ShaderVariableList;
typedef Graphic3d_UniformValue <Graphic3d_Vec4i> Graphic3d_UniformVec4i;
typedef NCollection_Vec2 <Standard_Byte> Graphic3d_Vec2ub;
typedef Graphic3d_UniformValue <Graphic3d_Vec2i> Graphic3d_UniformVec2i;
typedef NCollection_Vec3 <Standard_Byte> Graphic3d_Vec3ub;
typedef Handle_Graphic3d_MarkerImage Graphic3d_MarkerImage_Handle;
/* end typedefs declaration */

/* public enums */
enum Graphic3d_BufferType {
	Graphic3d_BT_RGB = 0,
	Graphic3d_BT_RGBA = 1,
	Graphic3d_BT_Depth = 2,
};

enum Graphic3d_ExportFormat {
	Graphic3d_EF_PostScript = 0,
	Graphic3d_EF_EnhPostScript = 1,
	Graphic3d_EF_TEX = 2,
	Graphic3d_EF_PDF = 3,
	Graphic3d_EF_SVG = 4,
	Graphic3d_EF_PGF = 5,
	Graphic3d_EF_EMF = 6,
};

enum Graphic3d_GroupAspect {
	Graphic3d_ASPECT_LINE = 0,
	Graphic3d_ASPECT_TEXT = 1,
	Graphic3d_ASPECT_MARKER = 2,
	Graphic3d_ASPECT_FILL_AREA = 3,
};

enum Graphic3d_HorizontalTextAlignment {
	Graphic3d_HTA_LEFT = 0,
	Graphic3d_HTA_CENTER = 1,
	Graphic3d_HTA_RIGHT = 2,
};

enum Graphic3d_LevelOfTextureAnisotropy {
	Graphic3d_LOTA_OFF = 0,
	Graphic3d_LOTA_FAST = 1,
	Graphic3d_LOTA_MIDDLE = 2,
	Graphic3d_LOTA_QUALITY = 3,
};

enum Graphic3d_NameOfMaterial {
	Graphic3d_NOM_BRASS = 0,
	Graphic3d_NOM_BRONZE = 1,
	Graphic3d_NOM_COPPER = 2,
	Graphic3d_NOM_GOLD = 3,
	Graphic3d_NOM_PEWTER = 4,
	Graphic3d_NOM_PLASTER = 5,
	Graphic3d_NOM_PLASTIC = 6,
	Graphic3d_NOM_SILVER = 7,
	Graphic3d_NOM_STEEL = 8,
	Graphic3d_NOM_STONE = 9,
	Graphic3d_NOM_SHINY_PLASTIC = 10,
	Graphic3d_NOM_SATIN = 11,
	Graphic3d_NOM_METALIZED = 12,
	Graphic3d_NOM_NEON_GNC = 13,
	Graphic3d_NOM_CHROME = 14,
	Graphic3d_NOM_ALUMINIUM = 15,
	Graphic3d_NOM_OBSIDIAN = 16,
	Graphic3d_NOM_NEON_PHC = 17,
	Graphic3d_NOM_JADE = 18,
	Graphic3d_NOM_DEFAULT = 19,
	Graphic3d_NOM_UserDefined = 20,
};

enum Graphic3d_NameOfTexture1D {
	Graphic3d_NOT_1D_ELEVATION = 0,
	Graphic3d_NOT_1D_UNKNOWN = 1,
};

enum Graphic3d_NameOfTexture2D {
	Graphic3d_NOT_2D_MATRA = 0,
	Graphic3d_NOT_2D_ALIENSKIN = 1,
	Graphic3d_NOT_2D_BLUE_ROCK = 2,
	Graphic3d_NOT_2D_BLUEWHITE_PAPER = 3,
	Graphic3d_NOT_2D_BRUSHED = 4,
	Graphic3d_NOT_2D_BUBBLES = 5,
	Graphic3d_NOT_2D_BUMP = 6,
	Graphic3d_NOT_2D_CAST = 7,
	Graphic3d_NOT_2D_CHIPBD = 8,
	Graphic3d_NOT_2D_CLOUDS = 9,
	Graphic3d_NOT_2D_FLESH = 10,
	Graphic3d_NOT_2D_FLOOR = 11,
	Graphic3d_NOT_2D_GALVNISD = 12,
	Graphic3d_NOT_2D_GRASS = 13,
	Graphic3d_NOT_2D_ALUMINUM = 14,
	Graphic3d_NOT_2D_ROCK = 15,
	Graphic3d_NOT_2D_KNURL = 16,
	Graphic3d_NOT_2D_MAPLE = 17,
	Graphic3d_NOT_2D_MARBLE = 18,
	Graphic3d_NOT_2D_MOTTLED = 19,
	Graphic3d_NOT_2D_RAIN = 20,
	Graphic3d_NOT_2D_UNKNOWN = 21,
};

enum Graphic3d_NameOfTextureEnv {
	Graphic3d_NOT_ENV_CLOUDS = 0,
	Graphic3d_NOT_ENV_CV = 1,
	Graphic3d_NOT_ENV_MEDIT = 2,
	Graphic3d_NOT_ENV_PEARL = 3,
	Graphic3d_NOT_ENV_SKY1 = 4,
	Graphic3d_NOT_ENV_SKY2 = 5,
	Graphic3d_NOT_ENV_LINES = 6,
	Graphic3d_NOT_ENV_ROAD = 7,
	Graphic3d_NOT_ENV_UNKNOWN = 8,
};

enum Graphic3d_NameOfTexturePlane {
	Graphic3d_NOTP_XY = 0,
	Graphic3d_NOTP_YZ = 1,
	Graphic3d_NOTP_ZX = 2,
	Graphic3d_NOTP_UNKNOWN = 3,
};

enum Graphic3d_SortType {
	Graphic3d_ST_Simple = 0,
	Graphic3d_ST_BSP_Tree = 1,
};

enum Graphic3d_TextPath {
	Graphic3d_TP_UP = 0,
	Graphic3d_TP_DOWN = 1,
	Graphic3d_TP_LEFT = 2,
	Graphic3d_TP_RIGHT = 3,
};

enum  {
	Graphic3d_TMF_None = 0,
	Graphic3d_TMF_PanPers = 1,
	Graphic3d_TMF_ZoomPers = 2,
	Graphic3d_TMF_RotatePers = 8,
	Graphic3d_TMF_TriedronPers = 32,
	Graphic3d_TMF_FullPers = Graphic3d_TMF_PanPers | Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers,
};

enum Graphic3d_TypeOfComposition {
	Graphic3d_TOC_REPLACE = 0,
	Graphic3d_TOC_POSTCONCATENATE = 1,
};

enum Graphic3d_TypeOfConnection {
	Graphic3d_TOC_ANCESTOR = 0,
	Graphic3d_TOC_DESCENDANT = 1,
};

enum Graphic3d_TypeOfMaterial {
	Graphic3d_MATERIAL_ASPECT = 0,
	Graphic3d_MATERIAL_PHYSIC = 1,
};

enum Graphic3d_TypeOfPolygon {
	Graphic3d_TOP_UNKNOWN = 0,
	Graphic3d_TOP_COMPLEX = 1,
	Graphic3d_TOP_CONCAVE = 2,
	Graphic3d_TOP_CONVEX = 3,
};

enum Graphic3d_TypeOfPrimitive {
	Graphic3d_TOP_UNDEFINED = 0,
	Graphic3d_TOP_POLYLINE = 1,
	Graphic3d_TOP_POLYGON = 2,
	Graphic3d_TOP_TRIANGLEMESH = 3,
	Graphic3d_TOP_QUADRANGLEMESH = 4,
	Graphic3d_TOP_TEXT = 5,
	Graphic3d_TOP_MARKER = 6,
	Graphic3d_TOP_PARRAY = 7,
};

enum Graphic3d_TypeOfPrimitiveArray {
	Graphic3d_TOPA_UNDEFINED = 0,
	Graphic3d_TOPA_POINTS = 1,
	Graphic3d_TOPA_POLYLINES = 2,
	Graphic3d_TOPA_SEGMENTS = 3,
	Graphic3d_TOPA_POLYGONS = 4,
	Graphic3d_TOPA_TRIANGLES = 5,
	Graphic3d_TOPA_QUADRANGLES = 6,
	Graphic3d_TOPA_TRIANGLESTRIPS = 7,
	Graphic3d_TOPA_QUADRANGLESTRIPS = 8,
	Graphic3d_TOPA_TRIANGLEFANS = 9,
};

enum Graphic3d_TypeOfReflection {
	Graphic3d_TOR_AMBIENT = 0,
	Graphic3d_TOR_DIFFUSE = 1,
	Graphic3d_TOR_SPECULAR = 2,
	Graphic3d_TOR_EMISSION = 3,
};

enum Graphic3d_TypeOfShaderObject {
	Graphic3d_TOS_VERTEX = 0,
	Graphic3d_TOS_FRAGMENT = 1,
};

enum Graphic3d_TypeOfStructure {
	Graphic3d_TOS_WIREFRAME = 0,
	Graphic3d_TOS_SHADING = 1,
	Graphic3d_TOS_COMPUTED = 2,
	Graphic3d_TOS_ALL = 3,
};

enum Graphic3d_TypeOfTexture {
	Graphic3d_TOT_1D = 0,
	Graphic3d_TOT_2D = 1,
	Graphic3d_TOT_2D_MIPMAP = 2,
};

enum Graphic3d_TypeOfTextureFilter {
	Graphic3d_TOTF_NEAREST = 0,
	Graphic3d_TOTF_BILINEAR = 1,
	Graphic3d_TOTF_TRILINEAR = 2,
};

enum Graphic3d_TypeOfTextureMode {
	Graphic3d_TOTM_OBJECT = 0,
	Graphic3d_TOTM_SPHERE = 1,
	Graphic3d_TOTM_EYE = 2,
	Graphic3d_TOTM_MANUAL = 3,
	Graphic3d_TOTM_SPRITE = 4,
};

enum Graphic3d_VerticalTextAlignment {
	Graphic3d_VTA_BOTTOM = 0,
	Graphic3d_VTA_CENTER = 1,
	Graphic3d_VTA_TOP = 2,
};

enum Graphic3d_ZLayerSetting {
	Graphic3d_ZLayerDepthTest = 1,
	Graphic3d_ZLayerDepthWrite = 2,
	Graphic3d_ZLayerDepthClear = 4,
	Graphic3d_ZLayerDepthOffset = 8,
};

/* end public enums declaration */

%rename(graphic3d) Graphic3d;
class Graphic3d {
	public:
		%feature("compactdefaultargs") InitGraphicDriver;
		%feature("autodoc", "	* Initialize graphic driver and returns Handle to it.

	:param theDisplayConnection:
	:type theDisplayConnection: Aspect_DisplayConnection_Handle &
	:rtype: Handle_Graphic3d_GraphicDriver
") InitGraphicDriver;
		static Handle_Graphic3d_GraphicDriver InitGraphicDriver (const Aspect_DisplayConnection_Handle & theDisplayConnection);
};


%nodefaultctor Graphic3d_Array1OfVector;
class Graphic3d_Array1OfVector {
	public:
		%feature("compactdefaultargs") Graphic3d_Array1OfVector;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Graphic3d_Array1OfVector;
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vector &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Graphic3d_Vector & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vector &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vector & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVector &
	:rtype: Graphic3d_Array1OfVector
") Assign;
		const Graphic3d_Array1OfVector & Assign (const Graphic3d_Array1OfVector & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVector &
	:rtype: Graphic3d_Array1OfVector
") operator=;
		const Graphic3d_Array1OfVector & operator = (const Graphic3d_Array1OfVector & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Graphic3d_Vector &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vector & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vector
") Value;
		const Graphic3d_Vector & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vector
") ChangeValue;
		Graphic3d_Vector & ChangeValue (const Standard_Integer Index);
};


%nodefaultctor Graphic3d_Array1OfVertex;
class Graphic3d_Array1OfVertex {
	public:
		%feature("compactdefaultargs") Graphic3d_Array1OfVertex;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Graphic3d_Array1OfVertex;
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vertex &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vertex &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVertex &
	:rtype: Graphic3d_Array1OfVertex
") Assign;
		const Graphic3d_Array1OfVertex & Assign (const Graphic3d_Array1OfVertex & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVertex &
	:rtype: Graphic3d_Array1OfVertex
") operator=;
		const Graphic3d_Array1OfVertex & operator = (const Graphic3d_Array1OfVertex & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Graphic3d_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vertex & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vertex
") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vertex
") ChangeValue;
		Graphic3d_Vertex & ChangeValue (const Standard_Integer Index);
};


%nodefaultctor Graphic3d_Array2OfVertex;
class Graphic3d_Array2OfVertex {
	public:
		%feature("compactdefaultargs") Graphic3d_Array2OfVertex;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Graphic3d_Array2OfVertex;
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vertex &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vertex &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array2OfVertex &
	:rtype: Graphic3d_Array2OfVertex
") Assign;
		const Graphic3d_Array2OfVertex & Assign (const Graphic3d_Array2OfVertex & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array2OfVertex &
	:rtype: Graphic3d_Array2OfVertex
") operator=;
		const Graphic3d_Array2OfVertex & operator = (const Graphic3d_Array2OfVertex & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Graphic3d_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Graphic3d_Vertex & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Graphic3d_Vertex
") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Graphic3d_Vertex
") ChangeValue;
		Graphic3d_Vertex & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%nodefaultctor Graphic3d_ArrayOfPrimitives;
class Graphic3d_ArrayOfPrimitives : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param aVertice:
	:type aVertice: gp_Pnt
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. returns the actual vertex number. Warning: <aColor> is ignored when the <hasVColors> constructor parameter is False

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Quantity_Color & aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. returns the actual vertex number. Warning: <aColor> is ignored when the <hasVColors> constructor parameter is False aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aColor:
	:type aColor: int
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Standard_Integer aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param NX:
	:type NX: float
	:param NY:
	:type NY: float
	:param NZ:
	:type NZ: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:param NX:
	:type NX: Standard_ShortReal
	:param NY:
	:type NY: Standard_ShortReal
	:param NZ:
	:type NZ: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal NX,const Standard_ShortReal NY,const Standard_ShortReal NZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and color in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aColor> is ignored when the <hasVColors> constructor parameter is False

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const Quantity_Color & aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and color in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aColor> is ignored when the <hasVColors> constructor parameter is False aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:param aColor:
	:type aColor: int
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const Standard_Integer aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture in the vertex array. returns the actual vertex number. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Pnt2d & aTexel);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture coordinates in the vertex array. returns the actual vertex number. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param TX:
	:type TX: float
	:param TY:
	:type TY: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real TX,const Standard_Real TY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture coordinates in the vertex array. returns the actual vertex number. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:param TX:
	:type TX: Standard_ShortReal
	:param TY:
	:type TY: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal TX,const Standard_ShortReal TY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const gp_Pnt2d & aTexel);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param NX:
	:type NX: float
	:param NY:
	:type NY: float
	:param NZ:
	:type NZ: float
	:param TX:
	:type TX: float
	:param TY:
	:type TY: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ,const Standard_Real TX,const Standard_Real TY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:param NX:
	:type NX: Standard_ShortReal
	:param NY:
	:type NY: Standard_ShortReal
	:param NZ:
	:type NZ: Standard_ShortReal
	:param TX:
	:type TX: Standard_ShortReal
	:param TY:
	:type TY: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal NX,const Standard_ShortReal NY,const Standard_ShortReal NZ,const Standard_ShortReal TX,const Standard_ShortReal TY);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> in the bound array returns the actual bounds number.

	:param edgeNumber:
	:type edgeNumber: int
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> and bound color <aBColor> in the bound array. returns the actual bounds number. Warning: <aBColor> is ignored when the <hasBColors> constructor parameter is False

	:param edgeNumber:
	:type edgeNumber: int
	:param aBColor:
	:type aBColor: Quantity_Color &
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Quantity_Color & aBColor);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> and bound color coordinates in the bound array. returns the actual bounds number. Warning: <R,G,B> are ignored when the <hasBColors> constructor parameter is False

	:param edgeNumber:
	:type edgeNumber: int
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	* Adds an edge in the range [1,VertexNumber()] in the array, if <isVisible> is False the edge between <vertexIndex> and the next edge will not be visible even if the SetEdgeOn() method is activated in Graphic3d_AspectFillArea3d class. returns the actual edges number. Warning: <isVisible> is ignored when the <hasEdgeInfos> constructor parameter is False.

	:param vertexIndex:
	:type vertexIndex: int
	:param isVisible: default value is Standard_True
	:type isVisible: bool
	:rtype: int
") AddEdge;
		Standard_Integer AddEdge (const Standard_Integer vertexIndex,const Standard_Boolean isVisible = Standard_True);
		%feature("compactdefaultargs") Orientate;
		%feature("autodoc", "	* Orientate correctly all vertexs & normals of this array according to the <aNormal> parameter and returns True when something has change in the array. Warning: When the array has edges this method is apply on edge sub array instead on vertex sub array.

	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: bool
") Orientate;
		Standard_Boolean Orientate (const gp_Dir & aNormal);
		%feature("compactdefaultargs") Orientate;
		%feature("autodoc", "	* Orientate correctly all vertexs & normal of the bound <aBound> according to the <aNormal> parameter and returns True when something has change in the array. Warning: When the array has edges this method is apply on edge sub array instead on vertex sub array. When this array has no bound, <aBoundIndex> design the item number

	:param aBoundIndex:
	:type aBoundIndex: int
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: bool
") Orientate;
		Standard_Boolean Orientate (const Standard_Integer aBoundIndex,const gp_Dir & aNormal);
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "	* Change the vertice of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aVertice:
	:type aVertice: gp_Pnt
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const gp_Pnt & aVertice);
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "	* Change the vertice of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array. aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param anIndex:
	:type anIndex: int
	:param aColor:
	:type aColor: int
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Integer aColor);
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "	* Change the vertex normal of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const gp_Dir & aNormal);
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "	* Change the vertex normal of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param NX:
	:type NX: float
	:param NY:
	:type NY: float
	:param NZ:
	:type NZ: float
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ);
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "	* Change the vertex texel of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const gp_Pnt2d & aTexel);
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "	* Change the vertex texel of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param TX:
	:type TX: float
	:param TY:
	:type TY: float
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const Standard_Real TX,const Standard_Real TY);
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "	* Change the bound color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "	* Change the bound color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	* Returns the array address.

	:rtype: Graphic3d_PrimitiveArray
") Array;
		Graphic3d_PrimitiveArray Array ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type of this primitive

	:rtype: Graphic3d_TypeOfPrimitiveArray
") Type;
		Graphic3d_TypeOfPrimitiveArray Type ();
		%feature("compactdefaultargs") StringType;
		%feature("autodoc", "	* Returns the string type of this primitive

	:rtype: char *
") StringType;
		char * StringType ();
		%feature("compactdefaultargs") HasVertexNormals;
		%feature("autodoc", "	* Returns True when vertex normals array is defined.

	:rtype: bool
") HasVertexNormals;
		Standard_Boolean HasVertexNormals ();
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "	* Returns True when vertex colors array is defined.

	:rtype: bool
") HasVertexColors;
		Standard_Boolean HasVertexColors ();
		%feature("compactdefaultargs") HasVertexTexels;
		%feature("autodoc", "	* Returns True when vertex texels array is defined.

	:rtype: bool
") HasVertexTexels;
		Standard_Boolean HasVertexTexels ();
		%feature("compactdefaultargs") VertexNumber;
		%feature("autodoc", "	* Returns the number of defined vertex

	:rtype: int
") VertexNumber;
		Standard_Integer VertexNumber ();
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "	* Returns the vertice at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: gp_Pnt
") Vertice;
		gp_Pnt Vertice (const Standard_Integer aRank);
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "	* Returns the vertice coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Vertice;
		void Vertice (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: Quantity_Color
") VertexColor;
		Quantity_Color VertexColor (const Standard_Integer aRank);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color values at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color values at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param aColor:
	:type aColor: int &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Integer &OutValue);
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "	* Returns the vertex normal at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: gp_Dir
") VertexNormal;
		gp_Dir VertexNormal (const Standard_Integer aRank);
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "	* Returns the vertex normal coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param NX:
	:type NX: float &
	:param NY:
	:type NY: float &
	:param NZ:
	:type NZ: float &
	:rtype: None
") VertexNormal;
		void VertexNormal (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "	* Returns the vertex texture at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: gp_Pnt2d
") VertexTexel;
		gp_Pnt2d VertexTexel (const Standard_Integer aRank);
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "	* Returns the vertex texture coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param TX:
	:type TX: float &
	:param TY:
	:type TY: float &
	:rtype: None
") VertexTexel;
		void VertexTexel (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasEdgeInfos;
		%feature("autodoc", "	* Returns True when edge visibillity array is defined.

	:rtype: bool
") HasEdgeInfos;
		Standard_Boolean HasEdgeInfos ();
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "	* Returns the number of defined edges

	:rtype: int
") EdgeNumber;
		Standard_Integer EdgeNumber ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the vertex index at rank <aRank> in the range [1,VertexNumber()]

	:param aRank:
	:type aRank: int
	:rtype: int
") Edge;
		Standard_Integer Edge (const Standard_Integer aRank);
		%feature("compactdefaultargs") EdgeIsVisible;
		%feature("autodoc", "	* Returns True when the edge at rank <aRank> is visible.

	:param aRank:
	:type aRank: int
	:rtype: bool
") EdgeIsVisible;
		Standard_Boolean EdgeIsVisible (const Standard_Integer aRank);
		%feature("compactdefaultargs") HasBoundColors;
		%feature("autodoc", "	* Returns True when bound colors array is defined.

	:rtype: bool
") HasBoundColors;
		Standard_Boolean HasBoundColors ();
		%feature("compactdefaultargs") BoundNumber;
		%feature("autodoc", "	* Returns the number of defined bounds

	:rtype: int
") BoundNumber;
		Standard_Integer BoundNumber ();
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "	* Returns the edge number at rank <aRank>.

	:param aRank:
	:type aRank: int
	:rtype: int
") Bound;
		Standard_Integer Bound (const Standard_Integer aRank);
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "	* Returns the bound color at rank <aRank> from the bound table if defined.

	:param aRank:
	:type aRank: int
	:rtype: Quantity_Color
") BoundColor;
		Quantity_Color BoundColor (const Standard_Integer aRank);
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "	* Returns the bound color values at rank <aRank> from the bound table if defined.

	:param aRank:
	:type aRank: int
	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: None
") BoundColor;
		void BoundColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ItemNumber;
		%feature("autodoc", "	* Returns the number of total items according to the array type.

	:rtype: int
") ItemNumber;
		Standard_Integer ItemNumber ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns True only when the contains of this array is available.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
};


%extend Graphic3d_ArrayOfPrimitives {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPrimitives(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPrimitives::Handle_Graphic3d_ArrayOfPrimitives %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPrimitives;
class Handle_Graphic3d_ArrayOfPrimitives : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPrimitives();
        Handle_Graphic3d_ArrayOfPrimitives(const Handle_Graphic3d_ArrayOfPrimitives &aHandle);
        Handle_Graphic3d_ArrayOfPrimitives(const Graphic3d_ArrayOfPrimitives *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPrimitives DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPrimitives {
    Graphic3d_ArrayOfPrimitives* GetObject() {
    return (Graphic3d_ArrayOfPrimitives*)$self->Access();
    }
};

%nodefaultctor Graphic3d_AspectFillArea3d;
class Graphic3d_AspectFillArea3d : public Aspect_AspectFillArea {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "	* Creates a context table for fill area primitives defined with the following default values:  InteriorStyle : IS_EMPTY InteriorColor : NOC_CYAN1 EdgeColor  : NOC_WHITE EdgeLineType : TOL_SOLID EdgeWidth  : 1.0 FrontMaterial : NOM_BRASS BackMaterial : NOM_BRASS  Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.

	:rtype: None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d ();
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "	* Creates a context table for fill area primitives defined with the specified values.  Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0. Warning EdgeWidth is the 'line width scale factor'. The nominal line width is 1 pixel. The width of the line is determined by applying the line width scale factor to this nominal line width. The supported line widths vary by 1-pixel units.

	:param Interior:
	:type Interior: Aspect_InteriorStyle
	:param InteriorColor:
	:type InteriorColor: Quantity_Color &
	:param EdgeColor:
	:type EdgeColor: Quantity_Color &
	:param EdgeLineType:
	:type EdgeLineType: Aspect_TypeOfLine
	:param EdgeWidth:
	:type EdgeWidth: float
	:param FrontMaterial:
	:type FrontMaterial: Graphic3d_MaterialAspect &
	:param BackMaterial:
	:type BackMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d (const Aspect_InteriorStyle Interior,const Quantity_Color & InteriorColor,const Quantity_Color & EdgeColor,const Aspect_TypeOfLine EdgeLineType,const Standard_Real EdgeWidth,const Graphic3d_MaterialAspect & FrontMaterial,const Graphic3d_MaterialAspect & BackMaterial);
		%feature("compactdefaultargs") AllowBackFace;
		%feature("autodoc", "	* Allows the display of back-facing filled polygons.

	:rtype: None
") AllowBackFace;
		void AllowBackFace ();
		%feature("compactdefaultargs") SetBackMaterial;
		%feature("autodoc", "	* Modifies the surface material of internal faces

	:param AMaterial:
	:type AMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetBackMaterial;
		void SetBackMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("compactdefaultargs") SetDistinguishOn;
		%feature("autodoc", "	* Allows distinction between external and internal faces of FillAreas.

	:rtype: None
") SetDistinguishOn;
		void SetDistinguishOn ();
		%feature("compactdefaultargs") SetDistinguishOff;
		%feature("autodoc", "	* Forbids distinction between external and internal faces of FillAreas.

	:rtype: None
") SetDistinguishOff;
		void SetDistinguishOff ();
		%feature("compactdefaultargs") SetEdgeOn;
		%feature("autodoc", "	* The edges of FillAreas are drawn.

	:rtype: None
") SetEdgeOn;
		void SetEdgeOn ();
		%feature("compactdefaultargs") SetEdgeOff;
		%feature("autodoc", "	* The edges of FillAreas are not drawn.

	:rtype: None
") SetEdgeOff;
		void SetEdgeOff ();
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "	* Modifies the surface material of external faces

	:param AMaterial:
	:type AMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetFrontMaterial;
		void SetFrontMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("compactdefaultargs") SuppressBackFace;
		%feature("autodoc", "	* Suppress the display of back-facing filled polygons. A back-facing polygon is defined as a polygon whose vertices are in a clockwise order with respect to screen coordinates.

	:rtype: None
") SuppressBackFace;
		void SuppressBackFace ();
		%feature("compactdefaultargs") SetTextureMap;
		%feature("autodoc", "	:param ATexture:
	:type ATexture: Handle_Graphic3d_TextureMap &
	:rtype: None
") SetTextureMap;
		void SetTextureMap (const Handle_Graphic3d_TextureMap & ATexture);
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "	:rtype: None
") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "	:rtype: None
") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "	* Sets up OpenGL polygon offsets mechanism. <aMode> parameter can contain various combinations of Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means that polygon offsets are not changed). If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits> arguments are used by graphic renderer to calculate a depth offset value:  offset = <aFactor> * m + <aUnits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific)  Deafult settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0.  Negative offset values move polygons closer to the viewport, while positive values shift polygons away. Consult OpenGL reference for details (glPolygonOffset function description).

	:param aMode:
	:type aMode: int
	:param aFactor: default value is 1.0
	:type aFactor: Standard_ShortReal
	:param aUnits: default value is 0.0
	:type aUnits: Standard_ShortReal
	:rtype: None
") SetPolygonOffsets;
		void SetPolygonOffsets (const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "	* Returns the Back Face Removal status. Standard_True if SuppressBackFace is activated.

	:rtype: bool
") BackFace;
		Standard_Boolean BackFace ();
		%feature("compactdefaultargs") Distinguish;
		%feature("autodoc", "	* Returns the Distinguish Mode status.

	:rtype: bool
") Distinguish;
		Standard_Boolean Distinguish ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns Standard_True if the edges are drawn and Standard_False if the edges are not drawn.

	:rtype: bool
") Edge;
		Standard_Boolean Edge ();
		%feature("compactdefaultargs") BackMaterial;
		%feature("autodoc", "	* Returns the surface material of internal faces

	:rtype: Graphic3d_MaterialAspect
") BackMaterial;
		Graphic3d_MaterialAspect BackMaterial ();
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "	* Returns the surface material of external faces

	:rtype: Graphic3d_MaterialAspect
") FrontMaterial;
		Graphic3d_MaterialAspect FrontMaterial ();
		%feature("compactdefaultargs") TextureMap;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_TextureMap
") TextureMap;
		Handle_Graphic3d_TextureMap TextureMap ();
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "	:rtype: bool
") TextureMapState;
		Standard_Boolean TextureMapState ();
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "	* Returns current polygon offsets settings.

	:param aMode:
	:type aMode: int &
	:param aFactor:
	:type aFactor: Standard_ShortReal &
	:param aUnits:
	:type aUnits: Standard_ShortReal &
	:rtype: None
") PolygonOffsets;
		void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%extend Graphic3d_AspectFillArea3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectFillArea3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectFillArea3d::Handle_Graphic3d_AspectFillArea3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectFillArea3d;
class Handle_Graphic3d_AspectFillArea3d : public Handle_Aspect_AspectFillArea {

    public:
        // constructors
        Handle_Graphic3d_AspectFillArea3d();
        Handle_Graphic3d_AspectFillArea3d(const Handle_Graphic3d_AspectFillArea3d &aHandle);
        Handle_Graphic3d_AspectFillArea3d(const Graphic3d_AspectFillArea3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectFillArea3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectFillArea3d {
    Graphic3d_AspectFillArea3d* GetObject() {
    return (Graphic3d_AspectFillArea3d*)$self->Access();
    }
};

%nodefaultctor Graphic3d_AspectLine3d;
class Graphic3d_AspectLine3d : public Aspect_AspectLine {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "	* Creates a context table for line primitives //!	 defined with the following default values: //!	 Colour	: NOC_YELLOW //!	 Line type	: TOL_SOLID //!	 Width	: 1.0

	:rtype: None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d ();
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "	* Creates a context table for line primitives //!	 defined with the specified values. Warning: <AWidth> is the 'linewidth scale factor'. //!	 The nominal line width is 1 pixel. The width of //!	 the line is determined by applying the linewidth scale //!	 factor to this nominal line width. //!	 The supported linewidths vary by 1-pixel units.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AType:
	:type AType: Aspect_TypeOfLine
	:param AWidth:
	:type AWidth: float
	:rtype: None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d (const Quantity_Color & AColor,const Aspect_TypeOfLine AType,const Standard_Real AWidth);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%extend Graphic3d_AspectLine3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectLine3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectLine3d::Handle_Graphic3d_AspectLine3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectLine3d;
class Handle_Graphic3d_AspectLine3d : public Handle_Aspect_AspectLine {

    public:
        // constructors
        Handle_Graphic3d_AspectLine3d();
        Handle_Graphic3d_AspectLine3d(const Handle_Graphic3d_AspectLine3d &aHandle);
        Handle_Graphic3d_AspectLine3d(const Graphic3d_AspectLine3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectLine3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectLine3d {
    Graphic3d_AspectLine3d* GetObject() {
    return (Graphic3d_AspectLine3d*)$self->Access();
    }
};

%nodefaultctor Graphic3d_AspectMarker3d;
class Graphic3d_AspectMarker3d : public Aspect_AspectMarker {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the following default values:  Marker type : TOM_X Colour : YELLOW Scale factor: 1.0

	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d ();
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	:param theType:
	:type theType: Aspect_TypeOfMarker
	:param theColor:
	:type theColor: Quantity_Color &
	:param theScale:
	:type theScale: float
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Aspect_TypeOfMarker theType,const Quantity_Color & theColor,const Standard_Real theScale);
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the specified values.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theTextureBitmap:
	:type theTextureBitmap: Handle_TColStd_HArray1OfByte &
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Quantity_Color & theColor,const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTextureBitmap);
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the specified values.

	:param theTextureImage:
	:type theTextureImage: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Image_PixMap_Handle & theTextureImage);
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "	* Returns marker's texture size.

	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetMarkerImage;
		%feature("autodoc", "	* Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.

	:rtype: Graphic3d_MarkerImage_Handle
") GetMarkerImage;
		const Graphic3d_MarkerImage_Handle & GetMarkerImage ();
		%feature("compactdefaultargs") SetBitMap;
		%feature("autodoc", "	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theTexture:
	:type theTexture: Handle_TColStd_HArray1OfByte &
	:rtype: None
") SetBitMap;
		void SetBitMap (const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTexture);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%extend Graphic3d_AspectMarker3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectMarker3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectMarker3d::Handle_Graphic3d_AspectMarker3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectMarker3d;
class Handle_Graphic3d_AspectMarker3d : public Handle_Aspect_AspectMarker {

    public:
        // constructors
        Handle_Graphic3d_AspectMarker3d();
        Handle_Graphic3d_AspectMarker3d(const Handle_Graphic3d_AspectMarker3d &aHandle);
        Handle_Graphic3d_AspectMarker3d(const Graphic3d_AspectMarker3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectMarker3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectMarker3d {
    Graphic3d_AspectMarker3d* GetObject() {
    return (Graphic3d_AspectMarker3d*)$self->Access();
    }
};

%nodefaultctor Graphic3d_AspectText3d;
class Graphic3d_AspectText3d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "	* Creates a context table for text primitives defined with the following default values: Colour  : NOC_YELLOW Font  : NOF_ASCII_MONO Expansion factor : 1. Space between characters : 0. The style  : TOST_NORMAL The display type : TODT_NORMAL

	:rtype: None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d ();
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "	* Creates a context table for text primitives defined with the specified values. AFont may be to take means from User(example 'Courier New') or Font name defined in Font_NameOfFont(example Font_NOF_ASCII_MONO) or use default font('Courier')

	:param AColor:
	:type AColor: Quantity_Color &
	:param AFont:
	:type AFont: char *
	:param AExpansionFactor:
	:type AExpansionFactor: float
	:param ASpace:
	:type ASpace: float
	:param AStyle: default value is Aspect_TOST_NORMAL
	:type AStyle: Aspect_TypeOfStyleText
	:param ADisplayType: default value is Aspect_TODT_NORMAL
	:type ADisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d (const Quantity_Color & AColor,const char * AFont,const Standard_Real AExpansionFactor,const Standard_Real ASpace,const Aspect_TypeOfStyleText AStyle = Aspect_TOST_NORMAL,const Aspect_TypeOfDisplayText ADisplayType = Aspect_TODT_NORMAL);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the colour of <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetExpansionFactor;
		%feature("autodoc", "	* Modifies the expansion factor (height/width ratio) If the factor is less than 1, the characters will be higher than they are wide.

	:param AFactor:
	:type AFactor: float
	:rtype: None
") SetExpansionFactor;
		void SetExpansionFactor (const Standard_Real AFactor);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Modifies the font of <self>.

	:param AFont:
	:type AFont: char *
	:rtype: None
") SetFont;
		void SetFont (const char * AFont);
		%feature("compactdefaultargs") SetSpace;
		%feature("autodoc", "	* Modifies the space between the characters.

	:param ASpace:
	:type ASpace: float
	:rtype: None
") SetSpace;
		void SetSpace (const Standard_Real ASpace);
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "	* Modifies the style of the text. TOST_NORMAL Default text. The text is displayed like any other graphic object. This text can be hidden by another object that is nearest from the point of view. TOST_ANNOTATION The text is always visible. The texte is displayed over the other object according to the priority.

	:param AStyle:
	:type AStyle: Aspect_TypeOfStyleText
	:rtype: None
") SetStyle;
		void SetStyle (const Aspect_TypeOfStyleText AStyle);
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "	* Define the display type of the text. TODT_NORMAL Default display. Text only. TODT_SUBTITLE There is a subtitle under the text. TODT_DEKALE The text is displayed with a 3D style. TODT_BLEND The text is displayed in XOR. TODT_DIMENSION Dimension line under text will be invisible.

	:param ADisplayType:
	:type ADisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") SetDisplayType;
		void SetDisplayType (const Aspect_TypeOfDisplayText ADisplayType);
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "	* Modifies the colour of the subtitle for the TODT_SUBTITLE TextDisplayType  and the colour of backgroubd for the TODT_DEKALE TextDisplayType.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetTextZoomable;
		%feature("autodoc", "	* Turns usage of text zoomable on/off

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetTextZoomable;
		void SetTextZoomable (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") GetTextZoomable;
		%feature("autodoc", "	* Returns True when the Text Zoomable is on.

	:rtype: bool
") GetTextZoomable;
		Standard_Boolean GetTextZoomable ();
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "	* Turns usage of text rotated

	:param AAngle:
	:type AAngle: float
	:rtype: None
") SetTextAngle;
		void SetTextAngle (const Standard_Real AAngle);
		%feature("compactdefaultargs") GetTextAngle;
		%feature("autodoc", "	* Returns Angle of degree

	:rtype: float
") GetTextAngle;
		Standard_Real GetTextAngle ();
		%feature("compactdefaultargs") SetTextFontAspect;
		%feature("autodoc", "	* Turns usage of Aspect text

	:param AFontAspect:
	:type AFontAspect: Font_FontAspect
	:rtype: None
") SetTextFontAspect;
		void SetTextFontAspect (const Font_FontAspect AFontAspect);
		%feature("compactdefaultargs") GetTextFontAspect;
		%feature("autodoc", "	* Returns text FontAspect

	:rtype: Font_FontAspect
") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect ();
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%extend Graphic3d_AspectText3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectText3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectText3d::Handle_Graphic3d_AspectText3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectText3d;
class Handle_Graphic3d_AspectText3d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_AspectText3d();
        Handle_Graphic3d_AspectText3d(const Handle_Graphic3d_AspectText3d &aHandle);
        Handle_Graphic3d_AspectText3d(const Graphic3d_AspectText3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectText3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectText3d {
    Graphic3d_AspectText3d* GetObject() {
    return (Graphic3d_AspectText3d*)$self->Access();
    }
};

%nodefaultctor Graphic3d_CBitFields16;
class Graphic3d_CBitFields16 {
	public:
};


%nodefaultctor Graphic3d_CBitFields20;
class Graphic3d_CBitFields20 {
	public:
};


%nodefaultctor Graphic3d_CBitFields4;
class Graphic3d_CBitFields4 {
	public:
};


%nodefaultctor Graphic3d_CBitFields8;
class Graphic3d_CBitFields8 {
	public:
};


%nodefaultctor Graphic3d_CGraduatedTrihedron;
class Graphic3d_CGraduatedTrihedron {
	public:
		%feature("compactdefaultargs") Graphic3d_CGraduatedTrihedron;
		%feature("autodoc", "	:rtype: None
") Graphic3d_CGraduatedTrihedron;
		 Graphic3d_CGraduatedTrihedron ();
};


%nodefaultctor Graphic3d_CGroup;
class Graphic3d_CGroup {
	public:
};


%nodefaultctor Graphic3d_CLight;
class Graphic3d_CLight {
	public:
		%feature("compactdefaultargs") ConstAttenuation;
		%feature("autodoc", "	* //!< flag to mark head light Const attenuation factor of positional light source

	:rtype: Standard_ShortReal
") ConstAttenuation;
		Standard_ShortReal ConstAttenuation ();
		%feature("compactdefaultargs") LinearAttenuation;
		%feature("autodoc", "	* Linear attenuation factor of positional light source

	:rtype: Standard_ShortReal
") LinearAttenuation;
		Standard_ShortReal LinearAttenuation ();
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "	* Const, Linear attenuation factors of positional light source

	:rtype: Graphic3d_Vec2
") Attenuation;
		Graphic3d_Vec2 Attenuation ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Angle in radians of the cone created by the spot

	:rtype: Standard_ShortReal
") Angle;
		Standard_ShortReal Angle ();
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "	* Intensity distribution of the spot light, with 0..1 range.

	:rtype: Standard_ShortReal
") Concentration;
		Standard_ShortReal Concentration ();
		%feature("compactdefaultargs") ChangeConstAttenuation;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConstAttenuation;
		Standard_ShortReal & ChangeConstAttenuation ();
		%feature("compactdefaultargs") ChangeLinearAttenuation;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeLinearAttenuation;
		Standard_ShortReal & ChangeLinearAttenuation ();
		%feature("compactdefaultargs") ChangeAttenuation;
		%feature("autodoc", "	:rtype: Graphic3d_Vec2
") ChangeAttenuation;
		Graphic3d_Vec2 & ChangeAttenuation ();
		%feature("compactdefaultargs") ChangeAngle;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeAngle;
		Standard_ShortReal & ChangeAngle ();
		%feature("compactdefaultargs") ChangeConcentration;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConcentration;
		Standard_ShortReal & ChangeConcentration ();
		%feature("compactdefaultargs") Graphic3d_CLight;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Graphic3d_CLight;
		 Graphic3d_CLight ();
};


%nodefaultctor Graphic3d_CStructure;
class Graphic3d_CStructure {
	public:
};


%nodefaultctor Graphic3d_CTexture;
class Graphic3d_CTexture {
	public:
		%feature("compactdefaultargs") Graphic3d_CTexture;
		%feature("autodoc", "	:rtype: None
") Graphic3d_CTexture;
		 Graphic3d_CTexture ();
};


%nodefaultctor Graphic3d_CView;
class Graphic3d_CView {
	public:
		%feature("compactdefaultargs") Graphic3d_CView;
		%feature("autodoc", "	:rtype: None
") Graphic3d_CView;
		 Graphic3d_CView ();
};


%nodefaultctor Graphic3d_DataStructureManager;
class Graphic3d_DataStructureManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Deletes the manager <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
};


%extend Graphic3d_DataStructureManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_DataStructureManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_DataStructureManager::Handle_Graphic3d_DataStructureManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_DataStructureManager;
class Handle_Graphic3d_DataStructureManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_DataStructureManager();
        Handle_Graphic3d_DataStructureManager(const Handle_Graphic3d_DataStructureManager &aHandle);
        Handle_Graphic3d_DataStructureManager(const Graphic3d_DataStructureManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_DataStructureManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_DataStructureManager {
    Graphic3d_DataStructureManager* GetObject() {
    return (Graphic3d_DataStructureManager*)$self->Access();
    }
};

%nodefaultctor Graphic3d_GraphicDriver;
class Graphic3d_GraphicDriver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Begin;
		%feature("autodoc", "	* Starts graphic driver with given connection

	:param theDisplayConnection:
	:type theDisplayConnection: Aspect_DisplayConnection_Handle &
	:rtype: bool
") Begin;
		virtual Standard_Boolean Begin (const Aspect_DisplayConnection_Handle & theDisplayConnection);
		%feature("compactdefaultargs") End;
		%feature("autodoc", "	* call_togl_end

	:rtype: void
") End;
		virtual void End ();
		%feature("compactdefaultargs") InquireLightLimit;
		%feature("autodoc", "	* call_togl_inquirelight

	:rtype: int
") InquireLightLimit;
		virtual Standard_Integer InquireLightLimit ();
		%feature("compactdefaultargs") InquireMat;
		%feature("autodoc", "	* call_togl_inquiremat

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AMatO:
	:type AMatO: TColStd_Array2OfReal &
	:param AMatM:
	:type AMatM: TColStd_Array2OfReal &
	:rtype: void
") InquireMat;
		virtual void InquireMat (const Graphic3d_CView & ACView,TColStd_Array2OfReal & AMatO,TColStd_Array2OfReal & AMatM);
		%feature("compactdefaultargs") InquirePlaneLimit;
		%feature("autodoc", "	* call_togl_inquireplane

	:rtype: int
") InquirePlaneLimit;
		virtual Standard_Integer InquirePlaneLimit ();
		%feature("compactdefaultargs") InquireViewLimit;
		%feature("autodoc", "	* call_togl_inquireview

	:rtype: int
") InquireViewLimit;
		virtual Standard_Integer InquireViewLimit ();
		%feature("compactdefaultargs") Blink;
		%feature("autodoc", "	* call_togl_blink

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param Create:
	:type Create: bool
	:rtype: void
") Blink;
		virtual void Blink (const Graphic3d_CStructure & ACStructure,const Standard_Boolean Create);
		%feature("compactdefaultargs") BoundaryBox;
		%feature("autodoc", "	* call_togl_boundarybox

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param Create:
	:type Create: bool
	:rtype: void
") BoundaryBox;
		virtual void BoundaryBox (const Graphic3d_CStructure & ACStructure,const Standard_Boolean Create);
		%feature("compactdefaultargs") HighlightColor;
		%feature("autodoc", "	* call_togl_highlightcolor

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param R:
	:type R: Standard_ShortReal
	:param G:
	:type G: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param Create:
	:type Create: bool
	:rtype: void
") HighlightColor;
		virtual void HighlightColor (const Graphic3d_CStructure & ACStructure,const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B,const Standard_Boolean Create);
		%feature("compactdefaultargs") NameSetStructure;
		%feature("autodoc", "	* call_togl_namesetstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") NameSetStructure;
		virtual void NameSetStructure (const Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") ClearGroup;
		%feature("autodoc", "	* call_togl_cleargroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:rtype: void
") ClearGroup;
		virtual void ClearGroup (const Graphic3d_CGroup & ACGroup);
		%feature("compactdefaultargs") FaceContextGroup;
		%feature("autodoc", "	* call_togl_facecontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: int
	:rtype: void
") FaceContextGroup;
		virtual void FaceContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "	* call_togl_group

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:rtype: void
") Group;
		virtual void Group (Graphic3d_CGroup & ACGroup);
		%feature("compactdefaultargs") LineContextGroup;
		%feature("autodoc", "	* call_togl_linecontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: int
	:rtype: void
") LineContextGroup;
		virtual void LineContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("compactdefaultargs") MarkerContextGroup;
		%feature("autodoc", "	* call_togl_markercontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: int
	:rtype: void
") MarkerContextGroup;
		virtual void MarkerContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "	* call_togl_removegroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:rtype: void
") RemoveGroup;
		virtual void RemoveGroup (const Graphic3d_CGroup & ACGroup);
		%feature("compactdefaultargs") TextContextGroup;
		%feature("autodoc", "	* call_togl_textcontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: int
	:rtype: void
") TextContextGroup;
		virtual void TextContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("compactdefaultargs") ClearStructure;
		%feature("autodoc", "	* call_togl_clearstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") ClearStructure;
		virtual void ClearStructure (const Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* call_togl_connect

	:param AFather:
	:type AFather: Graphic3d_CStructure &
	:param ASon:
	:type ASon: Graphic3d_CStructure &
	:rtype: void
") Connect;
		virtual void Connect (const Graphic3d_CStructure & AFather,const Graphic3d_CStructure & ASon);
		%feature("compactdefaultargs") ContextStructure;
		%feature("autodoc", "	* call_togl_contextstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") ContextStructure;
		virtual void ContextStructure (const Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* call_togl_disconnect

	:param AFather:
	:type AFather: Graphic3d_CStructure &
	:param ASon:
	:type ASon: Graphic3d_CStructure &
	:rtype: void
") Disconnect;
		virtual void Disconnect (const Graphic3d_CStructure & AFather,const Graphic3d_CStructure & ASon);
		%feature("compactdefaultargs") DisplayStructure;
		%feature("autodoc", "	* call_togl_displaystructure

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param APriority:
	:type APriority: int
	:rtype: void
") DisplayStructure;
		virtual void DisplayStructure (const Graphic3d_CView & ACView,const Graphic3d_CStructure & ACStructure,const Standard_Integer APriority);
		%feature("compactdefaultargs") EraseStructure;
		%feature("autodoc", "	* call_togl_erasestructure

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") EraseStructure;
		virtual void EraseStructure (const Graphic3d_CView & ACView,const Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") RemoveStructure;
		%feature("autodoc", "	* call_togl_removestructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") RemoveStructure;
		virtual void RemoveStructure (const Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "	* call_togl_structure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") Structure;
		virtual void Structure (Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") ActivateView;
		%feature("autodoc", "	* call_togl_activateview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") ActivateView;
		virtual void ActivateView (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") AntiAliasing;
		%feature("autodoc", "	* call_togl_antialiasing

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") AntiAliasing;
		virtual void AntiAliasing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "	* call_togl_background

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") Background;
		virtual void Background (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* call_togl_gradient_background

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AColor1:
	:type AColor1: Quantity_Color &
	:param AColor2:
	:type AColor2: Quantity_Color &
	:param FillStyle:
	:type FillStyle: Aspect_GradientFillMethod
	:rtype: void
") GradientBackground;
		virtual void GradientBackground (const Graphic3d_CView & ACView,const Quantity_Color & AColor1,const Quantity_Color & AColor2,const Aspect_GradientFillMethod FillStyle);
		%feature("compactdefaultargs") BackgroundImage;
		%feature("autodoc", "	:param FileName:
	:type FileName: char *
	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:rtype: void
") BackgroundImage;
		virtual void BackgroundImage (const char * FileName,const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:rtype: void
") SetBgImageStyle;
		virtual void SetBgImageStyle (const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_GradientFillMethod
	:rtype: void
") SetBgGradientStyle;
		virtual void SetBgGradientStyle (const Graphic3d_CView & ACView,const Aspect_GradientFillMethod FillStyle);
		%feature("compactdefaultargs") ClipLimit;
		%feature("autodoc", "	* call_togl_cliplimit

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AWait:
	:type AWait: bool
	:rtype: void
") ClipLimit;
		virtual void ClipLimit (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("compactdefaultargs") DeactivateView;
		%feature("autodoc", "	* call_togl_deactivateview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") DeactivateView;
		virtual void DeactivateView (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") DepthCueing;
		%feature("autodoc", "	* call_togl_cliplimit

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") DepthCueing;
		virtual void DepthCueing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("compactdefaultargs") ProjectRaster;
		%feature("autodoc", "	* call_togl_unproject_raster

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AX:
	:type AX: Standard_ShortReal
	:param AY:
	:type AY: Standard_ShortReal
	:param AZ:
	:type AZ: Standard_ShortReal
	:param AU:
	:type AU: int &
	:param AV:
	:type AV: int &
	:rtype: bool
") ProjectRaster;
		virtual Standard_Boolean ProjectRaster (const Graphic3d_CView & ACView,const Standard_ShortReal AX,const Standard_ShortReal AY,const Standard_ShortReal AZ,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") UnProjectRaster;
		%feature("autodoc", "	* call_togl_unproject_raster

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param Axm:
	:type Axm: int
	:param Aym:
	:type Aym: int
	:param AXM:
	:type AXM: int
	:param AYM:
	:type AYM: int
	:param AU:
	:type AU: int
	:param AV:
	:type AV: int
	:param AX:
	:type AX: Standard_ShortReal &
	:param AY:
	:type AY: Standard_ShortReal &
	:param AZ:
	:type AZ: Standard_ShortReal &
	:rtype: bool
") UnProjectRaster;
		virtual Standard_Boolean UnProjectRaster (const Graphic3d_CView & ACView,const Standard_Integer Axm,const Standard_Integer Aym,const Standard_Integer AXM,const Standard_Integer AYM,const Standard_Integer AU,const Standard_Integer AV,Standard_ShortReal & AX,Standard_ShortReal & AY,Standard_ShortReal & AZ);
		%feature("compactdefaultargs") UnProjectRasterWithRay;
		%feature("autodoc", "	* call_togl_unproject_raster_with_ray

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param Axm:
	:type Axm: int
	:param Aym:
	:type Aym: int
	:param AXM:
	:type AXM: int
	:param AYM:
	:type AYM: int
	:param AU:
	:type AU: int
	:param AV:
	:type AV: int
	:param AX:
	:type AX: Standard_ShortReal &
	:param AY:
	:type AY: Standard_ShortReal &
	:param AZ:
	:type AZ: Standard_ShortReal &
	:param DX:
	:type DX: Standard_ShortReal &
	:param DY:
	:type DY: Standard_ShortReal &
	:param DZ:
	:type DZ: Standard_ShortReal &
	:rtype: bool
") UnProjectRasterWithRay;
		virtual Standard_Boolean UnProjectRasterWithRay (const Graphic3d_CView & ACView,const Standard_Integer Axm,const Standard_Integer Aym,const Standard_Integer AXM,const Standard_Integer AYM,const Standard_Integer AU,const Standard_Integer AV,Standard_ShortReal & AX,Standard_ShortReal & AY,Standard_ShortReal & AZ,Standard_ShortReal & DX,Standard_ShortReal & DY,Standard_ShortReal & DZ);
		%feature("compactdefaultargs") RatioWindow;
		%feature("autodoc", "	* call_togl_ratio_window

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") RatioWindow;
		virtual void RatioWindow (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* call_togl_redraw Warning: when the redraw area has a null size, the full view is redrawn

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACUnderLayer:
	:type ACUnderLayer: Aspect_CLayer2d &
	:param ACOverLayer:
	:type ACOverLayer: Aspect_CLayer2d &
	:param x: default value is 0
	:type x: int
	:param y: default value is 0
	:type y: int
	:param width: default value is 0
	:type width: int
	:param height: default value is 0
	:type height: int
	:rtype: void
") Redraw;
		virtual void Redraw (const Graphic3d_CView & ACView,const Aspect_CLayer2d & ACUnderLayer,const Aspect_CLayer2d & ACOverLayer,const Standard_Integer x = 0,const Standard_Integer y = 0,const Standard_Integer width = 0,const Standard_Integer height = 0);
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "	* call_togl_removeview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") RemoveView;
		virtual void RemoveView (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") SetLight;
		%feature("autodoc", "	* call_togl_setlight

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") SetLight;
		virtual void SetLight (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Pass clip planes to the associated graphic driver view.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:rtype: void
") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_CView & theCView);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Pass clip planes to the associated graphic driver structure.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:rtype: void
") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_CStructure & theCStructure);
		%feature("compactdefaultargs") SetVisualisation;
		%feature("autodoc", "	* call_togl_setvisualisation

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") SetVisualisation;
		virtual void SetVisualisation (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") TransformStructure;
		%feature("autodoc", "	* call_togl_transformstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") TransformStructure;
		virtual void TransformStructure (const Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* call_togl_transparency

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") Transparency;
		virtual void Transparency (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* call_togl_update

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACUnderLayer:
	:type ACUnderLayer: Aspect_CLayer2d &
	:param ACOverLayer:
	:type ACOverLayer: Aspect_CLayer2d &
	:rtype: void
") Update;
		virtual void Update (const Graphic3d_CView & ACView,const Aspect_CLayer2d & ACUnderLayer,const Aspect_CLayer2d & ACOverLayer);
		%feature("compactdefaultargs") View;
		%feature("autodoc", "	* call_togl_view

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: bool
") View;
		virtual Standard_Boolean View (Graphic3d_CView & ACView);
		%feature("compactdefaultargs") ViewMapping;
		%feature("autodoc", "	* call_togl_viewmapping

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AWait:
	:type AWait: bool
	:rtype: void
") ViewMapping;
		virtual void ViewMapping (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("compactdefaultargs") ViewOrientation;
		%feature("autodoc", "	* call_togl_vieworientation

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AWait:
	:type AWait: bool
	:rtype: void
") ViewOrientation;
		virtual void ViewOrientation (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("compactdefaultargs") Environment;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") Environment;
		virtual void Environment (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") SetStencilTestOptions;
		%feature("autodoc", "	* sets the stencil test to theIsEnabled state;

	:param theCGroup:
	:type theCGroup: Graphic3d_CGroup &
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: void
") SetStencilTestOptions;
		virtual void SetStencilTestOptions (const Graphic3d_CGroup & theCGroup,const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") SetFlippingOptions;
		%feature("autodoc", "	* sets the flipping to theIsEnabled state for the given graphic group.

	:param theCGroup:
	:type theCGroup: Graphic3d_CGroup &
	:param theIsEnabled:
	:type theIsEnabled: bool
	:param theRefPlane:
	:type theRefPlane: gp_Ax2
	:rtype: void
") SetFlippingOptions;
		virtual void SetFlippingOptions (const Graphic3d_CGroup & theCGroup,const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* call_togl_text

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param AAngle:
	:type AAngle: Quantity_PlaneAngle
	:param ATp:
	:type ATp: Graphic3d_TextPath
	:param AHta:
	:type AHta: Graphic3d_HorizontalTextAlignment
	:param AVta:
	:type AVta: Graphic3d_VerticalTextAlignment
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: void
") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* call_togl_text

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: void
") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* call_togl_text

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AText:
	:type AText: TCollection_ExtendedString &
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param AAngle:
	:type AAngle: Quantity_PlaneAngle
	:param ATp:
	:type ATp: Graphic3d_TextPath
	:param AHta:
	:type AHta: Graphic3d_HorizontalTextAlignment
	:param AVta:
	:type AVta: Graphic3d_VerticalTextAlignment
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: void
") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* call_togl_text

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AText:
	:type AText: TCollection_ExtendedString &
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: void
") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") PrimitiveArray;
		%feature("autodoc", "	* call_togl_parray

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param parray:
	:type parray: Graphic3d_PrimitiveArray &
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: void
") PrimitiveArray;
		virtual void PrimitiveArray (const Graphic3d_CGroup & ACGroup,const Graphic3d_PrimitiveArray & parray,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") UserDraw;
		%feature("autodoc", "	* call_togl_userdraw

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AUserDraw:
	:type AUserDraw: Graphic3d_CUserDraw &
	:rtype: void
") UserDraw;
		virtual void UserDraw (const Graphic3d_CGroup & ACGroup,const Graphic3d_CUserDraw & AUserDraw);
		%feature("compactdefaultargs") EnableVBO;
		%feature("autodoc", "	* enables/disables usage of OpenGL vertex buffer arrays while drawing primitiev arrays

	:param status:
	:type status: bool
	:rtype: void
") EnableVBO;
		virtual void EnableVBO (const Standard_Boolean status);
		%feature("compactdefaultargs") MemoryInfo;
		%feature("autodoc", "	* Returns information about GPU memory usage.

	:param theFreeBytes:
	:type theFreeBytes: Standard_Size &
	:param theInfo:
	:type theInfo: TCollection_AsciiString &
	:rtype: bool
") MemoryInfo;
		virtual Standard_Boolean MemoryInfo (Standard_Size & theFreeBytes,TCollection_AsciiString & theInfo);
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "	* call_togl_ztriedron_setup

	:param XColor: default value is Quantity_NOC_RED
	:type XColor: Quantity_NameOfColor
	:param YColor: default value is Quantity_NOC_GREEN
	:type YColor: Quantity_NameOfColor
	:param ZColor: default value is Quantity_NOC_BLUE1
	:type ZColor: Quantity_NameOfColor
	:param SizeRatio: default value is 0.8
	:type SizeRatio: float
	:param AxisDiametr: default value is 0.05
	:type AxisDiametr: float
	:param NbFacettes: default value is 12
	:type NbFacettes: int
	:rtype: void
") ZBufferTriedronSetup;
		virtual void ZBufferTriedronSetup (const Quantity_NameOfColor XColor = Quantity_NOC_RED,const Quantity_NameOfColor YColor = Quantity_NOC_GREEN,const Quantity_NameOfColor ZColor = Quantity_NOC_BLUE1,const Standard_Real SizeRatio = 0.8,const Standard_Real AxisDiametr = 0.05,const Standard_Integer NbFacettes = 12);
		%feature("compactdefaultargs") TriedronDisplay;
		%feature("autodoc", "	* call_togl_triedron_display

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param APosition: default value is Aspect_TOTP_CENTER
	:type APosition: Aspect_TypeOfTriedronPosition
	:param AColor: default value is Quantity_NOC_WHITE
	:type AColor: Quantity_NameOfColor
	:param AScale: default value is 0.02
	:type AScale: float
	:param AsWireframe: default value is Standard_True
	:type AsWireframe: bool
	:rtype: void
") TriedronDisplay;
		virtual void TriedronDisplay (const Graphic3d_CView & ACView,const Aspect_TypeOfTriedronPosition APosition = Aspect_TOTP_CENTER,const Quantity_NameOfColor AColor = Quantity_NOC_WHITE,const Standard_Real AScale = 0.02,const Standard_Boolean AsWireframe = Standard_True);
		%feature("compactdefaultargs") TriedronErase;
		%feature("autodoc", "	* call_togl_triedron_erase

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") TriedronErase;
		virtual void TriedronErase (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") TriedronEcho;
		%feature("autodoc", "	* call_togl_triedron_echo

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AType: default value is Aspect_TOTE_NONE
	:type AType: Aspect_TypeOfTriedronEcho
	:rtype: void
") TriedronEcho;
		virtual void TriedronEcho (const Graphic3d_CView & ACView,const Aspect_TypeOfTriedronEcho AType = Aspect_TOTE_NONE);
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "	* call_togl_graduatedtrihedron_display

	:param view:
	:type view: Graphic3d_CView &
	:param cubic:
	:type cubic: Graphic3d_CGraduatedTrihedron &
	:rtype: void
") GraduatedTrihedronDisplay;
		virtual void GraduatedTrihedronDisplay (const Graphic3d_CView & view,const Graphic3d_CGraduatedTrihedron & cubic);
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "	* call_togl_graduatedtrihedron_erase

	:param view:
	:type view: Graphic3d_CView &
	:rtype: void
") GraduatedTrihedronErase;
		virtual void GraduatedTrihedronErase (const Graphic3d_CView & view);
		%feature("compactdefaultargs") GraduatedTrihedronMinMaxValues;
		%feature("autodoc", "	* call_togl_graduatedtrihedron_minmaxvalues

	:param xmin:
	:type xmin: Standard_ShortReal
	:param ymin:
	:type ymin: Standard_ShortReal
	:param zmin:
	:type zmin: Standard_ShortReal
	:param xmax:
	:type xmax: Standard_ShortReal
	:param ymax:
	:type ymax: Standard_ShortReal
	:param zmax:
	:type zmax: Standard_ShortReal
	:rtype: void
") GraduatedTrihedronMinMaxValues;
		virtual void GraduatedTrihedronMinMaxValues (const Standard_ShortReal xmin,const Standard_ShortReal ymin,const Standard_ShortReal zmin,const Standard_ShortReal xmax,const Standard_ShortReal ymax,const Standard_ShortReal zmax);
		%feature("compactdefaultargs") BeginAddMode;
		%feature("autodoc", "	* call_togl_begin_ajout_mode

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: bool
") BeginAddMode;
		virtual Standard_Boolean BeginAddMode (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") EndAddMode;
		%feature("autodoc", "	* call_togl_end_ajout_mode

	:rtype: void
") EndAddMode;
		virtual void EndAddMode ();
		%feature("compactdefaultargs") SetImmediateModeDrawToFront;
		%feature("autodoc", "	* @param theDrawToFrontBuffer Advanced option to modify rendering mode: 1. True. Drawing immediate mode structures directly to the front buffer over the scene image. Fast, so preferred for interactive work (used by default). However these extra drawings will be missed in image dump since it is performed from back buffer. Notice that since no pre-buffering used the V-Sync will be ignored and rendering could be seen in run-time (in case of slow hardware) and/or tearing may appear. So this is strongly recommended to draw only simple (fast) structures. 2. False. Drawing immediate mode structures to the back buffer. The complete scene is redrawn first, so this mode is slower if scene contains complex data and/or V-Sync is turned on. But it works in any case and is especially useful for view dump because the dump image is read from the back buffer. returns previous mode.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theDrawToFrontBuffer:
	:type theDrawToFrontBuffer: bool
	:rtype: bool
") SetImmediateModeDrawToFront;
		virtual Standard_Boolean SetImmediateModeDrawToFront (const Graphic3d_CView & theCView,const Standard_Boolean theDrawToFrontBuffer);
		%feature("compactdefaultargs") BeginImmediatMode;
		%feature("autodoc", "	* call_togl_begin_immediat_mode

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACUnderLayer:
	:type ACUnderLayer: Aspect_CLayer2d &
	:param ACOverLayer:
	:type ACOverLayer: Aspect_CLayer2d &
	:param DoubleBuffer:
	:type DoubleBuffer: bool
	:param RetainMode:
	:type RetainMode: bool
	:rtype: bool
") BeginImmediatMode;
		virtual Standard_Boolean BeginImmediatMode (const Graphic3d_CView & ACView,const Aspect_CLayer2d & ACUnderLayer,const Aspect_CLayer2d & ACOverLayer,const Standard_Boolean DoubleBuffer,const Standard_Boolean RetainMode);
		%feature("compactdefaultargs") ClearImmediatMode;
		%feature("autodoc", "	* call_togl_clear_immediat_mode

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param aFlush: default value is Standard_True
	:type aFlush: bool
	:rtype: void
") ClearImmediatMode;
		virtual void ClearImmediatMode (const Graphic3d_CView & ACView,const Standard_Boolean aFlush = Standard_True);
		%feature("compactdefaultargs") DrawStructure;
		%feature("autodoc", "	* call_togl_draw_structure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") DrawStructure;
		virtual void DrawStructure (const Graphic3d_CStructure & ACStructure);
		%feature("compactdefaultargs") EndImmediatMode;
		%feature("autodoc", "	* call_togl_end_immediat_mode

	:param Synchronize:
	:type Synchronize: int
	:rtype: void
") EndImmediatMode;
		virtual void EndImmediatMode (const Standard_Integer Synchronize);
		%feature("compactdefaultargs") Layer;
		%feature("autodoc", "	* call_togl_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") Layer;
		virtual void Layer (Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") RemoveLayer;
		%feature("autodoc", "	* call_togl_removelayer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") RemoveLayer;
		virtual void RemoveLayer (const Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") BeginLayer;
		%feature("autodoc", "	* call_togl_begin_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") BeginLayer;
		virtual void BeginLayer (const Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") BeginPolygon2d;
		%feature("autodoc", "	* call_togl_begin_polygon2d

	:rtype: void
") BeginPolygon2d;
		virtual void BeginPolygon2d ();
		%feature("compactdefaultargs") BeginPolyline2d;
		%feature("autodoc", "	* call_togl_begin_polyline2d

	:rtype: void
") BeginPolyline2d;
		virtual void BeginPolyline2d ();
		%feature("compactdefaultargs") ClearLayer;
		%feature("autodoc", "	* call_togl_clear_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") ClearLayer;
		virtual void ClearLayer (const Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "	* call_togl_draw2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Draw;
		virtual void Draw (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* call_togl_edge2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Edge;
		virtual void Edge (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("compactdefaultargs") EndLayer;
		%feature("autodoc", "	* call_togl_end_layer2d

	:rtype: void
") EndLayer;
		virtual void EndLayer ();
		%feature("compactdefaultargs") EndPolygon2d;
		%feature("autodoc", "	* call_togl_end_polygon2d

	:rtype: void
") EndPolygon2d;
		virtual void EndPolygon2d ();
		%feature("compactdefaultargs") EndPolyline2d;
		%feature("autodoc", "	* call_togl_end_polyline2d

	:rtype: void
") EndPolyline2d;
		virtual void EndPolyline2d ();
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* call_togl_move2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Move;
		virtual void Move (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("compactdefaultargs") Rectangle;
		%feature("autodoc", "	* call_togl_rectangle2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Width:
	:type Width: Standard_ShortReal
	:param Height:
	:type Height: Standard_ShortReal
	:rtype: void
") Rectangle;
		virtual void Rectangle (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Width,const Standard_ShortReal Height);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* call_togl_set_color

	:param R:
	:type R: Standard_ShortReal
	:param G:
	:type G: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:rtype: void
") SetColor;
		virtual void SetColor (const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* call_togl_set_transparency

	:param ATransparency:
	:type ATransparency: Standard_ShortReal
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_ShortReal ATransparency);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* call_togl_unset_transparency

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("compactdefaultargs") SetLineAttributes;
		%feature("autodoc", "	* call_togl_set_line_attributes

	:param Type:
	:type Type: int
	:param Width:
	:type Width: Standard_ShortReal
	:rtype: void
") SetLineAttributes;
		virtual void SetLineAttributes (const Standard_Integer Type,const Standard_ShortReal Width);
		%feature("compactdefaultargs") SetTextAttributes;
		%feature("autodoc", "	* Set text attributes for under-/overlayer. <Font> argument defines the name of the font to be used, <Type> argument defines the display type of the text, <R> <G> <B> values define the color of decal or subtitle background. To set the color of the text you can use the SetColor method.

	:param Font:
	:type Font: char *
	:param Type:
	:type Type: int
	:param R:
	:type R: Standard_ShortReal
	:param G:
	:type G: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:rtype: void
") SetTextAttributes;
		virtual void SetTextAttributes (const char * Font,const Standard_Integer Type,const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* call_togl_text2d If AHeight < 0 default text height is used by driver (DefaultTextHeight method)

	:param AText:
	:type AText: char *
	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param AHeight:
	:type AHeight: Standard_ShortReal
	:rtype: void
") Text;
		virtual void Text (const char * AText,const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal AHeight);
		%feature("compactdefaultargs") DefaultTextHeight;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") DefaultTextHeight;
		virtual Standard_ShortReal DefaultTextHeight ();
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "	* call_togl_textsize2d

	:param AText:
	:type AText: char *
	:param AHeight:
	:type AHeight: Standard_ShortReal
	:param AWidth:
	:type AWidth: Standard_ShortReal &
	:param AnAscent:
	:type AnAscent: Standard_ShortReal &
	:param ADescent:
	:type ADescent: Standard_ShortReal &
	:rtype: void
") TextSize;
		virtual void TextSize (const char * AText,const Standard_ShortReal AHeight,Standard_ShortReal & AWidth,Standard_ShortReal & AnAscent,Standard_ShortReal & ADescent);
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "	* call_togl_backfacing

	:param aView:
	:type aView: Graphic3d_CView &
	:rtype: void
") SetBackFacingModel;
		virtual void SetBackFacingModel (const Graphic3d_CView & aView);
		%feature("compactdefaultargs") SetDepthTestEnabled;
		%feature("autodoc", "	* call_togl_depthtest

	:param view:
	:type view: Graphic3d_CView &
	:param isEnabled:
	:type isEnabled: bool
	:rtype: void
") SetDepthTestEnabled;
		virtual void SetDepthTestEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("compactdefaultargs") IsDepthTestEnabled;
		%feature("autodoc", "	* call_togl_isdepthtest

	:param view:
	:type view: Graphic3d_CView &
	:rtype: bool
") IsDepthTestEnabled;
		virtual Standard_Boolean IsDepthTestEnabled (const Graphic3d_CView & view);
		%feature("compactdefaultargs") ReadDepths;
		%feature("autodoc", "	* Reads depths of shown pixels of the given rectangle (glReadPixels with GL_DEPTH_COMPONENT)

	:param view:
	:type view: Graphic3d_CView &
	:param x:
	:type x: int
	:param y:
	:type y: int
	:param width:
	:type width: int
	:param height:
	:type height: int
	:param buffer:
	:type buffer: Standard_Address
	:rtype: void
") ReadDepths;
		virtual void ReadDepths (const Graphic3d_CView & view,const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height,const Standard_Address buffer);
		%feature("compactdefaultargs") FBOCreate;
		%feature("autodoc", "	* Generate offscreen FBO in the graphic library. If not supported on hardware returns NULL.

	:param view:
	:type view: Graphic3d_CView &
	:param width:
	:type width: int
	:param height:
	:type height: int
	:rtype: Graphic3d_PtrFrameBuffer
") FBOCreate;
		virtual Graphic3d_PtrFrameBuffer FBOCreate (const Graphic3d_CView & view,const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") FBORelease;
		%feature("autodoc", "	* Remove offscreen FBO from the graphic library

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:rtype: void
") FBORelease;
		virtual void FBORelease (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr);
		%feature("compactdefaultargs") FBOGetDimensions;
		%feature("autodoc", "	* Read offscreen FBO configuration.

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer
	:param width:
	:type width: int &
	:param height:
	:type height: int &
	:param widthMax:
	:type widthMax: int &
	:param heightMax:
	:type heightMax: int &
	:rtype: void
") FBOGetDimensions;
		virtual void FBOGetDimensions (const Graphic3d_CView & view,const Graphic3d_PtrFrameBuffer fboPtr,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") FBOChangeViewport;
		%feature("autodoc", "	* Change offscreen FBO viewport.

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:param width:
	:type width: int
	:param height:
	:type height: int
	:rtype: void
") FBOChangeViewport;
		virtual void FBOChangeViewport (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr,const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") BufferDump;
		%feature("autodoc", "	* Dump active rendering buffer into specified memory buffer.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theImage:
	:type theImage: Image_PixMap &
	:param theBufferType:
	:type theBufferType: Graphic3d_BufferType &
	:rtype: bool
") BufferDump;
		virtual Standard_Boolean BufferDump (const Graphic3d_CView & theCView,Image_PixMap & theImage,const Graphic3d_BufferType & theBufferType);
		%feature("compactdefaultargs") SetGLLightEnabled;
		%feature("autodoc", "	* call_togl_gllight

	:param view:
	:type view: Graphic3d_CView &
	:param isEnabled:
	:type isEnabled: bool
	:rtype: void
") SetGLLightEnabled;
		virtual void SetGLLightEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("compactdefaultargs") IsGLLightEnabled;
		%feature("autodoc", "	* call_togl_isgllight

	:param view:
	:type view: Graphic3d_CView &
	:rtype: bool
") IsGLLightEnabled;
		virtual Standard_Boolean IsGLLightEnabled (const Graphic3d_CView & view);
		%feature("compactdefaultargs") Export;
		%feature("autodoc", "	* Export scene into the one of the Vector graphics formats (SVG, PS, PDF...). In contrast to Bitmaps, Vector graphics is scalable (so you may got quality benefits on printing to laser printer). Notice however that results may differ a lot and do not contain some elements.

	:param theFileName:
	:type theFileName: char *
	:param theFormat:
	:type theFormat: Graphic3d_ExportFormat
	:param theSortType:
	:type theSortType: Graphic3d_SortType
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theView:
	:type theView: Graphic3d_CView &
	:param theLayerUnder:
	:type theLayerUnder: Aspect_CLayer2d &
	:param theLayerOver:
	:type theLayerOver: Aspect_CLayer2d &
	:param thePrecision: default value is 0.005
	:type thePrecision: float
	:param theProgressBarFunc: default value is NULL
	:type theProgressBarFunc: Standard_Address
	:param theProgressObject: default value is NULL
	:type theProgressObject: Standard_Address
	:rtype: bool
") Export;
		virtual Standard_Boolean Export (const char * theFileName,const Graphic3d_ExportFormat theFormat,const Graphic3d_SortType theSortType,const Standard_Integer theWidth,const Standard_Integer theHeight,const Graphic3d_CView & theView,const Aspect_CLayer2d & theLayerUnder,const Aspect_CLayer2d & theLayerOver,const Standard_Real thePrecision = 0.005,const Standard_Address theProgressBarFunc = NULL,const Standard_Address theProgressObject = NULL);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level z layer with ID <theLayerId> for the view. Z layers allow drawing structures in higher layers in foreground of structures in lower layers. To add a structure to desired layer on display it is necessary to set the layer ID for the structure.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: int
	:rtype: void
") AddZLayer;
		virtual void AddZLayer (const Graphic3d_CView & theCView,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer from the specified view. All structures displayed at the moment in layer will be displayed in default layer ( the bottom-level z layer ). To unset layer ID from associated structures use method UnsetZLayer (...).

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: int
	:rtype: void
") RemoveZLayer;
		virtual void RemoveZLayer (const Graphic3d_CView & theCView,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") UnsetZLayer;
		%feature("autodoc", "	* Unset Z layer ID for all structures. The structure indexes will be set to default layer ( the bottom-level z layer with ID = 0 ).

	:param theLayerId:
	:type theLayerId: int
	:rtype: void
") UnsetZLayer;
		virtual void UnsetZLayer (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "	* Change Z layer of a structure. The new z layer ID will be used to define the associated layer for structure on display.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:param theLayerId:
	:type theLayerId: int
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Graphic3d_CStructure & theCStructure,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "	* Change Z layer of a structure already presented in view.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theNewLayerId:
	:type theNewLayerId: int
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Graphic3d_CStructure & theCStructure,const Graphic3d_CView & theCView,const Standard_Integer theNewLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID of structure. If the structure doesn't exists in graphic driver, the method returns -1.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:rtype: int
") GetZLayer;
		virtual Standard_Integer GetZLayer (const Graphic3d_CStructure & theCStructure);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer of specified view.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: void
") SetZLayerSettings;
		virtual void SetZLayerSettings (const Graphic3d_CView & theCView,const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("compactdefaultargs") PrintBoolean;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: bool
	:rtype: None
") PrintBoolean;
		void PrintBoolean (const char * AComment,const Standard_Boolean AValue);
		%feature("compactdefaultargs") PrintCGroup;
		%feature("autodoc", "	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCGroup;
		void PrintCGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintCLight;
		%feature("autodoc", "	:param ACLight:
	:type ACLight: Graphic3d_CLight &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCLight;
		void PrintCLight (const Graphic3d_CLight & ACLight,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintCPick;
		%feature("autodoc", "	:param ACPick:
	:type ACPick: Graphic3d_CPick &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCPick;
		void PrintCPick (const Graphic3d_CPick & ACPick,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintCStructure;
		%feature("autodoc", "	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCStructure;
		void PrintCStructure (const Graphic3d_CStructure & ACStructure,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintCView;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCView;
		void PrintCView (const Graphic3d_CView & ACView,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintFunction;
		%feature("autodoc", "	:param AFunc:
	:type AFunc: char *
	:rtype: None
") PrintFunction;
		void PrintFunction (const char * AFunc);
		%feature("compactdefaultargs") PrintInteger;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: int
	:rtype: None
") PrintInteger;
		void PrintInteger (const char * AComment,const Standard_Integer AValue);
		%feature("compactdefaultargs") PrintIResult;
		%feature("autodoc", "	:param AFunc:
	:type AFunc: char *
	:param AResult:
	:type AResult: int
	:rtype: None
") PrintIResult;
		void PrintIResult (const char * AFunc,const Standard_Integer AResult);
		%feature("compactdefaultargs") PrintShortReal;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: Standard_ShortReal
	:rtype: None
") PrintShortReal;
		void PrintShortReal (const char * AComment,const Standard_ShortReal AValue);
		%feature("compactdefaultargs") PrintMatrix;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") PrintMatrix;
		void PrintMatrix (const char * AComment,const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") PrintString;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AString:
	:type AString: char *
	:rtype: None
") PrintString;
		void PrintString (const char * AComment,const char * AString);
		%feature("compactdefaultargs") SetTrace;
		%feature("autodoc", "	:param ALevel:
	:type ALevel: int
	:rtype: None
") SetTrace;
		void SetTrace (const Standard_Integer ALevel);
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "	:rtype: int
") Trace;
		Standard_Integer Trace ();
		%feature("compactdefaultargs") GetDisplayConnection;
		%feature("autodoc", "	* returns Handle to display connection

	:rtype: Aspect_DisplayConnection_Handle
") GetDisplayConnection;
		const Aspect_DisplayConnection_Handle & GetDisplayConnection ();
		%feature("compactdefaultargs") IsDeviceLost;
		%feature("autodoc", "	:rtype: bool
") IsDeviceLost;
		Standard_Boolean IsDeviceLost ();
		%feature("compactdefaultargs") ResetDeviceLostFlag;
		%feature("autodoc", "	:rtype: None
") ResetDeviceLostFlag;
		void ResetDeviceLostFlag ();
};


%extend Graphic3d_GraphicDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_GraphicDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_GraphicDriver::Handle_Graphic3d_GraphicDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_GraphicDriver;
class Handle_Graphic3d_GraphicDriver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_GraphicDriver();
        Handle_Graphic3d_GraphicDriver(const Handle_Graphic3d_GraphicDriver &aHandle);
        Handle_Graphic3d_GraphicDriver(const Graphic3d_GraphicDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_GraphicDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_GraphicDriver {
    Graphic3d_GraphicDriver* GetObject() {
    return (Graphic3d_GraphicDriver*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Group;
class Graphic3d_Group : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_Group;
		%feature("autodoc", "	* Creates a group in the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Graphic3d_Group;
		 Graphic3d_Group (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Supress all primitives and attributes of <self>. To clear group without update in Graphic3d_StructureManager pass Standard_False as <theUpdateStructureMgr>. This used on context and viewer destruction, when the pointer to structure manager in Graphic3d_Structure could be already released (pointers are used here to avoid handle cross-reference);

	:param theUpdateStructureMgr: default value is Standard_True
	:type theUpdateStructureMgr: bool
	:rtype: None
") Clear;
		void Clear (const Standard_Boolean theUpdateStructureMgr = Standard_True);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Supress the group <self> in the structure.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Supress the group <self> in the structure. Warning: No more graphic operations in <self> after this call. Modifies the current modelling transform persistence (pan, zoom or rotate) Get the current modelling transform persistence (pan, zoom or rotate)

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the line primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the face primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the text primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the marker primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("compactdefaultargs") SetMinMaxValues;
		%feature("autodoc", "	* Sets the coordinates of the boundary box of the group <self>.

	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param ZMin:
	:type ZMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param ZMax:
	:type ZMax: float
	:rtype: None
") SetMinMaxValues;
		void SetMinMaxValues (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real ZMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real ZMax);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text.  (Relative to the Normalized Projection Coordinates (NPC) Space). AAngle : Orientation of the text  (with respect to the horizontal).

	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param AAngle:
	:type AAngle: Quantity_PlaneAngle
	:param ATp:
	:type ATp: Graphic3d_TextPath
	:param AHta:
	:type AHta: Graphic3d_HorizontalTextAlignment
	:param AVta:
	:type AVta: Graphic3d_VerticalTextAlignment
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") Text;
		void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text.  (Relative to the Normalized Projection Coordinates (NPC) Space). The other attributes have the following default values: AAngle : PI / 2. ATp : TP_RIGHT AHta : HTA_LEFT AVta : VTA_BOTTOM

	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") Text;
		void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text.  (Relative to the Normalized Projection Coordinates (NPC) Space). AAngle : Orientation of the text  (with respect to the horizontal).

	:param AText:
	:type AText: TCollection_ExtendedString &
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param AAngle:
	:type AAngle: Quantity_PlaneAngle
	:param ATp:
	:type ATp: Graphic3d_TextPath
	:param AHta:
	:type AHta: Graphic3d_HorizontalTextAlignment
	:param AVta:
	:type AVta: Graphic3d_VerticalTextAlignment
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text.  (Relative to the Normalized Projection Coordinates (NPC) Space). The other attributes have the following default values: AAngle : PI / 2. ATp : TP_RIGHT AHta : HTA_LEFT AVta : VTA_BOTTOM

	:param AText:
	:type AText: TCollection_ExtendedString &
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "	* Adds an array of primitives for display

	:param elem:
	:type elem: Handle_Graphic3d_ArrayOfPrimitives &
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") AddPrimitiveArray;
		void AddPrimitiveArray (const Handle_Graphic3d_ArrayOfPrimitives & elem,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "	* Creates a primitive array with single marker using AddPrimitiveArray().

	:param thePoint:
	:type thePoint: Graphic3d_Vertex &
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: None
") Marker;
		void Marker (const Graphic3d_Vertex & thePoint,const Standard_Boolean theToEvalMinMax = Standard_True);
		%feature("compactdefaultargs") UserDraw;
		%feature("autodoc", "	* Creates an UserDraw primitive Category: Methods to create UserDraw Warning: Raises GroupDefinitionError if ...

	:param AnObject:
	:type AnObject: Standard_Address
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:param ContainsFacet: default value is Standard_False
	:type ContainsFacet: bool
	:rtype: None
") UserDraw;
		void UserDraw (const Standard_Address AnObject,const Standard_Boolean EvalMinMax = Standard_True,const Standard_Boolean ContainsFacet = Standard_False);
		%feature("compactdefaultargs") SetStencilTestOptions;
		%feature("autodoc", "	* sets the stencil test to theIsEnabled state;

	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None
") SetStencilTestOptions;
		void SetStencilTestOptions (const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") SetFlippingOptions;
		%feature("autodoc", "	* sets the flipping to theIsEnabled state.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:param theRefPlane:
	:type theRefPlane: gp_Ax2
	:rtype: None
") SetFlippingOptions;
		void SetFlippingOptions (const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);
		%feature("compactdefaultargs") IsGroupPrimitivesAspectSet;
		%feature("autodoc", "	* Returns True if aspect is set for the group.

	:param theAspect:
	:type theAspect: Graphic3d_GroupAspect
	:rtype: bool
") IsGroupPrimitivesAspectSet;
		Standard_Boolean IsGroupPrimitivesAspectSet (const Graphic3d_GroupAspect theAspect);
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if the group <self> contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns Standard_True if the group <self> is deleted. <self> is deleted after the call Remove (me) or the associated structure is deleted.

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns Standard_True if the group <self> is empty.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of the group <self>.

	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param ZMin:
	:type ZMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:param ZMax:
	:type ZMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "	* Returns the structure containing the group <self>.

	:rtype: Handle_Graphic3d_Structure
") Structure;
		Handle_Graphic3d_Structure Structure ();
};


%extend Graphic3d_Group {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Group(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Group::Handle_Graphic3d_Group %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Group;
class Handle_Graphic3d_Group : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_Group();
        Handle_Graphic3d_Group(const Handle_Graphic3d_Group &aHandle);
        Handle_Graphic3d_Group(const Graphic3d_Group *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Group DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Group {
    Graphic3d_Group* GetObject() {
    return (Graphic3d_Group*)$self->Access();
    }
};

%nodefaultctor Graphic3d_HSequenceOfGroup;
class Graphic3d_HSequenceOfGroup : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_HSequenceOfGroup;
		%feature("autodoc", "	:rtype: None
") Graphic3d_HSequenceOfGroup;
		 Graphic3d_HSequenceOfGroup ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_HSequenceOfGroup
") Split;
		Handle_Graphic3d_HSequenceOfGroup Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_Group
") ChangeValue;
		Handle_Graphic3d_Group ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfGroup
") Sequence;
		const Graphic3d_SequenceOfGroup & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfGroup
") ChangeSequence;
		Graphic3d_SequenceOfGroup & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_HSequenceOfGroup
") ShallowCopy;
		Handle_Graphic3d_HSequenceOfGroup ShallowCopy ();
};


%extend Graphic3d_HSequenceOfGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_HSequenceOfGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_HSequenceOfGroup::Handle_Graphic3d_HSequenceOfGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_HSequenceOfGroup;
class Handle_Graphic3d_HSequenceOfGroup : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_HSequenceOfGroup();
        Handle_Graphic3d_HSequenceOfGroup(const Handle_Graphic3d_HSequenceOfGroup &aHandle);
        Handle_Graphic3d_HSequenceOfGroup(const Graphic3d_HSequenceOfGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_HSequenceOfGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_HSequenceOfGroup {
    Graphic3d_HSequenceOfGroup* GetObject() {
    return (Graphic3d_HSequenceOfGroup*)$self->Access();
    }
};

%nodefaultctor Graphic3d_HSequenceOfStructure;
class Graphic3d_HSequenceOfStructure : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_HSequenceOfStructure;
		%feature("autodoc", "	:rtype: None
") Graphic3d_HSequenceOfStructure;
		 Graphic3d_HSequenceOfStructure ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_HSequenceOfStructure
") Split;
		Handle_Graphic3d_HSequenceOfStructure Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_Structure
") Value;
		Handle_Graphic3d_Structure Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_Structure
") ChangeValue;
		Handle_Graphic3d_Structure ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfStructure
") Sequence;
		const Graphic3d_SequenceOfStructure & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfStructure
") ChangeSequence;
		Graphic3d_SequenceOfStructure & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_HSequenceOfStructure
") ShallowCopy;
		Handle_Graphic3d_HSequenceOfStructure ShallowCopy ();
};


%extend Graphic3d_HSequenceOfStructure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_HSequenceOfStructure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_HSequenceOfStructure::Handle_Graphic3d_HSequenceOfStructure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_HSequenceOfStructure;
class Handle_Graphic3d_HSequenceOfStructure : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_HSequenceOfStructure();
        Handle_Graphic3d_HSequenceOfStructure(const Handle_Graphic3d_HSequenceOfStructure &aHandle);
        Handle_Graphic3d_HSequenceOfStructure(const Graphic3d_HSequenceOfStructure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_HSequenceOfStructure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_HSequenceOfStructure {
    Graphic3d_HSequenceOfStructure* GetObject() {
    return (Graphic3d_HSequenceOfStructure*)$self->Access();
    }
};

%nodefaultctor Graphic3d_HSetOfGroup;
class Graphic3d_HSetOfGroup : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_HSetOfGroup;
		%feature("autodoc", "	:rtype: None
") Graphic3d_HSetOfGroup;
		 Graphic3d_HSetOfGroup ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "	:param B:
	:type B: Handle_Graphic3d_HSetOfGroup &
	:rtype: Handle_Graphic3d_HSetOfGroup
") Union;
		Handle_Graphic3d_HSetOfGroup Union (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param B:
	:type B: Handle_Graphic3d_HSetOfGroup &
	:rtype: Handle_Graphic3d_HSetOfGroup
") Intersection;
		Handle_Graphic3d_HSetOfGroup Intersection (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "	:param B:
	:type B: Handle_Graphic3d_HSetOfGroup &
	:rtype: Handle_Graphic3d_HSetOfGroup
") Difference;
		Handle_Graphic3d_HSetOfGroup Difference (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") IsASubset;
		%feature("autodoc", "	:param S:
	:type S: Handle_Graphic3d_HSetOfGroup &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Handle_Graphic3d_HSetOfGroup & S);
		%feature("compactdefaultargs") IsAProperSubset;
		%feature("autodoc", "	:param S:
	:type S: Handle_Graphic3d_HSetOfGroup &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_Graphic3d_HSetOfGroup & S);
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_HSetOfGroup
") ShallowCopy;
		Handle_Graphic3d_HSetOfGroup ShallowCopy ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:rtype: Graphic3d_SetOfGroup
") Set;
		const Graphic3d_SetOfGroup & Set ();
		%feature("compactdefaultargs") ChangeSet;
		%feature("autodoc", "	:rtype: Graphic3d_SetOfGroup
") ChangeSet;
		Graphic3d_SetOfGroup & ChangeSet ();
};


%extend Graphic3d_HSetOfGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_HSetOfGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_HSetOfGroup::Handle_Graphic3d_HSetOfGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_HSetOfGroup;
class Handle_Graphic3d_HSetOfGroup : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_HSetOfGroup();
        Handle_Graphic3d_HSetOfGroup(const Handle_Graphic3d_HSetOfGroup &aHandle);
        Handle_Graphic3d_HSetOfGroup(const Graphic3d_HSetOfGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_HSetOfGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_HSetOfGroup {
    Graphic3d_HSetOfGroup* GetObject() {
    return (Graphic3d_HSetOfGroup*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ListIteratorOfListOfPArray;
class Graphic3d_ListIteratorOfListOfPArray {
	public:
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfListOfPArray;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListIteratorOfListOfPArray;
		 Graphic3d_ListIteratorOfListOfPArray ();
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfListOfPArray;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfPArray &
	:rtype: None
") Graphic3d_ListIteratorOfListOfPArray;
		 Graphic3d_ListIteratorOfListOfPArray (const Graphic3d_ListOfPArray & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfPArray &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_ListOfPArray & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") Value;
		Handle_Graphic3d_ArrayOfPrimitives Value ();
};


%nodefaultctor Graphic3d_ListIteratorOfListOfShortReal;
class Graphic3d_ListIteratorOfListOfShortReal {
	public:
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfListOfShortReal;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal ();
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfListOfShortReal;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfShortReal &
	:rtype: None
") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal (const Graphic3d_ListOfShortReal & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfShortReal &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_ListOfShortReal & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
		Standard_ShortReal & Value ();
};


%nodefaultctor Graphic3d_ListIteratorOfSetListOfSetOfGroup;
class Graphic3d_ListIteratorOfSetListOfSetOfGroup {
	public:
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		 Graphic3d_ListIteratorOfSetListOfSetOfGroup ();
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		 Graphic3d_ListIteratorOfSetListOfSetOfGroup (const Graphic3d_SetListOfSetOfGroup & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_SetListOfSetOfGroup & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group Value ();
};


%nodefaultctor Graphic3d_ListNodeOfListOfPArray;
class Graphic3d_ListNodeOfListOfPArray : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Graphic3d_ListNodeOfListOfPArray;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_ListNodeOfListOfPArray;
		 Graphic3d_ListNodeOfListOfPArray (const Handle_Graphic3d_ArrayOfPrimitives & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") Value;
		Handle_Graphic3d_ArrayOfPrimitives Value ();
};


%extend Graphic3d_ListNodeOfListOfPArray {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ListNodeOfListOfPArray(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ListNodeOfListOfPArray::Handle_Graphic3d_ListNodeOfListOfPArray %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ListNodeOfListOfPArray;
class Handle_Graphic3d_ListNodeOfListOfPArray : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Graphic3d_ListNodeOfListOfPArray();
        Handle_Graphic3d_ListNodeOfListOfPArray(const Handle_Graphic3d_ListNodeOfListOfPArray &aHandle);
        Handle_Graphic3d_ListNodeOfListOfPArray(const Graphic3d_ListNodeOfListOfPArray *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ListNodeOfListOfPArray DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ListNodeOfListOfPArray {
    Graphic3d_ListNodeOfListOfPArray* GetObject() {
    return (Graphic3d_ListNodeOfListOfPArray*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ListNodeOfListOfShortReal;
class Graphic3d_ListNodeOfListOfShortReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Graphic3d_ListNodeOfListOfShortReal;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_ListNodeOfListOfShortReal;
		 Graphic3d_ListNodeOfListOfShortReal (const Standard_ShortReal & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
		Standard_ShortReal & Value ();
};


%extend Graphic3d_ListNodeOfListOfShortReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ListNodeOfListOfShortReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ListNodeOfListOfShortReal::Handle_Graphic3d_ListNodeOfListOfShortReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ListNodeOfListOfShortReal;
class Handle_Graphic3d_ListNodeOfListOfShortReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Graphic3d_ListNodeOfListOfShortReal();
        Handle_Graphic3d_ListNodeOfListOfShortReal(const Handle_Graphic3d_ListNodeOfListOfShortReal &aHandle);
        Handle_Graphic3d_ListNodeOfListOfShortReal(const Graphic3d_ListNodeOfListOfShortReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ListNodeOfListOfShortReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ListNodeOfListOfShortReal {
    Graphic3d_ListNodeOfListOfShortReal* GetObject() {
    return (Graphic3d_ListNodeOfListOfShortReal*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ListNodeOfSetListOfSetOfGroup;
class Graphic3d_ListNodeOfSetListOfSetOfGroup : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Graphic3d_ListNodeOfSetListOfSetOfGroup;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_ListNodeOfSetListOfSetOfGroup;
		 Graphic3d_ListNodeOfSetListOfSetOfGroup (const Handle_Graphic3d_Group & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group Value ();
};


%extend Graphic3d_ListNodeOfSetListOfSetOfGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup::Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup;
class Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup();
        Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup(const Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup &aHandle);
        Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup(const Graphic3d_ListNodeOfSetListOfSetOfGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup {
    Graphic3d_ListNodeOfSetListOfSetOfGroup* GetObject() {
    return (Graphic3d_ListNodeOfSetListOfSetOfGroup*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ListOfPArray;
class Graphic3d_ListOfPArray {
	public:
		%feature("compactdefaultargs") Graphic3d_ListOfPArray;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListOfPArray;
		 Graphic3d_ListOfPArray ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") Assign;
		void Assign (const Graphic3d_ListOfPArray & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") operator=;
		void operator = (const Graphic3d_ListOfPArray & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_ArrayOfPrimitives & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_ListOfPArray & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_ArrayOfPrimitives & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") Append;
		void Append (Graphic3d_ListOfPArray & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") First;
		Handle_Graphic3d_ArrayOfPrimitives First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") Last;
		Handle_Graphic3d_ArrayOfPrimitives Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") Remove;
		void Remove (Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertBefore;
		void InsertBefore (Graphic3d_ListOfPArray & Other,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertAfter;
		void InsertAfter (Graphic3d_ListOfPArray & Other,Graphic3d_ListIteratorOfListOfPArray & It);
};


%nodefaultctor Graphic3d_ListOfShortReal;
class Graphic3d_ListOfShortReal {
	public:
		%feature("compactdefaultargs") Graphic3d_ListOfShortReal;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListOfShortReal;
		 Graphic3d_ListOfShortReal ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Assign;
		void Assign (const Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") operator=;
		void operator = (const Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Append;
		void Append (Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") First;
		Standard_ShortReal & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Last;
		Standard_ShortReal & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Remove;
		void Remove (Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (Graphic3d_ListOfShortReal & Other,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (Graphic3d_ListOfShortReal & Other,Graphic3d_ListIteratorOfListOfShortReal & It);
};


%nodefaultctor Graphic3d_MapIteratorOfMapOfStructure;
class Graphic3d_MapIteratorOfMapOfStructure : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Graphic3d_MapIteratorOfMapOfStructure;
		%feature("autodoc", "	:rtype: None
") Graphic3d_MapIteratorOfMapOfStructure;
		 Graphic3d_MapIteratorOfMapOfStructure ();
		%feature("compactdefaultargs") Graphic3d_MapIteratorOfMapOfStructure;
		%feature("autodoc", "	:param aMap:
	:type aMap: Graphic3d_MapOfStructure &
	:rtype: None
") Graphic3d_MapIteratorOfMapOfStructure;
		 Graphic3d_MapIteratorOfMapOfStructure (const Graphic3d_MapOfStructure & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Graphic3d_MapOfStructure &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_MapOfStructure & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Key;
		Handle_Graphic3d_Structure Key ();
};


%nodefaultctor Graphic3d_MapOfStructure;
class Graphic3d_MapOfStructure : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Graphic3d_MapOfStructure;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Graphic3d_MapOfStructure;
		 Graphic3d_MapOfStructure (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_MapOfStructure &
	:rtype: Graphic3d_MapOfStructure
") Assign;
		Graphic3d_MapOfStructure & Assign (const Graphic3d_MapOfStructure & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_MapOfStructure &
	:rtype: Graphic3d_MapOfStructure
") operator=;
		Graphic3d_MapOfStructure & operator = (const Graphic3d_MapOfStructure & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Graphic3d_Structure &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Structure & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Graphic3d_Structure &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Structure & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Graphic3d_Structure &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Structure & aKey);
};


%nodefaultctor Graphic3d_MarkerImage;
class Graphic3d_MarkerImage : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "	* @param theImage - source image

	:param theImage:
	:type theImage: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_Image_PixMap & theImage);
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "	* Creates marker image from array of bytes (method for compatibility with old markers definition). @param theBitMap - source bitmap stored as array of bytes @param theWidth - number of bits in a row @param theHeight - number of bits in a column

	:param theBitMap:
	:type theBitMap: Handle_TColStd_HArray1OfByte &
	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_TColStd_HArray1OfByte & theBitMap,const Standard_Integer & theWidth,const Standard_Integer & theHeight);
		%feature("compactdefaultargs") GetBitMapArray;
		%feature("autodoc", "	* @param theAlphaValue pixels in the image that have alpha value greater than  or equal to this parameter will be stored in bitmap as '1',  others will be stored as '0' returns marker image as array of bytes. If an instance of the class has been initialized with image, it will be converted to bitmap based on the parameter theAlphaValue.

	:param theAlphaValue: default value is 0.5
	:type theAlphaValue: float &
	:rtype: Handle_TColStd_HArray1OfByte
") GetBitMapArray;
		Handle_TColStd_HArray1OfByte GetBitMapArray (const Standard_Real & theAlphaValue = 0.5);
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "	* returns marker image. If an instance of the class has been initialized with a bitmap, it will be converted to image.

	:rtype: Handle_Image_PixMap
") GetImage;
		Handle_Image_PixMap GetImage ();
		%feature("compactdefaultargs") GetImageAlpha;
		%feature("autodoc", "	* returns image alpha as grayscale image. Note that if an instance of the class has been initialized with a bitmap or with grayscale image this method will return exactly the same image as GetImage()

	:rtype: Handle_Image_PixMap
") GetImageAlpha;
		Handle_Image_PixMap GetImageAlpha ();
		%feature("compactdefaultargs") GetImageId;
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageId;
		const TCollection_AsciiString & GetImageId ();
		%feature("compactdefaultargs") GetImageAlphaId;
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId ();
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "	* returns texture size

	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%nodefaultctor Graphic3d_MaterialAspect;
class Graphic3d_MaterialAspect {
	public:
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "	* Creates a material from default values.

	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect ();
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "	* Creates a generic material calls <AName>

	:param AName:
	:type AName: Graphic3d_NameOfMaterial
	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect (const Graphic3d_NameOfMaterial AName);
		%feature("compactdefaultargs") IncreaseShine;
		%feature("autodoc", "	* Increases or decreases the luminosity of <self>. //!	 <ADelta> is a signed percentage.

	:param ADelta:
	:type ADelta: float
	:rtype: None
") IncreaseShine;
		void IncreaseShine (const Standard_Real ADelta);
		%feature("compactdefaultargs") SetAmbient;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is //!	 a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetAmbient;
		void SetAmbient (const Standard_Real AValue);
		%feature("compactdefaultargs") SetDiffuse;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetDiffuse;
		void SetDiffuse (const Standard_Real AValue);
		%feature("compactdefaultargs") SetEmissive;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetEmissive;
		void SetEmissive (const Standard_Real AValue);
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "	* Modifies the luminosity of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetShininess;
		void SetShininess (const Standard_Real AValue);
		%feature("compactdefaultargs") SetSpecular;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetSpecular;
		void SetSpecular (const Standard_Real AValue);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Modifies the transparency coefficient of the surface. <AValue> = 0. opaque. (default) <AValue> = 1. transparent. Transparency is applicable to materials that have at least one of reflection modes (ambient, diffuse, specular or emissive) enabled. See also SetReflectionModeOn() and SetReflectionModeOff() methods. NOTE: In order for transparency specified through this method to take effect, it is necessary to enable transparency in the viewer. This can be done either directly - see Visual3d_ViewManager::SetTransparency(Standard_Boolean), or indirectly - by calling AIS_InteractiveObject::SetTransparency() before an object is added to an interactive context, or by calling AIS_InteractiveContext::SetTransparency() for a given interactive object already displayed. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real AValue);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the ambient colour of the surface. Category: Methods to modify the class definition

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "	* Modifies the ambient colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetAmbientColor;
		void SetAmbientColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "	* Modifies the difuse colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetDiffuseColor;
		void SetDiffuseColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "	* Modifies the specular colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetSpecularColor;
		void SetSpecularColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "	* Modifies the emissive colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetEmissiveColor;
		void SetEmissiveColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetReflectionModeOn;
		%feature("autodoc", "	* Activates the reflective properties of the surface <AType>. //!	 TypeOfReflection : TOR_AMBIENT //!			 TOR_DIFFUSE //!			 TOR_SPECULAR  TOR_EMISSION 1, 2, 3 or 4 types of reflection can be set for a given surface.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOn;
		void SetReflectionModeOn (const Graphic3d_TypeOfReflection AType);
		%feature("compactdefaultargs") SetReflectionModeOff;
		%feature("autodoc", "	* Deactivates the reflective properties of //!	 the surface <AType>. //!	 TypeOfReflection : TOR_AMBIENT //!			 TOR_DIFFUSE //!			 TOR_SPECULAR  TOR_EMISSION 1, 2, 3 or 4 types of reflection can be set off for a given surface. Disabling diffuse and specular reflectance is useful for efficient visualization of large amounts of data as definition of normals for graphic primitives is not needed when only 'all-directional' reflectance is active. NOTE: Disabling all four reflection modes also turns off the following effects: 1. Lighting. Colors of primitives are not affected by the material properties when lighting is off. 2. Transparency.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOff;
		void SetReflectionModeOff (const Graphic3d_TypeOfReflection AType);
		%feature("compactdefaultargs") SetMaterialType;
		%feature("autodoc", "	* Set MyMaterialType to the value of parameter <AType> //!	 TypeOfMaterial : MATERIAL_ASPECT //!			 MATERIAL_PHYSIC

	:param AType:
	:type AType: Graphic3d_TypeOfMaterial
	:rtype: None
") SetMaterialType;
		void SetMaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("compactdefaultargs") SetMaterialName;
		%feature("autodoc", "	* The current matarial become a 'UserDefined' material. //!	 Set the name of the 'UserDefined' material.

	:param AName:
	:type AName: char *
	:rtype: None
") SetMaterialName;
		void SetMaterialName (const char * AName);
		%feature("compactdefaultargs") SetEnvReflexion;
		%feature("autodoc", "	:param AValue:
	:type AValue: Standard_ShortReal
	:rtype: None
") SetEnvReflexion;
		void SetEnvReflexion (const Standard_ShortReal AValue);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Resets the material with the original values according to the material name but leave the current color values untouched for the material of type ASPECT.

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the ambient colour of the surface.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "	* Returns the ambient colour of the surface.

	:rtype: Quantity_Color
") AmbientColor;
		Quantity_Color AmbientColor ();
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "	* Returns the diffuse colour of the surface.

	:rtype: Quantity_Color
") DiffuseColor;
		Quantity_Color DiffuseColor ();
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "	* Returns the specular colour of the surface.

	:rtype: Quantity_Color
") SpecularColor;
		Quantity_Color SpecularColor ();
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "	* Returns the emissive colour of the surface.

	:rtype: Quantity_Color
") EmissiveColor;
		Quantity_Color EmissiveColor ();
		%feature("compactdefaultargs") Ambient;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Ambient;
		Standard_Real Ambient ();
		%feature("compactdefaultargs") Diffuse;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Diffuse;
		Standard_Real Diffuse ();
		%feature("compactdefaultargs") Specular;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Specular;
		Standard_Real Specular ();
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns the transparency coefficient of the surface.

	:rtype: float
") Transparency;
		Standard_Real Transparency ();
		%feature("compactdefaultargs") Emissive;
		%feature("autodoc", "	* Returns the emissive coefficient of the surface.

	:rtype: float
") Emissive;
		Standard_Real Emissive ();
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "	* Returns the luminosity of the surface.

	:rtype: float
") Shininess;
		Standard_Real Shininess ();
		%feature("compactdefaultargs") ReflectionMode;
		%feature("autodoc", "	* Returns Standard_True if the reflection mode is active, //!	 Standard_False otherwise.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: bool
") ReflectionMode;
		Standard_Boolean ReflectionMode (const Graphic3d_TypeOfReflection AType);
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "	* Returns Standard_True if MyMaterialType equal the parameter AType, //!	 Standard_False otherwise.

	:param AType:
	:type AType: Graphic3d_TypeOfMaterial
	:rtype: bool
") MaterialType;
		Standard_Boolean MaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("compactdefaultargs") EnvReflexion;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") EnvReflexion;
		Standard_ShortReal EnvReflexion ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the material name.

	:rtype: Graphic3d_NameOfMaterial
") Name;
		Graphic3d_NameOfMaterial Name ();
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	* Returns Standard_True if the materials <self> and <Other> are different.

	:param Other:
	:type Other: Graphic3d_MaterialAspect &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const Graphic3d_MaterialAspect & Other);

        %extend{
            bool __ne_wrapper__(const Graphic3d_MaterialAspect  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns Standard_True if the materials <self> and <Other> are identical.

	:param Other:
	:type Other: Graphic3d_MaterialAspect &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Graphic3d_MaterialAspect & Other);

        %extend{
            bool __eq_wrapper__(const Graphic3d_MaterialAspect  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "	* Returns the name of the predefined material of rank <aRank> Trigger: when <aRank> is < 1 or > NumberOfMaterials.

	:param aRank:
	:type aRank: int
	:rtype: char *
") MaterialName;
		static char * MaterialName (const Standard_Integer aRank);
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "	* Returns the name of this material

	:rtype: char *
") MaterialName;
		char * MaterialName ();
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "	* Returns the type of the predefined material of rank <aRank> Trigger: when <aRank> is < 1 or > NumberOfMaterials.

	:param aRank:
	:type aRank: int
	:rtype: Graphic3d_TypeOfMaterial
") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType (const Standard_Integer aRank);
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "	* Returns the material for specified name or Graphic3d_NOM_DEFAULT if name is unknown.

	:param theName:
	:type theName: char *
	:rtype: Graphic3d_NameOfMaterial
") MaterialFromName;
		static Graphic3d_NameOfMaterial MaterialFromName (const char * theName);
};


%nodefaultctor Graphic3d_Plotter;
class Graphic3d_Plotter : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Deletes the plotter <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") BeginPlot;
		%feature("autodoc", "	* Warning: Returns Standard_True if plotting is enabled in the view. //!	 Raises PlotterDefinitionError from Graphic3d //!	 if plotting has already started.

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: bool
") BeginPlot;
		virtual Standard_Boolean BeginPlot (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") EndPlot;
		%feature("autodoc", "	* Stops the plotting. Warning: Raises PlotterDefinitionError from Graphic3d //!	 if plotting has not started yet.

	:rtype: void
") EndPlot;
		virtual void EndPlot ();
		%feature("compactdefaultargs") PlottingState;
		%feature("autodoc", "	:rtype: bool
") PlottingState;
		virtual Standard_Boolean PlottingState ();
};


%extend Graphic3d_Plotter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Plotter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Plotter::Handle_Graphic3d_Plotter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Plotter;
class Handle_Graphic3d_Plotter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_Plotter();
        Handle_Graphic3d_Plotter(const Handle_Graphic3d_Plotter &aHandle);
        Handle_Graphic3d_Plotter(const Graphic3d_Plotter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Plotter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Plotter {
    Graphic3d_Plotter* GetObject() {
    return (Graphic3d_Plotter*)$self->Access();
    }
};

%nodefaultctor Graphic3d_SequenceNodeOfSequenceOfAddress;
class Graphic3d_SequenceNodeOfSequenceOfAddress : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceNodeOfSequenceOfAddress;
		%feature("autodoc", "	:param I:
	:type I: Standard_Address &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Graphic3d_SequenceNodeOfSequenceOfAddress;
		 Graphic3d_SequenceNodeOfSequenceOfAddress (const Standard_Address & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address & Value ();
};


%extend Graphic3d_SequenceNodeOfSequenceOfAddress {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_SequenceNodeOfSequenceOfAddress(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_SequenceNodeOfSequenceOfAddress::Handle_Graphic3d_SequenceNodeOfSequenceOfAddress %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_SequenceNodeOfSequenceOfAddress;
class Handle_Graphic3d_SequenceNodeOfSequenceOfAddress : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Graphic3d_SequenceNodeOfSequenceOfAddress();
        Handle_Graphic3d_SequenceNodeOfSequenceOfAddress(const Handle_Graphic3d_SequenceNodeOfSequenceOfAddress &aHandle);
        Handle_Graphic3d_SequenceNodeOfSequenceOfAddress(const Graphic3d_SequenceNodeOfSequenceOfAddress *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_SequenceNodeOfSequenceOfAddress DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_SequenceNodeOfSequenceOfAddress {
    Graphic3d_SequenceNodeOfSequenceOfAddress* GetObject() {
    return (Graphic3d_SequenceNodeOfSequenceOfAddress*)$self->Access();
    }
};

%nodefaultctor Graphic3d_SequenceNodeOfSequenceOfGroup;
class Graphic3d_SequenceNodeOfSequenceOfGroup : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceNodeOfSequenceOfGroup;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Graphic3d_SequenceNodeOfSequenceOfGroup;
		 Graphic3d_SequenceNodeOfSequenceOfGroup (const Handle_Graphic3d_Group & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group Value ();
};


%extend Graphic3d_SequenceNodeOfSequenceOfGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_SequenceNodeOfSequenceOfGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_SequenceNodeOfSequenceOfGroup::Handle_Graphic3d_SequenceNodeOfSequenceOfGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_SequenceNodeOfSequenceOfGroup;
class Handle_Graphic3d_SequenceNodeOfSequenceOfGroup : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Graphic3d_SequenceNodeOfSequenceOfGroup();
        Handle_Graphic3d_SequenceNodeOfSequenceOfGroup(const Handle_Graphic3d_SequenceNodeOfSequenceOfGroup &aHandle);
        Handle_Graphic3d_SequenceNodeOfSequenceOfGroup(const Graphic3d_SequenceNodeOfSequenceOfGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_SequenceNodeOfSequenceOfGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_SequenceNodeOfSequenceOfGroup {
    Graphic3d_SequenceNodeOfSequenceOfGroup* GetObject() {
    return (Graphic3d_SequenceNodeOfSequenceOfGroup*)$self->Access();
    }
};

%nodefaultctor Graphic3d_SequenceNodeOfSequenceOfStructure;
class Graphic3d_SequenceNodeOfSequenceOfStructure : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceNodeOfSequenceOfStructure;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Structure &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Graphic3d_SequenceNodeOfSequenceOfStructure;
		 Graphic3d_SequenceNodeOfSequenceOfStructure (const Handle_Graphic3d_Structure & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Value;
		Handle_Graphic3d_Structure Value ();
};


%extend Graphic3d_SequenceNodeOfSequenceOfStructure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_SequenceNodeOfSequenceOfStructure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_SequenceNodeOfSequenceOfStructure::Handle_Graphic3d_SequenceNodeOfSequenceOfStructure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_SequenceNodeOfSequenceOfStructure;
class Handle_Graphic3d_SequenceNodeOfSequenceOfStructure : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Graphic3d_SequenceNodeOfSequenceOfStructure();
        Handle_Graphic3d_SequenceNodeOfSequenceOfStructure(const Handle_Graphic3d_SequenceNodeOfSequenceOfStructure &aHandle);
        Handle_Graphic3d_SequenceNodeOfSequenceOfStructure(const Graphic3d_SequenceNodeOfSequenceOfStructure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_SequenceNodeOfSequenceOfStructure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_SequenceNodeOfSequenceOfStructure {
    Graphic3d_SequenceNodeOfSequenceOfStructure* GetObject() {
    return (Graphic3d_SequenceNodeOfSequenceOfStructure*)$self->Access();
    }
};

%nodefaultctor Graphic3d_SequenceOfAddress;
class Graphic3d_SequenceOfAddress : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceOfAddress;
		%feature("autodoc", "	:rtype: None
") Graphic3d_SequenceOfAddress;
		 Graphic3d_SequenceOfAddress ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfAddress &
	:rtype: Graphic3d_SequenceOfAddress
") Assign;
		const Graphic3d_SequenceOfAddress & Assign (const Graphic3d_SequenceOfAddress & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfAddress &
	:rtype: Graphic3d_SequenceOfAddress
") operator=;
		const Graphic3d_SequenceOfAddress & operator = (const Graphic3d_SequenceOfAddress & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Standard_Address &
	:rtype: None
") Append;
		void Append (const Standard_Address & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") Append;
		void Append (Graphic3d_SequenceOfAddress & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Standard_Address &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Address & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SequenceOfAddress & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Standard_Address &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Address & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfAddress & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Standard_Address &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Address & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfAddress & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Standard_Address
") First;
		const Standard_Address & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Standard_Address
") Last;
		const Standard_Address & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Graphic3d_SequenceOfAddress &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfAddress & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Address
") Value;
		const Standard_Address & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Standard_Address &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Address & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Address
") ChangeValue;
		Standard_Address & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor Graphic3d_SequenceOfGroup;
class Graphic3d_SequenceOfGroup : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceOfGroup;
		%feature("autodoc", "	:rtype: None
") Graphic3d_SequenceOfGroup;
		 Graphic3d_SequenceOfGroup ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfGroup &
	:rtype: Graphic3d_SequenceOfGroup
") Assign;
		const Graphic3d_SequenceOfGroup & Assign (const Graphic3d_SequenceOfGroup & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfGroup &
	:rtype: Graphic3d_SequenceOfGroup
") operator=;
		const Graphic3d_SequenceOfGroup & operator = (const Graphic3d_SequenceOfGroup & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") Append;
		void Append (Graphic3d_SequenceOfGroup & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SequenceOfGroup & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfGroup & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfGroup & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") First;
		Handle_Graphic3d_Group First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Last;
		Handle_Graphic3d_Group Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Graphic3d_SequenceOfGroup &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfGroup & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Graphic3d_Group &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Graphic3d_Group & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Graphic3d_Group
") ChangeValue;
		Handle_Graphic3d_Group ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor Graphic3d_SequenceOfStructure;
class Graphic3d_SequenceOfStructure : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceOfStructure;
		%feature("autodoc", "	:rtype: None
") Graphic3d_SequenceOfStructure;
		 Graphic3d_SequenceOfStructure ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfStructure &
	:rtype: Graphic3d_SequenceOfStructure
") Assign;
		const Graphic3d_SequenceOfStructure & Assign (const Graphic3d_SequenceOfStructure & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfStructure &
	:rtype: Graphic3d_SequenceOfStructure
") operator=;
		const Graphic3d_SequenceOfStructure & operator = (const Graphic3d_SequenceOfStructure & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") Append;
		void Append (Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") First;
		Handle_Graphic3d_Structure First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Last;
		Handle_Graphic3d_Structure Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Graphic3d_SequenceOfStructure &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfStructure & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Graphic3d_Structure
") Value;
		Handle_Graphic3d_Structure Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Graphic3d_Structure &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Graphic3d_Structure & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Graphic3d_Structure
") ChangeValue;
		Handle_Graphic3d_Structure ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor Graphic3d_SetIteratorOfSetOfGroup;
class Graphic3d_SetIteratorOfSetOfGroup {
	public:
		%feature("compactdefaultargs") Graphic3d_SetIteratorOfSetOfGroup;
		%feature("autodoc", "	:rtype: None
") Graphic3d_SetIteratorOfSetOfGroup;
		 Graphic3d_SetIteratorOfSetOfGroup ();
		%feature("compactdefaultargs") Graphic3d_SetIteratorOfSetOfGroup;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: None
") Graphic3d_SetIteratorOfSetOfGroup;
		 Graphic3d_SetIteratorOfSetOfGroup (const Graphic3d_SetOfGroup & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_SetOfGroup & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group Value ();
};


%nodefaultctor Graphic3d_SetListOfSetOfGroup;
class Graphic3d_SetListOfSetOfGroup {
	public:
		%feature("compactdefaultargs") Graphic3d_SetListOfSetOfGroup;
		%feature("autodoc", "	:rtype: None
") Graphic3d_SetListOfSetOfGroup;
		 Graphic3d_SetListOfSetOfGroup ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Assign;
		void Assign (const Graphic3d_SetListOfSetOfGroup & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") operator=;
		void operator = (const Graphic3d_SetListOfSetOfGroup & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SetListOfSetOfGroup & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Append;
		void Append (Graphic3d_SetListOfSetOfGroup & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") First;
		Handle_Graphic3d_Group First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Last;
		Handle_Graphic3d_Group Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") Remove;
		void Remove (Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (Graphic3d_SetListOfSetOfGroup & Other,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (Graphic3d_SetListOfSetOfGroup & Other,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
};


%nodefaultctor Graphic3d_SetOfGroup;
class Graphic3d_SetOfGroup {
	public:
		%feature("compactdefaultargs") Graphic3d_SetOfGroup;
		%feature("autodoc", "	:rtype: None
") Graphic3d_SetOfGroup;
		 Graphic3d_SetOfGroup ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "	:param B:
	:type B: Graphic3d_SetOfGroup &
	:rtype: None
") Union;
		void Union (const Graphic3d_SetOfGroup & B);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param B:
	:type B: Graphic3d_SetOfGroup &
	:rtype: None
") Intersection;
		void Intersection (const Graphic3d_SetOfGroup & B);
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "	:param B:
	:type B: Graphic3d_SetOfGroup &
	:rtype: None
") Difference;
		void Difference (const Graphic3d_SetOfGroup & B);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Group & T);
		%feature("compactdefaultargs") IsASubset;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Graphic3d_SetOfGroup & S);
		%feature("compactdefaultargs") IsAProperSubset;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Graphic3d_SetOfGroup & S);
};


%nodefaultctor Graphic3d_ShaderObject;
class Graphic3d_ShaderObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the shader object is valid or not.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	* Returns the full path to the shader source.

	:rtype: OSD_Path
") Path;
		const OSD_Path & Path ();
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns the source code of the shader object.

	:rtype: TCollection_AsciiString
") Source;
		const TCollection_AsciiString & Source ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns type of the shader object.

	:rtype: Graphic3d_TypeOfShaderObject
") Type;
		Graphic3d_TypeOfShaderObject Type ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") CreateFromFile;
		%feature("autodoc", "	* Creates new shader object from specified file.

	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param thePath:
	:type thePath: TCollection_AsciiString &
	:rtype: Handle_Graphic3d_ShaderObject
") CreateFromFile;
		static Handle_Graphic3d_ShaderObject CreateFromFile (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & thePath);
		%feature("compactdefaultargs") CreateFromSource;
		%feature("autodoc", "	* Creates new shader object from specified source.

	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param theSource:
	:type theSource: TCollection_AsciiString &
	:rtype: Handle_Graphic3d_ShaderObject
") CreateFromSource;
		static Handle_Graphic3d_ShaderObject CreateFromSource (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & theSource);
};


%nodefaultctor Graphic3d_ShaderProgram;
class Graphic3d_ShaderProgram : public Standard_Transient {
/* public enums */
enum ShaderName {
	ShaderName_UNKNOWN = 0,
	ShaderName_Phong = 1,
};

/* end public enums declaration */

	public:
		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "	* Creates new empty program object.

	:rtype: None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram ();
		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "	* Creates program object from pre-defined shaders. Raises Standard_Failure exception if shader resources are unavailable.

	:param theName:
	:type theName: Graphic3d_ShaderProgram::ShaderName
	:rtype: None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram (const Graphic3d_ShaderProgram::ShaderName theName);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Releases resources of program object.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the program object is valid or not.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") AttachShader;
		%feature("autodoc", "	* Attaches shader object to the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") AttachShader;
		Standard_Boolean AttachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("compactdefaultargs") DetachShader;
		%feature("autodoc", "	* Detaches shader object from the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") DetachShader;
		Standard_Boolean DetachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("compactdefaultargs") ShaderObjects;
		%feature("autodoc", "	* Returns list of attached shader objects.

	:rtype: Graphic3d_ShaderObjectList
") ShaderObjects;
		const Graphic3d_ShaderObjectList & ShaderObjects ();
		%feature("compactdefaultargs") Variables;
		%feature("autodoc", "	* Returns list of custom uniform variables.

	:rtype: Graphic3d_ShaderVariableList
") Variables;
		const Graphic3d_ShaderVariableList & Variables ();
		%feature("compactdefaultargs") ClearVariables;
		%feature("autodoc", "	* Removes all custom uniform variables from the program.

	:rtype: None
") ClearVariables;
		void ClearVariables ();
		%feature("compactdefaultargs") ShadersFolder;
		%feature("autodoc", "	* The path to GLSL programs determined from CSF_ShadersDirectory or CASROOT environment variables. returns the root folder with default GLSL programs.

	:rtype: TCollection_AsciiString
") ShadersFolder;
		static const TCollection_AsciiString & ShadersFolder ();
};


%nodefaultctor Graphic3d_ShaderVariable;
class Graphic3d_ShaderVariable : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns name of shader variable.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the shader variable is valid or not.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns interface of shader variable value.

	:rtype: Graphic3d_ValueInterface *
") Value;
		Graphic3d_ValueInterface * Value ();
};


%nodefaultctor Graphic3d_StdMapNodeOfMapOfStructure;
class Graphic3d_StdMapNodeOfMapOfStructure : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Graphic3d_StdMapNodeOfMapOfStructure;
		%feature("autodoc", "	:param K:
	:type K: Handle_Graphic3d_Structure &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_StdMapNodeOfMapOfStructure;
		 Graphic3d_StdMapNodeOfMapOfStructure (const Handle_Graphic3d_Structure & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Key;
		Handle_Graphic3d_Structure Key ();
};


%extend Graphic3d_StdMapNodeOfMapOfStructure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_StdMapNodeOfMapOfStructure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_StdMapNodeOfMapOfStructure::Handle_Graphic3d_StdMapNodeOfMapOfStructure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_StdMapNodeOfMapOfStructure;
class Handle_Graphic3d_StdMapNodeOfMapOfStructure : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Graphic3d_StdMapNodeOfMapOfStructure();
        Handle_Graphic3d_StdMapNodeOfMapOfStructure(const Handle_Graphic3d_StdMapNodeOfMapOfStructure &aHandle);
        Handle_Graphic3d_StdMapNodeOfMapOfStructure(const Graphic3d_StdMapNodeOfMapOfStructure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_StdMapNodeOfMapOfStructure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_StdMapNodeOfMapOfStructure {
    Graphic3d_StdMapNodeOfMapOfStructure* GetObject() {
    return (Graphic3d_StdMapNodeOfMapOfStructure*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Structure;
class Graphic3d_Structure : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_Structure;
		%feature("autodoc", "	* Creates a graphic object in the manager <AManager>. //!	 It will appear in all the views of the visualiser. Warning: The default values AspectLine, AspectFillArea, //!	 AspectText and AspectMarker are NOT applied to the //!	 structure. //!	 The structure is not displayed when it is created.

	:param AManager:
	:type AManager: Handle_Graphic3d_StructureManager &
	:rtype: None
") Graphic3d_Structure;
		 Graphic3d_Structure (const Handle_Graphic3d_StructureManager & AManager);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* if WithDestruction == Standard_True then //!		suppress all the groups of primitives in the structure. //!	 and it is mandatory to create a new group in <self>. //!	 if WithDestruction == Standard_False then //!		clears all the groups of primitives in the structure. //!	 and all the groups are conserved and empty. //!	 They will be erased at the next screen update. //!	 The structure itself is conserved. //!	 The transformation and the attributes of <self> are conserved. //!	 The childs of <self> are conserved.

	:param WithDestruction: default value is Standard_True
	:type WithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Standard_Boolean WithDestruction = Standard_True);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Suppresses the structure <self>. //!	 It will be erased at the next screen update.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Displays the structure <self> in all the views of //!	 the visualiser.

	:rtype: void
") Display;
		virtual void Display ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Displays the structure <self> in all the views of //!	 the visualiser, while modifying its current priority. Note: Display Priorities Structure display priorities control the order in which structures are redrawn. When you display a structure, you specify its priority. The lower the value, the lower the display priority. When the display is regenerated, the structures with the lowest priority are drawn first. For structures with the same display priority, the order in which they were displayed determines the drawing order. Open CASCADE supports 11 structure display priorities, 0 to 10. Warning: Raises PriorityDefinitionError if <Priority> is //!	 greater than 10 or a negative value.

	:param Priority:
	:type Priority: int
	:rtype: None
") Display;
		void Display (const Standard_Integer Priority);
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "	* Returns the current display priority for the //!	 structure <self>.

	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases the structure <self> in all the views //!	 of the visualiser.

	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the structure <self> in all the //!	 views of the visualiser, using the following methods: TOHM_COLOR		= drawn in the highlight color //!				 (default white) //!	 TOHM_BLINK		= blinking TOHM_BOUNDBOX	= enclosed by the boundary box //!				 (default white)

	:param Method:
	:type Method: Aspect_TypeOfHighlightMethod
	:rtype: None
") Highlight;
		void Highlight (const Aspect_TypeOfHighlightMethod Method);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppress the structure <self>. //!	 It will be erased at the next screen update. Warning: No more graphic operations in <self> after this call. Category: Methods to modify the class definition

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") SetHighlightColor;
		%feature("autodoc", "	* Modifies the highlight color for the Highlight method //!	 with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetHighlightColor;
		void SetHighlightColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "	* Modifies the coordinates of the boundary box //!	 of the structure <self>. //!	 if <AFlag> is Standard_True then <self> is infinite and //!	 the MinMaxValues method or the MinMaxCoord method return : //!	 XMin = YMin = ZMin = RealFirst (). //!	 XMax = YMax = ZMax = RealLast (). //!	 By default, <self> is not infinite but empty.

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Modifies the order of displaying the structure. //!	 Values are between 0 and 10. Structures are drawn according to their display priorities in ascending order. //!	 A structure of priority 10 is displayed the last and appears over the others. //!	 The default value is 5. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority //!	 method erase <self> and display <self> with the //!	 new priority. //!	 Raises PriorityDefinitionError if <Priority> is //!	 greater than 10 or a negative value.

	:param Priority:
	:type Priority: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Standard_Integer Priority);
		%feature("compactdefaultargs") ResetDisplayPriority;
		%feature("autodoc", "	* Reset the current priority of the structure to the //!	 previous priority. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority //!	 method erase <self> and display <self> with the //!	 previous priority.

	:rtype: None
") ResetDisplayPriority;
		void ResetDisplayPriority ();
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID for the structure. The Z layer mechanism allows to display structures presented in higher layers in overlay of structures in lower layers by switching off z buffer depth test between layers

	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") SetZLayer;
		void SetZLayer (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID of displayed structure. The method returns -1 if the structure has no ID (deleted from graphic driver).

	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer ();
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Changes a sequence of clip planes slicing the structure on rendering. @param thePlanes [in] the set of clip planes.

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") GetClipPlanes;
		%feature("autodoc", "	* Get clip planes slicing the structure on rendering. returns set of clip planes.

	:rtype: Graphic3d_SequenceOfHClipPlane
") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
		%feature("compactdefaultargs") SetPick;
		%feature("autodoc", "	* Modifies the detectability indicator to Standard_True //!	 or Standard_False for the structure <self>. //!	 The default value at the definition of <self> is //!	 Standard_True.

	:param AValue:
	:type AValue: bool
	:rtype: None
") SetPick;
		void SetPick (const Standard_Boolean AValue);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for lines //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for faces //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for text //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for markers //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "	* Modifies the visibility indicator to Standard_True or //!	 Standard_False for the structure <self>. //!	 The default value at the definition of <self> is //!	 Standard_True.

	:param AValue:
	:type AValue: bool
	:rtype: None
") SetVisible;
		void SetVisible (const Standard_Boolean AValue);
		%feature("compactdefaultargs") SetManager;
		%feature("autodoc", "	* Moves the graphic object <self> in the manager <AManager>. //!	 If <WithPropagation> is Standard_True then all the connected //!	 graphic objects to <self> are moved.

	:param AManager:
	:type AManager: Handle_Graphic3d_StructureManager &
	:param WithPropagation: default value is Standard_False
	:type WithPropagation: bool
	:rtype: None
") SetManager;
		void SetManager (const Handle_Graphic3d_StructureManager & AManager,const Standard_Boolean WithPropagation = Standard_False);
		%feature("compactdefaultargs") SetVisual;
		%feature("autodoc", "	* Modifies the visualisation mode for the structure <self>.

	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: void
") SetVisual;
		virtual void SetVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("compactdefaultargs") SetZoomLimit;
		%feature("autodoc", "	* Modifies the minimum and maximum zoom coefficients //!	 for the structure <self>. //!	 The default value at the definition of <self> is unlimited. Category: Methods to modify the class definition Warning: Raises StructureDefinitionError if <LimitInf> is //!	 greater than <LimitSup> or if <LimitInf> or //!	 <LimitSup> is a negative value.

	:param LimitInf:
	:type LimitInf: float
	:param LimitSup:
	:type LimitSup: float
	:rtype: None
") SetZoomLimit;
		void SetZoomLimit (const Standard_Real LimitInf,const Standard_Real LimitSup);
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppresses the highlight for the structure <self> //!	 in all the views of the visualiser.

	:rtype: None
") UnHighlight;
		void UnHighlight ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:rtype: void
") Compute;
		virtual void Compute ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & aStructure);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix,Handle_Graphic3d_Structure & aStructure);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <self> //!	 if <self> is displayed and TOS_COMPUTED.

	:rtype: None
") ReCompute;
		void ReCompute ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <self> //!	 if <self> is displayed in <aProjetor> and TOS_COMPUTED.

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> contains //!	 Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("compactdefaultargs") FillArea3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "	* Returns the groups sequence included in the structure <self> (internal storage).

	:rtype: Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();
		%feature("compactdefaultargs") NumberOfGroups;
		%feature("autodoc", "	* Returns the current number of groups in the //!	 structure <self>.

	:rtype: int
") NumberOfGroups;
		Standard_Integer NumberOfGroups ();
		%feature("compactdefaultargs") HighlightColor;
		%feature("autodoc", "	* Returns the highlight color for the Highlight method //!	 with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.

	:rtype: Quantity_Color
") HighlightColor;
		Quantity_Color HighlightColor ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is deleted. //!	 <self> is deleted after the call Remove (me).

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns the display indicator for the structure <self>.

	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is empty. Warning: A structure is empty if : //!		it do not have group or all the groups are empties //!		and it do not have descendant or all the descendants //!		are empties.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is infinite.

	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "	* Returns the highlight indicator for the structure <self>.

	:rtype: bool
") IsHighlighted;
		virtual Standard_Boolean IsHighlighted ();
		%feature("compactdefaultargs") IsSelectable;
		%feature("autodoc", "	* Returns the detectability indicator for the structure <self>.

	:rtype: bool
") IsSelectable;
		Standard_Boolean IsSelectable ();
		%feature("compactdefaultargs") IsRotated;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is rotated. //!	 <=> The transformation != Identity, != Scale, != Translation.

	:rtype: bool
") IsRotated;
		Standard_Boolean IsRotated ();
		%feature("compactdefaultargs") IsTransformed;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is transformed. //!	 <=> The transformation != Identity.

	:rtype: bool
") IsTransformed;
		Standard_Boolean IsTransformed ();
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Returns the visibility indicator for the structure <self>.

	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible ();
		%feature("compactdefaultargs") Line3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectLine3d
") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("compactdefaultargs") Marker3dAspect;
		%feature("autodoc", "	* Returns the current group of graphic attributes used for 3d marker primitives.

	:rtype: Handle_Graphic3d_AspectMarker3d
") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box //!	 of the structure <self>. Warning: If the structure <self> is empty or infinite then : //!	 XMin = YMin = ZMin = RealFirst (). //!	 XMax = YMax = ZMax = RealLast ().

	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param ZMin:
	:type ZMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:param ZMax:
	:type ZMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PrimitivesAspect;
		%feature("autodoc", "	* Returns the current values of the default attributes.

	:param CTXL:
	:type CTXL: Handle_Graphic3d_AspectLine3d &
	:param CTXT:
	:type CTXT: Handle_Graphic3d_AspectText3d &
	:param CTXM:
	:type CTXM: Handle_Graphic3d_AspectMarker3d &
	:param CTXF:
	:type CTXF: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") PrimitivesAspect;
		void PrimitivesAspect (Handle_Graphic3d_AspectLine3d & CTXL,Handle_Graphic3d_AspectText3d & CTXT,Handle_Graphic3d_AspectMarker3d & CTXM,Handle_Graphic3d_AspectFillArea3d & CTXF);
		%feature("compactdefaultargs") Text3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectText3d
") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("compactdefaultargs") Visual;
		%feature("autodoc", "	* Returns the visualisation mode for the structure <self>.

	:rtype: Graphic3d_TypeOfStructure
") Visual;
		Graphic3d_TypeOfStructure Visual ();
		%feature("compactdefaultargs") AcceptConnection;
		%feature("autodoc", "	* Returns Standard_True if the connection is possible between //!	 <AStructure1> and <AStructure2> without a creation //!	 of a cycle. //!	 It's not possible to call the method //!	 AStructure1->Connect (AStructure2, TypeOfConnection) //!	 if //!	 - the set of all ancestors of <AStructure1> contains //!	 <AStructure1> and if the //!	 TypeOfConnection == TOC_DESCENDANT //!	 - the set of all descendants of <AStructure1> contains //!	 <AStructure2> and if the //!	 TypeOfConnection == TOC_ANCESTOR

	:param AStructure1:
	:type AStructure1: Handle_Graphic3d_Structure &
	:param AStructure2:
	:type AStructure2: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: bool
") AcceptConnection;
		static Standard_Boolean AcceptConnection (const Handle_Graphic3d_Structure & AStructure1,const Handle_Graphic3d_Structure & AStructure2,const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "	* Returns the group of structures to which <self> is connected.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") Ancestors;
		void Ancestors (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* If Atype is TOC_DESCENDANT then add <AStructure> //!	 as a child structure of <self>. //!	 If Atype is TOC_ANCESTOR then add <AStructure> //!	 as a parent structure of <self>. //!	 The connection propagates Display, Highlight, Erase, //!	 Remove, and stacks the transformations. //!	 No connection if the graph of the structures //!	 contains a cycle and <WithCheck> is Standard_True;

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:param WithCheck: default value is Standard_False
	:type WithCheck: bool
	:rtype: None
") Connect;
		void Connect (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType,const Standard_Boolean WithCheck = Standard_False);
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "	* Returns the group of structures connected to <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") Descendants;
		void Descendants (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Suppress the connection between <AStructure> and <self>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Disconnect;
		void Disconnect (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "	* If Atype is TOC_DESCENDANT then suppress all //!	 the connections with the child structures of <self>. //!	 If Atype is TOC_ANCESTOR then suppress all //!	 the connections with the parent structures of <self>.

	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None
") DisconnectAll;
		void DisconnectAll (const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") Network;
		%feature("autodoc", "	* Returns <ASet> the group of structures : //!	 - directly or indirectly connected to <AStructure> if the //!	 TypeOfConnection == TOC_DESCENDANT //!	 - to which <AStructure> is directly or indirectly connected //!	 if the TypeOfConnection == TOC_ANCESTOR

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:param ASet:
	:type ASet: Graphic3d_MapOfStructure &
	:rtype: void
") Network;
		static void Network (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType,Graphic3d_MapOfStructure & ASet);
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "	:param Owner:
	:type Owner: Standard_Address
	:rtype: None
") SetOwner;
		void SetOwner (const Standard_Address Owner);
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "	:rtype: Standard_Address
") Owner;
		Standard_Address Owner ();
		%feature("compactdefaultargs") SetHLRValidation;
		%feature("autodoc", "	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetHLRValidation;
		void SetHLRValidation (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") HLRValidation;
		%feature("autodoc", "	:rtype: bool
") HLRValidation;
		Standard_Boolean HLRValidation ();
		%feature("compactdefaultargs") Composition;
		%feature("autodoc", "	* Returns the type of composition applied to matrices //!	 of transformation of <self>.

	:rtype: Graphic3d_TypeOfComposition
") Composition;
		Graphic3d_TypeOfComposition Composition ();
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	* Modifies the current local modelling transformation //!	 in the structure <self>. //!	 It is defined as a 4*4 real matrix. //!	 ------------------- //!	 | a11 a12 a13 t1 | //!	 | a21 a22 a23 t2 | //!	 | a31 a32 a33 t3 | //!	 | 0 0 0 1 | //!	 ------------------- //!	 TypeOfComposition : TOC_REPLACE //!				TOC_POSTCONCATENATE Then the modified Local Modelling Transformation is composed with the current Global Modelling Transformation to create a new Composite Modelling Transformation. The compose type specifies the role of the current local modelling transformation (L) in composing the new value for the current local modelling transformation (L'), which is then combined with the current global modelling transforma- tion (G) to calculate the new composite modelling transfor- mation (C). TOC_REPLACE The transformation matrix (T) replaces the value of current local modelling transformation (L). //!	L' <- T //!	C <- G x L' TOC_POSTCONCATENATE The current local modelling transformation (L) is multiplied by the transformation matrix (T): //!	L' <- T x L //!	C <- G x L' Category: Methods to manage the structure transformation Warning: Raises TransformError if the matrix is not a 4x4 matrix.

	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:param AType:
	:type AType: Graphic3d_TypeOfComposition
	:rtype: None
") SetTransform;
		void SetTransform (const TColStd_Array2OfReal & AMatrix,const Graphic3d_TypeOfComposition AType);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Returns the transformation associated with //!	 the structure <self>.

	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") Transform;
		void Transform (TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Modifies the current modelling transform persistence (pan, zoom or rotate)

	:param AFlag:
	:type AFlag: Graphic3d_TransModeFlags &
	:param APoint:
	:type APoint: gp_Pnt
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag,const gp_Pnt & APoint);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	:param AFlag:
	:type AFlag: Graphic3d_TransModeFlags &
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag);
		%feature("compactdefaultargs") TransformPersistenceMode;
		%feature("autodoc", "	* Get the current modelling transform persistence (pan, zoom or rotate)

	:rtype: Graphic3d_TransModeFlags
") TransformPersistenceMode;
		Graphic3d_TransModeFlags TransformPersistenceMode ();
		%feature("compactdefaultargs") TransformPersistencePoint;
		%feature("autodoc", "	* Get the current point of relative modelling transform persistence

	:rtype: gp_Pnt
") TransformPersistencePoint;
		gp_Pnt TransformPersistencePoint ();
		%feature("compactdefaultargs") ComputeVisual;
		%feature("autodoc", "	:rtype: Graphic3d_TypeOfStructure
") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual ();
		%feature("compactdefaultargs") GraphicClear;
		%feature("autodoc", "	* Clears the structure <self>.

	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: None
") GraphicClear;
		void GraphicClear (const Standard_Boolean WithDestruction);
		%feature("compactdefaultargs") GraphicConnect;
		%feature("autodoc", "	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") GraphicConnect;
		void GraphicConnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") GraphicDisconnect;
		%feature("autodoc", "	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") GraphicDisconnect;
		void GraphicDisconnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") GraphicHighlight;
		%feature("autodoc", "	* Highlights the structure <self>.

	:param Method:
	:type Method: Aspect_TypeOfHighlightMethod
	:rtype: None
") GraphicHighlight;
		void GraphicHighlight (const Aspect_TypeOfHighlightMethod Method);
		%feature("compactdefaultargs") GraphicTransform;
		%feature("autodoc", "	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") GraphicTransform;
		void GraphicTransform (const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") GraphicUnHighlight;
		%feature("autodoc", "	* Suppress the highlight for the structure <self>.

	:rtype: None
") GraphicUnHighlight;
		void GraphicUnHighlight ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the structure <self>.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
		%feature("compactdefaultargs") Plot;
		%feature("autodoc", "	:param aPlotter:
	:type aPlotter: Handle_Graphic3d_Plotter &
	:rtype: void
") Plot;
		virtual void Plot (const Handle_Graphic3d_Plotter & aPlotter);
		%feature("compactdefaultargs") PrintNetwork;
		%feature("autodoc", "	* Prints informations about the network associated //!	 with the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: void
") PrintNetwork;
		static void PrintNetwork (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppress the adress <APtr> in the list //!	 of descendants or in the list of ancestors.

	:param APtr:
	:type APtr: Standard_Address
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None
") Remove;
		void Remove (const Standard_Address APtr,const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") SetComputeVisual;
		%feature("autodoc", "	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: None
") SetComputeVisual;
		void SetComputeVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms <X>, <Y>, <Z> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param NewX:
	:type NewX: float &
	:param NewY:
	:type NewY: float &
	:param NewZ:
	:type NewZ: float &
	:rtype: void
") Transforms;
		static void Transforms (const TColStd_Array2OfReal & ATrsf,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms <Coord> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param Coord:
	:type Coord: Graphic3d_Vector &
	:rtype: Graphic3d_Vector
") Transforms;
		static Graphic3d_Vector Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vector & Coord);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms <Coord> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param Coord:
	:type Coord: Graphic3d_Vertex &
	:rtype: Graphic3d_Vertex
") Transforms;
		static Graphic3d_Vertex Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vertex & Coord);
		%feature("compactdefaultargs") CStructure;
		%feature("autodoc", "	* Returns the c structure associated to <self>.

	:rtype: Graphic3d_CStructure *
") CStructure;
		Graphic3d_CStructure * CStructure ();
};


%extend Graphic3d_Structure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Structure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Structure::Handle_Graphic3d_Structure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Structure;
class Handle_Graphic3d_Structure : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_Structure();
        Handle_Graphic3d_Structure(const Handle_Graphic3d_Structure &aHandle);
        Handle_Graphic3d_Structure(const Graphic3d_Structure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Structure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Structure {
    Graphic3d_Structure* GetObject() {
    return (Graphic3d_Structure*)$self->Access();
    }
};

%nodefaultctor Graphic3d_StructureManager;
class Graphic3d_StructureManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Deletes the manager <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for lines //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for faces //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for text //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for markers //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "	* Modifies the screen update mode. //!	 TOU_ASAP	as soon as possible //!	 TOU_WAIT	on demand (with the Update function) Note : Dynamic Operations and Update Mode Use SetUpdateMode to control when changes to the display are made. Use one of the following functions to update one or more views: - Update all views of the viewer: Visual3d_ViewManager::Update () - Update one view of the viewer: Visual3d_View::Update () Use one of the following functions to update the entire display: - Redraw all structures in all views: Visual3d_ViewManager::Redraw () - Redraw all structures in one view: Visual3d_View::Redraw () Update)

	:param AType:
	:type AType: Aspect_TypeOfUpdate
	:rtype: None
") SetUpdateMode;
		void SetUpdateMode (const Aspect_TypeOfUpdate AType);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates screen in function of modifications of //!	 the structures. Warning: Not necessary if the update mode is TOU_ASAP.

	:rtype: void
") Update;
		virtual void Update ();
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "	* Returns the set of structures displayed in //!	 visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") HighlightedStructures;
		%feature("autodoc", "	* Returns the set of highlighted structures //!	 in a visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") HighlightedStructures;
		void HighlightedStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") PickStructures;
		%feature("autodoc", "	* Returns the set of detectable structures //!	 in a visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") PickStructures;
		void PickStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") FillArea3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "	* Returns maximum number of managers defineable.

	:rtype: int
") Limit;
		static Standard_Integer Limit ();
		%feature("compactdefaultargs") Line3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectLine3d
") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("compactdefaultargs") Marker3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectMarker3d
") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of all //!	 structures displayed in the manager <self>.

	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param ZMin:
	:type ZMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:param ZMax:
	:type ZMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PrimitivesAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:param CTXL:
	:type CTXL: Handle_Graphic3d_AspectLine3d &
	:param CTXT:
	:type CTXT: Handle_Graphic3d_AspectText3d &
	:param CTXM:
	:type CTXM: Handle_Graphic3d_AspectMarker3d &
	:param CTXF:
	:type CTXF: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") PrimitivesAspect;
		void PrimitivesAspect (Handle_Graphic3d_AspectLine3d & CTXL,Handle_Graphic3d_AspectText3d & CTXT,Handle_Graphic3d_AspectMarker3d & CTXM,Handle_Graphic3d_AspectFillArea3d & CTXF);
		%feature("compactdefaultargs") Text3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectText3d
") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("compactdefaultargs") UpdateMode;
		%feature("autodoc", "	* Returns the screen update mode. //!	 TOU_ASAP	as soon as possible //!	 TOU_WAIT	on demand (Update)

	:rtype: Aspect_TypeOfUpdate
") UpdateMode;
		Aspect_TypeOfUpdate UpdateMode ();
		%feature("compactdefaultargs") ChangeDisplayPriority;
		%feature("autodoc", "	* Changes the display priority of the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param OldPriority:
	:type OldPriority: int
	:param NewPriority:
	:type NewPriority: int
	:rtype: void
") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority (const Handle_Graphic3d_Structure & AStructure,const Standard_Integer OldPriority,const Standard_Integer NewPriority);
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "	* Change Z layer for structure. The z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theLayerId:
	:type theLayerId: int
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID assigned to structure. If the structure has no layer ID (deleted from graphic driver), the method returns -1.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: int
") GetZLayer;
		virtual Standard_Integer GetZLayer (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer for all managed views.

	:param theLayerId:
	:type theLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: void
") SetZLayerSettings;
		virtual void SetZLayerSettings (const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: int
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		virtual Graphic3d_ZLayerSettings ZLayerSettings (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level Z layer and get its ID as <theLayerId> value. The method returns Standard_False if the layer can not be created. The z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theLayerId:
	:type theLayerId: int &
	:rtype: bool
") AddZLayer;
		virtual Standard_Boolean AddZLayer (Standard_Integer &OutValue);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there is always a default bottom-level layer that can't be removed.

	:param theLayerId:
	:type theLayerId: int
	:rtype: bool
") RemoveZLayer;
		virtual Standard_Boolean RemoveZLayer (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "	* Return all Z layer ids in sequence ordered by level from lowest layer to highest. The first layer ID in sequence is the default layer that can't be removed.

	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger &
	:rtype: void
") GetAllZLayers;
		virtual void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("compactdefaultargs") CurrentId;
		%feature("autodoc", "	* Returns a current identifier available.

	:rtype: int
") CurrentId;
		static Standard_Integer CurrentId ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> //!	 if <AStructure> is displayed and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> //!	 if <AStructure> is displayed in <AProjector> and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AProjector:
	:type AProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure,const Handle_Graphic3d_DataStructureManager & AProjector);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Handle_Graphic3d_Structure & AStructure,const Standard_Boolean WithDestruction);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Connects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Connect;
		virtual void Connect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Disconnects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Disconnect;
		virtual void Disconnect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Display;
		virtual void Display (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Erase;
		virtual void Erase (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AMethod:
	:type AMethod: Aspect_TypeOfHighlightMethod
	:rtype: void
") Highlight;
		virtual void Highlight (const Handle_Graphic3d_Structure & AStructure,const Aspect_TypeOfHighlightMethod AMethod);
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	* Transforms the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:rtype: void
") SetTransform;
		virtual void SetTransform (const Handle_Graphic3d_Structure & AStructure,const TColStd_Array2OfReal & ATrsf);
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "	* Returns the graphic driver of <self>.

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		Handle_Graphic3d_GraphicDriver GraphicDriver ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the manager.

	:rtype: int
") Identification;
		virtual Standard_Integer Identification ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the structure with the identification number <AId>.

	:param AId:
	:type AId: int
	:rtype: Handle_Graphic3d_Structure
") Identification;
		virtual Handle_Graphic3d_Structure Identification (const Standard_Integer AId);
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppresses the highlighting on all the structures in <self>.

	:rtype: void
") UnHighlight;
		virtual void UnHighlight ();
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppress the highlighting on the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") UnHighlight;
		virtual void UnHighlight (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "	:rtype: None
") RecomputeStructures;
		void RecomputeStructures ();
};


%extend Graphic3d_StructureManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_StructureManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_StructureManager::Handle_Graphic3d_StructureManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_StructureManager;
class Handle_Graphic3d_StructureManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_StructureManager();
        Handle_Graphic3d_StructureManager(const Handle_Graphic3d_StructureManager &aHandle);
        Handle_Graphic3d_StructureManager(const Graphic3d_StructureManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_StructureManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_StructureManager {
    Graphic3d_StructureManager* GetObject() {
    return (Graphic3d_StructureManager*)$self->Access();
    }
};

%nodefaultctor Graphic3d_TextureParams;
class Graphic3d_TextureParams : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Graphic3d_TextureParams;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") Graphic3d_TextureParams;
		 Graphic3d_TextureParams ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "	* returns True if the texture is modulate. Default value is False.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("compactdefaultargs") SetModulate;
		%feature("autodoc", "	* @param theToModulate turn modulation on/off.

	:param theToModulate:
	:type theToModulate: bool
	:rtype: None
") SetModulate;
		void SetModulate (const Standard_Boolean theToModulate);
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "	* returns True if the texture repeat is enabled. Default value is False.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("compactdefaultargs") SetRepeat;
		%feature("autodoc", "	* @param theToRepeat turn texture repeat mode ON or OFF (clamping).

	:param theToRepeat:
	:type theToRepeat: bool
	:rtype: None
") SetRepeat;
		void SetRepeat (const Standard_Boolean theToRepeat);
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	* returns texture interpolation filter. Default value is Graphic3d_TOTF_NEAREST.

	:rtype: Graphic3d_TypeOfTextureFilter
") Filter;
		Graphic3d_TypeOfTextureFilter Filter ();
		%feature("compactdefaultargs") SetFilter;
		%feature("autodoc", "	* @param theFilter texture interpolation filter.

	:param theFilter:
	:type theFilter: Graphic3d_TypeOfTextureFilter
	:rtype: None
") SetFilter;
		void SetFilter (const Graphic3d_TypeOfTextureFilter theFilter);
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* returns rotation angle in degrees Default value is 0.

	:rtype: Standard_ShortReal
") Rotation;
		Standard_ShortReal Rotation ();
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* @param theAngleDegrees rotation angle.

	:param theAngleDegrees:
	:type theAngleDegrees: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theAngleDegrees);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* returns scale factor Default value is no scaling (1.0; 1.0).

	:rtype: Graphic3d_Vec2
") Scale;
		const Graphic3d_Vec2 & Scale ();
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* @param theScale scale factor.

	:param theScale:
	:type theScale: Graphic3d_Vec2
	:rtype: None
") SetScale;
		void SetScale (const Graphic3d_Vec2 theScale);
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "	* returns translation vector Default value is no translation (0.0; 0.0).

	:rtype: Graphic3d_Vec2
") Translation;
		const Graphic3d_Vec2 & Translation ();
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	* @param theVec translation vector.

	:param theVec:
	:type theVec: Graphic3d_Vec2
	:rtype: None
") SetTranslation;
		void SetTranslation (const Graphic3d_Vec2 theVec);
		%feature("compactdefaultargs") GenMode;
		%feature("autodoc", "	* returns texture coordinates generation mode. Default value is Graphic3d_TOTM_MANUAL.

	:rtype: Graphic3d_TypeOfTextureMode
") GenMode;
		Graphic3d_TypeOfTextureMode GenMode ();
		%feature("compactdefaultargs") GenPlaneS;
		%feature("autodoc", "	* returns texture coordinates generation plane S.

	:rtype: Graphic3d_Vec4
") GenPlaneS;
		const Graphic3d_Vec4 & GenPlaneS ();
		%feature("compactdefaultargs") GenPlaneT;
		%feature("autodoc", "	* returns texture coordinates generation plane T.

	:rtype: Graphic3d_Vec4
") GenPlaneT;
		const Graphic3d_Vec4 & GenPlaneT ();
		%feature("compactdefaultargs") SetGenMode;
		%feature("autodoc", "	* Setup texture coordinates generation mode.

	:param theMode:
	:type theMode: Graphic3d_TypeOfTextureMode
	:param thePlaneS:
	:type thePlaneS: Graphic3d_Vec4
	:param thePlaneT:
	:type thePlaneT: Graphic3d_Vec4
	:rtype: None
") SetGenMode;
		void SetGenMode (const Graphic3d_TypeOfTextureMode theMode,const Graphic3d_Vec4 thePlaneS,const Graphic3d_Vec4 thePlaneT);
};


%extend Graphic3d_TextureParams {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureParams(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureParams::Handle_Graphic3d_TextureParams %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureParams;
class Handle_Graphic3d_TextureParams : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_TextureParams();
        Handle_Graphic3d_TextureParams(const Handle_Graphic3d_TextureParams &aHandle);
        Handle_Graphic3d_TextureParams(const Graphic3d_TextureParams *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureParams DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureParams {
    Graphic3d_TextureParams* GetObject() {
    return (Graphic3d_TextureParams*)$self->Access();
    }
};

%nodefaultctor Graphic3d_TextureRoot;
class Graphic3d_TextureRoot : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if a texture class is valid or not. returns true if the construction of the class is correct

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	* Returns the full path of the defined texture. It could be empty path if GetImage() is overridden to load image not from file.

	:rtype: OSD_Path
") Path;
		const OSD_Path & Path ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* returns the texture type.

	:rtype: Graphic3d_TypeOfTexture
") Type;
		Graphic3d_TypeOfTexture Type ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* This ID will be used to manage resource in graphic driver. . Default implementation generates unique ID although inheritors may re-initialize it. . Multiple Graphic3d_TextureRoot instancies with same ID will be treated as single texture with different parameters to optimize memory usage though this will be more natural to use same instance of Graphic3d_TextureRoot when possible. . Notice that inheritor may set this ID to empty string. In this case independent graphical resource will be created for each instance of Graphic3d_AspectFillArea3d where texture will be used. . returns texture identifier.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "	* This method will be called by graphic driver each time when texture resource should be created. Default constructors allow defining the texture source as path to texture image or directly as pixmap. If the source is defined as path, then the image will be dynamically loaded when this method is called (and no copy will be preserved in this class instance). Inheritors may dynamically generate the image. Notice, image data should be in Bottom-Up order (see Image_PixMap::IsTopDown())! returns the image for texture.

	:rtype: Image_PixMap_Handle
") GetImage;
		virtual Image_PixMap_Handle GetImage ();
		%feature("compactdefaultargs") GetParams;
		%feature("autodoc", "	* returns low-level texture parameters

	:rtype: Handle_Graphic3d_TextureParams
") GetParams;
		Handle_Graphic3d_TextureParams GetParams ();
		%feature("compactdefaultargs") TexturesFolder;
		%feature("autodoc", "	* The path to textures determined from CSF_MDTVTexturesDirectory or CASROOT environment variables. returns the root folder with default textures.

	:rtype: TCollection_AsciiString
") TexturesFolder;
		static TCollection_AsciiString TexturesFolder ();
};


%extend Graphic3d_TextureRoot {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureRoot(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureRoot::Handle_Graphic3d_TextureRoot %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureRoot;
class Handle_Graphic3d_TextureRoot : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_TextureRoot();
        Handle_Graphic3d_TextureRoot(const Handle_Graphic3d_TextureRoot &aHandle);
        Handle_Graphic3d_TextureRoot(const Graphic3d_TextureRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureRoot {
    Graphic3d_TextureRoot* GetObject() {
    return (Graphic3d_TextureRoot*)$self->Access();
    }
};

%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec2>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2> {
	public:
};


%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec2i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> {
	public:
};


%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec3>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3> {
	public:
};


%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec3i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> {
	public:
};


%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec4>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4> {
	public:
};


%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec4i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> {
	public:
};


%nodefaultctor Graphic3d_UniformValueTypeID<Standard_Integer>;
class Graphic3d_UniformValueTypeID<Standard_Integer> {
	public:
};


%nodefaultctor Graphic3d_UniformValueTypeID<Standard_ShortReal>;
class Graphic3d_UniformValueTypeID<Standard_ShortReal> {
	public:
};


%nodefaultctor Graphic3d_ValueInterface;
class Graphic3d_ValueInterface {
	public:
		%feature("compactdefaultargs") TypeID;
		%feature("autodoc", "	* Returns unique identifier of value type.

	:rtype: Standard_Size
") TypeID;
		Standard_Size TypeID ();
};


%nodefaultctor Graphic3d_Vector;
class Graphic3d_Vector {
	public:
		%feature("compactdefaultargs") Graphic3d_Vector;
		%feature("autodoc", "	* Creates a vector with 1.0, 0.0, 0.0 coordinates.

	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector ();
		%feature("compactdefaultargs") Graphic3d_Vector;
		%feature("autodoc", "	* Creates a vector with <AX>, <AY>, <AZ> coordinates.

	:param AX:
	:type AX: float
	:param AY:
	:type AY: float
	:param AZ:
	:type AZ: float
	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("compactdefaultargs") Graphic3d_Vector;
		%feature("autodoc", "	* Creates a vector from 2 points <APoint1> and <APoint2>.

	:param APoint1:
	:type APoint1: Graphic3d_Vertex &
	:param APoint2:
	:type APoint2: Graphic3d_Vertex &
	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector (const Graphic3d_Vertex & APoint1,const Graphic3d_Vertex & APoint2);
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* Normalises <self>. Category: Methods to modify the class definition Warning: Raises VectorError if <self> is null.

	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Modifies the coordinates of the vector <self>.

	:param Xnew:
	:type Xnew: float
	:param Ynew:
	:type Ynew: float
	:param Znew:
	:type Znew: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xnew,const Standard_Real Ynew,const Standard_Real Znew);
		%feature("compactdefaultargs") SetXCoord;
		%feature("autodoc", "	* Modifies the X coordinate of the vector <self>.

	:param Xnew:
	:type Xnew: float
	:rtype: None
") SetXCoord;
		void SetXCoord (const Standard_Real Xnew);
		%feature("compactdefaultargs") SetYCoord;
		%feature("autodoc", "	* Modifies the Y coordinate of the vector <self>.

	:param Ynew:
	:type Ynew: float
	:rtype: None
") SetYCoord;
		void SetYCoord (const Standard_Real Ynew);
		%feature("compactdefaultargs") SetZCoord;
		%feature("autodoc", "	* Modifies the Z coordinate of the vector <self>.

	:param Znew:
	:type Znew: float
	:rtype: None
") SetZCoord;
		void SetZCoord (const Standard_Real Znew);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinates of the vector <self>.

	:param AX:
	:type AX: float &
	:param AY:
	:type AY: float &
	:param AZ:
	:type AZ: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsNormalized;
		%feature("autodoc", "	* Returns Standard_True if <self> has length 1.

	:rtype: bool
") IsNormalized;
		Standard_Boolean IsNormalized ();
		%feature("compactdefaultargs") LengthZero;
		%feature("autodoc", "	* Returns Standard_True if <self> has length zero.

	:rtype: bool
") LengthZero;
		Standard_Boolean LengthZero ();
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* Returns the X coordinates of the vector <self>.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* Returns the Y coordinate of the vector <self>.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* Returns the Z coordinate of the vector <self>.

	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns Standard_True if the vector <AV1> and //!	 <AV2> are parallel.

	:param AV1:
	:type AV1: Graphic3d_Vector &
	:param AV2:
	:type AV2: Graphic3d_Vector &
	:rtype: bool
") IsParallel;
		static Standard_Boolean IsParallel (const Graphic3d_Vector & AV1,const Graphic3d_Vector & AV2);
		%feature("compactdefaultargs") NormeOf;
		%feature("autodoc", "	* Returns the norm of the vector <AX>, <AY>, <AZ>.

	:param AX:
	:type AX: float
	:param AY:
	:type AY: float
	:param AZ:
	:type AZ: float
	:rtype: float
") NormeOf;
		static Standard_Real NormeOf (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("compactdefaultargs") NormeOf;
		%feature("autodoc", "	* Returns the norm of the vector <AVector>.

	:param AVector:
	:type AVector: Graphic3d_Vector &
	:rtype: float
") NormeOf;
		static Standard_Real NormeOf (const Graphic3d_Vector & AVector);
};


%nodefaultctor Graphic3d_Vertex;
class Graphic3d_Vertex : public TEL_POINT {
	public:
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with 0.0, 0.0, 0.0 coordinates.

	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex ();
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with coordinates identical to <APoint>.

	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Graphic3d_Vertex & APoint);
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with <AX>, <AY> and <AZ> coordinates.

	:param AX:
	:type AX: Standard_ShortReal
	:param AY:
	:type AY: Standard_ShortReal
	:param AZ:
	:type AZ: Standard_ShortReal
	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_ShortReal AX,const Standard_ShortReal AY,const Standard_ShortReal AZ);
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with <AX>, <AY> and <AZ> coordinates.

	:param AX:
	:type AX: float
	:param AY:
	:type AY: float
	:param AZ:
	:type AZ: float
	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Modifies the coordinates of the point <self>.

	:param AX:
	:type AX: Standard_ShortReal
	:param AY:
	:type AY: Standard_ShortReal
	:param AZ:
	:type AZ: Standard_ShortReal
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_ShortReal AX,const Standard_ShortReal AY,const Standard_ShortReal AZ);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Modifies the coordinates of the point <self>.

	:param AX:
	:type AX: float
	:param AY:
	:type AY: float
	:param AZ:
	:type AZ: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinates of the point <self>.

	:param AX:
	:type AX: Standard_ShortReal &
	:param AY:
	:type AY: Standard_ShortReal &
	:param AZ:
	:type AZ: Standard_ShortReal &
	:rtype: None
") Coord;
		void Coord (Standard_ShortReal & AX,Standard_ShortReal & AY,Standard_ShortReal & AZ);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinates of the point <self>.

	:param AX:
	:type AX: float &
	:param AY:
	:type AY: float &
	:param AZ:
	:type AZ: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* Returns the X coordinates of the point <self>.

	:rtype: Standard_ShortReal
") X;
		Standard_ShortReal X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* Returns the Y coordinate of the point <self>.

	:rtype: Standard_ShortReal
") Y;
		Standard_ShortReal Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* Returns the Z coordinate of the point <self>.

	:rtype: Standard_ShortReal
") Z;
		Standard_ShortReal Z ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Returns the distance between <AV1> and <AV2>.

	:param AOther:
	:type AOther: Graphic3d_Vertex &
	:rtype: Standard_ShortReal
") Distance;
		Standard_ShortReal Distance (const Graphic3d_Vertex & AOther);
};


%nodefaultctor Graphic3d_ZLayerSettings;
class Graphic3d_ZLayerSettings {
	public:
		%feature("compactdefaultargs") Graphic3d_ZLayerSettings;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings ();
		%feature("compactdefaultargs") IsSettingEnabled;
		%feature("autodoc", "	* Returns true if theSetting is enabled.

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: bool
") IsSettingEnabled;
		const Standard_Boolean IsSettingEnabled (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") EnableSetting;
		%feature("autodoc", "	* Enables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") EnableSetting;
		void EnableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") DisableSetting;
		%feature("autodoc", "	* Disables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") DisableSetting;
		void DisableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") SetDepthOffsetPositive;
		%feature("autodoc", "	* Sets minimal possible positive depth offset. Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.

	:rtype: None
") SetDepthOffsetPositive;
		void SetDepthOffsetPositive ();
		%feature("compactdefaultargs") SetDepthOffsetNegative;
		%feature("autodoc", "	* Sets minimal possible negative depth offset. Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.

	:rtype: None
") SetDepthOffsetNegative;
		void SetDepthOffsetNegative ();
};


%nodefaultctor Graphic3d_ArrayOfPoints;
class Graphic3d_ArrayOfPoints : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "	* Creates an array of points, a single pixel point is drawn at each vertex. The array must be filled using the AddVertex(Point) method. When <hasVColors> is True , you must use only AddVertex(Point,Color) method.

	:param maxVertexs:
	:type maxVertexs: int
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:rtype: None
") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints (const Standard_Integer maxVertexs,const Standard_Boolean hasVColors = Standard_False);
};


%extend Graphic3d_ArrayOfPoints {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPoints(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPoints::Handle_Graphic3d_ArrayOfPoints %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPoints;
class Handle_Graphic3d_ArrayOfPoints : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPoints();
        Handle_Graphic3d_ArrayOfPoints(const Handle_Graphic3d_ArrayOfPoints &aHandle);
        Handle_Graphic3d_ArrayOfPoints(const Graphic3d_ArrayOfPoints *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPoints DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPoints {
    Graphic3d_ArrayOfPoints* GetObject() {
    return (Graphic3d_ArrayOfPoints*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfPolygons;
class Graphic3d_ArrayOfPolygons : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "	* Creates an array of polygons, a polygon can be filled as: 1) creating a single polygon defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfPolygons(7) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x7,y7,z7) 2) creating separate polygons defined with a predefined number of bounds and the number of vertex per bound. i.e: myArray = Graphic3d_ArrayOfPolygons(7,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddBound(3) myArray->AddVertex(x5,y5,z5) //!	.... myArray->AddVertex(x7,y7,z7) 3) creating a single indexed polygon defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfPolygons(4,0,6) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(4) 4) creating separate polygons defined with a predefined number of bounds and the number of edges per bound. i.e: myArray = Graphic3d_ArrayOfPolygons(6,4,14) myArray->AddBound(3) myArray->AddVertex(x1,y1,z1) myArray->AddVertex(x2,y2,z2) myArray->AddVertex(x3,y3,z3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddBound(3) myArray->AddVertex(x4,y4,z4) myArray->AddVertex(x5,y5,z5) myArray->AddVertex(x6,y6,z6) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(1) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(4) <maxVertexs> defined the maximun allowed vertex number in the array. <maxBounds> defined the maximun allowed bound number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of //!	AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of //!	AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of //!	AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasBColors> is True , <maxBounds> must be > 0 and //!	you must use the //!	AddBound(number,Color) method. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and //!	you must use the //!	AddEdge(number,visibillity) method. Warning: the user is responsible about the orientation of the polygon depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxBounds: default value is 0
	:type maxBounds: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasBColors: default value is Standard_False
	:type hasBColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:param hasEdgeInfos: default value is Standard_False
	:type hasEdgeInfos: bool
	:rtype: None
") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons (const Standard_Integer maxVertexs,const Standard_Integer maxBounds = 0,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasBColors = Standard_False,const Standard_Boolean hasTexels = Standard_False,const Standard_Boolean hasEdgeInfos = Standard_False);
};


%extend Graphic3d_ArrayOfPolygons {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPolygons(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPolygons::Handle_Graphic3d_ArrayOfPolygons %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPolygons;
class Handle_Graphic3d_ArrayOfPolygons : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPolygons();
        Handle_Graphic3d_ArrayOfPolygons(const Handle_Graphic3d_ArrayOfPolygons &aHandle);
        Handle_Graphic3d_ArrayOfPolygons(const Graphic3d_ArrayOfPolygons *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPolygons DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPolygons {
    Graphic3d_ArrayOfPolygons* GetObject() {
    return (Graphic3d_ArrayOfPolygons*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfPolylines;
class Graphic3d_ArrayOfPolylines : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "	* Creates an array of polylines, a polyline can be filled as: 1) creating a single polyline defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfPolylines(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate polylines defined with a predefined number of bounds and the number of vertex per bound. i.e: myArray = Graphic3d_ArrayOfPolylines(7,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(3) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x7,y7,z7) 3) creating a single indexed polyline defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfPolylines(4,0,6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(4) 4) creating separate polylines defined with a predefined number of bounds and the number of edges per bound. i.e: myArray = Graphic3d_ArrayOfPolylines(6,4,14) myArray->AddBound(3) myArray->AddVertex(x1,y1,z1) myArray->AddVertex(x2,y2,z2) myArray->AddVertex(x3,y3,z3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddBound(3) myArray->AddVertex(x4,y4,z4) myArray->AddVertex(x5,y5,z5) myArray->AddVertex(x6,y6,z6) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(1) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(4) <maxVertexs> defined the maximun allowed vertex number in the array. <maxBounds> defined the maximun allowed bound number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasBColors> is True , <maxBounds> must be > 0 and you must use the AddBound(number,Color) method. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and you must use the AddEdge(number,visibillity) method.

	:param maxVertexs:
	:type maxVertexs: int
	:param maxBounds: default value is 0
	:type maxBounds: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasBColors: default value is Standard_False
	:type hasBColors: bool
	:param hasEdgeInfos: default value is Standard_False
	:type hasEdgeInfos: bool
	:rtype: None
") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines (const Standard_Integer maxVertexs,const Standard_Integer maxBounds = 0,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasBColors = Standard_False,const Standard_Boolean hasEdgeInfos = Standard_False);
};


%extend Graphic3d_ArrayOfPolylines {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPolylines(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPolylines::Handle_Graphic3d_ArrayOfPolylines %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPolylines;
class Handle_Graphic3d_ArrayOfPolylines : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPolylines();
        Handle_Graphic3d_ArrayOfPolylines(const Handle_Graphic3d_ArrayOfPolylines &aHandle);
        Handle_Graphic3d_ArrayOfPolylines(const Graphic3d_ArrayOfPolylines *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPolylines DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPolylines {
    Graphic3d_ArrayOfPolylines* GetObject() {
    return (Graphic3d_ArrayOfPolylines*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfQuadrangleStrips;
class Graphic3d_ArrayOfQuadrangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "	* Creates an array of quadrangle strips, a polygon can be filled as: 1) creating a single strip defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfQuadrangleStrips(7) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x7,y7,z7) 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip. i.e: myArray = Graphic3d_ArrayOfQuadrangleStrips(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) //!	.... myArray->AddVertex(x8,y8,z8) <maxVertexs> defined the maximun allowed vertex number in the array. <maxStrips> defined the maximun allowed strip number in the array. The number of quadrangle really drawn is : VertexNumber()/2-Min(1,BoundNumber())

	:param maxVertexs:
	:type maxVertexs: int
	:param maxStrips: default value is 0
	:type maxStrips: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasSColors: default value is Standard_False
	:type hasSColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips (const Standard_Integer maxVertexs,const Standard_Integer maxStrips = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasSColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfQuadrangleStrips {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfQuadrangleStrips(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfQuadrangleStrips::Handle_Graphic3d_ArrayOfQuadrangleStrips %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfQuadrangleStrips;
class Handle_Graphic3d_ArrayOfQuadrangleStrips : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfQuadrangleStrips();
        Handle_Graphic3d_ArrayOfQuadrangleStrips(const Handle_Graphic3d_ArrayOfQuadrangleStrips &aHandle);
        Handle_Graphic3d_ArrayOfQuadrangleStrips(const Graphic3d_ArrayOfQuadrangleStrips *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfQuadrangleStrips DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfQuadrangleStrips {
    Graphic3d_ArrayOfQuadrangleStrips* GetObject() {
    return (Graphic3d_ArrayOfQuadrangleStrips*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfQuadrangles;
class Graphic3d_ArrayOfQuadrangles : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "	* Creates an array of quadrangles, a quadrangle can be filled as: 1) creating a set of quadrangles defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfQuadrangles(8) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x8,y8,z8) 3) creating a set of indexed quadrangles defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfQuadrangles(6,8) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x6,y6,z6) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of //!	AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of //!	AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of //!	AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and //!	you must use the //!	AddEdge(number,visibillity) method. Warning: the user is responsible about the orientation of the quadrangle depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:param hasEdgeInfos: default value is Standard_False
	:type hasEdgeInfos: bool
	:rtype: None
") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles (const Standard_Integer maxVertexs,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasTexels = Standard_False,const Standard_Boolean hasEdgeInfos = Standard_False);
};


%extend Graphic3d_ArrayOfQuadrangles {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfQuadrangles(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfQuadrangles::Handle_Graphic3d_ArrayOfQuadrangles %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfQuadrangles;
class Handle_Graphic3d_ArrayOfQuadrangles : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfQuadrangles();
        Handle_Graphic3d_ArrayOfQuadrangles(const Handle_Graphic3d_ArrayOfQuadrangles &aHandle);
        Handle_Graphic3d_ArrayOfQuadrangles(const Graphic3d_ArrayOfQuadrangles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfQuadrangles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfQuadrangles {
    Graphic3d_ArrayOfQuadrangles* GetObject() {
    return (Graphic3d_ArrayOfQuadrangles*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfSegments;
class Graphic3d_ArrayOfSegments : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "	* Creates an array of segments, a segment can be filled as: 1) creating a set of segments defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfSegments(4) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) 2) creating a set of indexed segments defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfSegments(4,0,8) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(2) myArray->AddEdge(4) myArray->AddEdge(1) myArray->AddEdge(3) <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVColors> is True , you must use only //!	AddVertex(Point,Color) method

	:param maxVertexs:
	:type maxVertexs: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:rtype: None
") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments (const Standard_Integer maxVertexs,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVColors = Standard_False);
};


%extend Graphic3d_ArrayOfSegments {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfSegments(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfSegments::Handle_Graphic3d_ArrayOfSegments %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfSegments;
class Handle_Graphic3d_ArrayOfSegments : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfSegments();
        Handle_Graphic3d_ArrayOfSegments(const Handle_Graphic3d_ArrayOfSegments &aHandle);
        Handle_Graphic3d_ArrayOfSegments(const Graphic3d_ArrayOfSegments *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfSegments DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfSegments {
    Graphic3d_ArrayOfSegments* GetObject() {
    return (Graphic3d_ArrayOfSegments*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfTriangleFans;
class Graphic3d_ArrayOfTriangleFans : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "	* Creates an array of triangle fans, a polygon can be filled as: 1) creating a single fan defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangleFans(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate fans defined with a predefined number of fans and the number of vertex per fan. i.e: myArray = Graphic3d_ArrayOfTriangleFans(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x8,y8,z8) <maxVertexs> defined the maximun allowed vertex number in the array. <maxFans> defined the maximun allowed fan number in the array. The number of triangle really drawn is : VertexNumber()-2*Min(1,BoundNumber())

	:param maxVertexs:
	:type maxVertexs: int
	:param maxFans: default value is 0
	:type maxFans: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasFColors: default value is Standard_False
	:type hasFColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans (const Standard_Integer maxVertexs,const Standard_Integer maxFans = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasFColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfTriangleFans {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfTriangleFans(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfTriangleFans::Handle_Graphic3d_ArrayOfTriangleFans %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfTriangleFans;
class Handle_Graphic3d_ArrayOfTriangleFans : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfTriangleFans();
        Handle_Graphic3d_ArrayOfTriangleFans(const Handle_Graphic3d_ArrayOfTriangleFans &aHandle);
        Handle_Graphic3d_ArrayOfTriangleFans(const Graphic3d_ArrayOfTriangleFans *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfTriangleFans DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfTriangleFans {
    Graphic3d_ArrayOfTriangleFans* GetObject() {
    return (Graphic3d_ArrayOfTriangleFans*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfTriangleStrips;
class Graphic3d_ArrayOfTriangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "	* Creates an array of triangle strips, a polygon can be filled as: 1) creating a single strip defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangleStrips(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip. i.e: myArray = Graphic3d_ArrayOfTriangleStrips(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x8,y8,z8) <maxVertexs> defined the maximun allowed vertex number in the array. <maxStrips> defined the maximun allowed strip number in the array. The number of triangle really drawn is : VertexNumber()-2*Min(1,BoundNumber()) Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasBColors> is True , <maxBounds> must be > 0 and you must use the AddBound(number,Color) method. Warning: the user is responsible about the orientation of the strip depending of the order of the created vertex and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxStrips: default value is 0
	:type maxStrips: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasSColors: default value is Standard_False
	:type hasSColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips (const Standard_Integer maxVertexs,const Standard_Integer maxStrips = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasSColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfTriangleStrips {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfTriangleStrips(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfTriangleStrips::Handle_Graphic3d_ArrayOfTriangleStrips %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfTriangleStrips;
class Handle_Graphic3d_ArrayOfTriangleStrips : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfTriangleStrips();
        Handle_Graphic3d_ArrayOfTriangleStrips(const Handle_Graphic3d_ArrayOfTriangleStrips &aHandle);
        Handle_Graphic3d_ArrayOfTriangleStrips(const Graphic3d_ArrayOfTriangleStrips *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfTriangleStrips DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfTriangleStrips {
    Graphic3d_ArrayOfTriangleStrips* GetObject() {
    return (Graphic3d_ArrayOfTriangleStrips*)$self->Access();
    }
};

%nodefaultctor Graphic3d_ArrayOfTriangles;
class Graphic3d_ArrayOfTriangles : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "	* Creates an array of triangles, a triangle can be filled as: 1) creating a set of triangles defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangles(6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x6,y6,z6) 3) creating a set of indexed triangles defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfTriangles(4,6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and you must use the AddEdge(number,visibillity) method. Warning: the user is responsible about the orientation of the triangle depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:param hasEdgeInfos: default value is Standard_False
	:type hasEdgeInfos: bool
	:rtype: None
") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles (const Standard_Integer maxVertexs,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasTexels = Standard_False,const Standard_Boolean hasEdgeInfos = Standard_False);
};


%extend Graphic3d_ArrayOfTriangles {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfTriangles(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfTriangles::Handle_Graphic3d_ArrayOfTriangles %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfTriangles;
class Handle_Graphic3d_ArrayOfTriangles : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfTriangles();
        Handle_Graphic3d_ArrayOfTriangles(const Handle_Graphic3d_ArrayOfTriangles &aHandle);
        Handle_Graphic3d_ArrayOfTriangles(const Graphic3d_ArrayOfTriangles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfTriangles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfTriangles {
    Graphic3d_ArrayOfTriangles* GetObject() {
    return (Graphic3d_ArrayOfTriangles*)$self->Access();
    }
};

%nodefaultctor Graphic3d_TextureEnv;
class Graphic3d_TextureEnv : public Graphic3d_TextureRoot {
	public:
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "	* Creates an environment texture from a file.

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "	* Creates an environment texture from a predefined texture name set.

	:param theName:
	:type theName: Graphic3d_NameOfTextureEnv
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const Graphic3d_NameOfTextureEnv theName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_ENV_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTextureEnv
") Name;
		Graphic3d_NameOfTextureEnv Name ();
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param theRank:
	:type theRank: int
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);
};


%extend Graphic3d_TextureEnv {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureEnv(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureEnv::Handle_Graphic3d_TextureEnv %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureEnv;
class Handle_Graphic3d_TextureEnv : public Handle_Graphic3d_TextureRoot {

    public:
        // constructors
        Handle_Graphic3d_TextureEnv();
        Handle_Graphic3d_TextureEnv(const Handle_Graphic3d_TextureEnv &aHandle);
        Handle_Graphic3d_TextureEnv(const Graphic3d_TextureEnv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureEnv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureEnv {
    Graphic3d_TextureEnv* GetObject() {
    return (Graphic3d_TextureEnv*)$self->Access();
    }
};

%nodefaultctor Graphic3d_TextureMap;
class Graphic3d_TextureMap : public Graphic3d_TextureRoot {
	public:
		%feature("compactdefaultargs") EnableSmooth;
		%feature("autodoc", "	* enable texture smoothing

	:rtype: None
") EnableSmooth;
		void EnableSmooth ();
		%feature("compactdefaultargs") IsSmoothed;
		%feature("autodoc", "	* Returns True if the texture is smoothed.

	:rtype: bool
") IsSmoothed;
		Standard_Boolean IsSmoothed ();
		%feature("compactdefaultargs") DisableSmooth;
		%feature("autodoc", "	* disable texture smoothing

	:rtype: None
") DisableSmooth;
		void DisableSmooth ();
		%feature("compactdefaultargs") EnableModulate;
		%feature("autodoc", "	* enable texture modulate mode. the image is modulate with the shading of the surface.

	:rtype: None
") EnableModulate;
		void EnableModulate ();
		%feature("compactdefaultargs") DisableModulate;
		%feature("autodoc", "	* disable texture modulate mode. the image is directly decal on the surface.

	:rtype: None
") DisableModulate;
		void DisableModulate ();
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "	* Returns True if the texture is modulate.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("compactdefaultargs") EnableRepeat;
		%feature("autodoc", "	* use this methods if you want to enable texture repetition on your objects.

	:rtype: None
") EnableRepeat;
		void EnableRepeat ();
		%feature("compactdefaultargs") DisableRepeat;
		%feature("autodoc", "	* use this methods if you want to disable texture repetition on your objects.

	:rtype: None
") DisableRepeat;
		void DisableRepeat ();
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "	* Returns True if the texture repeat is enable.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
};


%extend Graphic3d_TextureMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureMap::Handle_Graphic3d_TextureMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureMap;
class Handle_Graphic3d_TextureMap : public Handle_Graphic3d_TextureRoot {

    public:
        // constructors
        Handle_Graphic3d_TextureMap();
        Handle_Graphic3d_TextureMap(const Handle_Graphic3d_TextureMap &aHandle);
        Handle_Graphic3d_TextureMap(const Graphic3d_TextureMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureMap {
    Graphic3d_TextureMap* GetObject() {
    return (Graphic3d_TextureMap*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Texture1D;
class Graphic3d_Texture1D : public Graphic3d_TextureMap {
	public:
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_1D_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTexture1D
") Name;
		Graphic3d_NameOfTexture1D Name ();
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param aRank:
	:type aRank: int
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer aRank);
};


%extend Graphic3d_Texture1D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture1D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture1D::Handle_Graphic3d_Texture1D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture1D;
class Handle_Graphic3d_Texture1D : public Handle_Graphic3d_TextureMap {

    public:
        // constructors
        Handle_Graphic3d_Texture1D();
        Handle_Graphic3d_Texture1D(const Handle_Graphic3d_Texture1D &aHandle);
        Handle_Graphic3d_Texture1D(const Graphic3d_Texture1D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture1D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture1D {
    Graphic3d_Texture1D* GetObject() {
    return (Graphic3d_Texture1D*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Texture2D;
class Graphic3d_Texture2D : public Graphic3d_TextureMap {
	public:
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_2D_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTexture2D
") Name;
		Graphic3d_NameOfTexture2D Name ();
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param theRank:
	:type theRank: int
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);
};


%extend Graphic3d_Texture2D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture2D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture2D::Handle_Graphic3d_Texture2D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture2D;
class Handle_Graphic3d_Texture2D : public Handle_Graphic3d_TextureMap {

    public:
        // constructors
        Handle_Graphic3d_Texture2D();
        Handle_Graphic3d_Texture2D(const Handle_Graphic3d_Texture2D &aHandle);
        Handle_Graphic3d_Texture2D(const Graphic3d_Texture2D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture2D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture2D {
    Graphic3d_Texture2D* GetObject() {
    return (Graphic3d_Texture2D*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Texture1Dmanual;
class Graphic3d_Texture1Dmanual : public Graphic3d_Texture1D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "	* Creates a texture from the file FileName.

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "	* Create a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Graphic3d_NameOfTexture1D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Image_PixMap_Handle & thePixMap);
};


%extend Graphic3d_Texture1Dmanual {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture1Dmanual(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture1Dmanual::Handle_Graphic3d_Texture1Dmanual %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture1Dmanual;
class Handle_Graphic3d_Texture1Dmanual : public Handle_Graphic3d_Texture1D {

    public:
        // constructors
        Handle_Graphic3d_Texture1Dmanual();
        Handle_Graphic3d_Texture1Dmanual(const Handle_Graphic3d_Texture1Dmanual &aHandle);
        Handle_Graphic3d_Texture1Dmanual(const Graphic3d_Texture1Dmanual *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture1Dmanual DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture1Dmanual {
    Graphic3d_Texture1Dmanual* GetObject() {
    return (Graphic3d_Texture1Dmanual*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Texture1Dsegment;
class Graphic3d_Texture1Dsegment : public Graphic3d_Texture1D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Graphic3d_NameOfTexture1D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Image_PixMap_Handle & thePixMap);
		%feature("compactdefaultargs") SetSegment;
		%feature("autodoc", "	* Sets the texture application bounds. Defines the way the texture is stretched across facets. Default values are <0.0, 0.0, 0.0> , <0.0, 0.0, 1.0>

	:param theX1:
	:type theX1: Standard_ShortReal
	:param theY1:
	:type theY1: Standard_ShortReal
	:param theZ1:
	:type theZ1: Standard_ShortReal
	:param theX2:
	:type theX2: Standard_ShortReal
	:param theY2:
	:type theY2: Standard_ShortReal
	:param theZ2:
	:type theZ2: Standard_ShortReal
	:rtype: None
") SetSegment;
		void SetSegment (const Standard_ShortReal theX1,const Standard_ShortReal theY1,const Standard_ShortReal theZ1,const Standard_ShortReal theX2,const Standard_ShortReal theY2,const Standard_ShortReal theZ2);
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns the values of the current segment X1, Y1, Z1 , X2, Y2, Z2.

	:param theX1:
	:type theX1: Standard_ShortReal &
	:param theY1:
	:type theY1: Standard_ShortReal &
	:param theZ1:
	:type theZ1: Standard_ShortReal &
	:param theX2:
	:type theX2: Standard_ShortReal &
	:param theY2:
	:type theY2: Standard_ShortReal &
	:param theZ2:
	:type theZ2: Standard_ShortReal &
	:rtype: None
") Segment;
		void Segment (Standard_ShortReal & theX1,Standard_ShortReal & theY1,Standard_ShortReal & theZ1,Standard_ShortReal & theX2,Standard_ShortReal & theY2,Standard_ShortReal & theZ2);
};


%extend Graphic3d_Texture1Dsegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture1Dsegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture1Dsegment::Handle_Graphic3d_Texture1Dsegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture1Dsegment;
class Handle_Graphic3d_Texture1Dsegment : public Handle_Graphic3d_Texture1D {

    public:
        // constructors
        Handle_Graphic3d_Texture1Dsegment();
        Handle_Graphic3d_Texture1Dsegment(const Handle_Graphic3d_Texture1Dsegment &aHandle);
        Handle_Graphic3d_Texture1Dsegment(const Graphic3d_Texture1Dsegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture1Dsegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture1Dsegment {
    Graphic3d_Texture1Dsegment* GetObject() {
    return (Graphic3d_Texture1Dsegment*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Texture2Dmanual;
class Graphic3d_Texture2Dmanual : public Graphic3d_Texture2D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Graphic3d_NameOfTexture2D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Image_PixMap_Handle & thePixMap);
};


%extend Graphic3d_Texture2Dmanual {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture2Dmanual(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture2Dmanual::Handle_Graphic3d_Texture2Dmanual %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture2Dmanual;
class Handle_Graphic3d_Texture2Dmanual : public Handle_Graphic3d_Texture2D {

    public:
        // constructors
        Handle_Graphic3d_Texture2Dmanual();
        Handle_Graphic3d_Texture2Dmanual(const Handle_Graphic3d_Texture2Dmanual &aHandle);
        Handle_Graphic3d_Texture2Dmanual(const Graphic3d_Texture2Dmanual *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture2Dmanual DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture2Dmanual {
    Graphic3d_Texture2Dmanual* GetObject() {
    return (Graphic3d_Texture2Dmanual*)$self->Access();
    }
};

%nodefaultctor Graphic3d_Texture2Dplane;
class Graphic3d_Texture2Dplane : public Graphic3d_Texture2D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Graphic3d_NameOfTexture2D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Image_PixMap_Handle & thePixMap);
		%feature("compactdefaultargs") SetPlaneS;
		%feature("autodoc", "	* Defines the texture projection plane for texture coordinate S default is <1.0, 0.0, 0.0, 0.0>

	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None
") SetPlaneS;
		void SetPlaneS (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);
		%feature("compactdefaultargs") SetPlaneT;
		%feature("autodoc", "	* Defines the texture projection plane for texture coordinate T default is <0.0, 1.0, 0.0, 0.0>

	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None
") SetPlaneT;
		void SetPlaneT (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Defines the texture projection plane for both S and T texture coordinate default is NOTP_XY meaning: <1.0, 0.0, 0.0, 0.0> for S and <0.0, 1.0, 0.0, 0.0> for T

	:param thePlane:
	:type thePlane: Graphic3d_NameOfTexturePlane
	:rtype: None
") SetPlane;
		void SetPlane (const Graphic3d_NameOfTexturePlane thePlane);
		%feature("compactdefaultargs") SetScaleS;
		%feature("autodoc", "	* Defines the texture scale for the S texture coordinate much easier than recomputing the S plane equation but the result is the same default to 1.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetScaleS;
		void SetScaleS (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetScaleT;
		%feature("autodoc", "	* Defines the texture scale for the T texture coordinate much easier than recompution the T plane equation but the result is the same default to 1.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetScaleT;
		void SetScaleT (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetTranslateS;
		%feature("autodoc", "	* Defines the texture translation for the S texture coordinate you can obtain the same effect by modifying the S plane equation but its not easier. default to 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetTranslateS;
		void SetTranslateS (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetTranslateT;
		%feature("autodoc", "	* Defines the texture translation for the T texture coordinate you can obtain the same effect by modifying the T plane equation but its not easier. default to 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetTranslateT;
		void SetTranslateT (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Sets the rotation angle of the whole texture. the same result might be achieved by recomputing the S and T plane equation but it's not the easiest way... the angle is expressed in degrees default is 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the current texture plane name or NOTP_UNKNOWN when the plane is user defined.

	:rtype: Graphic3d_NameOfTexturePlane
") Plane;
		Graphic3d_NameOfTexturePlane Plane ();
		%feature("compactdefaultargs") PlaneS;
		%feature("autodoc", "	* Returns the current texture plane S equation

	:param A:
	:type A: Standard_ShortReal &
	:param B:
	:type B: Standard_ShortReal &
	:param C:
	:type C: Standard_ShortReal &
	:param D:
	:type D: Standard_ShortReal &
	:rtype: None
") PlaneS;
		void PlaneS (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);
		%feature("compactdefaultargs") PlaneT;
		%feature("autodoc", "	* Returns the current texture plane T equation

	:param A:
	:type A: Standard_ShortReal &
	:param B:
	:type B: Standard_ShortReal &
	:param C:
	:type C: Standard_ShortReal &
	:param D:
	:type D: Standard_ShortReal &
	:rtype: None
") PlaneT;
		void PlaneT (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);
		%feature("compactdefaultargs") TranslateS;
		%feature("autodoc", "	* Returns the current texture S translation value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") TranslateS;
		void TranslateS (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") TranslateT;
		%feature("autodoc", "	* Returns the current texture T translation value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") TranslateT;
		void TranslateT (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") ScaleS;
		%feature("autodoc", "	* Returns the current texture S scale value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") ScaleS;
		void ScaleS (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") ScaleT;
		%feature("autodoc", "	* Returns the current texture T scale value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") ScaleT;
		void ScaleT (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* Returns the current texture rotation angle

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") Rotation;
		void Rotation (Standard_ShortReal & theVal);
};


%extend Graphic3d_Texture2Dplane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture2Dplane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture2Dplane::Handle_Graphic3d_Texture2Dplane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture2Dplane;
class Handle_Graphic3d_Texture2Dplane : public Handle_Graphic3d_Texture2D {

    public:
        // constructors
        Handle_Graphic3d_Texture2Dplane();
        Handle_Graphic3d_Texture2Dplane(const Handle_Graphic3d_Texture2Dplane &aHandle);
        Handle_Graphic3d_Texture2Dplane(const Graphic3d_Texture2Dplane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture2Dplane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture2Dplane {
    Graphic3d_Texture2Dplane* GetObject() {
    return (Graphic3d_Texture2Dplane*)$self->Access();
    }
};

