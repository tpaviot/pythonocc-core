from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.RWMesh import *
from OCC.Core.TCollection import *
from OCC.Core.XCAFPrs import *
from OCC.Core.TDocStd import *
from OCC.Core.TDF import *
from OCC.Core.TColStd import *
from OCC.Core.Message import *
from OCC.Core.Quantity import *
from OCC.Core.Poly import *
from OCC.Core.XCAFDoc import *
from OCC.Core.Image import *
from OCC.Core.XSControl import *
from OCC.Core.TopoDS import *
from OCC.Core.TopTools import *
from OCC.Core.TopLoc import *
from OCC.Core.Graphic3d import *

#the following typedef cannot be wrapped as is
RWGltf_JsonValue = NewType('RWGltf_JsonValue', Any)

class RWGltf_GltfAccessorCompType(IntEnum):
    RWGltf_GltfAccessorCompType_UNKNOWN: int = ...
    RWGltf_GltfAccessorCompType_Int8: int = ...
    RWGltf_GltfAccessorCompType_UInt8: int = ...
    RWGltf_GltfAccessorCompType_Int16: int = ...
    RWGltf_GltfAccessorCompType_UInt16: int = ...
    RWGltf_GltfAccessorCompType_UInt32: int = ...
    RWGltf_GltfAccessorCompType_Float32: int = ...

RWGltf_GltfAccessorCompType_UNKNOWN = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UNKNOWN
RWGltf_GltfAccessorCompType_Int8 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_Int8
RWGltf_GltfAccessorCompType_UInt8 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UInt8
RWGltf_GltfAccessorCompType_Int16 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_Int16
RWGltf_GltfAccessorCompType_UInt16 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UInt16
RWGltf_GltfAccessorCompType_UInt32 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UInt32
RWGltf_GltfAccessorCompType_Float32 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_Float32

class RWGltf_GltfAccessorLayout(IntEnum):
    RWGltf_GltfAccessorLayout_UNKNOWN: int = ...
    RWGltf_GltfAccessorLayout_Scalar: int = ...
    RWGltf_GltfAccessorLayout_Vec2: int = ...
    RWGltf_GltfAccessorLayout_Vec3: int = ...
    RWGltf_GltfAccessorLayout_Vec4: int = ...
    RWGltf_GltfAccessorLayout_Mat2: int = ...
    RWGltf_GltfAccessorLayout_Mat3: int = ...
    RWGltf_GltfAccessorLayout_Mat4: int = ...

RWGltf_GltfAccessorLayout_UNKNOWN = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_UNKNOWN
RWGltf_GltfAccessorLayout_Scalar = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Scalar
RWGltf_GltfAccessorLayout_Vec2 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Vec2
RWGltf_GltfAccessorLayout_Vec3 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Vec3
RWGltf_GltfAccessorLayout_Vec4 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Vec4
RWGltf_GltfAccessorLayout_Mat2 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Mat2
RWGltf_GltfAccessorLayout_Mat3 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Mat3
RWGltf_GltfAccessorLayout_Mat4 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Mat4

class RWGltf_GltfAlphaMode(IntEnum):
    RWGltf_GltfAlphaMode_Opaque: int = ...
    RWGltf_GltfAlphaMode_Mask: int = ...
    RWGltf_GltfAlphaMode_Blend: int = ...

RWGltf_GltfAlphaMode_Opaque = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Opaque
RWGltf_GltfAlphaMode_Mask = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Mask
RWGltf_GltfAlphaMode_Blend = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Blend

class RWGltf_GltfArrayType(IntEnum):
    RWGltf_GltfArrayType_UNKNOWN: int = ...
    RWGltf_GltfArrayType_Indices: int = ...
    RWGltf_GltfArrayType_Position: int = ...
    RWGltf_GltfArrayType_Normal: int = ...
    RWGltf_GltfArrayType_Color: int = ...
    RWGltf_GltfArrayType_TCoord0: int = ...
    RWGltf_GltfArrayType_TCoord1: int = ...
    RWGltf_GltfArrayType_Joint: int = ...
    RWGltf_GltfArrayType_Weight: int = ...

