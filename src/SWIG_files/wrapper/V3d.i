/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include V3d_headers.i


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
typedef Standard_Real V3d_Parameter;
typedef V3d_View * V3d_ViewPointer;
typedef V3d_Viewer * V3d_ViewerPointer;
typedef Standard_Real V3d_Coordinate;
typedef V3d_LayerMgr * V3d_LayerMgrPointer;
/* end typedefs declaration */

/* public enums */
enum V3d_StereoDumpOptions {
	V3d_SDO_MONO = 0,
	V3d_SDO_LEFT_EYE = 1,
	V3d_SDO_RIGHT_EYE = 2,
	V3d_SDO_BLENDED = 3,
};

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

enum V3d_TypeOfRepresentation {
	V3d_SIMPLE = 0,
	V3d_COMPLETE = 1,
	V3d_PARTIAL = 2,
	V3d_SAMELAST = 3,
};

enum V3d_TypeOfShadingModel {
	V3d_COLOR = 0,
	V3d_FLAT = 1,
	V3d_GOURAUD = 2,
	V3d_PHONG = 3,
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
class V3d {
	public:
		%feature("compactdefaultargs") GetProjAxis;
		%feature("autodoc", "	* Determines the orientation vector corresponding to the predefined orientation type.

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: Graphic3d_Vector
") GetProjAxis;
		static Graphic3d_Vector GetProjAxis (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") ArrowOfRadius;
		%feature("autodoc", "	* Compute the graphic structure of arrow. X0,Y0,Z0 : coordinate of the arrow. DX,DY,DZ : Direction of the arrow. Alpha : Angle of arrow. Lng : Length of arrow.

	:param garrow:
	:type garrow: Handle_Graphic3d_Group &
	:param X0:
	:type X0: V3d_Coordinate
	:param Y0:
	:type Y0: V3d_Coordinate
	:param Z0:
	:type Z0: V3d_Coordinate
	:param DX:
	:type DX: V3d_Parameter
	:param DY:
	:type DY: V3d_Parameter
	:param DZ:
	:type DZ: V3d_Parameter
	:param Alpha:
	:type Alpha: Quantity_PlaneAngle
	:param Lng:
	:type Lng: V3d_Parameter
	:rtype: void
") ArrowOfRadius;
		static void ArrowOfRadius (const Handle_Graphic3d_Group & garrow,const V3d_Coordinate X0,const V3d_Coordinate Y0,const V3d_Coordinate Z0,const V3d_Parameter DX,const V3d_Parameter DY,const V3d_Parameter DZ,const Quantity_PlaneAngle Alpha,const V3d_Parameter Lng);
		%feature("compactdefaultargs") CircleInPlane;
		%feature("autodoc", "	* Compute the graphic structure of circle. X0,Y0,Z0 : Center of circle. VX,VY,VZ : Axis of circle. Radius : Radius of circle.

	:param gcircle:
	:type gcircle: Handle_Graphic3d_Group &
	:param X0:
	:type X0: V3d_Coordinate
	:param Y0:
	:type Y0: V3d_Coordinate
	:param Z0:
	:type Z0: V3d_Coordinate
	:param VX:
	:type VX: V3d_Parameter
	:param VY:
	:type VY: V3d_Parameter
	:param VZ:
	:type VZ: V3d_Parameter
	:param Radius:
	:type Radius: V3d_Parameter
	:rtype: void
") CircleInPlane;
		static void CircleInPlane (const Handle_Graphic3d_Group & gcircle,const V3d_Coordinate X0,const V3d_Coordinate Y0,const V3d_Coordinate Z0,const V3d_Parameter VX,const V3d_Parameter VY,const V3d_Parameter VZ,const V3d_Parameter Radius);
		%feature("compactdefaultargs") SwitchViewsinWindow;
		%feature("autodoc", "	:param aPreviousView:
	:type aPreviousView: Handle_V3d_View &
	:param aNextView:
	:type aNextView: Handle_V3d_View &
	:rtype: void
") SwitchViewsinWindow;
		static void SwitchViewsinWindow (const Handle_V3d_View & aPreviousView,const Handle_V3d_View & aNextView);
		%feature("compactdefaultargs") DrawSphere;
		%feature("autodoc", "	* test.

	:param aViewer:
	:type aViewer: Handle_V3d_Viewer &
	:param aRadius: default value is 1000
	:type aRadius: Quantity_Length
	:rtype: void
") DrawSphere;
		static void DrawSphere (const Handle_V3d_Viewer & aViewer,const Quantity_Length aRadius = 1000);
		%feature("compactdefaultargs") PickGrid;
		%feature("autodoc", "	* test.

	:param aViewer:
	:type aViewer: Handle_V3d_Viewer &
	:param aRadius: default value is 1000
	:type aRadius: Quantity_Length
	:rtype: void
") PickGrid;
		static void PickGrid (const Handle_V3d_Viewer & aViewer,const Quantity_Length aRadius = 1000);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* test.

	:param aViewer:
	:type aViewer: Handle_V3d_Viewer &
	:param x1:
	:type x1: Quantity_Length
	:param y1:
	:type y1: Quantity_Length
	:param z1:
	:type z1: Quantity_Length
	:param x2:
	:type x2: Quantity_Length
	:param y2:
	:type y2: Quantity_Length
	:param z2:
	:type z2: Quantity_Length
	:rtype: void
") SetPlane;
		static void SetPlane (const Handle_V3d_Viewer & aViewer,const Quantity_Length x1,const Quantity_Length y1,const Quantity_Length z1,const Quantity_Length x2,const Quantity_Length y2,const Quantity_Length z2);
};


%extend V3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_CircularGrid;
class V3d_CircularGrid : public Aspect_CircularGrid {
	public:
		%feature("compactdefaultargs") V3d_CircularGrid;
		%feature("autodoc", "	:param aViewer:
	:type aViewer: V3d_ViewerPointer &
	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") V3d_CircularGrid;
		 V3d_CircularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") SetColors;
		void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	:rtype: None
") Display;
		void Display ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "	:param Radius:
	:type Radius: float &
	:param OffSet:
	:type OffSet: float &
	:rtype: None
") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "	:param Radius:
	:type Radius: float
	:param OffSet:
	:type OffSet: float
	:rtype: None
") SetGraphicValues;
		void SetGraphicValues (const Standard_Real Radius,const Standard_Real OffSet);
};


%extend V3d_CircularGrid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_CircularGrid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_CircularGrid::Handle_V3d_CircularGrid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_CircularGrid* _get_reference() {
    return (V3d_CircularGrid*)$self->Access();
    }
};

%extend Handle_V3d_CircularGrid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_CircularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_ColorScale;
class V3d_ColorScale : public Aspect_ColorScale {
	public:
		%feature("compactdefaultargs") V3d_ColorScale;
		%feature("autodoc", "	* Returns returns ColorScale from V3d. Returns View from V3d.

	:param theMgr:
	:type theMgr: Handle_V3d_LayerMgr &
	:rtype: None
") V3d_ColorScale;
		 V3d_ColorScale (const Handle_V3d_LayerMgr & theMgr);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	:rtype: None
") Display;
		void Display ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") PaintRect;
		%feature("autodoc", "	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theColor:
	:type theColor: Quantity_Color &
	:param theFilled: default value is Standard_False
	:type theFilled: bool
	:rtype: void
") PaintRect;
		virtual void PaintRect (const Standard_Integer theX,const Standard_Integer theY,const Standard_Integer theWidth,const Standard_Integer theHeight,const Quantity_Color & theColor,const Standard_Boolean theFilled = Standard_False);
		%feature("compactdefaultargs") PaintText;
		%feature("autodoc", "	:param theText:
	:type theText: TCollection_ExtendedString &
	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") PaintText;
		virtual void PaintText (const TCollection_ExtendedString & theText,const Standard_Integer theX,const Standard_Integer theY,const Quantity_Color & theColor);
		%feature("compactdefaultargs") TextWidth;
		%feature("autodoc", "	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: int
") TextWidth;
		virtual Standard_Integer TextWidth (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") TextHeight;
		%feature("autodoc", "	:param theText:
	:type theText: TCollection_ExtendedString &
	:rtype: int
") TextHeight;
		virtual Standard_Integer TextHeight (const TCollection_ExtendedString & theText);
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "	:param theText:
	:type theText: TCollection_ExtendedString &
	:param theHeight:
	:type theHeight: int
	:param theWidth:
	:type theWidth: int &
	:param theAscent:
	:type theAscent: int &
	:param theDescent:
	:type theDescent: int &
	:rtype: None
") TextSize;
		void TextSize (const TCollection_ExtendedString & theText,const Standard_Integer theHeight,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") DrawScale;
		%feature("autodoc", "	:rtype: None
") DrawScale;
		void DrawScale ();
};


%extend V3d_ColorScale {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_ColorScale(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_ColorScale::Handle_V3d_ColorScale %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_ColorScale* _get_reference() {
    return (V3d_ColorScale*)$self->Access();
    }
};

%extend Handle_V3d_ColorScale {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_ColorScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_ColorScaleLayerItem;
class V3d_ColorScaleLayerItem : public Visual3d_LayerItem {
	public:
		%feature("compactdefaultargs") V3d_ColorScaleLayerItem;
		%feature("autodoc", "	* Creates a layer item

	:param aColorScale:
	:type aColorScale: Handle_V3d_ColorScale &
	:rtype: None
") V3d_ColorScaleLayerItem;
		 V3d_ColorScaleLayerItem (const Handle_V3d_ColorScale & aColorScale);
		%feature("compactdefaultargs") ComputeLayerPrs;
		%feature("autodoc", "	* virtual function for recompute 2D presentation (empty by default)

	:rtype: void
") ComputeLayerPrs;
		virtual void ComputeLayerPrs ();
		%feature("compactdefaultargs") RedrawLayerPrs;
		%feature("autodoc", "	* virtual function for recompute 2D presentation (empty by default)

	:rtype: void
") RedrawLayerPrs;
		virtual void RedrawLayerPrs ();
};


%extend V3d_ColorScaleLayerItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_ColorScaleLayerItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_ColorScaleLayerItem::Handle_V3d_ColorScaleLayerItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_ColorScaleLayerItem* _get_reference() {
    return (V3d_ColorScaleLayerItem*)$self->Access();
    }
};

%extend Handle_V3d_ColorScaleLayerItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_ColorScaleLayerItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_LayerMgr;
class V3d_LayerMgr : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") V3d_LayerMgr;
		%feature("autodoc", "	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") V3d_LayerMgr;
		 V3d_LayerMgr (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") Overlay;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Layer
") Overlay;
		Handle_Visual3d_Layer Overlay ();
		%feature("compactdefaultargs") View;
		%feature("autodoc", "	:rtype: Handle_V3d_View
") View;
		Handle_V3d_View View ();
		%feature("compactdefaultargs") ColorScaleDisplay;
		%feature("autodoc", "	:rtype: None
") ColorScaleDisplay;
		void ColorScaleDisplay ();
		%feature("compactdefaultargs") ColorScaleErase;
		%feature("autodoc", "	:rtype: None
") ColorScaleErase;
		void ColorScaleErase ();
		%feature("compactdefaultargs") ColorScaleIsDisplayed;
		%feature("autodoc", "	:rtype: bool
") ColorScaleIsDisplayed;
		Standard_Boolean ColorScaleIsDisplayed ();
		%feature("compactdefaultargs") ColorScale;
		%feature("autodoc", "	:rtype: Handle_Aspect_ColorScale
") ColorScale;
		Handle_Aspect_ColorScale ColorScale ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Recompute layer with objects

	:rtype: None
") Compute;
		void Compute ();
		%feature("compactdefaultargs") Resized;
		%feature("autodoc", "	:rtype: None
") Resized;
		void Resized ();
};


%extend V3d_LayerMgr {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_LayerMgr(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_LayerMgr::Handle_V3d_LayerMgr %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_LayerMgr* _get_reference() {
    return (V3d_LayerMgr*)$self->Access();
    }
};

%extend Handle_V3d_LayerMgr {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_LayerMgr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_Light;
class V3d_Light : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Defines the colour of a light source according to the type of colour definition and the three corresponding values.

	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: Quantity_Parameter
	:param V2:
	:type V2: Quantity_Parameter
	:param V3:
	:type V3: Quantity_Parameter
	:rtype: None
") SetColor;
		void SetColor (const Quantity_TypeOfColor Type,const Quantity_Parameter V1,const Quantity_Parameter V2,const Quantity_Parameter V3);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Defines the colour of a light source by giving the name of the colour in the form Quantity_NOC_xxxx .

	:param Name:
	:type Name: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor Name);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Defines the colour of a light source by giving the basic colour.

	:param Name:
	:type Name: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & Name);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the colour of the light source depending of the color type.

	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: Quantity_Parameter &
	:param V2:
	:type V2: Quantity_Parameter &
	:param V3:
	:type V3: Quantity_Parameter &
	:rtype: None
") Color;
		void Color (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the colour of the light source.

	:param Name:
	:type Name: Quantity_NameOfColor &
	:rtype: None
") Color;
		void Color (Quantity_NameOfColor & Name);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the colour of the light source.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the Type of the Light

	:rtype: V3d_TypeOfLight
") Type;
		V3d_TypeOfLight Type ();
		%feature("compactdefaultargs") Headlight;
		%feature("autodoc", "	* returns true if the light is a headlight

	:rtype: bool
") Headlight;
		Standard_Boolean Headlight ();
		%feature("compactdefaultargs") SetHeadlight;
		%feature("autodoc", "	* Setup headlight flag.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetHeadlight;
		void SetHeadlight (const Standard_Boolean theValue);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns True when a light representation is displayed

	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
};


%extend V3d_Light {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_Light(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_Light::Handle_V3d_Light %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_Light* _get_reference() {
    return (V3d_Light*)$self->Access();
    }
};

%extend Handle_V3d_Light {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_Light {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_ListOfTransient;
class V3d_ListOfTransient : public TColStd_ListOfTransient {
	public:
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Return true if theObject is stored in the list

	:param theObject:
	:type theObject: Handle_Standard_Transient &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & theObject);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Remove all elements equal to theObject from the list

	:param theObject:
	:type theObject: Handle_Standard_Transient &
	:rtype: None
") Remove;
		void Remove (const Handle_Standard_Transient & theObject);
};


%extend V3d_ListOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_Plane;
class V3d_Plane : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") V3d_Plane;
		%feature("autodoc", "	* Creates a clipping plane from plane coefficients.

	:param theA: default value is 0.0
	:type theA: Quantity_Parameter
	:param theB: default value is 0.0
	:type theB: Quantity_Parameter
	:param theC: default value is 1.0
	:type theC: Quantity_Parameter
	:param theD: default value is 0.0
	:type theD: Quantity_Parameter
	:rtype: None
") V3d_Plane;
		 V3d_Plane (const Quantity_Parameter theA = 0.0,const Quantity_Parameter theB = 0.0,const Quantity_Parameter theC = 1.0,const Quantity_Parameter theD = 0.0);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Change plane equation.

	:param theA:
	:type theA: Quantity_Parameter
	:param theB:
	:type theB: Quantity_Parameter
	:param theC:
	:type theC: Quantity_Parameter
	:param theD:
	:type theD: Quantity_Parameter
	:rtype: None
") SetPlane;
		void SetPlane (const Quantity_Parameter theA,const Quantity_Parameter theB,const Quantity_Parameter theC,const Quantity_Parameter theD);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the plane representation in the choosen view.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theColor: default value is Quantity_NOC_GRAY
	:type theColor: Quantity_Color &
	:rtype: void
") Display;
		virtual void Display (const Handle_V3d_View & theView,const Quantity_Color & theColor = Quantity_NOC_GRAY);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase the plane representation.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the parameters of the plane.

	:param theA:
	:type theA: Quantity_Parameter &
	:param theB:
	:type theB: Quantity_Parameter &
	:param theC:
	:type theC: Quantity_Parameter &
	:param theD:
	:type theD: Quantity_Parameter &
	:rtype: None
") Plane;
		void Plane (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns True when the plane representation is displayed.

	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") ClipPlane;
		%feature("autodoc", "	* Use this method to pass clipping plane implementation for standard clipping workflow. returns clipping plane implementation handle.

	:rtype: Handle_Graphic3d_ClipPlane
") ClipPlane;
		Handle_Graphic3d_ClipPlane ClipPlane ();
};


%extend V3d_Plane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_Plane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_Plane::Handle_V3d_Plane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_Plane;
class Handle_V3d_Plane : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_V3d_Plane();
        Handle_V3d_Plane(const Handle_V3d_Plane &aHandle);
        Handle_V3d_Plane(const V3d_Plane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_Plane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_V3d_Plane {
    V3d_Plane* _get_reference() {
    return (V3d_Plane*)$self->Access();
    }
};

%extend Handle_V3d_Plane {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_RectangularGrid;
class V3d_RectangularGrid : public Aspect_RectangularGrid {
	public:
		%feature("compactdefaultargs") V3d_RectangularGrid;
		%feature("autodoc", "	:param aViewer:
	:type aViewer: V3d_ViewerPointer &
	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") V3d_RectangularGrid;
		 V3d_RectangularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") SetColors;
		void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	:rtype: None
") Display;
		void Display ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "	:param XSize:
	:type XSize: float &
	:param YSize:
	:type YSize: float &
	:param OffSet:
	:type OffSet: float &
	:rtype: None
") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "	:param XSize:
	:type XSize: float
	:param YSize:
	:type YSize: float
	:param OffSet:
	:type OffSet: float
	:rtype: None
") SetGraphicValues;
		void SetGraphicValues (const Standard_Real XSize,const Standard_Real YSize,const Standard_Real OffSet);
};


%extend V3d_RectangularGrid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_RectangularGrid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_RectangularGrid::Handle_V3d_RectangularGrid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_RectangularGrid* _get_reference() {
    return (V3d_RectangularGrid*)$self->Access();
    }
};

%extend Handle_V3d_RectangularGrid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_RectangularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_View;
class V3d_View : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "	* Initializes the view.

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param Type: default value is V3d_ORTHOGRAPHIC
	:type Type: V3d_TypeOfView
	:rtype: None
") V3d_View;
		 V3d_View (const Handle_V3d_Viewer & VM,const V3d_TypeOfView Type = V3d_ORTHOGRAPHIC);
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "	* Initializes the view by copying.

	:param theVM:
	:type theVM: Handle_V3d_Viewer &
	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") V3d_View;
		 V3d_View (const Handle_V3d_Viewer & theVM,const Handle_V3d_View & theView);
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Activates the view in the window specified and Map the Window to the screen. Warning! raises MultiplyDefined from Standard if the view is already activated in a window. Warning: The view is centered and resized to preserve the height/width ratio of the window.

	:param IdWin:
	:type IdWin: Handle_Aspect_Window &
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & IdWin);
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Activates the view in the specified Window If <aContext> is not NULL the graphic context is used to draw something in this view. Otherwise an internal graphic context is created. If <aDisplayCB> is not NULL then a user display CB is call at the end of the OCC graphic traversal and just before the swap of buffers. The <aClientData> is pass to this call back. Warning! raises MultiplyDefined from Standard if the view is already activated in a window. Warning: The view is centered and resized to preserve the height/width ratio of the window.

	:param aWindow:
	:type aWindow: Handle_Aspect_Window &
	:param aContext:
	:type aContext: Aspect_RenderingContext
	:param aDisplayCB:
	:type aDisplayCB: Aspect_GraphicCallbackProc &
	:param aClientData:
	:type aClientData: Standard_Address
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & aWindow,const Aspect_RenderingContext aContext,const Aspect_GraphicCallbackProc & aDisplayCB,const Standard_Address aClientData);
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "	:param IdWin:
	:type IdWin: Handle_Aspect_Window &
	:param aPreviousView:
	:type aPreviousView: Handle_V3d_View &
	:param x1:
	:type x1: int
	:param y1:
	:type y1: int
	:param x2:
	:type x2: int
	:param y2:
	:type y2: int
	:rtype: None
") SetMagnify;
		void SetMagnify (const Handle_Aspect_Window & IdWin,const Handle_V3d_View & aPreviousView,const Standard_Integer x1,const Standard_Integer y1,const Standard_Integer x2,const Standard_Integer y2);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Destroys the view.

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Deprecated, Redraw() should be used instead.

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redisplays the view even if there has not been any modification. Must be called if the view is shown. (Ex: DeIconification ) .

	:rtype: None
") Redraw;
		void Redraw ();
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Updates layer of immediate presentations.

	:rtype: None
") RedrawImmediate;
		void RedrawImmediate ();
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Invalidates view content but does not redraw it.

	:rtype: None
") Invalidate;
		void Invalidate ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redisplays the view area after esxposure. [x,y] define the min xy area position [width,height] the size of the area in pixel unit.

	:param x:
	:type x: int
	:param y:
	:type y: int
	:param width:
	:type width: int
	:param height:
	:type height: int
	:rtype: None
") Redraw;
		void Redraw (const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") MustBeResized;
		%feature("autodoc", "	* Must be called when the window supporting the view changes size. if the view is not mapped on a window. Warning: The view is centered and resized to preserve the height/width ratio of the window.

	:rtype: None
") MustBeResized;
		void MustBeResized ();
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "	* Must be called when the window supporting the view is mapped or unmapped.

	:rtype: None
") DoMapping;
		void DoMapping ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns the status of the view regarding the displayed structures inside Returns True is The View is empty

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "	* Updates the lights of the view. The view is redrawn.

	:rtype: None
") UpdateLights;
		void UpdateLights ();
		%feature("compactdefaultargs") AutoZFit;
		%feature("autodoc", "	* If automatic z-range fitting is turned on, adjusts Z-min and Z-max projection volume planes with call to ZFitAll.

	:rtype: None
") AutoZFit;
		void AutoZFit ();
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "	* Change Z-min and Z-max planes of projection volume to match the displayed objects.

	:param theScaleFactor: default value is 1.0
	:type theScaleFactor: float
	:rtype: None
") ZFitAll;
		void ZFitAll (const Standard_Real theScaleFactor = 1.0);
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "	* Defines the background colour of the view by supplying : the colour definition type, and the three corresponding values.

	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: Quantity_Parameter
	:param V2:
	:type V2: Quantity_Parameter
	:param V3:
	:type V3: Quantity_Parameter
	:rtype: None
") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_TypeOfColor Type,const Quantity_Parameter V1,const Quantity_Parameter V2,const Quantity_Parameter V3);
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "	* Defines the background colour of the view by supplying : the colour object.

	:param Color:
	:type Color: Quantity_Color &
	:rtype: None
") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_Color & Color);
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "	* Defines the background colour of the view by supplying : the colour name in the form Quantity_NOC_xxxx .

	:param Name:
	:type Name: Quantity_NameOfColor
	:rtype: None
") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_NameOfColor Name);
		%feature("compactdefaultargs") SetBgGradientColors;
		%feature("autodoc", "	* Defines the gradient background colours of the view by supplying : two colour objects, and fill method (horizontal by default)

	:param Color1:
	:type Color1: Quantity_Color &
	:param Color2:
	:type Color2: Quantity_Color &
	:param FillStyle: default value is Aspect_GFM_HOR
	:type FillStyle: Aspect_GradientFillMethod
	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") SetBgGradientColors;
		void SetBgGradientColors (const Quantity_Color & Color1,const Quantity_Color & Color2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR,const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") SetBgGradientColors;
		%feature("autodoc", "	* Defines the gradient background colours of the view by supplying : two colour names in the form Quantity_NOC_xxxx, and fill method (horizontal by default)

	:param Color1:
	:type Color1: Quantity_NameOfColor
	:param Color2:
	:type Color2: Quantity_NameOfColor
	:param FillStyle: default value is Aspect_GFM_HOR
	:type FillStyle: Aspect_GradientFillMethod
	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") SetBgGradientColors;
		void SetBgGradientColors (const Quantity_NameOfColor Color1,const Quantity_NameOfColor Color2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR,const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "	* Defines the gradient background fill method of the view

	:param AMethod: default value is Aspect_GFM_HOR
	:type AMethod: Aspect_GradientFillMethod
	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") SetBgGradientStyle;
		void SetBgGradientStyle (const Aspect_GradientFillMethod AMethod = Aspect_GFM_HOR,const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "	* Defines the background texture of the view by supplying : texture image file name, and fill method (centered by default)

	:param FileName:
	:type FileName: char *
	:param FillStyle: default value is Aspect_FM_CENTERED
	:type FillStyle: Aspect_FillMethod
	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") SetBackgroundImage;
		void SetBackgroundImage (const char * FileName,const Aspect_FillMethod FillStyle = Aspect_FM_CENTERED,const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "	* Defines the textured background fill method of the view

	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") SetBgImageStyle;
		void SetBgImageStyle (const Aspect_FillMethod FillStyle,const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Definition of an axis from its origin and its orientation . This will be the current axis for rotations and movements. Warning! raises BadValue from V3d if the vector normal is NULL. .

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Vx:
	:type Vx: Quantity_Parameter
	:param Vy:
	:type Vy: Quantity_Parameter
	:param Vz:
	:type Vz: Quantity_Parameter
	:rtype: None
") SetAxis;
		void SetAxis (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "	* Defines the shading model for the visualisation ZBUFFER mode. Various models are available.

	:param Model:
	:type Model: V3d_TypeOfShadingModel
	:rtype: None
") SetShadingModel;
		void SetShadingModel (const V3d_TypeOfShadingModel Model);
		%feature("compactdefaultargs") SetSurfaceDetail;
		%feature("autodoc", "	* select the kind of rendering for texture mapping no texture mapping by default

	:param SurfaceDetail:
	:type SurfaceDetail: V3d_TypeOfSurfaceDetail
	:rtype: None
") SetSurfaceDetail;
		void SetSurfaceDetail (const V3d_TypeOfSurfaceDetail SurfaceDetail);
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "	* set the environment texture to use no environment texture by default

	:param ATexture:
	:type ATexture: Handle_Graphic3d_TextureEnv &
	:rtype: None
") SetTextureEnv;
		void SetTextureEnv (const Handle_Graphic3d_TextureEnv & ATexture);
		%feature("compactdefaultargs") SetVisualization;
		%feature("autodoc", "	* Defines the visualisation mode in the view.

	:param Mode:
	:type Mode: V3d_TypeOfVisualization
	:rtype: None
") SetVisualization;
		void SetVisualization (const V3d_TypeOfVisualization Mode);
		%feature("compactdefaultargs") SetAntialiasingOn;
		%feature("autodoc", "	* Activates antialiasing in the view.

	:rtype: None
") SetAntialiasingOn;
		void SetAntialiasingOn ();
		%feature("compactdefaultargs") SetAntialiasingOff;
		%feature("autodoc", "	* Desactivates antialiasing in the view.

	:rtype: None
") SetAntialiasingOff;
		void SetAntialiasingOff ();
		%feature("compactdefaultargs") SetZClippingDepth;
		%feature("autodoc", "	* Defines the depth of the medium clipping plane.

	:param Depth:
	:type Depth: Quantity_Length
	:rtype: None
") SetZClippingDepth;
		void SetZClippingDepth (const Quantity_Length Depth);
		%feature("compactdefaultargs") SetZClippingWidth;
		%feature("autodoc", "	* Defines the thicknes around the medium clippling plane. .

	:param Width:
	:type Width: Quantity_Length
	:rtype: None
") SetZClippingWidth;
		void SetZClippingWidth (const Quantity_Length Width);
		%feature("compactdefaultargs") SetZClippingType;
		%feature("autodoc", "	* Defines the type of ZClipping.

	:param Type:
	:type Type: V3d_TypeOfZclipping
	:rtype: None
") SetZClippingType;
		void SetZClippingType (const V3d_TypeOfZclipping Type);
		%feature("compactdefaultargs") SetZCueingDepth;
		%feature("autodoc", "	* Defines the depth of the medium plane.

	:param Depth:
	:type Depth: Quantity_Length
	:rtype: None
") SetZCueingDepth;
		void SetZCueingDepth (const Quantity_Length Depth);
		%feature("compactdefaultargs") SetZCueingWidth;
		%feature("autodoc", "	* Defines the thickness around the medium plane.

	:param Width:
	:type Width: Quantity_Length
	:rtype: None
") SetZCueingWidth;
		void SetZCueingWidth (const Quantity_Length Width);
		%feature("compactdefaultargs") SetZCueingOn;
		%feature("autodoc", "	* Activates ZCueing in the view.

	:rtype: None
") SetZCueingOn;
		void SetZCueingOn ();
		%feature("compactdefaultargs") SetZCueingOff;
		%feature("autodoc", "	* Desactivates ZCueing in the view.

	:rtype: None
") SetZCueingOff;
		void SetZCueingOff ();
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates MyLight in the view.

	:param MyLight:
	:type MyLight: Handle_V3d_Light &
	:rtype: None
") SetLightOn;
		void SetLightOn (const Handle_V3d_Light & MyLight);
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates all the lights defined in this view.

	:rtype: None
") SetLightOn;
		void SetLightOn ();
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Desactivate MyLight in this view.

	:param MyLight:
	:type MyLight: Handle_V3d_Light &
	:rtype: None
") SetLightOff;
		void SetLightOff (const Handle_V3d_Light & MyLight);
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Deactivate all the Lights defined in this view.

	:rtype: None
") SetLightOff;
		void SetLightOff ();
		%feature("compactdefaultargs") IsActiveLight;
		%feature("autodoc", "	* Returns True when the light is active in this view.

	:param aLight:
	:type aLight: Handle_V3d_Light &
	:rtype: bool
") IsActiveLight;
		Standard_Boolean IsActiveLight (const Handle_V3d_Light & aLight);
		%feature("compactdefaultargs") SetImmediateUpdate;
		%feature("autodoc", "	* sets the immediate update mode and returns the previous one.

	:param theImmediateUpdate:
	:type theImmediateUpdate: bool
	:rtype: bool
") SetImmediateUpdate;
		Standard_Boolean SetImmediateUpdate (const Standard_Boolean theImmediateUpdate);
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "	* Customization of the ZBUFFER Triedron. XColor,YColor,ZColor - colors of axis SizeRatio - ratio of decreasing of the trihedron size when its phisical position comes out of the view AxisDiametr - diameter relatively to axis length NbFacettes - number of facettes of cylinders and cones

	:param XColor: default value is Quantity_NOC_RED
	:type XColor: Quantity_NameOfColor
	:param YColor: default value is Quantity_NOC_GREEN
	:type YColor: Quantity_NameOfColor
	:param ZColor: default value is Quantity_NOC_BLUE1
	:type ZColor: Quantity_NameOfColor
	:param SizeRatio: default value is 0.8
	:type SizeRatio: float
	:param AxisDiametr: default value is 0.05
	:type AxisDiametr: float
	:param NbFacettes: default value is 12
	:type NbFacettes: int
	:rtype: None
") ZBufferTriedronSetup;
		void ZBufferTriedronSetup (const Quantity_NameOfColor XColor = Quantity_NOC_RED,const Quantity_NameOfColor YColor = Quantity_NOC_GREEN,const Quantity_NameOfColor ZColor = Quantity_NOC_BLUE1,const Standard_Real SizeRatio = 0.8,const Standard_Real AxisDiametr = 0.05,const Standard_Integer NbFacettes = 12);
		%feature("compactdefaultargs") TriedronDisplay;
		%feature("autodoc", "	* Display of the Triedron. Initialize position, color and length of Triedron axes. The scale is a percent of the window width.

	:param APosition: default value is Aspect_TOTP_CENTER
	:type APosition: Aspect_TypeOfTriedronPosition
	:param AColor: default value is Quantity_NOC_WHITE
	:type AColor: Quantity_NameOfColor
	:param AScale: default value is 0.02
	:type AScale: float
	:param AMode: default value is V3d_WIREFRAME
	:type AMode: V3d_TypeOfVisualization
	:rtype: None
") TriedronDisplay;
		void TriedronDisplay (const Aspect_TypeOfTriedronPosition APosition = Aspect_TOTP_CENTER,const Quantity_NameOfColor AColor = Quantity_NOC_WHITE,const Standard_Real AScale = 0.02,const V3d_TypeOfVisualization AMode = V3d_WIREFRAME);
		%feature("compactdefaultargs") TriedronErase;
		%feature("autodoc", "	* Erases the Triedron.

	:rtype: None
") TriedronErase;
		void TriedronErase ();
		%feature("compactdefaultargs") TriedronEcho;
		%feature("autodoc", "	* Highlights the echo zone of the Triedron.

	:param AType: default value is Aspect_TOTE_NONE
	:type AType: Aspect_TypeOfTriedronEcho
	:rtype: None
") TriedronEcho;
		void TriedronEcho (const Aspect_TypeOfTriedronEcho AType = Aspect_TOTE_NONE);
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "	* Returns data of a graduated trihedron.

	:rtype: Graphic3d_GraduatedTrihedron
") GetGraduatedTrihedron;
		const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron ();
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "	* Displays a graduated trihedron.

	:param theTrigedronData:
	:type theTrigedronData: Graphic3d_GraduatedTrihedron &
	:rtype: None
") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const Graphic3d_GraduatedTrihedron & theTrigedronData);
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "	* Erases a graduated trihedron from the view.

	:rtype: None
") GraduatedTrihedronErase;
		void GraduatedTrihedronErase ();
		%feature("compactdefaultargs") SetLayerMgr;
		%feature("autodoc", "	:param aMgr:
	:type aMgr: Handle_V3d_LayerMgr &
	:rtype: None
") SetLayerMgr;
		void SetLayerMgr (const Handle_V3d_LayerMgr & aMgr);
		%feature("compactdefaultargs") ColorScaleDisplay;
		%feature("autodoc", "	:rtype: None
") ColorScaleDisplay;
		void ColorScaleDisplay ();
		%feature("compactdefaultargs") ColorScaleErase;
		%feature("autodoc", "	:rtype: None
") ColorScaleErase;
		void ColorScaleErase ();
		%feature("compactdefaultargs") ColorScaleIsDisplayed;
		%feature("autodoc", "	:rtype: bool
") ColorScaleIsDisplayed;
		Standard_Boolean ColorScaleIsDisplayed ();
		%feature("compactdefaultargs") ColorScale;
		%feature("autodoc", "	:rtype: Handle_Aspect_ColorScale
") ColorScale;
		Handle_Aspect_ColorScale ColorScale ();
		%feature("compactdefaultargs") SetFront;
		%feature("autodoc", "	* modify the Projection of the view perpendicularly to the privileged plane of the viewer.

	:rtype: None
") SetFront;
		void SetFront ();
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about the coordinate system of reference of the screen for which the origin is the view point of the projection, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True Warning! raises BadValue from V3d If the eye, the view point, or the high point are aligned or confused.

	:param Ax:
	:type Ax: Quantity_PlaneAngle
	:param Ay:
	:type Ay: Quantity_PlaneAngle
	:param Az:
	:type Az: Quantity_PlaneAngle
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const Quantity_PlaneAngle Ax,const Quantity_PlaneAngle Ay,const Quantity_PlaneAngle Az,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about the coordinate system of reference of the screen for which the origin is Gravity point {X,Y,Z}, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True If the eye, the view point, or the high point are aligned or confused.

	:param Ax:
	:type Ax: Quantity_PlaneAngle
	:param Ay:
	:type Ay: Quantity_PlaneAngle
	:param Az:
	:type Az: Quantity_PlaneAngle
	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const Quantity_PlaneAngle Ax,const Quantity_PlaneAngle Ay,const Quantity_PlaneAngle Az,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about one of the coordinate axes of of the view for which the origin is the Gravity point{X,Y,Z} with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Quantity_PlaneAngle Angle,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about one of the coordinate axes of of the view for which the origin is the view point of the projection with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye around the current axis a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Movement of the eye parallel to the coordinate system of reference of the screen a distance relative to the initial position expressed by Start = Standard_True.

	:param Dx:
	:type Dx: Quantity_Length
	:param Dy:
	:type Dy: Quantity_Length
	:param Dz:
	:type Dz: Quantity_Length
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Move;
		void Move (const Quantity_Length Dx,const Quantity_Length Dy,const Quantity_Length Dz,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Movement of the eye parallel to one of the axes of the coordinate system of reference of the view a distance relative to the initial position expressed by Start = Standard_True.

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Length:
	:type Length: Quantity_Length
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Move;
		void Move (const V3d_TypeOfAxe Axe,const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Movement of the eye parllel to the current axis a distance relative to the initial position expressed by Start = Standard_True

	:param Length:
	:type Length: Quantity_Length
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Move;
		void Move (const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Movement of the ye and the view point parallel to the frame of reference of the screen a distance relative to the initial position expressed by Start = Standard_True

	:param Dx:
	:type Dx: Quantity_Length
	:param Dy:
	:type Dy: Quantity_Length
	:param Dz:
	:type Dz: Quantity_Length
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Translate;
		void Translate (const Quantity_Length Dx,const Quantity_Length Dy,const Quantity_Length Dz,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Movement of the eye and the view point parallel to one of the axes of the fame of reference of the view a distance relative to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Length:
	:type Length: Quantity_Length
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Translate;
		void Translate (const V3d_TypeOfAxe Axe,const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Movement of the eye and view point parallel to the current axis a distance relative to the initial position expressed by Start = Standard_True

	:param Length:
	:type Length: Quantity_Length
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Translate;
		void Translate (const Quantity_Length Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Place;
		%feature("autodoc", "	* places the point of the view corresponding at the pixel position x,y at the center of the window and updates the view.

	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:param theZoomFactor: default value is 1
	:type theZoomFactor: Quantity_Factor
	:rtype: None
") Place;
		void Place (const Standard_Integer theXp,const Standard_Integer theYp,const Quantity_Factor theZoomFactor = 1);
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "	* Rotation of the view point around the frame of reference of the screen for which the origin is the eye of the projection with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Ax:
	:type Ax: Quantity_PlaneAngle
	:param Ay:
	:type Ay: Quantity_PlaneAngle
	:param Az:
	:type Az: Quantity_PlaneAngle
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Turn;
		void Turn (const Quantity_PlaneAngle Ax,const Quantity_PlaneAngle Ay,const Quantity_PlaneAngle Az,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "	* Rotation of the view point around one of the axes of the frame of reference of the view for which the origin is the eye of the projection with an angular value in RADIANS relative to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Turn;
		void Turn (const V3d_TypeOfAxe Axe,const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "	* Rotation of the view point around the current axis an angular value in RADIANS relative to the initial position expressed by Start = Standard_True

	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Turn;
		void Turn (const Quantity_PlaneAngle Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") SetTwist;
		%feature("autodoc", "	* Defines the angular position of the high point of the reference frame of the view with respect to the Y screen axis with an absolute angular value in RADIANS.

	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:rtype: None
") SetTwist;
		void SetTwist (const Quantity_PlaneAngle Angle);
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "	* Defines the position of the eye..

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:rtype: None
") SetEye;
		void SetEye (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	* Defines the Depth of the eye from the view point without update the projection .

	:param Depth:
	:type Depth: Quantity_Length
	:rtype: None
") SetDepth;
		void SetDepth (const Quantity_Length Depth);
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "	* Defines the orientation of the projection.

	:param Vx:
	:type Vx: Quantity_Parameter
	:param Vy:
	:type Vy: Quantity_Parameter
	:param Vz:
	:type Vz: Quantity_Parameter
	:rtype: None
") SetProj;
		void SetProj (const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "	* Defines the orientation of the projection .

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: None
") SetProj;
		void SetProj (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") SetAt;
		%feature("autodoc", "	* Defines the position of the view point.

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:rtype: None
") SetAt;
		void SetAt (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "	* Defines the orientation of the high point.

	:param Vx:
	:type Vx: Quantity_Parameter
	:param Vy:
	:type Vy: Quantity_Parameter
	:param Vz:
	:type Vz: Quantity_Parameter
	:rtype: None
") SetUp;
		void SetUp (const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "	* Defines the orientation(SO) of the high point.

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: None
") SetUp;
		void SetUp (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") SetViewOrientationDefault;
		%feature("autodoc", "	* Saves the current state of the orientation of the view which will be the return state at ResetViewOrientation.

	:rtype: None
") SetViewOrientationDefault;
		void SetViewOrientationDefault ();
		%feature("compactdefaultargs") ResetViewOrientation;
		%feature("autodoc", "	* Resets the orientation of the view. Updates the view

	:rtype: None
") ResetViewOrientation;
		void ResetViewOrientation ();
		%feature("compactdefaultargs") Panning;
		%feature("autodoc", "	* Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXv, DXy parameters specify panning relative to the point where the operation is started. @param theDXv [in] the relative panning on 'x' axis of view projection, in view space coordinates. @param theDYv [in] the relative panning on 'y' axis of view projection, in view space coordinates. @param theZoomFactor [in] the zooming factor. @param theToStart [in] pass True when starting panning to remember view state prior to panning for relative arguments. If panning is started, passing {0, 0} for {theDXv, theDYv} will return view to initial state. Performs update of view.

	:param theDXv:
	:type theDXv: float
	:param theDYv:
	:type theDYv: float
	:param theZoomFactor: default value is 1
	:type theZoomFactor: Quantity_Factor
	:param theToStart: default value is Standard_True
	:type theToStart: bool
	:rtype: None
") Panning;
		void Panning (const Standard_Real theDXv,const Standard_Real theDYv,const Quantity_Factor theZoomFactor = 1,const Standard_Boolean theToStart = Standard_True);
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	* Relocates center of screen to the point, determined by {Xp, Yp} pixel coordinates relative to the bottom-left corner of screen. To calculate pixel coordinates for any point from world coordinate space, it can be projected using 'Project'. @param theXp [in] the x coordinate. @param theYp [in] the y coordinate.

	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:rtype: None
") SetCenter;
		void SetCenter (const Standard_Integer theXp,const Standard_Integer theYp);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Defines the view projection size in its maximum dimension, keeping the inital height/width ratio unchanged.

	:param theSize:
	:type theSize: Quantity_Length
	:rtype: None
") SetSize;
		void SetSize (const Quantity_Length theSize);
		%feature("compactdefaultargs") SetZSize;
		%feature("autodoc", "	* Defines the Depth size of the view Front Plane will be set to Size/2. Back Plane will be set to -Size/2. Any Object located Above the Front Plane or behind the Back Plane will be Clipped . NOTE than the XY Size of the View is NOT modified .

	:param Size:
	:type Size: Quantity_Length
	:rtype: None
") SetZSize;
		void SetZSize (const Quantity_Length Size);
		%feature("compactdefaultargs") SetZoom;
		%feature("autodoc", "	* Zooms the view by a factor relative to the initial value expressed by Start = Standard_True Updates the view.

	:param Coef:
	:type Coef: Quantity_Factor
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") SetZoom;
		void SetZoom (const Quantity_Factor Coef,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Zooms the view by a factor relative to the value initialised by SetViewMappingDefault(). Updates the view.

	:param Coef:
	:type Coef: Quantity_Factor
	:rtype: None
") SetScale;
		void SetScale (const Quantity_Factor Coef);
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "	* Sets anisotropic (axial) scale factors <Sx>, <Sy>, <Sz> for view <self>. Anisotropic scaling operation is performed through multiplying the current view orientation matrix by a scaling matrix: || Sx 0 0 0 || || 0 Sy 0 0 || || 0 0 Sz 0 || || 0 0 0 1 || Updates the view.

	:param Sx:
	:type Sx: float
	:param Sy:
	:type Sy: float
	:param Sz:
	:type Sz: float
	:rtype: None
") SetAxialScale;
		void SetAxialScale (const Standard_Real Sx,const Standard_Real Sy,const Standard_Real Sz);
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "	* Adjust view parameters to fit the displayed scene, respecting height / width ratio. The Z clipping range (depth range) is fitted if AutoZFit flag is True. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. @param theMargin [in] the margin coefficient for view borders. @param theToUpdate [in] flag to perform view update.

	:param theMargin: default value is 0.01
	:type theMargin: Quantity_Coefficient
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None
") FitAll;
		void FitAll (const Quantity_Coefficient theMargin = 0.01,const Standard_Boolean theToUpdate = Standard_True);
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "	* Adjust view parameters to fit the displayed scene, respecting height / width ratio according to the custom bounding box given. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. @param theBox [in] the custom bounding box to fit. @param theMargin [in] the margin coefficient for view borders. @param theToUpdate [in] flag to perform view update.

	:param theBox:
	:type theBox: Bnd_Box &
	:param theMargin: default value is 0.01
	:type theMargin: Quantity_Coefficient
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None
") FitAll;
		void FitAll (const Bnd_Box & theBox,const Quantity_Coefficient theMargin = 0.01,const Standard_Boolean theToUpdate = Standard_True);
		%feature("compactdefaultargs") DepthFitAll;
		%feature("autodoc", "	* Adjusts the viewing volume so as not to clip the displayed objects by front and back and back clipping planes. Also sets depth value automatically depending on the calculated Z size and Aspect parameter. NOTE than the original XY size of the view is NOT modified .

	:param Aspect: default value is 0.01
	:type Aspect: Quantity_Coefficient
	:param Margin: default value is 0.01
	:type Margin: Quantity_Coefficient
	:rtype: None
") DepthFitAll;
		void DepthFitAll (const Quantity_Coefficient Aspect = 0.01,const Quantity_Coefficient Margin = 0.01);
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "	* Centers the defined projection window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified .

	:param theMinXv:
	:type theMinXv: float
	:param theMinYv:
	:type theMinYv: float
	:param theMaxXv:
	:type theMaxXv: float
	:param theMaxYv:
	:type theMaxYv: float
	:rtype: None
") FitAll;
		void FitAll (const Standard_Real theMinXv,const Standard_Real theMinYv,const Standard_Real theMaxXv,const Standard_Real theMaxYv);
		%feature("compactdefaultargs") WindowFit;
		%feature("autodoc", "	* Centers the defined PIXEL window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified. @param theMinXp [in] pixel coordinates of minimal corner on x screen axis. @param theMinYp [in] pixel coordinates of minimal corner on y screen axis. @param theMaxXp [in] pixel coordinates of maximal corner on x screen axis. @param theMaxYp [in] pixel coordinates of maximal corner on y screen axis.

	:param theMinXp:
	:type theMinXp: int
	:param theMinYp:
	:type theMinYp: int
	:param theMaxXp:
	:type theMaxXp: int
	:param theMaxYp:
	:type theMaxYp: int
	:rtype: None
") WindowFit;
		void WindowFit (const Standard_Integer theMinXp,const Standard_Integer theMinYp,const Standard_Integer theMaxXp,const Standard_Integer theMaxYp);
		%feature("compactdefaultargs") SetViewMappingDefault;
		%feature("autodoc", "	* Saves the current view mapping. This will be the state returned from ResetViewmapping.

	:rtype: None
") SetViewMappingDefault;
		void SetViewMappingDefault ();
		%feature("compactdefaultargs") ResetViewMapping;
		%feature("autodoc", "	* Resets the centering of the view. Updates the view

	:rtype: None
") ResetViewMapping;
		void ResetViewMapping ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Resets the centering and the orientation of the view Updates the view

	:param update: default value is Standard_True
	:type update: bool
	:rtype: None
") Reset;
		void Reset (const Standard_Boolean update = Standard_True);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the PIXEL value to a value in the projection plane.

	:param Vp:
	:type Vp: int
	:rtype: Quantity_Length
") Convert;
		Quantity_Length Convert (const Standard_Integer Vp);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the point PIXEL into a point projected in the reference frame of the projection plane.

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param Xv:
	:type Xv: V3d_Coordinate &
	:param Yv:
	:type Yv: V3d_Coordinate &
	:rtype: None
") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts tha value of the projection plane into a PIXEL value.

	:param Vv:
	:type Vv: Quantity_Length
	:rtype: int
") Convert;
		Standard_Integer Convert (const Quantity_Length Vv);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the point defined in the reference frame of the projection plane into a point PIXEL.

	:param Xv:
	:type Xv: V3d_Coordinate
	:param Yv:
	:type Yv: V3d_Coordinate
	:param Xp:
	:type Xp: int &
	:param Yp:
	:type Yp: int &
	:rtype: None
") Convert;
		void Convert (const V3d_Coordinate Xv,const V3d_Coordinate Yv,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector.

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConvertWithProj;
		%feature("autodoc", "	* Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and returns the projection ray for further computations.

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:param Vx:
	:type Vx: Quantity_Parameter &
	:param Vy:
	:type Vy: Quantity_Parameter &
	:param Vz:
	:type Vz: Quantity_Parameter &
	:rtype: None
") ConvertWithProj;
		void ConvertWithProj (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "	* Converts the projected point into the nearest grid point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and display the grid marker. Warning: When the grid is not active the result is identical to the above Convert() method. How to use: 1) Enable the grid echo display myViewer->SetGridEcho(Standard_True); 2) When application receive a move event: 2.1) Check if any object is detected if( myInteractiveContext->MoveTo(x,y) == AIS_SOD_Nothing ) { 2.2) Check if the grid is active if( myViewer->Grid()->IsActive() ) { 2.3) Display the grid echo and gets the grid point myView->ConvertToGrid(x,y,X,Y,Z); myView->Viewer()->ShowGridEcho (myView, Graphic3d_Vertex (X,Y,Z)); myView->RedrawImmediate(); 2.4) Else this is the standard case } else myView->Convert(x,y,X,Y,Z);

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param Xg:
	:type Xg: V3d_Coordinate &
	:param Yg:
	:type Yg: V3d_Coordinate &
	:param Zg:
	:type Zg: V3d_Coordinate &
	:rtype: None
") ConvertToGrid;
		void ConvertToGrid (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "	* Converts the point into the nearest grid point and display the grid marker.

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Xg:
	:type Xg: V3d_Coordinate &
	:param Yg:
	:type Yg: V3d_Coordinate &
	:param Zg:
	:type Zg: V3d_Coordinate &
	:rtype: None
") ConvertToGrid;
		void ConvertToGrid (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Projects the point defined in the reference frame of the view into the projected point in the associated window.

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Xp:
	:type Xp: int &
	:param Yp:
	:type Yp: int &
	:rtype: None
") Convert;
		void Convert (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Converts the point defined in the user space of the view to the projected view plane point at z 0.

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Xp:
	:type Xp: V3d_Coordinate &
	:param Yp:
	:type Yp: V3d_Coordinate &
	:rtype: None
") Project;
		void Project (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "	* Returns the Background color values of the view depending of the color Type.

	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: Quantity_Parameter &
	:param V2:
	:type V2: Quantity_Parameter &
	:param V3:
	:type V3: Quantity_Parameter &
	:rtype: None
") BackgroundColor;
		void BackgroundColor (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "	* Returns the Background color object of the view.

	:rtype: Quantity_Color
") BackgroundColor;
		Quantity_Color BackgroundColor ();
		%feature("compactdefaultargs") GradientBackgroundColors;
		%feature("autodoc", "	* Returns the gradient background colour objects of the view.

	:param Color1:
	:type Color1: Quantity_Color &
	:param Color2:
	:type Color2: Quantity_Color &
	:rtype: None
") GradientBackgroundColors;
		void GradientBackgroundColors (Quantity_Color & Color1,Quantity_Color & Color2);
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* Returns the gradient background of the view.

	:rtype: Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Returns the current value of the zoom expressed with respect to SetViewMappingDefault().

	:rtype: Quantity_Factor
") Scale;
		Quantity_Factor Scale ();
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "	* Returns the current values of the anisotropic (axial) scale factors.

	:param Sx:
	:type Sx: float &
	:param Sy:
	:type Sy: float &
	:param Sz:
	:type Sz: float &
	:rtype: None
") AxialScale;
		void AxialScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns the height and width of the view.

	:param Width:
	:type Width: Quantity_Length &
	:param Height:
	:type Height: Quantity_Length &
	:rtype: None
") Size;
		void Size (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ZSize;
		%feature("autodoc", "	* Returns the Depth of the view .

	:rtype: float
") ZSize;
		Standard_Real ZSize ();
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "	* Returns the position of the eye.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") Eye;
		void Eye (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FocalReferencePoint;
		%feature("autodoc", "	* Returns the position of point which emanating the projections.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") FocalReferencePoint;
		void FocalReferencePoint (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ProjReferenceAxe;
		%feature("autodoc", "	* Returns the coordinate of the point (Xpix,Ypix) in the view (XP,YP,ZP), and the projection vector of the view passing by the point (for PerspectiveView).

	:param Xpix:
	:type Xpix: int
	:param Ypix:
	:type Ypix: int
	:param XP:
	:type XP: V3d_Coordinate &
	:param YP:
	:type YP: V3d_Coordinate &
	:param ZP:
	:type ZP: V3d_Coordinate &
	:param VX:
	:type VX: V3d_Coordinate &
	:param VY:
	:type VY: V3d_Coordinate &
	:param VZ:
	:type VZ: V3d_Coordinate &
	:rtype: None
") ProjReferenceAxe;
		void ProjReferenceAxe (const Standard_Integer Xpix,const Standard_Integer Ypix,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Returns the Distance between the Eye and View Point.

	:rtype: Quantity_Length
") Depth;
		Quantity_Length Depth ();
		%feature("compactdefaultargs") Proj;
		%feature("autodoc", "	* Returns the projection vector.

	:param Vx:
	:type Vx: Quantity_Parameter &
	:param Vy:
	:type Vy: Quantity_Parameter &
	:param Vz:
	:type Vz: Quantity_Parameter &
	:rtype: None
") Proj;
		void Proj (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") At;
		%feature("autodoc", "	* Returns the position of the view point.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") At;
		void At (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "	* Returns the vector giving the position of the high point.

	:param Vx:
	:type Vx: Quantity_Parameter &
	:param Vy:
	:type Vy: Quantity_Parameter &
	:param Vz:
	:type Vz: Quantity_Parameter &
	:rtype: None
") Up;
		void Up (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Twist;
		%feature("autodoc", "	* Returns in RADIANS the orientation of the view around the visual axis measured from the Y axis of the screen.

	:rtype: Quantity_PlaneAngle
") Twist;
		Quantity_PlaneAngle Twist ();
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "	* Returns the current shading model.

	:rtype: V3d_TypeOfShadingModel
") ShadingModel;
		V3d_TypeOfShadingModel ShadingModel ();
		%feature("compactdefaultargs") SurfaceDetail;
		%feature("autodoc", "	:rtype: V3d_TypeOfSurfaceDetail
") SurfaceDetail;
		V3d_TypeOfSurfaceDetail SurfaceDetail ();
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_TextureEnv
") TextureEnv;
		Handle_Graphic3d_TextureEnv TextureEnv ();
		%feature("compactdefaultargs") Visualization;
		%feature("autodoc", "	* Returns the current visualisation mode.

	:rtype: V3d_TypeOfVisualization
") Visualization;
		V3d_TypeOfVisualization Visualization ();
		%feature("compactdefaultargs") Antialiasing;
		%feature("autodoc", "	* Indicates if the antialiasing is active (True) or inactive (False).

	:rtype: bool
") Antialiasing;
		Standard_Boolean Antialiasing ();
		%feature("compactdefaultargs") ZCueing;
		%feature("autodoc", "	* Returns activity and information on the Zcueing. <Depth> : Depth of plane. <Width> : Thickness around the plane.

	:param Depth:
	:type Depth: Quantity_Length &
	:param Width:
	:type Width: Quantity_Length &
	:rtype: bool
") ZCueing;
		Standard_Boolean ZCueing (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ZClipping;
		%feature("autodoc", "	* Returns current information on the ZClipping. <Depth> : Depth of plane. <Width> : Thickness around the plane. <TypeOfZclipping> : 'BACK' 'FRONT' 'SLICE' 'OFF'

	:param Depth:
	:type Depth: Quantity_Length &
	:param Width:
	:type Width: Quantity_Length &
	:rtype: V3d_TypeOfZclipping
") ZClipping;
		V3d_TypeOfZclipping ZClipping (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IfMoreLights;
		%feature("autodoc", "	* Returns True if One light more can be activated in this View.

	:rtype: bool
") IfMoreLights;
		Standard_Boolean IfMoreLights ();
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "	* initializes an iteration on the active Lights.

	:rtype: None
") InitActiveLights;
		void InitActiveLights ();
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "	* returns true if there are more active Light(s) to return.

	:rtype: bool
") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "	* Go to the next active Light (if there is not, ActiveLight will raise an exception)

	:rtype: None
") NextActiveLights;
		void NextActiveLights ();
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "	:rtype: Handle_V3d_Light
") ActiveLight;
		Handle_V3d_Light ActiveLight ();
		%feature("compactdefaultargs") Viewer;
		%feature("autodoc", "	* Returns the viewer in which the view has been created.

	:rtype: Handle_V3d_Viewer
") Viewer;
		Handle_V3d_Viewer Viewer ();
		%feature("compactdefaultargs") IfWindow;
		%feature("autodoc", "	* Returns True if MyView is associated with a window .

	:rtype: bool
") IfWindow;
		Standard_Boolean IfWindow ();
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "	* Returns the Aspect Window associated with the view.

	:rtype: Handle_Aspect_Window
") Window;
		Handle_Aspect_Window Window ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the Type of the View

	:rtype: V3d_TypeOfView
") Type;
		V3d_TypeOfView Type ();
		%feature("compactdefaultargs") Pan;
		%feature("autodoc", "	* Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXp, DXp parameters specify panning relative to the point where the operation is started. @param theDXp [in] the relative panning on 'x' axis of view projection, in pixels. @param theDYp [in] the relative panning on 'y' axis of view projection, in pixels. @param theZoomFactor [in] the zooming factor. @param theToStart [in] pass True when starting panning to remember view state prior to panning for relative arguments. Passing 0 for relative panning parameter should return view panning to initial state. Performs update of view.

	:param theDXp:
	:type theDXp: int
	:param theDYp:
	:type theDYp: int
	:param theZoomFactor: default value is 1
	:type theZoomFactor: Quantity_Factor
	:param theToStart: default value is Standard_True
	:type theToStart: bool
	:rtype: None
") Pan;
		void Pan (const Standard_Integer theDXp,const Standard_Integer theDYp,const Quantity_Factor theZoomFactor = 1,const Standard_Boolean theToStart = Standard_True);
		%feature("compactdefaultargs") Zoom;
		%feature("autodoc", "	* Zoom the view according to a zoom factor computed from the distance between the 2 mouse position. @param theXp1 [in] the x coordinate of first mouse position, in pixels. @param theYp1 [in] the y coordinate of first mouse position, in pixels. @param theXp2 [in] the x coordinate of second mouse position, in pixels. @param theYp2 [in] the y coordinate of second mouse position, in pixels.

	:param theXp1:
	:type theXp1: int
	:param theYp1:
	:type theYp1: int
	:param theXp2:
	:type theXp2: int
	:param theYp2:
	:type theYp2: int
	:rtype: None
") Zoom;
		void Zoom (const Standard_Integer theXp1,const Standard_Integer theYp1,const Standard_Integer theXp2,const Standard_Integer theYp2);
		%feature("compactdefaultargs") StartZoomAtPoint;
		%feature("autodoc", "	* Defines starting point for ZoomAtPoint view operation. @param theXp [in] the x mouse coordinate, in pixels. @param theYp [in] the y mouse coordinate, in pixels.

	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:rtype: None
") StartZoomAtPoint;
		void StartZoomAtPoint (const Standard_Integer theXp,const Standard_Integer theYp);
		%feature("compactdefaultargs") ZoomAtPoint;
		%feature("autodoc", "	* Zooms the model at a pixel defined by the method StartZoomAtPoint().

	:param theMouseStartX:
	:type theMouseStartX: int
	:param theMouseStartY:
	:type theMouseStartY: int
	:param theMouseEndX:
	:type theMouseEndX: int
	:param theMouseEndY:
	:type theMouseEndY: int
	:rtype: None
") ZoomAtPoint;
		void ZoomAtPoint (const Standard_Integer theMouseStartX,const Standard_Integer theMouseStartY,const Standard_Integer theMouseEndX,const Standard_Integer theMouseEndY);
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "	* Performs anisotropic scaling of <self> view along the given <Axis>. The scale factor is calculated on a basis of the mouse pointer displacement <Dx,Dy>. The calculated scale factor is then passed to SetAxialScale(Sx, Sy, Sz) method.

	:param Dx:
	:type Dx: int
	:param Dy:
	:type Dy: int
	:param Axis:
	:type Axis: V3d_TypeOfAxe
	:rtype: None
") AxialScale;
		void AxialScale (const Standard_Integer Dx,const Standard_Integer Dy,const V3d_TypeOfAxe Axis);
		%feature("compactdefaultargs") StartRotation;
		%feature("autodoc", "	* Begin the rotation of the view around the screen axis according to the mouse position <X,Y>. Warning: Enable rotation around the Z screen axis when <zRotationThreshold> factor is > 0 soon the distance from the start point and the center of the view is > (medium viewSize * <zRotationThreshold> ). Generally a value of 0.4 is usable to rotate around XY screen axis inside the circular threshold area and to rotate around Z screen axis outside this area.

	:param X:
	:type X: int
	:param Y:
	:type Y: int
	:param zRotationThreshold: default value is 0.0
	:type zRotationThreshold: Quantity_Ratio
	:rtype: None
") StartRotation;
		void StartRotation (const Standard_Integer X,const Standard_Integer Y,const Quantity_Ratio zRotationThreshold = 0.0);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* Continues the rotation of the view with an angle computed from the last and new mouse position <X,Y>.

	:param X:
	:type X: int
	:param Y:
	:type Y: int
	:rtype: None
") Rotation;
		void Rotation (const Standard_Integer X,const Standard_Integer Y);
		%feature("compactdefaultargs") SetFocale;
		%feature("autodoc", "	* Change View Plane Distance for Perspective Views Warning! raises TypeMismatch from Standard if the view is not a perspective view.

	:param Focale:
	:type Focale: Quantity_Length
	:rtype: None
") SetFocale;
		void SetFocale (const Quantity_Length Focale);
		%feature("compactdefaultargs") Focale;
		%feature("autodoc", "	* Returns the View Plane Distance for Perspective Views

	:rtype: Quantity_Length
") Focale;
		Quantity_Length Focale ();
		%feature("compactdefaultargs") View;
		%feature("autodoc", "	* Returns the associated Visual3d view.

	:rtype: Handle_Visual3d_View
") View;
		Handle_Visual3d_View View ();
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "	* Switches computed HLR mode in the view

	:param aMode:
	:type aMode: bool
	:rtype: None
") SetComputedMode;
		void SetComputedMode (const Standard_Boolean aMode);
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "	* Returns the computed HLR mode state

	:rtype: bool
") ComputedMode;
		Standard_Boolean ComputedMode ();
		%feature("compactdefaultargs") WindowFitAll;
		%feature("autodoc", "	* idem than WindowFit

	:param Xmin:
	:type Xmin: int
	:param Ymin:
	:type Ymin: int
	:param Xmax:
	:type Xmax: int
	:param Ymax:
	:type Ymax: int
	:rtype: None
") WindowFitAll;
		void WindowFitAll (const Standard_Integer Xmin,const Standard_Integer Ymin,const Standard_Integer Xmax,const Standard_Integer Ymax);
		%feature("compactdefaultargs") SetGrid;
		%feature("autodoc", "	* Defines or Updates the definition of the grid in <self>

	:param aPlane:
	:type aPlane: gp_Ax3
	:param aGrid:
	:type aGrid: Handle_Aspect_Grid &
	:rtype: None
") SetGrid;
		void SetGrid (const gp_Ax3 & aPlane,const Handle_Aspect_Grid & aGrid);
		%feature("compactdefaultargs") SetGridGraphicValues;
		%feature("autodoc", "	* Defines or Updates the graphic definition of the grid in <self>

	:param aGrid:
	:type aGrid: Handle_Aspect_Grid &
	:rtype: None
") SetGridGraphicValues;
		void SetGridGraphicValues (const Handle_Aspect_Grid & aGrid);
		%feature("compactdefaultargs") SetGridActivity;
		%feature("autodoc", "	* Defines or Updates the activity of the grid in <self>

	:param aFlag:
	:type aFlag: bool
	:rtype: None
") SetGridActivity;
		void SetGridActivity (const Standard_Boolean aFlag);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* dump the full contents of the view at the same scale in the file <theFile>. The file name extension must be one of '.png','.bmp','.jpg','.gif'. Returns False when the dump has failed

	:param theFile:
	:type theFile: char *
	:param theBufferType: default value is Graphic3d_BT_RGB
	:type theBufferType: Graphic3d_BufferType &
	:rtype: bool
") Dump;
		Standard_Boolean Dump (const char * theFile,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB);
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "	* Dumps the full contents of the view to a pixmap of pixel size <theWidth> * <theHeight> and buffer type <theBufferType>. If <theToKeepAspect> is true the aspect ratio of view will be kept if <theWidth> and <theHeight> define another ratio. Pixmap will be automatically (re)allocated when needed. When dumping stereographic camera - the corresponding middle-point monographic projection will be used for dumping by default. <theStereoOptions> flags are to be used for dumping then left or right eye projections.

	:param theImage:
	:type theImage: Image_PixMap &
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theBufferType: default value is Graphic3d_BT_RGB
	:type theBufferType: Graphic3d_BufferType &
	:param theToKeepAspect: default value is Standard_True
	:type theToKeepAspect: bool
	:param theStereoOptions: default value is V3d_SDO_MONO
	:type theStereoOptions: V3d_StereoDumpOptions
	:rtype: bool
") ToPixMap;
		Standard_Boolean ToPixMap (Image_PixMap & theImage,const Standard_Integer theWidth,const Standard_Integer theHeight,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB,const Standard_Boolean theToKeepAspect = Standard_True,const V3d_StereoDumpOptions theStereoOptions = V3d_SDO_MONO);
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "	* Manages display of the back faces When <aModel> is TOBM_AUTOMATIC the object backfaces are displayed only for surface objects and never displayed for solid objects. this was the previous mode. <aModel> is TOBM_ALWAYS_DISPLAYED the object backfaces are always displayed both for surfaces or solids. <aModel> is TOBM_NEVER_DISPLAYED the object backfaces are never displayed.

	:param aModel: default value is V3d_TOBM_AUTOMATIC
	:type aModel: V3d_TypeOfBackfacingModel
	:rtype: None
") SetBackFacingModel;
		void SetBackFacingModel (const V3d_TypeOfBackfacingModel aModel = V3d_TOBM_AUTOMATIC);
		%feature("compactdefaultargs") BackFacingModel;
		%feature("autodoc", "	* Returns current state of the back faces display

	:rtype: V3d_TypeOfBackfacingModel
") BackFacingModel;
		V3d_TypeOfBackfacingModel BackFacingModel ();
		%feature("compactdefaultargs") EnableDepthTest;
		%feature("autodoc", "	* turns on/off opengl depth testing

	:param enable: default value is Standard_True
	:type enable: bool
	:rtype: None
") EnableDepthTest;
		void EnableDepthTest (const Standard_Boolean enable = Standard_True);
		%feature("compactdefaultargs") IsDepthTestEnabled;
		%feature("autodoc", "	* returns the current state of the depth testing

	:rtype: bool
") IsDepthTestEnabled;
		Standard_Boolean IsDepthTestEnabled ();
		%feature("compactdefaultargs") EnableGLLight;
		%feature("autodoc", "	* turns on/off opengl lighting, currently used in triedron displaying

	:param enable: default value is Standard_True
	:type enable: bool
	:rtype: None
") EnableGLLight;
		void EnableGLLight (const Standard_Boolean enable = Standard_True);
		%feature("compactdefaultargs") IsGLLightEnabled;
		%feature("autodoc", "	* returns the current state of the gl lighting currently used in triedron displaying

	:rtype: bool
") IsGLLightEnabled;
		Standard_Boolean IsGLLightEnabled ();
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "	* Adds clip plane to the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by PlaneLimit method of associated Visual3d_View. Please be aware that the planes which exceed the limit are ignored during rendering. @param thePlane [in] the clip plane to be added to view.

	:param thePlane:
	:type thePlane: Handle_Graphic3d_ClipPlane &
	:rtype: void
") AddClipPlane;
		virtual void AddClipPlane (const Handle_Graphic3d_ClipPlane & thePlane);
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "	* Removes clip plane from the view. @param thePlane [in] the clip plane to be removed from view.

	:param thePlane:
	:type thePlane: Handle_Graphic3d_ClipPlane &
	:rtype: void
") RemoveClipPlane;
		virtual void RemoveClipPlane (const Handle_Graphic3d_ClipPlane & thePlane);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Sets sequence of clip planes to the view. The planes that have been set before are removed from the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by PlaneLimit method of associated Visual3d_View. Please be aware that the planes which exceed the limit are ignored during rendering. @param thePlanes [in] the clip planes to set.

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") GetClipPlanes;
		%feature("autodoc", "	* Get clip planes. returns sequence clip planes that have been set for the view

	:rtype: Graphic3d_SequenceOfHClipPlane
") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	* Change camera used by view.

	:param theCamera:
	:type theCamera: Handle_Graphic3d_Camera &
	:rtype: None
") SetCamera;
		void SetCamera (const Handle_Graphic3d_Camera & theCamera);
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "	* Returns camera object of the view. returns: handle to camera object, or NULL if 3D view does not use the camera approach.

	:rtype: Handle_Graphic3d_Camera
") Camera;
		Handle_Graphic3d_Camera Camera ();
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "	* Returns current rendering parameters and effect settings.

	:rtype: Graphic3d_RenderingParams
") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams ();
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "	* Returns reference to current rendering parameters and effect settings.

	:rtype: Graphic3d_RenderingParams
") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams ();
		%feature("compactdefaultargs") IsCullingEnabled;
		%feature("autodoc", "	* returns flag value of objects culling mechanism

	:rtype: bool
") IsCullingEnabled;
		Standard_Boolean IsCullingEnabled ();
		%feature("compactdefaultargs") SetFrustumCulling;
		%feature("autodoc", "	* Turn on/off automatic culling of objects outside frustrum (ON by default)

	:param theMode:
	:type theMode: bool
	:rtype: None
") SetFrustumCulling;
		void SetFrustumCulling (const Standard_Boolean theMode);
};


%extend V3d_View {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_View(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_View::Handle_V3d_View %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_View* _get_reference() {
    return (V3d_View*)$self->Access();
    }
};

%extend Handle_V3d_View {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_Viewer;
class V3d_Viewer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "	* Create a Viewer with the given graphic driver and the given parameters or with their default values. Currently creating of more than 100 viewer instances is not supported and leads to an exception. This limitation might be addressed in some future OCCT releases. If the size of the view is <= 0 Warning: Client must creates a graphic driver

	:param theDriver:
	:type theDriver: Handle_Graphic3d_GraphicDriver &
	:param theName:
	:type theName: Standard_ExtString
	:param theDomain: default value is ""
	:type theDomain: char *
	:param theViewSize: default value is 1000.0
	:type theViewSize: Quantity_Length
	:param theViewProj: default value is V3d_XposYnegZpos
	:type theViewProj: V3d_TypeOfOrientation
	:param theViewBackground: default value is Quantity_NOC_GRAY30
	:type theViewBackground: Quantity_NameOfColor
	:param theVisualization: default value is V3d_ZBUFFER
	:type theVisualization: V3d_TypeOfVisualization
	:param theShadingModel: default value is V3d_GOURAUD
	:type theShadingModel: V3d_TypeOfShadingModel
	:param theUpdateMode: default value is V3d_WAIT
	:type theUpdateMode: V3d_TypeOfUpdate
	:param theComputedMode: default value is Standard_True
	:type theComputedMode: bool
	:param theDefaultComputedMode: default value is Standard_True
	:type theDefaultComputedMode: bool
	:param theSurfaceDetail: default value is V3d_TEX_NONE
	:type theSurfaceDetail: V3d_TypeOfSurfaceDetail
	:rtype: None
") V3d_Viewer;
		 V3d_Viewer (const Handle_Graphic3d_GraphicDriver & theDriver,const Standard_ExtString theName,const char * theDomain = "",const Quantity_Length theViewSize = 1000.0,const V3d_TypeOfOrientation theViewProj = V3d_XposYnegZpos,const Quantity_NameOfColor theViewBackground = Quantity_NOC_GRAY30,const V3d_TypeOfVisualization theVisualization = V3d_ZBUFFER,const V3d_TypeOfShadingModel theShadingModel = V3d_GOURAUD,const V3d_TypeOfUpdate theUpdateMode = V3d_WAIT,const Standard_Boolean theComputedMode = Standard_True,const Standard_Boolean theDefaultComputedMode = Standard_True,const V3d_TypeOfSurfaceDetail theSurfaceDetail = V3d_TEX_NONE);
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "	* creates a view in the viewer according to its default parameters.

	:rtype: Handle_V3d_View
") CreateView;
		Handle_V3d_View CreateView ();
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "	* Activates all of the views of a viewer attached to a window.

	:rtype: None
") SetViewOn;
		void SetViewOn ();
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "	* Activates a particular view in the Viewer . Must be call if the Window attached to the view has been Deiconified .

	:param View:
	:type View: Handle_V3d_View &
	:rtype: None
") SetViewOn;
		void SetViewOn (const Handle_V3d_View & View);
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "	* Deactivates all the views of a Viewer attached to a window.

	:rtype: None
") SetViewOff;
		void SetViewOff ();
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "	* Deactivates a particular view in the Viewer. Must be call if the Window attached to the view has been Iconified .

	:param View:
	:type View: Handle_V3d_View &
	:rtype: None
") SetViewOff;
		void SetViewOff (const Handle_V3d_View & View);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Deprecated, Redraw() should be used instead.

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "	* Updates the lights of all the views of a viewer.

	:rtype: None
") UpdateLights;
		void UpdateLights ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redraws all the views of the Viewer even if no modification has taken place. Must be called if all the views of the Viewer are exposed, as for example in a global DeIconification.

	:rtype: None
") Redraw;
		void Redraw ();
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Updates layer of immediate presentations.

	:rtype: None
") RedrawImmediate;
		void RedrawImmediate ();
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Invalidates viewer content but does not redraw it.

	:rtype: None
") Invalidate;
		void Invalidate ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppresses the Viewer.

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase all Objects in All the views.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* UnHighlight all Objects in All the views.

	:rtype: None
") UnHighlight;
		void UnHighlight ();
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "	* Defines the default base colour of views attached to the Viewer by supplying the type of colour definition and the three component values..

	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: Quantity_Parameter
	:param V2:
	:type V2: Quantity_Parameter
	:param V3:
	:type V3: Quantity_Parameter
	:rtype: None
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_TypeOfColor Type,const Quantity_Parameter V1,const Quantity_Parameter V2,const Quantity_Parameter V3);
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "	* Defines the default background colour of views attached to the viewer by supplying the name of the colour under the form Quantity_NOC_xxxx .

	:param Name:
	:type Name: Quantity_NameOfColor
	:rtype: None
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_NameOfColor Name);
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "	* Defines the default background colour of views attached to the viewer by supplying the color object

	:param Color:
	:type Color: Quantity_Color &
	:rtype: None
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_Color & Color);
		%feature("compactdefaultargs") SetDefaultBgGradientColors;
		%feature("autodoc", "	* Defines the default gradient background colours of view attached to the viewer by supplying the name of the colours under the form Quantity_NOC_xxxx .

	:param Name1:
	:type Name1: Quantity_NameOfColor
	:param Name2:
	:type Name2: Quantity_NameOfColor
	:param FillStyle: default value is Aspect_GFM_HOR
	:type FillStyle: Aspect_GradientFillMethod
	:rtype: None
") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors (const Quantity_NameOfColor Name1,const Quantity_NameOfColor Name2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR);
		%feature("compactdefaultargs") SetDefaultBgGradientColors;
		%feature("autodoc", "	* Defines the default gradient background colours of views attached to the viewer by supplying the colour objects

	:param Color1:
	:type Color1: Quantity_Color &
	:param Color2:
	:type Color2: Quantity_Color &
	:param FillStyle: default value is Aspect_GFM_HOR
	:type FillStyle: Aspect_GradientFillMethod
	:rtype: None
") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors (const Quantity_Color & Color1,const Quantity_Color & Color2,const Aspect_GradientFillMethod FillStyle = Aspect_GFM_HOR);
		%feature("compactdefaultargs") SetDefaultViewSize;
		%feature("autodoc", "	* Gives a default size for the creation of views of the viewer.

	:param Size:
	:type Size: Quantity_Length
	:rtype: None
") SetDefaultViewSize;
		void SetDefaultViewSize (const Quantity_Length Size);
		%feature("compactdefaultargs") SetDefaultViewProj;
		%feature("autodoc", "	* Gives the default projection for creating views in the viewer.

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: None
") SetDefaultViewProj;
		void SetDefaultViewProj (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") SetDefaultVisualization;
		%feature("autodoc", "	* Gives the default visualisation mode..

	:param Type:
	:type Type: V3d_TypeOfVisualization
	:rtype: None
") SetDefaultVisualization;
		void SetDefaultVisualization (const V3d_TypeOfVisualization Type);
		%feature("compactdefaultargs") SetZBufferManagment;
		%feature("autodoc", "	* defines the strategy concerning the ZBuffer activity. If Automatic is true, ZBuffer will be activated or deactivated depending on the fact that faces exist or not in the Viewer. This will optimize the response time in the case where only wireframe objects are displayed. If Automatic is False, ZBuffer will be activated or deactivated depending on the choice of SetVisualization in each View. Note that by default, the ZBufferManagment is not automatic.

	:param Automatic:
	:type Automatic: bool
	:rtype: None
") SetZBufferManagment;
		void SetZBufferManagment (const Standard_Boolean Automatic);
		%feature("compactdefaultargs") ZBufferManagment;
		%feature("autodoc", "	* returns the ZBuffer stategy choice.

	:rtype: bool
") ZBufferManagment;
		Standard_Boolean ZBufferManagment ();
		%feature("compactdefaultargs") SetDefaultShadingModel;
		%feature("autodoc", "	* Gives the default type of SHADING.

	:param Type:
	:type Type: V3d_TypeOfShadingModel
	:rtype: None
") SetDefaultShadingModel;
		void SetDefaultShadingModel (const V3d_TypeOfShadingModel Type);
		%feature("compactdefaultargs") SetDefaultSurfaceDetail;
		%feature("autodoc", "	* Gives the default type of texture mapping.

	:param Type:
	:type Type: V3d_TypeOfSurfaceDetail
	:rtype: None
") SetDefaultSurfaceDetail;
		void SetDefaultSurfaceDetail (const V3d_TypeOfSurfaceDetail Type);
		%feature("compactdefaultargs") SetDefaultAngle;
		%feature("autodoc", "	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:rtype: None
") SetDefaultAngle;
		void SetDefaultAngle (const Quantity_PlaneAngle Angle);
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "	* Defines the mode of regenerating the views making up the viewer. This can be immediate <ASAP> or deferred <WAIT>. In this latter case, the views are updated when the method Update(me) is called.

	:param Mode:
	:type Mode: V3d_TypeOfUpdate
	:rtype: None
") SetUpdateMode;
		void SetUpdateMode (const V3d_TypeOfUpdate Mode);
		%feature("compactdefaultargs") SetDefaultTypeOfView;
		%feature("autodoc", "	:param Type:
	:type Type: V3d_TypeOfView
	:rtype: None
") SetDefaultTypeOfView;
		void SetDefaultTypeOfView (const V3d_TypeOfView Type);
		%feature("compactdefaultargs") SetPrivilegedPlane;
		%feature("autodoc", "	:param aPlane:
	:type aPlane: gp_Ax3
	:rtype: None
") SetPrivilegedPlane;
		void SetPrivilegedPlane (const gp_Ax3 & aPlane);
		%feature("compactdefaultargs") PrivilegedPlane;
		%feature("autodoc", "	:rtype: gp_Ax3
") PrivilegedPlane;
		gp_Ax3 PrivilegedPlane ();
		%feature("compactdefaultargs") DisplayPrivilegedPlane;
		%feature("autodoc", "	:param OnOff:
	:type OnOff: bool
	:param aSize: default value is 1
	:type aSize: Quantity_Length
	:rtype: None
") DisplayPrivilegedPlane;
		void DisplayPrivilegedPlane (const Standard_Boolean OnOff,const Quantity_Length aSize = 1);
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates MyLight in the viewer.

	:param MyLight:
	:type MyLight: Handle_V3d_Light &
	:rtype: None
") SetLightOn;
		void SetLightOn (const Handle_V3d_Light & MyLight);
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates all the lights defined in this viewer.

	:rtype: None
") SetLightOn;
		void SetLightOn ();
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Desactivate MyLight in this viewer.

	:param MyLight:
	:type MyLight: Handle_V3d_Light &
	:rtype: None
") SetLightOff;
		void SetLightOff (const Handle_V3d_Light & MyLight);
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Deactivate all the Lights defined in this viewer.

	:rtype: None
") SetLightOff;
		void SetLightOff ();
		%feature("compactdefaultargs") DelLight;
		%feature("autodoc", "	* Delete Light in Sequence Of Lights.

	:param MyLight:
	:type MyLight: Handle_V3d_Light &
	:rtype: None
") DelLight;
		void DelLight (const Handle_V3d_Light & MyLight);
		%feature("compactdefaultargs") SetCurrentSelectedLight;
		%feature("autodoc", "	* Defines the selected light.

	:param TheLight:
	:type TheLight: Handle_V3d_Light &
	:rtype: None
") SetCurrentSelectedLight;
		void SetCurrentSelectedLight (const Handle_V3d_Light & TheLight);
		%feature("compactdefaultargs") ClearCurrentSelectedLight;
		%feature("autodoc", "	* Defines the selected light at NULL.

	:rtype: None
") ClearCurrentSelectedLight;
		void ClearCurrentSelectedLight ();
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "	* Returns the default background colour depending of the type.

	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: Quantity_Parameter &
	:param V2:
	:type V2: Quantity_Parameter &
	:param V3:
	:type V3: Quantity_Parameter &
	:rtype: None
") DefaultBackgroundColor;
		void DefaultBackgroundColor (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "	* Returns the default background colour object.

	:rtype: Quantity_Color
") DefaultBackgroundColor;
		Quantity_Color DefaultBackgroundColor ();
		%feature("compactdefaultargs") DefaultBgGradientColors;
		%feature("autodoc", "	* Returns the gradient background colour objects of the view.

	:param Color1:
	:type Color1: Quantity_Color &
	:param Color2:
	:type Color2: Quantity_Color &
	:rtype: None
") DefaultBgGradientColors;
		void DefaultBgGradientColors (Quantity_Color & Color1,Quantity_Color & Color2);
		%feature("compactdefaultargs") DefaultViewSize;
		%feature("autodoc", "	* Returns the default size of the view.

	:rtype: Quantity_Length
") DefaultViewSize;
		Quantity_Length DefaultViewSize ();
		%feature("compactdefaultargs") DefaultViewProj;
		%feature("autodoc", "	* Returns the default Projection.

	:rtype: V3d_TypeOfOrientation
") DefaultViewProj;
		V3d_TypeOfOrientation DefaultViewProj ();
		%feature("compactdefaultargs") DefaultVisualization;
		%feature("autodoc", "	* Returns the default type of Visualization.

	:rtype: V3d_TypeOfVisualization
") DefaultVisualization;
		V3d_TypeOfVisualization DefaultVisualization ();
		%feature("compactdefaultargs") DefaultShadingModel;
		%feature("autodoc", "	* Returns the default type of Shading

	:rtype: V3d_TypeOfShadingModel
") DefaultShadingModel;
		V3d_TypeOfShadingModel DefaultShadingModel ();
		%feature("compactdefaultargs") DefaultSurfaceDetail;
		%feature("autodoc", "	* Returns the default type of texture mapping

	:rtype: V3d_TypeOfSurfaceDetail
") DefaultSurfaceDetail;
		V3d_TypeOfSurfaceDetail DefaultSurfaceDetail ();
		%feature("compactdefaultargs") DefaultAngle;
		%feature("autodoc", "	:rtype: Quantity_PlaneAngle
") DefaultAngle;
		Quantity_PlaneAngle DefaultAngle ();
		%feature("compactdefaultargs") UpdateMode;
		%feature("autodoc", "	* Returns the regeneration mode of views in the viewer.

	:rtype: V3d_TypeOfUpdate
") UpdateMode;
		V3d_TypeOfUpdate UpdateMode ();
		%feature("compactdefaultargs") IfMoreViews;
		%feature("autodoc", "	* Returns True if One View more can be activated in this Viewer.

	:rtype: bool
") IfMoreViews;
		Standard_Boolean IfMoreViews ();
		%feature("compactdefaultargs") InitActiveViews;
		%feature("autodoc", "	* initializes an iteration on the active views.

	:rtype: None
") InitActiveViews;
		void InitActiveViews ();
		%feature("compactdefaultargs") MoreActiveViews;
		%feature("autodoc", "	* returns true if there are more active view(s) to return.

	:rtype: bool
") MoreActiveViews;
		Standard_Boolean MoreActiveViews ();
		%feature("compactdefaultargs") NextActiveViews;
		%feature("autodoc", "	* Go to the next active view (if there is not, ActiveView will raise an exception)

	:rtype: None
") NextActiveViews;
		void NextActiveViews ();
		%feature("compactdefaultargs") ActiveView;
		%feature("autodoc", "	:rtype: Handle_V3d_View
") ActiveView;
		Handle_V3d_View ActiveView ();
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "	* returns true if there is only one active view.

	:rtype: bool
") LastActiveView;
		Standard_Boolean LastActiveView ();
		%feature("compactdefaultargs") InitDefinedViews;
		%feature("autodoc", "	* initializes an iteration on the Defined views.

	:rtype: None
") InitDefinedViews;
		void InitDefinedViews ();
		%feature("compactdefaultargs") MoreDefinedViews;
		%feature("autodoc", "	* returns true if there are more Defined view(s) to return.

	:rtype: bool
") MoreDefinedViews;
		Standard_Boolean MoreDefinedViews ();
		%feature("compactdefaultargs") NextDefinedViews;
		%feature("autodoc", "	* Go to the next Defined view (if there is not, DefinedView will raise an exception)

	:rtype: None
") NextDefinedViews;
		void NextDefinedViews ();
		%feature("compactdefaultargs") DefinedView;
		%feature("autodoc", "	:rtype: Handle_V3d_View
") DefinedView;
		Handle_V3d_View DefinedView ();
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "	* initializes an iteration on the active Lights.

	:rtype: None
") InitActiveLights;
		void InitActiveLights ();
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "	* returns true if there are more active Light(s) to return.

	:rtype: bool
") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "	* Go to the next active Light (if there is not, ActiveLight will raise an exception)

	:rtype: None
") NextActiveLights;
		void NextActiveLights ();
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "	:rtype: Handle_V3d_Light
") ActiveLight;
		Handle_V3d_Light ActiveLight ();
		%feature("compactdefaultargs") InitDefinedLights;
		%feature("autodoc", "	* initializes an iteration on the Defined Lights.

	:rtype: None
") InitDefinedLights;
		void InitDefinedLights ();
		%feature("compactdefaultargs") MoreDefinedLights;
		%feature("autodoc", "	* returns true if there are more Defined Light(s) to return.

	:rtype: bool
") MoreDefinedLights;
		Standard_Boolean MoreDefinedLights ();
		%feature("compactdefaultargs") NextDefinedLights;
		%feature("autodoc", "	* Go to the next Defined Light (if there is not, DefinedLight will raise an exception)

	:rtype: None
") NextDefinedLights;
		void NextDefinedLights ();
		%feature("compactdefaultargs") DefinedLight;
		%feature("autodoc", "	:rtype: Handle_V3d_Light
") DefinedLight;
		Handle_V3d_Light DefinedLight ();
		%feature("compactdefaultargs") Viewer;
		%feature("autodoc", "	* Returns the viewer associated to Visual3d .

	:rtype: Handle_Visual3d_ViewManager
") Viewer;
		Handle_Visual3d_ViewManager Viewer ();
		%feature("compactdefaultargs") CurrentSelectedLight;
		%feature("autodoc", "	* Returns the Selected Light.

	:rtype: Handle_V3d_Light
") CurrentSelectedLight;
		Handle_V3d_Light CurrentSelectedLight ();
		%feature("compactdefaultargs") IsGlobalLight;
		%feature("autodoc", "	:param TheLight:
	:type TheLight: Handle_V3d_Light &
	:rtype: bool
") IsGlobalLight;
		Standard_Boolean IsGlobalLight (const Handle_V3d_Light & TheLight);
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "	* returns true if the computed mode can be used.

	:rtype: bool
") ComputedMode;
		Standard_Boolean ComputedMode ();
		%feature("compactdefaultargs") DefaultComputedMode;
		%feature("autodoc", "	* returns true if by default the computed mode must be used.

	:rtype: bool
") DefaultComputedMode;
		Standard_Boolean DefaultComputedMode ();
		%feature("compactdefaultargs") ActivateGrid;
		%feature("autodoc", "	* Activates the grid in all views of <self>.

	:param aGridType:
	:type aGridType: Aspect_GridType
	:param aGridDrawMode:
	:type aGridDrawMode: Aspect_GridDrawMode
	:rtype: None
") ActivateGrid;
		void ActivateGrid (const Aspect_GridType aGridType,const Aspect_GridDrawMode aGridDrawMode);
		%feature("compactdefaultargs") DeactivateGrid;
		%feature("autodoc", "	* Deactivates the grid in all views of <self>.

	:rtype: None
") DeactivateGrid;
		void DeactivateGrid ();
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "	* Show/Don't show grid echo to the hit point. If True,the grid echo will be shown at ConvertToGrid() time.

	:param showGrid: default value is Standard_True
	:type showGrid: bool
	:rtype: None
") SetGridEcho;
		void SetGridEcho (const Standard_Boolean showGrid = Standard_True);
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "	* Show grid echo <aMarker> to the hit point. Warning: When the grid echo marker is not set, a default marker is build with the attributes: marker type : Aspect_TOM_STAR marker color : Quantity_NOC_GRAY90 marker size : 3.0

	:param aMarker:
	:type aMarker: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetGridEcho;
		void SetGridEcho (const Handle_Graphic3d_AspectMarker3d & aMarker);
		%feature("compactdefaultargs") GridEcho;
		%feature("autodoc", "	* Returns True when grid echo must be displayed at hit point.

	:rtype: bool
") GridEcho;
		Standard_Boolean GridEcho ();
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	* Returns Standard_True if a grid is activated in <self>.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("compactdefaultargs") Grid;
		%feature("autodoc", "	* Returns the defined grid in <self>.

	:rtype: Handle_Aspect_Grid
") Grid;
		Handle_Aspect_Grid Grid ();
		%feature("compactdefaultargs") GridType;
		%feature("autodoc", "	* Returns the current grid type defined in <self>.

	:rtype: Aspect_GridType
") GridType;
		Aspect_GridType GridType ();
		%feature("compactdefaultargs") GridDrawMode;
		%feature("autodoc", "	* Returns the current grid draw mode defined in <self>.

	:rtype: Aspect_GridDrawMode
") GridDrawMode;
		Aspect_GridDrawMode GridDrawMode ();
		%feature("compactdefaultargs") RectangularGridValues;
		%feature("autodoc", "	* Returns the definition of the rectangular grid.

	:param XOrigin:
	:type XOrigin: Quantity_Length &
	:param YOrigin:
	:type YOrigin: Quantity_Length &
	:param XStep:
	:type XStep: Quantity_Length &
	:param YStep:
	:type YStep: Quantity_Length &
	:param RotationAngle:
	:type RotationAngle: Quantity_PlaneAngle &
	:rtype: None
") RectangularGridValues;
		void RectangularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Quantity_PlaneAngle & RotationAngle);
		%feature("compactdefaultargs") SetRectangularGridValues;
		%feature("autodoc", "	* Sets the definition of the rectangular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <XStep> defines the interval between 2 vertical lines. <YStep> defines the interval between 2 horizontal lines. <RotationAngle> defines the rotation angle of the grid.

	:param XOrigin:
	:type XOrigin: Quantity_Length
	:param YOrigin:
	:type YOrigin: Quantity_Length
	:param XStep:
	:type XStep: Quantity_Length
	:param YStep:
	:type YStep: Quantity_Length
	:param RotationAngle:
	:type RotationAngle: Quantity_PlaneAngle
	:rtype: None
") SetRectangularGridValues;
		void SetRectangularGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length XStep,const Quantity_Length YStep,const Quantity_PlaneAngle RotationAngle);
		%feature("compactdefaultargs") CircularGridValues;
		%feature("autodoc", "	* Returns the definition of the circular grid.

	:param XOrigin:
	:type XOrigin: Quantity_Length &
	:param YOrigin:
	:type YOrigin: Quantity_Length &
	:param RadiusStep:
	:type RadiusStep: Quantity_Length &
	:param DivisionNumber:
	:type DivisionNumber: int &
	:param RotationAngle:
	:type RotationAngle: Quantity_PlaneAngle &
	:rtype: None
") CircularGridValues;
		void CircularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Quantity_PlaneAngle & RotationAngle);
		%feature("compactdefaultargs") SetCircularGridValues;
		%feature("autodoc", "	* Sets the definition of the circular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <RadiusStep> defines the interval between 2 circles. <DivisionNumber> defines the section number of one half circle. <RotationAngle> defines the rotation angle of the grid.

	:param XOrigin:
	:type XOrigin: Quantity_Length
	:param YOrigin:
	:type YOrigin: Quantity_Length
	:param RadiusStep:
	:type RadiusStep: Quantity_Length
	:param DivisionNumber:
	:type DivisionNumber: int
	:param RotationAngle:
	:type RotationAngle: Quantity_PlaneAngle
	:rtype: None
") SetCircularGridValues;
		void SetCircularGridValues (const Quantity_Length XOrigin,const Quantity_Length YOrigin,const Quantity_Length RadiusStep,const Standard_Integer DivisionNumber,const Quantity_PlaneAngle RotationAngle);
		%feature("compactdefaultargs") CircularGridGraphicValues;
		%feature("autodoc", "	* Returns the location and the size of the grid.

	:param Radius:
	:type Radius: Quantity_Length &
	:param OffSet:
	:type OffSet: Quantity_Length &
	:rtype: None
") CircularGridGraphicValues;
		void CircularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetCircularGridGraphicValues;
		%feature("autodoc", "	* Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.

	:param Radius:
	:type Radius: Quantity_Length
	:param OffSet:
	:type OffSet: Quantity_Length
	:rtype: None
") SetCircularGridGraphicValues;
		void SetCircularGridGraphicValues (const Quantity_Length Radius,const Quantity_Length OffSet);
		%feature("compactdefaultargs") RectangularGridGraphicValues;
		%feature("autodoc", "	* Returns the location and the size of the grid.

	:param XSize:
	:type XSize: Quantity_Length &
	:param YSize:
	:type YSize: Quantity_Length &
	:param OffSet:
	:type OffSet: Quantity_Length &
	:rtype: None
") RectangularGridGraphicValues;
		void RectangularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetRectangularGridGraphicValues;
		%feature("autodoc", "	* Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.

	:param XSize:
	:type XSize: Quantity_Length
	:param YSize:
	:type YSize: Quantity_Length
	:param OffSet:
	:type OffSet: Quantity_Length
	:rtype: None
") SetRectangularGridGraphicValues;
		void SetRectangularGridGraphicValues (const Quantity_Length XSize,const Quantity_Length YSize,const Quantity_Length OffSet);
		%feature("compactdefaultargs") GetGradientBackground;
		%feature("autodoc", "	* Returns the gradient background of the view.

	:rtype: Aspect_GradientBackground
") GetGradientBackground;
		Aspect_GradientBackground GetGradientBackground ();
		%feature("compactdefaultargs") SetDefaultLights;
		%feature("autodoc", "	* defines default lights - positional-light 0.3 0. 0. directional-light V3d_XnegYposZpos directional-light V3d_XnegYneg ambient-light

	:rtype: None
") SetDefaultLights;
		void SetDefaultLights ();
		%feature("compactdefaultargs") ShowGridEcho;
		%feature("autodoc", "	* Display grid echo at requested point in the view.

	:param theView:
	:type theView: Handle_V3d_View &
	:param thePoint:
	:type thePoint: Graphic3d_Vertex &
	:rtype: None
") ShowGridEcho;
		void ShowGridEcho (const Handle_V3d_View & theView,const Graphic3d_Vertex & thePoint);
		%feature("compactdefaultargs") HideGridEcho;
		%feature("autodoc", "	* Temporarly hide grid echo.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") HideGridEcho;
		void HideGridEcho (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer.

	:param theLayerId:
	:type theLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings &
	:rtype: None
") SetZLayerSettings;
		void SetZLayerSettings (const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings & theSettings);
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: int
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		Graphic3d_ZLayerSettings ZLayerSettings (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. The method returns Standard_False if the layer can not be created. The layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theLayerId:
	:type theLayerId: int &
	:rtype: bool
") AddZLayer;
		Standard_Boolean AddZLayer (Standard_Integer &OutValue);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there are always default bottom-level layer that can't be removed.

	:param theLayerId:
	:type theLayerId: int
	:rtype: bool
") RemoveZLayer;
		Standard_Boolean RemoveZLayer (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "	* Return all Z layer ids in sequence ordered by overlay level from lowest layer to highest ( foreground ). The first layer ID in sequence is the default layer that can't be removed.

	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger &
	:rtype: None
") GetAllZLayers;
		void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("compactdefaultargs") Driver;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_GraphicDriver
") Driver;
		Handle_Graphic3d_GraphicDriver Driver ();
		%feature("compactdefaultargs") NextName;
		%feature("autodoc", "	:rtype: Standard_ExtString
") NextName;
		Standard_ExtString NextName ();
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "	:rtype: char *
") Domain;
		const char * Domain ();
};


%extend V3d_Viewer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_Viewer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_Viewer::Handle_V3d_Viewer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_Viewer* _get_reference() {
    return (V3d_Viewer*)$self->Access();
    }
};

%extend Handle_V3d_Viewer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_Viewer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_AmbientLight;
class V3d_AmbientLight : public V3d_Light {
	public:
		%feature("compactdefaultargs") V3d_AmbientLight;
		%feature("autodoc", "	* Constructs an ambient light source in the viewer VM. The default Color of this light source is WHITE.

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param Color: default value is Quantity_NOC_WHITE
	:type Color: Quantity_NameOfColor
	:rtype: None
") V3d_AmbientLight;
		 V3d_AmbientLight (const Handle_V3d_Viewer & VM,const Quantity_NameOfColor Color = Quantity_NOC_WHITE);
};


%extend V3d_AmbientLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_AmbientLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_AmbientLight::Handle_V3d_AmbientLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_AmbientLight* _get_reference() {
    return (V3d_AmbientLight*)$self->Access();
    }
};

%extend Handle_V3d_AmbientLight {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_AmbientLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_PositionLight;
class V3d_PositionLight : public V3d_Light {
	public:
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Defines the position of the light source. Should be redefined!

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:rtype: void
") SetPosition;
		virtual void SetPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("compactdefaultargs") SetTarget;
		%feature("autodoc", "	* Defines the target of the light (the center of the sphere)

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:rtype: None
") SetTarget;
		void SetTarget (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Define the radius.

	:param Radius:
	:type Radius: Quantity_Parameter
	:rtype: None
") SetRadius;
		void SetRadius (const Quantity_Parameter Radius);
		%feature("compactdefaultargs") OnHideFace;
		%feature("autodoc", "	* Calculate the position of the light, on the hide face of the picking sphere.

	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") OnHideFace;
		void OnHideFace (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") OnSeeFace;
		%feature("autodoc", "	* Calculate the position of the light, on the seen face of the picking sphere.

	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") OnSeeFace;
		void OnSeeFace (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") Tracking;
		%feature("autodoc", "	* Tracking the light position, or the light space, or the radius of the light space, that depends of initial picking 'WhatPick' (see the pick method). If WhatPick is SPACELIGHT, then the parameters Xpix, Ypix are the coordinates of a translation vector.

	:param aView:
	:type aView: Handle_V3d_View &
	:param WathPick:
	:type WathPick: V3d_TypeOfPickLight
	:param Xpix:
	:type Xpix: int
	:param Ypix:
	:type Ypix: int
	:rtype: None
") Tracking;
		void Tracking (const Handle_V3d_View & aView,const V3d_TypeOfPickLight WathPick,const Standard_Integer Xpix,const Standard_Integer Ypix);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the choosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The light source, the light space and the radius of light space are displayed. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param aView:
	:type aView: Handle_V3d_View &
	:param Representation: default value is V3d_SIMPLE
	:type Representation: V3d_TypeOfRepresentation
	:rtype: void
") Display;
		virtual void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation = V3d_SIMPLE);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase the graphic structure of light source.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the radius of the picking sphere.

	:rtype: Quantity_Parameter
") Radius;
		Quantity_Parameter Radius ();
		%feature("compactdefaultargs") SeeOrHide;
		%feature("autodoc", "	* Returns the visibility status If True the source is visible. If False it's hidden.

	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: bool
") SeeOrHide;
		Standard_Boolean SeeOrHide (const Handle_V3d_View & aView);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the light source.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: void
") Position;
		virtual void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Target;
		%feature("autodoc", "	* Returns the position of the target of the light source.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") Target;
		void Target (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend V3d_PositionLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_PositionLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_PositionLight::Handle_V3d_PositionLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_PositionLight* _get_reference() {
    return (V3d_PositionLight*)$self->Access();
    }
};

%extend Handle_V3d_PositionLight {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_PositionLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_DirectionalLight;
class V3d_DirectionalLight : public V3d_PositionLight {
	public:
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "	* Creates a directional light source in the viewer.

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param Direction: default value is V3d_XposYposZpos
	:type Direction: V3d_TypeOfOrientation
	:param Color: default value is Quantity_NOC_WHITE
	:type Color: Quantity_NameOfColor
	:param Headlight: default value is Standard_False
	:type Headlight: bool
	:rtype: None
") V3d_DirectionalLight;
		 V3d_DirectionalLight (const Handle_V3d_Viewer & VM,const V3d_TypeOfOrientation Direction = V3d_XposYposZpos,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Standard_Boolean Headlight = Standard_False);
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "	* Creates a directional light source in the viewer. Xt,Yt,Zt : Coordinate of light source Target. Xp,Yp,Zp : Coordinate of light source Position. The others parameters describe before.

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param Xt:
	:type Xt: V3d_Coordinate
	:param Yt:
	:type Yt: V3d_Coordinate
	:param Zt:
	:type Zt: V3d_Coordinate
	:param Xp:
	:type Xp: V3d_Coordinate
	:param Yp:
	:type Yp: V3d_Coordinate
	:param Zp:
	:type Zp: V3d_Coordinate
	:param Color: default value is Quantity_NOC_WHITE
	:type Color: Quantity_NameOfColor
	:param Headlight: default value is Standard_False
	:type Headlight: bool
	:rtype: None
") V3d_DirectionalLight;
		 V3d_DirectionalLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate Xt,const V3d_Coordinate Yt,const V3d_Coordinate Zt,const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Standard_Boolean Headlight = Standard_False);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source by a predefined orientation.

	:param Direction:
	:type Direction: V3d_TypeOfOrientation
	:rtype: None
") SetDirection;
		void SetDirection (const V3d_TypeOfOrientation Direction);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source by the predefined vector Xm,Ym,Zm. Warning: raises BadValue from V3d if the vector is null.

	:param Xm:
	:type Xm: Quantity_Parameter
	:param Ym:
	:type Ym: Quantity_Parameter
	:param Zm:
	:type Zm: Quantity_Parameter
	:rtype: None
") SetDirection;
		void SetDirection (const Quantity_Parameter Xm,const Quantity_Parameter Ym,const Quantity_Parameter Zm);
		%feature("compactdefaultargs") SetDisplayPosition;
		%feature("autodoc", "	* Defines the point of light source representation.

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:rtype: None
") SetDisplayPosition;
		void SetDisplayPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Calls SetDisplayPosition method.

	:param Xp:
	:type Xp: V3d_Coordinate
	:param Yp:
	:type Yp: V3d_Coordinate
	:param Zp:
	:type Zp: V3d_Coordinate
	:rtype: void
") SetPosition;
		virtual void SetPosition (const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the choosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The same representation as PARTIAL. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param aView:
	:type aView: Handle_V3d_View &
	:param Representation:
	:type Representation: V3d_TypeOfRepresentation
	:rtype: None
") Display;
		void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Calls DisplayPosition method.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: void
") Position;
		virtual void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DisplayPosition;
		%feature("autodoc", "	* Returns the choosen position to represent the light source.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") DisplayPosition;
		void DisplayPosition (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the Vx,Vy,Vz direction of the light source.

	:param Vx:
	:type Vx: Quantity_Parameter &
	:param Vy:
	:type Vy: Quantity_Parameter &
	:param Vz:
	:type Vz: Quantity_Parameter &
	:rtype: None
") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend V3d_DirectionalLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_DirectionalLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_DirectionalLight::Handle_V3d_DirectionalLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_DirectionalLight* _get_reference() {
    return (V3d_DirectionalLight*)$self->Access();
    }
};

%extend Handle_V3d_DirectionalLight {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_DirectionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_PositionalLight;
class V3d_PositionalLight : public V3d_PositionLight {
	public:
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "	* Creates an isolated light source X,Y,Z in the viewer. It is also defined by the color Color and two attenuation factors Attenuation1, Attenuation2. The resulting attenuation factor determining the illumination of a surface depends on the following formula : F = 1/(A1 + A2*Length) A1,A2 being the two factors of attenuation Length is the distance of the isolated source from the surface. Warning! raises BadValue from V3d if one of the attenuation coefficients is not between 0 et 1.

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Color: default value is Quantity_NOC_WHITE
	:type Color: Quantity_NameOfColor
	:param Attenuation1: default value is 1.0
	:type Attenuation1: Quantity_Coefficient
	:param Attenuation2: default value is 0.0
	:type Attenuation2: Quantity_Coefficient
	:rtype: None
") V3d_PositionalLight;
		 V3d_PositionalLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0);
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "	* Creates a light source of the Positional type in the viewer. Xt,Yt,Zt : Coordinate of Target light source. Xp,Yp,Zp : Coordinate of Position light source. The light source is also defined by the color Color and two attenuation factors Attenuation1, Attenuation2 that determine the illumination of a surface using the following formula : F = 1/(A1 + A2*Length) where: - A1,A2 are the two attenuation factors, and - Length is the distance from the isolated source. Warning! raises BadValue from V3d if one of the attenuation coefficients is not between 0 et 1.

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param Xt:
	:type Xt: V3d_Coordinate
	:param Yt:
	:type Yt: V3d_Coordinate
	:param Zt:
	:type Zt: V3d_Coordinate
	:param Xp:
	:type Xp: V3d_Coordinate
	:param Yp:
	:type Yp: V3d_Coordinate
	:param Zp:
	:type Zp: V3d_Coordinate
	:param Color: default value is Quantity_NOC_WHITE
	:type Color: Quantity_NameOfColor
	:param Attenuation1: default value is 1.0
	:type Attenuation1: Quantity_Coefficient
	:param Attenuation2: default value is 0.0
	:type Attenuation2: Quantity_Coefficient
	:rtype: None
") V3d_PositionalLight;
		 V3d_PositionalLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate Xt,const V3d_Coordinate Yt,const V3d_Coordinate Zt,const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Defines the position of the light source.

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:rtype: void
") SetPosition;
		virtual void SetPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("compactdefaultargs") SetAttenuation;
		%feature("autodoc", "	* Defines the attenuation factors. Warning: raises BadValue from V3d if one of the attenuation coefficients is not between 0 et 1.

	:param A1:
	:type A1: Quantity_Coefficient
	:param A2:
	:type A2: Quantity_Coefficient
	:rtype: None
") SetAttenuation;
		void SetAttenuation (const Quantity_Coefficient A1,const Quantity_Coefficient A2);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the choosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The light source, the light space and the radius of light space are displayed. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param aView:
	:type aView: Handle_V3d_View &
	:param Representation:
	:type Representation: V3d_TypeOfRepresentation
	:rtype: None
") Display;
		void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the light source.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") Position;
		void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "	* Returns the attenuation factors A1,A2 of the light source used at construction time.

	:param A1:
	:type A1: Quantity_Coefficient &
	:param A2:
	:type A2: Quantity_Coefficient &
	:rtype: None
") Attenuation;
		void Attenuation (Quantity_Coefficient & A1,Quantity_Coefficient & A2);
};


%extend V3d_PositionalLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_PositionalLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_PositionalLight::Handle_V3d_PositionalLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_PositionalLight* _get_reference() {
    return (V3d_PositionalLight*)$self->Access();
    }
};

%extend Handle_V3d_PositionalLight {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_PositionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_SpotLight;
class V3d_SpotLight : public V3d_PositionLight {
	public:
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "	* Creates a light source of the Spot type in the viewer. The attenuation factor F which determines the illumination of a surface depends on the following formula : F = 1/(A1 + A2*Length) A1,A2 being the 2 factors of attenuation Length is the distance from the source to the surface. The default values (1.0,0.0) correspond to a minimum of attenuation . The concentration factor determines the dispersion of the light on the surface, the default value (1.0) corresponds to a minimum of dispersion . Warning! raises BadValue from V3d - If one of the coefficients is not between 0 and 1 . If the lighting angle is <= 0 ou > PI .

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:param Direction: default value is V3d_XnegYnegZpos
	:type Direction: V3d_TypeOfOrientation
	:param Color: default value is Quantity_NOC_WHITE
	:type Color: Quantity_NameOfColor
	:param Attenuation1: default value is 1.0
	:type Attenuation1: Quantity_Coefficient
	:param Attenuation2: default value is 0.0
	:type Attenuation2: Quantity_Coefficient
	:param Concentration: default value is 1.0
	:type Concentration: Quantity_Coefficient
	:param Angle: default value is 0.523599
	:type Angle: Quantity_PlaneAngle
	:rtype: None
") V3d_SpotLight;
		 V3d_SpotLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z,const V3d_TypeOfOrientation Direction = V3d_XnegYnegZpos,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0,const Quantity_Coefficient Concentration = 1.0,const Quantity_PlaneAngle Angle = 0.523599);
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "	* Creates a light source of the Spot type in the viewer. Xt,Yt,Zt : Coordinate of light source Target. Xp,Yp,Zp : Coordinate of light source Position. The others parameters describe before. Warning! raises BadValue from V3d - If one of the coefficients is not between 0 and 1 . If the lighting angle is <= 0 ou > PI .

	:param VM:
	:type VM: Handle_V3d_Viewer &
	:param Xt:
	:type Xt: V3d_Coordinate
	:param Yt:
	:type Yt: V3d_Coordinate
	:param Zt:
	:type Zt: V3d_Coordinate
	:param Xp:
	:type Xp: V3d_Coordinate
	:param Yp:
	:type Yp: V3d_Coordinate
	:param Zp:
	:type Zp: V3d_Coordinate
	:param Color: default value is Quantity_NOC_WHITE
	:type Color: Quantity_NameOfColor
	:param Attenuation1: default value is 1.0
	:type Attenuation1: Quantity_Coefficient
	:param Attenuation2: default value is 0.0
	:type Attenuation2: Quantity_Coefficient
	:param Concentration: default value is 1.0
	:type Concentration: Quantity_Coefficient
	:param Angle: default value is 0.523599
	:type Angle: Quantity_PlaneAngle
	:rtype: None
") V3d_SpotLight;
		 V3d_SpotLight (const Handle_V3d_Viewer & VM,const V3d_Coordinate Xt,const V3d_Coordinate Yt,const V3d_Coordinate Zt,const V3d_Coordinate Xp,const V3d_Coordinate Yp,const V3d_Coordinate Zp,const Quantity_NameOfColor Color = Quantity_NOC_WHITE,const Quantity_Coefficient Attenuation1 = 1.0,const Quantity_Coefficient Attenuation2 = 0.0,const Quantity_Coefficient Concentration = 1.0,const Quantity_PlaneAngle Angle = 0.523599);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Defines the position of the light source.

	:param X:
	:type X: V3d_Coordinate
	:param Y:
	:type Y: V3d_Coordinate
	:param Z:
	:type Z: V3d_Coordinate
	:rtype: void
") SetPosition;
		virtual void SetPosition (const V3d_Coordinate X,const V3d_Coordinate Y,const V3d_Coordinate Z);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source. If the normal vector is NULL.

	:param Vx:
	:type Vx: Quantity_Parameter
	:param Vy:
	:type Vy: Quantity_Parameter
	:param Vz:
	:type Vz: Quantity_Parameter
	:rtype: None
") SetDirection;
		void SetDirection (const Quantity_Parameter Vx,const Quantity_Parameter Vy,const Quantity_Parameter Vz);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source according to a predefined directional vector.

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: None
") SetDirection;
		void SetDirection (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") SetAttenuation;
		%feature("autodoc", "	* Defines the coefficients of attenuation. Warning! raises BadValue from V3d if one of the coefficient is <0 ou >1 .

	:param A1:
	:type A1: Quantity_Coefficient
	:param A2:
	:type A2: Quantity_Coefficient
	:rtype: None
") SetAttenuation;
		void SetAttenuation (const Quantity_Coefficient A1,const Quantity_Coefficient A2);
		%feature("compactdefaultargs") SetConcentration;
		%feature("autodoc", "	* Defines the coefficient of concentration. if the coefficient is <0 ou >1 .

	:param C:
	:type C: Quantity_Coefficient
	:rtype: None
") SetConcentration;
		void SetConcentration (const Quantity_Coefficient C);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Defines the spot angle in RADIANS. Warning: raises BadValue from from V3d If the angle is <= 0 ou > PI .

	:param Angle:
	:type Angle: Quantity_PlaneAngle
	:rtype: None
") SetAngle;
		void SetAngle (const Quantity_PlaneAngle Angle);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the choosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The light source, the light space and the radius of light space are displayed. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param aView:
	:type aView: Handle_V3d_View &
	:param Representation:
	:type Representation: V3d_TypeOfRepresentation
	:rtype: None
") Display;
		void Display (const Handle_V3d_View & aView,const V3d_TypeOfRepresentation Representation);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the direction of the light source defined by Vx,Vy,Vz.

	:param Vx:
	:type Vx: Quantity_Parameter &
	:param Vy:
	:type Vy: Quantity_Parameter &
	:param Vz:
	:type Vz: Quantity_Parameter &
	:rtype: None
") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the light source.

	:param X:
	:type X: V3d_Coordinate &
	:param Y:
	:type Y: V3d_Coordinate &
	:param Z:
	:type Z: V3d_Coordinate &
	:rtype: None
") Position;
		void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "	* Returns the attenuation factors A1,A2 of the light source.

	:param A1:
	:type A1: Quantity_Coefficient &
	:param A2:
	:type A2: Quantity_Coefficient &
	:rtype: None
") Attenuation;
		void Attenuation (Quantity_Coefficient & A1,Quantity_Coefficient & A2);
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "	:rtype: Quantity_Coefficient
") Concentration;
		Quantity_Coefficient Concentration ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns the spot angle.

	:rtype: Quantity_PlaneAngle
") Angle;
		Quantity_PlaneAngle Angle ();
};


%extend V3d_SpotLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_SpotLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_SpotLight::Handle_V3d_SpotLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    V3d_SpotLight* _get_reference() {
    return (V3d_SpotLight*)$self->Access();
    }
};

%extend Handle_V3d_SpotLight {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend V3d_SpotLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
