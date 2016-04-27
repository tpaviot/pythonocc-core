/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Prs3d

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Prs3d_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef NCollection_List <Handle_TColgp_HSequenceOfPnt> Prs3d_NListOfSequenceOfPnt;
typedef Prs3d_NListOfSequenceOfPnt::Iterator Prs3d_NListIteratorOfListOfSequenceOfPnt;
/* end typedefs declaration */

/* public enums */
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

%rename(prs3d) Prs3d;
class Prs3d {
	public:
		%feature("compactdefaultargs") MatchSegment;
		%feature("autodoc", "	* draws an arrow at a given location, with respect to a given direction.

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param p1:
	:type p1: gp_Pnt
	:param p2:
	:type p2: gp_Pnt
	:param dist:
	:type dist: Quantity_Length &
	:rtype: bool
") MatchSegment;
		static Standard_Boolean MatchSegment (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const gp_Pnt & p1,const gp_Pnt & p2,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "	* Computes the absolute deflection value depending on the type of deflection in theDrawer: <ul> <li><b>Aspect_TOD_RELATIVE</b>: the absolute deflection is computed using the relative deviation coefficient from theDrawer and the shape's bounding box;</li> <li><b>Aspect_TOD_ABSOLUTE</b>: the maximal chordial deviation from theDrawer is returned.</li> </ul> This function should always be used to compute the deflection value for building discrete representations of the shape (triangualtion, wireframe) to avoid incosistencies between different representations of the shape and undesirable visual artifacts.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: float
") GetDeflection;
		static Standard_Real GetDeflection (const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
};


%nodefaultctor Prs3d_BasicAspect;
class Prs3d_BasicAspect : public MMgt_TShared {
	public:
};


%extend Prs3d_BasicAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_BasicAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_BasicAspect::Handle_Prs3d_BasicAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_BasicAspect;
class Handle_Prs3d_BasicAspect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Prs3d_BasicAspect();
        Handle_Prs3d_BasicAspect(const Handle_Prs3d_BasicAspect &aHandle);
        Handle_Prs3d_BasicAspect(const Prs3d_BasicAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_BasicAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_BasicAspect {
    Prs3d_BasicAspect* GetObject() {
    return (Prs3d_BasicAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_DimensionUnits;
class Prs3d_DimensionUnits {
	public:
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "	* Default constructor. Sets meters as default length units and radians as default angle units.

	:rtype: None
") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits ();
		%feature("compactdefaultargs") Prs3d_DimensionUnits;
		%feature("autodoc", "	:param theUnits:
	:type theUnits: Prs3d_DimensionUnits &
	:rtype: None
") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits (const Prs3d_DimensionUnits & theUnits);
		%feature("compactdefaultargs") SetAngleUnits;
		%feature("autodoc", "	* Sets angle units

	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: None
") SetAngleUnits;
		void SetAngleUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") GetAngleUnits;
		%feature("autodoc", "	* returns angle units

	:rtype: TCollection_AsciiString
") GetAngleUnits;
		const TCollection_AsciiString & GetAngleUnits ();
		%feature("compactdefaultargs") SetLengthUnits;
		%feature("autodoc", "	* Sets length units

	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: None
") SetLengthUnits;
		void SetLengthUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") GetLengthUnits;
		%feature("autodoc", "	* returns length units

	:rtype: TCollection_AsciiString
") GetLengthUnits;
		const TCollection_AsciiString & GetLengthUnits ();
};


%nodefaultctor Prs3d_Drawer;
class Prs3d_Drawer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Prs3d_Drawer;
		%feature("autodoc", "	:rtype: None
") Prs3d_Drawer;
		 Prs3d_Drawer ();
		%feature("compactdefaultargs") SetTypeOfDeflection;
		%feature("autodoc", "	* Sets the type of chordal deflection. This indicates whether the deflection value is absolute or relative to the size of the object.

	:param aTypeOfDeflection:
	:type aTypeOfDeflection: Aspect_TypeOfDeflection
	:rtype: void
") SetTypeOfDeflection;
		virtual void SetTypeOfDeflection (const Aspect_TypeOfDeflection aTypeOfDeflection);
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "	* Returns the type of chordal deflection. This indicates whether the deflection value is absolute or relative to the size of the object.

	:rtype: Aspect_TypeOfDeflection
") TypeOfDeflection;
		virtual Aspect_TypeOfDeflection TypeOfDeflection ();
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "	* Defines the maximal chordial deviation when drawing any curve; Even if the type of deviation is set to TOD_Relative, this value is used by: //! Prs3d_DeflectionCurve Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace

	:param aChordialDeviation:
	:type aChordialDeviation: Quantity_Length
	:rtype: void
") SetMaximalChordialDeviation;
		virtual void SetMaximalChordialDeviation (const Quantity_Length aChordialDeviation);
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "	* returns the maximal chordial deviation. Default value is 0.1

	:rtype: Quantity_Length
") MaximalChordialDeviation;
		virtual Quantity_Length MaximalChordialDeviation ();
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient.

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: void
") SetDeviationCoefficient;
		virtual void SetDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "	* Returns the deviation coefficient.

	:rtype: float
") DeviationCoefficient;
		virtual Standard_Real DeviationCoefficient ();
		%feature("compactdefaultargs") SetHLRDeviationCoefficient;
		%feature("autodoc", "	* Sets the deviation coefficient aCoefficient for removal of hidden lines created by different viewpoints in different presentations. The Default value is 0.02.

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: void
") SetHLRDeviationCoefficient;
		virtual void SetHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") HLRDeviationCoefficient;
		%feature("autodoc", "	* Returns the real number value of the hidden line removal deviation coefficient.

	:rtype: float
") HLRDeviationCoefficient;
		virtual Standard_Real HLRDeviationCoefficient ();
		%feature("compactdefaultargs") SetHLRAngle;
		%feature("autodoc", "	* Sets anAngle, the angle of maximum chordal deviation for removal of hidden lines created by different viewpoints in different presentations. The default value is 20*PI/180.

	:param anAngle:
	:type anAngle: float
	:rtype: void
") SetHLRAngle;
		virtual void SetHLRAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "	* Returns the real number value of the deviation angle in hidden line removal views. The default value is 20*PI/180.

	:rtype: float
") HLRAngle;
		virtual Standard_Real HLRAngle ();
		%feature("compactdefaultargs") SetDeviationAngle;
		%feature("autodoc", "	* Sets deviation angle

	:param anAngle:
	:type anAngle: float
	:rtype: void
") SetDeviationAngle;
		virtual void SetDeviationAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") DeviationAngle;
		%feature("autodoc", "	* Returns the value for deviation angle.

	:rtype: float
") DeviationAngle;
		virtual Standard_Real DeviationAngle ();
		%feature("compactdefaultargs") SetDiscretisation;
		%feature("autodoc", "	* Sets the discretisation parameter d.

	:param d:
	:type d: int
	:rtype: void
") SetDiscretisation;
		virtual void SetDiscretisation (const Standard_Integer d);
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "	* Returns the discretisation setting.

	:rtype: int
") Discretisation;
		virtual Standard_Integer Discretisation ();
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "	* defines the maximum value allowed for the first and last parameters of an infinite curve. Default value: 500.

	:param Value:
	:type Value: float
	:rtype: void
") SetMaximalParameterValue;
		virtual void SetMaximalParameterValue (const Standard_Real Value);
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "	* Sets the maximum value allowed for the first and last parameters of an infinite curve. By default, this value is 500000.

	:rtype: float
") MaximalParameterValue;
		virtual Standard_Real MaximalParameterValue ();
		%feature("compactdefaultargs") SetIsoOnPlane;
		%feature("autodoc", "	* Sets IsoOnPlane on or off by setting the parameter OnOff to true or false.

	:param OnOff:
	:type OnOff: bool
	:rtype: void
") SetIsoOnPlane;
		virtual void SetIsoOnPlane (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "	* Returns True if the drawing of isos on planes is enabled.

	:rtype: bool
") IsoOnPlane;
		virtual Standard_Boolean IsoOnPlane ();
		%feature("compactdefaultargs") SetTypeOfHLR;
		%feature("autodoc", "	* Sets the type of HLR algorithm used by drawer's interactive objects

	:param theTypeOfHLR:
	:type theTypeOfHLR: Prs3d_TypeOfHLR
	:rtype: void
") SetTypeOfHLR;
		virtual void SetTypeOfHLR (const Prs3d_TypeOfHLR theTypeOfHLR);
		%feature("compactdefaultargs") TypeOfHLR;
		%feature("autodoc", "	* Gets the myTypeOfHLR value

	:rtype: Prs3d_TypeOfHLR
") TypeOfHLR;
		virtual Prs3d_TypeOfHLR TypeOfHLR ();
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "	* Defines the attributes which are used when drawing an U isoparametric curve of a face. Defines the number of U isoparametric curves to be drawn for a single face. The LineAspect for U isoparametric lines can be edited (methods SetColor, SetTypeOfLine, SetWidth, SetNumber) The default values are: COLOR : Quantity_NOC_GRAY75 TYPE OF LINE: Aspect_TOL_SOLID WIDTH : 0.5 //! These attributes are used by the following algorithms: Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace

	:rtype: Handle_Prs3d_IsoAspect
") UIsoAspect;
		virtual Handle_Prs3d_IsoAspect UIsoAspect ();
		%feature("compactdefaultargs") SetUIsoAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_Prs3d_IsoAspect &
	:rtype: void
") SetUIsoAspect;
		virtual void SetUIsoAspect (const Handle_Prs3d_IsoAspect & anAspect);
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "	* Defines the attributes which are used when drawing an V isoparametric curve of a face. Defines the number of V isoparametric curves to be drawn for a single face. The LineAspect for V isoparametric lines can be edited (methods SetColor, SetTypeOfLine, SetWidth, SetNumber) The default values are: COLOR : Quantity_NOC_GRAY82 TYPE OF LINE: Aspect_TOL_SOLID WIDTH : 0.5 //! These attributes are used by the following algorithms: Prs3d_WFDeflectionSurface Prs3d_WFDeflectionRestrictedFace

	:rtype: Handle_Prs3d_IsoAspect
") VIsoAspect;
		virtual Handle_Prs3d_IsoAspect VIsoAspect ();
		%feature("compactdefaultargs") SetVIsoAspect;
		%feature("autodoc", "	* Sets the appearance of V isoparameters - anAspect.

	:param anAspect:
	:type anAspect: Handle_Prs3d_IsoAspect &
	:rtype: void
") SetVIsoAspect;
		virtual void SetVIsoAspect (const Handle_Prs3d_IsoAspect & anAspect);
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "	* Stores the values for presentation of free boundaries, in other words, boundaries which are not shared. The LineAspect for the free boundaries can be edited. The default values are: Color: Quantity_NOC_GREEN Type of line: Aspect_TOL_SOLID Width: 1. These attributes are used by the algorithm Prs3d_WFShape

	:rtype: Handle_Prs3d_LineAspect
") FreeBoundaryAspect;
		virtual Handle_Prs3d_LineAspect FreeBoundaryAspect ();
		%feature("compactdefaultargs") SetFreeBoundaryAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for the display of free boundaries.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetFreeBoundaryAspect;
		virtual void SetFreeBoundaryAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") SetFreeBoundaryDraw;
		%feature("autodoc", "	* Sets free boundary drawing on or off by setting the parameter OnOff to true or false.

	:param OnOff:
	:type OnOff: bool
	:rtype: void
") SetFreeBoundaryDraw;
		virtual void SetFreeBoundaryDraw (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "	* Returns True if the drawing of the shared boundaries is disabled. True is the default setting.

	:rtype: bool
") FreeBoundaryDraw;
		virtual Standard_Boolean FreeBoundaryDraw ();
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "	* Returns wire aspect settings. The LineAspect for the wire can be edited. The default values are: Color: Quantity_NOC_RED Type of line: Aspect_TOL_SOLID Width: 1. These attributes are used by the algorithm Prs3d_WFShape

	:rtype: Handle_Prs3d_LineAspect
") WireAspect;
		virtual Handle_Prs3d_LineAspect WireAspect ();
		%feature("compactdefaultargs") SetWireAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for display of wires.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetWireAspect;
		virtual void SetWireAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") SetWireDraw;
		%feature("autodoc", "	* Sets WireDraw on or off by setting the parameter OnOff to true or false.

	:param OnOff:
	:type OnOff: bool
	:rtype: void
") SetWireDraw;
		virtual void SetWireDraw (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "	* returns True if the drawing of the wire is enabled.

	:rtype: bool
") WireDraw;
		virtual Standard_Boolean WireDraw ();
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "	* Returns settings for shared boundary line aspects. The LineAspect for the unfree boundaries can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_SOLID Width: 1. These attributes are used by the algorithm Prs3d_WFShape

	:rtype: Handle_Prs3d_LineAspect
") UnFreeBoundaryAspect;
		virtual Handle_Prs3d_LineAspect UnFreeBoundaryAspect ();
		%feature("compactdefaultargs") SetUnFreeBoundaryAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for the display of shared boundaries.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetUnFreeBoundaryAspect;
		virtual void SetUnFreeBoundaryAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") SetUnFreeBoundaryDraw;
		%feature("autodoc", "	* Sets FreeBoundaryDraw on or off by setting the parameter OnOff to true or false. By default the unfree boundaries are drawn.

	:param OnOff:
	:type OnOff: bool
	:rtype: void
") SetUnFreeBoundaryDraw;
		virtual void SetUnFreeBoundaryDraw (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "	* Returns True if the drawing of the shared boundaries is enabled. True is the default setting.

	:rtype: bool
") UnFreeBoundaryDraw;
		virtual Standard_Boolean UnFreeBoundaryDraw ();
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "	* Returns settings for line aspects. These settings can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_SOLID Width: 1. These attributes are used by the following algorithms: Prs3d_Curve Prs3d_Line Prs3d_HLRShape

	:rtype: Handle_Prs3d_LineAspect
") LineAspect;
		virtual Handle_Prs3d_LineAspect LineAspect ();
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for display attributes of lines.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetLineAspect;
		virtual void SetLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "	* Returns settings for text aspect. These settings can be edited. The default value is: - Color: Quantity_NOC_YELLOW

	:rtype: Handle_Prs3d_TextAspect
") TextAspect;
		virtual Handle_Prs3d_TextAspect TextAspect ();
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for display attributes of text.

	:param anAspect:
	:type anAspect: Handle_Prs3d_TextAspect &
	:rtype: void
") SetTextAspect;
		virtual void SetTextAspect (const Handle_Prs3d_TextAspect & anAspect);
		%feature("compactdefaultargs") SetLineArrowDraw;
		%feature("autodoc", "	* enables the drawing of an arrow at the end of each line. By default the arrows are not drawn.

	:param OnOff:
	:type OnOff: bool
	:rtype: void
") SetLineArrowDraw;
		virtual void SetLineArrowDraw (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") LineArrowDraw;
		%feature("autodoc", "	* Returns True if drawing an arrow at the end of each edge is enabled and False otherwise (the default).

	:rtype: bool
") LineArrowDraw;
		virtual Standard_Boolean LineArrowDraw ();
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "	* Returns the attributes for display of arrows.

	:rtype: Handle_Prs3d_ArrowAspect
") ArrowAspect;
		virtual Handle_Prs3d_ArrowAspect ArrowAspect ();
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for display attributes of arrows.

	:param anAspect:
	:type anAspect: Handle_Prs3d_ArrowAspect &
	:rtype: void
") SetArrowAspect;
		virtual void SetArrowAspect (const Handle_Prs3d_ArrowAspect & anAspect);
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "	* Returns the point aspect setting. The default values are Color: Quantity_NOC_YELLOW Type of marker: Aspect_TOM_PLUS Scale: 1. These attributes are used by the algorithms Prs3d_Point.

	:rtype: Handle_Prs3d_PointAspect
") PointAspect;
		virtual Handle_Prs3d_PointAspect PointAspect ();
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for display attributes of points

	:param anAspect:
	:type anAspect: Handle_Prs3d_PointAspect &
	:rtype: void
") SetPointAspect;
		virtual void SetPointAspect (const Handle_Prs3d_PointAspect & anAspect);
		%feature("compactdefaultargs") SetVertexDrawMode;
		%feature("autodoc", "	* Sets the mode of visualization of vertices of a TopoDS_Shape instance. By default, only stand-alone vertices (not belonging topologically to an edge) are drawn, that corresponds to <b>Prs3d_VDM_Standalone</b> mode. Switching to <b>Prs3d_VDM_Standalone</b> mode makes all shape's vertices visible. To inherit this parameter from the global drawer instance ('the link') when it is present, <b>Prs3d_VDM_Inherited</b> value should be used.

	:param theMode:
	:type theMode: Prs3d_VertexDrawMode
	:rtype: void
") SetVertexDrawMode;
		virtual void SetVertexDrawMode (const Prs3d_VertexDrawMode theMode);
		%feature("compactdefaultargs") VertexDrawMode;
		%feature("autodoc", "	* Returns the current mode of visualization of vertices of a TopoDS_Shape instance.

	:rtype: Prs3d_VertexDrawMode
") VertexDrawMode;
		virtual Prs3d_VertexDrawMode VertexDrawMode ();
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "	* Returns settings for shading aspects. These settings can be edited. The default values are: - Color: Quantity_NOC_YELLOW - Material: Graphic3d_NOM_BRASS Shading aspect is obtained through decomposition of 3d faces into triangles, each side of each triangle being a chord of the corresponding curved edge in the face. Reflection of light in each projector perspective is then calculated for each of the resultant triangular planes.

	:rtype: Handle_Prs3d_ShadingAspect
") ShadingAspect;
		virtual Handle_Prs3d_ShadingAspect ShadingAspect ();
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for display attributes of shading.

	:param anAspect:
	:type anAspect: Handle_Prs3d_ShadingAspect &
	:rtype: void
") SetShadingAspect;
		virtual void SetShadingAspect (const Handle_Prs3d_ShadingAspect & anAspect);
		%feature("compactdefaultargs") SetShadingAspectGlobal;
		%feature("autodoc", "	* indicates that the ShadingAspect will be apply to the whole presentation. This allows to modify the aspect without recomputing the content of the presentation.

	:param aValue:
	:type aValue: bool
	:rtype: void
") SetShadingAspectGlobal;
		virtual void SetShadingAspectGlobal (const Standard_Boolean aValue);
		%feature("compactdefaultargs") ShadingAspectGlobal;
		%feature("autodoc", "	:rtype: bool
") ShadingAspectGlobal;
		virtual Standard_Boolean ShadingAspectGlobal ();
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "	* returns Standard_True if the hidden lines are to be drawn. By default the hidden lines are not drawn.

	:rtype: bool
") DrawHiddenLine;
		virtual Standard_Boolean DrawHiddenLine ();
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "	* Enables the DrawHiddenLine function.

	:rtype: void
") EnableDrawHiddenLine;
		virtual void EnableDrawHiddenLine ();
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "	* Disables the DrawHiddenLine function.

	:rtype: void
") DisableDrawHiddenLine;
		virtual void DisableDrawHiddenLine ();
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "	* Returns settings for hidden line aspects. These settings can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_DASH Width: 1.

	:rtype: Handle_Prs3d_LineAspect
") HiddenLineAspect;
		virtual Handle_Prs3d_LineAspect HiddenLineAspect ();
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for the display of hidden lines in hidden line removal mode.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetHiddenLineAspect;
		virtual void SetHiddenLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "	* Returns settings for seen line aspects. These settings can be edited. The default values are: Color: Quantity_NOC_YELLOW Type of line: Aspect_TOL_SOLID Width: 1.

	:rtype: Handle_Prs3d_LineAspect
") SeenLineAspect;
		virtual Handle_Prs3d_LineAspect SeenLineAspect ();
		%feature("compactdefaultargs") SetSeenLineAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for the display of seen lines in hidden line removal mode.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetSeenLineAspect;
		virtual void SetSeenLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") PlaneAspect;
		%feature("autodoc", "	* Returns settings for the appearance of planes.

	:rtype: Handle_Prs3d_PlaneAspect
") PlaneAspect;
		virtual Handle_Prs3d_PlaneAspect PlaneAspect ();
		%feature("compactdefaultargs") SetPlaneAspect;
		%feature("autodoc", "	* Sets the parameter anAspect for the display of planes.

	:param anAspect:
	:type anAspect: Handle_Prs3d_PlaneAspect &
	:rtype: void
") SetPlaneAspect;
		virtual void SetPlaneAspect (const Handle_Prs3d_PlaneAspect & anAspect);
		%feature("compactdefaultargs") VectorAspect;
		%feature("autodoc", "	* Returns settings for the appearance of vectors. These settings can be edited. The default values are: Color: Quantity_NOC_SKYBLUE Type of line: Aspect_TOL_SOLID Width: 1.

	:rtype: Handle_Prs3d_LineAspect
") VectorAspect;
		virtual Handle_Prs3d_LineAspect VectorAspect ();
		%feature("compactdefaultargs") SetVectorAspect;
		%feature("autodoc", "	* Sets the modality anAspect for the display of vectors.

	:param anAspect:
	:type anAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetVectorAspect;
		virtual void SetVectorAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("compactdefaultargs") DatumAspect;
		%feature("autodoc", "	* Returns settings for the appearance of datums. These settings can be edited. The default values for the three axes are: Color: Quantity_NOC_PEACHPUFF Type of line: Aspect_TOL_SOLID Width: 1.

	:rtype: Handle_Prs3d_DatumAspect
") DatumAspect;
		virtual Handle_Prs3d_DatumAspect DatumAspect ();
		%feature("compactdefaultargs") SetDatumAspect;
		%feature("autodoc", "	* Sets the modality anAspect for the display of datums.

	:param anAspect:
	:type anAspect: Handle_Prs3d_DatumAspect &
	:rtype: void
") SetDatumAspect;
		virtual void SetDatumAspect (const Handle_Prs3d_DatumAspect & anAspect);
		%feature("compactdefaultargs") DimensionAspect;
		%feature("autodoc", "	* Returns settings for the appearance of dimensions.

	:rtype: Handle_Prs3d_DimensionAspect
") DimensionAspect;
		virtual Handle_Prs3d_DimensionAspect DimensionAspect ();
		%feature("compactdefaultargs") SetDimensionAspect;
		%feature("autodoc", "	* Sets the settings for the appearance of dimensions.

	:param theAspect:
	:type theAspect: Handle_Prs3d_DimensionAspect &
	:rtype: void
") SetDimensionAspect;
		virtual void SetDimensionAspect (const Handle_Prs3d_DimensionAspect & theAspect);
		%feature("compactdefaultargs") SetDimLengthModelUnits;
		%feature("autodoc", "	* Sets dimension length model units for computing of dimension presentation.

	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDimLengthModelUnits;
		virtual void SetDimLengthModelUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetDimAngleModelUnits;
		%feature("autodoc", "	* Sets dimension angle model units for computing of dimension presentation.

	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDimAngleModelUnits;
		virtual void SetDimAngleModelUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") DimLengthModelUnits;
		%feature("autodoc", "	* Returns length model units for the dimension presentation.

	:rtype: TCollection_AsciiString
") DimLengthModelUnits;
		virtual const TCollection_AsciiString & DimLengthModelUnits ();
		%feature("compactdefaultargs") DimAngleModelUnits;
		%feature("autodoc", "	* Returns angle model units for the dimension presentation.

	:rtype: TCollection_AsciiString
") DimAngleModelUnits;
		virtual const TCollection_AsciiString & DimAngleModelUnits ();
		%feature("compactdefaultargs") SetDimLengthDisplayUnits;
		%feature("autodoc", "	* Sets length units in which value for dimension presentation is displayed.

	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDimLengthDisplayUnits;
		virtual void SetDimLengthDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") SetDimAngleDisplayUnits;
		%feature("autodoc", "	* Sets angle units in which value for dimension presentation is displayed.

	:param theUnits:
	:type theUnits: TCollection_AsciiString &
	:rtype: void
") SetDimAngleDisplayUnits;
		virtual void SetDimAngleDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("compactdefaultargs") DimLengthDisplayUnits;
		%feature("autodoc", "	* Returns length units in which dimension presentation is displayed.

	:rtype: TCollection_AsciiString
") DimLengthDisplayUnits;
		virtual const TCollection_AsciiString & DimLengthDisplayUnits ();
		%feature("compactdefaultargs") DimAngleDisplayUnits;
		%feature("autodoc", "	* Returns angle units in which dimension presentation is displayed.

	:rtype: TCollection_AsciiString
") DimAngleDisplayUnits;
		virtual const TCollection_AsciiString & DimAngleDisplayUnits ();
		%feature("compactdefaultargs") SectionAspect;
		%feature("autodoc", "	* The LineAspect for the wire can be edited. The default values are: Color: Quantity_NOC_ORANGE Type of line: Aspect_TOL_SOLID Width: 1. These attributes are used by the algorithm Prs3d_WFShape.

	:rtype: Handle_Prs3d_LineAspect
") SectionAspect;
		virtual Handle_Prs3d_LineAspect SectionAspect ();
		%feature("compactdefaultargs") SetSectionAspect;
		%feature("autodoc", "	* Sets the parameter theAspect for display attributes of sections.

	:param theAspect:
	:type theAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetSectionAspect;
		virtual void SetSectionAspect (const Handle_Prs3d_LineAspect & theAspect);
		%feature("compactdefaultargs") SetFaceBoundaryDraw;
		%feature("autodoc", "	* Enables or disables face boundary drawing for shading presentations. theIsEnabled is a boolean flag indicating whether the face boundaries should be drawn or not.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: void
") SetFaceBoundaryDraw;
		virtual void SetFaceBoundaryDraw (const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") IsFaceBoundaryDraw;
		%feature("autodoc", "	* Checks whether the face boundary drawing is enabled or not.

	:rtype: bool
") IsFaceBoundaryDraw;
		virtual Standard_Boolean IsFaceBoundaryDraw ();
		%feature("compactdefaultargs") SetFaceBoundaryAspect;
		%feature("autodoc", "	* Sets line aspect for face boundaries. theAspect is the line aspect that determines the look of the face boundaries.

	:param theAspect:
	:type theAspect: Handle_Prs3d_LineAspect &
	:rtype: void
") SetFaceBoundaryAspect;
		virtual void SetFaceBoundaryAspect (const Handle_Prs3d_LineAspect & theAspect);
		%feature("compactdefaultargs") FaceBoundaryAspect;
		%feature("autodoc", "	* Returns line aspect of face boundaries.

	:rtype: Handle_Prs3d_LineAspect
") FaceBoundaryAspect;
		virtual Handle_Prs3d_LineAspect FaceBoundaryAspect ();
};


%extend Prs3d_Drawer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_Drawer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_Drawer::Handle_Prs3d_Drawer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_Drawer;
class Handle_Prs3d_Drawer : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Prs3d_Drawer();
        Handle_Prs3d_Drawer(const Handle_Prs3d_Drawer &aHandle);
        Handle_Prs3d_Drawer(const Prs3d_Drawer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_Drawer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_Drawer {
    Prs3d_Drawer* GetObject() {
    return (Prs3d_Drawer*)$self->Access();
    }
};

%nodefaultctor Prs3d_PlaneSet;
class Prs3d_PlaneSet : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Prs3d_PlaneSet;
		%feature("autodoc", "	:param Xdir:
	:type Xdir: float
	:param Ydir:
	:type Ydir: float
	:param Zdir:
	:type Zdir: float
	:param Xloc:
	:type Xloc: Quantity_Length
	:param Yloc:
	:type Yloc: Quantity_Length
	:param Zloc:
	:type Zloc: Quantity_Length
	:param anOffset:
	:type anOffset: Quantity_Length
	:rtype: None
") Prs3d_PlaneSet;
		 Prs3d_PlaneSet (const Standard_Real Xdir,const Standard_Real Ydir,const Standard_Real Zdir,const Quantity_Length Xloc,const Quantity_Length Yloc,const Quantity_Length Zloc,const Quantity_Length anOffset);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None
") SetDirection;
		void SetDirection (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:rtype: None
") SetLocation;
		void SetLocation (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z);
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "	:param anOffset:
	:type anOffset: Quantity_Length
	:rtype: None
") SetOffset;
		void SetOffset (const Quantity_Length anOffset);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "	:rtype: Quantity_Length
") Offset;
		Quantity_Length Offset ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length &
	:param Y:
	:type Y: Quantity_Length &
	:param Z:
	:type Z: Quantity_Length &
	:rtype: None
") Location;
		void Location (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length &
	:param Y:
	:type Y: Quantity_Length &
	:param Z:
	:type Z: Quantity_Length &
	:rtype: None
") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Prs3d_PlaneSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_PlaneSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_PlaneSet::Handle_Prs3d_PlaneSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_PlaneSet;
class Handle_Prs3d_PlaneSet : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Prs3d_PlaneSet();
        Handle_Prs3d_PlaneSet(const Handle_Prs3d_PlaneSet &aHandle);
        Handle_Prs3d_PlaneSet(const Prs3d_PlaneSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_PlaneSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_PlaneSet {
    Prs3d_PlaneSet* GetObject() {
    return (Prs3d_PlaneSet*)$self->Access();
    }
};

%nodefaultctor Prs3d_Presentation;
class Prs3d_Presentation : public Graphic3d_Structure {
	public:
		%feature("compactdefaultargs") Prs3d_Presentation;
		%feature("autodoc", "	* Constructs a presentation object if <Init> is false, no color initialization is done.

	:param theStructManager:
	:type theStructManager: Handle_Graphic3d_StructureManager &
	:param theToInit: default value is Standard_True
	:type theToInit: bool
	:rtype: None
") Prs3d_Presentation;
		 Prs3d_Presentation (const Handle_Graphic3d_StructureManager & theStructManager,const Standard_Boolean theToInit = Standard_True);
		%feature("compactdefaultargs") Prs3d_Presentation;
		%feature("autodoc", "	* Constructs a presentation object.

	:param theStructManager:
	:type theStructManager: Handle_Graphic3d_StructureManager &
	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:rtype: None
") Prs3d_Presentation;
		 Prs3d_Presentation (const Handle_Graphic3d_StructureManager & theStructManager,const Handle_Prs3d_Presentation & thePrs);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & aStructure);
		%feature("compactdefaultargs") Compute;
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
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* displays the whole content of the presentation in white.

	:rtype: None
") Highlight;
		void Highlight ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* displays the whole content of the presentation in the specified color.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") Color;
		void Color (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") BoundBox;
		%feature("autodoc", "	:rtype: None
") BoundBox;
		void BoundBox ();
		%feature("compactdefaultargs") SetIsForHighlight;
		%feature("autodoc", "	* marks the structure <self> representing wired structure needed for highlight only so it won't be added to BVH tree.

	:param isForHighlight:
	:type isForHighlight: bool
	:rtype: void
") SetIsForHighlight;
		virtual void SetIsForHighlight (const Standard_Boolean isForHighlight);
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "	:param aShadingAspect:
	:type aShadingAspect: Handle_Prs3d_ShadingAspect &
	:rtype: None
") SetShadingAspect;
		void SetShadingAspect (const Handle_Prs3d_ShadingAspect & aShadingAspect);
		%feature("compactdefaultargs") IsPickable;
		%feature("autodoc", "	:rtype: bool
") IsPickable;
		Standard_Boolean IsPickable ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param aTransformation:
	:type aTransformation: Handle_Geom_Transformation &
	:rtype: None
") Transform;
		void Transform (const Handle_Geom_Transformation & aTransformation);
		%feature("compactdefaultargs") Place;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:rtype: None
") Place;
		void Place (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	:param aTransformation:
	:type aTransformation: Handle_Geom_Transformation &
	:rtype: None
") Multiply;
		void Multiply (const Handle_Geom_Transformation & aTransformation);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:rtype: None
") Move;
		void Move (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	:rtype: Handle_Geom_Transformation
") Transformation;
		Handle_Geom_Transformation Transformation ();
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: None
") Connect;
		void Connect (const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:rtype: None
") Remove;
		void Remove (const Handle_Prs3d_Presentation & aPresentation);
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "	:rtype: None
") RemoveAll;
		void RemoveAll ();
		%feature("compactdefaultargs") SetPickable;
		%feature("autodoc", "	:rtype: None
") SetPickable;
		void SetPickable ();
		%feature("compactdefaultargs") SetUnPickable;
		%feature("autodoc", "	:rtype: None
") SetUnPickable;
		void SetUnPickable ();
};


%extend Prs3d_Presentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_Presentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_Presentation::Handle_Prs3d_Presentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_Presentation;
class Handle_Prs3d_Presentation : public Handle_Graphic3d_Structure {

    public:
        // constructors
        Handle_Prs3d_Presentation();
        Handle_Prs3d_Presentation(const Handle_Prs3d_Presentation &aHandle);
        Handle_Prs3d_Presentation(const Prs3d_Presentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_Presentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_Presentation {
    Prs3d_Presentation* GetObject() {
    return (Prs3d_Presentation*)$self->Access();
    }
};

%nodefaultctor Prs3d_Projector;
class Prs3d_Projector : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Prs3d_Projector;
		%feature("autodoc", "	:param Pr:
	:type Pr: HLRAlgo_Projector &
	:rtype: None
") Prs3d_Projector;
		 Prs3d_Projector (const HLRAlgo_Projector & Pr);
		%feature("compactdefaultargs") Prs3d_Projector;
		%feature("autodoc", "	* Constructs a projector framework from the following parameters - Pers is true if the view is a perspective view and false if it is an axonometric one; - Focus is the focal length if a perspective view is defined; - DX, DY and DZ are the coordinates of the projection vector; - XAt, YAt and ZAt are the coordinates of the view point; - XUp, YUp and ZUp are the coordinates of the vertical direction vector.

	:param Pers:
	:type Pers: bool
	:param Focus:
	:type Focus: Quantity_Length
	:param DX:
	:type DX: Quantity_Length
	:param DY:
	:type DY: Quantity_Length
	:param DZ:
	:type DZ: Quantity_Length
	:param XAt:
	:type XAt: Quantity_Length
	:param YAt:
	:type YAt: Quantity_Length
	:param ZAt:
	:type ZAt: Quantity_Length
	:param XUp:
	:type XUp: Quantity_Length
	:param YUp:
	:type YUp: Quantity_Length
	:param ZUp:
	:type ZUp: Quantity_Length
	:rtype: None
") Prs3d_Projector;
		 Prs3d_Projector (const Standard_Boolean Pers,const Quantity_Length Focus,const Quantity_Length DX,const Quantity_Length DY,const Quantity_Length DZ,const Quantity_Length XAt,const Quantity_Length YAt,const Quantity_Length ZAt,const Quantity_Length XUp,const Quantity_Length YUp,const Quantity_Length ZUp);
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "	* Returns a projector object for use in a hidden line removal algorithm.

	:rtype: HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector Projector ();
};


%extend Prs3d_Projector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_Projector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_Projector::Handle_Prs3d_Projector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_Projector;
class Handle_Prs3d_Projector : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Prs3d_Projector();
        Handle_Prs3d_Projector(const Handle_Prs3d_Projector &aHandle);
        Handle_Prs3d_Projector(const Prs3d_Projector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_Projector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_Projector {
    Prs3d_Projector* GetObject() {
    return (Prs3d_Projector*)$self->Access();
    }
};

class Prs3d_Root {
	public:
		%feature("compactdefaultargs") CurrentGroup;
		%feature("autodoc", "	* Returns the current group of primititves inside graphic objects in the display. A group also contains the attributes whose ranges are limited to the primitives in it.

	:param Prs3d:
	:type Prs3d: Handle_Prs3d_Presentation &
	:rtype: Handle_Graphic3d_Group
") CurrentGroup;
		static Handle_Graphic3d_Group CurrentGroup (const Handle_Prs3d_Presentation & Prs3d);
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "	* Returns the new group of primitives inside graphic objects in the display. A group also contains the attributes whose ranges are limited to the primitives in it.

	:param Prs3d:
	:type Prs3d: Handle_Prs3d_Presentation &
	:rtype: Handle_Graphic3d_Group
") NewGroup;
		static Handle_Graphic3d_Group NewGroup (const Handle_Prs3d_Presentation & Prs3d);
};


%nodefaultctor Prs3d_ShapeTool;
class Prs3d_ShapeTool {
	public:
		%feature("compactdefaultargs") Prs3d_ShapeTool;
		%feature("autodoc", "	* Constructs the tool and initializes it using theShape and theAllVertices (optional) arguments. By default, only isolated and internal vertices are considered, however if theAllVertices argument is equal to True, all shape's vertices are taken into account.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theAllVertices: default value is Standard_False
	:type theAllVertices: bool
	:rtype: None
") Prs3d_ShapeTool;
		 Prs3d_ShapeTool (const TopoDS_Shape & theShape,const Standard_Boolean theAllVertices = Standard_False);
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "	:rtype: None
") InitFace;
		void InitFace ();
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "	:rtype: bool
") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "	:rtype: None
") NextFace;
		void NextFace ();
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") GetFace;
		const TopoDS_Face  GetFace ();
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "	:rtype: Bnd_Box
") FaceBound;
		Bnd_Box FaceBound ();
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", "	:rtype: bool
") IsPlanarFace;
		Standard_Boolean IsPlanarFace ();
		%feature("compactdefaultargs") InitCurve;
		%feature("autodoc", "	:rtype: None
") InitCurve;
		void InitCurve ();
		%feature("compactdefaultargs") MoreCurve;
		%feature("autodoc", "	:rtype: bool
") MoreCurve;
		Standard_Boolean MoreCurve ();
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "	:rtype: None
") NextCurve;
		void NextCurve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") GetCurve;
		const TopoDS_Edge  GetCurve ();
		%feature("compactdefaultargs") CurveBound;
		%feature("autodoc", "	:rtype: Bnd_Box
") CurveBound;
		Bnd_Box CurveBound ();
		%feature("compactdefaultargs") Neighbours;
		%feature("autodoc", "	:rtype: int
") Neighbours;
		Standard_Integer Neighbours ();
		%feature("compactdefaultargs") FacesOfEdge;
		%feature("autodoc", "	:rtype: Handle_TopTools_HSequenceOfShape
") FacesOfEdge;
		Handle_TopTools_HSequenceOfShape FacesOfEdge ();
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "	:rtype: None
") InitVertex;
		void InitVertex ();
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "	:rtype: bool
") MoreVertex;
		Standard_Boolean MoreVertex ();
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "	:rtype: None
") NextVertex;
		void NextVertex ();
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") GetVertex;
		const TopoDS_Vertex  GetVertex ();
		%feature("compactdefaultargs") HasSurface;
		%feature("autodoc", "	:rtype: bool
") HasSurface;
		Standard_Boolean HasSurface ();
		%feature("compactdefaultargs") CurrentTriangulation;
		%feature("autodoc", "	:param l:
	:type l: TopLoc_Location &
	:rtype: Handle_Poly_Triangulation
") CurrentTriangulation;
		Handle_Poly_Triangulation CurrentTriangulation (TopLoc_Location & l);
		%feature("compactdefaultargs") HasCurve;
		%feature("autodoc", "	:rtype: bool
") HasCurve;
		Standard_Boolean HasCurve ();
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "	:param Indices:
	:type Indices: Handle_Poly_PolygonOnTriangulation &
	:param T:
	:type T: Handle_Poly_Triangulation &
	:param l:
	:type l: TopLoc_Location &
	:rtype: None
") PolygonOnTriangulation;
		void PolygonOnTriangulation (Handle_Poly_PolygonOnTriangulation & Indices,Handle_Poly_Triangulation & T,TopLoc_Location & l);
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "	:param l:
	:type l: TopLoc_Location &
	:rtype: Handle_Poly_Polygon3D
") Polygon3D;
		Handle_Poly_Polygon3D Polygon3D (TopLoc_Location & l);
};


class Prs3d_Arrow : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "	* Defines the representation of the arrow defined by the location point aLocation, the direction aDirection and the length aLength. The angle anAngle defines the angle of opening of the arrow head. The presentation object aPresentation stores the information defined in this framework.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aLocation:
	:type aLocation: gp_Pnt
	:param aDirection:
	:type aDirection: gp_Dir
	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:param aLength:
	:type aLength: Quantity_Length
	:rtype: void
") Draw;
		static void Draw (const Handle_Prs3d_Presentation & aPresentation,const gp_Pnt & aLocation,const gp_Dir & aDirection,const Quantity_PlaneAngle anAngle,const Quantity_Length aLength);
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "	* Defines the representation of the arrow defined by the location point aLocation, the direction vector aDirection and the length aLength. The angle anAngle defines the angle of opening of the arrow head, and the drawer aDrawer specifies the display attributes which arrows will have. With this syntax, no presentation object is created.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aLocation:
	:type aLocation: gp_Pnt
	:param aDirection:
	:type aDirection: gp_Dir
	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:param aLength:
	:type aLength: Quantity_Length
	:rtype: void
") Fill;
		static void Fill (const Handle_Prs3d_Presentation & aPresentation,const gp_Pnt & aLocation,const gp_Dir & aDirection,const Quantity_PlaneAngle anAngle,const Quantity_Length aLength);
};


%nodefaultctor Prs3d_ArrowAspect;
class Prs3d_ArrowAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "	* Constructs an empty framework for displaying arrows in representations of lengths. The lengths displayed are either on their own or in chamfers, fillets, diameters and radii.

	:rtype: None
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect ();
		%feature("compactdefaultargs") Prs3d_ArrowAspect;
		%feature("autodoc", "	* Constructs a framework to display an arrow with a shaft of the length aLength and having a head with sides at the angle anAngle from each other.

	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:param aLength:
	:type aLength: Quantity_Length
	:rtype: None
") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect (const Quantity_PlaneAngle anAngle,const Quantity_Length aLength);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* defines the angle of the arrows.

	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:rtype: None
") SetAngle;
		void SetAngle (const Quantity_PlaneAngle anAngle);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* returns the current value of the angle used when drawing an arrow.

	:rtype: Quantity_PlaneAngle
") Angle;
		Quantity_PlaneAngle Angle ();
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	* defines the length of the arrows.

	:param aLength:
	:type aLength: Quantity_Length
	:rtype: None
") SetLength;
		void SetLength (const Quantity_Length aLength);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* returns the current value of the length used when drawing an arrow.

	:rtype: Quantity_Length
") Length;
		Quantity_Length Length ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_AspectLine3d
") Aspect;
		Handle_Graphic3d_AspectLine3d Aspect ();
};


%extend Prs3d_ArrowAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_ArrowAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_ArrowAspect::Handle_Prs3d_ArrowAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_ArrowAspect;
class Handle_Prs3d_ArrowAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_ArrowAspect();
        Handle_Prs3d_ArrowAspect(const Handle_Prs3d_ArrowAspect &aHandle);
        Handle_Prs3d_ArrowAspect(const Prs3d_ArrowAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_ArrowAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_ArrowAspect {
    Prs3d_ArrowAspect* GetObject() {
    return (Prs3d_ArrowAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_DatumAspect;
class Prs3d_DatumAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_DatumAspect;
		%feature("autodoc", "	* An empty framework to define the display of datums.

	:rtype: None
") Prs3d_DatumAspect;
		 Prs3d_DatumAspect ();
		%feature("compactdefaultargs") FirstAxisAspect;
		%feature("autodoc", "	* Returns the attributes for display of the first axis.

	:rtype: Handle_Prs3d_LineAspect
") FirstAxisAspect;
		Handle_Prs3d_LineAspect FirstAxisAspect ();
		%feature("compactdefaultargs") SecondAxisAspect;
		%feature("autodoc", "	* Returns the attributes for display of the second axis.

	:rtype: Handle_Prs3d_LineAspect
") SecondAxisAspect;
		Handle_Prs3d_LineAspect SecondAxisAspect ();
		%feature("compactdefaultargs") ThirdAxisAspect;
		%feature("autodoc", "	* Returns the attributes for display of the third axis.

	:rtype: Handle_Prs3d_LineAspect
") ThirdAxisAspect;
		Handle_Prs3d_LineAspect ThirdAxisAspect ();
		%feature("compactdefaultargs") SetDrawFirstAndSecondAxis;
		%feature("autodoc", "	* Sets the DrawFirstAndSecondAxis attributes to active.

	:param draw:
	:type draw: bool
	:rtype: None
") SetDrawFirstAndSecondAxis;
		void SetDrawFirstAndSecondAxis (const Standard_Boolean draw);
		%feature("compactdefaultargs") DrawFirstAndSecondAxis;
		%feature("autodoc", "	* Returns true if the first and second axes can be drawn.

	:rtype: bool
") DrawFirstAndSecondAxis;
		Standard_Boolean DrawFirstAndSecondAxis ();
		%feature("compactdefaultargs") SetDrawThirdAxis;
		%feature("autodoc", "	* Sets the DrawThirdAxis attributes to active.

	:param draw:
	:type draw: bool
	:rtype: None
") SetDrawThirdAxis;
		void SetDrawThirdAxis (const Standard_Boolean draw);
		%feature("compactdefaultargs") DrawThirdAxis;
		%feature("autodoc", "	* Returns true if the third axis can be drawn.

	:rtype: bool
") DrawThirdAxis;
		Standard_Boolean DrawThirdAxis ();
		%feature("compactdefaultargs") SetAxisLength;
		%feature("autodoc", "	* Sets the lengths L1, L2 and L3 of the three axes.

	:param L1:
	:type L1: float
	:param L2:
	:type L2: float
	:param L3:
	:type L3: float
	:rtype: None
") SetAxisLength;
		void SetAxisLength (const Standard_Real L1,const Standard_Real L2,const Standard_Real L3);
		%feature("compactdefaultargs") FirstAxisLength;
		%feature("autodoc", "	* Returns the length of the displayed first axis.

	:rtype: Quantity_Length
") FirstAxisLength;
		Quantity_Length FirstAxisLength ();
		%feature("compactdefaultargs") SecondAxisLength;
		%feature("autodoc", "	* Returns the length of the displayed second axis.

	:rtype: Quantity_Length
") SecondAxisLength;
		Quantity_Length SecondAxisLength ();
		%feature("compactdefaultargs") ThirdAxisLength;
		%feature("autodoc", "	* Returns the length of the displayed third axis.

	:rtype: Quantity_Length
") ThirdAxisLength;
		Quantity_Length ThirdAxisLength ();
};


%extend Prs3d_DatumAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_DatumAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_DatumAspect::Handle_Prs3d_DatumAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_DatumAspect;
class Handle_Prs3d_DatumAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_DatumAspect();
        Handle_Prs3d_DatumAspect(const Handle_Prs3d_DatumAspect &aHandle);
        Handle_Prs3d_DatumAspect(const Prs3d_DatumAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_DatumAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_DatumAspect {
    Prs3d_DatumAspect* GetObject() {
    return (Prs3d_DatumAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_DimensionAspect;
class Prs3d_DimensionAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_DimensionAspect;
		%feature("autodoc", "	* Constructs an empty framework to define the display of dimensions.

	:rtype: None
") Prs3d_DimensionAspect;
		 Prs3d_DimensionAspect ();
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "	* Returns the settings for the display of lines used in presentation of dimensions.

	:rtype: Handle_Prs3d_LineAspect
") LineAspect;
		Handle_Prs3d_LineAspect LineAspect ();
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "	* Sets the display attributes of lines used in presentation of dimensions.

	:param theAspect:
	:type theAspect: Handle_Prs3d_LineAspect &
	:rtype: None
") SetLineAspect;
		void SetLineAspect (const Handle_Prs3d_LineAspect & theAspect);
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "	* Returns the settings for the display of text used in presentation of dimensions.

	:rtype: Handle_Prs3d_TextAspect
") TextAspect;
		Handle_Prs3d_TextAspect TextAspect ();
		%feature("compactdefaultargs") SetTextAspect;
		%feature("autodoc", "	* Sets the display attributes of text used in presentation of dimensions.

	:param theAspect:
	:type theAspect: Handle_Prs3d_TextAspect &
	:rtype: None
") SetTextAspect;
		void SetTextAspect (const Handle_Prs3d_TextAspect & theAspect);
		%feature("compactdefaultargs") IsText3d;
		%feature("autodoc", "	* Check if text for dimension label is 3d.

	:rtype: bool
") IsText3d;
		Standard_Boolean IsText3d ();
		%feature("compactdefaultargs") MakeText3d;
		%feature("autodoc", "	* Sets type of text.

	:param isText3d:
	:type isText3d: bool
	:rtype: None
") MakeText3d;
		void MakeText3d (const Standard_Boolean isText3d);
		%feature("compactdefaultargs") IsTextShaded;
		%feature("autodoc", "	* Check if 3d text for dimension label is shaded.

	:rtype: bool
") IsTextShaded;
		Standard_Boolean IsTextShaded ();
		%feature("compactdefaultargs") MakeTextShaded;
		%feature("autodoc", "	* Turns on/off text shading for 3d text.

	:param isTextShaded:
	:type isTextShaded: bool
	:rtype: None
") MakeTextShaded;
		void MakeTextShaded (const Standard_Boolean isTextShaded);
		%feature("compactdefaultargs") IsArrows3d;
		%feature("autodoc", "	* Gets type of arrows.

	:rtype: bool
") IsArrows3d;
		Standard_Boolean IsArrows3d ();
		%feature("compactdefaultargs") MakeArrows3d;
		%feature("autodoc", "	* Sets type of arrows.

	:param isArrows3d:
	:type isArrows3d: bool
	:rtype: None
") MakeArrows3d;
		void MakeArrows3d (const Standard_Boolean isArrows3d);
		%feature("compactdefaultargs") IsUnitsDisplayed;
		%feature("autodoc", "	* Shows if Units are to be displayed along with dimension value.

	:rtype: bool
") IsUnitsDisplayed;
		Standard_Boolean IsUnitsDisplayed ();
		%feature("compactdefaultargs") MakeUnitsDisplayed;
		%feature("autodoc", "	* Specifies whether the units string should be displayed along with value label or not.

	:param theIsDisplayed:
	:type theIsDisplayed: bool
	:rtype: None
") MakeUnitsDisplayed;
		void MakeUnitsDisplayed (const Standard_Boolean theIsDisplayed);
		%feature("compactdefaultargs") SetArrowOrientation;
		%feature("autodoc", "	* Sets orientation of arrows (external or internal). By default orientation is chosen automatically according to situation and text label size.

	:param theArrowOrient:
	:type theArrowOrient: Prs3d_DimensionArrowOrientation
	:rtype: None
") SetArrowOrientation;
		void SetArrowOrientation (const Prs3d_DimensionArrowOrientation theArrowOrient);
		%feature("compactdefaultargs") ArrowOrientation;
		%feature("autodoc", "	* Gets orientation of arrows (external or internal).

	:rtype: Prs3d_DimensionArrowOrientation
") ArrowOrientation;
		Prs3d_DimensionArrowOrientation ArrowOrientation ();
		%feature("compactdefaultargs") SetTextVerticalPosition;
		%feature("autodoc", "	* Sets vertical text alignment for text label.

	:param thePosition:
	:type thePosition: Prs3d_DimensionTextVerticalPosition
	:rtype: None
") SetTextVerticalPosition;
		void SetTextVerticalPosition (const Prs3d_DimensionTextVerticalPosition thePosition);
		%feature("compactdefaultargs") TextVerticalPosition;
		%feature("autodoc", "	* Gets vertical text alignment for text label.

	:rtype: Prs3d_DimensionTextVerticalPosition
") TextVerticalPosition;
		Prs3d_DimensionTextVerticalPosition TextVerticalPosition ();
		%feature("compactdefaultargs") SetTextHorizontalPosition;
		%feature("autodoc", "	* Sets horizontal text alignment for text label.

	:param thePosition:
	:type thePosition: Prs3d_DimensionTextHorizontalPosition
	:rtype: None
") SetTextHorizontalPosition;
		void SetTextHorizontalPosition (const Prs3d_DimensionTextHorizontalPosition thePosition);
		%feature("compactdefaultargs") TextHorizontalPosition;
		%feature("autodoc", "	* Gets horizontal text alignment for text label.

	:rtype: Prs3d_DimensionTextHorizontalPosition
") TextHorizontalPosition;
		Prs3d_DimensionTextHorizontalPosition TextHorizontalPosition ();
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "	* Returns the settings for displaying arrows.

	:rtype: Handle_Prs3d_ArrowAspect
") ArrowAspect;
		Handle_Prs3d_ArrowAspect ArrowAspect ();
		%feature("compactdefaultargs") SetArrowAspect;
		%feature("autodoc", "	* Sets the display attributes of arrows used in presentation of dimensions.

	:param theAspect:
	:type theAspect: Handle_Prs3d_ArrowAspect &
	:rtype: None
") SetArrowAspect;
		void SetArrowAspect (const Handle_Prs3d_ArrowAspect & theAspect);
		%feature("compactdefaultargs") SetCommonColor;
		%feature("autodoc", "	* Sets the same color for all parts of dimension: lines, arrows and text.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetCommonColor;
		void SetCommonColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetExtensionSize;
		%feature("autodoc", "	* Sets extension size.

	:param theSize:
	:type theSize: float
	:rtype: None
") SetExtensionSize;
		void SetExtensionSize (const Standard_Real theSize);
		%feature("compactdefaultargs") ExtensionSize;
		%feature("autodoc", "	* Returns extension size.

	:rtype: float
") ExtensionSize;
		Standard_Real ExtensionSize ();
		%feature("compactdefaultargs") SetArrowTailSize;
		%feature("autodoc", "	* Set size for arrow tail (extension without text).

	:param theSize:
	:type theSize: float
	:rtype: None
") SetArrowTailSize;
		void SetArrowTailSize (const Standard_Real theSize);
		%feature("compactdefaultargs") ArrowTailSize;
		%feature("autodoc", "	* Returns arrow tail size.

	:rtype: float
") ArrowTailSize;
		Standard_Real ArrowTailSize ();
		%feature("compactdefaultargs") SetValueStringFormat;
		%feature("autodoc", "	* Sets 'sprintf'-syntax format for formatting dimension value labels.

	:param theFormat:
	:type theFormat: TCollection_AsciiString &
	:rtype: None
") SetValueStringFormat;
		void SetValueStringFormat (const TCollection_AsciiString & theFormat);
		%feature("compactdefaultargs") ValueStringFormat;
		%feature("autodoc", "	* Returns format.

	:rtype: TCollection_AsciiString
") ValueStringFormat;
		TCollection_AsciiString ValueStringFormat ();
};


%extend Prs3d_DimensionAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_DimensionAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_DimensionAspect::Handle_Prs3d_DimensionAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_DimensionAspect;
class Handle_Prs3d_DimensionAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_DimensionAspect();
        Handle_Prs3d_DimensionAspect(const Handle_Prs3d_DimensionAspect &aHandle);
        Handle_Prs3d_DimensionAspect(const Prs3d_DimensionAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_DimensionAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_DimensionAspect {
    Prs3d_DimensionAspect* GetObject() {
    return (Prs3d_DimensionAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_LineAspect;
class Prs3d_LineAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", "	* Constructs a framework for line aspect defined by - the color aColor - the type of line aType and - the line thickness aWidth. Type of line refers to whether the line is solid or dotted, for example.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:param aType:
	:type aType: Aspect_TypeOfLine
	:param aWidth:
	:type aWidth: float
	:rtype: None
") Prs3d_LineAspect;
		 Prs3d_LineAspect (const Quantity_NameOfColor aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth);
		%feature("compactdefaultargs") Prs3d_LineAspect;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:param aType:
	:type aType: Aspect_TypeOfLine
	:param aWidth:
	:type aWidth: float
	:rtype: None
") Prs3d_LineAspect;
		 Prs3d_LineAspect (const Quantity_Color & aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the line color defined at the time of construction. Default value: Quantity_NOC_YELLOW

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetTypeOfLine;
		%feature("autodoc", "	* Sets the type of line defined at the time of construction. This could, for example, be solid, dotted or made up of dashes. Default value: Aspect_TOL_SOLID

	:param aType:
	:type aType: Aspect_TypeOfLine
	:rtype: None
") SetTypeOfLine;
		void SetTypeOfLine (const Aspect_TypeOfLine aType);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the line width defined at the time of construction. Default value: 1.

	:param aWidth:
	:type aWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	* Returns the line aspect. This is defined as the set of color, type and thickness attributes.

	:rtype: Handle_Graphic3d_AspectLine3d
") Aspect;
		Handle_Graphic3d_AspectLine3d Aspect ();
};


%extend Prs3d_LineAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_LineAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_LineAspect::Handle_Prs3d_LineAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_LineAspect;
class Handle_Prs3d_LineAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_LineAspect();
        Handle_Prs3d_LineAspect(const Handle_Prs3d_LineAspect &aHandle);
        Handle_Prs3d_LineAspect(const Prs3d_LineAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_LineAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_LineAspect {
    Prs3d_LineAspect* GetObject() {
    return (Prs3d_LineAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_PlaneAspect;
class Prs3d_PlaneAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_PlaneAspect;
		%feature("autodoc", "	* Constructs an empty framework for the display of planes.

	:rtype: None
") Prs3d_PlaneAspect;
		 Prs3d_PlaneAspect ();
		%feature("compactdefaultargs") EdgesAspect;
		%feature("autodoc", "	* Returns the attributes of displayed edges involved in the presentation of planes.

	:rtype: Handle_Prs3d_LineAspect
") EdgesAspect;
		Handle_Prs3d_LineAspect EdgesAspect ();
		%feature("compactdefaultargs") IsoAspect;
		%feature("autodoc", "	* Returns the attributes of displayed isoparameters involved in the presentation of planes.

	:rtype: Handle_Prs3d_LineAspect
") IsoAspect;
		Handle_Prs3d_LineAspect IsoAspect ();
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "	* Returns the settings for displaying an arrow.

	:rtype: Handle_Prs3d_LineAspect
") ArrowAspect;
		Handle_Prs3d_LineAspect ArrowAspect ();
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", "	:param L:
	:type L: Quantity_Length
	:rtype: None
") SetArrowsLength;
		void SetArrowsLength (const Quantity_Length L);
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "	* Returns the length of the arrow shaft used in the display of arrows.

	:rtype: Quantity_Length
") ArrowsLength;
		Quantity_Length ArrowsLength ();
		%feature("compactdefaultargs") SetArrowsSize;
		%feature("autodoc", "	* Sets the angle of the arrowhead used in the display of planes.

	:param L:
	:type L: Quantity_Length
	:rtype: None
") SetArrowsSize;
		void SetArrowsSize (const Quantity_Length L);
		%feature("compactdefaultargs") ArrowsSize;
		%feature("autodoc", "	* Returns the size of arrows used in the display of planes.

	:rtype: Quantity_Length
") ArrowsSize;
		Quantity_Length ArrowsSize ();
		%feature("compactdefaultargs") SetArrowsAngle;
		%feature("autodoc", "	* Sets the angle of the arrowhead used in the display of arrows involved in the presentation of planes.

	:param ang:
	:type ang: Quantity_PlaneAngle
	:rtype: None
") SetArrowsAngle;
		void SetArrowsAngle (const Quantity_PlaneAngle ang);
		%feature("compactdefaultargs") ArrowsAngle;
		%feature("autodoc", "	* Returns the angle of the arrowhead used in the display of arrows involved in the presentation of planes.

	:rtype: Quantity_PlaneAngle
") ArrowsAngle;
		Quantity_PlaneAngle ArrowsAngle ();
		%feature("compactdefaultargs") SetDisplayCenterArrow;
		%feature("autodoc", "	* Sets the display attributes defined in DisplayCenterArrow to active.

	:param draw:
	:type draw: bool
	:rtype: None
") SetDisplayCenterArrow;
		void SetDisplayCenterArrow (const Standard_Boolean draw);
		%feature("compactdefaultargs") DisplayCenterArrow;
		%feature("autodoc", "	* Returns true if the display of center arrows is allowed.

	:rtype: bool
") DisplayCenterArrow;
		Standard_Boolean DisplayCenterArrow ();
		%feature("compactdefaultargs") SetDisplayEdgesArrows;
		%feature("autodoc", "	* Sets the display attributes defined in DisplayEdgesArrows to active.

	:param draw:
	:type draw: bool
	:rtype: None
") SetDisplayEdgesArrows;
		void SetDisplayEdgesArrows (const Standard_Boolean draw);
		%feature("compactdefaultargs") DisplayEdgesArrows;
		%feature("autodoc", "	* Returns true if the display of edge arrows is allowed.

	:rtype: bool
") DisplayEdgesArrows;
		Standard_Boolean DisplayEdgesArrows ();
		%feature("compactdefaultargs") SetDisplayEdges;
		%feature("autodoc", "	:param draw:
	:type draw: bool
	:rtype: None
") SetDisplayEdges;
		void SetDisplayEdges (const Standard_Boolean draw);
		%feature("compactdefaultargs") DisplayEdges;
		%feature("autodoc", "	:rtype: bool
") DisplayEdges;
		Standard_Boolean DisplayEdges ();
		%feature("compactdefaultargs") SetDisplayIso;
		%feature("autodoc", "	* Sets the display attributes defined in DisplayIso to active.

	:param draw:
	:type draw: bool
	:rtype: None
") SetDisplayIso;
		void SetDisplayIso (const Standard_Boolean draw);
		%feature("compactdefaultargs") DisplayIso;
		%feature("autodoc", "	* Returns true if the display of isoparameters is allowed.

	:rtype: bool
") DisplayIso;
		Standard_Boolean DisplayIso ();
		%feature("compactdefaultargs") SetPlaneLength;
		%feature("autodoc", "	:param LX:
	:type LX: Quantity_Length
	:param LY:
	:type LY: Quantity_Length
	:rtype: None
") SetPlaneLength;
		void SetPlaneLength (const Quantity_Length LX,const Quantity_Length LY);
		%feature("compactdefaultargs") PlaneXLength;
		%feature("autodoc", "	* Returns the length of the x axis used in the display of planes.

	:rtype: Quantity_Length
") PlaneXLength;
		Quantity_Length PlaneXLength ();
		%feature("compactdefaultargs") PlaneYLength;
		%feature("autodoc", "	* Returns the length of the y axis used in the display of planes.

	:rtype: Quantity_Length
") PlaneYLength;
		Quantity_Length PlaneYLength ();
		%feature("compactdefaultargs") SetIsoDistance;
		%feature("autodoc", "	* Sets the distance L between isoparameters used in the display of planes.

	:param L:
	:type L: Quantity_Length
	:rtype: None
") SetIsoDistance;
		void SetIsoDistance (const Quantity_Length L);
		%feature("compactdefaultargs") IsoDistance;
		%feature("autodoc", "	* Returns the distance between isoparameters used in the display of planes.

	:rtype: Quantity_Length
") IsoDistance;
		Quantity_Length IsoDistance ();
};


%extend Prs3d_PlaneAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_PlaneAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_PlaneAspect::Handle_Prs3d_PlaneAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_PlaneAspect;
class Handle_Prs3d_PlaneAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_PlaneAspect();
        Handle_Prs3d_PlaneAspect(const Handle_Prs3d_PlaneAspect &aHandle);
        Handle_Prs3d_PlaneAspect(const Prs3d_PlaneAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_PlaneAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_PlaneAspect {
    Prs3d_PlaneAspect* GetObject() {
    return (Prs3d_PlaneAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_PointAspect;
class Prs3d_PointAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "	:param aType:
	:type aType: Aspect_TypeOfMarker
	:param aColor:
	:type aColor: Quantity_Color &
	:param aScale:
	:type aScale: float
	:rtype: None
") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Aspect_TypeOfMarker aType,const Quantity_Color & aColor,const Standard_Real aScale);
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "	:param aType:
	:type aType: Aspect_TypeOfMarker
	:param aColor:
	:type aColor: Quantity_NameOfColor
	:param aScale:
	:type aScale: float
	:rtype: None
") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Aspect_TypeOfMarker aType,const Quantity_NameOfColor aColor,const Standard_Real aScale);
		%feature("compactdefaultargs") Prs3d_PointAspect;
		%feature("autodoc", "	* defines only the urer defined marker point.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AWidth:
	:type AWidth: int
	:param AHeight:
	:type AHeight: int
	:param ATexture:
	:type ATexture: Handle_TColStd_HArray1OfByte &
	:rtype: None
") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Quantity_Color & AColor,const Standard_Integer AWidth,const Standard_Integer AHeight,const Handle_TColStd_HArray1OfByte & ATexture);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* defines the color to be used when drawing a point. Default value: Quantity_NOC_YELLOW

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetTypeOfMarker;
		%feature("autodoc", "	* defines the type of representation to be used when drawing a point. Default value: Aspect_TOM_PLUS

	:param aType:
	:type aType: Aspect_TypeOfMarker
	:rtype: None
") SetTypeOfMarker;
		void SetTypeOfMarker (const Aspect_TypeOfMarker aType);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* defines the size of the marker used when drawing a point. Default value: 1.

	:param aScale:
	:type aScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real aScale);
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_AspectMarker3d
") Aspect;
		Handle_Graphic3d_AspectMarker3d Aspect ();
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "	* Returns marker's texture size.

	:param AWidth:
	:type AWidth: int &
	:param AHeight:
	:type AHeight: int &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetTexture;
		%feature("autodoc", "	* Returns marker's texture.

	:rtype: Graphic3d_MarkerImage_Handle
") GetTexture;
		const Graphic3d_MarkerImage_Handle & GetTexture ();
};


%extend Prs3d_PointAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_PointAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_PointAspect::Handle_Prs3d_PointAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_PointAspect;
class Handle_Prs3d_PointAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_PointAspect();
        Handle_Prs3d_PointAspect(const Handle_Prs3d_PointAspect &aHandle);
        Handle_Prs3d_PointAspect(const Prs3d_PointAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_PointAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_PointAspect {
    Prs3d_PointAspect* GetObject() {
    return (Prs3d_PointAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_PresentationShadow;
class Prs3d_PresentationShadow : public Prs3d_Presentation {
	public:
		%feature("compactdefaultargs") Prs3d_PresentationShadow;
		%feature("autodoc", "	* Constructs a shadow of existing presentation object.

	:param theViewer:
	:type theViewer: Handle_Graphic3d_StructureManager &
	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:rtype: None
") Prs3d_PresentationShadow;
		 Prs3d_PresentationShadow (const Handle_Graphic3d_StructureManager & theViewer,const Handle_Prs3d_Presentation & thePrs);
};


%nodefaultctor Prs3d_ShadingAspect;
class Prs3d_ShadingAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_ShadingAspect;
		%feature("autodoc", "	* Constructs an empty framework to display shading.

	:rtype: None
") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Change the polygons interior color and material ambient color.

	:param aColor:
	:type aColor: Quantity_Color &
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Change the polygons interior color and material ambient color.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Change the polygons material aspect.

	:param aMaterial:
	:type aMaterial: Graphic3d_MaterialAspect &
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetMaterial;
		void SetMaterial (const Graphic3d_MaterialAspect & aMaterial,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Graphic3d_NameOfMaterial
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetMaterial;
		void SetMaterial (const Graphic3d_NameOfMaterial aMaterial,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Change the polygons transparency value. Warning : aValue must be in the range 0,1. 0 is the default (NO transparent)

	:param aValue:
	:type aValue: float
	:param aModel: default value is Aspect_TOFM_BOTH_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real aValue,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "	* Change the polygons aspect properties.

	:param Asp:
	:type Asp: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetAspect;
		void SetAspect (const Handle_Graphic3d_AspectFillArea3d & Asp);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the polygons color.

	:param aModel: default value is Aspect_TOFM_FRONT_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: Quantity_Color
") Color;
		Quantity_Color Color (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Returns the polygons material aspect.

	:param aModel: default value is Aspect_TOFM_FRONT_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: Graphic3d_MaterialAspect
") Material;
		Graphic3d_MaterialAspect Material (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns the polygons transparency value.

	:param aModel: default value is Aspect_TOFM_FRONT_SIDE
	:type aModel: Aspect_TypeOfFacingModel
	:rtype: float
") Transparency;
		Standard_Real Transparency (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	* Returns the polygons aspect properties.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") Aspect;
		Handle_Graphic3d_AspectFillArea3d Aspect ();
};


%extend Prs3d_ShadingAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_ShadingAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_ShadingAspect::Handle_Prs3d_ShadingAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_ShadingAspect;
class Handle_Prs3d_ShadingAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_ShadingAspect();
        Handle_Prs3d_ShadingAspect(const Handle_Prs3d_ShadingAspect &aHandle);
        Handle_Prs3d_ShadingAspect(const Prs3d_ShadingAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_ShadingAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_ShadingAspect {
    Prs3d_ShadingAspect* GetObject() {
    return (Prs3d_ShadingAspect*)$self->Access();
    }
};

class Prs3d_Text : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "	* Defines the display of the text aText at the point AttachmentPoint. The drawer aDrawer specifies the display attributes which texts will have. The presentation object aPresentation stores the information defined in this framework. static void Draw (const Handle_Prs3d_Presentation& aPresentation, const Handle_Prs3d_TextAspect& anAspect, const TCollection_ExtendedString& aText, const gp_Pnt& AttachmentPoint);

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param aText:
	:type aText: TCollection_ExtendedString &
	:param AttachmentPoint:
	:type AttachmentPoint: gp_Pnt
	:rtype: void
") Draw;
		static void Draw (const Handle_Prs3d_Presentation & aPresentation,const Handle_Prs3d_Drawer & aDrawer,const TCollection_ExtendedString & aText,const gp_Pnt & AttachmentPoint);
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "	* Defines the display of the text aText at the point AttachmentPoint. The text aspect object anAspect specifies the display attributes which texts will have. The presentation object aPresentation stores the information defined in this framework. This syntax could be used if you had not already defined text display attributes in a drawer or if you wanted to exceptionally overide the definition provided in your drawer.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param anAspect:
	:type anAspect: Handle_Prs3d_TextAspect &
	:param aText:
	:type aText: TCollection_ExtendedString &
	:param AttachmentPoint:
	:type AttachmentPoint: gp_Pnt
	:rtype: void
") Draw;
		static void Draw (const Handle_Prs3d_Presentation & aPresentation,const Handle_Prs3d_TextAspect & anAspect,const TCollection_ExtendedString & aText,const gp_Pnt & AttachmentPoint);
};


%nodefaultctor Prs3d_TextAspect;
class Prs3d_TextAspect : public Prs3d_BasicAspect {
	public:
		%feature("compactdefaultargs") Prs3d_TextAspect;
		%feature("autodoc", "	* Constructs an empty framework for defining display attributes of text.

	:rtype: None
") Prs3d_TextAspect;
		 Prs3d_TextAspect ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color of the type used in text display.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Sets the font used in text display.

	:param aFont:
	:type aFont: char *
	:rtype: None
") SetFont;
		void SetFont (const char * aFont);
		%feature("compactdefaultargs") SetHeightWidthRatio;
		%feature("autodoc", "	* Returns the height-width ratio, also known as the expansion factor.

	:param aRatio:
	:type aRatio: float
	:rtype: None
") SetHeightWidthRatio;
		void SetHeightWidthRatio (const Standard_Real aRatio);
		%feature("compactdefaultargs") SetSpace;
		%feature("autodoc", "	* Sets the length of the box which text will occupy.

	:param aSpace:
	:type aSpace: Quantity_Length
	:rtype: None
") SetSpace;
		void SetSpace (const Quantity_Length aSpace);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* Sets the height of the text.

	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Sets the angle

	:param anAngle:
	:type anAngle: Quantity_PlaneAngle
	:rtype: None
") SetAngle;
		void SetAngle (const Quantity_PlaneAngle anAngle);
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	* Returns the height of the text box.

	:rtype: float
") Height;
		Standard_Real Height ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns the angle

	:rtype: Quantity_PlaneAngle
") Angle;
		Quantity_PlaneAngle Angle ();
		%feature("compactdefaultargs") SetHorizontalJustification;
		%feature("autodoc", "	* Sets horizontal alignment of text.

	:param aJustification:
	:type aJustification: Graphic3d_HorizontalTextAlignment
	:rtype: None
") SetHorizontalJustification;
		void SetHorizontalJustification (const Graphic3d_HorizontalTextAlignment aJustification);
		%feature("compactdefaultargs") SetVerticalJustification;
		%feature("autodoc", "	* Sets the vertical alignment of text.

	:param aJustification:
	:type aJustification: Graphic3d_VerticalTextAlignment
	:rtype: None
") SetVerticalJustification;
		void SetVerticalJustification (const Graphic3d_VerticalTextAlignment aJustification);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	* Sets the orientation of text.

	:param anOrientation:
	:type anOrientation: Graphic3d_TextPath
	:rtype: None
") SetOrientation;
		void SetOrientation (const Graphic3d_TextPath anOrientation);
		%feature("compactdefaultargs") HorizontalJustification;
		%feature("autodoc", "	* Returns the horizontal alignment of the text. The range of values includes: - left - center - right, and - normal (justified).

	:rtype: Graphic3d_HorizontalTextAlignment
") HorizontalJustification;
		Graphic3d_HorizontalTextAlignment HorizontalJustification ();
		%feature("compactdefaultargs") VerticalJustification;
		%feature("autodoc", "	* Returns the vertical alignment of the text. The range of values includes: - normal - top - cap - half - base - bottom

	:rtype: Graphic3d_VerticalTextAlignment
") VerticalJustification;
		Graphic3d_VerticalTextAlignment VerticalJustification ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns the orientation of the text. Text can be displayed in the following directions: - up - down - left, or - right

	:rtype: Graphic3d_TextPath
") Orientation;
		Graphic3d_TextPath Orientation ();
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	* Returns the purely textual attributes used in the display of text. These include: - color - font - height/width ratio, that is, the expansion factor, and - space between characters.

	:rtype: Handle_Graphic3d_AspectText3d
") Aspect;
		Handle_Graphic3d_AspectText3d Aspect ();
};


%extend Prs3d_TextAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_TextAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_TextAspect::Handle_Prs3d_TextAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_TextAspect;
class Handle_Prs3d_TextAspect : public Handle_Prs3d_BasicAspect {

    public:
        // constructors
        Handle_Prs3d_TextAspect();
        Handle_Prs3d_TextAspect(const Handle_Prs3d_TextAspect &aHandle);
        Handle_Prs3d_TextAspect(const Prs3d_TextAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_TextAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_TextAspect {
    Prs3d_TextAspect* GetObject() {
    return (Prs3d_TextAspect*)$self->Access();
    }
};

%nodefaultctor Prs3d_IsoAspect;
class Prs3d_IsoAspect : public Prs3d_LineAspect {
	public:
		%feature("compactdefaultargs") Prs3d_IsoAspect;
		%feature("autodoc", "	* Constructs a framework to define display attributes of isoparameters. These include: - the color attribute aColor - the type of line aType - the width value aWidth - aNumber, the number of isoparameters to be displayed.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:param aType:
	:type aType: Aspect_TypeOfLine
	:param aWidth:
	:type aWidth: float
	:param aNumber:
	:type aNumber: int
	:rtype: None
") Prs3d_IsoAspect;
		 Prs3d_IsoAspect (const Quantity_NameOfColor aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth,const Standard_Integer aNumber);
		%feature("compactdefaultargs") Prs3d_IsoAspect;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:param aType:
	:type aType: Aspect_TypeOfLine
	:param aWidth:
	:type aWidth: float
	:param aNumber:
	:type aNumber: int
	:rtype: None
") Prs3d_IsoAspect;
		 Prs3d_IsoAspect (const Quantity_Color & aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth,const Standard_Integer aNumber);
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "	* defines the number of U or V isoparametric curves to be drawn for a single face. Default value: 10

	:param aNumber:
	:type aNumber: int
	:rtype: None
") SetNumber;
		void SetNumber (const Standard_Integer aNumber);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* returns the number of U or V isoparametric curves drawn for a single face.

	:rtype: int
") Number;
		Standard_Integer Number ();
};


%extend Prs3d_IsoAspect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Prs3d_IsoAspect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Prs3d_IsoAspect::Handle_Prs3d_IsoAspect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Prs3d_IsoAspect;
class Handle_Prs3d_IsoAspect : public Handle_Prs3d_LineAspect {

    public:
        // constructors
        Handle_Prs3d_IsoAspect();
        Handle_Prs3d_IsoAspect(const Handle_Prs3d_IsoAspect &aHandle);
        Handle_Prs3d_IsoAspect(const Prs3d_IsoAspect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Prs3d_IsoAspect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Prs3d_IsoAspect {
    Prs3d_IsoAspect* GetObject() {
    return (Prs3d_IsoAspect*)$self->Access();
    }
};