RWGltf_GltfArrayType_UNKNOWN = RWGltf_GltfArrayType.RWGltf_GltfArrayType_UNKNOWN
RWGltf_GltfArrayType_Indices = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Indices
RWGltf_GltfArrayType_Position = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Position
RWGltf_GltfArrayType_Normal = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Normal
RWGltf_GltfArrayType_Color = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Color
RWGltf_GltfArrayType_TCoord0 = RWGltf_GltfArrayType.RWGltf_GltfArrayType_TCoord0
RWGltf_GltfArrayType_TCoord1 = RWGltf_GltfArrayType.RWGltf_GltfArrayType_TCoord1
RWGltf_GltfArrayType_Joint = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Joint
RWGltf_GltfArrayType_Weight = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Weight

class RWGltf_GltfBufferViewTarget(IntEnum):
    RWGltf_GltfBufferViewTarget_UNKNOWN: int = ...
    RWGltf_GltfBufferViewTarget_ARRAY_BUFFER: int = ...
    RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER: int = ...

RWGltf_GltfBufferViewTarget_UNKNOWN = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_UNKNOWN
RWGltf_GltfBufferViewTarget_ARRAY_BUFFER = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_ARRAY_BUFFER
RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER

class RWGltf_GltfPrimitiveMode(IntEnum):
    RWGltf_GltfPrimitiveMode_UNKNOWN: int = ...
    RWGltf_GltfPrimitiveMode_Points: int = ...
    RWGltf_GltfPrimitiveMode_Lines: int = ...
    RWGltf_GltfPrimitiveMode_LineLoop: int = ...
    RWGltf_GltfPrimitiveMode_LineStrip: int = ...
    RWGltf_GltfPrimitiveMode_Triangles: int = ...
    RWGltf_GltfPrimitiveMode_TriangleStrip: int = ...
    RWGltf_GltfPrimitiveMode_TriangleFan: int = ...

RWGltf_GltfPrimitiveMode_UNKNOWN = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_UNKNOWN
RWGltf_GltfPrimitiveMode_Points = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_Points
RWGltf_GltfPrimitiveMode_Lines = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_Lines
RWGltf_GltfPrimitiveMode_LineLoop = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_LineLoop
RWGltf_GltfPrimitiveMode_LineStrip = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_LineStrip
RWGltf_GltfPrimitiveMode_Triangles = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_Triangles
RWGltf_GltfPrimitiveMode_TriangleStrip = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_TriangleStrip
RWGltf_GltfPrimitiveMode_TriangleFan = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_TriangleFan

class RWGltf_GltfRootElement(IntEnum):
    RWGltf_GltfRootElement_Asset: int = ...
    RWGltf_GltfRootElement_Scenes: int = ...
    RWGltf_GltfRootElement_Scene: int = ...
    RWGltf_GltfRootElement_Nodes: int = ...
    RWGltf_GltfRootElement_Meshes: int = ...
    RWGltf_GltfRootElement_Accessors: int = ...
    RWGltf_GltfRootElement_BufferViews: int = ...
    RWGltf_GltfRootElement_Buffers: int = ...
    RWGltf_GltfRootElement_NB_MANDATORY: int = ...
    RWGltf_GltfRootElement_Animations: int = ...
    RWGltf_GltfRootElement_Materials: int = ...
    RWGltf_GltfRootElement_Programs: int = ...
    RWGltf_GltfRootElement_Samplers: int = ...
    RWGltf_GltfRootElement_Shaders: int = ...
    RWGltf_GltfRootElement_Skins: int = ...
    RWGltf_GltfRootElement_Techniques: int = ...
    RWGltf_GltfRootElement_Textures: int = ...
    RWGltf_GltfRootElement_Images: int = ...
    RWGltf_GltfRootElement_ExtensionsUsed: int = ...
    RWGltf_GltfRootElement_ExtensionsRequired: int = ...
    RWGltf_GltfRootElement_NB: int = ...

