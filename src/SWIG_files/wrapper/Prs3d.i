/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_prs3d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Prs3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<Graphic3d_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<Aspect_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TopLoc_module.hxx>
#include<Poly_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import Graphic3d.i
%import TopoDS.i
%import gp.i
%import TCollection.i
%import GeomAbs.i
%import Aspect.i
%import HLRAlgo.i
%import TopLoc.i
%import Poly.i
%import Bnd.i
%import TopTools.i
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
	Prs3d_DA_XAxisLength = 0,
	Prs3d_DA_YAxisLength = 1,
	Prs3d_DA_ZAxisLength = 2,
	Prs3d_DP_ShadingTubeRadiusPercent = 3,
	Prs3d_DP_ShadingConeRadiusPercent = 4,
	Prs3d_DP_ShadingConeLengthPercent = 5,
	Prs3d_DP_ShadingOriginRadiusPercent = 6,
	Prs3d_DP_ShadingNumberOfFacettes = 7,
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
	Prs3d_DA_XAxis = 1,
	Prs3d_DA_YAxis = 2,
	Prs3d_DA_ZAxis = 4,
	Prs3d_DA_XYAxis = Prs3d_DA_XAxis | Prs3d_DA_YAxis,
	Prs3d_DA_YZAxis = Prs3d_DA_YAxis | Prs3d_DA_ZAxis,
	Prs3d_DA_XZAxis = Prs3d_DA_XAxis | Prs3d_DA_ZAxis,
	Prs3d_DA_XYZAxis = Prs3d_DA_XAxis | Prs3d_DA_YAxis | Prs3d_DA_ZAxis,
};

enum Prs3d_DatumParts {
	Prs3d_DP_Origin = 0,
	Prs3d_DP_XAxis = 1,
	Prs3d_DP_YAxis = 2,
	Prs3d_DP_ZAxis = 3,
	Prs3d_DP_XArrow = 4,
	Prs3d_DP_YArrow = 5,
	Prs3d_DP_ZArrow = 6,
	Prs3d_DP_XOYAxis = 7,
	Prs3d_DP_YOZAxis = 8,
	Prs3d_DP_XOZAxis = 9,
	Prs3d_DP_None = 10,
};

