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
%module Prs3d

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

%include Prs3d_required_python_modules.i
%include Prs3d_headers.i

/* typedefs */
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

/* end public enums declaration */

%rename(prs3d) Prs3d;
%nodefaultctor Prs3d;
class Prs3d {
	public:
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)
	aDistance(Quantity_Length)
	p1(gp_Pnt)
	p2(gp_Pnt)
	dist(Quantity_Length)

Returns:
	static Standard_Boolean

draws an arrow at a given location, with respect  
         to a given direction.") MatchSegment;
		static Standard_Boolean MatchSegment (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const gp_Pnt & p1,const gp_Pnt & p2,Standard_Real &OutValue);
};


%feature("shadow") Prs3d::~Prs3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Prs3d_BasicAspect;
class Prs3d_BasicAspect : public MMgt_TShared {
	public:
};


%feature("shadow") Prs3d_BasicAspect::~Prs3d_BasicAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_BasicAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_BasicAspect {
	Handle_Prs3d_BasicAspect GetHandle() {
	return *(Handle_Prs3d_BasicAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_BasicAspect::~Handle_Prs3d_BasicAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_BasicAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_DimensionUnits;
class Prs3d_DimensionUnits {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Default constructor. Sets meters as default length units
and radians as default angle units.") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits ();
		%feature("autodoc", "Args:
	theUnits(Prs3d_DimensionUnits)

Returns:
	None

No detailed docstring for this function.") Prs3d_DimensionUnits;
		 Prs3d_DimensionUnits (const Prs3d_DimensionUnits & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	None

Sets angle units") SetAngleUnits;
		void SetAngleUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

@return angle units") GetAngleUnits;
		const TCollection_AsciiString & GetAngleUnits ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	None

Sets length units") SetLengthUnits;
		void SetLengthUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

@return length units") GetLengthUnits;
		const TCollection_AsciiString & GetLengthUnits ();
};


%feature("shadow") Prs3d_DimensionUnits::~Prs3d_DimensionUnits %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_DimensionUnits {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Prs3d_Drawer;
class Prs3d_Drawer : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Prs3d_Drawer;
		 Prs3d_Drawer ();
		%feature("autodoc", "Args:
	aTypeOfDeflection(Aspect_TypeOfDeflection)

Returns:
	virtual void

Sets the type of chordal deflection.  
This indicates whether the deflection value is absolute  
or relative to the size of the object.") SetTypeOfDeflection;
		virtual void SetTypeOfDeflection (const Aspect_TypeOfDeflection aTypeOfDeflection);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Aspect_TypeOfDeflection

Returns the type of chordal deflection.  
This indicates whether the deflection value is absolute  
or relative to the size of the object.") TypeOfDeflection;
		virtual Aspect_TypeOfDeflection TypeOfDeflection ();
		%feature("autodoc", "Args:
	aChordialDeviation(Quantity_Length)

Returns:
	virtual void

Defines the maximal chordial deviation when drawing any curve;  
         Even if the type of deviation is set to TOD_Relative,  
         this value is used by:  
 
                  Prs3d_DeflectionCurve  
                  Prs3d_WFDeflectionSurface  
                  Prs3d_WFDeflectionRestrictedFace") SetMaximalChordialDeviation;
		virtual void SetMaximalChordialDeviation (const Quantity_Length aChordialDeviation);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Quantity_Length

returns the maximal chordial deviation. Default value is 0.1") MaximalChordialDeviation;
		virtual Quantity_Length MaximalChordialDeviation ();
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	virtual void

Sets the deviation coefficient aCoefficient.") SetDeviationCoefficient;
		virtual void SetDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the deviation coefficient.") DeviationCoefficient;
		virtual Standard_Real DeviationCoefficient ();
		%feature("autodoc", "Args:
	aCoefficient(Standard_Real)

Returns:
	virtual void

Sets the deviation coefficient aCoefficient for removal  
of hidden lines created by different viewpoints in  
different presentations. The Default value is 0.02.") SetHLRDeviationCoefficient;
		virtual void SetHLRDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the real number value of the hidden line  
removal deviation coefficient.") HLRDeviationCoefficient;
		virtual Standard_Real HLRDeviationCoefficient ();
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	virtual void

Sets anAngle, the angle of maximum chordal  
deviation for removal of hidden lines created by  
different viewpoints in different presentations. The  
default value is 20*PI/180.") SetHLRAngle;
		virtual void SetHLRAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the real number value of the deviation angle  
in hidden line removal views. The default value is 20*PI/180.") HLRAngle;
		virtual Standard_Real HLRAngle ();
		%feature("autodoc", "Args:
	anAngle(Standard_Real)

Returns:
	virtual void

Sets deviation angle") SetDeviationAngle;
		virtual void SetDeviationAngle (const Standard_Real anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the value for deviation angle.") DeviationAngle;
		virtual Standard_Real DeviationAngle ();
		%feature("autodoc", "Args:
	d(Standard_Integer)

Returns:
	virtual void

Sets the discretisation parameter d.") SetDiscretisation;
		virtual void SetDiscretisation (const Standard_Integer d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the discretisation setting.") Discretisation;
		virtual Standard_Integer Discretisation ();
		%feature("autodoc", "Args:
	Value(Standard_Real)

Returns:
	virtual void

defines the maximum value allowed  for the first and last  
         parameters of an infinite curve. Default value: 500.") SetMaximalParameterValue;
		virtual void SetMaximalParameterValue (const Standard_Real Value);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Sets the maximum value allowed for the first and last  
parameters of an infinite curve. By default, this value is 500000.") MaximalParameterValue;
		virtual Standard_Real MaximalParameterValue ();
		%feature("autodoc", "Args:
	OnOff(Standard_Boolean)

Returns:
	virtual void

Sets IsoOnPlane on or off   by setting the parameter  
OnOff to true or false.") SetIsoOnPlane;
		virtual void SetIsoOnPlane (const Standard_Boolean OnOff);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if the drawing of isos on planes is enabled.") IsoOnPlane;
		virtual Standard_Boolean IsoOnPlane ();
		%feature("autodoc", "Args:
	theTypeOfHLR(Prs3d_TypeOfHLR)

Returns:
	virtual void

Sets the type of HLR algorithm  
         used by drawer's interactive objects") SetTypeOfHLR;
		virtual void SetTypeOfHLR (const Prs3d_TypeOfHLR theTypeOfHLR);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Prs3d_TypeOfHLR

Gets the myTypeOfHLR value") TypeOfHLR;
		virtual Prs3d_TypeOfHLR TypeOfHLR ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_IsoAspect

Defines the attributes which are used when drawing an  
         U isoparametric curve of a face. Defines the number  
         of U isoparametric curves to be drawn for a single face.  
         The LineAspect for U isoparametric lines can be edited  
         (methods SetColor, SetTypeOfLine, SetWidth, SetNumber)  
         The default values are:  
         COLOR       : Quantity_NOC_GRAY75  
         TYPE OF LINE: Aspect_TOL_SOLID  
         WIDTH       : 0.5  
 
 
         These attributes are used by the following algorithms:  
         Prs3d_WFDeflectionSurface  
         Prs3d_WFDeflectionRestrictedFace") UIsoAspect;
		virtual Handle_Prs3d_IsoAspect UIsoAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_IsoAspect)

Returns:
	virtual void

No detailed docstring for this function.") SetUIsoAspect;
		virtual void SetUIsoAspect (const Handle_Prs3d_IsoAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_IsoAspect

Defines the attributes which are used when drawing an  
         V isoparametric curve of a face. Defines the number  
         of V isoparametric curves to be drawn for a single face.  
         The LineAspect for V isoparametric lines can be edited  
         (methods SetColor, SetTypeOfLine, SetWidth, SetNumber)  
         The default values are:  
         COLOR       : Quantity_NOC_GRAY82  
         TYPE OF LINE: Aspect_TOL_SOLID  
         WIDTH       : 0.5  
 
 
         These attributes are used by the following algorithms:  
         Prs3d_WFDeflectionSurface  
         Prs3d_WFDeflectionRestrictedFace") VIsoAspect;
		virtual Handle_Prs3d_IsoAspect VIsoAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_IsoAspect)

Returns:
	virtual void

Sets the appearance of V isoparameters - anAspect.") SetVIsoAspect;
		virtual void SetVIsoAspect (const Handle_Prs3d_IsoAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Stores the values for presentation of free boundaries,  
in other words, boundaries which are not shared.  
         The LineAspect for the  free boundaries can be edited.  
         The default values are:  
         Color: Quantity_NOC_GREEN  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
         These attributes are used by the algorithm Prs3d_WFShape") FreeBoundaryAspect;
		virtual Handle_Prs3d_LineAspect FreeBoundaryAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the parameter anAspect for the display of free boundaries.") SetFreeBoundaryAspect;
		virtual void SetFreeBoundaryAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	OnOff(Standard_Boolean)

Returns:
	virtual void

Sets free boundary drawing on or off by setting the  
parameter OnOff to true or false.") SetFreeBoundaryDraw;
		virtual void SetFreeBoundaryDraw (const Standard_Boolean OnOff);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if the drawing of the shared boundaries  
is disabled. True is the default setting.") FreeBoundaryDraw;
		virtual Standard_Boolean FreeBoundaryDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Returns wire aspect settings.  
         The LineAspect for the wire can be edited.  
         The default values are:  
         Color: Quantity_NOC_RED  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
         These attributes are used by the algorithm Prs3d_WFShape") WireAspect;
		virtual Handle_Prs3d_LineAspect WireAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the parameter anAspect for display of wires.") SetWireAspect;
		virtual void SetWireAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	OnOff(Standard_Boolean)

Returns:
	virtual void

Sets WireDraw on or off   by setting the parameter  
OnOff to true or false.") SetWireDraw;
		virtual void SetWireDraw (const Standard_Boolean OnOff);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

returns True if the drawing of the wire is enabled.") WireDraw;
		virtual Standard_Boolean WireDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Returns settings for shared boundary line aspects.  
         The LineAspect for the unfree boundaries can be edited.  
         The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
         These attributes are used by the algorithm Prs3d_WFShape") UnFreeBoundaryAspect;
		virtual Handle_Prs3d_LineAspect UnFreeBoundaryAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the parameter anAspect for the display of shared boundaries.") SetUnFreeBoundaryAspect;
		virtual void SetUnFreeBoundaryAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	OnOff(Standard_Boolean)

Returns:
	virtual void

Sets FreeBoundaryDraw on or off by setting the  
parameter OnOff to true or false.  
         By default the unfree boundaries  are drawn.") SetUnFreeBoundaryDraw;
		virtual void SetUnFreeBoundaryDraw (const Standard_Boolean OnOff);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if the drawing of the shared boundaries is enabled.  
True is the default setting.") UnFreeBoundaryDraw;
		virtual Standard_Boolean UnFreeBoundaryDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Returns settings for line aspects.  
These settings can be edited. The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
         These attributes are used by the following algorithms:  
         Prs3d_Curve  
         Prs3d_Line  
         Prs3d_HLRShape") LineAspect;
		virtual Handle_Prs3d_LineAspect LineAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the parameter anAspect for display attributes of lines.") SetLineAspect;
		virtual void SetLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_TextAspect

Returns settings for text aspect.  
These settings can be edited. The default value is:  
-   Color: Quantity_NOC_YELLOW") TextAspect;
		virtual Handle_Prs3d_TextAspect TextAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_TextAspect)

Returns:
	virtual void

Sets the parameter anAspect for display attributes of text.") SetTextAspect;
		virtual void SetTextAspect (const Handle_Prs3d_TextAspect & anAspect);
		%feature("autodoc", "Args:
	OnOff(Standard_Boolean)

Returns:
	virtual void

enables the drawing of an arrow at the end of each line.  
         By default the arrows are not drawn.") SetLineArrowDraw;
		virtual void SetLineArrowDraw (const Standard_Boolean OnOff);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Sets LineArrowDraw on or off by setting the  
parameter OnOff to true or false.") LineArrowDraw;
		virtual Standard_Boolean LineArrowDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_ArrowAspect

Returns the attributes for display of arrows.") ArrowAspect;
		virtual Handle_Prs3d_ArrowAspect ArrowAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_ArrowAspect)

Returns:
	virtual void

Sets the parameter anAspect for display attributes of arrows.") SetArrowAspect;
		virtual void SetArrowAspect (const Handle_Prs3d_ArrowAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_PointAspect

Returns the point aspect setting. The default values are  
       Color: Quantity_NOC_YELLOW  
         Type of marker: Aspect_TOM_PLUS  
         Scale: 1.  
         These attributes are used by the algorithms Prs3d_Point.") PointAspect;
		virtual Handle_Prs3d_PointAspect PointAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_PointAspect)

Returns:
	virtual void

Sets the parameter anAspect for display attributes of points") SetPointAspect;
		virtual void SetPointAspect (const Handle_Prs3d_PointAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_ShadingAspect

Returns settings for shading aspects.  
These settings can be edited. The default values are:  
-   Color: Quantity_NOC_YELLOW  
-   Material: Graphic3d_NOM_BRASS  
  Shading aspect is obtained through decomposition of  
3d faces into triangles, each side of each triangle  
being a chord of the corresponding curved edge in  
the face. Reflection of light in each projector  
perspective is then calculated for each of the  
resultant triangular planes.") ShadingAspect;
		virtual Handle_Prs3d_ShadingAspect ShadingAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_ShadingAspect)

Returns:
	virtual void

Sets the parameter anAspect for display attributes of shading.") SetShadingAspect;
		virtual void SetShadingAspect (const Handle_Prs3d_ShadingAspect & anAspect);
		%feature("autodoc", "Args:
	aValue(Standard_Boolean)

Returns:
	virtual void

indicates that the ShadingAspect will be apply  
         to the whole presentation. This allows to modify  
         the aspect without recomputing the content of the presentation.") SetShadingAspectGlobal;
		virtual void SetShadingAspectGlobal (const Standard_Boolean aValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") ShadingAspectGlobal;
		virtual Standard_Boolean ShadingAspectGlobal ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

returns Standard_True if the hidden lines are to be drawn.  
         By default the hidden lines are not drawn.") DrawHiddenLine;
		virtual Standard_Boolean DrawHiddenLine ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Enables the DrawHiddenLine function.") EnableDrawHiddenLine;
		virtual void EnableDrawHiddenLine ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Disables the DrawHiddenLine function.") DisableDrawHiddenLine;
		virtual void DisableDrawHiddenLine ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Returns settings for hidden line aspects.  
These settings can be edited. The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_DASH  
         Width: 1.") HiddenLineAspect;
		virtual Handle_Prs3d_LineAspect HiddenLineAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the parameter anAspect for the display of  
hidden lines in hidden line removal mode.") SetHiddenLineAspect;
		virtual void SetHiddenLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Returns settings for seen line aspects.  
These settings can be edited. The default values are:  
         Color: Quantity_NOC_YELLOW  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.") SeenLineAspect;
		virtual Handle_Prs3d_LineAspect SeenLineAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the parameter anAspect for the display of seen  
lines in hidden line removal mode.") SetSeenLineAspect;
		virtual void SetSeenLineAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_PlaneAspect

Returns settings for the appearance of planes.") PlaneAspect;
		virtual Handle_Prs3d_PlaneAspect PlaneAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_PlaneAspect)

Returns:
	virtual void

Sets the parameter anAspect for the display of planes.") SetPlaneAspect;
		virtual void SetPlaneAspect (const Handle_Prs3d_PlaneAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Returns settings for the appearance of vectors.  
These settings can be edited. The default values are:  
         Color: Quantity_NOC_SKYBLUE  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.") VectorAspect;
		virtual Handle_Prs3d_LineAspect VectorAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the modality anAspect for the display of vectors.") SetVectorAspect;
		virtual void SetVectorAspect (const Handle_Prs3d_LineAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_DatumAspect

Returns settings for the appearance of datums.  
These settings can be edited. The default values for  
the three axes are:  
         Color: Quantity_NOC_PEACHPUFF  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.") DatumAspect;
		virtual Handle_Prs3d_DatumAspect DatumAspect ();
		%feature("autodoc", "Args:
	anAspect(Handle_Prs3d_DatumAspect)

Returns:
	virtual void

Sets the modality anAspect for the display of datums.") SetDatumAspect;
		virtual void SetDatumAspect (const Handle_Prs3d_DatumAspect & anAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_DimensionAspect

Returns settings for the appearance of dimensions.") DimensionAspect;
		virtual Handle_Prs3d_DimensionAspect DimensionAspect ();
		%feature("autodoc", "Args:
	theAspect(Handle_Prs3d_DimensionAspect)

Returns:
	virtual void

Sets the settings for the appearance of dimensions.") SetDimensionAspect;
		virtual void SetDimensionAspect (const Handle_Prs3d_DimensionAspect & theAspect);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

Sets dimension length model units for computing of dimension presentation.") SetDimLengthModelUnits;
		virtual void SetDimLengthModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

Sets dimension angle model units for computing of dimension presentation.") SetDimAngleModelUnits;
		virtual void SetDimAngleModelUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

Returns length model units for the dimension presentation.") DimLengthModelUnits;
		virtual const TCollection_AsciiString & DimLengthModelUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

Returns angle model units for the dimension presentation.") DimAngleModelUnits;
		virtual const TCollection_AsciiString & DimAngleModelUnits ();
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

Sets length units in which value for dimension presentation is displayed.") SetDimLengthDisplayUnits;
		virtual void SetDimLengthDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	theUnits(TCollection_AsciiString)

Returns:
	virtual void

Sets angle units in which value for dimension presentation is displayed.") SetDimAngleDisplayUnits;
		virtual void SetDimAngleDisplayUnits (const TCollection_AsciiString & theUnits);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

Returns length units in which dimension presentation is displayed.") DimLengthDisplayUnits;
		virtual const TCollection_AsciiString & DimLengthDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TCollection_AsciiString

Returns angle units in which dimension presentation is displayed.") DimAngleDisplayUnits;
		virtual const TCollection_AsciiString & DimAngleDisplayUnits ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

The LineAspect for the wire can be edited.  
         The default values are:  
         Color: Quantity_NOC_ORANGE  
         Type of line: Aspect_TOL_SOLID  
         Width: 1.  
         These attributes are used by the algorithm Prs3d_WFShape.") SectionAspect;
		virtual Handle_Prs3d_LineAspect SectionAspect ();
		%feature("autodoc", "Args:
	theAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets the parameter theAspect for display attributes of sections.") SetSectionAspect;
		virtual void SetSectionAspect (const Handle_Prs3d_LineAspect & theAspect);
		%feature("autodoc", "Args:
	theIsEnabled(Standard_Boolean)

Returns:
	virtual void

Enables or disables face boundary drawing for shading presentations.  
theIsEnabled is a boolean flag indicating whether the face boundaries should be  
drawn or not.") SetFaceBoundaryDraw;
		virtual void SetFaceBoundaryDraw (const Standard_Boolean theIsEnabled);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks whether the face boundary drawing is enabled or not.") IsFaceBoundaryDraw;
		virtual Standard_Boolean IsFaceBoundaryDraw ();
		%feature("autodoc", "Args:
	theAspect(Handle_Prs3d_LineAspect)

Returns:
	virtual void

Sets line aspect for face boundaries.  
theAspect is the line aspect that determines the look of the face boundaries.") SetFaceBoundaryAspect;
		virtual void SetFaceBoundaryAspect (const Handle_Prs3d_LineAspect & theAspect);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Prs3d_LineAspect

Returns line aspect of face boundaries.") FaceBoundaryAspect;
		virtual Handle_Prs3d_LineAspect FaceBoundaryAspect ();
};


%feature("shadow") Prs3d_Drawer::~Prs3d_Drawer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_Drawer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_Drawer {
	Handle_Prs3d_Drawer GetHandle() {
	return *(Handle_Prs3d_Drawer*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_Drawer::~Handle_Prs3d_Drawer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_Drawer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_PlaneSet;
class Prs3d_PlaneSet : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Xdir(Standard_Real)
	Ydir(Standard_Real)
	Zdir(Standard_Real)
	Xloc(Quantity_Length)
	Yloc(Quantity_Length)
	Zloc(Quantity_Length)
	anOffset(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Prs3d_PlaneSet;
		 Prs3d_PlaneSet (const Standard_Real Xdir,const Standard_Real Ydir,const Standard_Real Zdir,const Quantity_Length Xloc,const Quantity_Length Yloc,const Quantity_Length Zloc,const Quantity_Length anOffset);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDirection;
		void SetDirection (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z);
		%feature("autodoc", "Args:
	anOffset(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetOffset;
		void SetOffset (const Quantity_Length anOffset);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

No detailed docstring for this function.") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

No detailed docstring for this function.") Offset;
		Quantity_Length Offset ();
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Location;
		void Location (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Prs3d_PlaneSet::~Prs3d_PlaneSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_PlaneSet {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_PlaneSet {
	Handle_Prs3d_PlaneSet GetHandle() {
	return *(Handle_Prs3d_PlaneSet*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_PlaneSet::~Handle_Prs3d_PlaneSet %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_PlaneSet {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_Presentation;
class Prs3d_Presentation : public Graphic3d_Structure {
	public:
		%feature("autodoc", "Args:
	aStructureManager(Handle_Graphic3d_StructureManager)
	Init(Standard_Boolean)=Standard_True

Returns:
	None

Constructs a presentation object  
if <Init> is false, no color initialization is done.") Prs3d_Presentation;
		 Prs3d_Presentation (const Handle_Graphic3d_StructureManager & aStructureManager,const Standard_Boolean Init = Standard_True);
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)

Returns:
	virtual Handle_Graphic3d_Structure

No detailed docstring for this function.") Compute;
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

displays the whole content of the presentation in white.") Highlight;
		void Highlight ();
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

displays the whole content of the presentation in the specified color.") Color;
		void Color (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BoundBox;
		void BoundBox ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Display;
		void Display ();
		%feature("autodoc", "Args:
	aShadingAspect(Handle_Prs3d_ShadingAspect)

Returns:
	None

No detailed docstring for this function.") SetShadingAspect;
		void SetShadingAspect (const Handle_Prs3d_ShadingAspect & aShadingAspect);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPickable;
		Standard_Boolean IsPickable ();
		%feature("autodoc", "Args:
	aTransformation(Handle_Geom_Transformation)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const Handle_Geom_Transformation & aTransformation);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Place;
		void Place (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z);
		%feature("autodoc", "Args:
	aTransformation(Handle_Geom_Transformation)

Returns:
	None

No detailed docstring for this function.") Multiply;
		void Multiply (const Handle_Geom_Transformation & aTransformation);
		%feature("autodoc", "Args:
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Move;
		void Move (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

No detailed docstring for this function.") Transformation;
		Handle_Geom_Transformation Transformation ();
		%feature("autodoc", "Args:
	WithDestruction(Standard_Boolean)=Standard_True

Returns:
	virtual void

removes the whole content of the presentation.  
         Does not remove the other connected presentations.  
//!	        if WithDestruction == Standard_False then  
//!		clears all the groups of primitives in the structure.") Clear;
		virtual void Clear (const Standard_Boolean WithDestruction = Standard_True);
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	None

No detailed docstring for this function.") Connect;
		void Connect (const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Handle_Prs3d_Presentation & aPresentation);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveAll;
		void RemoveAll ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetPickable;
		void SetPickable ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetUnPickable;
		void SetUnPickable ();
};


%feature("shadow") Prs3d_Presentation::~Prs3d_Presentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_Presentation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_Presentation {
	Handle_Prs3d_Presentation GetHandle() {
	return *(Handle_Prs3d_Presentation*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_Presentation::~Handle_Prs3d_Presentation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_Presentation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_Projector;
class Prs3d_Projector : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Pr(HLRAlgo_Projector)

Returns:
	None

No detailed docstring for this function.") Prs3d_Projector;
		 Prs3d_Projector (const HLRAlgo_Projector & Pr);
		%feature("autodoc", "Args:
	Pers(Standard_Boolean)
	Focus(Quantity_Length)
	DX(Quantity_Length)
	DY(Quantity_Length)
	DZ(Quantity_Length)
	XAt(Quantity_Length)
	YAt(Quantity_Length)
	ZAt(Quantity_Length)
	XUp(Quantity_Length)
	YUp(Quantity_Length)
	ZUp(Quantity_Length)

Returns:
	None

Constructs a projector framework from the following parameters  
-   Pers is true if the view is a perspective view and  
  false if it is an axonometric one;  
-   Focus is the focal length if a perspective view is defined;  
-   DX, DY and DZ are the coordinates of the  
  projection vector;  
-   XAt, YAt and ZAt are the coordinates of the view point;  
-   XUp, YUp and ZUp are the coordinates of the  
  vertical direction vector.") Prs3d_Projector;
		 Prs3d_Projector (const Standard_Boolean Pers,const Quantity_Length Focus,const Quantity_Length DX,const Quantity_Length DY,const Quantity_Length DZ,const Quantity_Length XAt,const Quantity_Length YAt,const Quantity_Length ZAt,const Quantity_Length XUp,const Quantity_Length YUp,const Quantity_Length ZUp);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Projector

Returns a projector object for use in a hidden line removal algorithm.") Projector;
		HLRAlgo_Projector Projector ();
};


%feature("shadow") Prs3d_Projector::~Prs3d_Projector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_Projector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_Projector {
	Handle_Prs3d_Projector GetHandle() {
	return *(Handle_Prs3d_Projector*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_Projector::~Handle_Prs3d_Projector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_Projector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_Root;
class Prs3d_Root {
	public:
		%feature("autodoc", "Args:
	Prs3d(Handle_Prs3d_Presentation)

Returns:
	static Handle_Graphic3d_Group

Returns the current group of primititves inside graphic  
objects in the display.  
A group also contains the attributes whose ranges are  
limited to the primitives in it.") CurrentGroup;
		static Handle_Graphic3d_Group CurrentGroup (const Handle_Prs3d_Presentation & Prs3d);
		%feature("autodoc", "Args:
	Prs3d(Handle_Prs3d_Presentation)

Returns:
	static Handle_Graphic3d_Group

Returns the new group of primitives inside graphic  
objects in the display.  
A group also contains the attributes whose ranges are limited to the primitives in it.") NewGroup;
		static Handle_Graphic3d_Group NewGroup (const Handle_Prs3d_Presentation & Prs3d);
};


%feature("shadow") Prs3d_Root::~Prs3d_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Prs3d_ShapeTool;
class Prs3d_ShapeTool {
	public:
		%feature("autodoc", "Args:
	TheShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Prs3d_ShapeTool;
		 Prs3d_ShapeTool (const TopoDS_Shape & TheShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitFace;
		void InitFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextFace;
		void NextFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") GetFace;
		const TopoDS_Face & GetFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") FaceBound;
		Bnd_Box FaceBound ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPlanarFace;
		Standard_Boolean IsPlanarFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitCurve;
		void InitCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreCurve;
		Standard_Boolean MoreCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextCurve;
		void NextCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") GetCurve;
		const TopoDS_Edge & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") CurveBound;
		Bnd_Box CurveBound ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Neighbours;
		Standard_Integer Neighbours ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") FacesOfEdge;
		Handle_TopTools_HSequenceOfShape FacesOfEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitVertex;
		void InitVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreVertex;
		Standard_Boolean MoreVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextVertex;
		void NextVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") GetVertex;
		const TopoDS_Vertex & GetVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasSurface;
		Standard_Boolean HasSurface ();
		%feature("autodoc", "Args:
	l(TopLoc_Location)

Returns:
	Handle_Poly_Triangulation

No detailed docstring for this function.") CurrentTriangulation;
		Handle_Poly_Triangulation CurrentTriangulation (TopLoc_Location & l);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasCurve;
		Standard_Boolean HasCurve ();
		%feature("autodoc", "Args:
	Indices(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)
	l(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") PolygonOnTriangulation;
		void PolygonOnTriangulation (Handle_Poly_PolygonOnTriangulation & Indices,Handle_Poly_Triangulation & T,TopLoc_Location & l);
		%feature("autodoc", "Args:
	l(TopLoc_Location)

Returns:
	Handle_Poly_Polygon3D

No detailed docstring for this function.") Polygon3D;
		Handle_Poly_Polygon3D Polygon3D (TopLoc_Location & l);
};


%feature("shadow") Prs3d_ShapeTool::~Prs3d_ShapeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_ShapeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Prs3d_Arrow;
class Prs3d_Arrow : public Prs3d_Root {
	public:
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)
	aLocation(gp_Pnt)
	aDirection(gp_Dir)
	anAngle(Quantity_PlaneAngle)
	aLength(Quantity_Length)

Returns:
	static void

Defines the representation of the arrow defined by  
the location point aLocation, the direction  
aDirection and the length aLength.  
The angle anAngle defines the angle of opening of the arrow head.  
The presentation object aPresentation stores the  
information defined in this framework.") Draw;
		static void Draw (const Handle_Prs3d_Presentation & aPresentation,const gp_Pnt & aLocation,const gp_Dir & aDirection,const Quantity_PlaneAngle anAngle,const Quantity_Length aLength);
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)
	aLocation(gp_Pnt)
	aDirection(gp_Dir)
	anAngle(Quantity_PlaneAngle)
	aLength(Quantity_Length)

Returns:
	static void

Defines the representation of the arrow defined by  
the location point aLocation, the direction vector  
aDirection and the length aLength.  
The angle anAngle defines the angle of opening of  
the arrow head, and the drawer aDrawer specifies  
the display attributes which arrows will have.  
 With this syntax, no presentation object is created.") Fill;
		static void Fill (const Handle_Prs3d_Presentation & aPresentation,const gp_Pnt & aLocation,const gp_Dir & aDirection,const Quantity_PlaneAngle anAngle,const Quantity_Length aLength);
};


%feature("shadow") Prs3d_Arrow::~Prs3d_Arrow %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_Arrow {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Prs3d_ArrowAspect;
class Prs3d_ArrowAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework for displaying arrows  
in representations of lengths. The lengths displayed  
are either on their own or in chamfers, fillets,  
diameters and radii.") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect ();
		%feature("autodoc", "Args:
	anAngle(Quantity_PlaneAngle)
	aLength(Quantity_Length)

Returns:
	None

Constructs a framework to display an arrow with a  
shaft of the length aLength and having a head with  
sides at the angle anAngle from each other.") Prs3d_ArrowAspect;
		 Prs3d_ArrowAspect (const Quantity_PlaneAngle anAngle,const Quantity_Length aLength);
		%feature("autodoc", "Args:
	anAngle(Quantity_PlaneAngle)

Returns:
	None

defines the angle of the arrows.") SetAngle;
		void SetAngle (const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

returns the current value of the angle used when drawing an arrow.") Angle;
		Quantity_PlaneAngle Angle ();
		%feature("autodoc", "Args:
	aLength(Quantity_Length)

Returns:
	None

defines the length of the arrows.") SetLength;
		void SetLength (const Quantity_Length aLength);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

returns the current value of the length used when drawing an arrow.") Length;
		Quantity_Length Length ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectLine3d

No detailed docstring for this function.") Aspect;
		Handle_Graphic3d_AspectLine3d Aspect ();
};


%feature("shadow") Prs3d_ArrowAspect::~Prs3d_ArrowAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_ArrowAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_ArrowAspect {
	Handle_Prs3d_ArrowAspect GetHandle() {
	return *(Handle_Prs3d_ArrowAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_ArrowAspect::~Handle_Prs3d_ArrowAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_ArrowAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_DatumAspect;
class Prs3d_DatumAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

An empty framework to define the display of datums.") Prs3d_DatumAspect;
		 Prs3d_DatumAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns the attributes for display of the first axis.") FirstAxisAspect;
		Handle_Prs3d_LineAspect FirstAxisAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns the attributes for display of the second axis.") SecondAxisAspect;
		Handle_Prs3d_LineAspect SecondAxisAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns the attributes for display of the third axis.") ThirdAxisAspect;
		Handle_Prs3d_LineAspect ThirdAxisAspect ();
		%feature("autodoc", "Args:
	draw(Standard_Boolean)

Returns:
	None

Sets the DrawFirstAndSecondAxis attributes to active.") SetDrawFirstAndSecondAxis;
		void SetDrawFirstAndSecondAxis (const Standard_Boolean draw);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the first and second axes can be drawn.") DrawFirstAndSecondAxis;
		Standard_Boolean DrawFirstAndSecondAxis ();
		%feature("autodoc", "Args:
	draw(Standard_Boolean)

Returns:
	None

Sets the DrawThirdAxis attributes to active.") SetDrawThirdAxis;
		void SetDrawThirdAxis (const Standard_Boolean draw);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the third axis can be drawn.") DrawThirdAxis;
		Standard_Boolean DrawThirdAxis ();
		%feature("autodoc", "Args:
	L1(Standard_Real)
	L2(Standard_Real)
	L3(Standard_Real)

Returns:
	None

Sets the lengths L1, L2 and L3 of the three axes.") SetAxisLength;
		void SetAxisLength (const Standard_Real L1,const Standard_Real L2,const Standard_Real L3);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the length of the displayed first axis.") FirstAxisLength;
		Quantity_Length FirstAxisLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the length of the displayed second axis.") SecondAxisLength;
		Quantity_Length SecondAxisLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the length of the displayed third axis.") ThirdAxisLength;
		Quantity_Length ThirdAxisLength ();
};


%feature("shadow") Prs3d_DatumAspect::~Prs3d_DatumAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_DatumAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_DatumAspect {
	Handle_Prs3d_DatumAspect GetHandle() {
	return *(Handle_Prs3d_DatumAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_DatumAspect::~Handle_Prs3d_DatumAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_DatumAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_DimensionAspect;
class Prs3d_DimensionAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework to define the display of dimensions.") Prs3d_DimensionAspect;
		 Prs3d_DimensionAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns the settings for the display of lines used in presentation of dimensions.") LineAspect;
		Handle_Prs3d_LineAspect LineAspect ();
		%feature("autodoc", "Args:
	theAspect(Handle_Prs3d_LineAspect)

Returns:
	None

Sets the display attributes of lines used in presentation of dimensions.") SetLineAspect;
		void SetLineAspect (const Handle_Prs3d_LineAspect & theAspect);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_TextAspect

Returns the settings for the display of text used in presentation of dimensions.") TextAspect;
		Handle_Prs3d_TextAspect TextAspect ();
		%feature("autodoc", "Args:
	theAspect(Handle_Prs3d_TextAspect)

Returns:
	None

Sets the display attributes of text used in presentation of dimensions.") SetTextAspect;
		void SetTextAspect (const Handle_Prs3d_TextAspect & theAspect);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Check if text for dimension label is 3d.") IsText3d;
		Standard_Boolean IsText3d ();
		%feature("autodoc", "Args:
	isText3d(Standard_Boolean)

Returns:
	None

Sets type of text.") MakeText3d;
		void MakeText3d (const Standard_Boolean isText3d);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Check if 3d text for dimension label is shaded.") IsTextShaded;
		Standard_Boolean IsTextShaded ();
		%feature("autodoc", "Args:
	isTextShaded(Standard_Boolean)

Returns:
	None

Turns on/off text shading for 3d text.") MakeTextShaded;
		void MakeTextShaded (const Standard_Boolean isTextShaded);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Gets type of arrows.") IsArrows3d;
		Standard_Boolean IsArrows3d ();
		%feature("autodoc", "Args:
	isArrows3d(Standard_Boolean)

Returns:
	None

Sets type of arrows.") MakeArrows3d;
		void MakeArrows3d (const Standard_Boolean isArrows3d);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Shows if Units are to be displayed along with dimension value.") IsUnitsDisplayed;
		Standard_Boolean IsUnitsDisplayed ();
		%feature("autodoc", "Args:
	theIsDisplayed(Standard_Boolean)

Returns:
	None

Specifies whether the units string should be displayed  
along with value label or not.") MakeUnitsDisplayed;
		void MakeUnitsDisplayed (const Standard_Boolean theIsDisplayed);
		%feature("autodoc", "Args:
	theArrowOrient(Prs3d_DimensionArrowOrientation)

Returns:
	None

Sets orientation of arrows (external or internal).  
By default orientation is chosen automatically according to situation and text label size.") SetArrowOrientation;
		void SetArrowOrientation (const Prs3d_DimensionArrowOrientation theArrowOrient);
		%feature("autodoc", "Args:
	None
Returns:
	Prs3d_DimensionArrowOrientation

Gets orientation of arrows (external or internal).") ArrowOrientation;
		Prs3d_DimensionArrowOrientation ArrowOrientation ();
		%feature("autodoc", "Args:
	thePosition(Prs3d_DimensionTextVerticalPosition)

Returns:
	None

Sets vertical text alignment for text label.") SetTextVerticalPosition;
		void SetTextVerticalPosition (const Prs3d_DimensionTextVerticalPosition thePosition);
		%feature("autodoc", "Args:
	None
Returns:
	Prs3d_DimensionTextVerticalPosition

Gets vertical text alignment for text label.") TextVerticalPosition;
		Prs3d_DimensionTextVerticalPosition TextVerticalPosition ();
		%feature("autodoc", "Args:
	thePosition(Prs3d_DimensionTextHorizontalPosition)

Returns:
	None

Sets horizontal text alignment for text label.") SetTextHorizontalPosition;
		void SetTextHorizontalPosition (const Prs3d_DimensionTextHorizontalPosition thePosition);
		%feature("autodoc", "Args:
	None
Returns:
	Prs3d_DimensionTextHorizontalPosition

Gets horizontal text alignment for text label.") TextHorizontalPosition;
		Prs3d_DimensionTextHorizontalPosition TextHorizontalPosition ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_ArrowAspect

Returns the settings for displaying arrows.") ArrowAspect;
		Handle_Prs3d_ArrowAspect ArrowAspect ();
		%feature("autodoc", "Args:
	theAspect(Handle_Prs3d_ArrowAspect)

Returns:
	None

Sets the display attributes of arrows used in presentation of dimensions.") SetArrowAspect;
		void SetArrowAspect (const Handle_Prs3d_ArrowAspect & theAspect);
		%feature("autodoc", "Args:
	theColor(Quantity_Color)

Returns:
	None

Sets the same color for all parts of dimension: lines, arrows and text.") SetCommonColor;
		void SetCommonColor (const Quantity_Color & theColor);
		%feature("autodoc", "Args:
	theSize(Standard_Real)

Returns:
	None

Sets extension size.") SetExtensionSize;
		void SetExtensionSize (const Standard_Real theSize);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns extension size.") ExtensionSize;
		Standard_Real ExtensionSize ();
		%feature("autodoc", "Args:
	theSize(Standard_Real)

Returns:
	None

Set size for arrow tail (extension without text).") SetArrowTailSize;
		void SetArrowTailSize (const Standard_Real theSize);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns arrow tail size.") ArrowTailSize;
		Standard_Real ArrowTailSize ();
		%feature("autodoc", "Args:
	theFormat(TCollection_AsciiString)

Returns:
	None

Sets 'sprintf'-syntax format for formatting dimension value labels.") SetValueStringFormat;
		void SetValueStringFormat (const TCollection_AsciiString & theFormat);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns format.") ValueStringFormat;
		TCollection_AsciiString ValueStringFormat ();
};


%feature("shadow") Prs3d_DimensionAspect::~Prs3d_DimensionAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_DimensionAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_DimensionAspect {
	Handle_Prs3d_DimensionAspect GetHandle() {
	return *(Handle_Prs3d_DimensionAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_DimensionAspect::~Handle_Prs3d_DimensionAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_DimensionAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_LineAspect;
class Prs3d_LineAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)
	aType(Aspect_TypeOfLine)
	aWidth(Standard_Real)

Returns:
	None

Constructs a framework for line aspect defined by  
-   the color aColor  
-   the type of line aType and  
-   the line thickness aWidth.  
  Type of line refers to whether the line is solid or dotted, for example.") Prs3d_LineAspect;
		 Prs3d_LineAspect (const Quantity_NameOfColor aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	aType(Aspect_TypeOfLine)
	aWidth(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Prs3d_LineAspect;
		 Prs3d_LineAspect (const Quantity_Color & aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

Sets the line color defined at the time of construction.  
         Default value: Quantity_NOC_YELLOW") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfLine)

Returns:
	None

Sets the type of line defined at the time of construction.  
This could, for example, be solid, dotted or made up of dashes.  
         Default value: Aspect_TOL_SOLID") SetTypeOfLine;
		void SetTypeOfLine (const Aspect_TypeOfLine aType);
		%feature("autodoc", "Args:
	aWidth(Standard_Real)

Returns:
	None

Sets the line width defined at the time of construction.  
         Default value: 1.") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectLine3d

Returns the line aspect. This is defined as the set of  
color, type and thickness attributes.") Aspect;
		Handle_Graphic3d_AspectLine3d Aspect ();
};


%feature("shadow") Prs3d_LineAspect::~Prs3d_LineAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_LineAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_LineAspect {
	Handle_Prs3d_LineAspect GetHandle() {
	return *(Handle_Prs3d_LineAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_LineAspect::~Handle_Prs3d_LineAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_LineAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_PlaneAspect;
class Prs3d_PlaneAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework for the display of planes.") Prs3d_PlaneAspect;
		 Prs3d_PlaneAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns the attributes of displayed edges involved in the presentation of planes.") EdgesAspect;
		Handle_Prs3d_LineAspect EdgesAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns the attributes of displayed isoparameters involved in the presentation of planes.") IsoAspect;
		Handle_Prs3d_LineAspect IsoAspect ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_LineAspect

Returns the settings for displaying an arrow.") ArrowAspect;
		Handle_Prs3d_LineAspect ArrowAspect ();
		%feature("autodoc", "Args:
	L(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetArrowsLength;
		void SetArrowsLength (const Quantity_Length L);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the length of the arrow shaft used in the display of arrows.") ArrowsLength;
		Quantity_Length ArrowsLength ();
		%feature("autodoc", "Args:
	L(Quantity_Length)

Returns:
	None

Sets the angle of the arrowhead used in the display of planes.") SetArrowsSize;
		void SetArrowsSize (const Quantity_Length L);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the size of arrows used in the display of planes.") ArrowsSize;
		Quantity_Length ArrowsSize ();
		%feature("autodoc", "Args:
	ang(Quantity_PlaneAngle)

Returns:
	None

Sets the angle of the arrowhead used in the display  
of arrows involved in the presentation of planes.") SetArrowsAngle;
		void SetArrowsAngle (const Quantity_PlaneAngle ang);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

Returns the angle of the arrowhead used in the  
display of arrows involved in the presentation of planes.") ArrowsAngle;
		Quantity_PlaneAngle ArrowsAngle ();
		%feature("autodoc", "Args:
	draw(Standard_Boolean)

Returns:
	None

Sets the display attributes defined in DisplayCenterArrow to active.") SetDisplayCenterArrow;
		void SetDisplayCenterArrow (const Standard_Boolean draw);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the display of center arrows is allowed.") DisplayCenterArrow;
		Standard_Boolean DisplayCenterArrow ();
		%feature("autodoc", "Args:
	draw(Standard_Boolean)

Returns:
	None

Sets the display attributes defined in DisplayEdgesArrows to active.") SetDisplayEdgesArrows;
		void SetDisplayEdgesArrows (const Standard_Boolean draw);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the display of edge arrows is allowed.") DisplayEdgesArrows;
		Standard_Boolean DisplayEdgesArrows ();
		%feature("autodoc", "Args:
	draw(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetDisplayEdges;
		void SetDisplayEdges (const Standard_Boolean draw);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") DisplayEdges;
		Standard_Boolean DisplayEdges ();
		%feature("autodoc", "Args:
	draw(Standard_Boolean)

Returns:
	None

Sets the display attributes defined in DisplayIso to active.") SetDisplayIso;
		void SetDisplayIso (const Standard_Boolean draw);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the display of isoparameters is allowed.") DisplayIso;
		Standard_Boolean DisplayIso ();
		%feature("autodoc", "Args:
	LX(Quantity_Length)
	LY(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetPlaneLength;
		void SetPlaneLength (const Quantity_Length LX,const Quantity_Length LY);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the length of the x axis used in the display of planes.") PlaneXLength;
		Quantity_Length PlaneXLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the length of the y axis used in the display of planes.") PlaneYLength;
		Quantity_Length PlaneYLength ();
		%feature("autodoc", "Args:
	L(Quantity_Length)

Returns:
	None

Sets the distance L between isoparameters used in the display of planes.") SetIsoDistance;
		void SetIsoDistance (const Quantity_Length L);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the distance between isoparameters used in the display of planes.") IsoDistance;
		Quantity_Length IsoDistance ();
};


%feature("shadow") Prs3d_PlaneAspect::~Prs3d_PlaneAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_PlaneAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_PlaneAspect {
	Handle_Prs3d_PlaneAspect GetHandle() {
	return *(Handle_Prs3d_PlaneAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_PlaneAspect::~Handle_Prs3d_PlaneAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_PlaneAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_PointAspect;
class Prs3d_PointAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfMarker)
	aColor(Quantity_Color)
	aScale(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Aspect_TypeOfMarker aType,const Quantity_Color & aColor,const Standard_Real aScale);
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfMarker)
	aColor(Quantity_NameOfColor)
	aScale(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Aspect_TypeOfMarker aType,const Quantity_NameOfColor aColor,const Standard_Real aScale);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)
	AWidth(Standard_Integer)
	AHeight(Standard_Integer)
	ATexture(Handle_TColStd_HArray1OfByte)

Returns:
	None

defines only the urer defined marker point.") Prs3d_PointAspect;
		 Prs3d_PointAspect (const Quantity_Color & AColor,const Standard_Integer AWidth,const Standard_Integer AHeight,const Handle_TColStd_HArray1OfByte & ATexture);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

defines the color to be used when drawing a point.  
         Default value: Quantity_NOC_YELLOW") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aType(Aspect_TypeOfMarker)

Returns:
	None

defines the type of representation to be used when drawing a point.  
         Default value: Aspect_TOM_PLUS") SetTypeOfMarker;
		void SetTypeOfMarker (const Aspect_TypeOfMarker aType);
		%feature("autodoc", "Args:
	aScale(Standard_Real)

Returns:
	None

defines the size of the marker used when drawing a point.  
         Default value: 1.") SetScale;
		void SetScale (const Standard_Real aScale);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectMarker3d

No detailed docstring for this function.") Aspect;
		Handle_Graphic3d_AspectMarker3d Aspect ();
		%feature("autodoc", "Args:
	AWidth(Standard_Integer)
	AHeight(Standard_Integer)

Returns:
	None

Returns marker's texture size.") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_MarkerImage_Handle

Returns marker's texture.") GetTexture;
		const Graphic3d_MarkerImage_Handle & GetTexture ();
};


%feature("shadow") Prs3d_PointAspect::~Prs3d_PointAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_PointAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_PointAspect {
	Handle_Prs3d_PointAspect GetHandle() {
	return *(Handle_Prs3d_PointAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_PointAspect::~Handle_Prs3d_PointAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_PointAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_ShadingAspect;
class Prs3d_ShadingAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework to display shading.") Prs3d_ShadingAspect;
		 Prs3d_ShadingAspect ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_BOTH_SIDE

Returns:
	None

Change the polygons interior color and material ambient color.") SetColor;
		void SetColor (const Quantity_Color & aColor,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_BOTH_SIDE

Returns:
	None

Change the polygons interior color and material ambient color.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("autodoc", "Args:
	aMaterial(Graphic3d_MaterialAspect)
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_BOTH_SIDE

Returns:
	None

Change the polygons material aspect.") SetMaterial;
		void SetMaterial (const Graphic3d_MaterialAspect & aMaterial,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("autodoc", "Args:
	aMaterial(Graphic3d_NameOfMaterial)
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_BOTH_SIDE

Returns:
	None

No detailed docstring for this function.") SetMaterial;
		void SetMaterial (const Graphic3d_NameOfMaterial aMaterial,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("autodoc", "Args:
	aValue(Standard_Real)
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_BOTH_SIDE

Returns:
	None

Change the polygons transparency value.  
 Warning : aValue must be in the range 0,1. 0 is the default (NO transparent)") SetTransparency;
		void SetTransparency (const Standard_Real aValue,const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_BOTH_SIDE);
		%feature("autodoc", "Args:
	Asp(Handle_Graphic3d_AspectFillArea3d)

Returns:
	None

Change the polygons aspect properties.") SetAspect;
		void SetAspect (const Handle_Graphic3d_AspectFillArea3d & Asp);
		%feature("autodoc", "Args:
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_FRONT_SIDE

Returns:
	Quantity_Color

Returns the polygons color.") Color;
		Quantity_Color Color (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);
		%feature("autodoc", "Args:
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_FRONT_SIDE

Returns:
	Graphic3d_MaterialAspect

Returns the polygons material aspect.") Material;
		Graphic3d_MaterialAspect Material (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);
		%feature("autodoc", "Args:
	aModel(Aspect_TypeOfFacingModel)=Aspect_TOFM_FRONT_SIDE

Returns:
	Standard_Real

Returns the polygons transparency value.") Transparency;
		Standard_Real Transparency (const Aspect_TypeOfFacingModel aModel = Aspect_TOFM_FRONT_SIDE);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectFillArea3d

Returns the polygons aspect properties.") Aspect;
		Handle_Graphic3d_AspectFillArea3d Aspect ();
};


%feature("shadow") Prs3d_ShadingAspect::~Prs3d_ShadingAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_ShadingAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_ShadingAspect {
	Handle_Prs3d_ShadingAspect GetHandle() {
	return *(Handle_Prs3d_ShadingAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_ShadingAspect::~Handle_Prs3d_ShadingAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_ShadingAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_Text;
class Prs3d_Text : public Prs3d_Root {
	public:
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)
	aDrawer(Handle_Prs3d_Drawer)
	aText(TCollection_ExtendedString)
	AttachmentPoint(gp_Pnt)

Returns:
	static void

Defines the display of the text aText at the point AttachmentPoint.  
The drawer aDrawer specifies the display attributes which texts will have.  
The presentation object aPresentation stores the  
information defined in this framework.  
static void Draw (const Handle_Prs3d_Presentation&  
aPresentation, const Handle_Prs3d_TextAspect&  
anAspect, const TCollection_ExtendedString& aText,  
const gp_Pnt& AttachmentPoint);") Draw;
		static void Draw (const Handle_Prs3d_Presentation & aPresentation,const Handle_Prs3d_Drawer & aDrawer,const TCollection_ExtendedString & aText,const gp_Pnt & AttachmentPoint);
		%feature("autodoc", "Args:
	aPresentation(Handle_Prs3d_Presentation)
	anAspect(Handle_Prs3d_TextAspect)
	aText(TCollection_ExtendedString)
	AttachmentPoint(gp_Pnt)

Returns:
	static void

Defines the display of the text aText at the point  
AttachmentPoint.  
The text aspect object anAspect specifies the display  
attributes which texts will have.  
The presentation object aPresentation stores the  
information defined in this framework.  
This syntax could be used if you had not already  
defined text display attributes in a drawer or if you  
wanted to exceptionally overide the definition  
provided in your drawer.") Draw;
		static void Draw (const Handle_Prs3d_Presentation & aPresentation,const Handle_Prs3d_TextAspect & anAspect,const TCollection_ExtendedString & aText,const gp_Pnt & AttachmentPoint);
};


%feature("shadow") Prs3d_Text::~Prs3d_Text %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_Text {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Prs3d_TextAspect;
class Prs3d_TextAspect : public Prs3d_BasicAspect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework for defining display attributes of text.") Prs3d_TextAspect;
		 Prs3d_TextAspect ();
		%feature("autodoc", "Args:
	aColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)

Returns:
	None

Sets the color of the type used in text display.") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("autodoc", "Args:
	aFont(char *)

Returns:
	None

Sets the font used in text display.") SetFont;
		void SetFont (const char * aFont);
		%feature("autodoc", "Args:
	aRatio(Standard_Real)

Returns:
	None

Returns the height-width ratio, also known as the expansion factor.") SetHeightWidthRatio;
		void SetHeightWidthRatio (const Standard_Real aRatio);
		%feature("autodoc", "Args:
	aSpace(Quantity_Length)

Returns:
	None

Sets the length of the box which text will occupy.") SetSpace;
		void SetSpace (const Quantity_Length aSpace);
		%feature("autodoc", "Args:
	aHeight(Standard_Real)

Returns:
	None

Sets the height of the text.") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("autodoc", "Args:
	anAngle(Quantity_PlaneAngle)

Returns:
	None

Sets the angle") SetAngle;
		void SetAngle (const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the height of the text box.") Height;
		Standard_Real Height ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

Returns the angle") Angle;
		Quantity_PlaneAngle Angle ();
		%feature("autodoc", "Args:
	aJustification(Graphic3d_HorizontalTextAlignment)

Returns:
	None

Sets horizontal alignment of text.") SetHorizontalJustification;
		void SetHorizontalJustification (const Graphic3d_HorizontalTextAlignment aJustification);
		%feature("autodoc", "Args:
	aJustification(Graphic3d_VerticalTextAlignment)

Returns:
	None

Sets the vertical alignment of text.") SetVerticalJustification;
		void SetVerticalJustification (const Graphic3d_VerticalTextAlignment aJustification);
		%feature("autodoc", "Args:
	anOrientation(Graphic3d_TextPath)

Returns:
	None

Sets the orientation of text.") SetOrientation;
		void SetOrientation (const Graphic3d_TextPath anOrientation);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_HorizontalTextAlignment

Returns the horizontal alignment of the text.  
The range of values includes:  
-   left  
-   center  
-   right, and  
-   normal (justified).") HorizontalJustification;
		Graphic3d_HorizontalTextAlignment HorizontalJustification ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_VerticalTextAlignment

Returns the vertical alignment of the text.  
The range of values includes:  
-   normal  
-   top  
-   cap  
-   half  
-   base  
-   bottom") VerticalJustification;
		Graphic3d_VerticalTextAlignment VerticalJustification ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TextPath

Returns the orientation of the text.  
Text can be displayed in the following directions:  
-   up  
-   down  
-   left, or  
-   right") Orientation;
		Graphic3d_TextPath Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_AspectText3d

Returns the purely textual attributes used in the display of text.  
These include:  
-   color  
-   font  
-   height/width ratio, that is, the expansion factor, and  
-   space between characters.") Aspect;
		Handle_Graphic3d_AspectText3d Aspect ();
};


%feature("shadow") Prs3d_TextAspect::~Prs3d_TextAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_TextAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_TextAspect {
	Handle_Prs3d_TextAspect GetHandle() {
	return *(Handle_Prs3d_TextAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_TextAspect::~Handle_Prs3d_TextAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_TextAspect {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Prs3d_IsoAspect;
class Prs3d_IsoAspect : public Prs3d_LineAspect {
	public:
		%feature("autodoc", "Args:
	aColor(Quantity_NameOfColor)
	aType(Aspect_TypeOfLine)
	aWidth(Standard_Real)
	aNumber(Standard_Integer)

Returns:
	None

Constructs a framework to define display attributes of isoparameters.  
These include:  
-   the color attribute aColor  
-   the type of line aType  
-   the width value aWidth  
-   aNumber, the number of isoparameters to be   displayed.") Prs3d_IsoAspect;
		 Prs3d_IsoAspect (const Quantity_NameOfColor aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth,const Standard_Integer aNumber);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	aType(Aspect_TypeOfLine)
	aWidth(Standard_Real)
	aNumber(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Prs3d_IsoAspect;
		 Prs3d_IsoAspect (const Quantity_Color & aColor,const Aspect_TypeOfLine aType,const Standard_Real aWidth,const Standard_Integer aNumber);
		%feature("autodoc", "Args:
	aNumber(Standard_Integer)

Returns:
	None

defines the number of U or V isoparametric curves  
        to be drawn for a single face.  
         Default value: 10") SetNumber;
		void SetNumber (const Standard_Integer aNumber);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of U or V isoparametric curves drawn for a single face.") Number;
		Standard_Integer Number ();
};


%feature("shadow") Prs3d_IsoAspect::~Prs3d_IsoAspect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Prs3d_IsoAspect {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Prs3d_IsoAspect {
	Handle_Prs3d_IsoAspect GetHandle() {
	return *(Handle_Prs3d_IsoAspect*) &$self;
	}
};

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
%feature("shadow") Handle_Prs3d_IsoAspect::~Handle_Prs3d_IsoAspect %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Prs3d_IsoAspect {
    void _kill_pointed() {
        delete $self;
    }
};