RWGltf_GltfRootElement_Asset = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Asset
RWGltf_GltfRootElement_Scenes = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Scenes
RWGltf_GltfRootElement_Scene = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Scene
RWGltf_GltfRootElement_Nodes = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Nodes
RWGltf_GltfRootElement_Meshes = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Meshes
RWGltf_GltfRootElement_Accessors = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Accessors
RWGltf_GltfRootElement_BufferViews = RWGltf_GltfRootElement.RWGltf_GltfRootElement_BufferViews
RWGltf_GltfRootElement_Buffers = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Buffers
RWGltf_GltfRootElement_NB_MANDATORY = RWGltf_GltfRootElement.RWGltf_GltfRootElement_NB_MANDATORY
RWGltf_GltfRootElement_Animations = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Animations
RWGltf_GltfRootElement_Materials = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Materials
RWGltf_GltfRootElement_Programs = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Programs
RWGltf_GltfRootElement_Samplers = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Samplers
RWGltf_GltfRootElement_Shaders = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Shaders
RWGltf_GltfRootElement_Skins = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Skins
RWGltf_GltfRootElement_Techniques = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Techniques
RWGltf_GltfRootElement_Textures = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Textures
RWGltf_GltfRootElement_Images = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Images
RWGltf_GltfRootElement_ExtensionsUsed = RWGltf_GltfRootElement.RWGltf_GltfRootElement_ExtensionsUsed
RWGltf_GltfRootElement_ExtensionsRequired = RWGltf_GltfRootElement.RWGltf_GltfRootElement_ExtensionsRequired
RWGltf_GltfRootElement_NB = RWGltf_GltfRootElement.RWGltf_GltfRootElement_NB

class RWGltf_WriterTrsfFormat(IntEnum):
    RWGltf_WriterTrsfFormat_Compact: int = ...
    RWGltf_WriterTrsfFormat_Mat4: int = ...
    RWGltf_WriterTrsfFormat_TRS: int = ...

RWGltf_WriterTrsfFormat_Compact = RWGltf_WriterTrsfFormat.RWGltf_WriterTrsfFormat_Compact
RWGltf_WriterTrsfFormat_Mat4 = RWGltf_WriterTrsfFormat.RWGltf_WriterTrsfFormat_Mat4
RWGltf_WriterTrsfFormat_TRS = RWGltf_WriterTrsfFormat.RWGltf_WriterTrsfFormat_TRS


class RWGltf_CafReader(RWMesh_CafReader):
    def __init__(self) -> None: ...
    def IsDoublePrecision(self) -> bool: ...
    def SetDoublePrecision(self, theIsDouble: bool) -> None: ...
    def SetLoadAllScenes(self, theToLoadAll: bool) -> None: ...
    def SetMeshNameAsFallback(self, theToFallback: bool) -> None: ...
    def SetParallel(self, theToParallel: bool) -> None: ...
    def SetSkipEmptyNodes(self, theToSkip: bool) -> None: ...
    def SetToKeepLateData(self, theToKeep: bool) -> None: ...
    def SetToPrintDebugMessages(self, theToPrint: bool) -> None: ...
    def SetToSkipLateDataLoading(self, theToSkip: bool) -> None: ...
    def ToKeepLateData(self) -> bool: ...
    def ToLoadAllScenes(self) -> bool: ...
    def ToParallel(self) -> bool: ...
    def ToPrintDebugMessages(self) -> bool: ...
    def ToSkipEmptyNodes(self) -> bool: ...
    def ToSkipLateDataLoading(self) -> bool: ...
    def ToUseMeshNameAsFallback(self) -> bool: ...

