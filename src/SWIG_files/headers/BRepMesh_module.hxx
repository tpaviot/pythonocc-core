/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
#ifndef BREPMESH_HXX
#define BREPMESH_HXX


#include<BRepMesh_BaseMeshAlgo.hxx>
#include<BRepMesh_BoundaryParamsRangeSplitter.hxx>
#include<BRepMesh_Circle.hxx>
#include<BRepMesh_CircleInspector.hxx>
#include<BRepMesh_CircleTool.hxx>
#include<BRepMesh_Classifier.hxx>
#include<BRepMesh_ConstrainedBaseMeshAlgo.hxx>
#include<BRepMesh_Context.hxx>
#include<BRepMesh_CurveTessellator.hxx>
#include<BRepMesh_CustomBaseMeshAlgo.hxx>
#include<BRepMesh_CustomDelaunayBaseMeshAlgo.hxx>
#include<BRepMesh_CylinderRangeSplitter.hxx>
#include<BRepMesh_DataStructureOfDelaun.hxx>
#include<BRepMesh_DefaultRangeSplitter.hxx>
#include<BRepMesh_Deflection.hxx>
#include<BRepMesh_DegreeOfFreedom.hxx>
#include<BRepMesh_DelabellaBaseMeshAlgo.hxx>
#include<BRepMesh_DelabellaMeshAlgoFactory.hxx>
#include<BRepMesh_Delaun.hxx>
#include<BRepMesh_DelaunayBaseMeshAlgo.hxx>
#include<BRepMesh_DelaunayDeflectionControlMeshAlgo.hxx>
#include<BRepMesh_DelaunayNodeInsertionMeshAlgo.hxx>
#include<BRepMesh_DiscretFactory.hxx>
#include<BRepMesh_DiscretRoot.hxx>
#include<BRepMesh_Edge.hxx>
#include<BRepMesh_EdgeDiscret.hxx>
#include<BRepMesh_EdgeParameterProvider.hxx>
#include<BRepMesh_EdgeTessellationExtractor.hxx>
#include<BRepMesh_ExtrusionRangeSplitter.hxx>
#include<BRepMesh_FaceChecker.hxx>
#include<BRepMesh_FaceDiscret.hxx>
#include<BRepMesh_FactoryError.hxx>
#include<BRepMesh_FastDiscret.hxx>
#include<BRepMesh_GeomTool.hxx>
#include<BRepMesh_IncrementalMesh.hxx>
#include<BRepMesh_MeshAlgoFactory.hxx>
#include<BRepMesh_MeshTool.hxx>
#include<BRepMesh_ModelBuilder.hxx>
#include<BRepMesh_ModelHealer.hxx>
#include<BRepMesh_ModelPostProcessor.hxx>
#include<BRepMesh_ModelPreProcessor.hxx>
#include<BRepMesh_NURBSRangeSplitter.hxx>
#include<BRepMesh_NodeInsertionMeshAlgo.hxx>
#include<BRepMesh_OrientedEdge.hxx>
#include<BRepMesh_PairOfIndex.hxx>
#include<BRepMesh_PluginEntryType.hxx>
#include<BRepMesh_PluginMacro.hxx>
#include<BRepMesh_SelectorOfDataStructureOfDelaun.hxx>
#include<BRepMesh_ShapeTool.hxx>
#include<BRepMesh_ShapeVisitor.hxx>
#include<BRepMesh_SphereRangeSplitter.hxx>
#include<BRepMesh_TorusRangeSplitter.hxx>
#include<BRepMesh_Triangle.hxx>
#include<BRepMesh_Triangulator.hxx>
#include<BRepMesh_UVParamRangeSplitter.hxx>
#include<BRepMesh_UndefinedRangeSplitter.hxx>
#include<BRepMesh_Vertex.hxx>
#include<BRepMesh_VertexInspector.hxx>
#include<BRepMesh_VertexTool.hxx>

#endif // BREPMESH_HXX
