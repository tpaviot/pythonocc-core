from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.IVtk import *
from OCC.Core.gp import *
from OCC.Core.Graphic3d import *


class IVtkVTK_ShapeData(IVtk_IShapeData):
    def __init__(self) -> None: ...
    @staticmethod
    def ARRNAME_MESH_TYPES() -> str: ...
    @staticmethod
    def ARRNAME_SUBSHAPE_IDS() -> str: ...
    @overload
    def InsertLine(self, theShapeID: IVtk_IdType, thePointId1: IVtk_PointId, thePointId2: IVtk_PointId, theMeshType: IVtk_MeshType) -> None: ...
    @overload
    def InsertLine(self, theShapeID: IVtk_IdType, thePointIds: IVtk_PointIdList, theMeshType: IVtk_MeshType) -> None: ...
    def InsertPoint(self, thePnt: gp_Pnt, theNorm: float) -> IVtk_PointId: ...
    def InsertTriangle(self, theShapeID: IVtk_IdType, thePointId1: IVtk_PointId, thePointId2: IVtk_PointId, thePointId3: IVtk_PointId, theMeshType: IVtk_MeshType) -> None: ...
    def InsertVertex(self, theShapeID: IVtk_IdType, thePointId: IVtk_PointId, theMeshType: IVtk_MeshType) -> None: ...
    def getVtkPolyData(self) -> False: ...

class IVtkVTK_View(IVtk_IView):
    def DisplayToWorld(self, theDisplayPnt: gp_XY, theWorldPnt: gp_XYZ) -> bool: ...
    def GetAspectRatio(self) -> False: ...
    def GetCamera(self, theProj: Graphic3d_Mat4d, theOrient: Graphic3d_Mat4d) -> bool: ...
    def GetDistance(self) -> False: ...
    def GetParallelScale(self) -> False: ...
    def GetViewAngle(self) -> False: ...
    def GetViewport(self) -> Tuple[float, float, float, float]: ...
    def IsPerspective(self) -> bool: ...

# harray1 classes
# harray2 classes
# hsequence classes

IVtkVTK_ShapeData_ARRNAME_MESH_TYPES = IVtkVTK_ShapeData.ARRNAME_MESH_TYPES
IVtkVTK_ShapeData_ARRNAME_SUBSHAPE_IDS = IVtkVTK_ShapeData.ARRNAME_SUBSHAPE_IDS