class RWGltf_CafWriter(Standard_Transient):
    def __init__(self, theFile: TCollection_AsciiString, theIsBinary: bool) -> None: ...
    def ChangeCoordinateSystemConverter(self) -> RWMesh_CoordinateSystemConverter: ...
    def CompressionParameters(self) -> RWGltf_DracoParameters: ...
    def CoordinateSystemConverter(self) -> RWMesh_CoordinateSystemConverter: ...
    def DefaultStyle(self) -> XCAFPrs_Style: ...
    def IsBinary(self) -> bool: ...
    def IsForcedUVExport(self) -> bool: ...
    def MeshNameFormat(self) -> RWMesh_NameFormat: ...
    def NodeNameFormat(self) -> RWMesh_NameFormat: ...
    @overload
    def Perform(self, theDocument: TDocStd_Document, theRootLabels: TDF_LabelSequence, theLabelFilter: TColStd_MapOfAsciiString, theFileInfo: TColStd_IndexedDataMapOfStringString, theProgress: Message_ProgressRange) -> bool: ...
    @overload
    def Perform(self, theDocument: TDocStd_Document, theFileInfo: TColStd_IndexedDataMapOfStringString, theProgress: Message_ProgressRange) -> bool: ...
    def SetCompressionParameters(self, theDracoParameters: RWGltf_DracoParameters) -> None: ...
    def SetCoordinateSystemConverter(self, theConverter: RWMesh_CoordinateSystemConverter) -> None: ...
    def SetDefaultStyle(self, theStyle: XCAFPrs_Style) -> None: ...
    def SetForcedUVExport(self, theToForce: bool) -> None: ...
    def SetMergeFaces(self, theToMerge: bool) -> None: ...
    def SetMeshNameFormat(self, theFormat: RWMesh_NameFormat) -> None: ...
    def SetNodeNameFormat(self, theFormat: RWMesh_NameFormat) -> None: ...
    def SetParallel(self, theToParallel: bool) -> None: ...
    def SetSplitIndices16(self, theToSplit: bool) -> None: ...
    def SetToEmbedTexturesInGlb(self, theToEmbedTexturesInGlb: bool) -> None: ...
    def SetTransformationFormat(self, theFormat: RWGltf_WriterTrsfFormat) -> None: ...
    def ToEmbedTexturesInGlb(self) -> bool: ...
    def ToMergeFaces(self) -> bool: ...
    def ToParallel(self) -> bool: ...
    def ToSplitIndices16(self) -> bool: ...
    def TransformationFormat(self) -> RWGltf_WriterTrsfFormat: ...

class RWGltf_ConfigurationNode(DE_ConfigurationNode):
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theNode: RWGltf_ConfigurationNode) -> None: ...
    def BuildProvider(self) -> False: ...
    def Copy(self) -> False: ...
    def GetExtensions(self) -> TColStd_ListOfAsciiString: ...
    def GetFormat(self) -> TCollection_AsciiString: ...
    def GetVendor(self) -> TCollection_AsciiString: ...
    def IsExportSupported(self) -> bool: ...
    def IsImportSupported(self) -> bool: ...
    def Save(self) -> TCollection_AsciiString: ...

class RWGltf_DracoParameters:
    def __init__(self) -> None: ...

class RWGltf_GltfAccessor:
    def __init__(self) -> None: ...

class RWGltf_GltfBufferView:
    def __init__(self) -> None: ...

class RWGltf_GltfFace(Standard_Transient):
    def __init__(self) -> None: ...

class RWGltf_GltfLatePrimitiveArray(RWMesh_TriangulationSource):
    def __init__(self, theId: TCollection_AsciiString, theName: TCollection_AsciiString) -> None: ...
    def AddPrimArrayData(self, theType: RWGltf_GltfArrayType) -> RWGltf_GltfPrimArrayData: ...
    def BaseColor(self) -> Quantity_ColorRGBA: ...
    def Data(self) -> False: ...
    def HasDeferredData(self) -> bool: ...
    def HasStyle(self) -> bool: ...
    def Id(self) -> TCollection_AsciiString: ...
    def LoadStreamData(self) -> Poly_Triangulation: ...
    def MaterialCommon(self) -> RWGltf_MaterialCommon: ...
    def MaterialPbr(self) -> RWGltf_MaterialMetallicRoughness: ...
    def Name(self) -> TCollection_AsciiString: ...
    def PrimitiveMode(self) -> RWGltf_GltfPrimitiveMode: ...
    def SetMaterialCommon(self, theMat: RWGltf_MaterialCommon) -> None: ...
    def SetMaterialPbr(self, theMat: RWGltf_MaterialMetallicRoughness) -> None: ...
    def SetName(self, theName: TCollection_AsciiString) -> None: ...
    def SetPrimitiveMode(self, theMode: RWGltf_GltfPrimitiveMode) -> None: ...

