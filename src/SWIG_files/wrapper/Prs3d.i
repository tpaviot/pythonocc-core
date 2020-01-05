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
%template(Prs3d_NListOfSequenceOfPnt) NCollection_List <opencascade::handle <TColgp_HSequenceOfPnt>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <TColgp_HSequenceOfPnt>> Prs3d_NListOfSequenceOfPnt;
typedef Prs3d_Drawer Graphic3d_HighlightStyle;
typedef Graphic3d_Structure Prs3d_Presentation;
typedef Prs3d_NListOfSequenceOfPnt::Iterator Prs3d_NListIteratorOfListOfSequenceOfPnt;
/* end typedefs declaration */

/**************
* class Prs3d *
**************/
%rename(prs3d) Prs3d;
class Prs3d {
	public:
		/****************** AddPrimitivesGroup ******************/
		%feature("compactdefaultargs") AddPrimitivesGroup;
		%feature("autodoc", "* Add primitives into new group in presentation and clear the list of polylines.
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:param thePolylines:
	:type thePolylines: Prs3d_NListOfSequenceOfPnt
	:rtype: void") AddPrimitivesGroup;
		static void AddPrimitivesGroup (const opencascade::handle<Prs3d_Presentation> & thePrs,const opencascade::handle<Prs3d_LineAspect> & theAspect,Prs3d_NListOfSequenceOfPnt & thePolylines);

		/****************** GetDeflection ******************/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "* Computes the absolute deflection value depending on the type of deflection in theDrawer: <ul> <li><b>Aspect_TOD_RELATIVE</b>: the absolute deflection is computed using the relative deviation coefficient from theDrawer and the shape's bounding box;</li> <li><b>Aspect_TOD_ABSOLUTE</b>: the maximal chordial deviation from theDrawer is returned.</li> </ul> In case of the type of deflection in theDrawer computed relative deflection for shape is stored as absolute deflection. It is necessary to use it later on for sub-shapes. This function should always be used to compute the deflection value for building discrete representations of the shape (triangualtion, wireframe) to avoid incosistencies between different representations of the shape and undesirable visual artifacts.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: float") GetDeflection;
		static Standard_Real GetDeflection (const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** MatchSegment ******************/
		%feature("compactdefaultargs") MatchSegment;
		%feature("autodoc", "* draws an arrow at a given location, with respect to a given direction.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param p1:
	:type p1: gp_Pnt
	:param p2:
	:type p2: gp_Pnt
	:param dist:
	:type dist: float
	:rtype: bool") MatchSegment;
		static Standard_Boolean MatchSegment (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const gp_Pnt & p1,const gp_Pnt & p2,Standard_Real &OutValue);

		/****************** PrimitivesFromPolylines ******************/
		%feature("compactdefaultargs") PrimitivesFromPolylines;
		%feature("autodoc", "* Assembles array of primitives for sequence of polylines. @param thePoints [in] the polylines sequence returns array of primitives
	:param thePoints:
	:type thePoints: Prs3d_NListOfSequenceOfPnt
	:rtype: opencascade::handle<Graphic3d_ArrayOfPrimitives>") PrimitivesFromPolylines;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> PrimitivesFromPolylines (const Prs3d_NListOfSequenceOfPnt & thePoints);

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
		/****************** GetAngleUnits ******************/
		%feature("compactdefaultargs") GetAngleUnits;
		%feature("autodoc", "* returns angle units
	:rtype: TCollection_AsciiString") GetAngleUnits;
		const TCollection_AsciiString & GetAngleUnits ();

		/****************** GetLengthUnits ******************/
		%feature("compactdefaultargs") GetLengthUnits;
		%feature("autodoc", "* returns length units
	:rtype: TCollection_AsciiString") GetLengthUnits;
		const TCollection_AsciiString & GetLengthUnits ();

		/****************** Prs3d_DimensionUnits ******************/
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "* Default constructor. Sets meters as default length units and radians as default angle units.
	:rtype: None") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits ();

		/****************** Prs3d_DimensionUnits ******************/
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", ":param theUnits:
	:type theUnits: Prs3d_DimensionUnits
	:rtype: None") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits (const Prs3d_DimensionUnits & theUnits);

		/****************** SetAngleUnits ******************/
		%feature("compactdefaultargs") SetAngleUnits;
		%feature("autodoc", "* Sets angle units
	:param theUnits:
	:type theUnits: TCollection_AsciiString
	:rtype: None") SetAngleUnits;
		void SetAngleUnits (const TCollection_AsciiString & theUnits);

		/****************** SetLengthUnits ******************/
		%feature("compactdefaultargs") SetLengthUnits;
		%feature("autodoc", "* Sets length units
	:param theUnits:
	:type theUnits: TCollection_AsciiString
	:rtype: None") SetLengthUnits;
		void SetLengthUnits (const TCollection_AsciiString & theUnits);

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
		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "* Returns the attributes for display of arrows.
	:rtype: opencascade::handle<Prs3d_ArrowAspect>") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect ();

		/****************** ClearLocalAttributes ******************/
		%feature("compactdefaultargs") ClearLocalAttributes;
		%feature("autodoc", "* Removes local attributes.
	:rtype: None") ClearLocalAttributes;
		void ClearLocalAttributes ();

		/****************** DatumAspect ******************/
		%feature("compactdefaultargs") DatumAspect;
		%feature("autodoc", "* Returns settings for the appearance of datums. These settings can be edited. The default values for the three axes are: Color: Quantity_NOC_PEACHPUFF Type of line: Aspect_TOL_SOLID Width: 1.0
	:rtype: opencascade::handle<Prs3d_DatumAspect>") DatumAspect;
		const opencascade::handle<Prs3d_DatumAspect> & DatumAspect ();

		/****************** DeviationAngle ******************/
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "* Returns the value for deviation angle.
	:rtype: float") DeviationAngle;
		Standard_Real DeviationAngle ();

		/****************** DeviationCoefficient ******************/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "* Returns the deviation coefficient. Drawings of curves or patches are made with respect to a maximal chordal deviation. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient gives the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. This deviation is absolute and is set through the method: SetMaximalChordialDeviation. The default value is 0.001. In drawing shapes, however, you are allowed to ask for a relative deviation. This deviation will be: SizeOfObject * DeviationCoefficient.
	:rtype: float") DeviationCoefficient;
		Standard_Real DeviationCoefficient ();

		/****************** DimAngleDisplayUnits ******************/
		%feature("compactdefaultargs") DimAngleDisplayUnits;
		%feature("autodoc", "* Returns angle units in which dimension presentation is displayed.
	:rtype: TCollection_AsciiString") DimAngleDisplayUnits;
		const TCollection_AsciiString & DimAngleDisplayUnits ();

		/****************** DimAngleModelUnits ******************/
		%feature("compactdefaultargs") DimAngleModelUnits;
		%feature("autodoc", "* Returns angle model units for the dimension presentation.
	:rtype: TCollection_AsciiString") DimAngleModelUnits;
		const TCollection_AsciiString & DimAngleModelUnits ();

		/****************** DimLengthDisplayUnits ******************/
		%feature("compactdefaultargs") DimLengthDisplayUnits;
		%feature("autodoc", "* Returns length units in which dimension presentation is displayed.
	:rtype: TCollection_AsciiString") DimLengthDisplayUnits;
		const TCollection_AsciiString & DimLengthDisplayUnits ();

		/****************** DimLengthModelUnits ******************/
		%feature("compactdefaultargs") DimLengthModelUnits;
		%feature("autodoc", "* Returns length model units for the dimension presentation.
	:rtype: TCollection_AsciiString") DimLengthModelUnits;
		const TCollection_AsciiString & DimLengthModelUnits ();

		/****************** DimensionAspect ******************/
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "* Returns settings for the appearance of dimensions.
	:rtype: opencascade::handle<Prs3d_DimensionAspect>") DimensionAspect;
		const opencascade::handle<Prs3d_DimensionAspect> & DimensionAspect ();

		/****************** DisableDrawHiddenLine ******************/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "* Disables the DrawHiddenLine function.
	:rtype: None") DisableDrawHiddenLine;
		void DisableDrawHiddenLine ();

		/****************** Discretisation ******************/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "* Returns the discretisation setting.
	:rtype: int") Discretisation;
		Standard_Integer Discretisation ();

		/****************** DrawHiddenLine ******************/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "* Returns Standard_True if the hidden lines are to be drawn. By default the hidden lines are not drawn.
	:rtype: bool") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** EnableDrawHiddenLine ******************/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "* Enables the DrawHiddenLine function.
	:rtype: None") EnableDrawHiddenLine;
		void EnableDrawHiddenLine ();

		/****************** FaceBoundaryAspect ******************/
		%feature("compactdefaultargs") FaceBoundaryAspect;
		%feature("autodoc", "* Returns line aspect of face boundaries.
	:rtype: opencascade::handle<Prs3d_LineAspect>") FaceBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FaceBoundaryAspect ();

		/****************** FaceBoundaryDraw ******************/
		%feature("compactdefaultargs") FaceBoundaryDraw;
		%feature("autodoc", "* Checks whether the face boundary drawing is enabled or not.
	:rtype: bool") FaceBoundaryDraw;
		Standard_Boolean FaceBoundaryDraw ();

		/****************** FaceBoundaryUpperContinuity ******************/
		%feature("compactdefaultargs") FaceBoundaryUpperContinuity;
		%feature("autodoc", "* Get the most edge continuity class; GeomAbs_CN by default (all edges).
	:rtype: GeomAbs_Shape") FaceBoundaryUpperContinuity;
		GeomAbs_Shape FaceBoundaryUpperContinuity ();

		/****************** FreeBoundaryAspect ******************/
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "* Returns the values for presentation of free boundaries, in other words, boundaries which are not shared. The LineAspect for the free boundaries can be edited. The default values are: Color: Quantity_NOC_GREEN Type of line: Aspect_TOL_SOLID Width: 1.0 These attributes are used by the algorithm Prs3d_WFShape
	:rtype: opencascade::handle<Prs3d_LineAspect>") FreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & FreeBoundaryAspect ();

		/****************** FreeBoundaryDraw ******************/
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "* Returns True if the drawing of the free boundaries is enabled True is the default setting.
	:rtype: bool") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw ();

		/****************** HLRAngle ******************/
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "* Returns the real number value of the deviation angle in hidden line removal views. The default value is 20 * M_PI / 180.
	:rtype: float") HLRAngle;
		Standard_Real HLRAngle ();

		/****************** HLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") HLRDeviationCoefficient;
		%feature("autodoc", "* Returns the real number value of the hidden line removal deviation coefficient in this framework, if the flag hasOwnHLRDeviationCoefficient is true or there is no Link. Else the shape's HLR deviation coefficient is used. A Deviation coefficient is used in the shading display mode. The shape is seen decomposed into triangles. These are used to calculate reflection of light from the surface of the object. The triangles are formed from chords of the curves in the shape. The deviation coefficient give the highest value of the angle with which a chord can deviate from a tangent to a curve. If this limit is reached, a new triangle is begun. To find the hidden lines, hidden line display mode entails recalculation of the view at each different projector perspective. Since hidden lines entail calculations of more than usual complexity to decompose them into these triangles, a deviation coefficient allowing greater tolerance is used. This increases efficiency in calculation. The Default value is 0.02.
	:rtype: float") HLRDeviationCoefficient;
		Standard_Real HLRDeviationCoefficient ();

		/****************** HasLink ******************/
		%feature("compactdefaultargs") HasLink;
		%feature("autodoc", "* Returns true if the current object has a link on the other drawer.
	:rtype: bool") HasLink;
		Standard_Boolean HasLink ();

		/****************** HasOwnArrowAspect ******************/
		%feature("compactdefaultargs") HasOwnArrowAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for arrow aspect that overrides the one in the link.
	:rtype: bool") HasOwnArrowAspect;
		Standard_Boolean HasOwnArrowAspect ();

		/****************** HasOwnDatumAspect ******************/
		%feature("compactdefaultargs") HasOwnDatumAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for datum aspect that overrides the one in the link.
	:rtype: bool") HasOwnDatumAspect;
		Standard_Boolean HasOwnDatumAspect ();

		/****************** HasOwnDeviationAngle ******************/
		%feature("compactdefaultargs") HasOwnDeviationAngle;
		%feature("autodoc", "* Returns true if the there is a local setting for deviation angle in this framework for a specific interactive object.
	:rtype: bool") HasOwnDeviationAngle;
		Standard_Boolean HasOwnDeviationAngle ();

		/****************** HasOwnDeviationCoefficient ******************/
		%feature("compactdefaultargs") HasOwnDeviationCoefficient;
		%feature("autodoc", "* Returns true if there is a local setting for deviation coefficient in this framework for a specific interactive object.
	:rtype: bool") HasOwnDeviationCoefficient;
		Standard_Boolean HasOwnDeviationCoefficient ();

		/****************** HasOwnDimAngleDisplayUnits ******************/
		%feature("compactdefaultargs") HasOwnDimAngleDisplayUnits;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for angle units in which dimension presentation is displayed that overrides the one in the link.
	:rtype: bool") HasOwnDimAngleDisplayUnits;
		Standard_Boolean HasOwnDimAngleDisplayUnits ();

		/****************** HasOwnDimAngleModelUnits ******************/
		%feature("compactdefaultargs") HasOwnDimAngleModelUnits;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for dimension angle model units that overrides the one in the link.
	:rtype: bool") HasOwnDimAngleModelUnits;
		Standard_Boolean HasOwnDimAngleModelUnits ();

		/****************** HasOwnDimLengthDisplayUnits ******************/
		%feature("compactdefaultargs") HasOwnDimLengthDisplayUnits;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for length units in which dimension presentation is displayed that overrides the one in the link.
	:rtype: bool") HasOwnDimLengthDisplayUnits;
		Standard_Boolean HasOwnDimLengthDisplayUnits ();

		/****************** HasOwnDimLengthModelUnits ******************/
		%feature("compactdefaultargs") HasOwnDimLengthModelUnits;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for dimension length model units that overrides the one in the link.
	:rtype: bool") HasOwnDimLengthModelUnits;
		Standard_Boolean HasOwnDimLengthModelUnits ();

		/****************** HasOwnDimensionAspect ******************/
		%feature("compactdefaultargs") HasOwnDimensionAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for the appearance of dimensions that overrides the one in the link.
	:rtype: bool") HasOwnDimensionAspect;
		Standard_Boolean HasOwnDimensionAspect ();

		/****************** HasOwnDiscretisation ******************/
		%feature("compactdefaultargs") HasOwnDiscretisation;
		%feature("autodoc", "* Returns true if the drawer has discretisation setting active.
	:rtype: bool") HasOwnDiscretisation;
		Standard_Boolean HasOwnDiscretisation ();

		/****************** HasOwnDrawHiddenLine ******************/
		%feature("compactdefaultargs") HasOwnDrawHiddenLine;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for 'draw hidden lines' flag that overrides the one in the link.
	:rtype: bool") HasOwnDrawHiddenLine;
		Standard_Boolean HasOwnDrawHiddenLine ();

		/****************** HasOwnFaceBoundaryAspect ******************/
		%feature("compactdefaultargs") HasOwnFaceBoundaryAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for face boundaries aspect that overrides the one in the link.
	:rtype: bool") HasOwnFaceBoundaryAspect;
		Standard_Boolean HasOwnFaceBoundaryAspect ();

		/****************** HasOwnFaceBoundaryDraw ******************/
		%feature("compactdefaultargs") HasOwnFaceBoundaryDraw;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for 'draw face boundaries' flag that overrides the one in the link.
	:rtype: bool") HasOwnFaceBoundaryDraw;
		Standard_Boolean HasOwnFaceBoundaryDraw ();

		/****************** HasOwnFaceBoundaryUpperContinuity ******************/
		%feature("compactdefaultargs") HasOwnFaceBoundaryUpperContinuity;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for face boundaries upper edge continuity class that overrides the one in the link.
	:rtype: bool") HasOwnFaceBoundaryUpperContinuity;
		Standard_Boolean HasOwnFaceBoundaryUpperContinuity ();

		/****************** HasOwnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") HasOwnFreeBoundaryAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for free boundaries aspect that overrides the one in the link.
	:rtype: bool") HasOwnFreeBoundaryAspect;
		Standard_Boolean HasOwnFreeBoundaryAspect ();

		/****************** HasOwnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") HasOwnFreeBoundaryDraw;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for 'draw free boundaries' flag that overrides the one in the link.
	:rtype: bool") HasOwnFreeBoundaryDraw;
		Standard_Boolean HasOwnFreeBoundaryDraw ();

		/****************** HasOwnHLRDeviationAngle ******************/
		%feature("compactdefaultargs") HasOwnHLRDeviationAngle;
		%feature("autodoc", "* Returns true if the there is a setting for HLR deviation angle in this framework for a specific interactive object.
	:rtype: bool") HasOwnHLRDeviationAngle;
		Standard_Boolean HasOwnHLRDeviationAngle ();

		/****************** HasOwnHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") HasOwnHLRDeviationCoefficient;
		%feature("autodoc", "* Returns true if the there is a setting for HLR deviation coefficient in this framework for a specific interactive object.
	:rtype: bool") HasOwnHLRDeviationCoefficient;
		Standard_Boolean HasOwnHLRDeviationCoefficient ();

		/****************** HasOwnHiddenLineAspect ******************/
		%feature("compactdefaultargs") HasOwnHiddenLineAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for hidden lines aspect that overrides the one in the link.
	:rtype: bool") HasOwnHiddenLineAspect;
		Standard_Boolean HasOwnHiddenLineAspect ();

		/****************** HasOwnIsAutoTriangulation ******************/
		%feature("compactdefaultargs") HasOwnIsAutoTriangulation;
		%feature("autodoc", "* Returns true if the drawer has IsoOnPlane setting active.
	:rtype: bool") HasOwnIsAutoTriangulation;
		Standard_Boolean HasOwnIsAutoTriangulation ();

		/****************** HasOwnIsoOnPlane ******************/
		%feature("compactdefaultargs") HasOwnIsoOnPlane;
		%feature("autodoc", "* Returns true if the drawer has IsoOnPlane setting active.
	:rtype: bool") HasOwnIsoOnPlane;
		Standard_Boolean HasOwnIsoOnPlane ();

		/****************** HasOwnIsoOnTriangulation ******************/
		%feature("compactdefaultargs") HasOwnIsoOnTriangulation;
		%feature("autodoc", "* Returns true if the drawer has IsoOnTriangulation setting active.
	:rtype: bool") HasOwnIsoOnTriangulation;
		Standard_Boolean HasOwnIsoOnTriangulation ();

		/****************** HasOwnLineArrowDraw ******************/
		%feature("compactdefaultargs") HasOwnLineArrowDraw;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for 'draw arrow' flag that overrides the one in the link.
	:rtype: bool") HasOwnLineArrowDraw;
		Standard_Boolean HasOwnLineArrowDraw ();

		/****************** HasOwnLineAspect ******************/
		%feature("compactdefaultargs") HasOwnLineAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for line aspect that overrides the one in the link.
	:rtype: bool") HasOwnLineAspect;
		Standard_Boolean HasOwnLineAspect ();

		/****************** HasOwnMaximalChordialDeviation ******************/
		%feature("compactdefaultargs") HasOwnMaximalChordialDeviation;
		%feature("autodoc", "* Returns true if the drawer has a maximal chordial deviation setting active.
	:rtype: bool") HasOwnMaximalChordialDeviation;
		Standard_Boolean HasOwnMaximalChordialDeviation ();

		/****************** HasOwnMaximalParameterValue ******************/
		%feature("compactdefaultargs") HasOwnMaximalParameterValue;
		%feature("autodoc", "* Returns true if the drawer has a maximum value allowed for the first and last parameters of an infinite curve setting active.
	:rtype: bool") HasOwnMaximalParameterValue;
		Standard_Boolean HasOwnMaximalParameterValue ();

		/****************** HasOwnPlaneAspect ******************/
		%feature("compactdefaultargs") HasOwnPlaneAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for plane aspect that overrides the one in the link.
	:rtype: bool") HasOwnPlaneAspect;
		Standard_Boolean HasOwnPlaneAspect ();

		/****************** HasOwnPointAspect ******************/
		%feature("compactdefaultargs") HasOwnPointAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for point aspect that overrides the one in the link.
	:rtype: bool") HasOwnPointAspect;
		Standard_Boolean HasOwnPointAspect ();

		/****************** HasOwnSectionAspect ******************/
		%feature("compactdefaultargs") HasOwnSectionAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for section aspect that overrides the one in the link.
	:rtype: bool") HasOwnSectionAspect;
		Standard_Boolean HasOwnSectionAspect ();

		/****************** HasOwnSeenLineAspect ******************/
		%feature("compactdefaultargs") HasOwnSeenLineAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for seen line aspect that overrides the one in the link.
	:rtype: bool") HasOwnSeenLineAspect;
		Standard_Boolean HasOwnSeenLineAspect ();

		/****************** HasOwnShadingAspect ******************/
		%feature("compactdefaultargs") HasOwnShadingAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for shading aspect that overrides the one in the link.
	:rtype: bool") HasOwnShadingAspect;
		Standard_Boolean HasOwnShadingAspect ();

		/****************** HasOwnTextAspect ******************/
		%feature("compactdefaultargs") HasOwnTextAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for text aspect that overrides the one in the link.
	:rtype: bool") HasOwnTextAspect;
		Standard_Boolean HasOwnTextAspect ();

		/****************** HasOwnTypeOfDeflection ******************/
		%feature("compactdefaultargs") HasOwnTypeOfDeflection;
		%feature("autodoc", "* Returns true if the drawer has a type of deflection setting active.
	:rtype: bool") HasOwnTypeOfDeflection;
		Standard_Boolean HasOwnTypeOfDeflection ();

		/****************** HasOwnTypeOfHLR ******************/
		%feature("compactdefaultargs") HasOwnTypeOfHLR;
		%feature("autodoc", "* Returns true if the type of HLR is not equal to Prs3d_TOH_NotSet.
	:rtype: bool") HasOwnTypeOfHLR;
		Standard_Boolean HasOwnTypeOfHLR ();

		/****************** HasOwnUIsoAspect ******************/
		%feature("compactdefaultargs") HasOwnUIsoAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for UIso aspect that overrides the one in the link.
	:rtype: bool") HasOwnUIsoAspect;
		Standard_Boolean HasOwnUIsoAspect ();

		/****************** HasOwnUnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for unfree boundaries aspect that overrides the one in the link.
	:rtype: bool") HasOwnUnFreeBoundaryAspect;
		Standard_Boolean HasOwnUnFreeBoundaryAspect ();

		/****************** HasOwnUnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") HasOwnUnFreeBoundaryDraw;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for 'draw shared boundaries' flag that overrides the one in the link.
	:rtype: bool") HasOwnUnFreeBoundaryDraw;
		Standard_Boolean HasOwnUnFreeBoundaryDraw ();

		/****************** HasOwnVIsoAspect ******************/
		%feature("compactdefaultargs") HasOwnVIsoAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for VIso aspect that overrides the one in the link.
	:rtype: bool") HasOwnVIsoAspect;
		Standard_Boolean HasOwnVIsoAspect ();

		/****************** HasOwnVectorAspect ******************/
		%feature("compactdefaultargs") HasOwnVectorAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for vector aspect that overrides the one in the link.
	:rtype: bool") HasOwnVectorAspect;
		Standard_Boolean HasOwnVectorAspect ();

		/****************** HasOwnVertexDrawMode ******************/
		%feature("compactdefaultargs") HasOwnVertexDrawMode;
		%feature("autodoc", "* Returns true if the vertex draw mode is not equal to <b>Prs3d_VDM_Inherited</b>. This means that individual vertex draw mode value (i.e. not inherited from the global drawer) is used for a specific interactive object.
	:rtype: bool") HasOwnVertexDrawMode;
		Standard_Boolean HasOwnVertexDrawMode ();

		/****************** HasOwnWireAspect ******************/
		%feature("compactdefaultargs") HasOwnWireAspect;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for wire aspect that overrides the one in the link.
	:rtype: bool") HasOwnWireAspect;
		Standard_Boolean HasOwnWireAspect ();

		/****************** HasOwnWireDraw ******************/
		%feature("compactdefaultargs") HasOwnWireDraw;
		%feature("autodoc", "* Returns true if the drawer has its own attribute for 'draw wires' flag that overrides the one in the link.
	:rtype: bool") HasOwnWireDraw;
		Standard_Boolean HasOwnWireDraw ();

		/****************** HiddenLineAspect ******************/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "* Returns settings for hidden line aspects. These settings can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_DASH Width: 1.0
	:rtype: opencascade::handle<Prs3d_LineAspect>") HiddenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & HiddenLineAspect ();

		/****************** IsAutoTriangulation ******************/
		%feature("compactdefaultargs") IsAutoTriangulation;
		%feature("autodoc", "* Returns True if automatic triangulation is enabled.
	:rtype: bool") IsAutoTriangulation;
		Standard_Boolean IsAutoTriangulation ();

		/****************** IsoOnPlane ******************/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "* Returns True if the drawing of isos on planes is enabled.
	:rtype: bool") IsoOnPlane;
		Standard_Boolean IsoOnPlane ();

		/****************** IsoOnTriangulation ******************/
		%feature("compactdefaultargs") IsoOnTriangulation;
		%feature("autodoc", "* Returns True if the drawing of isos on triangulation is enabled.
	:rtype: bool") IsoOnTriangulation;
		Standard_Boolean IsoOnTriangulation ();

		/****************** LineArrowDraw ******************/
		%feature("compactdefaultargs") LineArrowDraw;
		%feature("autodoc", "* Returns True if drawing an arrow at the end of each edge is enabled and False otherwise (the default).
	:rtype: bool") LineArrowDraw;
		Standard_Boolean LineArrowDraw ();

		/****************** LineAspect ******************/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "* Returns settings for line aspects. These settings can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_SOLID Width: 1.0 These attributes are used by the following algorithms: Prs3d_Curve Prs3d_Line Prs3d_HLRShape
	:rtype: opencascade::handle<Prs3d_LineAspect>") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect ();

		/****************** Link ******************/
		%feature("compactdefaultargs") Link;
		%feature("autodoc", "* Returns the drawer to which the current object references.
	:rtype: opencascade::handle<Prs3d_Drawer>") Link;
		const opencascade::handle<Prs3d_Drawer> & Link ();

		/****************** Link ******************/
		%feature("compactdefaultargs") Link;
		%feature("autodoc", "* Sets theDrawer as a link to which the current object references.
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None") Link;
		void Link (const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** MaximalChordialDeviation ******************/
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "* Returns the maximal chordal deviation. The default value is 0.1. Drawings of curves or patches are made with respect to an absolute maximal chordal deviation.
	:rtype: float") MaximalChordialDeviation;
		Standard_Real MaximalChordialDeviation ();

		/****************** MaximalParameterValue ******************/
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "* Sets the maximum value allowed for the first and last parameters of an infinite curve. By default, this value is 500000.
	:rtype: float") MaximalParameterValue;
		Standard_Real MaximalParameterValue ();

		/****************** PlaneAspect ******************/
		%feature("compactdefaultargs") PlaneAspect;
		%feature("autodoc", "* Returns settings for the appearance of planes.
	:rtype: opencascade::handle<Prs3d_PlaneAspect>") PlaneAspect;
		const opencascade::handle<Prs3d_PlaneAspect> & PlaneAspect ();

		/****************** PointAspect ******************/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "* Returns the point aspect setting. The default values are Color: Quantity_NOC_YELLOW Type of marker: Aspect_TOM_PLUS Scale: 1.0 These attributes are used by the algorithms Prs3d_Point.
	:rtype: opencascade::handle<Prs3d_PointAspect>") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect ();

		/****************** PreviousDeviationAngle ******************/
		%feature("compactdefaultargs") PreviousDeviationAngle;
		%feature("autodoc", "* Returns the previous deviation angle
	:rtype: float") PreviousDeviationAngle;
		Standard_Real PreviousDeviationAngle ();

		/****************** PreviousDeviationCoefficient ******************/
		%feature("compactdefaultargs") PreviousDeviationCoefficient;
		%feature("autodoc", "* Saves the previous value used for the chordal deviation coefficient.
	:rtype: float") PreviousDeviationCoefficient;
		Standard_Real PreviousDeviationCoefficient ();

		/****************** PreviousHLRDeviationAngle ******************/
		%feature("compactdefaultargs") PreviousHLRDeviationAngle;
		%feature("autodoc", "* Returns the previous value of the HLR deviation angle.
	:rtype: float") PreviousHLRDeviationAngle;
		Standard_Real PreviousHLRDeviationAngle ();

		/****************** PreviousHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") PreviousHLRDeviationCoefficient;
		%feature("autodoc", "* Returns the previous value of the hidden line removal deviation coefficient.
	:rtype: float") PreviousHLRDeviationCoefficient;
		Standard_Real PreviousHLRDeviationCoefficient ();

		/****************** Prs3d_Drawer ******************/
		%feature("compactdefaultargs") Prs3d_Drawer;
		%feature("autodoc", "* Default constructor.
	:rtype: None") Prs3d_Drawer;
		 Prs3d_Drawer ();

		/****************** SectionAspect ******************/
		%feature("compactdefaultargs") SectionAspect;
		%feature("autodoc", "* The LineAspect for the wire can be edited. The default values are: Color: Quantity_NOC_ORANGE Type of line: Aspect_TOL_SOLID Width: 1.0 These attributes are used by the algorithm Prs3d_WFShape.
	:rtype: opencascade::handle<Prs3d_LineAspect>") SectionAspect;
		const opencascade::handle<Prs3d_LineAspect> & SectionAspect ();

		/****************** SeenLineAspect ******************/
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "* Returns settings for seen line aspects. These settings can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_SOLID Width: 1.0
	:rtype: opencascade::handle<Prs3d_LineAspect>") SeenLineAspect;
		const opencascade::handle<Prs3d_LineAspect> & SeenLineAspect ();

		/****************** SetArrowAspect ******************/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "* Sets the parameter theAspect for display attributes of arrows.
	:param theAspect:
	:type theAspect: Prs3d_ArrowAspect
	:rtype: None") SetArrowAspect;
		void SetArrowAspect (const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****************** SetAutoTriangulation ******************/
		%feature("compactdefaultargs") SetAutoTriangulation;
		%feature("autodoc", "* Sets IsAutoTriangulated on or off by setting the parameter theIsEnabled to true or false. If this flag is True automatic re-triangulation with deflection-check logic will be applied. Else this feature will be disable and triangulation is expected to be computed by application itself and no shading presentation at all if unavailable.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetAutoTriangulation;
		void SetAutoTriangulation (const Standard_Boolean theIsEnabled);

		/****************** SetDatumAspect ******************/
		%feature("compactdefaultargs") SetDatumAspect;
		%feature("autodoc", "* Sets the modality theAspect for the display of datums.
	:param theAspect:
	:type theAspect: Prs3d_DatumAspect
	:rtype: None") SetDatumAspect;
		void SetDatumAspect (const opencascade::handle<Prs3d_DatumAspect> & theAspect);

		/****************** SetDeviationAngle ******************/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "* Sets the deviation angle theAngle. Also sets the hasOwnDeviationAngle flag to Standard_True, and myPreviousDeviationAngle.
	:param theAngle:
	:type theAngle: float
	:rtype: None") SetDeviationAngle;
		void SetDeviationAngle (const Standard_Real theAngle);

		/****************** SetDeviationAngle ******************/
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "* Sets the hasOwnDeviationAngle flag to Standard_False
	:rtype: None") SetDeviationAngle;
		void SetDeviationAngle ();

		/****************** SetDeviationCoefficient ******************/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "* Sets the deviation coefficient theCoefficient. Also sets the hasOwnDeviationCoefficient flag to Standard_True and myPreviousDeviationCoefficient
	:param theCoefficient:
	:type theCoefficient: float
	:rtype: None") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Standard_Real theCoefficient);

		/****************** SetDeviationCoefficient ******************/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "* Sets the hasOwnDeviationCoefficient flag to Standard_False
	:rtype: None") SetDeviationCoefficient;
		void SetDeviationCoefficient ();

		/****************** SetDimAngleDisplayUnits ******************/
		%feature("compactdefaultargs") SetDimAngleDisplayUnits;
		%feature("autodoc", "* Sets angle units in which value for dimension presentation is displayed. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
	:param theUnits:
	:type theUnits: TCollection_AsciiString
	:rtype: None") SetDimAngleDisplayUnits;
		void SetDimAngleDisplayUnits (const TCollection_AsciiString & theUnits);

		/****************** SetDimAngleModelUnits ******************/
		%feature("compactdefaultargs") SetDimAngleModelUnits;
		%feature("autodoc", "* Sets dimension angle model units for computing of dimension presentation. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
	:param theUnits:
	:type theUnits: TCollection_AsciiString
	:rtype: None") SetDimAngleModelUnits;
		void SetDimAngleModelUnits (const TCollection_AsciiString & theUnits);

		/****************** SetDimLengthDisplayUnits ******************/
		%feature("compactdefaultargs") SetDimLengthDisplayUnits;
		%feature("autodoc", "* Sets length units in which value for dimension presentation is displayed. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
	:param theUnits:
	:type theUnits: TCollection_AsciiString
	:rtype: None") SetDimLengthDisplayUnits;
		void SetDimLengthDisplayUnits (const TCollection_AsciiString & theUnits);

		/****************** SetDimLengthModelUnits ******************/
		%feature("compactdefaultargs") SetDimLengthModelUnits;
		%feature("autodoc", "* Sets dimension length model units for computing of dimension presentation. The method sets value owned by the drawer that will be used during visualization instead of the one set in link.
	:param theUnits:
	:type theUnits: TCollection_AsciiString
	:rtype: None") SetDimLengthModelUnits;
		void SetDimLengthModelUnits (const TCollection_AsciiString & theUnits);

		/****************** SetDimensionAspect ******************/
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "* Sets the settings for the appearance of dimensions. The method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.
	:param theAspect:
	:type theAspect: Prs3d_DimensionAspect
	:rtype: None") SetDimensionAspect;
		void SetDimensionAspect (const opencascade::handle<Prs3d_DimensionAspect> & theAspect);

		/****************** SetDiscretisation ******************/
		%feature("compactdefaultargs") SetDiscretisation;
		%feature("autodoc", "* Sets the discretisation parameter theValue.
	:param theValue:
	:type theValue: int
	:rtype: None") SetDiscretisation;
		void SetDiscretisation (const Standard_Integer theValue);

		/****************** SetFaceBoundaryAspect ******************/
		%feature("compactdefaultargs") SetFaceBoundaryAspect;
		%feature("autodoc", "* Sets line aspect for face boundaries. The method sets line aspect owned by the drawer that will be used during visualization instead of the one set in link. theAspect is the line aspect that determines the look of the face boundaries.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetFaceBoundaryAspect;
		void SetFaceBoundaryAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetFaceBoundaryDraw ******************/
		%feature("compactdefaultargs") SetFaceBoundaryDraw;
		%feature("autodoc", "* Enables or disables face boundary drawing for shading presentations. The method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theIsEnabled is a boolean flag indicating whether the face boundaries should be drawn or not.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetFaceBoundaryDraw;
		void SetFaceBoundaryDraw (const Standard_Boolean theIsEnabled);

		/****************** SetFaceBoundaryUpperContinuity ******************/
		%feature("compactdefaultargs") SetFaceBoundaryUpperContinuity;
		%feature("autodoc", "* Set the most edge continuity class for face boundaries.
	:param theMostAllowedEdgeClass:
	:type theMostAllowedEdgeClass: GeomAbs_Shape
	:rtype: None") SetFaceBoundaryUpperContinuity;
		void SetFaceBoundaryUpperContinuity (GeomAbs_Shape theMostAllowedEdgeClass);

		/****************** SetFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") SetFreeBoundaryAspect;
		%feature("autodoc", "* Sets the parameter theAspect for the display of free boundaries. The method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetFreeBoundaryAspect;
		void SetFreeBoundaryAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") SetFreeBoundaryDraw;
		%feature("autodoc", "* Enables or disables drawing of free boundaries for shading presentations. The method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theIsEnabled is a boolean flag indicating whether the free boundaries should be drawn or not.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetFreeBoundaryDraw;
		void SetFreeBoundaryDraw (const Standard_Boolean theIsEnabled);

		/****************** SetHLRAngle ******************/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "* Sets anAngle, the angle of maximum chordal deviation for removal of hidden lines created by different viewpoints in different presentations. The default value is 20 * M_PI / 180. Also sets the hasOwnHLRDeviationAngle flag to Standard_True and myPreviousHLRDeviationAngle.
	:param theAngle:
	:type theAngle: float
	:rtype: None") SetHLRAngle;
		void SetHLRAngle (const Standard_Real theAngle);

		/****************** SetHLRAngle ******************/
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "* Sets the hasOwnHLRDeviationAngle flag to Standard_False
	:rtype: None") SetHLRAngle;
		void SetHLRAngle ();

		/****************** SetHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "* Sets the deviation coefficient aCoefficient for removal of hidden lines created by different viewpoints in different presentations. The Default value is 0.02. Also sets the hasOwnHLRDeviationCoefficient flag to Standard_True and myPreviousHLRDeviationCoefficient
	:param theCoefficient:
	:type theCoefficient: float
	:rtype: None") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient (const Standard_Real theCoefficient);

		/****************** SetHLRDeviationCoefficient ******************/
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "* Sets the hasOwnHLRDeviationCoefficient flag to Standard_False
	:rtype: None") SetHLRDeviationCoefficient;
		void SetHLRDeviationCoefficient ();

		/****************** SetHiddenLineAspect ******************/
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "* Sets the parameter theAspect for the display of hidden lines in hidden line removal mode.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetHiddenLineAspect;
		void SetHiddenLineAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetIsoOnPlane ******************/
		%feature("compactdefaultargs") SetIsoOnPlane;
		%feature("autodoc", "* Sets IsoOnPlane on or off by setting the parameter theIsEnabled to true or false.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetIsoOnPlane;
		void SetIsoOnPlane (const Standard_Boolean theIsEnabled);

		/****************** SetIsoOnTriangulation ******************/
		%feature("compactdefaultargs") SetIsoOnTriangulation;
		%feature("autodoc", "* Enables or disables isolines on triangulation by setting the parameter theIsEnabled to true or false.
	:param theToEnable:
	:type theToEnable: bool
	:rtype: None") SetIsoOnTriangulation;
		void SetIsoOnTriangulation (const Standard_Boolean theToEnable);

		/****************** SetLineArrowDraw ******************/
		%feature("compactdefaultargs") SetLineArrowDraw;
		%feature("autodoc", "* Enables the drawing of an arrow at the end of each line. By default the arrows are not drawn.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetLineArrowDraw;
		void SetLineArrowDraw (const Standard_Boolean theIsEnabled);

		/****************** SetLineAspect ******************/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "* Sets the parameter theAspect for display attributes of lines.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetLineAspect;
		void SetLineAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetLink ******************/
		%feature("compactdefaultargs") SetLink;
		%feature("autodoc", "* Sets theDrawer as a link to which the current object references.
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None") SetLink;
		void SetLink (const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetMaximalChordialDeviation ******************/
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "* Defines the maximal chordial deviation when drawing any curve. Even if the type of deviation is set to TOD_Relative, this value is used by: Prs3d_DeflectionCurve Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace
	:param theChordialDeviation:
	:type theChordialDeviation: float
	:rtype: None") SetMaximalChordialDeviation;
		void SetMaximalChordialDeviation (const Standard_Real theChordialDeviation);

		/****************** SetMaximalParameterValue ******************/
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "* Defines the maximum value allowed for the first and last parameters of an infinite curve.
	:param theValue:
	:type theValue: float
	:rtype: None") SetMaximalParameterValue;
		void SetMaximalParameterValue (const Standard_Real theValue);

		/****************** SetOwnDatumAspects ******************/
		%feature("compactdefaultargs") SetOwnDatumAspects;
		%feature("autodoc", "* Sets own line aspects for datums. Returns False if own line for datums are already set.
	:param theDefaults: default value is opencascade::handle<Prs3d_Drawer>()
	:type theDefaults: Prs3d_Drawer
	:rtype: bool") SetOwnDatumAspects;
		Standard_Boolean SetOwnDatumAspects (const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetOwnLineAspects ******************/
		%feature("compactdefaultargs") SetOwnLineAspects;
		%feature("autodoc", "* Sets own line aspects. Returns False if own line aspect are already set.
	:param theDefaults: default value is opencascade::handle<Prs3d_Drawer>()
	:type theDefaults: Prs3d_Drawer
	:rtype: bool") SetOwnLineAspects;
		Standard_Boolean SetOwnLineAspects (const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetPlaneAspect ******************/
		%feature("compactdefaultargs") SetPlaneAspect;
		%feature("autodoc", "* Sets the parameter theAspect for the display of planes.
	:param theAspect:
	:type theAspect: Prs3d_PlaneAspect
	:rtype: None") SetPlaneAspect;
		void SetPlaneAspect (const opencascade::handle<Prs3d_PlaneAspect> & theAspect);

		/****************** SetPointAspect ******************/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "* Sets the parameter theAspect for display attributes of points
	:param theAspect:
	:type theAspect: Prs3d_PointAspect
	:rtype: None") SetPointAspect;
		void SetPointAspect (const opencascade::handle<Prs3d_PointAspect> & theAspect);

		/****************** SetSectionAspect ******************/
		%feature("compactdefaultargs") SetSectionAspect;
		%feature("autodoc", "* Sets the parameter theAspect for display attributes of sections.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetSectionAspect;
		void SetSectionAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetSeenLineAspect ******************/
		%feature("compactdefaultargs") SetSeenLineAspect;
		%feature("autodoc", "* Sets the parameter theAspect for the display of seen lines in hidden line removal mode.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetSeenLineAspect;
		void SetSeenLineAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetShaderProgram ******************/
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "* Assign shader program for specified type of primitives. @param theProgram new program to set (might be NULL) @param theAspect the type of primitives @param theToOverrideDefaults if true then non-overridden attributes using defaults will be allocated and copied from the Link;  otherwise, only already customized attributes will be changed returns True if presentation should be recomputed after creating aspects not previously customized (if theToOverrideDefaults is also True)
	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram
	:param theAspect:
	:type theAspect: Graphic3d_GroupAspect
	:param theToOverrideDefaults: default value is false
	:type theToOverrideDefaults: bool
	:rtype: bool") SetShaderProgram;
		bool SetShaderProgram (const opencascade::handle<Graphic3d_ShaderProgram> & theProgram,const Graphic3d_GroupAspect theAspect,const bool theToOverrideDefaults = false);

		/****************** SetShadingAspect ******************/
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "* Sets the parameter theAspect for display attributes of shading.
	:param theAspect:
	:type theAspect: Prs3d_ShadingAspect
	:rtype: None") SetShadingAspect;
		void SetShadingAspect (const opencascade::handle<Prs3d_ShadingAspect> & theAspect);

		/****************** SetShadingModel ******************/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "* Sets Shading Model type for the shading aspect.
	:param theModel:
	:type theModel: Graphic3d_TypeOfShadingModel
	:param theToOverrideDefaults: default value is false
	:type theToOverrideDefaults: bool
	:rtype: bool") SetShadingModel;
		bool SetShadingModel (Graphic3d_TypeOfShadingModel theModel,bool theToOverrideDefaults = false);

		/****************** SetTextAspect ******************/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "* Sets the parameter theAspect for display attributes of text.
	:param theAspect:
	:type theAspect: Prs3d_TextAspect
	:rtype: None") SetTextAspect;
		void SetTextAspect (const opencascade::handle<Prs3d_TextAspect> & theAspect);

		/****************** SetTypeOfDeflection ******************/
		%feature("compactdefaultargs") SetTypeOfDeflection;
		%feature("autodoc", "* Sets the type of chordal deflection. This indicates whether the deflection value is absolute or relative to the size of the object.
	:param theTypeOfDeflection:
	:type theTypeOfDeflection: Aspect_TypeOfDeflection
	:rtype: None") SetTypeOfDeflection;
		void SetTypeOfDeflection (const Aspect_TypeOfDeflection theTypeOfDeflection);

		/****************** SetTypeOfHLR ******************/
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "* Sets the type of HLR algorithm used by drawer's interactive objects
	:param theTypeOfHLR:
	:type theTypeOfHLR: Prs3d_TypeOfHLR
	:rtype: None") SetTypeOfHLR;
		void SetTypeOfHLR (const Prs3d_TypeOfHLR theTypeOfHLR);

		/****************** SetUIsoAspect ******************/
		%feature("compactdefaultargs") SetUIsoAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Prs3d_IsoAspect
	:rtype: None") SetUIsoAspect;
		void SetUIsoAspect (const opencascade::handle<Prs3d_IsoAspect> & theAspect);

		/****************** SetUnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") SetUnFreeBoundaryAspect;
		%feature("autodoc", "* Sets the parameter theAspect for the display of shared boundaries. The method sets aspect owned by the drawer that will be used during visualization instead of the one set in link.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetUnFreeBoundaryAspect;
		void SetUnFreeBoundaryAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetUnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") SetUnFreeBoundaryDraw;
		%feature("autodoc", "* Enables or disables drawing of shared boundaries for shading presentations. The method sets drawing flag owned by the drawer that will be used during visualization instead of the one set in link. theIsEnabled is a boolean flag indicating whether the shared boundaries should be drawn or not.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetUnFreeBoundaryDraw;
		void SetUnFreeBoundaryDraw (const Standard_Boolean theIsEnabled);

		/****************** SetVIsoAspect ******************/
		%feature("compactdefaultargs") SetVIsoAspect;
		%feature("autodoc", "* Sets the appearance of V isoparameters - theAspect.
	:param theAspect:
	:type theAspect: Prs3d_IsoAspect
	:rtype: None") SetVIsoAspect;
		void SetVIsoAspect (const opencascade::handle<Prs3d_IsoAspect> & theAspect);

		/****************** SetVectorAspect ******************/
		%feature("compactdefaultargs") SetVectorAspect;
		%feature("autodoc", "* Sets the modality theAspect for the display of vectors.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetVectorAspect;
		void SetVectorAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetVertexDrawMode ******************/
		%feature("compactdefaultargs") SetVertexDrawMode;
		%feature("autodoc", "* Sets the mode of visualization of vertices of a TopoDS_Shape instance. By default, only stand-alone vertices (not belonging topologically to an edge) are drawn, that corresponds to Prs3d_VDM_Standalone mode. Switching to Prs3d_VDM_Standalone mode makes all shape's vertices visible. To inherit this parameter from the global drawer instance ('the link') when it is present, Prs3d_VDM_Inherited value should be used.
	:param theMode:
	:type theMode: Prs3d_VertexDrawMode
	:rtype: None") SetVertexDrawMode;
		void SetVertexDrawMode (const Prs3d_VertexDrawMode theMode);

		/****************** SetWireAspect ******************/
		%feature("compactdefaultargs") SetWireAspect;
		%feature("autodoc", "* Sets the parameter theAspect for display of wires.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetWireAspect;
		void SetWireAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetWireDraw ******************/
		%feature("compactdefaultargs") SetWireDraw;
		%feature("autodoc", "* Sets WireDraw on or off by setting the parameter theIsEnabled to true or false.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetWireDraw;
		void SetWireDraw (const Standard_Boolean theIsEnabled);

		/****************** SetupOwnFaceBoundaryAspect ******************/
		%feature("compactdefaultargs") SetupOwnFaceBoundaryAspect;
		%feature("autodoc", "* Sets own face boundary aspect. Returns False if the drawer already has its own attribute for face boundary aspect.
	:param theDefaults: default value is opencascade::handle<Prs3d_Drawer>()
	:type theDefaults: Prs3d_Drawer
	:rtype: bool") SetupOwnFaceBoundaryAspect;
		Standard_Boolean SetupOwnFaceBoundaryAspect (const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetupOwnPointAspect ******************/
		%feature("compactdefaultargs") SetupOwnPointAspect;
		%feature("autodoc", "* Sets own point aspect. Returns False if the drawer already has its own attribute for point aspect.
	:param theDefaults: default value is opencascade::handle<Prs3d_Drawer>()
	:type theDefaults: Prs3d_Drawer
	:rtype: bool") SetupOwnPointAspect;
		Standard_Boolean SetupOwnPointAspect (const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** SetupOwnShadingAspect ******************/
		%feature("compactdefaultargs") SetupOwnShadingAspect;
		%feature("autodoc", "* Sets own shading aspect. Returns False if the drawer already has its own attribute for shading aspect.
	:param theDefaults: default value is opencascade::handle<Prs3d_Drawer>()
	:type theDefaults: Prs3d_Drawer
	:rtype: bool") SetupOwnShadingAspect;
		Standard_Boolean SetupOwnShadingAspect (const opencascade::handle<Prs3d_Drawer> & theDefaults = opencascade::handle<Prs3d_Drawer>());

		/****************** ShadingAspect ******************/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "* Returns settings for shading aspects. These settings can be edited. The default values are: - Color: Quantity_NOC_YELLOW - Material: Graphic3d_NOM_BRASS Shading aspect is obtained through decomposition of 3d faces into triangles, each side of each triangle being a chord of the corresponding curved edge in the face. Reflection of light in each projector perspective is then calculated for each of the resultant triangular planes.
	:rtype: opencascade::handle<Prs3d_ShadingAspect>") ShadingAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & ShadingAspect ();

		/****************** TextAspect ******************/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "* Returns settings for text aspect. These settings can be edited. The default value is: - Color: Quantity_NOC_YELLOW
	:rtype: opencascade::handle<Prs3d_TextAspect>") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect ();

		/****************** TypeOfDeflection ******************/
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "* Returns the type of chordal deflection. This indicates whether the deflection value is absolute or relative to the size of the object.
	:rtype: Aspect_TypeOfDeflection") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection ();

		/****************** TypeOfHLR ******************/
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "* Returns the type of HLR algorithm currently in use.
	:rtype: Prs3d_TypeOfHLR") TypeOfHLR;
		Prs3d_TypeOfHLR TypeOfHLR ();

		/****************** UIsoAspect ******************/
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "* Defines the attributes which are used when drawing an U isoparametric curve of a face. Defines the number of U isoparametric curves to be drawn for a single face. The LineAspect for U isoparametric lines can be edited (methods SetColor, SetTypeOfLine, SetWidth, SetNumber) The default values are: COLOR : Quantity_NOC_GRAY75 TYPE OF LINE: Aspect_TOL_SOLID WIDTH : 0.5 //! These attributes are used by the following algorithms: Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace
	:rtype: opencascade::handle<Prs3d_IsoAspect>") UIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & UIsoAspect ();

		/****************** UnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "* Returns settings for shared boundary line aspects. The LineAspect for the unfree boundaries can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_SOLID Width: 1. These attributes are used by the algorithm Prs3d_WFShape
	:rtype: opencascade::handle<Prs3d_LineAspect>") UnFreeBoundaryAspect;
		const opencascade::handle<Prs3d_LineAspect> & UnFreeBoundaryAspect ();

		/****************** UnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "* Returns True if the drawing of the shared boundaries is enabled. True is the default setting.
	:rtype: bool") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw ();

		/****************** UnsetFaceBoundaryUpperContinuity ******************/
		%feature("compactdefaultargs") UnsetFaceBoundaryUpperContinuity;
		%feature("autodoc", "* Unset the most edge continuity class for face boundaries.
	:rtype: None") UnsetFaceBoundaryUpperContinuity;
		void UnsetFaceBoundaryUpperContinuity ();

		/****************** UpdatePreviousDeviationAngle ******************/
		%feature("compactdefaultargs") UpdatePreviousDeviationAngle;
		%feature("autodoc", "* Updates the previous deviation angle to the current value
	:rtype: None") UpdatePreviousDeviationAngle;
		void UpdatePreviousDeviationAngle ();

		/****************** UpdatePreviousDeviationCoefficient ******************/
		%feature("compactdefaultargs") UpdatePreviousDeviationCoefficient;
		%feature("autodoc", "* Updates the previous value used for the chordal deviation coefficient to the current state.
	:rtype: None") UpdatePreviousDeviationCoefficient;
		void UpdatePreviousDeviationCoefficient ();

		/****************** VIsoAspect ******************/
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "* Defines the attributes which are used when drawing an V isoparametric curve of a face. Defines the number of V isoparametric curves to be drawn for a single face. The LineAspect for V isoparametric lines can be edited (methods SetColor, SetTypeOfLine, SetWidth, SetNumber) The default values are: COLOR : Quantity_NOC_GRAY82 TYPE OF LINE: Aspect_TOL_SOLID WIDTH : 0.5 //! These attributes are used by the following algorithms: Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace
	:rtype: opencascade::handle<Prs3d_IsoAspect>") VIsoAspect;
		const opencascade::handle<Prs3d_IsoAspect> & VIsoAspect ();

		/****************** VectorAspect ******************/
		%feature("compactdefaultargs") VectorAspect;
		%feature("autodoc", "* Returns settings for the appearance of vectors. These settings can be edited. The default values are: Color: Quantity_NOC_SKYBLUE Type of line: Aspect_TOL_SOLID Width: 1.0
	:rtype: opencascade::handle<Prs3d_LineAspect>") VectorAspect;
		const opencascade::handle<Prs3d_LineAspect> & VectorAspect ();

		/****************** VertexDrawMode ******************/
		%feature("compactdefaultargs") VertexDrawMode;
		%feature("autodoc", "* Returns the current mode of visualization of vertices of a TopoDS_Shape instance.
	:rtype: Prs3d_VertexDrawMode") VertexDrawMode;
		Prs3d_VertexDrawMode VertexDrawMode ();

		/****************** WireAspect ******************/
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "* Returns wire aspect settings. The LineAspect for the free boundaries can be edited. The default values are: Color: Quantity_NOC_GREEN Type of line: Aspect_TOL_SOLID Width: 1.0 These attributes are used by the algorithm Prs3d_WFShape.
	:rtype: opencascade::handle<Prs3d_LineAspect>") WireAspect;
		const opencascade::handle<Prs3d_LineAspect> & WireAspect ();

		/****************** WireDraw ******************/
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "* Returns True if the drawing of the wire is enabled.
	:rtype: bool") WireDraw;
		Standard_Boolean WireDraw ();

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
		/****************** CalculateBoundBox ******************/
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "* Do nothing - axis-aligned bounding box should be initialized from parent structure.
	:rtype: void") CalculateBoundBox;
		virtual void CalculateBoundBox ();

		/****************** ParentAffinity ******************/
		%feature("compactdefaultargs") ParentAffinity;
		%feature("autodoc", "* Returns view affinity of the parent presentation
	:rtype: inline  opencascade::handle<Graphic3d_ViewAffinity>") ParentAffinity;
		inline const opencascade::handle<Graphic3d_ViewAffinity> & ParentAffinity ();

		/****************** ParentId ******************/
		%feature("compactdefaultargs") ParentId;
		%feature("autodoc", "* Returns the id of the parent presentation
	:rtype: inline int") ParentId;
		inline Standard_Integer ParentId ();

		/****************** Prs3d_PresentationShadow ******************/
		%feature("compactdefaultargs") Prs3d_PresentationShadow;
		%feature("autodoc", "* Constructs a shadow of existing presentation object.
	:param theViewer:
	:type theViewer: Graphic3d_StructureManager
	:param thePrs:
	:type thePrs: Graphic3d_Structure
	:rtype: None") Prs3d_PresentationShadow;
		 Prs3d_PresentationShadow (const opencascade::handle<Graphic3d_StructureManager> & theViewer,const opencascade::handle<Graphic3d_Structure> & thePrs);

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
		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "* Returns a projector object for use in a hidden line removal algorithm.
	:rtype: HLRAlgo_Projector") Projector;
		HLRAlgo_Projector Projector ();

		/****************** Prs3d_Projector ******************/
		%feature("compactdefaultargs") Prs3d_Projector;
		%feature("autodoc", ":param Pr:
	:type Pr: HLRAlgo_Projector
	:rtype: None") Prs3d_Projector;
		 Prs3d_Projector (const HLRAlgo_Projector & Pr);

		/****************** Prs3d_Projector ******************/
		%feature("compactdefaultargs") Prs3d_Projector;
		%feature("autodoc", "* Constructs a projector framework from the following parameters - Pers is true if the view is a perspective view and false if it is an axonometric one; - Focus is the focal length if a perspective view is defined; - DX, DY and DZ are the coordinates of the projection vector; - XAt, YAt and ZAt are the coordinates of the view point; - XUp, YUp and ZUp are the coordinates of the vertical direction vector.
	:param Pers:
	:type Pers: bool
	:param Focus:
	:type Focus: float
	:param DX:
	:type DX: float
	:param DY:
	:type DY: float
	:param DZ:
	:type DZ: float
	:param XAt:
	:type XAt: float
	:param YAt:
	:type YAt: float
	:param ZAt:
	:type ZAt: float
	:param XUp:
	:type XUp: float
	:param YUp:
	:type YUp: float
	:param ZUp:
	:type ZUp: float
	:rtype: None") Prs3d_Projector;
		 Prs3d_Projector (const Standard_Boolean Pers,const Standard_Real Focus,const Standard_Real DX,const Standard_Real DY,const Standard_Real DZ,const Standard_Real XAt,const Standard_Real YAt,const Standard_Real ZAt,const Standard_Real XUp,const Standard_Real YUp,const Standard_Real ZUp);

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
		%feature("autodoc", "* Returns the current (last created) group of primititves inside graphic objects in the display. A group also contains the attributes whose ranges are limited to the primitives in it.
	:param thePrs3d:
	:type thePrs3d: Prs3d_Presentation
	:rtype: opencascade::handle<Graphic3d_Group>") CurrentGroup;
		static opencascade::handle<Graphic3d_Group> CurrentGroup (const opencascade::handle<Prs3d_Presentation> & thePrs3d);

		/****************** NewGroup ******************/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "* Returns the new group of primitives inside graphic objects in the display. A group also contains the attributes whose ranges are limited to the primitives in it.
	:param thePrs3d:
	:type thePrs3d: Prs3d_Presentation
	:rtype: opencascade::handle<Graphic3d_Group>") NewGroup;
		static opencascade::handle<Graphic3d_Group> NewGroup (const opencascade::handle<Prs3d_Presentation> & thePrs3d);

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
		/****************** CurrentTriangulation ******************/
		%feature("compactdefaultargs") CurrentTriangulation;
		%feature("autodoc", ":param l:
	:type l: TopLoc_Location
	:rtype: opencascade::handle<Poly_Triangulation>") CurrentTriangulation;
		opencascade::handle<Poly_Triangulation> CurrentTriangulation (TopLoc_Location & l);

		/****************** CurveBound ******************/
		%feature("compactdefaultargs") CurveBound;
		%feature("autodoc", ":rtype: Bnd_Box") CurveBound;
		Bnd_Box CurveBound ();

		/****************** FaceBound ******************/
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", ":rtype: Bnd_Box") FaceBound;
		Bnd_Box FaceBound ();

		/****************** FacesOfEdge ******************/
		%feature("compactdefaultargs") FacesOfEdge;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") FacesOfEdge;
		opencascade::handle<TopTools_HSequenceOfShape> FacesOfEdge ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", ":rtype: TopoDS_Edge") GetCurve;
		const TopoDS_Edge  GetCurve ();

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", ":rtype: TopoDS_Face") GetFace;
		const TopoDS_Face  GetFace ();

		/****************** GetVertex ******************/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") GetVertex;
		const TopoDS_Vertex  GetVertex ();

		/****************** HasCurve ******************/
		%feature("compactdefaultargs") HasCurve;
		%feature("autodoc", ":rtype: bool") HasCurve;
		Standard_Boolean HasCurve ();

		/****************** HasSurface ******************/
		%feature("compactdefaultargs") HasSurface;
		%feature("autodoc", ":rtype: bool") HasSurface;
		Standard_Boolean HasSurface ();

		/****************** InitCurve ******************/
		%feature("compactdefaultargs") InitCurve;
		%feature("autodoc", ":rtype: None") InitCurve;
		void InitCurve ();

		/****************** InitFace ******************/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", ":rtype: None") InitFace;
		void InitFace ();

		/****************** InitVertex ******************/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", ":rtype: None") InitVertex;
		void InitVertex ();

		/****************** IsPlanarFace ******************/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", ":rtype: bool") IsPlanarFace;
		Standard_Boolean IsPlanarFace ();

		/****************** IsPlanarFace ******************/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", ":param theFace:
	:type theFace: TopoDS_Face
	:rtype: bool") IsPlanarFace;
		static Standard_Boolean IsPlanarFace (const TopoDS_Face & theFace);

		/****************** MoreCurve ******************/
		%feature("compactdefaultargs") MoreCurve;
		%feature("autodoc", ":rtype: bool") MoreCurve;
		Standard_Boolean MoreCurve ();

		/****************** MoreFace ******************/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", ":rtype: bool") MoreFace;
		Standard_Boolean MoreFace ();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", ":rtype: bool") MoreVertex;
		Standard_Boolean MoreVertex ();

		/****************** Neighbours ******************/
		%feature("compactdefaultargs") Neighbours;
		%feature("autodoc", ":rtype: int") Neighbours;
		Standard_Integer Neighbours ();

		/****************** NextCurve ******************/
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", ":rtype: None") NextCurve;
		void NextCurve ();

		/****************** NextFace ******************/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", ":rtype: None") NextFace;
		void NextFace ();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", ":rtype: None") NextVertex;
		void NextVertex ();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", ":param l:
	:type l: TopLoc_Location
	:rtype: opencascade::handle<Poly_Polygon3D>") Polygon3D;
		opencascade::handle<Poly_Polygon3D> Polygon3D (TopLoc_Location & l);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", ":param Indices:
	:type Indices: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:param l:
	:type l: TopLoc_Location
	:rtype: None") PolygonOnTriangulation;
		void PolygonOnTriangulation (opencascade::handle<Poly_PolygonOnTriangulation> & Indices,opencascade::handle<Poly_Triangulation> & T,TopLoc_Location & l);

		/****************** Prs3d_ShapeTool ******************/
		%feature("compactdefaultargs") Prs3d_ShapeTool;
		%feature("autodoc", "* Constructs the tool and initializes it using theShape and theAllVertices (optional) arguments. By default, only isolated and internal vertices are considered, however if theAllVertices argument is equal to True, all shape's vertices are taken into account.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theAllVertices: default value is Standard_False
	:type theAllVertices: bool
	:rtype: None") Prs3d_ShapeTool;
		 Prs3d_ShapeTool (const TopoDS_Shape & theShape,const Standard_Boolean theAllVertices = Standard_False);

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
		%feature("autodoc", "* Generate primitives for 3D quadric surface and fill the given array. Optional transformation is applied.
	:param theArray:
	:type theArray: Graphic3d_ArrayOfTriangles
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None") FillArray;
		void FillArray (opencascade::handle<Graphic3d_ArrayOfTriangles> & theArray,const gp_Trsf & theTrsf);

		/****************** FillArray ******************/
		%feature("compactdefaultargs") FillArray;
		%feature("autodoc", "* Generate primitives for 3D quadric surface presentation and fill the given array and poly triangulation structure. Optional transformation is applied.
	:param theArray:
	:type theArray: Graphic3d_ArrayOfTriangles
	:param theTriangulation:
	:type theTriangulation: Poly_Triangulation
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None") FillArray;
		void FillArray (opencascade::handle<Graphic3d_ArrayOfTriangles> & theArray,opencascade::handle<Poly_Triangulation> & theTriangulation,const gp_Trsf & theTrsf);

		/****************** TrianglesNb ******************/
		%feature("compactdefaultargs") TrianglesNb;
		%feature("autodoc", "* Number of triangles for presentation with the given params.
	:param theSlicesNb:
	:type theSlicesNb: int
	:param theStacksNb:
	:type theStacksNb: int
	:rtype: int") TrianglesNb;
		static Standard_Integer TrianglesNb (const Standard_Integer theSlicesNb,const Standard_Integer theStacksNb);

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
		%feature("autodoc", "* Defines the representation of the arrow. Note that this method does NOT assign any presentation aspects to the primitives group! @param theGroup presentation group to add primitives @param theLocation location of the arrow tip @param theDirection direction of the arrow @param theAngle angle of opening of the arrow head @param theLength length of the arrow (from the tip)
	:param theGroup:
	:type theGroup: Graphic3d_Group
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theDirection:
	:type theDirection: gp_Dir
	:param theAngle:
	:type theAngle: float
	:param theLength:
	:type theLength: float
	:rtype: void") Draw;
		static void Draw (const opencascade::handle<Graphic3d_Group> & theGroup,const gp_Pnt & theLocation,const gp_Dir & theDirection,const Standard_Real theAngle,const Standard_Real theLength);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "* Alias to another method Draw() for backward compatibility.
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theDirection:
	:type theDirection: gp_Dir
	:param theAngle:
	:type theAngle: float
	:param theLength:
	:type theLength: float
	:rtype: None") Draw;
		static void Draw (const opencascade::handle<Prs3d_Presentation> & thePrs,const gp_Pnt & theLocation,const gp_Dir & theDirection,const Standard_Real theAngle,const Standard_Real theLength);

		/****************** DrawSegments ******************/
		%feature("compactdefaultargs") DrawSegments;
		%feature("autodoc", "* Defines the representation of the arrow as a container of segments. @param theLocation location of the arrow tip @param theDir direction of the arrow @param theAngle angle of opening of the arrow head @param theLength length of the arrow (from the tip) @param theNbSegments count of points on polyline where location is connected
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theDir:
	:type theDir: gp_Dir
	:param theAngle:
	:type theAngle: float
	:param theLength:
	:type theLength: float
	:param theNbSegments:
	:type theNbSegments: int
	:rtype: opencascade::handle<Graphic3d_ArrayOfSegments>") DrawSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> DrawSegments (const gp_Pnt & theLocation,const gp_Dir & theDir,const Standard_Real theAngle,const Standard_Real theLength,const Standard_Integer theNbSegments);

		/****************** DrawShaded ******************/
		%feature("compactdefaultargs") DrawShaded;
		%feature("autodoc", "* Defines the representation of the arrow as shaded triangulation. @param theAxis axis definition (arrow origin and direction) @param theTubeRadius tube (cylinder) radius @param theAxisLength overall arrow length (cylinder + cone) @param theConeRadius cone radius (arrow tip) @param theConeLength cone length (arrow tip) @param theNbFacettes tessellation quality for each part
	:param theAxis:
	:type theAxis: gp_Ax1
	:param theTubeRadius:
	:type theTubeRadius: float
	:param theAxisLength:
	:type theAxisLength: float
	:param theConeRadius:
	:type theConeRadius: float
	:param theConeLength:
	:type theConeLength: float
	:param theNbFacettes:
	:type theNbFacettes: int
	:rtype: opencascade::handle<Graphic3d_ArrayOfTriangles>") DrawShaded;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> DrawShaded (const gp_Ax1 & theAxis,const Standard_Real theTubeRadius,const Standard_Real theAxisLength,const Standard_Real theConeRadius,const Standard_Real theConeLength,const Standard_Integer theNbFacettes);

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
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* returns the current value of the angle used when drawing an arrow.
	:rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Aspect ******************/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", ":rtype: opencascade::handle<Graphic3d_AspectLine3d>") Aspect;
		const opencascade::handle<Graphic3d_AspectLine3d> & Aspect ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Returns the current value of the length used when drawing an arrow.
	:rtype: float") Length;
		Standard_Real Length ();

		/****************** Prs3d_ArrowAspect ******************/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "* Constructs an empty framework for displaying arrows in representations of lengths. The lengths displayed are either on their own or in chamfers, fillets, diameters and radii.
	:rtype: None") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect ();

		/****************** Prs3d_ArrowAspect ******************/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "* Constructs a framework to display an arrow with a shaft of the length aLength and having a head with sides at the angle anAngle from each other.
	:param anAngle:
	:type anAngle: float
	:param aLength:
	:type aLength: float
	:rtype: None") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect (const Standard_Real anAngle,const Standard_Real aLength);

		/****************** Prs3d_ArrowAspect ******************/
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectLine3d
	:rtype: None") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect (const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "* defines the angle of the arrows.
	:param anAngle:
	:type anAngle: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real anAngle);

		/****************** SetAspect ******************/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectLine3d
	:rtype: None") SetAspect;
		void SetAspect (const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", ":param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetLength ******************/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "* Defines the length of the arrows.
	:param theLength:
	:type theLength: float
	:rtype: None") SetLength;
		void SetLength (const Standard_Real theLength);

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
		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "* Returns the arrow aspect of presentation
	:rtype: opencascade::handle<Prs3d_ArrowAspect>") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect ();

		/****************** ArrowPartForAxis ******************/
		%feature("compactdefaultargs") ArrowPartForAxis;
		%feature("autodoc", "* Returns type of arrow for a type of axis
	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: Prs3d_DatumParts") ArrowPartForAxis;
		Prs3d_DatumParts ArrowPartForAxis (Prs3d_DatumParts thePart);

		/****************** Attribute ******************/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "* Returns the attribute of the datum type
	:param theType:
	:type theType: Prs3d_DatumAttribute
	:rtype: float") Attribute;
		Standard_Real Attribute (Prs3d_DatumAttribute theType);

		/****************** AxisLength ******************/
		%feature("compactdefaultargs") AxisLength;
		%feature("autodoc", "* Returns the length of the displayed first axis.
	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: float") AxisLength;
		Standard_Real AxisLength (Prs3d_DatumParts thePart);

		/****************** DatumAxes ******************/
		%feature("compactdefaultargs") DatumAxes;
		%feature("autodoc", "* Returns axes used in the datum aspect
	:rtype: Prs3d_DatumAxes") DatumAxes;
		Prs3d_DatumAxes DatumAxes ();

		/****************** DrawDatumPart ******************/
		%feature("compactdefaultargs") DrawDatumPart;
		%feature("autodoc", "* Returns true if the given part is used in axes of aspect
	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: bool") DrawDatumPart;
		Standard_Boolean DrawDatumPart (Prs3d_DatumParts thePart);

		/****************** DrawFirstAndSecondAxis ******************/
		%feature("compactdefaultargs") DrawFirstAndSecondAxis;
		%feature("autodoc", "* Returns true if the first and second axes can be drawn.
	:rtype: bool") DrawFirstAndSecondAxis;
		Standard_Boolean DrawFirstAndSecondAxis ();

		/****************** DrawThirdAxis ******************/
		%feature("compactdefaultargs") DrawThirdAxis;
		%feature("autodoc", "* Returns true if the third axis can be drawn.
	:rtype: bool") DrawThirdAxis;
		Standard_Boolean DrawThirdAxis ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** FirstAxisAspect ******************/
		%feature("compactdefaultargs") FirstAxisAspect;
		%feature("autodoc", "* Returns the attributes for display of the first axis.
	:rtype: opencascade::handle<Prs3d_LineAspect>") FirstAxisAspect;
		const opencascade::handle<Prs3d_LineAspect> & FirstAxisAspect ();

		/****************** FirstAxisLength ******************/
		%feature("compactdefaultargs") FirstAxisLength;
		%feature("autodoc", "* Returns the length of the displayed first axis.
	:rtype: float") FirstAxisLength;
		Standard_Real FirstAxisLength ();

		/****************** LineAspect ******************/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "* Returns the right-handed coordinate system set in SetComponent.
	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: opencascade::handle<Prs3d_LineAspect>") LineAspect;
		opencascade::handle<Prs3d_LineAspect> LineAspect (Prs3d_DatumParts thePart);

		/****************** PointAspect ******************/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "* Returns the point aspect of origin wireframe presentation
	:rtype: opencascade::handle<Prs3d_PointAspect>") PointAspect;
		const opencascade::handle<Prs3d_PointAspect> & PointAspect ();

		/****************** Prs3d_DatumAspect ******************/
		%feature("compactdefaultargs") Prs3d_DatumAspect;
		%feature("autodoc", "* An empty framework to define the display of datums.
	:rtype: None") Prs3d_DatumAspect;
		 Prs3d_DatumAspect ();

		/****************** SecondAxisAspect ******************/
		%feature("compactdefaultargs") SecondAxisAspect;
		%feature("autodoc", "* Returns the attributes for display of the second axis.
	:rtype: opencascade::handle<Prs3d_LineAspect>") SecondAxisAspect;
		const opencascade::handle<Prs3d_LineAspect> & SecondAxisAspect ();

		/****************** SecondAxisLength ******************/
		%feature("compactdefaultargs") SecondAxisLength;
		%feature("autodoc", "* Returns the length of the displayed second axis.
	:rtype: float") SecondAxisLength;
		Standard_Real SecondAxisLength ();

		/****************** SetArrowAspect ******************/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "* Sets the arrow aspect of presentation
	:param theAspect:
	:type theAspect: Prs3d_ArrowAspect
	:rtype: None") SetArrowAspect;
		void SetArrowAspect (const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****************** SetAttribute ******************/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "* Sets the attribute of the datum type
	:param theType:
	:type theType: Prs3d_DatumAttribute
	:param theValue:
	:type theValue: float
	:rtype: None") SetAttribute;
		void SetAttribute (Prs3d_DatumAttribute theType,const Standard_Real & theValue);

		/****************** SetAxisLength ******************/
		%feature("compactdefaultargs") SetAxisLength;
		%feature("autodoc", "* Sets the lengths of the three axes.
	:param theL1:
	:type theL1: float
	:param theL2:
	:type theL2: float
	:param theL3:
	:type theL3: float
	:rtype: None") SetAxisLength;
		void SetAxisLength (Standard_Real theL1,Standard_Real theL2,Standard_Real theL3);

		/****************** SetDrawArrows ******************/
		%feature("compactdefaultargs") SetDrawArrows;
		%feature("autodoc", "* Sets option to draw or not arrows for axes
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawArrows;
		void SetDrawArrows (Standard_Boolean theToDraw);

		/****************** SetDrawDatumAxes ******************/
		%feature("compactdefaultargs") SetDrawDatumAxes;
		%feature("autodoc", "* Sets the axes used in the datum aspect
	:param theType:
	:type theType: Prs3d_DatumAxes
	:rtype: None") SetDrawDatumAxes;
		void SetDrawDatumAxes (Prs3d_DatumAxes theType);

		/****************** SetDrawFirstAndSecondAxis ******************/
		%feature("compactdefaultargs") SetDrawFirstAndSecondAxis;
		%feature("autodoc", "* Sets the DrawFirstAndSecondAxis attributes to active.
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawFirstAndSecondAxis;
		void SetDrawFirstAndSecondAxis (Standard_Boolean theToDraw);

		/****************** SetDrawLabels ******************/
		%feature("compactdefaultargs") SetDrawLabels;
		%feature("autodoc", "* Sets option to draw or not to draw text labels for axes
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawLabels;
		void SetDrawLabels (Standard_Boolean theToDraw);

		/****************** SetDrawThirdAxis ******************/
		%feature("compactdefaultargs") SetDrawThirdAxis;
		%feature("autodoc", "* Sets the DrawThirdAxis attributes to active.
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawThirdAxis;
		void SetDrawThirdAxis (Standard_Boolean theToDraw);

		/****************** SetPointAspect ******************/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "* Returns the point aspect of origin wireframe presentation
	:param theAspect:
	:type theAspect: Prs3d_PointAspect
	:rtype: None") SetPointAspect;
		void SetPointAspect (const opencascade::handle<Prs3d_PointAspect> & theAspect);

		/****************** SetTextAspect ******************/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "* Sets text attributes for rendering labels.
	:param theTextAspect:
	:type theTextAspect: Prs3d_TextAspect
	:rtype: None") SetTextAspect;
		void SetTextAspect (const opencascade::handle<Prs3d_TextAspect> & theTextAspect);

		/****************** SetToDrawLabels ******************/
		%feature("compactdefaultargs") SetToDrawLabels;
		%feature("autodoc", ":param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetToDrawLabels;
		void SetToDrawLabels (Standard_Boolean theToDraw);

		/****************** ShadingAspect ******************/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "* Returns the right-handed coordinate system set in SetComponent.
	:param thePart:
	:type thePart: Prs3d_DatumParts
	:rtype: opencascade::handle<Prs3d_ShadingAspect>") ShadingAspect;
		opencascade::handle<Prs3d_ShadingAspect> ShadingAspect (Prs3d_DatumParts thePart);

		/****************** TextAspect ******************/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "* Returns the text attributes for rendering labels.
	:rtype: opencascade::handle<Prs3d_TextAspect>") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect ();

		/****************** ThirdAxisAspect ******************/
		%feature("compactdefaultargs") ThirdAxisAspect;
		%feature("autodoc", "* Returns the attributes for display of the third axis.
	:rtype: opencascade::handle<Prs3d_LineAspect>") ThirdAxisAspect;
		const opencascade::handle<Prs3d_LineAspect> & ThirdAxisAspect ();

		/****************** ThirdAxisLength ******************/
		%feature("compactdefaultargs") ThirdAxisLength;
		%feature("autodoc", "* Returns the length of the displayed third axis.
	:rtype: float") ThirdAxisLength;
		Standard_Real ThirdAxisLength ();

		/****************** ToDrawArrows ******************/
		%feature("compactdefaultargs") ToDrawArrows;
		%feature("autodoc", "* returns true if axes arrows are drawn; True by default.
	:rtype: bool") ToDrawArrows;
		Standard_Boolean ToDrawArrows ();

		/****************** ToDrawLabels ******************/
		%feature("compactdefaultargs") ToDrawLabels;
		%feature("autodoc", "* returns true if axes labels are drawn; True by default.
	:rtype: bool") ToDrawLabels;
		Standard_Boolean ToDrawLabels ();

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
		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "* Returns the settings for displaying arrows.
	:rtype: opencascade::handle<Prs3d_ArrowAspect>") ArrowAspect;
		const opencascade::handle<Prs3d_ArrowAspect> & ArrowAspect ();

		/****************** ArrowOrientation ******************/
		%feature("compactdefaultargs") ArrowOrientation;
		%feature("autodoc", "* Gets orientation of arrows (external or internal).
	:rtype: Prs3d_DimensionArrowOrientation") ArrowOrientation;
		Prs3d_DimensionArrowOrientation ArrowOrientation ();

		/****************** ArrowTailSize ******************/
		%feature("compactdefaultargs") ArrowTailSize;
		%feature("autodoc", "* Returns arrow tail size.
	:rtype: float") ArrowTailSize;
		Standard_Real ArrowTailSize ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** ExtensionSize ******************/
		%feature("compactdefaultargs") ExtensionSize;
		%feature("autodoc", "* Returns extension size.
	:rtype: float") ExtensionSize;
		Standard_Real ExtensionSize ();

		/****************** IsArrows3d ******************/
		%feature("compactdefaultargs") IsArrows3d;
		%feature("autodoc", "* Gets type of arrows.
	:rtype: bool") IsArrows3d;
		Standard_Boolean IsArrows3d ();

		/****************** IsText3d ******************/
		%feature("compactdefaultargs") IsText3d;
		%feature("autodoc", "* Check if text for dimension label is 3d.
	:rtype: bool") IsText3d;
		Standard_Boolean IsText3d ();

		/****************** IsTextShaded ******************/
		%feature("compactdefaultargs") IsTextShaded;
		%feature("autodoc", "* Check if 3d text for dimension label is shaded.
	:rtype: bool") IsTextShaded;
		Standard_Boolean IsTextShaded ();

		/****************** IsUnitsDisplayed ******************/
		%feature("compactdefaultargs") IsUnitsDisplayed;
		%feature("autodoc", "* Shows if Units are to be displayed along with dimension value.
	:rtype: bool") IsUnitsDisplayed;
		Standard_Boolean IsUnitsDisplayed ();

		/****************** LineAspect ******************/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "* Returns the settings for the display of lines used in presentation of dimensions.
	:rtype: opencascade::handle<Prs3d_LineAspect>") LineAspect;
		const opencascade::handle<Prs3d_LineAspect> & LineAspect ();

		/****************** MakeArrows3d ******************/
		%feature("compactdefaultargs") MakeArrows3d;
		%feature("autodoc", "* Sets type of arrows.
	:param theIsArrows3d:
	:type theIsArrows3d: bool
	:rtype: None") MakeArrows3d;
		void MakeArrows3d (const Standard_Boolean theIsArrows3d);

		/****************** MakeText3d ******************/
		%feature("compactdefaultargs") MakeText3d;
		%feature("autodoc", "* Sets type of text.
	:param isText3d:
	:type isText3d: bool
	:rtype: None") MakeText3d;
		void MakeText3d (const Standard_Boolean isText3d);

		/****************** MakeTextShaded ******************/
		%feature("compactdefaultargs") MakeTextShaded;
		%feature("autodoc", "* Turns on/off text shading for 3d text.
	:param theIsTextShaded:
	:type theIsTextShaded: bool
	:rtype: None") MakeTextShaded;
		void MakeTextShaded (const Standard_Boolean theIsTextShaded);

		/****************** MakeUnitsDisplayed ******************/
		%feature("compactdefaultargs") MakeUnitsDisplayed;
		%feature("autodoc", "* Specifies whether the units string should be displayed along with value label or not.
	:param theIsDisplayed:
	:type theIsDisplayed: bool
	:rtype: None") MakeUnitsDisplayed;
		void MakeUnitsDisplayed (const Standard_Boolean theIsDisplayed);

		/****************** Prs3d_DimensionAspect ******************/
		%feature("compactdefaultargs") Prs3d_DimensionAspect;
		%feature("autodoc", "* Constructs an empty framework to define the display of dimensions.
	:rtype: None") Prs3d_DimensionAspect;
		 Prs3d_DimensionAspect ();

		/****************** SetArrowAspect ******************/
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "* Sets the display attributes of arrows used in presentation of dimensions.
	:param theAspect:
	:type theAspect: Prs3d_ArrowAspect
	:rtype: None") SetArrowAspect;
		void SetArrowAspect (const opencascade::handle<Prs3d_ArrowAspect> & theAspect);

		/****************** SetArrowOrientation ******************/
		%feature("compactdefaultargs") SetArrowOrientation;
		%feature("autodoc", "* Sets orientation of arrows (external or internal). By default orientation is chosen automatically according to situation and text label size.
	:param theArrowOrient:
	:type theArrowOrient: Prs3d_DimensionArrowOrientation
	:rtype: None") SetArrowOrientation;
		void SetArrowOrientation (const Prs3d_DimensionArrowOrientation theArrowOrient);

		/****************** SetArrowTailSize ******************/
		%feature("compactdefaultargs") SetArrowTailSize;
		%feature("autodoc", "* Set size for arrow tail (extension without text).
	:param theSize:
	:type theSize: float
	:rtype: None") SetArrowTailSize;
		void SetArrowTailSize (const Standard_Real theSize);

		/****************** SetCommonColor ******************/
		%feature("compactdefaultargs") SetCommonColor;
		%feature("autodoc", "* Sets the same color for all parts of dimension: lines, arrows and text.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetCommonColor;
		void SetCommonColor (const Quantity_Color & theColor);

		/****************** SetExtensionSize ******************/
		%feature("compactdefaultargs") SetExtensionSize;
		%feature("autodoc", "* Sets extension size.
	:param theSize:
	:type theSize: float
	:rtype: None") SetExtensionSize;
		void SetExtensionSize (const Standard_Real theSize);

		/****************** SetLineAspect ******************/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "* Sets the display attributes of lines used in presentation of dimensions.
	:param theAspect:
	:type theAspect: Prs3d_LineAspect
	:rtype: None") SetLineAspect;
		void SetLineAspect (const opencascade::handle<Prs3d_LineAspect> & theAspect);

		/****************** SetTextAspect ******************/
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "* Sets the display attributes of text used in presentation of dimensions.
	:param theAspect:
	:type theAspect: Prs3d_TextAspect
	:rtype: None") SetTextAspect;
		void SetTextAspect (const opencascade::handle<Prs3d_TextAspect> & theAspect);

		/****************** SetTextHorizontalPosition ******************/
		%feature("compactdefaultargs") SetTextHorizontalPosition;
		%feature("autodoc", "* Sets horizontal text alignment for text label.
	:param thePosition:
	:type thePosition: Prs3d_DimensionTextHorizontalPosition
	:rtype: None") SetTextHorizontalPosition;
		void SetTextHorizontalPosition (const Prs3d_DimensionTextHorizontalPosition thePosition);

		/****************** SetTextVerticalPosition ******************/
		%feature("compactdefaultargs") SetTextVerticalPosition;
		%feature("autodoc", "* Sets vertical text alignment for text label.
	:param thePosition:
	:type thePosition: Prs3d_DimensionTextVerticalPosition
	:rtype: None") SetTextVerticalPosition;
		void SetTextVerticalPosition (const Prs3d_DimensionTextVerticalPosition thePosition);

		/****************** SetValueStringFormat ******************/
		%feature("compactdefaultargs") SetValueStringFormat;
		%feature("autodoc", "* Sets 'sprintf'-syntax format for formatting dimension value labels.
	:param theFormat:
	:type theFormat: TCollection_AsciiString
	:rtype: None") SetValueStringFormat;
		void SetValueStringFormat (const TCollection_AsciiString & theFormat);

		/****************** TextAspect ******************/
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "* Returns the settings for the display of text used in presentation of dimensions.
	:rtype: opencascade::handle<Prs3d_TextAspect>") TextAspect;
		const opencascade::handle<Prs3d_TextAspect> & TextAspect ();

		/****************** TextHorizontalPosition ******************/
		%feature("compactdefaultargs") TextHorizontalPosition;
		%feature("autodoc", "* Gets horizontal text alignment for text label.
	:rtype: Prs3d_DimensionTextHorizontalPosition") TextHorizontalPosition;
		Prs3d_DimensionTextHorizontalPosition TextHorizontalPosition ();

		/****************** TextVerticalPosition ******************/
		%feature("compactdefaultargs") TextVerticalPosition;
		%feature("autodoc", "* Gets vertical text alignment for text label.
	:rtype: Prs3d_DimensionTextVerticalPosition") TextVerticalPosition;
		Prs3d_DimensionTextVerticalPosition TextVerticalPosition ();

		/****************** ValueStringFormat ******************/
		%feature("compactdefaultargs") ValueStringFormat;
		%feature("autodoc", "* Returns format.
	:rtype: TCollection_AsciiString") ValueStringFormat;
		const TCollection_AsciiString & ValueStringFormat ();

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
		/****************** Aspect ******************/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "* Returns the line aspect. This is defined as the set of color, type and thickness attributes.
	:rtype: opencascade::handle<Graphic3d_AspectLine3d>") Aspect;
		const opencascade::handle<Graphic3d_AspectLine3d> & Aspect ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Prs3d_LineAspect ******************/
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", "* Constructs a framework for line aspect defined by - the color aColor - the type of line aType and - the line thickness aWidth. Type of line refers to whether the line is solid or dotted, for example.
	:param theColor:
	:type theColor: Quantity_Color
	:param theType:
	:type theType: Aspect_TypeOfLine
	:param theWidth:
	:type theWidth: float
	:rtype: None") Prs3d_LineAspect;
		 Prs3d_LineAspect (const Quantity_Color & theColor,const Aspect_TypeOfLine theType,const Standard_Real theWidth);

		/****************** Prs3d_LineAspect ******************/
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectLine3d
	:rtype: None") Prs3d_LineAspect;
		 Prs3d_LineAspect (const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** SetAspect ******************/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectLine3d
	:rtype: None") SetAspect;
		void SetAspect (const opencascade::handle<Graphic3d_AspectLine3d> & theAspect);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Sets the line color defined at the time of construction. Default value: Quantity_NOC_YELLOW
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetTypeOfLine ******************/
		%feature("compactdefaultargs") SetTypeOfLine;
		%feature("autodoc", "* Sets the type of line defined at the time of construction. This could, for example, be solid, dotted or made up of dashes. Default value: Aspect_TOL_SOLID
	:param theType:
	:type theType: Aspect_TypeOfLine
	:rtype: None") SetTypeOfLine;
		void SetTypeOfLine (const Aspect_TypeOfLine theType);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "* Sets the line width defined at the time of construction. Default value: 1.
	:param theWidth:
	:type theWidth: float
	:rtype: None") SetWidth;
		void SetWidth (const Standard_Real theWidth);

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
		/****************** ArrowAspect ******************/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "* Returns the settings for displaying an arrow.
	:rtype: opencascade::handle<Prs3d_LineAspect>") ArrowAspect;
		const opencascade::handle<Prs3d_LineAspect> & ArrowAspect ();

		/****************** ArrowsAngle ******************/
		%feature("compactdefaultargs") ArrowsAngle;
		%feature("autodoc", "* Returns the angle of the arrowhead used in the display of arrows involved in the presentation of planes.
	:rtype: float") ArrowsAngle;
		Standard_Real ArrowsAngle ();

		/****************** ArrowsLength ******************/
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "* Returns the length of the arrow shaft used in the display of arrows.
	:rtype: float") ArrowsLength;
		Standard_Real ArrowsLength ();

		/****************** ArrowsSize ******************/
		%feature("compactdefaultargs") ArrowsSize;
		%feature("autodoc", "* Returns the size of arrows used in the display of planes.
	:rtype: float") ArrowsSize;
		Standard_Real ArrowsSize ();

		/****************** DisplayCenterArrow ******************/
		%feature("compactdefaultargs") DisplayCenterArrow;
		%feature("autodoc", "* Returns true if the display of center arrows is allowed.
	:rtype: bool") DisplayCenterArrow;
		Standard_Boolean DisplayCenterArrow ();

		/****************** DisplayEdges ******************/
		%feature("compactdefaultargs") DisplayEdges;
		%feature("autodoc", ":rtype: bool") DisplayEdges;
		Standard_Boolean DisplayEdges ();

		/****************** DisplayEdgesArrows ******************/
		%feature("compactdefaultargs") DisplayEdgesArrows;
		%feature("autodoc", "* Returns true if the display of edge arrows is allowed.
	:rtype: bool") DisplayEdgesArrows;
		Standard_Boolean DisplayEdgesArrows ();

		/****************** DisplayIso ******************/
		%feature("compactdefaultargs") DisplayIso;
		%feature("autodoc", "* Returns true if the display of isoparameters is allowed.
	:rtype: bool") DisplayIso;
		Standard_Boolean DisplayIso ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** EdgesAspect ******************/
		%feature("compactdefaultargs") EdgesAspect;
		%feature("autodoc", "* Returns the attributes of displayed edges involved in the presentation of planes.
	:rtype: opencascade::handle<Prs3d_LineAspect>") EdgesAspect;
		const opencascade::handle<Prs3d_LineAspect> & EdgesAspect ();

		/****************** IsoAspect ******************/
		%feature("compactdefaultargs") IsoAspect;
		%feature("autodoc", "* Returns the attributes of displayed isoparameters involved in the presentation of planes.
	:rtype: opencascade::handle<Prs3d_LineAspect>") IsoAspect;
		const opencascade::handle<Prs3d_LineAspect> & IsoAspect ();

		/****************** IsoDistance ******************/
		%feature("compactdefaultargs") IsoDistance;
		%feature("autodoc", "* Returns the distance between isoparameters used in the display of planes.
	:rtype: float") IsoDistance;
		Standard_Real IsoDistance ();

		/****************** PlaneXLength ******************/
		%feature("compactdefaultargs") PlaneXLength;
		%feature("autodoc", "* Returns the length of the x axis used in the display of planes.
	:rtype: float") PlaneXLength;
		Standard_Real PlaneXLength ();

		/****************** PlaneYLength ******************/
		%feature("compactdefaultargs") PlaneYLength;
		%feature("autodoc", "* Returns the length of the y axis used in the display of planes.
	:rtype: float") PlaneYLength;
		Standard_Real PlaneYLength ();

		/****************** Prs3d_PlaneAspect ******************/
		%feature("compactdefaultargs") Prs3d_PlaneAspect;
		%feature("autodoc", "* Constructs an empty framework for the display of planes.
	:rtype: None") Prs3d_PlaneAspect;
		 Prs3d_PlaneAspect ();

		/****************** SetArrowsAngle ******************/
		%feature("compactdefaultargs") SetArrowsAngle;
		%feature("autodoc", "* Sets the angle of the arrowhead used in the display of arrows involved in the presentation of planes.
	:param theAngle:
	:type theAngle: float
	:rtype: None") SetArrowsAngle;
		void SetArrowsAngle (const Standard_Real theAngle);

		/****************** SetArrowsLength ******************/
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", ":param theLength:
	:type theLength: float
	:rtype: None") SetArrowsLength;
		void SetArrowsLength (const Standard_Real theLength);

		/****************** SetArrowsSize ******************/
		%feature("compactdefaultargs") SetArrowsSize;
		%feature("autodoc", "* Sets the angle of the arrowhead used in the display of planes.
	:param theSize:
	:type theSize: float
	:rtype: None") SetArrowsSize;
		void SetArrowsSize (const Standard_Real theSize);

		/****************** SetDisplayCenterArrow ******************/
		%feature("compactdefaultargs") SetDisplayCenterArrow;
		%feature("autodoc", "* Sets the display attributes defined in DisplayCenterArrow to active.
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDisplayCenterArrow;
		void SetDisplayCenterArrow (const Standard_Boolean theToDraw);

		/****************** SetDisplayEdges ******************/
		%feature("compactdefaultargs") SetDisplayEdges;
		%feature("autodoc", ":param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDisplayEdges;
		void SetDisplayEdges (const Standard_Boolean theToDraw);

		/****************** SetDisplayEdgesArrows ******************/
		%feature("compactdefaultargs") SetDisplayEdgesArrows;
		%feature("autodoc", "* Sets the display attributes defined in DisplayEdgesArrows to active.
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDisplayEdgesArrows;
		void SetDisplayEdgesArrows (const Standard_Boolean theToDraw);

		/****************** SetDisplayIso ******************/
		%feature("compactdefaultargs") SetDisplayIso;
		%feature("autodoc", "* Sets the display attributes defined in DisplayIso to active.
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDisplayIso;
		void SetDisplayIso (const Standard_Boolean theToDraw);

		/****************** SetIsoDistance ******************/
		%feature("compactdefaultargs") SetIsoDistance;
		%feature("autodoc", "* Sets the distance L between isoparameters used in the display of planes.
	:param theL:
	:type theL: float
	:rtype: None") SetIsoDistance;
		void SetIsoDistance (const Standard_Real theL);

		/****************** SetPlaneLength ******************/
		%feature("compactdefaultargs") SetPlaneLength;
		%feature("autodoc", ":param theLX:
	:type theLX: float
	:param theLY:
	:type theLY: float
	:rtype: None") SetPlaneLength;
		void SetPlaneLength (const Standard_Real theLX,const Standard_Real theLY);

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
		/****************** Aspect ******************/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", ":rtype: opencascade::handle<Graphic3d_AspectMarker3d>") Aspect;
		const opencascade::handle<Graphic3d_AspectMarker3d> & Aspect ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** GetTexture ******************/
		%feature("compactdefaultargs") GetTexture;
		%feature("autodoc", "* Returns marker's texture.
	:rtype: opencascade::handle<Graphic3d_MarkerImage>") GetTexture;
		const opencascade::handle<Graphic3d_MarkerImage> & GetTexture ();

		/****************** GetTextureSize ******************/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "* Returns marker's texture size.
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Prs3d_PointAspect ******************/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", ":param theType:
	:type theType: Aspect_TypeOfMarker
	:param theColor:
	:type theColor: Quantity_Color
	:param theScale:
	:type theScale: float
	:rtype: None") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Aspect_TypeOfMarker theType,const Quantity_Color & theColor,const Standard_Real theScale);

		/****************** Prs3d_PointAspect ******************/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "* Defines the user defined marker point.
	:param theColor:
	:type theColor: Quantity_Color
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theTexture:
	:type theTexture: TColStd_HArray1OfByte
	:rtype: None") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Quantity_Color & theColor,const Standard_Integer theWidth,const Standard_Integer theHeight,const opencascade::handle<TColStd_HArray1OfByte> & theTexture);

		/****************** Prs3d_PointAspect ******************/
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectMarker3d
	:rtype: None") Prs3d_PointAspect;
		 Prs3d_PointAspect (const opencascade::handle<Graphic3d_AspectMarker3d> & theAspect);

		/****************** SetAspect ******************/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectMarker3d
	:rtype: None") SetAspect;
		void SetAspect (const opencascade::handle<Graphic3d_AspectMarker3d> & theAspect);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* defines the color to be used when drawing a point. Default value: Quantity_NOC_YELLOW
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* defines the size of the marker used when drawing a point. Default value: 1.
	:param theScale:
	:type theScale: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real theScale);

		/****************** SetTypeOfMarker ******************/
		%feature("compactdefaultargs") SetTypeOfMarker;
		%feature("autodoc", "* defines the type of representation to be used when drawing a point. Default value: Aspect_TOM_PLUS
	:param theType:
	:type theType: Aspect_TypeOfMarker
	:rtype: None") SetTypeOfMarker;
		void SetTypeOfMarker (const Aspect_TypeOfMarker theType);

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
		/****************** Aspect ******************/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "* Returns the polygons aspect properties.
	:rtype: opencascade::handle<Graphic3d_AspectFillArea3d>") Aspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & Aspect ();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Returns the polygons color.
	:param aModel: default value is Aspect_TOFM_FRONT_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: Quantity_Color") Color;
		const Quantity_Color & Color (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "* Returns the polygons material aspect.
	:param aModel: default value is Aspect_TOFM_FRONT_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: Graphic3d_MaterialAspect") Material;
		const Graphic3d_MaterialAspect & Material (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);

		/****************** Prs3d_ShadingAspect ******************/
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "* Constructs an empty framework to display shading.
	:rtype: None") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect ();

		/****************** Prs3d_ShadingAspect ******************/
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "* Constructor with initialization.
	:param theAspect:
	:type theAspect: Graphic3d_AspectFillArea3d
	:rtype: None") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect (const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** SetAspect ******************/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectFillArea3d
	:rtype: None") SetAspect;
		void SetAspect (const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Change the polygons interior color and material ambient color.
	:param aColor:
	:type aColor: Quantity_Color
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & aColor,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "* Change the polygons material aspect.
	:param aMaterial:
	:type aMaterial: Graphic3d_MaterialAspect
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None") SetMaterial;
		void SetMaterial (const Graphic3d_MaterialAspect & aMaterial,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "* Change the polygons transparency value. Warning : aValue must be in the range 0,1. 0 is the default (NO transparent)
	:param aValue:
	:type aValue: float
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None") SetTransparency;
		void SetTransparency (const Standard_Real aValue,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "* Returns the polygons transparency value.
	:param aModel: default value is Aspect_TOFM_FRONT_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: float") Transparency;
		Standard_Real Transparency (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);

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
		%feature("autodoc", "* Defines the display of the text. @param theGroup group to add primitives @param theAspect presentation attributes @param theText text to draw @param theAttachmentPoint attachment point
	:param theGroup:
	:type theGroup: Graphic3d_Group
	:param theAspect:
	:type theAspect: Prs3d_TextAspect
	:param theText:
	:type theText: TCollection_ExtendedString
	:param theAttachmentPoint:
	:type theAttachmentPoint: gp_Pnt
	:rtype: void") Draw;
		static void Draw (const opencascade::handle<Graphic3d_Group> & theGroup,const opencascade::handle<Prs3d_TextAspect> & theAspect,const TCollection_ExtendedString & theText,const gp_Pnt & theAttachmentPoint);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "* Draws the text label. @param theGroup group to add primitives @param theAspect presentation attributes @param theText text to draw @param theOrientation location and orientation specified in the model 3D space @param theHasOwnAnchor
	:param theGroup:
	:type theGroup: Graphic3d_Group
	:param theAspect:
	:type theAspect: Prs3d_TextAspect
	:param theText:
	:type theText: TCollection_ExtendedString
	:param theOrientation:
	:type theOrientation: gp_Ax2
	:param theHasOwnAnchor: default value is Standard_True
	:type theHasOwnAnchor: bool
	:rtype: void") Draw;
		static void Draw (const opencascade::handle<Graphic3d_Group> & theGroup,const opencascade::handle<Prs3d_TextAspect> & theAspect,const TCollection_ExtendedString & theText,const gp_Ax2 & theOrientation,const Standard_Boolean theHasOwnAnchor = Standard_True);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "* Alias to another method Draw() for backward compatibility.
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theText:
	:type theText: TCollection_ExtendedString
	:param theAttachmentPoint:
	:type theAttachmentPoint: gp_Pnt
	:rtype: None") Draw;
		static void Draw (const opencascade::handle<Prs3d_Presentation> & thePrs,const opencascade::handle<Prs3d_Drawer> & theDrawer,const TCollection_ExtendedString & theText,const gp_Pnt & theAttachmentPoint);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "* Alias to another method Draw() for backward compatibility.
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:param theAspect:
	:type theAspect: Prs3d_TextAspect
	:param theText:
	:type theText: TCollection_ExtendedString
	:param theOrientation:
	:type theOrientation: gp_Ax2
	:param theHasOwnAnchor: default value is Standard_True
	:type theHasOwnAnchor: bool
	:rtype: None") Draw;
		static void Draw (const opencascade::handle<Prs3d_Presentation> & thePrs,const opencascade::handle<Prs3d_TextAspect> & theAspect,const TCollection_ExtendedString & theText,const gp_Ax2 & theOrientation,const Standard_Boolean theHasOwnAnchor = Standard_True);

		/****************** Draw ******************/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "* Alias to another method Draw() for backward compatibility.
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:param theAspect:
	:type theAspect: Prs3d_TextAspect
	:param theText:
	:type theText: TCollection_ExtendedString
	:param theAttachmentPoint:
	:type theAttachmentPoint: gp_Pnt
	:rtype: None") Draw;
		static void Draw (const opencascade::handle<Prs3d_Presentation> & thePrs,const opencascade::handle<Prs3d_TextAspect> & theAspect,const TCollection_ExtendedString & theText,const gp_Pnt & theAttachmentPoint);

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
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Returns the angle
	:rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Aspect ******************/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "* Returns the purely textual attributes used in the display of text. These include: - color - font - height/width ratio, that is, the expansion factor, and - space between characters.
	:rtype: opencascade::handle<Graphic3d_AspectText3d>") Aspect;
		const opencascade::handle<Graphic3d_AspectText3d> & Aspect ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "* Returns the height of the text box.
	:rtype: float") Height;
		Standard_Real Height ();

		/****************** HorizontalJustification ******************/
		%feature("compactdefaultargs") HorizontalJustification;
		%feature("autodoc", "* Returns the horizontal alignment of the text. The range of values includes: - left - center - right, and - normal (justified).
	:rtype: Graphic3d_HorizontalTextAlignment") HorizontalJustification;
		Graphic3d_HorizontalTextAlignment HorizontalJustification ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns the orientation of the text. Text can be displayed in the following directions: - up - down - left, or - right
	:rtype: Graphic3d_TextPath") Orientation;
		Graphic3d_TextPath Orientation ();

		/****************** Prs3d_TextAspect ******************/
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", "* Constructs an empty framework for defining display attributes of text.
	:rtype: None") Prs3d_TextAspect;
		 Prs3d_TextAspect ();

		/****************** Prs3d_TextAspect ******************/
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectText3d
	:rtype: None") Prs3d_TextAspect;
		 Prs3d_TextAspect (const opencascade::handle<Graphic3d_AspectText3d> & theAspect);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "* Sets the angle
	:param theAngle:
	:type theAngle: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real theAngle);

		/****************** SetAspect ******************/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Graphic3d_AspectText3d
	:rtype: None") SetAspect;
		void SetAspect (const opencascade::handle<Graphic3d_AspectText3d> & theAspect);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Sets the color of the type used in text display.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetFont ******************/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "* Sets the font used in text display.
	:param theFont:
	:type theFont: char *
	:rtype: None") SetFont;
		void SetFont (const char * theFont);

		/****************** SetHeight ******************/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "* Sets the height of the text.
	:param theHeight:
	:type theHeight: float
	:rtype: None") SetHeight;
		void SetHeight (const Standard_Real theHeight);

		/****************** SetHorizontalJustification ******************/
		%feature("compactdefaultargs") SetHorizontalJustification;
		%feature("autodoc", "* Sets horizontal alignment of text.
	:param theJustification:
	:type theJustification: Graphic3d_HorizontalTextAlignment
	:rtype: None") SetHorizontalJustification;
		void SetHorizontalJustification (const Graphic3d_HorizontalTextAlignment theJustification);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "* Sets the orientation of text.
	:param theOrientation:
	:type theOrientation: Graphic3d_TextPath
	:rtype: None") SetOrientation;
		void SetOrientation (const Graphic3d_TextPath theOrientation);

		/****************** SetVerticalJustification ******************/
		%feature("compactdefaultargs") SetVerticalJustification;
		%feature("autodoc", "* Sets the vertical alignment of text.
	:param theJustification:
	:type theJustification: Graphic3d_VerticalTextAlignment
	:rtype: None") SetVerticalJustification;
		void SetVerticalJustification (const Graphic3d_VerticalTextAlignment theJustification);

		/****************** VerticalJustification ******************/
		%feature("compactdefaultargs") VerticalJustification;
		%feature("autodoc", "* Returns the vertical alignment of the text. The range of values includes: - normal - top - cap - half - base - bottom
	:rtype: Graphic3d_VerticalTextAlignment") VerticalJustification;
		Graphic3d_VerticalTextAlignment VerticalJustification ();

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
		/****************** Create ******************/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "* Generate primitives for 3D quadric surface and return a filled array.
	:param theBottomRad:
	:type theBottomRad: float
	:param theTopRad:
	:type theTopRad: float
	:param theHeight:
	:type theHeight: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: opencascade::handle<Graphic3d_ArrayOfTriangles>") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create (const Standard_Real theBottomRad,const Standard_Real theTopRad,const Standard_Real theHeight,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks,const gp_Trsf & theTrsf);

		/****************** Prs3d_ToolCylinder ******************/
		%feature("compactdefaultargs") Prs3d_ToolCylinder;
		%feature("autodoc", "* Initializes the algorithm.
	:param theBottomRad:
	:type theBottomRad: float
	:param theTopRad:
	:type theTopRad: float
	:param theHeight:
	:type theHeight: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:rtype: None") Prs3d_ToolCylinder;
		 Prs3d_ToolCylinder (const Standard_Real theBottomRad,const Standard_Real theTopRad,const Standard_Real theHeight,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks);

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
		/****************** Create ******************/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "* Generate primitives for 3D quadric surface and return a filled array.
	:param theInnerRadius:
	:type theInnerRadius: float
	:param theOuterRadius:
	:type theOuterRadius: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: opencascade::handle<Graphic3d_ArrayOfTriangles>") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create (const Standard_Real theInnerRadius,const Standard_Real theOuterRadius,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks,const gp_Trsf & theTrsf);

		/****************** Prs3d_ToolDisk ******************/
		%feature("compactdefaultargs") Prs3d_ToolDisk;
		%feature("autodoc", "* Initializes the algorithm.
	:param theInnerRadius:
	:type theInnerRadius: float
	:param theOuterRadius:
	:type theOuterRadius: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:rtype: None") Prs3d_ToolDisk;
		 Prs3d_ToolDisk (const Standard_Real theInnerRadius,const Standard_Real theOuterRadius,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks);

		/****************** SetAngleRange ******************/
		%feature("compactdefaultargs") SetAngleRange;
		%feature("autodoc", "* Set angle range in radians [0, 2*PI] by default. @param theStartAngle [in] Start angle in counter clockwise order @param theEndAngle [in] End angle in counter clockwise order
	:param theStartAngle:
	:type theStartAngle: float
	:param theEndAngle:
	:type theEndAngle: float
	:rtype: None") SetAngleRange;
		void SetAngleRange (Standard_Real theStartAngle,Standard_Real theEndAngle);

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
		/****************** Create ******************/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "* Generate primitives for 3D quadric surface and return a filled array.
	:param theRadius:
	:type theRadius: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: opencascade::handle<Graphic3d_ArrayOfTriangles>") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create (const Standard_Real theRadius,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks,const gp_Trsf & theTrsf);

		/****************** Prs3d_ToolSector ******************/
		%feature("compactdefaultargs") Prs3d_ToolSector;
		%feature("autodoc", "* Initializes the algorithm.
	:param theRadius:
	:type theRadius: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:rtype: None") Prs3d_ToolSector;
		 Prs3d_ToolSector (const Standard_Real theRadius,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks);

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
		/****************** Create ******************/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "* Generate primitives for 3D quadric surface and return a filled array.
	:param theRadius:
	:type theRadius: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: opencascade::handle<Graphic3d_ArrayOfTriangles>") Create;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> Create (const Standard_Real theRadius,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks,const gp_Trsf & theTrsf);

		/****************** Prs3d_ToolSphere ******************/
		%feature("compactdefaultargs") Prs3d_ToolSphere;
		%feature("autodoc", "* Initializes the algorithm.
	:param theRadius:
	:type theRadius: float
	:param theNbSlices:
	:type theNbSlices: int
	:param theNbStacks:
	:type theNbStacks: int
	:rtype: None") Prs3d_ToolSphere;
		 Prs3d_ToolSphere (const Standard_Real theRadius,const Standard_Integer theNbSlices,const Standard_Integer theNbStacks);

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
		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "* returns the number of U or V isoparametric curves drawn for a single face.
	:rtype: int") Number;
		Standard_Integer Number ();

		/****************** Prs3d_IsoAspect ******************/
		%feature("compactdefaultargs") Prs3d_IsoAspect;
		%feature("autodoc", "* Constructs a framework to define display attributes of isoparameters. These include: - the color attribute aColor - the type of line aType - the width value aWidth - aNumber, the number of isoparameters to be displayed.
	:param theColor:
	:type theColor: Quantity_Color
	:param theType:
	:type theType: Aspect_TypeOfLine
	:param theWidth:
	:type theWidth: float
	:param theNumber:
	:type theNumber: int
	:rtype: None") Prs3d_IsoAspect;
		 Prs3d_IsoAspect (const Quantity_Color & theColor,const Aspect_TypeOfLine theType,const Standard_Real theWidth,const Standard_Integer theNumber);

		/****************** SetNumber ******************/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "* defines the number of U or V isoparametric curves to be drawn for a single face. Default value: 10
	:param theNumber:
	:type theNumber: int
	:rtype: None") SetNumber;
		void SetNumber (const Standard_Integer theNumber);

};


%make_alias(Prs3d_IsoAspect)

%extend Prs3d_IsoAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
