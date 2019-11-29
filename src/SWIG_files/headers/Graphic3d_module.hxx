#ifndef GRAPHIC3D_HXX
#define GRAPHIC3D_HXX

/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

#include<Graphic3d_AlphaMode.hxx>
#include<Graphic3d_ArrayFlags.hxx>
#include<Graphic3d_ArrayOfPoints.hxx>
#include<Graphic3d_ArrayOfPolygons.hxx>
#include<Graphic3d_ArrayOfPolylines.hxx>
#include<Graphic3d_ArrayOfPrimitives.hxx>
#include<Graphic3d_ArrayOfQuadrangleStrips.hxx>
#include<Graphic3d_ArrayOfQuadrangles.hxx>
#include<Graphic3d_ArrayOfSegments.hxx>
#include<Graphic3d_ArrayOfTriangleFans.hxx>
#include<Graphic3d_ArrayOfTriangleStrips.hxx>
#include<Graphic3d_ArrayOfTriangles.hxx>
#include<Graphic3d_AspectFillArea3d.hxx>
#include<Graphic3d_AspectLine3d.hxx>
#include<Graphic3d_AspectMarker3d.hxx>
#include<Graphic3d_AspectText3d.hxx>
#include<Graphic3d_Aspects.hxx>
#include<Graphic3d_AttribBuffer.hxx>
#include<Graphic3d_BSDF.hxx>
#include<Graphic3d_BndBox3d.hxx>
#include<Graphic3d_BndBox4d.hxx>
#include<Graphic3d_BndBox4f.hxx>
#include<Graphic3d_BoundBuffer.hxx>
#include<Graphic3d_Buffer.hxx>
#include<Graphic3d_BufferRange.hxx>
#include<Graphic3d_BufferType.hxx>
#include<Graphic3d_BvhCStructureSet.hxx>
#include<Graphic3d_BvhCStructureSetTrsfPers.hxx>
#include<Graphic3d_CLight.hxx>
#include<Graphic3d_CStructure.hxx>
#include<Graphic3d_CTexture.hxx>
#include<Graphic3d_CView.hxx>
#include<Graphic3d_Camera.hxx>
#include<Graphic3d_CameraTile.hxx>
#include<Graphic3d_CappingFlags.hxx>
#include<Graphic3d_ClipPlane.hxx>
#include<Graphic3d_CubeMap.hxx>
#include<Graphic3d_CubeMapOrder.hxx>
#include<Graphic3d_CubeMapPacked.hxx>
#include<Graphic3d_CubeMapSeparate.hxx>
#include<Graphic3d_CubeMapSide.hxx>
#include<Graphic3d_CullingTool.hxx>
#include<Graphic3d_DataStructureManager.hxx>
#include<Graphic3d_DiagnosticInfo.hxx>
#include<Graphic3d_FrameStats.hxx>
#include<Graphic3d_FrameStatsCounter.hxx>
#include<Graphic3d_FrameStatsData.hxx>
#include<Graphic3d_FrameStatsTimer.hxx>
#include<Graphic3d_GraduatedTrihedron.hxx>
#include<Graphic3d_GraphicDriver.hxx>
#include<Graphic3d_Group.hxx>
#include<Graphic3d_GroupAspect.hxx>
#include<Graphic3d_GroupDefinitionError.hxx>
#include<Graphic3d_HatchStyle.hxx>
#include<Graphic3d_HighlightStyle.hxx>
#include<Graphic3d_HorizontalTextAlignment.hxx>
#include<Graphic3d_IndexBuffer.hxx>
#include<Graphic3d_Layer.hxx>
#include<Graphic3d_LevelOfTextureAnisotropy.hxx>
#include<Graphic3d_LightSet.hxx>
#include<Graphic3d_MapIteratorOfMapOfStructure.hxx>
#include<Graphic3d_MapOfAspectsToAspects.hxx>
#include<Graphic3d_MapOfObject.hxx>
#include<Graphic3d_MapOfStructure.hxx>
#include<Graphic3d_MapOfZLayerSettings.hxx>
#include<Graphic3d_MarkerImage.hxx>
#include<Graphic3d_Mat4.hxx>
#include<Graphic3d_Mat4d.hxx>
#include<Graphic3d_MaterialAspect.hxx>
#include<Graphic3d_MaterialDefinitionError.hxx>
#include<Graphic3d_MediaTexture.hxx>
#include<Graphic3d_MediaTextureSet.hxx>
#include<Graphic3d_MutableIndexBuffer.hxx>
#include<Graphic3d_NMapOfTransient.hxx>
#include<Graphic3d_NameOfMaterial.hxx>
#include<Graphic3d_NameOfTexture1D.hxx>
#include<Graphic3d_NameOfTexture2D.hxx>
#include<Graphic3d_NameOfTextureEnv.hxx>
#include<Graphic3d_NameOfTexturePlane.hxx>
#include<Graphic3d_PolygonOffset.hxx>
#include<Graphic3d_PresentationAttributes.hxx>
#include<Graphic3d_PriorityDefinitionError.hxx>
#include<Graphic3d_RenderTransparentMethod.hxx>
#include<Graphic3d_RenderingMode.hxx>
#include<Graphic3d_RenderingParams.hxx>
#include<Graphic3d_SequenceOfGroup.hxx>
#include<Graphic3d_SequenceOfHClipPlane.hxx>
#include<Graphic3d_SequenceOfStructure.hxx>
#include<Graphic3d_ShaderAttribute.hxx>
#include<Graphic3d_ShaderObject.hxx>
#include<Graphic3d_ShaderProgram.hxx>
#include<Graphic3d_ShaderVariable.hxx>
#include<Graphic3d_StereoMode.hxx>
#include<Graphic3d_Structure.hxx>
#include<Graphic3d_StructureDefinitionError.hxx>
#include<Graphic3d_StructureManager.hxx>
#include<Graphic3d_Text.hxx>
#include<Graphic3d_TextPath.hxx>
#include<Graphic3d_Texture1D.hxx>
#include<Graphic3d_Texture1Dmanual.hxx>
#include<Graphic3d_Texture1Dsegment.hxx>
#include<Graphic3d_Texture2D.hxx>
#include<Graphic3d_Texture2Dmanual.hxx>
#include<Graphic3d_Texture2Dplane.hxx>
#include<Graphic3d_TextureEnv.hxx>
#include<Graphic3d_TextureMap.hxx>
#include<Graphic3d_TextureParams.hxx>
#include<Graphic3d_TextureRoot.hxx>
#include<Graphic3d_TextureSet.hxx>
#include<Graphic3d_TextureUnit.hxx>
#include<Graphic3d_ToneMappingMethod.hxx>
#include<Graphic3d_TransModeFlags.hxx>
#include<Graphic3d_TransformError.hxx>
#include<Graphic3d_TransformPers.hxx>
#include<Graphic3d_TransformUtils.hxx>
#include<Graphic3d_TypeOfAnswer.hxx>
#include<Graphic3d_TypeOfBackfacingModel.hxx>
#include<Graphic3d_TypeOfBackground.hxx>
#include<Graphic3d_TypeOfComposition.hxx>
#include<Graphic3d_TypeOfConnection.hxx>
#include<Graphic3d_TypeOfLightSource.hxx>
#include<Graphic3d_TypeOfLimit.hxx>
#include<Graphic3d_TypeOfMaterial.hxx>
#include<Graphic3d_TypeOfPrimitiveArray.hxx>
#include<Graphic3d_TypeOfReflection.hxx>
#include<Graphic3d_TypeOfShaderObject.hxx>
#include<Graphic3d_TypeOfShadingModel.hxx>
#include<Graphic3d_TypeOfStructure.hxx>
#include<Graphic3d_TypeOfTexture.hxx>
#include<Graphic3d_TypeOfTextureFilter.hxx>
#include<Graphic3d_TypeOfTextureMode.hxx>
#include<Graphic3d_TypeOfVisualization.hxx>
#include<Graphic3d_Vec.hxx>
#include<Graphic3d_Vec2.hxx>
#include<Graphic3d_Vec3.hxx>
#include<Graphic3d_Vec4.hxx>
#include<Graphic3d_Vertex.hxx>
#include<Graphic3d_VerticalTextAlignment.hxx>
#include<Graphic3d_ViewAffinity.hxx>
#include<Graphic3d_WorldViewProjState.hxx>
#include<Graphic3d_ZLayerId.hxx>
#include<Graphic3d_ZLayerSettings.hxx>

#endif // GRAPHIC3D_HXX
