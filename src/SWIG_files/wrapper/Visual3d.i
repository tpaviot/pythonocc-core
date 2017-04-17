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
%module (package="OCC") Visual3d

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


%include Visual3d_headers.i


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
typedef NCollection_List <Handle_Visual3d_LayerItem> Visual3d_NListOfLayerItem;
typedef Visual3d_View * Visual3d_ViewPtr;
typedef Visual3d_ViewManager * Visual3d_ViewManagerPtr;
typedef NCollection_DataMap <Graphic3d_ZLayerId , Graphic3d_ZLayerSettings> Visual3d_MapOfZLayerSettings;
/* end typedefs declaration */

/* public enums */
enum Visual3d_TypeOfAnswer {
	Visual3d_TOA_YES = 0,
	Visual3d_TOA_NO = 1,
	Visual3d_TOA_COMPUTE = 2,
};

enum Visual3d_TypeOfBackfacingModel {
	Visual3d_TOBM_AUTOMATIC = 0,
	Visual3d_TOBM_FORCE = 1,
	Visual3d_TOBM_DISABLE = 2,
};

enum Visual3d_TypeOfLightSource {
	Visual3d_TOLS_AMBIENT = 0,
	Visual3d_TOLS_DIRECTIONAL = 1,
	Visual3d_TOLS_POSITIONAL = 2,
	Visual3d_TOLS_SPOT = 3,
};

enum Visual3d_TypeOfModel {
	Visual3d_TOM_NONE = 0,
	Visual3d_TOM_FACET = 1,
	Visual3d_TOM_VERTEX = 2,
	Visual3d_TOM_FRAGMENT = 3,
};

enum Visual3d_TypeOfOrder {
	Visual3d_TOO_TOPFIRST = 0,
	Visual3d_TOO_BOTTOMFIRST = 1,
};

enum Visual3d_TypeOfProjection {
	Visual3d_TOP_PERSPECTIVE = 0,
	Visual3d_TOP_PARALLEL = 1,
};

enum Visual3d_TypeOfSurfaceDetail {
	Visual3d_TOD_NONE = 0,
	Visual3d_TOD_ENVIRONMENT = 1,
	Visual3d_TOD_ALL = 2,
};

enum Visual3d_TypeOfVisualization {
	Visual3d_TOV_WIREFRAME = 0,
	Visual3d_TOV_SHADING = 1,
};

/* end public enums declaration */

