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
%define PRS3DDOCSTRING
"Prs3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_prs3d.html"
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
enum Prs3d_DimensionTextVerticalPosition {
	Prs3d_DTVP_Above = 0,
	Prs3d_DTVP_Below = 1,
	Prs3d_DTVP_Center = 2,
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

enum Prs3d_VertexDrawMode {
	Prs3d_VDM_Isolated = 0,
	Prs3d_VDM_All = 1,
	Prs3d_VDM_Inherited = 2,
};

enum Prs3d_DatumMode {
	Prs3d_DM_WireFrame = 0,
	Prs3d_DM_Shaded = 1,
};

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

enum Prs3d_DimensionTextHorizontalPosition {
	Prs3d_DTHP_Left = 0,
	Prs3d_DTHP_Right = 1,
	Prs3d_DTHP_Center = 2,
	Prs3d_DTHP_Fit = 3,
};

enum Prs3d_TypeOfLinePicking {
	Prs3d_TOLP_Point = 0,
	Prs3d_TOLP_Segment = 1,
};

enum Prs3d_TypeOfHLR {
	Prs3d_TOH_NotSet = 0,
	Prs3d_TOH_PolyAlgo = 1,
	Prs3d_TOH_Algo = 2,
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

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Prs3d_DimensionTextVerticalPosition(IntEnum):
	Prs3d_DTVP_Above = 0
	Prs3d_DTVP_Below = 1
	Prs3d_DTVP_Center = 2
Prs3d_DTVP_Above = Prs3d_DimensionTextVerticalPosition.Prs3d_DTVP_Above
Prs3d_DTVP_Below = Prs3d_DimensionTextVerticalPosition.Prs3d_DTVP_Below
Prs3d_DTVP_Center = Prs3d_DimensionTextVerticalPosition.Prs3d_DTVP_Center

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

class Prs3d_VertexDrawMode(IntEnum):
	Prs3d_VDM_Isolated = 0
	Prs3d_VDM_All = 1
	Prs3d_VDM_Inherited = 2
Prs3d_VDM_Isolated = Prs3d_VertexDrawMode.Prs3d_VDM_Isolated
Prs3d_VDM_All = Prs3d_VertexDrawMode.Prs3d_VDM_All
Prs3d_VDM_Inherited = Prs3d_VertexDrawMode.Prs3d_VDM_Inherited

class Prs3d_DatumMode(IntEnum):
	Prs3d_DM_WireFrame = 0
	Prs3d_DM_Shaded = 1
Prs3d_DM_WireFrame = Prs3d_DatumMode.Prs3d_DM_WireFrame
Prs3d_DM_Shaded = Prs3d_DatumMode.Prs3d_DM_Shaded

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

class Prs3d_DimensionTextHorizontalPosition(IntEnum):
	Prs3d_DTHP_Left = 0
	Prs3d_DTHP_Right = 1
	Prs3d_DTHP_Center = 2
	Prs3d_DTHP_Fit = 3
Prs3d_DTHP_Left = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Left
Prs3d_DTHP_Right = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Right
Prs3d_DTHP_Center = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Center
Prs3d_DTHP_Fit = Prs3d_DimensionTextHorizontalPosition.Prs3d_DTHP_Fit

class Prs3d_TypeOfLinePicking(IntEnum):
	Prs3d_TOLP_Point = 0
	Prs3d_TOLP_Segment = 1
Prs3d_TOLP_Point = Prs3d_TypeOfLinePicking.Prs3d_TOLP_Point
Prs3d_TOLP_Segment = Prs3d_TypeOfLinePicking.Prs3d_TOLP_Segment

class Prs3d_TypeOfHLR(IntEnum):
	Prs3d_TOH_NotSet = 0
	Prs3d_TOH_PolyAlgo = 1
	Prs3d_TOH_Algo = 2
Prs3d_TOH_NotSet = Prs3d_TypeOfHLR.Prs3d_TOH_NotSet
Prs3d_TOH_PolyAlgo = Prs3d_TypeOfHLR.Prs3d_TOH_PolyAlgo
Prs3d_TOH_Algo = Prs3d_TypeOfHLR.Prs3d_TOH_Algo

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
		/****************** AddFreeEdges ******************/
		/**** md5 signature: 7ac34117f886744be821be34fbd08b8a ****/
		%feature("compactdefaultargs") AddFreeEdges;
		%feature("autodoc", "Add triangulation free edges into sequence of line segments. @param thesegments [out] sequence of line segments to fill @param thepolytri [in] triangulation to process @param thelocation [in] transformation to apply.

Parameters
----------
theSegments: TColgp_SequenceOfPnt
thePolyTri: Poly_Triangulation
theLocation: gp_Trsf

Returns
-------
None
") AddFreeEdges;
		static void AddFreeEdges(TColgp_SequenceOfPnt & theSegments, const opencascade::handle<Poly_Triangulation> & thePolyTri, const gp_Trsf & theLocation);

		/****************** AddPrimitivesGroup ******************/
		/**** md5 signature: 54a23ed776ef73d4469f2189e47e27ac ****/
		%feature("compactdefaultargs") AddPrimitivesGroup;
		%feature("autodoc", "Add primitives into new group in presentation and clear the list of polylines.

Parameters
----------
thePrs: Prs3d_Presentation
theAspect: Prs3d_LineAspect
thePolylines: Prs3d_NListOfSequenceOfPnt

Returns
-------
None
") AddPrimitivesGroup;
		static void AddPrimitivesGroup(const opencascade::handle<Prs3d_Presentation> & thePrs, const opencascade::handle<Prs3d_LineAspect> & theAspect, Prs3d_NListOfSequenceOfPnt & thePolylines);

		/****************** GetDeflection ******************/
		/**** md5 signature: 80d3db84df62af62fba08c06cb9a8696 ****/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "Computes the absolute deflection value based on relative deflection prs3d_drawer::deviationcoefficient(). @param thebndmin [in] bounding box min corner @param thebndmax [in] bounding box max corner @param thedeviationcoefficient [in] relative deflection coefficient from prs3d_drawer::deviationcoefficient() returns absolute deflection coefficient based on bounding box dimensions.

Parameters
----------
theBndMin: Graphic3d_Vec3d
theBndMax: Graphic3d_Vec3d
theDeviationCoefficient: float

Returns
-------
float
") GetDeflection;
		static Standard_Real GetDeflection(const Graphic3d_Vec3d & theBndMin, const Graphic3d_Vec3d & theBndMax, const Standard_Real theDeviationCoefficient);

		/****************** GetDeflection ******************/
		/**** md5 signature: b4ff60a90046a3353c924190b95ff7f7 ****/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "Computes the absolute deflection value based on relative deflection prs3d_drawer::deviationcoefficient(). @param thebndbox [in] bounding box @param thedeviationcoefficient [in] relative deflection coefficient from prs3d_drawer::deviationcoefficient() @param themaximalchordialdeviation [in] absolute deflection coefficient from prs3d_drawer::maximalchordialdeviation() returns absolute deflection coefficient based on bounding box dimensions or themaximalchordialdeviation if bounding box is void or infinite.

Parameters
----------
theBndBox: Bnd_Box
theDeviationCoefficient: float
theMaximalChordialDeviation: float

Returns
-------
float
") GetDeflection;
		static Standard_Real GetDeflection(const Bnd_Box & theBndBox, const Standard_Real theDeviationCoefficient, const Standard_Real theMaximalChordialDeviation);

		/****************** MatchSegment ******************/
		/**** md5 signature: b54f261a95760df4573beed0ad5de6ee ****/
		%feature("compactdefaultargs") MatchSegment;
		%feature("autodoc", "Draws an arrow at a given location, with respect to a given direction.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
p1: gp_Pnt
p2: gp_Pnt

Returns
-------
dist: float
") MatchSegment;
		static Standard_Boolean MatchSegment(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const gp_Pnt & p1, const gp_Pnt & p2, Standard_Real &OutValue);

		/****************** PrimitivesFromPolylines ******************/
		/**** md5 signature: ac5afc7f1737d42c9e2e741f0693e3a3 ****/
		%feature("compactdefaultargs") PrimitivesFromPolylines;
		%feature("autodoc", "Assembles array of primitives for sequence of polylines. @param thepoints [in] the polylines sequence returns array of primitives.

Parameters
----------
thePoints: Prs3d_NListOfSequenceOfPnt

Returns
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>
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
		/****************** Draw ******************/
		/**** md5 signature: 5fbe6d990a1917c27eed32163631c6db ****/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Defines the representation of the arrow. note that this method does not assign any presentation aspects to the primitives group! @param thegroup presentation group to add primitives @param thelocation location of the arrow tip @param thedirection direction of the arrow @param theangle angle of opening of the arrow head @param thelength length of the arrow (from the tip).

Parameters
----------
theGroup: Graphic3d_Group
theLocation: gp_Pnt
theDirection: gp_Dir
theAngle: float
theLength: float

Returns
-------
None
") Draw;
		static void Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const gp_Pnt & theLocation, const gp_Dir & theDirection, const Standard_Real theAngle, const Standard_Real theLength);

		/****************** DrawSegments ******************/
		/**** md5 signature: 732901be4cc19438764121766619db8b ****/
		%feature("compactdefaultargs") DrawSegments;
		%feature("autodoc", "Defines the representation of the arrow as a container of segments. @param thelocation location of the arrow tip @param thedir direction of the arrow @param theangle angle of opening of the arrow head @param thelength length of the arrow (from the tip) @param thenbsegments count of points on polyline where location is connected.

Parameters
----------
theLocation: gp_Pnt
theDir: gp_Dir
theAngle: float
theLength: float
theNbSegments: int

Returns
-------
opencascade::handle<Graphic3d_ArrayOfSegments>
") DrawSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> DrawSegments(const gp_Pnt & theLocation, const gp_Dir & theDir, const Standard_Real theAngle, const Standard_Real theLength, const Standard_Integer theNbSegments);

		/****************** DrawShaded ******************/
		/**** md5 signature: 9fdd956294243401b7cdc39f8158504b ****/
		%feature("compactdefaultargs") DrawShaded;
		%feature("autodoc", "Defines the representation of the arrow as shaded triangulation. @param theaxis axis definition (arrow origin and direction) @param thetuberadius tube (cylinder) radius @param theaxislength overall arrow length (cylinder + cone) @param theconeradius cone radius (arrow tip) @param theconelength cone length (arrow tip) @param thenbfacettes tessellation quality for each part.

Parameters
----------
theAxis: gp_Ax1
theTubeRadius: float
theAxisLength: float
theConeRadius: float
theConeLength: float
theNbFacettes: int

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
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
		/****************** Prs3d_DimensionUnits ******************/
		/**** md5 signature: 6858cebef83a95894808c7bb951f2586 ****/
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "Default constructor. sets meters as default length units and radians as default angle units.

Returns
-------
None
") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits();

		/****************** Prs3d_DimensionUnits ******************/
		/**** md5 signature: 6a8f298b7552282c2afeb9ec3d08706a ****/
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUnits: Prs3d_DimensionUnits

Returns
-------
None
") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits(const Prs3d_DimensionUnits & theUnits);

		/****************** GetAngleUnits ******************/
		/**** md5 signature: 066d6d8ffa1db4056e804ec281802558 ****/
		%feature("compactdefaultargs") GetAngleUnits;
		%feature("autodoc", "Returns angle units.

Returns
-------
TCollection_AsciiString
") GetAngleUnits;
		const TCollection_AsciiString & GetAngleUnits();

		/****************** GetLengthUnits ******************/
		/**** md5 signature: 6fb395b3afc4def0ac554d84a6be28f9 ****/
		%feature("compactdefaultargs") GetLengthUnits;
		%feature("autodoc", "Returns length units.

Returns
-------
TCollection_AsciiString
") GetLengthUnits;
		const TCollection_AsciiString & GetLengthUnits();

		/****************** SetAngleUnits ******************/
		/**** md5 signature: c9bda671a819bb927eb60041234fe221 ****/
		%feature("compactdefaultargs") SetAngleUnits;
		%feature("autodoc", "Sets angle units.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetAngleUnits;
		void SetAngleUnits(const TCollection_AsciiString & theUnits);

		/****************** SetLengthUnits ******************/
		/**** md5 signature: 8f235eea8c4da0d905edbe7271c0d8cd ****/
		%feature("compactdefaultargs") SetLengthUnits;
		%feature("autodoc", "Sets length units.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetLengthUnits;
		void SetLengthUnits(const TCollection_AsciiString & theUnits);

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
		/****************** Prs3d_Drawer ******************/
		/**** md5 signature: fd45a8e4068c9e2be7c92cceb0f5d5c9 ****/
		%feature("compactdefaultargs") Prs3d_Drawer;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") Prs3d_Drawer;
		 Prs3d_Drawer();

		/****************** ArrowAspect ******************/
		/**** md5 signature: 51fa944f931a2a140820470b2c6a88b4 ****/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns own attributes for display of arrows, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_ArrowAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****************** ClearLocalAttributes ******************/
		/**** md5 signature: 2885c46c9a1a30b9b9c2a0703fd29fa7 ****/
		%feature("compactdefaultargs") ClearLocalAttributes;
		%feature("autodoc", "Removes local attributes. .

Returns
-------
None
") ClearLocalAttributes;
		void ClearLocalAttributes();

		/****************** DatumAspect ******************/
		/**** md5 signature: ab5b6c51905d06854a4304f89d4c7189 ****/
		%feature("compactdefaultargs") DatumAspect;
		%feature("autodoc", "Returns own settings for the appearance of datums, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_DatumAspect>
") DatumAspect;
		const opencascade::handle<Prs3d_DatumAspect> & DatumAspect();

		/****************** DeviationAngle ******************/
		/**** md5 signature: 003652129c87707eb3add7448baffc41 ****/
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "Returns the value for deviation angle in radians, 20 * m_pi / 180 by default.

Returns
-------
float
") DeviationAngle;
		Standard_Real DeviationAngle();

		/****************** DeviationCoefficient ******************/
		/**** md5 signature: aa403b444ce189be03dbbfdaa044ed4e ****/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "Returns the deviation coefficient. drawings of curves or patches are made with respect to a maximal chordal deviation. a deviation coefficient is used in the shading display mode. the shape is seen decomposed into triangles. these are used to calculate reflection of light from the surface of the object. the triangles are formed from chords of the curves in the shape. the deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. if this limit is reached, a new triangle is begun. this deviation is absolute and is set through the method: setmaximalchordialdeviation. the default value is 0.001. in drawing shapes, however, you are allowed to ask for a relative deviation. this deviation will be: sizeofobject * deviationcoefficient.

Returns
-------
float
") DeviationCoefficient;
		Standard_Real DeviationCoefficient();

		/****************** DimAngleDisplayUnits ******************/
		/**** md5 signature: f9adb2def91c97371f22f83b1b241154 ****/
		%feature("compactdefaultargs") DimAngleDisplayUnits;
		%feature("autodoc", "Returns angle units in which dimension presentation is displayed.

Returns
-------
TCollection_AsciiString
") DimAngleDisplayUnits;
		const TCollection_AsciiString & DimAngleDisplayUnits();

		/****************** DimAngleModelUnits ******************/
		/**** md5 signature: 05c1180b2f776fd7d8ff7737daaa7956 ****/
		%feature("compactdefaultargs") DimAngleModelUnits;
		%feature("autodoc", "Returns angle model units for the dimension presentation. .

Returns
-------
TCollection_AsciiString
") DimAngleModelUnits;
		const TCollection_AsciiString & DimAngleModelUnits();

		/****************** DimLengthDisplayUnits ******************/
		/**** md5 signature: 0c6e550f454a7c3462ea332ad4a3114d ****/
		%feature("compactdefaultargs") DimLengthDisplayUnits;
		%feature("autodoc", "Returns length units in which dimension presentation is displayed.

Returns
-------
TCollection_AsciiString
") DimLengthDisplayUnits;
		const TCollection_AsciiString & DimLengthDisplayUnits();

		/****************** DimLengthModelUnits ******************/
		/**** md5 signature: 8bc83424763676a3c91810d4679e2b18 ****/
		%feature("compactdefaultargs") DimLengthModelUnits;
		%feature("autodoc", "Returns length model units for the dimension presentation. .

Returns
-------
TCollection_AsciiString
") DimLengthModelUnits;
		const TCollection_AsciiString & DimLengthModelUnits();

		/****************** DimensionAspect ******************/
		/**** md5 signature: 6b03f02ae9f62eec0f444824df72cb53 ****/
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "Returns own settings for the appearance of dimensions, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_DimensionAspect>
") DimensionAspect;
		const opencascade::handle<Prs3d_DimensionAspect> & DimensionAspect();

		/****************** DisableDrawHiddenLine ******************/
		/**** md5 signature: 641e43422c8b3be588dee379f3554611 ****/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "Disables the drawhiddenline function.

Returns
-------
None
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****************** Discretisation ******************/
		/**** md5 signature: 00367d346ebf2ee8d05c61802962da5d ****/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "Returns the discretisation setting. .

Returns
-------
int
") Discretisation;
		Standard_Integer Discretisation();

		/****************** DrawHiddenLine ******************/
		/**** md5 signature: 372ddba1ff29bf8cd686ca27ede4bc2a ****/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "Returns standard_true if the hidden lines are to be drawn. by default the hidden lines are not drawn.

Returns
-------
bool
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** EnableDrawHiddenLine ******************/
		/**** md5 signature: 5cd9db795aefc1eee38a63bd3f8ef65f ****/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "Enables the drawhiddenline function.

Returns
-------
None
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****************** FaceBoundaryAspect ******************/
		/**** md5 signature: 4fe7266a8c0b80fde255b0355cc018c4 ****/
		%feature("compactdefaultargs") FaceBoundaryAspect;
		%feature("autodoc", "Returns own line aspect of face boundaries, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") FaceBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FaceBoundaryAspect();

		/****************** FaceBoundaryDraw ******************/
		/**** md5 signature: 504f69657af5734e3fdac5963f26fbd8 ****/
		%feature("compactdefaultargs") FaceBoundaryDraw;
		%feature("autodoc", "Checks whether the face boundary drawing is enabled or not.

Returns
-------
bool
") FaceBoundaryDraw;
		Standard_Boolean FaceBoundaryDraw();

		/****************** FaceBoundaryUpperContinuity ******************/
		/**** md5 signature: 4a0be6032fd2efa02c9dc8a216e023bd ****/
		%feature("compactdefaultargs") FaceBoundaryUpperContinuity;
		%feature("autodoc", "Get the most edge continuity class; geomabs_cn by default (all edges).

Returns
-------
GeomAbs_Shape
") FaceBoundaryUpperContinuity;
		GeomAbs_Shape FaceBoundaryUpperContinuity();

		/****************** FreeBoundaryAspect ******************/
		/**** md5 signature: 27a3ed0ee4198d0e57b27d7d6e4d2266 ****/
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "Returns own settings for presentation of free boundaries, settings from linked drawer or null if neither was set. in other words, this settings affect boundaries which are not shared. these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") FreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FreeBoundaryAspect();

		/****************** FreeBoundaryDraw ******************/
		/**** md5 signature: a393914bb639c8fa5d8e810c31199151 ****/
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawing of the free boundaries is enabled true is the default setting.

Returns
-------
bool
") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw();

		/****************** HLRAngle ******************/
		/**** md5 signature: 9b3b7971941820e9cc8d8638893d2a9d ****/
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") HLRAngle;
		Standard_Real HLRAngle();

		/****************** HasLink ******************/
		/**** md5 signature: e68aafea1bcdd6fec6e3f2f0de3f3c9f ****/
		%feature("compactdefaultargs") HasLink;
		%feature("autodoc", "Returns true if the current object has a link on the other drawer.

Returns
-------
bool
") HasLink;
		Standard_Boolean HasLink();

		/****************** HasOwnArrowAspect ******************/
		/**** md5 signature: c011ea9c5427f594bd39c812bb8eda05 ****/
		%feature("compactdefaultargs") HasOwnArrowAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for arrow aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnArrowAspect;
		Standard_Boolean HasOwnArrowAspect();

		/****************** HasOwnDatumAspect ******************/
		/**** md5 signature: f4132615152b4b32121460820c67b0a9 ****/
		%feature("compactdefaultargs") HasOwnDatumAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for datum aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnDatumAspect;
		Standard_Boolean HasOwnDatumAspect();

		/****************** HasOwnDeviationAngle ******************/
		/**** md5 signature: 9b350005642d36f5630be22438d1d286 ****/
		%feature("compactdefaultargs") HasOwnDeviationAngle;
		%feature("autodoc", "Returns true if there is a local setting for deviation angle in this framework for a specific interactive object.

Returns
-------
bool
") HasOwnDeviationAngle;
		Standard_Boolean HasOwnDeviationAngle();

		/****************** HasOwnDeviationCoefficient ******************/
		/**** md5 signature: 69a7467c388d4b4a9909917fbd44f546 ****/
		%feature("compactdefaultargs") HasOwnDeviationCoefficient;
		%feature("autodoc", "Returns true if there is a local setting for deviation coefficient in this framework for a specific interactive object.

Returns
-------
bool
") HasOwnDeviationCoefficient;
		Standard_Boolean HasOwnDeviationCoefficient();

		/****************** HasOwnDimAngleDisplayUnits ******************/
		/**** md5 signature: f7fc32bc901429d1e7a4757ef5a78138 ****/
		%feature("compactdefaultargs") HasOwnDimAngleDisplayUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for angle units in which dimension presentation is displayed that overrides the one in the link.

Returns
-------
bool
") HasOwnDimAngleDisplayUnits;
		Standard_Boolean HasOwnDimAngleDisplayUnits();

		/****************** HasOwnDimAngleModelUnits ******************/
		/**** md5 signature: fba8b1b78d226c95615ccab093f1e4a5 ****/
		%feature("compactdefaultargs") HasOwnDimAngleModelUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for dimension angle model units that overrides the one in the link.

Returns
-------
bool
") HasOwnDimAngleModelUnits;
		Standard_Boolean HasOwnDimAngleModelUnits();

		/****************** HasOwnDimLengthDisplayUnits ******************/
		/**** md5 signature: 9c0624f722802b21cdd767cc2c13f302 ****/
		%feature("compactdefaultargs") HasOwnDimLengthDisplayUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for length units in which dimension presentation is displayed that overrides the one in the link.

Returns
-------
bool
") HasOwnDimLengthDisplayUnits;
		Standard_Boolean HasOwnDimLengthDisplayUnits();

		/****************** HasOwnDimLengthModelUnits ******************/
		/**** md5 signature: 6e93fd2839d74603dc07b6642946a801 ****/
		%feature("compactdefaultargs") HasOwnDimLengthModelUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for dimension length model units that overrides the one in the link.

Returns
-------
bool
") HasOwnDimLengthModelUnits;
		Standard_Boolean HasOwnDimLengthModelUnits();

		/****************** HasOwnDimensionAspect ******************/
		/**** md5 signature: 84b0dfe79cfde90b0d291c7ef1dac27c ****/
		%feature("compactdefaultargs") HasOwnDimensionAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for the appearance of dimensions that overrides the one in the link.

Returns
-------
bool
") HasOwnDimensionAspect;
		Standard_Boolean HasOwnDimensionAspect();

		/****************** HasOwnDiscretisation ******************/
		/**** md5 signature: 0ada183bb1fdc0e487877b0f053f13fc ****/
		%feature("compactdefaultargs") HasOwnDiscretisation;
		%feature("autodoc", "Returns true if the drawer has discretisation setting active.

Returns
-------
bool
") HasOwnDiscretisation;
		Standard_Boolean HasOwnDiscretisation();

		/****************** HasOwnDrawHiddenLine ******************/
		/**** md5 signature: a834332d03c54b08a80e6b0612b72fab ****/
		%feature("compactdefaultargs") HasOwnDrawHiddenLine;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw hidden lines' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnDrawHiddenLine;
		Standard_Boolean HasOwnDrawHiddenLine();

		/****************** HasOwnFaceBoundaryAspect ******************/
		/**** md5 signature: aaadddb85463caf3dc35972f48dcb050 ****/
		%feature("compactdefaultargs") HasOwnFaceBoundaryAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for face boundaries aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnFaceBoundaryAspect;
		Standard_Boolean HasOwnFaceBoundaryAspect();

		/****************** HasOwnFaceBoundaryDraw ******************/
		/**** md5 signature: 64c465a96ac97f193be91c6c7bb9b1aa ****/
		%feature("compactdefaultargs") HasOwnFaceBoundaryDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw face boundaries' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnFaceBoundaryDraw;
		Standard_Boolean HasOwnFaceBoundaryDraw();

		/****************** HasOwnFaceBoundaryUpperContinuity ******************/
		/**** md5 signature: d894a48ea9b08dd1a31e7efd4c3323d2 ****/
		%feature("compactdefaultargs") HasOwnFaceBoundaryUpperContinuity;
		%feature("autodoc", "Returns true if the drawer has its own attribute for face boundaries upper edge continuity class that overrides the one in the link.

Returns
-------
bool
") HasOwnFaceBoundaryUpperContinuity;
		Standard_Boolean HasOwnFaceBoundaryUpperContinuity();

		/****************** HasOwnFreeBoundaryAspect ******************/
		/**** md5 signature: 1e1795900d912c8ce8a7147dc5b324e1 ****/
		%feature("compactdefaultargs") HasOwnFreeBoundaryAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for free boundaries aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnFreeBoundaryAspect;
		Standard_Boolean HasOwnFreeBoundaryAspect();

		/****************** HasOwnFreeBoundaryDraw ******************/
		/**** md5 signature: cfa100dc3a78f551e7609898899180c2 ****/
		%feature("compactdefaultargs") HasOwnFreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw free boundaries' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnFreeBoundaryDraw;
		Standard_Boolean HasOwnFreeBoundaryDraw();

		/****************** HasOwnHLRDeviationAngle ******************/
		/**** md5 signature: 992f156d7f0c52baf625365e1f7ddb89 ****/
		%feature("compactdefaultargs") HasOwnHLRDeviationAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnHLRDeviationAngle;
		Standard_Boolean HasOwnHLRDeviationAngle();

		/****************** HasOwnHiddenLineAspect ******************/
		/**** md5 signature: adef7b374e68f02486f2d77f549bd4cd ****/
		%feature("compactdefaultargs") HasOwnHiddenLineAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for hidden lines aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnHiddenLineAspect;
		Standard_Boolean HasOwnHiddenLineAspect();

		/****************** HasOwnIsAutoTriangulation ******************/
		/**** md5 signature: 2aa38254d17044bc449b7dd389aa975d ****/
		%feature("compactdefaultargs") HasOwnIsAutoTriangulation;
		%feature("autodoc", "Returns true if the drawer has isoonplane setting active.

Returns
-------
bool
") HasOwnIsAutoTriangulation;
		Standard_Boolean HasOwnIsAutoTriangulation();

		/****************** HasOwnIsoOnPlane ******************/
		/**** md5 signature: e89e70de5761f604bf736fe54eca26f0 ****/
		%feature("compactdefaultargs") HasOwnIsoOnPlane;
		%feature("autodoc", "Returns true if the drawer has isoonplane setting active.

Returns
-------
bool
") HasOwnIsoOnPlane;
		Standard_Boolean HasOwnIsoOnPlane();

		/****************** HasOwnIsoOnTriangulation ******************/
		/**** md5 signature: 9503833346d395f6291772bb348a95d0 ****/
		%feature("compactdefaultargs") HasOwnIsoOnTriangulation;
		%feature("autodoc", "Returns true if the drawer has isoontriangulation setting active.

Returns
-------
bool
") HasOwnIsoOnTriangulation;
		Standard_Boolean HasOwnIsoOnTriangulation();

		/****************** HasOwnLineArrowDraw ******************/
		/**** md5 signature: 40f8824c5c7c4b9a8d0f5b29a3229b95 ****/
		%feature("compactdefaultargs") HasOwnLineArrowDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw arrow' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnLineArrowDraw;
		Standard_Boolean HasOwnLineArrowDraw();

		/****************** HasOwnLineAspect ******************/
		/**** md5 signature: e68a87286fb1f7ed2f244791e257ac29 ****/
		%feature("compactdefaultargs") HasOwnLineAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for line aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnLineAspect;
		Standard_Boolean HasOwnLineAspect();

		/****************** HasOwnMaximalChordialDeviation ******************/
		/**** md5 signature: 278e4d4c710235e9a05b8a9643333137 ****/
		%feature("compactdefaultargs") HasOwnMaximalChordialDeviation;
		%feature("autodoc", "Returns true if the drawer has a maximal chordial deviation setting active.

Returns
-------
bool
") HasOwnMaximalChordialDeviation;
		Standard_Boolean HasOwnMaximalChordialDeviation();

		/****************** HasOwnMaximalParameterValue ******************/
		/**** md5 signature: a22dd168fb02864e2f3eeb41decbc247 ****/
		%feature("compactdefaultargs") HasOwnMaximalParameterValue;
		%feature("autodoc", "Returns true if the drawer has a maximum value allowed for the first and last parameters of an infinite curve setting active.

Returns
-------
bool
") HasOwnMaximalParameterValue;
		Standard_Boolean HasOwnMaximalParameterValue();

		/****************** HasOwnPlaneAspect ******************/
		/**** md5 signature: cedbd9993f542c454113bd6ddcfcd51d ****/
		%feature("compactdefaultargs") HasOwnPlaneAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for plane aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnPlaneAspect;
		Standard_Boolean HasOwnPlaneAspect();

		/****************** HasOwnPointAspect ******************/
		/**** md5 signature: 37bcf1c72011e86ffe4cfe34447ded6e ****/
		%feature("compactdefaultargs") HasOwnPointAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for point aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnPointAspect;
		Standard_Boolean HasOwnPointAspect();

		/****************** HasOwnSectionAspect ******************/
		/**** md5 signature: 10481bb7dbf9a791b339edf5fc0c3b9b ****/
		%feature("compactdefaultargs") HasOwnSectionAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for section aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnSectionAspect;
		Standard_Boolean HasOwnSectionAspect();

		/****************** HasOwnSeenLineAspect ******************/
		/**** md5 signature: 4874aabd41bc5b0a7be6588f0c8fadbd ****/
		%feature("compactdefaultargs") HasOwnSeenLineAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for seen line aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnSeenLineAspect;
		Standard_Boolean HasOwnSeenLineAspect();

		/****************** HasOwnShadingAspect ******************/
		/**** md5 signature: 5fca701e7945f5f80195c231ab3d93f9 ****/
		%feature("compactdefaultargs") HasOwnShadingAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for shading aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnShadingAspect;
		Standard_Boolean HasOwnShadingAspect();

		/****************** HasOwnTextAspect ******************/
		/**** md5 signature: e969a4e857354af2ca581bd7e356d6d2 ****/
		%feature("compactdefaultargs") HasOwnTextAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for text aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnTextAspect;
		Standard_Boolean HasOwnTextAspect();

		/****************** HasOwnTypeOfDeflection ******************/
		/**** md5 signature: e5c5b7da81a019a2aeb3df6de1100be1 ****/
		%feature("compactdefaultargs") HasOwnTypeOfDeflection;
		%feature("autodoc", "Returns true if the drawer has a type of deflection setting active.

Returns
-------
bool
") HasOwnTypeOfDeflection;
		Standard_Boolean HasOwnTypeOfDeflection();

		/****************** HasOwnTypeOfHLR ******************/
		/**** md5 signature: 4ef83acd86eeb31e3c391672dbf00a8e ****/
		%feature("compactdefaultargs") HasOwnTypeOfHLR;
		%feature("autodoc", "Returns true if the type of hlr is not equal to prs3d_toh_notset.

Returns
-------
bool
") HasOwnTypeOfHLR;
		Standard_Boolean HasOwnTypeOfHLR();

		/****************** HasOwnUIsoAspect ******************/
		/**** md5 signature: ea8d708dbd873ba9943b88da3d561f62 ****/
		%feature("compactdefaultargs") HasOwnUIsoAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for uiso aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnUIsoAspect;
		Standard_Boolean HasOwnUIsoAspect();

		/****************** HasOwnUnFreeBoundaryAspect ******************/
		/**** md5 signature: 9d82217707975ddc59976f65a5b28123 ****/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for unfree boundaries aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnUnFreeBoundaryAspect;
		Standard_Boolean HasOwnUnFreeBoundaryAspect();

		/****************** HasOwnUnFreeBoundaryDraw ******************/
		/**** md5 signature: d038acbe860ec3a5704a6aff2ced38b4 ****/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw shared boundaries' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnUnFreeBoundaryDraw;
		Standard_Boolean HasOwnUnFreeBoundaryDraw();

		/****************** HasOwnVIsoAspect ******************/
		/**** md5 signature: bc569455ddd94fa9758e8d35afc46578 ****/
		%feature("compactdefaultargs") HasOwnVIsoAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for viso aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnVIsoAspect;
		Standard_Boolean HasOwnVIsoAspect();

		/****************** HasOwnVectorAspect ******************/
		/**** md5 signature: e139738a9c217b3a4ac0811b9ed2df2b ****/
		%feature("compactdefaultargs") HasOwnVectorAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for vector aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnVectorAspect;
		Standard_Boolean HasOwnVectorAspect();

		/****************** HasOwnVertexDrawMode ******************/
		/**** md5 signature: 98e1b0684c2f2c8da67af2674348d511 ****/
		%feature("compactdefaultargs") HasOwnVertexDrawMode;
		%feature("autodoc", "Returns true if the vertex draw mode is not equal to <b>prs3d_vdm_inherited</b>. this means that individual vertex draw mode value (i.e. not inherited from the global drawer) is used for a specific interactive object.

Returns
-------
bool
") HasOwnVertexDrawMode;
		Standard_Boolean HasOwnVertexDrawMode();

		/****************** HasOwnWireAspect ******************/
		/**** md5 signature: 58b07c8af58b81856955e87109b86d41 ****/
		%feature("compactdefaultargs") HasOwnWireAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for wire aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnWireAspect;
		Standard_Boolean HasOwnWireAspect();

		/****************** HasOwnWireDraw ******************/
		/**** md5 signature: e815b23df6a36dce832d5e51a5dfc189 ****/
		%feature("compactdefaultargs") HasOwnWireDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw wires' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnWireDraw;
		Standard_Boolean HasOwnWireDraw();

		/****************** HiddenLineAspect ******************/
		/**** md5 signature: d6e22a29aab321c9beaf4361c0c42ae0 ****/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Returns own settings for hidden line aspects, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") HiddenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & HiddenLineAspect();

		/****************** IsAutoTriangulation ******************/
		/**** md5 signature: d295575fe0ff15a8c5a95c84145a7993 ****/
		%feature("compactdefaultargs") IsAutoTriangulation;
		%feature("autodoc", "Returns true if automatic triangulation is enabled.

Returns
-------
bool
") IsAutoTriangulation;
		Standard_Boolean IsAutoTriangulation();

		/****************** IsoOnPlane ******************/
		/**** md5 signature: 725ae5fc83d7314e8a35910b73791b5a ****/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Returns true if the drawing of isos on planes is enabled.

Returns
-------
bool
") IsoOnPlane;
		Standard_Boolean IsoOnPlane();

		/****************** IsoOnTriangulation ******************/
		/**** md5 signature: 86d0a4f726e225c8973eb7c232be52f2 ****/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "Returns true if the drawing of isos on triangulation is enabled.

Returns
-------
bool
") IsoOnTriangulation;
		Standard_Boolean IsoOnTriangulation();

		/****************** LineArrowDraw ******************/
		/**** md5 signature: d37afa843e41bf77d2295841924733a5 ****/
		%feature("compactdefaultargs") LineArrowDraw;
		%feature("autodoc", "Returns true if drawing an arrow at the end of each edge is enabled and false otherwise (the default).

Returns
-------
bool
") LineArrowDraw;
		Standard_Boolean LineArrowDraw();

		/****************** LineAspect ******************/
		/**** md5 signature: fcc623ed837f4e3e85d4e27b8d17160a ****/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Returns own settings for line aspects, settings from linked drawer or null if neither was set. these attributes are used by the following algorithms: prs3d_curve prs3d_line prs3d_hlrshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect();

		/****************** Link ******************/
		/**** md5 signature: d38faf34b978f82ca625ab3dd81f64aa ****/
		%feature("compactdefaultargs") Link;
		%feature("autodoc", "Returns the drawer to which the current object references.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") Link;
		const opencascade::handle<Prs3d_Drawer> & Link();

		/****************** Link ******************/
		/**** md5 signature: 9fe586ee872a00f2e5c0863608086bdc ****/
		%feature("compactdefaultargs") Link;
		%feature("autodoc", "Sets thedrawer as a link to which the current object references.

Parameters
----------
theDrawer: Prs3d_Drawer

Returns
-------
None
") Link;
		void Link(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** MaximalChordialDeviation ******************/
		/**** md5 signature: 1d43ee640bc87c33eb91c301526bbda9 ****/
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "Returns the maximal chordal deviation. the default value is 0.0001. drawings of curves or patches are made with respect to an absolute maximal chordal deviation.

Returns
-------
float
") MaximalChordialDeviation;
		Standard_Real MaximalChordialDeviation();

		/****************** MaximalParameterValue ******************/
		/**** md5 signature: 6712bac42bcc154a7695aba5612939fa ****/
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "Sets the maximum value allowed for the first and last parameters of an infinite curve. by default, this value is 500000.

Returns
-------
float
") MaximalParameterValue;
		Standard_Real MaximalParameterValue();

		/****************** PlaneAspect ******************/
		/**** md5 signature: 5860cc597653e9aeb633d2f0fe7a3a7e ****/
		%feature("compactdefaultargs") PlaneAspect;
		%feature("autodoc", "Returns own settings for the appearance of planes, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_PlaneAspect>
") PlaneAspect;
		const opencascade::handle<Prs3d_PlaneAspect> & PlaneAspect();

		/****************** PointAspect ******************/
		/**** md5 signature: 29da78c1effc071ee48ea7973016bb47 ****/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Returns own point aspect setting, settings from linked drawer or null if neither was set. these attributes are used by the algorithms prs3d_point.

Returns
-------
opencascade::handle<Prs3d_PointAspect>
") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect();

		/****************** PreviousDeviationAngle ******************/
		/**** md5 signature: e85ed7ba2c56cca9b0e1456a6b71d7d0 ****/
		%feature("compactdefaultargs") PreviousDeviationAngle;
		%feature("autodoc", "Returns the previous deviation angle.

Returns
-------
float
") PreviousDeviationAngle;
		Standard_Real PreviousDeviationAngle();

		/****************** PreviousDeviationCoefficient ******************/
		/**** md5 signature: dd7dbf3ec23aaefa9df4097e8ef5c0e5 ****/
		%feature("compactdefaultargs") PreviousDeviationCoefficient;
		%feature("autodoc", "Saves the previous value used for the chordal deviation coefficient. .

Returns
-------
float
") PreviousDeviationCoefficient;
		Standard_Real PreviousDeviationCoefficient();

		/****************** PreviousHLRDeviationAngle ******************/
		/**** md5 signature: 82e7d8a97345e9ce23b5ce94343001fa ****/
		%feature("compactdefaultargs") PreviousHLRDeviationAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") PreviousHLRDeviationAngle;
		Standard_Real PreviousHLRDeviationAngle();

		/****************** SectionAspect ******************/
		/**** md5 signature: 26f929946082f9b18d8262f33b33f118 ****/
		%feature("compactdefaultargs") SectionAspect;
		%feature("autodoc", "Returns own lineaspect for section wire, settings from linked drawer or null if neither was set. these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") SectionAspect;
		const opencascade::handle<Prs3d_LineAspect> & SectionAspect();

		/****************** SeenLineAspect ******************/
		/**** md5 signature: a609dd759d3b7ec8b3b3731b84600f21 ****/
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "Returns own settings for seen line aspects, settings of linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") SeenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & SeenLineAspect();

		/****************** SetArrowAspect ******************/
		/**** md5 signature: 0a1adde0b720014d803adbe7c86e169d ****/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "Sets the parameter theaspect for display attributes of arrows.

Parameters
----------
theAspect: Prs3d_ArrowAspect

Returns
-------
None
") SetArrowAspect;
		void SetArrowAspect(const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****************** SetAutoTriangulation ******************/
		/**** md5 signature: 097ff08c0977b327c2162db8dc679c98 ****/
		%feature("compactdefaultargs") SetAutoTriangulation;
		%feature("autodoc", "Sets isautotriangulated on or off by setting the parameter theisenabled to true or false. if this flag is true automatic re-triangulation with deflection-check logic will be applied. else this feature will be disable and triangulation is expected to be computed by application itself and no shading presentation at all if unavailable.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetAutoTriangulation;
		void SetAutoTriangulation(const Standard_Boolean theIsEnabled);

		/****************** SetDatumAspect ******************/
		/**** md5 signature: 4647d9dc3797dd067dbf2dfe686ab369 ****/
		%feature("compactdefaultargs") SetDatumAspect;
		%feature("autodoc", "Sets the modality theaspect for the display of datums.

Parameters
----------
theAspect: Prs3d_DatumAspect

Returns
-------
None
") SetDatumAspect;
		void SetDatumAspect(const opencascade::handle<Prs3d_DatumAspect> & theAspect);

		/****************** SetDeviationAngle ******************/
		/**** md5 signature: 6ca67bdbcd53d4506d39fd47bf3c03db ****/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "Sets the deviation angle theangle. also sets the hasowndeviationangle flag to standard_true, and mypreviousdeviationangle.

Parameters
----------
theAngle: float

Returns
-------
None
") SetDeviationAngle;
		void SetDeviationAngle(const Standard_Real theAngle);

		/****************** SetDeviationAngle ******************/
		/**** md5 signature: 9bdb5f10031ccd09c439fbc45ff4df32 ****/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "Resets hasowndeviationangle() flag, e.g. undoes previous setdeviationangle().

Returns
-------
None
") SetDeviationAngle;
		void SetDeviationAngle();

		/****************** SetDeviationCoefficient ******************/
		/**** md5 signature: c876cabde5740c4ce35b0db72a481d97 ****/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "Sets the deviation coefficient thecoefficient. also sets the hasowndeviationcoefficient flag to standard_true and mypreviousdeviationcoefficient.

Parameters
----------
theCoefficient: float

Returns
-------
None
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const Standard_Real theCoefficient);

		/****************** SetDeviationCoefficient ******************/
		/**** md5 signature: 755d6894d3ae7cb400d463653d96c593 ****/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "Resets hasowndeviationcoefficient() flag, e.g. undoes previous setdeviationcoefficient().

Returns
-------
None
") SetDeviationCoefficient;
		void SetDeviationCoefficient();

		/****************** SetDimAngleDisplayUnits ******************/
		/**** md5 signature: 5cafc879a0fa9da7f678b0ed893a3b6e ****/
		%feature("compactdefaultargs") SetDimAngleDisplayUnits;
		%feature("autodoc", "Sets angle units in which value for dimension presentation is displayed. the method sets value owned by the drawer that will be used during visualization instead of the one set in link.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDimAngleDisplayUnits;
		void SetDimAngleDisplayUnits(const TCollection_AsciiString & theUnits);

		/****************** SetDimAngleModelUnits ******************/
		/**** md5 signature: 93b2a30875cdc23219e463c5d2ab0bfe ****/
		%feature("compactdefaultargs") SetDimAngleModelUnits;
		%feature("autodoc", "Sets dimension angle model units for computing of dimension presentation. the method sets value owned by the drawer that will be used during visualization instead of the one set in link.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDimAngleModelUnits;
		void SetDimAngleModelUnits(const TCollection_AsciiString & theUnits);

		/****************** SetDimLengthDisplayUnits ******************/
		/**** md5 signature: 7f89e9c7683b8fa3924af494b833fef5 ****/
		%feature("compactdefaultargs") SetDimLengthDisplayUnits;
		%feature("autodoc", "Sets length units in which value for dimension presentation is displayed. the method sets value owned by the drawer that will be used during visualization instead of the one set in link.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDimLengthDisplayUnits;
		void SetDimLengthDisplayUnits(const TCollection_AsciiString & theUnits);

		/****************** SetDimLengthModelUnits ******************/
		/**** md5 signature: be6ef9d72701ad078664a2f567b1db09 ****/
		%feature("compactdefaultargs") SetDimLengthModelUnits;
		%feature("autodoc", "Sets dimension length model units for computing of dimension presentation. the method sets value owned by the drawer that will be used during visualization instead of the one set in link.

Parameters
----------
theUnits: TCollection_AsciiString

Returns
-------
None
") SetDimLengthModelUnits;
		void SetDimLengthModelUnits(const TCollection_AsciiString & theUnits);

		/****************** SetDimensionAspect ******************/
		/**** md5 signature: 3cc8cbe992a4f857a78fc1aaa6580a19 ****/
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "Sets the settings for the appearance of dimensions. the method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.

Parameters
----------
theAspect: Prs3d_DimensionAspect

Returns
-------
None
") SetDimensionAspect;
		void SetDimensionAspect(const opencascade::handle<Prs3d_DimensionAspect> & theAspect);

		/****************** SetDiscretisation ******************/
		/**** md5 signature: 4361b5c3f1e3b5111800c4ea836567ea ****/
		%feature("compactdefaultargs") SetDiscretisation;
		%feature("autodoc", "Sets the discretisation parameter thevalue.

Parameters
----------
theValue: int

Returns
-------
None
") SetDiscretisation;
		void SetDiscretisation(const Standard_Integer theValue);

		/****************** SetFaceBoundaryAspect ******************/
		/**** md5 signature: 804ad972596fdd35ecb093f15856c7bb ****/
		%feature("compactdefaultargs") SetFaceBoundaryAspect;
		%feature("autodoc", "Sets line aspect for face boundaries. the method sets line aspect owned by the drawer that will be used during visualization instead of the one set in link. theaspect is the line aspect that determines the look of the face boundaries.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetFaceBoundaryAspect;
		void SetFaceBoundaryAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetFaceBoundaryDraw ******************/
		/**** md5 signature: 0b7c11ee9c4d92584f0e7456f7a347a5 ****/
		%feature("compactdefaultargs") SetFaceBoundaryDraw;
		%feature("autodoc", "Enables or disables face boundary drawing for shading presentations. the method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theisenabled is a boolean flag indicating whether the face boundaries should be drawn or not.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetFaceBoundaryDraw;
		void SetFaceBoundaryDraw(const Standard_Boolean theIsEnabled);

		/****************** SetFaceBoundaryUpperContinuity ******************/
		/**** md5 signature: b2dc14181b073a972926abae505ae5ce ****/
		%feature("compactdefaultargs") SetFaceBoundaryUpperContinuity;
		%feature("autodoc", "Set the most edge continuity class for face boundaries.

Parameters
----------
theMostAllowedEdgeClass: GeomAbs_Shape

Returns
-------
None
") SetFaceBoundaryUpperContinuity;
		void SetFaceBoundaryUpperContinuity(GeomAbs_Shape theMostAllowedEdgeClass);

		/****************** SetFreeBoundaryAspect ******************/
		/**** md5 signature: 75dc7272677c2d304c07e394f41c07b7 ****/
		%feature("compactdefaultargs") SetFreeBoundaryAspect;
		%feature("autodoc", "Sets the parameter theaspect for the display of free boundaries. the method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetFreeBoundaryAspect;
		void SetFreeBoundaryAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetFreeBoundaryDraw ******************/
		/**** md5 signature: 357a2afadd44ce4fa5eb830caf568739 ****/
		%feature("compactdefaultargs") SetFreeBoundaryDraw;
		%feature("autodoc", "Enables or disables drawing of free boundaries for shading presentations. the method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theisenabled is a boolean flag indicating whether the free boundaries should be drawn or not.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetFreeBoundaryDraw;
		void SetFreeBoundaryDraw(const Standard_Boolean theIsEnabled);

		/****************** SetHLRAngle ******************/
		/**** md5 signature: 76fda7a04861224b0871f98ee167394b ****/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAngle: float

Returns
-------
None
") SetHLRAngle;
		void SetHLRAngle(const Standard_Real theAngle);

		/****************** SetHLRAngle ******************/
		/**** md5 signature: 2e26deb79c9f12fded05a5d3f3274d8d ****/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetHLRAngle;
		void SetHLRAngle();

		/****************** SetHiddenLineAspect ******************/
		/**** md5 signature: fc23aa00ae1da6d858eccdd0bffd021b ****/
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "Sets the parameter theaspect for the display of hidden lines in hidden line removal mode.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetHiddenLineAspect;
		void SetHiddenLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetIsoOnPlane ******************/
		/**** md5 signature: 877d0513af2869807847d91ca78cd157 ****/
		%feature("compactdefaultargs") SetIsoOnPlane;
		%feature("autodoc", "Sets isoonplane on or off by setting the parameter theisenabled to true or false.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetIsoOnPlane;
		void SetIsoOnPlane(const Standard_Boolean theIsEnabled);

		/****************** SetIsoOnTriangulation ******************/
		/**** md5 signature: 18d15c009ac1ef0cd00031a4866a34de ****/
		%feature("compactdefaultargs") SetIsoOnTriangulation;
		%feature("autodoc", "Enables or disables isolines on triangulation by setting the parameter theisenabled to true or false.

Parameters
----------
theToEnable: bool

Returns
-------
None
") SetIsoOnTriangulation;
		void SetIsoOnTriangulation(const Standard_Boolean theToEnable);

		/****************** SetLineArrowDraw ******************/
		/**** md5 signature: 1ccad4d1b8e1bf8a7d688b21eb115dc5 ****/
		%feature("compactdefaultargs") SetLineArrowDraw;
		%feature("autodoc", "Enables the drawing of an arrow at the end of each line. by default the arrows are not drawn.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetLineArrowDraw;
		void SetLineArrowDraw(const Standard_Boolean theIsEnabled);

		/****************** SetLineAspect ******************/
		/**** md5 signature: edeacff48ba26eb953ac27ee5da1b9dd ****/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "Sets the parameter theaspect for display attributes of lines.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetLineAspect;
		void SetLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetLink ******************/
		/**** md5 signature: a57c6c0127c30ad6a07c56ee53a36587 ****/
		%feature("compactdefaultargs") SetLink;
		%feature("autodoc", "Sets thedrawer as a link to which the current object references.

Parameters
----------
theDrawer: Prs3d_Drawer

Returns
-------
None
") SetLink;
		void SetLink(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetMaximalChordialDeviation ******************/
		/**** md5 signature: 432b23f0ed55ddc741078b7674cf10e8 ****/
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "Defines the maximal chordial deviation when drawing any curve. even if the type of deviation is set to tod_relative, this value is used by: prs3d_deflectioncurve prs3d_wfdeflectionsurface prs3d_wfdeflectionrestrictedface.

Parameters
----------
theChordialDeviation: float

Returns
-------
None
") SetMaximalChordialDeviation;
		void SetMaximalChordialDeviation(const Standard_Real theChordialDeviation);

		/****************** SetMaximalParameterValue ******************/
		/**** md5 signature: aa314594e57535d77970bac6f2f02a1d ****/
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "Defines the maximum value allowed for the first and last parameters of an infinite curve.

Parameters
----------
theValue: float

Returns
-------
None
") SetMaximalParameterValue;
		void SetMaximalParameterValue(const Standard_Real theValue);

		/****************** SetOwnDatumAspects ******************/
		/**** md5 signature: 8932f1aefe0746057b59cd498ae76d61 ****/
		%feature("compactdefaultargs") SetOwnDatumAspects;
		%feature("autodoc", "Sets own line aspects for datums. returns false if own line for datums are already set.

Parameters
----------
theDefaults: Prs3d_Drawer,optional
	default value is opencascade::handle<Prs3d_Drawer>()

Returns
-------
bool
") SetOwnDatumAspects;
		Standard_Boolean SetOwnDatumAspects(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetOwnLineAspects ******************/
		/**** md5 signature: e66409de321081b5ec44a17dddcf0e3d ****/
		%feature("compactdefaultargs") SetOwnLineAspects;
		%feature("autodoc", "Sets own line aspects, which are single u and single v gray75 solid isolines (::uisoaspect(), ::visoaspect()), red wire (::wireaspect()), yellow line (::lineaspect()), yellow seen line (::seenlineaspect()), dashed yellow hidden line (::hiddenlineaspect()), green free boundary (::freeboundaryaspect()), yellow unfree boundary (::unfreeboundaryaspect()). returns false if own line aspect are already set.

Parameters
----------
theDefaults: Prs3d_Drawer,optional
	default value is opencascade::handle<Prs3d_Drawer>()

Returns
-------
bool
") SetOwnLineAspects;
		Standard_Boolean SetOwnLineAspects(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetPlaneAspect ******************/
		/**** md5 signature: f22d1aee7c3703b9676dab2ac3cf0178 ****/
		%feature("compactdefaultargs") SetPlaneAspect;
		%feature("autodoc", "Sets the parameter theaspect for the display of planes. .

Parameters
----------
theAspect: Prs3d_PlaneAspect

Returns
-------
None
") SetPlaneAspect;
		void SetPlaneAspect(const opencascade::handle<Prs3d_PlaneAspect> & theAspect);

		/****************** SetPointAspect ******************/
		/**** md5 signature: 94b301114933fbb123df3ae8775512cc ****/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "Sets the parameter theaspect for display attributes of points.

Parameters
----------
theAspect: Prs3d_PointAspect

Returns
-------
None
") SetPointAspect;
		void SetPointAspect(const opencascade::handle<Prs3d_PointAspect> & theAspect);

		/****************** SetSectionAspect ******************/
		/**** md5 signature: 6c19b7443c1dc36132903ac9a28a5a0b ****/
		%feature("compactdefaultargs") SetSectionAspect;
		%feature("autodoc", "Sets the parameter theaspect for display attributes of sections. .

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetSectionAspect;
		void SetSectionAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetSeenLineAspect ******************/
		/**** md5 signature: 89d38d4b652b01b524f6eac51895b264 ****/
		%feature("compactdefaultargs") SetSeenLineAspect;
		%feature("autodoc", "Sets the parameter theaspect for the display of seen lines in hidden line removal mode.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetSeenLineAspect;
		void SetSeenLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetShaderProgram ******************/
		/**** md5 signature: 9d0adcad54c470d2bd41460db7853e8e ****/
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "Assign shader program for specified type of primitives. @param theprogram new program to set (might be null) @param theaspect the type of primitives @param thetooverridedefaults if true then non-overridden attributes using defaults will be allocated and copied from the link;  otherwise, only already customized attributes will be changed returns true if presentation should be recomputed after creating aspects not previously customized (if thetooverridedefaults is also true).

Parameters
----------
theProgram: Graphic3d_ShaderProgram
theAspect: Graphic3d_GroupAspect
theToOverrideDefaults: bool,optional
	default value is false

Returns
-------
bool
") SetShaderProgram;
		bool SetShaderProgram(const opencascade::handle<Graphic3d_ShaderProgram> & theProgram, const Graphic3d_GroupAspect theAspect, const bool theToOverrideDefaults = false);

		/****************** SetShadingAspect ******************/
		/**** md5 signature: 45b3837322e0cd51320f7a5eb31578c6 ****/
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "Sets the parameter theaspect for display attributes of shading.

Parameters
----------
theAspect: Prs3d_ShadingAspect

Returns
-------
None
") SetShadingAspect;
		void SetShadingAspect(const opencascade::handle<Prs3d_ShadingAspect> & theAspect);

		/****************** SetShadingModel ******************/
		/**** md5 signature: 690559077ffb9b7c7d964dd137495ad4 ****/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "Sets shading model type for the shading aspect.

Parameters
----------
theModel: Graphic3d_TypeOfShadingModel
theToOverrideDefaults: bool,optional
	default value is false

Returns
-------
bool
") SetShadingModel;
		bool SetShadingModel(Graphic3d_TypeOfShadingModel theModel, bool theToOverrideDefaults = false);

		/****************** SetTextAspect ******************/
		/**** md5 signature: 16268f9cae5cfb074a9ff4dfb480431d ****/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "Sets the parameter theaspect for display attributes of text.

Parameters
----------
theAspect: Prs3d_TextAspect

Returns
-------
None
") SetTextAspect;
		void SetTextAspect(const opencascade::handle<Prs3d_TextAspect> & theAspect);

		/****************** SetTypeOfDeflection ******************/
		/**** md5 signature: 81c195f8139170e0f0b9bbbe312ef7f8 ****/
		%feature("compactdefaultargs") SetTypeOfDeflection;
		%feature("autodoc", "Sets the type of chordal deflection. this indicates whether the deflection value is absolute or relative to the size of the object.

Parameters
----------
theTypeOfDeflection: Aspect_TypeOfDeflection

Returns
-------
None
") SetTypeOfDeflection;
		void SetTypeOfDeflection(const Aspect_TypeOfDeflection theTypeOfDeflection);

		/****************** SetTypeOfHLR ******************/
		/**** md5 signature: 6aaba1d38a89048d1a811523a13236d7 ****/
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "Sets the type of hlr algorithm used by drawer's interactive objects.

Parameters
----------
theTypeOfHLR: Prs3d_TypeOfHLR

Returns
-------
None
") SetTypeOfHLR;
		void SetTypeOfHLR(const Prs3d_TypeOfHLR theTypeOfHLR);

		/****************** SetUIsoAspect ******************/
		/**** md5 signature: 53fb2c4032ab095bc605ef5ed9d6de04 ****/
		%feature("compactdefaultargs") SetUIsoAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Prs3d_IsoAspect

Returns
-------
None
") SetUIsoAspect;
		void SetUIsoAspect(const opencascade::handle<Prs3d_IsoAspect> & theAspect);

		/****************** SetUnFreeBoundaryAspect ******************/
		/**** md5 signature: b09e9b0550868d8e766250cc7582a2e5 ****/
		%feature("compactdefaultargs") SetUnFreeBoundaryAspect;
		%feature("autodoc", "Sets the parameter theaspect for the display of shared boundaries. the method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetUnFreeBoundaryAspect;
		void SetUnFreeBoundaryAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetUnFreeBoundaryDraw ******************/
		/**** md5 signature: bc18bdedb6e7b4bc8ac8c8bd71694ee7 ****/
		%feature("compactdefaultargs") SetUnFreeBoundaryDraw;
		%feature("autodoc", "Enables or disables drawing of shared boundaries for shading presentations. the method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theisenabled is a boolean flag indicating whether the shared boundaries should be drawn or not.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetUnFreeBoundaryDraw;
		void SetUnFreeBoundaryDraw(const Standard_Boolean theIsEnabled);

		/****************** SetVIsoAspect ******************/
		/**** md5 signature: 911f2c0ee7deff12cef662388c471713 ****/
		%feature("compactdefaultargs") SetVIsoAspect;
		%feature("autodoc", "Sets the appearance of v isoparameters - theaspect.

Parameters
----------
theAspect: Prs3d_IsoAspect

Returns
-------
None
") SetVIsoAspect;
		void SetVIsoAspect(const opencascade::handle<Prs3d_IsoAspect> & theAspect);

		/****************** SetVectorAspect ******************/
		/**** md5 signature: 479fb7dcf203538af63a50a743c52cb5 ****/
		%feature("compactdefaultargs") SetVectorAspect;
		%feature("autodoc", "Sets the modality theaspect for the display of vectors.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetVectorAspect;
		void SetVectorAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetVertexDrawMode ******************/
		/**** md5 signature: 3741c3d9c3f8146b4737d5fbceeff113 ****/
		%feature("compactdefaultargs") SetVertexDrawMode;
		%feature("autodoc", "Sets the mode of visualization of vertices of a topods_shape instance. by default, only stand-alone vertices (not belonging topologically to an edge) are drawn, that corresponds to prs3d_vdm_standalone mode. switching to prs3d_vdm_standalone mode makes all shape's vertices visible. to inherit this parameter from the global drawer instance ('the link') when it is present, prs3d_vdm_inherited value should be used.

Parameters
----------
theMode: Prs3d_VertexDrawMode

Returns
-------
None
") SetVertexDrawMode;
		void SetVertexDrawMode(const Prs3d_VertexDrawMode theMode);

		/****************** SetWireAspect ******************/
		/**** md5 signature: 72325ef6d023a7f7fa069eb7baf3294b ****/
		%feature("compactdefaultargs") SetWireAspect;
		%feature("autodoc", "Sets the parameter theaspect for display of wires.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetWireAspect;
		void SetWireAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetWireDraw ******************/
		/**** md5 signature: 790eadb30c226a3d894f25120859429c ****/
		%feature("compactdefaultargs") SetWireDraw;
		%feature("autodoc", "Sets wiredraw on or off by setting the parameter theisenabled to true or false.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetWireDraw;
		void SetWireDraw(const Standard_Boolean theIsEnabled);

		/****************** SetupOwnDefaults ******************/
		/**** md5 signature: bdd5eb74b80039b116be4559fe1ee121 ****/
		%feature("compactdefaultargs") SetupOwnDefaults;
		%feature("autodoc", "Setup all own aspects with default values.

Returns
-------
None
") SetupOwnDefaults;
		void SetupOwnDefaults();

		/****************** SetupOwnFaceBoundaryAspect ******************/
		/**** md5 signature: 56de0be3b702e67c26bd56574e01fd6d ****/
		%feature("compactdefaultargs") SetupOwnFaceBoundaryAspect;
		%feature("autodoc", "Sets own face boundary aspect, which is a black solid line by default. returns false if the drawer already has its own attribute for face boundary aspect.

Parameters
----------
theDefaults: Prs3d_Drawer,optional
	default value is opencascade::handle<Prs3d_Drawer>()

Returns
-------
bool
") SetupOwnFaceBoundaryAspect;
		Standard_Boolean SetupOwnFaceBoundaryAspect(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetupOwnPointAspect ******************/
		/**** md5 signature: d1c0bbfa9dfec0450774acf4ca54dad3 ****/
		%feature("compactdefaultargs") SetupOwnPointAspect;
		%feature("autodoc", "Sets own point aspect, which is a yellow aspect_tom_plus marker by default. returns false if the drawer already has its own attribute for point aspect.

Parameters
----------
theDefaults: Prs3d_Drawer,optional
	default value is opencascade::handle<Prs3d_Drawer>()

Returns
-------
bool
") SetupOwnPointAspect;
		Standard_Boolean SetupOwnPointAspect(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetupOwnShadingAspect ******************/
		/**** md5 signature: f23c7b598ed27ffb9a83c13b44836ee0 ****/
		%feature("compactdefaultargs") SetupOwnShadingAspect;
		%feature("autodoc", "Sets own shading aspect, which is graphic3d_nameofmaterial_brass material by default. returns false if the drawer already has its own attribute for shading aspect.

Parameters
----------
theDefaults: Prs3d_Drawer,optional
	default value is opencascade::handle<Prs3d_Drawer>()

Returns
-------
bool
") SetupOwnShadingAspect;
		Standard_Boolean SetupOwnShadingAspect(const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** ShadingAspect ******************/
		/**** md5 signature: d658a34c620283ed10ba0f5964949287 ****/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "Returns own settings for shading aspects, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_ShadingAspect>
") ShadingAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & ShadingAspect();

		/****************** TextAspect ******************/
		/**** md5 signature: b5579ef455a1d67c591bf61096ba8f71 ****/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Returns own settings for text aspect, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_TextAspect>
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****************** TypeOfDeflection ******************/
		/**** md5 signature: fc7ea669393a04e1146251cf533ba812 ****/
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "Returns the type of chordal deflection. this indicates whether the deflection value is absolute or relative to the size of the object.

Returns
-------
Aspect_TypeOfDeflection
") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection();

		/****************** TypeOfHLR ******************/
		/**** md5 signature: e4e50942bf562af106d24a9f06c4e967 ****/
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "Returns the type of hlr algorithm currently in use.

Returns
-------
Prs3d_TypeOfHLR
") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR();

		/****************** UIsoAspect ******************/
		/**** md5 signature: 3190afcc1b7588cf3aebc5a5dfb0f248 ****/
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "Defines own attributes for drawing an u isoparametric curve of a face, settings from linked drawer or null if neither was set. //! these attributes are used by the following algorithms: prs3d_wfdeflectionsurface prs3d_wfdeflectionrestrictedface.

Returns
-------
opencascade::handle<Prs3d_IsoAspect>
") UIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & UIsoAspect();

		/****************** UnFreeBoundaryAspect ******************/
		/**** md5 signature: 938e2731b1cd708ba26696c39bdb6092 ****/
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "Returns own settings for shared boundary line aspects, settings from linked drawer or null if neither was set. these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") UnFreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & UnFreeBoundaryAspect();

		/****************** UnFreeBoundaryDraw ******************/
		/**** md5 signature: 4a9edda2cf498d8275abdb7dcc6bb228 ****/
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawing of the shared boundaries is enabled. true is the default setting.

Returns
-------
bool
") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw();

		/****************** UnsetFaceBoundaryUpperContinuity ******************/
		/**** md5 signature: 641f0514b548bedcfbfe8eb2901f3d60 ****/
		%feature("compactdefaultargs") UnsetFaceBoundaryUpperContinuity;
		%feature("autodoc", "Unset the most edge continuity class for face boundaries.

Returns
-------
None
") UnsetFaceBoundaryUpperContinuity;
		void UnsetFaceBoundaryUpperContinuity();

		/****************** UnsetOwnDimAngleDisplayUnits ******************/
		/**** md5 signature: 9dd91da7ca6e7927a05fc6117ef0e294 ****/
		%feature("compactdefaultargs") UnsetOwnDimAngleDisplayUnits;
		%feature("autodoc", "Resets hasowndimangledisplayunits() flag, e.g. undoes setdimlengthdisplayunits().

Returns
-------
None
") UnsetOwnDimAngleDisplayUnits;
		void UnsetOwnDimAngleDisplayUnits();

		/****************** UnsetOwnDimAngleModelUnits ******************/
		/**** md5 signature: 71d0041e858711a7619e2e03df179c5d ****/
		%feature("compactdefaultargs") UnsetOwnDimAngleModelUnits;
		%feature("autodoc", "Resets hasowndimanglemodelunits() flag, e.g. undoes setdimanglemodelunits().

Returns
-------
None
") UnsetOwnDimAngleModelUnits;
		void UnsetOwnDimAngleModelUnits();

		/****************** UnsetOwnDimLengthDisplayUnits ******************/
		/**** md5 signature: fdb3e789b66cd1942b0d00bcd6670af3 ****/
		%feature("compactdefaultargs") UnsetOwnDimLengthDisplayUnits;
		%feature("autodoc", "Resets hasowndimlengthmodelunits() flag, e.g. undoes setdimlengthdisplayunits().

Returns
-------
None
") UnsetOwnDimLengthDisplayUnits;
		void UnsetOwnDimLengthDisplayUnits();

		/****************** UnsetOwnDimLengthModelUnits ******************/
		/**** md5 signature: 1a50bb3283206afa34f9447361719bb1 ****/
		%feature("compactdefaultargs") UnsetOwnDimLengthModelUnits;
		%feature("autodoc", "Resets hasowndimlengthmodelunits() flag, e.g. undoes setdimlengthmodelunits().

Returns
-------
None
") UnsetOwnDimLengthModelUnits;
		void UnsetOwnDimLengthModelUnits();

		/****************** UnsetOwnDiscretisation ******************/
		/**** md5 signature: 047cfc51bae6ced11e4becb284dbacb3 ****/
		%feature("compactdefaultargs") UnsetOwnDiscretisation;
		%feature("autodoc", "Resets hasowndiscretisation() flag, e.g. undoes setdiscretisation().

Returns
-------
None
") UnsetOwnDiscretisation;
		void UnsetOwnDiscretisation();

		/****************** UnsetOwnDrawHiddenLine ******************/
		/**** md5 signature: 5572431df9d967dfcbbf53584bd58d8b ****/
		%feature("compactdefaultargs") UnsetOwnDrawHiddenLine;
		%feature("autodoc", "Resets hasowndrawhiddenline() flag, e.g. unsets enabledrawhiddenline()/disabledrawhiddenline().

Returns
-------
None
") UnsetOwnDrawHiddenLine;
		void UnsetOwnDrawHiddenLine();

		/****************** UnsetOwnFaceBoundaryDraw ******************/
		/**** md5 signature: a7a27bb2f61eb3eaa5c8b06d5f139710 ****/
		%feature("compactdefaultargs") UnsetOwnFaceBoundaryDraw;
		%feature("autodoc", "Resets hasownfaceboundarydraw() flag, e.g. undoes setfaceboundarydraw().

Returns
-------
None
") UnsetOwnFaceBoundaryDraw;
		void UnsetOwnFaceBoundaryDraw();

		/****************** UnsetOwnFreeBoundaryDraw ******************/
		/**** md5 signature: 94cefbc7316ca879e51afce0a584b793 ****/
		%feature("compactdefaultargs") UnsetOwnFreeBoundaryDraw;
		%feature("autodoc", "Resets hasownfreeboundarydraw() flag, e.g. undoes setfreeboundarydraw().

Returns
-------
None
") UnsetOwnFreeBoundaryDraw;
		void UnsetOwnFreeBoundaryDraw();

		/****************** UnsetOwnIsAutoTriangulation ******************/
		/**** md5 signature: e03d2d88873eb2223a6ee7b07d14bdc5 ****/
		%feature("compactdefaultargs") UnsetOwnIsAutoTriangulation;
		%feature("autodoc", "Resets hasownisautotriangulation() flag, e.g. undoes setautotriangulation().

Returns
-------
None
") UnsetOwnIsAutoTriangulation;
		void UnsetOwnIsAutoTriangulation();

		/****************** UnsetOwnIsoOnPlane ******************/
		/**** md5 signature: 41dbe1528d3b195f364a7aca52198133 ****/
		%feature("compactdefaultargs") UnsetOwnIsoOnPlane;
		%feature("autodoc", "Resets hasownisoonplane() flag, e.g. undoes setisoonplane().

Returns
-------
None
") UnsetOwnIsoOnPlane;
		void UnsetOwnIsoOnPlane();

		/****************** UnsetOwnIsoOnTriangulation ******************/
		/**** md5 signature: a426e9014db1398599f41f21a28db797 ****/
		%feature("compactdefaultargs") UnsetOwnIsoOnTriangulation;
		%feature("autodoc", "Resets hasownisoontriangulation() flag, e.g. undoes setisoontriangulation().

Returns
-------
None
") UnsetOwnIsoOnTriangulation;
		void UnsetOwnIsoOnTriangulation();

		/****************** UnsetOwnLineArrowDraw ******************/
		/**** md5 signature: 8f51e78cbc30ffc8a248acb5c6b3f77e ****/
		%feature("compactdefaultargs") UnsetOwnLineArrowDraw;
		%feature("autodoc", "Reset hasownlinearrowdraw() flag, e.g. undoes setlinearrowdraw().

Returns
-------
None
") UnsetOwnLineArrowDraw;
		void UnsetOwnLineArrowDraw();

		/****************** UnsetOwnMaximalChordialDeviation ******************/
		/**** md5 signature: f807868cfb852d7979ae0ccc60dab291 ****/
		%feature("compactdefaultargs") UnsetOwnMaximalChordialDeviation;
		%feature("autodoc", "Resets hasownmaximalchordialdeviation() flag, e.g. undoes setmaximalchordialdeviation().

Returns
-------
None
") UnsetOwnMaximalChordialDeviation;
		void UnsetOwnMaximalChordialDeviation();

		/****************** UnsetOwnMaximalParameterValue ******************/
		/**** md5 signature: 600e906557feb6c3ae0b212506b7a078 ****/
		%feature("compactdefaultargs") UnsetOwnMaximalParameterValue;
		%feature("autodoc", "Resets hasownmaximalparametervalue() flag, e.g. undoes setmaximalparametervalue().

Returns
-------
None
") UnsetOwnMaximalParameterValue;
		void UnsetOwnMaximalParameterValue();

		/****************** UnsetOwnTypeOfDeflection ******************/
		/**** md5 signature: 9a6eca2451096ca0cb4e2fd0a5d381fe ****/
		%feature("compactdefaultargs") UnsetOwnTypeOfDeflection;
		%feature("autodoc", "Resets hasowntypeofdeflection() flag, e.g. undoes settypeofdeflection().

Returns
-------
None
") UnsetOwnTypeOfDeflection;
		void UnsetOwnTypeOfDeflection();

		/****************** UnsetOwnUnFreeBoundaryDraw ******************/
		/**** md5 signature: cb19469a6b5169c30236136f43f1f781 ****/
		%feature("compactdefaultargs") UnsetOwnUnFreeBoundaryDraw;
		%feature("autodoc", "Resets hasownunfreeboundarydraw() flag, e.g. undoes setunfreeboundarydraw().

Returns
-------
None
") UnsetOwnUnFreeBoundaryDraw;
		void UnsetOwnUnFreeBoundaryDraw();

		/****************** UnsetOwnWireDraw ******************/
		/**** md5 signature: 81d5ff89cf03224619b8f656a62af29d ****/
		%feature("compactdefaultargs") UnsetOwnWireDraw;
		%feature("autodoc", "Resets hasownwiredraw() flag, e.g. undoes setwiredraw().

Returns
-------
None
") UnsetOwnWireDraw;
		void UnsetOwnWireDraw();

		/****************** UpdatePreviousDeviationAngle ******************/
		/**** md5 signature: 89a7b1ecfa621e3e7fc2f96b8782afff ****/
		%feature("compactdefaultargs") UpdatePreviousDeviationAngle;
		%feature("autodoc", "Updates the previous deviation angle to the current value.

Returns
-------
None
") UpdatePreviousDeviationAngle;
		void UpdatePreviousDeviationAngle();

		/****************** UpdatePreviousDeviationCoefficient ******************/
		/**** md5 signature: a15fda7b93f5f72b4b8eb66b8f1fd5ee ****/
		%feature("compactdefaultargs") UpdatePreviousDeviationCoefficient;
		%feature("autodoc", "Updates the previous value used for the chordal deviation coefficient to the current state.

Returns
-------
None
") UpdatePreviousDeviationCoefficient;
		void UpdatePreviousDeviationCoefficient();

		/****************** VIsoAspect ******************/
		/**** md5 signature: 09b7691a9856c7b528ebade397f4a1e3 ****/
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "Defines own attributes for drawing an v isoparametric curve of a face, settings from linked drawer or null if neither was set. //! these attributes are used by the following algorithms: prs3d_wfdeflectionsurface prs3d_wfdeflectionrestrictedface.

Returns
-------
opencascade::handle<Prs3d_IsoAspect>
") VIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & VIsoAspect();

		/****************** VectorAspect ******************/
		/**** md5 signature: 5f71df175530885a64f389ca286a41bb ****/
		%feature("compactdefaultargs") VectorAspect;
		%feature("autodoc", "Returns own settings for the appearance of vectors, settings from linked drawer or null if neither was set.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") VectorAspect;
		const opencascade::handle<Prs3d_LineAspect> & VectorAspect();

		/****************** VertexDrawMode ******************/
		/**** md5 signature: 909b24d3d9a35693286245e367d6447e ****/
		%feature("compactdefaultargs") VertexDrawMode;
		%feature("autodoc", "Returns the current mode of visualization of vertices of a topods_shape instance.

Returns
-------
Prs3d_VertexDrawMode
") VertexDrawMode;
		Prs3d_VertexDrawMode VertexDrawMode();

		/****************** WireAspect ******************/
		/**** md5 signature: 636754a09bc13a0e0aa4e77f5c589fd0 ****/
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "Returns own wire aspect settings, settings from linked drawer or null if neither was set. these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") WireAspect;
		const opencascade::handle<Prs3d_LineAspect> & WireAspect();

		/****************** WireDraw ******************/
		/**** md5 signature: 5d9e30c499e2ac3def846a0a7f29f5a7 ****/
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "Returns true if the drawing of the wire is enabled.

Returns
-------
bool
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
		/****************** Add ******************/
		/**** md5 signature: 3b58eed451698bf11ecbe3acc74e2d0b ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrs: Handle ( Prs3d_Presentation )
thePoint: AnyPoint
theDrawer: Handle ( Prs3d_Drawer )

Returns
-------
None
") Add;
		static void Add(const Handle ( Prs3d_Presentation ) & thePrs, const AnyPoint & thePoint, const Handle ( Prs3d_Drawer ) & theDrawer);

		/****************** Match ******************/
		/**** md5 signature: 0b99a7d2ff1fac1a4a91e5728b1339c9 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePoint: AnyPoint
theX: float
theY: float
theZ: float
theDistance: float

Returns
-------
bool
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
		/****************** Prs3d_PresentationShadow ******************/
		/**** md5 signature: ca4f62196f0716649e4a69b121843074 ****/
		%feature("compactdefaultargs") Prs3d_PresentationShadow;
		%feature("autodoc", "Constructs a shadow of existing presentation object.

Parameters
----------
theViewer: Graphic3d_StructureManager
thePrs: Graphic3d_Structure

Returns
-------
None
") Prs3d_PresentationShadow;
		 Prs3d_PresentationShadow(const opencascade::handle<Graphic3d_StructureManager> & theViewer, const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****************** CalculateBoundBox ******************/
		/**** md5 signature: a6bde4513a3c46f9f4fb4761385ff10b ****/
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "Do nothing - axis-aligned bounding box should be initialized from parent structure.

Returns
-------
None
") CalculateBoundBox;
		virtual void CalculateBoundBox();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** ParentAffinity ******************/
		/**** md5 signature: 9b0bdbaca5cd51b4bff82600c75ff027 ****/
		%feature("compactdefaultargs") ParentAffinity;
		%feature("autodoc", "Returns view affinity of the parent presentation.

Returns
-------
opencascade::handle<Graphic3d_ViewAffinity>
") ParentAffinity;
		const opencascade::handle<Graphic3d_ViewAffinity> & ParentAffinity();

		/****************** ParentId ******************/
		/**** md5 signature: c6149323d3f3c6f3e02c4be5b579c343 ****/
		%feature("compactdefaultargs") ParentId;
		%feature("autodoc", "Returns the id of the parent presentation.

Returns
-------
int
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
		/****************** CurrentGroup ******************/
		/**** md5 signature: e95e1e3804731856f1d7faf6d33cb8bd ****/
		%feature("compactdefaultargs") CurrentGroup;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrs3d: Prs3d_Presentation

Returns
-------
opencascade::handle<Graphic3d_Group>
") CurrentGroup;
		static opencascade::handle<Graphic3d_Group> CurrentGroup(const opencascade::handle<Prs3d_Presentation> & thePrs3d);

		/****************** NewGroup ******************/
		/**** md5 signature: 4f25dab2ea6d19aa0b7ebaa3dafab482 ****/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrs3d: Prs3d_Presentation

Returns
-------
opencascade::handle<Graphic3d_Group>
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
		/****************** Draw ******************/
		/**** md5 signature: e497187cc47a0b4c170caa451c728072 ****/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Defines the display of the text. @param thegroup group to add primitives @param theaspect presentation attributes @param thetext text to draw @param theattachmentpoint attachment point returns text to draw.

Parameters
----------
theGroup: Graphic3d_Group
theAspect: Prs3d_TextAspect
theText: TCollection_ExtendedString
theAttachmentPoint: gp_Pnt

Returns
-------
opencascade::handle<Graphic3d_Text>
") Draw;
		static opencascade::handle<Graphic3d_Text> Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const opencascade::handle<Prs3d_TextAspect> & theAspect, const TCollection_ExtendedString & theText, const gp_Pnt & theAttachmentPoint);

		/****************** Draw ******************/
		/**** md5 signature: bffbe230252ee3e0d660a0f0a3cb5a41 ****/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Draws the text label. @param thegroup group to add primitives @param theaspect presentation attributes @param thetext text to draw @param theorientation location and orientation specified in the model 3d space @param thehasownanchor returns text to draw.

Parameters
----------
theGroup: Graphic3d_Group
theAspect: Prs3d_TextAspect
theText: TCollection_ExtendedString
theOrientation: gp_Ax2
theHasOwnAnchor: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Graphic3d_Text>
") Draw;
		static opencascade::handle<Graphic3d_Text> Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const opencascade::handle<Prs3d_TextAspect> & theAspect, const TCollection_ExtendedString & theText, const gp_Ax2 & theOrientation, const Standard_Boolean theHasOwnAnchor = Standard_True);

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
		/****************** CreatePolyTriangulation ******************/
		/**** md5 signature: 969725a9ac628bcecddfe33496740acf ****/
		%feature("compactdefaultargs") CreatePolyTriangulation;
		%feature("autodoc", "Generate primitives for 3d quadric surface presentation. @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Poly_Triangulation>
") CreatePolyTriangulation;
		opencascade::handle<Poly_Triangulation> CreatePolyTriangulation(const gp_Trsf & theTrsf);

		/****************** CreateTriangulation ******************/
		/**** md5 signature: 4c6f5fda1d7eda1a0394d83f1c49bd55 ****/
		%feature("compactdefaultargs") CreateTriangulation;
		%feature("autodoc", "Generate primitives for 3d quadric surface presentation. @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
") CreateTriangulation;
		opencascade::handle<Graphic3d_ArrayOfTriangles> CreateTriangulation(const gp_Trsf & theTrsf);

		/****************** FillArray ******************/
		/**** md5 signature: 05aa8383885ae4a8861a03330fc93140 ****/
		%feature("compactdefaultargs") FillArray;
		%feature("autodoc", "Generate primitives for 3d quadric surface and fill the given array. @param thearray [in][out] the array of vertices;  when null, function will create an indexed array;  when not null, triangles will be appended to the end of array  (will raise an exception if reserved array size is not large enough) @param thetrsf [in] optional transformation to apply.

Parameters
----------
theArray: Graphic3d_ArrayOfTriangles
theTrsf: gp_Trsf

Returns
-------
None
") FillArray;
		void FillArray(opencascade::handle<Graphic3d_ArrayOfTriangles> & theArray, const gp_Trsf & theTrsf);

		/****************** FillArray ******************/
		/**** md5 signature: 7147828fbd45e9681ea3a53d5ddbf124 ****/
		%feature("compactdefaultargs") FillArray;
		%feature("autodoc", "Generate primitives for 3d quadric surface presentation. @param thearray [out] generated array of triangles @param thetriangulation [out] generated triangulation @param thetrsf [in] optional transformation to apply.

Parameters
----------
theArray: Graphic3d_ArrayOfTriangles
theTriangulation: Poly_Triangulation
theTrsf: gp_Trsf

Returns
-------
None
") FillArray;
		void FillArray(opencascade::handle<Graphic3d_ArrayOfTriangles> & theArray, opencascade::handle<Poly_Triangulation> & theTriangulation, const gp_Trsf & theTrsf);

		/****************** TrianglesNb ******************/
		/**** md5 signature: 8b7c815b2ac2556d491b7b49576cd32d ****/
		%feature("compactdefaultargs") TrianglesNb;
		%feature("autodoc", "Return number of triangles for presentation with the given params.

Parameters
----------
theSlicesNb: int
theStacksNb: int

Returns
-------
int
") TrianglesNb;
		static Standard_Integer TrianglesNb(const Standard_Integer theSlicesNb, const Standard_Integer theStacksNb);

		/****************** TrianglesNb ******************/
		/**** md5 signature: 79e9c94384c6f9eca1682b3bd078e884 ****/
		%feature("compactdefaultargs") TrianglesNb;
		%feature("autodoc", "Return number of triangles in generated presentation.

Returns
-------
int
") TrianglesNb;
		Standard_Integer TrianglesNb();

		/****************** VerticesNb ******************/
		/**** md5 signature: 1326b929d9932628a0c679a5777a5b6c ****/
		%feature("compactdefaultargs") VerticesNb;
		%feature("autodoc", "Return number of vertices for presentation with the given params.

Parameters
----------
theSlicesNb: int
theStacksNb: int
theIsIndexed: bool,optional
	default value is Standard_True

Returns
-------
int
") VerticesNb;
		static Standard_Integer VerticesNb(const Standard_Integer theSlicesNb, const Standard_Integer theStacksNb, const Standard_Boolean theIsIndexed = Standard_True);

		/****************** VerticesNb ******************/
		/**** md5 signature: 2f242abab1be940c103aeca916c73e88 ****/
		%feature("compactdefaultargs") VerticesNb;
		%feature("autodoc", "Return number of vertices in generated presentation.

Parameters
----------
theIsIndexed: bool,optional
	default value is true

Returns
-------
int
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
		/****************** Prs3d_ArrowAspect ******************/
		/**** md5 signature: b4fa61cf30eaa8c64da5eee227f0377c ****/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "Constructs an empty framework for displaying arrows in representations of lengths. the lengths displayed are either on their own or in chamfers, fillets, diameters and radii.

Returns
-------
None
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect();

		/****************** Prs3d_ArrowAspect ******************/
		/**** md5 signature: fdb610b367c968bba1e1232c8ab58c06 ****/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "Constructs a framework to display an arrow with a shaft of the length alength and having a head with sides at the angle anangle from each other.

Parameters
----------
anAngle: float
aLength: float

Returns
-------
None
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect(const Standard_Real anAngle, const Standard_Real aLength);

		/****************** Prs3d_ArrowAspect ******************/
		/**** md5 signature: 47ec9f21d50f8b3bf4ced85a1384c980 ****/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectLine3d

Returns
-------
None
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** Angle ******************/
		/**** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the current value of the angle used when drawing an arrow.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Aspect ******************/
		/**** md5 signature: 658e539c0394175cfd3aa70cb073ba78 ****/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Graphic3d_AspectLine3d>
") Aspect;
		const opencascade::handle<Graphic3d_AspectLine3d> & Aspect();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** IsZoomable ******************/
		/**** md5 signature: 0e11552facaac98faf2474f0071c0b9d ****/
		%feature("compactdefaultargs") IsZoomable;
		%feature("autodoc", "Returns true when the arrow zoomable is on; true by default.

Returns
-------
bool
") IsZoomable;
		bool IsZoomable();

		/****************** Length ******************/
		/**** md5 signature: 1d863a710d06afea5559458878200357 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the current value of the length used when drawing an arrow.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** SetAngle ******************/
		/**** md5 signature: eb58abb1f2735255b52070d752bb180a ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "Defines the angle of the arrows.

Parameters
----------
anAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real anAngle);

		/****************** SetAspect ******************/
		/**** md5 signature: 56753271c32070a7f0d3996502dbd4eb ****/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectLine3d

Returns
-------
None
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** SetColor ******************/
		/**** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetLength ******************/
		/**** md5 signature: 49e1954d3eb0ee1dbf03153254bfe462 ****/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "Defines the length of the arrows.

Parameters
----------
theLength: float

Returns
-------
None
") SetLength;
		void SetLength(const Standard_Real theLength);

		/****************** SetZoomable ******************/
		/**** md5 signature: 97ffe04fce7ef540e2fce9a76dd33eaa ****/
		%feature("compactdefaultargs") SetZoomable;
		%feature("autodoc", "Turns usage of arrow zoomable on/off.

Parameters
----------
theIsZoomable: bool

Returns
-------
None
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
		/****************** Add ******************/
		/**** md5 signature: c54a75d50bfd4e7f1fb12cf7497bfbd8 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes presentation of a bounding box. @param thepresentation [in] the presentation. @param thebndbox [in] the bounding box. @param thedrawer [in] the drawer.

Parameters
----------
thePresentation: Prs3d_Presentation
theBndBox: Bnd_Box
theDrawer: Prs3d_Drawer

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const Bnd_Box & theBndBox, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** Add ******************/
		/**** md5 signature: 6b808f8029d0bc7d27373b55eaa80cd4 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes presentation of a bounding box. @param thepresentation [in] the presentation. @param thebndbox [in] the bounding box. @param thedrawer [in] the drawer.

Parameters
----------
thePresentation: Prs3d_Presentation
theBndBox: Bnd_OBB
theDrawer: Prs3d_Drawer

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const Bnd_OBB & theBndBox, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** FillSegments ******************/
		/**** md5 signature: 5fb83e6b4c177d72797ad20d5dbb573c ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thebox [in] the box to add.

Parameters
----------
theBox: Bnd_OBB

Returns
-------
opencascade::handle<Graphic3d_ArrayOfSegments>
") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments(const Bnd_OBB & theBox);

		/****************** FillSegments ******************/
		/**** md5 signature: 40a5714e880ddcdb51b116ed7e7d58a3 ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thebox [in] the box to add.

Parameters
----------
theBox: Bnd_Box

Returns
-------
opencascade::handle<Graphic3d_ArrayOfSegments>
") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments(const Bnd_Box & theBox);

		/****************** FillSegments ******************/
		/**** md5 signature: 6c2926015dd63abf7dfca1e5b0f1dee0 ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thesegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param thebox [in] the box to add.

Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: Bnd_OBB

Returns
-------
None
") FillSegments;
		static void FillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const Bnd_OBB & theBox);

		/****************** FillSegments ******************/
		/**** md5 signature: 1dfe28468b5ba72dd334e07d0ac3116c ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thesegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param thebox [in] the box to add.

Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: Bnd_Box

Returns
-------
None
") FillSegments;
		static void FillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const Bnd_Box & theBox);

		/****************** fillSegments ******************/
		/**** md5 signature: c902020df6559486e6ed2711d0bcc3d9 ****/
		%feature("compactdefaultargs") fillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thesegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param thebox [in] the box to add.

Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: gp_Pnt *

Returns
-------
None
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
		/****************** Prs3d_DatumAspect ******************/
		/**** md5 signature: 71be1d27ce693ac5509c01c1b9013cbd ****/
		%feature("compactdefaultargs") Prs3d_DatumAspect;
		%feature("autodoc", "An empty constructor.

Returns
-------
None
") Prs3d_DatumAspect;
		 Prs3d_DatumAspect();

		/****************** ArrowAspect ******************/
		/**** md5 signature: 29e63b2128edf1fedd73ca50d8ecc2d8 ****/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns the arrow aspect of presentation.

Returns
-------
opencascade::handle<Prs3d_ArrowAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****************** ArrowPartForAxis ******************/
		/**** md5 signature: 7a1df2eb76e4e1e3416cc302c58ee37b ****/
		%feature("compactdefaultargs") ArrowPartForAxis;
		%feature("autodoc", "Returns type of arrow for a type of axis.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
Prs3d_DatumParts
") ArrowPartForAxis;
		static Prs3d_DatumParts ArrowPartForAxis(Prs3d_DatumParts thePart);

		/****************** Attribute ******************/
		/**** md5 signature: d7ca7bee3d949bb4cd8c2c3c07920d6e ****/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "Returns the attribute of the datum type.

Parameters
----------
theType: Prs3d_DatumAttribute

Returns
-------
float
") Attribute;
		Standard_Real Attribute(Prs3d_DatumAttribute theType);

		/****************** AxisLength ******************/
		/**** md5 signature: 78fdae0390bbc7bf04978fb62d2c6a4b ****/
		%feature("compactdefaultargs") AxisLength;
		%feature("autodoc", "Returns the length of the displayed first axis.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
float
") AxisLength;
		Standard_Real AxisLength(Prs3d_DatumParts thePart);

		/****************** CopyAspectsFrom ******************/
		/**** md5 signature: ec90d65075dc1aad3151ac0b5a24cb1b ****/
		%feature("compactdefaultargs") CopyAspectsFrom;
		%feature("autodoc", "Performs deep copy of attributes from another aspect instance.

Parameters
----------
theOther: Prs3d_DatumAspect

Returns
-------
None
") CopyAspectsFrom;
		void CopyAspectsFrom(const opencascade::handle<Prs3d_DatumAspect> & theOther);

		/****************** DatumAxes ******************/
		/**** md5 signature: 25421ca286b68e0e5619b29932d4e2d2 ****/
		%feature("compactdefaultargs") DatumAxes;
		%feature("autodoc", "Returns axes used in the datum aspect.

Returns
-------
Prs3d_DatumAxes
") DatumAxes;
		Prs3d_DatumAxes DatumAxes();

		/****************** DrawDatumPart ******************/
		/**** md5 signature: 589c4fbc66e194b032a506fb72d2943b ****/
		%feature("compactdefaultargs") DrawDatumPart;
		%feature("autodoc", "Returns true if the given part is used in axes of aspect.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
bool
") DrawDatumPart;
		Standard_Boolean DrawDatumPart(Prs3d_DatumParts thePart);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** LineAspect ******************/
		/**** md5 signature: 9af72ca119f843e15222dd5546dc6dfb ****/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Returns line aspect for specified part.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect(Prs3d_DatumParts thePart);

		/****************** PointAspect ******************/
		/**** md5 signature: 50902dc571bbda51cee2855b6ef5ff8d ****/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Returns the point aspect of origin wireframe presentation.

Returns
-------
opencascade::handle<Prs3d_PointAspect>
") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect();

		/****************** SetArrowAspect ******************/
		/**** md5 signature: 0a1adde0b720014d803adbe7c86e169d ****/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "Sets the arrow aspect of presentation.

Parameters
----------
theAspect: Prs3d_ArrowAspect

Returns
-------
None
") SetArrowAspect;
		void SetArrowAspect(const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****************** SetAttribute ******************/
		/**** md5 signature: addb95d2429f8a93b0aa29cc41d7d7c3 ****/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "Sets the attribute of the datum type.

Parameters
----------
theType: Prs3d_DatumAttribute
theValue: float

Returns
-------
None
") SetAttribute;
		void SetAttribute(Prs3d_DatumAttribute theType, const Standard_Real theValue);

		/****************** SetAxisLength ******************/
		/**** md5 signature: 368cf5f58e7c88156ee1613e1838afa1 ****/
		%feature("compactdefaultargs") SetAxisLength;
		%feature("autodoc", "Sets the lengths of the three axes.

Parameters
----------
theL1: float
theL2: float
theL3: float

Returns
-------
None
") SetAxisLength;
		void SetAxisLength(Standard_Real theL1, Standard_Real theL2, Standard_Real theL3);

		/****************** SetDrawArrows ******************/
		/**** md5 signature: 77144cbf3c12e0f52352851c91f67a12 ****/
		%feature("compactdefaultargs") SetDrawArrows;
		%feature("autodoc", "Sets option to draw or not arrows for axes.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawArrows;
		void SetDrawArrows(Standard_Boolean theToDraw);

		/****************** SetDrawDatumAxes ******************/
		/**** md5 signature: 60ca5c83f384aa6188d8ce4043d65437 ****/
		%feature("compactdefaultargs") SetDrawDatumAxes;
		%feature("autodoc", "Sets the axes used in the datum aspect.

Parameters
----------
theType: Prs3d_DatumAxes

Returns
-------
None
") SetDrawDatumAxes;
		void SetDrawDatumAxes(Prs3d_DatumAxes theType);

		/****************** SetDrawLabels ******************/
		/**** md5 signature: e034ff7bc5e70c3493e6a993aa989169 ****/
		%feature("compactdefaultargs") SetDrawLabels;
		%feature("autodoc", "Sets option to draw or not to draw text labels for axes.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawLabels;
		void SetDrawLabels(Standard_Boolean theToDraw);

		/****************** SetPointAspect ******************/
		/**** md5 signature: 94b301114933fbb123df3ae8775512cc ****/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "Returns the point aspect of origin wireframe presentation.

Parameters
----------
theAspect: Prs3d_PointAspect

Returns
-------
None
") SetPointAspect;
		void SetPointAspect(const opencascade::handle<Prs3d_PointAspect> & theAspect);

		/****************** SetTextAspect ******************/
		/**** md5 signature: 55cb9b8736123a342e5c4fc4e4bbf496 ****/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "Sets text attributes for rendering labels.

Parameters
----------
theTextAspect: Prs3d_TextAspect

Returns
-------
None
") SetTextAspect;
		void SetTextAspect(const opencascade::handle<Prs3d_TextAspect> & theTextAspect);

		/****************** SetToDrawLabels ******************/
		/**** md5 signature: 01b84536290f88c0f6c2733c7bfb4076 ****/
		%feature("compactdefaultargs") SetToDrawLabels;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetToDrawLabels;
		void SetToDrawLabels(Standard_Boolean theToDraw);

		/****************** ShadingAspect ******************/
		/**** md5 signature: 0e02ad2657728f8fa670dd55189d1518 ****/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "Returns shading aspect for specified part.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
opencascade::handle<Prs3d_ShadingAspect>
") ShadingAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & ShadingAspect(Prs3d_DatumParts thePart);

		/****************** TextAspect ******************/
		/**** md5 signature: e0f44028ed1f363b874a5b8421f2d89b ****/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Returns the text attributes for rendering label of specified part (prs3d_datumparts_xaxis/prs3d_datumparts_yaxis/prs3d_datumparts_zaxis).

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
opencascade::handle<Prs3d_TextAspect>
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect(Prs3d_DatumParts thePart);

		/****************** TextAspect ******************/
		/**** md5 signature: cfcafff19dee0a33d3ad10bb73a9e0cf ****/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Returns the text attributes for rendering labels.

Returns
-------
opencascade::handle<Prs3d_TextAspect>
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****************** ToDrawArrows ******************/
		/**** md5 signature: 7fd3cfe7831ebb75887b42f1c3721e82 ****/
		%feature("compactdefaultargs") ToDrawArrows;
		%feature("autodoc", "Returns true if axes arrows are drawn; true by default.

Returns
-------
bool
") ToDrawArrows;
		Standard_Boolean ToDrawArrows();

		/****************** ToDrawLabels ******************/
		/**** md5 signature: e96476e7cdea51d0791faaa945b8761b ****/
		%feature("compactdefaultargs") ToDrawLabels;
		%feature("autodoc", "Returns true if axes labels are drawn; true by default.

Returns
-------
bool
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
		/****************** Prs3d_DimensionAspect ******************/
		/**** md5 signature: 91653a7dfcd8aee23d454b90b48b648a ****/
		%feature("compactdefaultargs") Prs3d_DimensionAspect;
		%feature("autodoc", "Constructs an empty framework to define the display of dimensions.

Returns
-------
None
") Prs3d_DimensionAspect;
		 Prs3d_DimensionAspect();

		/****************** ArrowAspect ******************/
		/**** md5 signature: 29e63b2128edf1fedd73ca50d8ecc2d8 ****/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns the settings for displaying arrows.

Returns
-------
opencascade::handle<Prs3d_ArrowAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****************** ArrowOrientation ******************/
		/**** md5 signature: 5a1600ad23cd2f3f294beec2cf662f46 ****/
		%feature("compactdefaultargs") ArrowOrientation;
		%feature("autodoc", "Gets orientation of arrows (external or internal).

Returns
-------
Prs3d_DimensionArrowOrientation
") ArrowOrientation;
		Prs3d_DimensionArrowOrientation ArrowOrientation();

		/****************** ArrowTailSize ******************/
		/**** md5 signature: 8555ac26347823eb4d6bb4cef26824d4 ****/
		%feature("compactdefaultargs") ArrowTailSize;
		%feature("autodoc", "Returns arrow tail size.

Returns
-------
float
") ArrowTailSize;
		Standard_Real ArrowTailSize();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** ExtensionSize ******************/
		/**** md5 signature: 876d08434cb9c896916a7933c4b53809 ****/
		%feature("compactdefaultargs") ExtensionSize;
		%feature("autodoc", "Returns extension size.

Returns
-------
float
") ExtensionSize;
		Standard_Real ExtensionSize();

		/****************** IsArrows3d ******************/
		/**** md5 signature: f61af83d91c92e9bc34305443832f5b0 ****/
		%feature("compactdefaultargs") IsArrows3d;
		%feature("autodoc", "Gets type of arrows.

Returns
-------
bool
") IsArrows3d;
		Standard_Boolean IsArrows3d();

		/****************** IsText3d ******************/
		/**** md5 signature: 4abdeea26e7a341e46ba908ea0dece0f ****/
		%feature("compactdefaultargs") IsText3d;
		%feature("autodoc", "Check if text for dimension label is 3d.

Returns
-------
bool
") IsText3d;
		Standard_Boolean IsText3d();

		/****************** IsTextShaded ******************/
		/**** md5 signature: 1c534a4e07128c68ced7aacfe72bf3f9 ****/
		%feature("compactdefaultargs") IsTextShaded;
		%feature("autodoc", "Check if 3d text for dimension label is shaded.

Returns
-------
bool
") IsTextShaded;
		Standard_Boolean IsTextShaded();

		/****************** IsUnitsDisplayed ******************/
		/**** md5 signature: 472a67e20dfe083be2b13ca1e61837d2 ****/
		%feature("compactdefaultargs") IsUnitsDisplayed;
		%feature("autodoc", "Shows if units are to be displayed along with dimension value.

Returns
-------
bool
") IsUnitsDisplayed;
		Standard_Boolean IsUnitsDisplayed();

		/****************** LineAspect ******************/
		/**** md5 signature: 927a4415098fa84b4a5920c8e43e39c2 ****/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Returns the settings for the display of lines used in presentation of dimensions.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect();

		/****************** MakeArrows3d ******************/
		/**** md5 signature: 825771bc33ebe567091de5f6b4d2d339 ****/
		%feature("compactdefaultargs") MakeArrows3d;
		%feature("autodoc", "Sets type of arrows.

Parameters
----------
theIsArrows3d: bool

Returns
-------
None
") MakeArrows3d;
		void MakeArrows3d(const Standard_Boolean theIsArrows3d);

		/****************** MakeText3d ******************/
		/**** md5 signature: 0ef0b6cf172d280c59d9cc614719f340 ****/
		%feature("compactdefaultargs") MakeText3d;
		%feature("autodoc", "Sets type of text.

Parameters
----------
isText3d: bool

Returns
-------
None
") MakeText3d;
		void MakeText3d(const Standard_Boolean isText3d);

		/****************** MakeTextShaded ******************/
		/**** md5 signature: 0fb1b973fa5159b97cf84937bc389706 ****/
		%feature("compactdefaultargs") MakeTextShaded;
		%feature("autodoc", "Turns on/off text shading for 3d text.

Parameters
----------
theIsTextShaded: bool

Returns
-------
None
") MakeTextShaded;
		void MakeTextShaded(const Standard_Boolean theIsTextShaded);

		/****************** MakeUnitsDisplayed ******************/
		/**** md5 signature: 65ce3eaad48ff3c494eb3af4a295d192 ****/
		%feature("compactdefaultargs") MakeUnitsDisplayed;
		%feature("autodoc", "Specifies whether the units string should be displayed along with value label or not.

Parameters
----------
theIsDisplayed: bool

Returns
-------
None
") MakeUnitsDisplayed;
		void MakeUnitsDisplayed(const Standard_Boolean theIsDisplayed);

		/****************** SetArrowAspect ******************/
		/**** md5 signature: 0a1adde0b720014d803adbe7c86e169d ****/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "Sets the display attributes of arrows used in presentation of dimensions.

Parameters
----------
theAspect: Prs3d_ArrowAspect

Returns
-------
None
") SetArrowAspect;
		void SetArrowAspect(const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****************** SetArrowOrientation ******************/
		/**** md5 signature: e29ddcc6a4355053ab1075a28990f7ea ****/
		%feature("compactdefaultargs") SetArrowOrientation;
		%feature("autodoc", "Sets orientation of arrows (external or internal). by default orientation is chosen automatically according to situation and text label size.

Parameters
----------
theArrowOrient: Prs3d_DimensionArrowOrientation

Returns
-------
None
") SetArrowOrientation;
		void SetArrowOrientation(const Prs3d_DimensionArrowOrientation theArrowOrient);

		/****************** SetArrowTailSize ******************/
		/**** md5 signature: 6f712cbd4312444c74fb341820f5e475 ****/
		%feature("compactdefaultargs") SetArrowTailSize;
		%feature("autodoc", "Set size for arrow tail (extension without text).

Parameters
----------
theSize: float

Returns
-------
None
") SetArrowTailSize;
		void SetArrowTailSize(const Standard_Real theSize);

		/****************** SetCommonColor ******************/
		/**** md5 signature: c36f70a5dca65f5552c2b1f4e32740d3 ****/
		%feature("compactdefaultargs") SetCommonColor;
		%feature("autodoc", "Sets the same color for all parts of dimension: lines, arrows and text.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetCommonColor;
		void SetCommonColor(const Quantity_Color & theColor);

		/****************** SetExtensionSize ******************/
		/**** md5 signature: 147385e01f844b6be32f7db9aa7116ec ****/
		%feature("compactdefaultargs") SetExtensionSize;
		%feature("autodoc", "Sets extension size.

Parameters
----------
theSize: float

Returns
-------
None
") SetExtensionSize;
		void SetExtensionSize(const Standard_Real theSize);

		/****************** SetLineAspect ******************/
		/**** md5 signature: edeacff48ba26eb953ac27ee5da1b9dd ****/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "Sets the display attributes of lines used in presentation of dimensions.

Parameters
----------
theAspect: Prs3d_LineAspect

Returns
-------
None
") SetLineAspect;
		void SetLineAspect(const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetTextAspect ******************/
		/**** md5 signature: 16268f9cae5cfb074a9ff4dfb480431d ****/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "Sets the display attributes of text used in presentation of dimensions.

Parameters
----------
theAspect: Prs3d_TextAspect

Returns
-------
None
") SetTextAspect;
		void SetTextAspect(const opencascade::handle<Prs3d_TextAspect> & theAspect);

		/****************** SetTextHorizontalPosition ******************/
		/**** md5 signature: c1a6b04c0044a90c16ddd598ff5af285 ****/
		%feature("compactdefaultargs") SetTextHorizontalPosition;
		%feature("autodoc", "Sets horizontal text alignment for text label.

Parameters
----------
thePosition: Prs3d_DimensionTextHorizontalPosition

Returns
-------
None
") SetTextHorizontalPosition;
		void SetTextHorizontalPosition(const Prs3d_DimensionTextHorizontalPosition thePosition);

		/****************** SetTextVerticalPosition ******************/
		/**** md5 signature: 67b93b5d2e82369207fcbd8db56ab2e0 ****/
		%feature("compactdefaultargs") SetTextVerticalPosition;
		%feature("autodoc", "Sets vertical text alignment for text label.

Parameters
----------
thePosition: Prs3d_DimensionTextVerticalPosition

Returns
-------
None
") SetTextVerticalPosition;
		void SetTextVerticalPosition(const Prs3d_DimensionTextVerticalPosition thePosition);

		/****************** SetValueStringFormat ******************/
		/**** md5 signature: c90581f68c9212c4b117a58c8726a92a ****/
		%feature("compactdefaultargs") SetValueStringFormat;
		%feature("autodoc", "Sets 'sprintf'-syntax format for formatting dimension value labels.

Parameters
----------
theFormat: TCollection_AsciiString

Returns
-------
None
") SetValueStringFormat;
		void SetValueStringFormat(const TCollection_AsciiString & theFormat);

		/****************** TextAspect ******************/
		/**** md5 signature: cfcafff19dee0a33d3ad10bb73a9e0cf ****/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Returns the settings for the display of text used in presentation of dimensions.

Returns
-------
opencascade::handle<Prs3d_TextAspect>
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****************** TextHorizontalPosition ******************/
		/**** md5 signature: c17d48164b8e6aadf722732285847490 ****/
		%feature("compactdefaultargs") TextHorizontalPosition;
		%feature("autodoc", "Gets horizontal text alignment for text label.

Returns
-------
Prs3d_DimensionTextHorizontalPosition
") TextHorizontalPosition;
		Prs3d_DimensionTextHorizontalPosition TextHorizontalPosition();

		/****************** TextVerticalPosition ******************/
		/**** md5 signature: 569e13c3e4d7a46bf9297bd77e248762 ****/
		%feature("compactdefaultargs") TextVerticalPosition;
		%feature("autodoc", "Gets vertical text alignment for text label.

Returns
-------
Prs3d_DimensionTextVerticalPosition
") TextVerticalPosition;
		Prs3d_DimensionTextVerticalPosition TextVerticalPosition();

		/****************** ValueStringFormat ******************/
		/**** md5 signature: e4551f0184a1e112744cdfd42e8ebf52 ****/
		%feature("compactdefaultargs") ValueStringFormat;
		%feature("autodoc", "Returns format.

Returns
-------
TCollection_AsciiString
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
		/****************** Prs3d_LineAspect ******************/
		/**** md5 signature: 89e8a7892b119d2cd7c4096f62812e91 ****/
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", "Constructs a framework for line aspect defined by - the color acolor - the type of line atype and - the line thickness awidth. type of line refers to whether the line is solid or dotted, for example.

Parameters
----------
theColor: Quantity_Color
theType: Aspect_TypeOfLine
theWidth: float

Returns
-------
None
") Prs3d_LineAspect;
		 Prs3d_LineAspect(const Quantity_Color & theColor, const Aspect_TypeOfLine theType, const Standard_Real theWidth);

		/****************** Prs3d_LineAspect ******************/
		/**** md5 signature: 0927d9715b5f7a178665974ee6006b1b ****/
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectLine3d

Returns
-------
None
") Prs3d_LineAspect;
		 Prs3d_LineAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** Aspect ******************/
		/**** md5 signature: 658e539c0394175cfd3aa70cb073ba78 ****/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Returns the line aspect. this is defined as the set of color, type and thickness attributes.

Returns
-------
opencascade::handle<Graphic3d_AspectLine3d>
") Aspect;
		const opencascade::handle<Graphic3d_AspectLine3d> & Aspect();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** SetAspect ******************/
		/**** md5 signature: 56753271c32070a7f0d3996502dbd4eb ****/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectLine3d

Returns
-------
None
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** SetColor ******************/
		/**** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the line color defined at the time of construction. default value: quantity_noc_yellow.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetTypeOfLine ******************/
		/**** md5 signature: ab16b63c6acbfbe8823d61eaab0dd088 ****/
		%feature("compactdefaultargs") SetTypeOfLine;
		%feature("autodoc", "Sets the type of line defined at the time of construction. this could, for example, be solid, dotted or made up of dashes. default value: aspect_tol_solid.

Parameters
----------
theType: Aspect_TypeOfLine

Returns
-------
None
") SetTypeOfLine;
		void SetTypeOfLine(const Aspect_TypeOfLine theType);

		/****************** SetWidth ******************/
		/**** md5 signature: a388bd43f011bc773d8da404945719b5 ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Sets the line width defined at the time of construction. default value: 1.

Parameters
----------
theWidth: float

Returns
-------
None
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
		/****************** Prs3d_PlaneAspect ******************/
		/**** md5 signature: 4a68b8d6ce636d8fb0e63a24d0243f01 ****/
		%feature("compactdefaultargs") Prs3d_PlaneAspect;
		%feature("autodoc", "Constructs an empty framework for the display of planes.

Returns
-------
None
") Prs3d_PlaneAspect;
		 Prs3d_PlaneAspect();

		/****************** ArrowAspect ******************/
		/**** md5 signature: a23c36f571ace4bc32d35d7f8ed896ef ****/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns the settings for displaying an arrow.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_LineAspect> & ArrowAspect();

		/****************** ArrowsAngle ******************/
		/**** md5 signature: bdee51ccaa26f85344bf4a999c7524f5 ****/
		%feature("compactdefaultargs") ArrowsAngle;
		%feature("autodoc", "Returns the angle of the arrowhead used in the display of arrows involved in the presentation of planes.

Returns
-------
float
") ArrowsAngle;
		Standard_Real ArrowsAngle();

		/****************** ArrowsLength ******************/
		/**** md5 signature: 836101e02503de37c81f271e2eced819 ****/
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "Returns the length of the arrow shaft used in the display of arrows.

Returns
-------
float
") ArrowsLength;
		Standard_Real ArrowsLength();

		/****************** ArrowsSize ******************/
		/**** md5 signature: 0214be7b615b35899c0612da8cfa855d ****/
		%feature("compactdefaultargs") ArrowsSize;
		%feature("autodoc", "Returns the size of arrows used in the display of planes.

Returns
-------
float
") ArrowsSize;
		Standard_Real ArrowsSize();

		/****************** DisplayCenterArrow ******************/
		/**** md5 signature: 1fb436095464335ec78de5386dcc5429 ****/
		%feature("compactdefaultargs") DisplayCenterArrow;
		%feature("autodoc", "Returns true if the display of center arrows is allowed.

Returns
-------
bool
") DisplayCenterArrow;
		Standard_Boolean DisplayCenterArrow();

		/****************** DisplayEdges ******************/
		/**** md5 signature: 2fd6a00bac4cd81ac82d3cc0a8a4c080 ****/
		%feature("compactdefaultargs") DisplayEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DisplayEdges;
		Standard_Boolean DisplayEdges();

		/****************** DisplayEdgesArrows ******************/
		/**** md5 signature: b0498ea7a969981d6f9dd53af9f90fca ****/
		%feature("compactdefaultargs") DisplayEdgesArrows;
		%feature("autodoc", "Returns true if the display of edge arrows is allowed.

Returns
-------
bool
") DisplayEdgesArrows;
		Standard_Boolean DisplayEdgesArrows();

		/****************** DisplayIso ******************/
		/**** md5 signature: 11917be0b220fa13cc0cd6a1f36d7ee3 ****/
		%feature("compactdefaultargs") DisplayIso;
		%feature("autodoc", "Returns true if the display of isoparameters is allowed.

Returns
-------
bool
") DisplayIso;
		Standard_Boolean DisplayIso();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** EdgesAspect ******************/
		/**** md5 signature: 99d38bc9cc235945a249087a8e222d9d ****/
		%feature("compactdefaultargs") EdgesAspect;
		%feature("autodoc", "Returns the attributes of displayed edges involved in the presentation of planes.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") EdgesAspect;
		const opencascade::handle<Prs3d_LineAspect> & EdgesAspect();

		/****************** IsoAspect ******************/
		/**** md5 signature: 83893d909882b40175a1633cdfa103c1 ****/
		%feature("compactdefaultargs") IsoAspect;
		%feature("autodoc", "Returns the attributes of displayed isoparameters involved in the presentation of planes.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") IsoAspect;
		const opencascade::handle<Prs3d_LineAspect> & IsoAspect();

		/****************** IsoDistance ******************/
		/**** md5 signature: 5dd6ae35b7e8d7aaeb1d12487ce5c534 ****/
		%feature("compactdefaultargs") IsoDistance;
		%feature("autodoc", "Returns the distance between isoparameters used in the display of planes.

Returns
-------
float
") IsoDistance;
		Standard_Real IsoDistance();

		/****************** PlaneXLength ******************/
		/**** md5 signature: 0ebee457fb0057620ba1071f8a557f59 ****/
		%feature("compactdefaultargs") PlaneXLength;
		%feature("autodoc", "Returns the length of the x axis used in the display of planes.

Returns
-------
float
") PlaneXLength;
		Standard_Real PlaneXLength();

		/****************** PlaneYLength ******************/
		/**** md5 signature: 92f20b79f985e08e22abb894369bb9d5 ****/
		%feature("compactdefaultargs") PlaneYLength;
		%feature("autodoc", "Returns the length of the y axis used in the display of planes.

Returns
-------
float
") PlaneYLength;
		Standard_Real PlaneYLength();

		/****************** SetArrowsAngle ******************/
		/**** md5 signature: 81a299b629366fc787a03cf3c0addc7c ****/
		%feature("compactdefaultargs") SetArrowsAngle;
		%feature("autodoc", "Sets the angle of the arrowhead used in the display of arrows involved in the presentation of planes.

Parameters
----------
theAngle: float

Returns
-------
None
") SetArrowsAngle;
		void SetArrowsAngle(const Standard_Real theAngle);

		/****************** SetArrowsLength ******************/
		/**** md5 signature: ca40ac1a3c3df178050aad5bc0d07e17 ****/
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLength: float

Returns
-------
None
") SetArrowsLength;
		void SetArrowsLength(const Standard_Real theLength);

		/****************** SetArrowsSize ******************/
		/**** md5 signature: 9b9cec88c84a3be7c103fc1f8ca81f5c ****/
		%feature("compactdefaultargs") SetArrowsSize;
		%feature("autodoc", "Sets the angle of the arrowhead used in the display of planes.

Parameters
----------
theSize: float

Returns
-------
None
") SetArrowsSize;
		void SetArrowsSize(const Standard_Real theSize);

		/****************** SetDisplayCenterArrow ******************/
		/**** md5 signature: 565cfca1cbb382aeb22c48a18cc9d000 ****/
		%feature("compactdefaultargs") SetDisplayCenterArrow;
		%feature("autodoc", "Sets the display attributes defined in displaycenterarrow to active.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDisplayCenterArrow;
		void SetDisplayCenterArrow(const Standard_Boolean theToDraw);

		/****************** SetDisplayEdges ******************/
		/**** md5 signature: 4aa2e1362476fe44fe3ce8047262cf32 ****/
		%feature("compactdefaultargs") SetDisplayEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDisplayEdges;
		void SetDisplayEdges(const Standard_Boolean theToDraw);

		/****************** SetDisplayEdgesArrows ******************/
		/**** md5 signature: 0bb86419876cc07708f6c1513b841778 ****/
		%feature("compactdefaultargs") SetDisplayEdgesArrows;
		%feature("autodoc", "Sets the display attributes defined in displayedgesarrows to active.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDisplayEdgesArrows;
		void SetDisplayEdgesArrows(const Standard_Boolean theToDraw);

		/****************** SetDisplayIso ******************/
		/**** md5 signature: 6a70f549b1851e6a0e6288f10d110dbc ****/
		%feature("compactdefaultargs") SetDisplayIso;
		%feature("autodoc", "Sets the display attributes defined in displayiso to active.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDisplayIso;
		void SetDisplayIso(const Standard_Boolean theToDraw);

		/****************** SetIsoDistance ******************/
		/**** md5 signature: 067b7f8b79ddcf1d22fd4f26aeef95b7 ****/
		%feature("compactdefaultargs") SetIsoDistance;
		%feature("autodoc", "Sets the distance l between isoparameters used in the display of planes.

Parameters
----------
theL: float

Returns
-------
None
") SetIsoDistance;
		void SetIsoDistance(const Standard_Real theL);

		/****************** SetPlaneLength ******************/
		/**** md5 signature: f16164e91ce1683213487473d9edee00 ****/
		%feature("compactdefaultargs") SetPlaneLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLX: float
theLY: float

Returns
-------
None
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
		/****************** Prs3d_PointAspect ******************/
		/**** md5 signature: 56f6a323546bcbaeda1938b1b532613c ****/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: Aspect_TypeOfMarker
theColor: Quantity_Color
theScale: float

Returns
-------
None
") Prs3d_PointAspect;
		 Prs3d_PointAspect(const Aspect_TypeOfMarker theType, const Quantity_Color & theColor, const Standard_Real theScale);

		/****************** Prs3d_PointAspect ******************/
		/**** md5 signature: 5bca70665a644bdd45c0abb1e025d96f ****/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "Defines the user defined marker point.

Parameters
----------
theColor: Quantity_Color
theWidth: int
theHeight: int
theTexture: TColStd_HArray1OfByte

Returns
-------
None
") Prs3d_PointAspect;
		 Prs3d_PointAspect(const Quantity_Color & theColor, const Standard_Integer theWidth, const Standard_Integer theHeight, const opencascade::handle<TColStd_HArray1OfByte> & theTexture);

		/****************** Prs3d_PointAspect ******************/
		/**** md5 signature: 5e221962e2590f7f3a9470ca4c69750a ****/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectMarker3d

Returns
-------
None
") Prs3d_PointAspect;
		 Prs3d_PointAspect(const opencascade::handle<Graphic3d_AspectMarker3d> & theAspect);

		/****************** Aspect ******************/
		/**** md5 signature: b075966b949cc604da1320178d5dfc7b ****/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Graphic3d_AspectMarker3d>
") Aspect;
		const opencascade::handle<Graphic3d_AspectMarker3d> & Aspect();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetTexture ******************/
		/**** md5 signature: 136a09247f5a3ec392ae0210becb9db4 ****/
		%feature("compactdefaultargs") GetTexture;
		%feature("autodoc", "Returns marker's texture.

Returns
-------
opencascade::handle<Graphic3d_MarkerImage>
") GetTexture;
		const opencascade::handle<Graphic3d_MarkerImage> & GetTexture();

		/****************** GetTextureSize ******************/
		/**** md5 signature: 1863448b7396bf35afa6e88b3181a485 ****/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "Returns marker's texture size.

Parameters
----------

Returns
-------
theWidth: int
theHeight: int
") GetTextureSize;
		void GetTextureSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetAspect ******************/
		/**** md5 signature: de15dd4d9d8f9fa265ac1cf2bbd0ac5c ****/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectMarker3d

Returns
-------
None
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectMarker3d> & theAspect);

		/****************** SetColor ******************/
		/**** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Defines the color to be used when drawing a point. default value: quantity_noc_yellow.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetScale ******************/
		/**** md5 signature: 85c1419c4c5459593a06ce585a34394d ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Defines the size of the marker used when drawing a point. default value: 1.

Parameters
----------
theScale: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real theScale);

		/****************** SetTypeOfMarker ******************/
		/**** md5 signature: be39bcc2898f7c9dd0438ff7bc2dcd9b ****/
		%feature("compactdefaultargs") SetTypeOfMarker;
		%feature("autodoc", "Defines the type of representation to be used when drawing a point. default value: aspect_tom_plus.

Parameters
----------
theType: Aspect_TypeOfMarker

Returns
-------
None
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
		/****************** Prs3d_ShadingAspect ******************/
		/**** md5 signature: db222516ee8fc8ac4248112046da6126 ****/
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "Constructs an empty framework to display shading.

Returns
-------
None
") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect();

		/****************** Prs3d_ShadingAspect ******************/
		/**** md5 signature: dd594bd5c6416ab50d29290cd219d4d2 ****/
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Returns
-------
None
") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** Aspect ******************/
		/**** md5 signature: d6792358ef216cd98219869e734c5100 ****/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Returns the polygons aspect properties.

Returns
-------
opencascade::handle<Graphic3d_AspectFillArea3d>
") Aspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & Aspect();

		/****************** Color ******************/
		/**** md5 signature: 26e5db46bf56238619ef2f5db63c0374 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the polygons color.

Parameters
----------
aModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_FRONT_SIDE

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color & Color(const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Material ******************/
		/**** md5 signature: 5931f39cda36847ef31b8a02dd06c896 ****/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Returns the polygons material aspect.

Parameters
----------
aModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_FRONT_SIDE

Returns
-------
Graphic3d_MaterialAspect
") Material;
		const Graphic3d_MaterialAspect & Material(const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);

		/****************** SetAspect ******************/
		/**** md5 signature: 4457b3b38d09a7c88bae5cde283658a2 ****/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Returns
-------
None
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** SetColor ******************/
		/**** md5 signature: 4b2ccc4c88ce1c8c4d5c30e53722d1c0 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Change the polygons interior color and material ambient color.

Parameters
----------
aColor: Quantity_Color
aModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_BOTH_SIDE

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetMaterial ******************/
		/**** md5 signature: eadb7c7b0b749513719b149451620b03 ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Change the polygons material aspect.

Parameters
----------
aMaterial: Graphic3d_MaterialAspect
aModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_BOTH_SIDE

Returns
-------
None
") SetMaterial;
		void SetMaterial(const Graphic3d_MaterialAspect & aMaterial, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetTransparency ******************/
		/**** md5 signature: 4ff15759dcf949cd3e818917c15b9459 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Change the polygons transparency value. warning : avalue must be in the range 0,1. 0 is the default (no transparent).

Parameters
----------
aValue: float
aModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_BOTH_SIDE

Returns
-------
None
") SetTransparency;
		void SetTransparency(const Standard_Real aValue, const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****************** Transparency ******************/
		/**** md5 signature: f11c84451e1571f76cb27f2a24dfcac3 ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Returns the polygons transparency value.

Parameters
----------
aModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_FRONT_SIDE

Returns
-------
float
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
		/****************** Prs3d_TextAspect ******************/
		/**** md5 signature: d32ac8ef92b4764ff16ee6d86a462b84 ****/
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", "Constructs an empty framework for defining display attributes of text.

Returns
-------
None
") Prs3d_TextAspect;
		 Prs3d_TextAspect();

		/****************** Prs3d_TextAspect ******************/
		/**** md5 signature: 9454273939c19a35102b91f621ad98aa ****/
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectText3d

Returns
-------
None
") Prs3d_TextAspect;
		 Prs3d_TextAspect(const opencascade::handle<Graphic3d_AspectText3d> & theAspect);

		/****************** Angle ******************/
		/**** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Aspect ******************/
		/**** md5 signature: f1838eaa82eb3030f8e2c594c3f7547e ****/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Returns the purely textual attributes used in the display of text. these include: - color - font - height/width ratio, that is, the expansion factor, and - space between characters.

Returns
-------
opencascade::handle<Graphic3d_AspectText3d>
") Aspect;
		const opencascade::handle<Graphic3d_AspectText3d> & Aspect();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Height ******************/
		/**** md5 signature: e5e3c5b90c971d7ac0e43c341f82b9e0 ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Returns the height of the text box.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** HorizontalJustification ******************/
		/**** md5 signature: 5a4fffadc6e767f23cf6c215227c4b32 ****/
		%feature("compactdefaultargs") HorizontalJustification;
		%feature("autodoc", "Returns the horizontal alignment of the text. the range of values includes: - left - center - right, and - normal (justified).

Returns
-------
Graphic3d_HorizontalTextAlignment
") HorizontalJustification;
		Graphic3d_HorizontalTextAlignment HorizontalJustification();

		/****************** Orientation ******************/
		/**** md5 signature: e104ae6956bd3f616f6f24fe4068b879 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the text. text can be displayed in the following directions: - up - down - left, or - right.

Returns
-------
Graphic3d_TextPath
") Orientation;
		Graphic3d_TextPath Orientation();

		/****************** SetAngle ******************/
		/**** md5 signature: 76a49ca25a7aa0cf5ba05b3c533fe78e ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "Sets the angle.

Parameters
----------
theAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real theAngle);

		/****************** SetAspect ******************/
		/**** md5 signature: de716cb17919b9d72659f26039b080ed ****/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Graphic3d_AspectText3d

Returns
-------
None
") SetAspect;
		void SetAspect(const opencascade::handle<Graphic3d_AspectText3d> & theAspect);

		/****************** SetColor ******************/
		/**** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the color of the type used in text display.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetFont ******************/
		/**** md5 signature: 61d12f4a548c85ea1d3fd6a76e34b6f6 ****/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "Sets the font used in text display.

Parameters
----------
theFont: char *

Returns
-------
None
") SetFont;
		void SetFont(const char * theFont);

		/****************** SetHeight ******************/
		/**** md5 signature: 052437153b834706be1197300ee007be ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "Sets the height of the text.

Parameters
----------
theHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real theHeight);

		/****************** SetHorizontalJustification ******************/
		/**** md5 signature: d13a7ed85e481556617d406511c20750 ****/
		%feature("compactdefaultargs") SetHorizontalJustification;
		%feature("autodoc", "Sets horizontal alignment of text.

Parameters
----------
theJustification: Graphic3d_HorizontalTextAlignment

Returns
-------
None
") SetHorizontalJustification;
		void SetHorizontalJustification(const Graphic3d_HorizontalTextAlignment theJustification);

		/****************** SetOrientation ******************/
		/**** md5 signature: fa084966a71ce2ccc53aca96fb5ea72a ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Sets the orientation of text.

Parameters
----------
theOrientation: Graphic3d_TextPath

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Graphic3d_TextPath theOrientation);

		/****************** SetVerticalJustification ******************/
		/**** md5 signature: b5a08c20180045c046834ffe855d66ae ****/
		%feature("compactdefaultargs") SetVerticalJustification;
		%feature("autodoc", "Sets the vertical alignment of text.

Parameters
----------
theJustification: Graphic3d_VerticalTextAlignment

Returns
-------
None
") SetVerticalJustification;
		void SetVerticalJustification(const Graphic3d_VerticalTextAlignment theJustification);

		/****************** VerticalJustification ******************/
		/**** md5 signature: 49f5776e0dd6047a65b098fb1da8438c ****/
		%feature("compactdefaultargs") VerticalJustification;
		%feature("autodoc", "Returns the vertical alignment of the text. the range of values includes: - normal - top - cap - half - base - bottom.

Returns
-------
Graphic3d_VerticalTextAlignment
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
		/****************** Prs3d_ToolCylinder ******************/
		/**** md5 signature: a0078429be42ebfbc0c4d2d7cd2a64c1 ****/
		%feature("compactdefaultargs") Prs3d_ToolCylinder;
		%feature("autodoc", "Initializes the algorithm creating a cylinder. @param thebottomrad [in] cylinder bottom radius @param thetoprad [in] cylinder top radius @param theheight [in] cylinder height @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolCylinder;
		 Prs3d_ToolCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Create ******************/
		/**** md5 signature: 13768f849e92213eb84bca75772c907d ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface and return a filled array. @param thebottomrad [in] cylinder bottom radius @param thetoprad [in] cylinder top radius @param theheight [in] cylinder height @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
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
		/****************** Prs3d_ToolDisk ******************/
		/**** md5 signature: 5106660590090ab9bf0b6e40023ae2c4 ****/
		%feature("compactdefaultargs") Prs3d_ToolDisk;
		%feature("autodoc", "Initializes the algorithm creating a disk. @param theinnerradius [in] inner disk radius @param theouterradius [in] outer disk radius @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theInnerRadius: float
theOuterRadius: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolDisk;
		 Prs3d_ToolDisk(const Standard_Real theInnerRadius, const Standard_Real theOuterRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Create ******************/
		/**** md5 signature: 5ecf369558d3c3c5b58970d367036258 ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface. @param theinnerradius [in] inner disc radius @param theouterradius [in] outer disc radius @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theInnerRadius: float
theOuterRadius: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theInnerRadius, const Standard_Real theOuterRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****************** SetAngleRange ******************/
		/**** md5 signature: 8cba406fe6dc42c10e17d05c4656eda9 ****/
		%feature("compactdefaultargs") SetAngleRange;
		%feature("autodoc", "Set angle range in radians [0, 2*pi] by default. @param thestartangle [in] start angle in counter clockwise order @param theendangle [in] end angle in counter clockwise order.

Parameters
----------
theStartAngle: float
theEndAngle: float

Returns
-------
None
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
		/****************** Prs3d_ToolSector ******************/
		/**** md5 signature: 077e30551d2b7fff0a377a40b6504a0f ****/
		%feature("compactdefaultargs") Prs3d_ToolSector;
		%feature("autodoc", "Initializes the algorithm creating a sector (quadrant). @param theradius [in] sector radius @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolSector;
		 Prs3d_ToolSector(const Standard_Real theRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Create ******************/
		/**** md5 signature: f383fdd95c4d52d12685500a764da048 ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface. @param theradius [in] sector radius @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
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
		/****************** Prs3d_ToolSphere ******************/
		/**** md5 signature: 512c4ee62ddac02d40e1d19c91dfd749 ****/
		%feature("compactdefaultargs") Prs3d_ToolSphere;
		%feature("autodoc", "Initializes the algorithm creating a sphere. @param theradius [in] sphere radius @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolSphere;
		 Prs3d_ToolSphere(const Standard_Real theRadius, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Create ******************/
		/**** md5 signature: f383fdd95c4d52d12685500a764da048 ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface. @param theradius [in] sphere radius @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theRadius: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
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
		/****************** Prs3d_ToolTorus ******************/
		/**** md5 signature: 8a652d1c1c7e4d1a50eee4b129851dbc ****/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "Initializes the algorithm creating a complete torus. @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theMajorRad: float
theMinorRad: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Prs3d_ToolTorus ******************/
		/**** md5 signature: 2accee27f8defef2bfbc627df25e1f15 ****/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "Initializes the algorithm creating a torus pipe segment. @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param theangle [in] angle to create a torus pipe segment @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Prs3d_ToolTorus ******************/
		/**** md5 signature: 7993686707597a46b2d0f4ec645c5d95 ****/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "Initializes the algorithm creating a torus ring segment. @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param theangle1 [in] first angle to create a torus ring segment @param theangle2 [in] second angle to create a torus ring segment @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle1: float
theAngle2: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle1, const Standard_Real theAngle2, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Prs3d_ToolTorus ******************/
		/**** md5 signature: 71ca9f767c504cae9394d92ff59f012b ****/
		%feature("compactdefaultargs") Prs3d_ToolTorus;
		%feature("autodoc", "Initializes the algorithm creating a torus ring segment. @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param theangle1 [in] first angle to create a torus ring segment @param theangle2 [in] second angle to create a torus ring segment @param theangle [in] angle to create a torus pipe segment @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter.

Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle1: float
theAngle2: float
theAngle: float
theNbSlices: int
theNbStacks: int

Returns
-------
None
") Prs3d_ToolTorus;
		 Prs3d_ToolTorus(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle1, const Standard_Real theAngle2, const Standard_Real theAngle, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks);

		/****************** Create ******************/
		/**** md5 signature: 07e9f2ec71b87fc6919fefde93de32fa ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface (complete torus). @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theMajorRad: float
theMinorRad: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****************** Create ******************/
		/**** md5 signature: 3348019fdf3fab6b27a846084af219b5 ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface (torus segment). @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param theangle [in] angle to create a torus pipe segment @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****************** Create ******************/
		/**** md5 signature: b40020a7ec87651ff79ed79b9036743d ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface (torus ring segment). @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param theangle1 [in] first angle to create a torus ring segment @param theangle2 [in] second angle to create a torus ring segment @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

Parameters
----------
theMajorRad: float
theMinorRad: float
theAngle1: float
theAngle2: float
theNbSlices: int
theNbStacks: int
theTrsf: gp_Trsf

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create(const Standard_Real theMajorRad, const Standard_Real theMinorRad, const Standard_Real theAngle1, const Standard_Real theAngle2, const Standard_Integer theNbSlices, const Standard_Integer theNbStacks, const gp_Trsf & theTrsf);

		/****************** Create ******************/
		/**** md5 signature: 0197847161c119b751c8a39e51506651 ****/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface (segment of the torus ring segment). @param themajorrad [in] distance from the center of the pipe to the center of the torus @param theminorrad [in] radius of the pipe @param theangle1 [in] first angle to create a torus ring segment @param theangle2 [in] second angle to create a torus ring segment @param theangle [in] angle to create a torus pipe segment @param thenbslices [in] number of slices within u parameter @param thenbstacks [in] number of stacks within v parameter @param thetrsf [in] optional transformation to apply returns generated triangulation.

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

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
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
		/****************** Prs3d_IsoAspect ******************/
		/**** md5 signature: 20cefbd9d7de79b5d91df215a7381425 ****/
		%feature("compactdefaultargs") Prs3d_IsoAspect;
		%feature("autodoc", "Constructs a framework to define display attributes of isoparameters. these include: - the color attribute acolor - the type of line atype - the width value awidth - anumber, the number of isoparameters to be displayed.

Parameters
----------
theColor: Quantity_Color
theType: Aspect_TypeOfLine
theWidth: float
theNumber: int

Returns
-------
None
") Prs3d_IsoAspect;
		 Prs3d_IsoAspect(const Quantity_Color & theColor, const Aspect_TypeOfLine theType, const Standard_Real theWidth, const Standard_Integer theNumber);

		/****************** Number ******************/
		/**** md5 signature: 783fc82a0927a26fa0826e4fe2a7ebe6 ****/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns the number of u or v isoparametric curves drawn for a single face.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** SetNumber ******************/
		/**** md5 signature: c8bd8ca751df6f1dad0f528a62fe2912 ****/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "Defines the number of u or v isoparametric curves to be drawn for a single face. default value: 10.

Parameters
----------
theNumber: int

Returns
-------
None
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
