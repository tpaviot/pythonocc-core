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
		%feature("autodoc", "Args:
	theDisplayConnection(Aspect_DisplayConnection_Handle)

Returns:
	static Handle_Graphic3d_GraphicDriver

Initialize graphic driver and returns Handle to it.") InitGraphicDriver;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Graphic3d_Vector)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Graphic3d_Vector & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Graphic3d_Vector)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Graphic3d_Vector & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Graphic3d_Array1OfVector)

Returns:
	Graphic3d_Array1OfVector

No detailed docstring for this function.") Assign;
		const Graphic3d_Array1OfVector & Assign (const Graphic3d_Array1OfVector & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_Array1OfVector)

Returns:
	Graphic3d_Array1OfVector

No detailed docstring for this function.") operator=;
		const Graphic3d_Array1OfVector & operator = (const Graphic3d_Array1OfVector & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Graphic3d_Vector)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vector & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Graphic3d_Vector

No detailed docstring for this function.") Value;
		const Graphic3d_Vector & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Graphic3d_Vector

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Graphic3d_Vertex)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Graphic3d_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Graphic3d_Array1OfVertex)

Returns:
	Graphic3d_Array1OfVertex

No detailed docstring for this function.") Assign;
		const Graphic3d_Array1OfVertex & Assign (const Graphic3d_Array1OfVertex & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_Array1OfVertex)

Returns:
	Graphic3d_Array1OfVertex

No detailed docstring for this function.") operator=;
		const Graphic3d_Array1OfVertex & operator = (const Graphic3d_Array1OfVertex & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Graphic3d_Vertex)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vertex & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Graphic3d_Vertex

No detailed docstring for this function.") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Graphic3d_Vertex

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Graphic3d_Vertex)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Graphic3d_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(Graphic3d_Array2OfVertex)

Returns:
	Graphic3d_Array2OfVertex

No detailed docstring for this function.") Assign;
		const Graphic3d_Array2OfVertex & Assign (const Graphic3d_Array2OfVertex & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_Array2OfVertex)

Returns:
	Graphic3d_Array2OfVertex

No detailed docstring for this function.") operator=;
		const Graphic3d_Array2OfVertex & operator = (const Graphic3d_Array2OfVertex & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Graphic3d_Vertex)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Graphic3d_Vertex & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Graphic3d_Vertex

No detailed docstring for this function.") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Graphic3d_Vertex

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)

Returns:
	Standard_Integer

Adds a vertice in the array.  
returns the actual vertex number.") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	Standard_Integer

Adds a vertice in the array.  
returns the actual vertex number.") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	Z(Standard_ShortReal)

Returns:
	Standard_Integer

Adds a vertice in the array.  
returns the actual vertex number.") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z);
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Adds a vertice and vertex color in the vertex array.  
returns the actual vertex number.  
 Warning: <aColor> is ignored when the <hasVColors>  
constructor parameter is FALSE") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)
	aColor(Standard_Integer)

Returns:
	Standard_Integer

Adds a vertice and vertex color in the vertex array.  
returns the actual vertex number.  
Warning: <aColor> is ignored when the <hasVColors>  
constructor parameter is FALSE  
aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red  
On all architecture proccers type (x86 or SPARC) you can  
use this byte order.") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Standard_Integer aColor);
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)
	aNormal(gp_Dir)

Returns:
	Standard_Integer

Adds a vertice and vertex normal in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)
	NX(Standard_Real)
	NY(Standard_Real)
	NZ(Standard_Real)

Returns:
	Standard_Integer

Adds a vertice and vertex normal in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	Z(Standard_ShortReal)
	NX(Standard_ShortReal)
	NY(Standard_ShortReal)
	NZ(Standard_ShortReal)

Returns:
	Standard_Integer

Adds a vertice and vertex normal in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal NX,const Standard_ShortReal NY,const Standard_ShortReal NZ);
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)
	aNormal(gp_Dir)
	aColor(Quantity_Color)

Returns:
	Standard_Integer

Adds a vertice,vertex normal and color in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.  
         <aColor> is ignored when the <hasVColors>  
constructor parameter is FALSE") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)
	aNormal(gp_Dir)
	aColor(Standard_Integer)

Returns:
	Standard_Integer

Adds a vertice,vertex normal and color in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.  
         <aColor> is ignored when the <hasVColors>  
constructor parameter is FALSE  
aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red  
On all architecture proccers type (x86 or SPARC) you can  
use this byte order.") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const Standard_Integer aColor);
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)
	aTexel(gp_Pnt2d)

Returns:
	Standard_Integer

Adds a vertice and vertex texture in the vertex array.  
returns the actual vertex number.  
<aTexel> is ignored when the <hasVTexels>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Pnt2d & aTexel);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)
	TX(Standard_Real)
	TY(Standard_Real)

Returns:
	Standard_Integer

Adds a vertice and vertex texture coordinates in the vertex array.  
returns the actual vertex number.  
<aTexel> is ignored when the <hasVTexels>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real TX,const Standard_Real TY);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	Z(Standard_ShortReal)
	TX(Standard_ShortReal)
	TY(Standard_ShortReal)

Returns:
	Standard_Integer

Adds a vertice and vertex texture coordinates in the vertex array.  
returns the actual vertex number.  
<aTexel> is ignored when the <hasVTexels>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal TX,const Standard_ShortReal TY);
		%feature("autodoc", "Args:
	aVertice(gp_Pnt)
	aNormal(gp_Dir)
	aTexel(gp_Pnt2d)

Returns:
	Standard_Integer

Adds a vertice,vertex normal and texture in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.  
<aTexel> is ignored when the <hasVTexels>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const gp_Pnt2d & aTexel);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)
	NX(Standard_Real)
	NY(Standard_Real)
	NZ(Standard_Real)
	TX(Standard_Real)
	TY(Standard_Real)

Returns:
	Standard_Integer

Adds a vertice,vertex normal and texture in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.  
<aTexel> is ignored when the <hasVTexels>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ,const Standard_Real TX,const Standard_Real TY);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	Z(Standard_ShortReal)
	NX(Standard_ShortReal)
	NY(Standard_ShortReal)
	NZ(Standard_ShortReal)
	TX(Standard_ShortReal)
	TY(Standard_ShortReal)

Returns:
	Standard_Integer

Adds a vertice,vertex normal and texture in the vertex array.  
returns the actual vertex number.  
 Warning: <aNormal> is ignored when the <hasVNormals>  
