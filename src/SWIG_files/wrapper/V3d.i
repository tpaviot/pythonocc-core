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
%define V3DDOCSTRING
"V3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_v3d.html"
%enddef
%module (package="OCC.Core", docstring=V3DDOCSTRING) V3d


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
#include<V3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<Quantity_module.hxx>
#include<Aspect_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
#include<Image_module.hxx>
#include<TShort_module.hxx>
#include<TColQuantity_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<BVH_module.hxx>
#include<TColgp_module.hxx>
#include<TopTools_module.hxx>
#include<SelectMgr_module.hxx>
#include<Poly_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Select3D_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Graphic3d.i
%import gp.i
%import Quantity.i
%import Aspect.i
%import TColStd.i
%import Bnd.i
%import TCollection.i
%import Image.i
/* public enums */
enum V3d_TypeOfPickCamera {
	V3d_POSITIONCAMERA = 0,
	V3d_SPACECAMERA = 1,
	V3d_RADIUSTEXTCAMERA = 2,
	V3d_ExtRADIUSCAMERA = 3,
	V3d_IntRADIUSCAMERA = 4,
	V3d_NOTHINGCAMERA = 5,
};

enum V3d_TypeOfVisualization {
	V3d_WIREFRAME = 0,
	V3d_ZBUFFER = 1,
};

enum V3d_TypeOfView {
	V3d_ORTHOGRAPHIC = 0,
	V3d_PERSPECTIVE = 1,
};

enum V3d_StereoDumpOptions {
	V3d_SDO_MONO = 0,
	V3d_SDO_LEFT_EYE = 1,
	V3d_SDO_RIGHT_EYE = 2,
	V3d_SDO_BLENDED = 3,
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
	V3d_TypeOfOrientation_Zup_AxoLeft = V3d_XnegYnegZpos,
	V3d_TypeOfOrientation_Zup_AxoRight = V3d_XposYnegZpos,
	V3d_TypeOfOrientation_Zup_Front = V3d_Yneg,
	V3d_TypeOfOrientation_Zup_Back = V3d_Ypos,
	V3d_TypeOfOrientation_Zup_Top = V3d_Zpos,
	V3d_TypeOfOrientation_Zup_Bottom = V3d_Zneg,
	V3d_TypeOfOrientation_Zup_Left = V3d_Xneg,
	V3d_TypeOfOrientation_Zup_Right = V3d_Xpos,
	V3d_TypeOfOrientation_Yup_AxoLeft = V3d_XnegYposZpos,
	V3d_TypeOfOrientation_Yup_AxoRight = V3d_XposYposZpos,
	V3d_TypeOfOrientation_Yup_Front = V3d_Zpos,
	V3d_TypeOfOrientation_Yup_Back = V3d_Zneg,
	V3d_TypeOfOrientation_Yup_Top = V3d_Ypos,
	V3d_TypeOfOrientation_Yup_Bottom = V3d_Yneg,
	V3d_TypeOfOrientation_Yup_Left = V3d_Xpos,
	V3d_TypeOfOrientation_Yup_Right = V3d_Xneg,
};

enum V3d_TypeOfAxe {
	V3d_X = 0,
	V3d_Y = 1,
	V3d_Z = 2,
};

enum V3d_TypeOfRepresentation {
	V3d_SIMPLE = 0,
	V3d_COMPLETE = 1,
	V3d_PARTIAL = 2,
	V3d_SAMELAST = 3,
};

enum V3d_TypeOfBackfacingModel {
	V3d_TOBM_AUTOMATIC = 0,
	V3d_TOBM_ALWAYS_DISPLAYED = 1,
	V3d_TOBM_NEVER_DISPLAYED = 2,
};

enum V3d_TypeOfPickLight {
	V3d_POSITIONLIGHT = 0,
	V3d_SPACELIGHT = 1,
	V3d_RADIUSTEXTLIGHT = 2,
	V3d_ExtRADIUSLIGHT = 3,
	V3d_IntRADIUSLIGHT = 4,
	V3d_NOTHING = 5,
};

/* end public enums declaration */

/* handles */
%wrap_handle(V3d_AmbientLight)
%wrap_handle(V3d_CircularGrid)
%wrap_handle(V3d_Plane)
%wrap_handle(V3d_PositionLight)
%wrap_handle(V3d_RectangularGrid)
%wrap_handle(V3d_Trihedron)
%wrap_handle(V3d_View)
%wrap_handle(V3d_Viewer)
%wrap_handle(V3d_DirectionalLight)
%wrap_handle(V3d_PositionalLight)
%wrap_handle(V3d_SpotLight)
/* end handles declaration */

/* templates */
%template(V3d_ListOfLight) NCollection_List <opencascade::handle <Graphic3d_CLight>>;
%template(V3d_ListOfView) NCollection_List <opencascade::handle <V3d_View>>;
/* end templates declaration */

/* typedefs */
typedef V3d_Viewer * V3d_ViewerPointer;
typedef NCollection_List <opencascade::handle <Graphic3d_CLight>> V3d_ListOfLight;
typedef V3d_ListOfLight::Iterator V3d_ListOfLightIterator;
typedef V3d_View * V3d_ViewPointer;
typedef Graphic3d_TypeOfLightSource V3d_TypeOfLight;
typedef NCollection_List <opencascade::handle <V3d_View>> V3d_ListOfView;
typedef V3d_ListOfView::Iterator V3d_ListOfViewIterator;
typedef Standard_Real V3d_Parameter;
typedef Graphic3d_TypeOfShadingModel V3d_TypeOfShadingModel;
typedef Standard_Real V3d_Coordinate;
typedef Graphic3d_CLight V3d_Light;
typedef Handle_Graphic3d_CLight Handle_V3d_Light;
/* end typedefs declaration */