%nodefaultctor Visual3d_ContextPick;
class Visual3d_ContextPick {
	public:
		%feature("compactdefaultargs") Visual3d_ContextPick;
		%feature("autodoc", "	* Creates a context from default values //! Aperture	: 4.0 Depth	: 10 Order	: TOO_TOPFIRST

	:rtype: None
") Visual3d_ContextPick;
		 Visual3d_ContextPick ();
		%feature("compactdefaultargs") Visual3d_ContextPick;
		%feature("autodoc", "	* Creates a context with the values defined Warning: Raises ContextPickDefinitionError if <Depth> or <Aperture> is a negative value.

	:param Aperture:
	:type Aperture: float
	:param Depth:
	:type Depth: int
	:param Order:
	:type Order: Visual3d_TypeOfOrder
	:rtype: None
") Visual3d_ContextPick;
		 Visual3d_ContextPick (const Standard_Real Aperture,const Standard_Integer Depth,const Visual3d_TypeOfOrder Order);
		%feature("compactdefaultargs") SetAperture;
		%feature("autodoc", "	* Modifies the size of the pick window. Category: Methods to modifies the class definition Warning: Raises ContextPickDefinitionError if <Aperture> is a negative value.

	:param Aperture:
	:type Aperture: float
	:rtype: None
") SetAperture;
		void SetAperture (const Standard_Real Aperture);
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	* Modifies the pick depth a priori. Category: Methods to modifies the class definition Warning: Raises ContextPickDefinitionError if <Depth> is a negative value.

	:param Depth:
	:type Depth: int
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Integer Depth);
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "	* Modifies the order of picking. //! TypeOfOrder : TOO_TOPFIRST TOO_BOTTOMFIRST

	:param Order:
	:type Order: Visual3d_TypeOfOrder
	:rtype: None
") SetOrder;
		void SetOrder (const Visual3d_TypeOfOrder Order);
		%feature("compactdefaultargs") Aperture;
		%feature("autodoc", "	* Returns the size of the pick window <self>.

	:rtype: float
") Aperture;
		Standard_Real Aperture ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Returns the effective pick depth of <self>.

	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "	* Returns the order of picking of <self>. //! TypeOfOrder	: TOO_TOPFIRST TOO_BOTTOMFIRST

	:rtype: Visual3d_TypeOfOrder
") Order;
		Visual3d_TypeOfOrder Order ();
};


%extend Visual3d_ContextPick {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_ContextView;
class Visual3d_ContextView {
	public:
		%feature("compactdefaultargs") Visual3d_ContextView;
		%feature("autodoc", "	* Creates a context from default values //! Aliasing		 : OFF BackZClipping	 : OFF FrontZClipping	 : OFF Depth-cueing	 : OFF Light source	 : 0 Clipping plane	 : 0 Type Of Visualization : TOV_WIREFRAME Type Of Model	 : TOM_NONE Type Of SurfaceDetail : TOSD_NONE

	:rtype: None
") Visual3d_ContextView;
		 Visual3d_ContextView ();
		%feature("compactdefaultargs") SetSurfaceDetail;
		%feature("autodoc", "	* Selects the kind of rendering default to: TOSD_NONE

	:param TOSD:
	:type TOSD: Visual3d_TypeOfSurfaceDetail
	:rtype: None
") SetSurfaceDetail;
		void SetSurfaceDetail (const Visual3d_TypeOfSurfaceDetail TOSD);
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "	* Sets the environment texture to use no environment texture by default

	:param ATexture:
	:type ATexture: Handle_Graphic3d_TextureEnv &
	:rtype: None
") SetTextureEnv;
		void SetTextureEnv (const Handle_Graphic3d_TextureEnv & ATexture);
		%feature("compactdefaultargs") SetAliasingOn;
		%feature("autodoc", "	* Activates antialiasing. Antialiasing can be activated on all the structures in the view

	:rtype: None
") SetAliasingOn;
		void SetAliasingOn ();
		%feature("compactdefaultargs") SetAliasingOff;
		%feature("autodoc", "	* Deactivates the antialiasing.

	:rtype: None
") SetAliasingOff;
		void SetAliasingOff ();
		%feature("compactdefaultargs") SetDepthCueingBackPlane;
		%feature("autodoc", "	* Modifies the back depth-cueing plane. Category: Methods to modify the class definition Warning: Raises DepthCueingDefinitionError if <BackPlane> is front of <FrontPlane> and DepthCueing is ON.

	:param ABack:
	:type ABack: float
	:rtype: None
") SetDepthCueingBackPlane;
		void SetDepthCueingBackPlane (const Standard_Real ABack);
		%feature("compactdefaultargs") SetDepthCueingFrontPlane;
		%feature("autodoc", "	* Modifies the front depth-cueing plane. Category: Methods to modify the class definition Warning: Raises DepthCueingDefinitionError if <BackPlane> is front of <FrontPlane> and DepthCueing is ON.

	:param ABack:
	:type ABack: float
	:rtype: None
") SetDepthCueingFrontPlane;
		void SetDepthCueingFrontPlane (const Standard_Real ABack);
		%feature("compactdefaultargs") SetDepthCueingOn;
		%feature("autodoc", "	* Activates the depth-cueing. Depth-cueing can be activated on all structures present in the view. Category: Methods to modify the class definition Warning: Raises DepthCueingDefinitionError if <BackPlane> is front of <FrontPlane>.

	:rtype: None
") SetDepthCueingOn;
		void SetDepthCueingOn ();
		%feature("compactdefaultargs") SetDepthCueingOff;
		%feature("autodoc", "	* Deactivates the depth-cueing.

	:rtype: None
") SetDepthCueingOff;
		void SetDepthCueingOff ();
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "	* Returns sequence of clip planes. returns sequence of clip planes.

	:rtype: Graphic3d_SequenceOfHClipPlane
") ClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & ClipPlanes ();
		%feature("compactdefaultargs") ChangeClipPlanes;
		%feature("autodoc", "	* Change clip planes. returns sequence of clip planes.

	:rtype: Graphic3d_SequenceOfHClipPlane
") ChangeClipPlanes;
		Graphic3d_SequenceOfHClipPlane & ChangeClipPlanes ();
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates the light source <ALight>

	:param ALight:
	:type ALight: Handle_Visual3d_Light &
	:rtype: None
") SetLightOn;
		void SetLightOn (const Handle_Visual3d_Light & ALight);
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Deactivates the light source <ALight>

	:param ALight:
	:type ALight: Handle_Visual3d_Light &
	:rtype: None
") SetLightOff;
		void SetLightOff (const Handle_Visual3d_Light & ALight);
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Modifies the shading model when the type of visualization is TOV_SHADING

	:param AModel:
	:type AModel: Visual3d_TypeOfModel
	:rtype: None
") SetModel;
		void SetModel (const Visual3d_TypeOfModel AModel);
		%feature("compactdefaultargs") SetVisualization;
		%feature("autodoc", "	* Modifies the mode of visualization. //! TypeOfVisualization	: TOV_WIREFRAME TOV_SHADING

	:param AVisual:
	:type AVisual: Visual3d_TypeOfVisualization
	:rtype: None
") SetVisualization;
		void SetVisualization (const Visual3d_TypeOfVisualization AVisual);
		%feature("compactdefaultargs") SetZClippingBackPlane;
		%feature("autodoc", "	* Modifies the back Z-clipping plane. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is front of <FrontPlane> and ZClipping is ON.

	:param ABack:
	:type ABack: float
	:rtype: None
") SetZClippingBackPlane;
		void SetZClippingBackPlane (const Standard_Real ABack);
		%feature("compactdefaultargs") SetZClippingFrontPlane;
		%feature("autodoc", "	* Modifies the front Z-clipping plane. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is front of <FrontPlane> and ZClipping is ON.

	:param AFront:
	:type AFront: float
	:rtype: None
") SetZClippingFrontPlane;
		void SetZClippingFrontPlane (const Standard_Real AFront);
		%feature("compactdefaultargs") SetZClippingOn;
		%feature("autodoc", "	* Activates the Z-clipping planes defined by SetZClippingFrontPlane and SetZClippingBackPlane. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is front of <FrontPlane>.

	:rtype: None
") SetZClippingOn;
		void SetZClippingOn ();
		%feature("compactdefaultargs") SetZClippingOff;
		%feature("autodoc", "	* Deactivates the Z-clipping planes defined by SetFrontPlane and SetBackPlane.

	:rtype: None
") SetZClippingOff;
		void SetZClippingOff ();
		%feature("compactdefaultargs") SetFrontZClippingOn;
		%feature("autodoc", "	* Activates the front Z-clipping plane defined by SetFrontPlane method.

	:rtype: None
") SetFrontZClippingOn;
		void SetFrontZClippingOn ();
		%feature("compactdefaultargs") SetFrontZClippingOff;
		%feature("autodoc", "	* Deactivates the front Z-clipping plane defined by SetFrontPlane method.

	:rtype: None
") SetFrontZClippingOff;
		void SetFrontZClippingOff ();
		%feature("compactdefaultargs") SetBackZClippingOn;
		%feature("autodoc", "	* Activates the back Z-clipping plane defined by SetBackPlane method. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is front of <FrontPlane>.

	:rtype: None
") SetBackZClippingOn;
		void SetBackZClippingOn ();
		%feature("compactdefaultargs") SetBackZClippingOff;
		%feature("autodoc", "	* Deactivates the back Z-clipping plane defined by SetBackPlane method.

	:rtype: None
") SetBackZClippingOff;
		void SetBackZClippingOff ();
		%feature("compactdefaultargs") ActivatedLights;
		%feature("autodoc", "	* Returns the group of active light sources in the view of context <self>.

	:rtype: Handle_Visual3d_HSequenceOfLight
") ActivatedLights;
		Handle_Visual3d_HSequenceOfLight ActivatedLights ();
		%feature("compactdefaultargs") NumberOfActivatedLights;
		%feature("autodoc", "	* Returns the number of active light sources in the view of context <self>.

	:rtype: int
") NumberOfActivatedLights;
		Standard_Integer NumberOfActivatedLights ();
		%feature("compactdefaultargs") ActivatedLight;
		%feature("autodoc", "	:param AnIndex:
	:type AnIndex: int
	:rtype: Handle_Visual3d_Light
") ActivatedLight;
		Handle_Visual3d_Light ActivatedLight (const Standard_Integer AnIndex);
		%feature("compactdefaultargs") AliasingIsOn;
		%feature("autodoc", "	* Returns the activity of the aliasing.

	:rtype: bool
") AliasingIsOn;
		Standard_Boolean AliasingIsOn ();
		%feature("compactdefaultargs") BackZClippingIsOn;
		%feature("autodoc", "	* Returns the activity of the ZClipping.

	:rtype: bool
") BackZClippingIsOn;
		Standard_Boolean BackZClippingIsOn ();
		%feature("compactdefaultargs") DepthCueingBackPlane;
		%feature("autodoc", "	* Returns the definition of the back depth-cueing plane.

	:rtype: float
") DepthCueingBackPlane;
		Standard_Real DepthCueingBackPlane ();
		%feature("compactdefaultargs") DepthCueingFrontPlane;
		%feature("autodoc", "	* Returns the definition of the front depth-cueing plane.

	:rtype: float
") DepthCueingFrontPlane;
		Standard_Real DepthCueingFrontPlane ();
		%feature("compactdefaultargs") DepthCueingIsOn;
		%feature("autodoc", "	* Returns the activity of the depth-cueing.

	:rtype: bool
") DepthCueingIsOn;
		Standard_Boolean DepthCueingIsOn ();
		%feature("compactdefaultargs") FrontZClippingIsOn;
		%feature("autodoc", "	* Returns the activity of the ZClipping.

	:rtype: bool
") FrontZClippingIsOn;
		Standard_Boolean FrontZClippingIsOn ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the shading model.

	:rtype: Visual3d_TypeOfModel
") Model;
		Visual3d_TypeOfModel Model ();
		%feature("compactdefaultargs") Visualization;
		%feature("autodoc", "	* Returns the mode of visualization.

	:rtype: Visual3d_TypeOfVisualization
") Visualization;
		Visual3d_TypeOfVisualization Visualization ();
		%feature("compactdefaultargs") ZClippingBackPlane;
		%feature("autodoc", "	* Returns the definition of the back Z-clipping plane.

	:rtype: float
") ZClippingBackPlane;
		Standard_Real ZClippingBackPlane ();
		%feature("compactdefaultargs") ZClippingFrontPlane;
		%feature("autodoc", "	* Returns the definition of the front Z-clipping plane.

	:rtype: float
") ZClippingFrontPlane;
		Standard_Real ZClippingFrontPlane ();
		%feature("compactdefaultargs") SurfaceDetail;
		%feature("autodoc", "	:rtype: Visual3d_TypeOfSurfaceDetail
") SurfaceDetail;
		Visual3d_TypeOfSurfaceDetail SurfaceDetail ();
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_TextureEnv
") TextureEnv;
		Handle_Graphic3d_TextureEnv TextureEnv ();
};


%extend Visual3d_ContextView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_HSequenceOfLight;
class Visual3d_HSequenceOfLight : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_HSequenceOfLight;
		%feature("autodoc", "	:rtype: None
") Visual3d_HSequenceOfLight;
		 Visual3d_HSequenceOfLight ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Visual3d_Light &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_Light & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfLight &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_HSequenceOfLight & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Visual3d_Light &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_Light & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfLight &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_HSequenceOfLight & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Visual3d_Light &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Visual3d_Light & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfLight &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfLight & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Visual3d_Light &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Visual3d_Light & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfLight &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfLight & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Visual3d_HSequenceOfLight
") Split;
		Handle_Visual3d_HSequenceOfLight Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Visual3d_Light &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Visual3d_Light & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Visual3d_Light
") Value;
		Handle_Visual3d_Light Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Visual3d_Light
") ChangeValue;
		Handle_Visual3d_Light ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Visual3d_SequenceOfLight
") Sequence;
		const Visual3d_SequenceOfLight & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Visual3d_SequenceOfLight
") ChangeSequence;
		Visual3d_SequenceOfLight & ChangeSequence ();
};


%extend Visual3d_HSequenceOfLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_HSequenceOfLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_HSequenceOfLight::Handle_Visual3d_HSequenceOfLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_HSequenceOfLight;
class Handle_Visual3d_HSequenceOfLight : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_HSequenceOfLight();
        Handle_Visual3d_HSequenceOfLight(const Handle_Visual3d_HSequenceOfLight &aHandle);
        Handle_Visual3d_HSequenceOfLight(const Visual3d_HSequenceOfLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_HSequenceOfLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_HSequenceOfLight {
    Visual3d_HSequenceOfLight* _get_reference() {
    return (Visual3d_HSequenceOfLight*)$self->Access();
    }
};

%extend Handle_Visual3d_HSequenceOfLight {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_HSequenceOfLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_HSequenceOfView;
class Visual3d_HSequenceOfView : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_HSequenceOfView;
		%feature("autodoc", "	:rtype: None
") Visual3d_HSequenceOfView;
		 Visual3d_HSequenceOfView ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Visual3d_View &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_View & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfView &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_HSequenceOfView & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Visual3d_View &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_View & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfView &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_HSequenceOfView & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Visual3d_View &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Visual3d_View & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfView &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfView & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Visual3d_View &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Visual3d_View & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfView &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfView & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Visual3d_HSequenceOfView
") Split;
		Handle_Visual3d_HSequenceOfView Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Visual3d_View &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Visual3d_View & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Visual3d_View
") Value;
		Handle_Visual3d_View Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Visual3d_View
") ChangeValue;
		Handle_Visual3d_View ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Visual3d_SequenceOfView
") Sequence;
		const Visual3d_SequenceOfView & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Visual3d_SequenceOfView
") ChangeSequence;
		Visual3d_SequenceOfView & ChangeSequence ();
};


%extend Visual3d_HSequenceOfView {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_HSequenceOfView(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_HSequenceOfView::Handle_Visual3d_HSequenceOfView %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_HSequenceOfView;
class Handle_Visual3d_HSequenceOfView : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_HSequenceOfView();
        Handle_Visual3d_HSequenceOfView(const Handle_Visual3d_HSequenceOfView &aHandle);
        Handle_Visual3d_HSequenceOfView(const Visual3d_HSequenceOfView *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_HSequenceOfView DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_HSequenceOfView {
    Visual3d_HSequenceOfView* _get_reference() {
    return (Visual3d_HSequenceOfView*)$self->Access();
    }
};

%extend Handle_Visual3d_HSequenceOfView {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_HSequenceOfView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_Layer;
class Visual3d_Layer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_Layer;
		%feature("autodoc", "	* Creates a layer with the type <Atype>. if <AFlag> == Standard_True then the layer is 'size dependent'. The mapping of the layer is dependent of each window's size. if <AFlag> == Standard_False then the mapping of the layer is dependent of the highest window and the largest window of all the views of the viewer <AViewer>. When the viewer <AViewer> have only one view, the result will be the same with <AFlag> == Standard_False or <AFlag> == Standard_True.

	:param AViewer:
	:type AViewer: Handle_Visual3d_ViewManager &
	:param AType: default value is Aspect_TOL_OVERLAY
	:type AType: Aspect_TypeOfLayer
	:param AFlag: default value is Standard_False
	:type AFlag: bool
	:rtype: None
") Visual3d_Layer;
		 Visual3d_Layer (const Handle_Visual3d_ViewManager & AViewer,const Aspect_TypeOfLayer AType = Aspect_TOL_OVERLAY,const Standard_Boolean AFlag = Standard_False);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Suppress the layer <self>.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Begin;
		%feature("autodoc", "	* Begins the definition of the layer <self> Warning: No default attributes

	:rtype: None
") Begin;
		void Begin ();
		%feature("compactdefaultargs") End;
		%feature("autodoc", "	* Finishs the definition of the layer <self>.

	:rtype: None
") End;
		void End ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear all graphics managed by the layer <self>.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") BeginPolyline;
		%feature("autodoc", "	* After this call, <self> is ready to receive a definition of a polyline with AddVertex().

	:rtype: None
") BeginPolyline;
		void BeginPolyline ();
		%feature("compactdefaultargs") BeginPolygon;
		%feature("autodoc", "	* After this call, <self> is ready to receive a definition of a polygon with AddEdge().

	:rtype: None
") BeginPolygon;
		void BeginPolygon ();
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Puts <X, Y> as a new point in the current primitive. If <AFlag> then it is a draw between last point and this point else it is a move between last point and this point.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param AFlag: default value is Standard_True
	:type AFlag: bool
	:rtype: None
") AddVertex;
		void AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Boolean AFlag = Standard_True);
		%feature("compactdefaultargs") ClosePrimitive;
		%feature("autodoc", "	* After this call, <self> stops the reception of a definition of a Begin... primitive.

	:rtype: None
") ClosePrimitive;
		void ClosePrimitive ();
		%feature("compactdefaultargs") DrawRectangle;
		%feature("autodoc", "	* Draws the rectangle at position <X,Y>.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Width:
	:type Width: float
	:param Height:
	:type Height: float
	:rtype: None
") DrawRectangle;
		void DrawRectangle (const Standard_Real X,const Standard_Real Y,const Standard_Real Width,const Standard_Real Height);
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "	* Get the size of text. The attributes are given with respect to the plane of projection. <AHeight> : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space).

	:param AText:
	:type AText: char *
	:param AHeight:
	:type AHeight: float
	:param AWidth:
	:type AWidth: float &
	:param AnAscent:
	:type AnAscent: float &
	:param ADescent:
	:type ADescent: float &
	:rtype: None
") TextSize;
		void TextSize (const char * AText,const Standard_Real AHeight,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the current color. Warning: No default color

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Modifies the current transparency. Warning: No default transparency

	:param ATransparency:
	:type ATransparency: Standard_ShortReal
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_ShortReal ATransparency);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Unsets the transparency.

	:rtype: None
") UnsetTransparency;
		void UnsetTransparency ();
		%feature("compactdefaultargs") SetLineAttributes;
		%feature("autodoc", "	* Modifies the current lines attributes. Warning: No default attributes

	:param AType:
	:type AType: Aspect_TypeOfLine
	:param AWidth:
	:type AWidth: float
	:rtype: None
") SetLineAttributes;
		void SetLineAttributes (const Aspect_TypeOfLine AType,const Standard_Real AWidth);
		%feature("compactdefaultargs") SetTextAttributes;
		%feature("autodoc", "	* Modifies the current texts attributes. <AFont> defines the name of the font to be used. <AType> defines the display type of the text. <AColor> defines the color of decal or subtitle background. To set the color of the text you can use the SetColor method. Warning: No default attributes

	:param AFont:
	:type AFont: char *
	:param AType:
	:type AType: Aspect_TypeOfDisplayText
	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetTextAttributes;
		void SetTextAttributes (const char * AFont,const Aspect_TypeOfDisplayText AType,const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetOrtho;
		%feature("autodoc", "	* Modifies the current coordinates system of the layer <self>.

	:param Left:
	:type Left: float
	:param Right:
	:type Right: float
	:param Bottom:
	:type Bottom: float
	:param Top:
	:type Top: float
	:param Attach: default value is Aspect_TOC_BOTTOM_LEFT
	:type Attach: Aspect_TypeOfConstraint
	:rtype: None
") SetOrtho;
		void SetOrtho (const Standard_Real Left,const Standard_Real Right,const Standard_Real Bottom,const Standard_Real Top,const Aspect_TypeOfConstraint Attach = Aspect_TOC_BOTTOM_LEFT);
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "	* Modifies the current viewport of the layer <self>.

	:param Width:
	:type Width: int
	:param Height:
	:type Height: int
	:rtype: None
") SetViewport;
		void SetViewport (const Standard_Integer Width,const Standard_Integer Height);
		%feature("compactdefaultargs") CLayer;
		%feature("autodoc", "	* Returns the associated C structure.

	:rtype: Aspect_CLayer2d
") CLayer;
		Aspect_CLayer2d CLayer ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type.

	:rtype: Aspect_TypeOfLayer
") Type;
		Aspect_TypeOfLayer Type ();
		%feature("compactdefaultargs") AddLayerItem;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Visual3d_LayerItem &
	:rtype: None
") AddLayerItem;
		void AddLayerItem (const Handle_Visual3d_LayerItem & Item);
		%feature("compactdefaultargs") RemoveLayerItem;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Visual3d_LayerItem &
	:rtype: None
") RemoveLayerItem;
		void RemoveLayerItem (const Handle_Visual3d_LayerItem & Item);
		%feature("compactdefaultargs") RemoveAllLayerItems;
		%feature("autodoc", "	:rtype: None
") RemoveAllLayerItems;
		void RemoveAllLayerItems ();
		%feature("compactdefaultargs") GetLayerItemList;
		%feature("autodoc", "	:rtype: Visual3d_NListOfLayerItem
") GetLayerItemList;
		const Visual3d_NListOfLayerItem & GetLayerItemList ();
		%feature("compactdefaultargs") RenderLayerItems;
		%feature("autodoc", "	:rtype: None
") RenderLayerItems;
		void RenderLayerItems ();
};


%extend Visual3d_Layer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_Layer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_Layer::Handle_Visual3d_Layer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_Layer;
class Handle_Visual3d_Layer : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_Layer();
        Handle_Visual3d_Layer(const Handle_Visual3d_Layer &aHandle);
        Handle_Visual3d_Layer(const Visual3d_Layer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_Layer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_Layer {
    Visual3d_Layer* _get_reference() {
    return (Visual3d_Layer*)$self->Access();
    }
};

%extend Handle_Visual3d_Layer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_Layer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_LayerItem;
class Visual3d_LayerItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_LayerItem;
		%feature("autodoc", "	* Creates a layer item

	:rtype: None
") Visual3d_LayerItem;
		 Visual3d_LayerItem ();
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
		%feature("compactdefaultargs") IsNeedToRecompute;
		%feature("autodoc", "	:rtype: bool
") IsNeedToRecompute;
		Standard_Boolean IsNeedToRecompute ();
		%feature("compactdefaultargs") SetNeedToRecompute;
		%feature("autodoc", "	:param NeedToRecompute: default value is Standard_True
	:type NeedToRecompute: bool
	:rtype: None
") SetNeedToRecompute;
		void SetNeedToRecompute (const Standard_Boolean NeedToRecompute = Standard_True);
};


%extend Visual3d_LayerItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_LayerItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_LayerItem::Handle_Visual3d_LayerItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_LayerItem;
class Handle_Visual3d_LayerItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_LayerItem();
        Handle_Visual3d_LayerItem(const Handle_Visual3d_LayerItem &aHandle);
        Handle_Visual3d_LayerItem(const Visual3d_LayerItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_LayerItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_LayerItem {
    Visual3d_LayerItem* _get_reference() {
    return (Visual3d_LayerItem*)$self->Access();
    }
};

%extend Handle_Visual3d_LayerItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_LayerItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_Light;
class Visual3d_Light : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates a light from default values. Light sources are created in a visualiser and are activated in one of its views. //! Type	= TOLS_AMBIENT Color	= WHITE

	:rtype: None
") Visual3d_Light;
		 Visual3d_Light ();
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates an AMBIENT light source. Light sources are created in a visualiser and are activated in one of its views.

	:param Color:
	:type Color: Quantity_Color &
	:rtype: None
") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color);
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates a DIRECTIONAL light source. Light sources are created in a visualiser and are activated in one of its views. Warning: Raises LightDefinitionError if <Direction> is null.

	:param Color:
	:type Color: Quantity_Color &
	:param Direction:
	:type Direction: Graphic3d_Vector &
	:param Headlight: default value is Standard_False
	:type Headlight: bool
	:rtype: None
") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color,const Graphic3d_Vector & Direction,const Standard_Boolean Headlight = Standard_False);
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates a POSITIONAL light source. Light sources are created in a visualiser and are activated in one of its views. Warning: Raises LightDefinitionError if <Fact1> and <Fact2> are null. if <Fact1> is a negative value or greater than 1.0. if <Fact2> is a negative value or greater than 1.0.

	:param Color:
	:type Color: Quantity_Color &
	:param Position:
	:type Position: Graphic3d_Vertex &
	:param Fact1:
	:type Fact1: float
	:param Fact2:
	:type Fact2: float
	:rtype: None
") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color,const Graphic3d_Vertex & Position,const Standard_Real Fact1,const Standard_Real Fact2);
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates a SPOT light source. Light sources are created in a visualiser and are activated in one of its views. <Concentration> specifies the intensity distribution of the light. <AngleCone> specifies the angle (radians) of the cone created by the spot. the global attenuation is equal : 1 / (Fact1 + Fact2 * (norm(ObjectPosition - LightPosition))) Warning: Raises LightDefinitionError if <Direction> is null. if <Concentration> is a negative value or greater than 1.0. if <Fact1> and <Fact2> are null. if <Fact1> is a negative value or greater than 1.0. if <Fact2> is a negative value or greater than 1.0. if <AngleCone> is a negative value or greater than PI/2.

	:param Color:
	:type Color: Quantity_Color &
	:param Position:
	:type Position: Graphic3d_Vertex &
	:param Direction:
	:type Direction: Graphic3d_Vector &
	:param Concentration:
	:type Concentration: float
	:param Fact1:
	:type Fact1: float
	:param Fact2:
	:type Fact2: float
	:param AngleCone:
	:type AngleCone: float
	:rtype: None
") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color,const Graphic3d_Vertex & Position,const Graphic3d_Vector & Direction,const Standard_Real Concentration,const Standard_Real Fact1,const Standard_Real Fact2,const Standard_Real AngleCone);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Modifies the angle (radians) of the cone created by the spot. Works only on TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError if the type of the light is not TOLS_SPOT. if <AngleCone> is a negative value or greater than PI/2.

	:param AngleCone:
	:type AngleCone: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real AngleCone);
		%feature("compactdefaultargs") SetAttenuation1;
		%feature("autodoc", "	* Modifies the attenuation factor of the light. Works only on the TOLS_POSITIONAL and TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError if the type of the light is not TOLS_SPOT or TOLS_POSITIONAL. if <Fact1> is a negative value or greater than 1.0.

	:param Fact1:
	:type Fact1: float
	:rtype: None
") SetAttenuation1;
		void SetAttenuation1 (const Standard_Real Fact1);
		%feature("compactdefaultargs") SetAttenuation2;
		%feature("autodoc", "	* Modifies the attenuation factor of the light. Works only on the TOLS_POSITIONAL and TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError if the type of the light is not TOLS_POSITIONAL or TOLS_SPOT. if <Fact2> is a negative value or greater than 1.0..

	:param Fact2:
	:type Fact2: float
	:rtype: None
") SetAttenuation2;
		void SetAttenuation2 (const Standard_Real Fact2);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the colour of the light.

	:param Color:
	:type Color: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & Color);
		%feature("compactdefaultargs") SetConcentration;
		%feature("autodoc", "	* Modifies the intensity distribution of the light. Works only on the TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError if the type of the light is not TOLS_SPOT. if <Concentration> is a negative value or greater than 1.0.

	:param Concentration:
	:type Concentration: float
	:rtype: None
") SetConcentration;
		void SetConcentration (const Standard_Real Concentration);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Modifies the light direction. Works only on the TOLS_DIRECTIONAL and TOLS_SPOT lights. Default z Category: Methods to modify the class definition Warning: Raises LightDefinitionError if the type of the light is not TOLS_DIRECTIONAL or TOLS_SPOT. if <Direction> is null.

	:param Direction:
	:type Direction: Graphic3d_Vector &
	:rtype: None
") SetDirection;
		void SetDirection (const Graphic3d_Vector & Direction);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Modifies the position of the light. Works only on the TOLS_POSITIONAL and TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError if the type of the light is not TOLS_POSITIONAL or TOLS_SPOT.

	:param Position:
	:type Position: Graphic3d_Vertex &
	:rtype: None
") SetPosition;
		void SetPosition (const Graphic3d_Vertex & Position);
		%feature("compactdefaultargs") Headlight;
		%feature("autodoc", "	* Returns the headlight state of the light <self>

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
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the colour of the light <self>.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") LightType;
		%feature("autodoc", "	* Returns the light type of <self>. //! TypeOfLightSource = TOLS_AMBIENT TOLS_DIRECTIONAL TOLS_POSITIONAL TOLS_SPOT

	:rtype: Visual3d_TypeOfLightSource
") LightType;
		Visual3d_TypeOfLightSource LightType ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the definition of <self> if <self> is a light source of the TOLS_AMBIENT type. Category: Inquire methods Warning: Raises LightDefinitionError if the type of the light is not TOLS_AMBIENT.

	:param Color:
	:type Color: Quantity_Color &
	:rtype: None
") Values;
		void Values (Quantity_Color & Color);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the definition of <self> if <self> is a light source of the TOLS_DIRECTIONAL type. Category: Inquire methods Warning: Raises LightDefinitionError if the type of the light is not TOLS_DIRECTIONAL.

	:param Color:
	:type Color: Quantity_Color &
	:param Direction:
	:type Direction: Graphic3d_Vector &
	:rtype: None
") Values;
		void Values (Quantity_Color & Color,Graphic3d_Vector & Direction);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the definition of <self> if <self> is a light source of the TOLS_POSITIONAL type. Category: Inquire methods Warning: Raises LightDefinitionError if the type of the light is not TOLS_POSITIONAL.

	:param Color:
	:type Color: Quantity_Color &
	:param Position:
	:type Position: Graphic3d_Vertex &
	:param Fact1:
	:type Fact1: float &
	:param Fact2:
	:type Fact2: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & Color,Graphic3d_Vertex & Position,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the definition of <self> if <self> is a light source of the TOLS_SPOT type. Category: Inquire methods Warning: Raises LightDefinitionError if the type of the light is not TOLS_SPOT.

	:param Color:
	:type Color: Quantity_Color &
	:param Position:
	:type Position: Graphic3d_Vertex &
	:param Direction:
	:type Direction: Graphic3d_Vector &
	:param Concentration:
	:type Concentration: float &
	:param Fact1:
	:type Fact1: float &
	:param Fact2:
	:type Fact2: float &
	:param AngleCone:
	:type AngleCone: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & Color,Graphic3d_Vertex & Position,Graphic3d_Vector & Direction,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") CLight;
		%feature("autodoc", "	* Returns the light defintion.

	:rtype: Graphic3d_CLight
") CLight;
		const Graphic3d_CLight & CLight ();
};


%extend Visual3d_Light {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_Light(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_Light::Handle_Visual3d_Light %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_Light;
class Handle_Visual3d_Light : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_Light();
        Handle_Visual3d_Light(const Handle_Visual3d_Light &aHandle);
        Handle_Visual3d_Light(const Visual3d_Light *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_Light DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_Light {
    Visual3d_Light* _get_reference() {
    return (Visual3d_Light*)$self->Access();
    }
};

%extend Handle_Visual3d_Light {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_Light {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_SequenceNodeOfSequenceOfLight;
class Visual3d_SequenceNodeOfSequenceOfLight : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Visual3d_SequenceNodeOfSequenceOfLight;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Visual3d_SequenceNodeOfSequenceOfLight;
		 Visual3d_SequenceNodeOfSequenceOfLight (const Handle_Visual3d_Light & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") Value;
		Handle_Visual3d_Light Value ();
};


%extend Visual3d_SequenceNodeOfSequenceOfLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_SequenceNodeOfSequenceOfLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_SequenceNodeOfSequenceOfLight::Handle_Visual3d_SequenceNodeOfSequenceOfLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_SequenceNodeOfSequenceOfLight;
class Handle_Visual3d_SequenceNodeOfSequenceOfLight : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Visual3d_SequenceNodeOfSequenceOfLight();
        Handle_Visual3d_SequenceNodeOfSequenceOfLight(const Handle_Visual3d_SequenceNodeOfSequenceOfLight &aHandle);
        Handle_Visual3d_SequenceNodeOfSequenceOfLight(const Visual3d_SequenceNodeOfSequenceOfLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_SequenceNodeOfSequenceOfLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_SequenceNodeOfSequenceOfLight {
    Visual3d_SequenceNodeOfSequenceOfLight* _get_reference() {
    return (Visual3d_SequenceNodeOfSequenceOfLight*)$self->Access();
    }
};

%extend Handle_Visual3d_SequenceNodeOfSequenceOfLight {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_SequenceNodeOfSequenceOfLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_SequenceNodeOfSequenceOfView;
class Visual3d_SequenceNodeOfSequenceOfView : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Visual3d_SequenceNodeOfSequenceOfView;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Visual3d_SequenceNodeOfSequenceOfView;
		 Visual3d_SequenceNodeOfSequenceOfView (const Handle_Visual3d_View & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") Value;
		Handle_Visual3d_View Value ();
};


%extend Visual3d_SequenceNodeOfSequenceOfView {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_SequenceNodeOfSequenceOfView(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_SequenceNodeOfSequenceOfView::Handle_Visual3d_SequenceNodeOfSequenceOfView %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_SequenceNodeOfSequenceOfView;
class Handle_Visual3d_SequenceNodeOfSequenceOfView : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Visual3d_SequenceNodeOfSequenceOfView();
        Handle_Visual3d_SequenceNodeOfSequenceOfView(const Handle_Visual3d_SequenceNodeOfSequenceOfView &aHandle);
        Handle_Visual3d_SequenceNodeOfSequenceOfView(const Visual3d_SequenceNodeOfSequenceOfView *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_SequenceNodeOfSequenceOfView DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_SequenceNodeOfSequenceOfView {
    Visual3d_SequenceNodeOfSequenceOfView* _get_reference() {
    return (Visual3d_SequenceNodeOfSequenceOfView*)$self->Access();
    }
};

%extend Handle_Visual3d_SequenceNodeOfSequenceOfView {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_SequenceNodeOfSequenceOfView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_SequenceOfLight;
class Visual3d_SequenceOfLight : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Visual3d_SequenceOfLight;
		%feature("autodoc", "	:rtype: None
") Visual3d_SequenceOfLight;
		 Visual3d_SequenceOfLight ();
		%feature("compactdefaultargs") Visual3d_SequenceOfLight;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfLight &
	:rtype: None
") Visual3d_SequenceOfLight;
		 Visual3d_SequenceOfLight (const Visual3d_SequenceOfLight & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfLight &
	:rtype: Visual3d_SequenceOfLight
") Assign;
		const Visual3d_SequenceOfLight & Assign (const Visual3d_SequenceOfLight & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfLight &
	:rtype: Visual3d_SequenceOfLight
") operator =;
		const Visual3d_SequenceOfLight & operator = (const Visual3d_SequenceOfLight & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SequenceOfLight &
	:rtype: None
") Append;
		void Append (Visual3d_SequenceOfLight & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SequenceOfLight &
	:rtype: None
") Prepend;
		void Prepend (Visual3d_SequenceOfLight & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Visual3d_SequenceOfLight &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Visual3d_SequenceOfLight & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Visual3d_SequenceOfLight &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Visual3d_SequenceOfLight & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") First;
		Handle_Visual3d_Light First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") Last;
		Handle_Visual3d_Light Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Visual3d_SequenceOfLight &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Visual3d_SequenceOfLight & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Visual3d_Light
") Value;
		Handle_Visual3d_Light Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Visual3d_Light &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Visual3d_Light & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Visual3d_Light
") ChangeValue;
		Handle_Visual3d_Light ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Visual3d_SequenceOfLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_SequenceOfView;
class Visual3d_SequenceOfView : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Visual3d_SequenceOfView;
		%feature("autodoc", "	:rtype: None
") Visual3d_SequenceOfView;
		 Visual3d_SequenceOfView ();
		%feature("compactdefaultargs") Visual3d_SequenceOfView;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfView &
	:rtype: None
") Visual3d_SequenceOfView;
		 Visual3d_SequenceOfView (const Visual3d_SequenceOfView & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfView &
	:rtype: Visual3d_SequenceOfView
") Assign;
		const Visual3d_SequenceOfView & Assign (const Visual3d_SequenceOfView & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfView &
	:rtype: Visual3d_SequenceOfView
") operator =;
		const Visual3d_SequenceOfView & operator = (const Visual3d_SequenceOfView & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SequenceOfView &
	:rtype: None
") Append;
		void Append (Visual3d_SequenceOfView & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SequenceOfView &
	:rtype: None
") Prepend;
		void Prepend (Visual3d_SequenceOfView & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Visual3d_SequenceOfView &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Visual3d_SequenceOfView & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Visual3d_SequenceOfView &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Visual3d_SequenceOfView & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") First;
		Handle_Visual3d_View First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") Last;
		Handle_Visual3d_View Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Visual3d_SequenceOfView &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Visual3d_SequenceOfView & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Visual3d_View
") Value;
		Handle_Visual3d_View Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Visual3d_View &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Visual3d_View & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Visual3d_View
") ChangeValue;
		Handle_Visual3d_View ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Visual3d_SequenceOfView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_View;
class Visual3d_View : public Graphic3d_DataStructureManager {
	public:
		%feature("compactdefaultargs") Visual3d_View;
		%feature("autodoc", "	* Creates a view in the viewer <AManager> with a default orientation and a default mapping.

	:param AManager:
	:type AManager: Handle_Visual3d_ViewManager &
	:rtype: None
") Visual3d_View;
		 Visual3d_View (const Handle_Visual3d_ViewManager & AManager);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the view <self>. Map the associated window on the screen and post the view in this window. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:rtype: None
") Activate;
		void Activate ();
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates the view <self>. Unmap the associated window on the screen and unpost the view in this window. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:rtype: None
") Deactivate;
		void Deactivate ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Deletes and erases the view <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Updates screen in all cases.

	:rtype: None
") Redraw;
		void Redraw ();
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Updates layer of immediate presentations.

	:rtype: None
") RedrawImmediate;
		void RedrawImmediate ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Updates screen area in all cases. area is given by his xy min corner and size in pixel coordinates

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
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Updates screen in all cases.

	:param AnUnderLayer:
	:type AnUnderLayer: Handle_Visual3d_Layer &
	:param AnOverLayer:
	:type AnOverLayer: Handle_Visual3d_Layer &
	:rtype: None
") Redraw;
		void Redraw (const Handle_Visual3d_Layer & AnUnderLayer,const Handle_Visual3d_Layer & AnOverLayer);
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Updates layer of immediate presentations.

	:param theUnderLayer:
	:type theUnderLayer: Handle_Visual3d_Layer &
	:param theOverLayer:
	:type theOverLayer: Handle_Visual3d_Layer &
	:rtype: None
") RedrawImmediate;
		void RedrawImmediate (const Handle_Visual3d_Layer & theUnderLayer,const Handle_Visual3d_Layer & theOverLayer);
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Invalidates view content but does not redraw it.

	:rtype: None
") Invalidate;
		void Invalidate ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Updates screen area in all cases. area is given by his xy min corner and size in pixel coordinates

	:param AnUnderLayer:
	:type AnUnderLayer: Handle_Visual3d_Layer &
	:param AnOverLayer:
	:type AnOverLayer: Handle_Visual3d_Layer &
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
		void Redraw (const Handle_Visual3d_Layer & AnUnderLayer,const Handle_Visual3d_Layer & AnOverLayer,const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Deletes and erases the view <self>. Warning: No more graphic operations in <self> after this call.

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Resized;
		%feature("autodoc", "	* Updates the view <self> after the modification of the associated window. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:rtype: None
") Resized;
		void Resized ();
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the default window background. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:param ABack:
	:type ABack: Aspect_Background &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_Background & ABack);
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "	* Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:param FileName:
	:type FileName: char *
	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:param update:
	:type update: bool
	:rtype: None
") SetBackgroundImage;
		void SetBackgroundImage (const char * FileName,const Aspect_FillMethod FillStyle,const Standard_Boolean update);
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "	* Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:param update:
	:type update: bool
	:rtype: None
") SetBgImageStyle;
		void SetBgImageStyle (const Aspect_FillMethod FillStyle,const Standard_Boolean update);
		%feature("compactdefaultargs") SetGradientBackground;
		%feature("autodoc", "	* Modifies the gradient window background. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:param ABack:
	:type ABack: Aspect_GradientBackground &
	:param update:
	:type update: bool
	:rtype: None
") SetGradientBackground;
		void SetGradientBackground (const Aspect_GradientBackground & ABack,const Standard_Boolean update);
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "	* Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:param FillStyle:
	:type FillStyle: Aspect_GradientFillMethod
	:param update:
	:type update: bool
	:rtype: None
") SetBgGradientStyle;
		void SetBgGradientStyle (const Aspect_GradientFillMethod FillStyle,const Standard_Boolean update);
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "	* Manages display of the back faces

	:param aModel:
	:type aModel: Visual3d_TypeOfBackfacingModel
	:rtype: None
") SetBackFacingModel;
		void SetBackFacingModel (const Visual3d_TypeOfBackfacingModel aModel);
		%feature("compactdefaultargs") BackFacingModel;
		%feature("autodoc", "	* Returns current state of the back faces display

	:rtype: Visual3d_TypeOfBackfacingModel
") BackFacingModel;
		Visual3d_TypeOfBackfacingModel BackFacingModel ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets the context <CTX> in the view <self>.

	:param CTX:
	:type CTX: Visual3d_ContextView &
	:rtype: None
") SetContext;
		void SetContext (const Visual3d_ContextView & CTX);
		%feature("compactdefaultargs") SetViewMappingDefault;
		%feature("autodoc", "	* Saves the current mapping which will be the reference value for the reset of the mapping done by the ViewmappingReset method.

	:rtype: None
") SetViewMappingDefault;
		void SetViewMappingDefault ();
		%feature("compactdefaultargs") SetViewOrientationDefault;
		%feature("autodoc", "	* Saves the current orientation which will be the reference value for the reset of the orientation done by the ViewOrientationReset method.

	:rtype: None
") SetViewOrientationDefault;
		void SetViewOrientationDefault ();
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Associates the window <AWindow> to the view <self>. No new association if the window is already defined. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if it is impossible to associate a view and a window. (association already done or another problem) Modifies the viewmapping of the associated view when it calls the SetRatio method. //! After this call, each view is mapped in an unique window. //! Programming example : //! An example when we have 1 view and 1 window ------------------------------------------- //! Handle_Aspect_DisplayConnection aDisplayConnection; //! // Display connection initialization only needed on Linux platform // and on Mac OS X, in cases when you use Xlib for windows drawing. aDisplayConnection = new Aspect_DisplayConnection(); //! // Graphic driver initialization Handle_Graphic3d_GraphicDriver aGraphicDriver = Graphic3d::InitGraphicDriver (aDisplayConnection); //! // Define a view manager Handle_Visual3d_ViewManager aVisualManager = new Visual3d_ViewManager (aGraphicDriver); //! // Define a view Handle_Visual3d_View aView = new Visual3d_View (aVisaulManager); //! // Define a window Handle_Xw_Window aWindow = new Xw_Window (aDisplayConnection, 'Graphic View 1', 0.695, 0.695, 0.600, 0.600, Quantity_NOC_MATRAGRAY); //! // Associate the view and the window aView->SetWindow (aWindow); //! // Map the window aWindow->Map (); //! // Activate the view aView->Activate ();

	:param AWindow:
	:type AWindow: Handle_Aspect_Window &
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & AWindow);
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Associates the window <AWindow> and context <AContext> to the view <self>. If <AContext> is not NULL the graphic context is used directly to draw something in this view. Otherwise an internal context is created. If <ADisplayCB> is not NULL then a user display CB is call at the end of the OCC graphic traversal and just before the swap of buffers. The <aClientData> is pass to this call back. No new association if the window is already defined. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if it is impossible to associate a view and a window. (association already done or another problem) Modifies the viewmapping of the associated view when it calls the SetRatio method. //! After this call, each view is mapped in an unique window.

	:param AWindow:
	:type AWindow: Handle_Aspect_Window &
	:param AContext:
	:type AContext: Aspect_RenderingContext
	:param ADisplayCB:
	:type ADisplayCB: Aspect_GraphicCallbackProc &
	:param AClientData:
	:type AClientData: Standard_Address
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & AWindow,const Aspect_RenderingContext AContext,const Aspect_GraphicCallbackProc & ADisplayCB,const Standard_Address AClientData);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates screen in function of modifications of the structures.

	:param theUpdateMode:
	:type theUpdateMode: Aspect_TypeOfUpdate
	:rtype: None
") Update;
		void Update (const Aspect_TypeOfUpdate theUpdateMode);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates screen in function of modifications of the structures.

	:param AnUnderLayer:
	:type AnUnderLayer: Handle_Visual3d_Layer &
	:param AnOverLayer:
	:type AnOverLayer: Handle_Visual3d_Layer &
	:rtype: None
") Update;
		void Update (const Handle_Visual3d_Layer & AnUnderLayer,const Handle_Visual3d_Layer & AnOverLayer);
		%feature("compactdefaultargs") SetAutoZFitMode;
		%feature("autodoc", "	* Sets the automatic z-fit mode and its parameters. The auto z-fit has extra parameters which can controlled from application level to ensure that the size of viewing volume will be sufficiently large to cover the depth of unmanaged objects, for example, transformation persistent ones. @param theScaleFactor [in] the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed.

	:param theIsOn:
	:type theIsOn: bool
	:param theScaleFactor: default value is 1.0
	:type theScaleFactor: float
	:rtype: None
") SetAutoZFitMode;
		void SetAutoZFitMode (const Standard_Boolean theIsOn,const Standard_Real theScaleFactor = 1.0);
		%feature("compactdefaultargs") AutoZFitMode;
		%feature("autodoc", "	* returns True if automatic z-fit mode is turned on.

	:rtype: bool
") AutoZFitMode;
		Standard_Boolean AutoZFitMode ();
		%feature("compactdefaultargs") AutoZFitScaleFactor;
		%feature("autodoc", "	* returns scale factor parameter of automatic z-fit mode.

	:rtype: float
") AutoZFitScaleFactor;
		Standard_Real AutoZFitScaleFactor ();
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
		%feature("compactdefaultargs") ViewMappingReset;
		%feature("autodoc", "	* Sets the value of the mapping to be the same as the mapping saved by the SetViewMappingDefaut method.

	:rtype: None
") ViewMappingReset;
		void ViewMappingReset ();
		%feature("compactdefaultargs") ViewOrientationReset;
		%feature("autodoc", "	* Sets the value of the orientation to be the same as the orientation saved by the SetViewOrientationDefaut method.

	:rtype: None
") ViewOrientationReset;
		void ViewOrientationReset ();
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
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "	* Customization of the ZBUFFER Triedron. Initializes Colors of X Y and axis Scale ratio defines decreasing of trihedron size when its position is out of a View

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
		%feature("autodoc", "	* Display of the Triedron. Initialize position, color and length of Triedron axes. The scale is a percent of the window width. If AsWireframe is False triedron is shown in shaded mode AColor is not considered for ZBUFFER mode

	:param APosition: default value is Aspect_TOTP_CENTER
	:type APosition: Aspect_TypeOfTriedronPosition
	:param AColor: default value is Quantity_NOC_WHITE
	:type AColor: Quantity_NameOfColor
	:param AScale: default value is 0.02
	:type AScale: float
	:param AsWireframe: default value is Standard_True
	:type AsWireframe: bool
	:rtype: None
") TriedronDisplay;
		void TriedronDisplay (const Aspect_TypeOfTriedronPosition APosition = Aspect_TOTP_CENTER,const Quantity_NameOfColor AColor = Quantity_NOC_WHITE,const Standard_Real AScale = 0.02,const Standard_Boolean AsWireframe = Standard_True);
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
		%feature("autodoc", "	* Returns data of a graduated trihedron

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
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "	* Returns the value of the default window background.

	:rtype: Aspect_Background
") Background;
		Aspect_Background Background ();
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* Returns the value of the window background.

	:rtype: Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if one of the structures displayed in the view <self> contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if one of the structures in the set <ASet> contains Polygons, Triangles or Quadrangles.

	:param ASet:
	:type ASet: Graphic3d_MapOfStructure &
	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet (const Graphic3d_MapOfStructure & ASet);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns the current context of the view <self>.

	:rtype: Visual3d_ContextView
") Context;
		const Visual3d_ContextView & Context ();
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "	* Returns the set of structures displayed in the view <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	* Returns the activity flag of the view <self>.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "	* Returns True if the window associated to the view <self> is defined.

	:rtype: bool
") IsDefined;
		Standard_Boolean IsDefined ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns Standard_True is the view <self> is deleted. <self> is deleted after the call Remove (me).

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of all structures displayed in the view <self>. If <theToIgnoreInfiniteFlag> is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite structures.

	:param theToIgnoreInfiniteFlag: default value is Standard_False
	:type theToIgnoreInfiniteFlag: bool
	:rtype: Bnd_Box
") MinMaxValues;
		Bnd_Box MinMaxValues (const Standard_Boolean theToIgnoreInfiniteFlag = Standard_False);
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of all structures in the set <theSet>. If <theToIgnoreInfiniteFlag> is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite structures.

	:param theSet:
	:type theSet: Graphic3d_MapOfStructure &
	:param theToIgnoreInfiniteFlag: default value is Standard_False
	:type theToIgnoreInfiniteFlag: bool
	:rtype: Bnd_Box
") MinMaxValues;
		Bnd_Box MinMaxValues (const Graphic3d_MapOfStructure & theSet,const Standard_Boolean theToIgnoreInfiniteFlag = Standard_False);
		%feature("compactdefaultargs") NumberOfDisplayedStructures;
		%feature("autodoc", "	* Returns number of displayed structures in the view <self>.

	:rtype: int
") NumberOfDisplayedStructures;
		Standard_Integer NumberOfDisplayedStructures ();
		%feature("compactdefaultargs") Projects;
		%feature("autodoc", "	* Returns the coordinates of the projection of the 3d coordinates <AX>, <AY>, <AZ>.

	:param AX:
	:type AX: float
	:param AY:
	:type AY: float
	:param AZ:
	:type AZ: float
	:param APX:
	:type APX: float &
	:param APY:
	:type APY: float &
	:param APZ:
	:type APZ: float &
	:rtype: None
") Projects;
		void Projects (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DefaultCamera;
		%feature("autodoc", "	* returns the default camera of <self>.

	:rtype: Handle_Graphic3d_Camera
") DefaultCamera;
		Handle_Graphic3d_Camera DefaultCamera ();
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "	* returns the camera of <self>.

	:rtype: Handle_Graphic3d_Camera
") Camera;
		Handle_Graphic3d_Camera Camera ();
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	* Set camera object to provide orientation and projection matrices for graphic driver.

	:param theCamera:
	:type theCamera: Handle_Graphic3d_Camera &
	:rtype: None
") SetCamera;
		void SetCamera (const Handle_Graphic3d_Camera & theCamera);
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "	* Returns the window associated to the view <self>. Warning: Raises ViewDefinitionError if the associated window isn't defined.

	:rtype: Handle_Aspect_Window
") Window;
		Handle_Aspect_Window Window ();
		%feature("compactdefaultargs") LightLimit;
		%feature("autodoc", "	* Returns the MAX number of light associated to the view <self>.

	:rtype: int
") LightLimit;
		Standard_Integer LightLimit ();
		%feature("compactdefaultargs") PlaneLimit;
		%feature("autodoc", "	* Returns the MAX number of clipping planes associated to the view <self>.

	:rtype: int
") PlaneLimit;
		Standard_Integer PlaneLimit ();
		%feature("compactdefaultargs") ViewManager;
		%feature("autodoc", "	* Returns the view manager handle which manage this view

	:rtype: Handle_Visual3d_ViewManager
") ViewManager;
		Handle_Visual3d_ViewManager ViewManager ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Computes the new presentation of the structure <AStructure> displayed in <self> with the type Graphic3d_TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") DisplayImmediate;
		%feature("autodoc", "	* Add structure to the list of immediate presentations. returns true if structure has not been registered in this view

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theIsSingleView: default value is Standard_True
	:type theIsSingleView: bool
	:rtype: bool
") DisplayImmediate;
		Standard_Boolean DisplayImmediate (const Handle_Graphic3d_Structure & theStructure,const Standard_Boolean theIsSingleView = Standard_True);
		%feature("compactdefaultargs") EraseImmediate;
		%feature("autodoc", "	* Removes the structure from the list of immediate presentations. returns true if structure has been registered in view

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: bool
") EraseImmediate;
		Standard_Boolean EraseImmediate (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") ClearImmediate;
		%feature("autodoc", "	* Clears list of immediate presentations. returns true if list was not empty

	:rtype: bool
") ClearImmediate;
		Standard_Boolean ClearImmediate ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the view <self>.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
		%feature("compactdefaultargs") CView;
		%feature("autodoc", "	* Returns the c structure associated to <self>.

	:rtype: Standard_Address
") CView;
		Standard_Address CView ();
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "	* Returns the associated GraphicDriver.

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		Handle_Graphic3d_GraphicDriver GraphicDriver ();
		%feature("compactdefaultargs") ZBufferIsActivated;
		%feature("autodoc", "	* Returns Standard_True if the ZBuffer is activated in the view <self> and Standard_False if not.

	:rtype: bool
") ZBufferIsActivated;
		Standard_Boolean ZBufferIsActivated ();
		%feature("compactdefaultargs") SetZBufferActivity;
		%feature("autodoc", "	* Activates the ZBuffer if the integer <AnActivity> is equal to 1. Deactivates the ZBuffer if the integer <AnActivity> is equal to 0. If the integer <AnActivity> is equal to -1 then - the ZBuffer is activated if me->Context ().Visualization () == Visual3d_TOV_SHADING - the ZBuffer is deactivated if me->Context ().Visualization () == Visual3d_TOV_WIREFRAME

	:param AnActivity:
	:type AnActivity: int
	:rtype: None
") SetZBufferActivity;
		void SetZBufferActivity (const Standard_Integer AnActivity);
		%feature("compactdefaultargs") UnderLayer;
		%feature("autodoc", "	* Returns the underlay of the view <self>.

	:rtype: Handle_Visual3d_Layer
") UnderLayer;
		Handle_Visual3d_Layer UnderLayer ();
		%feature("compactdefaultargs") OverLayer;
		%feature("autodoc", "	* Returns the underlay of the view <self>.

	:rtype: Handle_Visual3d_Layer
") OverLayer;
		Handle_Visual3d_Layer OverLayer ();
		%feature("compactdefaultargs") EnableDepthTest;
		%feature("autodoc", "	* turns on/off opengl depth

	:param enable:
	:type enable: bool
	:rtype: None
") EnableDepthTest;
		void EnableDepthTest (const Standard_Boolean enable);
		%feature("compactdefaultargs") IsDepthTestEnabled;
		%feature("autodoc", "	* returns current state of the opengl depth testing

	:rtype: bool
") IsDepthTestEnabled;
		Standard_Boolean IsDepthTestEnabled ();
		%feature("compactdefaultargs") ReadDepths;
		%feature("autodoc", "	* Reads depths of shown pixels of the given rectangle

	:param x:
	:type x: int
	:param y:
	:type y: int
	:param width:
	:type width: int
	:param height:
	:type height: int
	:param buffer:
	:type buffer: Standard_Address
	:rtype: None
") ReadDepths;
		void ReadDepths (const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height,const Standard_Address buffer);
		%feature("compactdefaultargs") FBOCreate;
		%feature("autodoc", "	* Generate offscreen FBO in the graphic library

	:param width:
	:type width: int
	:param height:
	:type height: int
	:rtype: Graphic3d_PtrFrameBuffer
") FBOCreate;
		Graphic3d_PtrFrameBuffer FBOCreate (const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") FBORelease;
		%feature("autodoc", "	* Remove offscreen FBO from the graphic library

	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:rtype: None
") FBORelease;
		void FBORelease (Graphic3d_PtrFrameBuffer & fboPtr);
		%feature("compactdefaultargs") FBOGetDimensions;
		%feature("autodoc", "	* Read offscreen FBO configuration.

	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer
	:param width:
	:type width: int &
	:param height:
	:type height: int &
	:param widthMax:
	:type widthMax: int &
	:param heightMax:
	:type heightMax: int &
	:rtype: None
") FBOGetDimensions;
		void FBOGetDimensions (const Graphic3d_PtrFrameBuffer fboPtr,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") FBOChangeViewport;
		%feature("autodoc", "	* Change offscreen FBO viewport.

	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:param width:
	:type width: int
	:param height:
	:type height: int
	:rtype: None
") FBOChangeViewport;
		void FBOChangeViewport (Graphic3d_PtrFrameBuffer & fboPtr,const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") BufferDump;
		%feature("autodoc", "	* Dump active rendering buffer into specified memory buffer.

	:param theImage:
	:type theImage: Image_PixMap &
	:param theBufferType:
	:type theBufferType: Graphic3d_BufferType &
	:rtype: bool
") BufferDump;
		Standard_Boolean BufferDump (Image_PixMap & theImage,const Graphic3d_BufferType & theBufferType);
		%feature("compactdefaultargs") EnableGLLight;
		%feature("autodoc", "	* turns on/off opengl lighting, currently used in triedron displaying

	:param enable:
	:type enable: bool
	:rtype: None
") EnableGLLight;
		void EnableGLLight (const Standard_Boolean enable);
		%feature("compactdefaultargs") IsGLLightEnabled;
		%feature("autodoc", "	* returns the current state of the gl lighting currently used in triedron displaying

	:rtype: bool
") IsGLLightEnabled;
		Standard_Boolean IsGLLightEnabled ();
		%feature("compactdefaultargs") Export;
		%feature("autodoc", "	* Export scene into the one of the Vector graphics formats (SVG, PS, PDF...). In contrast to Bitmaps, Vector graphics is scalable (so you may got quality benefits on printing to laser printer). Notice however that results may differ a lot and do not contain some elements.

	:param theFileName:
	:type theFileName: char *
	:param theFormat:
	:type theFormat: Graphic3d_ExportFormat
	:param theSortType: default value is Graphic3d_ST_BSP_Tree
	:type theSortType: Graphic3d_SortType
	:param thePrecision: default value is 0.005
	:type thePrecision: float
	:param theProgressBarFunc: default value is NULL
	:type theProgressBarFunc: Standard_Address
	:param theProgressObject: default value is NULL
	:type theProgressObject: Standard_Address
	:rtype: bool
") Export;
		Standard_Boolean Export (const char * theFileName,const Graphic3d_ExportFormat theFormat,const Graphic3d_SortType theSortType = Graphic3d_ST_BSP_Tree,const Standard_Real thePrecision = 0.005,const Standard_Address theProgressBarFunc = NULL,const Standard_Address theProgressObject = NULL);
		%feature("compactdefaultargs") HiddenObjects;
		%feature("autodoc", "	* Returns map of objects hidden within this specific view (not viewer-wise).

	:rtype: Handle_Graphic3d_NMapOfTransient
") HiddenObjects;
		Handle_Graphic3d_NMapOfTransient HiddenObjects ();
		%feature("compactdefaultargs") ChangeHiddenObjects;
		%feature("autodoc", "	* Returns map of objects hidden within this specific view (not viewer-wise).

	:rtype: Handle_Graphic3d_NMapOfTransient
") ChangeHiddenObjects;
		Handle_Graphic3d_NMapOfTransient ChangeHiddenObjects ();
};


%extend Visual3d_View {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_View(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_View::Handle_Visual3d_View %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_View;
class Handle_Visual3d_View : public Handle_Graphic3d_DataStructureManager {

    public:
        // constructors
        Handle_Visual3d_View();
        Handle_Visual3d_View(const Handle_Visual3d_View &aHandle);
        Handle_Visual3d_View(const Visual3d_View *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_View DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_View {
    Visual3d_View* _get_reference() {
    return (Visual3d_View*)$self->Access();
    }
};

%extend Handle_Visual3d_View {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Visual3d_ViewManager;
class Visual3d_ViewManager : public Graphic3d_StructureManager {
	public:
		%feature("compactdefaultargs") Visual3d_ViewManager;
		%feature("autodoc", "	* Creates a 3D visualizer. Currently creating of more than 100 viewer instances is not supported and leads to InitializationError and initialisation failure. This limitation might be addressed in some future OCCT releases. //! Category: Methods to modify the class definition

	:param theDriver:
	:type theDriver: Handle_Graphic3d_GraphicDriver &
	:rtype: None
") Visual3d_ViewManager;
		 Visual3d_ViewManager (const Handle_Graphic3d_GraphicDriver & theDriver);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates all the views of the manager <self>.

	:rtype: None
") Activate;
		void Activate ();
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates all the views of the manager <self>.

	:rtype: None
") Deactivate;
		void Deactivate ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Deletes and erases the 3D visualiser <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases all of the structures displayed in the visualiser <self>.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redraws all the displayed structures.

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
		%feature("autodoc", "	* Deletes and erases the 3D visualiser <self>.

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates screen in function of modifications of the structures. Category: Methods to modify the class definition

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") ActivatedView;
		%feature("autodoc", "	* Returns the group of views activated in the visualiser <self>.

	:rtype: Handle_Visual3d_HSequenceOfView
") ActivatedView;
		Handle_Visual3d_HSequenceOfView ActivatedView ();
		%feature("compactdefaultargs") DefinedViews;
		%feature("autodoc", "	* Returns the group of views defined in the visualiser <self>.

	:rtype: Visual3d_SequenceOfView
") DefinedViews;
		const Visual3d_SequenceOfView & DefinedViews ();
		%feature("compactdefaultargs") MaxNumOfViews;
		%feature("autodoc", "	* Returns the theoretical maximum number of definable views in the view manager <self>. Warning: It's not possible to accept an infinite number of definable views because each view must have an identification and we have different view managers.

	:rtype: int
") MaxNumOfViews;
		Standard_Integer MaxNumOfViews ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns : a new identification number for a new view in the visualiser.

	:param AView:
	:type AView: Handle_Visual3d_View &
	:rtype: int
") Identification;
		Standard_Integer Identification (const Handle_Visual3d_View & AView);
		%feature("compactdefaultargs") UnIdentification;
		%feature("autodoc", "	* Release a unique ID of the view reserved for the view on its creation.

	:param aViewId:
	:type aViewId: int
	:rtype: None
") UnIdentification;
		void UnIdentification (const Standard_Integer aViewId);
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the structure with the identification number <AId>.

	:param AId:
	:type AId: int
	:rtype: Handle_Graphic3d_Structure
") Identification;
		Handle_Graphic3d_Structure Identification (const Standard_Integer AId);
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the visualiser.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
		%feature("compactdefaultargs") ChangeDisplayPriority;
		%feature("autodoc", "	* Changes the display priority of the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param OldPriority:
	:type OldPriority: int
	:param NewPriority:
	:type NewPriority: int
	:rtype: None
") ChangeDisplayPriority;
		void ChangeDisplayPriority (const Handle_Graphic3d_Structure & AStructure,const Standard_Integer OldPriority,const Standard_Integer NewPriority);
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "	* Change Z layer for structure. The layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") ChangeZLayer;
		void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer for all managed views.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings &
	:rtype: None
") SetZLayerSettings;
		void SetZLayerSettings (const Graphic3d_ZLayerId theLayerId,const Graphic3d_ZLayerSettings & theSettings);
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		Graphic3d_ZLayerSettings ZLayerSettings (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level Z layer and get its ID as <theLayerId> value. The method returns Standard_False if the layer can not be created. The layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId &
	:rtype: bool
") AddZLayer;
		Standard_Boolean AddZLayer (Graphic3d_ZLayerId & theLayerId);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there are always default bottom-level layer that can't be removed.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: bool
") RemoveZLayer;
		Standard_Boolean RemoveZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "	* Return all Z layer ids in sequence ordered by overlay level from lowest layer to highest ( foreground ). The first layer ID in sequence is the default layer that can't be removed.

	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger &
	:rtype: None
") GetAllZLayers;
		void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: None
") Clear;
		void Clear (const Handle_Graphic3d_Structure & AStructure,const Standard_Boolean WithDestruction);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Connects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") Connect;
		void Connect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Disconnects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") Disconnect;
		void Disconnect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display of the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Display;
		void Display (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Erase;
		void Erase (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AMethod:
	:type AMethod: Aspect_TypeOfHighlightMethod
	:rtype: None
") Highlight;
		void Highlight (const Handle_Graphic3d_Structure & AStructure,const Aspect_TypeOfHighlightMethod AMethod);
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:rtype: None
") SetTransform;
		void SetTransform (const Handle_Graphic3d_Structure & AStructure,const TColStd_Array2OfReal & ATrsf);
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppress the highlighting on all the structures.

	:rtype: None
") UnHighlight;
		void UnHighlight ();
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppress the highlighting on the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") UnHighlight;
		void UnHighlight (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") ViewExists;
		%feature("autodoc", "	* Returns Standard_True if the view associated to the window <AWindow> exists and is activated. <TheViewId> contains the internal identification of the associated view.

	:param AWindow:
	:type AWindow: Handle_Aspect_Window &
	:param TheCView:
	:type TheCView: Graphic3d_CView &
	:rtype: bool
") ViewExists;
		Standard_Boolean ViewExists (const Handle_Aspect_Window & AWindow,Graphic3d_CView & TheCView);
		%feature("compactdefaultargs") UnderLayer;
		%feature("autodoc", "	* Returns the underlay of the viewer <self>.

	:rtype: Handle_Visual3d_Layer
") UnderLayer;
		Handle_Visual3d_Layer UnderLayer ();
		%feature("compactdefaultargs") OverLayer;
		%feature("autodoc", "	* Returns the underlay of the viewer <self>.

	:rtype: Handle_Visual3d_Layer
") OverLayer;
		Handle_Visual3d_Layer OverLayer ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> if <AStructure> is displayed and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> if <AStructure> is displayed in <AProjector> and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AProjector:
	:type AProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure,const Handle_Graphic3d_DataStructureManager & AProjector);
		%feature("compactdefaultargs") ZBufferAuto;
		%feature("autodoc", "	* Returns Standard_True if the zbuffer activity is managed automatically. Default Standard_False

	:rtype: bool
") ZBufferAuto;
		Standard_Boolean ZBufferAuto ();
		%feature("compactdefaultargs") SetZBufferAuto;
		%feature("autodoc", "	* if <AFlag> is Standard_True then the zbuffer activity is managed automatically. Default Standard_False

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetZBufferAuto;
		void SetZBufferAuto (const Standard_Boolean AFlag);
};


%extend Visual3d_ViewManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Visual3d_ViewManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Visual3d_ViewManager::Handle_Visual3d_ViewManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Visual3d_ViewManager;
class Handle_Visual3d_ViewManager : public Handle_Graphic3d_StructureManager {

    public:
        // constructors
        Handle_Visual3d_ViewManager();
        Handle_Visual3d_ViewManager(const Handle_Visual3d_ViewManager &aHandle);
        Handle_Visual3d_ViewManager(const Visual3d_ViewManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_ViewManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_ViewManager {
    Visual3d_ViewManager* _get_reference() {
    return (Visual3d_ViewManager*)$self->Access();
    }
};

%extend Handle_Visual3d_ViewManager {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Visual3d_ViewManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
