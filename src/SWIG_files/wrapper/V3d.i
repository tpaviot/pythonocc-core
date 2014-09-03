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
%module (package="OCC") V3d

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

%include V3d_headers.i

/* typedefs */
typedef V3d_View * V3d_ViewPointer;
typedef V3d_Viewer * V3d_ViewerPointer;
typedef Standard_Real V3d_Parameter;
typedef Standard_Real V3d_Coordinate;
typedef V3d_LayerMgr * V3d_LayerMgrPointer;
/* end typedefs declaration */

/* public enums */
enum V3d_TypeOfAxe {
	V3d_X = 0,
	V3d_Y = 1,
	V3d_Z = 2,
};

enum V3d_TypeOfBackfacingModel {
	V3d_TOBM_AUTOMATIC = 0,
	V3d_TOBM_ALWAYS_DISPLAYED = 1,
	V3d_TOBM_NEVER_DISPLAYED = 2,
};

enum V3d_TypeOfLight {
	V3d_AMBIENT = 0,
	V3d_DIRECTIONAL = 1,
	V3d_POSITIONAL = 2,
	V3d_SPOT = 3,
};

enum V3d_TypeOfOrientation {
	V3d_Xpos = 0,
	V3d_Ypos = 1,
	V3d_Zpos = 2,
	V3d_Xneg = 3,
	V3d_Yneg = 4,
	V3d_Zneg = 5,
	V3d_XposYpos = 6,
	V3d_XposZpos = 7,
	V3d_YposZpos = 8,
	V3d_XnegYneg = 9,
	V3d_XnegYpos = 10,
	V3d_XnegZneg = 11,
	V3d_XnegZpos = 12,
	V3d_YnegZneg = 13,
	V3d_YnegZpos = 14,
	V3d_XposYneg = 15,
	V3d_XposZneg = 16,
	V3d_YposZneg = 17,
	V3d_XposYposZpos = 18,
	V3d_XposYnegZpos = 19,
	V3d_XposYposZneg = 20,
	V3d_XnegYposZpos = 21,
	V3d_XposYnegZneg = 22,
	V3d_XnegYposZneg = 23,
	V3d_XnegYnegZpos = 24,
	V3d_XnegYnegZneg = 25,
};

enum V3d_TypeOfPickCamera {
	V3d_POSITIONCAMERA = 0,
	V3d_SPACECAMERA = 1,
	V3d_RADIUSTEXTCAMERA = 2,
	V3d_ExtRADIUSCAMERA = 3,
	V3d_IntRADIUSCAMERA = 4,
	V3d_NOTHINGCAMERA = 5,
};

enum V3d_TypeOfPickLight {
	V3d_POSITIONLIGHT = 0,
	V3d_SPACELIGHT = 1,
	V3d_RADIUSTEXTLIGHT = 2,
	V3d_ExtRADIUSLIGHT = 3,
	V3d_IntRADIUSLIGHT = 4,
	V3d_NOTHING = 5,
};

enum V3d_TypeOfProjectionModel {
	V3d_TPM_SCREEN = 0,
	V3d_TPM_WALKTHROUGH = 1,
};

enum V3d_TypeOfRepresentation {
	V3d_SIMPLE = 0,
	V3d_COMPLETE = 1,
	V3d_PARTIAL = 2,
	V3d_SAMELAST = 3,
};

enum V3d_TypeOfShadingModel {
	V3d_COLOR = 0,
	V3d_MULTICOLOR = 1,
	V3d_FLAT = 2,
	V3d_GOURAUD = 3,
	V3d_HIDDEN = 4,
};

enum V3d_TypeOfSurfaceDetail {
	V3d_TEX_NONE = 0,
	V3d_TEX_ENVIRONMENT = 1,
	V3d_TEX_ALL = 2,
};

enum V3d_TypeOfUpdate {
	V3d_ASAP = 0,
	V3d_WAIT = 1,
};

enum V3d_TypeOfView {
	V3d_ORTHOGRAPHIC = 0,
	V3d_PERSPECTIVE = 1,
};

enum V3d_TypeOfVisualization {
	V3d_WIREFRAME = 0,
	V3d_ZBUFFER = 1,
};

enum V3d_TypeOfZclipping {
	V3d_OFF = 0,
	V3d_BACK = 1,
	V3d_FRONT = 2,
	V3d_SLICE = 3,
};

/* end public enums declaration */

