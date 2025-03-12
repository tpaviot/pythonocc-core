/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define PRS3DDOCSTRING
"Prs3d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_prs3d.html"
%enddef
%module (package="OCC.Core", docstring=PRS3DDOCSTRING) Prs3d


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Prs3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<Graphic3d_module.hxx>
#include<Poly_module.hxx>
#include<gp_module.hxx>
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<Aspect_module.hxx>
#include<Quantity_module.hxx>
#include<TColStd_module.hxx>
#include<TShort_module.hxx>
#include<TColQuantity_module.hxx>
#include<Message_module.hxx>
#include<BVH_module.hxx>
#include<V3d_module.hxx>
#include<Geom_module.hxx>
#include<SelectMgr_module.hxx>
#include<Select3D_module.hxx>
#include<Media_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<StdSelect_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import Graphic3d.i
%import Poly.i
%import gp.i
%import Bnd.i
%import TCollection.i
%import GeomAbs.i
%import Aspect.i
%import Quantity.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


%include "Prs3d_Point.hxx";
/* public enums */
enum Prs3d_DatumAttribute {
	Prs3d_DatumAttribute_XAxisLength = 0,
	Prs3d_DatumAttribute_YAxisLength = 1,
	Prs3d_DatumAttribute_ZAxisLength = 2,
	Prs3d_DatumAttribute_ShadingTubeRadiusPercent = 3,
	Prs3d_DatumAttribute_ShadingConeRadiusPercent = 4,
	Prs3d_DatumAttribute_ShadingConeLengthPercent = 5,
	Prs3d_DatumAttribute_ShadingOriginRadiusPercent = 6,
	Prs3d_DatumAttribute_ShadingNumberOfFacettes = 7,
	Prs3d_DA_XAxisLength = Prs3d_DatumAttribute_XAxisLength,
	Prs3d_DA_YAxisLength = Prs3d_DatumAttribute_YAxisLength,
	Prs3d_DA_ZAxisLength = Prs3d_DatumAttribute_ZAxisLength,
	Prs3d_DP_ShadingTubeRadiusPercent = Prs3d_DatumAttribute_ShadingTubeRadiusPercent,
	Prs3d_DP_ShadingConeRadiusPercent = Prs3d_DatumAttribute_ShadingConeRadiusPercent,
	Prs3d_DP_ShadingConeLengthPercent = Prs3d_DatumAttribute_ShadingConeLengthPercent,
	Prs3d_DP_ShadingOriginRadiusPercent = Prs3d_DatumAttribute_ShadingOriginRadiusPercent,
	Prs3d_DP_ShadingNumberOfFacettes = Prs3d_DatumAttribute_ShadingNumberOfFacettes,
};

enum  {
	Prs3d_DatumAttribute_NB = Prs3d_DatumAttribute_ShadingNumberOfFacettes + 1,
};

enum Prs3d_DatumAxes {
	Prs3d_DatumAxes_XAxis = 1,
	Prs3d_DatumAxes_YAxis = 2,
	Prs3d_DatumAxes_ZAxis = 4,
	Prs3d_DatumAxes_XYAxes = Prs3d_DatumAxes_XAxis | Prs3d_DatumAxes_YAxis,
	Prs3d_DatumAxes_YZAxes = Prs3d_DatumAxes_YAxis | Prs3d_DatumAxes_ZAxis,
	Prs3d_DatumAxes_XZAxes = Prs3d_DatumAxes_XAxis | Prs3d_DatumAxes_ZAxis,
	Prs3d_DatumAxes_XYZAxes = Prs3d_DatumAxes_XAxis | Prs3d_DatumAxes_YAxis | Prs3d_DatumAxes_ZAxis,
	Prs3d_DA_XAxis = Prs3d_DatumAxes_XAxis,
	Prs3d_DA_YAxis = Prs3d_DatumAxes_YAxis,
	Prs3d_DA_ZAxis = Prs3d_DatumAxes_ZAxis,
	Prs3d_DA_XYAxis = Prs3d_DatumAxes_XYAxes,
	Prs3d_DA_YZAxis = Prs3d_DatumAxes_YZAxes,
	Prs3d_DA_XZAxis = Prs3d_DatumAxes_XZAxes,
	Prs3d_DA_XYZAxis = Prs3d_DatumAxes_XYZAxes,
};

enum Prs3d_DatumMode {
	Prs3d_DM_WireFrame = 0,
	Prs3d_DM_Shaded = 1,
};

enum Prs3d_DatumParts {
	Prs3d_DatumParts_Origin = 0,
	Prs3d_DatumParts_XAxis = 1,
	Prs3d_DatumParts_YAxis = 2,
	Prs3d_DatumParts_ZAxis = 3,
	Prs3d_DatumParts_XArrow = 4,
	Prs3d_DatumParts_YArrow = 5,
	Prs3d_DatumParts_ZArrow = 6,
	Prs3d_DatumParts_XOYAxis = 7,
	Prs3d_DatumParts_YOZAxis = 8,
	Prs3d_DatumParts_XOZAxis = 9,
	Prs3d_DatumParts_None = 10,
	Prs3d_DP_Origin = Prs3d_DatumParts_Origin,
	Prs3d_DP_XAxis = Prs3d_DatumParts_XAxis,
	Prs3d_DP_YAxis = Prs3d_DatumParts_YAxis,
	Prs3d_DP_ZAxis = Prs3d_DatumParts_ZAxis,
	Prs3d_DP_XArrow = Prs3d_DatumParts_XArrow,
	Prs3d_DP_YArrow = Prs3d_DatumParts_YArrow,
	Prs3d_DP_ZArrow = Prs3d_DatumParts_ZArrow,
	Prs3d_DP_XOYAxis = Prs3d_DatumParts_XOYAxis,
	Prs3d_DP_YOZAxis = Prs3d_DatumParts_YOZAxis,
	Prs3d_DP_XOZAxis = Prs3d_DatumParts_XOZAxis,
	Prs3d_DP_None = Prs3d_DatumParts_None,
};

enum  {
	Prs3d_DatumParts_NB = Prs3d_DatumParts_None + 1,
};

enum Prs3d_DimensionArrowOrientation {
	Prs3d_DAO_Internal = 0,
	Prs3d_DAO_External = 1,
	Prs3d_DAO_Fit = 2,
};

enum Prs3d_DimensionTextHorizontalPosition {
	Prs3d_DTHP_Left = 0,
	Prs3d_DTHP_Right = 1,
	Prs3d_DTHP_Center = 2,
	Prs3d_DTHP_Fit = 3,
};

enum Prs3d_DimensionTextVerticalPosition {
	Prs3d_DTVP_Above = 0,
	Prs3d_DTVP_Below = 1,
	Prs3d_DTVP_Center = 2,
};

enum Prs3d_TypeOfHLR {
	Prs3d_TOH_NotSet = 0,
	Prs3d_TOH_PolyAlgo = 1,
	Prs3d_TOH_Algo = 2,
};

enum Prs3d_TypeOfHighlight {
	Prs3d_TypeOfHighlight_None = 0,
	Prs3d_TypeOfHighlight_Selected = 1,
	Prs3d_TypeOfHighlight_Dynamic = 2,
	Prs3d_TypeOfHighlight_LocalSelected = 3,
	Prs3d_TypeOfHighlight_LocalDynamic = 4,
	Prs3d_TypeOfHighlight_SubIntensity = 5,
	Prs3d_TypeOfHighlight_NB = 6,
};

enum Prs3d_TypeOfLinePicking {
	Prs3d_TOLP_Point = 0,
	Prs3d_TOLP_Segment = 1,
};

enum Prs3d_VertexDrawMode {
	Prs3d_VDM_Isolated = 0,
	Prs3d_VDM_All = 1,
	Prs3d_VDM_Inherited = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Prs3d_DatumAttribute(IntEnum):
	Prs3d_DatumAttribute_XAxisLength = 0
	Prs3d_DatumAttribute_YAxisLength = 1
	Prs3d_DatumAttribute_ZAxisLength = 2
	Prs3d_DatumAttribute_ShadingTubeRadiusPercent = 3
	Prs3d_DatumAttribute_ShadingConeRadiusPercent = 4
	Prs3d_DatumAttribute_ShadingConeLengthPercent = 5
	Prs3d_DatumAttribute_ShadingOriginRadiusPercent = 6
	Prs3d_DatumAttribute_ShadingNumberOfFacettes = 7
	Prs3d_DA_XAxisLength = Prs3d_DatumAttribute_XAxisLength
	Prs3d_DA_YAxisLength = Prs3d_DatumAttribute_YAxisLength
	Prs3d_DA_ZAxisLength = Prs3d_DatumAttribute_ZAxisLength
	Prs3d_DP_ShadingTubeRadiusPercent = Prs3d_DatumAttribute_ShadingTubeRadiusPercent
	Prs3d_DP_ShadingConeRadiusPercent = Prs3d_DatumAttribute_ShadingConeRadiusPercent
	Prs3d_DP_ShadingConeLengthPercent = Prs3d_DatumAttribute_ShadingConeLengthPercent
	Prs3d_DP_ShadingOriginRadiusPercent = Prs3d_DatumAttribute_ShadingOriginRadiusPercent
	Prs3d_DP_ShadingNumberOfFacettes = Prs3d_DatumAttribute_ShadingNumberOfFacettes
Prs3d_DatumAttribute_XAxisLength = Prs3d_DatumAttribute.Prs3d_DatumAttribute_XAxisLength
Prs3d_DatumAttribute_YAxisLength = Prs3d_DatumAttribute.Prs3d_DatumAttribute_YAxisLength
Prs3d_DatumAttribute_ZAxisLength = Prs3d_DatumAttribute.Prs3d_DatumAttribute_ZAxisLength
Prs3d_DatumAttribute_ShadingTubeRadiusPercent = Prs3d_DatumAttribute.Prs3d_DatumAttribute_ShadingTubeRadiusPercent
Prs3d_DatumAttribute_ShadingConeRadiusPercent = Prs3d_DatumAttribute.Prs3d_DatumAttribute_ShadingConeRadiusPercent
Prs3d_DatumAttribute_ShadingConeLengthPercent = Prs3d_DatumAttribute.Prs3d_DatumAttribute_ShadingConeLengthPercent
Prs3d_DatumAttribute_ShadingOriginRadiusPercent = Prs3d_DatumAttribute.Prs3d_DatumAttribute_ShadingOriginRadiusPercent
Prs3d_DatumAttribute_ShadingNumberOfFacettes = Prs3d_DatumAttribute.Prs3d_DatumAttribute_ShadingNumberOfFacettes
Prs3d_DA_XAxisLength = Prs3d_DatumAttribute.Prs3d_DA_XAxisLength
Prs3d_DA_YAxisLength = Prs3d_DatumAttribute.Prs3d_DA_YAxisLength
Prs3d_DA_ZAxisLength = Prs3d_DatumAttribute.Prs3d_DA_ZAxisLength
Prs3d_DP_ShadingTubeRadiusPercent = Prs3d_DatumAttribute.Prs3d_DP_ShadingTubeRadiusPercent
Prs3d_DP_ShadingConeRadiusPercent = Prs3d_DatumAttribute.Prs3d_DP_ShadingConeRadiusPercent
Prs3d_DP_ShadingConeLengthPercent = Prs3d_DatumAttribute.Prs3d_DP_ShadingConeLengthPercent
Prs3d_DP_ShadingOriginRadiusPercent = Prs3d_DatumAttribute.Prs3d_DP_ShadingOriginRadiusPercent
Prs3d_DP_ShadingNumberOfFacettes = Prs3d_DatumAttribute.Prs3d_DP_ShadingNumberOfFacettes

class Prs3d_DatumAxes(IntEnum):
	Prs3d_DatumAxes_XAxis = 1
	Prs3d_DatumAxes_YAxis = 2
	Prs3d_DatumAxes_ZAxis = 4
	Prs3d_DatumAxes_XYAxes = Prs3d_DatumAxes_XAxis | Prs3d_DatumAxes_YAxis
	Prs3d_DatumAxes_YZAxes = Prs3d_DatumAxes_YAxis | Prs3d_DatumAxes_ZAxis
	Prs3d_DatumAxes_XZAxes = Prs3d_DatumAxes_XAxis | Prs3d_DatumAxes_ZAxis
	Prs3d_DatumAxes_XYZAxes = Prs3d_DatumAxes_XAxis | Prs3d_DatumAxes_YAxis | Prs3d_DatumAxes_ZAxis
	Prs3d_DA_XAxis = Prs3d_DatumAxes_XAxis
	Prs3d_DA_YAxis = Prs3d_DatumAxes_YAxis
	Prs3d_DA_ZAxis = Prs3d_DatumAxes_ZAxis
	Prs3d_DA_XYAxis = Prs3d_DatumAxes_XYAxes
	Prs3d_DA_YZAxis = Prs3d_DatumAxes_YZAxes
	Prs3d_DA_XZAxis = Prs3d_DatumAxes_XZAxes
	Prs3d_DA_XYZAxis = Prs3d_DatumAxes_XYZAxes
Prs3d_DatumAxes_XAxis = Prs3d_DatumAxes.Prs3d_DatumAxes_XAxis
Prs3d_DatumAxes_YAxis = Prs3d_DatumAxes.Prs3d_DatumAxes_YAxis
Prs3d_DatumAxes_ZAxis = Prs3d_DatumAxes.Prs3d_DatumAxes_ZAxis
Prs3d_DatumAxes_XYAxes = Prs3d_DatumAxes.Prs3d_DatumAxes_XYAxes
Prs3d_DatumAxes_YZAxes = Prs3d_DatumAxes.Prs3d_DatumAxes_YZAxes
Prs3d_DatumAxes_XZAxes = Prs3d_DatumAxes.Prs3d_DatumAxes_XZAxes
Prs3d_DatumAxes_XYZAxes = Prs3d_DatumAxes.Prs3d_DatumAxes_XYZAxes
Prs3d_DA_XAxis = Prs3d_DatumAxes.Prs3d_DA_XAxis
Prs3d_DA_YAxis = Prs3d_DatumAxes.Prs3d_DA_YAxis
Prs3d_DA_ZAxis = Prs3d_DatumAxes.Prs3d_DA_ZAxis
Prs3d_DA_XYAxis = Prs3d_DatumAxes.Prs3d_DA_XYAxis
Prs3d_DA_YZAxis = Prs3d_DatumAxes.Prs3d_DA_YZAxis
Prs3d_DA_XZAxis = Prs3d_DatumAxes.Prs3d_DA_XZAxis
Prs3d_DA_XYZAxis = Prs3d_DatumAxes.Prs3d_DA_XYZAxis

class Prs3d_DatumMode(IntEnum):
	Prs3d_DM_WireFrame = 0
	Prs3d_DM_Shaded = 1
Prs3d_DM_WireFrame = Prs3d_DatumMode.Prs3d_DM_WireFrame
Prs3d_DM_Shaded = Prs3d_DatumMode.Prs3d_DM_Shaded

class Prs3d_DatumParts(IntEnum):
	Prs3d_DatumParts_Origin = 0
	Prs3d_DatumParts_XAxis = 1
	Prs3d_DatumParts_YAxis = 2
	Prs3d_DatumParts_ZAxis = 3
	Prs3d_DatumParts_XArrow = 4
	Prs3d_DatumParts_YArrow = 5
	Prs3d_DatumParts_ZArrow = 6
	Prs3d_DatumParts_XOYAxis = 7
	Prs3d_DatumParts_YOZAxis = 8
	Prs3d_DatumParts_XOZAxis = 9
	Prs3d_DatumParts_None = 10
	Prs3d_DP_Origin = Prs3d_DatumParts_Origin
	Prs3d_DP_XAxis = Prs3d_DatumParts_XAxis
	Prs3d_DP_YAxis = Prs3d_DatumParts_YAxis
	Prs3d_DP_ZAxis = Prs3d_DatumParts_ZAxis
	Prs3d_DP_XArrow = Prs3d_DatumParts_XArrow
	Prs3d_DP_YArrow = Prs3d_DatumParts_YArrow
	Prs3d_DP_ZArrow = Prs3d_DatumParts_ZArrow
	Prs3d_DP_XOYAxis = Prs3d_DatumParts_XOYAxis
	Prs3d_DP_YOZAxis = Prs3d_DatumParts_YOZAxis
	Prs3d_DP_XOZAxis = Prs3d_DatumParts_XOZAxis
	Prs3d_DP_None = Prs3d_DatumParts_None
Prs3d_DatumParts_Origin = Prs3d_DatumParts.Prs3d_DatumParts_Origin
Prs3d_DatumParts_XAxis = Prs3d_DatumParts.Prs3d_DatumParts_XAxis
Prs3d_DatumParts_YAxis = Prs3d_DatumParts.Prs3d_DatumParts_YAxis
Prs3d_DatumParts_ZAxis = Prs3d_DatumParts.Prs3d_DatumParts_ZAxis
Prs3d_DatumParts_XArrow = Prs3d_DatumParts.Prs3d_DatumParts_XArrow
Prs3d_DatumParts_YArrow = Prs3d_DatumParts.Prs3d_DatumParts_YArrow
Prs3d_DatumParts_ZArrow = Prs3d_DatumParts.Prs3d_DatumParts_ZArrow
Prs3d_DatumParts_XOYAxis = Prs3d_DatumParts.Prs3d_DatumParts_XOYAxis
Prs3d_DatumParts_YOZAxis = Prs3d_DatumParts.Prs3d_DatumParts_YOZAxis
Prs3d_DatumParts_XOZAxis = Prs3d_DatumParts.Prs3d_DatumParts_XOZAxis
Prs3d_DatumParts_None = Prs3d_DatumParts.Prs3d_DatumParts_None
Prs3d_DP_Origin = Prs3d_DatumParts.Prs3d_DP_Origin
Prs3d_DP_XAxis = Prs3d_DatumParts.Prs3d_DP_XAxis
Prs3d_DP_YAxis = Prs3d_DatumParts.Prs3d_DP_YAxis
Prs3d_DP_ZAxis = Prs3d_DatumParts.Prs3d_DP_ZAxis
Prs3d_DP_XArrow = Prs3d_DatumParts.Prs3d_DP_XArrow
Prs3d_DP_YArrow = Prs3d_DatumParts.Prs3d_DP_YArrow
Prs3d_DP_ZArrow = Prs3d_DatumParts.Prs3d_DP_ZArrow
Prs3d_DP_XOYAxis = Prs3d_DatumParts.Prs3d_DP_XOYAxis
Prs3d_DP_YOZAxis = Prs3d_DatumParts.Prs3d_DP_YOZAxis
Prs3d_DP_XOZAxis = Prs3d_DatumParts.Prs3d_DP_XOZAxis
Prs3d_DP_None = Prs3d_DatumParts.Prs3d_DP_None

class Prs3d_DimensionArrowOrientation(IntEnum):
	Prs3d_DAO_Internal = 0
	Prs3d_DAO_External = 1
	Prs3d_DAO_Fit = 2
Prs3d_DAO_Internal = Prs3d_DimensionArrowOrientation.Prs3d_DAO_Internal
Prs3d_DAO_External = Prs3d_DimensionArrowOrientation.Prs3d_DAO_External
Prs3d_DAO_Fit = Prs3d_DimensionArrowOrientation.Prs3d_DAO_Fit

class Prs3d_DimensionTextHorizontalPosition(IntEnum):
	Prs3d_DTHP_Left = 0
	Prs3d_DTHP_Right = 1
	Prs3d_DTHP_Center = 2
	Prs3d_DTHP_Fit = 3
Prs3d_DTHP_Left = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Left
Prs3d_DTHP_Right = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Right
Prs3d_DTHP_Center = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Center
Prs3d_DTHP_Fit = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Fit

class Prs3d_DimensionTextVerticalPosition(IntEnum):
	Prs3d_DTVP_Above = 0
	Prs3d_DTVP_Below = 1
	Prs3d_DTVP_Center = 2
Prs3d_DTVP_Above = Prs3d_DimensionTextVerticalPosition.Prs3d_DTVP_Above
Prs3d_DTVP_Below = Prs3d_DimensionTextVerticalPosition.Prs3d_DTVP_Below
Prs3d_DTVP_Center = Prs3d_DimensionTextVerticalPosition.Prs3d_DTVP_Center

class Prs3d_TypeOfHLR(IntEnum):
	Prs3d_TOH_NotSet = 0
	Prs3d_TOH_PolyAlgo = 1
	Prs3d_TOH_Algo = 2
Prs3d_TOH_NotSet = Prs3d_TypeOfHLR.Prs3d_TOH_NotSet
Prs3d_TOH_PolyAlgo = Prs3d_TypeOfHLR.Prs3d_TOH_PolyAlgo
Prs3d_TOH_Algo = Prs3d_TypeOfHLR.Prs3d_TOH_Algo

class Prs3d_TypeOfHighlight(IntEnum):
	Prs3d_TypeOfHighlight_None = 0
	Prs3d_TypeOfHighlight_Selected = 1
	Prs3d_TypeOfHighlight_Dynamic = 2
	Prs3d_TypeOfHighlight_LocalSelected = 3
	Prs3d_TypeOfHighlight_LocalDynamic = 4
	Prs3d_TypeOfHighlight_SubIntensity = 5
	Prs3d_TypeOfHighlight_NB = 6
Prs3d_TypeOfHighlight_None = Prs3d_TypeOfHighlight.Prs3d_TypeOfHighlight_None
Prs3d_TypeOfHighlight_Selected = Prs3d_TypeOfHighlight.Prs3d_TypeOfHighlight_Selected
Prs3d_TypeOfHighlight_Dynamic = Prs3d_TypeOfHighlight.Prs3d_TypeOfHighlight_Dynamic
Prs3d_TypeOfHighlight_LocalSelected = Prs3d_TypeOfHighlight.Prs3d_TypeOfHighlight_LocalSelected
Prs3d_TypeOfHighlight_LocalDynamic = Prs3d_TypeOfHighlight.Prs3d_TypeOfHighlight_LocalDynamic
Prs3d_TypeOfHighlight_SubIntensity = Prs3d_TypeOfHighlight.Prs3d_TypeOfHighlight_SubIntensity
Prs3d_TypeOfHighlight_NB = Prs3d_TypeOfHighlight.Prs3d_TypeOfHighlight_NB

class Prs3d_TypeOfLinePicking(IntEnum):
	Prs3d_TOLP_Point = 0
	Prs3d_TOLP_Segment = 1
Prs3d_TOLP_Point = Prs3d_TypeOfLinePicking.Prs3d_TOLP_Point
Prs3d_TOLP_Segment = Prs3d_TypeOfLinePicking.Prs3d_TOLP_Segment

class Prs3d_VertexDrawMode(IntEnum):
	Prs3d_VDM_Isolated = 0
	Prs3d_VDM_All = 1
	Prs3d_VDM_Inherited = 2
Prs3d_VDM_Isolated = Prs3d_VertexDrawMode.Prs3d_VDM_Isolated
Prs3d_VDM_All = Prs3d_VertexDrawMode.Prs3d_VDM_All
Prs3d_VDM_Inherited = Prs3d_VertexDrawMode.Prs3d_VDM_Inherited
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Prs3d_BasicAspect)
%wrap_handle(Prs3d_Drawer)
%wrap_handle(Prs3d_PresentationShadow)
%wrap_handle(Prs3d_ArrowAspect)
%wrap_handle(Prs3d_DatumAspect)
%wrap_handle(Prs3d_DimensionAspect)
%wrap_handle(Prs3d_LineAspect)
%wrap_handle(Prs3d_PlaneAspect)
%wrap_handle(Prs3d_PointAspect)
%wrap_handle(Prs3d_ShadingAspect)
%wrap_handle(Prs3d_TextAspect)
%wrap_handle(Prs3d_IsoAspect)
/* end handles declaration */

