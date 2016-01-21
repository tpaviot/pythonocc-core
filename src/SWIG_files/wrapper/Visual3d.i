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

%pythoncode {
import OCC.GarbageCollector
};

%include Visual3d_headers.i

/* typedefs */
typedef Visual3d_View * Visual3d_ViewPtr;
typedef Visual3d_ViewManager * Visual3d_ViewManagerPtr;
typedef NCollection_DataMap <Standard_Integer , Graphic3d_ZLayerSettings> Visual3d_MapOfZLayerSettings;
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
	Visual3d_TOM_INTERP_COLOR = 1,
	Visual3d_TOM_FACET = 2,
	Visual3d_TOM_VERTEX = 3,
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
		%feature("autodoc", "	* Creates a context from default values //!	 Aperture	: 4.0 //!	 Depth	: 10 //!	 Order	: TOO_TOPFIRST

	:rtype: None
") Visual3d_ContextPick;
		 Visual3d_ContextPick ();
		%feature("compactdefaultargs") Visual3d_ContextPick;
		%feature("autodoc", "	* Creates a context with the values defined Warning: Raises ContextPickDefinitionError if <Depth> or //!	 <Aperture> is a negative value.

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
		%feature("autodoc", "	* Modifies the size of the pick window. Category: Methods to modifies the class definition Warning: Raises ContextPickDefinitionError if <Aperture> is //!	 a negative value.

	:param Aperture:
	:type Aperture: float
	:rtype: None
") SetAperture;
		void SetAperture (const Standard_Real Aperture);
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	* Modifies the pick depth a priori. Category: Methods to modifies the class definition Warning: Raises ContextPickDefinitionError if <Depth> is //!	 a negative value.

	:param Depth:
	:type Depth: int
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Integer Depth);
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "	* Modifies the order of picking. //!	 TypeOfOrder : TOO_TOPFIRST //!			 TOO_BOTTOMFIRST

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
		%feature("autodoc", "	* Returns the order of picking of <self>. //!	 TypeOfOrder	: TOO_TOPFIRST //!			 TOO_BOTTOMFIRST

	:rtype: Visual3d_TypeOfOrder
") Order;
		Visual3d_TypeOfOrder Order ();
};


%feature("shadow") Visual3d_ContextPick::~Visual3d_ContextPick %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ContextPick {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_ContextView;
class Visual3d_ContextView {
	public:
		%feature("compactdefaultargs") Visual3d_ContextView;
		%feature("autodoc", "	* Creates a context from default values //!	 Aliasing		 : OFF //!	 BackZClipping	 : OFF //!	 FrontZClipping	 : OFF //!	 Depth-cueing	 : OFF //!	 Light source	 : 0 //!	 Clipping plane	 : 0 //!	 Type Of Visualization : TOV_WIREFRAME //!	 Type Of Model	 : TOM_NONE Type Of SurfaceDetail : TOSD_NONE

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
		%feature("autodoc", "	* Activates antialiasing. //!	Antialiasing can be activated on all the structures //!	in the view

	:rtype: None
") SetAliasingOn;
		void SetAliasingOn ();
		%feature("compactdefaultargs") SetAliasingOff;
		%feature("autodoc", "	* Deactivates the antialiasing.

	:rtype: None
") SetAliasingOff;
		void SetAliasingOff ();
		%feature("compactdefaultargs") SetDepthCueingBackPlane;
		%feature("autodoc", "	* Modifies the back depth-cueing plane. Category: Methods to modify the class definition Warning: Raises DepthCueingDefinitionError if <BackPlane> //!	 is front of <FrontPlane> and DepthCueing is ON.

	:param ABack:
	:type ABack: float
	:rtype: None
") SetDepthCueingBackPlane;
		void SetDepthCueingBackPlane (const Standard_Real ABack);
		%feature("compactdefaultargs") SetDepthCueingFrontPlane;
		%feature("autodoc", "	* Modifies the front depth-cueing plane. Category: Methods to modify the class definition Warning: Raises DepthCueingDefinitionError if <BackPlane> is //!	 front of <FrontPlane> and DepthCueing is ON.

	:param ABack:
	:type ABack: float
	:rtype: None
") SetDepthCueingFrontPlane;
		void SetDepthCueingFrontPlane (const Standard_Real ABack);
		%feature("compactdefaultargs") SetDepthCueingOn;
		%feature("autodoc", "	* Activates the depth-cueing. //!	Depth-cueing can be activated on all structures //!	present in the view. Category: Methods to modify the class definition Warning: Raises DepthCueingDefinitionError if <BackPlane> is //!	 front of <FrontPlane>.

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
		%feature("autodoc", "	* Modifies the shading model when the type of //!	 visualization is TOV_SHADING //!	 TypeOfModel	: TOM_NONE //!			 TOM_INTERP_COLOR //!			 TOM_FACET //!			 TOM_VERTEX

	:param AModel:
	:type AModel: Visual3d_TypeOfModel
	:rtype: None
") SetModel;
		void SetModel (const Visual3d_TypeOfModel AModel);
		%feature("compactdefaultargs") SetVisualization;
		%feature("autodoc", "	* Modifies the mode of visualization. //!	 TypeOfVisualization	: TOV_WIREFRAME //!				 TOV_SHADING

	:param AVisual:
	:type AVisual: Visual3d_TypeOfVisualization
	:rtype: None
") SetVisualization;
		void SetVisualization (const Visual3d_TypeOfVisualization AVisual);
		%feature("compactdefaultargs") SetZClippingBackPlane;
		%feature("autodoc", "	* Modifies the back Z-clipping plane. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is //!	 front of <FrontPlane> and ZClipping is ON.

	:param ABack:
	:type ABack: float
	:rtype: None
") SetZClippingBackPlane;
		void SetZClippingBackPlane (const Standard_Real ABack);
		%feature("compactdefaultargs") SetZClippingFrontPlane;
		%feature("autodoc", "	* Modifies the front Z-clipping plane. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is //!	 front of <FrontPlane> and ZClipping is ON.

	:param AFront:
	:type AFront: float
	:rtype: None
") SetZClippingFrontPlane;
		void SetZClippingFrontPlane (const Standard_Real AFront);
		%feature("compactdefaultargs") SetZClippingOn;
		%feature("autodoc", "	* Activates the Z-clipping planes defined by //!	 SetZClippingFrontPlane and SetZClippingBackPlane. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is //!	 front of <FrontPlane>.

	:rtype: None
") SetZClippingOn;
		void SetZClippingOn ();
		%feature("compactdefaultargs") SetZClippingOff;
		%feature("autodoc", "	* Deactivates the Z-clipping planes defined by //!	 SetFrontPlane and SetBackPlane.

	:rtype: None
") SetZClippingOff;
		void SetZClippingOff ();
		%feature("compactdefaultargs") SetFrontZClippingOn;
		%feature("autodoc", "	* Activates the front Z-clipping plane defined by //!	 SetFrontPlane method.

	:rtype: None
") SetFrontZClippingOn;
		void SetFrontZClippingOn ();
		%feature("compactdefaultargs") SetFrontZClippingOff;
		%feature("autodoc", "	* Deactivates the front Z-clipping plane defined by //!	 SetFrontPlane method.

	:rtype: None
") SetFrontZClippingOff;
		void SetFrontZClippingOff ();
		%feature("compactdefaultargs") SetBackZClippingOn;
		%feature("autodoc", "	* Activates the back Z-clipping plane defined by //!	 SetBackPlane method. Category: Methods to modify the class definition Warning: Raises ZClippingDefinitionError if <BackPlane> is //!	 front of <FrontPlane>.

	:rtype: None
") SetBackZClippingOn;
		void SetBackZClippingOn ();
		%feature("compactdefaultargs") SetBackZClippingOff;
		%feature("autodoc", "	* Deactivates the back Z-clipping plane defined by //!	 SetBackPlane method.

	:rtype: None
") SetBackZClippingOff;
		void SetBackZClippingOff ();
		%feature("compactdefaultargs") ActivatedLights;
		%feature("autodoc", "	* Returns the group of active light sources //!	 in the view of context <self>.

	:rtype: Handle_Visual3d_HSetOfLight
") ActivatedLights;
		Handle_Visual3d_HSetOfLight ActivatedLights ();
		%feature("compactdefaultargs") NumberOfActivatedLights;
		%feature("autodoc", "	* Returns the number of active light sources //!	 in the view of context <self>.

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


%feature("shadow") Visual3d_ContextView::~Visual3d_ContextView %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ContextView {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_HSequenceOfPickPath;
class Visual3d_HSequenceOfPickPath : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_HSequenceOfPickPath;
		%feature("autodoc", "	:rtype: None
") Visual3d_HSequenceOfPickPath;
		 Visual3d_HSequenceOfPickPath ();
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
	:type anItem: Visual3d_PickPath &
	:rtype: None
") Append;
		void Append (const Visual3d_PickPath & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfPickPath &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_HSequenceOfPickPath & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Visual3d_PickPath &
	:rtype: None
") Prepend;
		void Prepend (const Visual3d_PickPath & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfPickPath &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_HSequenceOfPickPath & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Visual3d_PickPath &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Visual3d_PickPath & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfPickPath &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfPickPath & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Visual3d_PickPath &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Visual3d_PickPath & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Visual3d_HSequenceOfPickPath &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfPickPath & aSequence);
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
	:rtype: Handle_Visual3d_HSequenceOfPickPath
") Split;
		Handle_Visual3d_HSequenceOfPickPath Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Visual3d_PickPath &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Visual3d_PickPath & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Visual3d_PickPath
") Value;
		const Visual3d_PickPath & Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Visual3d_PickPath
") ChangeValue;
		Visual3d_PickPath & ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: Visual3d_SequenceOfPickPath
") Sequence;
		const Visual3d_SequenceOfPickPath & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Visual3d_SequenceOfPickPath
") ChangeSequence;
		Visual3d_SequenceOfPickPath & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Visual3d_HSequenceOfPickPath
") ShallowCopy;
		Handle_Visual3d_HSequenceOfPickPath ShallowCopy ();
};


%feature("shadow") Visual3d_HSequenceOfPickPath::~Visual3d_HSequenceOfPickPath %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_HSequenceOfPickPath {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_HSequenceOfPickPath {
	Handle_Visual3d_HSequenceOfPickPath GetHandle() {
	return *(Handle_Visual3d_HSequenceOfPickPath*) &$self;
	}
};

%nodefaultctor Handle_Visual3d_HSequenceOfPickPath;
class Handle_Visual3d_HSequenceOfPickPath : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_HSequenceOfPickPath();
        Handle_Visual3d_HSequenceOfPickPath(const Handle_Visual3d_HSequenceOfPickPath &aHandle);
        Handle_Visual3d_HSequenceOfPickPath(const Visual3d_HSequenceOfPickPath *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_HSequenceOfPickPath DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_HSequenceOfPickPath {
    Visual3d_HSequenceOfPickPath* GetObject() {
    return (Visual3d_HSequenceOfPickPath*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_HSequenceOfPickPath::~Handle_Visual3d_HSequenceOfPickPath %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_HSequenceOfPickPath {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_HSetOfLight;
class Visual3d_HSetOfLight : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_HSetOfLight;
		%feature("autodoc", "	:rtype: None
") Visual3d_HSetOfLight;
		 Visual3d_HSetOfLight ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "	:param B:
	:type B: Handle_Visual3d_HSetOfLight &
	:rtype: Handle_Visual3d_HSetOfLight
") Union;
		Handle_Visual3d_HSetOfLight Union (const Handle_Visual3d_HSetOfLight & B);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param B:
	:type B: Handle_Visual3d_HSetOfLight &
	:rtype: Handle_Visual3d_HSetOfLight
") Intersection;
		Handle_Visual3d_HSetOfLight Intersection (const Handle_Visual3d_HSetOfLight & B);
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "	:param B:
	:type B: Handle_Visual3d_HSetOfLight &
	:rtype: Handle_Visual3d_HSetOfLight
") Difference;
		Handle_Visual3d_HSetOfLight Difference (const Handle_Visual3d_HSetOfLight & B);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") IsASubset;
		%feature("autodoc", "	:param S:
	:type S: Handle_Visual3d_HSetOfLight &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Handle_Visual3d_HSetOfLight & S);
		%feature("compactdefaultargs") IsAProperSubset;
		%feature("autodoc", "	:param S:
	:type S: Handle_Visual3d_HSetOfLight &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_Visual3d_HSetOfLight & S);
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Visual3d_HSetOfLight
") ShallowCopy;
		Handle_Visual3d_HSetOfLight ShallowCopy ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:rtype: Visual3d_SetOfLight
") Set;
		const Visual3d_SetOfLight & Set ();
		%feature("compactdefaultargs") ChangeSet;
		%feature("autodoc", "	:rtype: Visual3d_SetOfLight
") ChangeSet;
		Visual3d_SetOfLight & ChangeSet ();
};


%feature("shadow") Visual3d_HSetOfLight::~Visual3d_HSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_HSetOfLight {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_HSetOfLight {
	Handle_Visual3d_HSetOfLight GetHandle() {
	return *(Handle_Visual3d_HSetOfLight*) &$self;
	}
};

%nodefaultctor Handle_Visual3d_HSetOfLight;
class Handle_Visual3d_HSetOfLight : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_HSetOfLight();
        Handle_Visual3d_HSetOfLight(const Handle_Visual3d_HSetOfLight &aHandle);
        Handle_Visual3d_HSetOfLight(const Visual3d_HSetOfLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_HSetOfLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_HSetOfLight {
    Visual3d_HSetOfLight* GetObject() {
    return (Visual3d_HSetOfLight*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_HSetOfLight::~Handle_Visual3d_HSetOfLight %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_HSetOfLight {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_HSetOfView;
class Visual3d_HSetOfView : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_HSetOfView;
		%feature("autodoc", "	:rtype: None
") Visual3d_HSetOfView;
		 Visual3d_HSetOfView ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "	:param B:
	:type B: Handle_Visual3d_HSetOfView &
	:rtype: Handle_Visual3d_HSetOfView
") Union;
		Handle_Visual3d_HSetOfView Union (const Handle_Visual3d_HSetOfView & B);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param B:
	:type B: Handle_Visual3d_HSetOfView &
	:rtype: Handle_Visual3d_HSetOfView
") Intersection;
		Handle_Visual3d_HSetOfView Intersection (const Handle_Visual3d_HSetOfView & B);
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "	:param B:
	:type B: Handle_Visual3d_HSetOfView &
	:rtype: Handle_Visual3d_HSetOfView
") Difference;
		Handle_Visual3d_HSetOfView Difference (const Handle_Visual3d_HSetOfView & B);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") IsASubset;
		%feature("autodoc", "	:param S:
	:type S: Handle_Visual3d_HSetOfView &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Handle_Visual3d_HSetOfView & S);
		%feature("compactdefaultargs") IsAProperSubset;
		%feature("autodoc", "	:param S:
	:type S: Handle_Visual3d_HSetOfView &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_Visual3d_HSetOfView & S);
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Visual3d_HSetOfView
") ShallowCopy;
		Handle_Visual3d_HSetOfView ShallowCopy ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:rtype: Visual3d_SetOfView
") Set;
		const Visual3d_SetOfView & Set ();
		%feature("compactdefaultargs") ChangeSet;
		%feature("autodoc", "	:rtype: Visual3d_SetOfView
") ChangeSet;
		Visual3d_SetOfView & ChangeSet ();
};


%feature("shadow") Visual3d_HSetOfView::~Visual3d_HSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_HSetOfView {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_HSetOfView {
	Handle_Visual3d_HSetOfView GetHandle() {
	return *(Handle_Visual3d_HSetOfView*) &$self;
	}
};

%nodefaultctor Handle_Visual3d_HSetOfView;
class Handle_Visual3d_HSetOfView : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_HSetOfView();
        Handle_Visual3d_HSetOfView(const Handle_Visual3d_HSetOfView &aHandle);
        Handle_Visual3d_HSetOfView(const Visual3d_HSetOfView *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_HSetOfView DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_HSetOfView {
    Visual3d_HSetOfView* GetObject() {
    return (Visual3d_HSetOfView*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_HSetOfView::~Handle_Visual3d_HSetOfView %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_HSetOfView {
    void _kill_pointed() {
        delete $self;
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
		%feature("autodoc", "	* Get the size of text. The attributes are given with respect to the plane of projection. <AHeight> : Height of text.  (Relative to the Normalized Projection Coordinates (NPC) Space).

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


%feature("shadow") Visual3d_Layer::~Visual3d_Layer %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_Layer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_Layer {
	Handle_Visual3d_Layer GetHandle() {
	return *(Handle_Visual3d_Layer*) &$self;
	}
};

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
    Visual3d_Layer* GetObject() {
    return (Visual3d_Layer*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_Layer::~Handle_Visual3d_Layer %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_Layer {
    void _kill_pointed() {
        delete $self;
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


%feature("shadow") Visual3d_LayerItem::~Visual3d_LayerItem %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_LayerItem {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_LayerItem {
	Handle_Visual3d_LayerItem GetHandle() {
	return *(Handle_Visual3d_LayerItem*) &$self;
	}
};

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
    Visual3d_LayerItem* GetObject() {
    return (Visual3d_LayerItem*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_LayerItem::~Handle_Visual3d_LayerItem %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_LayerItem {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_Light;
class Visual3d_Light : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates a light from default values. //!	 Light sources are created in a visualiser //!	 and are activated in one of its views. //!	 Type	= TOLS_AMBIENT //!	 Color	= WHITE

	:rtype: None
") Visual3d_Light;
		 Visual3d_Light ();
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates an AMBIENT light source. //!	 Light sources are created in a visualiser //!	 and are activated in one of its views.

	:param Color:
	:type Color: Quantity_Color &
	:rtype: None
") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color);
		%feature("compactdefaultargs") Visual3d_Light;
		%feature("autodoc", "	* Creates a DIRECTIONAL light source. //!	 Light sources are created in a visualiser //!	 and are activated in one of its views. Warning: Raises LightDefinitionError if <Direction> is null.

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
		%feature("autodoc", "	* Creates a POSITIONAL light source. //!	 Light sources are created in a visualiser //!	 and are activated in one of its views. Warning: Raises LightDefinitionError //!	 if <Fact1> and <Fact2> are null. //!	 if <Fact1> is a negative value or greater than 1.0. //!	 if <Fact2> is a negative value or greater than 1.0.

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
		%feature("autodoc", "	* Creates a SPOT light source. //!	 Light sources are created in a visualiser //!	 and are activated in one of its views. //!	 <Concentration> specifies the intensity distribution of //!	 the light. //!	 <AngleCone> specifies the angle (radians) of the cone //!	 created by the spot. 	 the global attenuation is equal : //!	 1 / (Fact1 + Fact2 * (norm(ObjectPosition - LightPosition))) Warning: Raises LightDefinitionError //!	 if <Direction> is null. //!	 if <Concentration> is a negative value or greater than 1.0. //!	 if <Fact1> and <Fact2> are null. //!	 if <Fact1> is a negative value or greater than 1.0. //!	 if <Fact2> is a negative value or greater than 1.0. //!	 if <AngleCone> is a negative value or greater than PI/2.

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
		%feature("autodoc", "	* Modifies the angle (radians) of the cone created by the spot. //!	 Works only on TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_SPOT. //!	 if <AngleCone> is a negative value or greater than PI/2.

	:param AngleCone:
	:type AngleCone: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real AngleCone);
		%feature("compactdefaultargs") SetAttenuation1;
		%feature("autodoc", "	* Modifies the attenuation factor of the light. //!	 Works only on the TOLS_POSITIONAL and TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_SPOT or TOLS_POSITIONAL. //!	 if <Fact1> is a negative value or greater than 1.0.

	:param Fact1:
	:type Fact1: float
	:rtype: None
") SetAttenuation1;
		void SetAttenuation1 (const Standard_Real Fact1);
		%feature("compactdefaultargs") SetAttenuation2;
		%feature("autodoc", "	* Modifies the attenuation factor of the light. //!	 Works only on the TOLS_POSITIONAL and TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_POSITIONAL or TOLS_SPOT. //!	 if <Fact2> is a negative value or greater than 1.0..

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
		%feature("autodoc", "	* Modifies the intensity distribution of the light. //!	 Works only on the TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_SPOT. //!	 if <Concentration> is a negative value or greater than 1.0.

	:param Concentration:
	:type Concentration: float
	:rtype: None
") SetConcentration;
		void SetConcentration (const Standard_Real Concentration);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Modifies the light direction. //!	 Works only on the TOLS_DIRECTIONAL and TOLS_SPOT lights. //!	 Default z Category: Methods to modify the class definition Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_DIRECTIONAL //!	 or TOLS_SPOT. //!	 if <Direction> is null.

	:param Direction:
	:type Direction: Graphic3d_Vector &
	:rtype: None
") SetDirection;
		void SetDirection (const Graphic3d_Vector & Direction);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Modifies the position of the light. //!	 Works only on the TOLS_POSITIONAL and TOLS_SPOT lights. Category: Methods to modify the class definition Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_POSITIONAL or TOLS_SPOT.

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
		%feature("autodoc", "	* Returns the light type of <self>. //!	 TypeOfLightSource = TOLS_AMBIENT //!				TOLS_DIRECTIONAL //!				TOLS_POSITIONAL //!				TOLS_SPOT

	:rtype: Visual3d_TypeOfLightSource
") LightType;
		Visual3d_TypeOfLightSource LightType ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the definition of <self> if <self> is //!	 a light source of the TOLS_AMBIENT type. Category: Inquire methods Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_AMBIENT.

	:param Color:
	:type Color: Quantity_Color &
	:rtype: None
") Values;
		void Values (Quantity_Color & Color);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the definition of <self> if <self> is //!	 a light source of the TOLS_DIRECTIONAL type. Category: Inquire methods Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_DIRECTIONAL.

	:param Color:
	:type Color: Quantity_Color &
	:param Direction:
	:type Direction: Graphic3d_Vector &
	:rtype: None
") Values;
		void Values (Quantity_Color & Color,Graphic3d_Vector & Direction);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the definition of <self> if <self> is //!	 a light source of the TOLS_POSITIONAL type. Category: Inquire methods Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_POSITIONAL.

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
		%feature("autodoc", "	* Returns the definition of <self> if <self> is //!	 a light source of the TOLS_SPOT type. Category: Inquire methods Warning: Raises LightDefinitionError //!	 if the type of the light is not TOLS_SPOT.

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


%feature("shadow") Visual3d_Light::~Visual3d_Light %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_Light {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_Light {
	Handle_Visual3d_Light GetHandle() {
	return *(Handle_Visual3d_Light*) &$self;
	}
};

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
    Visual3d_Light* GetObject() {
    return (Visual3d_Light*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_Light::~Handle_Visual3d_Light %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_Light {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_ListIteratorOfSetListOfSetOfLight;
class Visual3d_ListIteratorOfSetListOfSetOfLight {
	public:
		%feature("compactdefaultargs") Visual3d_ListIteratorOfSetListOfSetOfLight;
		%feature("autodoc", "	:rtype: None
") Visual3d_ListIteratorOfSetListOfSetOfLight;
		 Visual3d_ListIteratorOfSetListOfSetOfLight ();
		%feature("compactdefaultargs") Visual3d_ListIteratorOfSetListOfSetOfLight;
		%feature("autodoc", "	:param L:
	:type L: Visual3d_SetListOfSetOfLight &
	:rtype: None
") Visual3d_ListIteratorOfSetListOfSetOfLight;
		 Visual3d_ListIteratorOfSetListOfSetOfLight (const Visual3d_SetListOfSetOfLight & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Visual3d_SetListOfSetOfLight &
	:rtype: None
") Initialize;
		void Initialize (const Visual3d_SetListOfSetOfLight & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") Value;
		Handle_Visual3d_Light & Value ();
};


%feature("shadow") Visual3d_ListIteratorOfSetListOfSetOfLight::~Visual3d_ListIteratorOfSetListOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ListIteratorOfSetListOfSetOfLight {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_ListIteratorOfSetListOfSetOfView;
class Visual3d_ListIteratorOfSetListOfSetOfView {
	public:
		%feature("compactdefaultargs") Visual3d_ListIteratorOfSetListOfSetOfView;
		%feature("autodoc", "	:rtype: None
") Visual3d_ListIteratorOfSetListOfSetOfView;
		 Visual3d_ListIteratorOfSetListOfSetOfView ();
		%feature("compactdefaultargs") Visual3d_ListIteratorOfSetListOfSetOfView;
		%feature("autodoc", "	:param L:
	:type L: Visual3d_SetListOfSetOfView &
	:rtype: None
") Visual3d_ListIteratorOfSetListOfSetOfView;
		 Visual3d_ListIteratorOfSetListOfSetOfView (const Visual3d_SetListOfSetOfView & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Visual3d_SetListOfSetOfView &
	:rtype: None
") Initialize;
		void Initialize (const Visual3d_SetListOfSetOfView & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") Value;
		Handle_Visual3d_View & Value ();
};


%feature("shadow") Visual3d_ListIteratorOfSetListOfSetOfView::~Visual3d_ListIteratorOfSetListOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ListIteratorOfSetListOfSetOfView {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_ListNodeOfSetListOfSetOfLight;
class Visual3d_ListNodeOfSetListOfSetOfLight : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Visual3d_ListNodeOfSetListOfSetOfLight;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Visual3d_ListNodeOfSetListOfSetOfLight;
		 Visual3d_ListNodeOfSetListOfSetOfLight (const Handle_Visual3d_Light & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") Value;
		Handle_Visual3d_Light & Value ();
};


%feature("shadow") Visual3d_ListNodeOfSetListOfSetOfLight::~Visual3d_ListNodeOfSetListOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ListNodeOfSetListOfSetOfLight {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_ListNodeOfSetListOfSetOfLight {
	Handle_Visual3d_ListNodeOfSetListOfSetOfLight GetHandle() {
	return *(Handle_Visual3d_ListNodeOfSetListOfSetOfLight*) &$self;
	}
};

%nodefaultctor Handle_Visual3d_ListNodeOfSetListOfSetOfLight;
class Handle_Visual3d_ListNodeOfSetListOfSetOfLight : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Visual3d_ListNodeOfSetListOfSetOfLight();
        Handle_Visual3d_ListNodeOfSetListOfSetOfLight(const Handle_Visual3d_ListNodeOfSetListOfSetOfLight &aHandle);
        Handle_Visual3d_ListNodeOfSetListOfSetOfLight(const Visual3d_ListNodeOfSetListOfSetOfLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_ListNodeOfSetListOfSetOfLight DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_ListNodeOfSetListOfSetOfLight {
    Visual3d_ListNodeOfSetListOfSetOfLight* GetObject() {
    return (Visual3d_ListNodeOfSetListOfSetOfLight*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_ListNodeOfSetListOfSetOfLight::~Handle_Visual3d_ListNodeOfSetListOfSetOfLight %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_ListNodeOfSetListOfSetOfLight {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_ListNodeOfSetListOfSetOfView;
class Visual3d_ListNodeOfSetListOfSetOfView : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Visual3d_ListNodeOfSetListOfSetOfView;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Visual3d_ListNodeOfSetListOfSetOfView;
		 Visual3d_ListNodeOfSetListOfSetOfView (const Handle_Visual3d_View & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") Value;
		Handle_Visual3d_View & Value ();
};


%feature("shadow") Visual3d_ListNodeOfSetListOfSetOfView::~Visual3d_ListNodeOfSetListOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ListNodeOfSetListOfSetOfView {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_ListNodeOfSetListOfSetOfView {
	Handle_Visual3d_ListNodeOfSetListOfSetOfView GetHandle() {
	return *(Handle_Visual3d_ListNodeOfSetListOfSetOfView*) &$self;
	}
};

%nodefaultctor Handle_Visual3d_ListNodeOfSetListOfSetOfView;
class Handle_Visual3d_ListNodeOfSetListOfSetOfView : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Visual3d_ListNodeOfSetListOfSetOfView();
        Handle_Visual3d_ListNodeOfSetListOfSetOfView(const Handle_Visual3d_ListNodeOfSetListOfSetOfView &aHandle);
        Handle_Visual3d_ListNodeOfSetListOfSetOfView(const Visual3d_ListNodeOfSetListOfSetOfView *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_ListNodeOfSetListOfSetOfView DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_ListNodeOfSetListOfSetOfView {
    Visual3d_ListNodeOfSetListOfSetOfView* GetObject() {
    return (Visual3d_ListNodeOfSetListOfSetOfView*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_ListNodeOfSetListOfSetOfView::~Handle_Visual3d_ListNodeOfSetListOfSetOfView %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_ListNodeOfSetListOfSetOfView {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_PickDescriptor;
class Visual3d_PickDescriptor {
	public:
		%feature("compactdefaultargs") Visual3d_PickDescriptor;
		%feature("autodoc", "	* Creates a PickDescriptor <self>.

	:param CTX:
	:type CTX: Visual3d_ContextPick &
	:rtype: None
") Visual3d_PickDescriptor;
		 Visual3d_PickDescriptor (const Visual3d_ContextPick & CTX);
		%feature("compactdefaultargs") AddPickPath;
		%feature("autodoc", "	* Adds a PickPath to PickDescriptor <self>.

	:param APickPath:
	:type APickPath: Visual3d_PickPath &
	:rtype: None
") AddPickPath;
		void AddPickPath (const Visual3d_PickPath & APickPath);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Erases all the information in <self>.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Returns the pick depth, that is the //!	 number of PickPaths available in the PickDescriptor.

	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") PickPath;
		%feature("autodoc", "	* Returns the group of PickPaths of <self>.

	:rtype: Handle_Visual3d_HSequenceOfPickPath
") PickPath;
		Handle_Visual3d_HSequenceOfPickPath PickPath ();
		%feature("compactdefaultargs") TopStructure;
		%feature("autodoc", "	* Returns the root structure. //!	 If the pick order was of the type TOO_TOPFIRST //!	 then it's the first structure. //!	 If the pick order was of the type TOO_BOTTOMFIRST //!	 Then it's the last structure. //!	 The pick order is set by the method SetOrder //!	 from ContextPick. Category: Inquire methods Warning: Raises PickError if Depth == 0 (no picked structure).

	:rtype: Handle_Graphic3d_Structure
") TopStructure;
		Handle_Graphic3d_Structure TopStructure ();
		%feature("compactdefaultargs") TopPickId;
		%feature("autodoc", "	* Returns the root structure pickid. //!	 If the pick order was of the type TOO_TOPFIRST //!	 then it's the first pickid. //!	 If the pick order was of the type TOO_BOTTOMFIRST //!	 then it's the last pickid. //!	 The pick order is set by the method SetOrder //!	 from ContextPick. Category: Inquire methods Warning: Raises PickError if Depth == 0 (no picked structure).

	:rtype: int
") TopPickId;
		Standard_Integer TopPickId ();
		%feature("compactdefaultargs") TopElementNumber;
		%feature("autodoc", "	* Returns the root structure element number. //!	 If the pick order was of the type TOO_TOPFIRST //!	 then it's the first element number. //!	 If the pick order was of the type TOO_BOTTOMFIRST //!	 then it's the last element number. //!	 The pick order is set by the method SetOrder //!	 from ContextPick. Category: Inquire methods Warning: Raises PickError if Depth == 0 (no picked structure).

	:rtype: int
") TopElementNumber;
		Standard_Integer TopElementNumber ();
};


%feature("shadow") Visual3d_PickDescriptor::~Visual3d_PickDescriptor %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_PickDescriptor {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_PickPath;
class Visual3d_PickPath {
	public:
		%feature("compactdefaultargs") Visual3d_PickPath;
		%feature("autodoc", "	* Creates an undefined PickPath.

	:rtype: None
") Visual3d_PickPath;
		 Visual3d_PickPath ();
		%feature("compactdefaultargs") Visual3d_PickPath;
		%feature("autodoc", "	* Creates a PickPath : //!	 <AElemNumber> : Element number of the structure picked. //!	 <APickId>	 : Pick identifier of the structure picked. //!	 <AStructure> : The picked structure.

	:param AElemNumber:
	:type AElemNumber: int
	:param APickId:
	:type APickId: int
	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Visual3d_PickPath;
		 Visual3d_PickPath (const Standard_Integer AElemNumber,const Standard_Integer APickId,const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") SetElementNumber;
		%feature("autodoc", "	* Modifies the PickPath <self>. //!	 <AElemNumber> : Element number of the structure picked.

	:param AElemNumber:
	:type AElemNumber: int
	:rtype: None
") SetElementNumber;
		void SetElementNumber (const Standard_Integer AElemNumber);
		%feature("compactdefaultargs") SetPickIdentifier;
		%feature("autodoc", "	* Modifies the PickPath <self>. //!	 <APickId>	 : Pick identifier of the structure picked.

	:param APickId:
	:type APickId: int
	:rtype: None
") SetPickIdentifier;
		void SetPickIdentifier (const Standard_Integer APickId);
		%feature("compactdefaultargs") SetStructIdentifier;
		%feature("autodoc", "	* Modifies the PickPath <self>. //!	 <AStructure>	: Identifier of the structure picked.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") SetStructIdentifier;
		void SetStructIdentifier (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") ElementNumber;
		%feature("autodoc", "	* Returns the element number stocked in the PickPath <self>. Category: Inquire methods Warning: Raises PickError if PickPath is empty (no picked structure).

	:rtype: int
") ElementNumber;
		Standard_Integer ElementNumber ();
		%feature("compactdefaultargs") PickIdentifier;
		%feature("autodoc", "	* Returns the pick identifier stocked in the PickPath <self>. Category: Inquire methods Warning: Raises PickError if PickPath is empty (no picked structure).

	:rtype: int
") PickIdentifier;
		Standard_Integer PickIdentifier ();
		%feature("compactdefaultargs") StructIdentifier;
		%feature("autodoc", "	* Returns the structure stocked in the PickPath <self>. Category: Inquire methods Warning: Raises PickError if PickPath is empty (no picked structure).

	:rtype: Handle_Graphic3d_Structure
") StructIdentifier;
		Handle_Graphic3d_Structure StructIdentifier ();
};


%feature("shadow") Visual3d_PickPath::~Visual3d_PickPath %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_PickPath {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_SequenceNodeOfSequenceOfPickPath;
class Visual3d_SequenceNodeOfSequenceOfPickPath : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Visual3d_SequenceNodeOfSequenceOfPickPath;
		%feature("autodoc", "	:param I:
	:type I: Visual3d_PickPath &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Visual3d_SequenceNodeOfSequenceOfPickPath;
		 Visual3d_SequenceNodeOfSequenceOfPickPath (const Visual3d_PickPath & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Visual3d_PickPath
") Value;
		Visual3d_PickPath & Value ();
};


%feature("shadow") Visual3d_SequenceNodeOfSequenceOfPickPath::~Visual3d_SequenceNodeOfSequenceOfPickPath %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SequenceNodeOfSequenceOfPickPath {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_SequenceNodeOfSequenceOfPickPath {
	Handle_Visual3d_SequenceNodeOfSequenceOfPickPath GetHandle() {
	return *(Handle_Visual3d_SequenceNodeOfSequenceOfPickPath*) &$self;
	}
};

%nodefaultctor Handle_Visual3d_SequenceNodeOfSequenceOfPickPath;
class Handle_Visual3d_SequenceNodeOfSequenceOfPickPath : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Visual3d_SequenceNodeOfSequenceOfPickPath();
        Handle_Visual3d_SequenceNodeOfSequenceOfPickPath(const Handle_Visual3d_SequenceNodeOfSequenceOfPickPath &aHandle);
        Handle_Visual3d_SequenceNodeOfSequenceOfPickPath(const Visual3d_SequenceNodeOfSequenceOfPickPath *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_SequenceNodeOfSequenceOfPickPath DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_SequenceNodeOfSequenceOfPickPath {
    Visual3d_SequenceNodeOfSequenceOfPickPath* GetObject() {
    return (Visual3d_SequenceNodeOfSequenceOfPickPath*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_SequenceNodeOfSequenceOfPickPath::~Handle_Visual3d_SequenceNodeOfSequenceOfPickPath %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_SequenceNodeOfSequenceOfPickPath {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_SequenceOfPickPath;
class Visual3d_SequenceOfPickPath : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Visual3d_SequenceOfPickPath;
		%feature("autodoc", "	:rtype: None
") Visual3d_SequenceOfPickPath;
		 Visual3d_SequenceOfPickPath ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfPickPath &
	:rtype: Visual3d_SequenceOfPickPath
") Assign;
		const Visual3d_SequenceOfPickPath & Assign (const Visual3d_SequenceOfPickPath & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SequenceOfPickPath &
	:rtype: Visual3d_SequenceOfPickPath
") operator=;
		const Visual3d_SequenceOfPickPath & operator = (const Visual3d_SequenceOfPickPath & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Visual3d_PickPath &
	:rtype: None
") Append;
		void Append (const Visual3d_PickPath & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SequenceOfPickPath &
	:rtype: None
") Append;
		void Append (Visual3d_SequenceOfPickPath & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Visual3d_PickPath &
	:rtype: None
") Prepend;
		void Prepend (const Visual3d_PickPath & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SequenceOfPickPath &
	:rtype: None
") Prepend;
		void Prepend (Visual3d_SequenceOfPickPath & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Visual3d_PickPath &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Visual3d_PickPath & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Visual3d_SequenceOfPickPath &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Visual3d_SequenceOfPickPath & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Visual3d_PickPath &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Visual3d_PickPath & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Visual3d_SequenceOfPickPath &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Visual3d_SequenceOfPickPath & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Visual3d_PickPath
") First;
		const Visual3d_PickPath & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Visual3d_PickPath
") Last;
		const Visual3d_PickPath & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Visual3d_SequenceOfPickPath &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Visual3d_SequenceOfPickPath & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Visual3d_PickPath
") Value;
		const Visual3d_PickPath & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Visual3d_PickPath &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Visual3d_PickPath & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Visual3d_PickPath
") ChangeValue;
		Visual3d_PickPath & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Visual3d_SequenceOfPickPath::~Visual3d_SequenceOfPickPath %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SequenceOfPickPath {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_SetIteratorOfSetOfLight;
class Visual3d_SetIteratorOfSetOfLight {
	public:
		%feature("compactdefaultargs") Visual3d_SetIteratorOfSetOfLight;
		%feature("autodoc", "	:rtype: None
") Visual3d_SetIteratorOfSetOfLight;
		 Visual3d_SetIteratorOfSetOfLight ();
		%feature("compactdefaultargs") Visual3d_SetIteratorOfSetOfLight;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfLight &
	:rtype: None
") Visual3d_SetIteratorOfSetOfLight;
		 Visual3d_SetIteratorOfSetOfLight (const Visual3d_SetOfLight & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfLight &
	:rtype: None
") Initialize;
		void Initialize (const Visual3d_SetOfLight & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") Value;
		const Handle_Visual3d_Light & Value ();
};


%feature("shadow") Visual3d_SetIteratorOfSetOfLight::~Visual3d_SetIteratorOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SetIteratorOfSetOfLight {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_SetIteratorOfSetOfView;
class Visual3d_SetIteratorOfSetOfView {
	public:
		%feature("compactdefaultargs") Visual3d_SetIteratorOfSetOfView;
		%feature("autodoc", "	:rtype: None
") Visual3d_SetIteratorOfSetOfView;
		 Visual3d_SetIteratorOfSetOfView ();
		%feature("compactdefaultargs") Visual3d_SetIteratorOfSetOfView;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfView &
	:rtype: None
") Visual3d_SetIteratorOfSetOfView;
		 Visual3d_SetIteratorOfSetOfView (const Visual3d_SetOfView & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfView &
	:rtype: None
") Initialize;
		void Initialize (const Visual3d_SetOfView & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") Value;
		const Handle_Visual3d_View & Value ();
};


%feature("shadow") Visual3d_SetIteratorOfSetOfView::~Visual3d_SetIteratorOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SetIteratorOfSetOfView {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_SetListOfSetOfLight;
class Visual3d_SetListOfSetOfLight {
	public:
		%feature("compactdefaultargs") Visual3d_SetListOfSetOfLight;
		%feature("autodoc", "	:rtype: None
") Visual3d_SetListOfSetOfLight;
		 Visual3d_SetListOfSetOfLight ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfLight &
	:rtype: None
") Assign;
		void Assign (const Visual3d_SetListOfSetOfLight & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfLight &
	:rtype: None
") operator=;
		void operator = (const Visual3d_SetListOfSetOfLight & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_Light & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:param theIt:
	:type theIt: Visual3d_ListIteratorOfSetListOfSetOfLight &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfLight &
	:rtype: None
") Prepend;
		void Prepend (Visual3d_SetListOfSetOfLight & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_Light & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:param theIt:
	:type theIt: Visual3d_ListIteratorOfSetListOfSetOfLight &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfLight &
	:rtype: None
") Append;
		void Append (Visual3d_SetListOfSetOfLight & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") First;
		Handle_Visual3d_Light & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Visual3d_Light
") Last;
		Handle_Visual3d_Light & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfLight &
	:rtype: None
") Remove;
		void Remove (Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfLight &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfLight &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfLight &
	:rtype: None
") InsertBefore;
		void InsertBefore (Visual3d_SetListOfSetOfLight & Other,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_Light &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfLight &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfLight &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfLight &
	:rtype: None
") InsertAfter;
		void InsertAfter (Visual3d_SetListOfSetOfLight & Other,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
};


%feature("shadow") Visual3d_SetListOfSetOfLight::~Visual3d_SetListOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SetListOfSetOfLight {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_SetListOfSetOfView;
class Visual3d_SetListOfSetOfView {
	public:
		%feature("compactdefaultargs") Visual3d_SetListOfSetOfView;
		%feature("autodoc", "	:rtype: None
") Visual3d_SetListOfSetOfView;
		 Visual3d_SetListOfSetOfView ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfView &
	:rtype: None
") Assign;
		void Assign (const Visual3d_SetListOfSetOfView & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfView &
	:rtype: None
") operator=;
		void operator = (const Visual3d_SetListOfSetOfView & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_View & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:param theIt:
	:type theIt: Visual3d_ListIteratorOfSetListOfSetOfView &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfView &
	:rtype: None
") Prepend;
		void Prepend (Visual3d_SetListOfSetOfView & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_View & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:param theIt:
	:type theIt: Visual3d_ListIteratorOfSetListOfSetOfView &
	:rtype: None
") Append;
		void Append (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfView &
	:rtype: None
") Append;
		void Append (Visual3d_SetListOfSetOfView & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") First;
		Handle_Visual3d_View & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Visual3d_View
") Last;
		Handle_Visual3d_View & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfView &
	:rtype: None
") Remove;
		void Remove (Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfView &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfView &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfView &
	:rtype: None
") InsertBefore;
		void InsertBefore (Visual3d_SetListOfSetOfView & Other,Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Visual3d_View &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfView &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Visual3d_SetListOfSetOfView &
	:param It:
	:type It: Visual3d_ListIteratorOfSetListOfSetOfView &
	:rtype: None
") InsertAfter;
		void InsertAfter (Visual3d_SetListOfSetOfView & Other,Visual3d_ListIteratorOfSetListOfSetOfView & It);
};


%feature("shadow") Visual3d_SetListOfSetOfView::~Visual3d_SetListOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SetListOfSetOfView {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_SetOfLight;
class Visual3d_SetOfLight {
	public:
		%feature("compactdefaultargs") Visual3d_SetOfLight;
		%feature("autodoc", "	:rtype: None
") Visual3d_SetOfLight;
		 Visual3d_SetOfLight ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "	:param B:
	:type B: Visual3d_SetOfLight &
	:rtype: None
") Union;
		void Union (const Visual3d_SetOfLight & B);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param B:
	:type B: Visual3d_SetOfLight &
	:rtype: None
") Intersection;
		void Intersection (const Visual3d_SetOfLight & B);
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "	:param B:
	:type B: Visual3d_SetOfLight &
	:rtype: None
") Difference;
		void Difference (const Visual3d_SetOfLight & B);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_Light &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_Light & T);
		%feature("compactdefaultargs") IsASubset;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfLight &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Visual3d_SetOfLight & S);
		%feature("compactdefaultargs") IsAProperSubset;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfLight &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Visual3d_SetOfLight & S);
};


%feature("shadow") Visual3d_SetOfLight::~Visual3d_SetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SetOfLight {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_SetOfView;
class Visual3d_SetOfView {
	public:
		%feature("compactdefaultargs") Visual3d_SetOfView;
		%feature("autodoc", "	:rtype: None
") Visual3d_SetOfView;
		 Visual3d_SetOfView ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "	:param B:
	:type B: Visual3d_SetOfView &
	:rtype: None
") Union;
		void Union (const Visual3d_SetOfView & B);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param B:
	:type B: Visual3d_SetOfView &
	:rtype: None
") Intersection;
		void Intersection (const Visual3d_SetOfView & B);
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "	:param B:
	:type B: Visual3d_SetOfView &
	:rtype: None
") Difference;
		void Difference (const Visual3d_SetOfView & B);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param T:
	:type T: Handle_Visual3d_View &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_View & T);
		%feature("compactdefaultargs") IsASubset;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfView &
	:rtype: bool
") IsASubset;
		Standard_Boolean IsASubset (const Visual3d_SetOfView & S);
		%feature("compactdefaultargs") IsAProperSubset;
		%feature("autodoc", "	:param S:
	:type S: Visual3d_SetOfView &
	:rtype: bool
") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Visual3d_SetOfView & S);
};


%feature("shadow") Visual3d_SetOfView::~Visual3d_SetOfView %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_SetOfView {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_TransientManager;
class Visual3d_TransientManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Visual3d_TransientManager;
		%feature("autodoc", "	* Creates a TransientManager <aView>.

	:rtype: None
") Visual3d_TransientManager;
		 Visual3d_TransientManager ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Suppress the TransientManager <self>.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") BeginDraw;
		%feature("autodoc", "	* Begins any graphics in the view <aView> Redraw any structured graphics in the back buffer before if <DoubleBuffer> is True. Restore the front buffer from the back before if <DoubleBuffer> is False. if <RetainMode> is True. the graphic managed itself exposure,resizing ... if <RetainMode> is False. the application must managed itself exposure,resizing ... Warning: Returns True if transient drawing is enabled in the associated view. Returns False ,if nothing works because something is wrong for the transient principle : Immediat mode is not implemented depending of the graphic library used.  MBX,PIXMAP double buffering don't works depending of  the graphic board and the visual of the window supporting  the view. Warning: No default attributes Raises TransientDefinitionError from Visual3d; if Drawing is already opened. or the associated view is not mapped on a window.

	:param aView:
	:type aView: Handle_Visual3d_View &
	:param DoubleBuffer: default value is Standard_False
	:type DoubleBuffer: bool
	:param RetainMode: default value is Standard_False
	:type RetainMode: bool
	:rtype: int
") BeginDraw;
		static Standard_Integer BeginDraw (const Handle_Visual3d_View & aView,const Standard_Boolean DoubleBuffer = Standard_False,const Standard_Boolean RetainMode = Standard_False);
		%feature("compactdefaultargs") EndDraw;
		%feature("autodoc", "	* Flush all graphics to the front buffer. Synchronize graphics to the screen if <Synchronize> is True (make becarefull to the performances!). Raises TransientDefinitionError from Visual3d; if Drawing is not opened.

	:param Synchronize: default value is Standard_False
	:type Synchronize: bool
	:rtype: void
") EndDraw;
		static void EndDraw (const Standard_Boolean Synchronize = Standard_False);
		%feature("compactdefaultargs") ClearDraw;
		%feature("autodoc", "	* Clear all transient graphics in the view <aView>  updates a scene if <aFlush> = true Raises TransientDefinitionError from Visual3d; if Drawing is already opened. or the associated view is not mapped on a window.

	:param aView:
	:type aView: Handle_Visual3d_View &
	:param aFlush: default value is Standard_True
	:type aFlush: bool
	:rtype: void
") ClearDraw;
		static void ClearDraw (const Handle_Visual3d_View & aView,const Standard_Boolean aFlush = Standard_True);
		%feature("compactdefaultargs") BeginAddDraw;
		%feature("autodoc", "	* Begins any add graphics in the view <aView> the application must managed itself exposure,resizing ... Warning: Returns True if transient drawing is enabled in the associated view. Returns False ,if nothing works because something is wrong for the transient principle : Immediat mode is not implemented depending of the graphic library used.  MBX,PIXMAP double buffering don't works depending of  the graphic board and the visual of the window supporting  the view. Warning: No default attributes Raises TransientDefinitionError from Visual3d; if Drawing is already opened. or the associated view is not mapped on a window.

	:param aView:
	:type aView: Handle_Visual3d_View &
	:rtype: int
") BeginAddDraw;
		static Standard_Integer BeginAddDraw (const Handle_Visual3d_View & aView);
		%feature("compactdefaultargs") EndAddDraw;
		%feature("autodoc", "	* Flush all add graphics to the front buffer. Raises TransientDefinitionError from Visual3d; if Drawing is not opened.

	:rtype: void
") EndAddDraw;
		static void EndAddDraw ();
		%feature("compactdefaultargs") DrawStructure;
		%feature("autodoc", "	* Drawn the structure <AStructure>. Raises TransientDefinitionError from Visual3d; if Drawing is not opened.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") DrawStructure;
		static void DrawStructure (const Handle_Graphic3d_Structure & AStructure);
};


%feature("shadow") Visual3d_TransientManager::~Visual3d_TransientManager %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_TransientManager {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_TransientManager {
	Handle_Visual3d_TransientManager GetHandle() {
	return *(Handle_Visual3d_TransientManager*) &$self;
	}
};

%nodefaultctor Handle_Visual3d_TransientManager;
class Handle_Visual3d_TransientManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Visual3d_TransientManager();
        Handle_Visual3d_TransientManager(const Handle_Visual3d_TransientManager &aHandle);
        Handle_Visual3d_TransientManager(const Visual3d_TransientManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Visual3d_TransientManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Visual3d_TransientManager {
    Visual3d_TransientManager* GetObject() {
    return (Visual3d_TransientManager*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_TransientManager::~Handle_Visual3d_TransientManager %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_TransientManager {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_View;
class Visual3d_View : public Graphic3d_DataStructureManager {
	public:
		%feature("compactdefaultargs") Visual3d_View;
		%feature("autodoc", "	* Creates a view in the viewer <AManager> with a default //!	 orientation and a default mapping.

	:param AManager:
	:type AManager: Handle_Visual3d_ViewManager &
	:rtype: None
") Visual3d_View;
		 Visual3d_View (const Handle_Visual3d_ViewManager & AManager);
		%feature("compactdefaultargs") Visual3d_View;
		%feature("autodoc", "	* Creates a view in the viewer <AManager> with the orientation //!	 <VO>, the mapping <VM>, and the context<CTX>.

	:param AManager:
	:type AManager: Handle_Visual3d_ViewManager &
	:param VO:
	:type VO: Visual3d_ViewOrientation &
	:param VM:
	:type VM: Visual3d_ViewMapping &
	:param CTX:
	:type CTX: Visual3d_ContextView &
	:rtype: None
") Visual3d_View;
		 Visual3d_View (const Handle_Visual3d_ViewManager & AManager,const Visual3d_ViewOrientation & VO,const Visual3d_ViewMapping & VM,const Visual3d_ContextView & CTX);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the view <self>. //!	 Map the associated window on the screen and //!	 post the view in this window. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

	:rtype: None
") Activate;
		void Activate ();
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates the view <self>. //!	 Unmap the associated window on the screen and //!	 unpost the view in this window. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

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
		%feature("autodoc", "	* Updates the view <self> after the modification //!	 of the associated window. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

	:rtype: None
") Resized;
		void Resized ();
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Modifies the default window background. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

	:param ABack:
	:type ABack: Aspect_Background &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_Background & ABack);
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "	* Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

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
		%feature("autodoc", "	* Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:param update:
	:type update: bool
	:rtype: None
") SetBgImageStyle;
		void SetBgImageStyle (const Aspect_FillMethod FillStyle,const Standard_Boolean update);
		%feature("compactdefaultargs") SetGradientBackground;
		%feature("autodoc", "	* Modifies the gradient window background. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

	:param ABack:
	:type ABack: Aspect_GradientBackground &
	:param update:
	:type update: bool
	:rtype: None
") SetGradientBackground;
		void SetGradientBackground (const Aspect_GradientBackground & ABack,const Standard_Boolean update);
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "	* Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

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
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	* Sets the transformation matrix that is applied to <MyViewOrientation> field of the view <self>. //!	 <AMatrix> is defined as a 4*4 real matrix. //!		------------------- //!		| a11 a12 a13 t1 | //!		| a21 a22 a23 t2 | //!		| a31 a32 a33 t3 | //!		| 0 0 0 1 | //!		------------------- Category: Methods to modify the class definition Warning: Raises TransformError if the matrix isn't a 4x4 matrix.

	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") SetTransform;
		void SetTransform (const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") SetViewMapping;
		%feature("autodoc", "	* Modifies the mapping of the view <self>.

	:param VM:
	:type VM: Visual3d_ViewMapping &
	:rtype: None
") SetViewMapping;
		void SetViewMapping (const Visual3d_ViewMapping & VM);
		%feature("compactdefaultargs") SetViewMappingDefault;
		%feature("autodoc", "	* Saves the current mapping which will be the //!	 reference value for the reset of the mapping //!	 done by the ViewmappingReset method.

	:rtype: None
") SetViewMappingDefault;
		void SetViewMappingDefault ();
		%feature("compactdefaultargs") SetViewOrientation;
		%feature("autodoc", "	* Modifies the orientation of <self>.

	:param VO:
	:type VO: Visual3d_ViewOrientation &
	:rtype: None
") SetViewOrientation;
		void SetViewOrientation (const Visual3d_ViewOrientation & VO);
		%feature("compactdefaultargs") SetViewOrientationDefault;
		%feature("autodoc", "	* Saves the current orientation which will be the //!	 reference value for the reset of the orientation //!	 done by the ViewOrientationReset method.

	:rtype: None
") SetViewOrientationDefault;
		void SetViewOrientationDefault ();
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Associates the window <AWindow> to the view <self>. //!	 No new association if the window is already defined. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if it is impossible //!	 to associate a view and a window. //!	 (association already done or another problem) //!	 Modifies the viewmapping of the associated view //!	 when it calls the SetRatio method. //!	 After this call, each view is mapped in an unique window. Programming example : An example when we have 1 view and 1 window ------------------------------------------- Handle_Aspect_DisplayConnection aDisplayConnection; // Display connection initialization only needed on Linux platform // and on Mac OS X, in cases when you use Xlib for windows drawing. aDisplayConnection = new Aspect_DisplayConnection(); // Graphic driver initialization Handle_Graphic3d_GraphicDriver aGraphicDriver = Graphic3d::InitGraphicDriver (aDisplayConnection); // Define a view manager Handle_Visual3d_ViewManager aVisualManager = new Visual3d_ViewManager (aGraphicDriver); // Define a view Handle_Visual3d_View aView = new Visual3d_View (aVisaulManager); // Define a window Handle_Xw_Window aWindow = new Xw_Window //!	(aDisplayConnection, 'Graphic View 1', 0.695, 0.695, 0.600, 0.600, Quantity_NOC_MATRAGRAY); // Associate the view and the window aView->SetWindow (aWindow); // Map the window aWindow->Map (); // Activate the view aView->Activate ();

	:param AWindow:
	:type AWindow: Handle_Aspect_Window &
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & AWindow);
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Associates the window <AWindow> and context <AContext> //!	 to the view <self>. //!	 If <AContext> is not NULL the graphic context is used directly to draw something in this view. //!	 Otherwise an internal context is created. If <ADisplayCB> is not NULL then a user display CB is call at the end of the OCC graphic traversal and just before the swap of buffers. The <aClientData> is pass to this call back. //!	 No new association if the window is already defined. Category: Methods to modify the class definition Warning: Raises ViewDefinitionError if it is impossible //!	 to associate a view and a window. //!	 (association already done or another problem) //!	 Modifies the viewmapping of the associated view //!	 when it calls the SetRatio method. //!	 After this call, each view is mapped in an unique window.

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
		%feature("autodoc", "	* Updates screen in function of modifications of //!	 the structures.

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates screen in function of modifications of //!	 the structures.

	:param AnUnderLayer:
	:type AnUnderLayer: Handle_Visual3d_Layer &
	:param AnOverLayer:
	:type AnOverLayer: Handle_Visual3d_Layer &
	:rtype: None
") Update;
		void Update (const Handle_Visual3d_Layer & AnUnderLayer,const Handle_Visual3d_Layer & AnOverLayer);
		%feature("compactdefaultargs") ViewMappingReset;
		%feature("autodoc", "	* Sets the value of the mapping to be the same as //!	 the mapping saved by the SetViewMappingDefaut method.

	:rtype: None
") ViewMappingReset;
		void ViewMappingReset ();
		%feature("compactdefaultargs") ViewOrientationReset;
		%feature("autodoc", "	* Sets the value of the orientation to be the same as the //!	 orientation saved by the SetViewOrientationDefaut method.

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
		%feature("autodoc", "	* Customization of the ZBUFFER Triedron.  Initializes Colors of X Y and axis  Scale ratio defines decreasing of trihedron size when  its position is out of a View

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
		%feature("autodoc", "	* Display of the Triedron.  Initialize position, color and length of Triedron axes.  The scale is a percent of the window width.  If AsWireframe is False triedron is shown in shaded mode  AColor is not considered for ZBUFFER mode

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
		%feature("autodoc", "	* Returns data of a graduated trihedron if displayed (return value is True)

	:param xname:
	:type xname: TCollection_ExtendedString &
	:param yname:
	:type yname: TCollection_ExtendedString &
	:param zname:
	:type zname: TCollection_ExtendedString &
	:param xdrawname:
	:type xdrawname: bool
	:param ydrawname:
	:type ydrawname: bool
	:param zdrawname:
	:type zdrawname: bool
	:param xdrawvalues:
	:type xdrawvalues: bool
	:param ydrawvalues:
	:type ydrawvalues: bool
	:param zdrawvalues:
	:type zdrawvalues: bool
	:param drawgrid:
	:type drawgrid: bool
	:param drawaxes:
	:type drawaxes: bool
	:param nbx:
	:type nbx: int &
	:param nby:
	:type nby: int &
	:param nbz:
	:type nbz: int &
	:param xoffset:
	:type xoffset: int &
	:param yoffset:
	:type yoffset: int &
	:param zoffset:
	:type zoffset: int &
	:param xaxisoffset:
	:type xaxisoffset: int &
	:param yaxisoffset:
	:type yaxisoffset: int &
	:param zaxisoffset:
	:type zaxisoffset: int &
	:param xdrawtickmarks:
	:type xdrawtickmarks: bool
	:param ydrawtickmarks:
	:type ydrawtickmarks: bool
	:param zdrawtickmarks:
	:type zdrawtickmarks: bool
	:param xtickmarklength:
	:type xtickmarklength: int &
	:param ytickmarklength:
	:type ytickmarklength: int &
	:param ztickmarklength:
	:type ztickmarklength: int &
	:param gridcolor:
	:type gridcolor: Quantity_Color &
	:param xnamecolor:
	:type xnamecolor: Quantity_Color &
	:param ynamecolor:
	:type ynamecolor: Quantity_Color &
	:param znamecolor:
	:type znamecolor: Quantity_Color &
	:param xcolor:
	:type xcolor: Quantity_Color &
	:param ycolor:
	:type ycolor: Quantity_Color &
	:param zcolor:
	:type zcolor: Quantity_Color &
	:param fontOfNames:
	:type fontOfNames: TCollection_AsciiString &
	:param styleOfNames:
	:type styleOfNames: Font_FontAspect &
	:param sizeOfNames:
	:type sizeOfNames: int &
	:param fontOfValues:
	:type fontOfValues: TCollection_AsciiString &
	:param styleOfValues:
	:type styleOfValues: Font_FontAspect &
	:param sizeOfValues:
	:type sizeOfValues: int &
	:rtype: bool
") GetGraduatedTrihedron;
		Standard_Boolean GetGraduatedTrihedron (TCollection_ExtendedString & xname,TCollection_ExtendedString & yname,TCollection_ExtendedString & zname,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Quantity_Color & gridcolor,Quantity_Color & xnamecolor,Quantity_Color & ynamecolor,Quantity_Color & znamecolor,Quantity_Color & xcolor,Quantity_Color & ycolor,Quantity_Color & zcolor,TCollection_AsciiString & fontOfNames,Font_FontAspect & styleOfNames,Standard_Integer &OutValue,TCollection_AsciiString & fontOfValues,Font_FontAspect & styleOfValues,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "	* Displays a graduated trihedron.

	:param xname:
	:type xname: TCollection_ExtendedString &
	:param yname:
	:type yname: TCollection_ExtendedString &
	:param zname:
	:type zname: TCollection_ExtendedString &
	:param xdrawname:
	:type xdrawname: bool
	:param ydrawname:
	:type ydrawname: bool
	:param zdrawname:
	:type zdrawname: bool
	:param xdrawvalues:
	:type xdrawvalues: bool
	:param ydrawvalues:
	:type ydrawvalues: bool
	:param zdrawvalues:
	:type zdrawvalues: bool
	:param drawgrid:
	:type drawgrid: bool
	:param drawaxes:
	:type drawaxes: bool
	:param nbx:
	:type nbx: int
	:param nby:
	:type nby: int
	:param nbz:
	:type nbz: int
	:param xoffset:
	:type xoffset: int
	:param yoffset:
	:type yoffset: int
	:param zoffset:
	:type zoffset: int
	:param xaxisoffset:
	:type xaxisoffset: int
	:param yaxisoffset:
	:type yaxisoffset: int
	:param zaxisoffset:
	:type zaxisoffset: int
	:param xdrawtickmarks:
	:type xdrawtickmarks: bool
	:param ydrawtickmarks:
	:type ydrawtickmarks: bool
	:param zdrawtickmarks:
	:type zdrawtickmarks: bool
	:param xtickmarklength:
	:type xtickmarklength: int
	:param ytickmarklength:
	:type ytickmarklength: int
	:param ztickmarklength:
	:type ztickmarklength: int
	:param gridcolor:
	:type gridcolor: Quantity_Color &
	:param xnamecolor:
	:type xnamecolor: Quantity_Color &
	:param ynamecolor:
	:type ynamecolor: Quantity_Color &
	:param znamecolor:
	:type znamecolor: Quantity_Color &
	:param xcolor:
	:type xcolor: Quantity_Color &
	:param ycolor:
	:type ycolor: Quantity_Color &
	:param zcolor:
	:type zcolor: Quantity_Color &
	:param fontOfNames:
	:type fontOfNames: TCollection_AsciiString &
	:param styleOfNames:
	:type styleOfNames: Font_FontAspect
	:param sizeOfNames:
	:type sizeOfNames: int
	:param fontOfValues:
	:type fontOfValues: TCollection_AsciiString &
	:param styleOfValues:
	:type styleOfValues: Font_FontAspect
	:param sizeOfValues:
	:type sizeOfValues: int
	:rtype: None
") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const TCollection_ExtendedString & xname,const TCollection_ExtendedString & yname,const TCollection_ExtendedString & zname,const Standard_Boolean xdrawname,const Standard_Boolean ydrawname,const Standard_Boolean zdrawname,const Standard_Boolean xdrawvalues,const Standard_Boolean ydrawvalues,const Standard_Boolean zdrawvalues,const Standard_Boolean drawgrid,const Standard_Boolean drawaxes,const Standard_Integer nbx,const Standard_Integer nby,const Standard_Integer nbz,const Standard_Integer xoffset,const Standard_Integer yoffset,const Standard_Integer zoffset,const Standard_Integer xaxisoffset,const Standard_Integer yaxisoffset,const Standard_Integer zaxisoffset,const Standard_Boolean xdrawtickmarks,const Standard_Boolean ydrawtickmarks,const Standard_Boolean zdrawtickmarks,const Standard_Integer xtickmarklength,const Standard_Integer ytickmarklength,const Standard_Integer ztickmarklength,const Quantity_Color & gridcolor,const Quantity_Color & xnamecolor,const Quantity_Color & ynamecolor,const Quantity_Color & znamecolor,const Quantity_Color & xcolor,const Quantity_Color & ycolor,const Quantity_Color & zcolor,const TCollection_AsciiString & fontOfNames,const Font_FontAspect styleOfNames,const Standard_Integer sizeOfNames,const TCollection_AsciiString & fontOfValues,const Font_FontAspect styleOfValues,const Standard_Integer sizeOfValues);
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
		%feature("autodoc", "	* Returns Standard_True if one of the structures //!	 displayed in the view <self> contains Polygons, //!	 Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if one of the structures //!	 in the set <ASet> contains Polygons, Triangles //!	 or Quadrangles.

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
		%feature("autodoc", "	* Returns the set of structures displayed in //!	 the view <self>.

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
		%feature("autodoc", "	* Returns True if the window associated to the view //!	 <self> is defined.

	:rtype: bool
") IsDefined;
		Standard_Boolean IsDefined ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns Standard_True is the view <self> is deleted. //!	 <self> is deleted after the call Remove (me).

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of all //!	 structures displayed in the view <self>.

	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param ZMin:
	:type ZMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:param ZMax:
	:type ZMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of all //!	 structures in the set <ASet>.

	:param ASet:
	:type ASet: Graphic3d_MapOfStructure &
	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param ZMin:
	:type ZMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:param ZMax:
	:type ZMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (const Graphic3d_MapOfStructure & ASet,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the projection of the //!	 boundary box of all structures displayed in the view <self>.

	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the projection of the //!	 boundary box of all structures in the set <ASet>.

	:param ASet:
	:type ASet: Graphic3d_MapOfStructure &
	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (const Graphic3d_MapOfStructure & ASet,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NumberOfDisplayedStructures;
		%feature("autodoc", "	* Returns number of displayed structures in //!	 the view <self>.

	:rtype: int
") NumberOfDisplayedStructures;
		Standard_Integer NumberOfDisplayedStructures ();
		%feature("compactdefaultargs") Projects;
		%feature("autodoc", "	* Returns the coordinates of the projection of the //!	 3d coordinates <AX>, <AY>, <AZ>.

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
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Returns the transformation associated to the view <self>

	:rtype: TColStd_Array2OfReal
") Transform;
		const TColStd_Array2OfReal & Transform ();
		%feature("compactdefaultargs") ViewMapping;
		%feature("autodoc", "	* Returns the current mapping of the view <self>.

	:rtype: Visual3d_ViewMapping
") ViewMapping;
		Visual3d_ViewMapping ViewMapping ();
		%feature("compactdefaultargs") ViewMappingDefault;
		%feature("autodoc", "	* Returns the current reset mapping of the view <self>.

	:rtype: Visual3d_ViewMapping
") ViewMappingDefault;
		Visual3d_ViewMapping ViewMappingDefault ();
		%feature("compactdefaultargs") ViewOrientation;
		%feature("autodoc", "	* Returns the current orientation of the view <self>.

	:rtype: Visual3d_ViewOrientation
") ViewOrientation;
		Visual3d_ViewOrientation ViewOrientation ();
		%feature("compactdefaultargs") ViewOrientationDefault;
		%feature("autodoc", "	* Returns the current reset orientation of the view <self>.

	:rtype: Visual3d_ViewOrientation
") ViewOrientationDefault;
		Visual3d_ViewOrientation ViewOrientationDefault ();
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "	* Returns the window associated to the view <self>. Warning: Raises ViewDefinitionError if the associated //!	 window isn't defined.

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
		%feature("autodoc", "	* Computes the new presentation of the //!	 structure <AStructure> displayed in <self> //!	 with the type Graphic3d_TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the view <self>.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
		%feature("compactdefaultargs") MatrixOfMapping;
		%feature("autodoc", "	* Returns the current matrix of mapping of the view <self>. Warning: Stores the current matrix of mapping.

	:rtype: TColStd_Array2OfReal
") MatrixOfMapping;
		const TColStd_Array2OfReal & MatrixOfMapping ();
		%feature("compactdefaultargs") MatrixOfOrientation;
		%feature("autodoc", "	* Returns the current matrix of orientation of the view <self>. Warning: Stores the current matrix of orientation.

	:rtype: TColStd_Array2OfReal
") MatrixOfOrientation;
		const TColStd_Array2OfReal & MatrixOfOrientation ();
		%feature("compactdefaultargs") CView;
		%feature("autodoc", "	* Returns the c structure associated to <self>.

	:rtype: Standard_Address
") CView;
		Standard_Address CView ();
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "	* Returns the associated GraphicDriver.

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		const Handle_Graphic3d_GraphicDriver & GraphicDriver ();
		%feature("compactdefaultargs") Plot;
		%feature("autodoc", "	* Calls the method Plot for each Structure //!	 displayed in <self>.

	:param APlotter:
	:type APlotter: Handle_Graphic3d_Plotter &
	:rtype: None
") Plot;
		void Plot (const Handle_Graphic3d_Plotter & APlotter);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* if <AFlag> is Standard_True then the transparency //!	 is managed in the view <self>. //!	 Default Standard_False

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") ZBufferIsActivated;
		%feature("autodoc", "	* Returns Standard_True if the ZBuffer is activated //!	 in the view <self> and Standard_False if not.

	:rtype: bool
") ZBufferIsActivated;
		Standard_Boolean ZBufferIsActivated ();
		%feature("compactdefaultargs") SetZBufferActivity;
		%feature("autodoc", "	* Activates the ZBuffer if the integer <AnActivity> //!	 is equal to 1. //!	 Deactivates the ZBuffer if the integer <AnActivity> //!	 is equal to 0. //!	 If the integer <AnActivity> is equal to -1 then //!	 - the ZBuffer is activated if //!		me->Context ().Visualization () == Visual3d_TOV_SHADING //!	 - the ZBuffer is deactivated if //!		me->Context ().Visualization () == Visual3d_TOV_WIREFRAME

	:param AnActivity:
	:type AnActivity: int
	:rtype: None
") SetZBufferActivity;
		void SetZBufferActivity (const Standard_Integer AnActivity);
		%feature("compactdefaultargs") UnderLayer;
		%feature("autodoc", "	* Returns the underlay of the view <self>.

	:rtype: Handle_Visual3d_Layer
") UnderLayer;
		const Handle_Visual3d_Layer & UnderLayer ();
		%feature("compactdefaultargs") OverLayer;
		%feature("autodoc", "	* Returns the underlay of the view <self>.

	:rtype: Handle_Visual3d_Layer
") OverLayer;
		const Handle_Visual3d_Layer & OverLayer ();
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
};


%feature("shadow") Visual3d_View::~Visual3d_View %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_View {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_View {
	Handle_Visual3d_View GetHandle() {
	return *(Handle_Visual3d_View*) &$self;
	}
};

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
    Visual3d_View* GetObject() {
    return (Visual3d_View*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_View::~Handle_Visual3d_View %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_View {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_ViewManager;
class Visual3d_ViewManager : public Graphic3d_StructureManager {
	public:
		%feature("compactdefaultargs") Visual3d_ViewManager;
		%feature("autodoc", "	* Creates a 3D visualizer. Currently creating of more than 100 viewer instances is not supported and leads to InitializationError and initialisation failure. This limitation might be addressed in some future OCCT releases. Category: Methods to modify the class definition

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
		%feature("autodoc", "	* Erases all of the structures displayed in the //!	 visualiser <self>.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redraws all the displayed structures.

	:rtype: None
") Redraw;
		void Redraw ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Deletes and erases the 3D visualiser <self>.

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates screen in function of modifications of //!	 the structures. Category: Methods to modify the class definition Warning: Not necessary if the update mode is TOU_ASAP.

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") ActivatedView;
		%feature("autodoc", "	* Returns the group of views activated in the visualiser <self>.

	:rtype: Handle_Visual3d_HSetOfView
") ActivatedView;
		Handle_Visual3d_HSetOfView ActivatedView ();
		%feature("compactdefaultargs") ConvertCoord;
		%feature("autodoc", "	* Applies the view orientation transformation, the //!	 view mapping transformation and view clip, the //!	 display transformation to the vertex <AVertex>. //!	 Returns the pixel coordinates <AU>, <AV>. Warning: Returns <AU> = <AV> = IntegerLast () if the //!	 evaluation is impossible. //!	 -- Bad Window, Numeric error...

	:param AWindow:
	:type AWindow: Handle_Aspect_Window &
	:param AVertex:
	:type AVertex: Graphic3d_Vertex &
	:param AU:
	:type AU: int &
	:param AV:
	:type AV: int &
	:rtype: None
") ConvertCoord;
		void ConvertCoord (const Handle_Aspect_Window & AWindow,const Graphic3d_Vertex & AVertex,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ConvertCoord;
		%feature("autodoc", "	* Applies the inverse of the display transformation, the //!	 inverse of the view mapping transformation and view clip, //!	 the inverse of the view orientation transformation to //!	 the pixel coordinates <AU>, <AV>. //!	 Returns the world coordinates <AVertex>. Warning: Returns AVertex (X, Y, Z) with X = Y = Z = RealLast () //!	 if the evaluation is impossible. //!	 -- Bad Window, Numeric error...

	:param AWindow:
	:type AWindow: Handle_Aspect_Window &
	:param AU:
	:type AU: int
	:param AV:
	:type AV: int
	:rtype: Graphic3d_Vertex
") ConvertCoord;
		Graphic3d_Vertex ConvertCoord (const Handle_Aspect_Window & AWindow,const Standard_Integer AU,const Standard_Integer AV);
		%feature("compactdefaultargs") ConvertCoordWithProj;
		%feature("autodoc", "	* Applies the inverse of the display transformation, the //!	 inverse of the view mapping transformation and view clip, //!	 the inverse of the view orientation transformation to //!	 the pixel coordinates <AU>, <AV>. //!	 Returns the world coordinates <AVertex> and projection ray <AVector>. Warning: Returns AVertex (X, Y, Z) with X = Y = Z = RealLast () and AVector (VX, VY, VZ) with VX = VY = VZ = 0. //!	 if the evaluation is impossible. //!	 -- Bad Window, Numeric error...

	:param AWindow:
	:type AWindow: Handle_Aspect_Window &
	:param AU:
	:type AU: int
	:param AV:
	:type AV: int
	:param Point:
	:type Point: Graphic3d_Vertex &
	:param Proj:
	:type Proj: Graphic3d_Vector &
	:rtype: None
") ConvertCoordWithProj;
		void ConvertCoordWithProj (const Handle_Aspect_Window & AWindow,const Standard_Integer AU,const Standard_Integer AV,Graphic3d_Vertex & Point,Graphic3d_Vector & Proj);
		%feature("compactdefaultargs") DefinedView;
		%feature("autodoc", "	* Returns the group of views defined in the visualiser <self>.

	:rtype: Handle_Visual3d_HSetOfView
") DefinedView;
		Handle_Visual3d_HSetOfView DefinedView ();
		%feature("compactdefaultargs") MaxNumOfViews;
		%feature("autodoc", "	* Returns the theoretical maximum number of //!	 definable views in the view manager <self>. Warning: It's not possible to accept an infinite //!	 number of definable views because each //!	 view must have an identification and we //!	 have different view managers.

	:rtype: int
") MaxNumOfViews;
		Standard_Integer MaxNumOfViews ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns : //!	 a new identification number for a new view //!	 in the visualiser.

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
	:type theLayerId: int
	:rtype: None
") ChangeZLayer;
		void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID assigned for the structure.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer for all managed views.

	:param theLayerId:
	:type theLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: None
") SetZLayerSettings;
		void SetZLayerSettings (const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings theSettings);
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: int
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		Graphic3d_ZLayerSettings ZLayerSettings (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level Z layer and get its ID as <theLayerId> value. The method returns Standard_False if the layer can not be created. The layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

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
		%feature("autodoc", "	* Returns Standard_True if the view associated to the //!	 window <AWindow> exists and is activated. //!	 <TheViewId> contains the internal identification of //!	 the associated view.

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
		const Handle_Visual3d_Layer & UnderLayer ();
		%feature("compactdefaultargs") OverLayer;
		%feature("autodoc", "	* Returns the underlay of the viewer <self>.

	:rtype: Handle_Visual3d_Layer
") OverLayer;
		const Handle_Visual3d_Layer & OverLayer ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> //!	 if <AStructure> is displayed and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> //!	 if <AStructure> is displayed in <AProjector> and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AProjector:
	:type AProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure,const Handle_Graphic3d_DataStructureManager & AProjector);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns Standard_True if the transparency //!	 is activated in all activated views. //!	 Default Standard_False

	:rtype: bool
") Transparency;
		Standard_Boolean Transparency ();
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* if <AFlag> is Standard_True then the transparency //!	 is managed. //!	 Default Standard_False

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") ZBufferAuto;
		%feature("autodoc", "	* Returns Standard_True if the zbuffer activity //!	 is managed automatically. //!	 Default Standard_False

	:rtype: bool
") ZBufferAuto;
		Standard_Boolean ZBufferAuto ();
		%feature("compactdefaultargs") SetZBufferAuto;
		%feature("autodoc", "	* if <AFlag> is Standard_True then the zbuffer activity //!	 is managed automatically. //!	 Default Standard_False

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetZBufferAuto;
		void SetZBufferAuto (const Standard_Boolean AFlag);
};


%feature("shadow") Visual3d_ViewManager::~Visual3d_ViewManager %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ViewManager {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Visual3d_ViewManager {
	Handle_Visual3d_ViewManager GetHandle() {
	return *(Handle_Visual3d_ViewManager*) &$self;
	}
};

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
    Visual3d_ViewManager* GetObject() {
    return (Visual3d_ViewManager*)$self->Access();
    }
};
%feature("shadow") Handle_Visual3d_ViewManager::~Handle_Visual3d_ViewManager %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Visual3d_ViewManager {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Visual3d_ViewMapping;
class Visual3d_ViewMapping {
	public:
		%feature("compactdefaultargs") Visual3d_ViewMapping;
		%feature("autodoc", "	* Creates a projection. //!	TypeOfProjection		= TOP_PARALLEL //!	PRP : Projection Reference Point= (0.5, 0.5, 2.0) //!	BPD : Distance from Back Plane	= 0.0 //!	FPD : Distance from Front Plane	= 1.0 //!	VPD : Distance from View Plane	= 1.0 //!	WUmin	= 0.0 //!	WUmax	= 1.0 //!	WVmin	= 0.0 //!	WVmax	= 1.0

	:rtype: None
") Visual3d_ViewMapping;
		 Visual3d_ViewMapping ();
		%feature("compactdefaultargs") Visual3d_ViewMapping;
		%feature("autodoc", "	* Creates a projection. //!	TypeOfProjection : TOP_PERSPECTIVE //!			 TOP_PARALLEL //!	PRP : Projection Reference Point with respect to //!	 coordinate system VRC, defined by the //!	 class ViewOrientation. //!	BPD : Distance from Back Plane. //!	FPD : Distance from Front Plane. //!	VPD : Distance from View Plane. //!	These three values are with respect to VRP, according to //!	the N axis of the VRC coordinate system, defined by the class //!	ViewOrientation. //!	WUmin,WUmax,WVmin,WVmax : Visible part of the plane of //!	projection defined with respect to the UV axes of coordinate //!	system VRC. //!	 That's what allows modification of the zoom/panning. //!	The mapping of the visible part of the plane of projection //!	on the screen is done in the window. //!	 That's why multiple views on the same window is not allowed. Warning: Raises ViewMappingDefinitionError //!	 if the specified window is invalid. //!	 if <PRP> is between the front and back planes. //!	 if <PRP> is positioned on the view plane. //!	 if the back plane is in front of the front plane.

	:param AType:
	:type AType: Visual3d_TypeOfProjection
	:param PRP:
	:type PRP: Graphic3d_Vertex &
	:param BPD:
	:type BPD: float
	:param FPD:
	:type FPD: float
	:param VPD:
	:type VPD: float
	:param WUmin:
	:type WUmin: float
	:param WVmin:
	:type WVmin: float
	:param WUmax:
	:type WUmax: float
	:param WVmax:
	:type WVmax: float
	:rtype: None
") Visual3d_ViewMapping;
		 Visual3d_ViewMapping (const Visual3d_TypeOfProjection AType,const Graphic3d_Vertex & PRP,const Standard_Real BPD,const Standard_Real FPD,const Standard_Real VPD,const Standard_Real WUmin,const Standard_Real WVmin,const Standard_Real WUmax,const Standard_Real WVmax);
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "	* Modifies the back clipping plane. Category: Methods to modify the class definition Warning: Raises ViewMappingDefinitionError //!	 if <PRP> is between the front and back planes. //!	 if <PRP> is positioned on the view plane. //!	 if the back plane is in front of the front plane.

	:param BPD:
	:type BPD: float
	:rtype: None
") SetBackPlaneDistance;
		void SetBackPlaneDistance (const Standard_Real BPD);
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "	* Modifies the front clipping plane. Category: Methods to modify the class definition Warning: Raises ViewMappingDefinitionError //!	 if <PRP> is between the front and back planes. //!	 if <PRP> is positioned on the view plane. //!	 if the back plane is in front of the front plane.

	:param FPD:
	:type FPD: float
	:rtype: None
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance (const Standard_Real FPD);
		%feature("compactdefaultargs") SetProjection;
		%feature("autodoc", "	* Modifies the type of projection. //!	 TypeOfProjection : TOP_PERSPECTIVE //!			 TOP_PARALLEL

	:param AType:
	:type AType: Visual3d_TypeOfProjection
	:rtype: None
") SetProjection;
		void SetProjection (const Visual3d_TypeOfProjection AType);
		%feature("compactdefaultargs") SetProjectionReferencePoint;
		%feature("autodoc", "	* Modifies the PRP. Category: Methods to modify the class definition Warning: Raises ViewMappingDefinitionError //!	 if <PRP> is between the front and back planes. //!	 if <PRP> is positioned on the view plane.

	:param PRP:
	:type PRP: Graphic3d_Vertex &
	:rtype: None
") SetProjectionReferencePoint;
		void SetProjectionReferencePoint (const Graphic3d_Vertex & PRP);
		%feature("compactdefaultargs") SetViewPlaneDistance;
		%feature("autodoc", "	* Modifies the distance of the view plane of projection. Category: Methods to modify the class definition Warning: Raises ViewMappingDefinitionError //!	 if <PRP> is positioned on the view plane.

	:param VPD:
	:type VPD: float
	:rtype: None
") SetViewPlaneDistance;
		void SetViewPlaneDistance (const Standard_Real VPD);
		%feature("compactdefaultargs") SetWindowLimit;
		%feature("autodoc", "	* Modifies the visible part of the projection plane. Category: Methods to modify the class definition Warning: Raises ViewMappingDefinitionError if the //!	 specified window is invalid.

	:param Umin:
	:type Umin: float
	:param Vmin:
	:type Vmin: float
	:param Umax:
	:type Umax: float
	:param Vmax:
	:type Vmax: float
	:rtype: None
") SetWindowLimit;
		void SetWindowLimit (const Standard_Real Umin,const Standard_Real Vmin,const Standard_Real Umax,const Standard_Real Vmax);
		%feature("compactdefaultargs") SetCustomProjectionMatrix;
		%feature("autodoc", "	* Sets custom PROJECTION matrix for the OpenGl context

	:param Mat:
	:type Mat: Handle_TColStd_HArray2OfReal &
	:rtype: None
") SetCustomProjectionMatrix;
		void SetCustomProjectionMatrix (const Handle_TColStd_HArray2OfReal & Mat);
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "	* Returns the distance from the back clipping plane of this view mapping.

	:rtype: float
") BackPlaneDistance;
		Standard_Real BackPlaneDistance ();
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "	* Returns the distance from the front clipping plane of this view mapping.

	:rtype: float
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance ();
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "	* Returns the type of projection.

	:rtype: Visual3d_TypeOfProjection
") Projection;
		Visual3d_TypeOfProjection Projection ();
		%feature("compactdefaultargs") ProjectionReferencePoint;
		%feature("autodoc", "	* Returns the PRP.

	:rtype: Graphic3d_Vertex
") ProjectionReferencePoint;
		Graphic3d_Vertex ProjectionReferencePoint ();
		%feature("compactdefaultargs") ViewPlaneDistance;
		%feature("autodoc", "	* Returns the distance from the projection plane.

	:rtype: float
") ViewPlaneDistance;
		Standard_Real ViewPlaneDistance ();
		%feature("compactdefaultargs") WindowLimit;
		%feature("autodoc", "	* Returns the visible part of the projection plane.

	:param Umin:
	:type Umin: float &
	:param Vmin:
	:type Vmin: float &
	:param Umax:
	:type Umax: float &
	:param Vmax:
	:type Vmax: float &
	:rtype: None
") WindowLimit;
		void WindowLimit (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsCustomMatrix;
		%feature("autodoc", "	* Returns whether the custom PROJECTION matrix is used.

	:rtype: bool
") IsCustomMatrix;
		Standard_Boolean IsCustomMatrix ();
};


%feature("shadow") Visual3d_ViewMapping::~Visual3d_ViewMapping %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ViewMapping {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Visual3d_ViewOrientation;
class Visual3d_ViewOrientation {
	public:
		%feature("compactdefaultargs") Visual3d_ViewOrientation;
		%feature("autodoc", "	* Creates a VRC coordinate system. //!	 VRP		: Origin of the VRC coordinate system. //!			 (default value : 0.0, 0.0, 0.0) //!	 VPN		: Vector normal to the plane of visualisation. //!			 (default value : 0.0, 0.0, 1.0) //!	 VUP 	: Vector for which the projection in the plane //!			 of visualisation defines the axis V of a VRC //!			 coordinate system. //!			 (default value : 0.0, 1.0, 0.0)

	:rtype: None
") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation ();
		%feature("compactdefaultargs") Visual3d_ViewOrientation;
		%feature("autodoc", "	* Creates a VRC coordinate system. //!	 VRP		: Origin of the VRC coordinate system. //!	 VPN		: Vector normal to the plane of visualisation. //!	 VUP 	: Vector for which the projection in the plane //!			 of visualisation defines the axis V of a VRC //!			 coordinate system. //!			 This vector can be likened to the //!			 vertical of the observer. Warning: Raises ViewOrientationDefinitionError //!	 if <VPN> is null. //!	 if <VUP> is null. //!	 if <VPN> and <VUP> are parallel.

	:param VRP:
	:type VRP: Graphic3d_Vertex &
	:param VPN:
	:type VPN: Graphic3d_Vector &
	:param VUP:
	:type VUP: Graphic3d_Vector &
	:rtype: None
") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation (const Graphic3d_Vertex & VRP,const Graphic3d_Vector & VPN,const Graphic3d_Vector & VUP);
		%feature("compactdefaultargs") Visual3d_ViewOrientation;
		%feature("autodoc", "	* Creates a VRC coordinate system. //!	 VRP		: Origin of VRC coordinate system. //!	 VPN		: Normal vector to the plane of visualisation. //!	 Twist 	: Angle in radians of the V axis in the VRC //!			 coordinate system with the projection in //!			 the plane of visualisation of the Zm axis //!			 in the model space. Warning: Raises ViewOrientationDefinitionError if <VPN> is null.

	:param VRP:
	:type VRP: Graphic3d_Vertex &
	:param VPN:
	:type VPN: Graphic3d_Vector &
	:param Twist:
	:type Twist: float
	:rtype: None
") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation (const Graphic3d_Vertex & VRP,const Graphic3d_Vector & VPN,const Standard_Real Twist);
		%feature("compactdefaultargs") Visual3d_ViewOrientation;
		%feature("autodoc", "	* Creates a VRC coordinate system. //!	 VRP		: Origin of the VRC coordinate system. //!	 Azim 	: Angle in radians of the plane of visualisation //!			 with the XmYm plane of the model space. //!	 Inc 	: Angle in radians of the plane of visualisation //!			 with the YmZm plane of the model space. //!	 Twist 	: Angle in radians of the V axis in the VRC //!			 coordinate system with the projection in //!			 the plane of visualisation of the Zm axis //!			 in the model space. Warning: Raises ViewOrientationDefinitionError

	:param VRP:
	:type VRP: Graphic3d_Vertex &
	:param Azim:
	:type Azim: float
	:param Inc:
	:type Inc: float
	:param Twist:
	:type Twist: float
	:rtype: None
") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation (const Graphic3d_Vertex & VRP,const Standard_Real Azim,const Standard_Real Inc,const Standard_Real Twist);
		%feature("compactdefaultargs") SetViewReferencePlane;
		%feature("autodoc", "	* Modifies the plane of visualisation //!	 defined by a normal vector. Category: Methods to modify the class definition Warning: Raises ViewOrientationDefinitionError if <VPN> is null.

	:param VPN:
	:type VPN: Graphic3d_Vector &
	:rtype: None
") SetViewReferencePlane;
		void SetViewReferencePlane (const Graphic3d_Vector & VPN);
		%feature("compactdefaultargs") SetViewReferencePoint;
		%feature("autodoc", "	* Modifies the origin of the VRC coordinate system

	:param VRP:
	:type VRP: Graphic3d_Vertex &
	:rtype: None
") SetViewReferencePoint;
		void SetViewReferencePoint (const Graphic3d_Vertex & VRP);
		%feature("compactdefaultargs") SetViewReferenceUp;
		%feature("autodoc", "	* Modifies the vertical of the observer. Category: Methods to modify the class definition Warning: Raises ViewOrientationDefinitionError if <VUP> is null.

	:param VUP:
	:type VUP: Graphic3d_Vector &
	:rtype: None
") SetViewReferenceUp;
		void SetViewReferenceUp (const Graphic3d_Vector & VUP);
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "	* Sets axial scale factors of the view

	:param Sx:
	:type Sx: float
	:param Sy:
	:type Sy: float
	:param Sz:
	:type Sz: float
	:rtype: None
") SetAxialScale;
		void SetAxialScale (const Standard_Real Sx,const Standard_Real Sy,const Standard_Real Sz);
		%feature("compactdefaultargs") SetCustomModelViewMatrix;
		%feature("autodoc", "	* Sets custom MODELVIEW matrix for the OpenGl context

	:param Mat:
	:type Mat: Handle_TColStd_HArray2OfReal &
	:rtype: None
") SetCustomModelViewMatrix;
		void SetCustomModelViewMatrix (const Handle_TColStd_HArray2OfReal & Mat);
		%feature("compactdefaultargs") Twist;
		%feature("autodoc", "	* Returns the angle in radians of the V axis in the VRC //!	 coordinate system with the projection in the plane of //!	 visualisation of the Zm axis in the model space.

	:rtype: float
") Twist;
		Standard_Real Twist ();
		%feature("compactdefaultargs") ViewReferencePlane;
		%feature("autodoc", "	* Returns the normal to the plane of projection.

	:rtype: Graphic3d_Vector
") ViewReferencePlane;
		Graphic3d_Vector ViewReferencePlane ();
		%feature("compactdefaultargs") ViewReferencePoint;
		%feature("autodoc", "	* Returns origin of the VRC coordinate system.

	:rtype: Graphic3d_Vertex
") ViewReferencePoint;
		Graphic3d_Vertex ViewReferencePoint ();
		%feature("compactdefaultargs") ViewReferenceUp;
		%feature("autodoc", "	* Returns the vertical of the observer.

	:rtype: Graphic3d_Vector
") ViewReferenceUp;
		Graphic3d_Vector ViewReferenceUp ();
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "	* Returns current values of the axial scale factors.

	:param Sx:
	:type Sx: float &
	:param Sy:
	:type Sy: float &
	:param Sz:
	:type Sz: float &
	:rtype: None
") AxialScale;
		void AxialScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsCustomMatrix;
		%feature("autodoc", "	* Returns whether the custom MODELVIEW matrix is used.

	:rtype: bool
") IsCustomMatrix;
		Standard_Boolean IsCustomMatrix ();
};


%feature("shadow") Visual3d_ViewOrientation::~Visual3d_ViewOrientation %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ViewOrientation {
	void _kill_pointed() {
		delete $self;
	}
};