%rename(v3d) V3d;
%nodefaultctor V3d;
class V3d {
	public:
		%feature("autodoc", "Args:
	Orientation(V3d_TypeOfOrientation)

Returns:
	static Graphic3d_Vector

Determines the orientation vector corresponding  
         to the predefined orientation type.") GetProjAxis;
		static Graphic3d_Vector GetProjAxis (const V3d_TypeOfOrientation Orientation);
		%feature("autodoc", "Args:
	garrow(Handle_Graphic3d_Group)
	X0(V3d_Coordinate)
	Y0(V3d_Coordinate)
	Z0(V3d_Coordinate)
	DX(V3d_Parameter)
	DY(V3d_Parameter)
	DZ(V3d_Parameter)
	Alpha(Quantity_PlaneAngle)
	Lng(V3d_Parameter)

Returns:
	static void

Compute the graphic structure of arrow.  
         X0,Y0,Z0 : coordinate of the arrow.  
         DX,DY,DZ : Direction of the arrow.  
         Alpha    : Angle of arrow.  
         Lng      : Length of arrow.") ArrowOfRadius;
		static void ArrowOfRadius (const Handle_Graphic3d_Group & garrow,const V3d_Coordinate X0,const V3d_Coordinate Y0,const V3d_Coordinate Z0,const V3d_Parameter DX,const V3d_Parameter DY,const V3d_Parameter DZ,const Quantity_PlaneAngle Alpha,const V3d_Parameter Lng);
		%feature("autodoc", "Args:
	gcircle(Handle_Graphic3d_Group)
	X0(V3d_Coordinate)
	Y0(V3d_Coordinate)
	Z0(V3d_Coordinate)
	VX(V3d_Parameter)
	VY(V3d_Parameter)
	VZ(V3d_Parameter)
	Radius(V3d_Parameter)

Returns:
	static void

Compute the graphic structure of circle.  
         X0,Y0,Z0 : Center of circle.  
         VX,VY,VZ : Axis of circle.  
         Radius   : Radius of circle.") CircleInPlane;
		static void CircleInPlane (const Handle_Graphic3d_Group & gcircle,const V3d_Coordinate X0,const V3d_Coordinate Y0,const V3d_Coordinate Z0,const V3d_Parameter VX,const V3d_Parameter VY,const V3d_Parameter VZ,const V3d_Parameter Radius);
		%feature("autodoc", "Args:
	aPreviousView(Handle_V3d_View)
	aNextView(Handle_V3d_View)

Returns:
	static void

No detailed docstring for this function.") SwitchViewsinWindow;
		static void SwitchViewsinWindow (const Handle_V3d_View & aPreviousView,const Handle_V3d_View & aNextView);
		%feature("autodoc", "Args:
	aViewer(Handle_V3d_Viewer)
	aRadius(Quantity_Length)=1000

Returns:
	static void

test.") DrawSphere;
		static void DrawSphere (const Handle_V3d_Viewer & aViewer,const Quantity_Length aRadius = 1000);
		%feature("autodoc", "Args:
	aViewer(Handle_V3d_Viewer)
	aRadius(Quantity_Length)=1000

Returns:
	static void

test.") PickGrid;
		static void PickGrid (const Handle_V3d_Viewer & aViewer,const Quantity_Length aRadius = 1000);
		%feature("autodoc", "Args:
	aViewer(Handle_V3d_Viewer)
	x1(Quantity_Length)
	y1(Quantity_Length)
	z1(Quantity_Length)
	x2(Quantity_Length)
	y2(Quantity_Length)
	z2(Quantity_Length)

Returns:
	static void

test.") SetPlane;
		static void SetPlane (const Handle_V3d_Viewer & aViewer,const Quantity_Length x1,const Quantity_Length y1,const Quantity_Length z1,const Quantity_Length x2,const Quantity_Length y2,const Quantity_Length z2);
};


%feature("shadow") V3d::~V3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor V3d_CircularGrid;
class V3d_CircularGrid : public Aspect_CircularGrid {
	public:
		%feature("autodoc", "Args:
	aViewer(V3d_ViewerPointer)
	aColor(Quantity_Color)
	aTenthColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") V3d_CircularGrid;
		 V3d_CircularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	aTenthColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColors;
		void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Display;
		void Display ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Erase;
		void Erase ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	OffSet(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	OffSet(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetGraphicValues;
		void SetGraphicValues (const Standard_Real Radius,const Standard_Real OffSet);
};


%feature("shadow") V3d_CircularGrid::~V3d_CircularGrid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_CircularGrid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_CircularGrid {
	Handle_V3d_CircularGrid GetHandle() {
	return *(Handle_V3d_CircularGrid*) &$self;
	}
};

%nodefaultctor Handle_V3d_CircularGrid;
class Handle_V3d_CircularGrid : public Handle_Aspect_CircularGrid {

    public:
        // constructors
        Handle_V3d_CircularGrid();
        Handle_V3d_CircularGrid(const Handle_V3d_CircularGrid &aHandle);
        Handle_V3d_CircularGrid(const V3d_CircularGrid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_CircularGrid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_CircularGrid {
    V3d_CircularGrid* GetObject() {
    return (V3d_CircularGrid*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_CircularGrid::~Handle_V3d_CircularGrid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_CircularGrid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_ColorScale;
class V3d_ColorScale : public Aspect_ColorScale {
	public:
		%feature("autodoc", "Args:
	aMgr(Handle_V3d_LayerMgr)

Returns:
	None

Returns returns ColorScale from V3d.  Returns View from V3d.") V3d_ColorScale;
		 V3d_ColorScale (const Handle_V3d_LayerMgr & aMgr);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Display;
		void Display ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Erase;
		void Erase ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("autodoc", "Args:
	X(Standard_Integer)
	Y(Standard_Integer)
	W(Standard_Integer)
	H(Standard_Integer)
	aColor(Quantity_Color)
	aFilled(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") PaintRect;
		virtual void PaintRect (const Standard_Integer X,const Standard_Integer Y,const Standard_Integer W,const Standard_Integer H,const Quantity_Color & aColor,const Standard_Boolean aFilled = Standard_False);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)
	X(Standard_Integer)
	Y(Standard_Integer)
	aColor(Quantity_Color)

Returns:
	virtual void

No detailed docstring for this function.") PaintText;
		virtual void PaintText (const TCollection_ExtendedString & aText,const Standard_Integer X,const Standard_Integer Y,const Quantity_Color & aColor);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)

Returns:
	virtual Standard_Integer

No detailed docstring for this function.") TextWidth;
		virtual Standard_Integer TextWidth (const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	aText(TCollection_ExtendedString)

Returns:
	virtual Standard_Integer

No detailed docstring for this function.") TextHeight;
		virtual Standard_Integer TextHeight (const TCollection_ExtendedString & aText);
		%feature("autodoc", "Args:
	AText(TCollection_ExtendedString)
	AHeight(Standard_Integer)
	AWidth(Standard_Integer)
	AnAscent(Standard_Integer)
	ADescent(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TextSize;
		void TextSize (const TCollection_ExtendedString & AText,const Standard_Integer AHeight,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DrawScale;
		void DrawScale ();
};


%feature("shadow") V3d_ColorScale::~V3d_ColorScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_ColorScale {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_ColorScale {
	Handle_V3d_ColorScale GetHandle() {
	return *(Handle_V3d_ColorScale*) &$self;
	}
};

%nodefaultctor Handle_V3d_ColorScale;
class Handle_V3d_ColorScale : public Handle_Aspect_ColorScale {

    public:
        // constructors
        Handle_V3d_ColorScale();
        Handle_V3d_ColorScale(const Handle_V3d_ColorScale &aHandle);
        Handle_V3d_ColorScale(const V3d_ColorScale *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_ColorScale DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_ColorScale {
    V3d_ColorScale* GetObject() {
    return (V3d_ColorScale*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_ColorScale::~Handle_V3d_ColorScale %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_ColorScale {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_ColorScaleLayerItem;
class V3d_ColorScaleLayerItem : public Visual3d_LayerItem {
	public:
		%feature("autodoc", "Args:
	aColorScale(Handle_V3d_ColorScale)

Returns:
	None

Creates a layer item") V3d_ColorScaleLayerItem;
		 V3d_ColorScaleLayerItem (const Handle_V3d_ColorScale & aColorScale);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

virtual function for recompute 2D  
       presentation (empty by default)") ComputeLayerPrs;
		virtual void ComputeLayerPrs ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

virtual function for recompute 2D  
       presentation (empty by default)") RedrawLayerPrs;
		virtual void RedrawLayerPrs ();
};


%feature("shadow") V3d_ColorScaleLayerItem::~V3d_ColorScaleLayerItem %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_ColorScaleLayerItem {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_ColorScaleLayerItem {
	Handle_V3d_ColorScaleLayerItem GetHandle() {
	return *(Handle_V3d_ColorScaleLayerItem*) &$self;
	}
};

%nodefaultctor Handle_V3d_ColorScaleLayerItem;
class Handle_V3d_ColorScaleLayerItem : public Handle_Visual3d_LayerItem {

    public:
        // constructors
        Handle_V3d_ColorScaleLayerItem();
        Handle_V3d_ColorScaleLayerItem(const Handle_V3d_ColorScaleLayerItem &aHandle);
        Handle_V3d_ColorScaleLayerItem(const V3d_ColorScaleLayerItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_ColorScaleLayerItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_ColorScaleLayerItem {
    V3d_ColorScaleLayerItem* GetObject() {
    return (V3d_ColorScaleLayerItem*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_ColorScaleLayerItem::~Handle_V3d_ColorScaleLayerItem %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_ColorScaleLayerItem {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_LayerMgr;
class V3d_LayerMgr : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

No detailed docstring for this function.") V3d_LayerMgr;
		 V3d_LayerMgr (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Layer

No detailed docstring for this function.") Overlay;
		const Handle_Visual3d_Layer & Overlay ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_View

No detailed docstring for this function.") View;
		Handle_V3d_View View ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ColorScaleDisplay;
		void ColorScaleDisplay ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ColorScaleErase;
		void ColorScaleErase ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") ColorScaleIsDisplayed;
		Standard_Boolean ColorScaleIsDisplayed ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_ColorScale

No detailed docstring for this function.") ColorScale;
		Handle_Aspect_ColorScale ColorScale ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Recompute layer with objects") Compute;
		void Compute ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Resized;
		void Resized ();
};


%feature("shadow") V3d_LayerMgr::~V3d_LayerMgr %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_LayerMgr {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_LayerMgr {
	Handle_V3d_LayerMgr GetHandle() {
	return *(Handle_V3d_LayerMgr*) &$self;
	}
};

%nodefaultctor Handle_V3d_LayerMgr;
class Handle_V3d_LayerMgr : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_V3d_LayerMgr();
        Handle_V3d_LayerMgr(const Handle_V3d_LayerMgr &aHandle);
        Handle_V3d_LayerMgr(const V3d_LayerMgr *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_LayerMgr DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_LayerMgr {
    V3d_LayerMgr* GetObject() {
    return (V3d_LayerMgr*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_LayerMgr::~Handle_V3d_LayerMgr %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_LayerMgr {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_Light;
class V3d_Light : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Type(Quantity_TypeOfColor)
	V1(Quantity_Parameter)
	V2(Quantity_Parameter)
	V3(Quantity_Parameter)

Returns:
	None

Defines the colour of a light source  
         according to the type of colour definition  
         and the three corresponding values.") SetColor;
		void SetColor (const Quantity_TypeOfColor Type,const Quantity_Parameter V1,const Quantity_Parameter V2,const Quantity_Parameter V3);
		%feature("autodoc", "Args:
	Name(Quantity_NameOfColor)

Returns:
	None

Defines the colour of a light source by giving  
//!	    the name of the colour in the form Quantity_NOC_xxxx .") SetColor;
		void SetColor (const Quantity_NameOfColor Name);
		%feature("autodoc", "Args:
	Name(Quantity_Color)

Returns:
	None

Defines the colour of a light source by giving  
//!	    the basic colour.") SetColor;
		void SetColor (const Quantity_Color & Name);
		%feature("autodoc", "Args:
	Type(Quantity_TypeOfColor)
	V1(Quantity_Parameter)
	V2(Quantity_Parameter)
	V3(Quantity_Parameter)

Returns:
	None

Returns the colour of the light source depending of  
//!	    the color type.") Color;
		void Color (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Name(Quantity_NameOfColor)

Returns:
	None

Returns the colour of the light source.") Color;
		void Color (Quantity_NameOfColor & Name);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the colour of the light source.") Color;
		Quantity_Color Color ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfLight

Returns the Type of the Light") Type;
		V3d_TypeOfLight Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if the light is a headlight") Headlight;
		Standard_Boolean Headlight ();
		%feature("autodoc", "Args:
	theValue(Standard_Boolean)

Returns:
	None

Setup headlight flag.") SetHeadlight;
		void SetHeadlight (const Standard_Boolean theValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when a light representation is displayed") IsDisplayed;
		Standard_Boolean IsDisplayed ();
};


%feature("shadow") V3d_Light::~V3d_Light %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_Light {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_Light {
	Handle_V3d_Light GetHandle() {
	return *(Handle_V3d_Light*) &$self;
	}
};

%nodefaultctor Handle_V3d_Light;
class Handle_V3d_Light : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_V3d_Light();
        Handle_V3d_Light(const Handle_V3d_Light &aHandle);
        Handle_V3d_Light(const V3d_Light *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_Light DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_Light {
    V3d_Light* GetObject() {
    return (V3d_Light*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_Light::~Handle_V3d_Light %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_Light {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_ListOfTransient;
class V3d_ListOfTransient : public TColStd_ListOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") V3d_ListOfTransient;
		 V3d_ListOfTransient ();
		%feature("autodoc", "Args:
	aTransient(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & aTransient);
		%feature("autodoc", "Args:
	aTransient(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Handle_Standard_Transient & aTransient);
};


%feature("shadow") V3d_ListOfTransient::~V3d_ListOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_ListOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor V3d_RectangularGrid;
class V3d_RectangularGrid : public Aspect_RectangularGrid {
	public:
		%feature("autodoc", "Args:
	aViewer(V3d_ViewerPointer)
	aColor(Quantity_Color)
	aTenthColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") V3d_RectangularGrid;
		 V3d_RectangularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("autodoc", "Args:
	aColor(Quantity_Color)
	aTenthColor(Quantity_Color)

Returns:
	None

No detailed docstring for this function.") SetColors;
		void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Display;
		void Display ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Erase;
		void Erase ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("autodoc", "Args:
	XSize(Standard_Real)
	YSize(Standard_Real)
	OffSet(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XSize(Standard_Real)
	YSize(Standard_Real)
	OffSet(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetGraphicValues;
		void SetGraphicValues (const Standard_Real XSize,const Standard_Real YSize,const Standard_Real OffSet);
};


%feature("shadow") V3d_RectangularGrid::~V3d_RectangularGrid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_RectangularGrid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_RectangularGrid {
	Handle_V3d_RectangularGrid GetHandle() {
	return *(Handle_V3d_RectangularGrid*) &$self;
	}
};

%nodefaultctor Handle_V3d_RectangularGrid;
class Handle_V3d_RectangularGrid : public Handle_Aspect_RectangularGrid {

    public:
        // constructors
        Handle_V3d_RectangularGrid();
        Handle_V3d_RectangularGrid(const Handle_V3d_RectangularGrid &aHandle);
        Handle_V3d_RectangularGrid(const V3d_RectangularGrid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_RectangularGrid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_RectangularGrid {
    V3d_RectangularGrid* GetObject() {
    return (V3d_RectangularGrid*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_RectangularGrid::~Handle_V3d_RectangularGrid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_RectangularGrid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_View;
class V3d_View : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	Type(V3d_TypeOfView)=V3d_ORTHOGRAPHIC

Returns:
	None

Initialises the view.") V3d_View;
		 V3d_View (const Handle_V3d_Viewer & VM,const V3d_TypeOfView Type = V3d_ORTHOGRAPHIC);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	V(Handle_V3d_View)
	Type(V3d_TypeOfView)=V3d_ORTHOGRAPHIC

Returns:
	None

Initialises the view by copying.") V3d_View;
		 V3d_View (const Handle_V3d_Viewer & VM,const Handle_V3d_View & V,const V3d_TypeOfView Type = V3d_ORTHOGRAPHIC);
		%feature("autodoc", "Args:
	IdWin(Handle_Aspect_Window)

Returns:
	None

Activates the view in the window specified and Map the  
         Window to the screen.   Warning! raises MultiplyDefined from Standard  
     if the view is already activated in a window.  
 Warning: The view is centered and resized to preserve  
         the height/width ratio of the window.") SetWindow;
		void SetWindow (const Handle_Aspect_Window & IdWin);
		%feature("autodoc", "Args:
	aWindow(Handle_Aspect_Window)
	aContext(Aspect_RenderingContext)
	aDisplayCB(Aspect_GraphicCallbackProc)
	aClientData(Standard_Address)

Returns:
	None

Activates the view in the specified Window  
     If <aContext> is not NULL the graphic context is used  
         to draw something in this view.  
     Otherwise an internal graphic context is created.  
     If <aDisplayCB> is not NULL then a user display CB is  
     call at the end of the OCC graphic traversal and just  
     before the swap of buffers. The <aClientData> is pass  
     to this call back.   Warning! raises MultiplyDefined from Standard  
     if the view is already activated in a window.  
 Warning: The view is centered and resized to preserve  
         the height/width ratio of the window.") SetWindow;
		void SetWindow (const Handle_Aspect_Window & aWindow,const Aspect_RenderingContext aContext,const Aspect_GraphicCallbackProc & aDisplayCB,const Standard_Address aClientData);
		%feature("autodoc", "Args:
	IdWin(Handle_Aspect_Window)
	aPreviousView(Handle_V3d_View)
	x1(Standard_Integer)
	y1(Standard_Integer)
	x2(Standard_Integer)
	y2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetMagnify;
		void SetMagnify (const Handle_Aspect_Window & IdWin,const Handle_V3d_View & aPreviousView,const Standard_Integer x1,const Standard_Integer y1,const Standard_Integer x2,const Standard_Integer y2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Destroys the view.") Remove;
		void Remove ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deprecated, Redraw() should be used instead.") Update;
		void Update ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Redisplays the view even if there has not  
         been any modification.  
         Must be called if the view is shown.  
         (Ex: DeIconification ) .") Redraw;
		void Redraw ();
		%feature("autodoc", "Args:
	x(Standard_Integer)
	y(Standard_Integer)
	width(Standard_Integer)
	height(Standard_Integer)

Returns:
	None

Redisplays the view area after esxposure.  
[x,y] define the min xy area position  
[width,height] the size of the area in pixel unit.") Redraw;
		void Redraw (const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "Args:
	None
Returns:
	None

Must be called when the window supporting the  
         view changes size.       if the view is not mapped on a window.  
 Warning: The view is centered and resized to preserve  
         the height/width ratio of the window.") MustBeResized;
		void MustBeResized ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Must be called when the window supporting the  
         view is mapped or unmapped.") DoMapping;
		void DoMapping ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the status of the view regarding  
         the displayed structures inside  
         Returns True is The View is empty") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates the lights of the view. The view is redrawn.") UpdateLights;
		void UpdateLights ();
		%feature("autodoc", "Args:
	Type(Quantity_TypeOfColor)
	V1(Quantity_Parameter)
	V2(Quantity_Parameter)
	V3(Quantity_Parameter)

Returns:
	None

Defines the background colour of the view  
         by supplying :  
         the colour definition type,  
         and the three corresponding values.") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_TypeOfColor Type,const Quantity_Parameter V1,const Quantity_Parameter V2,const Quantity_Parameter V3);
		%feature("autodoc", "Args:
	Color(Quantity_Color)

Returns:
	None

Defines the background colour of the view  
         by supplying :  
         the colour object.") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_Color & Color);
		%feature("autodoc", "Args:
	Name(Quantity_NameOfColor)

Returns:
	None

Defines the background colour of the view  
         by supplying :  
         the colour name in the form Quantity_NOC_xxxx .") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_NameOfColor Name);
		%feature("autodoc", "Args:
	Color1(Quantity_Color)
	Color2(Quantity_Color)
	FillStyle(Aspect_GradientFillMethod)=Aspect_GFM_HOR
	update(Standard_Boolean)=Standard_False

Returns:
	None

Defines the gradient background colours of the view  
         by supplying :  
         two colour objects,  
         and fill method (horizontal by default)") SetBgGradientColors;
		void SetBgGradientColors (const Quantity_Color & Color1,const Quantity_Color & Color2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR,const Standard_Boolean update = Standard_False);
		%feature("autodoc", "Args:
	Color1(Quantity_NameOfColor)
	Color2(Quantity_NameOfColor)
	FillStyle(Aspect_GradientFillMethod)=Aspect_GFM_HOR
	update(Standard_Boolean)=Standard_False

Returns:
	None

Defines the gradient background colours of the view  
         by supplying :  
         two colour names in the form Quantity_NOC_xxxx,  
         and fill method (horizontal by default)") SetBgGradientColors;
		void SetBgGradientColors (const Quantity_NameOfColor Color1,const Quantity_NameOfColor Color2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR,const Standard_Boolean update = Standard_False);
		%feature("autodoc", "Args:
	AMethod(Aspect_GradientFillMethod)=Aspect_GFM_HOR
	update(Standard_Boolean)=Standard_False

Returns:
	None

Defines the gradient background fill method of the view") SetBgGradientStyle;
		void SetBgGradientStyle (const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR,const Standard_Boolean update = Standard_False);
		%feature("autodoc", "Args:
	FileName(char *)
	FillStyle(Aspect_FillMethod)=Aspect_FM_CENTERED
	update(Standard_Boolean)=Standard_False

Returns:
	None

Defines the background texture of the view  
        by supplying :  
        texture image file name,  
        and fill method (centered by default)") SetBackgroundImage;
		void SetBackgroundImage (const char * FileName,const Aspect_FillMethod FillStyle = Aspect_FM_CENTERED,const Standard_Boolean update = Standard_False);
		%feature("autodoc", "Args:
	FillStyle(Aspect_FillMethod)
	update(Standard_Boolean)=Standard_False

Returns:
	None

Defines the textured background fill method of the view") SetBgImageStyle;
		void SetBgImageStyle (const Aspect_FillMethod FillStyle,const Standard_Boolean update = Standard_False);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Definition of an axis from its origin and  
         its orientation .  
         This will be the current axis for rotations and movements.   Warning! raises BadValue from V3d if the vector normal is NULL. .") SetAxis;
		void SetAxis (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("autodoc", "Args:
	Model(V3d_TypeOfShadingModel)

Returns:
	None

Defines the shading model for the  
         visualisation ZBUFFER mode.  
         Various models are available.") SetShadingModel;
		void SetShadingModel (const V3d_TypeOfShadingModel Model);
		%feature("autodoc", "Args:
	SurfaceDetail(V3d_TypeOfSurfaceDetail)

Returns:
	None

select the kind of rendering for texture mapping  
         no texture mapping by default") SetSurfaceDetail;
		void SetSurfaceDetail (const V3d_TypeOfSurfaceDetail SurfaceDetail);
		%feature("autodoc", "Args:
	ATexture(Handle_Graphic3d_TextureEnv)

Returns:
	None

set the environment texture to use  
         no environment texture by default") SetTextureEnv;
		void SetTextureEnv (const Handle_Graphic3d_TextureEnv & ATexture);
		%feature("autodoc", "Args:
	Mode(V3d_TypeOfVisualization)

Returns:
	None

Defines the visualisation mode in the view.") SetVisualization;
		void SetVisualization (const V3d_TypeOfVisualization Mode);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates antialiasing in the view.") SetAntialiasingOn;
		void SetAntialiasingOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Desactivates antialiasing in the view.") SetAntialiasingOff;
		void SetAntialiasingOff ();
		%feature("autodoc", "Args:
	Depth(Quantity_Length)

Returns:
	None

Defines the depth of the medium clipping plane.") SetZClippingDepth;
		void SetZClippingDepth (const Quantity_Length Depth);
		%feature("autodoc", "Args:
	Width(Quantity_Length)

Returns:
	None

Defines the thicknes around the medium clippling plane.   .") SetZClippingWidth;
		void SetZClippingWidth (const Quantity_Length Width);
		%feature("autodoc", "Args:
	Type(V3d_TypeOfZclipping)

Returns:
	None

Defines the type of ZClipping.") SetZClippingType;
		void SetZClippingType (const V3d_TypeOfZclipping Type);
		%feature("autodoc", "Args:
	Depth(Quantity_Length)

Returns:
	None

Defines the depth of the medium plane.") SetZCueingDepth;
		void SetZCueingDepth (const Quantity_Length Depth);
		%feature("autodoc", "Args:
	Width(Quantity_Length)

Returns:
	None

Defines the thickness around the medium plane.") SetZCueingWidth;
		void SetZCueingWidth (const Quantity_Length Width);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates ZCueing in the view.") SetZCueingOn;
		void SetZCueingOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Desactivates ZCueing in the view.") SetZCueingOff;
		void SetZCueingOff ();
		%feature("autodoc", "Args:
	MyLight(Handle_V3d_Light)

Returns:
	None

Activates MyLight in the view.") SetLightOn;
		void SetLightOn (const Handle_V3d_Light & MyLight);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates all the lights defined in this view.") SetLightOn;
		void SetLightOn ();
		%feature("autodoc", "Args:
	MyLight(Handle_V3d_Light)

Returns:
	None

Desactivate MyLight in this view.") SetLightOff;
		void SetLightOff (const Handle_V3d_Light & MyLight);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivate all the Lights defined in this view.") SetLightOff;
		void SetLightOff ();
		%feature("autodoc", "Args:
	aLight(Handle_V3d_Light)

Returns:
	Standard_Boolean

Returns TRUE when the light is active in this view.") IsActiveLight;
		Standard_Boolean IsActiveLight (const Handle_V3d_Light & aLight);
		%feature("autodoc", "Args:
	AnActivity(Standard_Boolean)=Standard_False

Returns:
	None

Activate/Deactivate the transparency in this view.") SetTransparency;
		void SetTransparency (const Standard_Boolean AnActivity = Standard_False);
		%feature("autodoc", "Args:
	theImmediateUpdate(Standard_Boolean)

Returns:
	Standard_Boolean

sets the immediate update mode and returns the previous one.") SetImmediateUpdate;
		Standard_Boolean SetImmediateUpdate (const Standard_Boolean theImmediateUpdate);
		%feature("autodoc", "Args:
	XColor(Quantity_NameOfColor)=Quantity_NOC_RED
	YColor(Quantity_NameOfColor)=Quantity_NOC_GREEN
	ZColor(Quantity_NameOfColor)=Quantity_NOC_BLUE1
	SizeRatio(Standard_Real)=0.8
	AxisDiametr(Standard_Real)=0.05
	NbFacettes(Standard_Integer)=12

Returns:
	None

Customization of the ZBUFFER Triedron.  
        XColor,YColor,ZColor - colors of axis  
        SizeRatio - ratio of decreasing of the trihedron size when its phisical  
                    position comes out of the view  
        AxisDiametr - diameter relatively to axis length  
        NbFacettes - number of facettes of cylinders and cones") ZBufferTriedronSetup;
		void ZBufferTriedronSetup (const Quantity_NameOfColor XColor = Quantity_NOC_RED,const Quantity_NameOfColor YColor = Quantity_NOC_GREEN,const Quantity_NameOfColor ZColor = Quantity_NOC_BLUE1,const Standard_Real SizeRatio = 0.8,const Standard_Real AxisDiametr = 0.05,const Standard_Integer NbFacettes = 12);
		%feature("autodoc", "Args:
	APosition(Aspect_TypeOfTriedronPosition)=Aspect_TOTP_CENTER
	AColor(Quantity_NameOfColor)=Quantity_NOC_WHITE
	AScale(Standard_Real)=0.02
	AMode(V3d_TypeOfVisualization)=V3d_WIREFRAME

Returns:
	None

Display of the Triedron.  
        Initialize position, color and length of Triedron axes.  
        The scale is a percent of the window width.") TriedronDisplay;
		void TriedronDisplay (const Aspect_TypeOfTriedronPosition APosition = Aspect_TOTP_CENTER,const Quantity_NameOfColor AColor = Quantity_NOC_WHITE,const Standard_Real AScale = 0.02,const V3d_TypeOfVisualization AMode = V3d_WIREFRAME);
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases the Triedron.") TriedronErase;
		void TriedronErase ();
		%feature("autodoc", "Args:
	AType(Aspect_TypeOfTriedronEcho)=Aspect_TOTE_NONE

Returns:
	None

Highlights the echo zone of the Triedron.") TriedronEcho;
		void TriedronEcho (const Aspect_TypeOfTriedronEcho AType = Aspect_TOTE_NONE);
		%feature("autodoc", "Args:
	xname(TCollection_ExtendedString)
	yname(TCollection_ExtendedString)
	zname(TCollection_ExtendedString)
	xdrawname(Standard_Boolean)
	ydrawname(Standard_Boolean)
	zdrawname(Standard_Boolean)
	xdrawvalues(Standard_Boolean)
	ydrawvalues(Standard_Boolean)
	zdrawvalues(Standard_Boolean)
	drawgrid(Standard_Boolean)
	drawaxes(Standard_Boolean)
	nbx(Standard_Integer)
	nby(Standard_Integer)
	nbz(Standard_Integer)
	xoffset(Standard_Integer)
	yoffset(Standard_Integer)
	zoffset(Standard_Integer)
	xaxisoffset(Standard_Integer)
	yaxisoffset(Standard_Integer)
	zaxisoffset(Standard_Integer)
	xdrawtickmarks(Standard_Boolean)
	ydrawtickmarks(Standard_Boolean)
	zdrawtickmarks(Standard_Boolean)
	xtickmarklength(Standard_Integer)
	ytickmarklength(Standard_Integer)
	ztickmarklength(Standard_Integer)
	gridcolor(Quantity_Color)
	xnamecolor(Quantity_Color)
	ynamecolor(Quantity_Color)
	znamecolor(Quantity_Color)
	xcolor(Quantity_Color)
	ycolor(Quantity_Color)
	zcolor(Quantity_Color)
	fontOfNames(TCollection_AsciiString)
	styleOfNames(Font_FontAspect)
	sizeOfNames(Standard_Integer)
	fontOfValues(TCollection_AsciiString)
	styleOfValues(Font_FontAspect)
	sizeOfValues(Standard_Integer)

Returns:
	None

Returns data of a graduated trihedron.") GetGraduatedTrihedron;
		void GetGraduatedTrihedron (TCollection_ExtendedString & xname,TCollection_ExtendedString & yname,TCollection_ExtendedString & zname,Standard_Boolean & xdrawname,Standard_Boolean & ydrawname,Standard_Boolean & zdrawname,Standard_Boolean & xdrawvalues,Standard_Boolean & ydrawvalues,Standard_Boolean & zdrawvalues,Standard_Boolean & drawgrid,Standard_Boolean & drawaxes,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean & xdrawtickmarks,Standard_Boolean & ydrawtickmarks,Standard_Boolean & zdrawtickmarks,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Quantity_Color & gridcolor,Quantity_Color & xnamecolor,Quantity_Color & ynamecolor,Quantity_Color & znamecolor,Quantity_Color & xcolor,Quantity_Color & ycolor,Quantity_Color & zcolor,TCollection_AsciiString & fontOfNames,Font_FontAspect & styleOfNames,Standard_Integer &OutValue,TCollection_AsciiString & fontOfValues,Font_FontAspect & styleOfValues,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	xname(TCollection_ExtendedString)=X
	yname(TCollection_ExtendedString)=Y
	zname(TCollection_ExtendedString)=Z
	xdrawname(Standard_Boolean)=Standard_True
	ydrawname(Standard_Boolean)=Standard_True
	zdrawname(Standard_Boolean)=Standard_True
	xdrawvalues(Standard_Boolean)=Standard_True
	ydrawvalues(Standard_Boolean)=Standard_True
	zdrawvalues(Standard_Boolean)=Standard_True
	drawgrid(Standard_Boolean)=Standard_True
	drawaxes(Standard_Boolean)=Standard_True
	nbx(Standard_Integer)=3
	nby(Standard_Integer)=3
	nbz(Standard_Integer)=3
	xoffset(Standard_Integer)=10
	yoffset(Standard_Integer)=10
	zoffset(Standard_Integer)=10
	xaxisoffset(Standard_Integer)=30
	yaxisoffset(Standard_Integer)=30
	zaxisoffset(Standard_Integer)=30
	xdrawtickmarks(Standard_Boolean)=Standard_True
	ydrawtickmarks(Standard_Boolean)=Standard_True
	zdrawtickmarks(Standard_Boolean)=Standard_True
	xtickmarklength(Standard_Integer)=10
	ytickmarklength(Standard_Integer)=10
	ztickmarklength(Standard_Integer)=10
	gridcolor(Quantity_Color)=Quantity_NOC_WHITE
	xnamecolor(Quantity_Color)=Quantity_NOC_RED
	ynamecolor(Quantity_Color)=Quantity_NOC_GREEN
	znamecolor(Quantity_Color)=Quantity_NOC_BLUE1
	xcolor(Quantity_Color)=Quantity_NOC_RED
	ycolor(Quantity_Color)=Quantity_NOC_GREEN
	zcolor(Quantity_Color)=Quantity_NOC_BLUE1
	fontOfNames(TCollection_AsciiString)=Arial
	styleOfNames(Font_FontAspect)=Font_FA_Bold
	sizeOfNames(Standard_Integer)=12
	fontOfValues(TCollection_AsciiString)=Arial
	styleOfValues(Font_FontAspect)=Font_FA_Regular
	sizeOfValues(Standard_Integer)=12

Returns:
	None

Displays a graduated trihedron.") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const TCollection_ExtendedString & xname = "X",const TCollection_ExtendedString & yname = "Y",const TCollection_ExtendedString & zname = "Z",const Standard_Boolean xdrawname = Standard_True,const Standard_Boolean ydrawname = Standard_True,const Standard_Boolean zdrawname = Standard_True,const Standard_Boolean xdrawvalues = Standard_True,const Standard_Boolean ydrawvalues = Standard_True,const Standard_Boolean zdrawvalues = Standard_True,const Standard_Boolean drawgrid = Standard_True,const Standard_Boolean drawaxes = Standard_True,const Standard_Integer nbx = 3,const Standard_Integer nby = 3,const Standard_Integer nbz = 3,const Standard_Integer xoffset = 10,const Standard_Integer yoffset = 10,const Standard_Integer zoffset = 10,const Standard_Integer xaxisoffset = 30,const Standard_Integer yaxisoffset = 30,const Standard_Integer zaxisoffset = 30,const Standard_Boolean xdrawtickmarks = Standard_True,const Standard_Boolean ydrawtickmarks = Standard_True,const Standard_Boolean zdrawtickmarks = Standard_True,const Standard_Integer xtickmarklength = 10,const Standard_Integer ytickmarklength = 10,const Standard_Integer ztickmarklength = 10,const Quantity_Color & gridcolor = Quantity_NOC_WHITE,const Quantity_Color & xnamecolor = Quantity_NOC_RED,const Quantity_Color & ynamecolor = Quantity_NOC_GREEN,const Quantity_Color & znamecolor = Quantity_NOC_BLUE1,const Quantity_Color & xcolor = Quantity_NOC_RED,const Quantity_Color & ycolor = Quantity_NOC_GREEN,const Quantity_Color & zcolor = Quantity_NOC_BLUE1,const TCollection_AsciiString & fontOfNames = "Arial",const Font_FontAspect styleOfNames = Font_FA_Bold,const Standard_Integer sizeOfNames = 12,const TCollection_AsciiString & fontOfValues = "Arial",const Font_FontAspect styleOfValues = Font_FA_Regular,const Standard_Integer sizeOfValues = 12);
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases a graduated trihedron from the view.") GraduatedTrihedronErase;
		void GraduatedTrihedronErase ();
		%feature("autodoc", "Args:
	aMgr(Handle_V3d_LayerMgr)

Returns:
	None

No detailed docstring for this function.") SetLayerMgr;
		void SetLayerMgr (const Handle_V3d_LayerMgr & aMgr);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ColorScaleDisplay;
		void ColorScaleDisplay ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ColorScaleErase;
		void ColorScaleErase ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") ColorScaleIsDisplayed;
		Standard_Boolean ColorScaleIsDisplayed ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_ColorScale

No detailed docstring for this function.") ColorScale;
		Handle_Aspect_ColorScale ColorScale ();
		%feature("autodoc", "Args:
	None
Returns:
	None

modify the Projection of the view perpendicularly to  
         the privileged plane of the viewer.") SetFront;
		void SetFront ();
		%feature("autodoc", "Args:
	Ax(Quantity_PlaneAngle)
	Ay(Quantity_PlaneAngle)
	Az(Quantity_PlaneAngle)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotates the eye about the coordinate system of  
         reference of the screen  
         for which the origin is the view point of the projection,  
         with a relative angular value in RADIANS with respect to  
         the initial position expressed by Start = Standard_True   Warning! raises BadValue from V3d  
     If the eye, the view point, or the high point are  
         aligned or confused.") Rotate;
		void Rotate (const Quantity_PlaneAngle Ax,const Quantity_PlaneAngle Ay,const Quantity_PlaneAngle Az,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Ax(Quantity_PlaneAngle)
	Ay(Quantity_PlaneAngle)
	Az(Quantity_PlaneAngle)
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotates the eye about the coordinate system of  
         reference of the screen  
         for which the origin is Gravity point {X,Y,Z},  
         with a relative angular value in RADIANS with respect to  
         the initial position expressed by Start = Standard_True       If the eye, the view point, or the high point are  
         aligned or confused.") Rotate;
		void Rotate (const Quantity_PlaneAngle Ax,const Quantity_PlaneAngle Ay,const Quantity_PlaneAngle Az,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Axe(V3d_TypeOfAxe)
	Angle(Quantity_PlaneAngle)
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotates the eye about one of the coordinate axes of  
         of the view for which the origin is the Gravity point{X,Y,Z}  
         with an relative angular value in RADIANS with  
         respect to the initial position expressed by  
         Start = Standard_True") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Quantity_PlaneAngle Angle,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Axe(V3d_TypeOfAxe)
	Angle(Quantity_PlaneAngle)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotates the eye about one of the coordinate axes of  
         of the view for which the origin is the view point of the  
         projection with an relative angular value in RADIANS with  
         respect to the initial position expressed by  
         Start = Standard_True") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Angle(Quantity_PlaneAngle)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotates the eye around the current axis a relative  
         angular value in RADIANS with respect to the initial  
         position expressed by Start = Standard_True") Rotate;
		void Rotate (const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Dx(Quantity_Length)
	Dy(Quantity_Length)
	Dz(Quantity_Length)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Movement of the eye parallel to the coordinate system  
         of reference of the screen a distance relative to the  
         initial position expressed by Start = Standard_True.") Move;
		void Move (const Quantity_Length Dx,const Quantity_Length Dy,const Quantity_Length Dz,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Axe(V3d_TypeOfAxe)
	Length(Quantity_Length)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Movement of the eye parallel to one of the axes of the  
         coordinate system of reference of the view a distance  
         relative to the initial position expressed by  
         Start = Standard_True.") Move;
		void Move (const V3d_TypeOfAxe Axe,const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Length(Quantity_Length)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Movement of the eye parllel to the current axis  
         a distance relative to the initial position  
         expressed by Start = Standard_True") Move;
		void Move (const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Dx(Quantity_Length)
	Dy(Quantity_Length)
	Dz(Quantity_Length)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Movement of the ye and the view point parallel to the  
         frame of reference of the screen a distance relative  
         to the initial position expressed by  
         Start = Standard_True") Translate;
		void Translate (const Quantity_Length Dx,const Quantity_Length Dy,const Quantity_Length Dz,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Axe(V3d_TypeOfAxe)
	Length(Quantity_Length)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Movement of the eye and the view point parallel to one  
         of the axes of the fame of reference of the view a  
         distance relative to the initial position  
         expressed by Start = Standard_True") Translate;
		void Translate (const V3d_TypeOfAxe Axe,const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Length(Quantity_Length)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Movement of the eye and view point parallel to  
         the current axis a distance relative to the initial  
         position expressed by Start = Standard_True") Translate;
		void Translate (const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	x(Standard_Integer)
	y(Standard_Integer)
	aZoomFactor(Quantity_Factor)=1

Returns:
	None

places the point of the view corresponding  
         at the pixel position x,y at the center of the window  
         and updates the view.") Place;
		void Place (const Standard_Integer x,const Standard_Integer y,const Quantity_Factor aZoomFactor = 1);
		%feature("autodoc", "Args:
	Ax(Quantity_PlaneAngle)
	Ay(Quantity_PlaneAngle)
	Az(Quantity_PlaneAngle)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotation of the view point around the frame of reference  
         of the screen for which the origin is the eye of the  
         projection with a relative angular value in RADIANS  
         with respect to the initial position expressed by  
         Start = Standard_True") Turn;
		void Turn (const Quantity_PlaneAngle Ax,const Quantity_PlaneAngle Ay,const Quantity_PlaneAngle Az,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Axe(V3d_TypeOfAxe)
	Angle(Quantity_PlaneAngle)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotation of the view point around one of the axes of the  
         frame of reference of the view for which the origin is  
         the eye of the projection with an angular value in  
         RADIANS relative to the initial position expressed by  
         Start = Standard_True") Turn;
		void Turn (const V3d_TypeOfAxe Axe,const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Angle(Quantity_PlaneAngle)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Rotation of the view point around the current axis an  
         angular value in RADIANS relative to the initial  
         position expressed by Start = Standard_True") Turn;
		void Turn (const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Angle(Quantity_PlaneAngle)

Returns:
	None

Defines the angular position of the high point of  
         the reference frame of the view with respect to the  
         Y screen axis with an absolute angular value in  
         RADIANS.") SetTwist;
		void SetTwist (const Quantity_PlaneAngle Angle);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Defines the position of the eye..") SetEye;
		void SetEye (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("autodoc", "Args:
	Depth(Quantity_Length)

Returns:
	None

Defines the Depth of the eye from the view point  
         without update the projection .") SetDepth;
		void SetDepth (const Quantity_Length Depth);
		%feature("autodoc", "Args:
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Defines the orientation of the projection.") SetProj;
		void SetProj (const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("autodoc", "Args:
	Orientation(V3d_TypeOfOrientation)

Returns:
	None

Defines the orientation of the projection .") SetProj;
		void SetProj (const V3d_TypeOfOrientation Orientation);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Defines the position of the view point.") SetAt;
		void SetAt (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("autodoc", "Args:
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Defines the orientation of the high point.") SetUp;
		void SetUp (const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("autodoc", "Args:
	Orientation(V3d_TypeOfOrientation)

Returns:
	None

Defines the orientation(SO) of the high point.") SetUp;
		void SetUp (const V3d_TypeOfOrientation Orientation);
		%feature("autodoc", "Args:
	VO(Visual3d_ViewOrientation)

Returns:
	None

Modifies the orientation of the view.") SetViewOrientation;
		void SetViewOrientation (const Visual3d_ViewOrientation & VO);
		%feature("autodoc", "Args:
	None
Returns:
	None

Saves the current state of the orientation of the view  
         which will be the return state at ResetViewOrientation.") SetViewOrientationDefault;
		void SetViewOrientationDefault ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets the orientation of the view.  
         Updates the view") ResetViewOrientation;
		void ResetViewOrientation ();
		%feature("autodoc", "Args:
	Dx(Quantity_Length)
	Dy(Quantity_Length)
	aZoomFactor(Quantity_Factor)=1
	Start(Standard_Boolean)=Standard_True

Returns:
	None

translates the center of the view and zooms the view.  
      Updates the view.") Panning;
		void Panning (const Quantity_Length Dx,const Quantity_Length Dy,const Quantity_Factor aZoomFactor = 1,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Xc(V3d_Coordinate)
	Yc(V3d_Coordinate)

Returns:
	None

Defines the centre of the view.  
         Updates the view.") SetCenter;
		void SetCenter (const V3d_Coordinate Xc,const V3d_Coordinate Yc);
		%feature("autodoc", "Args:
	X(Standard_Integer)
	Y(Standard_Integer)

Returns:
	None

Defines the centre of the view from a pixel position.  
         Updates the view.") SetCenter;
		void SetCenter (const Standard_Integer X,const Standard_Integer Y);
		%feature("autodoc", "Args:
	Size(Quantity_Length)

Returns:
	None

Defines the size of the view while preserving the  
         center and height/width ratio of the window supporting  
         the view.  
         NOTE than the Depth of the View is NOT modified .") SetSize;
		void SetSize (const Quantity_Length Size);
		%feature("autodoc", "Args:
	Size(Quantity_Length)

Returns:
	None

Defines the Depth size of the view  
         Front Plane will be set to Size/2.  
         Back  Plane will be set to -Size/2.  
         Any Object located Above the Front Plane or  
                            behind the Back Plane will be Clipped .  
         NOTE than the XY Size of the View is NOT modified .") SetZSize;
		void SetZSize (const Quantity_Length Size);
		%feature("autodoc", "Args:
	Coef(Quantity_Factor)
	Start(Standard_Boolean)=Standard_True

Returns:
	None

Zooms the view by a factor relative to the initial  
         value expressed by Start = Standard_True  
         Updates the view.") SetZoom;
		void SetZoom (const Quantity_Factor Coef,const Standard_Boolean Start = Standard_True);
		%feature("autodoc", "Args:
	Coef(Quantity_Factor)

Returns:
	None

Zooms the view by a factor relative to the value  
         initialised by SetViewMappingDefault().  
         Updates the view.") SetScale;
		void SetScale (const Quantity_Factor Coef);
		%feature("autodoc", "Args:
	Sx(Standard_Real)
	Sy(Standard_Real)
	Sz(Standard_Real)

Returns:
	None

Sets  anisotropic (axial)  scale  factors  <Sx>, <Sy>, <Sz>  for  view <self>.  
Anisotropic  scaling  operation  is  performed  through  multiplying  
the current view  orientation  matrix  by  a  scaling  matrix:  
|| Sx  0   0   0 ||  
|| 0   Sy  0   0 ||  
|| 0   0   Sz  0 ||  
|| 0   0   0   1 ||  
Updates the view.") SetAxialScale;
		void SetAxialScale (const Standard_Real Sx,const Standard_Real Sy,const Standard_Real Sz);
		%feature("autodoc", "Args:
	Coef(Quantity_Coefficient)=0.01
	FitZ(Standard_Boolean)=Standard_False
	update(Standard_Boolean)=Standard_True

Returns:
	None

Automatic zoom/panning. Objects in the view are visualised  
         so as to occupy the maximum space while respecting the  
         margin coefficient and the initial height /width ratio.  
         NOTE than the original Z size of the view is NOT modified .") FitAll;
		void FitAll (const Quantity_Coefficient Coef = 0.01,const Standard_Boolean FitZ = Standard_False,const Standard_Boolean update = Standard_True);
		%feature("autodoc", "Args:
	Coef(Quantity_Coefficient)=1.0

Returns:
	None

Automatic Depth Panning. Objects visible in the view are  
         visualised so as to occupy the maximum Z amount of space  
         while respecting the margin coefficient .  
         NOTE than the original XY size of the view is NOT modified .") ZFitAll;
		void ZFitAll (const Quantity_Coefficient Coef = 1.0);
		%feature("autodoc", "Args:
	Aspect(Quantity_Coefficient)=0.01
	Margin(Quantity_Coefficient)=0.01

Returns:
	None

Adjusts the viewing volume so as not to clip the displayed objects by front and back  
         and back clipping planes. Also sets depth value automatically depending on the  
         calculated Z size and Aspect parameter.  
         NOTE than the original XY size of the view is NOT modified .") DepthFitAll;
		void DepthFitAll (const Quantity_Coefficient Aspect = 0.01,const Quantity_Coefficient Margin = 0.01);
		%feature("autodoc", "Args:
	Umin(V3d_Coordinate)
	Vmin(V3d_Coordinate)
	Umax(V3d_Coordinate)
	Vmax(V3d_Coordinate)

Returns:
	None

Centres the defined projection window so that it occupies  
         the maximum space while respecting the initial  
         height/width ratio.  
         NOTE than the original Z size of the view is NOT modified .") FitAll;
		void FitAll (const V3d_Coordinate Umin,const V3d_Coordinate Vmin,const V3d_Coordinate Umax,const V3d_Coordinate Vmax);
		%feature("autodoc", "Args:
	Xmin(Standard_Integer)
	Ymin(Standard_Integer)
	Xmax(Standard_Integer)
	Ymax(Standard_Integer)

Returns:
	None

Centres the defined PIXEL window so that it occupies  
         the maximum space while respecting the initial  
         height/width ratio.  
         NOTE than the original Z size of the view is NOT modified .") WindowFit;
		void WindowFit (const Standard_Integer Xmin,const Standard_Integer Ymin,const Standard_Integer Xmax,const Standard_Integer Ymax);
		%feature("autodoc", "Args:
	Left(Standard_Real)
	Right(Standard_Real)
	Bottom(Standard_Real)
	Top(Standard_Real)
	ZNear(Standard_Real)
	ZFar(Standard_Real)

Returns:
	None

Sets Z and XY size of the view according to given values  
         with respecting the initial view depth (eye position).  
         Width/heigth aspect ratio should be preserved by the caller  
         of this method similarly to SetSize() to avoid unexpected  
         visual results like non-uniform scaling of objects in the view.") SetViewingVolume;
		void SetViewingVolume (const Standard_Real Left,const Standard_Real Right,const Standard_Real Bottom,const Standard_Real Top,const Standard_Real ZNear,const Standard_Real ZFar);
		%feature("autodoc", "Args:
	VM(Visual3d_ViewMapping)

Returns:
	None

Modifies the mapping of the view.") SetViewMapping;
		void SetViewMapping (const Visual3d_ViewMapping & VM);
		%feature("autodoc", "Args:
	None
Returns:
	None

Saves the current view mapping. This will be the  
         state returned from ResetViewmapping.") SetViewMappingDefault;
		void SetViewMappingDefault ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets the centring of the view.  
         Updates the view") ResetViewMapping;
		void ResetViewMapping ();
		%feature("autodoc", "Args:
	update(Standard_Boolean)=Standard_True

Returns:
	None

Resets the centring and the orientation of the view  
         Updates the view") Reset;
		void Reset (const Standard_Boolean update = Standard_True);
		%feature("autodoc", "Args:
	Vp(Standard_Integer)

Returns:
	Quantity_Length

Converts the PIXEL value  
          to a value in the projection plane.") Convert;
		Quantity_Length Convert (const Standard_Integer Vp);
		%feature("autodoc", "Args:
	Xp(Standard_Integer)
	Yp(Standard_Integer)
	Xv(V3d_Coordinate)
	Yv(V3d_Coordinate)

Returns:
	None

Converts the point PIXEL into a point projected  
          in the reference frame of the projection plane.") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Vv(Quantity_Length)

Returns:
	Standard_Integer

Converts tha value of the projection plane into  
          a PIXEL value.") Convert;
		Standard_Integer Convert (const Quantity_Length Vv);
		%feature("autodoc", "Args:
	Xv(V3d_Coordinate)
	Yv(V3d_Coordinate)
	Xp(Standard_Integer)
	Yp(Standard_Integer)

Returns:
	None

Converts the point defined in the reference frame  
          of the projection plane into a point PIXEL.") Convert;
		void Convert (const V3d_Coordinate Xv,const V3d_Coordinate Yv,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Xp(Standard_Integer)
	Yp(Standard_Integer)
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Converts the projected point into a point  
          in the reference frame of the view corresponding  
          to the intersection with the projection plane  
          of the eye/view point vector.") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Xp(Standard_Integer)
	Yp(Standard_Integer)
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Converts the projected point into a point  
          in the reference frame of the view corresponding  
          to the intersection with the projection plane  
          of the eye/view point vector and returns the  
          projection ray for further computations.") ConvertWithProj;
		void ConvertWithProj (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Xp(Standard_Integer)
	Yp(Standard_Integer)
	Xg(V3d_Coordinate)
	Yg(V3d_Coordinate)
	Zg(V3d_Coordinate)

Returns:
	None

Converts the projected point into the nearest grid point  
          in the reference frame of the view corresponding  
          to the intersection with the projection plane  
          of the eye/view point vector and display the grid marker.  
 Warning: When the grid is not active the result is identical  
    to the above Convert() method.  
How to use :  
1) Enable the grid echo display  
   myViewer->SetGridEcho(Standard_True);  
2) When application receive a move event :  
  2.1) Check if any object is detected  
    if( myInteractiveContext->MoveTo(x,y) == AIS_SOD_Nothing ) {  
  2.2) Check if the grid is active  
    if( myViewer->Grid()->IsActive() ) {  
  2.3) Display the grid echo and gets the grid point  
      myView->ConvertToGrid(x,y,X,Y,Z);  
  2.4) Else this is the standard case  
    } else myView->Convert(x,y,X,Y,Z);") ConvertToGrid;
		void ConvertToGrid (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Xg(V3d_Coordinate)
	Yg(V3d_Coordinate)
	Zg(V3d_Coordinate)

Returns:
	None

Converts the point into the nearest grid point  
          and display the grid marker.") ConvertToGrid;
		void ConvertToGrid (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Xp(Standard_Integer)
	Yp(Standard_Integer)

Returns:
	None

Projects the point defined in the reference frame of  
          the view into the projected point in the associated window.") Convert;
		void Convert (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Xp(V3d_Coordinate)
	Yp(V3d_Coordinate)

Returns:
	None

Converts the point defined in the user space of  
          the view to the projected view plane point at z 0.") Project;
		void Project (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Type(Quantity_TypeOfColor)
	V1(Quantity_Parameter)
	V2(Quantity_Parameter)
	V3(Quantity_Parameter)

Returns:
	None

Returns the Background color values of the view  
         depending of the color Type.") BackgroundColor;
		void BackgroundColor (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the Background color object of the view.") BackgroundColor;
		Quantity_Color BackgroundColor ();
		%feature("autodoc", "Args:
	Color1(Quantity_Color)
	Color2(Quantity_Color)

Returns:
	None

Returns the gradient background colour objects of the view.") GradientBackgroundColors;
		void GradientBackgroundColors (Quantity_Color & Color1,Quantity_Color & Color2);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GradientBackground

Returns the gradient background of the view.") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Factor

Returns the current value of the zoom expressed with  
         respect to SetViewMappingDefault().") Scale;
		Quantity_Factor Scale ();
		%feature("autodoc", "Args:
	Sx(Standard_Real)
	Sy(Standard_Real)
	Sz(Standard_Real)

Returns:
	None

Returns the current values of the anisotropic (axial) scale factors.") AxialScale;
		void AxialScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Xc(V3d_Coordinate)
	Yc(V3d_Coordinate)

Returns:
	None

Returns the centre of the view.") Center;
		void Center (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Width(Quantity_Length)
	Height(Quantity_Length)

Returns:
	None

Returns the height and width of the view.") Size;
		void Size (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Depth of the view .") ZSize;
		Standard_Real ZSize ();
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Returns the position of the eye.") Eye;
		void Eye (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Returns the position of point which emanating the  
         projections.") FocalReferencePoint;
		void FocalReferencePoint (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Xpix(Standard_Integer)
	Ypix(Standard_Integer)
	XP(V3d_Coordinate)
	YP(V3d_Coordinate)
	ZP(V3d_Coordinate)
	VX(V3d_Coordinate)
	VY(V3d_Coordinate)
	VZ(V3d_Coordinate)

Returns:
	None

Returns the coordinate of the point (Xpix,Ypix)  
         in the view (XP,YP,ZP), and the projection vector of the  
         view passing by the point (for PerspectiveView).") ProjReferenceAxe;
		void ProjReferenceAxe (const Standard_Integer Xpix,const Standard_Integer Ypix,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the Distance between the Eye and View Point.") Depth;
		Quantity_Length Depth ();
		%feature("autodoc", "Args:
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Returns the projection vector.") Proj;
		void Proj (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Returns the position of the view point.") At;
		void At (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Returns the vector giving the position of the high point.") Up;
		void Up (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

Returns in RADIANS the orientation of the view around  
         the visual axis measured from the Y axis of the screen.") Twist;
		Quantity_PlaneAngle Twist ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfShadingModel

Returns the current shading model.") ShadingModel;
		V3d_TypeOfShadingModel ShadingModel ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfSurfaceDetail

No detailed docstring for this function.") SurfaceDetail;
		V3d_TypeOfSurfaceDetail SurfaceDetail ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_TextureEnv

No detailed docstring for this function.") TextureEnv;
		Handle_Graphic3d_TextureEnv TextureEnv ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the transparency activity.") Transparency;
		Standard_Boolean Transparency ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfVisualization

Returns the current visualisation mode.") Visualization;
		V3d_TypeOfVisualization Visualization ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Indicates if the antialiasing is active (True) or  
         inactive (False).") Antialiasing;
		Standard_Boolean Antialiasing ();
		%feature("autodoc", "Args:
	Depth(Quantity_Length)
	Width(Quantity_Length)

Returns:
	Standard_Boolean

Returns activity and information on the Zcueing.  
         <Depth> : Depth of plane.  
         <Width> : Thickness around the plane.") ZCueing;
		Standard_Boolean ZCueing (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Depth(Quantity_Length)
	Width(Quantity_Length)

Returns:
	V3d_TypeOfZclipping

Returns current information on the ZClipping.  
         <Depth> : Depth of plane.  
         <Width> : Thickness around the plane.  
         <TypeOfZclipping>  :        'BACK'  
                                     'FRONT'  
                                     'SLICE'  
                                     'OFF'") ZClipping;
		V3d_TypeOfZclipping ZClipping (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if One light more can be  
         activated in this View.") IfMoreLights;
		Standard_Boolean IfMoreLights ();
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes an iteration on the active Lights.") InitActiveLights;
		void InitActiveLights ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if there are more active Light(s) to return.") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Go to the next active Light  
          (if there is not, ActiveLight will raise an exception)") NextActiveLights;
		void NextActiveLights ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_Light

No detailed docstring for this function.") ActiveLight;
		Handle_V3d_Light ActiveLight ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_Viewer

Returns the viewer in which the view has been created.") Viewer;
		Handle_V3d_Viewer Viewer ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if MyView is associated with a window .") IfWindow;
		Standard_Boolean IfWindow ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_Window

Returns the Aspect Window associated with the view.") Window;
		Handle_Aspect_Window Window ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfView

Returns the Type of the View") Type;
		V3d_TypeOfView Type ();
		%feature("autodoc", "Args:
	Dx(Standard_Integer)
	Dy(Standard_Integer)
	aZoomFactor(Quantity_Factor)=1

Returns:
	None

translates the center of the view and zooms the view.  
      and updates the view.") Pan;
		void Pan (const Standard_Integer Dx,const Standard_Integer Dy,const Quantity_Factor aZoomFactor = 1);
		%feature("autodoc", "Args:
	X1(Standard_Integer)
	Y1(Standard_Integer)
	X2(Standard_Integer)
	Y2(Standard_Integer)

Returns:
	None

Zoom the view according to a zoom factor computed  
from the distance between the 2 mouse position <X1,Y1>,<X2,Y2>") Zoom;
		void Zoom (const Standard_Integer X1,const Standard_Integer Y1,const Standard_Integer X2,const Standard_Integer Y2);
		%feature("autodoc", "Args:
	X(Standard_Integer)
	Y(Standard_Integer)

Returns:
	None

Zoom the view according to a zoom factor computed  
from the distance between the last and new mouse position <X,Y>") Zoom;
		void Zoom (const Standard_Integer X,const Standard_Integer Y);
		%feature("autodoc", "Args:
	xpix(Standard_Integer)
	ypix(Standard_Integer)

Returns:
	None

Defines the point (pixel) of zooming (for the method ZoomAtPoint()).") StartZoomAtPoint;
		void StartZoomAtPoint (const Standard_Integer xpix,const Standard_Integer ypix);
		%feature("autodoc", "Args:
	mouseStartX(Standard_Integer)
	mouseStartY(Standard_Integer)
	mouseEndX(Standard_Integer)
	mouseEndY(Standard_Integer)

Returns:
	None

Zooms the model at a pixel defined by the method StartZoomAtPoint().") ZoomAtPoint;
		void ZoomAtPoint (const Standard_Integer mouseStartX,const Standard_Integer mouseStartY,const Standard_Integer mouseEndX,const Standard_Integer mouseEndY);
		%feature("autodoc", "Args:
	Dx(Standard_Integer)
	Dy(Standard_Integer)
	Axis(V3d_TypeOfAxe)

Returns:
	None

Performs  anisotropic scaling  of  <self>  view  along  the  given  <Axis>.  
The  scale  factor  is  calculated on a basis of  
the mouse pointer displacement <Dx,Dy>.  
The  calculated  scale  factor  is  then  passed  to  SetAxialScale(Sx,  Sy,  Sz)  method.") AxialScale;
		void AxialScale (const Standard_Integer Dx,const Standard_Integer Dy,const V3d_TypeOfAxe Axis);
		%feature("autodoc", "Args:
	X(Standard_Integer)
	Y(Standard_Integer)
	zRotationThreshold(Quantity_Ratio)=0.0

Returns:
	None

Begin the rotation of the view arround the screen axis  
according to the mouse position <X,Y>.  
 Warning: Enable rotation around the Z screen axis when <zRotationThreshold>  
factor is > 0 soon the distance from the start point and the center  
of the view is > (medium viewSize * <zRotationThreshold> ).  
Generally a value of 0.4 is usable to rotate around XY screen axis  
inside the circular treshold area and to rotate around Z screen axis  
outside this area.") StartRotation;
		void StartRotation (const Standard_Integer X,const Standard_Integer Y,const Quantity_Ratio zRotationThreshold = 0.0);
		%feature("autodoc", "Args:
	X(Standard_Integer)
	Y(Standard_Integer)

Returns:
	None

Continues the rotation of the view  
with an angle computed from the last and new mouse position <X,Y>.") Rotation;
		void Rotation (const Standard_Integer X,const Standard_Integer Y);
		%feature("autodoc", "Args:
	Focale(Quantity_Length)

Returns:
	None

Change View Plane Distance for Perspective Views   Warning! raises TypeMismatch from Standard if the view  
         is not a perspective view.") SetFocale;
		void SetFocale (const Quantity_Length Focale);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the View Plane Distance for Perspective Views") Focale;
		Quantity_Length Focale ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_View

Returns the associated Visual3d view.") View;
		Handle_Visual3d_View View ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_ViewMapping

Returns the current mapping of the view.") ViewMapping;
		Visual3d_ViewMapping ViewMapping ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_ViewOrientation

Returns the current orientation of the view.") ViewOrientation;
		Visual3d_ViewOrientation ViewOrientation ();
		%feature("autodoc", "Args:
	DoubleBuffer(Standard_Boolean)=Standard_False
	RetainMode(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Begins any graphics in the view <aView>  
         Redraw any structured graphics in the back buffer before  
         if <DoubleBuffer> is TRUE.  
         Restore the front buffer from the back before  
         if <DoubleBuffer> is FALSE.  
         if <RetainMode> is TRUE.  
         the graphic managed itself exposure,resizing ...  
         if <RetainMode> is FALSE.  
         the application must managed itself exposure,resizing ...") TransientManagerBeginDraw;
		Standard_Boolean TransientManagerBeginDraw (const Standard_Boolean DoubleBuffer = Standard_False,const Standard_Boolean RetainMode = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear all transient graphics in the view <aView>") TransientManagerClearDraw;
		void TransientManagerClearDraw ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Begins any add graphics in the view <aView>  
         Redraw any structured graphics in the back buffer before  
         the application must managed itself exposure,resizing ...  
 Warning: Returns TRUE if transient drawing is enabled in  
        the associated view.  
         Returns FALSE ,if nothing works because something  
        is wrong for the transient principle :") TransientManagerBeginAddDraw;
		Standard_Boolean TransientManagerBeginAddDraw ();
		%feature("autodoc", "Args:
	aMode(Standard_Boolean)

Returns:
	None

Switches computed HLR mode in the view") SetComputedMode;
		void SetComputedMode (const Standard_Boolean aMode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the computed HLR mode state") ComputedMode;
		Standard_Boolean ComputedMode ();
		%feature("autodoc", "Args:
	Xmin(Standard_Integer)
	Ymin(Standard_Integer)
	Xmax(Standard_Integer)
	Ymax(Standard_Integer)

Returns:
	None

idem than WindowFit") WindowFitAll;
		void WindowFitAll (const Standard_Integer Xmin,const Standard_Integer Ymin,const Standard_Integer Xmax,const Standard_Integer Ymax);
		%feature("autodoc", "Args:
	aPlotter(Handle_Graphic3d_Plotter)

Returns:
	virtual void

Set a plotter for plotting the contents of the view  
         field MyPlotter") SetPlotter;
		virtual void SetPlotter (const Handle_Graphic3d_Plotter & aPlotter);
		%feature("autodoc", "Args:
	None
Returns:
	None

Create a 2D View for plotting the contents of the view") Plot;
		void Plot ();
		%feature("autodoc", "Args:
	aPlane(gp_Ax3)
	aGrid(Handle_Aspect_Grid)

Returns:
	None

Defines or Updates the definition of the  
         grid in <self>") SetGrid;
		void SetGrid (const gp_Ax3 & aPlane,const Handle_Aspect_Grid & aGrid);
		%feature("autodoc", "Args:
	aGrid(Handle_Aspect_Grid)

Returns:
	None

Defines or Updates the graphic definition of the  
         grid in <self>") SetGridGraphicValues;
		void SetGridGraphicValues (const Handle_Aspect_Grid & aGrid);
		%feature("autodoc", "Args:
	aFlag(Standard_Boolean)

Returns:
	None

Defines or Updates the activity of the  
         grid in <self>") SetGridActivity;
		void SetGridActivity (const Standard_Boolean aFlag);
		%feature("autodoc", "Args:
	theFile(char *)
	theBufferType(Graphic3d_BufferType)=Graphic3d_BT_RGB

Returns:
	Standard_Boolean

dump the full contents of the view at the same  
         scale in the file <theFile>. The file name  
         extension must be one of '.png','.bmp','.jpg','.gif'.  
         Returns FALSE when the dump has failed") Dump;
		Standard_Boolean Dump (const char * theFile,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB);
		%feature("autodoc", "Args:
	theImage(Image_PixMap)
	theWidth(Standard_Integer)
	theHeight(Standard_Integer)
	theBufferType(Graphic3d_BufferType)=Graphic3d_BT_RGB
	theForceCentered(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

dump the full contents of the view  
       to a pixmap of pixel size <theWidth>*<theHeight> and  
       buffer type <theBufferType>. If <theForceCentered> is true  
       view scene will be centered.  
      Pixmap will be automatically (re)allocated when needed.") ToPixMap;
		Standard_Boolean ToPixMap (Image_PixMap & theImage,const Standard_Integer theWidth,const Standard_Integer theHeight,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB,const Standard_Boolean theForceCentered = Standard_True);
		%feature("autodoc", "Args:
	amOdel(V3d_TypeOfProjectionModel)=V3d_TPM_SCREEN

Returns:
	None

Manages projection model") SetProjModel;
		void SetProjModel (const V3d_TypeOfProjectionModel amOdel = V3d_TPM_SCREEN);
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfProjectionModel

Returns the current projection model") ProjModel;
		V3d_TypeOfProjectionModel ProjModel ();
		%feature("autodoc", "Args:
	aModel(V3d_TypeOfBackfacingModel)=V3d_TOBM_AUTOMATIC

Returns:
	None

Manages display of the back faces  
When <aModel> is TOBM_AUTOMATIC the object backfaces  
are displayed only for surface objects and  
never displayed for solid objects.  
this was the previous mode.  
     <aModel> is TOBM_ALWAYS_DISPLAYED the object backfaces  
      are always displayed both for surfaces or solids.  
     <aModel> is TOBM_NEVER_DISPLAYED the object backfaces  
      are never displayed.") SetBackFacingModel;
		void SetBackFacingModel (const V3d_TypeOfBackfacingModel aModel = V3d_TOBM_AUTOMATIC);
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfBackfacingModel

Returns current state of the back faces display") BackFacingModel;
		V3d_TypeOfBackfacingModel BackFacingModel ();
		%feature("autodoc", "Args:
	enable(Standard_Boolean)=Standard_True

Returns:
	None

turns on/off opengl depth testing") EnableDepthTest;
		void EnableDepthTest (const Standard_Boolean enable = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns the current state of the depth testing") IsDepthTestEnabled;
		Standard_Boolean IsDepthTestEnabled ();
		%feature("autodoc", "Args:
	enable(Standard_Boolean)=Standard_True

Returns:
	None

turns on/off opengl lighting, currently used in triedron displaying") EnableGLLight;
		void EnableGLLight (const Standard_Boolean enable = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns the current state of the gl lighting  
         currently used in triedron displaying") IsGLLightEnabled;
		Standard_Boolean IsGLLightEnabled ();
		%feature("autodoc", "Args:
	thePlane(Graphic3d_ClipPlane_Handle)

Returns:
	virtual void

Adds clip plane to the view. The composition of clip planes truncates the  
rendering space to convex volume. Number of supported clip planes can be consulted  
by PlaneLimit method of associated Visual3d_View. Please be aware that the planes  
which exceed the limit are igonred during rendering.  
@param thePlane [in] the clip plane to be added to view.") AddClipPlane;
		virtual void AddClipPlane (const Graphic3d_ClipPlane_Handle & thePlane);
		%feature("autodoc", "Args:
	thePlane(Graphic3d_ClipPlane_Handle)

Returns:
	virtual void

Removes clip plane from the view.  
@param thePlane [in] the clip plane to be removed from view.") RemoveClipPlane;
		virtual void RemoveClipPlane (const Graphic3d_ClipPlane_Handle & thePlane);
		%feature("autodoc", "Args:
	thePlanes(Graphic3d_SequenceOfHClipPlane)

Returns:
	None

Sets sequence of clip planes to the view. The planes that have been set  
before are removed from the view. The composition of clip planes  
truncates the rendering space to convex volume. Number of supported  
clip planes can be consulted by PlaneLimit method of associated  
Visual3d_View. Please be aware that the planes which exceed the limit  
are igonred during rendering.  
@param thePlanes [in] the clip planes to set.") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfHClipPlane

Get clip planes.  
@return sequence clip planes that have been set for the view") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
		%feature("autodoc", "Args:
	None
Returns:
	None

enables OpenCL-based ray-tracing mode") SetRaytracingMode;
		void SetRaytracingMode ();
		%feature("autodoc", "Args:
	None
Returns:
	None

enables OpenGL-based rasterization mode") SetRasterizationMode;
		void SetRasterizationMode ();
		%feature("autodoc", "Args:
	None
Returns:
	None

enables sharp shadows in OpenCL-based ray-tracing mode") EnableRaytracedShadows;
		void EnableRaytracedShadows ();
		%feature("autodoc", "Args:
	None
Returns:
	None

enables specular reflections in OpenCL-based ray-tracing mode") EnableRaytracedReflections;
		void EnableRaytracedReflections ();
		%feature("autodoc", "Args:
	None
Returns:
	None

enables antialiasing in OpenCL-based ray-tracing mode") EnableRaytracedAntialiasing;
		void EnableRaytracedAntialiasing ();
		%feature("autodoc", "Args:
	None
Returns:
	None

disables sharp shadows in OpenCL-based ray-tracing mode") DisableRaytracedShadows;
		void DisableRaytracedShadows ();
		%feature("autodoc", "Args:
	None
Returns:
	None

disables specular reflections in OpenCL-based ray-tracing mode") DisableRaytracedReflections;
		void DisableRaytracedReflections ();
		%feature("autodoc", "Args:
	None
Returns:
	None

disables antialiasing in OpenCL-based ray-tracing mode") DisableRaytracedAntialiasing;
		void DisableRaytracedAntialiasing ();
};


%feature("shadow") V3d_View::~V3d_View %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_View {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_View {
	Handle_V3d_View GetHandle() {
	return *(Handle_V3d_View*) &$self;
	}
};

%nodefaultctor Handle_V3d_View;
class Handle_V3d_View : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_V3d_View();
        Handle_V3d_View(const Handle_V3d_View &aHandle);
        Handle_V3d_View(const V3d_View *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_View DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_View {
    V3d_View* GetObject() {
    return (V3d_View*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_View::~Handle_V3d_View %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_View {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_Viewer;
class V3d_Viewer : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	theDriver(Handle_Graphic3d_GraphicDriver)
	theName(Standard_ExtString)
	theDomain(char *)=
	theViewSize(Quantity_Length)=1000.0
	theViewProj(V3d_TypeOfOrientation)=V3d_XposYnegZpos
	theViewBackground(Quantity_NameOfColor)=Quantity_NOC_GRAY30
	theVisualization(V3d_TypeOfVisualization)=V3d_ZBUFFER
	theShadingModel(V3d_TypeOfShadingModel)=V3d_GOURAUD
	theUpdateMode(V3d_TypeOfUpdate)=V3d_WAIT
	theComputedMode(Standard_Boolean)=Standard_True
	theDefaultComputedMode(Standard_Boolean)=Standard_True
	theSurfaceDetail(V3d_TypeOfSurfaceDetail)=V3d_TEX_NONE

Returns:
	None

Create a Viewer with the given graphic driver and the given parameters  or  
         with their default values.  
         Currently creating of more than 100 viewer instances  
         is not supported and leads to an exception.  
         This limitation might be addressed in some future OCCT releases.         If the size of the view is <= 0  
 Warning: Client must creates a graphic driver") V3d_Viewer;
		 V3d_Viewer (const Handle_Graphic3d_GraphicDriver & theDriver,const Standard_ExtString theName,const char * theDomain = "",const Quantity_Length theViewSize = 1000.0,const V3d_TypeOfOrientation theViewProj = V3d_XposYnegZpos,const Quantity_NameOfColor theViewBackground = Quantity_NOC_GRAY30,const V3d_TypeOfVisualization theVisualization = V3d_ZBUFFER,const V3d_TypeOfShadingModel theShadingModel = V3d_GOURAUD,const V3d_TypeOfUpdate theUpdateMode = V3d_WAIT,const Standard_Boolean theComputedMode = Standard_True,const Standard_Boolean theDefaultComputedMode = Standard_True,const V3d_TypeOfSurfaceDetail theSurfaceDetail = V3d_TEX_NONE);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_View

creates a view in the viewer according to its  
         default parameters.") CreateView;
		Handle_V3d_View CreateView ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates all of the views of a viewer attached  
           to a window.") SetViewOn;
		void SetViewOn ();
		%feature("autodoc", "Args:
	View(Handle_V3d_View)

Returns:
	None

Activates a particular view in the Viewer .  
           Must be call if the Window attached to the view  
           has been Deiconified .") SetViewOn;
		void SetViewOn (const Handle_V3d_View & View);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates all the views of a Viewer  
           attached to a window.") SetViewOff;
		void SetViewOff ();
		%feature("autodoc", "Args:
	View(Handle_V3d_View)

Returns:
	None

Deactivates a particular view in the Viewer.  
           Must be call if the Window attached to the view  
           has been Iconified .") SetViewOff;
		void SetViewOff (const Handle_V3d_View & View);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deprecated, Redraw() should be used instead.") Update;
		void Update ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates the lights of all the views of a viewer.") UpdateLights;
		void UpdateLights ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Redraws all the views of the Viewer even if no  
           modification has taken place. Must be called if  
           all the views of the Viewer are exposed, as for  
          example in a global DeIconification.") Redraw;
		void Redraw ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppresses the Viewer.") Remove;
		void Remove ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Erase all Objects in All the views.") Erase;
		void Erase ();
		%feature("autodoc", "Args:
	None
Returns:
	None

UnHighlight all Objects in All the views.") UnHighlight;
		void UnHighlight ();
		%feature("autodoc", "Args:
	Type(Quantity_TypeOfColor)
	V1(Quantity_Parameter)
	V2(Quantity_Parameter)
	V3(Quantity_Parameter)

Returns:
	None

Defines the default base colour of views attached  
           to the Viewer by supplying the type of colour  
           definition and the three component values..") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_TypeOfColor Type,const Quantity_Parameter V1,const Quantity_Parameter V2,const Quantity_Parameter V3);
		%feature("autodoc", "Args:
	Name(Quantity_NameOfColor)

Returns:
	None

Defines the default background colour of views  
           attached to the viewer by supplying the name of the  
           colour under the form Quantity_NOC_xxxx .") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_NameOfColor Name);
		%feature("autodoc", "Args:
	Color(Quantity_Color)

Returns:
	None

Defines the default background colour of views  
           attached to the viewer by supplying the color object") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_Color & Color);
		%feature("autodoc", "Args:
	Name1(Quantity_NameOfColor)
	Name2(Quantity_NameOfColor)
	FillStyle(Aspect_GradientFillMethod)=Aspect_GFM_HOR

Returns:
	None

Defines the default gradient background colours of view  
           attached to the viewer by supplying the name of the  
           colours under the form Quantity_NOC_xxxx .") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors (const Quantity_NameOfColor Name1,const Quantity_NameOfColor Name2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR);
		%feature("autodoc", "Args:
	Color1(Quantity_Color)
	Color2(Quantity_Color)
	FillStyle(Aspect_GradientFillMethod)=Aspect_GFM_HOR

Returns:
	None

Defines the default gradient background colours of views  
           attached to the viewer by supplying the colour objects") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors (const Quantity_Color & Color1,const Quantity_Color & Color2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR);
		%feature("autodoc", "Args:
	Size(Quantity_Length)

Returns:
	None

Gives a default size for the creation of views of  
           the viewer.") SetDefaultViewSize;
		void SetDefaultViewSize (const Quantity_Length Size);
		%feature("autodoc", "Args:
	Orientation(V3d_TypeOfOrientation)

Returns:
	None

Gives the default projection for creating views  
           in the viewer.") SetDefaultViewProj;
		void SetDefaultViewProj (const V3d_TypeOfOrientation Orientation);
		%feature("autodoc", "Args:
	Type(V3d_TypeOfVisualization)

Returns:
	None

Gives the default visualisation mode..") SetDefaultVisualization;
		void SetDefaultVisualization (const V3d_TypeOfVisualization Type);
		%feature("autodoc", "Args:
	Automatic(Standard_Boolean)

Returns:
	None

defines the strategy concerning the ZBuffer activity.  
         If Automatic is true, ZBuffer will be activated or  
         deactivated depending on the fact that faces exist or  
         not in the Viewer. This will optimize the response time  
         in the case where only wireframe objects are displayed.  
         If Automatic is False, ZBuffer will be activated or  
         deactivated depending on the choice of SetVisualization  
         in each View.  
         Note that by default, the ZBufferManagment is not automatic.") SetZBufferManagment;
		void SetZBufferManagment (const Standard_Boolean Automatic);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns the ZBuffer stategy choice.") ZBufferManagment;
		Standard_Boolean ZBufferManagment ();
		%feature("autodoc", "Args:
	Type(V3d_TypeOfShadingModel)

Returns:
	None

Gives the default type of SHADING.") SetDefaultShadingModel;
		void SetDefaultShadingModel (const V3d_TypeOfShadingModel Type);
		%feature("autodoc", "Args:
	Type(V3d_TypeOfSurfaceDetail)

Returns:
	None

Gives the default type of texture mapping.") SetDefaultSurfaceDetail;
		void SetDefaultSurfaceDetail (const V3d_TypeOfSurfaceDetail Type);
		%feature("autodoc", "Args:
	Angle(Quantity_PlaneAngle)

Returns:
	None

No detailed docstring for this function.") SetDefaultAngle;
		void SetDefaultAngle (const Quantity_PlaneAngle Angle);
		%feature("autodoc", "Args:
	Mode(V3d_TypeOfUpdate)

Returns:
	None

Defines the mode of regenerating the views making  
           up the viewer. This can be immediate <ASAP> or  
           deferred <WAIT>. In this latter case, the views are  
           updated when the method Update(me) is called.") SetUpdateMode;
		void SetUpdateMode (const V3d_TypeOfUpdate Mode);
		%feature("autodoc", "Args:
	Type(V3d_TypeOfView)

Returns:
	None

No detailed docstring for this function.") SetDefaultTypeOfView;
		void SetDefaultTypeOfView (const V3d_TypeOfView Type);
		%feature("autodoc", "Args:
	aPlane(gp_Ax3)

Returns:
	None

No detailed docstring for this function.") SetPrivilegedPlane;
		void SetPrivilegedPlane (const gp_Ax3 & aPlane);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") PrivilegedPlane;
		gp_Ax3 PrivilegedPlane ();
		%feature("autodoc", "Args:
	OnOff(Standard_Boolean)
	aSize(Quantity_Length)=1

Returns:
	None

No detailed docstring for this function.") DisplayPrivilegedPlane;
		void DisplayPrivilegedPlane (const Standard_Boolean OnOff,const Quantity_Length aSize = 1);
		%feature("autodoc", "Args:
	MyLight(Handle_V3d_Light)

Returns:
	None

Activates MyLight in the viewer.") SetLightOn;
		void SetLightOn (const Handle_V3d_Light & MyLight);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates all the lights defined in this viewer.") SetLightOn;
		void SetLightOn ();
		%feature("autodoc", "Args:
	MyLight(Handle_V3d_Light)

Returns:
	None

Desactivate MyLight in this viewer.") SetLightOff;
		void SetLightOff (const Handle_V3d_Light & MyLight);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivate all the Lights defined in this viewer.") SetLightOff;
		void SetLightOff ();
		%feature("autodoc", "Args:
	MyLight(Handle_V3d_Light)

Returns:
	None

Delete Light in Sequence Of Lights.") DelLight;
		void DelLight (const Handle_V3d_Light & MyLight);
		%feature("autodoc", "Args:
	TheLight(Handle_V3d_Light)

Returns:
	None

Defines the selected light.") SetCurrentSelectedLight;
		void SetCurrentSelectedLight (const Handle_V3d_Light & TheLight);
		%feature("autodoc", "Args:
	None
Returns:
	None

Defines the selected light at NULL.") ClearCurrentSelectedLight;
		void ClearCurrentSelectedLight ();
		%feature("autodoc", "Args:
	Type(Quantity_TypeOfColor)
	V1(Quantity_Parameter)
	V2(Quantity_Parameter)
	V3(Quantity_Parameter)

Returns:
	None

Returns the default background colour depending of the type.") DefaultBackgroundColor;
		void DefaultBackgroundColor (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns the default background colour object.") DefaultBackgroundColor;
		Quantity_Color DefaultBackgroundColor ();
		%feature("autodoc", "Args:
	Color1(Quantity_Color)
	Color2(Quantity_Color)

Returns:
	None

Returns the gradient background colour objects of the view.") DefaultBgGradientColors;
		void DefaultBgGradientColors (Quantity_Color & Color1,Quantity_Color & Color2);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Length

Returns the default size of the view.") DefaultViewSize;
		Quantity_Length DefaultViewSize ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfOrientation

Returns the default Projection.") DefaultViewProj;
		V3d_TypeOfOrientation DefaultViewProj ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfVisualization

Returns the default type of Visualization.") DefaultVisualization;
		V3d_TypeOfVisualization DefaultVisualization ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfShadingModel

Returns the default type of Shading") DefaultShadingModel;
		V3d_TypeOfShadingModel DefaultShadingModel ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfSurfaceDetail

Returns the default type of texture mapping") DefaultSurfaceDetail;
		V3d_TypeOfSurfaceDetail DefaultSurfaceDetail ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

No detailed docstring for this function.") DefaultAngle;
		Quantity_PlaneAngle DefaultAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	V3d_TypeOfUpdate

Returns the regeneration mode of views in the viewer.") UpdateMode;
		V3d_TypeOfUpdate UpdateMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if One View more can be  
         activated in this Viewer.") IfMoreViews;
		Standard_Boolean IfMoreViews ();
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes an iteration on the active views.") InitActiveViews;
		void InitActiveViews ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if there are more active view(s) to return.") MoreActiveViews;
		Standard_Boolean MoreActiveViews ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Go to the next active view  
          (if there is not, ActiveView will raise an exception)") NextActiveViews;
		void NextActiveViews ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_View

No detailed docstring for this function.") ActiveView;
		Handle_V3d_View ActiveView ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if there is only  
         one active view.") LastActiveView;
		Standard_Boolean LastActiveView ();
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes an iteration on the Defined views.") InitDefinedViews;
		void InitDefinedViews ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if there are more Defined view(s) to return.") MoreDefinedViews;
		Standard_Boolean MoreDefinedViews ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Go to the next Defined view  
          (if there is not, DefinedView will raise an exception)") NextDefinedViews;
		void NextDefinedViews ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_View

No detailed docstring for this function.") DefinedView;
		Handle_V3d_View DefinedView ();
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes an iteration on the active Lights.") InitActiveLights;
		void InitActiveLights ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if there are more active Light(s) to return.") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Go to the next active Light  
          (if there is not, ActiveLight will raise an exception)") NextActiveLights;
		void NextActiveLights ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_Light

No detailed docstring for this function.") ActiveLight;
		Handle_V3d_Light ActiveLight ();
		%feature("autodoc", "Args:
	None
Returns:
	None

initializes an iteration on the Defined Lights.") InitDefinedLights;
		void InitDefinedLights ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if there are more Defined Light(s) to return.") MoreDefinedLights;
		Standard_Boolean MoreDefinedLights ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Go to the next Defined Light  
          (if there is not, DefinedLight will raise an exception)") NextDefinedLights;
		void NextDefinedLights ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_Light

No detailed docstring for this function.") DefinedLight;
		Handle_V3d_Light DefinedLight ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_ViewManager

Returns the viewer associated to Visual3d .") Viewer;
		Handle_Visual3d_ViewManager Viewer ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_Light

Returns the Selected Light.") CurrentSelectedLight;
		Handle_V3d_Light CurrentSelectedLight ();
		%feature("autodoc", "Args:
	TheLight(Handle_V3d_Light)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsGlobalLight;
		Standard_Boolean IsGlobalLight (const Handle_V3d_Light & TheLight);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if the computed mode can be used.") ComputedMode;
		Standard_Boolean ComputedMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if by default the computed mode must be used.") DefaultComputedMode;
		Standard_Boolean DefaultComputedMode ();
		%feature("autodoc", "Args:
	aGridType(Aspect_GridType)
	aGridDrawMode(Aspect_GridDrawMode)

Returns:
	None

Activates the grid in all views of <self>.") ActivateGrid;
		void ActivateGrid (const Aspect_GridType aGridType,const Aspect_GridDrawMode aGridDrawMode);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates the grid in all views of <self>.") DeactivateGrid;
		void DeactivateGrid ();
		%feature("autodoc", "Args:
	showGrid(Standard_Boolean)=Standard_True

Returns:
	None

Show/Don't show grid echo to the hit point.  
If TRUE,the grid echo will be shown at ConvertToGrid() time.") SetGridEcho;
		void SetGridEcho (const Standard_Boolean showGrid = Standard_True);
		%feature("autodoc", "Args:
	aMarker(Handle_Graphic3d_AspectMarker3d)

Returns:
	None

Show grid echo <aMarker> to the hit point.  
 Warning: When the grid echo marker is not set,  
          a default marker is build with the attributes:  
          marker type : Aspect_TOM_STAR  
          marker color : Quantity_NOC_GRAY90  
          marker size : 3.0") SetGridEcho;
		void SetGridEcho (const Handle_Graphic3d_AspectMarker3d & aMarker);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when grid echo must be displayed  
          at hit point.") GridEcho;
		Standard_Boolean GridEcho ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if a grid is activated in <self>.") IsActive;
		Standard_Boolean IsActive ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_Grid

Returns the defined grid in <self>.") Grid;
		Handle_Aspect_Grid Grid ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GridType

Returns the current grid type defined in <self>.") GridType;
		Aspect_GridType GridType ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GridDrawMode

Returns the current grid draw mode defined in <self>.") GridDrawMode;
		Aspect_GridDrawMode GridDrawMode ();
		%feature("autodoc", "Args:
	XOrigin(Quantity_Length)
	YOrigin(Quantity_Length)
	XStep(Quantity_Length)
	YStep(Quantity_Length)
	RotationAngle(Quantity_PlaneAngle)

Returns:
	None

Returns the definition of the rectangular grid.") RectangularGridValues;
		void RectangularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Quantity_PlaneAngle & RotationAngle);
		%feature("autodoc", "Args:
	XOrigin(Quantity_Length)
	YOrigin(Quantity_Length)
	XStep(Quantity_Length)
	YStep(Quantity_Length)
	RotationAngle(Quantity_PlaneAngle)

Returns:
	None

Sets the definition of the rectangular grid.  
           <XOrigin>, <YOrigin> defines the origin of the grid.  
           <XStep> defines the interval between 2 vertical lines.  
           <YStep> defines the interval between 2 horizontal lines.  
           <RotationAngle> defines the rotation angle of the grid.") SetRectangularGridValues;
		void SetRectangularGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length XStep,const Quantity_Length YStep,const Quantity_PlaneAngle RotationAngle);
		%feature("autodoc", "Args:
	XOrigin(Quantity_Length)
	YOrigin(Quantity_Length)
	RadiusStep(Quantity_Length)
	DivisionNumber(Standard_Integer)
	RotationAngle(Quantity_PlaneAngle)

Returns:
	None

Returns the definition of the circular grid.") CircularGridValues;
		void CircularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Quantity_PlaneAngle & RotationAngle);
		%feature("autodoc", "Args:
	XOrigin(Quantity_Length)
	YOrigin(Quantity_Length)
	RadiusStep(Quantity_Length)
	DivisionNumber(Standard_Integer)
	RotationAngle(Quantity_PlaneAngle)

Returns:
	None

Sets the definition of the circular grid.  
           <XOrigin>, <YOrigin> defines the origin of the grid.  
           <RadiusStep> defines the interval between 2 circles.  
           <DivisionNumber> defines the section number of one half circle.  
           <RotationAngle> defines the rotation angle of the grid.") SetCircularGridValues;
		void SetCircularGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length RadiusStep,const Standard_Integer DivisionNumber,const Quantity_PlaneAngle RotationAngle);
		%feature("autodoc", "Args:
	Radius(Quantity_Length)
	OffSet(Quantity_Length)

Returns:
	None

Returns the location and the size of the grid.") CircularGridGraphicValues;
		void CircularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Radius(Quantity_Length)
	OffSet(Quantity_Length)

Returns:
	None

Sets the location and the size of the grid.  
           <XSize> defines the width of the grid.  
           <YSize> defines the height of the grid.  
           <OffSet> defines the displacement along the plane normal.") SetCircularGridGraphicValues;
		void SetCircularGridGraphicValues (const Quantity_Length Radius,const Quantity_Length OffSet);
		%feature("autodoc", "Args:
	XSize(Quantity_Length)
	YSize(Quantity_Length)
	OffSet(Quantity_Length)

Returns:
	None

Returns the location and the size of the grid.") RectangularGridGraphicValues;
		void RectangularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XSize(Quantity_Length)
	YSize(Quantity_Length)
	OffSet(Quantity_Length)

Returns:
	None

Sets the location and the size of the grid.  
           <XSize> defines the width of the grid.  
           <YSize> defines the height of the grid.  
           <OffSet> defines the displacement along the plane normal.") SetRectangularGridGraphicValues;
		void SetRectangularGridGraphicValues (const Quantity_Length XSize,const Quantity_Length YSize,const Quantity_Length OffSet);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GradientBackground

Returns the gradient background of the view.") GetGradientBackground;
		Aspect_GradientBackground GetGradientBackground ();
		%feature("autodoc", "Args:
	None
Returns:
	None

defines default lights  -  
         positional-light 0.3 0. 0.  
         directional-light V3d_XnegYposZpos  
         directional-light V3d_XnegYneg  
         ambient-light") SetDefaultLights;
		void SetDefaultLights ();
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)
	theSettings(Graphic3d_ZLayerSettings)

Returns:
	None

Sets the settings for a single Z layer.") SetZLayerSettings;
		void SetZLayerSettings (const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	Graphic3d_ZLayerSettings

Returns the settings of a single Z layer.") ZLayerSettings;
		Graphic3d_ZLayerSettings ZLayerSettings (const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	Standard_Boolean

Add a new top-level Z layer to all managed views and get  
its ID as <theLayerId> value. The Z layers are controlled entirely  
by viewer, it is not possible to add a layer to a  
particular view. The method returns Standard_False if the layer can  
not be created. The layer mechanism allows to display structures  
in higher layers in overlay of structures in lower layers.") AddZLayer;
		Standard_Boolean AddZLayer (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)

Returns:
	Standard_Boolean

Remove Z layer with ID <theLayerId>. Method returns  
Standard_False if the layer can not be removed or doesn't exists.  
By default, there are always default bottom-level layer that can't  
be removed.") RemoveZLayer;
		Standard_Boolean RemoveZLayer (const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theLayerSeq(TColStd_SequenceOfInteger)

Returns:
	None

Return all Z layer ids in sequence ordered by overlay level  
from lowest layer to highest ( foreground ). The first layer ID  
in sequence is the default layer that can't be removed.") GetAllZLayers;
		void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_GraphicDriver

No detailed docstring for this function.") Driver;
		const Handle_Graphic3d_GraphicDriver & Driver ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ExtString

No detailed docstring for this function.") NextName;
		Standard_ExtString NextName ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

No detailed docstring for this function.") Domain;
		char * Domain ();
};


%feature("shadow") V3d_Viewer::~V3d_Viewer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_Viewer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_Viewer {
	Handle_V3d_Viewer GetHandle() {
	return *(Handle_V3d_Viewer*) &$self;
	}
};

%nodefaultctor Handle_V3d_Viewer;
class Handle_V3d_Viewer : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_V3d_Viewer();
        Handle_V3d_Viewer(const Handle_V3d_Viewer &aHandle);
        Handle_V3d_Viewer(const V3d_Viewer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_Viewer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_Viewer {
    V3d_Viewer* GetObject() {
    return (V3d_Viewer*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_Viewer::~Handle_V3d_Viewer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_Viewer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_AmbientLight;
class V3d_AmbientLight : public V3d_Light {
	public:
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	Color(Quantity_NameOfColor)=Quantity_NOC_WHITE

Returns:
	None

Constructs an ambient light source in the viewer VM.  
The default Color of this light source is WHITE.") V3d_AmbientLight;
		 V3d_AmbientLight (const Handle_V3d_Viewer & VM,const Quantity_NameOfColor Color = Quantity_NOC_WHITE);
};


%feature("shadow") V3d_AmbientLight::~V3d_AmbientLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_AmbientLight {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_AmbientLight {
	Handle_V3d_AmbientLight GetHandle() {
	return *(Handle_V3d_AmbientLight*) &$self;
	}
};

%nodefaultctor Handle_V3d_AmbientLight;
class Handle_V3d_AmbientLight : public Handle_V3d_Light {

    public:
        // constructors
        Handle_V3d_AmbientLight();
        Handle_V3d_AmbientLight(const Handle_V3d_AmbientLight &aHandle);
        Handle_V3d_AmbientLight(const V3d_AmbientLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_AmbientLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_AmbientLight {
    V3d_AmbientLight* GetObject() {
    return (V3d_AmbientLight*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_AmbientLight::~Handle_V3d_AmbientLight %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_AmbientLight {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_OrthographicView;
class V3d_OrthographicView : public V3d_View {
	public:
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)

Returns:
	None

Define an orthographic view in the viewer VM.") V3d_OrthographicView;
		 V3d_OrthographicView (const Handle_V3d_Viewer & VM);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	V(Handle_V3d_PerspectiveView)

Returns:
	None

Defines an orthographic view from a Perspective view.  
//!	    The parameters of the original view are duplicated  
//!	    in the resulting view (Projection,Mapping,Context) .  
//!	    The view thus created must be activated in a new  
//!	    window.") V3d_OrthographicView;
		 V3d_OrthographicView (const Handle_V3d_Viewer & VM,const Handle_V3d_PerspectiveView & V);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	V(Handle_V3d_OrthographicView)

Returns:
	None

Defines one orthographic view from another.  
//!	    The parameters of the original view are duplicated  
//!	    in the resulting view. (Projection,Mapping,Context) .  
//!	    The view thus created must be activated in a new window.") V3d_OrthographicView;
		 V3d_OrthographicView (const Handle_V3d_Viewer & VM,const Handle_V3d_OrthographicView & V);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_OrthographicView

No detailed docstring for this function.") Copy;
		Handle_V3d_OrthographicView Copy ();
};


%feature("shadow") V3d_OrthographicView::~V3d_OrthographicView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_OrthographicView {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_OrthographicView {
	Handle_V3d_OrthographicView GetHandle() {
	return *(Handle_V3d_OrthographicView*) &$self;
	}
};

%nodefaultctor Handle_V3d_OrthographicView;
class Handle_V3d_OrthographicView : public Handle_V3d_View {

    public:
        // constructors
        Handle_V3d_OrthographicView();
        Handle_V3d_OrthographicView(const Handle_V3d_OrthographicView &aHandle);
        Handle_V3d_OrthographicView(const V3d_OrthographicView *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_OrthographicView DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_OrthographicView {
    V3d_OrthographicView* GetObject() {
    return (V3d_OrthographicView*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_OrthographicView::~Handle_V3d_OrthographicView %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_OrthographicView {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_PerspectiveView;
class V3d_PerspectiveView : public V3d_View {
	public:
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)

Returns:
	None

Defines a perspective view in a viewer VM.  
         The default angle of opening is given  
         by the viewer.") V3d_PerspectiveView;
		 V3d_PerspectiveView (const Handle_V3d_Viewer & VM);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	V(Handle_V3d_OrthographicView)

Returns:
	None

Creates a perspective view from the parameters  
//!	    of an orthographic view.  
         The parameters of the original view are duplicated  
         in the resulting view (Projection,Mapping,Context) .  
         The view thus created must be activated in a new window.  
         The default angle of opening is given  
         by the viewer.") V3d_PerspectiveView;
		 V3d_PerspectiveView (const Handle_V3d_Viewer & VM,const Handle_V3d_OrthographicView & V);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	V(Handle_V3d_PerspectiveView)

Returns:
	None

Creates one perspective view from another.  
         The parameters of the original view are duplicated  
         in the resulting view (Projection,Mapping,Context) .  
         The view thus created must be activated in a new window.") V3d_PerspectiveView;
		 V3d_PerspectiveView (const Handle_V3d_Viewer & VM,const Handle_V3d_PerspectiveView & V);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_PerspectiveView

No detailed docstring for this function.") Copy;
		Handle_V3d_PerspectiveView Copy ();
		%feature("autodoc", "Args:
	Angle(Quantity_PlaneAngle)

Returns:
	None

Modifies the angle of opening of the perspective in RADIANS.  
//!	    The projection window is resized according to the  
//!	    formula :  
//!	    TAN(Angle/2) = Size/Length  
//!	    	Size expresses the smallest dimension of the window.  
//!	        Length expresses the focal length.   Warning! raises BadValue from V3d  
//!	    if the opening angle is <= 0 or >= PI") SetAngle;
		void SetAngle (const Quantity_PlaneAngle Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

Returns the value of the angle of opening.") Angle;
		Quantity_PlaneAngle Angle ();
		%feature("autodoc", "Args:
	Angle(Quantity_PlaneAngle)
	UVRatio(Standard_Real)
	ZNear(Standard_Real)
	ZFar(Standard_Real)

Returns:
	None

Modifies the viewing perspective volume by given  
//!		angle of opening of the perspective in RADIANS,  
     aspect ratio of window width to its height and  
     near and far clipping planes") SetPerspective;
		void SetPerspective (const Quantity_PlaneAngle Angle,const Standard_Real UVRatio,const Standard_Real ZNear,const Standard_Real ZFar);
};


%feature("shadow") V3d_PerspectiveView::~V3d_PerspectiveView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_PerspectiveView {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_PerspectiveView {
	Handle_V3d_PerspectiveView GetHandle() {
	return *(Handle_V3d_PerspectiveView*) &$self;
	}
};

%nodefaultctor Handle_V3d_PerspectiveView;
class Handle_V3d_PerspectiveView : public Handle_V3d_View {

    public:
        // constructors
        Handle_V3d_PerspectiveView();
        Handle_V3d_PerspectiveView(const Handle_V3d_PerspectiveView &aHandle);
        Handle_V3d_PerspectiveView(const V3d_PerspectiveView *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_PerspectiveView DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_PerspectiveView {
    V3d_PerspectiveView* GetObject() {
    return (V3d_PerspectiveView*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_PerspectiveView::~Handle_V3d_PerspectiveView %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_PerspectiveView {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_PositionLight;
class V3d_PositionLight : public V3d_Light {
	public:
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	virtual void

Defines the position of the light source. Should be redefined!") SetPosition;
		virtual void SetPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Defines the target of the light (the center  
         of the sphere)") SetTarget;
		void SetTarget (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("autodoc", "Args:
	Radius(Quantity_Parameter)

Returns:
	None

Define the radius.") SetRadius;
		void SetRadius (const Quantity_Parameter Radius);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

Calculate the position of the light, on the hide face  
         of the picking sphere.") OnHideFace;
		void OnHideFace (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

Calculate the position of the light, on the seen face  
         of the picking sphere.") OnSeeFace;
		void OnSeeFace (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	WathPick(V3d_TypeOfPickLight)
	Xpix(Standard_Integer)
	Ypix(Standard_Integer)

Returns:
	None

Tracking the light position, or the light space,  
         or the radius of the light space, that depends of  
         initial picking 'WhatPick' (see the pick method).  
         If WhatPick is SPACELIGHT, then the parameters  
         Xpix, Ypix are the coordinates of a translation vector.") Tracking;
		void Tracking (const Handle_V3d_View & aView,const V3d_TypeOfPickLight WathPick,const Standard_Integer Xpix,const Standard_Integer Ypix);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	Representation(V3d_TypeOfRepresentation)=V3d_SIMPLE

Returns:
	virtual void

Display the graphic structure of light source  
         in the choosen view. We have three type of representation  
         - SIMPLE   : Only the light source is displayed.  
         - PARTIAL  : The light source and the light space are  
                      displayed.  
         - COMPLETE : The light source, the light space and the  
                      radius of light space are displayed.  
         We can choose the 'SAMELAST' as parameter of representation  
         In this case the graphic structure representation will be  
         the last displayed.") Display;
		virtual void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation = V3d_SIMPLE);
		%feature("autodoc", "Args:
	None
Returns:
	None

Erase the graphic structure of light source.") Erase;
		void Erase ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Parameter

Returns the radius of the picking sphere.") Radius;
		Quantity_Parameter Radius ();
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	Standard_Boolean

Returns the visibility status  
         If True the source is visible.  
         If False it's hidden.") SeeOrHide;
		Standard_Boolean SeeOrHide (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	virtual void

Returns the position of the light source.") Position;
		virtual void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Returns the position of the target of the light source.") Target;
		void Target (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") V3d_PositionLight::~V3d_PositionLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_PositionLight {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_PositionLight {
	Handle_V3d_PositionLight GetHandle() {
	return *(Handle_V3d_PositionLight*) &$self;
	}
};

%nodefaultctor Handle_V3d_PositionLight;
class Handle_V3d_PositionLight : public Handle_V3d_Light {

    public:
        // constructors
        Handle_V3d_PositionLight();
        Handle_V3d_PositionLight(const Handle_V3d_PositionLight &aHandle);
        Handle_V3d_PositionLight(const V3d_PositionLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_PositionLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_PositionLight {
    V3d_PositionLight* GetObject() {
    return (V3d_PositionLight*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_PositionLight::~Handle_V3d_PositionLight %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_PositionLight {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_DirectionalLight;
class V3d_DirectionalLight : public V3d_PositionLight {
	public:
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	Direction(V3d_TypeOfOrientation)=V3d_XposYposZpos
	Color(Quantity_NameOfColor)=Quantity_NOC_WHITE
	Headlight(Standard_Boolean)=Standard_False

Returns:
	None

Creates a directional light source in the viewer.") V3d_DirectionalLight;
		 V3d_DirectionalLight (const Handle_V3d_Viewer & VM,const V3d_TypeOfOrientation Direction = V3d_XposYposZpos,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Standard_Boolean Headlight = Standard_False);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	Xt(V3d_Coordinate)
	Yt(V3d_Coordinate)
	Zt(V3d_Coordinate)
	Xp(V3d_Coordinate)
	Yp(V3d_Coordinate)
	Zp(V3d_Coordinate)
	Color(Quantity_NameOfColor)=Quantity_NOC_WHITE
	Headlight(Standard_Boolean)=Standard_False

Returns:
	None

Creates a directional light source in the viewer.  
         Xt,Yt,Zt : Coordinate of light source Target.  
         Xp,Yp,Zp : Coordinate of light source Position.  
         The others parameters describe before.") V3d_DirectionalLight;
		 V3d_DirectionalLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate Xt,const V3d_Coordinate Yt,const V3d_Coordinate Zt,const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Standard_Boolean Headlight = Standard_False);
		%feature("autodoc", "Args:
	Direction(V3d_TypeOfOrientation)

Returns:
	None

Defines the direction of the light source  
//!	     by a predefined orientation.") SetDirection;
		void SetDirection (const V3d_TypeOfOrientation Direction);
		%feature("autodoc", "Args:
	Xm(Quantity_Parameter)
	Ym(Quantity_Parameter)
	Zm(Quantity_Parameter)

Returns:
	None

Defines the direction of the light source by the predefined  
vector Xm,Ym,Zm.  
 Warning: raises  BadValue from V3d if the vector is null.") SetDirection;
		void SetDirection (const Quantity_Parameter Xm,const Quantity_Parameter Ym,const Quantity_Parameter Zm);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Defines the point of light source representation.") SetDisplayPosition;
		void SetDisplayPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("autodoc", "Args:
	Xp(V3d_Coordinate)
	Yp(V3d_Coordinate)
	Zp(V3d_Coordinate)

Returns:
	virtual void

Calls SetDisplayPosition method.") SetPosition;
		virtual void SetPosition (const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	Representation(V3d_TypeOfRepresentation)

Returns:
	None

Display the graphic structure of light source  
         in the choosen view. We have three type of representation  
         - SIMPLE   : Only the light source is displayed.  
         - PARTIAL  : The light source and the light space are  
                      displayed.  
         - COMPLETE : The same representation as PARTIAL.  
         We can choose the 'SAMELAST' as parameter of representation  
         In this case the graphic structure representation will be  
         the last displayed.") Display;
		void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	virtual void

Calls DisplayPosition method.") Position;
		virtual void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Returns the choosen position to represent the light  
         source.") DisplayPosition;
		void DisplayPosition (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Returns the Vx,Vy,Vz direction of the light source.") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") V3d_DirectionalLight::~V3d_DirectionalLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_DirectionalLight {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_DirectionalLight {
	Handle_V3d_DirectionalLight GetHandle() {
	return *(Handle_V3d_DirectionalLight*) &$self;
	}
};

%nodefaultctor Handle_V3d_DirectionalLight;
class Handle_V3d_DirectionalLight : public Handle_V3d_PositionLight {

    public:
        // constructors
        Handle_V3d_DirectionalLight();
        Handle_V3d_DirectionalLight(const Handle_V3d_DirectionalLight &aHandle);
        Handle_V3d_DirectionalLight(const V3d_DirectionalLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_DirectionalLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_DirectionalLight {
    V3d_DirectionalLight* GetObject() {
    return (V3d_DirectionalLight*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_DirectionalLight::~Handle_V3d_DirectionalLight %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_DirectionalLight {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_PositionalLight;
class V3d_PositionalLight : public V3d_PositionLight {
	public:
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Color(Quantity_NameOfColor)=Quantity_NOC_WHITE
	Attenuation1(Quantity_Coefficient)=1.0
	Attenuation2(Quantity_Coefficient)=0.0

Returns:
	None

Creates an isolated light source X,Y,Z in the viewer.  
         It is also defined by the color Color and  
         two attenuation factors Attenuation1, Attenuation2.  
//!	    The resulting attenuation factor determining the  
//!	    illumination of a surface depends on the following  
//!	    formula :  
//!	    F = 1/(A1 + A2*Length)  
//!		A1,A2 being the two factors of attenuation  
//!	 	Length is the distance of the isolated source  
//!	    from the surface.   Warning!  raises BadValue from V3d  
         if one of the attenuation coefficients is not between 0 et 1.") V3d_PositionalLight;
		 V3d_PositionalLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	Xt(V3d_Coordinate)
	Yt(V3d_Coordinate)
	Zt(V3d_Coordinate)
	Xp(V3d_Coordinate)
	Yp(V3d_Coordinate)
	Zp(V3d_Coordinate)
	Color(Quantity_NameOfColor)=Quantity_NOC_WHITE
	Attenuation1(Quantity_Coefficient)=1.0
	Attenuation2(Quantity_Coefficient)=0.0

Returns:
	None

Creates a light source of the Positional type  
         in the viewer.  
         Xt,Yt,Zt : Coordinate of Target light source.  
         Xp,Yp,Zp : Coordinate of Position light source.  
         The light source is also defined by the color Color  
         and two attenuation factors Attenuation1,  
         Attenuation2 that determine the illumination of a  
         surface using the following formula :  
         F = 1/(A1 + A2*Length) where:  
         -   A1,A2 are the two attenuation factors, and  
         -   Length is the distance from the isolated source.   Warning! raises BadValue from V3d  
         if one of the attenuation coefficients is not between 0 et 1.") V3d_PositionalLight;
		 V3d_PositionalLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate Xt,const V3d_Coordinate Yt,const V3d_Coordinate Zt,const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	virtual void

Defines the position of the light source.") SetPosition;
		virtual void SetPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("autodoc", "Args:
	A1(Quantity_Coefficient)
	A2(Quantity_Coefficient)

Returns:
	None

Defines the attenuation factors.  
 Warning: raises BadValue from V3d  
         if one of the attenuation coefficients is not between 0 et 1.") SetAttenuation;
		void SetAttenuation (const Quantity_Coefficient A1,const Quantity_Coefficient A2);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	Representation(V3d_TypeOfRepresentation)

Returns:
	None

Display the graphic structure of light source  
         in the choosen view. We have three type of representation  
         - SIMPLE   : Only the light source is displayed.  
         - PARTIAL  : The light source and the light space are  
                      displayed.  
         - COMPLETE : The light source, the light space and the  
                      radius of light space are displayed.  
         We can choose the 'SAMELAST' as parameter of representation  
         In this case the graphic structure representation will be  
         the last displayed.") Display;
		void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Returns the position of the light source.") Position;
		void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A1(Quantity_Coefficient)
	A2(Quantity_Coefficient)

Returns:
	None

Returns the attenuation factors A1,A2 of the light  
source used at construction time.") Attenuation;
		void Attenuation (Quantity_Coefficient & A1,Quantity_Coefficient & A2);
};


%feature("shadow") V3d_PositionalLight::~V3d_PositionalLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_PositionalLight {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_PositionalLight {
	Handle_V3d_PositionalLight GetHandle() {
	return *(Handle_V3d_PositionalLight*) &$self;
	}
};

%nodefaultctor Handle_V3d_PositionalLight;
class Handle_V3d_PositionalLight : public Handle_V3d_PositionLight {

    public:
        // constructors
        Handle_V3d_PositionalLight();
        Handle_V3d_PositionalLight(const Handle_V3d_PositionalLight &aHandle);
        Handle_V3d_PositionalLight(const V3d_PositionalLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_PositionalLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_PositionalLight {
    V3d_PositionalLight* GetObject() {
    return (V3d_PositionalLight*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_PositionalLight::~Handle_V3d_PositionalLight %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_PositionalLight {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor V3d_SpotLight;
class V3d_SpotLight : public V3d_PositionLight {
	public:
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)
	Direction(V3d_TypeOfOrientation)=V3d_XnegYnegZpos
	Color(Quantity_NameOfColor)=Quantity_NOC_WHITE
	Attenuation1(Quantity_Coefficient)=1.0
	Attenuation2(Quantity_Coefficient)=0.0
	Concentration(Quantity_Coefficient)=1.0
	Angle(Quantity_PlaneAngle)=0.523599

Returns:
	None

Creates a light source of the Spot type in the viewer.  
         The attenuation factor F which determines  
         the illumination of a surface depends on the following formula :  
         F = 1/(A1 + A2*Length)  
             A1,A2 being the 2 factors of attenuation  
             Length is the distance from the source to the surface.  
//!	    The default values (1.0,0.0) correspond to a minimum  
//!	    of attenuation .  
//!	    The concentration factor determines the dispersion  
//!	    of the light on the surface, the default value  
//!	    (1.0) corresponds to a minimum of dispersion .   Warning! raises BadValue from V3d  -  
//!	If one of the coefficients is not between 0 and 1 .  
//!	If the lighting angle is <= 0 ou > PI .") V3d_SpotLight;
		 V3d_SpotLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const V3d_TypeOfOrientation Direction = V3d_XnegYnegZpos,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0,const Quantity_Coefficient Concentration = 1.0,const Quantity_PlaneAngle Angle = 0.523599);
		%feature("autodoc", "Args:
	VM(Handle_V3d_Viewer)
	Xt(V3d_Coordinate)
	Yt(V3d_Coordinate)
	Zt(V3d_Coordinate)
	Xp(V3d_Coordinate)
	Yp(V3d_Coordinate)
	Zp(V3d_Coordinate)
	Color(Quantity_NameOfColor)=Quantity_NOC_WHITE
	Attenuation1(Quantity_Coefficient)=1.0
	Attenuation2(Quantity_Coefficient)=0.0
	Concentration(Quantity_Coefficient)=1.0
	Angle(Quantity_PlaneAngle)=0.523599

Returns:
	None

Creates a light source of the Spot type in the viewer.  
         Xt,Yt,Zt : Coordinate of light source Target.  
         Xp,Yp,Zp : Coordinate of light source Position.  
         The others parameters describe before.   Warning! raises BadValue from V3d  -  
//!	If one of the coefficients is not between 0 and 1 .  
//!	If the lighting angle is <= 0 ou > PI .") V3d_SpotLight;
		 V3d_SpotLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate Xt,const V3d_Coordinate Yt,const V3d_Coordinate Zt,const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0,const Quantity_Coefficient Concentration = 1.0,const Quantity_PlaneAngle Angle = 0.523599);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	virtual void

Defines the position of the light source.") SetPosition;
		virtual void SetPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("autodoc", "Args:
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Defines the direction of the light source.  
//!	If the normal vector is NULL.") SetDirection;
		void SetDirection (const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("autodoc", "Args:
	Orientation(V3d_TypeOfOrientation)

Returns:
	None

Defines the direction of the light source  
//!	     according to a predefined directional vector.") SetDirection;
		void SetDirection (const V3d_TypeOfOrientation Orientation);
		%feature("autodoc", "Args:
	A1(Quantity_Coefficient)
	A2(Quantity_Coefficient)

Returns:
	None

Defines the coefficients of attenuation.  
 Warning! raises BadValue from V3d  
//!	    if one of the coefficient is <0 ou >1 .") SetAttenuation;
		void SetAttenuation (const Quantity_Coefficient A1,const Quantity_Coefficient A2);
		%feature("autodoc", "Args:
	C(Quantity_Coefficient)

Returns:
	None

Defines the coefficient of concentration.  
//!	if the coefficient is <0 ou >1 .") SetConcentration;
		void SetConcentration (const Quantity_Coefficient C);
		%feature("autodoc", "Args:
	Angle(Quantity_PlaneAngle)

Returns:
	None

Defines the spot angle in RADIANS.  
 Warning: raises BadValue from from V3d  
//!	If the angle is <= 0 ou > PI .") SetAngle;
		void SetAngle (const Quantity_PlaneAngle Angle);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	Representation(V3d_TypeOfRepresentation)

Returns:
	None

Display the graphic structure of light source  
         in the choosen view. We have three type of representation  
         - SIMPLE   : Only the light source is displayed.  
         - PARTIAL  : The light source and the light space are  
                      displayed.  
         - COMPLETE : The light source, the light space and the  
                      radius of light space are displayed.  
         We can choose the 'SAMELAST' as parameter of representation  
         In this case the graphic structure representation will be  
         the last displayed.") Display;
		void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation);
		%feature("autodoc", "Args:
	Vx(Quantity_Parameter)
	Vy(Quantity_Parameter)
	Vz(Quantity_Parameter)

Returns:
	None

Returns the direction of the light source defined by Vx,Vy,Vz.") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(V3d_Coordinate)
	Y(V3d_Coordinate)
	Z(V3d_Coordinate)

Returns:
	None

Returns the position of the light source.") Position;
		void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A1(Quantity_Coefficient)
	A2(Quantity_Coefficient)

Returns:
	None

Returns the attenuation factors A1,A2 of the light source.") Attenuation;
		void Attenuation (Quantity_Coefficient & A1,Quantity_Coefficient & A2);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Coefficient

No detailed docstring for this function.") Concentration;
		Quantity_Coefficient Concentration ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

Returns the spot angle.") Angle;
		Quantity_PlaneAngle Angle ();
};


%feature("shadow") V3d_SpotLight::~V3d_SpotLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend V3d_SpotLight {
	void _kill_pointed() {
		delete $self;
	}
};
%extend V3d_SpotLight {
	Handle_V3d_SpotLight GetHandle() {
	return *(Handle_V3d_SpotLight*) &$self;
	}
};

%nodefaultctor Handle_V3d_SpotLight;
class Handle_V3d_SpotLight : public Handle_V3d_PositionLight {

    public:
        // constructors
        Handle_V3d_SpotLight();
        Handle_V3d_SpotLight(const Handle_V3d_SpotLight &aHandle);
        Handle_V3d_SpotLight(const V3d_SpotLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_SpotLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_SpotLight {
    V3d_SpotLight* GetObject() {
    return (V3d_SpotLight*)$self->Access();
    }
};
%feature("shadow") Handle_V3d_SpotLight::~Handle_V3d_SpotLight %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_V3d_SpotLight {
    void _kill_pointed() {
        delete $self;
    }
};