/************
* class V3d *
************/
%rename(v3d) V3d;
class V3d {
	public:
		/****************** ArrowOfRadius ******************/
		%feature("compactdefaultargs") ArrowOfRadius;
		%feature("autodoc", "* Compute the graphic structure of arrow. X0,Y0,Z0 : coordinate of the arrow. DX,DY,DZ : Direction of the arrow. Alpha : Angle of arrow. Lng : Length of arrow.
	:param garrow:
	:type garrow: Graphic3d_Group
	:param X0:
	:type X0: float
	:param Y0:
	:type Y0: float
	:param Z0:
	:type Z0: float
	:param DX:
	:type DX: float
	:param DY:
	:type DY: float
	:param DZ:
	:type DZ: float
	:param Alpha:
	:type Alpha: float
	:param Lng:
	:type Lng: float
	:rtype: void") ArrowOfRadius;
		static void ArrowOfRadius (const opencascade::handle<Graphic3d_Group> & garrow,const Standard_Real X0,const Standard_Real Y0,const Standard_Real Z0,const Standard_Real DX,const Standard_Real DY,const Standard_Real DZ,const Standard_Real Alpha,const Standard_Real Lng);

		/****************** CircleInPlane ******************/
		%feature("compactdefaultargs") CircleInPlane;
		%feature("autodoc", "* Compute the graphic structure of circle. X0,Y0,Z0 : Center of circle. VX,VY,VZ : Axis of circle. Radius : Radius of circle.
	:param gcircle:
	:type gcircle: Graphic3d_Group
	:param X0:
	:type X0: float
	:param Y0:
	:type Y0: float
	:param Z0:
	:type Z0: float
	:param VX:
	:type VX: float
	:param VY:
	:type VY: float
	:param VZ:
	:type VZ: float
	:param Radius:
	:type Radius: float
	:rtype: void") CircleInPlane;
		static void CircleInPlane (const opencascade::handle<Graphic3d_Group> & gcircle,const Standard_Real X0,const Standard_Real Y0,const Standard_Real Z0,const Standard_Real VX,const Standard_Real VY,const Standard_Real VZ,const Standard_Real Radius);

		/****************** GetProjAxis ******************/
		%feature("compactdefaultargs") GetProjAxis;
		%feature("autodoc", "* Determines the orientation vector corresponding to the predefined orientation type.
	:param theOrientation:
	:type theOrientation: V3d_TypeOfOrientation
	:rtype: gp_Dir") GetProjAxis;
		static gp_Dir GetProjAxis (const V3d_TypeOfOrientation theOrientation);

		/****************** SwitchViewsinWindow ******************/
		%feature("compactdefaultargs") SwitchViewsinWindow;
		%feature("autodoc", ":param aPreviousView:
	:type aPreviousView: V3d_View
	:param aNextView:
	:type aNextView: V3d_View
	:rtype: void") SwitchViewsinWindow;
		static void SwitchViewsinWindow (const opencascade::handle<V3d_View> & aPreviousView,const opencascade::handle<V3d_View> & aNextView);

		/****************** TypeOfOrientationFromString ******************/
		%feature("compactdefaultargs") TypeOfOrientationFromString;
		%feature("autodoc", "* Returns the orientation type from the given string identifier (using case-insensitive comparison). @param theTypeString string identifier returns orientation type or V3d_TypeOfOrientation if string identifier is invalid
	:param theTypeString:
	:type theTypeString: char *
	:rtype: V3d_TypeOfOrientation") TypeOfOrientationFromString;
		static V3d_TypeOfOrientation TypeOfOrientationFromString (const char * theTypeString);

		/****************** TypeOfOrientationFromString ******************/
		%feature("compactdefaultargs") TypeOfOrientationFromString;
		%feature("autodoc", "* Determines the shape type from the given string identifier (using case-insensitive comparison). @param theTypeString string identifier @param theType detected shape type returns True if string identifier is known
	:param theTypeString:
	:type theTypeString: char *
	:param theType:
	:type theType: V3d_TypeOfOrientation
	:rtype: bool") TypeOfOrientationFromString;
		static Standard_Boolean TypeOfOrientationFromString (const char * theTypeString,V3d_TypeOfOrientation & theType);

		/****************** TypeOfOrientationToString ******************/
		%feature("compactdefaultargs") TypeOfOrientationToString;
		%feature("autodoc", "* Returns the string name for a given orientation type. @param theType orientation type returns string identifier from the list Xpos, Ypos, Zpos and others
	:param theType:
	:type theType: V3d_TypeOfOrientation
	:rtype: char *") TypeOfOrientationToString;
		static const char * TypeOfOrientationToString (V3d_TypeOfOrientation theType);

};


%extend V3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class V3d_AmbientLight *
*************************/
%nodefaultctor V3d_AmbientLight;
class V3d_AmbientLight : public Graphic3d_CLight {
	public:
		/****************** V3d_AmbientLight ******************/
		%feature("compactdefaultargs") V3d_AmbientLight;
		%feature("autodoc", "* Constructs an ambient light source in the viewer. The default Color of this light source is WHITE.
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:rtype: None") V3d_AmbientLight;
		 V3d_AmbientLight (const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_AmbientLight ******************/
		%feature("compactdefaultargs") V3d_AmbientLight;
		%feature("autodoc", "* Constructs an ambient light source in the viewer. The default Color of this light source is WHITE.
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:rtype: None") V3d_AmbientLight;
		 V3d_AmbientLight (const opencascade::handle<V3d_Viewer> & theViewer,const Quantity_Color & theColor = Quantity_NOC_WHITE);

};


%make_alias(V3d_AmbientLight)

%extend V3d_AmbientLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class V3d_CircularGrid *
*************************/
%nodefaultctor V3d_CircularGrid;
class V3d_CircularGrid : public Aspect_CircularGrid {
	public:
		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", ":rtype: None") Display;
		void Display ();

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", ":rtype: None") Erase;
		void Erase ();

		/****************** GraphicValues ******************/
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", ":param Radius:
	:type Radius: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", ":rtype: bool") IsDisplayed;
		Standard_Boolean IsDisplayed ();

		/****************** SetColors ******************/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", ":param aColor:
	:type aColor: Quantity_Color
	:param aTenthColor:
	:type aTenthColor: Quantity_Color
	:rtype: None") SetColors;
		void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);

		/****************** SetGraphicValues ******************/
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", ":param Radius:
	:type Radius: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") SetGraphicValues;
		void SetGraphicValues (const Standard_Real Radius,const Standard_Real OffSet);

		/****************** V3d_CircularGrid ******************/
		%feature("compactdefaultargs") V3d_CircularGrid;
		%feature("autodoc", ":param aViewer:
	:type aViewer: V3d_ViewerPointer
	:param aColor:
	:type aColor: Quantity_Color
	:param aTenthColor:
	:type aTenthColor: Quantity_Color
	:rtype: None") V3d_CircularGrid;
		 V3d_CircularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);

};


%make_alias(V3d_CircularGrid)

%extend V3d_CircularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class V3d_ImageDumpOptions *
*****************************/
%nodefaultctor V3d_ImageDumpOptions;
class V3d_ImageDumpOptions {
	public:
		int Width;
		int Height;
		Graphic3d_BufferType BufferType;
		V3d_StereoDumpOptions StereoOptions;
		int TileSize;
		bool ToAdjustAspect;
		/****************** V3d_ImageDumpOptions ******************/
		%feature("compactdefaultargs") V3d_ImageDumpOptions;
		%feature("autodoc", "* //!< flag to override active view aspect ratio by (Width / Height) defined for image dump (True by default) Default constructor.
	:rtype: None") V3d_ImageDumpOptions;
		 V3d_ImageDumpOptions ();

};


%extend V3d_ImageDumpOptions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class V3d_Plane *
******************/
%nodefaultctor V3d_Plane;
class V3d_Plane : public Standard_Transient {
	public:
		/****************** ClipPlane ******************/
		%feature("compactdefaultargs") ClipPlane;
		%feature("autodoc", "* Use this method to pass clipping plane implementation for standard clipping workflow. returns clipping plane implementation handle.
	:rtype: opencascade::handle<Graphic3d_ClipPlane>") ClipPlane;
		const opencascade::handle<Graphic3d_ClipPlane> & ClipPlane ();

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "* Display the plane representation in the choosen view.
	:param theView:
	:type theView: V3d_View
	:param theColor: default value is Quantity_NOC_GRAY
	:type theColor: Quantity_Color
	:rtype: void") Display;
		virtual void Display (const opencascade::handle<V3d_View> & theView,const Quantity_Color & theColor = Quantity_NOC_GRAY);

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* Erase the plane representation.
	:rtype: None") Erase;
		void Erase ();

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "* Returns True when the plane representation is displayed.
	:rtype: bool") IsDisplayed;
		Standard_Boolean IsDisplayed ();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "* Returns the parameters of the plane.
	:param theA:
	:type theA: float
	:param theB:
	:type theB: float
	:param theC:
	:type theC: float
	:param theD:
	:type theD: float
	:rtype: None") Plane;
		void Plane (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "* Change plane equation.
	:param theA:
	:type theA: float
	:param theB:
	:type theB: float
	:param theC:
	:type theC: float
	:param theD:
	:type theD: float
	:rtype: None") SetPlane;
		void SetPlane (const Standard_Real theA,const Standard_Real theB,const Standard_Real theC,const Standard_Real theD);

		/****************** V3d_Plane ******************/
		%feature("compactdefaultargs") V3d_Plane;
		%feature("autodoc", "* Creates a clipping plane from plane coefficients.
	:param theA: default value is 0.0
	:type theA: float
	:param theB: default value is 0.0
	:type theB: float
	:param theC: default value is 1.0
	:type theC: float
	:param theD: default value is 0.0
	:type theD: float
	:rtype: None") V3d_Plane;
		 V3d_Plane (const Standard_Real theA = 0.0,const Standard_Real theB = 0.0,const Standard_Real theC = 1.0,const Standard_Real theD = 0.0);

};


%make_alias(V3d_Plane)

%extend V3d_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class V3d_PositionLight *
**************************/
%nodefaultctor V3d_PositionLight;
class V3d_PositionLight : public Graphic3d_CLight {
	public:
};


%make_alias(V3d_PositionLight)

%extend V3d_PositionLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class V3d_RectangularGrid *
****************************/
%nodefaultctor V3d_RectangularGrid;
class V3d_RectangularGrid : public Aspect_RectangularGrid {
	public:
		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", ":rtype: void") Display;
		virtual void Display ();

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", ":rtype: void") Erase;
		virtual void Erase ();

		/****************** GraphicValues ******************/
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", ":param XSize:
	:type XSize: float
	:param YSize:
	:type YSize: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", ":rtype: bool") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();

		/****************** SetColors ******************/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", ":param aColor:
	:type aColor: Quantity_Color
	:param aTenthColor:
	:type aTenthColor: Quantity_Color
	:rtype: void") SetColors;
		virtual void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);

		/****************** SetGraphicValues ******************/
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", ":param XSize:
	:type XSize: float
	:param YSize:
	:type YSize: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") SetGraphicValues;
		void SetGraphicValues (const Standard_Real XSize,const Standard_Real YSize,const Standard_Real OffSet);

		/****************** V3d_RectangularGrid ******************/
		%feature("compactdefaultargs") V3d_RectangularGrid;
		%feature("autodoc", ":param aViewer:
	:type aViewer: V3d_ViewerPointer
	:param aColor:
	:type aColor: Quantity_Color
	:param aTenthColor:
	:type aTenthColor: Quantity_Color
	:rtype: None") V3d_RectangularGrid;
		 V3d_RectangularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);

};


%make_alias(V3d_RectangularGrid)

%extend V3d_RectangularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class V3d_Trihedron *
**********************/
%nodefaultctor V3d_Trihedron;
class V3d_Trihedron : public Standard_Transient {
	public:
		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "* Display trihedron.
	:param theView:
	:type theView: V3d_View
	:rtype: None") Display;
		void Display (const V3d_View & theView);

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* Erase trihedron.
	:rtype: None") Erase;
		void Erase ();

		/****************** SetArrowDiameter ******************/
		%feature("compactdefaultargs") SetArrowDiameter;
		%feature("autodoc", "* Setup the arrow diameter.
	:param theDiam:
	:type theDiam: float
	:rtype: None") SetArrowDiameter;
		void SetArrowDiameter (const Standard_Real theDiam);

		/****************** SetArrowsColor ******************/
		%feature("compactdefaultargs") SetArrowsColor;
		%feature("autodoc", "* Setup colors of arrows.
	:param theXColor:
	:type theXColor: Quantity_Color
	:param theYColor:
	:type theYColor: Quantity_Color
	:param theZColor:
	:type theZColor: Quantity_Color
	:rtype: None") SetArrowsColor;
		void SetArrowsColor (const Quantity_Color & theXColor,const Quantity_Color & theYColor,const Quantity_Color & theZColor);

		/****************** SetLabelsColor ******************/
		%feature("compactdefaultargs") SetLabelsColor;
		%feature("autodoc", "* Setup color of text labels.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetLabelsColor;
		void SetLabelsColor (const Quantity_Color & theColor);

		/****************** SetNbFacets ******************/
		%feature("compactdefaultargs") SetNbFacets;
		%feature("autodoc", "* Setup the number of facets for tessellation.
	:param theNbFacets:
	:type theNbFacets: int
	:rtype: None") SetNbFacets;
		void SetNbFacets (const Standard_Integer theNbFacets);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Setup the corner to draw the trihedron.
	:param thePosition:
	:type thePosition: Aspect_TypeOfTriedronPosition
	:rtype: None") SetPosition;
		void SetPosition (const Aspect_TypeOfTriedronPosition thePosition);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Setup the scale factor.
	:param theScale:
	:type theScale: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real theScale);

		/****************** SetSizeRatio ******************/
		%feature("compactdefaultargs") SetSizeRatio;
		%feature("autodoc", "* Setup the size ratio factor.
	:param theRatio:
	:type theRatio: float
	:rtype: None") SetSizeRatio;
		void SetSizeRatio (const Standard_Real theRatio);

		/****************** SetWireframe ******************/
		%feature("compactdefaultargs") SetWireframe;
		%feature("autodoc", "* Switch wireframe / shaded trihedron.
	:param theAsWireframe:
	:type theAsWireframe: bool
	:rtype: None") SetWireframe;
		void SetWireframe (const Standard_Boolean theAsWireframe);

		/****************** V3d_Trihedron ******************/
		%feature("compactdefaultargs") V3d_Trihedron;
		%feature("autodoc", "* Creates a default trihedron.
	:rtype: None") V3d_Trihedron;
		 V3d_Trihedron ();

};


%make_alias(V3d_Trihedron)

%extend V3d_Trihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class V3d_View *
*****************/
%nodefaultctor V3d_View;
class V3d_View : public Standard_Transient {
	public:
		/****************** ActiveLight ******************/
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", ":rtype: opencascade::handle<V3d_Light>") ActiveLight;
		const opencascade::handle<V3d_Light> & ActiveLight ();

		/****************** ActiveLightIterator ******************/
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "* Return iterator for defined lights.
	:rtype: V3d_ListOfLightIterator") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator ();

		/****************** AddClipPlane ******************/
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "* Adds clip plane to the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by PlaneLimit method of associated Graphic3d_GraphicDriver. Please be aware that the planes which exceed the limit are ignored during rendering. @param thePlane [in] the clip plane to be added to view.
	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane
	:rtype: void") AddClipPlane;
		virtual void AddClipPlane (const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** At ******************/
		%feature("compactdefaultargs") At;
		%feature("autodoc", "* Returns the position of the view point.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") At;
		void At (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** AutoZFit ******************/
		%feature("compactdefaultargs") AutoZFit;
		%feature("autodoc", "* If automatic z-range fitting is turned on, adjusts Z-min and Z-max projection volume planes with call to ZFitAll.
	:rtype: None") AutoZFit;
		void AutoZFit ();

		/****************** AutoZFitMode ******************/
		%feature("compactdefaultargs") AutoZFitMode;
		%feature("autodoc", "* returns True if automatic z-fit mode is turned on.
	:rtype: bool") AutoZFitMode;
		Standard_Boolean AutoZFitMode ();

		/****************** AutoZFitScaleFactor ******************/
		%feature("compactdefaultargs") AutoZFitScaleFactor;
		%feature("autodoc", "* returns scale factor parameter of automatic z-fit mode.
	:rtype: float") AutoZFitScaleFactor;
		Standard_Real AutoZFitScaleFactor ();

		/****************** AxialScale ******************/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "* Returns the current values of the anisotropic (axial) scale factors.
	:param Sx:
	:type Sx: float
	:param Sy:
	:type Sy: float
	:param Sz:
	:type Sz: float
	:rtype: None") AxialScale;
		void AxialScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** AxialScale ******************/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "* Performs anisotropic scaling of <self> view along the given <Axis>. The scale factor is calculated on a basis of the mouse pointer displacement <Dx,Dy>. The calculated scale factor is then passed to SetAxialScale(Sx, Sy, Sz) method.
	:param Dx:
	:type Dx: int
	:param Dy:
	:type Dy: int
	:param Axis:
	:type Axis: V3d_TypeOfAxe
	:rtype: None") AxialScale;
		void AxialScale (const Standard_Integer Dx,const Standard_Integer Dy,const V3d_TypeOfAxe Axis);

		/****************** BackFacingModel ******************/
		%feature("compactdefaultargs") BackFacingModel;
		%feature("autodoc", "* Returns current state of the back faces display
	:rtype: V3d_TypeOfBackfacingModel") BackFacingModel;
		V3d_TypeOfBackfacingModel BackFacingModel ();

		/****************** BackgroundColor ******************/
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "* Returns the Background color values of the view depending of the color Type.
	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param V3:
	:type V3: float
	:rtype: None") BackgroundColor;
		void BackgroundColor (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** BackgroundColor ******************/
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "* Returns the Background color object of the view.
	:rtype: Quantity_Color") BackgroundColor;
		Quantity_Color BackgroundColor ();

		/****************** Camera ******************/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "* Returns camera object of the view. returns: handle to camera object, or NULL if 3D view does not use the camera approach.
	:rtype: opencascade::handle<Graphic3d_Camera>") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera ();

		/****************** ChangeRenderingParams ******************/
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "* Returns reference to current rendering parameters and effect settings.
	:rtype: Graphic3d_RenderingParams") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams ();

		/****************** ClipPlanes ******************/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "* Get clip planes. returns sequence clip planes that have been set for the view
	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes ();

		/****************** ComputedMode ******************/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "* Returns the computed HLR mode state.
	:rtype: bool") ComputedMode;
		Standard_Boolean ComputedMode ();

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Converts the PIXEL value to a value in the projection plane.
	:param Vp:
	:type Vp: int
	:rtype: float") Convert;
		Standard_Real Convert (const Standard_Integer Vp);

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Converts the point PIXEL into a point projected in the reference frame of the projection plane.
	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Converts tha value of the projection plane into a PIXEL value.
	:param Vv:
	:type Vv: float
	:rtype: int") Convert;
		Standard_Integer Convert (const Standard_Real Vv);

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Converts the point defined in the reference frame of the projection plane into a point PIXEL.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:rtype: None") Convert;
		void Convert (const Standard_Real Xv,const Standard_Real Yv,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector.
	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "* Projects the point defined in the reference frame of the view into the projected point in the associated window.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:rtype: None") Convert;
		void Convert (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** ConvertToGrid ******************/
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "* Converts the projected point into the nearest grid point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and display the grid marker. Warning: When the grid is not active the result is identical to the above Convert() method. How to use: 1) Enable the grid echo display myViewer->SetGridEcho(Standard_True); 2) When application receive a move event: 2.1) Check if any object is detected if( myInteractiveContext->MoveTo(x,y) == AIS_SOD_Nothing ) { 2.2) Check if the grid is active if( myViewer->Grid()->IsActive() ) { 2.3) Display the grid echo and gets the grid point myView->ConvertToGrid(x,y,X,Y,Z); myView->Viewer()->ShowGridEcho (myView, Graphic3d_Vertex (X,Y,Z)); myView->RedrawImmediate(); 2.4) Else this is the standard case } else myView->Convert(x,y,X,Y,Z);
	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param Xg:
	:type Xg: float
	:param Yg:
	:type Yg: float
	:param Zg:
	:type Zg: float
	:rtype: None") ConvertToGrid;
		void ConvertToGrid (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ConvertToGrid ******************/
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "* Converts the point into the nearest grid point and display the grid marker.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Xg:
	:type Xg: float
	:param Yg:
	:type Yg: float
	:param Zg:
	:type Zg: float
	:rtype: None") ConvertToGrid;
		void ConvertToGrid (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ConvertWithProj ******************/
		%feature("compactdefaultargs") ConvertWithProj;
		%feature("autodoc", "* Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and returns the projection ray for further computations.
	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None") ConvertWithProj;
		void ConvertWithProj (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** DefaultCamera ******************/
		%feature("compactdefaultargs") DefaultCamera;
		%feature("autodoc", "* Return default camera.
	:rtype: opencascade::handle<Graphic3d_Camera>") DefaultCamera;
		const opencascade::handle<Graphic3d_Camera> & DefaultCamera ();

		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "* Returns the Distance between the Eye and View Point.
	:rtype: float") Depth;
		Standard_Real Depth ();

		/****************** DepthFitAll ******************/
		%feature("compactdefaultargs") DepthFitAll;
		%feature("autodoc", "* Adjusts the viewing volume so as not to clip the displayed objects by front and back and back clipping planes. Also sets depth value automatically depending on the calculated Z size and Aspect parameter. NOTE than the original XY size of the view is NOT modified .
	:param Aspect: default value is 0.01
	:type Aspect: float
	:param Margin: default value is 0.01
	:type Margin: float
	:rtype: None") DepthFitAll;
		void DepthFitAll (const Standard_Real Aspect = 0.01,const Standard_Real Margin = 0.01);

		/****************** DiagnosticInformation ******************/
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "* Fill in the dictionary with diagnostic info. Should be called within rendering thread. //! This API should be used only for user output or for creating automated reports. The format of returned information (e.g. key-value layout) is NOT part of this API and can be changed at any time. Thus application should not parse returned information to weed out specific parameters. @param theDict destination map for information @param theFlags defines the information to be retrieved
	:param theDict:
	:type theDict: TColStd_IndexedDataMapOfStringString
	:param theFlags:
	:type theFlags: Graphic3d_DiagnosticInfo
	:rtype: None") DiagnosticInformation;
		void DiagnosticInformation (TColStd_IndexedDataMapOfStringString & theDict,Graphic3d_DiagnosticInfo theFlags);

		/****************** DoMapping ******************/
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "* Must be called when the window supporting the view is mapped or unmapped.
	:rtype: None") DoMapping;
		void DoMapping ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps the full contents of the View into the image file. This is an alias for ToPixMap() with Image_AlienPixMap. @param theFile destination image file (image format is determined by file extension like .png, .bmp, .jpg) @param theBufferType buffer to dump returns False when the dump has failed
	:param theFile:
	:type theFile: char *
	:param theBufferType: default value is Graphic3d_BT_RGB
	:type theBufferType: Graphic3d_BufferType
	:rtype: bool") Dump;
		Standard_Boolean Dump (const char * theFile,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB);

		/****************** Eye ******************/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "* Returns the position of the eye.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") Eye;
		void Eye (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FitAll ******************/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "* Adjust view parameters to fit the displayed scene, respecting height / width ratio. The Z clipping range (depth range) is fitted if AutoZFit flag is True. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. @param theMargin [in] the margin coefficient for view borders. @param theToUpdate [in] flag to perform view update.
	:param theMargin: default value is 0.01
	:type theMargin: float
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None") FitAll;
		void FitAll (const Standard_Real theMargin = 0.01,const Standard_Boolean theToUpdate = Standard_True);

		/****************** FitAll ******************/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "* Adjust view parameters to fit the displayed scene, respecting height / width ratio according to the custom bounding box given. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. @param theBox [in] the custom bounding box to fit. @param theMargin [in] the margin coefficient for view borders. @param theToUpdate [in] flag to perform view update.
	:param theBox:
	:type theBox: Bnd_Box
	:param theMargin: default value is 0.01
	:type theMargin: float
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None") FitAll;
		void FitAll (const Bnd_Box & theBox,const Standard_Real theMargin = 0.01,const Standard_Boolean theToUpdate = Standard_True);

		/****************** FitAll ******************/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "* Centers the defined projection window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified .
	:param theMinXv:
	:type theMinXv: float
	:param theMinYv:
	:type theMinYv: float
	:param theMaxXv:
	:type theMaxXv: float
	:param theMaxYv:
	:type theMaxYv: float
	:rtype: None") FitAll;
		void FitAll (const Standard_Real theMinXv,const Standard_Real theMinYv,const Standard_Real theMaxXv,const Standard_Real theMaxYv);

		/****************** FitMinMax ******************/
		%feature("compactdefaultargs") FitMinMax;
		%feature("autodoc", "* Transform camera eye, center and scale to fit in the passed bounding box specified in WCS. @param theCamera [in] the camera @param theBox [in] the bounding box @param theMargin [in] the margin coefficient for view borders @param theResolution [in] the minimum size of projection of bounding box in Xv or Yv direction when it considered to be a thin plane or point (without a volume);  in this case only the center of camera is adjusted @param theToEnlargeIfLine [in] when True - in cases when the whole bounding box projected into thin line going along Z-axis of screen,  the view plane is enlarged such thatwe see the whole line on rotation, otherwise only the center of camera is adjusted. returns True if the fit all operation can be done
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:param theBox:
	:type theBox: Bnd_Box
	:param theMargin:
	:type theMargin: float
	:param theResolution: default value is 0.0
	:type theResolution: float
	:param theToEnlargeIfLine: default value is Standard_True
	:type theToEnlargeIfLine: bool
	:rtype: bool") FitMinMax;
		Standard_Boolean FitMinMax (const opencascade::handle<Graphic3d_Camera> & theCamera,const Bnd_Box & theBox,const Standard_Real theMargin,const Standard_Real theResolution = 0.0,const Standard_Boolean theToEnlargeIfLine = Standard_True);

		/****************** FocalReferencePoint ******************/
		%feature("compactdefaultargs") FocalReferencePoint;
		%feature("autodoc", "* Returns the position of point which emanating the projections.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") FocalReferencePoint;
		void FocalReferencePoint (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Focale ******************/
		%feature("compactdefaultargs") Focale;
		%feature("autodoc", "* Returns the View Plane Distance for Perspective Views
	:rtype: float") Focale;
		Standard_Real Focale ();

		/****************** GetGraduatedTrihedron ******************/
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "* Returns data of a graduated trihedron.
	:rtype: Graphic3d_GraduatedTrihedron") GetGraduatedTrihedron;
		const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron ();

		/****************** GradientBackground ******************/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "* Returns the gradient background of the view.
	:rtype: Aspect_GradientBackground") GradientBackground;
		Aspect_GradientBackground GradientBackground ();

		/****************** GradientBackgroundColors ******************/
		%feature("compactdefaultargs") GradientBackgroundColors;
		%feature("autodoc", "* Returns the gradient background colors of the view.
	:param theColor1:
	:type theColor1: Quantity_Color
	:param theColor2:
	:type theColor2: Quantity_Color
	:rtype: None") GradientBackgroundColors;
		void GradientBackgroundColors (Quantity_Color & theColor1,Quantity_Color & theColor2);

		/****************** GraduatedTrihedronDisplay ******************/
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "* Displays a graduated trihedron.
	:param theTrihedronData:
	:type theTrihedronData: Graphic3d_GraduatedTrihedron
	:rtype: None") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const Graphic3d_GraduatedTrihedron & theTrihedronData);

		/****************** GraduatedTrihedronErase ******************/
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "* Erases a graduated trihedron from the view.
	:rtype: None") GraduatedTrihedronErase;
		void GraduatedTrihedronErase ();

		/****************** GravityPoint ******************/
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "* Returns the Objects number and the gravity center of ALL viewable points in the view
	:rtype: gp_Pnt") GravityPoint;
		gp_Pnt GravityPoint ();

		/****************** IfMoreLights ******************/
		%feature("compactdefaultargs") IfMoreLights;
		%feature("autodoc", "* Returns True if One light more can be activated in this View.
	:rtype: bool") IfMoreLights;
		Standard_Boolean IfMoreLights ();

		/****************** IfWindow ******************/
		%feature("compactdefaultargs") IfWindow;
		%feature("autodoc", "* Returns True if MyView is associated with a window .
	:rtype: bool") IfWindow;
		Standard_Boolean IfWindow ();

		/****************** InitActiveLights ******************/
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "* initializes an iteration on the active Lights.
	:rtype: None") InitActiveLights;
		void InitActiveLights ();

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidates view content but does not redraw it.
	:rtype: None") Invalidate;
		void Invalidate ();

		/****************** InvalidateImmediate ******************/
		%feature("compactdefaultargs") InvalidateImmediate;
		%feature("autodoc", "* Invalidates view content within immediate layer but does not redraw it.
	:rtype: None") InvalidateImmediate;
		void InvalidateImmediate ();

		/****************** IsActiveLight ******************/
		%feature("compactdefaultargs") IsActiveLight;
		%feature("autodoc", "* Returns True when the light is active in this view.
	:param theLight:
	:type theLight: V3d_Light
	:rtype: bool") IsActiveLight;
		Standard_Boolean IsActiveLight (const opencascade::handle<V3d_Light> & theLight);

		/****************** IsCullingEnabled ******************/
		%feature("compactdefaultargs") IsCullingEnabled;
		%feature("autodoc", "* returns flag value of objects culling mechanism
	:rtype: bool") IsCullingEnabled;
		Standard_Boolean IsCullingEnabled ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns the status of the view regarding the displayed structures inside Returns True is The View is empty
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsInvalidated ******************/
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "* Returns true if cached view content has been invalidated.
	:rtype: bool") IsInvalidated;
		Standard_Boolean IsInvalidated ();

		/****************** IsInvalidatedImmediate ******************/
		%feature("compactdefaultargs") IsInvalidatedImmediate;
		%feature("autodoc", "* Returns true if immediate layer content has been invalidated.
	:rtype: bool") IsInvalidatedImmediate;
		Standard_Boolean IsInvalidatedImmediate ();

		/****************** LightLimit ******************/
		%feature("compactdefaultargs") LightLimit;
		%feature("autodoc", "* Returns the MAX number of light associated to the view.
	:rtype: int") LightLimit;
		Standard_Integer LightLimit ();

		/****************** MoreActiveLights ******************/
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "* returns true if there are more active Light(s) to return.
	:rtype: bool") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "* Movement of the eye parallel to the coordinate system of reference of the screen a distance relative to the initial position expressed by Start = Standard_True.
	:param Dx:
	:type Dx: float
	:param Dy:
	:type Dy: float
	:param Dz:
	:type Dz: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Move;
		void Move (const Standard_Real Dx,const Standard_Real Dy,const Standard_Real Dz,const Standard_Boolean Start = Standard_True);

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "* Movement of the eye parallel to one of the axes of the coordinate system of reference of the view a distance relative to the initial position expressed by Start = Standard_True.
	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Move;
		void Move (const V3d_TypeOfAxe Axe,const Standard_Real Length,const Standard_Boolean Start = Standard_True);

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "* Movement of the eye parllel to the current axis a distance relative to the initial position expressed by Start = Standard_True
	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Move;
		void Move (const Standard_Real Length,const Standard_Boolean Start = Standard_True);

		/****************** MustBeResized ******************/
		%feature("compactdefaultargs") MustBeResized;
		%feature("autodoc", "* Must be called when the window supporting the view changes size. if the view is not mapped on a window. Warning: The view is centered and resized to preserve the height/width ratio of the window.
	:rtype: None") MustBeResized;
		void MustBeResized ();

		/****************** NextActiveLights ******************/
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "* Go to the next active Light (if there is not, ActiveLight will raise an exception)
	:rtype: None") NextActiveLights;
		void NextActiveLights ();

		/****************** Pan ******************/
		%feature("compactdefaultargs") Pan;
		%feature("autodoc", "* Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXp, DXp parameters specify panning relative to the point where the operation is started. @param theDXp [in] the relative panning on 'x' axis of view projection, in pixels. @param theDYp [in] the relative panning on 'y' axis of view projection, in pixels. @param theZoomFactor [in] the zooming factor. @param theToStart [in] pass True when starting panning to remember view state prior to panning for relative arguments. Passing 0 for relative panning parameter should return view panning to initial state. Performs update of view.
	:param theDXp:
	:type theDXp: int
	:param theDYp:
	:type theDYp: int
	:param theZoomFactor: default value is 1
	:type theZoomFactor: float
	:param theToStart: default value is Standard_True
	:type theToStart: bool
	:rtype: None") Pan;
		void Pan (const Standard_Integer theDXp,const Standard_Integer theDYp,const Standard_Real theZoomFactor = 1,const Standard_Boolean theToStart = Standard_True);

		/****************** Panning ******************/
		%feature("compactdefaultargs") Panning;
		%feature("autodoc", "* Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXv, DXy parameters specify panning relative to the point where the operation is started. @param theDXv [in] the relative panning on 'x' axis of view projection, in view space coordinates. @param theDYv [in] the relative panning on 'y' axis of view projection, in view space coordinates. @param theZoomFactor [in] the zooming factor. @param theToStart [in] pass True when starting panning to remember view state prior to panning for relative arguments. If panning is started, passing {0, 0} for {theDXv, theDYv} will return view to initial state. Performs update of view.
	:param theDXv:
	:type theDXv: float
	:param theDYv:
	:type theDYv: float
	:param theZoomFactor: default value is 1
	:type theZoomFactor: float
	:param theToStart: default value is Standard_True
	:type theToStart: bool
	:rtype: None") Panning;
		void Panning (const Standard_Real theDXv,const Standard_Real theDYv,const Standard_Real theZoomFactor = 1,const Standard_Boolean theToStart = Standard_True);

		/****************** Place ******************/
		%feature("compactdefaultargs") Place;
		%feature("autodoc", "* places the point of the view corresponding at the pixel position x,y at the center of the window and updates the view.
	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:param theZoomFactor: default value is 1
	:type theZoomFactor: float
	:rtype: None") Place;
		void Place (const Standard_Integer theXp,const Standard_Integer theYp,const Standard_Real theZoomFactor = 1);

		/****************** PlaneLimit ******************/
		%feature("compactdefaultargs") PlaneLimit;
		%feature("autodoc", "* Returns the MAX number of clipping planes associated to the view.
	:rtype: int") PlaneLimit;
		Standard_Integer PlaneLimit ();

		/****************** Proj ******************/
		%feature("compactdefaultargs") Proj;
		%feature("autodoc", "* Returns the projection vector.
	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None") Proj;
		void Proj (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ProjReferenceAxe ******************/
		%feature("compactdefaultargs") ProjReferenceAxe;
		%feature("autodoc", "* Returns the coordinate of the point (Xpix,Ypix) in the view (XP,YP,ZP), and the projection vector of the view passing by the point (for PerspectiveView).
	:param Xpix:
	:type Xpix: int
	:param Ypix:
	:type Ypix: int
	:param XP:
	:type XP: float
	:param YP:
	:type YP: float
	:param ZP:
	:type ZP: float
	:param VX:
	:type VX: float
	:param VY:
	:type VY: float
	:param VZ:
	:type VZ: float
	:rtype: None") ProjReferenceAxe;
		void ProjReferenceAxe (const Standard_Integer Xpix,const Standard_Integer Ypix,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Converts the point defined in the user space of the view to the projection plane at the depth relative to theZ.
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:rtype: None") Project;
		void Project (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Converts the point defined in the user space of the view to the projection plane at the depth relative to theZ.
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:param theZp:
	:type theZp: float
	:rtype: None") Project;
		void Project (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Redraw ******************/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "* Redisplays the view even if there has not been any modification. Must be called if the view is shown. (Ex: DeIconification ) .
	:rtype: void") Redraw;
		virtual void Redraw ();

		/****************** RedrawImmediate ******************/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "* Updates layer of immediate presentations.
	:rtype: void") RedrawImmediate;
		virtual void RedrawImmediate ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Destroys the view.
	:rtype: None") Remove;
		void Remove ();

		/****************** RemoveClipPlane ******************/
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "* Removes clip plane from the view. @param thePlane [in] the clip plane to be removed from view.
	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane
	:rtype: void") RemoveClipPlane;
		virtual void RemoveClipPlane (const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** RenderingParams ******************/
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "* Returns current rendering parameters and effect settings. By default it returns default parameters of current viewer. To define view-specific settings use method V3d_View::ChangeRenderingParams(). @sa V3d_Viewer::DefaultRenderingParams()
	:rtype: Graphic3d_RenderingParams") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Resets the centering and the orientation of the view.
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None") Reset;
		void Reset (const Standard_Boolean theToUpdate = Standard_True);

		/****************** ResetViewMapping ******************/
		%feature("compactdefaultargs") ResetViewMapping;
		%feature("autodoc", "* Resets the centering of the view. Updates the view
	:rtype: None") ResetViewMapping;
		void ResetViewMapping ();

		/****************** ResetViewOrientation ******************/
		%feature("compactdefaultargs") ResetViewOrientation;
		%feature("autodoc", "* Resets the orientation of the view. Updates the view
	:rtype: None") ResetViewOrientation;
		void ResetViewOrientation ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "* Rotates the eye about the coordinate system of reference of the screen for which the origin is the view point of the projection, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True Warning! raises BadValue from V3d If the eye, the view point, or the high point are aligned or confused.
	:param Ax:
	:type Ax: float
	:param Ay:
	:type Ay: float
	:param Az:
	:type Az: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Rotate;
		void Rotate (const Standard_Real Ax,const Standard_Real Ay,const Standard_Real Az,const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "* Rotates the eye about the coordinate system of reference of the screen for which the origin is Gravity point {X,Y,Z}, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True If the eye, the view point, or the high point are aligned or confused.
	:param Ax:
	:type Ax: float
	:param Ay:
	:type Ay: float
	:param Az:
	:type Az: float
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Rotate;
		void Rotate (const Standard_Real Ax,const Standard_Real Ay,const Standard_Real Az,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "* Rotates the eye about one of the coordinate axes of of the view for which the origin is the Gravity point{X,Y,Z} with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True
	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: float
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Standard_Real Angle,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "* Rotates the eye about one of the coordinate axes of of the view for which the origin is the view point of the projection with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True
	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Standard_Real Angle,const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "* Rotates the eye around the current axis a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True
	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Rotate;
		void Rotate (const Standard_Real Angle,const Standard_Boolean Start = Standard_True);

		/****************** Rotation ******************/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "* Continues the rotation of the view with an angle computed from the last and new mouse position <X,Y>.
	:param X:
	:type X: int
	:param Y:
	:type Y: int
	:rtype: None") Rotation;
		void Rotation (const Standard_Integer X,const Standard_Integer Y);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "* Returns the current value of the zoom expressed with respect to SetViewMappingDefault().
	:rtype: float") Scale;
		Standard_Real Scale ();

		/****************** SetAt ******************/
		%feature("compactdefaultargs") SetAt;
		%feature("autodoc", "* Defines the position of the view point.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") SetAt;
		void SetAt (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);

		/****************** SetAutoZFitMode ******************/
		%feature("compactdefaultargs") SetAutoZFitMode;
		%feature("autodoc", "* Sets the automatic z-fit mode and its parameters. The auto z-fit has extra parameters which can controlled from application level to ensure that the size of viewing volume will be sufficiently large to cover the depth of unmanaged objects, for example, transformation persistent ones. @param theScaleFactor [in] the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed.
	:param theIsOn:
	:type theIsOn: bool
	:param theScaleFactor: default value is 1.0
	:type theScaleFactor: float
	:rtype: None") SetAutoZFitMode;
		void SetAutoZFitMode (const Standard_Boolean theIsOn,const Standard_Real theScaleFactor = 1.0);

		/****************** SetAxialScale ******************/
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "* Sets anisotropic (axial) scale factors <Sx>, <Sy>, <Sz> for view <self>. Anisotropic scaling operation is performed through multiplying the current view orientation matrix by a scaling matrix: || Sx 0 0 0 || || 0 Sy 0 0 || || 0 0 Sz 0 || || 0 0 0 1 || Updates the view.
	:param Sx:
	:type Sx: float
	:param Sy:
	:type Sy: float
	:param Sz:
	:type Sz: float
	:rtype: None") SetAxialScale;
		void SetAxialScale (const Standard_Real Sx,const Standard_Real Sy,const Standard_Real Sz);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Definition of an axis from its origin and its orientation . This will be the current axis for rotations and movements. Warning! raises BadValue from V3d if the vector normal is NULL. .
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None") SetAxis;
		void SetAxis (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real Vx,const Standard_Real Vy,const Standard_Real Vz);

		/****************** SetBackFacingModel ******************/
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "* Manages display of the back faces When <aModel> is TOBM_AUTOMATIC the object backfaces are displayed only for surface objects and never displayed for solid objects. this was the previous mode. <aModel> is TOBM_ALWAYS_DISPLAYED the object backfaces are always displayed both for surfaces or solids. <aModel> is TOBM_NEVER_DISPLAYED the object backfaces are never displayed.
	:param theModel: default value is V3d_TOBM_AUTOMATIC
	:type theModel: V3d_TypeOfBackfacingModel
	:rtype: None") SetBackFacingModel;
		void SetBackFacingModel (const V3d_TypeOfBackfacingModel theModel = V3d_TOBM_AUTOMATIC);

		/****************** SetBackgroundColor ******************/
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "* Defines the background color of the view by the color definition type and the three corresponding values.
	:param theType:
	:type theType: Quantity_TypeOfColor
	:param theV1:
	:type theV1: float
	:param theV2:
	:type theV2: float
	:param theV3:
	:type theV3: float
	:rtype: None") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_TypeOfColor theType,const Standard_Real theV1,const Standard_Real theV2,const Standard_Real theV3);

		/****************** SetBackgroundColor ******************/
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "* Defines the background color of the view.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_Color & theColor);

		/****************** SetBackgroundCubeMap ******************/
		%feature("compactdefaultargs") SetBackgroundCubeMap;
		%feature("autodoc", "* Sets environment cubemap as interactive background.
	:param theCubeMap:
	:type theCubeMap: Graphic3d_CubeMap
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None") SetBackgroundCubeMap;
		void SetBackgroundCubeMap (const opencascade::handle<Graphic3d_CubeMap> & theCubeMap,Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBackgroundImage ******************/
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "* Defines the background texture of the view by supplying the texture image file name and fill method (centered by default).
	:param theFileName:
	:type theFileName: char *
	:param theFillStyle: default value is Aspect_FM_CENTERED
	:type theFillStyle: Aspect_FillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None") SetBackgroundImage;
		void SetBackgroundImage (const char * theFileName,const Aspect_FillMethod theFillStyle = Aspect_FM_CENTERED,const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBgGradientColors ******************/
		%feature("compactdefaultargs") SetBgGradientColors;
		%feature("autodoc", "* Defines the gradient background colors of the view by supplying the colors and the fill method (horizontal by default).
	:param theColor1:
	:type theColor1: Quantity_Color
	:param theColor2:
	:type theColor2: Quantity_Color
	:param theFillStyle: default value is Aspect_GFM_HOR
	:type theFillStyle: Aspect_GradientFillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None") SetBgGradientColors;
		void SetBgGradientColors (const Quantity_Color & theColor1,const Quantity_Color & theColor2,const Aspect_GradientFillMethod theFillStyle = Aspect_GFM_HOR,const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBgGradientStyle ******************/
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "* Defines the gradient background fill method of the view.
	:param theMethod: default value is Aspect_GFM_HOR
	:type theMethod: Aspect_GradientFillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None") SetBgGradientStyle;
		void SetBgGradientStyle (const Aspect_GradientFillMethod theMethod = Aspect_GFM_HOR,const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBgImageStyle ******************/
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "* Defines the textured background fill method of the view.
	:param theFillStyle:
	:type theFillStyle: Aspect_FillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None") SetBgImageStyle;
		void SetBgImageStyle (const Aspect_FillMethod theFillStyle,const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetCamera ******************/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "* Change camera used by view.
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:rtype: None") SetCamera;
		void SetCamera (const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "* Relocates center of screen to the point, determined by {Xp, Yp} pixel coordinates relative to the bottom-left corner of screen. To calculate pixel coordinates for any point from world coordinate space, it can be projected using 'Project'. @param theXp [in] the x coordinate. @param theYp [in] the y coordinate.
	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:rtype: None") SetCenter;
		void SetCenter (const Standard_Integer theXp,const Standard_Integer theYp);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "* Sets sequence of clip planes to the view. The planes that have been set before are removed from the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by InquirePlaneLimit method of Graphic3d_GraphicDriver. Please be aware that the planes that exceed the limit are ignored during rendering. @param thePlanes [in] the clip planes to set.
	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None") SetClipPlanes;
		void SetClipPlanes (const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", ":param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);

		/****************** SetComputedMode ******************/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "* Switches computed HLR mode in the view.
	:param theMode:
	:type theMode: bool
	:rtype: None") SetComputedMode;
		void SetComputedMode (const Standard_Boolean theMode);

		/****************** SetDepth ******************/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "* Defines the Depth of the eye from the view point without update the projection .
	:param Depth:
	:type Depth: float
	:rtype: None") SetDepth;
		void SetDepth (const Standard_Real Depth);

		/****************** SetEye ******************/
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "* Defines the position of the eye..
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") SetEye;
		void SetEye (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);

		/****************** SetFocale ******************/
		%feature("compactdefaultargs") SetFocale;
		%feature("autodoc", "* Change View Plane Distance for Perspective Views Warning! raises TypeMismatch from Standard if the view is not a perspective view.
	:param Focale:
	:type Focale: float
	:rtype: None") SetFocale;
		void SetFocale (const Standard_Real Focale);

		/****************** SetFront ******************/
		%feature("compactdefaultargs") SetFront;
		%feature("autodoc", "* modify the Projection of the view perpendicularly to the privileged plane of the viewer.
	:rtype: None") SetFront;
		void SetFront ();

		/****************** SetFrustumCulling ******************/
		%feature("compactdefaultargs") SetFrustumCulling;
		%feature("autodoc", "* Turn on/off automatic culling of objects outside frustum (ON by default)
	:param theMode:
	:type theMode: bool
	:rtype: None") SetFrustumCulling;
		void SetFrustumCulling (Standard_Boolean theMode);

		/****************** SetGrid ******************/
		%feature("compactdefaultargs") SetGrid;
		%feature("autodoc", "* Defines or Updates the definition of the grid in <self>
	:param aPlane:
	:type aPlane: gp_Ax3
	:param aGrid:
	:type aGrid: Aspect_Grid
	:rtype: None") SetGrid;
		void SetGrid (const gp_Ax3 & aPlane,const opencascade::handle<Aspect_Grid> & aGrid);

		/****************** SetGridActivity ******************/
		%feature("compactdefaultargs") SetGridActivity;
		%feature("autodoc", "* Defines or Updates the activity of the grid in <self>
	:param aFlag:
	:type aFlag: bool
	:rtype: None") SetGridActivity;
		void SetGridActivity (const Standard_Boolean aFlag);

		/****************** SetImmediateUpdate ******************/
		%feature("compactdefaultargs") SetImmediateUpdate;
		%feature("autodoc", "* sets the immediate update mode and returns the previous one.
	:param theImmediateUpdate:
	:type theImmediateUpdate: bool
	:rtype: bool") SetImmediateUpdate;
		Standard_Boolean SetImmediateUpdate (const Standard_Boolean theImmediateUpdate);

		/****************** SetLightOff ******************/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "* Deactivate theLight in this view.
	:param theLight:
	:type theLight: V3d_Light
	:rtype: None") SetLightOff;
		void SetLightOff (const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOff ******************/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "* Deactivate all the Lights defined in this view.
	:rtype: None") SetLightOff;
		void SetLightOff ();

		/****************** SetLightOn ******************/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "* Activates theLight in the view.
	:param theLight:
	:type theLight: V3d_Light
	:rtype: None") SetLightOn;
		void SetLightOn (const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOn ******************/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "* Activates all the lights defined in this view.
	:rtype: None") SetLightOn;
		void SetLightOn ();

		/****************** SetMagnify ******************/
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", ":param theWindow:
	:type theWindow: Aspect_Window
	:param thePreviousView:
	:type thePreviousView: V3d_View
	:param theX1:
	:type theX1: int
	:param theY1:
	:type theY1: int
	:param theX2:
	:type theX2: int
	:param theY2:
	:type theY2: int
	:rtype: None") SetMagnify;
		void SetMagnify (const opencascade::handle<Aspect_Window> & theWindow,const opencascade::handle<V3d_View> & thePreviousView,const Standard_Integer theX1,const Standard_Integer theY1,const Standard_Integer theX2,const Standard_Integer theY2);

		/****************** SetProj ******************/
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "* Defines the orientation of the projection.
	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None") SetProj;
		void SetProj (const Standard_Real Vx,const Standard_Real Vy,const Standard_Real Vz);

		/****************** SetProj ******************/
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "* Defines the orientation of the projection . @param theOrientation camera direction @param theIsYup flag indicating Y-up (True) or Z-up (False) convention
	:param theOrientation:
	:type theOrientation: V3d_TypeOfOrientation
	:param theIsYup: default value is Standard_False
	:type theIsYup: bool
	:rtype: None") SetProj;
		void SetProj (const V3d_TypeOfOrientation theOrientation,const Standard_Boolean theIsYup = Standard_False);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Zooms the view by a factor relative to the value initialised by SetViewMappingDefault(). Updates the view.
	:param Coef:
	:type Coef: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real Coef);

		/****************** SetShadingModel ******************/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "* Defines the shading model for the visualization. Various models are available.
	:param theShadingModel:
	:type theShadingModel: Graphic3d_TypeOfShadingModel
	:rtype: None") SetShadingModel;
		void SetShadingModel (const Graphic3d_TypeOfShadingModel theShadingModel);

		/****************** SetSize ******************/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "* Defines the view projection size in its maximum dimension, keeping the inital height/width ratio unchanged.
	:param theSize:
	:type theSize: float
	:rtype: None") SetSize;
		void SetSize (const Standard_Real theSize);

		/****************** SetTextureEnv ******************/
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "* Sets the environment texture to use. No environment texture by default.
	:param theTexture:
	:type theTexture: Graphic3d_TextureEnv
	:rtype: None") SetTextureEnv;
		void SetTextureEnv (const opencascade::handle<Graphic3d_TextureEnv> & theTexture);

		/****************** SetTwist ******************/
		%feature("compactdefaultargs") SetTwist;
		%feature("autodoc", "* Defines the angular position of the high point of the reference frame of the view with respect to the Y screen axis with an absolute angular value in RADIANS.
	:param Angle:
	:type Angle: float
	:rtype: None") SetTwist;
		void SetTwist (const Standard_Real Angle);

		/****************** SetUp ******************/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "* Defines the orientation of the high point.
	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None") SetUp;
		void SetUp (const Standard_Real Vx,const Standard_Real Vy,const Standard_Real Vz);

		/****************** SetUp ******************/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "* Defines the orientation(SO) of the high point.
	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: None") SetUp;
		void SetUp (const V3d_TypeOfOrientation Orientation);

		/****************** SetViewMappingDefault ******************/
		%feature("compactdefaultargs") SetViewMappingDefault;
		%feature("autodoc", "* Saves the current view mapping. This will be the state returned from ResetViewmapping.
	:rtype: None") SetViewMappingDefault;
		void SetViewMappingDefault ();

		/****************** SetViewOrientationDefault ******************/
		%feature("compactdefaultargs") SetViewOrientationDefault;
		%feature("autodoc", "* Saves the current state of the orientation of the view which will be the return state at ResetViewOrientation.
	:rtype: None") SetViewOrientationDefault;
		void SetViewOrientationDefault ();

		/****************** SetVisualization ******************/
		%feature("compactdefaultargs") SetVisualization;
		%feature("autodoc", "* Defines the visualization type in the view.
	:param theType:
	:type theType: V3d_TypeOfVisualization
	:rtype: None") SetVisualization;
		void SetVisualization (const V3d_TypeOfVisualization theType);

		/****************** SetWindow ******************/
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "* Activates the view in the specified Window If <aContext> is not NULL the graphic context is used to draw something in this view. Otherwise an internal graphic context is created. Warning: The view is centered and resized to preserve the height/width ratio of the window.
	:param theWindow:
	:type theWindow: Aspect_Window
	:param theContext: default value is NULL
	:type theContext: Aspect_RenderingContext
	:rtype: None") SetWindow;
		void SetWindow (const opencascade::handle<Aspect_Window> & theWindow,const Aspect_RenderingContext theContext = NULL);

		/****************** SetZSize ******************/
		%feature("compactdefaultargs") SetZSize;
		%feature("autodoc", "* Defines the Depth size of the view Front Plane will be set to Size/2. Back Plane will be set to -Size/2. Any Object located Above the Front Plane or behind the Back Plane will be Clipped . NOTE than the XY Size of the View is NOT modified .
	:param SetZSize:
	:type SetZSize: float
	:rtype: None") SetZSize;
		void SetZSize (const Standard_Real SetZSize);

		/****************** SetZoom ******************/
		%feature("compactdefaultargs") SetZoom;
		%feature("autodoc", "* Zooms the view by a factor relative to the initial value expressed by Start = Standard_True Updates the view.
	:param Coef:
	:type Coef: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") SetZoom;
		void SetZoom (const Standard_Real Coef,const Standard_Boolean Start = Standard_True);

		/****************** ShadingModel ******************/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "* Returns the current shading model.
	:rtype: Graphic3d_TypeOfShadingModel") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel ();

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns the height and width of the view.
	:param Width:
	:type Width: float
	:param Height:
	:type Height: float
	:rtype: None") Size;
		void Size (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** StartRotation ******************/
		%feature("compactdefaultargs") StartRotation;
		%feature("autodoc", "* Begin the rotation of the view around the screen axis according to the mouse position <X,Y>. Warning: Enable rotation around the Z screen axis when <zRotationThreshold> factor is > 0 soon the distance from the start point and the center of the view is > (medium viewSize * <zRotationThreshold> ). Generally a value of 0.4 is usable to rotate around XY screen axis inside the circular threshold area and to rotate around Z screen axis outside this area.
	:param X:
	:type X: int
	:param Y:
	:type Y: int
	:param zRotationThreshold: default value is 0.0
	:type zRotationThreshold: float
	:rtype: None") StartRotation;
		void StartRotation (const Standard_Integer X,const Standard_Integer Y,const Standard_Real zRotationThreshold = 0.0);

		/****************** StartZoomAtPoint ******************/
		%feature("compactdefaultargs") StartZoomAtPoint;
		%feature("autodoc", "* Defines starting point for ZoomAtPoint view operation. @param theXp [in] the x mouse coordinate, in pixels. @param theYp [in] the y mouse coordinate, in pixels.
	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:rtype: None") StartZoomAtPoint;
		void StartZoomAtPoint (const Standard_Integer theXp,const Standard_Integer theYp);

		/****************** StatisticInformation ******************/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "* Returns string with statistic performance info.
	:rtype: TCollection_AsciiString") StatisticInformation;
		TCollection_AsciiString StatisticInformation ();

		/****************** StatisticInformation ******************/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "* Fills in the dictionary with statistic performance info.
	:param theDict:
	:type theDict: TColStd_IndexedDataMapOfStringString
	:rtype: None") StatisticInformation;
		void StatisticInformation (TColStd_IndexedDataMapOfStringString & theDict);

		/****************** TextureEnv ******************/
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", ":rtype: opencascade::handle<Graphic3d_TextureEnv>") TextureEnv;
		opencascade::handle<Graphic3d_TextureEnv> TextureEnv ();

		/****************** ToPixMap ******************/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "* Dumps the full contents of the view to a pixmap with specified parameters. Internally this method calls Redraw() with an offscreen render buffer of requested target size (theWidth x theHeight), so that there is no need resizing a window control for making a dump of different size.
	:param theImage:
	:type theImage: Image_PixMap
	:param theParams:
	:type theParams: V3d_ImageDumpOptions
	:rtype: bool") ToPixMap;
		Standard_Boolean ToPixMap (Image_PixMap & theImage,const V3d_ImageDumpOptions & theParams);

		/****************** ToPixMap ******************/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "* Dumps the full contents of the view to a pixmap. Internally this method calls Redraw() with an offscreen render buffer of requested target size (theWidth x theHeight), so that there is no need resizing a window control for making a dump of different size. @param theImage target image, will be re-allocated to match theWidth x theHeight @param theWidth target image width @param theHeight target image height @param theBufferType type of the view buffer to dump (color / depth) @param theToAdjustAspect when true, active view aspect ratio will be overridden by (theWidth / theHeight) @param theStereoOptions how to dump stereographic camera
	:param theImage:
	:type theImage: Image_PixMap
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theBufferType: default value is Graphic3d_BT_RGB
	:type theBufferType: Graphic3d_BufferType
	:param theToAdjustAspect: default value is Standard_True
	:type theToAdjustAspect: bool
	:param theStereoOptions: default value is V3d_SDO_MONO
	:type theStereoOptions: V3d_StereoDumpOptions
	:rtype: bool") ToPixMap;
		Standard_Boolean ToPixMap (Image_PixMap & theImage,const Standard_Integer theWidth,const Standard_Integer theHeight,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB,const Standard_Boolean theToAdjustAspect = Standard_True,const V3d_StereoDumpOptions theStereoOptions = V3d_SDO_MONO);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Movement of the ye and the view point parallel to the frame of reference of the screen a distance relative to the initial position expressed by Start = Standard_True
	:param Dx:
	:type Dx: float
	:param Dy:
	:type Dy: float
	:param Dz:
	:type Dz: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Translate;
		void Translate (const Standard_Real Dx,const Standard_Real Dy,const Standard_Real Dz,const Standard_Boolean Start = Standard_True);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Movement of the eye and the view point parallel to one of the axes of the fame of reference of the view a distance relative to the initial position expressed by Start = Standard_True
	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Translate;
		void Translate (const V3d_TypeOfAxe Axe,const Standard_Real Length,const Standard_Boolean Start = Standard_True);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Movement of the eye and view point parallel to the current axis a distance relative to the initial position expressed by Start = Standard_True
	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Translate;
		void Translate (const Standard_Real Length,const Standard_Boolean Start = Standard_True);

		/****************** TriedronDisplay ******************/
		%feature("compactdefaultargs") TriedronDisplay;
		%feature("autodoc", "* Display of the Triedron. Initialize position, color and length of Triedron axes. The scale is a percent of the window width.
	:param thePosition: default value is Aspect_TOTP_CENTER
	:type thePosition: Aspect_TypeOfTriedronPosition
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theScale: default value is 0.02
	:type theScale: float
	:param theMode: default value is V3d_WIREFRAME
	:type theMode: V3d_TypeOfVisualization
	:rtype: None") TriedronDisplay;
		void TriedronDisplay (const Aspect_TypeOfTriedronPosition thePosition = Aspect_TOTP_CENTER,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theScale = 0.02,const V3d_TypeOfVisualization theMode = V3d_WIREFRAME);

		/****************** TriedronErase ******************/
		%feature("compactdefaultargs") TriedronErase;
		%feature("autodoc", "* Erases the Triedron.
	:rtype: None") TriedronErase;
		void TriedronErase ();

		/****************** Turn ******************/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "* Rotation of the view point around the frame of reference of the screen for which the origin is the eye of the projection with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True
	:param Ax:
	:type Ax: float
	:param Ay:
	:type Ay: float
	:param Az:
	:type Az: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Turn;
		void Turn (const Standard_Real Ax,const Standard_Real Ay,const Standard_Real Az,const Standard_Boolean Start = Standard_True);

		/****************** Turn ******************/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "* Rotation of the view point around one of the axes of the frame of reference of the view for which the origin is the eye of the projection with an angular value in RADIANS relative to the initial position expressed by Start = Standard_True
	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Turn;
		void Turn (const V3d_TypeOfAxe Axe,const Standard_Real Angle,const Standard_Boolean Start = Standard_True);

		/****************** Turn ******************/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "* Rotation of the view point around the current axis an angular value in RADIANS relative to the initial position expressed by Start = Standard_True
	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None") Turn;
		void Turn (const Standard_Real Angle,const Standard_Boolean Start = Standard_True);

		/****************** Twist ******************/
		%feature("compactdefaultargs") Twist;
		%feature("autodoc", "* Returns in RADIANS the orientation of the view around the visual axis measured from the Y axis of the screen.
	:rtype: float") Twist;
		Standard_Real Twist ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the Type of the View
	:rtype: V3d_TypeOfView") Type;
		V3d_TypeOfView Type ();

		/****************** Up ******************/
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "* Returns the vector giving the position of the high point.
	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None") Up;
		void Up (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Deprecated, Redraw() should be used instead.
	:rtype: None") Update;
		void Update ();

		/****************** UpdateLights ******************/
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "* Updates the lights of the view.
	:rtype: None") UpdateLights;
		void UpdateLights ();

		/****************** V3d_View ******************/
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "* Initializes the view.
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theType: default value is V3d_ORTHOGRAPHIC
	:type theType: V3d_TypeOfView
	:rtype: None") V3d_View;
		 V3d_View (const opencascade::handle<V3d_Viewer> & theViewer,const V3d_TypeOfView theType = V3d_ORTHOGRAPHIC);

		/****************** V3d_View ******************/
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "* Initializes the view by copying.
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theView:
	:type theView: V3d_View
	:rtype: None") V3d_View;
		 V3d_View (const opencascade::handle<V3d_Viewer> & theViewer,const opencascade::handle<V3d_View> & theView);

		/****************** View ******************/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "* Returns the associated Graphic3d view.
	:rtype: opencascade::handle<Graphic3d_CView>") View;
		const opencascade::handle<Graphic3d_CView> & View ();

		/****************** Viewer ******************/
		%feature("compactdefaultargs") Viewer;
		%feature("autodoc", "* Returns the viewer in which the view has been created.
	:rtype: opencascade::handle<V3d_Viewer>") Viewer;
		opencascade::handle<V3d_Viewer> Viewer ();

		/****************** Visualization ******************/
		%feature("compactdefaultargs") Visualization;
		%feature("autodoc", "* Returns the current visualisation mode.
	:rtype: V3d_TypeOfVisualization") Visualization;
		V3d_TypeOfVisualization Visualization ();

		/****************** Window ******************/
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "* Returns the Aspect Window associated with the view.
	:rtype: opencascade::handle<Aspect_Window>") Window;
		const opencascade::handle<Aspect_Window> & Window ();

		/****************** WindowFit ******************/
		%feature("compactdefaultargs") WindowFit;
		%feature("autodoc", "* Centers the defined PIXEL window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified. @param theMinXp [in] pixel coordinates of minimal corner on x screen axis. @param theMinYp [in] pixel coordinates of minimal corner on y screen axis. @param theMaxXp [in] pixel coordinates of maximal corner on x screen axis. @param theMaxYp [in] pixel coordinates of maximal corner on y screen axis.
	:param theMinXp:
	:type theMinXp: int
	:param theMinYp:
	:type theMinYp: int
	:param theMaxXp:
	:type theMaxXp: int
	:param theMaxYp:
	:type theMaxYp: int
	:rtype: None") WindowFit;
		void WindowFit (const Standard_Integer theMinXp,const Standard_Integer theMinYp,const Standard_Integer theMaxXp,const Standard_Integer theMaxYp);

		/****************** WindowFitAll ******************/
		%feature("compactdefaultargs") WindowFitAll;
		%feature("autodoc", "* idem than WindowFit
	:param Xmin:
	:type Xmin: int
	:param Ymin:
	:type Ymin: int
	:param Xmax:
	:type Xmax: int
	:param Ymax:
	:type Ymax: int
	:rtype: None") WindowFitAll;
		void WindowFitAll (const Standard_Integer Xmin,const Standard_Integer Ymin,const Standard_Integer Xmax,const Standard_Integer Ymax);

		/****************** ZBufferTriedronSetup ******************/
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "* Customization of the ZBUFFER Triedron. XColor,YColor,ZColor - colors of axis SizeRatio - ratio of decreasing of the trihedron size when its physical position comes out of the view AxisDiametr - diameter relatively to axis length NbFacettes - number of facets of cylinders and cones
	:param theXColor: default value is Quantity_NOC_RED
	:type theXColor: Quantity_Color
	:param theYColor: default value is Quantity_NOC_GREEN
	:type theYColor: Quantity_Color
	:param theZColor: default value is Quantity_NOC_BLUE1
	:type theZColor: Quantity_Color
	:param theSizeRatio: default value is 0.8
	:type theSizeRatio: float
	:param theAxisDiametr: default value is 0.05
	:type theAxisDiametr: float
	:param theNbFacettes: default value is 12
	:type theNbFacettes: int
	:rtype: None") ZBufferTriedronSetup;
		void ZBufferTriedronSetup (const Quantity_Color & theXColor = Quantity_NOC_RED,const Quantity_Color & theYColor = Quantity_NOC_GREEN,const Quantity_Color & theZColor = Quantity_NOC_BLUE1,const Standard_Real theSizeRatio = 0.8,const Standard_Real theAxisDiametr = 0.05,const Standard_Integer theNbFacettes = 12);

		/****************** ZFitAll ******************/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "* Change Z-min and Z-max planes of projection volume to match the displayed objects.
	:param theScaleFactor: default value is 1.0
	:type theScaleFactor: float
	:rtype: None") ZFitAll;
		void ZFitAll (const Standard_Real theScaleFactor = 1.0);

		/****************** ZSize ******************/
		%feature("compactdefaultargs") ZSize;
		%feature("autodoc", "* Returns the Depth of the view .
	:rtype: float") ZSize;
		Standard_Real ZSize ();

		/****************** Zoom ******************/
		%feature("compactdefaultargs") Zoom;
		%feature("autodoc", "* Zoom the view according to a zoom factor computed from the distance between the 2 mouse position. @param theXp1 [in] the x coordinate of first mouse position, in pixels. @param theYp1 [in] the y coordinate of first mouse position, in pixels. @param theXp2 [in] the x coordinate of second mouse position, in pixels. @param theYp2 [in] the y coordinate of second mouse position, in pixels.
	:param theXp1:
	:type theXp1: int
	:param theYp1:
	:type theYp1: int
	:param theXp2:
	:type theXp2: int
	:param theYp2:
	:type theYp2: int
	:rtype: None") Zoom;
		void Zoom (const Standard_Integer theXp1,const Standard_Integer theYp1,const Standard_Integer theXp2,const Standard_Integer theYp2);

		/****************** ZoomAtPoint ******************/
		%feature("compactdefaultargs") ZoomAtPoint;
		%feature("autodoc", "* Zooms the model at a pixel defined by the method StartZoomAtPoint().
	:param theMouseStartX:
	:type theMouseStartX: int
	:param theMouseStartY:
	:type theMouseStartY: int
	:param theMouseEndX:
	:type theMouseEndX: int
	:param theMouseEndY:
	:type theMouseEndY: int
	:rtype: None") ZoomAtPoint;
		void ZoomAtPoint (const Standard_Integer theMouseStartX,const Standard_Integer theMouseStartY,const Standard_Integer theMouseEndX,const Standard_Integer theMouseEndY);

};


%make_alias(V3d_View)

%extend V3d_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class V3d_Viewer *
*******************/
%nodefaultctor V3d_Viewer;
class V3d_Viewer : public Standard_Transient {
	public:
		/****************** ActivateGrid ******************/
		%feature("compactdefaultargs") ActivateGrid;
		%feature("autodoc", "* @name grid management Activates the grid in all views of <self>.
	:param aGridType:
	:type aGridType: Aspect_GridType
	:param aGridDrawMode:
	:type aGridDrawMode: Aspect_GridDrawMode
	:rtype: None") ActivateGrid;
		void ActivateGrid (const Aspect_GridType aGridType,const Aspect_GridDrawMode aGridDrawMode);

		/****************** ActiveLight ******************/
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", ":rtype: opencascade::handle<V3d_Light>") ActiveLight;
		const opencascade::handle<V3d_Light> & ActiveLight ();

		/****************** ActiveLightIterator ******************/
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "* Return an iterator for defined lights.
	:rtype: V3d_ListOfLightIterator") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator ();

		/****************** ActiveView ******************/
		%feature("compactdefaultargs") ActiveView;
		%feature("autodoc", ":rtype: opencascade::handle<V3d_View>") ActiveView;
		const opencascade::handle<V3d_View> & ActiveView ();

		/****************** ActiveViewIterator ******************/
		%feature("compactdefaultargs") ActiveViewIterator;
		%feature("autodoc", "* Return an iterator for active views.
	:rtype: V3d_ListOfViewIterator") ActiveViewIterator;
		V3d_ListOfViewIterator ActiveViewIterator ();

		/****************** AddLight ******************/
		%feature("compactdefaultargs") AddLight;
		%feature("autodoc", "* Adds Light in Sequence Of Lights.
	:param theLight:
	:type theLight: V3d_Light
	:rtype: None") AddLight;
		void AddLight (const opencascade::handle<V3d_Light> & theLight);

		/****************** AddZLayer ******************/
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "* Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. Custom layers will be inserted before Graphic3d_ZLayerId_Top (e.g. between Graphic3d_ZLayerId_Default and before Graphic3d_ZLayerId_Top). @param theLayerId [out] id of created layer @param theSettings [in] new layer settings returns False if the layer can not be created
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theSettings: default value is Graphic3d_ZLayerSettings()
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: bool") AddZLayer;
		Standard_Boolean AddZLayer (Graphic3d_ZLayerId & theLayerId,const Graphic3d_ZLayerSettings & theSettings = Graphic3d_ZLayerSettings());

		/****************** CircularGridGraphicValues ******************/
		%feature("compactdefaultargs") CircularGridGraphicValues;
		%feature("autodoc", "* Returns the location and the size of the grid.
	:param Radius:
	:type Radius: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") CircularGridGraphicValues;
		void CircularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CircularGridValues ******************/
		%feature("compactdefaultargs") CircularGridValues;
		%feature("autodoc", "* Returns the definition of the circular grid.
	:param XOrigin:
	:type XOrigin: float
	:param YOrigin:
	:type YOrigin: float
	:param RadiusStep:
	:type RadiusStep: float
	:param DivisionNumber:
	:type DivisionNumber: int
	:param RotationAngle:
	:type RotationAngle: float
	:rtype: None") CircularGridValues;
		void CircularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** ComputedMode ******************/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "* returns true if the computed mode can be used.
	:rtype: bool") ComputedMode;
		Standard_Boolean ComputedMode ();

		/****************** CreateView ******************/
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "* Creates a view in the viewer according to its default parameters.
	:rtype: opencascade::handle<V3d_View>") CreateView;
		opencascade::handle<V3d_View> CreateView ();

		/****************** DeactivateGrid ******************/
		%feature("compactdefaultargs") DeactivateGrid;
		%feature("autodoc", "* Deactivates the grid in all views of <self>.
	:rtype: None") DeactivateGrid;
		void DeactivateGrid ();

		/****************** DefaultBackgroundColor ******************/
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "* Returns the default background colour object.
	:rtype: Quantity_Color") DefaultBackgroundColor;
		Quantity_Color DefaultBackgroundColor ();

		/****************** DefaultBackgroundColor ******************/
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", ":param theType:
	:type theType: Quantity_TypeOfColor
	:param theV1:
	:type theV1: float
	:param theV2:
	:type theV2: float
	:param theV3:
	:type theV3: float
	:rtype: None") DefaultBackgroundColor;
		void DefaultBackgroundColor (const Quantity_TypeOfColor theType,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** DefaultBgGradientColors ******************/
		%feature("compactdefaultargs") DefaultBgGradientColors;
		%feature("autodoc", "* Returns the gradient background colour objects of the view.
	:param theColor1:
	:type theColor1: Quantity_Color
	:param theColor2:
	:type theColor2: Quantity_Color
	:rtype: None") DefaultBgGradientColors;
		void DefaultBgGradientColors (Quantity_Color & theColor1,Quantity_Color & theColor2);

		/****************** DefaultComputedMode ******************/
		%feature("compactdefaultargs") DefaultComputedMode;
		%feature("autodoc", "* returns true if by default the computed mode must be used.
	:rtype: bool") DefaultComputedMode;
		Standard_Boolean DefaultComputedMode ();

		/****************** DefaultRenderingParams ******************/
		%feature("compactdefaultargs") DefaultRenderingParams;
		%feature("autodoc", "* Return default Rendering Parameters. By default these parameters are set in a new V3d_View.
	:rtype: Graphic3d_RenderingParams") DefaultRenderingParams;
		const Graphic3d_RenderingParams & DefaultRenderingParams ();

		/****************** DefaultShadingModel ******************/
		%feature("compactdefaultargs") DefaultShadingModel;
		%feature("autodoc", "* Returns the default type of Shading
	:rtype: Graphic3d_TypeOfShadingModel") DefaultShadingModel;
		Graphic3d_TypeOfShadingModel DefaultShadingModel ();

		/****************** DefaultTypeOfView ******************/
		%feature("compactdefaultargs") DefaultTypeOfView;
		%feature("autodoc", "* Returns the default type of View (orthographic or perspective projection) to be returned by CreateView() method.
	:rtype: V3d_TypeOfView") DefaultTypeOfView;
		V3d_TypeOfView DefaultTypeOfView ();

		/****************** DefaultViewProj ******************/
		%feature("compactdefaultargs") DefaultViewProj;
		%feature("autodoc", "* Returns the default Projection.
	:rtype: V3d_TypeOfOrientation") DefaultViewProj;
		V3d_TypeOfOrientation DefaultViewProj ();

		/****************** DefaultViewSize ******************/
		%feature("compactdefaultargs") DefaultViewSize;
		%feature("autodoc", "* Returns the default size of the view.
	:rtype: float") DefaultViewSize;
		Standard_Real DefaultViewSize ();

		/****************** DefaultVisualization ******************/
		%feature("compactdefaultargs") DefaultVisualization;
		%feature("autodoc", "* Returns the default type of Visualization.
	:rtype: V3d_TypeOfVisualization") DefaultVisualization;
		V3d_TypeOfVisualization DefaultVisualization ();

		/****************** DefinedLight ******************/
		%feature("compactdefaultargs") DefinedLight;
		%feature("autodoc", ":rtype: opencascade::handle<V3d_Light>") DefinedLight;
		const opencascade::handle<V3d_Light> & DefinedLight ();

		/****************** DefinedLightIterator ******************/
		%feature("compactdefaultargs") DefinedLightIterator;
		%feature("autodoc", "* Return an iterator for defined lights.
	:rtype: V3d_ListOfLightIterator") DefinedLightIterator;
		V3d_ListOfLightIterator DefinedLightIterator ();

		/****************** DefinedView ******************/
		%feature("compactdefaultargs") DefinedView;
		%feature("autodoc", ":rtype: opencascade::handle<V3d_View>") DefinedView;
		const opencascade::handle<V3d_View> & DefinedView ();

		/****************** DefinedViewIterator ******************/
		%feature("compactdefaultargs") DefinedViewIterator;
		%feature("autodoc", "* Return an iterator for defined views.
	:rtype: V3d_ListOfViewIterator") DefinedViewIterator;
		V3d_ListOfViewIterator DefinedViewIterator ();

		/****************** DelLight ******************/
		%feature("compactdefaultargs") DelLight;
		%feature("autodoc", "* Delete Light in Sequence Of Lights.
	:param theLight:
	:type theLight: V3d_Light
	:rtype: None") DelLight;
		void DelLight (const opencascade::handle<V3d_Light> & theLight);

		/****************** DisplayPrivilegedPlane ******************/
		%feature("compactdefaultargs") DisplayPrivilegedPlane;
		%feature("autodoc", ":param theOnOff:
	:type theOnOff: bool
	:param theSize: default value is 1
	:type theSize: float
	:rtype: None") DisplayPrivilegedPlane;
		void DisplayPrivilegedPlane (const Standard_Boolean theOnOff,const Standard_Real theSize = 1);

		/****************** Driver ******************/
		%feature("compactdefaultargs") Driver;
		%feature("autodoc", "* Return Graphic Driver instance.
	:rtype: opencascade::handle<Graphic3d_GraphicDriver>") Driver;
		const opencascade::handle<Graphic3d_GraphicDriver> & Driver ();

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* @name objects management Erase all Objects in All the views.
	:rtype: None") Erase;
		void Erase ();

		/****************** GetAllZLayers ******************/
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "* Return all Z layer ids in sequence ordered by overlay level from lowest layer to highest ( foreground ). The first layer ID in sequence is the default layer that can't be removed.
	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger
	:rtype: None") GetAllZLayers;
		void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);

		/****************** GetGradientBackground ******************/
		%feature("compactdefaultargs") GetGradientBackground;
		%feature("autodoc", "* Returns the gradient background of the view.
	:rtype: Aspect_GradientBackground") GetGradientBackground;
		const Aspect_GradientBackground & GetGradientBackground ();

		/****************** Grid ******************/
		%feature("compactdefaultargs") Grid;
		%feature("autodoc", "* Returns the defined grid in <self>.
	:rtype: opencascade::handle<Aspect_Grid>") Grid;
		opencascade::handle<Aspect_Grid> Grid ();

		/****************** GridDrawMode ******************/
		%feature("compactdefaultargs") GridDrawMode;
		%feature("autodoc", "* Returns the current grid draw mode defined in <self>.
	:rtype: Aspect_GridDrawMode") GridDrawMode;
		Aspect_GridDrawMode GridDrawMode ();

		/****************** GridEcho ******************/
		%feature("compactdefaultargs") GridEcho;
		%feature("autodoc", "* Returns True when grid echo must be displayed at hit point.
	:rtype: bool") GridEcho;
		Standard_Boolean GridEcho ();

		/****************** GridType ******************/
		%feature("compactdefaultargs") GridType;
		%feature("autodoc", "* Returns the current grid type defined in <self>.
	:rtype: Aspect_GridType") GridType;
		Aspect_GridType GridType ();

		/****************** HideGridEcho ******************/
		%feature("compactdefaultargs") HideGridEcho;
		%feature("autodoc", "* Temporarly hide grid echo.
	:param theView:
	:type theView: V3d_View
	:rtype: None") HideGridEcho;
		void HideGridEcho (const opencascade::handle<V3d_View> & theView);

		/****************** IfMoreViews ******************/
		%feature("compactdefaultargs") IfMoreViews;
		%feature("autodoc", "* Returns True if One View more can be defined in this Viewer.
	:rtype: bool") IfMoreViews;
		Standard_Boolean IfMoreViews ();

		/****************** InitActiveLights ******************/
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "* Initializes an internal iteratator on the active Lights.
	:rtype: None") InitActiveLights;
		void InitActiveLights ();

		/****************** InitActiveViews ******************/
		%feature("compactdefaultargs") InitActiveViews;
		%feature("autodoc", "* Initializes an internal iterator on the active views.
	:rtype: None") InitActiveViews;
		void InitActiveViews ();

		/****************** InitDefinedLights ******************/
		%feature("compactdefaultargs") InitDefinedLights;
		%feature("autodoc", "* Initializes an internal iterattor on the Defined Lights.
	:rtype: None") InitDefinedLights;
		void InitDefinedLights ();

		/****************** InitDefinedViews ******************/
		%feature("compactdefaultargs") InitDefinedViews;
		%feature("autodoc", "* Initializes an internal iterator on the Defined views.
	:rtype: None") InitDefinedViews;
		void InitDefinedViews ();

		/****************** InsertLayerAfter ******************/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "* Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. Layer rendering order is defined by its position in list (altered by theLayerAfter) and IsImmediate() flag (all layers with IsImmediate() flag are drawn afterwards); @param theNewLayerId [out] id of created layer; layer id is arbitrary and does not depend on layer position in the list @param theSettings [in] new layer settings @param theLayerBefore [in] id of layer to append new layer after returns False if the layer can not be created
	:param theNewLayerId:
	:type theNewLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:param theLayerBefore:
	:type theLayerBefore: Graphic3d_ZLayerId
	:rtype: bool") InsertLayerAfter;
		Standard_Boolean InsertLayerAfter (Graphic3d_ZLayerId & theNewLayerId,const Graphic3d_ZLayerSettings & theSettings,const Graphic3d_ZLayerId theLayerBefore);

		/****************** InsertLayerBefore ******************/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "* Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. Layer rendering order is defined by its position in list (altered by theLayerAfter) and IsImmediate() flag (all layers with IsImmediate() flag are drawn afterwards); @param theNewLayerId [out] id of created layer; layer id is arbitrary and does not depend on layer position in the list @param theSettings [in] new layer settings @param theLayerAfter [in] id of layer to append new layer before returns False if the layer can not be created
	:param theNewLayerId:
	:type theNewLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:param theLayerAfter:
	:type theLayerAfter: Graphic3d_ZLayerId
	:rtype: bool") InsertLayerBefore;
		Standard_Boolean InsertLayerBefore (Graphic3d_ZLayerId & theNewLayerId,const Graphic3d_ZLayerSettings & theSettings,const Graphic3d_ZLayerId theLayerAfter);

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidates viewer content but does not redraw it.
	:rtype: None") Invalidate;
		void Invalidate ();

		/****************** IsActive ******************/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "* Returns Standard_True if a grid is activated in <self>.
	:rtype: bool") IsActive;
		Standard_Boolean IsActive ();

		/****************** IsGlobalLight ******************/
		%feature("compactdefaultargs") IsGlobalLight;
		%feature("autodoc", ":param TheLight:
	:type TheLight: V3d_Light
	:rtype: bool") IsGlobalLight;
		Standard_Boolean IsGlobalLight (const opencascade::handle<V3d_Light> & TheLight);

		/****************** LastActiveView ******************/
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "* returns true if there is only one active view.
	:rtype: bool") LastActiveView;
		Standard_Boolean LastActiveView ();

		/****************** MoreActiveLights ******************/
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "* returns true if there are more active Light(s) to return.
	:rtype: bool") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();

		/****************** MoreActiveViews ******************/
		%feature("compactdefaultargs") MoreActiveViews;
		%feature("autodoc", "* Returns true if there are more active view(s) to return.
	:rtype: bool") MoreActiveViews;
		Standard_Boolean MoreActiveViews ();

		/****************** MoreDefinedLights ******************/
		%feature("compactdefaultargs") MoreDefinedLights;
		%feature("autodoc", "* Returns true if there are more Defined Light(s) to return.
	:rtype: bool") MoreDefinedLights;
		Standard_Boolean MoreDefinedLights ();

		/****************** MoreDefinedViews ******************/
		%feature("compactdefaultargs") MoreDefinedViews;
		%feature("autodoc", "* returns true if there are more Defined view(s) to return.
	:rtype: bool") MoreDefinedViews;
		Standard_Boolean MoreDefinedViews ();

		/****************** NextActiveLights ******************/
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "* Go to the next active Light (if there is not, ActiveLight() will raise an exception)
	:rtype: None") NextActiveLights;
		void NextActiveLights ();

		/****************** NextActiveViews ******************/
		%feature("compactdefaultargs") NextActiveViews;
		%feature("autodoc", "* Go to the next active view (if there is not, ActiveView will raise an exception)
	:rtype: None") NextActiveViews;
		void NextActiveViews ();

		/****************** NextDefinedLights ******************/
		%feature("compactdefaultargs") NextDefinedLights;
		%feature("autodoc", "* Go to the next Defined Light (if there is not, DefinedLight() will raise an exception)
	:rtype: None") NextDefinedLights;
		void NextDefinedLights ();

		/****************** NextDefinedViews ******************/
		%feature("compactdefaultargs") NextDefinedViews;
		%feature("autodoc", "* Go to the next Defined view (if there is not, DefinedView will raise an exception)
	:rtype: None") NextDefinedViews;
		void NextDefinedViews ();

		/****************** PrivilegedPlane ******************/
		%feature("compactdefaultargs") PrivilegedPlane;
		%feature("autodoc", "* @name privileged plane management
	:rtype: gp_Ax3") PrivilegedPlane;
		const gp_Ax3  PrivilegedPlane ();

		/****************** RectangularGridGraphicValues ******************/
		%feature("compactdefaultargs") RectangularGridGraphicValues;
		%feature("autodoc", "* Returns the location and the size of the grid.
	:param XSize:
	:type XSize: float
	:param YSize:
	:type YSize: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") RectangularGridGraphicValues;
		void RectangularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** RectangularGridValues ******************/
		%feature("compactdefaultargs") RectangularGridValues;
		%feature("autodoc", "* Returns the definition of the rectangular grid.
	:param XOrigin:
	:type XOrigin: float
	:param YOrigin:
	:type YOrigin: float
	:param XStep:
	:type XStep: float
	:param YStep:
	:type YStep: float
	:param RotationAngle:
	:type RotationAngle: float
	:rtype: None") RectangularGridValues;
		void RectangularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Redraw ******************/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "* Redraws all the views of the Viewer even if no modification has taken place. Must be called if all the views of the Viewer are exposed, as for example in a global DeIconification.
	:rtype: None") Redraw;
		void Redraw ();

		/****************** RedrawImmediate ******************/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "* Updates layer of immediate presentations.
	:rtype: None") RedrawImmediate;
		void RedrawImmediate ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Suppresses the Viewer.
	:rtype: None") Remove;
		void Remove ();

		/****************** RemoveZLayer ******************/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "* Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there are always default bottom-level layer that can't be removed.
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: bool") RemoveZLayer;
		Standard_Boolean RemoveZLayer (const Graphic3d_ZLayerId theLayerId);

		/****************** SetCircularGridGraphicValues ******************/
		%feature("compactdefaultargs") SetCircularGridGraphicValues;
		%feature("autodoc", "* Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.
	:param Radius:
	:type Radius: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") SetCircularGridGraphicValues;
		void SetCircularGridGraphicValues (const Standard_Real Radius,const Standard_Real OffSet);

		/****************** SetCircularGridValues ******************/
		%feature("compactdefaultargs") SetCircularGridValues;
		%feature("autodoc", "* Sets the definition of the circular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <RadiusStep> defines the interval between 2 circles. <DivisionNumber> defines the section number of one half circle. <RotationAngle> defines the rotation angle of the grid.
	:param XOrigin:
	:type XOrigin: float
	:param YOrigin:
	:type YOrigin: float
	:param RadiusStep:
	:type RadiusStep: float
	:param DivisionNumber:
	:type DivisionNumber: int
	:param RotationAngle:
	:type RotationAngle: float
	:rtype: None") SetCircularGridValues;
		void SetCircularGridValues (const Standard_Real XOrigin,const Standard_Real YOrigin,const Standard_Real RadiusStep,const Standard_Integer DivisionNumber,const Standard_Real RotationAngle);

		/****************** SetComputedMode ******************/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "* Set if the computed mode can be used.
	:param theMode:
	:type theMode: bool
	:rtype: None") SetComputedMode;
		void SetComputedMode (const Standard_Boolean theMode);

		/****************** SetDefaultBackgroundColor ******************/
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "* Defines the default background colour of views attached to the viewer by supplying the color object
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_Color & theColor);

		/****************** SetDefaultBackgroundColor ******************/
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "* Defines the default base colour of views attached to the Viewer by supplying the type of colour definition and the three component values.
	:param theType:
	:type theType: Quantity_TypeOfColor
	:param theV1:
	:type theV1: float
	:param theV2:
	:type theV2: float
	:param theV3:
	:type theV3: float
	:rtype: None") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_TypeOfColor theType,const Standard_Real theV1,const Standard_Real theV2,const Standard_Real theV3);

		/****************** SetDefaultBgGradientColors ******************/
		%feature("compactdefaultargs") SetDefaultBgGradientColors;
		%feature("autodoc", "* Defines the default gradient background colours of views attached to the viewer by supplying the colour objects
	:param theColor1:
	:type theColor1: Quantity_Color
	:param theColor2:
	:type theColor2: Quantity_Color
	:param theFillStyle: default value is Aspect_GFM_HOR
	:type theFillStyle: Aspect_GradientFillMethod
	:rtype: None") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors (const Quantity_Color & theColor1,const Quantity_Color & theColor2,const Aspect_GradientFillMethod theFillStyle = Aspect_GFM_HOR);

		/****************** SetDefaultComputedMode ******************/
		%feature("compactdefaultargs") SetDefaultComputedMode;
		%feature("autodoc", "* Set if by default the computed mode must be used.
	:param theMode:
	:type theMode: bool
	:rtype: None") SetDefaultComputedMode;
		void SetDefaultComputedMode (const Standard_Boolean theMode);

		/****************** SetDefaultLights ******************/
		%feature("compactdefaultargs") SetDefaultLights;
		%feature("autodoc", "* @name lights management Defines default lights: positional-light 0.3 0. 0. directional-light V3d_XnegYposZpos directional-light V3d_XnegYneg ambient-light
	:rtype: None") SetDefaultLights;
		void SetDefaultLights ();

		/****************** SetDefaultRenderingParams ******************/
		%feature("compactdefaultargs") SetDefaultRenderingParams;
		%feature("autodoc", "* Set default Rendering Parameters.
	:param theParams:
	:type theParams: Graphic3d_RenderingParams
	:rtype: None") SetDefaultRenderingParams;
		void SetDefaultRenderingParams (const Graphic3d_RenderingParams & theParams);

		/****************** SetDefaultShadingModel ******************/
		%feature("compactdefaultargs") SetDefaultShadingModel;
		%feature("autodoc", "* Gives the default type of SHADING.
	:param theType:
	:type theType: Graphic3d_TypeOfShadingModel
	:rtype: None") SetDefaultShadingModel;
		void SetDefaultShadingModel (const Graphic3d_TypeOfShadingModel theType);

		/****************** SetDefaultTypeOfView ******************/
		%feature("compactdefaultargs") SetDefaultTypeOfView;
		%feature("autodoc", "* Set the default type of View (orthographic or perspective projection) to be returned by CreateView() method.
	:param theType:
	:type theType: V3d_TypeOfView
	:rtype: None") SetDefaultTypeOfView;
		void SetDefaultTypeOfView (const V3d_TypeOfView theType);

		/****************** SetDefaultViewProj ******************/
		%feature("compactdefaultargs") SetDefaultViewProj;
		%feature("autodoc", "* Sets the default projection for creating views in the viewer.
	:param theOrientation:
	:type theOrientation: V3d_TypeOfOrientation
	:rtype: None") SetDefaultViewProj;
		void SetDefaultViewProj (const V3d_TypeOfOrientation theOrientation);

		/****************** SetDefaultViewSize ******************/
		%feature("compactdefaultargs") SetDefaultViewSize;
		%feature("autodoc", "* Gives a default size for the creation of views of the viewer.
	:param theSize:
	:type theSize: float
	:rtype: None") SetDefaultViewSize;
		void SetDefaultViewSize (const Standard_Real theSize);

		/****************** SetDefaultVisualization ******************/
		%feature("compactdefaultargs") SetDefaultVisualization;
		%feature("autodoc", "* Gives the default visualization mode.
	:param theType:
	:type theType: V3d_TypeOfVisualization
	:rtype: None") SetDefaultVisualization;
		void SetDefaultVisualization (const V3d_TypeOfVisualization theType);

		/****************** SetGridEcho ******************/
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "* Show/Don't show grid echo to the hit point. If True,the grid echo will be shown at ConvertToGrid() time.
	:param showGrid: default value is Standard_True
	:type showGrid: bool
	:rtype: None") SetGridEcho;
		void SetGridEcho (const Standard_Boolean showGrid = Standard_True);

		/****************** SetGridEcho ******************/
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "* Show grid echo <aMarker> to the hit point. Warning: When the grid echo marker is not set, a default marker is build with the attributes: marker type : Aspect_TOM_STAR marker color : Quantity_NOC_GRAY90 marker size : 3.0
	:param aMarker:
	:type aMarker: Graphic3d_AspectMarker3d
	:rtype: None") SetGridEcho;
		void SetGridEcho (const opencascade::handle<Graphic3d_AspectMarker3d> & aMarker);

		/****************** SetLightOff ******************/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "* Deactivates MyLight in this viewer.
	:param theLight:
	:type theLight: V3d_Light
	:rtype: None") SetLightOff;
		void SetLightOff (const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOff ******************/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "* Deactivate all the Lights defined in this viewer.
	:rtype: None") SetLightOff;
		void SetLightOff ();

		/****************** SetLightOn ******************/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "* Activates MyLight in the viewer.
	:param theLight:
	:type theLight: V3d_Light
	:rtype: None") SetLightOn;
		void SetLightOn (const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOn ******************/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "* Activates all the lights defined in this viewer.
	:rtype: None") SetLightOn;
		void SetLightOn ();

		/****************** SetPrivilegedPlane ******************/
		%feature("compactdefaultargs") SetPrivilegedPlane;
		%feature("autodoc", ":param thePlane:
	:type thePlane: gp_Ax3
	:rtype: None") SetPrivilegedPlane;
		void SetPrivilegedPlane (const gp_Ax3 & thePlane);

		/****************** SetRectangularGridGraphicValues ******************/
		%feature("compactdefaultargs") SetRectangularGridGraphicValues;
		%feature("autodoc", "* Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.
	:param XSize:
	:type XSize: float
	:param YSize:
	:type YSize: float
	:param OffSet:
	:type OffSet: float
	:rtype: None") SetRectangularGridGraphicValues;
		void SetRectangularGridGraphicValues (const Standard_Real XSize,const Standard_Real YSize,const Standard_Real OffSet);

		/****************** SetRectangularGridValues ******************/
		%feature("compactdefaultargs") SetRectangularGridValues;
		%feature("autodoc", "* Sets the definition of the rectangular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <XStep> defines the interval between 2 vertical lines. <YStep> defines the interval between 2 horizontal lines. <RotationAngle> defines the rotation angle of the grid.
	:param XOrigin:
	:type XOrigin: float
	:param YOrigin:
	:type YOrigin: float
	:param XStep:
	:type XStep: float
	:param YStep:
	:type YStep: float
	:param RotationAngle:
	:type RotationAngle: float
	:rtype: None") SetRectangularGridValues;
		void SetRectangularGridValues (const Standard_Real XOrigin,const Standard_Real YOrigin,const Standard_Real XStep,const Standard_Real YStep,const Standard_Real RotationAngle);

		/****************** SetViewOff ******************/
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "* Deactivates all the views of a Viewer attached to a window.
	:rtype: None") SetViewOff;
		void SetViewOff ();

		/****************** SetViewOff ******************/
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "* Deactivates a particular view in the Viewer. Must be call if the Window attached to the view has been Iconified .
	:param theView:
	:type theView: V3d_View
	:rtype: None") SetViewOff;
		void SetViewOff (const opencascade::handle<V3d_View> & theView);

		/****************** SetViewOn ******************/
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "* Activates all of the views of a viewer attached to a window.
	:rtype: None") SetViewOn;
		void SetViewOn ();

		/****************** SetViewOn ******************/
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "* Activates a particular view in the Viewer. Must be call if the Window attached to the view has been Deiconified.
	:param theView:
	:type theView: V3d_View
	:rtype: None") SetViewOn;
		void SetViewOn (const opencascade::handle<V3d_View> & theView);

		/****************** SetZLayerSettings ******************/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "* Sets the settings for a single Z layer.
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: None") SetZLayerSettings;
		void SetZLayerSettings (const Graphic3d_ZLayerId theLayerId,const Graphic3d_ZLayerSettings & theSettings);

		/****************** ShowGridEcho ******************/
		%feature("compactdefaultargs") ShowGridEcho;
		%feature("autodoc", "* Display grid echo at requested point in the view.
	:param theView:
	:type theView: V3d_View
	:param thePoint:
	:type thePoint: Graphic3d_Vertex
	:rtype: None") ShowGridEcho;
		void ShowGridEcho (const opencascade::handle<V3d_View> & theView,const Graphic3d_Vertex & thePoint);

		/****************** StructureManager ******************/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "* Returns the structure manager associated to this viewer.
	:rtype: opencascade::handle<Graphic3d_StructureManager>") StructureManager;
		opencascade::handle<Graphic3d_StructureManager> StructureManager ();

		/****************** UnHighlight ******************/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "* UnHighlight all Objects in All the views.
	:rtype: None") UnHighlight;
		void UnHighlight ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Deprecated, Redraw() should be used instead.
	:rtype: None") Update;
		void Update ();

		/****************** UpdateLights ******************/
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "* Updates the lights of all the views of a viewer.
	:rtype: None") UpdateLights;
		void UpdateLights ();

		/****************** V3d_Viewer ******************/
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "* Create a Viewer with the given graphic driver and with default parameters: - View orientation: V3d_XposYnegZpos - View background: Quantity_NOC_GRAY30 - Shading model: V3d_GOURAUD
	:param theDriver:
	:type theDriver: Graphic3d_GraphicDriver
	:rtype: None") V3d_Viewer;
		 V3d_Viewer (const opencascade::handle<Graphic3d_GraphicDriver> & theDriver);

		/****************** V3d_Viewer ******************/
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "* @name deprecated methods
	:param theDriver:
	:type theDriver: Graphic3d_GraphicDriver
	:param theName:
	:type theName: Standard_ExtString
	:param theDomain: default value is ""
	:type theDomain: char *
	:param theViewSize: default value is 1000.0
	:type theViewSize: float
	:param theViewProj: default value is V3d_XposYnegZpos
	:type theViewProj: V3d_TypeOfOrientation
	:param theViewBackground: default value is Quantity_NOC_GRAY30
	:type theViewBackground: Quantity_Color
	:param theVisualization: default value is V3d_ZBUFFER
	:type theVisualization: V3d_TypeOfVisualization
	:param theShadingModel: default value is Graphic3d_TOSM_VERTEX
	:type theShadingModel: Graphic3d_TypeOfShadingModel
	:param theComputedMode: default value is Standard_True
	:type theComputedMode: bool
	:param theDefaultComputedMode: default value is Standard_True
	:type theDefaultComputedMode: bool
	:rtype: None") V3d_Viewer;
		 V3d_Viewer (const opencascade::handle<Graphic3d_GraphicDriver> & theDriver,const Standard_ExtString theName,const char * theDomain = "",const Standard_Real theViewSize = 1000.0,const V3d_TypeOfOrientation theViewProj = V3d_XposYnegZpos,const Quantity_Color & theViewBackground = Quantity_NOC_GRAY30,const V3d_TypeOfVisualization theVisualization = V3d_ZBUFFER,const Graphic3d_TypeOfShadingModel theShadingModel = Graphic3d_TOSM_VERTEX,const Standard_Boolean theComputedMode = Standard_True,const Standard_Boolean theDefaultComputedMode = Standard_True);

		/****************** ZLayerSettings ******************/
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "* Returns the settings of a single Z layer.
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: Graphic3d_ZLayerSettings") ZLayerSettings;
		const Graphic3d_ZLayerSettings & ZLayerSettings (const Graphic3d_ZLayerId theLayerId);

};


%make_alias(V3d_Viewer)

%extend V3d_Viewer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class V3d_DirectionalLight *
*****************************/
%nodefaultctor V3d_DirectionalLight;
class V3d_DirectionalLight : public V3d_PositionLight {
	public:
		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Defines the direction of the light source by a predefined orientation.
	:param theDirection:
	:type theDirection: V3d_TypeOfOrientation
	:rtype: None") SetDirection;
		void SetDirection (V3d_TypeOfOrientation theDirection);

		/****************** V3d_DirectionalLight ******************/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "* Creates a directional light source in the viewer.
	:param theDirection: default value is V3d_XposYposZpos
	:type theDirection: V3d_TypeOfOrientation
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theIsHeadlight: default value is Standard_False
	:type theIsHeadlight: bool
	:rtype: None") V3d_DirectionalLight;
		 V3d_DirectionalLight (const V3d_TypeOfOrientation theDirection = V3d_XposYposZpos,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Boolean theIsHeadlight = Standard_False);

		/****************** V3d_DirectionalLight ******************/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "* Creates a directional light source in the viewer.
	:param theDirection:
	:type theDirection: gp_Dir
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theIsHeadlight: default value is Standard_False
	:type theIsHeadlight: bool
	:rtype: None") V3d_DirectionalLight;
		 V3d_DirectionalLight (const gp_Dir & theDirection,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Boolean theIsHeadlight = Standard_False);

		/****************** V3d_DirectionalLight ******************/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", ":param theViewer:
	:type theViewer: V3d_Viewer
	:param theDirection: default value is V3d_XposYposZpos
	:type theDirection: V3d_TypeOfOrientation
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theIsHeadlight: default value is Standard_False
	:type theIsHeadlight: bool
	:rtype: None") V3d_DirectionalLight;
		 V3d_DirectionalLight (const opencascade::handle<V3d_Viewer> & theViewer,const V3d_TypeOfOrientation theDirection = V3d_XposYposZpos,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Boolean theIsHeadlight = Standard_False);

		/****************** V3d_DirectionalLight ******************/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "* Creates a directional light source in the viewer. theXt, theYt, theZt : Coordinate of light source Target. theXp, theYp, theZp : Coordinate of light source Position. The others parameters describe before.
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theXt:
	:type theXt: float
	:param theYt:
	:type theYt: float
	:param theZt:
	:type theZt: float
	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:param theZp:
	:type theZp: float
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theIsHeadlight: default value is Standard_False
	:type theIsHeadlight: bool
	:rtype: None") V3d_DirectionalLight;
		 V3d_DirectionalLight (const opencascade::handle<V3d_Viewer> & theViewer,const Standard_Real theXt,const Standard_Real theYt,const Standard_Real theZt,const Standard_Real theXp,const Standard_Real theYp,const Standard_Real theZp,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Boolean theIsHeadlight = Standard_False);

};


%make_alias(V3d_DirectionalLight)

%extend V3d_DirectionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class V3d_PositionalLight *
****************************/
%nodefaultctor V3d_PositionalLight;
class V3d_PositionalLight : public V3d_PositionLight {
	public:
		/****************** V3d_PositionalLight ******************/
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "* Creates an isolated light source in the viewer with default attenuation factors (1.0, 0.0).
	:param thePos:
	:type thePos: gp_Pnt
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:rtype: None") V3d_PositionalLight;
		 V3d_PositionalLight (const gp_Pnt & thePos,const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_PositionalLight ******************/
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", ":param theViewer:
	:type theViewer: V3d_Viewer
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theConstAttenuation: default value is 1.0
	:type theConstAttenuation: float
	:param theLinearAttenuation: default value is 0.0
	:type theLinearAttenuation: float
	:rtype: None") V3d_PositionalLight;
		 V3d_PositionalLight (const opencascade::handle<V3d_Viewer> & theViewer,const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theConstAttenuation = 1.0,const Standard_Real theLinearAttenuation = 0.0);

};


%make_alias(V3d_PositionalLight)

%extend V3d_PositionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class V3d_SpotLight *
**********************/
%nodefaultctor V3d_SpotLight;
class V3d_SpotLight : public V3d_PositionLight {
	public:
		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Defines the direction of the light source according to a predefined directional vector.
	:param theOrientation:
	:type theOrientation: V3d_TypeOfOrientation
	:rtype: None") SetDirection;
		void SetDirection (V3d_TypeOfOrientation theOrientation);

		/****************** V3d_SpotLight ******************/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "* Creates a light source of the Spot type in the viewer with default attenuation factors (1.0, 0.0), concentration factor 1.0 and spot angle 30 degrees.
	:param thePos:
	:type thePos: gp_Pnt
	:param theDirection: default value is V3d_XnegYnegZpos
	:type theDirection: V3d_TypeOfOrientation
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:rtype: None") V3d_SpotLight;
		 V3d_SpotLight (const gp_Pnt & thePos,const V3d_TypeOfOrientation theDirection = V3d_XnegYnegZpos,const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_SpotLight ******************/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "* Creates a light source of the Spot type in the viewer with default attenuation factors (1.0, 0.0), concentration factor 1.0 and spot angle 30 degrees.
	:param thePos:
	:type thePos: gp_Pnt
	:param theDirection:
	:type theDirection: gp_Dir
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:rtype: None") V3d_SpotLight;
		 V3d_SpotLight (const gp_Pnt & thePos,const gp_Dir & theDirection,const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_SpotLight ******************/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", ":param theViewer:
	:type theViewer: V3d_Viewer
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDirection: default value is V3d_XnegYnegZpos
	:type theDirection: V3d_TypeOfOrientation
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theConstAttenuation: default value is 1.0
	:type theConstAttenuation: float
	:param theLinearAttenuation: default value is 0.0
	:type theLinearAttenuation: float
	:param theConcentration: default value is 1.0
	:type theConcentration: float
	:param theAngle: default value is 0.523599
	:type theAngle: float
	:rtype: None") V3d_SpotLight;
		 V3d_SpotLight (const opencascade::handle<V3d_Viewer> & theViewer,const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const V3d_TypeOfOrientation theDirection = V3d_XnegYnegZpos,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theConstAttenuation = 1.0,const Standard_Real theLinearAttenuation = 0.0,const Standard_Real theConcentration = 1.0,const Standard_Real theAngle = 0.523599);

		/****************** V3d_SpotLight ******************/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "* theXt, theYt, theZt : Coordinate of light source Target. theXp, theYp, theZp : Coordinate of light source Position.
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theXt:
	:type theXt: float
	:param theYt:
	:type theYt: float
	:param theZt:
	:type theZt: float
	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:param theZp:
	:type theZp: float
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color
	:param theConstAttenuation: default value is 1.0
	:type theConstAttenuation: float
	:param theLinearAttenuation: default value is 0.0
	:type theLinearAttenuation: float
	:param theConcentration: default value is 1.0
	:type theConcentration: float
	:param theAngle: default value is 0.523599
	:type theAngle: float
	:rtype: None") V3d_SpotLight;
		 V3d_SpotLight (const opencascade::handle<V3d_Viewer> & theViewer,const Standard_Real theXt,const Standard_Real theYt,const Standard_Real theZt,const Standard_Real theXp,const Standard_Real theYp,const Standard_Real theZp,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theConstAttenuation = 1.0,const Standard_Real theLinearAttenuation = 0.0,const Standard_Real theConcentration = 1.0,const Standard_Real theAngle = 0.523599);

};


%make_alias(V3d_SpotLight)

%extend V3d_SpotLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