enum Prs3d_DimensionArrowOrientation {
	Prs3d_DAO_Internal = 0,
	Prs3d_DAO_External = 1,
	Prs3d_DAO_Fit = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
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
	Prs3d_DA_XAxisLength = 0
	Prs3d_DA_YAxisLength = 1
	Prs3d_DA_ZAxisLength = 2
	Prs3d_DP_ShadingTubeRadiusPercent = 3
	Prs3d_DP_ShadingConeRadiusPercent = 4
	Prs3d_DP_ShadingConeLengthPercent = 5
	Prs3d_DP_ShadingOriginRadiusPercent = 6
	Prs3d_DP_ShadingNumberOfFacettes = 7
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
	Prs3d_DA_XAxis = 1
	Prs3d_DA_YAxis = 2
	Prs3d_DA_ZAxis = 4
	Prs3d_DA_XYAxis = Prs3d_DA_XAxis | Prs3d_DA_YAxis
	Prs3d_DA_YZAxis = Prs3d_DA_YAxis | Prs3d_DA_ZAxis
	Prs3d_DA_XZAxis = Prs3d_DA_XAxis | Prs3d_DA_ZAxis
	Prs3d_DA_XYZAxis = Prs3d_DA_XAxis | Prs3d_DA_YAxis | Prs3d_DA_ZAxis
Prs3d_DA_XAxis = Prs3d_DatumAxes.Prs3d_DA_XAxis
Prs3d_DA_YAxis = Prs3d_DatumAxes.Prs3d_DA_YAxis
Prs3d_DA_ZAxis = Prs3d_DatumAxes.Prs3d_DA_ZAxis
Prs3d_DA_XYAxis = Prs3d_DatumAxes.Prs3d_DA_XYAxis
Prs3d_DA_YZAxis = Prs3d_DatumAxes.Prs3d_DA_YZAxis
Prs3d_DA_XZAxis = Prs3d_DatumAxes.Prs3d_DA_XZAxis
Prs3d_DA_XYZAxis = Prs3d_DatumAxes.Prs3d_DA_XYZAxis

class Prs3d_DatumParts(IntEnum):
	Prs3d_DP_Origin = 0
	Prs3d_DP_XAxis = 1
	Prs3d_DP_YAxis = 2
	Prs3d_DP_ZAxis = 3
	Prs3d_DP_XArrow = 4
	Prs3d_DP_YArrow = 5
	Prs3d_DP_ZArrow = 6
	Prs3d_DP_XOYAxis = 7
	Prs3d_DP_YOZAxis = 8
	Prs3d_DP_XOZAxis = 9
	Prs3d_DP_None = 10
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
%wrap_handle(Prs3d_Projector)
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
typedef Prs3d_Drawer Graphic3d_HighlightStyle;
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
		/****************** AddPrimitivesGroup ******************/
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
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "Computes the absolute deflection value depending on the type of deflection in thedrawer: <ul> <li><b>aspect_tod_relative</b>: the absolute deflection is computed using the relative deviation coefficient from thedrawer and the shape's bounding box;</li> <li><b>aspect_tod_absolute</b>: the maximal chordial deviation from thedrawer is returned.</li> </ul> in case of the type of deflection in thedrawer computed relative deflection for shape is stored as absolute deflection. it is necessary to use it later on for sub-shapes. this function should always be used to compute the deflection value for building discrete representations of the shape (triangualtion, wireframe) to avoid incosistencies between different representations of the shape and undesirable visual artifacts.

Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
float
") GetDeflection;
		static Standard_Real GetDeflection(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** MatchSegment ******************/
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
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "Default constructor. sets meters as default length units and radians as default angle units.

Returns
-------
None
") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits();

		/****************** Prs3d_DimensionUnits ******************/
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
		%feature("compactdefaultargs") GetAngleUnits;
		%feature("autodoc", "Returns angle units.

Returns
-------
TCollection_AsciiString
") GetAngleUnits;
		const TCollection_AsciiString & GetAngleUnits();

		/****************** GetLengthUnits ******************/
		%feature("compactdefaultargs") GetLengthUnits;
		%feature("autodoc", "Returns length units.

Returns
-------
TCollection_AsciiString
") GetLengthUnits;
		const TCollection_AsciiString & GetLengthUnits();

		/****************** SetAngleUnits ******************/
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
		%feature("compactdefaultargs") Prs3d_Drawer;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") Prs3d_Drawer;
		 Prs3d_Drawer();

		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns the attributes for display of arrows.

Returns
-------
opencascade::handle<Prs3d_ArrowAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****************** ClearLocalAttributes ******************/
		%feature("compactdefaultargs") ClearLocalAttributes;
		%feature("autodoc", "Removes local attributes. .

Returns
-------
None
") ClearLocalAttributes;
		void ClearLocalAttributes();

		/****************** DatumAspect ******************/
		%feature("compactdefaultargs") DatumAspect;
		%feature("autodoc", "Returns settings for the appearance of datums. these settings can be edited. the default values for the three axes are: color: quantity_noc_peachpuff type of line: aspect_tol_solid width: 1.0.

Returns
-------
opencascade::handle<Prs3d_DatumAspect>
") DatumAspect;
		const opencascade::handle<Prs3d_DatumAspect> & DatumAspect();

		/****************** DeviationAngle ******************/
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "Returns the value for deviation angle.

Returns
-------
float
") DeviationAngle;
		Standard_Real DeviationAngle();

		/****************** DeviationCoefficient ******************/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "Returns the deviation coefficient. drawings of curves or patches are made with respect to a maximal chordal deviation. a deviation coefficient is used in the shading display mode. the shape is seen decomposed into triangles. these are used to calculate reflection of light from the surface of the object. the triangles are formed from chords of the curves in the shape. the deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. if this limit is reached, a new triangle is begun. this deviation is absolute and is set through the method: setmaximalchordialdeviation. the default value is 0.001. in drawing shapes, however, you are allowed to ask for a relative deviation. this deviation will be: sizeofobject * deviationcoefficient.

Returns
-------
float
") DeviationCoefficient;
		Standard_Real DeviationCoefficient();

		/****************** DimAngleDisplayUnits ******************/
		%feature("compactdefaultargs") DimAngleDisplayUnits;
		%feature("autodoc", "Returns angle units in which dimension presentation is displayed.

Returns
-------
TCollection_AsciiString
") DimAngleDisplayUnits;
		const TCollection_AsciiString & DimAngleDisplayUnits();

		/****************** DimAngleModelUnits ******************/
		%feature("compactdefaultargs") DimAngleModelUnits;
		%feature("autodoc", "Returns angle model units for the dimension presentation. .

Returns
-------
TCollection_AsciiString
") DimAngleModelUnits;
		const TCollection_AsciiString & DimAngleModelUnits();

		/****************** DimLengthDisplayUnits ******************/
		%feature("compactdefaultargs") DimLengthDisplayUnits;
		%feature("autodoc", "Returns length units in which dimension presentation is displayed.

Returns
-------
TCollection_AsciiString
") DimLengthDisplayUnits;
		const TCollection_AsciiString & DimLengthDisplayUnits();

		/****************** DimLengthModelUnits ******************/
		%feature("compactdefaultargs") DimLengthModelUnits;
		%feature("autodoc", "Returns length model units for the dimension presentation. .

Returns
-------
TCollection_AsciiString
") DimLengthModelUnits;
		const TCollection_AsciiString & DimLengthModelUnits();

		/****************** DimensionAspect ******************/
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "Returns settings for the appearance of dimensions. .

Returns
-------
opencascade::handle<Prs3d_DimensionAspect>
") DimensionAspect;
		const opencascade::handle<Prs3d_DimensionAspect> & DimensionAspect();

		/****************** DisableDrawHiddenLine ******************/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "Disables the drawhiddenline function.

Returns
-------
None
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****************** Discretisation ******************/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "Returns the discretisation setting. .

Returns
-------
int
") Discretisation;
		Standard_Integer Discretisation();

		/****************** DrawHiddenLine ******************/
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
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "Enables the drawhiddenline function.

Returns
-------
None
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****************** FaceBoundaryAspect ******************/
		%feature("compactdefaultargs") FaceBoundaryAspect;
		%feature("autodoc", "Returns line aspect of face boundaries.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") FaceBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FaceBoundaryAspect();

		/****************** FaceBoundaryDraw ******************/
		%feature("compactdefaultargs") FaceBoundaryDraw;
		%feature("autodoc", "Checks whether the face boundary drawing is enabled or not.

Returns
-------
bool
") FaceBoundaryDraw;
		Standard_Boolean FaceBoundaryDraw();

		/****************** FaceBoundaryUpperContinuity ******************/
		%feature("compactdefaultargs") FaceBoundaryUpperContinuity;
		%feature("autodoc", "Get the most edge continuity class; geomabs_cn by default (all edges).

Returns
-------
GeomAbs_Shape
") FaceBoundaryUpperContinuity;
		GeomAbs_Shape FaceBoundaryUpperContinuity();

		/****************** FreeBoundaryAspect ******************/
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "Returns the values for presentation of free boundaries, in other words, boundaries which are not shared. the lineaspect for the free boundaries can be edited. the default values are: color: quantity_noc_green type of line: aspect_tol_solid width: 1.0 these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") FreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FreeBoundaryAspect();

		/****************** FreeBoundaryDraw ******************/
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawing of the free boundaries is enabled true is the default setting.

Returns
-------
bool
") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw();

		/****************** HLRAngle ******************/
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "Returns the real number value of the deviation angle in hidden line removal views. the default value is 20 * m_pi / 180.

Returns
-------
float
") HLRAngle;
		Standard_Real HLRAngle();

		/****************** HLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") HLRDeviationCoefficient;
		%feature("autodoc", "Returns the real number value of the hidden line removal deviation coefficient in this framework, if the flag hasownhlrdeviationcoefficient is true or there is no link. else the shape's hlr deviation coefficient is used. a deviation coefficient is used in the shading display mode. the shape is seen decomposed into triangles. these are used to calculate reflection of light from the surface of the object. the triangles are formed from chords of the curves in the shape. the deviation coefficient give the highest value of the angle with which a chord can deviate from a tangent to a curve. if this limit is reached, a new triangle is begun. to find the hidden lines, hidden line display mode entails recalculation of the view at each different projector perspective. since hidden lines entail calculations of more than usual complexity to decompose them into these triangles, a deviation coefficient allowing greater tolerance is used. this increases efficiency in calculation. the default value is 0.02.

Returns
-------
float
") HLRDeviationCoefficient;
		Standard_Real HLRDeviationCoefficient();

		/****************** HasLink ******************/
		%feature("compactdefaultargs") HasLink;
		%feature("autodoc", "Returns true if the current object has a link on the other drawer.

Returns
-------
bool
") HasLink;
		Standard_Boolean HasLink();

		/****************** HasOwnArrowAspect ******************/
		%feature("compactdefaultargs") HasOwnArrowAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for arrow aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnArrowAspect;
		Standard_Boolean HasOwnArrowAspect();

		/****************** HasOwnDatumAspect ******************/
		%feature("compactdefaultargs") HasOwnDatumAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for datum aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnDatumAspect;
		Standard_Boolean HasOwnDatumAspect();

		/****************** HasOwnDeviationAngle ******************/
		%feature("compactdefaultargs") HasOwnDeviationAngle;
		%feature("autodoc", "Returns true if the there is a local setting for deviation angle in this framework for a specific interactive object.

Returns
-------
bool
") HasOwnDeviationAngle;
		Standard_Boolean HasOwnDeviationAngle();

		/****************** HasOwnDeviationCoefficient ******************/
		%feature("compactdefaultargs") HasOwnDeviationCoefficient;
		%feature("autodoc", "Returns true if there is a local setting for deviation coefficient in this framework for a specific interactive object.

Returns
-------
bool
") HasOwnDeviationCoefficient;
		Standard_Boolean HasOwnDeviationCoefficient();

		/****************** HasOwnDimAngleDisplayUnits ******************/
		%feature("compactdefaultargs") HasOwnDimAngleDisplayUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for angle units in which dimension presentation is displayed that overrides the one in the link.

Returns
-------
bool
") HasOwnDimAngleDisplayUnits;
		Standard_Boolean HasOwnDimAngleDisplayUnits();

		/****************** HasOwnDimAngleModelUnits ******************/
		%feature("compactdefaultargs") HasOwnDimAngleModelUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for dimension angle model units that overrides the one in the link.

Returns
-------
bool
") HasOwnDimAngleModelUnits;
		Standard_Boolean HasOwnDimAngleModelUnits();

		/****************** HasOwnDimLengthDisplayUnits ******************/
		%feature("compactdefaultargs") HasOwnDimLengthDisplayUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for length units in which dimension presentation is displayed that overrides the one in the link.

Returns
-------
bool
") HasOwnDimLengthDisplayUnits;
		Standard_Boolean HasOwnDimLengthDisplayUnits();

		/****************** HasOwnDimLengthModelUnits ******************/
		%feature("compactdefaultargs") HasOwnDimLengthModelUnits;
		%feature("autodoc", "Returns true if the drawer has its own attribute for dimension length model units that overrides the one in the link.

Returns
-------
bool
") HasOwnDimLengthModelUnits;
		Standard_Boolean HasOwnDimLengthModelUnits();

		/****************** HasOwnDimensionAspect ******************/
		%feature("compactdefaultargs") HasOwnDimensionAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for the appearance of dimensions that overrides the one in the link.

Returns
-------
bool
") HasOwnDimensionAspect;
		Standard_Boolean HasOwnDimensionAspect();

		/****************** HasOwnDiscretisation ******************/
		%feature("compactdefaultargs") HasOwnDiscretisation;
		%feature("autodoc", "Returns true if the drawer has discretisation setting active.

Returns
-------
bool
") HasOwnDiscretisation;
		Standard_Boolean HasOwnDiscretisation();

		/****************** HasOwnDrawHiddenLine ******************/
		%feature("compactdefaultargs") HasOwnDrawHiddenLine;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw hidden lines' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnDrawHiddenLine;
		Standard_Boolean HasOwnDrawHiddenLine();

		/****************** HasOwnFaceBoundaryAspect ******************/
		%feature("compactdefaultargs") HasOwnFaceBoundaryAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for face boundaries aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnFaceBoundaryAspect;
		Standard_Boolean HasOwnFaceBoundaryAspect();

		/****************** HasOwnFaceBoundaryDraw ******************/
		%feature("compactdefaultargs") HasOwnFaceBoundaryDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw face boundaries' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnFaceBoundaryDraw;
		Standard_Boolean HasOwnFaceBoundaryDraw();

		/****************** HasOwnFaceBoundaryUpperContinuity ******************/
		%feature("compactdefaultargs") HasOwnFaceBoundaryUpperContinuity;
		%feature("autodoc", "Returns true if the drawer has its own attribute for face boundaries upper edge continuity class that overrides the one in the link.

Returns
-------
bool
") HasOwnFaceBoundaryUpperContinuity;
		Standard_Boolean HasOwnFaceBoundaryUpperContinuity();

		/****************** HasOwnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") HasOwnFreeBoundaryAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for free boundaries aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnFreeBoundaryAspect;
		Standard_Boolean HasOwnFreeBoundaryAspect();

		/****************** HasOwnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") HasOwnFreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw free boundaries' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnFreeBoundaryDraw;
		Standard_Boolean HasOwnFreeBoundaryDraw();

		/****************** HasOwnHLRDeviationAngle ******************/
		%feature("compactdefaultargs") HasOwnHLRDeviationAngle;
		%feature("autodoc", "Returns true if the there is a setting for hlr deviation angle in this framework for a specific interactive object.

Returns
-------
bool
") HasOwnHLRDeviationAngle;
		Standard_Boolean HasOwnHLRDeviationAngle();

		/****************** HasOwnHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") HasOwnHLRDeviationCoefficient;
		%feature("autodoc", "Returns true if the there is a setting for hlr deviation coefficient in this framework for a specific interactive object.

Returns
-------
bool
") HasOwnHLRDeviationCoefficient;
		Standard_Boolean HasOwnHLRDeviationCoefficient();

		/****************** HasOwnHiddenLineAspect ******************/
		%feature("compactdefaultargs") HasOwnHiddenLineAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for hidden lines aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnHiddenLineAspect;
		Standard_Boolean HasOwnHiddenLineAspect();

		/****************** HasOwnIsAutoTriangulation ******************/
		%feature("compactdefaultargs") HasOwnIsAutoTriangulation;
		%feature("autodoc", "Returns true if the drawer has isoonplane setting active.

Returns
-------
bool
") HasOwnIsAutoTriangulation;
		Standard_Boolean HasOwnIsAutoTriangulation();

		/****************** HasOwnIsoOnPlane ******************/
		%feature("compactdefaultargs") HasOwnIsoOnPlane;
		%feature("autodoc", "Returns true if the drawer has isoonplane setting active.

Returns
-------
bool
") HasOwnIsoOnPlane;
		Standard_Boolean HasOwnIsoOnPlane();

		/****************** HasOwnIsoOnTriangulation ******************/
		%feature("compactdefaultargs") HasOwnIsoOnTriangulation;
		%feature("autodoc", "Returns true if the drawer has isoontriangulation setting active.

Returns
-------
bool
") HasOwnIsoOnTriangulation;
		Standard_Boolean HasOwnIsoOnTriangulation();

		/****************** HasOwnLineArrowDraw ******************/
		%feature("compactdefaultargs") HasOwnLineArrowDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw arrow' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnLineArrowDraw;
		Standard_Boolean HasOwnLineArrowDraw();

		/****************** HasOwnLineAspect ******************/
		%feature("compactdefaultargs") HasOwnLineAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for line aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnLineAspect;
		Standard_Boolean HasOwnLineAspect();

		/****************** HasOwnMaximalChordialDeviation ******************/
		%feature("compactdefaultargs") HasOwnMaximalChordialDeviation;
		%feature("autodoc", "Returns true if the drawer has a maximal chordial deviation setting active.

Returns
-------
bool
") HasOwnMaximalChordialDeviation;
		Standard_Boolean HasOwnMaximalChordialDeviation();

		/****************** HasOwnMaximalParameterValue ******************/
		%feature("compactdefaultargs") HasOwnMaximalParameterValue;
		%feature("autodoc", "Returns true if the drawer has a maximum value allowed for the first and last parameters of an infinite curve setting active.

Returns
-------
bool
") HasOwnMaximalParameterValue;
		Standard_Boolean HasOwnMaximalParameterValue();

		/****************** HasOwnPlaneAspect ******************/
		%feature("compactdefaultargs") HasOwnPlaneAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for plane aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnPlaneAspect;
		Standard_Boolean HasOwnPlaneAspect();

		/****************** HasOwnPointAspect ******************/
		%feature("compactdefaultargs") HasOwnPointAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for point aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnPointAspect;
		Standard_Boolean HasOwnPointAspect();

		/****************** HasOwnSectionAspect ******************/
		%feature("compactdefaultargs") HasOwnSectionAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for section aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnSectionAspect;
		Standard_Boolean HasOwnSectionAspect();

		/****************** HasOwnSeenLineAspect ******************/
		%feature("compactdefaultargs") HasOwnSeenLineAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for seen line aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnSeenLineAspect;
		Standard_Boolean HasOwnSeenLineAspect();

		/****************** HasOwnShadingAspect ******************/
		%feature("compactdefaultargs") HasOwnShadingAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for shading aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnShadingAspect;
		Standard_Boolean HasOwnShadingAspect();

		/****************** HasOwnTextAspect ******************/
		%feature("compactdefaultargs") HasOwnTextAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for text aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnTextAspect;
		Standard_Boolean HasOwnTextAspect();

		/****************** HasOwnTypeOfDeflection ******************/
		%feature("compactdefaultargs") HasOwnTypeOfDeflection;
		%feature("autodoc", "Returns true if the drawer has a type of deflection setting active.

Returns
-------
bool
") HasOwnTypeOfDeflection;
		Standard_Boolean HasOwnTypeOfDeflection();

		/****************** HasOwnTypeOfHLR ******************/
		%feature("compactdefaultargs") HasOwnTypeOfHLR;
		%feature("autodoc", "Returns true if the type of hlr is not equal to prs3d_toh_notset.

Returns
-------
bool
") HasOwnTypeOfHLR;
		Standard_Boolean HasOwnTypeOfHLR();

		/****************** HasOwnUIsoAspect ******************/
		%feature("compactdefaultargs") HasOwnUIsoAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for uiso aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnUIsoAspect;
		Standard_Boolean HasOwnUIsoAspect();

		/****************** HasOwnUnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for unfree boundaries aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnUnFreeBoundaryAspect;
		Standard_Boolean HasOwnUnFreeBoundaryAspect();

		/****************** HasOwnUnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw shared boundaries' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnUnFreeBoundaryDraw;
		Standard_Boolean HasOwnUnFreeBoundaryDraw();

		/****************** HasOwnVIsoAspect ******************/
		%feature("compactdefaultargs") HasOwnVIsoAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for viso aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnVIsoAspect;
		Standard_Boolean HasOwnVIsoAspect();

		/****************** HasOwnVectorAspect ******************/
		%feature("compactdefaultargs") HasOwnVectorAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for vector aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnVectorAspect;
		Standard_Boolean HasOwnVectorAspect();

		/****************** HasOwnVertexDrawMode ******************/
		%feature("compactdefaultargs") HasOwnVertexDrawMode;
		%feature("autodoc", "Returns true if the vertex draw mode is not equal to <b>prs3d_vdm_inherited</b>. this means that individual vertex draw mode value (i.e. not inherited from the global drawer) is used for a specific interactive object.

Returns
-------
bool
") HasOwnVertexDrawMode;
		Standard_Boolean HasOwnVertexDrawMode();

		/****************** HasOwnWireAspect ******************/
		%feature("compactdefaultargs") HasOwnWireAspect;
		%feature("autodoc", "Returns true if the drawer has its own attribute for wire aspect that overrides the one in the link.

Returns
-------
bool
") HasOwnWireAspect;
		Standard_Boolean HasOwnWireAspect();

		/****************** HasOwnWireDraw ******************/
		%feature("compactdefaultargs") HasOwnWireDraw;
		%feature("autodoc", "Returns true if the drawer has its own attribute for 'draw wires' flag that overrides the one in the link.

Returns
-------
bool
") HasOwnWireDraw;
		Standard_Boolean HasOwnWireDraw();

		/****************** HiddenLineAspect ******************/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Returns settings for hidden line aspects. these settings can be edited. the default values are: color: quantity_noc_yellow type of line: aspect_tol_dash width: 1.0.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") HiddenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & HiddenLineAspect();

		/****************** IsAutoTriangulation ******************/
		%feature("compactdefaultargs") IsAutoTriangulation;
		%feature("autodoc", "Returns true if automatic triangulation is enabled.

Returns
-------
bool
") IsAutoTriangulation;
		Standard_Boolean IsAutoTriangulation();

		/****************** IsoOnPlane ******************/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Returns true if the drawing of isos on planes is enabled.

Returns
-------
bool
") IsoOnPlane;
		Standard_Boolean IsoOnPlane();

		/****************** IsoOnTriangulation ******************/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "Returns true if the drawing of isos on triangulation is enabled.

Returns
-------
bool
") IsoOnTriangulation;
		Standard_Boolean IsoOnTriangulation();

		/****************** LineArrowDraw ******************/
		%feature("compactdefaultargs") LineArrowDraw;
		%feature("autodoc", "Returns true if drawing an arrow at the end of each edge is enabled and false otherwise (the default).

Returns
-------
bool
") LineArrowDraw;
		Standard_Boolean LineArrowDraw();

		/****************** LineAspect ******************/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Returns settings for line aspects. these settings can be edited. the default values are: color: quantity_noc_yellow type of line: aspect_tol_solid width: 1.0 these attributes are used by the following algorithms: prs3d_curve prs3d_line prs3d_hlrshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect();

		/****************** Link ******************/
		%feature("compactdefaultargs") Link;
		%feature("autodoc", "Returns the drawer to which the current object references.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") Link;
		const opencascade::handle<Prs3d_Drawer> & Link();

		/****************** Link ******************/
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
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "Returns the maximal chordal deviation. the default value is 0.1. drawings of curves or patches are made with respect to an absolute maximal chordal deviation.

Returns
-------
float
") MaximalChordialDeviation;
		Standard_Real MaximalChordialDeviation();

		/****************** MaximalParameterValue ******************/
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "Sets the maximum value allowed for the first and last parameters of an infinite curve. by default, this value is 500000.

Returns
-------
float
") MaximalParameterValue;
		Standard_Real MaximalParameterValue();

		/****************** PlaneAspect ******************/
		%feature("compactdefaultargs") PlaneAspect;
		%feature("autodoc", "Returns settings for the appearance of planes.

Returns
-------
opencascade::handle<Prs3d_PlaneAspect>
") PlaneAspect;
		const opencascade::handle<Prs3d_PlaneAspect> & PlaneAspect();

		/****************** PointAspect ******************/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Returns the point aspect setting. the default values are color: quantity_noc_yellow type of marker: aspect_tom_plus scale: 1.0 these attributes are used by the algorithms prs3d_point.

Returns
-------
opencascade::handle<Prs3d_PointAspect>
") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect();

		/****************** PreviousDeviationAngle ******************/
		%feature("compactdefaultargs") PreviousDeviationAngle;
		%feature("autodoc", "Returns the previous deviation angle.

Returns
-------
float
") PreviousDeviationAngle;
		Standard_Real PreviousDeviationAngle();

		/****************** PreviousDeviationCoefficient ******************/
		%feature("compactdefaultargs") PreviousDeviationCoefficient;
		%feature("autodoc", "Saves the previous value used for the chordal deviation coefficient. .

Returns
-------
float
") PreviousDeviationCoefficient;
		Standard_Real PreviousDeviationCoefficient();

		/****************** PreviousHLRDeviationAngle ******************/
		%feature("compactdefaultargs") PreviousHLRDeviationAngle;
		%feature("autodoc", "Returns the previous value of the hlr deviation angle.

Returns
-------
float
") PreviousHLRDeviationAngle;
		Standard_Real PreviousHLRDeviationAngle();

		/****************** PreviousHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") PreviousHLRDeviationCoefficient;
		%feature("autodoc", "Returns the previous value of the hidden line removal deviation coefficient.

Returns
-------
float
") PreviousHLRDeviationCoefficient;
		Standard_Real PreviousHLRDeviationCoefficient();

		/****************** SectionAspect ******************/
		%feature("compactdefaultargs") SectionAspect;
		%feature("autodoc", "The lineaspect for the wire can be edited. the default values are: color: quantity_noc_orange type of line: aspect_tol_solid width: 1.0 these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") SectionAspect;
		const opencascade::handle<Prs3d_LineAspect> & SectionAspect();

		/****************** SeenLineAspect ******************/
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "Returns settings for seen line aspects. these settings can be edited. the default values are: color: quantity_noc_yellow type of line: aspect_tol_solid width: 1.0.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") SeenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & SeenLineAspect();

		/****************** SetArrowAspect ******************/
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
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "Sets the hasowndeviationangle flag to standard_false.

Returns
-------
None
") SetDeviationAngle;
		void SetDeviationAngle();

		/****************** SetDeviationCoefficient ******************/
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
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "Sets the hasowndeviationcoefficient flag to standard_false.

Returns
-------
None
") SetDeviationCoefficient;
		void SetDeviationCoefficient();

		/****************** SetDimAngleDisplayUnits ******************/
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
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "Sets anangle, the angle of maximum chordal deviation for removal of hidden lines created by different viewpoints in different presentations. the default value is 20 * m_pi / 180. also sets the hasownhlrdeviationangle flag to standard_true and myprevioushlrdeviationangle.

Parameters
----------
theAngle: float

Returns
-------
None
") SetHLRAngle;
		void SetHLRAngle(const Standard_Real theAngle);

		/****************** SetHLRAngle ******************/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "Sets the hasownhlrdeviationangle flag to standard_false.

Returns
-------
None
") SetHLRAngle;
		void SetHLRAngle();

		/****************** SetHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "Sets the deviation coefficient acoefficient for removal of hidden lines created by different viewpoints in different presentations. the default value is 0.02. also sets the hasownhlrdeviationcoefficient flag to standard_true and myprevioushlrdeviationcoefficient.

Parameters
----------
theCoefficient: float

Returns
-------
None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient(const Standard_Real theCoefficient);

		/****************** SetHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "Sets the hasownhlrdeviationcoefficient flag to standard_false .

Returns
-------
None
") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient();

		/****************** SetHiddenLineAspect ******************/
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
		%feature("compactdefaultargs") SetOwnLineAspects;
		%feature("autodoc", "Sets own line aspects. returns false if own line aspect are already set.

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

		/****************** SetupOwnFaceBoundaryAspect ******************/
		%feature("compactdefaultargs") SetupOwnFaceBoundaryAspect;
		%feature("autodoc", "Sets own face boundary aspect. returns false if the drawer already has its own attribute for face boundary aspect.

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
		%feature("compactdefaultargs") SetupOwnPointAspect;
		%feature("autodoc", "Sets own point aspect. returns false if the drawer already has its own attribute for point aspect.

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
		%feature("compactdefaultargs") SetupOwnShadingAspect;
		%feature("autodoc", "Sets own shading aspect. returns false if the drawer already has its own attribute for shading aspect.

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
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "Returns settings for shading aspects. these settings can be edited. the default values are: - color: quantity_noc_yellow - material: graphic3d_nom_brass shading aspect is obtained through decomposition of 3d faces into triangles, each side of each triangle being a chord of the corresponding curved edge in the face. reflection of light in each projector perspective is then calculated for each of the resultant triangular planes.

Returns
-------
opencascade::handle<Prs3d_ShadingAspect>
") ShadingAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & ShadingAspect();

		/****************** TextAspect ******************/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Returns settings for text aspect. these settings can be edited. the default value is: - color: quantity_noc_yellow.

Returns
-------
opencascade::handle<Prs3d_TextAspect>
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****************** TypeOfDeflection ******************/
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "Returns the type of chordal deflection. this indicates whether the deflection value is absolute or relative to the size of the object.

Returns
-------
Aspect_TypeOfDeflection
") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection();

		/****************** TypeOfHLR ******************/
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "Returns the type of hlr algorithm currently in use.

Returns
-------
Prs3d_TypeOfHLR
") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR();

		/****************** UIsoAspect ******************/
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "Defines the attributes which are used when drawing an u isoparametric curve of a face. defines the number of u isoparametric curves to be drawn for a single face. the lineaspect for u isoparametric lines can be edited (methods setcolor, settypeofline, setwidth, setnumber) the default values are: color : quantity_noc_gray75 type of line: aspect_tol_solid width : 0.5 //! these attributes are used by the following algorithms: prs3d_wfdeflectionsurface prs3d_wfdeflectionrestrictedface.

Returns
-------
opencascade::handle<Prs3d_IsoAspect>
") UIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & UIsoAspect();

		/****************** UnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "Returns settings for shared boundary line aspects. the lineaspect for the unfree boundaries can be edited. the default values are: color: quantity_noc_yellow type of line: aspect_tol_solid width: 1. these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") UnFreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & UnFreeBoundaryAspect();

		/****************** UnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawing of the shared boundaries is enabled. true is the default setting.

Returns
-------
bool
") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw();

		/****************** UnsetFaceBoundaryUpperContinuity ******************/
		%feature("compactdefaultargs") UnsetFaceBoundaryUpperContinuity;
		%feature("autodoc", "Unset the most edge continuity class for face boundaries.

Returns
-------
None
") UnsetFaceBoundaryUpperContinuity;
		void UnsetFaceBoundaryUpperContinuity();

		/****************** UpdatePreviousDeviationAngle ******************/
		%feature("compactdefaultargs") UpdatePreviousDeviationAngle;
		%feature("autodoc", "Updates the previous deviation angle to the current value.

Returns
-------
None
") UpdatePreviousDeviationAngle;
		void UpdatePreviousDeviationAngle();

		/****************** UpdatePreviousDeviationCoefficient ******************/
		%feature("compactdefaultargs") UpdatePreviousDeviationCoefficient;
		%feature("autodoc", "Updates the previous value used for the chordal deviation coefficient to the current state.

Returns
-------
None
") UpdatePreviousDeviationCoefficient;
		void UpdatePreviousDeviationCoefficient();

		/****************** VIsoAspect ******************/
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "Defines the attributes which are used when drawing an v isoparametric curve of a face. defines the number of v isoparametric curves to be drawn for a single face. the lineaspect for v isoparametric lines can be edited (methods setcolor, settypeofline, setwidth, setnumber) the default values are: color : quantity_noc_gray82 type of line: aspect_tol_solid width : 0.5 //! these attributes are used by the following algorithms: prs3d_wfdeflectionsurface prs3d_wfdeflectionrestrictedface.

Returns
-------
opencascade::handle<Prs3d_IsoAspect>
") VIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & VIsoAspect();

		/****************** VectorAspect ******************/
		%feature("compactdefaultargs") VectorAspect;
		%feature("autodoc", "Returns settings for the appearance of vectors. these settings can be edited. the default values are: color: quantity_noc_skyblue type of line: aspect_tol_solid width: 1.0.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") VectorAspect;
		const opencascade::handle<Prs3d_LineAspect> & VectorAspect();

		/****************** VertexDrawMode ******************/
		%feature("compactdefaultargs") VertexDrawMode;
		%feature("autodoc", "Returns the current mode of visualization of vertices of a topods_shape instance.

Returns
-------
Prs3d_VertexDrawMode
") VertexDrawMode;
		Prs3d_VertexDrawMode VertexDrawMode();

		/****************** WireAspect ******************/
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "Returns wire aspect settings. the lineaspect for the free boundaries can be edited. the default values are: color: quantity_noc_green type of line: aspect_tol_solid width: 1.0 these attributes are used by the algorithm prs3d_wfshape.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") WireAspect;
		const opencascade::handle<Prs3d_LineAspect> & WireAspect();

		/****************** WireDraw ******************/
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

/*********************************
* class Prs3d_PresentationShadow *
*********************************/
class Prs3d_PresentationShadow : public Graphic3d_Structure {
	public:
		/****************** Prs3d_PresentationShadow ******************/
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
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "Do nothing - axis-aligned bounding box should be initialized from parent structure.

Returns
-------
None
") CalculateBoundBox;
		virtual void CalculateBoundBox();

		/****************** ParentAffinity ******************/
		%feature("compactdefaultargs") ParentAffinity;
		%feature("autodoc", "Returns view affinity of the parent presentation.

Returns
-------
opencascade::handle<Graphic3d_ViewAffinity>
") ParentAffinity;
		const opencascade::handle<Graphic3d_ViewAffinity> & ParentAffinity();

		/****************** ParentId ******************/
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

/************************
* class Prs3d_Projector *
************************/
class Prs3d_Projector : public Standard_Transient {
	public:
		/****************** Prs3d_Projector ******************/
		%feature("compactdefaultargs") Prs3d_Projector;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pr: HLRAlgo_Projector

Returns
-------
None
") Prs3d_Projector;
		 Prs3d_Projector(const HLRAlgo_Projector & Pr);

		/****************** Prs3d_Projector ******************/
		%feature("compactdefaultargs") Prs3d_Projector;
		%feature("autodoc", "Constructs a projector framework from the following parameters - pers is true if the view is a perspective view and false if it is an axonometric one; - focus is the focal length if a perspective view is defined; - dx, dy and dz are the coordinates of the projection vector; - xat, yat and zat are the coordinates of the view point; - xup, yup and zup are the coordinates of the vertical direction vector.

Parameters
----------
Pers: bool
Focus: float
DX: float
DY: float
DZ: float
XAt: float
YAt: float
ZAt: float
XUp: float
YUp: float
ZUp: float

Returns
-------
None
") Prs3d_Projector;
		 Prs3d_Projector(const Standard_Boolean Pers, const Standard_Real Focus, const Standard_Real DX, const Standard_Real DY, const Standard_Real DZ, const Standard_Real XAt, const Standard_Real YAt, const Standard_Real ZAt, const Standard_Real XUp, const Standard_Real YUp, const Standard_Real ZUp);

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Returns a projector object for use in a hidden line removal algorithm.

Returns
-------
HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector Projector();

};


%make_alias(Prs3d_Projector)

%extend Prs3d_Projector {
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
		%feature("compactdefaultargs") CurrentGroup;
		%feature("autodoc", "Returns the current (last created) group of primititves inside graphic objects in the display. a group also contains the attributes whose ranges are limited to the primitives in it.

Parameters
----------
thePrs3d: Prs3d_Presentation

Returns
-------
opencascade::handle<Graphic3d_Group>
") CurrentGroup;
		static opencascade::handle<Graphic3d_Group> CurrentGroup(const opencascade::handle<Prs3d_Presentation> & thePrs3d);

		/****************** NewGroup ******************/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "Returns the new group of primitives inside graphic objects in the display. a group also contains the attributes whose ranges are limited to the primitives in it.

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

/************************
* class Prs3d_ShapeTool *
************************/
class Prs3d_ShapeTool {
	public:
		/****************** Prs3d_ShapeTool ******************/
		%feature("compactdefaultargs") Prs3d_ShapeTool;
		%feature("autodoc", "Constructs the tool and initializes it using theshape and theallvertices (optional) arguments. by default, only isolated and internal vertices are considered, however if theallvertices argument is equal to true, all shape's vertices are taken into account.

Parameters
----------
theShape: TopoDS_Shape
theAllVertices: bool,optional
	default value is Standard_False

Returns
-------
None
") Prs3d_ShapeTool;
		 Prs3d_ShapeTool(const TopoDS_Shape & theShape, const Standard_Boolean theAllVertices = Standard_False);

		/****************** CurrentTriangulation ******************/
		%feature("compactdefaultargs") CurrentTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
l: TopLoc_Location

Returns
-------
opencascade::handle<Poly_Triangulation>
") CurrentTriangulation;
		opencascade::handle<Poly_Triangulation> CurrentTriangulation(TopLoc_Location & l);

		/****************** CurveBound ******************/
		%feature("compactdefaultargs") CurveBound;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") CurveBound;
		Bnd_Box CurveBound();

		/****************** FaceBound ******************/
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") FaceBound;
		Bnd_Box FaceBound();

		/****************** FacesOfEdge ******************/
		%feature("compactdefaultargs") FacesOfEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") FacesOfEdge;
		opencascade::handle<TopTools_HSequenceOfShape> FacesOfEdge();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") GetCurve;
		const TopoDS_Edge GetCurve();

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") GetFace;
		const TopoDS_Face GetFace();

		/****************** GetVertex ******************/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") GetVertex;
		const TopoDS_Vertex GetVertex();

		/****************** HasCurve ******************/
		%feature("compactdefaultargs") HasCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCurve;
		Standard_Boolean HasCurve();

		/****************** HasSurface ******************/
		%feature("compactdefaultargs") HasSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSurface;
		Standard_Boolean HasSurface();

		/****************** InitCurve ******************/
		%feature("compactdefaultargs") InitCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitCurve;
		void InitCurve();

		/****************** InitFace ******************/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitFace;
		void InitFace();

		/****************** InitVertex ******************/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertex;
		void InitVertex();

		/****************** IsPlanarFace ******************/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPlanarFace;
		Standard_Boolean IsPlanarFace();

		/****************** IsPlanarFace ******************/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
bool
") IsPlanarFace;
		static Standard_Boolean IsPlanarFace(const TopoDS_Face & theFace);

		/****************** MoreCurve ******************/
		%feature("compactdefaultargs") MoreCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreCurve;
		Standard_Boolean MoreCurve();

		/****************** MoreFace ******************/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreFace;
		Standard_Boolean MoreFace();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertex;
		Standard_Boolean MoreVertex();

		/****************** Neighbours ******************/
		%feature("compactdefaultargs") Neighbours;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Neighbours;
		Standard_Integer Neighbours();

		/****************** NextCurve ******************/
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextCurve;
		void NextCurve();

		/****************** NextFace ******************/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextFace;
		void NextFace();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		void NextVertex();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
l: TopLoc_Location

Returns
-------
opencascade::handle<Poly_Polygon3D>
") Polygon3D;
		opencascade::handle<Poly_Polygon3D> Polygon3D(TopLoc_Location & l);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Indices: Poly_PolygonOnTriangulation
T: Poly_Triangulation
l: TopLoc_Location

Returns
-------
None
") PolygonOnTriangulation;
		void PolygonOnTriangulation(opencascade::handle<Poly_PolygonOnTriangulation> & Indices, opencascade::handle<Poly_Triangulation> & T, TopLoc_Location & l);

};


%extend Prs3d_ShapeTool {
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
		/****************** FillArray ******************/
		%feature("compactdefaultargs") FillArray;
		%feature("autodoc", "Generate primitives for 3d quadric surface and fill the given array. optional transformation is applied.

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
		%feature("compactdefaultargs") FillArray;
		%feature("autodoc", "Generate primitives for 3d quadric surface presentation and fill the given array and poly triangulation structure. optional transformation is applied.

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
		%feature("compactdefaultargs") TrianglesNb;
		%feature("autodoc", "Number of triangles for presentation with the given params.

Parameters
----------
theSlicesNb: int
theStacksNb: int

Returns
-------
int
") TrianglesNb;
		static Standard_Integer TrianglesNb(const Standard_Integer theSlicesNb, const Standard_Integer theStacksNb);

};


%extend Prs3d_ToolQuadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Prs3d_Arrow *
********************/
class Prs3d_Arrow : public Prs3d_Root {
	public:
		/****************** Draw ******************/
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

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Alias to another method draw() for backward compatibility.

Parameters
----------
thePrs: Prs3d_Presentation
theLocation: gp_Pnt
theDirection: gp_Dir
theAngle: float
theLength: float

Returns
-------
None
") Draw;
		static void Draw(const opencascade::handle<Prs3d_Presentation> & thePrs, const gp_Pnt & theLocation, const gp_Dir & theDirection, const Standard_Real theAngle, const Standard_Real theLength);

		/****************** DrawSegments ******************/
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
* class Prs3d_ArrowAspect *
**************************/
class Prs3d_ArrowAspect : public Prs3d_BasicAspect {
	public:
		/****************** Prs3d_ArrowAspect ******************/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "Constructs an empty framework for displaying arrows in representations of lengths. the lengths displayed are either on their own or in chamfers, fillets, diameters and radii.

Returns
-------
None
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect();

		/****************** Prs3d_ArrowAspect ******************/
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
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the current value of the angle used when drawing an arrow.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Aspect ******************/
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
		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the current value of the length used when drawing an arrow.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** SetAngle ******************/
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

};


%make_alias(Prs3d_ArrowAspect)

%extend Prs3d_ArrowAspect {
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
		%feature("compactdefaultargs") Prs3d_DatumAspect;
		%feature("autodoc", "An empty framework to define the display of datums.

Returns
-------
None
") Prs3d_DatumAspect;
		 Prs3d_DatumAspect();

		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns the arrow aspect of presentation.

Returns
-------
opencascade::handle<Prs3d_ArrowAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****************** ArrowPartForAxis ******************/
		%feature("compactdefaultargs") ArrowPartForAxis;
		%feature("autodoc", "Returns type of arrow for a type of axis.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
Prs3d_DatumParts
") ArrowPartForAxis;
		Prs3d_DatumParts ArrowPartForAxis(Prs3d_DatumParts thePart);

		/****************** Attribute ******************/
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

		/****************** DatumAxes ******************/
		%feature("compactdefaultargs") DatumAxes;
		%feature("autodoc", "Returns axes used in the datum aspect.

Returns
-------
Prs3d_DatumAxes
") DatumAxes;
		Prs3d_DatumAxes DatumAxes();

		/****************** DrawDatumPart ******************/
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

		/****************** DrawFirstAndSecondAxis ******************/
		%feature("compactdefaultargs") DrawFirstAndSecondAxis;
		%feature("autodoc", "Returns true if the first and second axes can be drawn.

Returns
-------
bool
") DrawFirstAndSecondAxis;
		Standard_Boolean DrawFirstAndSecondAxis();

		/****************** DrawThirdAxis ******************/
		%feature("compactdefaultargs") DrawThirdAxis;
		%feature("autodoc", "Returns true if the third axis can be drawn.

Returns
-------
bool
") DrawThirdAxis;
		Standard_Boolean DrawThirdAxis();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** FirstAxisAspect ******************/
		%feature("compactdefaultargs") FirstAxisAspect;
		%feature("autodoc", "Returns the attributes for display of the first axis.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") FirstAxisAspect;
		const opencascade::handle<Prs3d_LineAspect> & FirstAxisAspect();

		/****************** FirstAxisLength ******************/
		%feature("compactdefaultargs") FirstAxisLength;
		%feature("autodoc", "Returns the length of the displayed first axis.

Returns
-------
float
") FirstAxisLength;
		Standard_Real FirstAxisLength();

		/****************** LineAspect ******************/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Returns the right-handed coordinate system set in setcomponent.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") LineAspect;
		opencascade::handle<Prs3d_LineAspect> LineAspect(Prs3d_DatumParts thePart);

		/****************** PointAspect ******************/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Returns the point aspect of origin wireframe presentation.

Returns
-------
opencascade::handle<Prs3d_PointAspect>
") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect();

		/****************** SecondAxisAspect ******************/
		%feature("compactdefaultargs") SecondAxisAspect;
		%feature("autodoc", "Returns the attributes for display of the second axis.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") SecondAxisAspect;
		const opencascade::handle<Prs3d_LineAspect> & SecondAxisAspect();

		/****************** SecondAxisLength ******************/
		%feature("compactdefaultargs") SecondAxisLength;
		%feature("autodoc", "Returns the length of the displayed second axis.

Returns
-------
float
") SecondAxisLength;
		Standard_Real SecondAxisLength();

		/****************** SetArrowAspect ******************/
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
		void SetAttribute(Prs3d_DatumAttribute theType, const Standard_Real & theValue);

		/****************** SetAxisLength ******************/
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

		/****************** SetDrawFirstAndSecondAxis ******************/
		%feature("compactdefaultargs") SetDrawFirstAndSecondAxis;
		%feature("autodoc", "Sets the drawfirstandsecondaxis attributes to active.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawFirstAndSecondAxis;
		void SetDrawFirstAndSecondAxis(Standard_Boolean theToDraw);

		/****************** SetDrawLabels ******************/
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

		/****************** SetDrawThirdAxis ******************/
		%feature("compactdefaultargs") SetDrawThirdAxis;
		%feature("autodoc", "Sets the drawthirdaxis attributes to active.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawThirdAxis;
		void SetDrawThirdAxis(Standard_Boolean theToDraw);

		/****************** SetPointAspect ******************/
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
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "Returns the right-handed coordinate system set in setcomponent.

Parameters
----------
thePart: Prs3d_DatumParts

Returns
-------
opencascade::handle<Prs3d_ShadingAspect>
") ShadingAspect;
		opencascade::handle<Prs3d_ShadingAspect> ShadingAspect(Prs3d_DatumParts thePart);

		/****************** TextAspect ******************/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Returns the text attributes for rendering labels.

Returns
-------
opencascade::handle<Prs3d_TextAspect>
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****************** ThirdAxisAspect ******************/
		%feature("compactdefaultargs") ThirdAxisAspect;
		%feature("autodoc", "Returns the attributes for display of the third axis.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") ThirdAxisAspect;
		const opencascade::handle<Prs3d_LineAspect> & ThirdAxisAspect();

		/****************** ThirdAxisLength ******************/
		%feature("compactdefaultargs") ThirdAxisLength;
		%feature("autodoc", "Returns the length of the displayed third axis.

Returns
-------
float
") ThirdAxisLength;
		Standard_Real ThirdAxisLength();

		/****************** ToDrawArrows ******************/
		%feature("compactdefaultargs") ToDrawArrows;
		%feature("autodoc", "Returns true if axes arrows are drawn; true by default.

Returns
-------
bool
") ToDrawArrows;
		Standard_Boolean ToDrawArrows();

		/****************** ToDrawLabels ******************/
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
		%feature("compactdefaultargs") Prs3d_DimensionAspect;
		%feature("autodoc", "Constructs an empty framework to define the display of dimensions.

Returns
-------
None
") Prs3d_DimensionAspect;
		 Prs3d_DimensionAspect();

		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns the settings for displaying arrows.

Returns
-------
opencascade::handle<Prs3d_ArrowAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect();

		/****************** ArrowOrientation ******************/
		%feature("compactdefaultargs") ArrowOrientation;
		%feature("autodoc", "Gets orientation of arrows (external or internal).

Returns
-------
Prs3d_DimensionArrowOrientation
") ArrowOrientation;
		Prs3d_DimensionArrowOrientation ArrowOrientation();

		/****************** ArrowTailSize ******************/
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
		%feature("compactdefaultargs") ExtensionSize;
		%feature("autodoc", "Returns extension size.

Returns
-------
float
") ExtensionSize;
		Standard_Real ExtensionSize();

		/****************** IsArrows3d ******************/
		%feature("compactdefaultargs") IsArrows3d;
		%feature("autodoc", "Gets type of arrows.

Returns
-------
bool
") IsArrows3d;
		Standard_Boolean IsArrows3d();

		/****************** IsText3d ******************/
		%feature("compactdefaultargs") IsText3d;
		%feature("autodoc", "Check if text for dimension label is 3d.

Returns
-------
bool
") IsText3d;
		Standard_Boolean IsText3d();

		/****************** IsTextShaded ******************/
		%feature("compactdefaultargs") IsTextShaded;
		%feature("autodoc", "Check if 3d text for dimension label is shaded.

Returns
-------
bool
") IsTextShaded;
		Standard_Boolean IsTextShaded();

		/****************** IsUnitsDisplayed ******************/
		%feature("compactdefaultargs") IsUnitsDisplayed;
		%feature("autodoc", "Shows if units are to be displayed along with dimension value.

Returns
-------
bool
") IsUnitsDisplayed;
		Standard_Boolean IsUnitsDisplayed();

		/****************** LineAspect ******************/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Returns the settings for the display of lines used in presentation of dimensions.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect();

		/****************** MakeArrows3d ******************/
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
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "Returns the settings for the display of text used in presentation of dimensions.

Returns
-------
opencascade::handle<Prs3d_TextAspect>
") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect();

		/****************** TextHorizontalPosition ******************/
		%feature("compactdefaultargs") TextHorizontalPosition;
		%feature("autodoc", "Gets horizontal text alignment for text label.

Returns
-------
Prs3d_DimensionTextHorizontalPosition
") TextHorizontalPosition;
		Prs3d_DimensionTextHorizontalPosition TextHorizontalPosition();

		/****************** TextVerticalPosition ******************/
		%feature("compactdefaultargs") TextVerticalPosition;
		%feature("autodoc", "Gets vertical text alignment for text label.

Returns
-------
Prs3d_DimensionTextVerticalPosition
") TextVerticalPosition;
		Prs3d_DimensionTextVerticalPosition TextVerticalPosition();

		/****************** ValueStringFormat ******************/
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
		%feature("compactdefaultargs") Prs3d_PlaneAspect;
		%feature("autodoc", "Constructs an empty framework for the display of planes.

Returns
-------
None
") Prs3d_PlaneAspect;
		 Prs3d_PlaneAspect();

		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "Returns the settings for displaying an arrow.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") ArrowAspect;
		const opencascade::handle<Prs3d_LineAspect> & ArrowAspect();

		/****************** ArrowsAngle ******************/
		%feature("compactdefaultargs") ArrowsAngle;
		%feature("autodoc", "Returns the angle of the arrowhead used in the display of arrows involved in the presentation of planes.

Returns
-------
float
") ArrowsAngle;
		Standard_Real ArrowsAngle();

		/****************** ArrowsLength ******************/
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "Returns the length of the arrow shaft used in the display of arrows.

Returns
-------
float
") ArrowsLength;
		Standard_Real ArrowsLength();

		/****************** ArrowsSize ******************/
		%feature("compactdefaultargs") ArrowsSize;
		%feature("autodoc", "Returns the size of arrows used in the display of planes.

Returns
-------
float
") ArrowsSize;
		Standard_Real ArrowsSize();

		/****************** DisplayCenterArrow ******************/
		%feature("compactdefaultargs") DisplayCenterArrow;
		%feature("autodoc", "Returns true if the display of center arrows is allowed.

Returns
-------
bool
") DisplayCenterArrow;
		Standard_Boolean DisplayCenterArrow();

		/****************** DisplayEdges ******************/
		%feature("compactdefaultargs") DisplayEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DisplayEdges;
		Standard_Boolean DisplayEdges();

		/****************** DisplayEdgesArrows ******************/
		%feature("compactdefaultargs") DisplayEdgesArrows;
		%feature("autodoc", "Returns true if the display of edge arrows is allowed.

Returns
-------
bool
") DisplayEdgesArrows;
		Standard_Boolean DisplayEdgesArrows();

		/****************** DisplayIso ******************/
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
		%feature("compactdefaultargs") EdgesAspect;
		%feature("autodoc", "Returns the attributes of displayed edges involved in the presentation of planes.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") EdgesAspect;
		const opencascade::handle<Prs3d_LineAspect> & EdgesAspect();

		/****************** IsoAspect ******************/
		%feature("compactdefaultargs") IsoAspect;
		%feature("autodoc", "Returns the attributes of displayed isoparameters involved in the presentation of planes.

Returns
-------
opencascade::handle<Prs3d_LineAspect>
") IsoAspect;
		const opencascade::handle<Prs3d_LineAspect> & IsoAspect();

		/****************** IsoDistance ******************/
		%feature("compactdefaultargs") IsoDistance;
		%feature("autodoc", "Returns the distance between isoparameters used in the display of planes.

Returns
-------
float
") IsoDistance;
		Standard_Real IsoDistance();

		/****************** PlaneXLength ******************/
		%feature("compactdefaultargs") PlaneXLength;
		%feature("autodoc", "Returns the length of the x axis used in the display of planes.

Returns
-------
float
") PlaneXLength;
		Standard_Real PlaneXLength();

		/****************** PlaneYLength ******************/
		%feature("compactdefaultargs") PlaneYLength;
		%feature("autodoc", "Returns the length of the y axis used in the display of planes.

Returns
-------
float
") PlaneYLength;
		Standard_Real PlaneYLength();

		/****************** SetArrowsAngle ******************/
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

/********************
* class Prs3d_Point *
********************/
/**************************
* class Prs3d_PointAspect *
**************************/
class Prs3d_PointAspect : public Prs3d_BasicAspect {
	public:
		/****************** Prs3d_PointAspect ******************/
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
		%feature("compactdefaultargs") GetTexture;
		%feature("autodoc", "Returns marker's texture.

Returns
-------
opencascade::handle<Graphic3d_MarkerImage>
") GetTexture;
		const opencascade::handle<Graphic3d_MarkerImage> & GetTexture();

		/****************** GetTextureSize ******************/
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
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "Constructs an empty framework to display shading.

Returns
-------
None
") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect();

		/****************** Prs3d_ShadingAspect ******************/
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
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Returns the polygons aspect properties.

Returns
-------
opencascade::handle<Graphic3d_AspectFillArea3d>
") Aspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & Aspect();

		/****************** Color ******************/
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

/*******************
* class Prs3d_Text *
*******************/
class Prs3d_Text : public Prs3d_Root {
	public:
		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Defines the display of the text. @param thegroup group to add primitives @param theaspect presentation attributes @param thetext text to draw @param theattachmentpoint attachment point.

Parameters
----------
theGroup: Graphic3d_Group
theAspect: Prs3d_TextAspect
theText: TCollection_ExtendedString
theAttachmentPoint: gp_Pnt

Returns
-------
None
") Draw;
		static void Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const opencascade::handle<Prs3d_TextAspect> & theAspect, const TCollection_ExtendedString & theText, const gp_Pnt & theAttachmentPoint);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Draws the text label. @param thegroup group to add primitives @param theaspect presentation attributes @param thetext text to draw @param theorientation location and orientation specified in the model 3d space @param thehasownanchor .

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
None
") Draw;
		static void Draw(const opencascade::handle<Graphic3d_Group> & theGroup, const opencascade::handle<Prs3d_TextAspect> & theAspect, const TCollection_ExtendedString & theText, const gp_Ax2 & theOrientation, const Standard_Boolean theHasOwnAnchor = Standard_True);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Alias to another method draw() for backward compatibility.

Parameters
----------
thePrs: Prs3d_Presentation
theDrawer: Prs3d_Drawer
theText: TCollection_ExtendedString
theAttachmentPoint: gp_Pnt

Returns
-------
None
") Draw;
		static void Draw(const opencascade::handle<Prs3d_Presentation> & thePrs, const opencascade::handle<Prs3d_Drawer> & theDrawer, const TCollection_ExtendedString & theText, const gp_Pnt & theAttachmentPoint);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Alias to another method draw() for backward compatibility.

Parameters
----------
thePrs: Prs3d_Presentation
theAspect: Prs3d_TextAspect
theText: TCollection_ExtendedString
theOrientation: gp_Ax2
theHasOwnAnchor: bool,optional
	default value is Standard_True

Returns
-------
None
") Draw;
		static void Draw(const opencascade::handle<Prs3d_Presentation> & thePrs, const opencascade::handle<Prs3d_TextAspect> & theAspect, const TCollection_ExtendedString & theText, const gp_Ax2 & theOrientation, const Standard_Boolean theHasOwnAnchor = Standard_True);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Alias to another method draw() for backward compatibility.

Parameters
----------
thePrs: Prs3d_Presentation
theAspect: Prs3d_TextAspect
theText: TCollection_ExtendedString
theAttachmentPoint: gp_Pnt

Returns
-------
None
") Draw;
		static void Draw(const opencascade::handle<Prs3d_Presentation> & thePrs, const opencascade::handle<Prs3d_TextAspect> & theAspect, const TCollection_ExtendedString & theText, const gp_Pnt & theAttachmentPoint);

};


%extend Prs3d_Text {
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
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", "Constructs an empty framework for defining display attributes of text.

Returns
-------
None
") Prs3d_TextAspect;
		 Prs3d_TextAspect();

		/****************** Prs3d_TextAspect ******************/
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
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Aspect ******************/
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
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Returns the height of the text box.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** HorizontalJustification ******************/
		%feature("compactdefaultargs") HorizontalJustification;
		%feature("autodoc", "Returns the horizontal alignment of the text. the range of values includes: - left - center - right, and - normal (justified).

Returns
-------
Graphic3d_HorizontalTextAlignment
") HorizontalJustification;
		Graphic3d_HorizontalTextAlignment HorizontalJustification();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the text. text can be displayed in the following directions: - up - down - left, or - right.

Returns
-------
Graphic3d_TextPath
") Orientation;
		Graphic3d_TextPath Orientation();

		/****************** SetAngle ******************/
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
		%feature("compactdefaultargs") Prs3d_ToolCylinder;
		%feature("autodoc", "Initializes the algorithm.

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
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface and return a filled array.

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
		%feature("compactdefaultargs") Prs3d_ToolDisk;
		%feature("autodoc", "Initializes the algorithm.

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
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface and return a filled array.

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
		%feature("compactdefaultargs") Prs3d_ToolSector;
		%feature("autodoc", "Initializes the algorithm.

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
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface and return a filled array.

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
		%feature("compactdefaultargs") Prs3d_ToolSphere;
		%feature("autodoc", "Initializes the algorithm.

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
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Generate primitives for 3d quadric surface and return a filled array.

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
* class Prs3d_IsoAspect *
************************/
class Prs3d_IsoAspect : public Prs3d_LineAspect {
	public:
		/****************** Prs3d_IsoAspect ******************/
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
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns the number of u or v isoparametric curves drawn for a single face.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** SetNumber ******************/
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
class Prs3d_WFShape:
	pass

@classnotwrapped
class Prs3d_Point:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
