/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include Graphic3d_headers.i

/* typedefs */
typedef NCollection_Vec4 <Standard_Integer> Graphic3d_Vec4i;
typedef NCollection_Vec2 <Standard_Character> Graphic3d_Vec2b;
typedef NCollection_Vec2 <Standard_Real> Graphic3d_Vec2d;
typedef NCollection_Vec2 <Standard_Integer> Graphic3d_Vec2i;
typedef NCollection_Vec4 <Standard_Character> Graphic3d_Vec4b;
typedef Standard_Integer Graphic3d_TransModeFlags;
typedef NCollection_Vec4 <Standard_Real> Graphic3d_Vec4d;
typedef Graphic3d_Structure * Graphic3d_StructPtr;
typedef NCollection_Vec2 <unsigned int> Graphic3d_Vec2u;
typedef NCollection_Vec4 <unsigned int> Graphic3d_Vec4u;
typedef NCollection_Mat4 <Standard_Real> Graphic3d_Mat4d;
typedef CALL_DEF_TRANSFORM_PERSISTENCE Graphic3d_CTransPersStruct;
typedef NCollection_Vec2 <Standard_ShortReal> Graphic3d_Vec2;
typedef NCollection_Vec3 <Standard_ShortReal> Graphic3d_Vec3;
typedef NCollection_Vec4 <Standard_ShortReal> Graphic3d_Vec4;
typedef Handle_Graphic3d_ShaderObject Graphic3d_ShaderObject_Handle;
typedef Handle_Graphic3d_ClipPlane Graphic3d_ClipPlane_Handle;
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
typedef Graphic3d_UniformValue <Graphic3d_Vec3> Graphic3d_UniformVec3;
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
%nodefaultctor Graphic3d;
class Graphic3d {
	public:
		%feature("autodoc", "	* Initialize graphic driver and returns Handle to it.

	:param theDisplayConnection:
	:type theDisplayConnection: Aspect_DisplayConnection_Handle &
	:rtype: Handle_Graphic3d_GraphicDriver
") InitGraphicDriver;
		static Handle_Graphic3d_GraphicDriver InitGraphicDriver (const Aspect_DisplayConnection_Handle & theDisplayConnection);
};


%feature("shadow") Graphic3d::~Graphic3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_Array1OfVector;
class Graphic3d_Array1OfVector {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vector &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Graphic3d_Vector & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vector &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vector & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVector &
	:rtype: Graphic3d_Array1OfVector
") Assign;
		const Graphic3d_Array1OfVector & Assign (const Graphic3d_Array1OfVector & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVector &
	:rtype: Graphic3d_Array1OfVector
") operator=;
		const Graphic3d_Array1OfVector & operator = (const Graphic3d_Array1OfVector & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Graphic3d_Vector &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vector & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Graphic3d_Vector
") Value;
		const Graphic3d_Vector & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Graphic3d_Vector
") ChangeValue;
		Graphic3d_Vector & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Graphic3d_Array1OfVector::~Graphic3d_Array1OfVector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Array1OfVector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_Array1OfVertex;
class Graphic3d_Array1OfVertex {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vertex &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vertex &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVertex &
	:rtype: Graphic3d_Array1OfVertex
") Assign;
		const Graphic3d_Array1OfVertex & Assign (const Graphic3d_Array1OfVertex & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVertex &
	:rtype: Graphic3d_Array1OfVertex
") operator=;
		const Graphic3d_Array1OfVertex & operator = (const Graphic3d_Array1OfVertex & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Graphic3d_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vertex & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Graphic3d_Vertex
") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Graphic3d_Vertex
") ChangeValue;
		Graphic3d_Vertex & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Graphic3d_Array1OfVertex::~Graphic3d_Array1OfVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Array1OfVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_Array2OfVertex;
class Graphic3d_Array2OfVertex {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vertex &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vertex &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array2OfVertex &
	:rtype: Graphic3d_Array2OfVertex
") Assign;
		const Graphic3d_Array2OfVertex & Assign (const Graphic3d_Array2OfVertex & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array2OfVertex &
	:rtype: Graphic3d_Array2OfVertex
") operator=;
		const Graphic3d_Array2OfVertex & operator = (const Graphic3d_Array2OfVertex & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Graphic3d_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Graphic3d_Vertex & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Graphic3d_Vertex
") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Graphic3d_Vertex
") ChangeValue;
		Graphic3d_Vertex & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Graphic3d_Array2OfVertex::~Graphic3d_Array2OfVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Array2OfVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ArrayOfPrimitives;
class Graphic3d_ArrayOfPrimitives : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param aVertice:
	:type aVertice: gp_Pnt
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice);
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
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. returns the actual vertex number. Warning: <aColor> is ignored when the <hasVColors> constructor parameter is False

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Quantity_Color & aColor);
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. returns the actual vertex number. Warning: <aColor> is ignored when the <hasVColors> constructor parameter is False aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aColor:
	:type aColor: Standard_Integer
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Standard_Integer aColor);
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal);
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
		%feature("autodoc", "	* Adds a vertice,vertex normal and color in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aColor> is ignored when the <hasVColors> constructor parameter is False aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:param aColor:
	:type aColor: Standard_Integer
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const Standard_Integer aColor);
		%feature("autodoc", "	* Adds a vertice and vertex texture in the vertex array. returns the actual vertex number. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Pnt2d & aTexel);
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
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> in the bound array returns the actual bounds number.

	:param edgeNumber:
	:type edgeNumber: Standard_Integer
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber);
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> and bound color <aBColor> in the bound array. returns the actual bounds number. Warning: <aBColor> is ignored when the <hasBColors> constructor parameter is False

	:param edgeNumber:
	:type edgeNumber: Standard_Integer
	:param aBColor:
	:type aBColor: Quantity_Color &
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Quantity_Color & aBColor);
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> and bound color coordinates in the bound array. returns the actual bounds number. Warning: <R,G,B> are ignored when the <hasBColors> constructor parameter is False

	:param edgeNumber:
	:type edgeNumber: Standard_Integer
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("autodoc", "	* Adds an edge in the range [1,VertexNumber()] in the array, if <isVisible> is False the edge between <vertexIndex> and the next edge will not be visible even if the SetEdgeOn() method is activated in Graphic3d_AspectFillArea3d class. returns the actual edges number. Warning: <isVisible> is ignored when the <hasEdgeInfos> constructor parameter is False.

	:param vertexIndex:
	:type vertexIndex: Standard_Integer
	:param isVisible: default value is Standard_True
	:type isVisible: bool
	:rtype: int
") AddEdge;
		Standard_Integer AddEdge (const Standard_Integer vertexIndex,const Standard_Boolean isVisible = Standard_True);
		%feature("autodoc", "	* Orientate correctly all vertexs & normals of this array according to the <aNormal> parameter and returns True when something has change in the array. Warning: When the array has edges this method is apply on edge sub array instead on vertex sub array.

	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: bool
") Orientate;
		Standard_Boolean Orientate (const gp_Dir & aNormal);
		%feature("autodoc", "	* Orientate correctly all vertexs & normal of the bound <aBound> according to the <aNormal> parameter and returns True when something has change in the array. Warning: When the array has edges this method is apply on edge sub array instead on vertex sub array. When this array has no bound, <aBoundIndex> design the item number

	:param aBoundIndex:
	:type aBoundIndex: Standard_Integer
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: bool
") Orientate;
		Standard_Boolean Orientate (const Standard_Integer aBoundIndex,const gp_Dir & aNormal);
		%feature("autodoc", "	* Change the vertice of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param aVertice:
	:type aVertice: gp_Pnt
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const gp_Pnt & aVertice);
		%feature("autodoc", "	* Change the vertice of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z);
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array. aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param aColor:
	:type aColor: Standard_Integer
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Integer aColor);
		%feature("autodoc", "	* Change the vertex normal of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const gp_Dir & aNormal);
		%feature("autodoc", "	* Change the vertex normal of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param NX:
	:type NX: float
	:param NY:
	:type NY: float
	:param NZ:
	:type NZ: float
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ);
		%feature("autodoc", "	* Change the vertex texel of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const gp_Pnt2d & aTexel);
		%feature("autodoc", "	* Change the vertex texel of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param TX:
	:type TX: float
	:param TY:
	:type TY: float
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const Standard_Real TX,const Standard_Real TY);
		%feature("autodoc", "	* Change the bound color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("autodoc", "	* Change the bound color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: Standard_Integer
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("autodoc", "	* Returns the array address.

	:rtype: Graphic3d_PrimitiveArray
") Array;
		Graphic3d_PrimitiveArray Array ();
		%feature("autodoc", "	* Returns the type of this primitive

	:rtype: Graphic3d_TypeOfPrimitiveArray
") Type;
		Graphic3d_TypeOfPrimitiveArray Type ();
		%feature("autodoc", "	* Returns the string type of this primitive

	:rtype: char *
") StringType;
		char * StringType ();
		%feature("autodoc", "	* Returns True when vertex normals array is defined.

	:rtype: bool
") HasVertexNormals;
		Standard_Boolean HasVertexNormals ();
		%feature("autodoc", "	* Returns True when vertex colors array is defined.

	:rtype: bool
") HasVertexColors;
		Standard_Boolean HasVertexColors ();
		%feature("autodoc", "	* Returns True when vertex texels array is defined.

	:rtype: bool
") HasVertexTexels;
		Standard_Boolean HasVertexTexels ();
		%feature("autodoc", "	* Returns the number of defined vertex

	:rtype: int
") VertexNumber;
		Standard_Integer VertexNumber ();
		%feature("autodoc", "	* Returns the vertice at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: gp_Pnt
") Vertice;
		gp_Pnt Vertice (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the vertice coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Vertice;
		void Vertice (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the vertex color at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: Quantity_Color
") VertexColor;
		Quantity_Color VertexColor (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the vertex color values at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the vertex color values at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:param aColor:
	:type aColor: Standard_Integer &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the vertex normal at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: gp_Dir
") VertexNormal;
		gp_Dir VertexNormal (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the vertex normal coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:param NX:
	:type NX: float &
	:param NY:
	:type NY: float &
	:param NZ:
	:type NZ: float &
	:rtype: None
") VertexNormal;
		void VertexNormal (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the vertex texture at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: gp_Pnt2d
") VertexTexel;
		gp_Pnt2d VertexTexel (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the vertex texture coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:param TX:
	:type TX: float &
	:param TY:
	:type TY: float &
	:rtype: None
") VertexTexel;
		void VertexTexel (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns True when edge visibillity array is defined.

	:rtype: bool
") HasEdgeInfos;
		Standard_Boolean HasEdgeInfos ();
		%feature("autodoc", "	* Returns the number of defined edges

	:rtype: int
") EdgeNumber;
		Standard_Integer EdgeNumber ();
		%feature("autodoc", "	* Returns the vertex index at rank <aRank> in the range [1,VertexNumber()]

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: int
") Edge;
		Standard_Integer Edge (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns True when the edge at rank <aRank> is visible.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: bool
") EdgeIsVisible;
		Standard_Boolean EdgeIsVisible (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns True when bound colors array is defined.

	:rtype: bool
") HasBoundColors;
		Standard_Boolean HasBoundColors ();
		%feature("autodoc", "	* Returns the number of defined bounds

	:rtype: int
") BoundNumber;
		Standard_Integer BoundNumber ();
		%feature("autodoc", "	* Returns the edge number at rank <aRank>.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: int
") Bound;
		Standard_Integer Bound (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the bound color at rank <aRank> from the bound table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: Quantity_Color
") BoundColor;
		Quantity_Color BoundColor (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the bound color values at rank <aRank> from the bound table if defined.

	:param aRank:
	:type aRank: Standard_Integer
	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: None
") BoundColor;
		void BoundColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the number of total items according to the array type.

	:rtype: int
") ItemNumber;
		Standard_Integer ItemNumber ();
		%feature("autodoc", "	* Returns True only when the contains of this array is available.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
};


%feature("shadow") Graphic3d_ArrayOfPrimitives::~Graphic3d_ArrayOfPrimitives %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfPrimitives {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfPrimitives {
	Handle_Graphic3d_ArrayOfPrimitives GetHandle() {
	return *(Handle_Graphic3d_ArrayOfPrimitives*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfPrimitives::~Handle_Graphic3d_ArrayOfPrimitives %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfPrimitives {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_AspectFillArea3d;
class Graphic3d_AspectFillArea3d : public Aspect_AspectFillArea {
	public:
		%feature("autodoc", "	* Creates a context table for fill area primitives defined with the following default values:  InteriorStyle : IS_EMPTY InteriorColor : NOC_CYAN1 EdgeColor  : NOC_WHITE EdgeLineType : TOL_SOLID EdgeWidth  : 1.0 FrontMaterial : NOM_BRASS BackMaterial : NOM_BRASS  Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.

	:rtype: None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d ();
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
		%feature("autodoc", "	* Allows the display of back-facing filled polygons.

	:rtype: None
") AllowBackFace;
		void AllowBackFace ();
		%feature("autodoc", "	* Modifies the surface material of internal faces

	:param AMaterial:
	:type AMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetBackMaterial;
		void SetBackMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("autodoc", "	* Allows distinction between external and internal faces of FillAreas.

	:rtype: None
") SetDistinguishOn;
		void SetDistinguishOn ();
		%feature("autodoc", "	* Forbids distinction between external and internal faces of FillAreas.

	:rtype: None
") SetDistinguishOff;
		void SetDistinguishOff ();
		%feature("autodoc", "	* The edges of FillAreas are drawn.

	:rtype: None
") SetEdgeOn;
		void SetEdgeOn ();
		%feature("autodoc", "	* The edges of FillAreas are not drawn.

	:rtype: None
") SetEdgeOff;
		void SetEdgeOff ();
		%feature("autodoc", "	* Modifies the surface material of external faces

	:param AMaterial:
	:type AMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetFrontMaterial;
		void SetFrontMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("autodoc", "	* Suppress the display of back-facing filled polygons. A back-facing polygon is defined as a polygon whose vertices are in a clockwise order with respect to screen coordinates.

	:rtype: None
") SuppressBackFace;
		void SuppressBackFace ();
		%feature("autodoc", "	:param ATexture:
	:type ATexture: Handle_Graphic3d_TextureMap &
	:rtype: None
") SetTextureMap;
		void SetTextureMap (const Handle_Graphic3d_TextureMap & ATexture);
		%feature("autodoc", "	:rtype: None
") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("autodoc", "	:rtype: None
") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("autodoc", "	* Sets up OpenGL polygon offsets mechanism. <aMode> parameter can contain various combinations of Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means that polygon offsets are not changed). If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits> arguments are used by graphic renderer to calculate a depth offset value:  offset = <aFactor> * m + <aUnits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific)  Deafult settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0.  Negative offset values move polygons closer to the viewport, while positive values shift polygons away. Consult OpenGL reference for details (glPolygonOffset function description).

	:param aMode:
	:type aMode: Standard_Integer
	:param aFactor: default value is 1.0
	:type aFactor: Standard_ShortReal
	:param aUnits: default value is 0.0
	:type aUnits: Standard_ShortReal
	:rtype: None
") SetPolygonOffsets;
		void SetPolygonOffsets (const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0);
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "	* Returns the Back Face Removal status. Standard_True if SuppressBackFace is activated.

	:rtype: bool
") BackFace;
		Standard_Boolean BackFace ();
		%feature("autodoc", "	* Returns the Distinguish Mode status.

	:rtype: bool
") Distinguish;
		Standard_Boolean Distinguish ();
		%feature("autodoc", "	* Returns Standard_True if the edges are drawn and Standard_False if the edges are not drawn.

	:rtype: bool
") Edge;
		Standard_Boolean Edge ();
		%feature("autodoc", "	* Returns the surface material of internal faces

	:rtype: Graphic3d_MaterialAspect
") BackMaterial;
		Graphic3d_MaterialAspect BackMaterial ();
		%feature("autodoc", "	* Returns the surface material of external faces

	:rtype: Graphic3d_MaterialAspect
") FrontMaterial;
		Graphic3d_MaterialAspect FrontMaterial ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_TextureMap
") TextureMap;
		Handle_Graphic3d_TextureMap TextureMap ();
		%feature("autodoc", "	:rtype: bool
") TextureMapState;
		Standard_Boolean TextureMapState ();
		%feature("autodoc", "	* Returns current polygon offsets settings.

	:param aMode:
	:type aMode: Standard_Integer &
	:param aFactor:
	:type aFactor: Standard_ShortReal &
	:param aUnits:
	:type aUnits: Standard_ShortReal &
	:rtype: None
") PolygonOffsets;
		void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%feature("shadow") Graphic3d_AspectFillArea3d::~Graphic3d_AspectFillArea3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_AspectFillArea3d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_AspectFillArea3d {
	Handle_Graphic3d_AspectFillArea3d GetHandle() {
	return *(Handle_Graphic3d_AspectFillArea3d*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_AspectFillArea3d::~Handle_Graphic3d_AspectFillArea3d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_AspectFillArea3d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_AspectLine3d;
class Graphic3d_AspectLine3d : public Aspect_AspectLine {
	public:
		%feature("autodoc", "	* Creates a context table for line primitives //!	 defined with the following default values: //!	 Colour	: NOC_YELLOW //!	 Line type	: TOL_SOLID //!	 Width	: 1.0

	:rtype: None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d ();
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
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%feature("shadow") Graphic3d_AspectLine3d::~Graphic3d_AspectLine3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_AspectLine3d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_AspectLine3d {
	Handle_Graphic3d_AspectLine3d GetHandle() {
	return *(Handle_Graphic3d_AspectLine3d*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_AspectLine3d::~Handle_Graphic3d_AspectLine3d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_AspectLine3d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_AspectMarker3d;
class Graphic3d_AspectMarker3d : public Aspect_AspectMarker {
	public:
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the following default values:  Marker type : TOM_X Colour : YELLOW Scale factor: 1.0

	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d ();
		%feature("autodoc", "	:param theType:
	:type theType: Aspect_TypeOfMarker
	:param theColor:
	:type theColor: Quantity_Color &
	:param theScale:
	:type theScale: float
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Aspect_TypeOfMarker theType,const Quantity_Color & theColor,const Standard_Real theScale);
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the specified values.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theWidth:
	:type theWidth: Standard_Integer
	:param theHeight:
	:type theHeight: Standard_Integer
	:param theTextureBitmap:
	:type theTextureBitmap: Handle_TColStd_HArray1OfByte &
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Quantity_Color & theColor,const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTextureBitmap);
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the specified values.

	:param theTextureImage:
	:type theTextureImage: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Image_PixMap_Handle & theTextureImage);
		%feature("autodoc", "	* Returns marker's texture size.

	:param theWidth:
	:type theWidth: Standard_Integer &
	:param theHeight:
	:type theHeight: Standard_Integer &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.

	:rtype: Graphic3d_MarkerImage_Handle
") GetMarkerImage;
		const Graphic3d_MarkerImage_Handle & GetMarkerImage ();
		%feature("autodoc", "	:param theWidth:
	:type theWidth: Standard_Integer
	:param theHeight:
	:type theHeight: Standard_Integer
	:param theTexture:
	:type theTexture: Handle_TColStd_HArray1OfByte &
	:rtype: None
") SetBitMap;
		void SetBitMap (const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTexture);
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%feature("shadow") Graphic3d_AspectMarker3d::~Graphic3d_AspectMarker3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_AspectMarker3d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_AspectMarker3d {
	Handle_Graphic3d_AspectMarker3d GetHandle() {
	return *(Handle_Graphic3d_AspectMarker3d*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_AspectMarker3d::~Handle_Graphic3d_AspectMarker3d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_AspectMarker3d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_AspectText3d;
class Graphic3d_AspectText3d : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates a context table for text primitives defined with the following default values: Colour  : NOC_YELLOW Font  : NOF_ASCII_MONO Expansion factor : 1. Space between characters : 0. The style  : TOST_NORMAL The display type : TODT_NORMAL

	:rtype: None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d ();
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
		%feature("autodoc", "	* Modifies the colour of <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the expansion factor (height/width ratio) If the factor is less than 1, the characters will be higher than they are wide.

	:param AFactor:
	:type AFactor: float
	:rtype: None
") SetExpansionFactor;
		void SetExpansionFactor (const Standard_Real AFactor);
		%feature("autodoc", "	* Modifies the font of <self>.

	:param AFont:
	:type AFont: char *
	:rtype: None
") SetFont;
		void SetFont (const char * AFont);
		%feature("autodoc", "	* Modifies the space between the characters.

	:param ASpace:
	:type ASpace: float
	:rtype: None
") SetSpace;
		void SetSpace (const Standard_Real ASpace);
		%feature("autodoc", "	* Modifies the style of the text. TOST_NORMAL Default text. The text is displayed like any other graphic object. This text can be hidden by another object that is nearest from the point of view. TOST_ANNOTATION The text is always visible. The texte is displayed over the other object according to the priority.

	:param AStyle:
	:type AStyle: Aspect_TypeOfStyleText
	:rtype: None
") SetStyle;
		void SetStyle (const Aspect_TypeOfStyleText AStyle);
		%feature("autodoc", "	* Define the display type of the text. TODT_NORMAL Default display. Text only. TODT_SUBTITLE There is a subtitle under the text. TODT_DEKALE The text is displayed with a 3D style. TODT_BLEND The text is displayed in XOR. TODT_DIMENSION Dimension line under text will be invisible.

	:param ADisplayType:
	:type ADisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") SetDisplayType;
		void SetDisplayType (const Aspect_TypeOfDisplayText ADisplayType);
		%feature("autodoc", "	* Modifies the colour of the subtitle for the TODT_SUBTITLE TextDisplayType  and the colour of backgroubd for the TODT_DEKALE TextDisplayType.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_Color & AColor);
		%feature("autodoc", "	* Turns usage of text zoomable on/off

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetTextZoomable;
		void SetTextZoomable (const Standard_Boolean AFlag);
		%feature("autodoc", "	* Returns True when the Text Zoomable is on.

	:rtype: bool
") GetTextZoomable;
		Standard_Boolean GetTextZoomable ();
		%feature("autodoc", "	* Turns usage of text rotated

	:param AAngle:
	:type AAngle: float
	:rtype: None
") SetTextAngle;
		void SetTextAngle (const Standard_Real AAngle);
		%feature("autodoc", "	* Returns Angle of degree

	:rtype: float
") GetTextAngle;
		Standard_Real GetTextAngle ();
		%feature("autodoc", "	* Turns usage of Aspect text

	:param AFontAspect:
	:type AFontAspect: Font_FontAspect
	:rtype: None
") SetTextFontAspect;
		void SetTextFontAspect (const Font_FontAspect AFontAspect);
		%feature("autodoc", "	* Returns text FontAspect

	:rtype: Font_FontAspect
") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect ();
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram_Handle &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "	:rtype: Graphic3d_ShaderProgram_Handle
") ShaderProgram;
		const Graphic3d_ShaderProgram_Handle & ShaderProgram ();
};


%feature("shadow") Graphic3d_AspectText3d::~Graphic3d_AspectText3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_AspectText3d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_AspectText3d {
	Handle_Graphic3d_AspectText3d GetHandle() {
	return *(Handle_Graphic3d_AspectText3d*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_AspectText3d::~Handle_Graphic3d_AspectText3d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_AspectText3d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_CBitFields16;
class Graphic3d_CBitFields16 {
	public:
};


%feature("shadow") Graphic3d_CBitFields16::~Graphic3d_CBitFields16 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CBitFields16 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CBitFields20;
class Graphic3d_CBitFields20 {
	public:
};


%feature("shadow") Graphic3d_CBitFields20::~Graphic3d_CBitFields20 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CBitFields20 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CBitFields4;
class Graphic3d_CBitFields4 {
	public:
};


%feature("shadow") Graphic3d_CBitFields4::~Graphic3d_CBitFields4 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CBitFields4 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CBitFields8;
class Graphic3d_CBitFields8 {
	public:
};


%feature("shadow") Graphic3d_CBitFields8::~Graphic3d_CBitFields8 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CBitFields8 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CGraduatedTrihedron;
class Graphic3d_CGraduatedTrihedron {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_CGraduatedTrihedron;
		 Graphic3d_CGraduatedTrihedron ();
};


%feature("shadow") Graphic3d_CGraduatedTrihedron::~Graphic3d_CGraduatedTrihedron %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CGraduatedTrihedron {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CGroup;
class Graphic3d_CGroup {
	public:
};


%feature("shadow") Graphic3d_CGroup::~Graphic3d_CGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CLight;
class Graphic3d_CLight {
	public:
		%feature("autodoc", "	* //!< flag to mark head light Const attenuation factor of positional light source

	:rtype: Standard_ShortReal
") ConstAttenuation;
		Standard_ShortReal ConstAttenuation ();
		%feature("autodoc", "	* Linear attenuation factor of positional light source

	:rtype: Standard_ShortReal
") LinearAttenuation;
		Standard_ShortReal LinearAttenuation ();
		%feature("autodoc", "	* Const, Linear attenuation factors of positional light source

	:rtype: Graphic3d_Vec2
") Attenuation;
		Graphic3d_Vec2 Attenuation ();
		%feature("autodoc", "	* Angle in radians of the cone created by the spot

	:rtype: Standard_ShortReal
") Angle;
		Standard_ShortReal Angle ();
		%feature("autodoc", "	* Intensity distribution of the spot light, with 0..1 range.

	:rtype: Standard_ShortReal
") Concentration;
		Standard_ShortReal Concentration ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConstAttenuation;
		Standard_ShortReal & ChangeConstAttenuation ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeLinearAttenuation;
		Standard_ShortReal & ChangeLinearAttenuation ();
		%feature("autodoc", "	:rtype: Graphic3d_Vec2
") ChangeAttenuation;
		Graphic3d_Vec2 & ChangeAttenuation ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeAngle;
		Standard_ShortReal & ChangeAngle ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConcentration;
		Standard_ShortReal & ChangeConcentration ();
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Graphic3d_CLight;
		 Graphic3d_CLight ();
};


%feature("shadow") Graphic3d_CLight::~Graphic3d_CLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CLight {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CStructure;
class Graphic3d_CStructure {
	public:
};


%feature("shadow") Graphic3d_CStructure::~Graphic3d_CStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CTexture;
class Graphic3d_CTexture {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_CTexture;
		 Graphic3d_CTexture ();
};


%feature("shadow") Graphic3d_CTexture::~Graphic3d_CTexture %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CTexture {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_CView;
class Graphic3d_CView {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_CView;
		 Graphic3d_CView ();
};


%feature("shadow") Graphic3d_CView::~Graphic3d_CView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_CView {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_DataStructureManager;
class Graphic3d_DataStructureManager : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Deletes the manager <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
};


%feature("shadow") Graphic3d_DataStructureManager::~Graphic3d_DataStructureManager %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_DataStructureManager {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_DataStructureManager {
	Handle_Graphic3d_DataStructureManager GetHandle() {
	return *(Handle_Graphic3d_DataStructureManager*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_DataStructureManager::~Handle_Graphic3d_DataStructureManager %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_DataStructureManager {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_GraphicDriver;
class Graphic3d_GraphicDriver : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Starts graphic driver with given connection

	:param theDisplayConnection:
	:type theDisplayConnection: Aspect_DisplayConnection_Handle &
	:rtype: bool
") Begin;
		virtual Standard_Boolean Begin (const Aspect_DisplayConnection_Handle & theDisplayConnection);
		%feature("autodoc", "	* call_togl_end

	:rtype: void
") End;
		virtual void End ();
		%feature("autodoc", "	* call_togl_inquirelight

	:rtype: int
") InquireLightLimit;
		virtual Standard_Integer InquireLightLimit ();
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
		%feature("autodoc", "	* call_togl_inquireplane

	:rtype: int
") InquirePlaneLimit;
		virtual Standard_Integer InquirePlaneLimit ();
		%feature("autodoc", "	* call_togl_inquireview

	:rtype: int
") InquireViewLimit;
		virtual Standard_Integer InquireViewLimit ();
		%feature("autodoc", "	* call_togl_blink

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param Create:
	:type Create: bool
	:rtype: void
") Blink;
		virtual void Blink (const Graphic3d_CStructure & ACStructure,const Standard_Boolean Create);
		%feature("autodoc", "	* call_togl_boundarybox

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param Create:
	:type Create: bool
	:rtype: void
") BoundaryBox;
		virtual void BoundaryBox (const Graphic3d_CStructure & ACStructure,const Standard_Boolean Create);
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
		%feature("autodoc", "	* call_togl_namesetstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") NameSetStructure;
		virtual void NameSetStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_cleargroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:rtype: void
") ClearGroup;
		virtual void ClearGroup (const Graphic3d_CGroup & ACGroup);
		%feature("autodoc", "	* call_togl_facecontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: Standard_Integer
	:rtype: void
") FaceContextGroup;
		virtual void FaceContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "	* call_togl_group

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:rtype: void
") Group;
		virtual void Group (Graphic3d_CGroup & ACGroup);
		%feature("autodoc", "	* call_togl_linecontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: Standard_Integer
	:rtype: void
") LineContextGroup;
		virtual void LineContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "	* call_togl_markercontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: Standard_Integer
	:rtype: void
") MarkerContextGroup;
		virtual void MarkerContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "	* call_togl_removegroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:rtype: void
") RemoveGroup;
		virtual void RemoveGroup (const Graphic3d_CGroup & ACGroup);
		%feature("autodoc", "	* call_togl_textcontextgroup

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param NoInsert:
	:type NoInsert: Standard_Integer
	:rtype: void
") TextContextGroup;
		virtual void TextContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "	* call_togl_clearstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") ClearStructure;
		virtual void ClearStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_connect

	:param AFather:
	:type AFather: Graphic3d_CStructure &
	:param ASon:
	:type ASon: Graphic3d_CStructure &
	:rtype: void
") Connect;
		virtual void Connect (const Graphic3d_CStructure & AFather,const Graphic3d_CStructure & ASon);
		%feature("autodoc", "	* call_togl_contextstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") ContextStructure;
		virtual void ContextStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_disconnect

	:param AFather:
	:type AFather: Graphic3d_CStructure &
	:param ASon:
	:type ASon: Graphic3d_CStructure &
	:rtype: void
") Disconnect;
		virtual void Disconnect (const Graphic3d_CStructure & AFather,const Graphic3d_CStructure & ASon);
		%feature("autodoc", "	* call_togl_displaystructure

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param APriority:
	:type APriority: Standard_Integer
	:rtype: void
") DisplayStructure;
		virtual void DisplayStructure (const Graphic3d_CView & ACView,const Graphic3d_CStructure & ACStructure,const Standard_Integer APriority);
		%feature("autodoc", "	* call_togl_erasestructure

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") EraseStructure;
		virtual void EraseStructure (const Graphic3d_CView & ACView,const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_removestructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") RemoveStructure;
		virtual void RemoveStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_structure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") Structure;
		virtual void Structure (Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_activateview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") ActivateView;
		virtual void ActivateView (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_antialiasing

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") AntiAliasing;
		virtual void AntiAliasing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("autodoc", "	* call_togl_background

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") Background;
		virtual void Background (const Graphic3d_CView & ACView);
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
		%feature("autodoc", "	:param FileName:
	:type FileName: char *
	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:rtype: void
") BackgroundImage;
		virtual void BackgroundImage (const char * FileName,const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:rtype: void
") SetBgImageStyle;
		virtual void SetBgImageStyle (const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_GradientFillMethod
	:rtype: void
") SetBgGradientStyle;
		virtual void SetBgGradientStyle (const Graphic3d_CView & ACView,const Aspect_GradientFillMethod FillStyle);
		%feature("autodoc", "	* call_togl_cliplimit

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AWait:
	:type AWait: bool
	:rtype: void
") ClipLimit;
		virtual void ClipLimit (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("autodoc", "	* call_togl_deactivateview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") DeactivateView;
		virtual void DeactivateView (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_cliplimit

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") DepthCueing;
		virtual void DepthCueing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
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
	:type AU: Standard_Integer &
	:param AV:
	:type AV: Standard_Integer &
	:rtype: bool
") ProjectRaster;
		virtual Standard_Boolean ProjectRaster (const Graphic3d_CView & ACView,const Standard_ShortReal AX,const Standard_ShortReal AY,const Standard_ShortReal AZ,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* call_togl_unproject_raster

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param Axm:
	:type Axm: Standard_Integer
	:param Aym:
	:type Aym: Standard_Integer
	:param AXM:
	:type AXM: Standard_Integer
	:param AYM:
	:type AYM: Standard_Integer
	:param AU:
	:type AU: Standard_Integer
	:param AV:
	:type AV: Standard_Integer
	:param AX:
	:type AX: Standard_ShortReal &
	:param AY:
	:type AY: Standard_ShortReal &
	:param AZ:
	:type AZ: Standard_ShortReal &
	:rtype: bool
") UnProjectRaster;
		virtual Standard_Boolean UnProjectRaster (const Graphic3d_CView & ACView,const Standard_Integer Axm,const Standard_Integer Aym,const Standard_Integer AXM,const Standard_Integer AYM,const Standard_Integer AU,const Standard_Integer AV,Standard_ShortReal & AX,Standard_ShortReal & AY,Standard_ShortReal & AZ);
		%feature("autodoc", "	* call_togl_unproject_raster_with_ray

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param Axm:
	:type Axm: Standard_Integer
	:param Aym:
	:type Aym: Standard_Integer
	:param AXM:
	:type AXM: Standard_Integer
	:param AYM:
	:type AYM: Standard_Integer
	:param AU:
	:type AU: Standard_Integer
	:param AV:
	:type AV: Standard_Integer
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
		%feature("autodoc", "	* call_togl_ratio_window

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") RatioWindow;
		virtual void RatioWindow (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_redraw Warning: when the redraw area has a null size, the full view is redrawn

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param ACUnderLayer:
	:type ACUnderLayer: Aspect_CLayer2d &
	:param ACOverLayer:
	:type ACOverLayer: Aspect_CLayer2d &
	:param x: default value is 0
	:type x: Standard_Integer
	:param y: default value is 0
	:type y: Standard_Integer
	:param width: default value is 0
	:type width: Standard_Integer
	:param height: default value is 0
	:type height: Standard_Integer
	:rtype: void
") Redraw;
		virtual void Redraw (const Graphic3d_CView & ACView,const Aspect_CLayer2d & ACUnderLayer,const Aspect_CLayer2d & ACOverLayer,const Standard_Integer x = 0,const Standard_Integer y = 0,const Standard_Integer width = 0,const Standard_Integer height = 0);
		%feature("autodoc", "	* call_togl_removeview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") RemoveView;
		virtual void RemoveView (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_setlight

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") SetLight;
		virtual void SetLight (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* Pass clip planes to the associated graphic driver view.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:rtype: void
") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_CView & theCView);
		%feature("autodoc", "	* Pass clip planes to the associated graphic driver structure.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:rtype: void
") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_CStructure & theCStructure);
		%feature("autodoc", "	* call_togl_setvisualisation

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") SetVisualisation;
		virtual void SetVisualisation (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_transformstructure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") TransformStructure;
		virtual void TransformStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_transparency

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") Transparency;
		virtual void Transparency (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
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
		%feature("autodoc", "	* call_togl_view

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: bool
") View;
		virtual Standard_Boolean View (Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_viewmapping

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AWait:
	:type AWait: bool
	:rtype: void
") ViewMapping;
		virtual void ViewMapping (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("autodoc", "	* call_togl_vieworientation

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AWait:
	:type AWait: bool
	:rtype: void
") ViewOrientation;
		virtual void ViewOrientation (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") Environment;
		virtual void Environment (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* sets the stencil test to theIsEnabled state;

	:param theCGroup:
	:type theCGroup: Graphic3d_CGroup &
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: void
") SetStencilTestOptions;
		virtual void SetStencilTestOptions (const Graphic3d_CGroup & theCGroup,const Standard_Boolean theIsEnabled);
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
		%feature("autodoc", "	* call_togl_userdraw

	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AUserDraw:
	:type AUserDraw: Graphic3d_CUserDraw &
	:rtype: void
") UserDraw;
		virtual void UserDraw (const Graphic3d_CGroup & ACGroup,const Graphic3d_CUserDraw & AUserDraw);
		%feature("autodoc", "	* enables/disables usage of OpenGL vertex buffer arrays while drawing primitiev arrays

	:param status:
	:type status: bool
	:rtype: void
") EnableVBO;
		virtual void EnableVBO (const Standard_Boolean status);
		%feature("autodoc", "	* Returns information about GPU memory usage.

	:param theFreeBytes:
	:type theFreeBytes: Standard_Size &
	:param theInfo:
	:type theInfo: TCollection_AsciiString &
	:rtype: bool
") MemoryInfo;
		virtual Standard_Boolean MemoryInfo (Standard_Size & theFreeBytes,TCollection_AsciiString & theInfo);
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
	:type NbFacettes: Standard_Integer
	:rtype: void
") ZBufferTriedronSetup;
		virtual void ZBufferTriedronSetup (const Quantity_NameOfColor XColor = Quantity_NOC_RED,const Quantity_NameOfColor YColor = Quantity_NOC_GREEN,const Quantity_NameOfColor ZColor = Quantity_NOC_BLUE1,const Standard_Real SizeRatio = 0.8,const Standard_Real AxisDiametr = 0.05,const Standard_Integer NbFacettes = 12);
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
		%feature("autodoc", "	* call_togl_triedron_erase

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") TriedronErase;
		virtual void TriedronErase (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_triedron_echo

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AType: default value is Aspect_TOTE_NONE
	:type AType: Aspect_TypeOfTriedronEcho
	:rtype: void
") TriedronEcho;
		virtual void TriedronEcho (const Graphic3d_CView & ACView,const Aspect_TypeOfTriedronEcho AType = Aspect_TOTE_NONE);
		%feature("autodoc", "	* call_togl_graduatedtrihedron_display

	:param view:
	:type view: Graphic3d_CView &
	:param cubic:
	:type cubic: Graphic3d_CGraduatedTrihedron &
	:rtype: void
") GraduatedTrihedronDisplay;
		virtual void GraduatedTrihedronDisplay (const Graphic3d_CView & view,const Graphic3d_CGraduatedTrihedron & cubic);
		%feature("autodoc", "	* call_togl_graduatedtrihedron_erase

	:param view:
	:type view: Graphic3d_CView &
	:rtype: void
") GraduatedTrihedronErase;
		virtual void GraduatedTrihedronErase (const Graphic3d_CView & view);
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
		%feature("autodoc", "	* call_togl_begin_ajout_mode

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: bool
") BeginAddMode;
		virtual Standard_Boolean BeginAddMode (const Graphic3d_CView & ACView);
		%feature("autodoc", "	* call_togl_end_ajout_mode

	:rtype: void
") EndAddMode;
		virtual void EndAddMode ();
		%feature("autodoc", "	* @param theDrawToFrontBuffer Advanced option to modify rendering mode: 1. True. Drawing immediate mode structures directly to the front buffer over the scene image. Fast, so preferred for interactive work (used by default). However these extra drawings will be missed in image dump since it is performed from back buffer. Notice that since no pre-buffering used the V-Sync will be ignored and rendering could be seen in run-time (in case of slow hardware) and/or tearing may appear. So this is strongly recommended to draw only simple (fast) structures. 2. False. Drawing immediate mode structures to the back buffer. The complete scene is redrawn first, so this mode is slower if scene contains complex data and/or V-Sync is turned on. But it works in any case and is especially useful for view dump because the dump image is read from the back buffer. returns previous mode.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theDrawToFrontBuffer:
	:type theDrawToFrontBuffer: bool
	:rtype: bool
") SetImmediateModeDrawToFront;
		virtual Standard_Boolean SetImmediateModeDrawToFront (const Graphic3d_CView & theCView,const Standard_Boolean theDrawToFrontBuffer);
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
		%feature("autodoc", "	* call_togl_clear_immediat_mode

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param aFlush: default value is Standard_True
	:type aFlush: bool
	:rtype: void
") ClearImmediatMode;
		virtual void ClearImmediatMode (const Graphic3d_CView & ACView,const Standard_Boolean aFlush = Standard_True);
		%feature("autodoc", "	* call_togl_draw_structure

	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:rtype: void
") DrawStructure;
		virtual void DrawStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "	* call_togl_end_immediat_mode

	:param Synchronize:
	:type Synchronize: Standard_Integer
	:rtype: void
") EndImmediatMode;
		virtual void EndImmediatMode (const Standard_Integer Synchronize);
		%feature("autodoc", "	* call_togl_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") Layer;
		virtual void Layer (Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "	* call_togl_removelayer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") RemoveLayer;
		virtual void RemoveLayer (const Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "	* call_togl_begin_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") BeginLayer;
		virtual void BeginLayer (const Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "	* call_togl_begin_polygon2d

	:rtype: void
") BeginPolygon2d;
		virtual void BeginPolygon2d ();
		%feature("autodoc", "	* call_togl_begin_polyline2d

	:rtype: void
") BeginPolyline2d;
		virtual void BeginPolyline2d ();
		%feature("autodoc", "	* call_togl_clear_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") ClearLayer;
		virtual void ClearLayer (const Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "	* call_togl_draw2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Draw;
		virtual void Draw (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("autodoc", "	* call_togl_edge2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Edge;
		virtual void Edge (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("autodoc", "	* call_togl_end_layer2d

	:rtype: void
") EndLayer;
		virtual void EndLayer ();
		%feature("autodoc", "	* call_togl_end_polygon2d

	:rtype: void
") EndPolygon2d;
		virtual void EndPolygon2d ();
		%feature("autodoc", "	* call_togl_end_polyline2d

	:rtype: void
") EndPolyline2d;
		virtual void EndPolyline2d ();
		%feature("autodoc", "	* call_togl_move2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Move;
		virtual void Move (const Standard_ShortReal X,const Standard_ShortReal Y);
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
		%feature("autodoc", "	* call_togl_set_transparency

	:param ATransparency:
	:type ATransparency: Standard_ShortReal
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_ShortReal ATransparency);
		%feature("autodoc", "	* call_togl_unset_transparency

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("autodoc", "	* call_togl_set_line_attributes

	:param Type:
	:type Type: Standard_Integer
	:param Width:
	:type Width: Standard_ShortReal
	:rtype: void
") SetLineAttributes;
		virtual void SetLineAttributes (const Standard_Integer Type,const Standard_ShortReal Width);
		%feature("autodoc", "	* Set text attributes for under-/overlayer. <Font> argument defines the name of the font to be used, <Type> argument defines the display type of the text, <R> <G> <B> values define the color of decal or subtitle background. To set the color of the text you can use the SetColor method.

	:param Font:
	:type Font: char *
	:param Type:
	:type Type: Standard_Integer
	:param R:
	:type R: Standard_ShortReal
	:param G:
	:type G: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:rtype: void
") SetTextAttributes;
		virtual void SetTextAttributes (const char * Font,const Standard_Integer Type,const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B);
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
		%feature("autodoc", "	:rtype: Standard_ShortReal
") DefaultTextHeight;
		virtual Standard_ShortReal DefaultTextHeight ();
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
		%feature("autodoc", "	* call_togl_backfacing

	:param aView:
	:type aView: Graphic3d_CView &
	:rtype: void
") SetBackFacingModel;
		virtual void SetBackFacingModel (const Graphic3d_CView & aView);
		%feature("autodoc", "	* call_togl_depthtest

	:param view:
	:type view: Graphic3d_CView &
	:param isEnabled:
	:type isEnabled: bool
	:rtype: void
") SetDepthTestEnabled;
		virtual void SetDepthTestEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("autodoc", "	* call_togl_isdepthtest

	:param view:
	:type view: Graphic3d_CView &
	:rtype: bool
") IsDepthTestEnabled;
		virtual Standard_Boolean IsDepthTestEnabled (const Graphic3d_CView & view);
		%feature("autodoc", "	* Reads depths of shown pixels of the given rectangle (glReadPixels with GL_DEPTH_COMPONENT)

	:param view:
	:type view: Graphic3d_CView &
	:param x:
	:type x: Standard_Integer
	:param y:
	:type y: Standard_Integer
	:param width:
	:type width: Standard_Integer
	:param height:
	:type height: Standard_Integer
	:param buffer:
	:type buffer: Standard_Address
	:rtype: void
") ReadDepths;
		virtual void ReadDepths (const Graphic3d_CView & view,const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height,const Standard_Address buffer);
		%feature("autodoc", "	* Generate offscreen FBO in the graphic library. If not supported on hardware returns NULL.

	:param view:
	:type view: Graphic3d_CView &
	:param width:
	:type width: Standard_Integer
	:param height:
	:type height: Standard_Integer
	:rtype: Graphic3d_PtrFrameBuffer
") FBOCreate;
		virtual Graphic3d_PtrFrameBuffer FBOCreate (const Graphic3d_CView & view,const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "	* Remove offscreen FBO from the graphic library

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:rtype: void
") FBORelease;
		virtual void FBORelease (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr);
		%feature("autodoc", "	* Read offscreen FBO configuration.

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer
	:param width:
	:type width: Standard_Integer &
	:param height:
	:type height: Standard_Integer &
	:param widthMax:
	:type widthMax: Standard_Integer &
	:param heightMax:
	:type heightMax: Standard_Integer &
	:rtype: void
") FBOGetDimensions;
		virtual void FBOGetDimensions (const Graphic3d_CView & view,const Graphic3d_PtrFrameBuffer fboPtr,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Change offscreen FBO viewport.

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:param width:
	:type width: Standard_Integer
	:param height:
	:type height: Standard_Integer
	:rtype: void
") FBOChangeViewport;
		virtual void FBOChangeViewport (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr,const Standard_Integer width,const Standard_Integer height);
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
		%feature("autodoc", "	* call_togl_gllight

	:param view:
	:type view: Graphic3d_CView &
	:param isEnabled:
	:type isEnabled: bool
	:rtype: void
") SetGLLightEnabled;
		virtual void SetGLLightEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("autodoc", "	* call_togl_isgllight

	:param view:
	:type view: Graphic3d_CView &
	:rtype: bool
") IsGLLightEnabled;
		virtual Standard_Boolean IsGLLightEnabled (const Graphic3d_CView & view);
		%feature("autodoc", "	* Export scene into the one of the Vector graphics formats (SVG, PS, PDF...). In contrast to Bitmaps, Vector graphics is scalable (so you may got quality benefits on printing to laser printer). Notice however that results may differ a lot and do not contain some elements.

	:param theFileName:
	:type theFileName: char *
	:param theFormat:
	:type theFormat: Graphic3d_ExportFormat
	:param theSortType:
	:type theSortType: Graphic3d_SortType
	:param theWidth:
	:type theWidth: Standard_Integer
	:param theHeight:
	:type theHeight: Standard_Integer
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
		%feature("autodoc", "	* Add a new top-level z layer with ID <theLayerId> for the view. Z layers allow drawing structures in higher layers in foreground of structures in lower layers. To add a structure to desired layer on display it is necessary to set the layer ID for the structure.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: void
") AddZLayer;
		virtual void AddZLayer (const Graphic3d_CView & theCView,const Standard_Integer theLayerId);
		%feature("autodoc", "	* Remove Z layer from the specified view. All structures displayed at the moment in layer will be displayed in default layer ( the bottom-level z layer ). To unset layer ID from associated structures use method UnsetZLayer (...).

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: void
") RemoveZLayer;
		virtual void RemoveZLayer (const Graphic3d_CView & theCView,const Standard_Integer theLayerId);
		%feature("autodoc", "	* Unset Z layer ID for all structures. The structure indexes will be set to default layer ( the bottom-level z layer with ID = 0 ).

	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: void
") UnsetZLayer;
		virtual void UnsetZLayer (const Standard_Integer theLayerId);
		%feature("autodoc", "	* Change Z layer of a structure. The new z layer ID will be used to define the associated layer for structure on display.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Graphic3d_CStructure & theCStructure,const Standard_Integer theLayerId);
		%feature("autodoc", "	* Change Z layer of a structure already presented in view.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theNewLayerId:
	:type theNewLayerId: Standard_Integer
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Graphic3d_CStructure & theCStructure,const Graphic3d_CView & theCView,const Standard_Integer theNewLayerId);
		%feature("autodoc", "	* Get Z layer ID of structure. If the structure doesn't exists in graphic driver, the method returns -1.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:rtype: int
") GetZLayer;
		virtual Standard_Integer GetZLayer (const Graphic3d_CStructure & theCStructure);
		%feature("autodoc", "	* Sets the settings for a single Z layer of specified view.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: Standard_Integer
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: void
") SetZLayerSettings;
		virtual void SetZLayerSettings (const Graphic3d_CView & theCView,const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: bool
	:rtype: None
") PrintBoolean;
		void PrintBoolean (const char * AComment,const Standard_Boolean AValue);
		%feature("autodoc", "	:param ACGroup:
	:type ACGroup: Graphic3d_CGroup &
	:param AField:
	:type AField: Standard_Integer
	:rtype: None
") PrintCGroup;
		void PrintCGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer AField);
		%feature("autodoc", "	:param ACLight:
	:type ACLight: Graphic3d_CLight &
	:param AField:
	:type AField: Standard_Integer
	:rtype: None
") PrintCLight;
		void PrintCLight (const Graphic3d_CLight & ACLight,const Standard_Integer AField);
		%feature("autodoc", "	:param ACPick:
	:type ACPick: Graphic3d_CPick &
	:param AField:
	:type AField: Standard_Integer
	:rtype: None
") PrintCPick;
		void PrintCPick (const Graphic3d_CPick & ACPick,const Standard_Integer AField);
		%feature("autodoc", "	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param AField:
	:type AField: Standard_Integer
	:rtype: None
") PrintCStructure;
		void PrintCStructure (const Graphic3d_CStructure & ACStructure,const Standard_Integer AField);
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AField:
	:type AField: Standard_Integer
	:rtype: None
") PrintCView;
		void PrintCView (const Graphic3d_CView & ACView,const Standard_Integer AField);
		%feature("autodoc", "	:param AFunc:
	:type AFunc: char *
	:rtype: None
") PrintFunction;
		void PrintFunction (const char * AFunc);
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: Standard_Integer
	:rtype: None
") PrintInteger;
		void PrintInteger (const char * AComment,const Standard_Integer AValue);
		%feature("autodoc", "	:param AFunc:
	:type AFunc: char *
	:param AResult:
	:type AResult: Standard_Integer
	:rtype: None
") PrintIResult;
		void PrintIResult (const char * AFunc,const Standard_Integer AResult);
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: Standard_ShortReal
	:rtype: None
") PrintShortReal;
		void PrintShortReal (const char * AComment,const Standard_ShortReal AValue);
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") PrintMatrix;
		void PrintMatrix (const char * AComment,const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AString:
	:type AString: char *
	:rtype: None
") PrintString;
		void PrintString (const char * AComment,const char * AString);
		%feature("autodoc", "	:param ALevel:
	:type ALevel: Standard_Integer
	:rtype: None
") SetTrace;
		void SetTrace (const Standard_Integer ALevel);
		%feature("autodoc", "	:rtype: int
") Trace;
		Standard_Integer Trace ();
		%feature("autodoc", "	* returns Handle to display connection

	:rtype: Aspect_DisplayConnection_Handle
") GetDisplayConnection;
		const Aspect_DisplayConnection_Handle & GetDisplayConnection ();
		%feature("autodoc", "	:rtype: bool
") IsDeviceLost;
		Standard_Boolean IsDeviceLost ();
		%feature("autodoc", "	:rtype: None
") ResetDeviceLostFlag;
		void ResetDeviceLostFlag ();
};


%feature("shadow") Graphic3d_GraphicDriver::~Graphic3d_GraphicDriver %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_GraphicDriver {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_GraphicDriver {
	Handle_Graphic3d_GraphicDriver GetHandle() {
	return *(Handle_Graphic3d_GraphicDriver*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_GraphicDriver::~Handle_Graphic3d_GraphicDriver %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_GraphicDriver {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Group;
class Graphic3d_Group : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates a group in the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Graphic3d_Group;
		 Graphic3d_Group (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "	* Supress all primitives and attributes of <self>. To clear group without update in Graphic3d_StructureManager pass Standard_False as <theUpdateStructureMgr>. This used on context and viewer destruction, when the pointer to structure manager in Graphic3d_Structure could be already released (pointers are used here to avoid handle cross-reference);

	:param theUpdateStructureMgr: default value is Standard_True
	:type theUpdateStructureMgr: bool
	:rtype: None
") Clear;
		void Clear (const Standard_Boolean theUpdateStructureMgr = Standard_True);
		%feature("autodoc", "	* Supress the group <self> in the structure.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Supress the group <self> in the structure. Warning: No more graphic operations in <self> after this call. Modifies the current modelling transform persistence (pan, zoom or rotate) Get the current modelling transform persistence (pan, zoom or rotate)

	:rtype: None
") Remove;
		void Remove ();
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the line primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the face primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the text primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the marker primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
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
		%feature("autodoc", "	* Adds an array of primitives for display

	:param elem:
	:type elem: Handle_Graphic3d_ArrayOfPrimitives &
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") AddPrimitiveArray;
		void AddPrimitiveArray (const Handle_Graphic3d_ArrayOfPrimitives & elem,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "	* Creates a primitive array with single marker using AddPrimitiveArray().

	:param thePoint:
	:type thePoint: Graphic3d_Vertex &
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: None
") Marker;
		void Marker (const Graphic3d_Vertex & thePoint,const Standard_Boolean theToEvalMinMax = Standard_True);
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
		%feature("autodoc", "	* sets the stencil test to theIsEnabled state;

	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None
") SetStencilTestOptions;
		void SetStencilTestOptions (const Standard_Boolean theIsEnabled);
		%feature("autodoc", "	* sets the flipping to theIsEnabled state.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:param theRefPlane:
	:type theRefPlane: gp_Ax2
	:rtype: None
") SetFlippingOptions;
		void SetFlippingOptions (const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);
		%feature("autodoc", "	* Returns True if aspect is set for the group.

	:param theAspect:
	:type theAspect: Graphic3d_GroupAspect
	:rtype: bool
") IsGroupPrimitivesAspectSet;
		Standard_Boolean IsGroupPrimitivesAspectSet (const Graphic3d_GroupAspect theAspect);
		%feature("autodoc", "	* Returns Standard_True if the group <self> contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("autodoc", "	* Returns Standard_True if the group <self> is deleted. <self> is deleted after the call Remove (me) or the associated structure is deleted.

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("autodoc", "	* Returns Standard_True if the group <self> is empty.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
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
		%feature("autodoc", "	* Returns the structure containing the group <self>.

	:rtype: Handle_Graphic3d_Structure
") Structure;
		Handle_Graphic3d_Structure Structure ();
};


%feature("shadow") Graphic3d_Group::~Graphic3d_Group %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Group {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Group {
	Handle_Graphic3d_Group GetHandle() {
	return *(Handle_Graphic3d_Group*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Group::~Handle_Graphic3d_Group %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Group {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_HSequenceOfGroup;
class Graphic3d_HSequenceOfGroup : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_HSequenceOfGroup;
		 Graphic3d_HSequenceOfGroup ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Graphic3d_HSequenceOfGroup
") Split;
		Handle_Graphic3d_HSequenceOfGroup Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Graphic3d_Group &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Graphic3d_Group
") Value;
		const Handle_Graphic3d_Group & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Graphic3d_Group
") ChangeValue;
		Handle_Graphic3d_Group & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfGroup
") Sequence;
		const Graphic3d_SequenceOfGroup & Sequence ();
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfGroup
") ChangeSequence;
		Graphic3d_SequenceOfGroup & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_HSequenceOfGroup
") ShallowCopy;
		Handle_Graphic3d_HSequenceOfGroup ShallowCopy ();
};


%feature("shadow") Graphic3d_HSequenceOfGroup::~Graphic3d_HSequenceOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_HSequenceOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_HSequenceOfGroup {
	Handle_Graphic3d_HSequenceOfGroup GetHandle() {
	return *(Handle_Graphic3d_HSequenceOfGroup*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_HSequenceOfGroup::~Handle_Graphic3d_HSequenceOfGroup %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_HSequenceOfGroup {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_HSequenceOfStructure;
class Graphic3d_HSequenceOfStructure : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_HSequenceOfStructure;
		 Graphic3d_HSequenceOfStructure ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Graphic3d_HSequenceOfStructure
") Split;
		Handle_Graphic3d_HSequenceOfStructure Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Graphic3d_Structure
") Value;
		const Handle_Graphic3d_Structure & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Graphic3d_Structure
") ChangeValue;
		Handle_Graphic3d_Structure & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfStructure
") Sequence;
		const Graphic3d_SequenceOfStructure & Sequence ();
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfStructure
") ChangeSequence;
		Graphic3d_SequenceOfStructure & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_HSequenceOfStructure
") ShallowCopy;
		Handle_Graphic3d_HSequenceOfStructure ShallowCopy ();
};


%feature("shadow") Graphic3d_HSequenceOfStructure::~Graphic3d_HSequenceOfStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_HSequenceOfStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_HSequenceOfStructure {
	Handle_Graphic3d_HSequenceOfStructure GetHandle() {
	return *(Handle_Graphic3d_HSequenceOfStructure*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_HSequenceOfStructure::~Handle_Graphic3d_HSequenceOfStructure %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_HSequenceOfStructure {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_HSetOfGroup;
class Graphic3d_HSetOfGroup : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_HSetOfGroup;
		 Graphic3d_HSetOfGroup ();
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param B:
	:type B: Handle_Graphic3d_HSetOfGroup &
	:rtype: Handle_Graphic3d_HSetOfGroup
") Union;
		Handle_Graphic3d_HSetOfGroup Union (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("autodoc", "	:param B:
	:type B: Handle_Graphic3d_HSetOfGroup &
	:rtype: Handle_Graphic3d_HSetOfGroup
") Intersection;
		Handle_Graphic3d_HSetOfGroup Intersection (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("autodoc", "	:param B:
	:type B: Handle_Graphic3d_HSetOfGroup &
	:rtype: Handle_Graphic3d_HSetOfGroup
") Difference;
		Handle_Graphic3d_HSetOfGroup Difference (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param S:
	:type S: Handle_Graphic3d_HSetOfGroup &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Handle_Graphic3d_HSetOfGroup & S);
		%feature("autodoc", "	:param S:
	:type S: Handle_Graphic3d_HSetOfGroup &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_Graphic3d_HSetOfGroup & S);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_HSetOfGroup
") ShallowCopy;
		Handle_Graphic3d_HSetOfGroup ShallowCopy ();
		%feature("autodoc", "	:rtype: Graphic3d_SetOfGroup
") Set;
		const Graphic3d_SetOfGroup & Set ();
		%feature("autodoc", "	:rtype: Graphic3d_SetOfGroup
") ChangeSet;
		Graphic3d_SetOfGroup & ChangeSet ();
};


%feature("shadow") Graphic3d_HSetOfGroup::~Graphic3d_HSetOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_HSetOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_HSetOfGroup {
	Handle_Graphic3d_HSetOfGroup GetHandle() {
	return *(Handle_Graphic3d_HSetOfGroup*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_HSetOfGroup::~Handle_Graphic3d_HSetOfGroup %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_HSetOfGroup {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ListIteratorOfListOfPArray;
class Graphic3d_ListIteratorOfListOfPArray {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListIteratorOfListOfPArray;
		 Graphic3d_ListIteratorOfListOfPArray ();
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfPArray &
	:rtype: None
") Graphic3d_ListIteratorOfListOfPArray;
		 Graphic3d_ListIteratorOfListOfPArray (const Graphic3d_ListOfPArray & L);
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfPArray &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_ListOfPArray & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") Value;
		Handle_Graphic3d_ArrayOfPrimitives & Value ();
};


%feature("shadow") Graphic3d_ListIteratorOfListOfPArray::~Graphic3d_ListIteratorOfListOfPArray %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListIteratorOfListOfPArray {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ListIteratorOfListOfShortReal;
class Graphic3d_ListIteratorOfListOfShortReal {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal ();
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfShortReal &
	:rtype: None
") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal (const Graphic3d_ListOfShortReal & L);
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfShortReal &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_ListOfShortReal & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
		Standard_ShortReal & Value ();
};


%feature("shadow") Graphic3d_ListIteratorOfListOfShortReal::~Graphic3d_ListIteratorOfListOfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListIteratorOfListOfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ListIteratorOfSetListOfSetOfGroup;
class Graphic3d_ListIteratorOfSetListOfSetOfGroup {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		 Graphic3d_ListIteratorOfSetListOfSetOfGroup ();
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		 Graphic3d_ListIteratorOfSetListOfSetOfGroup (const Graphic3d_SetListOfSetOfGroup & L);
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_SetListOfSetOfGroup & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group & Value ();
};


%feature("shadow") Graphic3d_ListIteratorOfSetListOfSetOfGroup::~Graphic3d_ListIteratorOfSetListOfSetOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListIteratorOfSetListOfSetOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ListNodeOfListOfPArray;
class Graphic3d_ListNodeOfListOfPArray : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_ListNodeOfListOfPArray;
		 Graphic3d_ListNodeOfListOfPArray (const Handle_Graphic3d_ArrayOfPrimitives & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") Value;
		Handle_Graphic3d_ArrayOfPrimitives & Value ();
};


%feature("shadow") Graphic3d_ListNodeOfListOfPArray::~Graphic3d_ListNodeOfListOfPArray %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListNodeOfListOfPArray {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ListNodeOfListOfPArray {
	Handle_Graphic3d_ListNodeOfListOfPArray GetHandle() {
	return *(Handle_Graphic3d_ListNodeOfListOfPArray*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ListNodeOfListOfPArray::~Handle_Graphic3d_ListNodeOfListOfPArray %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ListNodeOfListOfPArray {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ListNodeOfListOfShortReal;
class Graphic3d_ListNodeOfListOfShortReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_ListNodeOfListOfShortReal;
		 Graphic3d_ListNodeOfListOfShortReal (const Standard_ShortReal & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
		Standard_ShortReal & Value ();
};


%feature("shadow") Graphic3d_ListNodeOfListOfShortReal::~Graphic3d_ListNodeOfListOfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListNodeOfListOfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ListNodeOfListOfShortReal {
	Handle_Graphic3d_ListNodeOfListOfShortReal GetHandle() {
	return *(Handle_Graphic3d_ListNodeOfListOfShortReal*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ListNodeOfListOfShortReal::~Handle_Graphic3d_ListNodeOfListOfShortReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ListNodeOfListOfShortReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ListNodeOfSetListOfSetOfGroup;
class Graphic3d_ListNodeOfSetListOfSetOfGroup : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_ListNodeOfSetListOfSetOfGroup;
		 Graphic3d_ListNodeOfSetListOfSetOfGroup (const Handle_Graphic3d_Group & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group & Value ();
};


%feature("shadow") Graphic3d_ListNodeOfSetListOfSetOfGroup::~Graphic3d_ListNodeOfSetListOfSetOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListNodeOfSetListOfSetOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ListNodeOfSetListOfSetOfGroup {
	Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup GetHandle() {
	return *(Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup::~Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ListOfPArray;
class Graphic3d_ListOfPArray {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListOfPArray;
		 Graphic3d_ListOfPArray ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") Assign;
		void Assign (const Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") operator=;
		void operator = (const Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_ArrayOfPrimitives & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_ArrayOfPrimitives & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:rtype: None
") Append;
		void Append (Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") First;
		Handle_Graphic3d_ArrayOfPrimitives & First ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") Last;
		Handle_Graphic3d_ArrayOfPrimitives & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") Remove;
		void Remove (Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertBefore;
		void InsertBefore (Graphic3d_ListOfPArray & Other,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_ArrayOfPrimitives &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfPArray &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfPArray &
	:rtype: None
") InsertAfter;
		void InsertAfter (Graphic3d_ListOfPArray & Other,Graphic3d_ListIteratorOfListOfPArray & It);
};


%feature("shadow") Graphic3d_ListOfPArray::~Graphic3d_ListOfPArray %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListOfPArray {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ListOfShortReal;
class Graphic3d_ListOfShortReal {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListOfShortReal;
		 Graphic3d_ListOfShortReal ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Assign;
		void Assign (const Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") operator=;
		void operator = (const Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Append;
		void Append (Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "	:rtype: Standard_ShortReal
") First;
		Standard_ShortReal & First ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Last;
		Standard_ShortReal & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Remove;
		void Remove (Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (Graphic3d_ListOfShortReal & Other,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (Graphic3d_ListOfShortReal & Other,Graphic3d_ListIteratorOfListOfShortReal & It);
};


%feature("shadow") Graphic3d_ListOfShortReal::~Graphic3d_ListOfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ListOfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_MapIteratorOfMapOfStructure;
class Graphic3d_MapIteratorOfMapOfStructure : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_MapIteratorOfMapOfStructure;
		 Graphic3d_MapIteratorOfMapOfStructure ();
		%feature("autodoc", "	:param aMap:
	:type aMap: Graphic3d_MapOfStructure &
	:rtype: None
") Graphic3d_MapIteratorOfMapOfStructure;
		 Graphic3d_MapIteratorOfMapOfStructure (const Graphic3d_MapOfStructure & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: Graphic3d_MapOfStructure &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_MapOfStructure & aMap);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Key;
		const Handle_Graphic3d_Structure & Key ();
};


%feature("shadow") Graphic3d_MapIteratorOfMapOfStructure::~Graphic3d_MapIteratorOfMapOfStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_MapIteratorOfMapOfStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_MapOfStructure;
class Graphic3d_MapOfStructure : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") Graphic3d_MapOfStructure;
		 Graphic3d_MapOfStructure (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_MapOfStructure &
	:rtype: Graphic3d_MapOfStructure
") Assign;
		Graphic3d_MapOfStructure & Assign (const Graphic3d_MapOfStructure & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_MapOfStructure &
	:rtype: Graphic3d_MapOfStructure
") operator=;
		Graphic3d_MapOfStructure & operator = (const Graphic3d_MapOfStructure & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Graphic3d_Structure &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Structure & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Graphic3d_Structure &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Structure & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Graphic3d_Structure &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Structure & aKey);
};


%feature("shadow") Graphic3d_MapOfStructure::~Graphic3d_MapOfStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_MapOfStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_MarkerImage;
class Graphic3d_MarkerImage : public Standard_Transient {
	public:
		%feature("autodoc", "	* @param theImage - source image

	:param theImage:
	:type theImage: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_Image_PixMap & theImage);
		%feature("autodoc", "	* Creates marker image from array of bytes (method for compatibility with old markers definition). @param theBitMap - source bitmap stored as array of bytes @param theWidth - number of bits in a row @param theHeight - number of bits in a column

	:param theBitMap:
	:type theBitMap: Handle_TColStd_HArray1OfByte &
	:param theWidth:
	:type theWidth: Standard_Integer &
	:param theHeight:
	:type theHeight: Standard_Integer &
	:rtype: None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_TColStd_HArray1OfByte & theBitMap,const Standard_Integer & theWidth,const Standard_Integer & theHeight);
		%feature("autodoc", "	* @param theAlphaValue pixels in the image that have alpha value greater than  or equal to this parameter will be stored in bitmap as '1',  others will be stored as '0' returns marker image as array of bytes. If an instance of the class has been initialized with image, it will be converted to bitmap based on the parameter theAlphaValue.

	:param theAlphaValue: default value is 0.5
	:type theAlphaValue: float &
	:rtype: Handle_TColStd_HArray1OfByte
") GetBitMapArray;
		Handle_TColStd_HArray1OfByte GetBitMapArray (const Standard_Real & theAlphaValue = 0.5);
		%feature("autodoc", "	* returns marker image. If an instance of the class has been initialized with a bitmap, it will be converted to image.

	:rtype: Handle_Image_PixMap
") GetImage;
		const Handle_Image_PixMap & GetImage ();
		%feature("autodoc", "	* returns image alpha as grayscale image. Note that if an instance of the class has been initialized with a bitmap or with grayscale image this method will return exactly the same image as GetImage()

	:rtype: Handle_Image_PixMap
") GetImageAlpha;
		const Handle_Image_PixMap & GetImageAlpha ();
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageId;
		const TCollection_AsciiString & GetImageId ();
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId ();
		%feature("autodoc", "	* returns texture size

	:param theWidth:
	:type theWidth: Standard_Integer &
	:param theHeight:
	:type theHeight: Standard_Integer &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") Graphic3d_MarkerImage::~Graphic3d_MarkerImage %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_MarkerImage {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_MaterialAspect;
class Graphic3d_MaterialAspect {
	public:
		%feature("autodoc", "	* Creates a material from default values.

	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect ();
		%feature("autodoc", "	* Creates a generic material calls <AName>

	:param AName:
	:type AName: Graphic3d_NameOfMaterial
	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect (const Graphic3d_NameOfMaterial AName);
		%feature("autodoc", "	* Increases or decreases the luminosity of <self>. //!	 <ADelta> is a signed percentage.

	:param ADelta:
	:type ADelta: float
	:rtype: None
") IncreaseShine;
		void IncreaseShine (const Standard_Real ADelta);
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is //!	 a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetAmbient;
		void SetAmbient (const Standard_Real AValue);
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetDiffuse;
		void SetDiffuse (const Standard_Real AValue);
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetEmissive;
		void SetEmissive (const Standard_Real AValue);
		%feature("autodoc", "	* Modifies the luminosity of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetShininess;
		void SetShininess (const Standard_Real AValue);
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetSpecular;
		void SetSpecular (const Standard_Real AValue);
		%feature("autodoc", "	* Modifies the transparency coefficient of the surface. <AValue> = 0. opaque. (default) <AValue> = 1. transparent. Transparency is applicable to materials that have at least one of reflection modes (ambient, diffuse, specular or emissive) enabled. See also SetReflectionModeOn() and SetReflectionModeOff() methods. NOTE: In order for transparency specified through this method to take effect, it is necessary to enable transparency in the viewer. This can be done either directly - see Visual3d_ViewManager::SetTransparency(Standard_Boolean), or indirectly - by calling AIS_InteractiveObject::SetTransparency() before an object is added to an interactive context, or by calling AIS_InteractiveContext::SetTransparency() for a given interactive object already displayed. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a //!	 negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real AValue);
		%feature("autodoc", "	* Modifies the ambient colour of the surface. Category: Methods to modify the class definition

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the ambient colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetAmbientColor;
		void SetAmbientColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the difuse colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetDiffuseColor;
		void SetDiffuseColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the specular colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetSpecularColor;
		void SetSpecularColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the emissive colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetEmissiveColor;
		void SetEmissiveColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Activates the reflective properties of the surface <AType>. //!	 TypeOfReflection : TOR_AMBIENT //!			 TOR_DIFFUSE //!			 TOR_SPECULAR  TOR_EMISSION 1, 2, 3 or 4 types of reflection can be set for a given surface.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOn;
		void SetReflectionModeOn (const Graphic3d_TypeOfReflection AType);
		%feature("autodoc", "	* Deactivates the reflective properties of //!	 the surface <AType>. //!	 TypeOfReflection : TOR_AMBIENT //!			 TOR_DIFFUSE //!			 TOR_SPECULAR  TOR_EMISSION 1, 2, 3 or 4 types of reflection can be set off for a given surface. Disabling diffuse and specular reflectance is useful for efficient visualization of large amounts of data as definition of normals for graphic primitives is not needed when only 'all-directional' reflectance is active. NOTE: Disabling all four reflection modes also turns off the following effects: 1. Lighting. Colors of primitives are not affected by the material properties when lighting is off. 2. Transparency.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOff;
		void SetReflectionModeOff (const Graphic3d_TypeOfReflection AType);
		%feature("autodoc", "	* Set MyMaterialType to the value of parameter <AType> //!	 TypeOfMaterial : MATERIAL_ASPECT //!			 MATERIAL_PHYSIC

	:param AType:
	:type AType: Graphic3d_TypeOfMaterial
	:rtype: None
") SetMaterialType;
		void SetMaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("autodoc", "	* The current matarial become a 'UserDefined' material. //!	 Set the name of the 'UserDefined' material.

	:param AName:
	:type AName: char *
	:rtype: None
") SetMaterialName;
		void SetMaterialName (const char * AName);
		%feature("autodoc", "	:param AValue:
	:type AValue: Standard_ShortReal
	:rtype: None
") SetEnvReflexion;
		void SetEnvReflexion (const Standard_ShortReal AValue);
		%feature("autodoc", "	* Resets the material with the original values according to the material name but leave the current color values untouched for the material of type ASPECT.

	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	* Returns the ambient colour of the surface.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("autodoc", "	* Returns the ambient colour of the surface.

	:rtype: Quantity_Color
") AmbientColor;
		Quantity_Color AmbientColor ();
		%feature("autodoc", "	* Returns the diffuse colour of the surface.

	:rtype: Quantity_Color
") DiffuseColor;
		Quantity_Color DiffuseColor ();
		%feature("autodoc", "	* Returns the specular colour of the surface.

	:rtype: Quantity_Color
") SpecularColor;
		Quantity_Color SpecularColor ();
		%feature("autodoc", "	* Returns the emissive colour of the surface.

	:rtype: Quantity_Color
") EmissiveColor;
		Quantity_Color EmissiveColor ();
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Ambient;
		Standard_Real Ambient ();
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Diffuse;
		Standard_Real Diffuse ();
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Specular;
		Standard_Real Specular ();
		%feature("autodoc", "	* Returns the transparency coefficient of the surface.

	:rtype: float
") Transparency;
		Standard_Real Transparency ();
		%feature("autodoc", "	* Returns the emissive coefficient of the surface.

	:rtype: float
") Emissive;
		Standard_Real Emissive ();
		%feature("autodoc", "	* Returns the luminosity of the surface.

	:rtype: float
") Shininess;
		Standard_Real Shininess ();
		%feature("autodoc", "	* Returns Standard_True if the reflection mode is active, //!	 Standard_False otherwise.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: bool
") ReflectionMode;
		Standard_Boolean ReflectionMode (const Graphic3d_TypeOfReflection AType);
		%feature("autodoc", "	* Returns Standard_True if MyMaterialType equal the parameter AType, //!	 Standard_False otherwise.

	:param AType:
	:type AType: Graphic3d_TypeOfMaterial
	:rtype: bool
") MaterialType;
		Standard_Boolean MaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("autodoc", "	:rtype: Standard_ShortReal
") EnvReflexion;
		Standard_ShortReal EnvReflexion ();
		%feature("autodoc", "	* Returns the material name.

	:rtype: Graphic3d_NameOfMaterial
") Name;
		Graphic3d_NameOfMaterial Name ();
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
        		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("autodoc", "	* Returns the name of the predefined material of rank <aRank> Trigger: when <aRank> is < 1 or > NumberOfMaterials.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: char *
") MaterialName;
		static char * MaterialName (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the name of this material

	:rtype: char *
") MaterialName;
		char * MaterialName ();
		%feature("autodoc", "	* Returns the type of the predefined material of rank <aRank> Trigger: when <aRank> is < 1 or > NumberOfMaterials.

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: Graphic3d_TypeOfMaterial
") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType (const Standard_Integer aRank);
		%feature("autodoc", "	* Returns the material for specified name or Graphic3d_NOM_DEFAULT if name is unknown.

	:param theName:
	:type theName: char *
	:rtype: Graphic3d_NameOfMaterial
") MaterialFromName;
		static Graphic3d_NameOfMaterial MaterialFromName (const char * theName);
};


%feature("shadow") Graphic3d_MaterialAspect::~Graphic3d_MaterialAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_MaterialAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_Plotter;
class Graphic3d_Plotter : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Deletes the plotter <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "	* Warning: Returns Standard_True if plotting is enabled in the view. //!	 Raises PlotterDefinitionError from Graphic3d //!	 if plotting has already started.

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: bool
") BeginPlot;
		virtual Standard_Boolean BeginPlot (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("autodoc", "	* Stops the plotting. Warning: Raises PlotterDefinitionError from Graphic3d //!	 if plotting has not started yet.

	:rtype: void
") EndPlot;
		virtual void EndPlot ();
		%feature("autodoc", "	:rtype: bool
") PlottingState;
		virtual Standard_Boolean PlottingState ();
};


%feature("shadow") Graphic3d_Plotter::~Graphic3d_Plotter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Plotter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Plotter {
	Handle_Graphic3d_Plotter GetHandle() {
	return *(Handle_Graphic3d_Plotter*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Plotter::~Handle_Graphic3d_Plotter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Plotter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_SequenceNodeOfSequenceOfAddress;
class Graphic3d_SequenceNodeOfSequenceOfAddress : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Standard_Address &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Graphic3d_SequenceNodeOfSequenceOfAddress;
		 Graphic3d_SequenceNodeOfSequenceOfAddress (const Standard_Address & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address & Value ();
};


%feature("shadow") Graphic3d_SequenceNodeOfSequenceOfAddress::~Graphic3d_SequenceNodeOfSequenceOfAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SequenceNodeOfSequenceOfAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_SequenceNodeOfSequenceOfAddress {
	Handle_Graphic3d_SequenceNodeOfSequenceOfAddress GetHandle() {
	return *(Handle_Graphic3d_SequenceNodeOfSequenceOfAddress*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_SequenceNodeOfSequenceOfAddress::~Handle_Graphic3d_SequenceNodeOfSequenceOfAddress %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_SequenceNodeOfSequenceOfAddress {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_SequenceNodeOfSequenceOfGroup;
class Graphic3d_SequenceNodeOfSequenceOfGroup : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Graphic3d_SequenceNodeOfSequenceOfGroup;
		 Graphic3d_SequenceNodeOfSequenceOfGroup (const Handle_Graphic3d_Group & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		Handle_Graphic3d_Group & Value ();
};


%feature("shadow") Graphic3d_SequenceNodeOfSequenceOfGroup::~Graphic3d_SequenceNodeOfSequenceOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SequenceNodeOfSequenceOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_SequenceNodeOfSequenceOfGroup {
	Handle_Graphic3d_SequenceNodeOfSequenceOfGroup GetHandle() {
	return *(Handle_Graphic3d_SequenceNodeOfSequenceOfGroup*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_SequenceNodeOfSequenceOfGroup::~Handle_Graphic3d_SequenceNodeOfSequenceOfGroup %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_SequenceNodeOfSequenceOfGroup {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_SequenceNodeOfSequenceOfStructure;
class Graphic3d_SequenceNodeOfSequenceOfStructure : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Structure &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Graphic3d_SequenceNodeOfSequenceOfStructure;
		 Graphic3d_SequenceNodeOfSequenceOfStructure (const Handle_Graphic3d_Structure & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Value;
		Handle_Graphic3d_Structure & Value ();
};


%feature("shadow") Graphic3d_SequenceNodeOfSequenceOfStructure::~Graphic3d_SequenceNodeOfSequenceOfStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SequenceNodeOfSequenceOfStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_SequenceNodeOfSequenceOfStructure {
	Handle_Graphic3d_SequenceNodeOfSequenceOfStructure GetHandle() {
	return *(Handle_Graphic3d_SequenceNodeOfSequenceOfStructure*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_SequenceNodeOfSequenceOfStructure::~Handle_Graphic3d_SequenceNodeOfSequenceOfStructure %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_SequenceNodeOfSequenceOfStructure {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_SequenceOfAddress;
class Graphic3d_SequenceOfAddress : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_SequenceOfAddress;
		 Graphic3d_SequenceOfAddress ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfAddress &
	:rtype: Graphic3d_SequenceOfAddress
") Assign;
		const Graphic3d_SequenceOfAddress & Assign (const Graphic3d_SequenceOfAddress & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfAddress &
	:rtype: Graphic3d_SequenceOfAddress
") operator=;
		const Graphic3d_SequenceOfAddress & operator = (const Graphic3d_SequenceOfAddress & Other);
		%feature("autodoc", "	:param T:
	:type T: Standard_Address &
	:rtype: None
") Append;
		void Append (const Standard_Address & T);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") Append;
		void Append (Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "	:param T:
	:type T: Standard_Address &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Address & T);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Standard_Address &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Address & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Standard_Address &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Address & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Graphic3d_SequenceOfAddress &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "	:rtype: Standard_Address
") First;
		const Standard_Address & First ();
		%feature("autodoc", "	:rtype: Standard_Address
") Last;
		const Standard_Address & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Graphic3d_SequenceOfAddress &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfAddress & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_Address
") Value;
		const Standard_Address & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Standard_Address &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Address & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_Address
") ChangeValue;
		Standard_Address & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Graphic3d_SequenceOfAddress::~Graphic3d_SequenceOfAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SequenceOfAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_SequenceOfGroup;
class Graphic3d_SequenceOfGroup : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_SequenceOfGroup;
		 Graphic3d_SequenceOfGroup ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfGroup &
	:rtype: Graphic3d_SequenceOfGroup
") Assign;
		const Graphic3d_SequenceOfGroup & Assign (const Graphic3d_SequenceOfGroup & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfGroup &
	:rtype: Graphic3d_SequenceOfGroup
") operator=;
		const Graphic3d_SequenceOfGroup & operator = (const Graphic3d_SequenceOfGroup & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") Append;
		void Append (Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Graphic3d_SequenceOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") First;
		const Handle_Graphic3d_Group & First ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Last;
		const Handle_Graphic3d_Group & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Graphic3d_SequenceOfGroup &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfGroup & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Graphic3d_Group
") Value;
		const Handle_Graphic3d_Group & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Graphic3d_Group &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Graphic3d_Group & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Graphic3d_Group
") ChangeValue;
		Handle_Graphic3d_Group & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Graphic3d_SequenceOfGroup::~Graphic3d_SequenceOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SequenceOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_SequenceOfStructure;
class Graphic3d_SequenceOfStructure : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_SequenceOfStructure;
		 Graphic3d_SequenceOfStructure ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfStructure &
	:rtype: Graphic3d_SequenceOfStructure
") Assign;
		const Graphic3d_SequenceOfStructure & Assign (const Graphic3d_SequenceOfStructure & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfStructure &
	:rtype: Graphic3d_SequenceOfStructure
") operator=;
		const Graphic3d_SequenceOfStructure & operator = (const Graphic3d_SequenceOfStructure & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") Append;
		void Append (Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") First;
		const Handle_Graphic3d_Structure & First ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Last;
		const Handle_Graphic3d_Structure & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Graphic3d_SequenceOfStructure &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfStructure & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Graphic3d_Structure
") Value;
		const Handle_Graphic3d_Structure & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Graphic3d_Structure &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Graphic3d_Structure & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Graphic3d_Structure
") ChangeValue;
		Handle_Graphic3d_Structure & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Graphic3d_SequenceOfStructure::~Graphic3d_SequenceOfStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SequenceOfStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_SetIteratorOfSetOfGroup;
class Graphic3d_SetIteratorOfSetOfGroup {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_SetIteratorOfSetOfGroup;
		 Graphic3d_SetIteratorOfSetOfGroup ();
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: None
") Graphic3d_SetIteratorOfSetOfGroup;
		 Graphic3d_SetIteratorOfSetOfGroup (const Graphic3d_SetOfGroup & S);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_SetOfGroup & S);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Value;
		const Handle_Graphic3d_Group & Value ();
};


%feature("shadow") Graphic3d_SetIteratorOfSetOfGroup::~Graphic3d_SetIteratorOfSetOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SetIteratorOfSetOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_SetListOfSetOfGroup;
class Graphic3d_SetListOfSetOfGroup {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_SetListOfSetOfGroup;
		 Graphic3d_SetListOfSetOfGroup ();
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Assign;
		void Assign (const Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") operator=;
		void operator = (const Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:rtype: None
") Append;
		void Append (Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") First;
		Handle_Graphic3d_Group & First ();
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Group
") Last;
		Handle_Graphic3d_Group & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") Remove;
		void Remove (Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertBefore;
		void InsertBefore (Graphic3d_SetListOfSetOfGroup & Other,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Group &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SetListOfSetOfGroup &
	:param It:
	:type It: Graphic3d_ListIteratorOfSetListOfSetOfGroup &
	:rtype: None
") InsertAfter;
		void InsertAfter (Graphic3d_SetListOfSetOfGroup & Other,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
};


%feature("shadow") Graphic3d_SetListOfSetOfGroup::~Graphic3d_SetListOfSetOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SetListOfSetOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_SetOfGroup;
class Graphic3d_SetOfGroup {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_SetOfGroup;
		 Graphic3d_SetOfGroup ();
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param B:
	:type B: Graphic3d_SetOfGroup &
	:rtype: None
") Union;
		void Union (const Graphic3d_SetOfGroup & B);
		%feature("autodoc", "	:param B:
	:type B: Graphic3d_SetOfGroup &
	:rtype: None
") Intersection;
		void Intersection (const Graphic3d_SetOfGroup & B);
		%feature("autodoc", "	:param B:
	:type B: Graphic3d_SetOfGroup &
	:rtype: None
") Difference;
		void Difference (const Graphic3d_SetOfGroup & B);
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Group &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Graphic3d_SetOfGroup & S);
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SetOfGroup &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Graphic3d_SetOfGroup & S);
};


%feature("shadow") Graphic3d_SetOfGroup::~Graphic3d_SetOfGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_SetOfGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ShaderObject;
class Graphic3d_ShaderObject : public Standard_Transient {
	public:
		%feature("autodoc", "	* Checks if the shader object is valid or not.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the full path to the shader source.

	:rtype: OSD_Path
") Path;
		const OSD_Path & Path ();
		%feature("autodoc", "	* Returns the source code of the shader object.

	:rtype: TCollection_AsciiString
") Source;
		const TCollection_AsciiString & Source ();
		%feature("autodoc", "	* Returns type of the shader object.

	:rtype: Graphic3d_TypeOfShaderObject
") Type;
		Graphic3d_TypeOfShaderObject Type ();
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("autodoc", "	* Creates new shader object from specified file.

	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param thePath:
	:type thePath: TCollection_AsciiString &
	:rtype: Handle_Graphic3d_ShaderObject
") CreateFromFile;
		static Handle_Graphic3d_ShaderObject CreateFromFile (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & thePath);
		%feature("autodoc", "	* Creates new shader object from specified source.

	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param theSource:
	:type theSource: TCollection_AsciiString &
	:rtype: Handle_Graphic3d_ShaderObject
") CreateFromSource;
		static Handle_Graphic3d_ShaderObject CreateFromSource (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & theSource);
};


%feature("shadow") Graphic3d_ShaderObject::~Graphic3d_ShaderObject %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ShaderObject {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ShaderProgram;
class Graphic3d_ShaderProgram : public Standard_Transient {
	public:
		%feature("autodoc", "	* Creates new empty program object.

	:rtype: None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram ();
		%feature("autodoc", "	* Creates program object from pre-defined shaders. Raises Standard_Failure exception if shader resources are unavailable.

	:param theName:
	:type theName: Graphic3d_ShaderProgram::ShaderName
	:rtype: None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram (const Graphic3d_ShaderProgram::ShaderName theName);
		%feature("autodoc", "	* Releases resources of program object.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Checks if the program object is valid or not.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("autodoc", "	* Attaches shader object to the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") AttachShader;
		Standard_Boolean AttachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("autodoc", "	* Detaches shader object from the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") DetachShader;
		Standard_Boolean DetachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("autodoc", "	* Returns list of attached shader objects.

	:rtype: Graphic3d_ShaderObjectList
") ShaderObjects;
		const Graphic3d_ShaderObjectList & ShaderObjects ();
		%feature("autodoc", "	* Returns list of custom uniform variables.

	:rtype: Graphic3d_ShaderVariableList
") Variables;
		const Graphic3d_ShaderVariableList & Variables ();
		%feature("autodoc", "	* Removes all custom uniform variables from the program.

	:rtype: None
") ClearVariables;
		void ClearVariables ();
		%feature("autodoc", "	* The path to GLSL programs determined from CSF_ShadersDirectory or CASROOT environment variables. returns the root folder with default GLSL programs.

	:rtype: TCollection_AsciiString
") ShadersFolder;
		static const TCollection_AsciiString & ShadersFolder ();
};


%feature("shadow") Graphic3d_ShaderProgram::~Graphic3d_ShaderProgram %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ShaderProgram {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ShaderVariable;
class Graphic3d_ShaderVariable : public Standard_Transient {
	public:
		%feature("autodoc", "	* Returns name of shader variable.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("autodoc", "	* Checks if the shader variable is valid or not.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns interface of shader variable value.

	:rtype: Graphic3d_ValueInterface *
") Value;
		Graphic3d_ValueInterface * Value ();
};


%feature("shadow") Graphic3d_ShaderVariable::~Graphic3d_ShaderVariable %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ShaderVariable {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_StdMapNodeOfMapOfStructure;
class Graphic3d_StdMapNodeOfMapOfStructure : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Handle_Graphic3d_Structure &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_StdMapNodeOfMapOfStructure;
		 Graphic3d_StdMapNodeOfMapOfStructure (const Handle_Graphic3d_Structure & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Key;
		Handle_Graphic3d_Structure & Key ();
};


%feature("shadow") Graphic3d_StdMapNodeOfMapOfStructure::~Graphic3d_StdMapNodeOfMapOfStructure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_StdMapNodeOfMapOfStructure {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_StdMapNodeOfMapOfStructure {
	Handle_Graphic3d_StdMapNodeOfMapOfStructure GetHandle() {
	return *(Handle_Graphic3d_StdMapNodeOfMapOfStructure*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_StdMapNodeOfMapOfStructure::~Handle_Graphic3d_StdMapNodeOfMapOfStructure %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_StdMapNodeOfMapOfStructure {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Structure;
class Graphic3d_Structure : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates a graphic object in the manager <AManager>. //!	 It will appear in all the views of the visualiser. Warning: The default values AspectLine, AspectFillArea, //!	 AspectText and AspectMarker are NOT applied to the //!	 structure. //!	 The structure is not displayed when it is created.

	:param AManager:
	:type AManager: Handle_Graphic3d_StructureManager &
	:rtype: None
") Graphic3d_Structure;
		 Graphic3d_Structure (const Handle_Graphic3d_StructureManager & AManager);
		%feature("autodoc", "	* if WithDestruction == Standard_True then //!		suppress all the groups of primitives in the structure. //!	 and it is mandatory to create a new group in <self>. //!	 if WithDestruction == Standard_False then //!		clears all the groups of primitives in the structure. //!	 and all the groups are conserved and empty. //!	 They will be erased at the next screen update. //!	 The structure itself is conserved. //!	 The transformation and the attributes of <self> are conserved. //!	 The childs of <self> are conserved.

	:param WithDestruction: default value is Standard_True
	:type WithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Standard_Boolean WithDestruction = Standard_True);
		%feature("autodoc", "	* Suppresses the structure <self>. //!	 It will be erased at the next screen update.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "	* Displays the structure <self> in all the views of //!	 the visualiser.

	:rtype: void
") Display;
		virtual void Display ();
		%feature("autodoc", "	* Displays the structure <self> in all the views of //!	 the visualiser, while modifying its current priority. Note: Display Priorities Structure display priorities control the order in which structures are redrawn. When you display a structure, you specify its priority. The lower the value, the lower the display priority. When the display is regenerated, the structures with the lowest priority are drawn first. For structures with the same display priority, the order in which they were displayed determines the drawing order. Open CASCADE supports 11 structure display priorities, 0 to 10. Warning: Raises PriorityDefinitionError if <Priority> is //!	 greater than 10 or a negative value.

	:param Priority:
	:type Priority: Standard_Integer
	:rtype: None
") Display;
		void Display (const Standard_Integer Priority);
		%feature("autodoc", "	* Returns the current display priority for the //!	 structure <self>.

	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority ();
		%feature("autodoc", "	* Erases the structure <self> in all the views //!	 of the visualiser.

	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("autodoc", "	* Highlights the structure <self> in all the //!	 views of the visualiser, using the following methods: TOHM_COLOR		= drawn in the highlight color //!				 (default white) //!	 TOHM_BLINK		= blinking TOHM_BOUNDBOX	= enclosed by the boundary box //!				 (default white)

	:param Method:
	:type Method: Aspect_TypeOfHighlightMethod
	:rtype: None
") Highlight;
		void Highlight (const Aspect_TypeOfHighlightMethod Method);
		%feature("autodoc", "	* Suppress the structure <self>. //!	 It will be erased at the next screen update. Warning: No more graphic operations in <self> after this call. Category: Methods to modify the class definition

	:rtype: None
") Remove;
		void Remove ();
		%feature("autodoc", "	* Modifies the highlight color for the Highlight method //!	 with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetHighlightColor;
		void SetHighlightColor (const Quantity_Color & AColor);
		%feature("autodoc", "	* Modifies the coordinates of the boundary box //!	 of the structure <self>. //!	 if <AFlag> is Standard_True then <self> is infinite and //!	 the MinMaxValues method or the MinMaxCoord method return : //!	 XMin = YMin = ZMin = RealFirst (). //!	 XMax = YMax = ZMax = RealLast (). //!	 By default, <self> is not infinite but empty.

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean AFlag);
		%feature("autodoc", "	* Modifies the order of displaying the structure. //!	 Values are between 0 and 10. Structures are drawn according to their display priorities in ascending order. //!	 A structure of priority 10 is displayed the last and appears over the others. //!	 The default value is 5. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority //!	 method erase <self> and display <self> with the //!	 new priority. //!	 Raises PriorityDefinitionError if <Priority> is //!	 greater than 10 or a negative value.

	:param Priority:
	:type Priority: Standard_Integer
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Standard_Integer Priority);
		%feature("autodoc", "	* Reset the current priority of the structure to the //!	 previous priority. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority //!	 method erase <self> and display <self> with the //!	 previous priority.

	:rtype: None
") ResetDisplayPriority;
		void ResetDisplayPriority ();
		%feature("autodoc", "	* Set Z layer ID for the structure. The Z layer mechanism allows to display structures presented in higher layers in overlay of structures in lower layers by switching off z buffer depth test between layers

	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: None
") SetZLayer;
		void SetZLayer (const Standard_Integer theLayerId);
		%feature("autodoc", "	* Get Z layer ID of displayed structure. The method returns -1 if the structure has no ID (deleted from graphic driver).

	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer ();
		%feature("autodoc", "	* Changes a sequence of clip planes slicing the structure on rendering. @param thePlanes [in] the set of clip planes.

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("autodoc", "	* Get clip planes slicing the structure on rendering. returns set of clip planes.

	:rtype: Graphic3d_SequenceOfHClipPlane
") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
		%feature("autodoc", "	* Modifies the detectability indicator to Standard_True //!	 or Standard_False for the structure <self>. //!	 The default value at the definition of <self> is //!	 Standard_True.

	:param AValue:
	:type AValue: bool
	:rtype: None
") SetPick;
		void SetPick (const Standard_Boolean AValue);
		%feature("autodoc", "	* Modifies the default attributes for lines //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("autodoc", "	* Modifies the default attributes for faces //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("autodoc", "	* Modifies the default attributes for text //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("autodoc", "	* Modifies the default attributes for markers //!	 in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("autodoc", "	* Modifies the visibility indicator to Standard_True or //!	 Standard_False for the structure <self>. //!	 The default value at the definition of <self> is //!	 Standard_True.

	:param AValue:
	:type AValue: bool
	:rtype: None
") SetVisible;
		void SetVisible (const Standard_Boolean AValue);
		%feature("autodoc", "	* Moves the graphic object <self> in the manager <AManager>. //!	 If <WithPropagation> is Standard_True then all the connected //!	 graphic objects to <self> are moved.

	:param AManager:
	:type AManager: Handle_Graphic3d_StructureManager &
	:param WithPropagation: default value is Standard_False
	:type WithPropagation: bool
	:rtype: None
") SetManager;
		void SetManager (const Handle_Graphic3d_StructureManager & AManager,const Standard_Boolean WithPropagation = Standard_False);
		%feature("autodoc", "	* Modifies the visualisation mode for the structure <self>.

	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: void
") SetVisual;
		virtual void SetVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("autodoc", "	* Modifies the minimum and maximum zoom coefficients //!	 for the structure <self>. //!	 The default value at the definition of <self> is unlimited. Category: Methods to modify the class definition Warning: Raises StructureDefinitionError if <LimitInf> is //!	 greater than <LimitSup> or if <LimitInf> or //!	 <LimitSup> is a negative value.

	:param LimitInf:
	:type LimitInf: float
	:param LimitSup:
	:type LimitSup: float
	:rtype: None
") SetZoomLimit;
		void SetZoomLimit (const Standard_Real LimitInf,const Standard_Real LimitSup);
		%feature("autodoc", "	* Suppresses the highlight for the structure <self> //!	 in all the views of the visualiser.

	:rtype: None
") UnHighlight;
		void UnHighlight ();
		%feature("autodoc", "	:rtype: void
") Compute;
		virtual void Compute ();
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & aStructure);
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
		%feature("autodoc", "	* Forces a new construction of the structure <self> //!	 if <self> is displayed and TOS_COMPUTED.

	:rtype: None
") ReCompute;
		void ReCompute ();
		%feature("autodoc", "	* Forces a new construction of the structure <self> //!	 if <self> is displayed in <aProjetor> and TOS_COMPUTED.

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("autodoc", "	* Returns Standard_True if the structure <self> contains //!	 Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("autodoc", "	* Returns the groups sequence included in the structure <self> (internal storage).

	:rtype: Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();
		%feature("autodoc", "	* Returns the current number of groups in the //!	 structure <self>.

	:rtype: int
") NumberOfGroups;
		Standard_Integer NumberOfGroups ();
		%feature("autodoc", "	* Returns the highlight color for the Highlight method //!	 with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.

	:rtype: Quantity_Color
") HighlightColor;
		Quantity_Color HighlightColor ();
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is deleted. //!	 <self> is deleted after the call Remove (me).

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("autodoc", "	* Returns the display indicator for the structure <self>.

	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is empty. Warning: A structure is empty if : //!		it do not have group or all the groups are empties //!		and it do not have descendant or all the descendants //!		are empties.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is infinite.

	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("autodoc", "	* Returns the highlight indicator for the structure <self>.

	:rtype: bool
") IsHighlighted;
		virtual Standard_Boolean IsHighlighted ();
		%feature("autodoc", "	* Returns the detectability indicator for the structure <self>.

	:rtype: bool
") IsSelectable;
		Standard_Boolean IsSelectable ();
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is rotated. //!	 <=> The transformation != Identity, != Scale, != Translation.

	:rtype: bool
") IsRotated;
		Standard_Boolean IsRotated ();
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is transformed. //!	 <=> The transformation != Identity.

	:rtype: bool
") IsTransformed;
		Standard_Boolean IsTransformed ();
		%feature("autodoc", "	* Returns the visibility indicator for the structure <self>.

	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible ();
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectLine3d
") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("autodoc", "	* Returns the current group of graphic attributes used for 3d marker primitives.

	:rtype: Handle_Graphic3d_AspectMarker3d
") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
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
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectText3d
") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("autodoc", "	* Returns the visualisation mode for the structure <self>.

	:rtype: Graphic3d_TypeOfStructure
") Visual;
		Graphic3d_TypeOfStructure Visual ();
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
		%feature("autodoc", "	* Returns the group of structures to which <self> is connected.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") Ancestors;
		void Ancestors (Graphic3d_MapOfStructure & SG);
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
		%feature("autodoc", "	* Returns the group of structures connected to <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") Descendants;
		void Descendants (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "	* Suppress the connection between <AStructure> and <self>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Disconnect;
		void Disconnect (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "	* If Atype is TOC_DESCENDANT then suppress all //!	 the connections with the child structures of <self>. //!	 If Atype is TOC_ANCESTOR then suppress all //!	 the connections with the parent structures of <self>.

	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None
") DisconnectAll;
		void DisconnectAll (const Graphic3d_TypeOfConnection AType);
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
		%feature("autodoc", "	:param Owner:
	:type Owner: Standard_Address
	:rtype: None
") SetOwner;
		void SetOwner (const Standard_Address Owner);
		%feature("autodoc", "	:rtype: Standard_Address
") Owner;
		Standard_Address Owner ();
		%feature("autodoc", "	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetHLRValidation;
		void SetHLRValidation (const Standard_Boolean AFlag);
		%feature("autodoc", "	:rtype: bool
") HLRValidation;
		Standard_Boolean HLRValidation ();
		%feature("autodoc", "	* Returns the type of composition applied to matrices //!	 of transformation of <self>.

	:rtype: Graphic3d_TypeOfComposition
") Composition;
		Graphic3d_TypeOfComposition Composition ();
		%feature("autodoc", "	* Modifies the current local modelling transformation //!	 in the structure <self>. //!	 It is defined as a 4*4 real matrix. //!	 ------------------- //!	 | a11 a12 a13 t1 | //!	 | a21 a22 a23 t2 | //!	 | a31 a32 a33 t3 | //!	 | 0 0 0 1 | //!	 ------------------- //!	 TypeOfComposition : TOC_REPLACE //!				TOC_POSTCONCATENATE Then the modified Local Modelling Transformation is composed with the current Global Modelling Transformation to create a new Composite Modelling Transformation. The compose type specifies the role of the current local modelling transformation (L) in composing the new value for the current local modelling transformation (L'), which is then combined with the current global modelling transforma- tion (G) to calculate the new composite modelling transfor- mation (C). TOC_REPLACE The transformation matrix (T) replaces the value of current local modelling transformation (L). //!	L' <- T //!	C <- G x L' TOC_POSTCONCATENATE The current local modelling transformation (L) is multiplied by the transformation matrix (T): //!	L' <- T x L //!	C <- G x L' Category: Methods to manage the structure transformation Warning: Raises TransformError if the matrix is not a 4x4 matrix.

	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:param AType:
	:type AType: Graphic3d_TypeOfComposition
	:rtype: None
") SetTransform;
		void SetTransform (const TColStd_Array2OfReal & AMatrix,const Graphic3d_TypeOfComposition AType);
		%feature("autodoc", "	* Returns the transformation associated with //!	 the structure <self>.

	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") Transform;
		void Transform (TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "	* Modifies the current modelling transform persistence (pan, zoom or rotate)

	:param AFlag:
	:type AFlag: Graphic3d_TransModeFlags &
	:param APoint:
	:type APoint: gp_Pnt
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag,const gp_Pnt & APoint);
		%feature("autodoc", "	:param AFlag:
	:type AFlag: Graphic3d_TransModeFlags &
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag);
		%feature("autodoc", "	* Get the current modelling transform persistence (pan, zoom or rotate)

	:rtype: Graphic3d_TransModeFlags
") TransformPersistenceMode;
		Graphic3d_TransModeFlags TransformPersistenceMode ();
		%feature("autodoc", "	* Get the current point of relative modelling transform persistence

	:rtype: gp_Pnt
") TransformPersistencePoint;
		gp_Pnt TransformPersistencePoint ();
		%feature("autodoc", "	:rtype: Graphic3d_TypeOfStructure
") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual ();
		%feature("autodoc", "	* Clears the structure <self>.

	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: None
") GraphicClear;
		void GraphicClear (const Standard_Boolean WithDestruction);
		%feature("autodoc", "	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") GraphicConnect;
		void GraphicConnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") GraphicDisconnect;
		void GraphicDisconnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "	* Highlights the structure <self>.

	:param Method:
	:type Method: Aspect_TypeOfHighlightMethod
	:rtype: None
") GraphicHighlight;
		void GraphicHighlight (const Aspect_TypeOfHighlightMethod Method);
		%feature("autodoc", "	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") GraphicTransform;
		void GraphicTransform (const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "	* Suppress the highlight for the structure <self>.

	:rtype: None
") GraphicUnHighlight;
		void GraphicUnHighlight ();
		%feature("autodoc", "	* Returns the identification number of the structure <self>.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
		%feature("autodoc", "	:param aPlotter:
	:type aPlotter: Handle_Graphic3d_Plotter &
	:rtype: void
") Plot;
		virtual void Plot (const Handle_Graphic3d_Plotter & aPlotter);
		%feature("autodoc", "	* Prints informations about the network associated //!	 with the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: void
") PrintNetwork;
		static void PrintNetwork (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType);
		%feature("autodoc", "	* Suppress the adress <APtr> in the list //!	 of descendants or in the list of ancestors.

	:param APtr:
	:type APtr: Standard_Address
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None
") Remove;
		void Remove (const Standard_Address APtr,const Graphic3d_TypeOfConnection AType);
		%feature("autodoc", "	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: None
") SetComputeVisual;
		void SetComputeVisual (const Graphic3d_TypeOfStructure AVisual);
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
		%feature("autodoc", "	* Transforms <Coord> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param Coord:
	:type Coord: Graphic3d_Vector &
	:rtype: Graphic3d_Vector
") Transforms;
		static Graphic3d_Vector Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vector & Coord);
		%feature("autodoc", "	* Transforms <Coord> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param Coord:
	:type Coord: Graphic3d_Vertex &
	:rtype: Graphic3d_Vertex
") Transforms;
		static Graphic3d_Vertex Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vertex & Coord);
		%feature("autodoc", "	* Returns the c structure associated to <self>.

	:rtype: Graphic3d_CStructure *
") CStructure;
		Graphic3d_CStructure * CStructure ();
};


%feature("shadow") Graphic3d_Structure::~Graphic3d_Structure %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Structure {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Structure {
	Handle_Graphic3d_Structure GetHandle() {
	return *(Handle_Graphic3d_Structure*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Structure::~Handle_Graphic3d_Structure %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Structure {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_StructureManager;
class Graphic3d_StructureManager : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Deletes the manager <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "	* Modifies the default attributes for lines //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("autodoc", "	* Modifies the default attributes for faces //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("autodoc", "	* Modifies the default attributes for text //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("autodoc", "	* Modifies the default attributes for markers //!	 in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("autodoc", "	* Modifies the screen update mode. //!	 TOU_ASAP	as soon as possible //!	 TOU_WAIT	on demand (with the Update function) Note : Dynamic Operations and Update Mode Use SetUpdateMode to control when changes to the display are made. Use one of the following functions to update one or more views: - Update all views of the viewer: Visual3d_ViewManager::Update () - Update one view of the viewer: Visual3d_View::Update () Use one of the following functions to update the entire display: - Redraw all structures in all views: Visual3d_ViewManager::Redraw () - Redraw all structures in one view: Visual3d_View::Redraw () Update)

	:param AType:
	:type AType: Aspect_TypeOfUpdate
	:rtype: None
") SetUpdateMode;
		void SetUpdateMode (const Aspect_TypeOfUpdate AType);
		%feature("autodoc", "	* Updates screen in function of modifications of //!	 the structures. Warning: Not necessary if the update mode is TOU_ASAP.

	:rtype: void
") Update;
		virtual void Update ();
		%feature("autodoc", "	* Returns the set of structures displayed in //!	 visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "	* Returns the set of highlighted structures //!	 in a visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") HighlightedStructures;
		void HighlightedStructures (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "	* Returns the set of detectable structures //!	 in a visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") PickStructures;
		void PickStructures (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("autodoc", "	* Returns maximum number of managers defineable.

	:rtype: int
") Limit;
		static Standard_Integer Limit ();
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectLine3d
") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectMarker3d
") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
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
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectText3d
") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("autodoc", "	* Returns the screen update mode. //!	 TOU_ASAP	as soon as possible //!	 TOU_WAIT	on demand (Update)

	:rtype: Aspect_TypeOfUpdate
") UpdateMode;
		Aspect_TypeOfUpdate UpdateMode ();
		%feature("autodoc", "	* Changes the display priority of the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param OldPriority:
	:type OldPriority: Standard_Integer
	:param NewPriority:
	:type NewPriority: Standard_Integer
	:rtype: void
") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority (const Handle_Graphic3d_Structure & AStructure,const Standard_Integer OldPriority,const Standard_Integer NewPriority);
		%feature("autodoc", "	* Change Z layer for structure. The z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Standard_Integer theLayerId);
		%feature("autodoc", "	* Get Z layer ID assigned to structure. If the structure has no layer ID (deleted from graphic driver), the method returns -1.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: int
") GetZLayer;
		virtual Standard_Integer GetZLayer (const Handle_Graphic3d_Structure & theStructure);
		%feature("autodoc", "	* Sets the settings for a single Z layer for all managed views.

	:param theLayerId:
	:type theLayerId: Standard_Integer
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: void
") SetZLayerSettings;
		virtual void SetZLayerSettings (const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		virtual Graphic3d_ZLayerSettings ZLayerSettings (const Standard_Integer theLayerId);
		%feature("autodoc", "	* Add a new top-level Z layer and get its ID as <theLayerId> value. The method returns Standard_False if the layer can not be created. The z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theLayerId:
	:type theLayerId: Standard_Integer &
	:rtype: bool
") AddZLayer;
		virtual Standard_Boolean AddZLayer (Standard_Integer &OutValue);
		%feature("autodoc", "	* Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there is always a default bottom-level layer that can't be removed.

	:param theLayerId:
	:type theLayerId: Standard_Integer
	:rtype: bool
") RemoveZLayer;
		virtual Standard_Boolean RemoveZLayer (const Standard_Integer theLayerId);
		%feature("autodoc", "	* Return all Z layer ids in sequence ordered by level from lowest layer to highest. The first layer ID in sequence is the default layer that can't be removed.

	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger &
	:rtype: void
") GetAllZLayers;
		virtual void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("autodoc", "	* Returns a current identifier available.

	:rtype: int
") CurrentId;
		static Standard_Integer CurrentId ();
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> //!	 if <AStructure> is displayed and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> //!	 if <AStructure> is displayed in <AProjector> and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AProjector:
	:type AProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure,const Handle_Graphic3d_DataStructureManager & AProjector);
		%feature("autodoc", "	* Clears the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Handle_Graphic3d_Structure & AStructure,const Standard_Boolean WithDestruction);
		%feature("autodoc", "	* Connects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Connect;
		virtual void Connect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "	* Disconnects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Disconnect;
		virtual void Disconnect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "	* Display the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Display;
		virtual void Display (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "	* Erases the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Erase;
		virtual void Erase (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "	* Highlights the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AMethod:
	:type AMethod: Aspect_TypeOfHighlightMethod
	:rtype: void
") Highlight;
		virtual void Highlight (const Handle_Graphic3d_Structure & AStructure,const Aspect_TypeOfHighlightMethod AMethod);
		%feature("autodoc", "	* Transforms the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:rtype: void
") SetTransform;
		virtual void SetTransform (const Handle_Graphic3d_Structure & AStructure,const TColStd_Array2OfReal & ATrsf);
		%feature("autodoc", "	* Returns the graphic driver of <self>.

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		const Handle_Graphic3d_GraphicDriver & GraphicDriver ();
		%feature("autodoc", "	* Returns the identification number of the manager.

	:rtype: int
") Identification;
		virtual Standard_Integer Identification ();
		%feature("autodoc", "	* Returns the structure with the identification number <AId>.

	:param AId:
	:type AId: Standard_Integer
	:rtype: Handle_Graphic3d_Structure
") Identification;
		virtual Handle_Graphic3d_Structure Identification (const Standard_Integer AId);
		%feature("autodoc", "	* Suppresses the highlighting on all the structures in <self>.

	:rtype: void
") UnHighlight;
		virtual void UnHighlight ();
		%feature("autodoc", "	* Suppress the highlighting on the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") UnHighlight;
		virtual void UnHighlight (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "	:rtype: None
") RecomputeStructures;
		void RecomputeStructures ();
};


%feature("shadow") Graphic3d_StructureManager::~Graphic3d_StructureManager %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_StructureManager {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_StructureManager {
	Handle_Graphic3d_StructureManager GetHandle() {
	return *(Handle_Graphic3d_StructureManager*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_StructureManager::~Handle_Graphic3d_StructureManager %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_StructureManager {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_TextureParams;
class Graphic3d_TextureParams : public Standard_Transient {
	public:
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") Graphic3d_TextureParams;
		 Graphic3d_TextureParams ();
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* returns True if the texture is modulate. Default value is False.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("autodoc", "	* @param theToModulate turn modulation on/off.

	:param theToModulate:
	:type theToModulate: bool
	:rtype: None
") SetModulate;
		void SetModulate (const Standard_Boolean theToModulate);
		%feature("autodoc", "	* returns True if the texture repeat is enabled. Default value is False.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("autodoc", "	* @param theToRepeat turn texture repeat mode ON or OFF (clamping).

	:param theToRepeat:
	:type theToRepeat: bool
	:rtype: None
") SetRepeat;
		void SetRepeat (const Standard_Boolean theToRepeat);
		%feature("autodoc", "	* returns texture interpolation filter. Default value is Graphic3d_TOTF_NEAREST.

	:rtype: Graphic3d_TypeOfTextureFilter
") Filter;
		Graphic3d_TypeOfTextureFilter Filter ();
		%feature("autodoc", "	* @param theFilter texture interpolation filter.

	:param theFilter:
	:type theFilter: Graphic3d_TypeOfTextureFilter
	:rtype: None
") SetFilter;
		void SetFilter (const Graphic3d_TypeOfTextureFilter theFilter);
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
		%feature("autodoc", "	* returns rotation angle in degrees Default value is 0.

	:rtype: Standard_ShortReal
") Rotation;
		Standard_ShortReal Rotation ();
		%feature("autodoc", "	* @param theAngleDegrees rotation angle.

	:param theAngleDegrees:
	:type theAngleDegrees: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theAngleDegrees);
		%feature("autodoc", "	* returns scale factor Default value is no scaling (1.0; 1.0).

	:rtype: Graphic3d_Vec2
") Scale;
		const Graphic3d_Vec2 & Scale ();
		%feature("autodoc", "	* @param theScale scale factor.

	:param theScale:
	:type theScale: Graphic3d_Vec2
	:rtype: None
") SetScale;
		void SetScale (const Graphic3d_Vec2 theScale);
		%feature("autodoc", "	* returns translation vector Default value is no translation (0.0; 0.0).

	:rtype: Graphic3d_Vec2
") Translation;
		const Graphic3d_Vec2 & Translation ();
		%feature("autodoc", "	* @param theVec translation vector.

	:param theVec:
	:type theVec: Graphic3d_Vec2
	:rtype: None
") SetTranslation;
		void SetTranslation (const Graphic3d_Vec2 theVec);
		%feature("autodoc", "	* returns texture coordinates generation mode. Default value is Graphic3d_TOTM_MANUAL.

	:rtype: Graphic3d_TypeOfTextureMode
") GenMode;
		Graphic3d_TypeOfTextureMode GenMode ();
		%feature("autodoc", "	* returns texture coordinates generation plane S.

	:rtype: Graphic3d_Vec4
") GenPlaneS;
		const Graphic3d_Vec4 & GenPlaneS ();
		%feature("autodoc", "	* returns texture coordinates generation plane T.

	:rtype: Graphic3d_Vec4
") GenPlaneT;
		const Graphic3d_Vec4 & GenPlaneT ();
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


%feature("shadow") Graphic3d_TextureParams::~Graphic3d_TextureParams %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_TextureParams {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_TextureParams {
	Handle_Graphic3d_TextureParams GetHandle() {
	return *(Handle_Graphic3d_TextureParams*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_TextureParams::~Handle_Graphic3d_TextureParams %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_TextureParams {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_TextureRoot;
class Graphic3d_TextureRoot : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Checks if a texture class is valid or not. returns true if the construction of the class is correct

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the full path of the defined texture. It could be empty path if GetImage() is overridden to load image not from file.

	:rtype: OSD_Path
") Path;
		const OSD_Path & Path ();
		%feature("autodoc", "	* returns the texture type.

	:rtype: Graphic3d_TypeOfTexture
") Type;
		Graphic3d_TypeOfTexture Type ();
		%feature("autodoc", "	* This ID will be used to manage resource in graphic driver. . Default implementation generates unique ID although inheritors may re-initialize it. . Multiple Graphic3d_TextureRoot instancies with same ID will be treated as single texture with different parameters to optimize memory usage though this will be more natural to use same instance of Graphic3d_TextureRoot when possible. . Notice that inheritor may set this ID to empty string. In this case independent graphical resource will be created for each instance of Graphic3d_AspectFillArea3d where texture will be used. . returns texture identifier.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("autodoc", "	* This method will be called by graphic driver each time when texture resource should be created. Default constructors allow defining the texture source as path to texture image or directly as pixmap. If the source is defined as path, then the image will be dynamically loaded when this method is called (and no copy will be preserved in this class instance). Inheritors may dynamically generate the image. Notice, image data should be in Bottom-Up order (see Image_PixMap::IsTopDown())! returns the image for texture.

	:rtype: Image_PixMap_Handle
") GetImage;
		virtual Image_PixMap_Handle GetImage ();
		%feature("autodoc", "	* returns low-level texture parameters

	:rtype: Handle_Graphic3d_TextureParams
") GetParams;
		const Handle_Graphic3d_TextureParams & GetParams ();
		%feature("autodoc", "	* The path to textures determined from CSF_MDTVTexturesDirectory or CASROOT environment variables. returns the root folder with default textures.

	:rtype: TCollection_AsciiString
") TexturesFolder;
		static TCollection_AsciiString TexturesFolder ();
};


%feature("shadow") Graphic3d_TextureRoot::~Graphic3d_TextureRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_TextureRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_TextureRoot {
	Handle_Graphic3d_TextureRoot GetHandle() {
	return *(Handle_Graphic3d_TextureRoot*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_TextureRoot::~Handle_Graphic3d_TextureRoot %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_TextureRoot {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec2>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Graphic3d_Vec2>::~Graphic3d_UniformValueTypeID<Graphic3d_Vec2> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec2> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec2i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Graphic3d_Vec2i>::~Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec3>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Graphic3d_Vec3>::~Graphic3d_UniformValueTypeID<Graphic3d_Vec3> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec3> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec3i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Graphic3d_Vec3i>::~Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec4>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Graphic3d_Vec4>::~Graphic3d_UniformValueTypeID<Graphic3d_Vec4> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec4> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec4i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Graphic3d_Vec4i>::~Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Standard_Integer>;
class Graphic3d_UniformValueTypeID<Standard_Integer> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Standard_Integer>::~Graphic3d_UniformValueTypeID<Standard_Integer> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Standard_Integer> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Standard_ShortReal>;
class Graphic3d_UniformValueTypeID<Standard_ShortReal> {
	public:
};


%feature("shadow") Graphic3d_UniformValueTypeID<Standard_ShortReal>::~Graphic3d_UniformValueTypeID<Standard_ShortReal> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_UniformValueTypeID<Standard_ShortReal> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ValueInterface;
class Graphic3d_ValueInterface {
	public:
		%feature("autodoc", "	* Returns unique identifier of value type.

	:rtype: Standard_Size
") TypeID;
		Standard_Size TypeID ();
};


%feature("shadow") Graphic3d_ValueInterface::~Graphic3d_ValueInterface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ValueInterface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_Vector;
class Graphic3d_Vector {
	public:
		%feature("autodoc", "	* Creates a vector with 1.0, 0.0, 0.0 coordinates.

	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector ();
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
		%feature("autodoc", "	* Creates a vector from 2 points <APoint1> and <APoint2>.

	:param APoint1:
	:type APoint1: Graphic3d_Vertex &
	:param APoint2:
	:type APoint2: Graphic3d_Vertex &
	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector (const Graphic3d_Vertex & APoint1,const Graphic3d_Vertex & APoint2);
		%feature("autodoc", "	* Normalises <self>. Category: Methods to modify the class definition Warning: Raises VectorError if <self> is null.

	:rtype: None
") Normalize;
		void Normalize ();
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
		%feature("autodoc", "	* Modifies the X coordinate of the vector <self>.

	:param Xnew:
	:type Xnew: float
	:rtype: None
") SetXCoord;
		void SetXCoord (const Standard_Real Xnew);
		%feature("autodoc", "	* Modifies the Y coordinate of the vector <self>.

	:param Ynew:
	:type Ynew: float
	:rtype: None
") SetYCoord;
		void SetYCoord (const Standard_Real Ynew);
		%feature("autodoc", "	* Modifies the Z coordinate of the vector <self>.

	:param Znew:
	:type Znew: float
	:rtype: None
") SetZCoord;
		void SetZCoord (const Standard_Real Znew);
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
		%feature("autodoc", "	* Returns Standard_True if <self> has length 1.

	:rtype: bool
") IsNormalized;
		Standard_Boolean IsNormalized ();
		%feature("autodoc", "	* Returns Standard_True if <self> has length zero.

	:rtype: bool
") LengthZero;
		Standard_Boolean LengthZero ();
		%feature("autodoc", "	* Returns the X coordinates of the vector <self>.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("autodoc", "	* Returns the Y coordinate of the vector <self>.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("autodoc", "	* Returns the Z coordinate of the vector <self>.

	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("autodoc", "	* Returns Standard_True if the vector <AV1> and //!	 <AV2> are parallel.

	:param AV1:
	:type AV1: Graphic3d_Vector &
	:param AV2:
	:type AV2: Graphic3d_Vector &
	:rtype: bool
") IsParallel;
		static Standard_Boolean IsParallel (const Graphic3d_Vector & AV1,const Graphic3d_Vector & AV2);
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
		%feature("autodoc", "	* Returns the norm of the vector <AVector>.

	:param AVector:
	:type AVector: Graphic3d_Vector &
	:rtype: float
") NormeOf;
		static Standard_Real NormeOf (const Graphic3d_Vector & AVector);
};


%feature("shadow") Graphic3d_Vector::~Graphic3d_Vector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Vector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_Vertex;
class Graphic3d_Vertex : public TEL_POINT {
	public:
		%feature("autodoc", "	* Creates a point with 0.0, 0.0, 0.0 coordinates.

	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex ();
		%feature("autodoc", "	* Creates a point with coordinates identical to <APoint>.

	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Graphic3d_Vertex & APoint);
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
		%feature("autodoc", "	* Returns the X coordinates of the point <self>.

	:rtype: Standard_ShortReal
") X;
		Standard_ShortReal X ();
		%feature("autodoc", "	* Returns the Y coordinate of the point <self>.

	:rtype: Standard_ShortReal
") Y;
		Standard_ShortReal Y ();
		%feature("autodoc", "	* Returns the Z coordinate of the point <self>.

	:rtype: Standard_ShortReal
") Z;
		Standard_ShortReal Z ();
		%feature("autodoc", "	* Returns the distance between <AV1> and <AV2>.

	:param AOther:
	:type AOther: Graphic3d_Vertex &
	:rtype: Standard_ShortReal
") Distance;
		Standard_ShortReal Distance (const Graphic3d_Vertex & AOther);
};


%feature("shadow") Graphic3d_Vertex::~Graphic3d_Vertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Vertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ZLayerSettings;
class Graphic3d_ZLayerSettings {
	public:
		%feature("autodoc", "	:rtype: None
") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings ();
		%feature("autodoc", "	* Returns true if theSetting is enabled.

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: bool
") IsSettingEnabled;
		const Standard_Boolean IsSettingEnabled (const Graphic3d_ZLayerSetting theSetting);
		%feature("autodoc", "	* Enables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") EnableSetting;
		void EnableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("autodoc", "	* Disables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") DisableSetting;
		void DisableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("autodoc", "	* Sets minimal possible positive depth offset. Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.

	:rtype: None
") SetDepthOffsetPositive;
		void SetDepthOffsetPositive ();
		%feature("autodoc", "	* Sets minimal possible negative depth offset. Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.

	:rtype: None
") SetDepthOffsetNegative;
		void SetDepthOffsetNegative ();
};


%feature("shadow") Graphic3d_ZLayerSettings::~Graphic3d_ZLayerSettings %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ZLayerSettings {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Graphic3d_ArrayOfPoints;
class Graphic3d_ArrayOfPoints : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of points, a single pixel point is drawn at each vertex. The array must be filled using the AddVertex(Point) method. When <hasVColors> is True , you must use only AddVertex(Point,Color) method.

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:rtype: None
") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints (const Standard_Integer maxVertexs,const Standard_Boolean hasVColors = Standard_False);
};


%feature("shadow") Graphic3d_ArrayOfPoints::~Graphic3d_ArrayOfPoints %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfPoints {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfPoints {
	Handle_Graphic3d_ArrayOfPoints GetHandle() {
	return *(Handle_Graphic3d_ArrayOfPoints*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfPoints::~Handle_Graphic3d_ArrayOfPoints %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfPoints {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfPolygons;
class Graphic3d_ArrayOfPolygons : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of polygons, a polygon can be filled as: 1) creating a single polygon defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfPolygons(7) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x7,y7,z7) 2) creating separate polygons defined with a predefined number of bounds and the number of vertex per bound. i.e: myArray = Graphic3d_ArrayOfPolygons(7,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddBound(3) myArray->AddVertex(x5,y5,z5) //!	.... myArray->AddVertex(x7,y7,z7) 3) creating a single indexed polygon defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfPolygons(4,0,6) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(4) 4) creating separate polygons defined with a predefined number of bounds and the number of edges per bound. i.e: myArray = Graphic3d_ArrayOfPolygons(6,4,14) myArray->AddBound(3) myArray->AddVertex(x1,y1,z1) myArray->AddVertex(x2,y2,z2) myArray->AddVertex(x3,y3,z3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddBound(3) myArray->AddVertex(x4,y4,z4) myArray->AddVertex(x5,y5,z5) myArray->AddVertex(x6,y6,z6) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(1) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(4) <maxVertexs> defined the maximun allowed vertex number in the array. <maxBounds> defined the maximun allowed bound number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of //!	AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of //!	AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of //!	AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasBColors> is True , <maxBounds> must be > 0 and //!	you must use the //!	AddBound(number,Color) method. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and //!	you must use the //!	AddEdge(number,visibillity) method. Warning: the user is responsible about the orientation of the polygon depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxBounds: default value is 0
	:type maxBounds: Standard_Integer
	:param maxEdges: default value is 0
	:type maxEdges: Standard_Integer
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


%feature("shadow") Graphic3d_ArrayOfPolygons::~Graphic3d_ArrayOfPolygons %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfPolygons {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfPolygons {
	Handle_Graphic3d_ArrayOfPolygons GetHandle() {
	return *(Handle_Graphic3d_ArrayOfPolygons*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfPolygons::~Handle_Graphic3d_ArrayOfPolygons %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfPolygons {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfPolylines;
class Graphic3d_ArrayOfPolylines : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of polylines, a polyline can be filled as: 1) creating a single polyline defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfPolylines(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate polylines defined with a predefined number of bounds and the number of vertex per bound. i.e: myArray = Graphic3d_ArrayOfPolylines(7,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(3) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x7,y7,z7) 3) creating a single indexed polyline defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfPolylines(4,0,6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(4) 4) creating separate polylines defined with a predefined number of bounds and the number of edges per bound. i.e: myArray = Graphic3d_ArrayOfPolylines(6,4,14) myArray->AddBound(3) myArray->AddVertex(x1,y1,z1) myArray->AddVertex(x2,y2,z2) myArray->AddVertex(x3,y3,z3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddBound(3) myArray->AddVertex(x4,y4,z4) myArray->AddVertex(x5,y5,z5) myArray->AddVertex(x6,y6,z6) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(1) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(4) <maxVertexs> defined the maximun allowed vertex number in the array. <maxBounds> defined the maximun allowed bound number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasBColors> is True , <maxBounds> must be > 0 and you must use the AddBound(number,Color) method. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and you must use the AddEdge(number,visibillity) method.

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxBounds: default value is 0
	:type maxBounds: Standard_Integer
	:param maxEdges: default value is 0
	:type maxEdges: Standard_Integer
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


%feature("shadow") Graphic3d_ArrayOfPolylines::~Graphic3d_ArrayOfPolylines %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfPolylines {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfPolylines {
	Handle_Graphic3d_ArrayOfPolylines GetHandle() {
	return *(Handle_Graphic3d_ArrayOfPolylines*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfPolylines::~Handle_Graphic3d_ArrayOfPolylines %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfPolylines {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfQuadrangleStrips;
class Graphic3d_ArrayOfQuadrangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of quadrangle strips, a polygon can be filled as: 1) creating a single strip defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfQuadrangleStrips(7) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x7,y7,z7) 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip. i.e: myArray = Graphic3d_ArrayOfQuadrangleStrips(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) //!	.... myArray->AddVertex(x8,y8,z8) <maxVertexs> defined the maximun allowed vertex number in the array. <maxStrips> defined the maximun allowed strip number in the array. The number of quadrangle really drawn is : VertexNumber()/2-Min(1,BoundNumber())

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxStrips: default value is 0
	:type maxStrips: Standard_Integer
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


%feature("shadow") Graphic3d_ArrayOfQuadrangleStrips::~Graphic3d_ArrayOfQuadrangleStrips %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfQuadrangleStrips {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfQuadrangleStrips {
	Handle_Graphic3d_ArrayOfQuadrangleStrips GetHandle() {
	return *(Handle_Graphic3d_ArrayOfQuadrangleStrips*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfQuadrangleStrips::~Handle_Graphic3d_ArrayOfQuadrangleStrips %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfQuadrangleStrips {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfQuadrangles;
class Graphic3d_ArrayOfQuadrangles : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of quadrangles, a quadrangle can be filled as: 1) creating a set of quadrangles defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfQuadrangles(8) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x8,y8,z8) 3) creating a set of indexed quadrangles defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfQuadrangles(6,8) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x6,y6,z6) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of //!	AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of //!	AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of //!	AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and //!	you must use the //!	AddEdge(number,visibillity) method. Warning: the user is responsible about the orientation of the quadrangle depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxEdges: default value is 0
	:type maxEdges: Standard_Integer
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


%feature("shadow") Graphic3d_ArrayOfQuadrangles::~Graphic3d_ArrayOfQuadrangles %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfQuadrangles {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfQuadrangles {
	Handle_Graphic3d_ArrayOfQuadrangles GetHandle() {
	return *(Handle_Graphic3d_ArrayOfQuadrangles*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfQuadrangles::~Handle_Graphic3d_ArrayOfQuadrangles %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfQuadrangles {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfSegments;
class Graphic3d_ArrayOfSegments : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of segments, a segment can be filled as: 1) creating a set of segments defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfSegments(4) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) 2) creating a set of indexed segments defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfSegments(4,0,8) myArray->AddVertex(x1,y1,z1) //!	.... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(2) myArray->AddEdge(4) myArray->AddEdge(1) myArray->AddEdge(3) <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVColors> is True , you must use only //!	AddVertex(Point,Color) method

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxEdges: default value is 0
	:type maxEdges: Standard_Integer
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:rtype: None
") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments (const Standard_Integer maxVertexs,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVColors = Standard_False);
};


%feature("shadow") Graphic3d_ArrayOfSegments::~Graphic3d_ArrayOfSegments %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfSegments {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfSegments {
	Handle_Graphic3d_ArrayOfSegments GetHandle() {
	return *(Handle_Graphic3d_ArrayOfSegments*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfSegments::~Handle_Graphic3d_ArrayOfSegments %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfSegments {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfTriangleFans;
class Graphic3d_ArrayOfTriangleFans : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of triangle fans, a polygon can be filled as: 1) creating a single fan defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangleFans(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate fans defined with a predefined number of fans and the number of vertex per fan. i.e: myArray = Graphic3d_ArrayOfTriangleFans(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x8,y8,z8) <maxVertexs> defined the maximun allowed vertex number in the array. <maxFans> defined the maximun allowed fan number in the array. The number of triangle really drawn is : VertexNumber()-2*Min(1,BoundNumber())

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxFans: default value is 0
	:type maxFans: Standard_Integer
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


%feature("shadow") Graphic3d_ArrayOfTriangleFans::~Graphic3d_ArrayOfTriangleFans %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfTriangleFans {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfTriangleFans {
	Handle_Graphic3d_ArrayOfTriangleFans GetHandle() {
	return *(Handle_Graphic3d_ArrayOfTriangleFans*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfTriangleFans::~Handle_Graphic3d_ArrayOfTriangleFans %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfTriangleFans {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfTriangleStrips;
class Graphic3d_ArrayOfTriangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of triangle strips, a polygon can be filled as: 1) creating a single strip defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangleStrips(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip. i.e: myArray = Graphic3d_ArrayOfTriangleStrips(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x8,y8,z8) <maxVertexs> defined the maximun allowed vertex number in the array. <maxStrips> defined the maximun allowed strip number in the array. The number of triangle really drawn is : VertexNumber()-2*Min(1,BoundNumber()) Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasBColors> is True , <maxBounds> must be > 0 and you must use the AddBound(number,Color) method. Warning: the user is responsible about the orientation of the strip depending of the order of the created vertex and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxStrips: default value is 0
	:type maxStrips: Standard_Integer
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


%feature("shadow") Graphic3d_ArrayOfTriangleStrips::~Graphic3d_ArrayOfTriangleStrips %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfTriangleStrips {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfTriangleStrips {
	Handle_Graphic3d_ArrayOfTriangleStrips GetHandle() {
	return *(Handle_Graphic3d_ArrayOfTriangleStrips*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfTriangleStrips::~Handle_Graphic3d_ArrayOfTriangleStrips %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfTriangleStrips {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_ArrayOfTriangles;
class Graphic3d_ArrayOfTriangles : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("autodoc", "	* Creates an array of triangles, a triangle can be filled as: 1) creating a set of triangles defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangles(6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x6,y6,z6) 3) creating a set of indexed triangles defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfTriangles(4,6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasEdgeInfos> is True , <maxEdges> must be > 0 and you must use the AddEdge(number,visibillity) method. Warning: the user is responsible about the orientation of the triangle depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: Standard_Integer
	:param maxEdges: default value is 0
	:type maxEdges: Standard_Integer
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


%feature("shadow") Graphic3d_ArrayOfTriangles::~Graphic3d_ArrayOfTriangles %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_ArrayOfTriangles {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_ArrayOfTriangles {
	Handle_Graphic3d_ArrayOfTriangles GetHandle() {
	return *(Handle_Graphic3d_ArrayOfTriangles*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_ArrayOfTriangles::~Handle_Graphic3d_ArrayOfTriangles %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_ArrayOfTriangles {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_TextureEnv;
class Graphic3d_TextureEnv : public Graphic3d_TextureRoot {
	public:
		%feature("autodoc", "	* Creates an environment texture from a file.

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "	* Creates an environment texture from a predefined texture name set.

	:param theName:
	:type theName: Graphic3d_NameOfTextureEnv
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const Graphic3d_NameOfTextureEnv theName);
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_ENV_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTextureEnv
") Name;
		Graphic3d_NameOfTextureEnv Name ();
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param theRank:
	:type theRank: Standard_Integer
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);
};


%feature("shadow") Graphic3d_TextureEnv::~Graphic3d_TextureEnv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_TextureEnv {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_TextureEnv {
	Handle_Graphic3d_TextureEnv GetHandle() {
	return *(Handle_Graphic3d_TextureEnv*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_TextureEnv::~Handle_Graphic3d_TextureEnv %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_TextureEnv {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_TextureMap;
class Graphic3d_TextureMap : public Graphic3d_TextureRoot {
	public:
		%feature("autodoc", "	* enable texture smoothing

	:rtype: None
") EnableSmooth;
		void EnableSmooth ();
		%feature("autodoc", "	* Returns True if the texture is smoothed.

	:rtype: bool
") IsSmoothed;
		Standard_Boolean IsSmoothed ();
		%feature("autodoc", "	* disable texture smoothing

	:rtype: None
") DisableSmooth;
		void DisableSmooth ();
		%feature("autodoc", "	* enable texture modulate mode. the image is modulate with the shading of the surface.

	:rtype: None
") EnableModulate;
		void EnableModulate ();
		%feature("autodoc", "	* disable texture modulate mode. the image is directly decal on the surface.

	:rtype: None
") DisableModulate;
		void DisableModulate ();
		%feature("autodoc", "	* Returns True if the texture is modulate.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("autodoc", "	* use this methods if you want to enable texture repetition on your objects.

	:rtype: None
") EnableRepeat;
		void EnableRepeat ();
		%feature("autodoc", "	* use this methods if you want to disable texture repetition on your objects.

	:rtype: None
") DisableRepeat;
		void DisableRepeat ();
		%feature("autodoc", "	* Returns True if the texture repeat is enable.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
};


%feature("shadow") Graphic3d_TextureMap::~Graphic3d_TextureMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_TextureMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_TextureMap {
	Handle_Graphic3d_TextureMap GetHandle() {
	return *(Handle_Graphic3d_TextureMap*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_TextureMap::~Handle_Graphic3d_TextureMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_TextureMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Texture1D;
class Graphic3d_Texture1D : public Graphic3d_TextureMap {
	public:
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_1D_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTexture1D
") Name;
		Graphic3d_NameOfTexture1D Name ();
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param aRank:
	:type aRank: Standard_Integer
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer aRank);
};


%feature("shadow") Graphic3d_Texture1D::~Graphic3d_Texture1D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Texture1D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Texture1D {
	Handle_Graphic3d_Texture1D GetHandle() {
	return *(Handle_Graphic3d_Texture1D*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Texture1D::~Handle_Graphic3d_Texture1D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Texture1D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Texture2D;
class Graphic3d_Texture2D : public Graphic3d_TextureMap {
	public:
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_2D_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTexture2D
") Name;
		Graphic3d_NameOfTexture2D Name ();
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param theRank:
	:type theRank: Standard_Integer
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);
};


%feature("shadow") Graphic3d_Texture2D::~Graphic3d_Texture2D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Texture2D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Texture2D {
	Handle_Graphic3d_Texture2D GetHandle() {
	return *(Handle_Graphic3d_Texture2D*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Texture2D::~Handle_Graphic3d_Texture2D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Texture2D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Texture1Dmanual;
class Graphic3d_Texture1Dmanual : public Graphic3d_Texture1D {
	public:
		%feature("autodoc", "	* Creates a texture from the file FileName.

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "	* Create a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Graphic3d_NameOfTexture1D theNOT);
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Image_PixMap_Handle & thePixMap);
};


%feature("shadow") Graphic3d_Texture1Dmanual::~Graphic3d_Texture1Dmanual %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Texture1Dmanual {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Texture1Dmanual {
	Handle_Graphic3d_Texture1Dmanual GetHandle() {
	return *(Handle_Graphic3d_Texture1Dmanual*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Texture1Dmanual::~Handle_Graphic3d_Texture1Dmanual %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Texture1Dmanual {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Texture1Dsegment;
class Graphic3d_Texture1Dsegment : public Graphic3d_Texture1D {
	public:
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Graphic3d_NameOfTexture1D theNOT);
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Image_PixMap_Handle & thePixMap);
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


%feature("shadow") Graphic3d_Texture1Dsegment::~Graphic3d_Texture1Dsegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Texture1Dsegment {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Texture1Dsegment {
	Handle_Graphic3d_Texture1Dsegment GetHandle() {
	return *(Handle_Graphic3d_Texture1Dsegment*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Texture1Dsegment::~Handle_Graphic3d_Texture1Dsegment %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Texture1Dsegment {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Texture2Dmanual;
class Graphic3d_Texture2Dmanual : public Graphic3d_Texture2D {
	public:
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Graphic3d_NameOfTexture2D theNOT);
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Image_PixMap_Handle & thePixMap);
};


%feature("shadow") Graphic3d_Texture2Dmanual::~Graphic3d_Texture2Dmanual %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Texture2Dmanual {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Texture2Dmanual {
	Handle_Graphic3d_Texture2Dmanual GetHandle() {
	return *(Handle_Graphic3d_Texture2Dmanual*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Texture2Dmanual::~Handle_Graphic3d_Texture2Dmanual %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Texture2Dmanual {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Graphic3d_Texture2Dplane;
class Graphic3d_Texture2Dplane : public Graphic3d_Texture2D {
	public:
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Graphic3d_NameOfTexture2D theNOT);
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Image_PixMap_Handle & thePixMap);
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
		%feature("autodoc", "	* Defines the texture projection plane for both S and T texture coordinate default is NOTP_XY meaning: <1.0, 0.0, 0.0, 0.0> for S and <0.0, 1.0, 0.0, 0.0> for T

	:param thePlane:
	:type thePlane: Graphic3d_NameOfTexturePlane
	:rtype: None
") SetPlane;
		void SetPlane (const Graphic3d_NameOfTexturePlane thePlane);
		%feature("autodoc", "	* Defines the texture scale for the S texture coordinate much easier than recomputing the S plane equation but the result is the same default to 1.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetScaleS;
		void SetScaleS (const Standard_ShortReal theVal);
		%feature("autodoc", "	* Defines the texture scale for the T texture coordinate much easier than recompution the T plane equation but the result is the same default to 1.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetScaleT;
		void SetScaleT (const Standard_ShortReal theVal);
		%feature("autodoc", "	* Defines the texture translation for the S texture coordinate you can obtain the same effect by modifying the S plane equation but its not easier. default to 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetTranslateS;
		void SetTranslateS (const Standard_ShortReal theVal);
		%feature("autodoc", "	* Defines the texture translation for the T texture coordinate you can obtain the same effect by modifying the T plane equation but its not easier. default to 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetTranslateT;
		void SetTranslateT (const Standard_ShortReal theVal);
		%feature("autodoc", "	* Sets the rotation angle of the whole texture. the same result might be achieved by recomputing the S and T plane equation but it's not the easiest way... the angle is expressed in degrees default is 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theVal);
		%feature("autodoc", "	* Returns the current texture plane name or NOTP_UNKNOWN when the plane is user defined.

	:rtype: Graphic3d_NameOfTexturePlane
") Plane;
		Graphic3d_NameOfTexturePlane Plane ();
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
		%feature("autodoc", "	* Returns the current texture S translation value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") TranslateS;
		void TranslateS (Standard_ShortReal & theVal);
		%feature("autodoc", "	* Returns the current texture T translation value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") TranslateT;
		void TranslateT (Standard_ShortReal & theVal);
		%feature("autodoc", "	* Returns the current texture S scale value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") ScaleS;
		void ScaleS (Standard_ShortReal & theVal);
		%feature("autodoc", "	* Returns the current texture T scale value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") ScaleT;
		void ScaleT (Standard_ShortReal & theVal);
		%feature("autodoc", "	* Returns the current texture rotation angle

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") Rotation;
		void Rotation (Standard_ShortReal & theVal);
};


%feature("shadow") Graphic3d_Texture2Dplane::~Graphic3d_Texture2Dplane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Graphic3d_Texture2Dplane {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Graphic3d_Texture2Dplane {
	Handle_Graphic3d_Texture2Dplane GetHandle() {
	return *(Handle_Graphic3d_Texture2Dplane*) &$self;
	}
};

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
%feature("shadow") Handle_Graphic3d_Texture2Dplane::~Handle_Graphic3d_Texture2Dplane %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Graphic3d_Texture2Dplane {
    void _kill_pointed() {
        delete $self;
    }
};