class RWGltf_GltfMaterialMap(RWMesh_MaterialMap):
    def __init__(self, theFile: TCollection_AsciiString, theDefSamplerId: int) -> None: ...
    def AddImages(self, theWriter: RWGltf_GltfOStreamWriter, theStyle: XCAFPrs_Style) -> bool: ...
    def AddMaterial(self, theWriter: RWGltf_GltfOStreamWriter, theStyle: XCAFPrs_Style) -> bool: ...
    def AddTextures(self, theWriter: RWGltf_GltfOStreamWriter, theStyle: XCAFPrs_Style) -> bool: ...
    def FlushGlbBufferViews(self, theWriter: RWGltf_GltfOStreamWriter, theBinDataBufferId: int) -> int: ...
    def FlushGlbImages(self, theWriter: RWGltf_GltfOStreamWriter) -> None: ...
    def NbImages(self) -> int: ...
    def NbTextures(self) -> int: ...
    @staticmethod
    def baseColorTexture(theMat: XCAFDoc_VisMaterial) -> Image_Texture: ...

class RWGltf_GltfOStreamWriter():
    pass

class RWGltf_GltfPrimArrayData:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theType: RWGltf_GltfArrayType) -> None: ...

class RWGltf_MaterialCommon(Standard_Transient):
    def __init__(self) -> None: ...

class RWGltf_MaterialMetallicRoughness(Standard_Transient):
    def __init__(self) -> None: ...

class RWGltf_Provider(DE_Provider):
    @overload
    def __init__(self) -> None: ...
    def GetFormat(self) -> TCollection_AsciiString: ...
    def GetVendor(self) -> TCollection_AsciiString: ...
    @overload
    def Read(self, thePath: TCollection_AsciiString, theDocument: TDocStd_Document, theWS: XSControl_WorkSession, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Read(self, thePath: TCollection_AsciiString, theDocument: TDocStd_Document, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Read(self, thePath: TCollection_AsciiString, theShape: TopoDS_Shape, theWS: XSControl_WorkSession, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Read(self, thePath: TCollection_AsciiString, theShape: TopoDS_Shape, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Write(self, thePath: TCollection_AsciiString, theDocument: TDocStd_Document, theWS: XSControl_WorkSession, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Write(self, thePath: TCollection_AsciiString, theDocument: TDocStd_Document, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Write(self, thePath: TCollection_AsciiString, theShape: TopoDS_Shape, theWS: XSControl_WorkSession, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...
    @overload
    def Write(self, thePath: TCollection_AsciiString, theShape: TopoDS_Shape, theProgress: Optional[Message_ProgressRange] = Message_ProgressRange()) -> bool: ...

class RWGltf_TriangulationReader(RWMesh_TriangulationReader):
    def __init__(self) -> None: ...
    def LoadStreamData(self, theSourceMesh: RWMesh_TriangulationSource, theDestMesh: Poly_Triangulation) -> bool: ...

class RWGltf_GltfSceneNodeMap(, >):
    def __init__(self) -> None: ...
    def FindIndex(self, theNodeId: TCollection_AsciiString) -> int: ...

#classnotwrapped
class RWGltf_GltfSharedIStream: ...

# harray1 classes
# harray2 classes
# hsequence classes

RWGltf_GltfMaterialMap_baseColorTexture = RWGltf_GltfMaterialMap.baseColorTexture