/* templates */
%template(Prs3d_NListOfSequenceOfPnt) NCollection_List<opencascade::handle<TColgp_HSequenceOfPnt>>;

%extend NCollection_List<opencascade::handle<TColgp_HSequenceOfPnt>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef Prs3d_NListOfSequenceOfPnt::Iterator Prs3d_NListIteratorOfListOfSequenceOfPnt;
typedef NCollection_List<opencascade::handle<TColgp_HSequenceOfPnt>> Prs3d_NListOfSequenceOfPnt;
typedef Graphic3d_Structure Prs3d_Presentation;
/* end typedefs declaration */

/**************
* class Prs3d *
**************/
%rename(prs3d) Prs3d;
class Prs3d {
	public:
		/****** Prs3d::AddFreeEdges ******/
		/****** md5 signature: 7ac34117f886744be821be34fbd08b8a ******/
		%feature("compactdefaultargs") AddFreeEdges;
		%feature("autodoc", "
Parameters
----------
theSegments: TColgp_SequenceOfPnt
thePolyTri: Poly_Triangulation
theLocation: gp_Trsf

Return
-------
None

Description
-----------
Add triangulation free edges into sequence of line segments. @param[out] theSegments sequence of line segments to fill 
Input parameter: thePolyTri triangulation to process 
Input parameter: theLocation transformation to apply.
") AddFreeEdges;
		static void AddFreeEdges(TColgp_SequenceOfPnt & theSegments, const opencascade::handle<Poly_Triangulation> & thePolyTri, const gp_Trsf & theLocation);

		/****** Prs3d::AddPrimitivesGroup ******/
		/****** md5 signature: 54a23ed776ef73d4469f2189e47e27ac ******/
		%feature("compactdefaultargs") AddPrimitivesGroup;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation
theAspect: Prs3d_LineAspect
thePolylines: Prs3d_NListOfSequenceOfPnt

Return
-------
None

Description
-----------
Add primitives into new group in presentation and clear the list of polylines.
") AddPrimitivesGroup;
		static void AddPrimitivesGroup(const opencascade::handle<Prs3d_Presentation> & thePrs, const opencascade::handle<Prs3d_LineAspect> & theAspect, Prs3d_NListOfSequenceOfPnt & thePolylines);

		/****** Prs3d::GetDeflection ******/
		/****** md5 signature: 80d3db84df62af62fba08c06cb9a8696 ******/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "
Parameters
----------
theBndMin: Graphic3d_Vec3d
theBndMax: Graphic3d_Vec3d
theDeviationCoefficient: float

Return
-------
float

Description
-----------
Computes the absolute deflection value based on relative deflection Prs3d_Drawer::DeviationCoefficient(). 
Input parameter: theBndMin bounding box min corner 
Input parameter: theBndMax bounding box max corner 
Input parameter: theDeviationCoefficient relative deflection coefficient from Prs3d_Drawer::DeviationCoefficient() 
Return: absolute deflection coefficient based on bounding box dimensions.
") GetDeflection;
		static Standard_Real GetDeflection(const Graphic3d_Vec3d & theBndMin, const Graphic3d_Vec3d & theBndMax, const Standard_Real theDeviationCoefficient);

		/****** Prs3d::GetDeflection ******/
		/****** md5 signature: b4ff60a90046a3353c924190b95ff7f7 ******/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "
Parameters
----------
theBndBox: Bnd_Box
theDeviationCoefficient: float
theMaximalChordialDeviation: float

Return
-------
float

Description
-----------
Computes the absolute deflection value based on relative deflection Prs3d_Drawer::DeviationCoefficient(). 
Input parameter: theBndBox bounding box 
Input parameter: theDeviationCoefficient relative deflection coefficient from Prs3d_Drawer::DeviationCoefficient() 
Input parameter: theMaximalChordialDeviation absolute deflection coefficient from Prs3d_Drawer::MaximalChordialDeviation() 
Return: absolute deflection coefficient based on bounding box dimensions or theMaximalChordialDeviation if bounding box is Void or Infinite.
") GetDeflection;
		static Standard_Real GetDeflection(const Bnd_Box & theBndBox, const Standard_Real theDeviationCoefficient, const Standard_Real theMaximalChordialDeviation);

		/****** Prs3d::MatchSegment ******/
		/****** md5 signature: b54f261a95760df4573beed0ad5de6ee ******/
		%feature("compactdefaultargs") MatchSegment;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
p1: gp_Pnt
p2: gp_Pnt

Return
-------
dist: float

Description
-----------
draws an arrow at a given location, with respect to a given direction.
") MatchSegment;
		static Standard_Boolean MatchSegment(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const gp_Pnt & p1, const gp_Pnt & p2, Standard_Real &OutValue);

		/****** Prs3d::PrimitivesFromPolylines ******/
		/****** md5 signature: ac5afc7f1737d42c9e2e741f0693e3a3 ******/
		%feature("compactdefaultargs") PrimitivesFromPolylines;
		%feature("autodoc", "
Parameters
----------
thePoints: Prs3d_NListOfSequenceOfPnt

Return
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>

Description
-----------
Assembles array of primitives for sequence of polylines. 
Input parameter: thePoints the polylines sequence 
Return: array of primitives.
") PrimitivesFromPolylines;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> PrimitivesFromPolylines(const Prs3d_NListOfSequenceOfPnt & thePoints);

};


%extend Prs3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Prs3d_Arrow *
********************/
class Prs3d_Arrow {
	public:
		/****** Prs3d_Arrow::Draw ******/
		/****** md5 signature: 5fbe6d990a1917c27eed32163631c6db ******/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "
Parameters
----------
theGroup: Graphic3d_Group
theLocation: gp_Pnt
theDirection: gp_Dir
theAngle: float
theLength: float

Return
-------
None

Description
-----------
Defines the representation of the arrow. Note that this method does NOT assign any presentation aspects to the primitives group! 
Parameter theGroup presentation group to add primitives 
Parameter theLocation location of the arrow tip 
Parameter theDirection direction of the arrow 
Parameter theAngle angle of opening of the arrow head 
Parameter theLength length of the arrow (from the tip).
") Draw;
		static void Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const gp_Pnt & theLocation, const gp_Dir & theDirection, const Standard_Real theAngle, const Standard_Real theLength);

		/****** Prs3d_Arrow::DrawSegments ******/
		/****** md5 signature: 732901be4cc19438764121766619db8b ******/
		%feature("compactdefaultargs") DrawSegments;
		%feature("autodoc", "
Parameters
----------
theLocation: gp_Pnt
theDir: gp_Dir
theAngle: float
theLength: float
theNbSegments: int

Return
-------
opencascade::handle<Graphic3d_ArrayOfSegments>

Description
-----------
Defines the representation of the arrow as a container of segments. 
Parameter theLocation location of the arrow tip 
Parameter theDir direction of the arrow 
Parameter theAngle angle of opening of the arrow head 
Parameter theLength length of the arrow (from the tip) 
Parameter theNbSegments count of points on polyline where location is connected.
") DrawSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> DrawSegments(const gp_Pnt & theLocation, const gp_Dir & theDir, const Standard_Real theAngle, const Standard_Real theLength, const Standard_Integer theNbSegments);

		/****** Prs3d_Arrow::DrawShaded ******/
		/****** md5 signature: 9fdd956294243401b7cdc39f8158504b ******/
		%feature("compactdefaultargs") DrawShaded;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1
theTubeRadius: float
theAxisLength: float
theConeRadius: float
theConeLength: float
theNbFacettes: int

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Defines the representation of the arrow as shaded triangulation. 
Parameter theAxis axis definition (arrow origin and direction) 
Parameter theTubeRadius tube (cylinder) radius 
Parameter theAxisLength overall arrow length (cylinder + cone) 
Parameter theConeRadius cone radius (arrow tip) 
Parameter theConeLength cone length (arrow tip) 
Parameter theNbFacettes tessellation quality for each part.
") DrawShaded;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> DrawShaded(const gp_Ax1 & theAxis, const Standard_Real theTubeRadius, const Standard_Real theAxisLength, const Standard_Real theConeRadius, const Standard_Real theConeLength, const Standard_Integer theNbFacettes);

};


%extend Prs3d_Arrow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Prs3d_BasicAspect *
**************************/
%nodefaultctor Prs3d_BasicAspect;
class Prs3d_BasicAspect : public Standard_Transient {
	public:
};


%make_alias(Prs3d_BasicAspect)

%extend Prs3d_BasicAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Prs3d_DimensionUnits *
*****************************/
class Prs3d_DimensionUnits {
	public:
		/****** Prs3d_DimensionUnits::Prs3d_DimensionUnits ******/
		/****** md5 signature: 6858cebef83a95894808c7bb951f2586 ******/
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Sets meters as default length units and radians as default angle units.
") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits();

		/****** Prs3d_DimensionUnits::Prs3d_DimensionUnits ******/
		/****** md5 signature: 6a8f298b7552282c2afeb9ec3d08706a ******/
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: Prs3d_DimensionUnits

Return
-------
None

Description
-----------
No available documentation.
") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits(const Prs3d_DimensionUnits & theUnits);

		/****** Prs3d_DimensionUnits::GetAngleUnits ******/
		/****** md5 signature: 066d6d8ffa1db4056e804ec281802558 ******/
		%feature("compactdefaultargs") GetAngleUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: angle units.
") GetAngleUnits;
		const TCollection_AsciiString & GetAngleUnits();

		/****** Prs3d_DimensionUnits::GetLengthUnits ******/
		/****** md5 signature: 6fb395b3afc4def0ac554d84a6be28f9 ******/
		%feature("compactdefaultargs") GetLengthUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return: length units.
") GetLengthUnits;
		const TCollection_AsciiString & GetLengthUnits();

		/****** Prs3d_DimensionUnits::SetAngleUnits ******/
		/****** md5 signature: c9bda671a819bb927eb60041234fe221 ******/
		%feature("compactdefaultargs") SetAngleUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
Sets angle units.
") SetAngleUnits;
		void SetAngleUnits(TCollection_AsciiString theUnits);

		/****** Prs3d_DimensionUnits::SetLengthUnits ******/
		/****** md5 signature: 8f235eea8c4da0d905edbe7271c0d8cd ******/
		%feature("compactdefaultargs") SetLengthUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
Sets length units.
") SetLengthUnits;
		void SetLengthUnits(TCollection_AsciiString theUnits);

};


%extend Prs3d_DimensionUnits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Prs3d_Drawer *
*********************/
class Prs3d_Drawer : public Graphic3d_PresentationAttributes {
	public:
		/****** Prs3d_Drawer::Prs3d_Drawer ******/
		/****** md5 signature: fd45a8e4068c9e2be7c92cceb0f5d5c9 ******/
		%feature("compactdefaultargs") Prs3d_Drawer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") Prs3d_Drawer;
		 Prs3d_Drawer();

		/****** Prs3d_Drawer::ArrowAspect ******/
		/****** md5 signature: 51fa944f931a2a140820470b2c6a88b4 ******/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ArrowAspect>

Description
-----------
Returns own attributes for display of arrows, settings from linked Drawer or NULL if neither was set.
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****** Prs3d_Drawer::ClearLocalAttributes ******/
		/****** md5 signature: 2885c46c9a1a30b9b9c2a0703fd29fa7 ******/
		%feature("compactdefaultargs") ClearLocalAttributes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes local attributes.
") ClearLocalAttributes;
		void ClearLocalAttributes();

		/****** Prs3d_Drawer::DatumAspect ******/
		/****** md5 signature: ab5b6c51905d06854a4304f89d4c7189 ******/
		%feature("compactdefaultargs") DatumAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_DatumAspect>

Description
-----------
Returns own settings for the appearance of datums, settings from linked Drawer or NULL if neither was set.
") DatumAspect;
		const opencascade::handle<Prs3d_DatumAspect> & DatumAspect();

		/****** Prs3d_Drawer::DeviationAngle ******/
		/****** md5 signature: 003652129c87707eb3add7448baffc41 ******/
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value for deviation angle in radians, 20 * M_PI / 180 by default.
") DeviationAngle;
		Standard_Real DeviationAngle();

		/****** Prs3d_Drawer::DeviationCoefficient ******/
		/****** md5 signature: aa403b444ce189be03dbbfdaa044ed4e ******/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deviation coefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.
") DeviationCoefficient;
		Standard_Real DeviationCoefficient();

		/****** Prs3d_Drawer::DimAngleDisplayUnits ******/
		/****** md5 signature: f9adb2def91c97371f22f83b1b241154 ******/
		%feature("compactdefaultargs") DimAngleDisplayUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns angle units in which dimension presentation is displayed.
") DimAngleDisplayUnits;
		const TCollection_AsciiString & DimAngleDisplayUnits();

		/****** Prs3d_Drawer::DimAngleModelUnits ******/
		/****** md5 signature: 05c1180b2f776fd7d8ff7737daaa7956 ******/
		%feature("compactdefaultargs") DimAngleModelUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns angle model units for the dimension presentation.
") DimAngleModelUnits;
		const TCollection_AsciiString & DimAngleModelUnits();

		/****** Prs3d_Drawer::DimLengthDisplayUnits ******/
		/****** md5 signature: 0c6e550f454a7c3462ea332ad4a3114d ******/
		%feature("compactdefaultargs") DimLengthDisplayUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns length units in which dimension presentation is displayed.
") DimLengthDisplayUnits;
		const TCollection_AsciiString & DimLengthDisplayUnits();

		/****** Prs3d_Drawer::DimLengthModelUnits ******/
		/****** md5 signature: 8bc83424763676a3c91810d4679e2b18 ******/
		%feature("compactdefaultargs") DimLengthModelUnits;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns length model units for the dimension presentation.
") DimLengthModelUnits;
		const TCollection_AsciiString & DimLengthModelUnits();

		/****** Prs3d_Drawer::DimensionAspect ******/
		/****** md5 signature: 6b03f02ae9f62eec0f444824df72cb53 ******/
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_DimensionAspect>

Description
-----------
Returns own settings for the appearance of dimensions, settings from linked Drawer or NULL if neither was set.
") DimensionAspect;
		const opencascade::handle<Prs3d_DimensionAspect> & DimensionAspect();

		/****** Prs3d_Drawer::DisableDrawHiddenLine ******/
		/****** md5 signature: 641e43422c8b3be588dee379f3554611 ******/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Disables the DrawHiddenLine function.
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****** Prs3d_Drawer::Discretisation ******/
		/****** md5 signature: 00367d346ebf2ee8d05c61802962da5d ******/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the discretisation setting.
") Discretisation;
		Standard_Integer Discretisation();

		/****** Prs3d_Drawer::DrawHiddenLine ******/
		/****** md5 signature: 372ddba1ff29bf8cd686ca27ede4bc2a ******/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if the hidden lines are to be drawn. By default the hidden lines are not drawn.
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_Drawer::EnableDrawHiddenLine ******/
		/****** md5 signature: 5cd9db795aefc1eee38a63bd3f8ef65f ******/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Enables the DrawHiddenLine function.
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****** Prs3d_Drawer::FaceBoundaryAspect ******/
		/****** md5 signature: 4fe7266a8c0b80fde255b0355cc018c4 ******/
		%feature("compactdefaultargs") FaceBoundaryAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own line aspect of face boundaries, settings from linked Drawer or NULL if neither was set.
") FaceBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FaceBoundaryAspect();

		/****** Prs3d_Drawer::FaceBoundaryDraw ******/
		/****** md5 signature: 504f69657af5734e3fdac5963f26fbd8 ******/
		%feature("compactdefaultargs") FaceBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether the face boundary drawing is enabled or not.
") FaceBoundaryDraw;
		Standard_Boolean FaceBoundaryDraw();

		/****** Prs3d_Drawer::FaceBoundaryUpperContinuity ******/
		/****** md5 signature: 4a0be6032fd2efa02c9dc8a216e023bd ******/
		%feature("compactdefaultargs") FaceBoundaryUpperContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Get the most edge continuity class; GeomAbs_CN by default (all edges).
") FaceBoundaryUpperContinuity;
		GeomAbs_Shape FaceBoundaryUpperContinuity();

		/****** Prs3d_Drawer::FreeBoundaryAspect ******/
		/****** md5 signature: 27a3ed0ee4198d0e57b27d7d6e4d2266 ******/
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own settings for presentation of free boundaries, settings from linked Drawer or NULL if neither was set. In other words, this settings affect boundaries which are not shared. These attributes are used by the algorithm Prs3d_WFShape.
") FreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FreeBoundaryAspect();

		/****** Prs3d_Drawer::FreeBoundaryDraw ******/
		/****** md5 signature: a393914bb639c8fa5d8e810c31199151 ******/
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the drawing of the free boundaries is enabled True is the default setting.
") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw();

		/****** Prs3d_Drawer::HLRAngle ******/
		/****** md5 signature: 9b3b7971941820e9cc8d8638893d2a9d ******/
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") HLRAngle;
		Standard_Real HLRAngle();

		/****** Prs3d_Drawer::HasLink ******/
		/****** md5 signature: e68aafea1bcdd6fec6e3f2f0de3f3c9f ******/
		%feature("compactdefaultargs") HasLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current object has a link on the other drawer.
") HasLink;
		Standard_Boolean HasLink();

		/****** Prs3d_Drawer::HasOwnArrowAspect ******/
		/****** md5 signature: c011ea9c5427f594bd39c812bb8eda05 ******/
		%feature("compactdefaultargs") HasOwnArrowAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for arrow aspect that overrides the one in the link.
") HasOwnArrowAspect;
		Standard_Boolean HasOwnArrowAspect();

		/****** Prs3d_Drawer::HasOwnDatumAspect ******/
		/****** md5 signature: f4132615152b4b32121460820c67b0a9 ******/
		%feature("compactdefaultargs") HasOwnDatumAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for datum aspect that overrides the one in the link.
") HasOwnDatumAspect;
		Standard_Boolean HasOwnDatumAspect();

		/****** Prs3d_Drawer::HasOwnDeviationAngle ******/
		/****** md5 signature: 9b350005642d36f5630be22438d1d286 ******/
		%feature("compactdefaultargs") HasOwnDeviationAngle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a local setting for deviation angle in this framework for a specific interactive object.
") HasOwnDeviationAngle;
		Standard_Boolean HasOwnDeviationAngle();

		/****** Prs3d_Drawer::HasOwnDeviationCoefficient ******/
		/****** md5 signature: 69a7467c388d4b4a9909917fbd44f546 ******/
		%feature("compactdefaultargs") HasOwnDeviationCoefficient;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a local setting for deviation coefficient in this framework for a specific interactive object.
") HasOwnDeviationCoefficient;
		Standard_Boolean HasOwnDeviationCoefficient();

		/****** Prs3d_Drawer::HasOwnDimAngleDisplayUnits ******/
		/****** md5 signature: f7fc32bc901429d1e7a4757ef5a78138 ******/
		%feature("compactdefaultargs") HasOwnDimAngleDisplayUnits;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for angle units in which dimension presentation is displayed that overrides the one in the link.
") HasOwnDimAngleDisplayUnits;
		Standard_Boolean HasOwnDimAngleDisplayUnits();

		/****** Prs3d_Drawer::HasOwnDimAngleModelUnits ******/
		/****** md5 signature: fba8b1b78d226c95615ccab093f1e4a5 ******/
		%feature("compactdefaultargs") HasOwnDimAngleModelUnits;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for dimension angle model units that overrides the one in the link.
") HasOwnDimAngleModelUnits;
		Standard_Boolean HasOwnDimAngleModelUnits();

		/****** Prs3d_Drawer::HasOwnDimLengthDisplayUnits ******/
		/****** md5 signature: 9c0624f722802b21cdd767cc2c13f302 ******/
		%feature("compactdefaultargs") HasOwnDimLengthDisplayUnits;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for length units in which dimension presentation is displayed that overrides the one in the link.
") HasOwnDimLengthDisplayUnits;
		Standard_Boolean HasOwnDimLengthDisplayUnits();

		/****** Prs3d_Drawer::HasOwnDimLengthModelUnits ******/
		/****** md5 signature: 6e93fd2839d74603dc07b6642946a801 ******/
		%feature("compactdefaultargs") HasOwnDimLengthModelUnits;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for dimension length model units that overrides the one in the link.
") HasOwnDimLengthModelUnits;
		Standard_Boolean HasOwnDimLengthModelUnits();

		/****** Prs3d_Drawer::HasOwnDimensionAspect ******/
		/****** md5 signature: 84b0dfe79cfde90b0d291c7ef1dac27c ******/
		%feature("compactdefaultargs") HasOwnDimensionAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for the appearance of dimensions that overrides the one in the link.
") HasOwnDimensionAspect;
		Standard_Boolean HasOwnDimensionAspect();

		/****** Prs3d_Drawer::HasOwnDiscretisation ******/
		/****** md5 signature: 0ada183bb1fdc0e487877b0f053f13fc ******/
		%feature("compactdefaultargs") HasOwnDiscretisation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has discretisation setting active.
") HasOwnDiscretisation;
		Standard_Boolean HasOwnDiscretisation();

		/****** Prs3d_Drawer::HasOwnDrawHiddenLine ******/
		/****** md5 signature: a834332d03c54b08a80e6b0612b72fab ******/
		%feature("compactdefaultargs") HasOwnDrawHiddenLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for 'draw hidden lines' flag that overrides the one in the link.
") HasOwnDrawHiddenLine;
		Standard_Boolean HasOwnDrawHiddenLine();

		/****** Prs3d_Drawer::HasOwnFaceBoundaryAspect ******/
		/****** md5 signature: aaadddb85463caf3dc35972f48dcb050 ******/
		%feature("compactdefaultargs") HasOwnFaceBoundaryAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for face boundaries aspect that overrides the one in the link.
") HasOwnFaceBoundaryAspect;
		Standard_Boolean HasOwnFaceBoundaryAspect();

		/****** Prs3d_Drawer::HasOwnFaceBoundaryDraw ******/
		/****** md5 signature: 64c465a96ac97f193be91c6c7bb9b1aa ******/
		%feature("compactdefaultargs") HasOwnFaceBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for 'draw face boundaries' flag that overrides the one in the link.
") HasOwnFaceBoundaryDraw;
		Standard_Boolean HasOwnFaceBoundaryDraw();

		/****** Prs3d_Drawer::HasOwnFaceBoundaryUpperContinuity ******/
		/****** md5 signature: d894a48ea9b08dd1a31e7efd4c3323d2 ******/
		%feature("compactdefaultargs") HasOwnFaceBoundaryUpperContinuity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for face boundaries upper edge continuity class that overrides the one in the link.
") HasOwnFaceBoundaryUpperContinuity;
		Standard_Boolean HasOwnFaceBoundaryUpperContinuity();

		/****** Prs3d_Drawer::HasOwnFreeBoundaryAspect ******/
		/****** md5 signature: 1e1795900d912c8ce8a7147dc5b324e1 ******/
		%feature("compactdefaultargs") HasOwnFreeBoundaryAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for free boundaries aspect that overrides the one in the link.
") HasOwnFreeBoundaryAspect;
		Standard_Boolean HasOwnFreeBoundaryAspect();

		/****** Prs3d_Drawer::HasOwnFreeBoundaryDraw ******/
		/****** md5 signature: cfa100dc3a78f551e7609898899180c2 ******/
		%feature("compactdefaultargs") HasOwnFreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for 'draw free boundaries' flag that overrides the one in the link.
") HasOwnFreeBoundaryDraw;
		Standard_Boolean HasOwnFreeBoundaryDraw();

		/****** Prs3d_Drawer::HasOwnHLRDeviationAngle ******/
		/****** md5 signature: 992f156d7f0c52baf625365e1f7ddb89 ******/
		%feature("compactdefaultargs") HasOwnHLRDeviationAngle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnHLRDeviationAngle;
		Standard_Boolean HasOwnHLRDeviationAngle();

		/****** Prs3d_Drawer::HasOwnHiddenLineAspect ******/
		/****** md5 signature: adef7b374e68f02486f2d77f549bd4cd ******/
		%feature("compactdefaultargs") HasOwnHiddenLineAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for hidden lines aspect that overrides the one in the link.
") HasOwnHiddenLineAspect;
		Standard_Boolean HasOwnHiddenLineAspect();

		/****** Prs3d_Drawer::HasOwnIsAutoTriangulation ******/
		/****** md5 signature: 2aa38254d17044bc449b7dd389aa975d ******/
		%feature("compactdefaultargs") HasOwnIsAutoTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has IsoOnPlane setting active.
") HasOwnIsAutoTriangulation;
		Standard_Boolean HasOwnIsAutoTriangulation();

		/****** Prs3d_Drawer::HasOwnIsoOnPlane ******/
		/****** md5 signature: e89e70de5761f604bf736fe54eca26f0 ******/
		%feature("compactdefaultargs") HasOwnIsoOnPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has IsoOnPlane setting active.
") HasOwnIsoOnPlane;
		Standard_Boolean HasOwnIsoOnPlane();

		/****** Prs3d_Drawer::HasOwnIsoOnTriangulation ******/
		/****** md5 signature: 9503833346d395f6291772bb348a95d0 ******/
		%feature("compactdefaultargs") HasOwnIsoOnTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has IsoOnTriangulation setting active.
") HasOwnIsoOnTriangulation;
		Standard_Boolean HasOwnIsoOnTriangulation();

		/****** Prs3d_Drawer::HasOwnLineArrowDraw ******/
		/****** md5 signature: 40f8824c5c7c4b9a8d0f5b29a3229b95 ******/
		%feature("compactdefaultargs") HasOwnLineArrowDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for 'draw arrow' flag that overrides the one in the link.
") HasOwnLineArrowDraw;
		Standard_Boolean HasOwnLineArrowDraw();

		/****** Prs3d_Drawer::HasOwnLineAspect ******/
		/****** md5 signature: e68a87286fb1f7ed2f244791e257ac29 ******/
		%feature("compactdefaultargs") HasOwnLineAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for line aspect that overrides the one in the link.
") HasOwnLineAspect;
		Standard_Boolean HasOwnLineAspect();

		/****** Prs3d_Drawer::HasOwnMaximalChordialDeviation ******/
		/****** md5 signature: 278e4d4c710235e9a05b8a9643333137 ******/
		%feature("compactdefaultargs") HasOwnMaximalChordialDeviation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has a maximal chordial deviation setting active.
") HasOwnMaximalChordialDeviation;
		Standard_Boolean HasOwnMaximalChordialDeviation();

		/****** Prs3d_Drawer::HasOwnMaximalParameterValue ******/
		/****** md5 signature: a22dd168fb02864e2f3eeb41decbc247 ******/
		%feature("compactdefaultargs") HasOwnMaximalParameterValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has a maximum value allowed for the first and last parameters of an infinite curve setting active.
") HasOwnMaximalParameterValue;
		Standard_Boolean HasOwnMaximalParameterValue();

		/****** Prs3d_Drawer::HasOwnPlaneAspect ******/
		/****** md5 signature: cedbd9993f542c454113bd6ddcfcd51d ******/
		%feature("compactdefaultargs") HasOwnPlaneAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for plane aspect that overrides the one in the link.
") HasOwnPlaneAspect;
		Standard_Boolean HasOwnPlaneAspect();

		/****** Prs3d_Drawer::HasOwnPointAspect ******/
		/****** md5 signature: 37bcf1c72011e86ffe4cfe34447ded6e ******/
		%feature("compactdefaultargs") HasOwnPointAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for point aspect that overrides the one in the link.
") HasOwnPointAspect;
		Standard_Boolean HasOwnPointAspect();

		/****** Prs3d_Drawer::HasOwnSectionAspect ******/
		/****** md5 signature: 10481bb7dbf9a791b339edf5fc0c3b9b ******/
		%feature("compactdefaultargs") HasOwnSectionAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for section aspect that overrides the one in the link.
") HasOwnSectionAspect;
		Standard_Boolean HasOwnSectionAspect();

		/****** Prs3d_Drawer::HasOwnSeenLineAspect ******/
		/****** md5 signature: 4874aabd41bc5b0a7be6588f0c8fadbd ******/
		%feature("compactdefaultargs") HasOwnSeenLineAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for seen line aspect that overrides the one in the link.
") HasOwnSeenLineAspect;
		Standard_Boolean HasOwnSeenLineAspect();

		/****** Prs3d_Drawer::HasOwnShadingAspect ******/
		/****** md5 signature: 5fca701e7945f5f80195c231ab3d93f9 ******/
		%feature("compactdefaultargs") HasOwnShadingAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for shading aspect that overrides the one in the link.
") HasOwnShadingAspect;
		Standard_Boolean HasOwnShadingAspect();

		/****** Prs3d_Drawer::HasOwnTextAspect ******/
		/****** md5 signature: e969a4e857354af2ca581bd7e356d6d2 ******/
		%feature("compactdefaultargs") HasOwnTextAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for text aspect that overrides the one in the link.
") HasOwnTextAspect;
		Standard_Boolean HasOwnTextAspect();

		/****** Prs3d_Drawer::HasOwnTypeOfDeflection ******/
		/****** md5 signature: e5c5b7da81a019a2aeb3df6de1100be1 ******/
		%feature("compactdefaultargs") HasOwnTypeOfDeflection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has a type of deflection setting active.
") HasOwnTypeOfDeflection;
		Standard_Boolean HasOwnTypeOfDeflection();

		/****** Prs3d_Drawer::HasOwnTypeOfHLR ******/
		/****** md5 signature: 4ef83acd86eeb31e3c391672dbf00a8e ******/
		%feature("compactdefaultargs") HasOwnTypeOfHLR;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the type of HLR is not equal to Prs3d_TOH_NotSet.
") HasOwnTypeOfHLR;
		Standard_Boolean HasOwnTypeOfHLR();

		/****** Prs3d_Drawer::HasOwnUIsoAspect ******/
		/****** md5 signature: ea8d708dbd873ba9943b88da3d561f62 ******/
		%feature("compactdefaultargs") HasOwnUIsoAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for UIso aspect that overrides the one in the link.
") HasOwnUIsoAspect;
		Standard_Boolean HasOwnUIsoAspect();

		/****** Prs3d_Drawer::HasOwnUnFreeBoundaryAspect ******/
		/****** md5 signature: 9d82217707975ddc59976f65a5b28123 ******/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for unfree boundaries aspect that overrides the one in the link.
") HasOwnUnFreeBoundaryAspect;
		Standard_Boolean HasOwnUnFreeBoundaryAspect();

		/****** Prs3d_Drawer::HasOwnUnFreeBoundaryDraw ******/
		/****** md5 signature: d038acbe860ec3a5704a6aff2ced38b4 ******/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for 'draw shared boundaries' flag that overrides the one in the link.
") HasOwnUnFreeBoundaryDraw;
		Standard_Boolean HasOwnUnFreeBoundaryDraw();

		/****** Prs3d_Drawer::HasOwnVIsoAspect ******/
		/****** md5 signature: bc569455ddd94fa9758e8d35afc46578 ******/
		%feature("compactdefaultargs") HasOwnVIsoAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for VIso aspect that overrides the one in the link.
") HasOwnVIsoAspect;
		Standard_Boolean HasOwnVIsoAspect();

		/****** Prs3d_Drawer::HasOwnVectorAspect ******/
		/****** md5 signature: e139738a9c217b3a4ac0811b9ed2df2b ******/
		%feature("compactdefaultargs") HasOwnVectorAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for vector aspect that overrides the one in the link.
") HasOwnVectorAspect;
		Standard_Boolean HasOwnVectorAspect();

		/****** Prs3d_Drawer::HasOwnVertexDrawMode ******/
		/****** md5 signature: 98e1b0684c2f2c8da67af2674348d511 ******/
		%feature("compactdefaultargs") HasOwnVertexDrawMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the vertex draw mode is not equal to <b>Prs3d_VDM_Inherited</b>. This means that individual vertex draw mode value (i.e. not inherited from the global drawer) is used for a specific interactive object.
") HasOwnVertexDrawMode;
		Standard_Boolean HasOwnVertexDrawMode();

		/****** Prs3d_Drawer::HasOwnWireAspect ******/
		/****** md5 signature: 58b07c8af58b81856955e87109b86d41 ******/
		%feature("compactdefaultargs") HasOwnWireAspect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for wire aspect that overrides the one in the link.
") HasOwnWireAspect;
		Standard_Boolean HasOwnWireAspect();

		/****** Prs3d_Drawer::HasOwnWireDraw ******/
		/****** md5 signature: e815b23df6a36dce832d5e51a5dfc189 ******/
		%feature("compactdefaultargs") HasOwnWireDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawer has its own attribute for 'draw wires' flag that overrides the one in the link.
") HasOwnWireDraw;
		Standard_Boolean HasOwnWireDraw();

		/****** Prs3d_Drawer::HiddenLineAspect ******/
		/****** md5 signature: d6e22a29aab321c9beaf4361c0c42ae0 ******/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own settings for hidden line aspects, settings from linked Drawer or NULL if neither was set.
") HiddenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & HiddenLineAspect();

		/****** Prs3d_Drawer::IsAutoTriangulation ******/
		/****** md5 signature: d295575fe0ff15a8c5a95c84145a7993 ******/
		%feature("compactdefaultargs") IsAutoTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if automatic triangulation is enabled.
") IsAutoTriangulation;
		Standard_Boolean IsAutoTriangulation();

		/****** Prs3d_Drawer::IsoOnPlane ******/
		/****** md5 signature: 725ae5fc83d7314e8a35910b73791b5a ******/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the drawing of isos on planes is enabled.
") IsoOnPlane;
		Standard_Boolean IsoOnPlane();

		/****** Prs3d_Drawer::IsoOnTriangulation ******/
		/****** md5 signature: 86d0a4f726e225c8973eb7c232be52f2 ******/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the drawing of isos on triangulation is enabled.
") IsoOnTriangulation;
		Standard_Boolean IsoOnTriangulation();

		/****** Prs3d_Drawer::LineArrowDraw ******/
		/****** md5 signature: d37afa843e41bf77d2295841924733a5 ******/
		%feature("compactdefaultargs") LineArrowDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if drawing an arrow at the end of each edge is enabled and False otherwise (the default).
") LineArrowDraw;
		Standard_Boolean LineArrowDraw();

		/****** Prs3d_Drawer::LineAspect ******/
		/****** md5 signature: fcc623ed837f4e3e85d4e27b8d17160a ******/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own settings for line aspects, settings from linked Drawer or NULL if neither was set. These attributes are used by the following algorithms: Prs3d_Curve Prs3d_Line Prs3d_HLRShape.
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect();

		/****** Prs3d_Drawer::Link ******/
		/****** md5 signature: d38faf34b978f82ca625ab3dd81f64aa ******/
		%feature("compactdefaultargs") Link;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns the drawer to which the current object references.
") Link;
		const opencascade::handle<Prs3d_Drawer> & Link();

		/****** Prs3d_Drawer::Link ******/
		/****** md5 signature: 9fe586ee872a00f2e5c0863608086bdc ******/
		%feature("compactdefaultargs") Link;
		%feature("autodoc", "
Parameters
----------
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Sets theDrawer as a link to which the current object references.
") Link;
		void Link(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** Prs3d_Drawer::MaximalChordialDeviation ******/
		/****** md5 signature: 1d43ee640bc87c33eb91c301526bbda9 ******/
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximal chordal deviation. The default value is 0.0001. Drawings of curves or patches are made with respect to an absolute maximal chordal deviation.
") MaximalChordialDeviation;
		Standard_Real MaximalChordialDeviation();

		/****** Prs3d_Drawer::MaximalParameterValue ******/
		/****** md5 signature: 6712bac42bcc154a7695aba5612939fa ******/
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Sets the maximum value allowed for the first and last parameters of an infinite curve. By default, this value is 500000.
") MaximalParameterValue;
		Standard_Real MaximalParameterValue();

		/****** Prs3d_Drawer::PlaneAspect ******/
		/****** md5 signature: 5860cc597653e9aeb633d2f0fe7a3a7e ******/
		%feature("compactdefaultargs") PlaneAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_PlaneAspect>

Description
-----------
Returns own settings for the appearance of planes, settings from linked Drawer or NULL if neither was set.
") PlaneAspect;
		const opencascade::handle<Prs3d_PlaneAspect> & PlaneAspect();

		/****** Prs3d_Drawer::PointAspect ******/
		/****** md5 signature: 29da78c1effc071ee48ea7973016bb47 ******/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_PointAspect>

Description
-----------
Returns own point aspect setting, settings from linked Drawer or NULL if neither was set. These attributes are used by the algorithms Prs3d_Point.
") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect();

		/****** Prs3d_Drawer::PreviousDeviationAngle ******/
		/****** md5 signature: e85ed7ba2c56cca9b0e1456a6b71d7d0 ******/
		%feature("compactdefaultargs") PreviousDeviationAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the previous deviation angle.
") PreviousDeviationAngle;
		Standard_Real PreviousDeviationAngle();

		/****** Prs3d_Drawer::PreviousDeviationCoefficient ******/
		/****** md5 signature: dd7dbf3ec23aaefa9df4097e8ef5c0e5 ******/
		%feature("compactdefaultargs") PreviousDeviationCoefficient;
		%feature("autodoc", "Return
-------
float

Description
-----------
Saves the previous value used for the chordal deviation coefficient.
") PreviousDeviationCoefficient;
		Standard_Real PreviousDeviationCoefficient();

		/****** Prs3d_Drawer::PreviousHLRDeviationAngle ******/
		/****** md5 signature: 82e7d8a97345e9ce23b5ce94343001fa ******/
		%feature("compactdefaultargs") PreviousHLRDeviationAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") PreviousHLRDeviationAngle;
		Standard_Real PreviousHLRDeviationAngle();

		/****** Prs3d_Drawer::SectionAspect ******/
		/****** md5 signature: 26f929946082f9b18d8262f33b33f118 ******/
		%feature("compactdefaultargs") SectionAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own LineAspect for section wire, settings from linked Drawer or NULL if neither was set. These attributes are used by the algorithm Prs3d_WFShape.
") SectionAspect;
		const opencascade::handle<Prs3d_LineAspect> & SectionAspect();

		/****** Prs3d_Drawer::SeenLineAspect ******/
		/****** md5 signature: a609dd759d3b7ec8b3b3731b84600f21 ******/
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own settings for seen line aspects, settings of linked Drawer or NULL if neither was set.
") SeenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & SeenLineAspect();

		/****** Prs3d_Drawer::SetArrowAspect ******/
		/****** md5 signature: 0a1adde0b720014d803adbe7c86e169d ******/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_ArrowAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for display attributes of arrows.
") SetArrowAspect;
		void SetArrowAspect(const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****** Prs3d_Drawer::SetAutoTriangulation ******/
		/****** md5 signature: 097ff08c0977b327c2162db8dc679c98 ******/
		%feature("compactdefaultargs") SetAutoTriangulation;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Sets IsAutoTriangulated on or off by setting the parameter theIsEnabled to true or false. If this flag is True automatic re-triangulation with deflection-check logic will be applied. Else this feature will be disable and triangulation is expected to be computed by application itself and no shading presentation at all if unavailable.
") SetAutoTriangulation;
		void SetAutoTriangulation(const Standard_Boolean theIsEnabled);

		/****** Prs3d_Drawer::SetDatumAspect ******/
		/****** md5 signature: 4647d9dc3797dd067dbf2dfe686ab369 ******/
		%feature("compactdefaultargs") SetDatumAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_DatumAspect

Return
-------
None

Description
-----------
Sets the modality theAspect for the display of datums.
") SetDatumAspect;
		void SetDatumAspect(const opencascade::handle<Prs3d_DatumAspect> & theAspect);

		/****** Prs3d_Drawer::SetDeviationAngle ******/
		/****** md5 signature: 6ca67bdbcd53d4506d39fd47bf3c03db ******/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: float

Return
-------
None

Description
-----------
Sets the deviation angle theAngle. Also sets the hasOwnDeviationAngle flag to Standard_True, and myPreviousDeviationAngle.
") SetDeviationAngle;
		void SetDeviationAngle(const Standard_Real theAngle);

		/****** Prs3d_Drawer::SetDeviationAngle ******/
		/****** md5 signature: 9bdb5f10031ccd09c439fbc45ff4df32 ******/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDeviationAngle() flag, e.g. undoes previous SetDeviationAngle().
") SetDeviationAngle;
		void SetDeviationAngle();

		/****** Prs3d_Drawer::SetDeviationCoefficient ******/
		/****** md5 signature: c876cabde5740c4ce35b0db72a481d97 ******/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "
Parameters
----------
theCoefficient: float

Return
-------
None

Description
-----------
Sets the deviation coefficient theCoefficient. Also sets the hasOwnDeviationCoefficient flag to Standard_True and myPreviousDeviationCoefficient.
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const Standard_Real theCoefficient);

		/****** Prs3d_Drawer::SetDeviationCoefficient ******/
		/****** md5 signature: 755d6894d3ae7cb400d463653d96c593 ******/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDeviationCoefficient() flag, e.g. undoes previous SetDeviationCoefficient().
") SetDeviationCoefficient;
		void SetDeviationCoefficient();

		/****** Prs3d_Drawer::SetDimAngleDisplayUnits ******/
		/****** md5 signature: 5cafc879a0fa9da7f678b0ed893a3b6e ******/
		%feature("compactdefaultargs") SetDimAngleDisplayUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
Sets angle units in which value for dimension presentation is displayed. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
") SetDimAngleDisplayUnits;
		void SetDimAngleDisplayUnits(TCollection_AsciiString theUnits);

		/****** Prs3d_Drawer::SetDimAngleModelUnits ******/
		/****** md5 signature: 93b2a30875cdc23219e463c5d2ab0bfe ******/
		%feature("compactdefaultargs") SetDimAngleModelUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
Sets dimension angle model units for computing of dimension presentation. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
") SetDimAngleModelUnits;
		void SetDimAngleModelUnits(TCollection_AsciiString theUnits);

		/****** Prs3d_Drawer::SetDimLengthDisplayUnits ******/
		/****** md5 signature: 7f89e9c7683b8fa3924af494b833fef5 ******/
		%feature("compactdefaultargs") SetDimLengthDisplayUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
Sets length units in which value for dimension presentation is displayed. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
") SetDimLengthDisplayUnits;
		void SetDimLengthDisplayUnits(TCollection_AsciiString theUnits);

		/****** Prs3d_Drawer::SetDimLengthModelUnits ******/
		/****** md5 signature: be6ef9d72701ad078664a2f567b1db09 ******/
		%feature("compactdefaultargs") SetDimLengthModelUnits;
		%feature("autodoc", "
Parameters
----------
theUnits: str

Return
-------
None

Description
-----------
Sets dimension length model units for computing of dimension presentation. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
") SetDimLengthModelUnits;
		void SetDimLengthModelUnits(TCollection_AsciiString theUnits);

		/****** Prs3d_Drawer::SetDimensionAspect ******/
		/****** md5 signature: 3cc8cbe992a4f857a78fc1aaa6580a19 ******/
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_DimensionAspect

Return
-------
None

Description
-----------
Sets the settings for the appearance of dimensions. The method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.
") SetDimensionAspect;
		void SetDimensionAspect(const opencascade::handle<Prs3d_DimensionAspect> & theAspect);

		/****** Prs3d_Drawer::SetDiscretisation ******/
		/****** md5 signature: 4361b5c3f1e3b5111800c4ea836567ea ******/
		%feature("compactdefaultargs") SetDiscretisation;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
None

Description
-----------
Sets the discretisation parameter theValue.
") SetDiscretisation;
		void SetDiscretisation(const Standard_Integer theValue);

		/****** Prs3d_Drawer::SetFaceBoundaryAspect ******/
		/****** md5 signature: 804ad972596fdd35ecb093f15856c7bb ******/
		%feature("compactdefaultargs") SetFaceBoundaryAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets line aspect for face boundaries. The method sets line aspect owned by the drawer that will be used during visualization instead of the one set in link. theAspect is the line aspect that determines the look of the face boundaries.
") SetFaceBoundaryAspect;
		void SetFaceBoundaryAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetFaceBoundaryDraw ******/
		/****** md5 signature: 0b7c11ee9c4d92584f0e7456f7a347a5 ******/
		%feature("compactdefaultargs") SetFaceBoundaryDraw;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Enables or disables face boundary drawing for shading presentations. The method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theIsEnabled is a boolean flag indicating whether the face boundaries should be drawn or not.
") SetFaceBoundaryDraw;
		void SetFaceBoundaryDraw(const Standard_Boolean theIsEnabled);

		/****** Prs3d_Drawer::SetFaceBoundaryUpperContinuity ******/
		/****** md5 signature: b2dc14181b073a972926abae505ae5ce ******/
		%feature("compactdefaultargs") SetFaceBoundaryUpperContinuity;
		%feature("autodoc", "
Parameters
----------
theMostAllowedEdgeClass: GeomAbs_Shape

Return
-------
None

Description
-----------
Set the most edge continuity class for face boundaries.
") SetFaceBoundaryUpperContinuity;
		void SetFaceBoundaryUpperContinuity(GeomAbs_Shape theMostAllowedEdgeClass);

		/****** Prs3d_Drawer::SetFreeBoundaryAspect ******/
		/****** md5 signature: 75dc7272677c2d304c07e394f41c07b7 ******/
		%feature("compactdefaultargs") SetFreeBoundaryAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for the display of free boundaries. The method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.
") SetFreeBoundaryAspect;
		void SetFreeBoundaryAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetFreeBoundaryDraw ******/
		/****** md5 signature: 357a2afadd44ce4fa5eb830caf568739 ******/
		%feature("compactdefaultargs") SetFreeBoundaryDraw;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Enables or disables drawing of free boundaries for shading presentations. The method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theIsEnabled is a boolean flag indicating whether the free boundaries should be drawn or not.
") SetFreeBoundaryDraw;
		void SetFreeBoundaryDraw(const Standard_Boolean theIsEnabled);

		/****** Prs3d_Drawer::SetHLRAngle ******/
		/****** md5 signature: 76fda7a04861224b0871f98ee167394b ******/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: float

Return
-------
None

Description
-----------
No available documentation.
") SetHLRAngle;
		void SetHLRAngle(const Standard_Real theAngle);

		/****** Prs3d_Drawer::SetHLRAngle ******/
		/****** md5 signature: 2e26deb79c9f12fded05a5d3f3274d8d ******/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetHLRAngle;
		void SetHLRAngle();

		/****** Prs3d_Drawer::SetHiddenLineAspect ******/
		/****** md5 signature: fc23aa00ae1da6d858eccdd0bffd021b ******/
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for the display of hidden lines in hidden line removal mode.
") SetHiddenLineAspect;
		void SetHiddenLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetIsoOnPlane ******/
		/****** md5 signature: 877d0513af2869807847d91ca78cd157 ******/
		%feature("compactdefaultargs") SetIsoOnPlane;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Sets IsoOnPlane on or off by setting the parameter theIsEnabled to true or false.
") SetIsoOnPlane;
		void SetIsoOnPlane(const Standard_Boolean theIsEnabled);

		/****** Prs3d_Drawer::SetIsoOnTriangulation ******/
		/****** md5 signature: 18d15c009ac1ef0cd00031a4866a34de ******/
		%feature("compactdefaultargs") SetIsoOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Enables or disables isolines on triangulation by setting the parameter theIsEnabled to true or false.
") SetIsoOnTriangulation;
		void SetIsoOnTriangulation(const Standard_Boolean theToEnable);

		/****** Prs3d_Drawer::SetLineArrowDraw ******/
		/****** md5 signature: 1ccad4d1b8e1bf8a7d688b21eb115dc5 ******/
		%feature("compactdefaultargs") SetLineArrowDraw;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Enables the drawing of an arrow at the end of each line. By default the arrows are not drawn.
") SetLineArrowDraw;
		void SetLineArrowDraw(const Standard_Boolean theIsEnabled);

		/****** Prs3d_Drawer::SetLineAspect ******/
		/****** md5 signature: edeacff48ba26eb953ac27ee5da1b9dd ******/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for display attributes of lines.
") SetLineAspect;
		void SetLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetLink ******/
		/****** md5 signature: a57c6c0127c30ad6a07c56ee53a36587 ******/
		%feature("compactdefaultargs") SetLink;
		%feature("autodoc", "
Parameters
----------
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Sets theDrawer as a link to which the current object references.
") SetLink;
		void SetLink(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** Prs3d_Drawer::SetMaximalChordialDeviation ******/
		/****** md5 signature: 432b23f0ed55ddc741078b7674cf10e8 ******/
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "
Parameters
----------
theChordialDeviation: float

Return
-------
None

Description
-----------
Defines the maximal chordial deviation when drawing any curve. Even if the type of deviation is set to TOD_Relative, this value is used by: Prs3d_DeflectionCurve Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace.
") SetMaximalChordialDeviation;
		void SetMaximalChordialDeviation(const Standard_Real theChordialDeviation);

		/****** Prs3d_Drawer::SetMaximalParameterValue ******/
		/****** md5 signature: aa314594e57535d77970bac6f2f02a1d ******/
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Defines the maximum value allowed for the first and last parameters of an infinite curve.
") SetMaximalParameterValue;
		void SetMaximalParameterValue(const Standard_Real theValue);

		/****** Prs3d_Drawer::SetOwnDatumAspects ******/
		/****** md5 signature: 8932f1aefe0746057b59cd498ae76d61 ******/
		%feature("compactdefaultargs") SetOwnDatumAspects;
		%feature("autodoc", "
Parameters
----------
theDefaults: Prs3d_Drawer (optional, default to opencascade::handle<Prs3d_Drawer>())

Return
-------
bool

Description
-----------
Sets own line aspects for datums. Returns False if own line for datums are already set.
") SetOwnDatumAspects;
		Standard_Boolean SetOwnDatumAspects(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****** Prs3d_Drawer::SetOwnLineAspects ******/
		/****** md5 signature: e66409de321081b5ec44a17dddcf0e3d ******/
		%feature("compactdefaultargs") SetOwnLineAspects;
		%feature("autodoc", "
Parameters
----------
theDefaults: Prs3d_Drawer (optional, default to opencascade::handle<Prs3d_Drawer>())

Return
-------
bool

Description
-----------
Sets own line aspects, which are single U and single V gray75 solid isolines (::UIsoAspect(), ::VIsoAspect()), red wire (::WireAspect()), yellow line (::LineAspect()), yellow seen line (::SeenLineAspect()), dashed yellow hidden line (::HiddenLineAspect()), green free boundary (::FreeBoundaryAspect()), yellow unfree boundary (::UnFreeBoundaryAspect()). Returns False if own line aspect are already set.
") SetOwnLineAspects;
		Standard_Boolean SetOwnLineAspects(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****** Prs3d_Drawer::SetPlaneAspect ******/
		/****** md5 signature: f22d1aee7c3703b9676dab2ac3cf0178 ******/
		%feature("compactdefaultargs") SetPlaneAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_PlaneAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for the display of planes.
") SetPlaneAspect;
		void SetPlaneAspect(const opencascade::handle<Prs3d_PlaneAspect> & theAspect);

		/****** Prs3d_Drawer::SetPointAspect ******/
		/****** md5 signature: 94b301114933fbb123df3ae8775512cc ******/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_PointAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for display attributes of points.
") SetPointAspect;
		void SetPointAspect(const opencascade::handle<Prs3d_PointAspect> & theAspect);

		/****** Prs3d_Drawer::SetSectionAspect ******/
		/****** md5 signature: 6c19b7443c1dc36132903ac9a28a5a0b ******/
		%feature("compactdefaultargs") SetSectionAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for display attributes of sections.
") SetSectionAspect;
		void SetSectionAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetSeenLineAspect ******/
		/****** md5 signature: 89d38d4b652b01b524f6eac51895b264 ******/
		%feature("compactdefaultargs") SetSeenLineAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for the display of seen lines in hidden line removal mode.
") SetSeenLineAspect;
		void SetSeenLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetShaderProgram ******/
		/****** md5 signature: 9d0adcad54c470d2bd41460db7853e8e ******/
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "
Parameters
----------
theProgram: Graphic3d_ShaderProgram
theAspect: Graphic3d_GroupAspect
theToOverrideDefaults: bool (optional, default to false)

Return
-------
bool

Description
-----------
Assign shader program for specified type of primitives. 
Parameter theProgram new program to set (might be NULL) 
Parameter theAspect the type of primitives 
Parameter theToOverrideDefaults if true then non-overridden attributes using defaults will be allocated and copied from the Link;  otherwise, only already customized attributes will be changed 
Return: True if presentation should be recomputed after creating aspects not previously customized (if theToOverrideDefaults is also True).
") SetShaderProgram;
		bool SetShaderProgram(const opencascade::handle<Graphic3d_ShaderProgram> & theProgram, const Graphic3d_GroupAspect theAspect, const bool theToOverrideDefaults = false);

		/****** Prs3d_Drawer::SetShadingAspect ******/
		/****** md5 signature: 45b3837322e0cd51320f7a5eb31578c6 ******/
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_ShadingAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for display attributes of shading.
") SetShadingAspect;
		void SetShadingAspect(const opencascade::handle<Prs3d_ShadingAspect> & theAspect);

		/****** Prs3d_Drawer::SetShadingModel ******/
		/****** md5 signature: 690559077ffb9b7c7d964dd137495ad4 ******/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "
Parameters
----------
theModel: Graphic3d_TypeOfShadingModel
theToOverrideDefaults: bool (optional, default to false)

Return
-------
bool

Description
-----------
Sets Shading Model type for the shading aspect.
") SetShadingModel;
		bool SetShadingModel(Graphic3d_TypeOfShadingModel theModel, bool theToOverrideDefaults = false);

		/****** Prs3d_Drawer::SetTextAspect ******/
		/****** md5 signature: 16268f9cae5cfb074a9ff4dfb480431d ******/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_TextAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for display attributes of text.
") SetTextAspect;
		void SetTextAspect(const opencascade::handle<Prs3d_TextAspect> & theAspect);

		/****** Prs3d_Drawer::SetTypeOfDeflection ******/
		/****** md5 signature: 81c195f8139170e0f0b9bbbe312ef7f8 ******/
		%feature("compactdefaultargs") SetTypeOfDeflection;
		%feature("autodoc", "
Parameters
----------
theTypeOfDeflection: Aspect_TypeOfDeflection

Return
-------
None

Description
-----------
Sets the type of chordal deflection. This indicates whether the deflection value is absolute or relative to the size of the object.
") SetTypeOfDeflection;
		void SetTypeOfDeflection(const Aspect_TypeOfDeflection theTypeOfDeflection);

		/****** Prs3d_Drawer::SetTypeOfHLR ******/
		/****** md5 signature: 6aaba1d38a89048d1a811523a13236d7 ******/
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "
Parameters
----------
theTypeOfHLR: Prs3d_TypeOfHLR

Return
-------
None

Description
-----------
Sets the type of HLR algorithm used by drawer's interactive objects.
") SetTypeOfHLR;
		void SetTypeOfHLR(const Prs3d_TypeOfHLR theTypeOfHLR);

		/****** Prs3d_Drawer::SetUIsoAspect ******/
		/****** md5 signature: 53fb2c4032ab095bc605ef5ed9d6de04 ******/
		%feature("compactdefaultargs") SetUIsoAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_IsoAspect

Return
-------
None

Description
-----------
No available documentation.
") SetUIsoAspect;
		void SetUIsoAspect(const opencascade::handle<Prs3d_IsoAspect> & theAspect);

		/****** Prs3d_Drawer::SetUnFreeBoundaryAspect ******/
		/****** md5 signature: b09e9b0550868d8e766250cc7582a2e5 ******/
		%feature("compactdefaultargs") SetUnFreeBoundaryAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for the display of shared boundaries. The method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.
") SetUnFreeBoundaryAspect;
		void SetUnFreeBoundaryAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetUnFreeBoundaryDraw ******/
		/****** md5 signature: bc18bdedb6e7b4bc8ac8c8bd71694ee7 ******/
		%feature("compactdefaultargs") SetUnFreeBoundaryDraw;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Enables or disables drawing of shared boundaries for shading presentations. The method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theIsEnabled is a boolean flag indicating whether the shared boundaries should be drawn or not.
") SetUnFreeBoundaryDraw;
		void SetUnFreeBoundaryDraw(const Standard_Boolean theIsEnabled);

		/****** Prs3d_Drawer::SetVIsoAspect ******/
		/****** md5 signature: 911f2c0ee7deff12cef662388c471713 ******/
		%feature("compactdefaultargs") SetVIsoAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_IsoAspect

Return
-------
None

Description
-----------
Sets the appearance of V isoparameters - theAspect.
") SetVIsoAspect;
		void SetVIsoAspect(const opencascade::handle<Prs3d_IsoAspect> & theAspect);

		/****** Prs3d_Drawer::SetVectorAspect ******/
		/****** md5 signature: 479fb7dcf203538af63a50a743c52cb5 ******/
		%feature("compactdefaultargs") SetVectorAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the modality theAspect for the display of vectors.
") SetVectorAspect;
		void SetVectorAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetVertexDrawMode ******/
		/****** md5 signature: 3741c3d9c3f8146b4737d5fbceeff113 ******/
		%feature("compactdefaultargs") SetVertexDrawMode;
		%feature("autodoc", "
Parameters
----------
theMode: Prs3d_VertexDrawMode

Return
-------
None

Description
-----------
Sets the mode of visualization of vertices of a TopoDS_Shape instance. By default, only stand-alone vertices (not belonging topologically to an edge) are drawn, that corresponds to Prs3d_VDM_Standalone mode. Switching to Prs3d_VDM_Standalone mode makes all shape's vertices visible. To inherit this parameter from the global drawer instance ('the link') when it is present, Prs3d_VDM_Inherited value should be used.
") SetVertexDrawMode;
		void SetVertexDrawMode(const Prs3d_VertexDrawMode theMode);

		/****** Prs3d_Drawer::SetWireAspect ******/
		/****** md5 signature: 72325ef6d023a7f7fa069eb7baf3294b ******/
		%feature("compactdefaultargs") SetWireAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the parameter theAspect for display of wires.
") SetWireAspect;
		void SetWireAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_Drawer::SetWireDraw ******/
		/****** md5 signature: 790eadb30c226a3d894f25120859429c ******/
		%feature("compactdefaultargs") SetWireDraw;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Sets WireDraw on or off by setting the parameter theIsEnabled to true or false.
") SetWireDraw;
		void SetWireDraw(const Standard_Boolean theIsEnabled);

		/****** Prs3d_Drawer::SetupOwnDefaults ******/
		/****** md5 signature: bdd5eb74b80039b116be4559fe1ee121 ******/
		%feature("compactdefaultargs") SetupOwnDefaults;
		%feature("autodoc", "Return
-------
None

Description
-----------
Setup all own aspects with default values.
") SetupOwnDefaults;
		void SetupOwnDefaults();

		/****** Prs3d_Drawer::SetupOwnFaceBoundaryAspect ******/
		/****** md5 signature: 56de0be3b702e67c26bd56574e01fd6d ******/
		%feature("compactdefaultargs") SetupOwnFaceBoundaryAspect;
		%feature("autodoc", "
Parameters
----------
theDefaults: Prs3d_Drawer (optional, default to opencascade::handle<Prs3d_Drawer>())

Return
-------
bool

Description
-----------
Sets own face boundary aspect, which is a black solid line by default. Returns False if the drawer already has its own attribute for face boundary aspect.
") SetupOwnFaceBoundaryAspect;
		Standard_Boolean SetupOwnFaceBoundaryAspect(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****** Prs3d_Drawer::SetupOwnPointAspect ******/
		/****** md5 signature: d1c0bbfa9dfec0450774acf4ca54dad3 ******/
		%feature("compactdefaultargs") SetupOwnPointAspect;
		%feature("autodoc", "
Parameters
----------
theDefaults: Prs3d_Drawer (optional, default to opencascade::handle<Prs3d_Drawer>())

Return
-------
bool

Description
-----------
Sets own point aspect, which is a yellow Aspect_TOM_PLUS marker by default. Returns False if the drawer already has its own attribute for point aspect.
") SetupOwnPointAspect;
		Standard_Boolean SetupOwnPointAspect(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****** Prs3d_Drawer::SetupOwnShadingAspect ******/
		/****** md5 signature: f23c7b598ed27ffb9a83c13b44836ee0 ******/
		%feature("compactdefaultargs") SetupOwnShadingAspect;
		%feature("autodoc", "
Parameters
----------
theDefaults: Prs3d_Drawer (optional, default to opencascade::handle<Prs3d_Drawer>())

Return
-------
bool

Description
-----------
Sets own shading aspect, which is Graphic3d_NameOfMaterial_Brass material by default. Returns False if the drawer already has its own attribute for shading aspect.
") SetupOwnShadingAspect;
		Standard_Boolean SetupOwnShadingAspect(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****** Prs3d_Drawer::ShadingAspect ******/
		/****** md5 signature: d658a34c620283ed10ba0f5964949287 ******/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ShadingAspect>

Description
-----------
Returns own settings for shading aspects, settings from linked Drawer or NULL if neither was set.
") ShadingAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & ShadingAspect();

		/****** Prs3d_Drawer::TextAspect ******/
		/****** md5 signature: b5579ef455a1d67c591bf61096ba8f71 ******/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_TextAspect>

Description
-----------
Returns own settings for text aspect, settings from linked Drawer or NULL if neither was set.
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****** Prs3d_Drawer::TypeOfDeflection ******/
		/****** md5 signature: fc7ea669393a04e1146251cf533ba812 ******/
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "Return
-------
Aspect_TypeOfDeflection

Description
-----------
Returns the type of chordal deflection. This indicates whether the deflection value is absolute or relative to the size of the object.
") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection();

		/****** Prs3d_Drawer::TypeOfHLR ******/
		/****** md5 signature: e4e50942bf562af106d24a9f06c4e967 ******/
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "Return
-------
Prs3d_TypeOfHLR

Description
-----------
Returns the type of HLR algorithm currently in use.
") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR();

		/****** Prs3d_Drawer::UIsoAspect ******/
		/****** md5 signature: 3190afcc1b7588cf3aebc5a5dfb0f248 ******/
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_IsoAspect>

Description
-----------
Defines own attributes for drawing an U isoparametric curve of a face, settings from linked Drawer or NULL if neither was set. //! These attributes are used by the following algorithms: Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace.
") UIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & UIsoAspect();

		/****** Prs3d_Drawer::UnFreeBoundaryAspect ******/
		/****** md5 signature: 938e2731b1cd708ba26696c39bdb6092 ******/
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own settings for shared boundary line aspects, settings from linked Drawer or NULL if neither was set. These attributes are used by the algorithm Prs3d_WFShape.
") UnFreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & UnFreeBoundaryAspect();

		/****** Prs3d_Drawer::UnFreeBoundaryDraw ******/
		/****** md5 signature: 4a9edda2cf498d8275abdb7dcc6bb228 ******/
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the drawing of the shared boundaries is enabled. True is the default setting.
") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw();

		/****** Prs3d_Drawer::UnsetFaceBoundaryUpperContinuity ******/
		/****** md5 signature: 641f0514b548bedcfbfe8eb2901f3d60 ******/
		%feature("compactdefaultargs") UnsetFaceBoundaryUpperContinuity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unset the most edge continuity class for face boundaries.
") UnsetFaceBoundaryUpperContinuity;
		void UnsetFaceBoundaryUpperContinuity();

		/****** Prs3d_Drawer::UnsetOwnDimAngleDisplayUnits ******/
		/****** md5 signature: 9dd91da7ca6e7927a05fc6117ef0e294 ******/
		%feature("compactdefaultargs") UnsetOwnDimAngleDisplayUnits;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDimAngleDisplayUnits() flag, e.g. undoes SetDimLengthDisplayUnits().
") UnsetOwnDimAngleDisplayUnits;
		void UnsetOwnDimAngleDisplayUnits();

		/****** Prs3d_Drawer::UnsetOwnDimAngleModelUnits ******/
		/****** md5 signature: 71d0041e858711a7619e2e03df179c5d ******/
		%feature("compactdefaultargs") UnsetOwnDimAngleModelUnits;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDimAngleModelUnits() flag, e.g. undoes SetDimAngleModelUnits().
") UnsetOwnDimAngleModelUnits;
		void UnsetOwnDimAngleModelUnits();

		/****** Prs3d_Drawer::UnsetOwnDimLengthDisplayUnits ******/
		/****** md5 signature: fdb3e789b66cd1942b0d00bcd6670af3 ******/
		%feature("compactdefaultargs") UnsetOwnDimLengthDisplayUnits;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDimLengthModelUnits() flag, e.g. undoes SetDimLengthDisplayUnits().
") UnsetOwnDimLengthDisplayUnits;
		void UnsetOwnDimLengthDisplayUnits();

		/****** Prs3d_Drawer::UnsetOwnDimLengthModelUnits ******/
		/****** md5 signature: 1a50bb3283206afa34f9447361719bb1 ******/
		%feature("compactdefaultargs") UnsetOwnDimLengthModelUnits;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDimLengthModelUnits() flag, e.g. undoes SetDimLengthModelUnits().
") UnsetOwnDimLengthModelUnits;
		void UnsetOwnDimLengthModelUnits();

		/****** Prs3d_Drawer::UnsetOwnDiscretisation ******/
		/****** md5 signature: 047cfc51bae6ced11e4becb284dbacb3 ******/
		%feature("compactdefaultargs") UnsetOwnDiscretisation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDiscretisation() flag, e.g. undoes SetDiscretisation().
") UnsetOwnDiscretisation;
		void UnsetOwnDiscretisation();

		/****** Prs3d_Drawer::UnsetOwnDrawHiddenLine ******/
		/****** md5 signature: 5572431df9d967dfcbbf53584bd58d8b ******/
		%feature("compactdefaultargs") UnsetOwnDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnDrawHiddenLine() flag, e.g. unsets EnableDrawHiddenLine()/DisableDrawHiddenLine().
") UnsetOwnDrawHiddenLine;
		void UnsetOwnDrawHiddenLine();

		/****** Prs3d_Drawer::UnsetOwnFaceBoundaryDraw ******/
		/****** md5 signature: a7a27bb2f61eb3eaa5c8b06d5f139710 ******/
		%feature("compactdefaultargs") UnsetOwnFaceBoundaryDraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnFaceBoundaryDraw() flag, e.g. undoes SetFaceBoundaryDraw().
") UnsetOwnFaceBoundaryDraw;
		void UnsetOwnFaceBoundaryDraw();

		/****** Prs3d_Drawer::UnsetOwnFreeBoundaryDraw ******/
		/****** md5 signature: 94cefbc7316ca879e51afce0a584b793 ******/
		%feature("compactdefaultargs") UnsetOwnFreeBoundaryDraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnFreeBoundaryDraw() flag, e.g. undoes SetFreeBoundaryDraw().
") UnsetOwnFreeBoundaryDraw;
		void UnsetOwnFreeBoundaryDraw();

		/****** Prs3d_Drawer::UnsetOwnIsAutoTriangulation ******/
		/****** md5 signature: e03d2d88873eb2223a6ee7b07d14bdc5 ******/
		%feature("compactdefaultargs") UnsetOwnIsAutoTriangulation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnIsAutoTriangulation() flag, e.g. undoes SetAutoTriangulation().
") UnsetOwnIsAutoTriangulation;
		void UnsetOwnIsAutoTriangulation();

		/****** Prs3d_Drawer::UnsetOwnIsoOnPlane ******/
		/****** md5 signature: 41dbe1528d3b195f364a7aca52198133 ******/
		%feature("compactdefaultargs") UnsetOwnIsoOnPlane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnIsoOnPlane() flag, e.g. undoes SetIsoOnPlane().
") UnsetOwnIsoOnPlane;
		void UnsetOwnIsoOnPlane();

		/****** Prs3d_Drawer::UnsetOwnIsoOnTriangulation ******/
		/****** md5 signature: a426e9014db1398599f41f21a28db797 ******/
		%feature("compactdefaultargs") UnsetOwnIsoOnTriangulation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnIsoOnTriangulation() flag, e.g. undoes SetIsoOnTriangulation().
") UnsetOwnIsoOnTriangulation;
		void UnsetOwnIsoOnTriangulation();

		/****** Prs3d_Drawer::UnsetOwnLineArrowDraw ******/
		/****** md5 signature: 8f51e78cbc30ffc8a248acb5c6b3f77e ******/
		%feature("compactdefaultargs") UnsetOwnLineArrowDraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset HasOwnLineArrowDraw() flag, e.g. undoes SetLineArrowDraw().
") UnsetOwnLineArrowDraw;
		void UnsetOwnLineArrowDraw();

		/****** Prs3d_Drawer::UnsetOwnMaximalChordialDeviation ******/
		/****** md5 signature: f807868cfb852d7979ae0ccc60dab291 ******/
		%feature("compactdefaultargs") UnsetOwnMaximalChordialDeviation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnMaximalChordialDeviation() flag, e.g. undoes SetMaximalChordialDeviation().
") UnsetOwnMaximalChordialDeviation;
		void UnsetOwnMaximalChordialDeviation();

		/****** Prs3d_Drawer::UnsetOwnMaximalParameterValue ******/
		/****** md5 signature: 600e906557feb6c3ae0b212506b7a078 ******/
		%feature("compactdefaultargs") UnsetOwnMaximalParameterValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnMaximalParameterValue() flag, e.g. undoes SetMaximalParameterValue().
") UnsetOwnMaximalParameterValue;
		void UnsetOwnMaximalParameterValue();

		/****** Prs3d_Drawer::UnsetOwnTypeOfDeflection ******/
		/****** md5 signature: 9a6eca2451096ca0cb4e2fd0a5d381fe ******/
		%feature("compactdefaultargs") UnsetOwnTypeOfDeflection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnTypeOfDeflection() flag, e.g. undoes SetTypeOfDeflection().
") UnsetOwnTypeOfDeflection;
		void UnsetOwnTypeOfDeflection();

		/****** Prs3d_Drawer::UnsetOwnUnFreeBoundaryDraw ******/
		/****** md5 signature: cb19469a6b5169c30236136f43f1f781 ******/
		%feature("compactdefaultargs") UnsetOwnUnFreeBoundaryDraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnUnFreeBoundaryDraw() flag, e.g. undoes SetUnFreeBoundaryDraw().
") UnsetOwnUnFreeBoundaryDraw;
		void UnsetOwnUnFreeBoundaryDraw();

		/****** Prs3d_Drawer::UnsetOwnWireDraw ******/
		/****** md5 signature: 81d5ff89cf03224619b8f656a62af29d ******/
		%feature("compactdefaultargs") UnsetOwnWireDraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets HasOwnWireDraw() flag, e.g. undoes SetWireDraw().
") UnsetOwnWireDraw;
		void UnsetOwnWireDraw();

		/****** Prs3d_Drawer::UpdatePreviousDeviationAngle ******/
		/****** md5 signature: 89a7b1ecfa621e3e7fc2f96b8782afff ******/
		%feature("compactdefaultargs") UpdatePreviousDeviationAngle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the previous deviation angle to the current value.
") UpdatePreviousDeviationAngle;
		void UpdatePreviousDeviationAngle();

		/****** Prs3d_Drawer::UpdatePreviousDeviationCoefficient ******/
		/****** md5 signature: a15fda7b93f5f72b4b8eb66b8f1fd5ee ******/
		%feature("compactdefaultargs") UpdatePreviousDeviationCoefficient;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the previous value used for the chordal deviation coefficient to the current state.
") UpdatePreviousDeviationCoefficient;
		void UpdatePreviousDeviationCoefficient();

		/****** Prs3d_Drawer::VIsoAspect ******/
		/****** md5 signature: 09b7691a9856c7b528ebade397f4a1e3 ******/
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_IsoAspect>

Description
-----------
Defines own attributes for drawing an V isoparametric curve of a face, settings from linked Drawer or NULL if neither was set. //! These attributes are used by the following algorithms: Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace.
") VIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & VIsoAspect();

		/****** Prs3d_Drawer::VectorAspect ******/
		/****** md5 signature: 5f71df175530885a64f389ca286a41bb ******/
		%feature("compactdefaultargs") VectorAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own settings for the appearance of vectors, settings from linked Drawer or NULL if neither was set.
") VectorAspect;
		const opencascade::handle<Prs3d_LineAspect> & VectorAspect();

		/****** Prs3d_Drawer::VertexDrawMode ******/
		/****** md5 signature: 909b24d3d9a35693286245e367d6447e ******/
		%feature("compactdefaultargs") VertexDrawMode;
		%feature("autodoc", "Return
-------
Prs3d_VertexDrawMode

Description
-----------
Returns the current mode of visualization of vertices of a TopoDS_Shape instance.
") VertexDrawMode;
		Prs3d_VertexDrawMode VertexDrawMode();

		/****** Prs3d_Drawer::WireAspect ******/
		/****** md5 signature: 636754a09bc13a0e0aa4e77f5c589fd0 ******/
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns own wire aspect settings, settings from linked Drawer or NULL if neither was set. These attributes are used by the algorithm Prs3d_WFShape.
") WireAspect;
		const opencascade::handle<Prs3d_LineAspect> & WireAspect();

		/****** Prs3d_Drawer::WireDraw ******/
		/****** md5 signature: 5d9e30c499e2ac3def846a0a7f29f5a7 ******/
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the drawing of the wire is enabled.
") WireDraw;
		Standard_Boolean WireDraw();

};


%make_alias(Prs3d_Drawer)

%extend Prs3d_Drawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Prs3d_Point *
********************/
class Prs3d_Point {
	public:
		/****** Prs3d_Point::Add ******/
		/****** md5 signature: 62ed47f03b18eddca6a01d991a8d5fb6 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation
thePoint: AnyPoint
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePrs, const AnyPoint & thePoint, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** Prs3d_Point::Match ******/
		/****** md5 signature: 0b99a7d2ff1fac1a4a91e5728b1339c9 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
Parameters
----------
thePoint: AnyPoint
theX: float
theY: float
theZ: float
theDistance: float

Return
-------
bool

Description
-----------
No available documentation.
") Match;
		static Standard_Boolean Match(const AnyPoint & thePoint, const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance);

};


%extend Prs3d_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Prs3d_PresentationShadow *
*********************************/
class Prs3d_PresentationShadow : public Graphic3d_Structure {
	public:
		/****** Prs3d_PresentationShadow::Prs3d_PresentationShadow ******/
		/****** md5 signature: ca4f62196f0716649e4a69b121843074 ******/
		%feature("compactdefaultargs") Prs3d_PresentationShadow;
		%feature("autodoc", "
Parameters
----------
theViewer: Graphic3d_StructureManager
thePrs: Graphic3d_Structure

Return
-------
None

Description
-----------
Constructs a shadow of existing presentation object.
") Prs3d_PresentationShadow;
		 Prs3d_PresentationShadow(const opencascade::handle<Graphic3d_StructureManager> & theViewer, const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****** Prs3d_PresentationShadow::CalculateBoundBox ******/
		/****** md5 signature: a6bde4513a3c46f9f4fb4761385ff10b ******/
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Do nothing - axis-aligned bounding box should be initialized from parent structure.
") CalculateBoundBox;
		virtual void CalculateBoundBox();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_PresentationShadow::ParentAffinity ******/
		/****** md5 signature: 9b0bdbaca5cd51b4bff82600c75ff027 ******/
		%feature("compactdefaultargs") ParentAffinity;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ViewAffinity>

Description
-----------
Returns view affinity of the parent presentation.
") ParentAffinity;
		const opencascade::handle<Graphic3d_ViewAffinity> & ParentAffinity();

		/****** Prs3d_PresentationShadow::ParentId ******/
		/****** md5 signature: c6149323d3f3c6f3e02c4be5b579c343 ******/
		%feature("compactdefaultargs") ParentId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the id of the parent presentation.
") ParentId;
		Standard_Integer ParentId();

};


%make_alias(Prs3d_PresentationShadow)

%extend Prs3d_PresentationShadow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Prs3d_Root *
*******************/
class Prs3d_Root {
	public:
		/****** Prs3d_Root::CurrentGroup ******/
		/****** md5 signature: e95e1e3804731856f1d7faf6d33cb8bd ******/
		%feature("compactdefaultargs") CurrentGroup;
		%feature("autodoc", "
Parameters
----------
thePrs3d: Prs3d_Presentation

Return
-------
opencascade::handle<Graphic3d_Group>

Description
-----------
No available documentation.
") CurrentGroup;
		static opencascade::handle<Graphic3d_Group> CurrentGroup(const opencascade::handle<Prs3d_Presentation> & thePrs3d);

		/****** Prs3d_Root::NewGroup ******/
		/****** md5 signature: 4f25dab2ea6d19aa0b7ebaa3dafab482 ******/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "
Parameters
----------
thePrs3d: Prs3d_Presentation

Return
-------
opencascade::handle<Graphic3d_Group>

Description
-----------
No available documentation.
") NewGroup;
		static opencascade::handle<Graphic3d_Group> NewGroup(const opencascade::handle<Prs3d_Presentation> & thePrs3d);

};


%extend Prs3d_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Prs3d_Text *
*******************/
class Prs3d_Text {
	public:
		/****** Prs3d_Text::Draw ******/
		/****** md5 signature: e497187cc47a0b4c170caa451c728072 ******/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "
Parameters
----------
theGroup: Graphic3d_Group
theAspect: Prs3d_TextAspect
theText: str
theAttachmentPoint: gp_Pnt

Return
-------
opencascade::handle<Graphic3d_Text>

Description
-----------
Defines the display of the text. 
Parameter theGroup group to add primitives 
Parameter theAspect presentation attributes 
Parameter theText text to draw 
Parameter theAttachmentPoint attachment point 
Return: text to draw.
") Draw;
		static opencascade::handle<Graphic3d_Text> Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const opencascade::handle<Prs3d_TextAspect> & theAspect, TCollection_ExtendedString theText, const gp_Pnt & theAttachmentPoint);

		/****** Prs3d_Text::Draw ******/
		/****** md5 signature: bffbe230252ee3e0d660a0f0a3cb5a41 ******/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "
Parameters
----------
theGroup: Graphic3d_Group
theAspect: Prs3d_TextAspect
theText: str
theOrientation: gp_Ax2
theHasOwnAnchor: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Graphic3d_Text>

Description
-----------
Draws the text label. 
Parameter theGroup group to add primitives 
Parameter theAspect presentation attributes 
Parameter theText text to draw 
Parameter theOrientation location and orientation specified in the model 3D space 
Parameter theHasOwnAnchor 
Return: text to draw.
") Draw;
		static opencascade::handle<Graphic3d_Text> Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const opencascade::handle<Prs3d_TextAspect> & theAspect, TCollection_ExtendedString theText, const gp_Ax2 & theOrientation, const Standard_Boolean theHasOwnAnchor = Standard_True);

};


%extend Prs3d_Text {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Prs3d_ToolQuadric *
**************************/
%nodefaultctor Prs3d_ToolQuadric;
class Prs3d_ToolQuadric {
	public:
		/****** Prs3d_ToolQuadric::CreatePolyTriangulation ******/
		/****** md5 signature: 969725a9ac628bcecddfe33496740acf ******/
		%feature("compactdefaultargs") CreatePolyTriangulation;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Generate primitives for 3D quadric surface presentation. 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") CreatePolyTriangulation;
		opencascade::handle<Poly_Triangulation> CreatePolyTriangulation(const gp_Trsf & theTrsf);

		/****** Prs3d_ToolQuadric::CreateTriangulation ******/
		/****** md5 signature: 4c6f5fda1d7eda1a0394d83f1c49bd55 ******/
		%feature("compactdefaultargs") CreateTriangulation;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface presentation. 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") CreateTriangulation;
		opencascade::handle<Graphic3d_ArrayOfTriangles> CreateTriangulation(const gp_Trsf & theTrsf);

		/****** Prs3d_ToolQuadric::FillArray ******/
		/****** md5 signature: 05aa8383885ae4a8861a03330fc93140 ******/
		%feature("compactdefaultargs") FillArray;
		%feature("autodoc", "
Parameters
----------
theArray: Graphic3d_ArrayOfTriangles
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Generate primitives for 3D quadric surface and fill the given array. 
Input parameter:[out] theArray the array of vertices;  when NULL, function will create an indexed array;  when not NULL, triangles will be appended to the end of array  (will raise an exception if reserved array size is not large enough) 
Input parameter: theTrsf optional transformation to apply.
") FillArray;
		void FillArray(opencascade::handle<Graphic3d_ArrayOfTriangles> & theArray, const gp_Trsf & theTrsf);

		/****** Prs3d_ToolQuadric::FillArray ******/
		/****** md5 signature: 7147828fbd45e9681ea3a53d5ddbf124 ******/
		%feature("compactdefaultargs") FillArray;
		%feature("autodoc", "
Parameters
----------
theArray: Graphic3d_ArrayOfTriangles
theTriangulation: Poly_Triangulation
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Generate primitives for 3D quadric surface presentation. @param[out] theArray generated array of triangles @param[out] theTriangulation generated triangulation 
Input parameter: theTrsf optional transformation to apply.
") FillArray;
		void FillArray(opencascade::handle<Graphic3d_ArrayOfTriangles> & theArray, opencascade::handle<Poly_Triangulation> & theTriangulation, const gp_Trsf & theTrsf);

		/****** Prs3d_ToolQuadric::TrianglesNb ******/
		/****** md5 signature: 8b7c815b2ac2556d491b7b49576cd32d ******/
		%feature("compactdefaultargs") TrianglesNb;
		%feature("autodoc", "
Parameters
----------
theSlicesNb: int
theStacksNb: int

Return
-------
int

Description
-----------
Return number of triangles for presentation with the given params.
") TrianglesNb;
		static Standard_Integer TrianglesNb(const Standard_Integer theSlicesNb, const Standard_Integer theStacksNb);

		/****** Prs3d_ToolQuadric::TrianglesNb ******/
		/****** md5 signature: 79e9c94384c6f9eca1682b3bd078e884 ******/
		%feature("compactdefaultargs") TrianglesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of triangles in generated presentation.
") TrianglesNb;
		Standard_Integer TrianglesNb();

		/****** Prs3d_ToolQuadric::VerticesNb ******/
		/****** md5 signature: 1326b929d9932628a0c679a5777a5b6c ******/
		%feature("compactdefaultargs") VerticesNb;
		%feature("autodoc", "
Parameters
----------
theSlicesNb: int
theStacksNb: int
theIsIndexed: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Return number of vertices for presentation with the given params.
") VerticesNb;
		static Standard_Integer VerticesNb(const Standard_Integer theSlicesNb, const Standard_Integer theStacksNb, const Standard_Boolean theIsIndexed = Standard_True);

		/****** Prs3d_ToolQuadric::VerticesNb ******/
		/****** md5 signature: 2f242abab1be940c103aeca916c73e88 ******/
		%feature("compactdefaultargs") VerticesNb;
		%feature("autodoc", "
Parameters
----------
theIsIndexed: bool (optional, default to true)

Return
-------
int

Description
-----------
Return number of vertices in generated presentation.
") VerticesNb;
		Standard_Integer VerticesNb(bool theIsIndexed = true);

};


%extend Prs3d_ToolQuadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Prs3d_ArrowAspect *
**************************/
class Prs3d_ArrowAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_ArrowAspect::Prs3d_ArrowAspect ******/
		/****** md5 signature: b4fa61cf30eaa8c64da5eee227f0377c ******/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework for displaying arrows in representations of lengths. The lengths displayed are either on their own or in chamfers, fillets, diameters and radii.
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect();

		/****** Prs3d_ArrowAspect::Prs3d_ArrowAspect ******/
		/****** md5 signature: fdb610b367c968bba1e1232c8ab58c06 ******/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "
Parameters
----------
anAngle: float
aLength: float

Return
-------
None

Description
-----------
Constructs a framework to display an arrow with a shaft of the length aLength and having a head with sides at the angle anAngle from each other.
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect(const Standard_Real anAngle, const Standard_Real aLength);

		/****** Prs3d_ArrowAspect::Prs3d_ArrowAspect ******/
		/****** md5 signature: 47ec9f21d50f8b3bf4ced85a1384c980 ******/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectLine3d

Return
-------
None

Description
-----------
No available documentation.
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****** Prs3d_ArrowAspect::Angle ******/
		/****** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the current value of the angle used when drawing an arrow.
") Angle;
		Standard_Real Angle();

		/****** Prs3d_ArrowAspect::Aspect ******/
		/****** md5 signature: 658e539c0394175cfd3aa70cb073ba78 ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_AspectLine3d>

Description
-----------
No available documentation.
") Aspect;
		const opencascade::handle<Graphic3d_AspectLine3d> & Aspect();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_ArrowAspect::IsZoomable ******/
		/****** md5 signature: 0e11552facaac98faf2474f0071c0b9d ******/
		%feature("compactdefaultargs") IsZoomable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the Arrow Zoomable is on; True by default.
") IsZoomable;
		bool IsZoomable();

		/****** Prs3d_ArrowAspect::Length ******/
		/****** md5 signature: 1d863a710d06afea5559458878200357 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the current value of the length used when drawing an arrow.
") Length;
		Standard_Real Length();

		/****** Prs3d_ArrowAspect::SetAngle ******/
		/****** md5 signature: eb58abb1f2735255b52070d752bb180a ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
anAngle: float

Return
-------
None

Description
-----------
defines the angle of the arrows.
") SetAngle;
		void SetAngle(const Standard_Real anAngle);

		/****** Prs3d_ArrowAspect::SetAspect ******/
		/****** md5 signature: 56753271c32070a7f0d3996502dbd4eb ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectLine3d

Return
-------
None

Description
-----------
No available documentation.
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****** Prs3d_ArrowAspect::SetColor ******/
		/****** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Prs3d_ArrowAspect::SetLength ******/
		/****** md5 signature: 49e1954d3eb0ee1dbf03153254bfe462 ******/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "
Parameters
----------
theLength: float

Return
-------
None

Description
-----------
Defines the length of the arrows.
") SetLength;
		void SetLength(const Standard_Real theLength);

		/****** Prs3d_ArrowAspect::SetZoomable ******/
		/****** md5 signature: 97ffe04fce7ef540e2fce9a76dd33eaa ******/
		%feature("compactdefaultargs") SetZoomable;
		%feature("autodoc", "
Parameters
----------
theIsZoomable: bool

Return
-------
None

Description
-----------
Turns usage of arrow zoomable on/off.
") SetZoomable;
		void SetZoomable(bool theIsZoomable);

};


%make_alias(Prs3d_ArrowAspect)

%extend Prs3d_ArrowAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Prs3d_BndBox *
*********************/
class Prs3d_BndBox : public Prs3d_Root {
	public:
		/****** Prs3d_BndBox::Add ******/
		/****** md5 signature: c54a75d50bfd4e7f1fb12cf7497bfbd8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theBndBox: Bnd_Box
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Computes presentation of a bounding box. 
Input parameter: thePresentation the presentation. 
Input parameter: theBndBox the bounding box. 
Input parameter: theDrawer the drawer.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const Bnd_Box & theBndBox, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** Prs3d_BndBox::Add ******/
		/****** md5 signature: 6b808f8029d0bc7d27373b55eaa80cd4 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theBndBox: Bnd_OBB
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Computes presentation of a bounding box. 
Input parameter: thePresentation the presentation. 
Input parameter: theBndBox the bounding box. 
Input parameter: theDrawer the drawer.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const Bnd_OBB & theBndBox, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** Prs3d_BndBox::FillSegments ******/
		/****** md5 signature: 5fb83e6b4c177d72797ad20d5dbb573c ******/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_OBB

Return
-------
opencascade::handle<Graphic3d_ArrayOfSegments>

Description
-----------
Create primitive array with line segments for displaying a box. 
Input parameter: theBox the box to add.
") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments(const Bnd_OBB & theBox);

		/****** Prs3d_BndBox::FillSegments ******/
		/****** md5 signature: 40a5714e880ddcdb51b116ed7e7d58a3 ******/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
opencascade::handle<Graphic3d_ArrayOfSegments>

Description
-----------
Create primitive array with line segments for displaying a box. 
Input parameter: theBox the box to add.
") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments(const Bnd_Box & theBox);

		/****** Prs3d_BndBox::FillSegments ******/
		/****** md5 signature: 6c2926015dd63abf7dfca1e5b0f1dee0 ******/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "
Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: Bnd_OBB

Return
-------
None

Description
-----------
Create primitive array with line segments for displaying a box. 
Input parameter:[out] theSegments primitive array to be filled;  should be at least 8 nodes and 24 edges in size 
Input parameter: theBox the box to add.
") FillSegments;
		static void FillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const Bnd_OBB & theBox);

		/****** Prs3d_BndBox::FillSegments ******/
		/****** md5 signature: 1dfe28468b5ba72dd334e07d0ac3116c ******/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "
Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: Bnd_Box

Return
-------
None

Description
-----------
Create primitive array with line segments for displaying a box. 
Input parameter:[out] theSegments primitive array to be filled;  should be at least 8 nodes and 24 edges in size 
Input parameter: theBox the box to add.
") FillSegments;
		static void FillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const Bnd_Box & theBox);

		/****** Prs3d_BndBox::fillSegments ******/
		/****** md5 signature: c902020df6559486e6ed2711d0bcc3d9 ******/
		%feature("compactdefaultargs") fillSegments;
		%feature("autodoc", "
Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: gp_Pnt *

Return
-------
None

Description
-----------
Create primitive array with line segments for displaying a box. 
Input parameter:[out] theSegments primitive array to be filled;  should be at least 8 nodes and 24 edges in size 
Input parameter: theBox the box to add.
") fillSegments;
		static void fillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const gp_Pnt * theBox);

};


%extend Prs3d_BndBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Prs3d_DatumAspect *
**************************/
class Prs3d_DatumAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_DatumAspect::Prs3d_DatumAspect ******/
		/****** md5 signature: 71be1d27ce693ac5509c01c1b9013cbd ******/
		%feature("compactdefaultargs") Prs3d_DatumAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
An empty constructor.
") Prs3d_DatumAspect;
		 Prs3d_DatumAspect();

		/****** Prs3d_DatumAspect::ArrowAspect ******/
		/****** md5 signature: 29e63b2128edf1fedd73ca50d8ecc2d8 ******/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ArrowAspect>

Description
-----------
Returns the arrow aspect of presentation.
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****** Prs3d_DatumAspect::ArrowPartForAxis ******/
		/****** md5 signature: 7a1df2eb76e4e1e3416cc302c58ee37b ******/
		%feature("compactdefaultargs") ArrowPartForAxis;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
Prs3d_DatumParts

Description
-----------
Returns type of arrow for a type of axis.
") ArrowPartForAxis;
		static Prs3d_DatumParts ArrowPartForAxis(Prs3d_DatumParts thePart);

		/****** Prs3d_DatumAspect::Attribute ******/
		/****** md5 signature: d7ca7bee3d949bb4cd8c2c3c07920d6e ******/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "
Parameters
----------
theType: Prs3d_DatumAttribute

Return
-------
float

Description
-----------
Returns the attribute of the datum type.
") Attribute;
		Standard_Real Attribute(Prs3d_DatumAttribute theType);

		/****** Prs3d_DatumAspect::AxisLength ******/
		/****** md5 signature: 78fdae0390bbc7bf04978fb62d2c6a4b ******/
		%feature("compactdefaultargs") AxisLength;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
float

Description
-----------
Returns the length of the displayed first axis.
") AxisLength;
		Standard_Real AxisLength(Prs3d_DatumParts thePart);

		/****** Prs3d_DatumAspect::CopyAspectsFrom ******/
		/****** md5 signature: ec90d65075dc1aad3151ac0b5a24cb1b ******/
		%feature("compactdefaultargs") CopyAspectsFrom;
		%feature("autodoc", "
Parameters
----------
theOther: Prs3d_DatumAspect

Return
-------
None

Description
-----------
Performs deep copy of attributes from another aspect instance.
") CopyAspectsFrom;
		void CopyAspectsFrom(const opencascade::handle<Prs3d_DatumAspect> & theOther);

		/****** Prs3d_DatumAspect::DatumAxes ******/
		/****** md5 signature: 25421ca286b68e0e5619b29932d4e2d2 ******/
		%feature("compactdefaultargs") DatumAxes;
		%feature("autodoc", "Return
-------
Prs3d_DatumAxes

Description
-----------
Returns axes used in the datum aspect.
") DatumAxes;
		Prs3d_DatumAxes DatumAxes();

		/****** Prs3d_DatumAspect::DrawDatumPart ******/
		/****** md5 signature: 589c4fbc66e194b032a506fb72d2943b ******/
		%feature("compactdefaultargs") DrawDatumPart;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
bool

Description
-----------
Returns true if the given part is used in axes of aspect.
") DrawDatumPart;
		Standard_Boolean DrawDatumPart(Prs3d_DatumParts thePart);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_DatumAspect::LineAspect ******/
		/****** md5 signature: 9af72ca119f843e15222dd5546dc6dfb ******/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns line aspect for specified part.
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect(Prs3d_DatumParts thePart);

		/****** Prs3d_DatumAspect::PointAspect ******/
		/****** md5 signature: 50902dc571bbda51cee2855b6ef5ff8d ******/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_PointAspect>

Description
-----------
Returns the point aspect of origin wireframe presentation.
") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect();

		/****** Prs3d_DatumAspect::SetArrowAspect ******/
		/****** md5 signature: 0a1adde0b720014d803adbe7c86e169d ******/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_ArrowAspect

Return
-------
None

Description
-----------
Sets the arrow aspect of presentation.
") SetArrowAspect;
		void SetArrowAspect(const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****** Prs3d_DatumAspect::SetAttribute ******/
		/****** md5 signature: addb95d2429f8a93b0aa29cc41d7d7c3 ******/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "
Parameters
----------
theType: Prs3d_DatumAttribute
theValue: float

Return
-------
None

Description
-----------
Sets the attribute of the datum type.
") SetAttribute;
		void SetAttribute(Prs3d_DatumAttribute theType, const Standard_Real theValue);

		/****** Prs3d_DatumAspect::SetAxisLength ******/
		/****** md5 signature: 368cf5f58e7c88156ee1613e1838afa1 ******/
		%feature("compactdefaultargs") SetAxisLength;
		%feature("autodoc", "
Parameters
----------
theL1: float
theL2: float
theL3: float

Return
-------
None

Description
-----------
Sets the lengths of the three axes.
") SetAxisLength;
		void SetAxisLength(Standard_Real theL1, Standard_Real theL2, Standard_Real theL3);

		/****** Prs3d_DatumAspect::SetDrawArrows ******/
		/****** md5 signature: 77144cbf3c12e0f52352851c91f67a12 ******/
		%feature("compactdefaultargs") SetDrawArrows;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Sets option to draw or not arrows for axes.
") SetDrawArrows;
		void SetDrawArrows(Standard_Boolean theToDraw);

		/****** Prs3d_DatumAspect::SetDrawDatumAxes ******/
		/****** md5 signature: 60ca5c83f384aa6188d8ce4043d65437 ******/
		%feature("compactdefaultargs") SetDrawDatumAxes;
		%feature("autodoc", "
Parameters
----------
theType: Prs3d_DatumAxes

Return
-------
None

Description
-----------
Sets the axes used in the datum aspect.
") SetDrawDatumAxes;
		void SetDrawDatumAxes(Prs3d_DatumAxes theType);

		/****** Prs3d_DatumAspect::SetDrawLabels ******/
		/****** md5 signature: e034ff7bc5e70c3493e6a993aa989169 ******/
		%feature("compactdefaultargs") SetDrawLabels;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Sets option to draw or not to draw text labels for axes.
") SetDrawLabels;
		void SetDrawLabels(Standard_Boolean theToDraw);

		/****** Prs3d_DatumAspect::SetPointAspect ******/
		/****** md5 signature: 94b301114933fbb123df3ae8775512cc ******/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_PointAspect

Return
-------
None

Description
-----------
Returns the point aspect of origin wireframe presentation.
") SetPointAspect;
		void SetPointAspect(const opencascade::handle<Prs3d_PointAspect> & theAspect);

		/****** Prs3d_DatumAspect::SetTextAspect ******/
		/****** md5 signature: 55cb9b8736123a342e5c4fc4e4bbf496 ******/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "
Parameters
----------
theTextAspect: Prs3d_TextAspect

Return
-------
None

Description
-----------
Sets text attributes for rendering labels.
") SetTextAspect;
		void SetTextAspect(const opencascade::handle<Prs3d_TextAspect> & theTextAspect);

		/****** Prs3d_DatumAspect::SetToDrawLabels ******/
		/****** md5 signature: 01b84536290f88c0f6c2733c7bfb4076 ******/
		%feature("compactdefaultargs") SetToDrawLabels;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
No available documentation.
") SetToDrawLabels;
		void SetToDrawLabels(Standard_Boolean theToDraw);

		/****** Prs3d_DatumAspect::ShadingAspect ******/
		/****** md5 signature: 0e02ad2657728f8fa670dd55189d1518 ******/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
opencascade::handle<Prs3d_ShadingAspect>

Description
-----------
Returns shading aspect for specified part.
") ShadingAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & ShadingAspect(Prs3d_DatumParts thePart);

		/****** Prs3d_DatumAspect::TextAspect ******/
		/****** md5 signature: e0f44028ed1f363b874a5b8421f2d89b ******/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "
Parameters
----------
thePart: Prs3d_DatumParts

Return
-------
opencascade::handle<Prs3d_TextAspect>

Description
-----------
Returns the text attributes for rendering label of specified part (Prs3d_DatumParts_XAxis/Prs3d_DatumParts_YAxis/Prs3d_DatumParts_ZAxis).
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect(Prs3d_DatumParts thePart);

		/****** Prs3d_DatumAspect::TextAspect ******/
		/****** md5 signature: cfcafff19dee0a33d3ad10bb73a9e0cf ******/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_TextAspect>

Description
-----------
No available documentation.
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****** Prs3d_DatumAspect::ToDrawArrows ******/
		/****** md5 signature: 7fd3cfe7831ebb75887b42f1c3721e82 ******/
		%feature("compactdefaultargs") ToDrawArrows;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if axes arrows are drawn; True by default.
") ToDrawArrows;
		Standard_Boolean ToDrawArrows();

		/****** Prs3d_DatumAspect::ToDrawLabels ******/
		/****** md5 signature: e96476e7cdea51d0791faaa945b8761b ******/
		%feature("compactdefaultargs") ToDrawLabels;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if axes labels are drawn; True by default.
") ToDrawLabels;
		Standard_Boolean ToDrawLabels();

};


%make_alias(Prs3d_DatumAspect)

%extend Prs3d_DatumAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Prs3d_DimensionAspect *
******************************/
class Prs3d_DimensionAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_DimensionAspect::Prs3d_DimensionAspect ******/
		/****** md5 signature: 91653a7dfcd8aee23d454b90b48b648a ******/
		%feature("compactdefaultargs") Prs3d_DimensionAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework to define the display of dimensions.
") Prs3d_DimensionAspect;
		 Prs3d_DimensionAspect();

		/****** Prs3d_DimensionAspect::ArrowAspect ******/
		/****** md5 signature: 29e63b2128edf1fedd73ca50d8ecc2d8 ******/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ArrowAspect>

Description
-----------
Returns the settings for displaying arrows.
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****** Prs3d_DimensionAspect::ArrowOrientation ******/
		/****** md5 signature: 5a1600ad23cd2f3f294beec2cf662f46 ******/
		%feature("compactdefaultargs") ArrowOrientation;
		%feature("autodoc", "Return
-------
Prs3d_DimensionArrowOrientation

Description
-----------
Gets orientation of arrows (external or internal).
") ArrowOrientation;
		Prs3d_DimensionArrowOrientation ArrowOrientation();

		/****** Prs3d_DimensionAspect::ArrowTailSize ******/
		/****** md5 signature: 8555ac26347823eb4d6bb4cef26824d4 ******/
		%feature("compactdefaultargs") ArrowTailSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns arrow tail size.
") ArrowTailSize;
		Standard_Real ArrowTailSize();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_DimensionAspect::ExtensionSize ******/
		/****** md5 signature: 876d08434cb9c896916a7933c4b53809 ******/
		%feature("compactdefaultargs") ExtensionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns extension size.
") ExtensionSize;
		Standard_Real ExtensionSize();

		/****** Prs3d_DimensionAspect::IsArrows3d ******/
		/****** md5 signature: f61af83d91c92e9bc34305443832f5b0 ******/
		%feature("compactdefaultargs") IsArrows3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets type of arrows.
") IsArrows3d;
		Standard_Boolean IsArrows3d();

		/****** Prs3d_DimensionAspect::IsText3d ******/
		/****** md5 signature: 4abdeea26e7a341e46ba908ea0dece0f ******/
		%feature("compactdefaultargs") IsText3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check if text for dimension label is 3d.
") IsText3d;
		Standard_Boolean IsText3d();

		/****** Prs3d_DimensionAspect::IsTextShaded ******/
		/****** md5 signature: 1c534a4e07128c68ced7aacfe72bf3f9 ******/
		%feature("compactdefaultargs") IsTextShaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check if 3d text for dimension label is shaded.
") IsTextShaded;
		Standard_Boolean IsTextShaded();

		/****** Prs3d_DimensionAspect::IsUnitsDisplayed ******/
		/****** md5 signature: 472a67e20dfe083be2b13ca1e61837d2 ******/
		%feature("compactdefaultargs") IsUnitsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Shows if Units are to be displayed along with dimension value.
") IsUnitsDisplayed;
		Standard_Boolean IsUnitsDisplayed();

		/****** Prs3d_DimensionAspect::LineAspect ******/
		/****** md5 signature: 927a4415098fa84b4a5920c8e43e39c2 ******/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns the settings for the display of lines used in presentation of dimensions.
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect();

		/****** Prs3d_DimensionAspect::MakeArrows3d ******/
		/****** md5 signature: 825771bc33ebe567091de5f6b4d2d339 ******/
		%feature("compactdefaultargs") MakeArrows3d;
		%feature("autodoc", "
Parameters
----------
theIsArrows3d: bool

Return
-------
None

Description
-----------
Sets type of arrows.
") MakeArrows3d;
		void MakeArrows3d(const Standard_Boolean theIsArrows3d);

		/****** Prs3d_DimensionAspect::MakeText3d ******/
		/****** md5 signature: 0ef0b6cf172d280c59d9cc614719f340 ******/
		%feature("compactdefaultargs") MakeText3d;
		%feature("autodoc", "
Parameters
----------
isText3d: bool

Return
-------
None

Description
-----------
Sets type of text.
") MakeText3d;
		void MakeText3d(const Standard_Boolean isText3d);

		/****** Prs3d_DimensionAspect::MakeTextShaded ******/
		/****** md5 signature: 0fb1b973fa5159b97cf84937bc389706 ******/
		%feature("compactdefaultargs") MakeTextShaded;
		%feature("autodoc", "
Parameters
----------
theIsTextShaded: bool

Return
-------
None

Description
-----------
Turns on/off text shading for 3d text.
") MakeTextShaded;
		void MakeTextShaded(const Standard_Boolean theIsTextShaded);

		/****** Prs3d_DimensionAspect::MakeUnitsDisplayed ******/
		/****** md5 signature: 65ce3eaad48ff3c494eb3af4a295d192 ******/
		%feature("compactdefaultargs") MakeUnitsDisplayed;
		%feature("autodoc", "
Parameters
----------
theIsDisplayed: bool

Return
-------
None

Description
-----------
Specifies whether the units string should be displayed along with value label or not.
") MakeUnitsDisplayed;
		void MakeUnitsDisplayed(const Standard_Boolean theIsDisplayed);

		/****** Prs3d_DimensionAspect::SetArrowAspect ******/
		/****** md5 signature: 0a1adde0b720014d803adbe7c86e169d ******/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_ArrowAspect

Return
-------
None

Description
-----------
Sets the display attributes of arrows used in presentation of dimensions.
") SetArrowAspect;
		void SetArrowAspect(const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****** Prs3d_DimensionAspect::SetArrowOrientation ******/
		/****** md5 signature: e29ddcc6a4355053ab1075a28990f7ea ******/
		%feature("compactdefaultargs") SetArrowOrientation;
		%feature("autodoc", "
Parameters
----------
theArrowOrient: Prs3d_DimensionArrowOrientation

Return
-------
None

Description
-----------
Sets orientation of arrows (external or internal). By default orientation is chosen automatically according to situation and text label size.
") SetArrowOrientation;
		void SetArrowOrientation(const Prs3d_DimensionArrowOrientation theArrowOrient);

		/****** Prs3d_DimensionAspect::SetArrowTailSize ******/
		/****** md5 signature: 6f712cbd4312444c74fb341820f5e475 ******/
		%feature("compactdefaultargs") SetArrowTailSize;
		%feature("autodoc", "
Parameters
----------
theSize: float

Return
-------
None

Description
-----------
Set size for arrow tail (extension without text).
") SetArrowTailSize;
		void SetArrowTailSize(const Standard_Real theSize);

		/****** Prs3d_DimensionAspect::SetCommonColor ******/
		/****** md5 signature: c36f70a5dca65f5552c2b1f4e32740d3 ******/
		%feature("compactdefaultargs") SetCommonColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets the same color for all parts of dimension: lines, arrows and text.
") SetCommonColor;
		void SetCommonColor(const Quantity_Color & theColor);

		/****** Prs3d_DimensionAspect::SetExtensionSize ******/
		/****** md5 signature: 147385e01f844b6be32f7db9aa7116ec ******/
		%feature("compactdefaultargs") SetExtensionSize;
		%feature("autodoc", "
Parameters
----------
theSize: float

Return
-------
None

Description
-----------
Sets extension size.
") SetExtensionSize;
		void SetExtensionSize(const Standard_Real theSize);

		/****** Prs3d_DimensionAspect::SetLineAspect ******/
		/****** md5 signature: edeacff48ba26eb953ac27ee5da1b9dd ******/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_LineAspect

Return
-------
None

Description
-----------
Sets the display attributes of lines used in presentation of dimensions.
") SetLineAspect;
		void SetLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****** Prs3d_DimensionAspect::SetTextAspect ******/
		/****** md5 signature: 16268f9cae5cfb074a9ff4dfb480431d ******/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Prs3d_TextAspect

Return
-------
None

Description
-----------
Sets the display attributes of text used in presentation of dimensions.
") SetTextAspect;
		void SetTextAspect(const opencascade::handle<Prs3d_TextAspect> & theAspect);

		/****** Prs3d_DimensionAspect::SetTextHorizontalPosition ******/
		/****** md5 signature: c1a6b04c0044a90c16ddd598ff5af285 ******/
		%feature("compactdefaultargs") SetTextHorizontalPosition;
		%feature("autodoc", "
Parameters
----------
thePosition: Prs3d_DimensionTextHorizontalPosition

Return
-------
None

Description
-----------
Sets horizontal text alignment for text label.
") SetTextHorizontalPosition;
		void SetTextHorizontalPosition(const Prs3d_DimensionTextHorizontalPosition thePosition);

		/****** Prs3d_DimensionAspect::SetTextVerticalPosition ******/
		/****** md5 signature: 67b93b5d2e82369207fcbd8db56ab2e0 ******/
		%feature("compactdefaultargs") SetTextVerticalPosition;
		%feature("autodoc", "
Parameters
----------
thePosition: Prs3d_DimensionTextVerticalPosition

Return
-------
None

Description
-----------
Sets vertical text alignment for text label.
") SetTextVerticalPosition;
		void SetTextVerticalPosition(const Prs3d_DimensionTextVerticalPosition thePosition);

		/****** Prs3d_DimensionAspect::SetValueStringFormat ******/
		/****** md5 signature: c90581f68c9212c4b117a58c8726a92a ******/
		%feature("compactdefaultargs") SetValueStringFormat;
		%feature("autodoc", "
Parameters
----------
theFormat: str

Return
-------
None

Description
-----------
Sets 'sprintf'-syntax format for formatting dimension value labels.
") SetValueStringFormat;
		void SetValueStringFormat(TCollection_AsciiString theFormat);

		/****** Prs3d_DimensionAspect::TextAspect ******/
		/****** md5 signature: cfcafff19dee0a33d3ad10bb73a9e0cf ******/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_TextAspect>

Description
-----------
Returns the settings for the display of text used in presentation of dimensions.
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****** Prs3d_DimensionAspect::TextHorizontalPosition ******/
		/****** md5 signature: c17d48164b8e6aadf722732285847490 ******/
		%feature("compactdefaultargs") TextHorizontalPosition;
		%feature("autodoc", "Return
-------
Prs3d_DimensionTextHorizontalPosition

Description
-----------
Gets horizontal text alignment for text label.
") TextHorizontalPosition;
		Prs3d_DimensionTextHorizontalPosition TextHorizontalPosition();

		/****** Prs3d_DimensionAspect::TextVerticalPosition ******/
		/****** md5 signature: 569e13c3e4d7a46bf9297bd77e248762 ******/
		%feature("compactdefaultargs") TextVerticalPosition;
		%feature("autodoc", "Return
-------
Prs3d_DimensionTextVerticalPosition

Description
-----------
Gets vertical text alignment for text label.
") TextVerticalPosition;
		Prs3d_DimensionTextVerticalPosition TextVerticalPosition();

		/****** Prs3d_DimensionAspect::ValueStringFormat ******/
		/****** md5 signature: e4551f0184a1e112744cdfd42e8ebf52 ******/
		%feature("compactdefaultargs") ValueStringFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns format.
") ValueStringFormat;
		const TCollection_AsciiString & ValueStringFormat();

};


%make_alias(Prs3d_DimensionAspect)

%extend Prs3d_DimensionAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Prs3d_LineAspect *
*************************/
class Prs3d_LineAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_LineAspect::Prs3d_LineAspect ******/
		/****** md5 signature: 89e8a7892b119d2cd7c4096f62812e91 ******/
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theType: Aspect_TypeOfLine
theWidth: float

Return
-------
None

Description
-----------
Constructs a framework for line aspect defined by - the color aColor - the type of line aType and - the line thickness aWidth. Type of line refers to whether the line is solid or dotted, for example.
") Prs3d_LineAspect;
		 Prs3d_LineAspect(const Quantity_Color & theColor, const Aspect_TypeOfLine theType, const Standard_Real theWidth);

		/****** Prs3d_LineAspect::Prs3d_LineAspect ******/
		/****** md5 signature: 0927d9715b5f7a178665974ee6006b1b ******/
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectLine3d

Return
-------
None

Description
-----------
No available documentation.
") Prs3d_LineAspect;
		 Prs3d_LineAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****** Prs3d_LineAspect::Aspect ******/
		/****** md5 signature: 658e539c0394175cfd3aa70cb073ba78 ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_AspectLine3d>

Description
-----------
Returns the line aspect. This is defined as the set of color, type and thickness attributes.
") Aspect;
		const opencascade::handle<Graphic3d_AspectLine3d> & Aspect();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_LineAspect::SetAspect ******/
		/****** md5 signature: 56753271c32070a7f0d3996502dbd4eb ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectLine3d

Return
-------
None

Description
-----------
No available documentation.
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****** Prs3d_LineAspect::SetColor ******/
		/****** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets the line color defined at the time of construction. Default value: Quantity_NOC_YELLOW.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Prs3d_LineAspect::SetTypeOfLine ******/
		/****** md5 signature: ab16b63c6acbfbe8823d61eaab0dd088 ******/
		%feature("compactdefaultargs") SetTypeOfLine;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfLine

Return
-------
None

Description
-----------
Sets the type of line defined at the time of construction. This could, for example, be solid, dotted or made up of dashes. Default value: Aspect_TOL_SOLID.
") SetTypeOfLine;
		void SetTypeOfLine(const Aspect_TypeOfLine theType);

		/****** Prs3d_LineAspect::SetWidth ******/
		/****** md5 signature: a388bd43f011bc773d8da404945719b5 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: float

Return
-------
None

Description
-----------
Sets the line width defined at the time of construction. Default value: 1.
") SetWidth;
		void SetWidth(const Standard_Real theWidth);

};


%make_alias(Prs3d_LineAspect)

%extend Prs3d_LineAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Prs3d_PlaneAspect *
**************************/
class Prs3d_PlaneAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_PlaneAspect::Prs3d_PlaneAspect ******/
		/****** md5 signature: 4a68b8d6ce636d8fb0e63a24d0243f01 ******/
		%feature("compactdefaultargs") Prs3d_PlaneAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework for the display of planes.
") Prs3d_PlaneAspect;
		 Prs3d_PlaneAspect();

		/****** Prs3d_PlaneAspect::ArrowAspect ******/
		/****** md5 signature: a23c36f571ace4bc32d35d7f8ed896ef ******/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns the settings for displaying an arrow.
") ArrowAspect;
		const opencascade::handle<Prs3d_LineAspect> & ArrowAspect();

		/****** Prs3d_PlaneAspect::ArrowsAngle ******/
		/****** md5 signature: bdee51ccaa26f85344bf4a999c7524f5 ******/
		%feature("compactdefaultargs") ArrowsAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the angle of the arrowhead used in the display of arrows involved in the presentation of planes.
") ArrowsAngle;
		Standard_Real ArrowsAngle();

		/****** Prs3d_PlaneAspect::ArrowsLength ******/
		/****** md5 signature: 836101e02503de37c81f271e2eced819 ******/
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the arrow shaft used in the display of arrows.
") ArrowsLength;
		Standard_Real ArrowsLength();

		/****** Prs3d_PlaneAspect::ArrowsSize ******/
		/****** md5 signature: 0214be7b615b35899c0612da8cfa855d ******/
		%feature("compactdefaultargs") ArrowsSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the size of arrows used in the display of planes.
") ArrowsSize;
		Standard_Real ArrowsSize();

		/****** Prs3d_PlaneAspect::DisplayCenterArrow ******/
		/****** md5 signature: 1fb436095464335ec78de5386dcc5429 ******/
		%feature("compactdefaultargs") DisplayCenterArrow;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the display of center arrows is allowed.
") DisplayCenterArrow;
		Standard_Boolean DisplayCenterArrow();

		/****** Prs3d_PlaneAspect::DisplayEdges ******/
		/****** md5 signature: 2fd6a00bac4cd81ac82d3cc0a8a4c080 ******/
		%feature("compactdefaultargs") DisplayEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DisplayEdges;
		Standard_Boolean DisplayEdges();

		/****** Prs3d_PlaneAspect::DisplayEdgesArrows ******/
		/****** md5 signature: b0498ea7a969981d6f9dd53af9f90fca ******/
		%feature("compactdefaultargs") DisplayEdgesArrows;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the display of edge arrows is allowed.
") DisplayEdgesArrows;
		Standard_Boolean DisplayEdgesArrows();

		/****** Prs3d_PlaneAspect::DisplayIso ******/
		/****** md5 signature: 11917be0b220fa13cc0cd6a1f36d7ee3 ******/
		%feature("compactdefaultargs") DisplayIso;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the display of isoparameters is allowed.
") DisplayIso;
		Standard_Boolean DisplayIso();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_PlaneAspect::EdgesAspect ******/
		/****** md5 signature: 99d38bc9cc235945a249087a8e222d9d ******/
		%feature("compactdefaultargs") EdgesAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns the attributes of displayed edges involved in the presentation of planes.
") EdgesAspect;
		const opencascade::handle<Prs3d_LineAspect> & EdgesAspect();

		/****** Prs3d_PlaneAspect::IsoAspect ******/
		/****** md5 signature: 83893d909882b40175a1633cdfa103c1 ******/
		%feature("compactdefaultargs") IsoAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_LineAspect>

Description
-----------
Returns the attributes of displayed isoparameters involved in the presentation of planes.
") IsoAspect;
		const opencascade::handle<Prs3d_LineAspect> & IsoAspect();

		/****** Prs3d_PlaneAspect::IsoDistance ******/
		/****** md5 signature: 5dd6ae35b7e8d7aaeb1d12487ce5c534 ******/
		%feature("compactdefaultargs") IsoDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance between isoparameters used in the display of planes.
") IsoDistance;
		Standard_Real IsoDistance();

		/****** Prs3d_PlaneAspect::PlaneXLength ******/
		/****** md5 signature: 0ebee457fb0057620ba1071f8a557f59 ******/
		%feature("compactdefaultargs") PlaneXLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the x axis used in the display of planes.
") PlaneXLength;
		Standard_Real PlaneXLength();

		/****** Prs3d_PlaneAspect::PlaneYLength ******/
		/****** md5 signature: 92f20b79f985e08e22abb894369bb9d5 ******/
		%feature("compactdefaultargs") PlaneYLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the y axis used in the display of planes.
") PlaneYLength;
		Standard_Real PlaneYLength();

		/****** Prs3d_PlaneAspect::SetArrowsAngle ******/
		/****** md5 signature: 81a299b629366fc787a03cf3c0addc7c ******/
		%feature("compactdefaultargs") SetArrowsAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: float

Return
-------
None

Description
-----------
Sets the angle of the arrowhead used in the display of arrows involved in the presentation of planes.
") SetArrowsAngle;
		void SetArrowsAngle(const Standard_Real theAngle);

		/****** Prs3d_PlaneAspect::SetArrowsLength ******/
		/****** md5 signature: ca40ac1a3c3df178050aad5bc0d07e17 ******/
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", "
Parameters
----------
theLength: float

Return
-------
None

Description
-----------
No available documentation.
") SetArrowsLength;
		void SetArrowsLength(const Standard_Real theLength);

		/****** Prs3d_PlaneAspect::SetArrowsSize ******/
		/****** md5 signature: 9b9cec88c84a3be7c103fc1f8ca81f5c ******/
		%feature("compactdefaultargs") SetArrowsSize;
		%feature("autodoc", "
Parameters
----------
theSize: float

Return
-------
None

Description
-----------
Sets the angle of the arrowhead used in the display of planes.
") SetArrowsSize;
		void SetArrowsSize(const Standard_Real theSize);

		/****** Prs3d_PlaneAspect::SetDisplayCenterArrow ******/
		/****** md5 signature: 565cfca1cbb382aeb22c48a18cc9d000 ******/
		%feature("compactdefaultargs") SetDisplayCenterArrow;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Sets the display attributes defined in DisplayCenterArrow to active.
") SetDisplayCenterArrow;
		void SetDisplayCenterArrow(const Standard_Boolean theToDraw);

		/****** Prs3d_PlaneAspect::SetDisplayEdges ******/
		/****** md5 signature: 4aa2e1362476fe44fe3ce8047262cf32 ******/
		%feature("compactdefaultargs") SetDisplayEdges;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayEdges;
		void SetDisplayEdges(const Standard_Boolean theToDraw);

		/****** Prs3d_PlaneAspect::SetDisplayEdgesArrows ******/
		/****** md5 signature: 0bb86419876cc07708f6c1513b841778 ******/
		%feature("compactdefaultargs") SetDisplayEdgesArrows;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Sets the display attributes defined in DisplayEdgesArrows to active.
") SetDisplayEdgesArrows;
		void SetDisplayEdgesArrows(const Standard_Boolean theToDraw);

		/****** Prs3d_PlaneAspect::SetDisplayIso ******/
		/****** md5 signature: 6a70f549b1851e6a0e6288f10d110dbc ******/
		%feature("compactdefaultargs") SetDisplayIso;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Sets the display attributes defined in DisplayIso to active.
") SetDisplayIso;
		void SetDisplayIso(const Standard_Boolean theToDraw);

		/****** Prs3d_PlaneAspect::SetIsoDistance ******/
		/****** md5 signature: 067b7f8b79ddcf1d22fd4f26aeef95b7 ******/
		%feature("compactdefaultargs") SetIsoDistance;
		%feature("autodoc", "
Parameters
----------
theL: float

Return
-------
None

Description
-----------
Sets the distance L between isoparameters used in the display of planes.
") SetIsoDistance;
		void SetIsoDistance(const Standard_Real theL);

		/****** Prs3d_PlaneAspect::SetPlaneLength ******/
		/****** md5 signature: f16164e91ce1683213487473d9edee00 ******/
		%feature("compactdefaultargs") SetPlaneLength;
		%feature("autodoc", "
Parameters
----------
theLX: float
theLY: float

Return
-------
None

Description
-----------
No available documentation.
") SetPlaneLength;
		void SetPlaneLength(const Standard_Real theLX, const Standard_Real theLY);

};


%make_alias(Prs3d_PlaneAspect)

%extend Prs3d_PlaneAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Prs3d_PointAspect *
**************************/
class Prs3d_PointAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_PointAspect::Prs3d_PointAspect ******/
		/****** md5 signature: 56f6a323546bcbaeda1938b1b532613c ******/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfMarker
theColor: Quantity_Color
theScale: float

Return
-------
None

Description
-----------
No available documentation.
") Prs3d_PointAspect;
		 Prs3d_PointAspect(const Aspect_TypeOfMarker theType, const Quantity_Color & theColor, const Standard_Real theScale);

		/****** Prs3d_PointAspect::Prs3d_PointAspect ******/
		/****** md5 signature: 5bca70665a644bdd45c0abb1e025d96f ******/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theWidth: int
theHeight: int
theTexture: TColStd_HArray1OfByte

Return
-------
None

Description
-----------
Defines the user defined marker point.
") Prs3d_PointAspect;
		 Prs3d_PointAspect(const Quantity_Color & theColor, const Standard_Integer theWidth, const Standard_Integer theHeight, const opencascade::handle<TColStd_HArray1OfByte> & theTexture);

		/****** Prs3d_PointAspect::Prs3d_PointAspect ******/
		/****** md5 signature: 5e221962e2590f7f3a9470ca4c69750a ******/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectMarker3d

Return
-------
None

Description
-----------
No available documentation.
") Prs3d_PointAspect;
		 Prs3d_PointAspect(const opencascade::handle<Graphic3d_AspectMarker3d> & theAspect);

		/****** Prs3d_PointAspect::Aspect ******/
		/****** md5 signature: b075966b949cc604da1320178d5dfc7b ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_AspectMarker3d>

Description
-----------
No available documentation.
") Aspect;
		const opencascade::handle<Graphic3d_AspectMarker3d> & Aspect();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_PointAspect::GetTexture ******/
		/****** md5 signature: 136a09247f5a3ec392ae0210becb9db4 ******/
		%feature("compactdefaultargs") GetTexture;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_MarkerImage>

Description
-----------
Returns marker's texture.
") GetTexture;
		const opencascade::handle<Graphic3d_MarkerImage> & GetTexture();

		/****** Prs3d_PointAspect::GetTextureSize ******/
		/****** md5 signature: 1863448b7396bf35afa6e88b3181a485 ******/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
theWidth: int
theHeight: int

Description
-----------
Returns marker's texture size.
") GetTextureSize;
		void GetTextureSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Prs3d_PointAspect::SetAspect ******/
		/****** md5 signature: de15dd4d9d8f9fa265ac1cf2bbd0ac5c ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectMarker3d

Return
-------
None

Description
-----------
No available documentation.
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectMarker3d> & theAspect);

		/****** Prs3d_PointAspect::SetColor ******/
		/****** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
defines the color to be used when drawing a point. Default value: Quantity_NOC_YELLOW.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Prs3d_PointAspect::SetScale ******/
		/****** md5 signature: 85c1419c4c5459593a06ce585a34394d ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
None

Description
-----------
defines the size of the marker used when drawing a point. Default value: 1.
") SetScale;
		void SetScale(const Standard_Real theScale);

		/****** Prs3d_PointAspect::SetTypeOfMarker ******/
		/****** md5 signature: be39bcc2898f7c9dd0438ff7bc2dcd9b ******/
		%feature("compactdefaultargs") SetTypeOfMarker;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfMarker

Return
-------
None

Description
-----------
defines the type of representation to be used when drawing a point. Default value: Aspect_TOM_PLUS.
") SetTypeOfMarker;
		void SetTypeOfMarker(const Aspect_TypeOfMarker theType);

};


%make_alias(Prs3d_PointAspect)

%extend Prs3d_PointAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Prs3d_ShadingAspect *
****************************/
class Prs3d_ShadingAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_ShadingAspect::Prs3d_ShadingAspect ******/
		/****** md5 signature: db222516ee8fc8ac4248112046da6126 ******/
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework to display shading.
") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect();

		/****** Prs3d_ShadingAspect::Prs3d_ShadingAspect ******/
		/****** md5 signature: dd594bd5c6416ab50d29290cd219d4d2 ******/
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Return
-------
None

Description
-----------
Constructor with initialization.
") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****** Prs3d_ShadingAspect::Aspect ******/
		/****** md5 signature: d6792358ef216cd98219869e734c5100 ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_AspectFillArea3d>

Description
-----------
Returns the polygons aspect properties.
") Aspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & Aspect();

		/****** Prs3d_ShadingAspect::Color ******/
		/****** md5 signature: 26e5db46bf56238619ef2f5db63c0374 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
aModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_FRONT_SIDE)

Return
-------
Quantity_Color

Description
-----------
Returns the polygons color.
") Color;
		const Quantity_Color & Color(const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_ShadingAspect::Material ******/
		/****** md5 signature: 5931f39cda36847ef31b8a02dd06c896 ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "
Parameters
----------
aModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_FRONT_SIDE)

Return
-------
Graphic3d_MaterialAspect

Description
-----------
Returns the polygons material aspect.
") Material;
		const Graphic3d_MaterialAspect & Material(const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);

		/****** Prs3d_ShadingAspect::SetAspect ******/
		/****** md5 signature: 4457b3b38d09a7c88bae5cde283658a2 ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Return
-------
None

Description
-----------
No available documentation.
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****** Prs3d_ShadingAspect::SetColor ******/
		/****** md5 signature: 4b2ccc4c88ce1c8c4d5c30e53722d1c0 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color
aModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_BOTH_SIDE)

Return
-------
None

Description
-----------
Change the polygons interior color and material ambient color.
") SetColor;
		void SetColor(const Quantity_Color & aColor, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****** Prs3d_ShadingAspect::SetMaterial ******/
		/****** md5 signature: eadb7c7b0b749513719b149451620b03 ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Graphic3d_MaterialAspect
aModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_BOTH_SIDE)

Return
-------
None

Description
-----------
Change the polygons material aspect.
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect & aMaterial, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****** Prs3d_ShadingAspect::SetTransparency ******/
		/****** md5 signature: 4ff15759dcf949cd3e818917c15b9459 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
aValue: float
aModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_BOTH_SIDE)

Return
-------
None

Description
-----------
Change the polygons transparency value. Warning: aValue must be in the range 0,1. 0 is the default (NO transparent).
") SetTransparency;
		void SetTransparency(const Standard_Real aValue, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****** Prs3d_ShadingAspect::Transparency ******/
		/****** md5 signature: f11c84451e1571f76cb27f2a24dfcac3 ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "
Parameters
----------
aModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_FRONT_SIDE)

Return
-------
float

Description
-----------
Returns the polygons transparency value.
") Transparency;
		Standard_Real Transparency(const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);

};


%make_alias(Prs3d_ShadingAspect)

%extend Prs3d_ShadingAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Prs3d_TextAspect *
*************************/
class Prs3d_TextAspect : public Prs3d_BasicAspect {
	public:
		/****** Prs3d_TextAspect::Prs3d_TextAspect ******/
		/****** md5 signature: d32ac8ef92b4764ff16ee6d86a462b84 ******/
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework for defining display attributes of text.
") Prs3d_TextAspect;
		 Prs3d_TextAspect();

		/****** Prs3d_TextAspect::Prs3d_TextAspect ******/
		/****** md5 signature: 9454273939c19a35102b91f621ad98aa ******/
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectText3d

Return
-------
None

Description
-----------
No available documentation.
") Prs3d_TextAspect;
		 Prs3d_TextAspect(const opencascade::handle<Graphic3d_AspectText3d> & theAspect);

		/****** Prs3d_TextAspect::Angle ******/
		/****** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the angle.
") Angle;
		Standard_Real Angle();

		/****** Prs3d_TextAspect::Aspect ******/
		/****** md5 signature: f1838eaa82eb3030f8e2c594c3f7547e ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_AspectText3d>

Description
-----------
Returns the purely textual attributes used in the display of text. These include: - color - font - height/width ratio, that is, the expansion factor, and - space between characters.
") Aspect;
		const opencascade::handle<Graphic3d_AspectText3d> & Aspect();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Prs3d_TextAspect::Height ******/
		/****** md5 signature: e5e3c5b90c971d7ac0e43c341f82b9e0 ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the height of the text box.
") Height;
		Standard_Real Height();

		/****** Prs3d_TextAspect::HorizontalJustification ******/
		/****** md5 signature: 5a4fffadc6e767f23cf6c215227c4b32 ******/
		%feature("compactdefaultargs") HorizontalJustification;
		%feature("autodoc", "Return
-------
Graphic3d_HorizontalTextAlignment

Description
-----------
Returns the horizontal alignment of the text. The range of values includes: - left - center - right, and - normal (justified).
") HorizontalJustification;
		Graphic3d_HorizontalTextAlignment HorizontalJustification();

		/****** Prs3d_TextAspect::Orientation ******/
		/****** md5 signature: e104ae6956bd3f616f6f24fe4068b879 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
Graphic3d_TextPath

Description
-----------
Returns the orientation of the text. Text can be displayed in the following directions: - up - down - left, or - right.
") Orientation;
		Graphic3d_TextPath Orientation();

		/****** Prs3d_TextAspect::SetAngle ******/
		/****** md5 signature: 76a49ca25a7aa0cf5ba05b3c533fe78e ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: float

Return
-------
None

Description
-----------
Sets the angle.
") SetAngle;
		void SetAngle(const Standard_Real theAngle);

		/****** Prs3d_TextAspect::SetAspect ******/
		/****** md5 signature: de716cb17919b9d72659f26039b080ed ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectText3d

Return
-------
None

Description
-----------
No available documentation.
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectText3d> & theAspect);

		/****** Prs3d_TextAspect::SetColor ******/
		/****** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets the color of the type used in text display.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Prs3d_TextAspect::SetFont ******/
		/****** md5 signature: 61d12f4a548c85ea1d3fd6a76e34b6f6 ******/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "
Parameters
----------
theFont: str

Return
-------
None

Description
-----------
Sets the font used in text display.
") SetFont;
		void SetFont(Standard_CString theFont);

		/****** Prs3d_TextAspect::SetHeight ******/
		/****** md5 signature: 052437153b834706be1197300ee007be ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
theHeight: float

Return
-------
None

Description
-----------
Sets the height of the text.
") SetHeight;
		void SetHeight(const Standard_Real theHeight);

		/****** Prs3d_TextAspect::SetHorizontalJustification ******/
		/****** md5 signature: d13a7ed85e481556617d406511c20750 ******/
		%feature("compactdefaultargs") SetHorizontalJustification;
		%feature("autodoc", "
Parameters
----------
theJustification: Graphic3d_HorizontalTextAlignment

Return
-------
None

Description
-----------
Sets horizontal alignment of text.
") SetHorizontalJustification;
		void SetHorizontalJustification(const Graphic3d_HorizontalTextAlignment theJustification);

		/****** Prs3d_TextAspect::SetOrientation ******/
		/****** md5 signature: fa084966a71ce2ccc53aca96fb5ea72a ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: Graphic3d_TextPath

Return
-------
None

Description
-----------
Sets the orientation of text.
") SetOrientation;
		void SetOrientation(const Graphic3d_TextPath theOrientation);

		/****** Prs3d_TextAspect::SetVerticalJustification ******/
		/****** md5 signature: b5a08c20180045c046834ffe855d66ae ******/
		%feature("compactdefaultargs") SetVerticalJustification;
		%feature("autodoc", "
Parameters
----------
theJustification: Graphic3d_VerticalTextAlignment

Return
-------
None

Description
-----------
Sets the vertical alignment of text.
") SetVerticalJustification;
		void SetVerticalJustification(const Graphic3d_VerticalTextAlignment theJustification);

		/****** Prs3d_TextAspect::VerticalJustification ******/
		/****** md5 signature: 49f5776e0dd6047a65b098fb1da8438c ******/
		%feature("compactdefaultargs") VerticalJustification;
		%feature("autodoc", "Return
-------
Graphic3d_VerticalTextAlignment

Description
-----------
Returns the vertical alignment of the text. The range of values includes: - normal - top - cap - half - base - bottom.
") VerticalJustification;
		Graphic3d_VerticalTextAlignment VerticalJustification();

};


%make_alias(Prs3d_TextAspect)

%extend Prs3d_TextAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Prs3d_ToolCylinder *
***************************/
class Prs3d_ToolCylinder : public Prs3d_ToolQuadric {
	public:
		/****** Prs3d_ToolCylinder::Prs3d_ToolCylinder ******/
		/****** md5 signature: a0078429be42ebfbc0c4d2d7cd2a64c1 ******/
		%feature("compactdefaultargs") Prs3d_ToolCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a cylinder. 
Input parameter: theBottomRad cylinder bottom radius 
Input parameter: theTopRad cylinder top radius 
Input parameter: theHeight cylinder height 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolCylinder;
		 Prs3d_ToolCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolCylinder::Create ******/
		/****** md5 signature: 13768f849e92213eb84bca75772c907d ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface and return a filled array. 
Input parameter: theBottomRad cylinder bottom radius 
Input parameter: theTopRad cylinder top radius 
Input parameter: theHeight cylinder height 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

};


%extend Prs3d_ToolCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Prs3d_ToolDisk *
***********************/
class Prs3d_ToolDisk : public Prs3d_ToolQuadric {
	public:
		/****** Prs3d_ToolDisk::Prs3d_ToolDisk ******/
		/****** md5 signature: 5106660590090ab9bf0b6e40023ae2c4 ******/
		%feature("compactdefaultargs") Prs3d_ToolDisk;
		%feature("autodoc", "
Parameters
----------
theInnerRadius: float
theOuterRadius: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a disk. 
Input parameter: theInnerRadius inner disk radius 
Input parameter: theOuterRadius outer disk radius 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolDisk;
		 Prs3d_ToolDisk(const Standard_Real theInnerRadius, const Standard_Real theOuterRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolDisk::Create ******/
		/****** md5 signature: 5ecf369558d3c3c5b58970d367036258 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theInnerRadius: float
theOuterRadius: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface. 
Input parameter: theInnerRadius inner disc radius 
Input parameter: theOuterRadius outer disc radius 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theInnerRadius, const Standard_Real theOuterRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****** Prs3d_ToolDisk::SetAngleRange ******/
		/****** md5 signature: 8cba406fe6dc42c10e17d05c4656eda9 ******/
		%feature("compactdefaultargs") SetAngleRange;
		%feature("autodoc", "
Parameters
----------
theStartAngle: float
theEndAngle: float

Return
-------
None

Description
-----------
Set angle range in radians [0, 2*PI] by default. 
Input parameter: theStartAngle Start angle in counter clockwise order 
Input parameter: theEndAngle End angle in counter clockwise order.
") SetAngleRange;
		void SetAngleRange(Standard_Real theStartAngle, Standard_Real theEndAngle);

};


%extend Prs3d_ToolDisk {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Prs3d_ToolSector *
*************************/
class Prs3d_ToolSector : public Prs3d_ToolQuadric {
	public:
		/****** Prs3d_ToolSector::Prs3d_ToolSector ******/
		/****** md5 signature: 077e30551d2b7fff0a377a40b6504a0f ******/
		%feature("compactdefaultargs") Prs3d_ToolSector;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a sector (quadrant). 
Input parameter: theRadius sector radius 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolSector;
		 Prs3d_ToolSector(const Standard_Real theRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolSector::Create ******/
		/****** md5 signature: f383fdd95c4d52d12685500a764da048 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface. 
Input parameter: theRadius sector radius 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

};


%extend Prs3d_ToolSector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Prs3d_ToolSphere *
*************************/
class Prs3d_ToolSphere : public Prs3d_ToolQuadric {
	public:
		/****** Prs3d_ToolSphere::Prs3d_ToolSphere ******/
		/****** md5 signature: 512c4ee62ddac02d40e1d19c91dfd749 ******/
		%feature("compactdefaultargs") Prs3d_ToolSphere;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a sphere. 
Input parameter: theRadius sphere radius 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolSphere;
		 Prs3d_ToolSphere(const Standard_Real theRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolSphere::Create ******/
		/****** md5 signature: f383fdd95c4d52d12685500a764da048 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface. 
Input parameter: theRadius sphere radius 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

};


%extend Prs3d_ToolSphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Prs3d_ToolTorus *
************************/
class Prs3d_ToolTorus : public Prs3d_ToolQuadric {
	public:
		/****** Prs3d_ToolTorus::Prs3d_ToolTorus ******/
		/****** md5 signature: 8a652d1c1c7e4d1a50eee4b129851dbc ******/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a complete torus. 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolTorus::Prs3d_ToolTorus ******/
		/****** md5 signature: 2accee27f8defef2bfbc627df25e1f15 ******/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a torus pipe segment. 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theAngle angle to create a torus pipe segment 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolTorus::Prs3d_ToolTorus ******/
		/****** md5 signature: 7993686707597a46b2d0f4ec645c5d95 ******/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle1: float
theAngle2: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a torus ring segment. 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theAngle1 first angle to create a torus ring segment 
Input parameter: theAngle2 second angle to create a torus ring segment 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle1, const Standard_Real theAngle2, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolTorus::Prs3d_ToolTorus ******/
		/****** md5 signature: 71ca9f767c504cae9394d92ff59f012b ******/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle1: float
theAngle2: float
theAngle: float
theNbSlices: int
theNbStacks: int

Return
-------
None

Description
-----------
Initializes the algorithm creating a torus ring segment. 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theAngle1 first angle to create a torus ring segment 
Input parameter: theAngle2 second angle to create a torus ring segment 
Input parameter: theAngle angle to create a torus pipe segment 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter.
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle1, const Standard_Real theAngle2, const Standard_Real theAngle, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****** Prs3d_ToolTorus::Create ******/
		/****** md5 signature: 07e9f2ec71b87fc6919fefde93de32fa ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface (complete torus). 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****** Prs3d_ToolTorus::Create ******/
		/****** md5 signature: 3348019fdf3fab6b27a846084af219b5 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface (torus segment). 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theAngle angle to create a torus pipe segment 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****** Prs3d_ToolTorus::Create ******/
		/****** md5 signature: b40020a7ec87651ff79ed79b9036743d ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle1: float
theAngle2: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface (torus ring segment). 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theAngle1 first angle to create a torus ring segment 
Input parameter: theAngle2 second angle to create a torus ring segment 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle1, const Standard_Real theAngle2, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****** Prs3d_ToolTorus::Create ******/
		/****** md5 signature: 0197847161c119b751c8a39e51506651 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle1: float
theAngle2: float
theAngle: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Generate primitives for 3D quadric surface (segment of the torus ring segment). 
Input parameter: theMajorRad distance from the center of the pipe to the center of the torus 
Input parameter: theMinorRad radius of the pipe 
Input parameter: theAngle1 first angle to create a torus ring segment 
Input parameter: theAngle2 second angle to create a torus ring segment 
Input parameter: theAngle angle to create a torus pipe segment 
Input parameter: theNbSlices number of slices within U parameter 
Input parameter: theNbStacks number of stacks within V parameter 
Input parameter: theTrsf optional transformation to apply 
Return: generated triangulation.
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle1, const Standard_Real theAngle2, const Standard_Real theAngle, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

};


%extend Prs3d_ToolTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Prs3d_IsoAspect *
************************/
class Prs3d_IsoAspect : public Prs3d_LineAspect {
	public:
		/****** Prs3d_IsoAspect::Prs3d_IsoAspect ******/
		/****** md5 signature: 20cefbd9d7de79b5d91df215a7381425 ******/
		%feature("compactdefaultargs") Prs3d_IsoAspect;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theType: Aspect_TypeOfLine
theWidth: float
theNumber: int

Return
-------
None

Description
-----------
Constructs a framework to define display attributes of isoparameters. These include: - the color attribute aColor - the type of line aType - the width value aWidth - aNumber, the number of isoparameters to be displayed.
") Prs3d_IsoAspect;
		 Prs3d_IsoAspect(const Quantity_Color & theColor, const Aspect_TypeOfLine theType, const Standard_Real theWidth, const Standard_Integer theNumber);

		/****** Prs3d_IsoAspect::Number ******/
		/****** md5 signature: 783fc82a0927a26fa0826e4fe2a7ebe6 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of U or V isoparametric curves drawn for a single face.
") Number;
		Standard_Integer Number();

		/****** Prs3d_IsoAspect::SetNumber ******/
		/****** md5 signature: c8bd8ca751df6f1dad0f528a62fe2912 ******/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "
Parameters
----------
theNumber: int

Return
-------
None

Description
-----------
defines the number of U or V isoparametric curves to be drawn for a single face. Default value: 10.
") SetNumber;
		void SetNumber(const Standard_Integer theNumber);

};


%make_alias(Prs3d_IsoAspect)

%extend Prs3d_IsoAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Prs3d_ShapeTool:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
Prs3d_Presentation=OCC.Core.Graphic3d.Graphic3d_Structure
}
/* deprecated methods */
%pythoncode {
@deprecated
def prs3d_AddFreeEdges(*args):
	return prs3d.AddFreeEdges(*args)

@deprecated
def prs3d_AddPrimitivesGroup(*args):
	return prs3d.AddPrimitivesGroup(*args)

@deprecated
def prs3d_GetDeflection(*args):
	return prs3d.GetDeflection(*args)

@deprecated
def prs3d_GetDeflection(*args):
	return prs3d.GetDeflection(*args)

@deprecated
def prs3d_MatchSegment(*args):
	return prs3d.MatchSegment(*args)

@deprecated
def prs3d_PrimitivesFromPolylines(*args):
	return prs3d.PrimitivesFromPolylines(*args)

@deprecated
def Prs3d_Arrow_Draw(*args):
	return Prs3d_Arrow.Draw(*args)

@deprecated
def Prs3d_Arrow_DrawSegments(*args):
	return Prs3d_Arrow.DrawSegments(*args)

@deprecated
def Prs3d_Arrow_DrawShaded(*args):
	return Prs3d_Arrow.DrawShaded(*args)

@deprecated
def Prs3d_Point_Add(*args):
	return Prs3d_Point.Add(*args)

@deprecated
def Prs3d_Point_Match(*args):
	return Prs3d_Point.Match(*args)

@deprecated
def Prs3d_Root_CurrentGroup(*args):
	return Prs3d_Root.CurrentGroup(*args)

@deprecated
def Prs3d_Root_NewGroup(*args):
	return Prs3d_Root.NewGroup(*args)

@deprecated
def Prs3d_Text_Draw(*args):
	return Prs3d_Text.Draw(*args)

@deprecated
def Prs3d_Text_Draw(*args):
	return Prs3d_Text.Draw(*args)

@deprecated
def Prs3d_ToolQuadric_TrianglesNb(*args):
	return Prs3d_ToolQuadric.TrianglesNb(*args)

@deprecated
def Prs3d_ToolQuadric_VerticesNb(*args):
	return Prs3d_ToolQuadric.VerticesNb(*args)

@deprecated
def Prs3d_BndBox_Add(*args):
	return Prs3d_BndBox.Add(*args)

@deprecated
def Prs3d_BndBox_Add(*args):
	return Prs3d_BndBox.Add(*args)

@deprecated
def Prs3d_BndBox_FillSegments(*args):
	return Prs3d_BndBox.FillSegments(*args)

@deprecated
def Prs3d_BndBox_FillSegments(*args):
	return Prs3d_BndBox.FillSegments(*args)

@deprecated
def Prs3d_BndBox_FillSegments(*args):
	return Prs3d_BndBox.FillSegments(*args)

@deprecated
def Prs3d_BndBox_FillSegments(*args):
	return Prs3d_BndBox.FillSegments(*args)

@deprecated
def Prs3d_BndBox_fillSegments(*args):
	return Prs3d_BndBox.fillSegments(*args)

@deprecated
def Prs3d_DatumAspect_ArrowPartForAxis(*args):
	return Prs3d_DatumAspect.ArrowPartForAxis(*args)

@deprecated
def Prs3d_ToolCylinder_Create(*args):
	return Prs3d_ToolCylinder.Create(*args)

@deprecated
def Prs3d_ToolDisk_Create(*args):
	return Prs3d_ToolDisk.Create(*args)

@deprecated
def Prs3d_ToolSector_Create(*args):
	return Prs3d_ToolSector.Create(*args)

@deprecated
def Prs3d_ToolSphere_Create(*args):
	return Prs3d_ToolSphere.Create(*args)

@deprecated
def Prs3d_ToolTorus_Create(*args):
	return Prs3d_ToolTorus.Create(*args)

@deprecated
def Prs3d_ToolTorus_Create(*args):
	return Prs3d_ToolTorus.Create(*args)

@deprecated
def Prs3d_ToolTorus_Create(*args):
	return Prs3d_ToolTorus.Create(*args)

@deprecated
def Prs3d_ToolTorus_Create(*args):
	return Prs3d_ToolTorus.Create(*args)

}