constructor parameter is FALSE.  
<aTexel> is ignored when the <hasVTexels>  
constructor parameter is FALSE.") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal NX,const Standard_ShortReal NY,const Standard_ShortReal NZ,const Standard_ShortReal TX,const Standard_ShortReal TY);
		%feature("autodoc", "Args:
	edgeNumber(Standard_Integer)

Returns:
	Standard_Integer

Adds a bound of length <edgeNumber> in the bound array  
returns the actual bounds number.") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber);
		%feature("autodoc", "Args:
	edgeNumber(Standard_Integer)
	aBColor(Quantity_Color)

Returns:
	Standard_Integer

Adds a bound of length <edgeNumber> and bound color  
<aBColor> in the bound array.  
returns the actual bounds number.  
 Warning: <aBColor> is ignored when the <hasBColors>  
constructor parameter is FALSE") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Quantity_Color & aBColor);
		%feature("autodoc", "Args:
	edgeNumber(Standard_Integer)
	R(Standard_Real)
	G(Standard_Real)
	B(Standard_Real)

Returns:
	Standard_Integer

Adds a bound of length <edgeNumber> and bound color  
coordinates in the bound array.  
returns the actual bounds number.  
 Warning: <R,G,B> are ignored when the <hasBColors>  
constructor parameter is FALSE") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("autodoc", "Args:
	vertexIndex(Standard_Integer)
	isVisible(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Adds an edge in the range [1,VertexNumber()] in the array,  
if <isVisible> is FALSE the edge between <vertexIndex> and  
the next edge will not be visible even if the SetEdgeOn() method  
is activated in Graphic3d_AspectFillArea3d class.  
returns the actual edges number.  
 Warning: <isVisible> is ignored when the <hasEdgeInfos>  
constructor parameter is FALSE.") AddEdge;
		Standard_Integer AddEdge (const Standard_Integer vertexIndex,const Standard_Boolean isVisible = Standard_True);
		%feature("autodoc", "Args:
	aNormal(gp_Dir)

Returns:
	Standard_Boolean

Orientate correctly all vertexs & normals of this array  
according to the <aNormal> parameter and  
returns TRUE when something has change in the array.  
 Warning: When the array has edges this method is apply  
on edge sub array instead on vertex sub array.") Orientate;
		Standard_Boolean Orientate (const gp_Dir & aNormal);
		%feature("autodoc", "Args:
	aBoundIndex(Standard_Integer)
	aNormal(gp_Dir)

Returns:
	Standard_Boolean

Orientate correctly all vertexs & normal of the bound <aBound>  
according to the <aNormal> parameter and  
returns TRUE when something has change in the array.  
 Warning: When the array has edges this method is apply  
on edge sub array instead on vertex sub array.  
When this array has no bound, <aBoundIndex> design the item number") Orientate;
		Standard_Boolean Orientate (const Standard_Integer aBoundIndex,const gp_Dir & aNormal);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aVertice(gp_Pnt)

Returns:
	None

Change the vertice of rank <anIndex> in the array.") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const gp_Pnt & aVertice);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	Z(Standard_ShortReal)

Returns:
	None

Change the vertice of rank <anIndex> in the array.") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aColor(Quantity_Color)

Returns:
	None

Change the vertex color of rank <anIndex> in the array.") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	R(Standard_Real)
	G(Standard_Real)
	B(Standard_Real)

Returns:
	None

Change the vertex color of rank <anIndex> in the array.") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aColor(Standard_Integer)

Returns:
	None

Change the vertex color of rank <anIndex> in the array.  
aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red  
On all architecture proccers type (x86 or SPARC) you can  
use this byte order.") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Integer aColor);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aNormal(gp_Dir)

Returns:
	None

Change the vertex normal of rank <anIndex> in the array.") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const gp_Dir & aNormal);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	NX(Standard_Real)
	NY(Standard_Real)
	NZ(Standard_Real)

Returns:
	None

Change the vertex normal of rank <anIndex> in the array.") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aTexel(gp_Pnt2d)

Returns:
	None

Change the vertex texel of rank <anIndex> in the array.") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const gp_Pnt2d & aTexel);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	TX(Standard_Real)
	TY(Standard_Real)

Returns:
	None

Change the vertex texel of rank <anIndex> in the array.") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const Standard_Real TX,const Standard_Real TY);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aColor(Quantity_Color)

Returns:
	None

Change the bound color of rank <anIndex> in the array.") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	R(Standard_Real)
	G(Standard_Real)
	B(Standard_Real)

Returns:
	None

Change the bound color of rank <anIndex> in the array.") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_PrimitiveArray

Returns the array address.") Array;
		Graphic3d_PrimitiveArray Array ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfPrimitiveArray

Returns the type of this primitive") Type;
		Graphic3d_TypeOfPrimitiveArray Type ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the string type of this primitive") StringType;
		char * StringType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when vertex normals array is defined.") HasVertexNormals;
		Standard_Boolean HasVertexNormals ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when vertex colors array is defined.") HasVertexColors;
		Standard_Boolean HasVertexColors ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when vertex texels array is defined.") HasVertexTexels;
		Standard_Boolean HasVertexTexels ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of defined vertex") VertexNumber;
		Standard_Integer VertexNumber ();
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	gp_Pnt

Returns the vertice at rank <aRank>  
from the vertex table if defined.") Vertice;
		gp_Pnt Vertice (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Returns the vertice coordinates at rank <aRank>  
from the vertex table if defined.") Vertice;
		void Vertice (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	Quantity_Color

Returns the vertex color at rank <aRank>  
from the vertex table if defined.") VertexColor;
		Quantity_Color VertexColor (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)
	R(Standard_Real)
	G(Standard_Real)
	B(Standard_Real)

Returns:
	None

Returns the vertex color values at rank <aRank>  
from the vertex table if defined.") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)
	aColor(Standard_Integer)

Returns:
	None

Returns the vertex color values at rank <aRank>  
from the vertex table if defined.") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	gp_Dir

Returns the vertex normal at rank <aRank>  
from the vertex table if defined.") VertexNormal;
		gp_Dir VertexNormal (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)
	NX(Standard_Real)
	NY(Standard_Real)
	NZ(Standard_Real)

Returns:
	None

Returns the vertex normal coordinates at rank <aRank>  
from the vertex table if defined.") VertexNormal;
		void VertexNormal (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	gp_Pnt2d

Returns the vertex texture at rank <aRank>  
from the vertex table if defined.") VertexTexel;
		gp_Pnt2d VertexTexel (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)
	TX(Standard_Real)
	TY(Standard_Real)

Returns:
	None

Returns the vertex texture coordinates at rank <aRank>  
from the vertex table if defined.") VertexTexel;
		void VertexTexel (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when edge visibillity array is defined.") HasEdgeInfos;
		Standard_Boolean HasEdgeInfos ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of defined edges") EdgeNumber;
		Standard_Integer EdgeNumber ();
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	Standard_Integer

Returns the vertex index at rank <aRank>  
in the range [1,VertexNumber()]") Edge;
		Standard_Integer Edge (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	Standard_Boolean

Returns TRUE when the edge at rank <aRank>  
is visible.") EdgeIsVisible;
		Standard_Boolean EdgeIsVisible (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when bound colors array is defined.") HasBoundColors;
		Standard_Boolean HasBoundColors ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of defined bounds") BoundNumber;
		Standard_Integer BoundNumber ();
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	Standard_Integer

Returns the edge number at rank <aRank>.") Bound;
		Standard_Integer Bound (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	Quantity_Color

Returns the bound color at rank <aRank>  
from the bound table if defined.") BoundColor;
		Quantity_Color BoundColor (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	aRank(Standard_Integer)
	R(Standard_Real)
	G(Standard_Real)
	B(Standard_Real)

Returns:
	None

Returns the bound color values at rank <aRank>  
from the bound table if defined.") BoundColor;
		void BoundColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of total items according to  
 the array type.") ItemNumber;
		Standard_Integer ItemNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE only when the contains of this array is  
available.") IsValid;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a context table for fill area primitives  
         defined with the following default values:  
 
         InteriorStyle       : IS_EMPTY  
         InteriorColor       : NOC_CYAN1  
         EdgeColor           : NOC_WHITE  
         EdgeLineType        : TOL_SOLID  
         EdgeWidth           : 1.0  
         FrontMaterial       : NOM_BRASS  
         BackMaterial        : NOM_BRASS  
 
         Display of back-facing filled polygons.  
         No distinction between external and internal  
         faces of FillAreas.  
         The edges are not drawn.  
         Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d ();
		%feature("autodoc", "Args:
	Interior(Aspect_InteriorStyle)
	InteriorColor(Quantity_Color)
	EdgeColor(Quantity_Color)
	EdgeLineType(Aspect_TypeOfLine)
	EdgeWidth(Standard_Real)
	FrontMaterial(Graphic3d_MaterialAspect)
	BackMaterial(Graphic3d_MaterialAspect)

Returns:
	None

Creates a context table for fill area primitives  
         defined with the specified values.  
 
         Display of back-facing filled polygons.  
         No distinction between external and internal  
         faces of FillAreas.  
         The edges are not drawn.  
         Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.  
Warning  
EdgeWidth is the 'line width scale factor'.   The  
nominal line width is 1 pixel.   The width of the line is  
determined by applying the line width scale factor to  
this nominal line width.   The supported line widths  
vary by 1-pixel units.") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d (const Aspect_InteriorStyle Interior,const Quantity_Color & InteriorColor,const Quantity_Color & EdgeColor,const Aspect_TypeOfLine EdgeLineType,const Standard_Real EdgeWidth,const Graphic3d_MaterialAspect & FrontMaterial,const Graphic3d_MaterialAspect & BackMaterial);
		%feature("autodoc", "Args:
	None
Returns:
	None

Allows the display of back-facing filled  
         polygons.") AllowBackFace;
		void AllowBackFace ();
		%feature("autodoc", "Args:
	AMaterial(Graphic3d_MaterialAspect)

Returns:
	None

Modifies the surface material of internal faces") SetBackMaterial;
		void SetBackMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("autodoc", "Args:
	None
Returns:
	None

Allows distinction between external and internal  
         faces of FillAreas.") SetDistinguishOn;
		void SetDistinguishOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Forbids distinction between external and internal  
         faces of FillAreas.") SetDistinguishOff;
		void SetDistinguishOff ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The edges of FillAreas are drawn.") SetEdgeOn;
		void SetEdgeOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The edges of FillAreas are not drawn.") SetEdgeOff;
		void SetEdgeOff ();
		%feature("autodoc", "Args:
	AMaterial(Graphic3d_MaterialAspect)

Returns:
	None

Modifies the surface material of external faces") SetFrontMaterial;
		void SetFrontMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppress the display of back-facing filled  
         polygons.  
         A back-facing polygon is defined as a polygon whose  
         vertices are in a clockwise order with respect  
         to screen coordinates.") SuppressBackFace;
		void SuppressBackFace ();
		%feature("autodoc", "Args:
	ATexture(Handle_Graphic3d_TextureMap)

Returns:
	None

No detailed docstring for this function.") SetTextureMap;
		void SetTextureMap (const Handle_Graphic3d_TextureMap & ATexture);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)
	aFactor(Standard_ShortReal)=1.0
	aUnits(Standard_ShortReal)=0.0

Returns:
	None

Sets up OpenGL polygon offsets mechanism.  
         <aMode> parameter can contain various combinations of  
         Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means  
         that polygon offsets are not changed).  
         If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits>  
         arguments are used by graphic renderer to calculate a depth offset value:  
 
         offset = <aFactor> * m + <aUnits> * r, where  
         m - maximum depth slope for the polygon currently being displayed,  
         r - minimum window coordinates depth resolution (implementation-specific)  
 
         Deafult settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0.  
 
         Negative offset values move polygons closer to the viewport,  
         while positive values shift polygons away.  
         Consult OpenGL reference for details (glPolygonOffset function description).") SetPolygonOffsets;
		void SetPolygonOffsets (const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0);
		%feature("autodoc", "Args:
	theProgram(Graphic3d_ShaderProgram_Handle)

Returns:
	None

Sets up OpenGL/GLSL shader program.") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Back Face Removal status.  
         Standard_True if SuppressBackFace is activated.") BackFace;
		Standard_Boolean BackFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Distinguish Mode status.") Distinguish;
		Standard_Boolean Distinguish ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the edges are drawn and  
         Standard_False if the edges are not drawn.") Edge;
		Standard_Boolean Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_MaterialAspect

Returns the surface material of internal faces") BackMaterial;
		Graphic3d_MaterialAspect BackMaterial ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_MaterialAspect

Returns the surface material of external faces") FrontMaterial;
		Graphic3d_MaterialAspect FrontMaterial ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_TextureMap

No detailed docstring for this function.") TextureMap;
		Handle_Graphic3d_TextureMap TextureMap ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") TextureMapState;
		Standard_Boolean TextureMapState ();
		%feature("autodoc", "Args:
	aMode(Standard_Integer)
	aFactor(Standard_ShortReal)
	aUnits(Standard_ShortReal)

Returns:
	None

Returns current polygon offsets settings.") PolygonOffsets;
		void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_ShaderProgram_Handle

No detailed docstring for this function.") ShaderProgram;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a context table for line primitives  
//!	    defined with the following default values:  
 
//!	    Colour	: NOC_YELLOW  
//!	    Line type	: TOL_SOLID  
//!	    Width	: 1.0") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d ();
		%feature("autodoc", "Args:
	AColor(Quantity_Color)
	AType(Aspect_TypeOfLine)
	AWidth(Standard_Real)

Returns:
	None

Creates a context table for line primitives  
//!	    defined with the specified values.  
 Warning: <AWidth> is the 'linewidth scale factor'.  
//!	    The nominal line width is 1 pixel. The width of  
//!	    the line is determined by applying the linewidth scale  
//!	    factor to this nominal line width.  
//!	    The supported linewidths vary by 1-pixel units.") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d (const Quantity_Color & AColor,const Aspect_TypeOfLine AType,const Standard_Real AWidth);
		%feature("autodoc", "Args:
	theProgram(Graphic3d_ShaderProgram_Handle)

Returns:
	None

Sets up OpenGL/GLSL shader program.") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_ShaderProgram_Handle

No detailed docstring for this function.") ShaderProgram;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a context table for marker primitives  
         defined with the following default values:  
 
         Marker type : TOM_X  
         Colour      : YELLOW  
         Scale factor: 1.0") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d ();
		%feature("autodoc", "Args:
	theType(Aspect_TypeOfMarker)
	theColor(Quantity_Color)
	theScale(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Aspect_TypeOfMarker theType,const Quantity_Color & theColor,const Standard_Real theScale);
		%feature("autodoc", "Args:
	theColor(Quantity_Color)
	theWidth(Standard_Integer)
	theHeight(Standard_Integer)
	theTextureBitmap(Handle_TColStd_HArray1OfByte)

Returns:
	None

Creates a context table for marker primitives  
         defined with the specified values.") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Quantity_Color & theColor,const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTextureBitmap);
		%feature("autodoc", "Args:
	theTextureImage(Image_PixMap_Handle)

Returns:
	None

Creates a context table for marker primitives  
         defined with the specified values.") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Image_PixMap_Handle & theTextureImage);
		%feature("autodoc", "Args:
	theWidth(Standard_Integer)
	theHeight(Standard_Integer)

Returns:
	None

Returns marker's texture size.") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_MarkerImage_Handle

Returns marker's image texture.  
Could be null handle if marker aspect has been initialized as  
default type of marker.") GetMarkerImage;
		const Graphic3d_MarkerImage_Handle & GetMarkerImage ();
		%feature("autodoc", "Args:
	theWidth(Standard_Integer)
	theHeight(Standard_Integer)
	theTexture(Handle_TColStd_HArray1OfByte)

Returns:
	None

No detailed docstring for this function.") SetBitMap;
		void SetBitMap (const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTexture);
		%feature("autodoc", "Args:
	theProgram(Graphic3d_ShaderProgram_Handle)

Returns:
	None

Sets up OpenGL/GLSL shader program.") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_ShaderProgram_Handle

No detailed docstring for this function.") ShaderProgram;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a context table for text primitives  
     defined with the following default values:  
 
     Colour                    : NOC_YELLOW  
     Font                      : NOF_ASCII_MONO  
     Expansion factor          : 1.  
     Space between characters  : 0.  
     The style                 : TOST_NORMAL  
     The display type          : TODT_NORMAL") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d ();
		%feature("autodoc", "Args:
	AColor(Quantity_Color)
	AFont(char *)
	AExpansionFactor(Standard_Real)
	ASpace(Standard_Real)
	AStyle(Aspect_TypeOfStyleText)=Aspect_TOST_NORMAL
	ADisplayType(Aspect_TypeOfDisplayText)=Aspect_TODT_NORMAL

Returns:
	None

Creates a context table for text primitives  
     defined with the specified values.  
         AFont may be to take means from User(example 'Courier New')  
     or Font name defined in Font_NameOfFont(example Font_NOF_ASCII_MONO)  
     or use default font('Courier')") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d (const Quantity_Color & AColor,const char * AFont,const Standard_Real AExpansionFactor,const Standard_Real ASpace,const Aspect_TypeOfStyleText AStyle = Aspect_TOST_NORMAL,const Aspect_TypeOfDisplayText ADisplayType = Aspect_TODT_NORMAL);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the colour of <self>.") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AFactor(Standard_Real)

Returns:
	None

Modifies the expansion factor (height/width ratio)  
 If the factor is less than 1, the characters will  
 be higher than they are wide.") SetExpansionFactor;
		void SetExpansionFactor (const Standard_Real AFactor);
		%feature("autodoc", "Args:
	AFont(char *)

Returns:
	None

Modifies the font of <self>.") SetFont;
		void SetFont (const char * AFont);
		%feature("autodoc", "Args:
	ASpace(Standard_Real)

Returns:
	None

Modifies the space between the characters.") SetSpace;
		void SetSpace (const Standard_Real ASpace);
		%feature("autodoc", "Args:
	AStyle(Aspect_TypeOfStyleText)

Returns:
	None

Modifies the style of the text.  
     TOST_NORMAL     Default text. The text is displayed like any other graphic object.  
             This text can be hidden by another object that is nearest from the  
             point of view.  
     TOST_ANNOTATION The text is always visible. The texte is displayed  
             over the other object according to the priority.") SetStyle;
		void SetStyle (const Aspect_TypeOfStyleText AStyle);
		%feature("autodoc", "Args:
	ADisplayType(Aspect_TypeOfDisplayText)

Returns:
	None

Define the display type of the text.  
 
     TODT_NORMAL     Default display. Text only.  
     TODT_SUBTITLE   There is a subtitle under the text.  
     TODT_DEKALE     The text is displayed with a 3D style.  
     TODT_BLEND      The text is displayed in XOR.  
     TODT_DIMENSION  Dimension line under text will be invisible.") SetDisplayType;
		void SetDisplayType (const Aspect_TypeOfDisplayText ADisplayType);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the colour of the subtitle for the TODT_SUBTITLE TextDisplayType  
        and the colour of backgroubd for the TODT_DEKALE TextDisplayType.") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AFlag(Standard_Boolean)

Returns:
	None

Turns usage of text zoomable on/off") SetTextZoomable;
		void SetTextZoomable (const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when the Text Zoomable is on.") GetTextZoomable;
		Standard_Boolean GetTextZoomable ();
		%feature("autodoc", "Args:
	AAngle(Standard_Real)

Returns:
	None

Turns usage of text rotated") SetTextAngle;
		void SetTextAngle (const Standard_Real AAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns Angle of degree") GetTextAngle;
		Standard_Real GetTextAngle ();
		%feature("autodoc", "Args:
	AFontAspect(Font_FontAspect)

Returns:
	None

Turns usage of Aspect text") SetTextFontAspect;
		void SetTextFontAspect (const Font_FontAspect AFontAspect);
		%feature("autodoc", "Args:
	None
Returns:
	Font_FontAspect

Returns text FontAspect") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect ();
		%feature("autodoc", "Args:
	theProgram(Graphic3d_ShaderProgram_Handle)

Returns:
	None

Sets up OpenGL/GLSL shader program.") SetShaderProgram;
		void SetShaderProgram (const Graphic3d_ShaderProgram_Handle & theProgram);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_ShaderProgram_Handle

No detailed docstring for this function.") ShaderProgram;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_CGraduatedTrihedron;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

//!< flag to mark head light
Const attenuation factor of positional light source") ConstAttenuation;
		Standard_ShortReal ConstAttenuation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

Linear attenuation factor of positional light source") LinearAttenuation;
		Standard_ShortReal LinearAttenuation ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vec2

Const, Linear attenuation factors of positional light source") Attenuation;
		Graphic3d_Vec2 Attenuation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

Angle in radians of the cone created by the spot") Angle;
		Standard_ShortReal Angle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

Intensity distribution of the spot light, with 0..1 range.") Concentration;
		Standard_ShortReal Concentration ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeConstAttenuation;
		Standard_ShortReal & ChangeConstAttenuation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeLinearAttenuation;
		Standard_ShortReal & ChangeLinearAttenuation ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vec2

No detailed docstring for this function.") ChangeAttenuation;
		Graphic3d_Vec2 & ChangeAttenuation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeAngle;
		Standard_ShortReal & ChangeAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeConcentration;
		Standard_ShortReal & ChangeConcentration ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") Graphic3d_CLight;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_CTexture;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_CView;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Deletes the manager <self>.") Destroy;
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
		%feature("autodoc", "Args:
	theDisplayConnection(Aspect_DisplayConnection_Handle)

Returns:
	virtual Standard_Boolean

Starts graphic driver with given connection") Begin;
		virtual Standard_Boolean Begin (const Aspect_DisplayConnection_Handle & theDisplayConnection);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_end") End;
		virtual void End ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

call_togl_inquirelight") InquireLightLimit;
		virtual Standard_Integer InquireLightLimit ();
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AMatO(TColStd_Array2OfReal)
	AMatM(TColStd_Array2OfReal)

Returns:
	virtual void

call_togl_inquiremat") InquireMat;
		virtual void InquireMat (const Graphic3d_CView & ACView,TColStd_Array2OfReal & AMatO,TColStd_Array2OfReal & AMatM);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

call_togl_inquireplane") InquirePlaneLimit;
		virtual Standard_Integer InquirePlaneLimit ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

call_togl_inquireview") InquireViewLimit;
		virtual Standard_Integer InquireViewLimit ();
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)
	Create(Standard_Boolean)

Returns:
	virtual void

call_togl_blink") Blink;
		virtual void Blink (const Graphic3d_CStructure & ACStructure,const Standard_Boolean Create);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)
	Create(Standard_Boolean)

Returns:
	virtual void

call_togl_boundarybox") BoundaryBox;
		virtual void BoundaryBox (const Graphic3d_CStructure & ACStructure,const Standard_Boolean Create);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)
	R(Standard_ShortReal)
	G(Standard_ShortReal)
	B(Standard_ShortReal)
	Create(Standard_Boolean)

Returns:
	virtual void

call_togl_highlightcolor") HighlightColor;
		virtual void HighlightColor (const Graphic3d_CStructure & ACStructure,const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B,const Standard_Boolean Create);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_namesetstructure") NameSetStructure;
		virtual void NameSetStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)

Returns:
	virtual void

call_togl_cleargroup") ClearGroup;
		virtual void ClearGroup (const Graphic3d_CGroup & ACGroup);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	NoInsert(Standard_Integer)

Returns:
	virtual void

call_togl_facecontextgroup") FaceContextGroup;
		virtual void FaceContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)

Returns:
	virtual void

call_togl_group") Group;
		virtual void Group (Graphic3d_CGroup & ACGroup);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	NoInsert(Standard_Integer)

Returns:
	virtual void

call_togl_linecontextgroup") LineContextGroup;
		virtual void LineContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	NoInsert(Standard_Integer)

Returns:
	virtual void

call_togl_markercontextgroup") MarkerContextGroup;
		virtual void MarkerContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)

Returns:
	virtual void

call_togl_removegroup") RemoveGroup;
		virtual void RemoveGroup (const Graphic3d_CGroup & ACGroup);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	NoInsert(Standard_Integer)

Returns:
	virtual void

call_togl_textcontextgroup") TextContextGroup;
		virtual void TextContextGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer NoInsert);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_clearstructure") ClearStructure;
		virtual void ClearStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	AFather(Graphic3d_CStructure)
	ASon(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_connect") Connect;
		virtual void Connect (const Graphic3d_CStructure & AFather,const Graphic3d_CStructure & ASon);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_contextstructure") ContextStructure;
		virtual void ContextStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	AFather(Graphic3d_CStructure)
	ASon(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_disconnect") Disconnect;
		virtual void Disconnect (const Graphic3d_CStructure & AFather,const Graphic3d_CStructure & ASon);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	ACStructure(Graphic3d_CStructure)
	APriority(Standard_Integer)

Returns:
	virtual void

call_togl_displaystructure") DisplayStructure;
		virtual void DisplayStructure (const Graphic3d_CView & ACView,const Graphic3d_CStructure & ACStructure,const Standard_Integer APriority);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_erasestructure") EraseStructure;
		virtual void EraseStructure (const Graphic3d_CView & ACView,const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_removestructure") RemoveStructure;
		virtual void RemoveStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_structure") Structure;
		virtual void Structure (Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_activateview") ActivateView;
		virtual void ActivateView (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AFlag(Standard_Boolean)

Returns:
	virtual void

call_togl_antialiasing") AntiAliasing;
		virtual void AntiAliasing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_background") Background;
		virtual void Background (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AColor1(Quantity_Color)
	AColor2(Quantity_Color)
	FillStyle(Aspect_GradientFillMethod)

Returns:
	virtual void

call_togl_gradient_background") GradientBackground;
		virtual void GradientBackground (const Graphic3d_CView & ACView,const Quantity_Color & AColor1,const Quantity_Color & AColor2,const Aspect_GradientFillMethod FillStyle);
		%feature("autodoc", "Args:
	FileName(char *)
	ACView(Graphic3d_CView)
	FillStyle(Aspect_FillMethod)

Returns:
	virtual void

No detailed docstring for this function.") BackgroundImage;
		virtual void BackgroundImage (const char * FileName,const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	FillStyle(Aspect_FillMethod)

Returns:
	virtual void

No detailed docstring for this function.") SetBgImageStyle;
		virtual void SetBgImageStyle (const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	FillStyle(Aspect_GradientFillMethod)

Returns:
	virtual void

No detailed docstring for this function.") SetBgGradientStyle;
		virtual void SetBgGradientStyle (const Graphic3d_CView & ACView,const Aspect_GradientFillMethod FillStyle);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AWait(Standard_Boolean)

Returns:
	virtual void

call_togl_cliplimit") ClipLimit;
		virtual void ClipLimit (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_deactivateview") DeactivateView;
		virtual void DeactivateView (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AFlag(Standard_Boolean)

Returns:
	virtual void

call_togl_cliplimit") DepthCueing;
		virtual void DepthCueing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AX(Standard_ShortReal)
	AY(Standard_ShortReal)
	AZ(Standard_ShortReal)
	AU(Standard_Integer)
	AV(Standard_Integer)

Returns:
	virtual Standard_Boolean

call_togl_unproject_raster") ProjectRaster;
		virtual Standard_Boolean ProjectRaster (const Graphic3d_CView & ACView,const Standard_ShortReal AX,const Standard_ShortReal AY,const Standard_ShortReal AZ,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	Axm(Standard_Integer)
	Aym(Standard_Integer)
	AXM(Standard_Integer)
	AYM(Standard_Integer)
	AU(Standard_Integer)
	AV(Standard_Integer)
	AX(Standard_ShortReal)
	AY(Standard_ShortReal)
	AZ(Standard_ShortReal)

Returns:
	virtual Standard_Boolean

call_togl_unproject_raster") UnProjectRaster;
		virtual Standard_Boolean UnProjectRaster (const Graphic3d_CView & ACView,const Standard_Integer Axm,const Standard_Integer Aym,const Standard_Integer AXM,const Standard_Integer AYM,const Standard_Integer AU,const Standard_Integer AV,Standard_ShortReal & AX,Standard_ShortReal & AY,Standard_ShortReal & AZ);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	Axm(Standard_Integer)
	Aym(Standard_Integer)
	AXM(Standard_Integer)
	AYM(Standard_Integer)
	AU(Standard_Integer)
	AV(Standard_Integer)
	AX(Standard_ShortReal)
	AY(Standard_ShortReal)
	AZ(Standard_ShortReal)
	DX(Standard_ShortReal)
	DY(Standard_ShortReal)
	DZ(Standard_ShortReal)

Returns:
	virtual Standard_Boolean

call_togl_unproject_raster_with_ray") UnProjectRasterWithRay;
		virtual Standard_Boolean UnProjectRasterWithRay (const Graphic3d_CView & ACView,const Standard_Integer Axm,const Standard_Integer Aym,const Standard_Integer AXM,const Standard_Integer AYM,const Standard_Integer AU,const Standard_Integer AV,Standard_ShortReal & AX,Standard_ShortReal & AY,Standard_ShortReal & AZ,Standard_ShortReal & DX,Standard_ShortReal & DY,Standard_ShortReal & DZ);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_ratio_window") RatioWindow;
		virtual void RatioWindow (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	ACUnderLayer(Aspect_CLayer2d)
	ACOverLayer(Aspect_CLayer2d)
	x(Standard_Integer)=0
	y(Standard_Integer)=0
	width(Standard_Integer)=0
	height(Standard_Integer)=0

Returns:
	virtual void

call_togl_redraw  
 Warning: when the redraw area has a null size, the full view is redrawn") Redraw;
		virtual void Redraw (const Graphic3d_CView & ACView,const Aspect_CLayer2d & ACUnderLayer,const Aspect_CLayer2d & ACOverLayer,const Standard_Integer x = 0,const Standard_Integer y = 0,const Standard_Integer width = 0,const Standard_Integer height = 0);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_removeview") RemoveView;
		virtual void RemoveView (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_setlight") SetLight;
		virtual void SetLight (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	theCView(Graphic3d_CView)

Returns:
	virtual void

Pass clip planes to the associated graphic driver view.") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_CView & theCView);
		%feature("autodoc", "Args:
	theCStructure(Graphic3d_CStructure)

Returns:
	virtual void

Pass clip planes to the associated graphic driver structure.") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_CStructure & theCStructure);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_setvisualisation") SetVisualisation;
		virtual void SetVisualisation (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_transformstructure") TransformStructure;
		virtual void TransformStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AFlag(Standard_Boolean)

Returns:
	virtual void

call_togl_transparency") Transparency;
		virtual void Transparency (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	ACUnderLayer(Aspect_CLayer2d)
	ACOverLayer(Aspect_CLayer2d)

Returns:
	virtual void

call_togl_update") Update;
		virtual void Update (const Graphic3d_CView & ACView,const Aspect_CLayer2d & ACUnderLayer,const Aspect_CLayer2d & ACOverLayer);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual Standard_Boolean

call_togl_view") View;
		virtual Standard_Boolean View (Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AWait(Standard_Boolean)

Returns:
	virtual void

call_togl_viewmapping") ViewMapping;
		virtual void ViewMapping (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AWait(Standard_Boolean)

Returns:
	virtual void

call_togl_vieworientation") ViewOrientation;
		virtual void ViewOrientation (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

No detailed docstring for this function.") Environment;
		virtual void Environment (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	theCGroup(Graphic3d_CGroup)
	theIsEnabled(Standard_Boolean)

Returns:
	virtual void

sets the stencil test to theIsEnabled state;") SetStencilTestOptions;
		virtual void SetStencilTestOptions (const Graphic3d_CGroup & theCGroup,const Standard_Boolean theIsEnabled);
		%feature("autodoc", "Args:
	theCGroup(Graphic3d_CGroup)
	theIsEnabled(Standard_Boolean)
	theRefPlane(gp_Ax2)

Returns:
	virtual void

sets the flipping to theIsEnabled state for the given graphic group.") SetFlippingOptions;
		virtual void SetFlippingOptions (const Graphic3d_CGroup & theCGroup,const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	AText(char *)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	AAngle(Quantity_PlaneAngle)
	ATp(Graphic3d_TextPath)
	AHta(Graphic3d_HorizontalTextAlignment)
	AVta(Graphic3d_VerticalTextAlignment)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	virtual void

call_togl_text") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	AText(char *)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	virtual void

call_togl_text") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	AText(TCollection_ExtendedString)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	AAngle(Quantity_PlaneAngle)
	ATp(Graphic3d_TextPath)
	AHta(Graphic3d_HorizontalTextAlignment)
	AVta(Graphic3d_VerticalTextAlignment)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	virtual void

call_togl_text") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	AText(TCollection_ExtendedString)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	virtual void

call_togl_text") Text;
		virtual void Text (const Graphic3d_CGroup & ACGroup,const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	parray(Graphic3d_PrimitiveArray)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	virtual void

call_togl_parray") PrimitiveArray;
		virtual void PrimitiveArray (const Graphic3d_CGroup & ACGroup,const Graphic3d_PrimitiveArray & parray,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	AUserDraw(Graphic3d_CUserDraw)

Returns:
	virtual void

call_togl_userdraw") UserDraw;
		virtual void UserDraw (const Graphic3d_CGroup & ACGroup,const Graphic3d_CUserDraw & AUserDraw);
		%feature("autodoc", "Args:
	status(Standard_Boolean)

Returns:
	virtual void

enables/disables usage of OpenGL vertex buffer arrays while drawing primitiev arrays") EnableVBO;
		virtual void EnableVBO (const Standard_Boolean status);
		%feature("autodoc", "Args:
	theFreeBytes(Standard_Size)
	theInfo(TCollection_AsciiString)

Returns:
	virtual Standard_Boolean

Returns information about GPU memory usage.") MemoryInfo;
		virtual Standard_Boolean MemoryInfo (Standard_Size & theFreeBytes,TCollection_AsciiString & theInfo);
		%feature("autodoc", "Args:
	XColor(Quantity_NameOfColor)=Quantity_NOC_RED
	YColor(Quantity_NameOfColor)=Quantity_NOC_GREEN
	ZColor(Quantity_NameOfColor)=Quantity_NOC_BLUE1
	SizeRatio(Standard_Real)=0.8
	AxisDiametr(Standard_Real)=0.05
	NbFacettes(Standard_Integer)=12

Returns:
	virtual void

call_togl_ztriedron_setup") ZBufferTriedronSetup;
		virtual void ZBufferTriedronSetup (const Quantity_NameOfColor XColor = Quantity_NOC_RED,const Quantity_NameOfColor YColor = Quantity_NOC_GREEN,const Quantity_NameOfColor ZColor = Quantity_NOC_BLUE1,const Standard_Real SizeRatio = 0.8,const Standard_Real AxisDiametr = 0.05,const Standard_Integer NbFacettes = 12);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	APosition(Aspect_TypeOfTriedronPosition)=Aspect_TOTP_CENTER
	AColor(Quantity_NameOfColor)=Quantity_NOC_WHITE
	AScale(Standard_Real)=0.02
	AsWireframe(Standard_Boolean)=Standard_True

Returns:
	virtual void

call_togl_triedron_display") TriedronDisplay;
		virtual void TriedronDisplay (const Graphic3d_CView & ACView,const Aspect_TypeOfTriedronPosition APosition = Aspect_TOTP_CENTER,const Quantity_NameOfColor AColor = Quantity_NOC_WHITE,const Standard_Real AScale = 0.02,const Standard_Boolean AsWireframe = Standard_True);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual void

call_togl_triedron_erase") TriedronErase;
		virtual void TriedronErase (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AType(Aspect_TypeOfTriedronEcho)=Aspect_TOTE_NONE

Returns:
	virtual void

call_togl_triedron_echo") TriedronEcho;
		virtual void TriedronEcho (const Graphic3d_CView & ACView,const Aspect_TypeOfTriedronEcho AType = Aspect_TOTE_NONE);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	cubic(Graphic3d_CGraduatedTrihedron)

Returns:
	virtual void

call_togl_graduatedtrihedron_display") GraduatedTrihedronDisplay;
		virtual void GraduatedTrihedronDisplay (const Graphic3d_CView & view,const Graphic3d_CGraduatedTrihedron & cubic);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)

Returns:
	virtual void

call_togl_graduatedtrihedron_erase") GraduatedTrihedronErase;
		virtual void GraduatedTrihedronErase (const Graphic3d_CView & view);
		%feature("autodoc", "Args:
	xmin(Standard_ShortReal)
	ymin(Standard_ShortReal)
	zmin(Standard_ShortReal)
	xmax(Standard_ShortReal)
	ymax(Standard_ShortReal)
	zmax(Standard_ShortReal)

Returns:
	virtual void

call_togl_graduatedtrihedron_minmaxvalues") GraduatedTrihedronMinMaxValues;
		virtual void GraduatedTrihedronMinMaxValues (const Standard_ShortReal xmin,const Standard_ShortReal ymin,const Standard_ShortReal zmin,const Standard_ShortReal xmax,const Standard_ShortReal ymax,const Standard_ShortReal zmax);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)

Returns:
	virtual Standard_Boolean

call_togl_begin_ajout_mode") BeginAddMode;
		virtual Standard_Boolean BeginAddMode (const Graphic3d_CView & ACView);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_end_ajout_mode") EndAddMode;
		virtual void EndAddMode ();
		%feature("autodoc", "Args:
	theCView(Graphic3d_CView)
	theDrawToFrontBuffer(Standard_Boolean)

Returns:
	virtual Standard_Boolean

@param theDrawToFrontBuffer Advanced option to modify rendering mode:  
1. TRUE.  Drawing immediate mode structures directly to the front buffer over the scene image.  
   Fast, so preferred for interactive work (used by default).  
   However these extra drawings will be missed in image dump since it is performed from back buffer.  
   Notice that since no pre-buffering used the V-Sync will be ignored and rendering could be seen  
   in run-time (in case of slow hardware) and/or tearing may appear.  
   So this is strongly recommended to draw only simple (fast) structures.  
2. FALSE. Drawing immediate mode structures to the back buffer.  
   The complete scene is redrawn first, so this mode is slower if scene contains complex data and/or V-Sync is turned on.  
   But it works in any case and is especially useful for view dump because the dump image is read from the back buffer.  
@return previous mode.") SetImmediateModeDrawToFront;
		virtual Standard_Boolean SetImmediateModeDrawToFront (const Graphic3d_CView & theCView,const Standard_Boolean theDrawToFrontBuffer);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	ACUnderLayer(Aspect_CLayer2d)
	ACOverLayer(Aspect_CLayer2d)
	DoubleBuffer(Standard_Boolean)
	RetainMode(Standard_Boolean)

Returns:
	virtual Standard_Boolean

call_togl_begin_immediat_mode") BeginImmediatMode;
		virtual Standard_Boolean BeginImmediatMode (const Graphic3d_CView & ACView,const Aspect_CLayer2d & ACUnderLayer,const Aspect_CLayer2d & ACOverLayer,const Standard_Boolean DoubleBuffer,const Standard_Boolean RetainMode);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	aFlush(Standard_Boolean)=Standard_True

Returns:
	virtual void

call_togl_clear_immediat_mode") ClearImmediatMode;
		virtual void ClearImmediatMode (const Graphic3d_CView & ACView,const Standard_Boolean aFlush = Standard_True);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)

Returns:
	virtual void

call_togl_draw_structure") DrawStructure;
		virtual void DrawStructure (const Graphic3d_CStructure & ACStructure);
		%feature("autodoc", "Args:
	Synchronize(Standard_Integer)

Returns:
	virtual void

call_togl_end_immediat_mode") EndImmediatMode;
		virtual void EndImmediatMode (const Standard_Integer Synchronize);
		%feature("autodoc", "Args:
	ACLayer(Aspect_CLayer2d)

Returns:
	virtual void

call_togl_layer2d") Layer;
		virtual void Layer (Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "Args:
	ACLayer(Aspect_CLayer2d)

Returns:
	virtual void

call_togl_removelayer2d") RemoveLayer;
		virtual void RemoveLayer (const Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "Args:
	ACLayer(Aspect_CLayer2d)

Returns:
	virtual void

call_togl_begin_layer2d") BeginLayer;
		virtual void BeginLayer (const Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_begin_polygon2d") BeginPolygon2d;
		virtual void BeginPolygon2d ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_begin_polyline2d") BeginPolyline2d;
		virtual void BeginPolyline2d ();
		%feature("autodoc", "Args:
	ACLayer(Aspect_CLayer2d)

Returns:
	virtual void

call_togl_clear_layer2d") ClearLayer;
		virtual void ClearLayer (const Aspect_CLayer2d & ACLayer);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)

Returns:
	virtual void

call_togl_draw2d") Draw;
		virtual void Draw (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)

Returns:
	virtual void

call_togl_edge2d") Edge;
		virtual void Edge (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_end_layer2d") EndLayer;
		virtual void EndLayer ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_end_polygon2d") EndPolygon2d;
		virtual void EndPolygon2d ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_end_polyline2d") EndPolyline2d;
		virtual void EndPolyline2d ();
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)

Returns:
	virtual void

call_togl_move2d") Move;
		virtual void Move (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("autodoc", "Args:
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	Width(Standard_ShortReal)
	Height(Standard_ShortReal)

Returns:
	virtual void

call_togl_rectangle2d") Rectangle;
		virtual void Rectangle (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Width,const Standard_ShortReal Height);
		%feature("autodoc", "Args:
	R(Standard_ShortReal)
	G(Standard_ShortReal)
	B(Standard_ShortReal)

Returns:
	virtual void

call_togl_set_color") SetColor;
		virtual void SetColor (const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B);
		%feature("autodoc", "Args:
	ATransparency(Standard_ShortReal)

Returns:
	virtual void

call_togl_set_transparency") SetTransparency;
		virtual void SetTransparency (const Standard_ShortReal ATransparency);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

call_togl_unset_transparency") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("autodoc", "Args:
	Type(Standard_Integer)
	Width(Standard_ShortReal)

Returns:
	virtual void

call_togl_set_line_attributes") SetLineAttributes;
		virtual void SetLineAttributes (const Standard_Integer Type,const Standard_ShortReal Width);
		%feature("autodoc", "Args:
	Font(char *)
	Type(Standard_Integer)
	R(Standard_ShortReal)
	G(Standard_ShortReal)
	B(Standard_ShortReal)

Returns:
	virtual void

Set text attributes for under-/overlayer.  
<Font> argument defines the name of the font to be used,  
<Type> argument defines the display type of the text,  
<R> <G> <B> values define the color of decal or subtitle background.  
To set the color of the text you can use the SetColor method.") SetTextAttributes;
		virtual void SetTextAttributes (const char * Font,const Standard_Integer Type,const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B);
		%feature("autodoc", "Args:
	AText(char *)
	X(Standard_ShortReal)
	Y(Standard_ShortReal)
	AHeight(Standard_ShortReal)

Returns:
	virtual void

call_togl_text2d  
If AHeight < 0 default text height is used by driver (DefaultTextHeight method)") Text;
		virtual void Text (const char * AText,const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal AHeight);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_ShortReal

No detailed docstring for this function.") DefaultTextHeight;
		virtual Standard_ShortReal DefaultTextHeight ();
		%feature("autodoc", "Args:
	AText(char *)
	AHeight(Standard_ShortReal)
	AWidth(Standard_ShortReal)
	AnAscent(Standard_ShortReal)
	ADescent(Standard_ShortReal)

Returns:
	virtual void

call_togl_textsize2d") TextSize;
		virtual void TextSize (const char * AText,const Standard_ShortReal AHeight,Standard_ShortReal & AWidth,Standard_ShortReal & AnAscent,Standard_ShortReal & ADescent);
		%feature("autodoc", "Args:
	aView(Graphic3d_CView)

Returns:
	virtual void

call_togl_backfacing") SetBackFacingModel;
		virtual void SetBackFacingModel (const Graphic3d_CView & aView);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	isEnabled(Standard_Boolean)

Returns:
	virtual void

call_togl_depthtest") SetDepthTestEnabled;
		virtual void SetDepthTestEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)

Returns:
	virtual Standard_Boolean

call_togl_isdepthtest") IsDepthTestEnabled;
		virtual Standard_Boolean IsDepthTestEnabled (const Graphic3d_CView & view);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	x(Standard_Integer)
	y(Standard_Integer)
	width(Standard_Integer)
	height(Standard_Integer)
	buffer(Standard_Address)

Returns:
	virtual void

Reads depths of shown pixels of the given  
         rectangle (glReadPixels with GL_DEPTH_COMPONENT)") ReadDepths;
		virtual void ReadDepths (const Graphic3d_CView & view,const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height,const Standard_Address buffer);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	width(Standard_Integer)
	height(Standard_Integer)

Returns:
	virtual Graphic3d_PtrFrameBuffer

Generate offscreen FBO in the graphic library.  
         If not supported on hardware returns NULL.") FBOCreate;
		virtual Graphic3d_PtrFrameBuffer FBOCreate (const Graphic3d_CView & view,const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	fboPtr(Graphic3d_PtrFrameBuffer)

Returns:
	virtual void

Remove offscreen FBO from the graphic library") FBORelease;
		virtual void FBORelease (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	fboPtr(Graphic3d_PtrFrameBuffer)
	width(Standard_Integer)
	height(Standard_Integer)
	widthMax(Standard_Integer)
	heightMax(Standard_Integer)

Returns:
	virtual void

Read offscreen FBO configuration.") FBOGetDimensions;
		virtual void FBOGetDimensions (const Graphic3d_CView & view,const Graphic3d_PtrFrameBuffer fboPtr,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	fboPtr(Graphic3d_PtrFrameBuffer)
	width(Standard_Integer)
	height(Standard_Integer)

Returns:
	virtual void

Change offscreen FBO viewport.") FBOChangeViewport;
		virtual void FBOChangeViewport (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr,const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "Args:
	theCView(Graphic3d_CView)
	theImage(Image_PixMap)
	theBufferType(Graphic3d_BufferType)

Returns:
	virtual Standard_Boolean

Dump active rendering buffer into specified memory buffer.") BufferDump;
		virtual Standard_Boolean BufferDump (const Graphic3d_CView & theCView,Image_PixMap & theImage,const Graphic3d_BufferType & theBufferType);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)
	isEnabled(Standard_Boolean)

Returns:
	virtual void

call_togl_gllight") SetGLLightEnabled;
		virtual void SetGLLightEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("autodoc", "Args:
	view(Graphic3d_CView)

Returns:
	virtual Standard_Boolean

call_togl_isgllight") IsGLLightEnabled;
		virtual Standard_Boolean IsGLLightEnabled (const Graphic3d_CView & view);
		%feature("autodoc", "Args:
	theFileName(char *)
	theFormat(Graphic3d_ExportFormat)
	theSortType(Graphic3d_SortType)
	theWidth(Standard_Integer)
	theHeight(Standard_Integer)
	theView(Graphic3d_CView)
	theLayerUnder(Aspect_CLayer2d)
	theLayerOver(Aspect_CLayer2d)
	thePrecision(Standard_Real)=0.005
	theProgressBarFunc(Standard_Address)=NULL
	theProgressObject(Standard_Address)=NULL

Returns:
	virtual Standard_Boolean

Export scene into the one of the Vector graphics formats (SVG, PS, PDF...).  
In contrast to Bitmaps, Vector graphics is scalable (so you may got quality benefits on printing to laser printer).  
Notice however that results may differ a lot and do not contain some elements.") Export;
		virtual Standard_Boolean Export (const char * theFileName,const Graphic3d_ExportFormat theFormat,const Graphic3d_SortType theSortType,const Standard_Integer theWidth,const Standard_Integer theHeight,const Graphic3d_CView & theView,const Aspect_CLayer2d & theLayerUnder,const Aspect_CLayer2d & theLayerOver,const Standard_Real thePrecision = 0.005,const Standard_Address theProgressBarFunc = NULL,const Standard_Address theProgressObject = NULL);
		%feature("autodoc", "Args:
	theCView(Graphic3d_CView)
	theLayerId(Standard_Integer)

Returns:
	virtual void

Add a new top-level z layer with ID <theLayerId> for  
the view. Z layers allow drawing structures in higher layers  
in foreground of structures in lower layers. To add a structure  
to desired layer on display it is necessary to set the layer  
ID for the structure.") AddZLayer;
		virtual void AddZLayer (const Graphic3d_CView & theCView,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theCView(Graphic3d_CView)
	theLayerId(Standard_Integer)

Returns:
	virtual void

Remove Z layer from the specified view. All structures  
displayed at the moment in layer will be displayed in default layer  
( the bottom-level z layer ). To unset layer ID from associated  
structures use method UnsetZLayer (...).") RemoveZLayer;
		virtual void RemoveZLayer (const Graphic3d_CView & theCView,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	virtual void

Unset Z layer ID for all structures. The structure  
indexes will be set to default layer ( the bottom-level z layer  
with ID = 0 ).") UnsetZLayer;
		virtual void UnsetZLayer (const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theCStructure(Graphic3d_CStructure)
	theLayerId(Standard_Integer)

Returns:
	virtual void

Change Z layer of a structure. The new z layer ID will  
be used to define the associated layer for structure on display.") ChangeZLayer;
		virtual void ChangeZLayer (const Graphic3d_CStructure & theCStructure,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theCStructure(Graphic3d_CStructure)
	theCView(Graphic3d_CView)
	theNewLayerId(Standard_Integer)

Returns:
	virtual void

Change Z layer of a structure already presented in view.") ChangeZLayer;
		virtual void ChangeZLayer (const Graphic3d_CStructure & theCStructure,const Graphic3d_CView & theCView,const Standard_Integer theNewLayerId);
		%feature("autodoc", "Args:
	theCStructure(Graphic3d_CStructure)

Returns:
	virtual Standard_Integer

Get Z layer ID of structure. If the structure doesn't  
exists in graphic driver, the method returns -1.") GetZLayer;
		virtual Standard_Integer GetZLayer (const Graphic3d_CStructure & theCStructure);
		%feature("autodoc", "Args:
	theCView(Graphic3d_CView)
	theLayerId(Standard_Integer)
	theSettings(Graphic3d_ZLayerSettings)

Returns:
	virtual void

Sets the settings for a single Z layer of specified view.") SetZLayerSettings;
		virtual void SetZLayerSettings (const Graphic3d_CView & theCView,const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("autodoc", "Args:
	AComment(char *)
	AValue(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") PrintBoolean;
		void PrintBoolean (const char * AComment,const Standard_Boolean AValue);
		%feature("autodoc", "Args:
	ACGroup(Graphic3d_CGroup)
	AField(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrintCGroup;
		void PrintCGroup (const Graphic3d_CGroup & ACGroup,const Standard_Integer AField);
		%feature("autodoc", "Args:
	ACLight(Graphic3d_CLight)
	AField(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrintCLight;
		void PrintCLight (const Graphic3d_CLight & ACLight,const Standard_Integer AField);
		%feature("autodoc", "Args:
	ACPick(Graphic3d_CPick)
	AField(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrintCPick;
		void PrintCPick (const Graphic3d_CPick & ACPick,const Standard_Integer AField);
		%feature("autodoc", "Args:
	ACStructure(Graphic3d_CStructure)
	AField(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrintCStructure;
		void PrintCStructure (const Graphic3d_CStructure & ACStructure,const Standard_Integer AField);
		%feature("autodoc", "Args:
	ACView(Graphic3d_CView)
	AField(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrintCView;
		void PrintCView (const Graphic3d_CView & ACView,const Standard_Integer AField);
		%feature("autodoc", "Args:
	AFunc(char *)

Returns:
	None

No detailed docstring for this function.") PrintFunction;
		void PrintFunction (const char * AFunc);
		%feature("autodoc", "Args:
	AComment(char *)
	AValue(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrintInteger;
		void PrintInteger (const char * AComment,const Standard_Integer AValue);
		%feature("autodoc", "Args:
	AFunc(char *)
	AResult(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrintIResult;
		void PrintIResult (const char * AFunc,const Standard_Integer AResult);
		%feature("autodoc", "Args:
	AComment(char *)
	AValue(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") PrintShortReal;
		void PrintShortReal (const char * AComment,const Standard_ShortReal AValue);
		%feature("autodoc", "Args:
	AComment(char *)
	AMatrix(TColStd_Array2OfReal)

Returns:
	None

No detailed docstring for this function.") PrintMatrix;
		void PrintMatrix (const char * AComment,const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "Args:
	AComment(char *)
	AString(char *)

Returns:
	None

No detailed docstring for this function.") PrintString;
		void PrintString (const char * AComment,const char * AString);
		%feature("autodoc", "Args:
	ALevel(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetTrace;
		void SetTrace (const Standard_Integer ALevel);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Trace;
		Standard_Integer Trace ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_DisplayConnection_Handle

returns Handle to display connection") GetDisplayConnection;
		const Aspect_DisplayConnection_Handle & GetDisplayConnection ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDeviceLost;
		Standard_Boolean IsDeviceLost ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ResetDeviceLostFlag;
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
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Creates a group in the structure <AStructure>.") Graphic3d_Group;
		 Graphic3d_Group (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	theUpdateStructureMgr(Standard_Boolean)=Standard_True

Returns:
	None

Supress all primitives and attributes of <self>.  
         To clear group without update in Graphic3d_StructureManager  
         pass Standard_False as <theUpdateStructureMgr>. This  
         used on context and viewer destruction, when the pointer  
         to structure manager in Graphic3d_Structure could be  
         already released (pointers are used here to avoid handle  
         cross-reference);") Clear;
		void Clear (const Standard_Boolean theUpdateStructureMgr = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Supress the group <self> in the structure.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Supress the group <self> in the structure.  
 Warning: No more graphic operations in <self> after this call.  Modifies the current modelling transform persistence (pan, zoom or rotate)  Get the current modelling transform persistence (pan, zoom or rotate)") Remove;
		void Remove ();
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectLine3d)

Returns:
	None

Modifies the current context of the group to give  
     another aspect for all the line primitives created  
     after this call in the group.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectFillArea3d)

Returns:
	None

Modifies the current context of the group to give  
     another aspect for all the face primitives created  
     after this call in the group.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectText3d)

Returns:
	None

Modifies the current context of the group to give  
     another aspect for all the text primitives created  
     after this call in the group.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectMarker3d)

Returns:
	None

Modifies the current context of the group to give  
     another aspect for all the marker primitives created  
     after this call in the group.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	ZMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	ZMax(Standard_Real)

Returns:
	None

Sets the coordinates of the boundary box of the  
     group <self>.") SetMinMaxValues;
		void SetMinMaxValues (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real ZMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real ZMax);
		%feature("autodoc", "Args:
	AText(char *)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	AAngle(Quantity_PlaneAngle)
	ATp(Graphic3d_TextPath)
	AHta(Graphic3d_HorizontalTextAlignment)
	AVta(Graphic3d_VerticalTextAlignment)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	None

Creates the string <AText> at position <APoint>.  
     The 3D point of attachment is projected. The text is  
     written in the plane of projection.  
     The attributes are given with respect to the plane of  
     projection.  
     AHeight : Height of text.  
           (Relative to the Normalized Projection  
             Coordinates (NPC) Space).  
     AAngle  : Orientation of the text  
           (with respect to the horizontal).") Text;
		void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	AText(char *)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	None

Creates the string <AText> at position <APoint>.  
     The 3D point of attachment is projected. The text is  
     written in the plane of projection.  
     The attributes are given with respect to the plane of  
     projection.  
     AHeight : Height of text.  
           (Relative to the Normalized Projection  
             Coordinates (NPC) Space).  
     The other attributes have the following default values:  
     AAngle  : PI / 2.  
     ATp     : TP_RIGHT  
     AHta    : HTA_LEFT  
     AVta    : VTA_BOTTOM") Text;
		void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	AText(TCollection_ExtendedString)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	AAngle(Quantity_PlaneAngle)
	ATp(Graphic3d_TextPath)
	AHta(Graphic3d_HorizontalTextAlignment)
	AVta(Graphic3d_VerticalTextAlignment)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	None

Creates the string <AText> at position <APoint>.  
     The 3D point of attachment is projected. The text is  
     written in the plane of projection.  
     The attributes are given with respect to the plane of  
     projection.  
     AHeight : Height of text.  
           (Relative to the Normalized Projection  
             Coordinates (NPC) Space).  
     AAngle  : Orientation of the text  
           (with respect to the horizontal).") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	AText(TCollection_ExtendedString)
	APoint(Graphic3d_Vertex)
	AHeight(Standard_Real)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	None

Creates the string <AText> at position <APoint>.  
     The 3D point of attachment is projected. The text is  
     written in the plane of projection.  
     The attributes are given with respect to the plane of  
     projection.  
     AHeight : Height of text.  
           (Relative to the Normalized Projection  
             Coordinates (NPC) Space).  
     The other attributes have the following default values:  
     AAngle  : PI / 2.  
     ATp     : TP_RIGHT  
     AHta    : HTA_LEFT  
     AVta    : VTA_BOTTOM") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	elem(Handle_Graphic3d_ArrayOfPrimitives)
	EvalMinMax(Standard_Boolean)=Standard_True

Returns:
	None

Adds an array of primitives for display") AddPrimitiveArray;
		void AddPrimitiveArray (const Handle_Graphic3d_ArrayOfPrimitives & elem,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	thePoint(Graphic3d_Vertex)
	theToEvalMinMax(Standard_Boolean)=Standard_True

Returns:
	None

Creates a primitive array with single marker using AddPrimitiveArray().") Marker;
		void Marker (const Graphic3d_Vertex & thePoint,const Standard_Boolean theToEvalMinMax = Standard_True);
		%feature("autodoc", "Args:
	AnObject(Standard_Address)
	EvalMinMax(Standard_Boolean)=Standard_True
	ContainsFacet(Standard_Boolean)=Standard_False

Returns:
	None

Creates an UserDraw primitive  
 Category: Methods to create UserDraw  
 Warning: Raises GroupDefinitionError if ...") UserDraw;
		void UserDraw (const Standard_Address AnObject,const Standard_Boolean EvalMinMax = Standard_True,const Standard_Boolean ContainsFacet = Standard_False);
		%feature("autodoc", "Args:
	theIsEnabled(Standard_Boolean)

Returns:
	None

sets the stencil test to theIsEnabled state;") SetStencilTestOptions;
		void SetStencilTestOptions (const Standard_Boolean theIsEnabled);
		%feature("autodoc", "Args:
	theIsEnabled(Standard_Boolean)
	theRefPlane(gp_Ax2)

Returns:
	None

sets the flipping to theIsEnabled state.") SetFlippingOptions;
		void SetFlippingOptions (const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);
		%feature("autodoc", "Args:
	theAspect(Graphic3d_GroupAspect)

Returns:
	Standard_Boolean

Returns TRUE if aspect is set for the group.") IsGroupPrimitivesAspectSet;
		Standard_Boolean IsGroupPrimitivesAspectSet (const Graphic3d_GroupAspect theAspect);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the group <self> contains  
     Polygons, Triangles or Quadrangles.") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the group <self> is deleted.  
     <self> is deleted after the call Remove (me) or the  
     associated structure is deleted.") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the group <self> is empty.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	ZMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	ZMax(Standard_Real)

Returns:
	None

Returns the coordinates of the boundary box of the  
     group <self>.") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

Returns the structure containing the group <self>.") Structure;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_HSequenceOfGroup;
		 Graphic3d_HSequenceOfGroup ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Graphic3d_HSequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Graphic3d_HSequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Graphic3d_HSequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Graphic3d_HSequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfGroup & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Graphic3d_HSequenceOfGroup

No detailed docstring for this function.") Split;
		Handle_Graphic3d_HSequenceOfGroup Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Graphic3d_Group & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Value;
		const Handle_Graphic3d_Group & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") ChangeValue;
		Handle_Graphic3d_Group & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfGroup

No detailed docstring for this function.") Sequence;
		const Graphic3d_SequenceOfGroup & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfGroup

No detailed docstring for this function.") ChangeSequence;
		Graphic3d_SequenceOfGroup & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_HSequenceOfGroup

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_HSequenceOfStructure;
		 Graphic3d_HSequenceOfStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Graphic3d_HSequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Graphic3d_HSequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Graphic3d_HSequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Graphic3d_HSequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Graphic3d_HSequenceOfStructure

No detailed docstring for this function.") Split;
		Handle_Graphic3d_HSequenceOfStructure Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") Value;
		const Handle_Graphic3d_Structure & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") ChangeValue;
		Handle_Graphic3d_Structure & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfStructure

No detailed docstring for this function.") Sequence;
		const Graphic3d_SequenceOfStructure & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfStructure

No detailed docstring for this function.") ChangeSequence;
		Graphic3d_SequenceOfStructure & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_HSequenceOfStructure

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_HSetOfGroup;
		 Graphic3d_HSetOfGroup ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	B(Handle_Graphic3d_HSetOfGroup)

Returns:
	Handle_Graphic3d_HSetOfGroup

No detailed docstring for this function.") Union;
		Handle_Graphic3d_HSetOfGroup Union (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("autodoc", "Args:
	B(Handle_Graphic3d_HSetOfGroup)

Returns:
	Handle_Graphic3d_HSetOfGroup

No detailed docstring for this function.") Intersection;
		Handle_Graphic3d_HSetOfGroup Intersection (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("autodoc", "Args:
	B(Handle_Graphic3d_HSetOfGroup)

Returns:
	Handle_Graphic3d_HSetOfGroup

No detailed docstring for this function.") Difference;
		Handle_Graphic3d_HSetOfGroup Difference (const Handle_Graphic3d_HSetOfGroup & B);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	S(Handle_Graphic3d_HSetOfGroup)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Handle_Graphic3d_HSetOfGroup & S);
		%feature("autodoc", "Args:
	S(Handle_Graphic3d_HSetOfGroup)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_Graphic3d_HSetOfGroup & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_HSetOfGroup

No detailed docstring for this function.") ShallowCopy;
		Handle_Graphic3d_HSetOfGroup ShallowCopy ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SetOfGroup

No detailed docstring for this function.") Set;
		const Graphic3d_SetOfGroup & Set ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SetOfGroup

No detailed docstring for this function.") ChangeSet;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_ListIteratorOfListOfPArray;
		 Graphic3d_ListIteratorOfListOfPArray ();
		%feature("autodoc", "Args:
	L(Graphic3d_ListOfPArray)

Returns:
	None

No detailed docstring for this function.") Graphic3d_ListIteratorOfListOfPArray;
		 Graphic3d_ListIteratorOfListOfPArray (const Graphic3d_ListOfPArray & L);
		%feature("autodoc", "Args:
	L(Graphic3d_ListOfPArray)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Graphic3d_ListOfPArray & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_ArrayOfPrimitives

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal ();
		%feature("autodoc", "Args:
	L(Graphic3d_ListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal (const Graphic3d_ListOfShortReal & L);
		%feature("autodoc", "Args:
	L(Graphic3d_ListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Graphic3d_ListOfShortReal & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		 Graphic3d_ListIteratorOfSetListOfSetOfGroup ();
		%feature("autodoc", "Args:
	L(Graphic3d_SetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Graphic3d_ListIteratorOfSetListOfSetOfGroup;
		 Graphic3d_ListIteratorOfSetListOfSetOfGroup (const Graphic3d_SetListOfSetOfGroup & L);
		%feature("autodoc", "Args:
	L(Graphic3d_SetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Graphic3d_SetListOfSetOfGroup & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_ArrayOfPrimitives)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Graphic3d_ListNodeOfListOfPArray;
		 Graphic3d_ListNodeOfListOfPArray (const Handle_Graphic3d_ArrayOfPrimitives & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_ArrayOfPrimitives

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Standard_ShortReal)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Graphic3d_ListNodeOfListOfShortReal;
		 Graphic3d_ListNodeOfListOfShortReal (const Standard_ShortReal & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Graphic3d_ListNodeOfSetListOfSetOfGroup;
		 Graphic3d_ListNodeOfSetListOfSetOfGroup (const Handle_Graphic3d_Group & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_ListOfPArray;
		 Graphic3d_ListOfPArray ();
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfPArray)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfPArray)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_ArrayOfPrimitives)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_ArrayOfPrimitives & I);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_ArrayOfPrimitives)
	theIt(Graphic3d_ListIteratorOfListOfPArray)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & theIt);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfPArray)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_ArrayOfPrimitives)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_ArrayOfPrimitives & I);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_ArrayOfPrimitives)
	theIt(Graphic3d_ListIteratorOfListOfPArray)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & theIt);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfPArray)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Graphic3d_ListOfPArray & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_ArrayOfPrimitives

No detailed docstring for this function.") First;
		Handle_Graphic3d_ArrayOfPrimitives & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_ArrayOfPrimitives

No detailed docstring for this function.") Last;
		Handle_Graphic3d_ArrayOfPrimitives & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Graphic3d_ListIteratorOfListOfPArray)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_ArrayOfPrimitives)
	It(Graphic3d_ListIteratorOfListOfPArray)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfPArray)
	It(Graphic3d_ListIteratorOfListOfPArray)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Graphic3d_ListOfPArray & Other,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_ArrayOfPrimitives)
	It(Graphic3d_ListIteratorOfListOfPArray)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Graphic3d_ArrayOfPrimitives & I,Graphic3d_ListIteratorOfListOfPArray & It);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfPArray)
	It(Graphic3d_ListIteratorOfListOfPArray)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_ListOfShortReal;
		 Graphic3d_ListOfShortReal ();
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfShortReal)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Standard_ShortReal & I);
		%feature("autodoc", "Args:
	I(Standard_ShortReal)
	theIt(Graphic3d_ListIteratorOfListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "Args:
	I(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Standard_ShortReal & I);
		%feature("autodoc", "Args:
	I(Standard_ShortReal)
	theIt(Graphic3d_ListIteratorOfListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Graphic3d_ListOfShortReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") First;
		Standard_ShortReal & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Last;
		Standard_ShortReal & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Graphic3d_ListIteratorOfListOfShortReal)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "Args:
	I(Standard_ShortReal)
	It(Graphic3d_ListIteratorOfListOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfShortReal)
	It(Graphic3d_ListIteratorOfListOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Graphic3d_ListOfShortReal & Other,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "Args:
	I(Standard_ShortReal)
	It(Graphic3d_ListIteratorOfListOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("autodoc", "Args:
	Other(Graphic3d_ListOfShortReal)
	It(Graphic3d_ListIteratorOfListOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_MapIteratorOfMapOfStructure;
		 Graphic3d_MapIteratorOfMapOfStructure ();
		%feature("autodoc", "Args:
	aMap(Graphic3d_MapOfStructure)

Returns:
	None

No detailed docstring for this function.") Graphic3d_MapIteratorOfMapOfStructure;
		 Graphic3d_MapIteratorOfMapOfStructure (const Graphic3d_MapOfStructure & aMap);
		%feature("autodoc", "Args:
	aMap(Graphic3d_MapOfStructure)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Graphic3d_MapOfStructure & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") Key;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Graphic3d_MapOfStructure;
		 Graphic3d_MapOfStructure (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Graphic3d_MapOfStructure)

Returns:
	Graphic3d_MapOfStructure

No detailed docstring for this function.") Assign;
		Graphic3d_MapOfStructure & Assign (const Graphic3d_MapOfStructure & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_MapOfStructure)

Returns:
	Graphic3d_MapOfStructure

No detailed docstring for this function.") operator=;
		Graphic3d_MapOfStructure & operator = (const Graphic3d_MapOfStructure & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(Handle_Graphic3d_Structure)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Structure & aKey);
		%feature("autodoc", "Args:
	aKey(Handle_Graphic3d_Structure)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Structure & aKey);
		%feature("autodoc", "Args:
	aKey(Handle_Graphic3d_Structure)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	theImage(Handle_Image_PixMap)

Returns:
	None

@param theImage - source image") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_Image_PixMap & theImage);
		%feature("autodoc", "Args:
	theBitMap(Handle_TColStd_HArray1OfByte)
	theWidth(Standard_Integer)
	theHeight(Standard_Integer)

Returns:
	None

Creates marker image from array of bytes
(method for compatibility with old markers definition).
@param theBitMap - source bitmap stored as array of bytes
@param theWidth  - number of bits in a row
@param theHeight - number of bits in a column") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_TColStd_HArray1OfByte & theBitMap,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theAlphaValue(Standard_Real)=0.5

Returns:
	Handle_TColStd_HArray1OfByte

@param theAlphaValue pixels in the image that have alpha value greater than
                     or equal to this parameter will be stored in bitmap as '1',
                     others will be stored as '0'
@return marker image as array of bytes. If an instance of the class has been
initialized with image, it will be converted to bitmap based on the parameter theAlphaValue.") GetBitMapArray;
		Handle_TColStd_HArray1OfByte GetBitMapArray (Standard_Real &OutValue = 0.5);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Image_PixMap

@return marker image. If an instance of the class has been initialized with a bitmap, it will be
converted to image.") GetImage;
		const Handle_Image_PixMap & GetImage ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Image_PixMap

@return image alpha as grayscale image. Note that if an instance of the class has been initialized
with a bitmap or with grayscale image this method will return exactly the same image as GetImage()") GetImageAlpha;
		const Handle_Image_PixMap & GetImageAlpha ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

@return an unique ID. This ID will be used to manage resource in graphic driver.") GetImageId;
		const TCollection_AsciiString & GetImageId ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

@return an unique ID. This ID will be used to manage resource in graphic driver.") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId ();
		%feature("autodoc", "Args:
	theWidth(Standard_Integer)
	theHeight(Standard_Integer)

Returns:
	None

@return texture size") GetTextureSize;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a material from default values.") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect ();
		%feature("autodoc", "Args:
	AName(Graphic3d_NameOfMaterial)

Returns:
	None

Creates a generic material calls <AName>") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect (const Graphic3d_NameOfMaterial AName);
		%feature("autodoc", "Args:
	ADelta(Standard_Real)

Returns:
	None

Increases or decreases the luminosity of <self>.  
//!	    <ADelta> is a signed percentage.") IncreaseShine;
		void IncreaseShine (const Standard_Real ADelta);
		%feature("autodoc", "Args:
	AValue(Standard_Real)

Returns:
	None

Modifies the reflection properties of the surface.  
 Category: Methods to modify the class definition  
 Warning: Raises MaterialDefinitionError if <AValue> is  
//!	    a negative value or greater than 1.0.") SetAmbient;
		void SetAmbient (const Standard_Real AValue);
		%feature("autodoc", "Args:
	AValue(Standard_Real)

Returns:
	None

Modifies the reflection properties of the surface.  
 Category: Methods to modify the class definition  
 Warning: Raises MaterialDefinitionError if <AValue> is a  
//!	    negative value or greater than 1.0.") SetDiffuse;
		void SetDiffuse (const Standard_Real AValue);
		%feature("autodoc", "Args:
	AValue(Standard_Real)

Returns:
	None

Modifies the reflection properties of the surface.  
 Category: Methods to modify the class definition  
 Warning: Raises MaterialDefinitionError if <AValue> is a  
//!	    negative value or greater than 1.0.") SetEmissive;
		void SetEmissive (const Standard_Real AValue);
		%feature("autodoc", "Args:
	AValue(Standard_Real)

Returns:
	None

Modifies the luminosity of the surface.  
 Category: Methods to modify the class definition  
 Warning: Raises MaterialDefinitionError if <AValue> is a  
//!	    negative value or greater than 1.0.") SetShininess;
		void SetShininess (const Standard_Real AValue);
		%feature("autodoc", "Args:
	AValue(Standard_Real)

Returns:
	None

Modifies the reflection properties of the surface.  
 Category: Methods to modify the class definition  
 Warning: Raises MaterialDefinitionError if <AValue> is a  
//!	    negative value or greater than 1.0.") SetSpecular;
		void SetSpecular (const Standard_Real AValue);
		%feature("autodoc", "Args:
	AValue(Standard_Real)

Returns:
	None

Modifies the transparency coefficient of the surface.  
 <AValue> = 0. opaque. (default)  
 <AValue> = 1. transparent.  
 Transparency is applicable to materials that have at least  
 one of reflection modes (ambient, diffuse, specular or emissive)  
 enabled. See also SetReflectionModeOn() and SetReflectionModeOff() methods.  
 
 NOTE: In order for transparency specified through this method to  
 take effect, it is necessary to enable transparency  
 in the viewer. This can be done either directly -  
 see Visual3d_ViewManager::SetTransparency(Standard_Boolean),  
 or indirectly - by calling AIS_InteractiveObject::SetTransparency()  
 before an object is added to an interactive context, or by  
 calling AIS_InteractiveContext::SetTransparency() for a given  
 interactive object already displayed.  
 Category: Methods to modify the class definition  
 Warning: Raises MaterialDefinitionError if <AValue> is a  
//!	    negative value or greater than 1.0.") SetTransparency;
		void SetTransparency (const Standard_Real AValue);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the ambient colour of the surface.  
 Category: Methods to modify the class definition") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the ambient colour of the surface.") SetAmbientColor;
		void SetAmbientColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the difuse colour of the surface.") SetDiffuseColor;
		void SetDiffuseColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the specular colour of the surface.") SetSpecularColor;
		void SetSpecularColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the emissive colour of the surface.") SetEmissiveColor;
		void SetEmissiveColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AType(Graphic3d_TypeOfReflection)

Returns:
	None

Activates the reflective properties of the surface <AType>.  
 
//!	    TypeOfReflection : TOR_AMBIENT  
//!			       TOR_DIFFUSE  
//!			       TOR_SPECULAR  
                            TOR_EMISSION  
1, 2, 3 or 4 types of reflection can be set for a given surface.") SetReflectionModeOn;
		void SetReflectionModeOn (const Graphic3d_TypeOfReflection AType);
		%feature("autodoc", "Args:
	AType(Graphic3d_TypeOfReflection)

Returns:
	None

Deactivates the reflective properties of  
//!	    the surface <AType>.  
 
//!	    TypeOfReflection : TOR_AMBIENT  
//!			       TOR_DIFFUSE  
//!			       TOR_SPECULAR  
                            TOR_EMISSION  
 1, 2, 3 or 4 types of reflection can be set off for a given surface.  
 Disabling diffuse and specular reflectance is useful for efficient visualization  
 of large amounts of data as definition of normals for graphic primitives is not needed  
 when only 'all-directional' reflectance is active.  
 
 NOTE: Disabling all four reflection modes also turns off the following effects:  
 1. Lighting. Colors of primitives are not affected by the material properties when lighting is off.  
 2. Transparency.") SetReflectionModeOff;
		void SetReflectionModeOff (const Graphic3d_TypeOfReflection AType);
		%feature("autodoc", "Args:
	AType(Graphic3d_TypeOfMaterial)

Returns:
	None

Set MyMaterialType to the value of parameter <AType>  
 
//!	    TypeOfMaterial :   MATERIAL_ASPECT  
//!			       MATERIAL_PHYSIC") SetMaterialType;
		void SetMaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("autodoc", "Args:
	AName(char *)

Returns:
	None

The current matarial become a 'UserDefined' material.  
//!	    Set the name of the 'UserDefined' material.") SetMaterialName;
		void SetMaterialName (const char * AName);
		%feature("autodoc", "Args:
	AValue(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetEnvReflexion;
		void SetEnvReflexion (const Standard_ShortReal AValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets the material with the original values according to  
the material name but leave the current color values untouched  
for the material of type ASPECT.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the ambient colour of the surface.") Color;
		Quantity_Color Color ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the ambient colour of the surface.") AmbientColor;
		Quantity_Color AmbientColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the diffuse colour of the surface.") DiffuseColor;
		Quantity_Color DiffuseColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the specular colour of the surface.") SpecularColor;
		Quantity_Color SpecularColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the emissive colour of the surface.") EmissiveColor;
		Quantity_Color EmissiveColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the reflection properties of the surface.") Ambient;
		Standard_Real Ambient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the reflection properties of the surface.") Diffuse;
		Standard_Real Diffuse ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the reflection properties of the surface.") Specular;
		Standard_Real Specular ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the transparency coefficient of the surface.") Transparency;
		Standard_Real Transparency ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the emissive coefficient of the surface.") Emissive;
		Standard_Real Emissive ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the luminosity of the surface.") Shininess;
		Standard_Real Shininess ();
		%feature("autodoc", "Args:
	AType(Graphic3d_TypeOfReflection)

Returns:
	Standard_Boolean

Returns Standard_True if the reflection mode is active,  
//!	    Standard_False otherwise.") ReflectionMode;
		Standard_Boolean ReflectionMode (const Graphic3d_TypeOfReflection AType);
		%feature("autodoc", "Args:
	AType(Graphic3d_TypeOfMaterial)

Returns:
	Standard_Boolean

Returns Standard_True if MyMaterialType equal the parameter AType,  
//!	    Standard_False otherwise.") MaterialType;
		Standard_Boolean MaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") EnvReflexion;
		Standard_ShortReal EnvReflexion ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_NameOfMaterial

Returns the material name.") Name;
		Graphic3d_NameOfMaterial Name ();
		%feature("autodoc", "Args:
	Other(Graphic3d_MaterialAspect)

Returns:
	Standard_Boolean

Returns Standard_True if the materials <self> and  
         <Other> are different.") IsDifferent;
		Standard_Boolean IsDifferent (const Graphic3d_MaterialAspect & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_MaterialAspect)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator!=;
		Standard_Boolean operator != (const Graphic3d_MaterialAspect & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_MaterialAspect)

Returns:
	Standard_Boolean

Returns Standard_True if the materials <self> and  
         <Other> are identical.") IsEqual;
		Standard_Boolean IsEqual (const Graphic3d_MaterialAspect & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_MaterialAspect)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const Graphic3d_MaterialAspect & Other);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the number of predefined textures.") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	static char *

Returns the name of the predefined material of rank <aRank>  
 Trigger: when <aRank> is < 1 or > NumberOfMaterials.") MaterialName;
		static char * MaterialName (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the name of this material") MaterialName;
		char * MaterialName ();
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	static Graphic3d_TypeOfMaterial

Returns the type of the predefined material of rank <aRank>  
 Trigger: when <aRank> is < 1 or > NumberOfMaterials.") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType (const Standard_Integer aRank);
		%feature("autodoc", "Args:
	theName(char *)

Returns:
	static Graphic3d_NameOfMaterial

Returns the material for specified name or Graphic3d_NOM_DEFAULT if name is unknown.") MaterialFromName;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Deletes the plotter <self>.") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)

Returns:
	virtual Standard_Boolean

Warning: Returns Standard_True if plotting is enabled in the view.  
//!	    Raises PlotterDefinitionError from Graphic3d  
//!	    if plotting has already started.") BeginPlot;
		virtual Standard_Boolean BeginPlot (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Stops the plotting.  
 Warning: Raises PlotterDefinitionError from Graphic3d  
//!	    if plotting has not started yet.") EndPlot;
		virtual void EndPlot ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") PlottingState;
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
		%feature("autodoc", "Args:
	I(Standard_Address)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Graphic3d_SequenceNodeOfSequenceOfAddress;
		 Graphic3d_SequenceNodeOfSequenceOfAddress (const Standard_Address & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Graphic3d_SequenceNodeOfSequenceOfGroup;
		 Graphic3d_SequenceNodeOfSequenceOfGroup (const Handle_Graphic3d_Group & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Structure)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Graphic3d_SequenceNodeOfSequenceOfStructure;
		 Graphic3d_SequenceNodeOfSequenceOfStructure (const Handle_Graphic3d_Structure & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_SequenceOfAddress;
		 Graphic3d_SequenceOfAddress ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Graphic3d_SequenceOfAddress)

Returns:
	Graphic3d_SequenceOfAddress

No detailed docstring for this function.") Assign;
		const Graphic3d_SequenceOfAddress & Assign (const Graphic3d_SequenceOfAddress & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_SequenceOfAddress)

Returns:
	Graphic3d_SequenceOfAddress

No detailed docstring for this function.") operator=;
		const Graphic3d_SequenceOfAddress & operator = (const Graphic3d_SequenceOfAddress & Other);
		%feature("autodoc", "Args:
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Standard_Address & T);
		%feature("autodoc", "Args:
	S(Graphic3d_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Standard_Address & T);
		%feature("autodoc", "Args:
	S(Graphic3d_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Address & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Graphic3d_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Address & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Graphic3d_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") First;
		const Standard_Address & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Last;
		const Standard_Address & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Graphic3d_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfAddress & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Value;
		const Standard_Address & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Standard_Address)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Address & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeValue;
		Standard_Address & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_SequenceOfGroup;
		 Graphic3d_SequenceOfGroup ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Graphic3d_SequenceOfGroup)

Returns:
	Graphic3d_SequenceOfGroup

No detailed docstring for this function.") Assign;
		const Graphic3d_SequenceOfGroup & Assign (const Graphic3d_SequenceOfGroup & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_SequenceOfGroup)

Returns:
	Graphic3d_SequenceOfGroup

No detailed docstring for this function.") operator=;
		const Graphic3d_SequenceOfGroup & operator = (const Graphic3d_SequenceOfGroup & Other);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	S(Graphic3d_SequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	S(Graphic3d_SequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Graphic3d_SequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Graphic3d_SequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfGroup & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") First;
		const Handle_Graphic3d_Group & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Last;
		const Handle_Graphic3d_Group & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Graphic3d_SequenceOfGroup)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfGroup & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Value;
		const Handle_Graphic3d_Group & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Graphic3d_Group & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") ChangeValue;
		Handle_Graphic3d_Group & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_SequenceOfStructure;
		 Graphic3d_SequenceOfStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Graphic3d_SequenceOfStructure)

Returns:
	Graphic3d_SequenceOfStructure

No detailed docstring for this function.") Assign;
		const Graphic3d_SequenceOfStructure & Assign (const Graphic3d_SequenceOfStructure & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_SequenceOfStructure)

Returns:
	Graphic3d_SequenceOfStructure

No detailed docstring for this function.") operator=;
		const Graphic3d_SequenceOfStructure & operator = (const Graphic3d_SequenceOfStructure & Other);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "Args:
	S(Graphic3d_SequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "Args:
	S(Graphic3d_SequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Graphic3d_SequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Graphic3d_SequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") First;
		const Handle_Graphic3d_Structure & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") Last;
		const Handle_Graphic3d_Structure & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Graphic3d_SequenceOfStructure)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfStructure & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") Value;
		const Handle_Graphic3d_Structure & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Graphic3d_Structure & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") ChangeValue;
		Handle_Graphic3d_Structure & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_SetIteratorOfSetOfGroup;
		 Graphic3d_SetIteratorOfSetOfGroup ();
		%feature("autodoc", "Args:
	S(Graphic3d_SetOfGroup)

Returns:
	None

No detailed docstring for this function.") Graphic3d_SetIteratorOfSetOfGroup;
		 Graphic3d_SetIteratorOfSetOfGroup (const Graphic3d_SetOfGroup & S);
		%feature("autodoc", "Args:
	S(Graphic3d_SetOfGroup)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Graphic3d_SetOfGroup & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_SetListOfSetOfGroup;
		 Graphic3d_SetListOfSetOfGroup ();
		%feature("autodoc", "Args:
	Other(Graphic3d_SetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "Args:
	Other(Graphic3d_SetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_Group & I);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)
	theIt(Graphic3d_ListIteratorOfSetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & theIt);
		%feature("autodoc", "Args:
	Other(Graphic3d_SetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_Group & I);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)
	theIt(Graphic3d_ListIteratorOfSetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & theIt);
		%feature("autodoc", "Args:
	Other(Graphic3d_SetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Graphic3d_SetListOfSetOfGroup & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") First;
		Handle_Graphic3d_Group & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Group

No detailed docstring for this function.") Last;
		Handle_Graphic3d_Group & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Graphic3d_ListIteratorOfSetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)
	It(Graphic3d_ListIteratorOfSetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "Args:
	Other(Graphic3d_SetListOfSetOfGroup)
	It(Graphic3d_ListIteratorOfSetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Graphic3d_SetListOfSetOfGroup & Other,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "Args:
	I(Handle_Graphic3d_Group)
	It(Graphic3d_ListIteratorOfSetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Graphic3d_Group & I,Graphic3d_ListIteratorOfSetListOfSetOfGroup & It);
		%feature("autodoc", "Args:
	Other(Graphic3d_SetListOfSetOfGroup)
	It(Graphic3d_ListIteratorOfSetListOfSetOfGroup)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_SetOfGroup;
		 Graphic3d_SetOfGroup ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	B(Graphic3d_SetOfGroup)

Returns:
	None

No detailed docstring for this function.") Union;
		void Union (const Graphic3d_SetOfGroup & B);
		%feature("autodoc", "Args:
	B(Graphic3d_SetOfGroup)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const Graphic3d_SetOfGroup & B);
		%feature("autodoc", "Args:
	B(Graphic3d_SetOfGroup)

Returns:
	None

No detailed docstring for this function.") Difference;
		void Difference (const Graphic3d_SetOfGroup & B);
		%feature("autodoc", "Args:
	T(Handle_Graphic3d_Group)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Graphic3d_Group & T);
		%feature("autodoc", "Args:
	S(Graphic3d_SetOfGroup)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Graphic3d_SetOfGroup & S);
		%feature("autodoc", "Args:
	S(Graphic3d_SetOfGroup)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks if the shader object is valid or not.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	OSD_Path

Returns the full path to the shader source.") Path;
		const OSD_Path & Path ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the source code of the shader object.") Source;
		const TCollection_AsciiString & Source ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfShaderObject

Returns type of the shader object.") Type;
		Graphic3d_TypeOfShaderObject Type ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns unique ID used to manage resource in graphic driver.") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("autodoc", "Args:
	theType(Graphic3d_TypeOfShaderObject)
	thePath(TCollection_AsciiString)

Returns:
	static Handle_Graphic3d_ShaderObject

Creates new shader object from specified file.") CreateFromFile;
		static Handle_Graphic3d_ShaderObject CreateFromFile (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & thePath);
		%feature("autodoc", "Args:
	theType(Graphic3d_TypeOfShaderObject)
	theSource(TCollection_AsciiString)

Returns:
	static Handle_Graphic3d_ShaderObject

Creates new shader object from specified source.") CreateFromSource;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates new empty program object.") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram ();
		%feature("autodoc", "Args:
	theName(Graphic3d_ShaderProgram::ShaderName)

Returns:
	None

Creates program object from pre-defined shaders.
Raises Standard_Failure exception if shader resources are unavailable.") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram (const Graphic3d_ShaderProgram::ShaderName theName);
		%feature("autodoc", "Args:
	None
Returns:
	None

Releases resources of program object.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks if the program object is valid or not.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns unique ID used to manage resource in graphic driver.") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("autodoc", "Args:
	theShader(Handle_Graphic3d_ShaderObject)

Returns:
	Standard_Boolean

Attaches shader object to the program object.") AttachShader;
		Standard_Boolean AttachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("autodoc", "Args:
	theShader(Handle_Graphic3d_ShaderObject)

Returns:
	Standard_Boolean

Detaches shader object from the program object.") DetachShader;
		Standard_Boolean DetachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_ShaderObjectList

Returns list of attached shader objects.") ShaderObjects;
		const Graphic3d_ShaderObjectList & ShaderObjects ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_ShaderVariableList

Returns list of custom uniform variables.") Variables;
		const Graphic3d_ShaderVariableList & Variables ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all custom uniform variables from the program.") ClearVariables;
		void ClearVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	static  TCollection_AsciiString

The path to GLSL programs determined from CSF_ShadersDirectory or CASROOT environment variables.
@return the root folder with default GLSL programs.") ShadersFolder;
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
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns name of shader variable.") Name;
		const TCollection_AsciiString & Name ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Checks if the shader variable is valid or not.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_ValueInterface *

Returns interface of shader variable value.") Value;
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
		%feature("autodoc", "Args:
	K(Handle_Graphic3d_Structure)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Graphic3d_StdMapNodeOfMapOfStructure;
		 Graphic3d_StdMapNodeOfMapOfStructure (const Handle_Graphic3d_Structure & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") Key;
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
		%feature("autodoc", "Args:
	AManager(Handle_Graphic3d_StructureManager)

Returns:
	None

Creates a graphic object in the manager <AManager>.  
//!	    It will appear in all the views of the visualiser.  
 Warning: The default values AspectLine, AspectFillArea,  
//!	    AspectText and AspectMarker are NOT applied to the  
//!	    structure.  
//!	    The structure is not displayed when it is created.") Graphic3d_Structure;
		 Graphic3d_Structure (const Handle_Graphic3d_StructureManager & AManager);
		%feature("autodoc", "Args:
	WithDestruction(Standard_Boolean)=Standard_True

Returns:
	virtual void

if WithDestruction == Standard_True then  
//!		suppress all the groups of primitives in the structure.  
//!	        and it is mandatory to create a new group in <self>.  
//!	    if WithDestruction == Standard_False then  
//!		clears all the groups of primitives in the structure.  
//!	        and all the groups are conserved and empty.  
//!	    They will be erased at the next screen update.  
//!	    The structure itself is conserved.  
//!	    The transformation and the attributes of <self> are conserved.  
//!	    The childs of <self> are conserved.") Clear;
		virtual void Clear (const Standard_Boolean WithDestruction = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Suppresses the structure <self>.  
//!	    It will be erased at the next screen update.") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Displays the structure <self> in all the views of  
//!	    the visualiser.") Display;
		virtual void Display ();
		%feature("autodoc", "Args:
	Priority(Standard_Integer)

Returns:
	None

Displays the structure <self> in all the views of  
//!	    the visualiser, while modifying its current priority.  
         Note: Display Priorities  
         Structure display priorities control the order in which  
         structures are redrawn.   When you display a  
         structure, you specify its priority. The lower the value,  
         the lower the display priority. When the display is  
         regenerated, the structures with the lowest priority  
         are drawn first. For structures with the same display  
         priority, the order in which they were displayed  
         determines the drawing order. Open CASCADE  
         supports 11 structure display priorities, 0 to 10.  
         Warning: Raises PriorityDefinitionError if <Priority> is  
//!	    greater than 10 or a negative value.") Display;
		void Display (const Standard_Integer Priority);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the current display priority for the  
//!	    structure <self>.") DisplayPriority;
		Standard_Integer DisplayPriority ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Erases the structure <self> in all the views  
//!	    of the visualiser.") Erase;
		virtual void Erase ();
		%feature("autodoc", "Args:
	Method(Aspect_TypeOfHighlightMethod)

Returns:
	None

Highlights the structure <self> in all the  
//!	    views of the visualiser, using the following methods:  
 
  TOHM_COLOR		= drawn in the highlight color  
//!				  (default white)  
//!	    TOHM_BLINK		= blinking  
  TOHM_BOUNDBOX	= enclosed by the boundary box  
//!				  (default white)") Highlight;
		void Highlight (const Aspect_TypeOfHighlightMethod Method);
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppress the structure <self>.  
//!	    It will be erased at the next screen update.  
 Warning: No more graphic operations in <self> after this call.  
 Category: Methods to modify the class definition") Remove;
		void Remove ();
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the highlight color for the Highlight method  
//!	    with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.") SetHighlightColor;
		void SetHighlightColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	AFlag(Standard_Boolean)

Returns:
	None

Modifies the coordinates of the boundary box  
//!	    of the structure <self>.  
//!	    if <AFlag> is Standard_True then <self> is infinite and  
//!	    the MinMaxValues method or the MinMaxCoord method return :  
//!	    XMin = YMin = ZMin = RealFirst ().  
//!	    XMax = YMax = ZMax = RealLast ().  
//!	    By default, <self> is not infinite but empty.") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	Priority(Standard_Integer)

Returns:
	None

Modifies the order of displaying the structure.  
//!	    Values are between 0 and 10.  
         Structures are drawn according to their display priorities  
         in ascending order.  
//!	    A structure of priority 10 is displayed the last and appears over the others.  
//!	    The default value is 5.  
 Category: Methods to modify the class definition  
 Warning: If <self> is displayed then the SetDisplayPriority  
//!	    method erase <self> and display <self> with the  
//!	    new priority.  
//!	    Raises PriorityDefinitionError if <Priority> is  
//!	    greater than 10 or a negative value.") SetDisplayPriority;
		void SetDisplayPriority (const Standard_Integer Priority);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reset the current priority of the structure to the  
//!	    previous priority.  
 Category: Methods to modify the class definition  
 Warning: If <self> is displayed then the SetDisplayPriority  
//!	    method erase <self> and display <self> with the  
//!	    previous priority.") ResetDisplayPriority;
		void ResetDisplayPriority ();
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	None

Set Z layer ID for the structure. The Z layer mechanism  
allows to display structures presented in higher layers in overlay  
of structures in lower layers by switching off z buffer depth  
test between layers") SetZLayer;
		void SetZLayer (const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Get Z layer ID of displayed structure. The method  
returns -1 if the structure has no ID (deleted from graphic driver).") GetZLayer;
		Standard_Integer GetZLayer ();
		%feature("autodoc", "Args:
	thePlanes(Graphic3d_SequenceOfHClipPlane)

Returns:
	None

Changes a sequence of clip planes slicing the structure on rendering.  
@param thePlanes [in] the set of clip planes.") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfHClipPlane

Get clip planes slicing the structure on rendering.  
@return set of clip planes.") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
		%feature("autodoc", "Args:
	AValue(Standard_Boolean)

Returns:
	None

Modifies the detectability indicator to Standard_True  
//!	    or Standard_False for the structure <self>.  
//!	    The default value at the definition of <self> is  
//!	    Standard_True.") SetPick;
		void SetPick (const Standard_Boolean AValue);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectLine3d)

Returns:
	None

Modifies the default attributes for lines  
//!	    in the structure <self>.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectFillArea3d)

Returns:
	None

Modifies the default attributes for faces  
//!	    in the structure <self>.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectText3d)

Returns:
	None

Modifies the default attributes for text  
//!	    in the structure <self>.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectMarker3d)

Returns:
	None

Modifies the default attributes for markers  
//!	    in the structure <self>.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("autodoc", "Args:
	AValue(Standard_Boolean)

Returns:
	None

Modifies the visibility indicator to Standard_True or  
//!	    Standard_False for the structure <self>.  
//!	    The default value at the definition of <self> is  
//!	    Standard_True.") SetVisible;
		void SetVisible (const Standard_Boolean AValue);
		%feature("autodoc", "Args:
	AManager(Handle_Graphic3d_StructureManager)
	WithPropagation(Standard_Boolean)=Standard_False

Returns:
	None

Moves the graphic object <self> in the manager <AManager>.  
//!	    If <WithPropagation> is Standard_True then all the connected  
//!	    graphic objects to <self> are moved.") SetManager;
		void SetManager (const Handle_Graphic3d_StructureManager & AManager,const Standard_Boolean WithPropagation = Standard_False);
		%feature("autodoc", "Args:
	AVisual(Graphic3d_TypeOfStructure)

Returns:
	virtual void

Modifies the visualisation mode for the structure <self>.") SetVisual;
		virtual void SetVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("autodoc", "Args:
	LimitInf(Standard_Real)
	LimitSup(Standard_Real)

Returns:
	None

Modifies the minimum and maximum zoom coefficients  
//!	    for the structure <self>.  
//!	    The default value at the definition of <self> is unlimited.  
 Category: Methods to modify the class definition  
 Warning: Raises StructureDefinitionError if <LimitInf> is  
//!	    greater than <LimitSup> or if <LimitInf> or  
//!	    <LimitSup> is a negative value.") SetZoomLimit;
		void SetZoomLimit (const Standard_Real LimitInf,const Standard_Real LimitSup);
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppresses the highlight for the structure <self>  
//!	     in all the views of the visualiser.") UnHighlight;
		void UnHighlight ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Compute;
		virtual void Compute ();
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)

Returns:
	virtual Handle_Graphic3d_Structure

Returns the new Structure defined for the new visualization") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)
	AMatrix(TColStd_Array2OfReal)

Returns:
	virtual Handle_Graphic3d_Structure

Returns the new Structure defined for the new visualization") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)
	aStructure(Handle_Graphic3d_Structure)

Returns:
	virtual void

Returns the new Structure defined for the new visualization") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & aStructure);
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)
	AMatrix(TColStd_Array2OfReal)
	aStructure(Handle_Graphic3d_Structure)

Returns:
	virtual void

Returns the new Structure defined for the new visualization") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix,Handle_Graphic3d_Structure & aStructure);
		%feature("autodoc", "Args:
	None
Returns:
	None

Forces a new construction of the structure <self>  
//!	    if <self> is displayed and TOS_COMPUTED.") ReCompute;
		void ReCompute ();
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)

Returns:
	None

Forces a new construction of the structure <self>  
//!	    if <self> is displayed in <aProjetor> and TOS_COMPUTED.") ReCompute;
		void ReCompute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the structure <self> contains  
//!	    Polygons, Triangles or Quadrangles.") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectFillArea3d

Returns the values of the current default attributes.") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfGroup

Returns the groups sequence included in the structure <self> (internal storage).") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the current number of groups in the  
//!	    structure <self>.") NumberOfGroups;
		Standard_Integer NumberOfGroups ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the highlight color for the Highlight method  
//!	    with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.") HighlightColor;
		Quantity_Color HighlightColor ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the structure <self> is deleted.  
//!	    <self> is deleted after the call Remove (me).") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns the display indicator for the structure <self>.") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the structure <self> is empty.  
 Warning: A structure is empty if :  
//!		it do not have group or all the groups are empties  
//!		and it do not have descendant or all the descendants  
//!		are empties.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the structure <self> is infinite.") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns the highlight indicator for the structure <self>.") IsHighlighted;
		virtual Standard_Boolean IsHighlighted ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the detectability indicator for the structure <self>.") IsSelectable;
		Standard_Boolean IsSelectable ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the structure <self> is rotated.  
//!	    <=> The transformation != Identity, != Scale, != Translation.") IsRotated;
		Standard_Boolean IsRotated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the structure <self> is transformed.  
//!	    <=> The transformation != Identity.") IsTransformed;
		Standard_Boolean IsTransformed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the visibility indicator for the structure <self>.") IsVisible;
		Standard_Boolean IsVisible ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectLine3d

Returns the values of the current default attributes.") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectMarker3d

Returns the current group of graphic attributes used  
for 3d marker primitives.") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	ZMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	ZMax(Standard_Real)

Returns:
	None

Returns the coordinates of the boundary box  
//!	    of the structure <self>.  
 Warning: If the structure <self> is empty or infinite then :  
//!	    XMin = YMin = ZMin = RealFirst ().  
//!	    XMax = YMax = ZMax = RealLast ().") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	CTXL(Handle_Graphic3d_AspectLine3d)
	CTXT(Handle_Graphic3d_AspectText3d)
	CTXM(Handle_Graphic3d_AspectMarker3d)
	CTXF(Handle_Graphic3d_AspectFillArea3d)

Returns:
	None

Returns the current values of the default attributes.") PrimitivesAspect;
		void PrimitivesAspect (Handle_Graphic3d_AspectLine3d & CTXL,Handle_Graphic3d_AspectText3d & CTXT,Handle_Graphic3d_AspectMarker3d & CTXM,Handle_Graphic3d_AspectFillArea3d & CTXF);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectText3d

Returns the values of the current default attributes.") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfStructure

Returns the visualisation mode for the structure <self>.") Visual;
		Graphic3d_TypeOfStructure Visual ();
		%feature("autodoc", "Args:
	AStructure1(Handle_Graphic3d_Structure)
	AStructure2(Handle_Graphic3d_Structure)
	AType(Graphic3d_TypeOfConnection)

Returns:
	static Standard_Boolean

Returns Standard_True if the connection is possible between  
//!	    <AStructure1> and <AStructure2> without a creation  
//!	    of a cycle.  
 
//!	    It's not possible to call the method  
//!	       AStructure1->Connect (AStructure2, TypeOfConnection)  
//!	    if  
//!	    - the set of all ancestors of <AStructure1> contains  
//!	      <AStructure1> and if the  
//!	      TypeOfConnection == TOC_DESCENDANT  
//!	    - the set of all descendants of <AStructure1> contains  
//!	      <AStructure2> and if the  
//!	      TypeOfConnection == TOC_ANCESTOR") AcceptConnection;
		static Standard_Boolean AcceptConnection (const Handle_Graphic3d_Structure & AStructure1,const Handle_Graphic3d_Structure & AStructure2,const Graphic3d_TypeOfConnection AType);
		%feature("autodoc", "Args:
	SG(Graphic3d_MapOfStructure)

Returns:
	None

Returns the group of structures to which <self> is connected.") Ancestors;
		void Ancestors (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	AType(Graphic3d_TypeOfConnection)
	WithCheck(Standard_Boolean)=Standard_False

Returns:
	None

If Atype is TOC_DESCENDANT then add <AStructure>  
//!	    as a child structure of  <self>.  
//!	    If Atype is TOC_ANCESTOR then add <AStructure>  
//!	    as a parent structure of <self>.  
//!	    The connection propagates Display, Highlight, Erase,  
//!	    Remove, and stacks the transformations.  
//!	    No connection if the graph of the structures  
//!	    contains a cycle and <WithCheck> is Standard_True;") Connect;
		void Connect (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType,const Standard_Boolean WithCheck = Standard_False);
		%feature("autodoc", "Args:
	SG(Graphic3d_MapOfStructure)

Returns:
	None

Returns the group of structures connected to <self>.") Descendants;
		void Descendants (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Suppress the connection between <AStructure> and <self>.") Disconnect;
		void Disconnect (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AType(Graphic3d_TypeOfConnection)

Returns:
	None

If Atype is TOC_DESCENDANT then suppress all  
//!	    the connections with the child structures of <self>.  
//!	    If Atype is TOC_ANCESTOR then suppress all  
//!	    the connections with the parent structures of <self>.") DisconnectAll;
		void DisconnectAll (const Graphic3d_TypeOfConnection AType);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	AType(Graphic3d_TypeOfConnection)
	ASet(Graphic3d_MapOfStructure)

Returns:
	static void

Returns <ASet> the group of structures :  
//!	    - directly or indirectly connected to <AStructure> if the  
//!	      TypeOfConnection == TOC_DESCENDANT  
//!	    - to which <AStructure> is directly or indirectly connected  
//!	      if the TypeOfConnection == TOC_ANCESTOR") Network;
		static void Network (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType,Graphic3d_MapOfStructure & ASet);
		%feature("autodoc", "Args:
	Owner(Standard_Address)

Returns:
	None

No detailed docstring for this function.") SetOwner;
		void SetOwner (const Standard_Address Owner);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Owner;
		Standard_Address Owner ();
		%feature("autodoc", "Args:
	AFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetHLRValidation;
		void SetHLRValidation (const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HLRValidation;
		Standard_Boolean HLRValidation ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfComposition

Returns the type of composition applied to matrices  
//!	    of transformation of <self>.") Composition;
		Graphic3d_TypeOfComposition Composition ();
		%feature("autodoc", "Args:
	AMatrix(TColStd_Array2OfReal)
	AType(Graphic3d_TypeOfComposition)

Returns:
	None

Modifies the current local modelling transformation  
//!	    in the structure <self>.  
 
//!	    It is defined as a 4*4 real matrix.  
 
//!	    -------------------  
//!	    | a11 a12 a13  t1 |  
//!	    | a21 a22 a23  t2 |  
//!	    | a31 a32 a33  t3 |  
//!	    |  0   0   0   1  |  
//!	    -------------------  
 
//!	    TypeOfComposition : TOC_REPLACE  
//!				TOC_POSTCONCATENATE  
 
Then the modified Local Modelling Transformation is composed  
with the current Global Modelling Transformation to create a  
new Composite Modelling Transformation.  
 
The compose type specifies the role of the current local  
modelling transformation (L) in composing the new value for  
the current local modelling transformation (L'), which is  
then combined with the current global modelling transforma-  
tion (G) to calculate the new composite modelling transfor-  
mation (C).  
 
TOC_REPLACE  
The transformation matrix (T) replaces the value of  
current local modelling transformation (L).  
 
//!	L' <- T  
//!	C <- G x L'  
 
TOC_POSTCONCATENATE  
The current local modelling transformation (L) is multiplied  
by the transformation matrix (T):  
 
//!	L' <- T x L  
//!	C <- G x L'  
 
 Category: Methods to manage the structure transformation  
 Warning: Raises TransformError if the matrix is not a 4x4 matrix.") SetTransform;
		void SetTransform (const TColStd_Array2OfReal & AMatrix,const Graphic3d_TypeOfComposition AType);
		%feature("autodoc", "Args:
	AMatrix(TColStd_Array2OfReal)

Returns:
	None

Returns the transformation associated with  
//!	    the structure <self>.") Transform;
		void Transform (TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "Args:
	AFlag(Graphic3d_TransModeFlags)
	APoint(gp_Pnt)

Returns:
	None

Modifies the current modelling transform persistence (pan, zoom or rotate)") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag,const gp_Pnt & APoint);
		%feature("autodoc", "Args:
	AFlag(Graphic3d_TransModeFlags)

Returns:
	None

No detailed docstring for this function.") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TransModeFlags

Get the current modelling transform persistence (pan, zoom or rotate)") TransformPersistenceMode;
		Graphic3d_TransModeFlags TransformPersistenceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Get the current point of relative modelling transform persistence") TransformPersistencePoint;
		gp_Pnt TransformPersistencePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfStructure

No detailed docstring for this function.") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual ();
		%feature("autodoc", "Args:
	WithDestruction(Standard_Boolean)

Returns:
	None

Clears the structure <self>.") GraphicClear;
		void GraphicClear (const Standard_Boolean WithDestruction);
		%feature("autodoc", "Args:
	ADaughter(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") GraphicConnect;
		void GraphicConnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "Args:
	ADaughter(Handle_Graphic3d_Structure)

Returns:
	None

No detailed docstring for this function.") GraphicDisconnect;
		void GraphicDisconnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "Args:
	Method(Aspect_TypeOfHighlightMethod)

Returns:
	None

Highlights the structure <self>.") GraphicHighlight;
		void GraphicHighlight (const Aspect_TypeOfHighlightMethod Method);
		%feature("autodoc", "Args:
	AMatrix(TColStd_Array2OfReal)

Returns:
	None

No detailed docstring for this function.") GraphicTransform;
		void GraphicTransform (const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppress the highlight for the structure <self>.") GraphicUnHighlight;
		void GraphicUnHighlight ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the identification number of the structure <self>.") Identification;
		Standard_Integer Identification ();
		%feature("autodoc", "Args:
	aPlotter(Handle_Graphic3d_Plotter)

Returns:
	virtual void

No detailed docstring for this function.") Plot;
		virtual void Plot (const Handle_Graphic3d_Plotter & aPlotter);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	AType(Graphic3d_TypeOfConnection)

Returns:
	static void

Prints informations about the network associated  
//!	    with the structure <AStructure>.") PrintNetwork;
		static void PrintNetwork (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType);
		%feature("autodoc", "Args:
	APtr(Standard_Address)
	AType(Graphic3d_TypeOfConnection)

Returns:
	None

Suppress the adress <APtr> in the list  
//!	    of descendants or in the list of ancestors.") Remove;
		void Remove (const Standard_Address APtr,const Graphic3d_TypeOfConnection AType);
		%feature("autodoc", "Args:
	AVisual(Graphic3d_TypeOfStructure)

Returns:
	None

No detailed docstring for this function.") SetComputeVisual;
		void SetComputeVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("autodoc", "Args:
	ATrsf(TColStd_Array2OfReal)
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)
	NewX(Standard_Real)
	NewY(Standard_Real)
	NewZ(Standard_Real)

Returns:
	static void

Transforms <X>, <Y>, <Z> with the transformation <ATrsf>.") Transforms;
		static void Transforms (const TColStd_Array2OfReal & ATrsf,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	ATrsf(TColStd_Array2OfReal)
	Coord(Graphic3d_Vector)

Returns:
	static Graphic3d_Vector

Transforms <Coord> with the transformation <ATrsf>.") Transforms;
		static Graphic3d_Vector Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vector & Coord);
		%feature("autodoc", "Args:
	ATrsf(TColStd_Array2OfReal)
	Coord(Graphic3d_Vertex)

Returns:
	static Graphic3d_Vertex

Transforms <Coord> with the transformation <ATrsf>.") Transforms;
		static Graphic3d_Vertex Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vertex & Coord);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_CStructure *

Returns the c structure associated to <self>.") CStructure;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Deletes the manager <self>.") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectLine3d)

Returns:
	None

Modifies the default attributes for lines  
//!	    in the visualiser.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectFillArea3d)

Returns:
	None

Modifies the default attributes for faces  
//!	    in the visualiser.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectText3d)

Returns:
	None

Modifies the default attributes for text  
//!	    in the visualiser.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("autodoc", "Args:
	CTX(Handle_Graphic3d_AspectMarker3d)

Returns:
	None

Modifies the default attributes for markers  
//!	    in the visualiser.") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("autodoc", "Args:
	AType(Aspect_TypeOfUpdate)

Returns:
	None

Modifies the screen update mode.  
 
//!	    TOU_ASAP	as soon as possible  
//!	    TOU_WAIT	on demand (with the Update function)  
 Note : Dynamic Operations and Update Mode  
Use SetUpdateMode to control when changes to  
the display are made.   Use one of the   following  
functions to update one or more views:  
-   Update all views of the viewer:   Visual3d_ViewManager::Update ()  
-   Update one view of the viewer:   Visual3d_View::Update () Use one of  
  the   following functions to update the entire display:  
-   Redraw all structures in all views:   Visual3d_ViewManager::Redraw ()  
-   Redraw all structures in one view:   Visual3d_View::Redraw ()  Update)") SetUpdateMode;
		void SetUpdateMode (const Aspect_TypeOfUpdate AType);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Updates screen in function of modifications of  
//!	    the structures.  
Warning: Not necessary if the update mode is TOU_ASAP.") Update;
		virtual void Update ();
		%feature("autodoc", "Args:
	SG(Graphic3d_MapOfStructure)

Returns:
	None

Returns the set of structures displayed in  
//!	    visualiser <self>.") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "Args:
	SG(Graphic3d_MapOfStructure)

Returns:
	None

Returns the set of highlighted structures  
//!	    in a visualiser <self>.") HighlightedStructures;
		void HighlightedStructures (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "Args:
	SG(Graphic3d_MapOfStructure)

Returns:
	None

Returns the set of detectable structures  
//!	    in a visualiser <self>.") PickStructures;
		void PickStructures (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectFillArea3d

Returns the values of the current default attributes.") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns maximum number of managers defineable.") Limit;
		static Standard_Integer Limit ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectLine3d

Returns the values of the current default attributes.") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectMarker3d

Returns the values of the current default attributes.") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	ZMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	ZMax(Standard_Real)

Returns:
	None

Returns the coordinates of the boundary box of all  
//!	    structures displayed in the manager <self>.") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	CTXL(Handle_Graphic3d_AspectLine3d)
	CTXT(Handle_Graphic3d_AspectText3d)
	CTXM(Handle_Graphic3d_AspectMarker3d)
	CTXF(Handle_Graphic3d_AspectFillArea3d)

Returns:
	None

Returns the values of the current default attributes.") PrimitivesAspect;
		void PrimitivesAspect (Handle_Graphic3d_AspectLine3d & CTXL,Handle_Graphic3d_AspectText3d & CTXT,Handle_Graphic3d_AspectMarker3d & CTXM,Handle_Graphic3d_AspectFillArea3d & CTXF);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectText3d

Returns the values of the current default attributes.") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfUpdate

Returns the screen update mode.  
 
//!	    TOU_ASAP	as soon as possible  
//!	    TOU_WAIT	on demand (Update)") UpdateMode;
		Aspect_TypeOfUpdate UpdateMode ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	OldPriority(Standard_Integer)
	NewPriority(Standard_Integer)

Returns:
	virtual void

Changes the display priority of the structure <AStructure>.") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority (const Handle_Graphic3d_Structure & AStructure,const Standard_Integer OldPriority,const Standard_Integer NewPriority);
		%feature("autodoc", "Args:
	theStructure(Handle_Graphic3d_Structure)
	theLayerId(Standard_Integer)

Returns:
	virtual void

Change Z layer for structure. The z layer mechanism allows  
to display structures in higher layers in overlay of structures in  
lower layers.") ChangeZLayer;
		virtual void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theStructure(Handle_Graphic3d_Structure)

Returns:
	virtual Standard_Integer

Get Z layer ID assigned to structure. If the structure  
has no layer ID (deleted from graphic driver), the method returns -1.") GetZLayer;
		virtual Standard_Integer GetZLayer (const Handle_Graphic3d_Structure & theStructure);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)
	theSettings(Graphic3d_ZLayerSettings)

Returns:
	virtual void

Sets the settings for a single Z layer for all managed views.") SetZLayerSettings;
		virtual void SetZLayerSettings (const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	virtual Graphic3d_ZLayerSettings

Returns the settings of a single Z layer.") ZLayerSettings;
		virtual Graphic3d_ZLayerSettings ZLayerSettings (const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	virtual Standard_Boolean

Add a new top-level Z layer and get its ID as  
<theLayerId> value. The method returns Standard_False if the layer  
can not be created. The z layer mechanism allows to display  
structures in higher layers in overlay of structures in lower layers.") AddZLayer;
		virtual Standard_Boolean AddZLayer (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	virtual Standard_Boolean

Remove Z layer with ID <theLayerId>. Method returns  
Standard_False if the layer can not be removed or doesn't exists.  
By default, there is always a default bottom-level layer that can't  
be removed.") RemoveZLayer;
		virtual Standard_Boolean RemoveZLayer (const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theLayerSeq(TColStd_SequenceOfInteger)

Returns:
	virtual void

Return all Z layer ids in sequence ordered by level  
from lowest layer to highest. The first layer ID in sequence is  
the default layer that can't be removed.") GetAllZLayers;
		virtual void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns a current identifier available.") CurrentId;
		static Standard_Integer CurrentId ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	virtual void

Forces a new construction of the structure <AStructure>  
//!	    if <AStructure> is displayed and TOS_COMPUTED.") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	AProjector(Handle_Graphic3d_DataStructureManager)

Returns:
	virtual void

Forces a new construction of the structure <AStructure>  
//!	    if <AStructure> is displayed in <AProjector> and TOS_COMPUTED.") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure,const Handle_Graphic3d_DataStructureManager & AProjector);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	WithDestruction(Standard_Boolean)

Returns:
	virtual void

Clears the structure <AStructure>.") Clear;
		virtual void Clear (const Handle_Graphic3d_Structure & AStructure,const Standard_Boolean WithDestruction);
		%feature("autodoc", "Args:
	AMother(Handle_Graphic3d_Structure)
	ADaughter(Handle_Graphic3d_Structure)

Returns:
	virtual void

Connects the structures <AMother> and <ADaughter>.") Connect;
		virtual void Connect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "Args:
	AMother(Handle_Graphic3d_Structure)
	ADaughter(Handle_Graphic3d_Structure)

Returns:
	virtual void

Disconnects the structures <AMother> and <ADaughter>.") Disconnect;
		virtual void Disconnect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	virtual void

Display the structure <AStructure>.") Display;
		virtual void Display (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	virtual void

Erases the structure <AStructure>.") Erase;
		virtual void Erase (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	AMethod(Aspect_TypeOfHighlightMethod)

Returns:
	virtual void

Highlights the structure <AStructure>.") Highlight;
		virtual void Highlight (const Handle_Graphic3d_Structure & AStructure,const Aspect_TypeOfHighlightMethod AMethod);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	ATrsf(TColStd_Array2OfReal)

Returns:
	virtual void

Transforms the structure <AStructure>.") SetTransform;
		virtual void SetTransform (const Handle_Graphic3d_Structure & AStructure,const TColStd_Array2OfReal & ATrsf);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_GraphicDriver

Returns the graphic driver of <self>.") GraphicDriver;
		const Handle_Graphic3d_GraphicDriver & GraphicDriver ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the identification number of the manager.") Identification;
		virtual Standard_Integer Identification ();
		%feature("autodoc", "Args:
	AId(Standard_Integer)

Returns:
	virtual Handle_Graphic3d_Structure

Returns the structure with the identification number <AId>.") Identification;
		virtual Handle_Graphic3d_Structure Identification (const Standard_Integer AId);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Suppresses the highlighting on all the structures in <self>.") UnHighlight;
		virtual void UnHighlight ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	virtual void

Suppress the highlighting on the structure <AStructure>.") UnHighlight;
		virtual void UnHighlight (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RecomputeStructures;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Default constructor.") Graphic3d_TextureParams;
		 Graphic3d_TextureParams ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return TRUE if the texture is modulate.  
Default value is FALSE.") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("autodoc", "Args:
	theToModulate(Standard_Boolean)

Returns:
	None

@param theToModulate turn modulation on/off.") SetModulate;
		void SetModulate (const Standard_Boolean theToModulate);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

@return TRUE if the texture repeat is enabled.  
Default value is FALSE.") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("autodoc", "Args:
	theToRepeat(Standard_Boolean)

Returns:
	None

@param theToRepeat turn texture repeat mode ON or OFF (clamping).") SetRepeat;
		void SetRepeat (const Standard_Boolean theToRepeat);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfTextureFilter

@return texture interpolation filter.  
Default value is Graphic3d_TOTF_NEAREST.") Filter;
		Graphic3d_TypeOfTextureFilter Filter ();
		%feature("autodoc", "Args:
	theFilter(Graphic3d_TypeOfTextureFilter)

Returns:
	None

@param theFilter texture interpolation filter.") SetFilter;
		void SetFilter (const Graphic3d_TypeOfTextureFilter theFilter);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_LevelOfTextureAnisotropy

@return level of anisontropy texture filter.  
Default value is Graphic3d_LOTA_OFF.") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("autodoc", "Args:
	theLevel(Graphic3d_LevelOfTextureAnisotropy)

Returns:
	None

@param theLevel level of anisontropy texture filter.") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

@return rotation angle in degrees  
Default value is 0.") Rotation;
		Standard_ShortReal Rotation ();
		%feature("autodoc", "Args:
	theAngleDegrees(Standard_ShortReal)

Returns:
	None

@param theAngleDegrees rotation angle.") SetRotation;
		void SetRotation (const Standard_ShortReal theAngleDegrees);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vec2

@return scale factor  
Default value is no scaling (1.0; 1.0).") Scale;
		const Graphic3d_Vec2 & Scale ();
		%feature("autodoc", "Args:
	theScale(Graphic3d_Vec2)

Returns:
	None

@param theScale scale factor.") SetScale;
		void SetScale (const Graphic3d_Vec2 theScale);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vec2

@return translation vector  
Default value is no translation (0.0; 0.0).") Translation;
		const Graphic3d_Vec2 & Translation ();
		%feature("autodoc", "Args:
	theVec(Graphic3d_Vec2)

Returns:
	None

@param theVec translation vector.") SetTranslation;
		void SetTranslation (const Graphic3d_Vec2 theVec);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfTextureMode

@return texture coordinates generation mode.  
Default value is Graphic3d_TOTM_MANUAL.") GenMode;
		Graphic3d_TypeOfTextureMode GenMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vec4

@return texture coordinates generation plane S.") GenPlaneS;
		const Graphic3d_Vec4 & GenPlaneS ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vec4

@return texture coordinates generation plane T.") GenPlaneT;
		const Graphic3d_Vec4 & GenPlaneT ();
		%feature("autodoc", "Args:
	theMode(Graphic3d_TypeOfTextureMode)
	thePlaneS(Graphic3d_Vec4)
	thePlaneT(Graphic3d_Vec4)

Returns:
	None

Setup texture coordinates generation mode.") SetGenMode;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks if a texture class is valid or not.  
@return true if the construction of the class is correct") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	OSD_Path

Returns the full path of the defined texture.  
It could be empty path if GetImage() is overridden to load image not from file.") Path;
		const OSD_Path & Path ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TypeOfTexture

@return the texture type.") Type;
		Graphic3d_TypeOfTexture Type ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

This ID will be used to manage resource in graphic driver.  
.  
Default implementation generates unique ID although inheritors may re-initialize it.  
.  
Multiple Graphic3d_TextureRoot instancies with same ID  
will be treated as single texture with different parameters  
to optimize memory usage though this will be more natural  
to use same instance of Graphic3d_TextureRoot when possible.  
.  
Notice that inheritor may set this ID to empty string.  
In this case independent graphical resource will be created  
for each instance of Graphic3d_AspectFillArea3d where texture will be used.  
.  
@return texture identifier.") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Image_PixMap_Handle

This method will be called by graphic driver each time when texture resource should be created.  
Default constructors allow defining the texture source as path to texture image or directly as pixmap.  
If the source is defined as path, then the image will be dynamically loaded when this method is called  
(and no copy will be preserved in this class instance).  
Inheritors may dynamically generate the image.  
Notice, image data should be in Bottom-Up order (see Image_PixMap::IsTopDown())!  
@return the image for texture.") GetImage;
		virtual Image_PixMap_Handle GetImage ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_TextureParams

@return low-level texture parameters") GetParams;
		const Handle_Graphic3d_TextureParams & GetParams ();
		%feature("autodoc", "Args:
	None
Returns:
	static TCollection_AsciiString

The path to textures determined from CSF_MDTVTexturesDirectory or CASROOT environment variables.  
@return the root folder with default textures.") TexturesFolder;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Size

Returns unique identifier of value type.") TypeID;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a vector with 1.0, 0.0, 0.0 coordinates.") Graphic3d_Vector;
		 Graphic3d_Vector ();
		%feature("autodoc", "Args:
	AX(Standard_Real)
	AY(Standard_Real)
	AZ(Standard_Real)

Returns:
	None

Creates a vector with <AX>, <AY>, <AZ> coordinates.") Graphic3d_Vector;
		 Graphic3d_Vector (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("autodoc", "Args:
	APoint1(Graphic3d_Vertex)
	APoint2(Graphic3d_Vertex)

Returns:
	None

Creates a vector from 2 points <APoint1> and <APoint2>.") Graphic3d_Vector;
		 Graphic3d_Vector (const Graphic3d_Vertex & APoint1,const Graphic3d_Vertex & APoint2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Normalises <self>.  
 Category: Methods to modify the class definition  
 Warning: Raises VectorError if <self> is null.") Normalize;
		void Normalize ();
		%feature("autodoc", "Args:
	Xnew(Standard_Real)
	Ynew(Standard_Real)
	Znew(Standard_Real)

Returns:
	None

Modifies the coordinates of the vector <self>.") SetCoord;
		void SetCoord (const Standard_Real Xnew,const Standard_Real Ynew,const Standard_Real Znew);
		%feature("autodoc", "Args:
	Xnew(Standard_Real)

Returns:
	None

Modifies the X coordinate of the vector <self>.") SetXCoord;
		void SetXCoord (const Standard_Real Xnew);
		%feature("autodoc", "Args:
	Ynew(Standard_Real)

Returns:
	None

Modifies the Y coordinate of the vector <self>.") SetYCoord;
		void SetYCoord (const Standard_Real Ynew);
		%feature("autodoc", "Args:
	Znew(Standard_Real)

Returns:
	None

Modifies the Z coordinate of the vector <self>.") SetZCoord;
		void SetZCoord (const Standard_Real Znew);
		%feature("autodoc", "Args:
	AX(Standard_Real)
	AY(Standard_Real)
	AZ(Standard_Real)

Returns:
	None

Returns the coordinates of the vector <self>.") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if <self> has length 1.") IsNormalized;
		Standard_Boolean IsNormalized ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if <self> has length zero.") LengthZero;
		Standard_Boolean LengthZero ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the X coordinates of the vector <self>.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Y coordinate of the vector <self>.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Z coordinate of the vector <self>.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	AV1(Graphic3d_Vector)
	AV2(Graphic3d_Vector)

Returns:
	static Standard_Boolean

Returns Standard_True if the vector <AV1> and  
//!	    <AV2> are parallel.") IsParallel;
		static Standard_Boolean IsParallel (const Graphic3d_Vector & AV1,const Graphic3d_Vector & AV2);
		%feature("autodoc", "Args:
	AX(Standard_Real)
	AY(Standard_Real)
	AZ(Standard_Real)

Returns:
	static Standard_Real

Returns the norm of the vector <AX>, <AY>, <AZ>.") NormeOf;
		static Standard_Real NormeOf (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("autodoc", "Args:
	AVector(Graphic3d_Vector)

Returns:
	static Standard_Real

Returns the norm of the vector <AVector>.") NormeOf;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a point with 0.0, 0.0, 0.0 coordinates.") Graphic3d_Vertex;
		 Graphic3d_Vertex ();
		%feature("autodoc", "Args:
	APoint(Graphic3d_Vertex)

Returns:
	None

Creates a point with coordinates identical to <APoint>.") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Graphic3d_Vertex & APoint);
		%feature("autodoc", "Args:
	AX(Standard_ShortReal)
	AY(Standard_ShortReal)
	AZ(Standard_ShortReal)

Returns:
	None

Creates a point with <AX>, <AY> and <AZ> coordinates.") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_ShortReal AX,const Standard_ShortReal AY,const Standard_ShortReal AZ);
		%feature("autodoc", "Args:
	AX(Standard_Real)
	AY(Standard_Real)
	AZ(Standard_Real)

Returns:
	None

Creates a point with <AX>, <AY> and <AZ> coordinates.") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("autodoc", "Args:
	AX(Standard_ShortReal)
	AY(Standard_ShortReal)
	AZ(Standard_ShortReal)

Returns:
	None

Modifies the coordinates of the point <self>.") SetCoord;
		void SetCoord (const Standard_ShortReal AX,const Standard_ShortReal AY,const Standard_ShortReal AZ);
		%feature("autodoc", "Args:
	AX(Standard_Real)
	AY(Standard_Real)
	AZ(Standard_Real)

Returns:
	None

Modifies the coordinates of the point <self>.") SetCoord;
		void SetCoord (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("autodoc", "Args:
	AX(Standard_ShortReal)
	AY(Standard_ShortReal)
	AZ(Standard_ShortReal)

Returns:
	None

Returns the coordinates of the point <self>.") Coord;
		void Coord (Standard_ShortReal & AX,Standard_ShortReal & AY,Standard_ShortReal & AZ);
		%feature("autodoc", "Args:
	AX(Standard_Real)
	AY(Standard_Real)
	AZ(Standard_Real)

Returns:
	None

Returns the coordinates of the point <self>.") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

Returns the X coordinates of the point <self>.") X;
		Standard_ShortReal X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

Returns the Y coordinate of the point <self>.") Y;
		Standard_ShortReal Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

Returns the Z coordinate of the point <self>.") Z;
		Standard_ShortReal Z ();
		%feature("autodoc", "Args:
	AOther(Graphic3d_Vertex)

Returns:
	Standard_ShortReal

Returns the distance between <AV1> and <AV2>.") Distance;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings ();
		%feature("autodoc", "Args:
	theSetting(Graphic3d_ZLayerSetting)

Returns:
	Standard_Boolean

Returns true if theSetting is enabled.") IsSettingEnabled;
		const Standard_Boolean IsSettingEnabled (const Graphic3d_ZLayerSetting theSetting);
		%feature("autodoc", "Args:
	theSetting(Graphic3d_ZLayerSetting)

Returns:
	None

Enables theSetting") EnableSetting;
		void EnableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("autodoc", "Args:
	theSetting(Graphic3d_ZLayerSetting)

Returns:
	None

Disables theSetting") DisableSetting;
		void DisableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets minimal possible positive depth offset.
Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.") SetDepthOffsetPositive;
		void SetDepthOffsetPositive ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets minimal possible negative depth offset.
Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.") SetDepthOffsetNegative;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	hasVColors(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of points,  
a single pixel point is drawn at each vertex.  
The array must be filled using the AddVertex(Point) method.  
When <hasVColors> is TRUE , you must use only AddVertex(Point,Color) method.") Graphic3d_ArrayOfPoints;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxBounds(Standard_Integer)=0
	maxEdges(Standard_Integer)=0
	hasVNormals(Standard_Boolean)=Standard_False
	hasVColors(Standard_Boolean)=Standard_False
	hasBColors(Standard_Boolean)=Standard_False
	hasTexels(Standard_Boolean)=Standard_False
	hasEdgeInfos(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of polygons,  
a polygon can be filled as:  
1) creating a single polygon defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolygons(7)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x7,y7,z7)  
2) creating separate polygons defined with a predefined  
   number of bounds and the number of vertex per bound.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolygons(7,2)  
   myArray->AddBound(4)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddBound(3)  
   myArray->AddVertex(x5,y5,z5)  
//!	....  
   myArray->AddVertex(x7,y7,z7)  
3) creating a single indexed polygon defined with his vertex  
   ans edges.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolygons(4,0,6)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(4)  
4) creating separate polygons defined with a predefined  
   number of bounds and the number of edges per bound.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolygons(6,4,14)  
   myArray->AddBound(3)  
   myArray->AddVertex(x1,y1,z1)  
   myArray->AddVertex(x2,y2,z2)  
   myArray->AddVertex(x3,y3,z3)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddBound(3)  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddVertex(x5,y5,z5)  
   myArray->AddVertex(x6,y6,z6)  
   myArray->AddEdge(4)  
   myArray->AddEdge(5)  
   myArray->AddEdge(6)  
   myArray->AddBound(4)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(5)  
   myArray->AddEdge(6)  
   myArray->AddBound(4)  
   myArray->AddEdge(1)  
   myArray->AddEdge(3)  
   myArray->AddEdge(5)  
   myArray->AddEdge(4)  
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxBounds> defined the maximun allowed bound number in the array.  
<maxEdges> defined the maximun allowed edge number in the array.  
 Warning:  
When <hasVNormals> is TRUE , you must use one of  
//!	AddVertex(Point,Normal)  
 or  AddVertex(Point,Normal,Color)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasVColors> is TRUE , you must use one of  
//!	AddVertex(Point,Color)  
 or  AddVertex(Point,Normal,Color) methods.  
When <hasTexels> is TRUE , you must use one of  
//!	AddVertex(Point,Texel)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasBColors> is TRUE , <maxBounds> must be > 0 and  
//!	you must use the  
//!	AddBound(number,Color) method.  
When <hasEdgeInfos> is TRUE , <maxEdges> must be > 0 and  
//!	you must use the  
//!	AddEdge(number,visibillity) method.  
 Warning:  
the user is responsible about the orientation of the polygon  
depending of the order of the created vertex or edges and this  
orientation must be coherent with the vertex normal optionnaly  
given at each vertex (See the Orientate() methods).") Graphic3d_ArrayOfPolygons;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxBounds(Standard_Integer)=0
	maxEdges(Standard_Integer)=0
	hasVColors(Standard_Boolean)=Standard_False
	hasBColors(Standard_Boolean)=Standard_False
	hasEdgeInfos(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of polylines,  
a polyline can be filled as:  
1) creating a single polyline defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolylines(7)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x7,y7,z7)  
2) creating separate polylines defined with a predefined  
   number of bounds and the number of vertex per bound.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolylines(7,2)  
   myArray->AddBound(4)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddBound(3)  
   myArray->AddVertex(x5,y5,z5)  
     ....  
   myArray->AddVertex(x7,y7,z7)  
3) creating a single indexed polyline defined with his vertex  
   ans edges.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolylines(4,0,6)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(4)  
4) creating separate polylines defined with a predefined  
   number of bounds and the number of edges per bound.  
   i.e:  
   myArray = Graphic3d_ArrayOfPolylines(6,4,14)  
   myArray->AddBound(3)  
   myArray->AddVertex(x1,y1,z1)  
   myArray->AddVertex(x2,y2,z2)  
   myArray->AddVertex(x3,y3,z3)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddBound(3)  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddVertex(x5,y5,z5)  
   myArray->AddVertex(x6,y6,z6)  
   myArray->AddEdge(4)  
   myArray->AddEdge(5)  
   myArray->AddEdge(6)  
   myArray->AddBound(4)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(5)  
   myArray->AddEdge(6)  
   myArray->AddBound(4)  
   myArray->AddEdge(1)  
   myArray->AddEdge(3)  
   myArray->AddEdge(5)  
   myArray->AddEdge(4)  
 
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxBounds> defined the maximun allowed bound number in the array.  
<maxEdges> defined the maximun allowed edge number in the array.  
 Warning:  
When <hasVColors> is TRUE , you must use one of  
     AddVertex(Point,Color)  
 or  AddVertex(Point,Normal,Color) methods.  
When <hasBColors> is TRUE , <maxBounds> must be > 0 and  
     you must use the  
     AddBound(number,Color) method.  
When <hasEdgeInfos> is TRUE , <maxEdges> must be > 0 and  
     you must use the  
     AddEdge(number,visibillity) method.") Graphic3d_ArrayOfPolylines;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxStrips(Standard_Integer)=0
	hasVNormals(Standard_Boolean)=Standard_False
	hasVColors(Standard_Boolean)=Standard_False
	hasSColors(Standard_Boolean)=Standard_False
	hasTexels(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of quadrangle strips,  
a polygon can be filled as:  
1) creating a single strip defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfQuadrangleStrips(7)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x7,y7,z7)  
2) creating separate strips defined with a predefined  
   number of strips and the number of vertex per strip.  
   i.e:  
   myArray = Graphic3d_ArrayOfQuadrangleStrips(8,2)  
   myArray->AddBound(4)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddBound(4)  
   myArray->AddVertex(x5,y5,z5)  
//!	....  
   myArray->AddVertex(x8,y8,z8)  
 
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxStrips> defined the maximun allowed strip number in the array.  
The number of quadrangle really drawn is :  
VertexNumber()/2-Min(1,BoundNumber())") Graphic3d_ArrayOfQuadrangleStrips;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxEdges(Standard_Integer)=0
	hasVNormals(Standard_Boolean)=Standard_False
	hasVColors(Standard_Boolean)=Standard_False
	hasTexels(Standard_Boolean)=Standard_False
	hasEdgeInfos(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of quadrangles,  
a quadrangle can be filled as:  
1) creating a set of quadrangles defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfQuadrangles(8)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x8,y8,z8)  
3) creating a set of indexed quadrangles defined with his vertex  
   ans edges.  
   i.e:  
   myArray = Graphic3d_ArrayOfQuadrangles(6,8)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x6,y6,z6)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(4)  
   myArray->AddEdge(3)  
   myArray->AddEdge(4)  
   myArray->AddEdge(5)  
   myArray->AddEdge(6)  
 
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxEdges> defined the maximun allowed edge number in the array.  
 Warning:  
When <hasVNormals> is TRUE , you must use one of  
//!	AddVertex(Point,Normal)  
 or  AddVertex(Point,Normal,Color)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasVColors> is TRUE , you must use one of  
//!	AddVertex(Point,Color)  
 or  AddVertex(Point,Normal,Color) methods.  
When <hasTexels> is TRUE , you must use one of  
//!	AddVertex(Point,Texel)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasEdgeInfos> is TRUE , <maxEdges> must be > 0 and  
//!	you must use the  
//!	AddEdge(number,visibillity) method.  
 Warning:  
the user is responsible about the orientation of the quadrangle  
depending of the order of the created vertex or edges and this  
orientation must be coherent with the vertex normal optionnaly  
given at each vertex (See the Orientate() methods).") Graphic3d_ArrayOfQuadrangles;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxEdges(Standard_Integer)=0
	hasVColors(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of segments,  
a segment can be filled as:  
1) creating a set of segments defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfSegments(4)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x4,y4,z4)  
2) creating a set of indexed segments defined with his vertex  
   ans edges.  
   i.e:  
   myArray = Graphic3d_ArrayOfSegments(4,0,8)  
   myArray->AddVertex(x1,y1,z1)  
//!	....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(4)  
   myArray->AddEdge(2)  
   myArray->AddEdge(4)  
   myArray->AddEdge(1)  
   myArray->AddEdge(3)  
 
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxEdges> defined the maximun allowed edge number in the array.  
 Warning:  
When <hasVColors> is TRUE , you must use only  
//!	AddVertex(Point,Color) method") Graphic3d_ArrayOfSegments;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxFans(Standard_Integer)=0
	hasVNormals(Standard_Boolean)=Standard_False
	hasVColors(Standard_Boolean)=Standard_False
	hasFColors(Standard_Boolean)=Standard_False
	hasTexels(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of triangle fans,  
a polygon can be filled as:  
1) creating a single fan defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfTriangleFans(7)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x7,y7,z7)  
2) creating separate fans defined with a predefined  
   number of fans and the number of vertex per fan.  
   i.e:  
   myArray = Graphic3d_ArrayOfTriangleFans(8,2)  
   myArray->AddBound(4)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddBound(4)  
   myArray->AddVertex(x5,y5,z5)  
     ....  
   myArray->AddVertex(x8,y8,z8)  
 
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxFans> defined the maximun allowed fan number in the array.  
The number of triangle really drawn is :  
VertexNumber()-2*Min(1,BoundNumber())") Graphic3d_ArrayOfTriangleFans;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxStrips(Standard_Integer)=0
	hasVNormals(Standard_Boolean)=Standard_False
	hasVColors(Standard_Boolean)=Standard_False
	hasSColors(Standard_Boolean)=Standard_False
	hasTexels(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of triangle strips,  
a polygon can be filled as:  
1) creating a single strip defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfTriangleStrips(7)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x7,y7,z7)  
2) creating separate strips defined with a predefined  
   number of strips and the number of vertex per strip.  
   i.e:  
   myArray = Graphic3d_ArrayOfTriangleStrips(8,2)  
   myArray->AddBound(4)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddBound(4)  
   myArray->AddVertex(x5,y5,z5)  
     ....  
   myArray->AddVertex(x8,y8,z8)  
 
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxStrips> defined the maximun allowed strip number in the array.  
The number of triangle really drawn is :  
VertexNumber()-2*Min(1,BoundNumber())  
 Warning:  
When <hasVNormals> is TRUE , you must use one of  
     AddVertex(Point,Normal)  
 or  AddVertex(Point,Normal,Color)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasVColors> is TRUE , you must use one of  
     AddVertex(Point,Color)  
 or  AddVertex(Point,Normal,Color) methods.  
When <hasTexels> is TRUE , you must use one of  
     AddVertex(Point,Texel)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasBColors> is TRUE , <maxBounds> must be > 0 and  
     you must use the  
     AddBound(number,Color) method.  
 Warning:  
the user is responsible about the orientation of the strip  
depending of the order of the created vertex and this  
orientation must be coherent with the vertex normal optionnaly  
given at each vertex (See the Orientate() methods).") Graphic3d_ArrayOfTriangleStrips;
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
		%feature("autodoc", "Args:
	maxVertexs(Standard_Integer)
	maxEdges(Standard_Integer)=0
	hasVNormals(Standard_Boolean)=Standard_False
	hasVColors(Standard_Boolean)=Standard_False
	hasTexels(Standard_Boolean)=Standard_False
	hasEdgeInfos(Standard_Boolean)=Standard_False

Returns:
	None

Creates an array of triangles,  
a triangle can be filled as:  
1) creating a set of triangles defined with his vertexs.  
   i.e:  
   myArray = Graphic3d_ArrayOfTriangles(6)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x6,y6,z6)  
3) creating a set of indexed triangles defined with his vertex  
   ans edges.  
   i.e:  
   myArray = Graphic3d_ArrayOfTriangles(4,6)  
   myArray->AddVertex(x1,y1,z1)  
     ....  
   myArray->AddVertex(x4,y4,z4)  
   myArray->AddEdge(1)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(2)  
   myArray->AddEdge(3)  
   myArray->AddEdge(4)  
 
<maxVertexs> defined the maximun allowed vertex number in the array.  
<maxEdges> defined the maximun allowed edge number in the array.  
 Warning:  
When <hasVNormals> is TRUE , you must use one of  
     AddVertex(Point,Normal)  
 or  AddVertex(Point,Normal,Color)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasVColors> is TRUE , you must use one of  
     AddVertex(Point,Color)  
 or  AddVertex(Point,Normal,Color) methods.  
When <hasTexels> is TRUE , you must use one of  
     AddVertex(Point,Texel)  
 or  AddVertex(Point,Normal,Texel) methods.  
When <hasEdgeInfos> is TRUE , <maxEdges> must be > 0 and  
     you must use the  
     AddEdge(number,visibillity) method.  
 Warning:  
the user is responsible about the orientation of the triangle  
depending of the order of the created vertex or edges and this  
orientation must be coherent with the vertex normal optionnaly  
given at each vertex (See the Orientate() methods).") Graphic3d_ArrayOfTriangles;
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
		%feature("autodoc", "Args:
	theFileName(TCollection_AsciiString)

Returns:
	None

Creates an environment texture from a file.") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "Args:
	theName(Graphic3d_NameOfTextureEnv)

Returns:
	None

Creates an environment texture from a predefined texture name set.") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const Graphic3d_NameOfTextureEnv theName);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_NameOfTextureEnv

Returns the name of the predefined textures or NOT_ENV_UNKNOWN  
when the name is given as a filename.") Name;
		Graphic3d_NameOfTextureEnv Name ();
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the number of predefined textures.") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	static TCollection_AsciiString

Returns the name of the predefined texture of rank <aRank>") TextureName;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

enable texture smoothing") EnableSmooth;
		void EnableSmooth ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the texture is smoothed.") IsSmoothed;
		Standard_Boolean IsSmoothed ();
		%feature("autodoc", "Args:
	None
Returns:
	None

disable texture smoothing") DisableSmooth;
		void DisableSmooth ();
		%feature("autodoc", "Args:
	None
Returns:
	None

enable texture modulate mode.  
the image is modulate with the shading of the surface.") EnableModulate;
		void EnableModulate ();
		%feature("autodoc", "Args:
	None
Returns:
	None

disable texture modulate mode.  
the image is directly decal on the surface.") DisableModulate;
		void DisableModulate ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the texture is modulate.") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("autodoc", "Args:
	None
Returns:
	None

use this methods if you want to enable  
texture repetition on your objects.") EnableRepeat;
		void EnableRepeat ();
		%feature("autodoc", "Args:
	None
Returns:
	None

use this methods if you want to disable  
texture repetition on your objects.") DisableRepeat;
		void DisableRepeat ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the texture repeat is enable.") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_LevelOfTextureAnisotropy

@return level of anisontropy texture filter.  
Default value is Graphic3d_LOTA_OFF.") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("autodoc", "Args:
	theLevel(Graphic3d_LevelOfTextureAnisotropy)

Returns:
	None

@param theLevel level of anisontropy texture filter.") SetAnisoFilter;
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
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_NameOfTexture1D

Returns the name of the predefined textures or NOT_1D_UNKNOWN  
when the name is given as a filename.") Name;
		Graphic3d_NameOfTexture1D Name ();
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the number of predefined textures.") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("autodoc", "Args:
	aRank(Standard_Integer)

Returns:
	static TCollection_AsciiString

Returns the name of the predefined texture of rank <aRank>") TextureName;
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
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_NameOfTexture2D

Returns the name of the predefined textures or NOT_2D_UNKNOWN  
when the name is given as a filename.") Name;
		Graphic3d_NameOfTexture2D Name ();
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the number of predefined textures.") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	static TCollection_AsciiString

Returns the name of the predefined texture of rank <aRank>") TextureName;
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
		%feature("autodoc", "Args:
	theFileName(TCollection_AsciiString)

Returns:
	None

Creates a texture from the file FileName.") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "Args:
	theNOT(Graphic3d_NameOfTexture1D)

Returns:
	None

Create a texture from a predefined texture name set.") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Graphic3d_NameOfTexture1D theNOT);
		%feature("autodoc", "Args:
	thePixMap(Image_PixMap_Handle)

Returns:
	None

Creates a texture from the pixmap.") Graphic3d_Texture1Dmanual;
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
		%feature("autodoc", "Args:
	theFileName(TCollection_AsciiString)

Returns:
	None

Creates a texture from a file") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "Args:
	theNOT(Graphic3d_NameOfTexture1D)

Returns:
	None

Creates a texture from a predefined texture name set.") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Graphic3d_NameOfTexture1D theNOT);
		%feature("autodoc", "Args:
	thePixMap(Image_PixMap_Handle)

Returns:
	None

Creates a texture from the pixmap.") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Image_PixMap_Handle & thePixMap);
		%feature("autodoc", "Args:
	theX1(Standard_ShortReal)
	theY1(Standard_ShortReal)
	theZ1(Standard_ShortReal)
	theX2(Standard_ShortReal)
	theY2(Standard_ShortReal)
	theZ2(Standard_ShortReal)

Returns:
	None

Sets the texture application bounds. Defines the way  
the texture is stretched across facets.  
Default values are <0.0, 0.0, 0.0> , <0.0, 0.0, 1.0>") SetSegment;
		void SetSegment (const Standard_ShortReal theX1,const Standard_ShortReal theY1,const Standard_ShortReal theZ1,const Standard_ShortReal theX2,const Standard_ShortReal theY2,const Standard_ShortReal theZ2);
		%feature("autodoc", "Args:
	theX1(Standard_ShortReal)
	theY1(Standard_ShortReal)
	theZ1(Standard_ShortReal)
	theX2(Standard_ShortReal)
	theY2(Standard_ShortReal)
	theZ2(Standard_ShortReal)

Returns:
	None

Returns the values of the current segment X1, Y1, Z1 , X2, Y2, Z2.") Segment;
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
		%feature("autodoc", "Args:
	theFileName(TCollection_AsciiString)

Returns:
	None

Creates a texture from a file") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "Args:
	theNOT(Graphic3d_NameOfTexture2D)

Returns:
	None

Creates a texture from a predefined texture name set.") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Graphic3d_NameOfTexture2D theNOT);
		%feature("autodoc", "Args:
	thePixMap(Image_PixMap_Handle)

Returns:
	None

Creates a texture from the pixmap.") Graphic3d_Texture2Dmanual;
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
		%feature("autodoc", "Args:
	theFileName(TCollection_AsciiString)

Returns:
	None

Creates a texture from a file") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const TCollection_AsciiString & theFileName);
		%feature("autodoc", "Args:
	theNOT(Graphic3d_NameOfTexture2D)

Returns:
	None

Creates a texture from a predefined texture name set.") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Graphic3d_NameOfTexture2D theNOT);
		%feature("autodoc", "Args:
	thePixMap(Image_PixMap_Handle)

Returns:
	None

Creates a texture from the pixmap.") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Image_PixMap_Handle & thePixMap);
		%feature("autodoc", "Args:
	A(Standard_ShortReal)
	B(Standard_ShortReal)
	C(Standard_ShortReal)
	D(Standard_ShortReal)

Returns:
	None

Defines the texture projection plane for texture coordinate S  
default is <1.0, 0.0, 0.0, 0.0>") SetPlaneS;
		void SetPlaneS (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);
		%feature("autodoc", "Args:
	A(Standard_ShortReal)
	B(Standard_ShortReal)
	C(Standard_ShortReal)
	D(Standard_ShortReal)

Returns:
	None

Defines the texture projection plane for texture coordinate T  
default is <0.0, 1.0, 0.0, 0.0>") SetPlaneT;
		void SetPlaneT (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);
		%feature("autodoc", "Args:
	thePlane(Graphic3d_NameOfTexturePlane)

Returns:
	None

Defines the texture projection plane for both S and T texture coordinate  
default is NOTP_XY meaning:  
     <1.0, 0.0, 0.0, 0.0> for S  
and  <0.0, 1.0, 0.0, 0.0> for T") SetPlane;
		void SetPlane (const Graphic3d_NameOfTexturePlane thePlane);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Defines the texture scale for the S texture coordinate  
much easier than recomputing the S plane equation  
but the result is the same  
default to 1.0") SetScaleS;
		void SetScaleS (const Standard_ShortReal theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Defines the texture scale for the T texture coordinate  
much easier than recompution the T plane equation  
but the result is the same  
default to 1.0") SetScaleT;
		void SetScaleT (const Standard_ShortReal theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Defines the texture translation for the S texture coordinate  
you can obtain the same effect by modifying the S plane  
equation but its not easier.  
default to 0.0") SetTranslateS;
		void SetTranslateS (const Standard_ShortReal theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Defines the texture translation for the T texture coordinate  
you can obtain the same effect by modifying the T plane  
equation but its not easier.  
default to 0.0") SetTranslateT;
		void SetTranslateT (const Standard_ShortReal theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Sets the rotation angle of the whole texture.  
the same result might be achieved by recomputing the  
S and T plane equation but it's not the easiest way...  
the angle is expressed in degrees  
default is 0.0") SetRotation;
		void SetRotation (const Standard_ShortReal theVal);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_NameOfTexturePlane

Returns the current texture plane name or NOTP_UNKNOWN  
when the plane is user defined.") Plane;
		Graphic3d_NameOfTexturePlane Plane ();
		%feature("autodoc", "Args:
	A(Standard_ShortReal)
	B(Standard_ShortReal)
	C(Standard_ShortReal)
	D(Standard_ShortReal)

Returns:
	None

Returns the current texture plane S equation") PlaneS;
		void PlaneS (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);
		%feature("autodoc", "Args:
	A(Standard_ShortReal)
	B(Standard_ShortReal)
	C(Standard_ShortReal)
	D(Standard_ShortReal)

Returns:
	None

Returns   the current texture plane T equation") PlaneT;
		void PlaneT (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Returns  the current texture S translation value") TranslateS;
		void TranslateS (Standard_ShortReal & theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Returns the current texture T translation value") TranslateT;
		void TranslateT (Standard_ShortReal & theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Returns the current texture S scale value") ScaleS;
		void ScaleS (Standard_ShortReal & theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Returns the current texture T scale value") ScaleT;
		void ScaleT (Standard_ShortReal & theVal);
		%feature("autodoc", "Args:
	theVal(Standard_ShortReal)

Returns:
	None

Returns the current texture rotation angle") Rotation;
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

