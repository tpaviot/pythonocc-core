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
%module (package="OCC") Visual3d

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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a context from default values  
 
//!	    Aperture	: 4.0  
//!	    Depth	: 10  
//!	    Order	: TOO_TOPFIRST") Visual3d_ContextPick;
		 Visual3d_ContextPick ();
		%feature("autodoc", "Args:
	Aperture(Standard_Real)
	Depth(Standard_Integer)
	Order(Visual3d_TypeOfOrder)

Returns:
	None

Creates a context with the values defined  
 Warning: Raises ContextPickDefinitionError if <Depth> or  
//!	    <Aperture> is a negative value.") Visual3d_ContextPick;
		 Visual3d_ContextPick (const Standard_Real Aperture,const Standard_Integer Depth,const Visual3d_TypeOfOrder Order);
		%feature("autodoc", "Args:
	Aperture(Standard_Real)

Returns:
	None

Modifies the size of the pick window.  
 Category: Methods to modifies the class definition  
 Warning: Raises ContextPickDefinitionError if <Aperture> is  
//!	    a negative value.") SetAperture;
		void SetAperture (const Standard_Real Aperture);
		%feature("autodoc", "Args:
	Depth(Standard_Integer)

Returns:
	None

Modifies the pick depth a priori.  
 Category: Methods to modifies the class definition  
 Warning: Raises ContextPickDefinitionError if <Depth> is  
//!	    a negative value.") SetDepth;
		void SetDepth (const Standard_Integer Depth);
		%feature("autodoc", "Args:
	Order(Visual3d_TypeOfOrder)

Returns:
	None

Modifies the order of picking.  
 
//!	    TypeOfOrder : TOO_TOPFIRST  
//!			  TOO_BOTTOMFIRST") SetOrder;
		void SetOrder (const Visual3d_TypeOfOrder Order);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the size of the pick window <self>.") Aperture;
		Standard_Real Aperture ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the effective pick depth of <self>.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_TypeOfOrder

Returns the order of picking of <self>.  
 
//!	    TypeOfOrder	: TOO_TOPFIRST  
//!			  TOO_BOTTOMFIRST") Order;
		Visual3d_TypeOfOrder Order ();
};


%feature("shadow") Visual3d_ContextPick::~Visual3d_ContextPick %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a context from default values  
 
//!	    Aliasing		  : OFF  
//!	    BackZClipping	  : OFF  
//!	    FrontZClipping	  : OFF  
//!	    Depth-cueing	  : OFF  
//!	    Light source	  : 0  
//!	    Clipping plane	  : 0  
//!	    Type Of Visualization : TOV_WIREFRAME  
//!	    Type Of Model	  : TOM_NONE  
         Type Of SurfaceDetail : TOSD_NONE") Visual3d_ContextView;
		 Visual3d_ContextView ();
		%feature("autodoc", "Args:
	TOSD(Visual3d_TypeOfSurfaceDetail)

Returns:
	None

Selects the kind of rendering  
         default to: TOSD_NONE") SetSurfaceDetail;
		void SetSurfaceDetail (const Visual3d_TypeOfSurfaceDetail TOSD);
		%feature("autodoc", "Args:
	ATexture(Handle_Graphic3d_TextureEnv)

Returns:
	None

Sets the environment texture to use  
         no environment texture by default") SetTextureEnv;
		void SetTextureEnv (const Handle_Graphic3d_TextureEnv & ATexture);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates antialiasing.  
//!	Antialiasing can be activated on all the structures  
//!	in the view") SetAliasingOn;
		void SetAliasingOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates the antialiasing.") SetAliasingOff;
		void SetAliasingOff ();
		%feature("autodoc", "Args:
	ABack(Standard_Real)

Returns:
	None

Modifies the back depth-cueing plane.  
 Category: Methods to modify the class definition  
 Warning: Raises DepthCueingDefinitionError if <BackPlane>  
//!	    is front of <FrontPlane> and DepthCueing is ON.") SetDepthCueingBackPlane;
		void SetDepthCueingBackPlane (const Standard_Real ABack);
		%feature("autodoc", "Args:
	ABack(Standard_Real)

Returns:
	None

Modifies the front depth-cueing plane.  
 Category: Methods to modify the class definition  
 Warning: Raises DepthCueingDefinitionError if <BackPlane> is  
//!	    front of <FrontPlane> and DepthCueing is ON.") SetDepthCueingFrontPlane;
		void SetDepthCueingFrontPlane (const Standard_Real ABack);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates the depth-cueing.  
//!	Depth-cueing can be activated on all structures  
//!	present in the view.  
 Category: Methods to modify the class definition  
 Warning: Raises DepthCueingDefinitionError if <BackPlane> is  
//!	    front of <FrontPlane>.") SetDepthCueingOn;
		void SetDepthCueingOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates the depth-cueing.") SetDepthCueingOff;
		void SetDepthCueingOff ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfHClipPlane

Returns sequence of clip planes.  
@return sequence of clip planes.") ClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & ClipPlanes ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfHClipPlane

Change clip planes.  
@return sequence of clip planes.") ChangeClipPlanes;
		Graphic3d_SequenceOfHClipPlane & ChangeClipPlanes ();
		%feature("autodoc", "Args:
	ALight(Handle_Visual3d_Light)

Returns:
	None

Activates the light source <ALight>") SetLightOn;
		void SetLightOn (const Handle_Visual3d_Light & ALight);
		%feature("autodoc", "Args:
	ALight(Handle_Visual3d_Light)

Returns:
	None

Deactivates the light source <ALight>") SetLightOff;
		void SetLightOff (const Handle_Visual3d_Light & ALight);
		%feature("autodoc", "Args:
	AModel(Visual3d_TypeOfModel)

Returns:
	None

Modifies the shading model when the type of  
//!	    visualization is TOV_SHADING  
 
//!	    TypeOfModel	: TOM_NONE  
//!			  TOM_INTERP_COLOR  
//!			  TOM_FACET  
//!			  TOM_VERTEX") SetModel;
		void SetModel (const Visual3d_TypeOfModel AModel);
		%feature("autodoc", "Args:
	AVisual(Visual3d_TypeOfVisualization)

Returns:
	None

Modifies the mode of visualization.  
 
//!	    TypeOfVisualization	: TOV_WIREFRAME  
//!				  TOV_SHADING") SetVisualization;
		void SetVisualization (const Visual3d_TypeOfVisualization AVisual);
		%feature("autodoc", "Args:
	ABack(Standard_Real)

Returns:
	None

Modifies the back Z-clipping plane.  
 Category: Methods to modify the class definition  
 Warning: Raises ZClippingDefinitionError if <BackPlane> is  
//!	    front of <FrontPlane> and ZClipping is ON.") SetZClippingBackPlane;
		void SetZClippingBackPlane (const Standard_Real ABack);
		%feature("autodoc", "Args:
	AFront(Standard_Real)

Returns:
	None

Modifies the front Z-clipping plane.  
 Category: Methods to modify the class definition  
 Warning: Raises ZClippingDefinitionError if <BackPlane> is  
//!	    front of <FrontPlane> and ZClipping is ON.") SetZClippingFrontPlane;
		void SetZClippingFrontPlane (const Standard_Real AFront);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates the Z-clipping planes defined by  
//!	    SetZClippingFrontPlane and SetZClippingBackPlane.  
 Category: Methods to modify the class definition  
 Warning: Raises ZClippingDefinitionError if <BackPlane> is  
//!	    front of <FrontPlane>.") SetZClippingOn;
		void SetZClippingOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates the Z-clipping planes defined by  
//!	    SetFrontPlane and SetBackPlane.") SetZClippingOff;
		void SetZClippingOff ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates the front Z-clipping plane defined by  
//!	    SetFrontPlane method.") SetFrontZClippingOn;
		void SetFrontZClippingOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates the front Z-clipping plane defined by  
//!	    SetFrontPlane method.") SetFrontZClippingOff;
		void SetFrontZClippingOff ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates the back Z-clipping plane defined by  
//!	    SetBackPlane method.  
 Category: Methods to modify the class definition  
 Warning: Raises ZClippingDefinitionError if <BackPlane> is  
//!	    front of <FrontPlane>.") SetBackZClippingOn;
		void SetBackZClippingOn ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates the back Z-clipping plane defined by  
//!	    SetBackPlane method.") SetBackZClippingOff;
		void SetBackZClippingOff ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_HSetOfLight

Returns the group of active light sources  
//!	    in the view of context <self>.") ActivatedLights;
		Handle_Visual3d_HSetOfLight ActivatedLights ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of active light sources  
//!	    in the view of context <self>.") NumberOfActivatedLights;
		Standard_Integer NumberOfActivatedLights ();
		%feature("autodoc", "Args:
	AnIndex(Standard_Integer)

Returns:
	Handle_Visual3d_Light

No detailed docstring for this function.") ActivatedLight;
		Handle_Visual3d_Light ActivatedLight (const Standard_Integer AnIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the activity of the aliasing.") AliasingIsOn;
		Standard_Boolean AliasingIsOn ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the activity of the ZClipping.") BackZClippingIsOn;
		Standard_Boolean BackZClippingIsOn ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the definition of the back depth-cueing plane.") DepthCueingBackPlane;
		Standard_Real DepthCueingBackPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the definition of the front depth-cueing plane.") DepthCueingFrontPlane;
		Standard_Real DepthCueingFrontPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the activity of the depth-cueing.") DepthCueingIsOn;
		Standard_Boolean DepthCueingIsOn ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the activity of the ZClipping.") FrontZClippingIsOn;
		Standard_Boolean FrontZClippingIsOn ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_TypeOfModel

Returns the shading model.") Model;
		Visual3d_TypeOfModel Model ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_TypeOfVisualization

Returns the mode of visualization.") Visualization;
		Visual3d_TypeOfVisualization Visualization ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the definition of the back Z-clipping plane.") ZClippingBackPlane;
		Standard_Real ZClippingBackPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the definition of the front Z-clipping plane.") ZClippingFrontPlane;
		Standard_Real ZClippingFrontPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_TypeOfSurfaceDetail

No detailed docstring for this function.") SurfaceDetail;
		Visual3d_TypeOfSurfaceDetail SurfaceDetail ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_TextureEnv

No detailed docstring for this function.") TextureEnv;
		Handle_Graphic3d_TextureEnv TextureEnv ();
};


%feature("shadow") Visual3d_ContextView::~Visual3d_ContextView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_HSequenceOfPickPath;
		 Visual3d_HSequenceOfPickPath ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Visual3d_PickPath & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Visual3d_HSequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Visual3d_HSequenceOfPickPath & aSequence);
		%feature("autodoc", "Args:
	anItem(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Visual3d_PickPath & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Visual3d_HSequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Visual3d_HSequenceOfPickPath & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Visual3d_PickPath & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Visual3d_HSequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfPickPath & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Visual3d_PickPath & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Visual3d_HSequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Visual3d_HSequenceOfPickPath & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Visual3d_HSequenceOfPickPath

No detailed docstring for this function.") Split;
		Handle_Visual3d_HSequenceOfPickPath Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Visual3d_PickPath & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Visual3d_PickPath

No detailed docstring for this function.") Value;
		const Visual3d_PickPath & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Visual3d_PickPath

No detailed docstring for this function.") ChangeValue;
		Visual3d_PickPath & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_SequenceOfPickPath

No detailed docstring for this function.") Sequence;
		const Visual3d_SequenceOfPickPath & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_SequenceOfPickPath

No detailed docstring for this function.") ChangeSequence;
		Visual3d_SequenceOfPickPath & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_HSequenceOfPickPath

No detailed docstring for this function.") ShallowCopy;
		Handle_Visual3d_HSequenceOfPickPath ShallowCopy ();
};


%feature("shadow") Visual3d_HSequenceOfPickPath::~Visual3d_HSequenceOfPickPath %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_HSetOfLight;
		 Visual3d_HSetOfLight ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Visual3d_Light)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Visual3d_Light & T);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_Light)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_Light & T);
		%feature("autodoc", "Args:
	B(Handle_Visual3d_HSetOfLight)

Returns:
	Handle_Visual3d_HSetOfLight

No detailed docstring for this function.") Union;
		Handle_Visual3d_HSetOfLight Union (const Handle_Visual3d_HSetOfLight & B);
		%feature("autodoc", "Args:
	B(Handle_Visual3d_HSetOfLight)

Returns:
	Handle_Visual3d_HSetOfLight

No detailed docstring for this function.") Intersection;
		Handle_Visual3d_HSetOfLight Intersection (const Handle_Visual3d_HSetOfLight & B);
		%feature("autodoc", "Args:
	B(Handle_Visual3d_HSetOfLight)

Returns:
	Handle_Visual3d_HSetOfLight

No detailed docstring for this function.") Difference;
		Handle_Visual3d_HSetOfLight Difference (const Handle_Visual3d_HSetOfLight & B);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_Light)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_Light & T);
		%feature("autodoc", "Args:
	S(Handle_Visual3d_HSetOfLight)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Handle_Visual3d_HSetOfLight & S);
		%feature("autodoc", "Args:
	S(Handle_Visual3d_HSetOfLight)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_Visual3d_HSetOfLight & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_HSetOfLight

No detailed docstring for this function.") ShallowCopy;
		Handle_Visual3d_HSetOfLight ShallowCopy ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_SetOfLight

No detailed docstring for this function.") Set;
		const Visual3d_SetOfLight & Set ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_SetOfLight

No detailed docstring for this function.") ChangeSet;
		Visual3d_SetOfLight & ChangeSet ();
};


%feature("shadow") Visual3d_HSetOfLight::~Visual3d_HSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_HSetOfView;
		 Visual3d_HSetOfView ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Visual3d_View)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Visual3d_View & T);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_View)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_View & T);
		%feature("autodoc", "Args:
	B(Handle_Visual3d_HSetOfView)

Returns:
	Handle_Visual3d_HSetOfView

No detailed docstring for this function.") Union;
		Handle_Visual3d_HSetOfView Union (const Handle_Visual3d_HSetOfView & B);
		%feature("autodoc", "Args:
	B(Handle_Visual3d_HSetOfView)

Returns:
	Handle_Visual3d_HSetOfView

No detailed docstring for this function.") Intersection;
		Handle_Visual3d_HSetOfView Intersection (const Handle_Visual3d_HSetOfView & B);
		%feature("autodoc", "Args:
	B(Handle_Visual3d_HSetOfView)

Returns:
	Handle_Visual3d_HSetOfView

No detailed docstring for this function.") Difference;
		Handle_Visual3d_HSetOfView Difference (const Handle_Visual3d_HSetOfView & B);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_View)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_View & T);
		%feature("autodoc", "Args:
	S(Handle_Visual3d_HSetOfView)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Handle_Visual3d_HSetOfView & S);
		%feature("autodoc", "Args:
	S(Handle_Visual3d_HSetOfView)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_Visual3d_HSetOfView & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_HSetOfView

No detailed docstring for this function.") ShallowCopy;
		Handle_Visual3d_HSetOfView ShallowCopy ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_SetOfView

No detailed docstring for this function.") Set;
		const Visual3d_SetOfView & Set ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_SetOfView

No detailed docstring for this function.") ChangeSet;
		Visual3d_SetOfView & ChangeSet ();
};


%feature("shadow") Visual3d_HSetOfView::~Visual3d_HSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	AViewer(Handle_Visual3d_ViewManager)
	AType(Aspect_TypeOfLayer)=Aspect_TOL_OVERLAY
	AFlag(Standard_Boolean)=Standard_False

Returns:
	None

Creates a layer with the type <Atype>.  
     if <AFlag> == Standard_True then the layer is  
     'size dependent'.  
     The mapping of the layer is dependent of each  
     window's size.  
     if <AFlag> == Standard_False then the mapping of the  
     layer is dependent of the highest window and the largest  
     window of all the views of the viewer <AViewer>.  
     When the viewer <AViewer> have only one view, the  
     result will be the same with <AFlag> == Standard_False  
     or <AFlag> == Standard_True.") Visual3d_Layer;
		 Visual3d_Layer (const Handle_Visual3d_ViewManager & AViewer,const Aspect_TypeOfLayer AType = Aspect_TOL_OVERLAY,const Standard_Boolean AFlag = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppress the layer <self>.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Begins the definition of the layer <self>  
 Warning: No default attributes") Begin;
		void Begin ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Finishs the definition of the layer <self>.") End;
		void End ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear all graphics managed by the layer <self>.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

After this call, <self> is ready to receive  
     a definition of a polyline with AddVertex().") BeginPolyline;
		void BeginPolyline ();
		%feature("autodoc", "Args:
	None
Returns:
	None

After this call, <self> is ready to receive  
     a definition of a polygon with AddEdge().") BeginPolygon;
		void BeginPolygon ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	AFlag(Standard_Boolean)=Standard_True

Returns:
	None

Puts <X, Y> as a new point in the current primitive.  
     If <AFlag> then it is a draw between last point and  
     this point else it is a move between last point and  
     this point.") AddVertex;
		void AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Boolean AFlag = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

After this call, <self> stops the reception of  
     a definition of a Begin... primitive.") ClosePrimitive;
		void ClosePrimitive ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Width(Standard_Real)
	Height(Standard_Real)

Returns:
	None

Draws the rectangle at position <X,Y>.") DrawRectangle;
		void DrawRectangle (const Standard_Real X,const Standard_Real Y,const Standard_Real Width,const Standard_Real Height);
		%feature("autodoc", "Args:
	AText(char *)
	AHeight(Standard_Real)
	AWidth(Standard_Real)
	AnAscent(Standard_Real)
	ADescent(Standard_Real)

Returns:
	None

Get the size of text.  
     The attributes are given with respect to the plane of  
     projection.  
     <AHeight>   : Height of text.  
           (Relative to the Normalized Projection  
         Coordinates (NPC) Space).") TextSize;
		void TextSize (const char * AText,const Standard_Real AHeight,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	AColor(Quantity_Color)

Returns:
	None

Modifies the current color.  
 Warning: No default color") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	ATransparency(Standard_ShortReal)

Returns:
	None

Modifies the current transparency.  
 Warning: No default transparency") SetTransparency;
		void SetTransparency (const Standard_ShortReal ATransparency);
		%feature("autodoc", "Args:
	None
Returns:
	None

Unsets the transparency.") UnsetTransparency;
		void UnsetTransparency ();
		%feature("autodoc", "Args:
	AType(Aspect_TypeOfLine)
	AWidth(Standard_Real)

Returns:
	None

Modifies the current lines attributes.  
 Warning: No default attributes") SetLineAttributes;
		void SetLineAttributes (const Aspect_TypeOfLine AType,const Standard_Real AWidth);
		%feature("autodoc", "Args:
	AFont(char *)
	AType(Aspect_TypeOfDisplayText)
	AColor(Quantity_Color)

Returns:
	None

Modifies the current texts attributes.  
<AFont> defines the name of the font to be used.  
<AType> defines the display type of the text.  
<AColor> defines the color of decal or subtitle background.  
To set the color of the text you can use the SetColor method.  
Warning: No default attributes") SetTextAttributes;
		void SetTextAttributes (const char * AFont,const Aspect_TypeOfDisplayText AType,const Quantity_Color & AColor);
		%feature("autodoc", "Args:
	Left(Standard_Real)
	Right(Standard_Real)
	Bottom(Standard_Real)
	Top(Standard_Real)
	Attach(Aspect_TypeOfConstraint)=Aspect_TOC_BOTTOM_LEFT

Returns:
	None

Modifies the current coordinates system of the layer <self>.") SetOrtho;
		void SetOrtho (const Standard_Real Left,const Standard_Real Right,const Standard_Real Bottom,const Standard_Real Top,const Aspect_TypeOfConstraint Attach = Aspect_TOC_BOTTOM_LEFT);
		%feature("autodoc", "Args:
	Width(Standard_Integer)
	Height(Standard_Integer)

Returns:
	None

Modifies the current viewport of the layer <self>.") SetViewport;
		void SetViewport (const Standard_Integer Width,const Standard_Integer Height);
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_CLayer2d

Returns the associated C structure.") CLayer;
		Aspect_CLayer2d CLayer ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_TypeOfLayer

Returns the type.") Type;
		Aspect_TypeOfLayer Type ();
		%feature("autodoc", "Args:
	Item(Handle_Visual3d_LayerItem)

Returns:
	None

No detailed docstring for this function.") AddLayerItem;
		void AddLayerItem (const Handle_Visual3d_LayerItem & Item);
		%feature("autodoc", "Args:
	Item(Handle_Visual3d_LayerItem)

Returns:
	None

No detailed docstring for this function.") RemoveLayerItem;
		void RemoveLayerItem (const Handle_Visual3d_LayerItem & Item);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveAllLayerItems;
		void RemoveAllLayerItems ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_NListOfLayerItem

No detailed docstring for this function.") GetLayerItemList;
		const Visual3d_NListOfLayerItem & GetLayerItemList ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RenderLayerItems;
		void RenderLayerItems ();
};


%feature("shadow") Visual3d_Layer::~Visual3d_Layer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a layer item") Visual3d_LayerItem;
		 Visual3d_LayerItem ();
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNeedToRecompute;
		Standard_Boolean IsNeedToRecompute ();
		%feature("autodoc", "Args:
	NeedToRecompute(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetNeedToRecompute;
		void SetNeedToRecompute (const Standard_Boolean NeedToRecompute = Standard_True);
};


%feature("shadow") Visual3d_LayerItem::~Visual3d_LayerItem %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a light from default values.  
//!	    Light sources are created in a visualiser  
//!	    and are activated in one of its views.  
 
//!	    Type	= TOLS_AMBIENT  
//!	    Color	= WHITE") Visual3d_Light;
		 Visual3d_Light ();
		%feature("autodoc", "Args:
	Color(Quantity_Color)

Returns:
	None

Creates an AMBIENT light source.  
//!	    Light sources are created in a visualiser  
//!	    and are activated in one of its views.") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color);
		%feature("autodoc", "Args:
	Color(Quantity_Color)
	Direction(Graphic3d_Vector)
	Headlight(Standard_Boolean)=Standard_False

Returns:
	None

Creates a DIRECTIONAL light source.  
//!	    Light sources are created in a visualiser  
//!	    and are activated in one of its views.  
 Warning: Raises LightDefinitionError if <Direction> is null.") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color,const Graphic3d_Vector & Direction,const Standard_Boolean Headlight = Standard_False);
		%feature("autodoc", "Args:
	Color(Quantity_Color)
	Position(Graphic3d_Vertex)
	Fact1(Standard_Real)
	Fact2(Standard_Real)

Returns:
	None

Creates a POSITIONAL light source.  
//!	    Light sources are created in a visualiser  
//!	    and are activated in one of its views.  
 Warning: Raises LightDefinitionError  
//!	    if <Fact1> and <Fact2> are null.  
//!	    if <Fact1> is a negative value or greater than 1.0.  
//!	    if <Fact2> is a negative value or greater than 1.0.") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color,const Graphic3d_Vertex & Position,const Standard_Real Fact1,const Standard_Real Fact2);
		%feature("autodoc", "Args:
	Color(Quantity_Color)
	Position(Graphic3d_Vertex)
	Direction(Graphic3d_Vector)
	Concentration(Standard_Real)
	Fact1(Standard_Real)
	Fact2(Standard_Real)
	AngleCone(Standard_Real)

Returns:
	None

Creates a SPOT light source.  
//!	    Light sources are created in a visualiser  
//!	    and are activated in one of its views.  
//!	    <Concentration> specifies the intensity distribution of  
//!	    the light.  
//!	    <AngleCone> specifies the angle (radians) of the cone  
//!	    created by the spot.  
	    the global attenuation is equal :  
//!	    1 / (Fact1 + Fact2 * (norm(ObjectPosition - LightPosition)))  
 Warning: Raises LightDefinitionError  
//!	    if <Direction> is null.  
//!	    if <Concentration> is a negative value or greater than 1.0.  
//!	    if <Fact1> and <Fact2> are null.  
//!	    if <Fact1> is a negative value or greater than 1.0.  
//!	    if <Fact2> is a negative value or greater than 1.0.  
//!	    if <AngleCone> is a negative value or greater than PI/2.") Visual3d_Light;
		 Visual3d_Light (const Quantity_Color & Color,const Graphic3d_Vertex & Position,const Graphic3d_Vector & Direction,const Standard_Real Concentration,const Standard_Real Fact1,const Standard_Real Fact2,const Standard_Real AngleCone);
		%feature("autodoc", "Args:
	AngleCone(Standard_Real)

Returns:
	None

Modifies the angle (radians) of the cone created by the spot.  
//!	    Works only on TOLS_SPOT lights.  
 Category: Methods to modify the class definition  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_SPOT.  
//!	    if <AngleCone> is a negative value or greater than PI/2.") SetAngle;
		void SetAngle (const Standard_Real AngleCone);
		%feature("autodoc", "Args:
	Fact1(Standard_Real)

Returns:
	None

Modifies the attenuation factor of the light.  
//!	    Works only on the TOLS_POSITIONAL and TOLS_SPOT lights.  
 Category: Methods to modify the class definition  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_SPOT or TOLS_POSITIONAL.  
//!	    if <Fact1> is a negative value or greater than 1.0.") SetAttenuation1;
		void SetAttenuation1 (const Standard_Real Fact1);
		%feature("autodoc", "Args:
	Fact2(Standard_Real)

Returns:
	None

Modifies the attenuation factor of the light.  
//!	    Works only on the TOLS_POSITIONAL and TOLS_SPOT lights.  
 Category: Methods to modify the class definition  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_POSITIONAL or TOLS_SPOT.  
//!	    if <Fact2> is a negative value or greater than 1.0..") SetAttenuation2;
		void SetAttenuation2 (const Standard_Real Fact2);
		%feature("autodoc", "Args:
	Color(Quantity_Color)

Returns:
	None

Modifies the colour of the light.") SetColor;
		void SetColor (const Quantity_Color & Color);
		%feature("autodoc", "Args:
	Concentration(Standard_Real)

Returns:
	None

Modifies the intensity distribution of the light.  
//!	    Works only on the TOLS_SPOT lights.  
 Category: Methods to modify the class definition  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_SPOT.  
//!	    if <Concentration> is a negative value or greater than 1.0.") SetConcentration;
		void SetConcentration (const Standard_Real Concentration);
		%feature("autodoc", "Args:
	Direction(Graphic3d_Vector)

Returns:
	None

Modifies the light direction.  
//!	    Works only on the TOLS_DIRECTIONAL and TOLS_SPOT lights.  
//!	    Default z  
 Category: Methods to modify the class definition  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_DIRECTIONAL  
//!	    or TOLS_SPOT.  
//!	    if <Direction> is null.") SetDirection;
		void SetDirection (const Graphic3d_Vector & Direction);
		%feature("autodoc", "Args:
	Position(Graphic3d_Vertex)

Returns:
	None

Modifies the position of the light.  
//!	    Works only on the TOLS_POSITIONAL and TOLS_SPOT lights.  
 Category: Methods to modify the class definition  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_POSITIONAL or TOLS_SPOT.") SetPosition;
		void SetPosition (const Graphic3d_Vertex & Position);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the headlight  state of the light <self>") Headlight;
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
	Quantity_Color

Returns the colour of the light <self>.") Color;
		Quantity_Color Color ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_TypeOfLightSource

Returns the light type of <self>.  
 
//!	    TypeOfLightSource = TOLS_AMBIENT  
//!				TOLS_DIRECTIONAL  
//!				TOLS_POSITIONAL  
//!				TOLS_SPOT") LightType;
		Visual3d_TypeOfLightSource LightType ();
		%feature("autodoc", "Args:
	Color(Quantity_Color)

Returns:
	None

Returns the definition of <self> if <self> is  
//!	    a light source of the TOLS_AMBIENT type.  
 Category: Inquire methods  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_AMBIENT.") Values;
		void Values (Quantity_Color & Color);
		%feature("autodoc", "Args:
	Color(Quantity_Color)
	Direction(Graphic3d_Vector)

Returns:
	None

Returns the definition of <self> if <self> is  
//!	    a light source of the TOLS_DIRECTIONAL type.  
 Category: Inquire methods  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_DIRECTIONAL.") Values;
		void Values (Quantity_Color & Color,Graphic3d_Vector & Direction);
		%feature("autodoc", "Args:
	Color(Quantity_Color)
	Position(Graphic3d_Vertex)
	Fact1(Standard_Real)
	Fact2(Standard_Real)

Returns:
	None

Returns the definition of <self> if <self> is  
//!	    a light source of the TOLS_POSITIONAL type.  
 Category: Inquire methods  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_POSITIONAL.") Values;
		void Values (Quantity_Color & Color,Graphic3d_Vertex & Position,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Color(Quantity_Color)
	Position(Graphic3d_Vertex)
	Direction(Graphic3d_Vector)
	Concentration(Standard_Real)
	Fact1(Standard_Real)
	Fact2(Standard_Real)
	AngleCone(Standard_Real)

Returns:
	None

Returns the definition of <self> if <self> is  
//!	    a light source of the TOLS_SPOT type.  
 Category: Inquire methods  
 Warning: Raises LightDefinitionError  
//!	    if the type of the light is not TOLS_SPOT.") Values;
		void Values (Quantity_Color & Color,Graphic3d_Vertex & Position,Graphic3d_Vector & Direction,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_CLight

Returns the light defintion.") CLight;
		const Graphic3d_CLight & CLight ();
};


%feature("shadow") Visual3d_Light::~Visual3d_Light %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_ListIteratorOfSetListOfSetOfLight;
		 Visual3d_ListIteratorOfSetListOfSetOfLight ();
		%feature("autodoc", "Args:
	L(Visual3d_SetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Visual3d_ListIteratorOfSetListOfSetOfLight;
		 Visual3d_ListIteratorOfSetListOfSetOfLight (const Visual3d_SetListOfSetOfLight & L);
		%feature("autodoc", "Args:
	L(Visual3d_SetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Visual3d_SetListOfSetOfLight & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Light

No detailed docstring for this function.") Value;
		Handle_Visual3d_Light & Value ();
};


%feature("shadow") Visual3d_ListIteratorOfSetListOfSetOfLight::~Visual3d_ListIteratorOfSetListOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_ListIteratorOfSetListOfSetOfView;
		 Visual3d_ListIteratorOfSetListOfSetOfView ();
		%feature("autodoc", "Args:
	L(Visual3d_SetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Visual3d_ListIteratorOfSetListOfSetOfView;
		 Visual3d_ListIteratorOfSetListOfSetOfView (const Visual3d_SetListOfSetOfView & L);
		%feature("autodoc", "Args:
	L(Visual3d_SetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Visual3d_SetListOfSetOfView & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_View

No detailed docstring for this function.") Value;
		Handle_Visual3d_View & Value ();
};


%feature("shadow") Visual3d_ListIteratorOfSetListOfSetOfView::~Visual3d_ListIteratorOfSetListOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	I(Handle_Visual3d_Light)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Visual3d_ListNodeOfSetListOfSetOfLight;
		 Visual3d_ListNodeOfSetListOfSetOfLight (const Handle_Visual3d_Light & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Light

No detailed docstring for this function.") Value;
		Handle_Visual3d_Light & Value ();
};


%feature("shadow") Visual3d_ListNodeOfSetListOfSetOfLight::~Visual3d_ListNodeOfSetListOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	I(Handle_Visual3d_View)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Visual3d_ListNodeOfSetListOfSetOfView;
		 Visual3d_ListNodeOfSetListOfSetOfView (const Handle_Visual3d_View & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_View

No detailed docstring for this function.") Value;
		Handle_Visual3d_View & Value ();
};


%feature("shadow") Visual3d_ListNodeOfSetListOfSetOfView::~Visual3d_ListNodeOfSetListOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	CTX(Visual3d_ContextPick)

Returns:
	None

Creates a PickDescriptor <self>.") Visual3d_PickDescriptor;
		 Visual3d_PickDescriptor (const Visual3d_ContextPick & CTX);
		%feature("autodoc", "Args:
	APickPath(Visual3d_PickPath)

Returns:
	None

Adds a PickPath to PickDescriptor <self>.") AddPickPath;
		void AddPickPath (const Visual3d_PickPath & APickPath);
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases all the information in <self>.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the pick depth, that is the  
//!	    number of PickPaths available in the PickDescriptor.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_HSequenceOfPickPath

Returns the group of PickPaths of <self>.") PickPath;
		Handle_Visual3d_HSequenceOfPickPath PickPath ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

Returns the root structure.  
//!	    If the pick order was of the type TOO_TOPFIRST  
//!	    then it's the first structure.  
//!	    If the pick order was of the type TOO_BOTTOMFIRST  
//!	    Then it's the last structure.  
//!	    The pick order is set by the method SetOrder  
//!	    from ContextPick.  
 Category: Inquire methods  
 Warning: Raises PickError if Depth == 0 (no picked structure).") TopStructure;
		Handle_Graphic3d_Structure TopStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the root structure pickid.  
//!	    If the pick order was of the type TOO_TOPFIRST  
//!	    then it's the first pickid.  
//!	    If the pick order was of the type TOO_BOTTOMFIRST  
//!	    then it's the last pickid.  
//!	    The pick order is set by the method SetOrder  
//!	    from ContextPick.  
 Category: Inquire methods  
 Warning: Raises PickError if Depth == 0 (no picked structure).") TopPickId;
		Standard_Integer TopPickId ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the root structure element number.  
//!	    If the pick order was of the type TOO_TOPFIRST  
//!	    then it's the first element number.  
//!	    If the pick order was of the type TOO_BOTTOMFIRST  
//!	    then it's the last element number.  
//!	    The pick order is set by the method SetOrder  
//!	    from ContextPick.  
 Category: Inquire methods  
 Warning: Raises PickError if Depth == 0 (no picked structure).") TopElementNumber;
		Standard_Integer TopElementNumber ();
};


%feature("shadow") Visual3d_PickDescriptor::~Visual3d_PickDescriptor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an undefined PickPath.") Visual3d_PickPath;
		 Visual3d_PickPath ();
		%feature("autodoc", "Args:
	AElemNumber(Standard_Integer)
	APickId(Standard_Integer)
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Creates a PickPath :  
//!	    <AElemNumber> : Element number of the structure picked.  
//!	    <APickId>	  : Pick identifier of the structure picked.  
//!	    <AStructure>  : The picked structure.") Visual3d_PickPath;
		 Visual3d_PickPath (const Standard_Integer AElemNumber,const Standard_Integer APickId,const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AElemNumber(Standard_Integer)

Returns:
	None

Modifies the PickPath <self>.  
//!	    <AElemNumber> : Element number of the structure picked.") SetElementNumber;
		void SetElementNumber (const Standard_Integer AElemNumber);
		%feature("autodoc", "Args:
	APickId(Standard_Integer)

Returns:
	None

Modifies the PickPath <self>.  
//!	    <APickId>	  : Pick identifier of the structure picked.") SetPickIdentifier;
		void SetPickIdentifier (const Standard_Integer APickId);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Modifies the PickPath <self>.  
//!	    <AStructure>	: Identifier of the structure picked.") SetStructIdentifier;
		void SetStructIdentifier (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the element number stocked in the PickPath <self>.  
 Category: Inquire methods  
 Warning: Raises PickError if PickPath is empty (no picked structure).") ElementNumber;
		Standard_Integer ElementNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the pick identifier stocked in the PickPath <self>.  
 Category: Inquire methods  
 Warning: Raises PickError if PickPath is empty (no picked structure).") PickIdentifier;
		Standard_Integer PickIdentifier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_Structure

Returns the structure stocked in the PickPath <self>.  
 Category: Inquire methods  
 Warning: Raises PickError if PickPath is empty (no picked structure).") StructIdentifier;
		Handle_Graphic3d_Structure StructIdentifier ();
};


%feature("shadow") Visual3d_PickPath::~Visual3d_PickPath %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	I(Visual3d_PickPath)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Visual3d_SequenceNodeOfSequenceOfPickPath;
		 Visual3d_SequenceNodeOfSequenceOfPickPath (const Visual3d_PickPath & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_PickPath

No detailed docstring for this function.") Value;
		Visual3d_PickPath & Value ();
};


%feature("shadow") Visual3d_SequenceNodeOfSequenceOfPickPath::~Visual3d_SequenceNodeOfSequenceOfPickPath %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_SequenceOfPickPath;
		 Visual3d_SequenceOfPickPath ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Visual3d_SequenceOfPickPath)

Returns:
	Visual3d_SequenceOfPickPath

No detailed docstring for this function.") Assign;
		const Visual3d_SequenceOfPickPath & Assign (const Visual3d_SequenceOfPickPath & Other);
		%feature("autodoc", "Args:
	Other(Visual3d_SequenceOfPickPath)

Returns:
	Visual3d_SequenceOfPickPath

No detailed docstring for this function.") operator=;
		const Visual3d_SequenceOfPickPath & operator = (const Visual3d_SequenceOfPickPath & Other);
		%feature("autodoc", "Args:
	T(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Visual3d_PickPath & T);
		%feature("autodoc", "Args:
	S(Visual3d_SequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Visual3d_SequenceOfPickPath & S);
		%feature("autodoc", "Args:
	T(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Visual3d_PickPath & T);
		%feature("autodoc", "Args:
	S(Visual3d_SequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Visual3d_SequenceOfPickPath & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Visual3d_PickPath & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Visual3d_SequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Visual3d_SequenceOfPickPath & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Visual3d_PickPath & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Visual3d_SequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Visual3d_SequenceOfPickPath & S);
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_PickPath

No detailed docstring for this function.") First;
		const Visual3d_PickPath & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_PickPath

No detailed docstring for this function.") Last;
		const Visual3d_PickPath & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Visual3d_SequenceOfPickPath)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Visual3d_SequenceOfPickPath & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Visual3d_PickPath

No detailed docstring for this function.") Value;
		const Visual3d_PickPath & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Visual3d_PickPath)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Visual3d_PickPath & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Visual3d_PickPath

No detailed docstring for this function.") ChangeValue;
		Visual3d_PickPath & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Visual3d_SequenceOfPickPath::~Visual3d_SequenceOfPickPath %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_SetIteratorOfSetOfLight;
		 Visual3d_SetIteratorOfSetOfLight ();
		%feature("autodoc", "Args:
	S(Visual3d_SetOfLight)

Returns:
	None

No detailed docstring for this function.") Visual3d_SetIteratorOfSetOfLight;
		 Visual3d_SetIteratorOfSetOfLight (const Visual3d_SetOfLight & S);
		%feature("autodoc", "Args:
	S(Visual3d_SetOfLight)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Visual3d_SetOfLight & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Light

No detailed docstring for this function.") Value;
		const Handle_Visual3d_Light & Value ();
};


%feature("shadow") Visual3d_SetIteratorOfSetOfLight::~Visual3d_SetIteratorOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_SetIteratorOfSetOfView;
		 Visual3d_SetIteratorOfSetOfView ();
		%feature("autodoc", "Args:
	S(Visual3d_SetOfView)

Returns:
	None

No detailed docstring for this function.") Visual3d_SetIteratorOfSetOfView;
		 Visual3d_SetIteratorOfSetOfView (const Visual3d_SetOfView & S);
		%feature("autodoc", "Args:
	S(Visual3d_SetOfView)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Visual3d_SetOfView & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_View

No detailed docstring for this function.") Value;
		const Handle_Visual3d_View & Value ();
};


%feature("shadow") Visual3d_SetIteratorOfSetOfView::~Visual3d_SetIteratorOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_SetListOfSetOfLight;
		 Visual3d_SetListOfSetOfLight ();
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Visual3d_SetListOfSetOfLight & Other);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Visual3d_SetListOfSetOfLight & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_Visual3d_Light)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Visual3d_Light & I);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_Light)
	theIt(Visual3d_ListIteratorOfSetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & theIt);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Visual3d_SetListOfSetOfLight & Other);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_Light)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Visual3d_Light & I);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_Light)
	theIt(Visual3d_ListIteratorOfSetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & theIt);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Visual3d_SetListOfSetOfLight & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Light

No detailed docstring for this function.") First;
		Handle_Visual3d_Light & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Light

No detailed docstring for this function.") Last;
		Handle_Visual3d_Light & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Visual3d_ListIteratorOfSetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_Light)
	It(Visual3d_ListIteratorOfSetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfLight)
	It(Visual3d_ListIteratorOfSetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Visual3d_SetListOfSetOfLight & Other,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_Light)
	It(Visual3d_ListIteratorOfSetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Visual3d_Light & I,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfLight)
	It(Visual3d_ListIteratorOfSetListOfSetOfLight)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Visual3d_SetListOfSetOfLight & Other,Visual3d_ListIteratorOfSetListOfSetOfLight & It);
};


%feature("shadow") Visual3d_SetListOfSetOfLight::~Visual3d_SetListOfSetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_SetListOfSetOfView;
		 Visual3d_SetListOfSetOfView ();
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Visual3d_SetListOfSetOfView & Other);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Visual3d_SetListOfSetOfView & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_Visual3d_View)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Visual3d_View & I);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_View)
	theIt(Visual3d_ListIteratorOfSetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & theIt);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Visual3d_SetListOfSetOfView & Other);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_View)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Visual3d_View & I);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_View)
	theIt(Visual3d_ListIteratorOfSetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & theIt);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Visual3d_SetListOfSetOfView & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_View

No detailed docstring for this function.") First;
		Handle_Visual3d_View & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_View

No detailed docstring for this function.") Last;
		Handle_Visual3d_View & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Visual3d_ListIteratorOfSetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_View)
	It(Visual3d_ListIteratorOfSetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfView)
	It(Visual3d_ListIteratorOfSetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Visual3d_SetListOfSetOfView & Other,Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("autodoc", "Args:
	I(Handle_Visual3d_View)
	It(Visual3d_ListIteratorOfSetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Visual3d_View & I,Visual3d_ListIteratorOfSetListOfSetOfView & It);
		%feature("autodoc", "Args:
	Other(Visual3d_SetListOfSetOfView)
	It(Visual3d_ListIteratorOfSetListOfSetOfView)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Visual3d_SetListOfSetOfView & Other,Visual3d_ListIteratorOfSetListOfSetOfView & It);
};


%feature("shadow") Visual3d_SetListOfSetOfView::~Visual3d_SetListOfSetOfView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_SetOfLight;
		 Visual3d_SetOfLight ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Visual3d_Light)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Visual3d_Light & T);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_Light)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_Light & T);
		%feature("autodoc", "Args:
	B(Visual3d_SetOfLight)

Returns:
	None

No detailed docstring for this function.") Union;
		void Union (const Visual3d_SetOfLight & B);
		%feature("autodoc", "Args:
	B(Visual3d_SetOfLight)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const Visual3d_SetOfLight & B);
		%feature("autodoc", "Args:
	B(Visual3d_SetOfLight)

Returns:
	None

No detailed docstring for this function.") Difference;
		void Difference (const Visual3d_SetOfLight & B);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_Light)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_Light & T);
		%feature("autodoc", "Args:
	S(Visual3d_SetOfLight)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Visual3d_SetOfLight & S);
		%feature("autodoc", "Args:
	S(Visual3d_SetOfLight)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Visual3d_SetOfLight & S);
};


%feature("shadow") Visual3d_SetOfLight::~Visual3d_SetOfLight %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Visual3d_SetOfView;
		 Visual3d_SetOfView ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Visual3d_View)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Visual3d_View & T);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_View)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Visual3d_View & T);
		%feature("autodoc", "Args:
	B(Visual3d_SetOfView)

Returns:
	None

No detailed docstring for this function.") Union;
		void Union (const Visual3d_SetOfView & B);
		%feature("autodoc", "Args:
	B(Visual3d_SetOfView)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const Visual3d_SetOfView & B);
		%feature("autodoc", "Args:
	B(Visual3d_SetOfView)

Returns:
	None

No detailed docstring for this function.") Difference;
		void Difference (const Visual3d_SetOfView & B);
		%feature("autodoc", "Args:
	T(Handle_Visual3d_View)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Visual3d_View & T);
		%feature("autodoc", "Args:
	S(Visual3d_SetOfView)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Visual3d_SetOfView & S);
		%feature("autodoc", "Args:
	S(Visual3d_SetOfView)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Visual3d_SetOfView & S);
};


%feature("shadow") Visual3d_SetOfView::~Visual3d_SetOfView %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a TransientManager <aView>.") Visual3d_TransientManager;
		 Visual3d_TransientManager ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppress the TransientManager <self>.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	aView(Handle_Visual3d_View)
	DoubleBuffer(Standard_Boolean)=Standard_False
	RetainMode(Standard_Boolean)=Standard_False

Returns:
	static Standard_Integer

Begins any graphics in the view <aView>  
     Redraw any structured graphics in the back buffer before  
     if <DoubleBuffer> is TRUE.  
         Restore the front buffer from the back before  
     if <DoubleBuffer> is FALSE.  
     if <RetainMode> is TRUE.  
         the graphic managed itself exposure,resizing ...  
     if <RetainMode> is FALSE.  
         the application must managed itself exposure,resizing ...  
 
 Warning: Returns TRUE if transient drawing is enabled in  
    the associated view.  
         Returns FALSE ,if nothing works because something  
    is wrong for the transient principle :  
    Immediat mode is not implemented depending of the  
    graphic library used.  
        MBX,PIXMAP double buffering don't works depending of  
        the graphic board and the visual of the window supporting  
        the view.  
 Warning: No default attributes  
Raises TransientDefinitionError from Visual3d;  
if   Drawing is already opened.  
or   the associated view is not mapped on a window.") BeginDraw;
		static Standard_Integer BeginDraw (const Handle_Visual3d_View & aView,const Standard_Boolean DoubleBuffer = Standard_False,const Standard_Boolean RetainMode = Standard_False);
		%feature("autodoc", "Args:
	Synchronize(Standard_Boolean)=Standard_False

Returns:
	static void

Flush all graphics to the front buffer.  
 Synchronize graphics to the screen if <Synchronize> is  
 TRUE (make becarefull to the performances!).  
 Raises TransientDefinitionError from Visual3d;  
if   Drawing is not opened.") EndDraw;
		static void EndDraw (const Standard_Boolean Synchronize = Standard_False);
		%feature("autodoc", "Args:
	aView(Handle_Visual3d_View)
	aFlush(Standard_Boolean)=Standard_True

Returns:
	static void

Clear all transient graphics in the view <aView>  
        updates a scene if <aFlush> = true  
 Raises TransientDefinitionError from Visual3d;  
if   Drawing is already opened.  
or   the associated view is not mapped on a window.") ClearDraw;
		static void ClearDraw (const Handle_Visual3d_View & aView,const Standard_Boolean aFlush = Standard_True);
		%feature("autodoc", "Args:
	aView(Handle_Visual3d_View)

Returns:
	static Standard_Integer

Begins any add graphics in the view <aView>  
         the application must managed itself exposure,resizing ...  
 
 Warning: Returns TRUE if transient drawing is enabled in  
    the associated view.  
         Returns FALSE ,if nothing works because something  
    is wrong for the transient principle :  
    Immediat mode is not implemented depending of the  
    graphic library used.  
        MBX,PIXMAP double buffering don't works depending of  
        the graphic board and the visual of the window supporting  
        the view.  
 Warning: No default attributes  
Raises TransientDefinitionError from Visual3d;  
if   Drawing is already opened.  
or   the associated view is not mapped on a window.") BeginAddDraw;
		static Standard_Integer BeginAddDraw (const Handle_Visual3d_View & aView);
		%feature("autodoc", "Args:
	None
Returns:
	static void

Flush all add graphics to the front buffer.  
Raises TransientDefinitionError from Visual3d;  
if   Drawing is not opened.") EndAddDraw;
		static void EndAddDraw ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	static void

Drawn the structure <AStructure>.  
Raises TransientDefinitionError from Visual3d;  
if   Drawing is not opened.") DrawStructure;
		static void DrawStructure (const Handle_Graphic3d_Structure & AStructure);
};


%feature("shadow") Visual3d_TransientManager::~Visual3d_TransientManager %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	AManager(Handle_Visual3d_ViewManager)

Returns:
	None

Creates a view in the viewer <AManager> with a default  
//!	    orientation and a default mapping.") Visual3d_View;
		 Visual3d_View (const Handle_Visual3d_ViewManager & AManager);
		%feature("autodoc", "Args:
	AManager(Handle_Visual3d_ViewManager)
	VO(Visual3d_ViewOrientation)
	VM(Visual3d_ViewMapping)
	CTX(Visual3d_ContextView)

Returns:
	None

Creates a view in the viewer <AManager> with the orientation  
//!	    <VO>, the mapping <VM>, and the context<CTX>.") Visual3d_View;
		 Visual3d_View (const Handle_Visual3d_ViewManager & AManager,const Visual3d_ViewOrientation & VO,const Visual3d_ViewMapping & VM,const Visual3d_ContextView & CTX);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates the view <self>.  
//!	    Map the associated window on the screen and  
//!	    post the view in this window.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") Activate;
		void Activate ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates the view <self>.  
//!	    Unmap the associated window on the screen and  
//!	    unpost the view in this window.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") Deactivate;
		void Deactivate ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Deletes and erases the view <self>.") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates screen in all cases.") Redraw;
		void Redraw ();
		%feature("autodoc", "Args:
	x(Standard_Integer)
	y(Standard_Integer)
	width(Standard_Integer)
	height(Standard_Integer)

Returns:
	None

Updates screen area in all cases.  
area is given by his xy min corner and size in pixel coordinates") Redraw;
		void Redraw (const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "Args:
	AnUnderLayer(Handle_Visual3d_Layer)
	AnOverLayer(Handle_Visual3d_Layer)

Returns:
	None

Updates screen in all cases.") Redraw;
		void Redraw (const Handle_Visual3d_Layer & AnUnderLayer,const Handle_Visual3d_Layer & AnOverLayer);
		%feature("autodoc", "Args:
	AnUnderLayer(Handle_Visual3d_Layer)
	AnOverLayer(Handle_Visual3d_Layer)
	x(Standard_Integer)
	y(Standard_Integer)
	width(Standard_Integer)
	height(Standard_Integer)

Returns:
	None

Updates screen area in all cases.  
area is given by his xy min corner and size in pixel coordinates") Redraw;
		void Redraw (const Handle_Visual3d_Layer & AnUnderLayer,const Handle_Visual3d_Layer & AnOverLayer,const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deletes and erases the view <self>.  
 Warning: No more graphic operations in <self> after this call.") Remove;
		void Remove ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates the view <self> after the modification  
//!	    of the associated window.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") Resized;
		void Resized ();
		%feature("autodoc", "Args:
	ABack(Aspect_Background)

Returns:
	None

Modifies the default window background.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") SetBackground;
		void SetBackground (const Aspect_Background & ABack);
		%feature("autodoc", "Args:
	FileName(char *)
	FillStyle(Aspect_FillMethod)
	update(Standard_Boolean)

Returns:
	None

Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") SetBackgroundImage;
		void SetBackgroundImage (const char * FileName,const Aspect_FillMethod FillStyle,const Standard_Boolean update);
		%feature("autodoc", "Args:
	FillStyle(Aspect_FillMethod)
	update(Standard_Boolean)

Returns:
	None

Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") SetBgImageStyle;
		void SetBgImageStyle (const Aspect_FillMethod FillStyle,const Standard_Boolean update);
		%feature("autodoc", "Args:
	ABack(Aspect_GradientBackground)
	update(Standard_Boolean)

Returns:
	None

Modifies the gradient window background.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") SetGradientBackground;
		void SetGradientBackground (const Aspect_GradientBackground & ABack,const Standard_Boolean update);
		%feature("autodoc", "Args:
	FillStyle(Aspect_GradientFillMethod)
	update(Standard_Boolean)

Returns:
	None

Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") SetBgGradientStyle;
		void SetBgGradientStyle (const Aspect_GradientFillMethod FillStyle,const Standard_Boolean update);
		%feature("autodoc", "Args:
	aModel(Visual3d_TypeOfBackfacingModel)

Returns:
	None

Manages display of the back faces") SetBackFacingModel;
		void SetBackFacingModel (const Visual3d_TypeOfBackfacingModel aModel);
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_TypeOfBackfacingModel

Returns current state of the back faces display") BackFacingModel;
		Visual3d_TypeOfBackfacingModel BackFacingModel ();
		%feature("autodoc", "Args:
	CTX(Visual3d_ContextView)

Returns:
	None

Sets the context <CTX> in the view <self>.") SetContext;
		void SetContext (const Visual3d_ContextView & CTX);
		%feature("autodoc", "Args:
	AMatrix(TColStd_Array2OfReal)

Returns:
	None

Sets the transformation matrix that is applied  
         to <MyViewOrientation> field of the view <self>.  
 
//!	    <AMatrix> is defined as a 4*4 real matrix.  
 
//!		-------------------  
//!		| a11 a12 a13  t1 |  
//!		| a21 a22 a23  t2 |  
//!		| a31 a32 a33  t3 |  
//!		|  0   0   0   1  |  
//!		-------------------  
 
 Category: Methods to modify the class definition  
 Warning: Raises TransformError if the matrix isn't a 4x4 matrix.") SetTransform;
		void SetTransform (const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "Args:
	VM(Visual3d_ViewMapping)

Returns:
	None

Modifies the mapping of the view <self>.") SetViewMapping;
		void SetViewMapping (const Visual3d_ViewMapping & VM);
		%feature("autodoc", "Args:
	None
Returns:
	None

Saves the current mapping which will be the  
//!	    reference value for the reset of the mapping  
//!	    done by the ViewmappingReset method.") SetViewMappingDefault;
		void SetViewMappingDefault ();
		%feature("autodoc", "Args:
	VO(Visual3d_ViewOrientation)

Returns:
	None

Modifies the orientation of <self>.") SetViewOrientation;
		void SetViewOrientation (const Visual3d_ViewOrientation & VO);
		%feature("autodoc", "Args:
	None
Returns:
	None

Saves the current orientation which will be the  
//!	    reference value for the reset of the orientation  
//!	    done by the ViewOrientationReset method.") SetViewOrientationDefault;
		void SetViewOrientationDefault ();
		%feature("autodoc", "Args:
	AWindow(Handle_Aspect_Window)

Returns:
	None

Associates the window <AWindow> to the view <self>.  
//!	    No new association if the window is already defined.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if it is impossible  
//!	    to associate a view and a window.  
//!	    (association already done or another problem)  
//!	    Modifies the viewmapping of the associated view  
//!	    when it calls the SetRatio method.  
//!	    After this call, each view is mapped in an unique window.  
 
Programming example :  
 
An example when we have 1 view and 1 window  
-------------------------------------------  
 
Handle_Aspect_DisplayConnection aDisplayConnection;  
 
// Display connection initialization only needed on Linux platform  
// and on Mac OS X, in cases when you use Xlib for windows drawing.  
aDisplayConnection = new Aspect_DisplayConnection();  
 
// Graphic driver initialization  
Handle_Graphic3d_GraphicDriver aGraphicDriver =  
  Graphic3d::InitGraphicDriver (aDisplayConnection);  
 
// Define a view manager  
Handle_Visual3d_ViewManager aVisualManager = new Visual3d_ViewManager (aGraphicDriver);  
 
// Define a view  
Handle_Visual3d_View aView = new Visual3d_View (aVisaulManager);  
 
// Define a window  
Handle_Xw_Window aWindow = new Xw_Window  
//!	(aDisplayConnection, 'Graphic View 1', 0.695, 0.695, 0.600, 0.600, Quantity_NOC_MATRAGRAY);  
 
// Associate the view and the window  
aView->SetWindow (aWindow);  
 
// Map the window  
aWindow->Map ();  
 
// Activate the view  
aView->Activate ();") SetWindow;
		void SetWindow (const Handle_Aspect_Window & AWindow);
		%feature("autodoc", "Args:
	AWindow(Handle_Aspect_Window)
	AContext(Aspect_RenderingContext)
	ADisplayCB(Aspect_GraphicCallbackProc)
	AClientData(Standard_Address)

Returns:
	None

Associates the window <AWindow> and context <AContext>  
//!	    to the view <self>.  
//!	    If <AContext> is not NULL the graphic context is used  
         directly to draw something in this view.  
//!	    Otherwise an internal context is created.  
         If <ADisplayCB> is not NULL then a user display CB is  
         call at the end of the OCC graphic traversal and just  
         before the swap of buffers. The <aClientData> is pass  
         to this call back.  
//!	    No new association if the window is already defined.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewDefinitionError if it is impossible  
//!	    to associate a view and a window.  
//!	    (association already done or another problem)  
//!	    Modifies the viewmapping of the associated view  
//!	    when it calls the SetRatio method.  
//!	    After this call, each view is mapped in an unique window.") SetWindow;
		void SetWindow (const Handle_Aspect_Window & AWindow,const Aspect_RenderingContext AContext,const Aspect_GraphicCallbackProc & ADisplayCB,const Standard_Address AClientData);
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates screen in function of modifications of  
//!	    the structures.") Update;
		void Update ();
		%feature("autodoc", "Args:
	AnUnderLayer(Handle_Visual3d_Layer)
	AnOverLayer(Handle_Visual3d_Layer)

Returns:
	None

Updates screen in function of modifications of  
//!	    the structures.") Update;
		void Update (const Handle_Visual3d_Layer & AnUnderLayer,const Handle_Visual3d_Layer & AnOverLayer);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the value of the mapping to be the same as  
//!	    the mapping saved by the SetViewMappingDefaut method.") ViewMappingReset;
		void ViewMappingReset ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the value of the orientation to be the same as the  
//!	    orientation saved by the SetViewOrientationDefaut method.") ViewOrientationReset;
		void ViewOrientationReset ();
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
	XColor(Quantity_NameOfColor)=Quantity_NOC_RED
	YColor(Quantity_NameOfColor)=Quantity_NOC_GREEN
	ZColor(Quantity_NameOfColor)=Quantity_NOC_BLUE1
	SizeRatio(Standard_Real)=0.8
	AxisDiametr(Standard_Real)=0.05
	NbFacettes(Standard_Integer)=12

Returns:
	None

Customization of the ZBUFFER Triedron.  
        Initializes Colors of X Y and axis  
        Scale ratio defines decreasing of trihedron size when  
        its position is out of a View") ZBufferTriedronSetup;
		void ZBufferTriedronSetup (const Quantity_NameOfColor XColor = Quantity_NOC_RED,const Quantity_NameOfColor YColor = Quantity_NOC_GREEN,const Quantity_NameOfColor ZColor = Quantity_NOC_BLUE1,const Standard_Real SizeRatio = 0.8,const Standard_Real AxisDiametr = 0.05,const Standard_Integer NbFacettes = 12);
		%feature("autodoc", "Args:
	APosition(Aspect_TypeOfTriedronPosition)=Aspect_TOTP_CENTER
	AColor(Quantity_NameOfColor)=Quantity_NOC_WHITE
	AScale(Standard_Real)=0.02
	AsWireframe(Standard_Boolean)=Standard_True

Returns:
	None

Display of the Triedron.  
        Initialize position, color and length of Triedron axes.  
        The scale is a percent of the window width.  
        If AsWireframe is FALSE triedron is shown in shaded mode  
        AColor is not considered for ZBUFFER mode") TriedronDisplay;
		void TriedronDisplay (const Aspect_TypeOfTriedronPosition APosition = Aspect_TOTP_CENTER,const Quantity_NameOfColor AColor = Quantity_NOC_WHITE,const Standard_Real AScale = 0.02,const Standard_Boolean AsWireframe = Standard_True);
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
	Standard_Boolean

Returns data of a graduated trihedron if displayed (return value is True)") GetGraduatedTrihedron;
		Standard_Boolean GetGraduatedTrihedron (TCollection_ExtendedString & xname,TCollection_ExtendedString & yname,TCollection_ExtendedString & zname,Standard_Boolean & xdrawname,Standard_Boolean & ydrawname,Standard_Boolean & zdrawname,Standard_Boolean & xdrawvalues,Standard_Boolean & ydrawvalues,Standard_Boolean & zdrawvalues,Standard_Boolean & drawgrid,Standard_Boolean & drawaxes,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean & xdrawtickmarks,Standard_Boolean & ydrawtickmarks,Standard_Boolean & zdrawtickmarks,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Quantity_Color & gridcolor,Quantity_Color & xnamecolor,Quantity_Color & ynamecolor,Quantity_Color & znamecolor,Quantity_Color & xcolor,Quantity_Color & ycolor,Quantity_Color & zcolor,TCollection_AsciiString & fontOfNames,Font_FontAspect & styleOfNames,Standard_Integer &OutValue,TCollection_AsciiString & fontOfValues,Font_FontAspect & styleOfValues,Standard_Integer &OutValue);
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

Displays a graduated trihedron.") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const TCollection_ExtendedString & xname,const TCollection_ExtendedString & yname,const TCollection_ExtendedString & zname,const Standard_Boolean xdrawname,const Standard_Boolean ydrawname,const Standard_Boolean zdrawname,const Standard_Boolean xdrawvalues,const Standard_Boolean ydrawvalues,const Standard_Boolean zdrawvalues,const Standard_Boolean drawgrid,const Standard_Boolean drawaxes,const Standard_Integer nbx,const Standard_Integer nby,const Standard_Integer nbz,const Standard_Integer xoffset,const Standard_Integer yoffset,const Standard_Integer zoffset,const Standard_Integer xaxisoffset,const Standard_Integer yaxisoffset,const Standard_Integer zaxisoffset,const Standard_Boolean xdrawtickmarks,const Standard_Boolean ydrawtickmarks,const Standard_Boolean zdrawtickmarks,const Standard_Integer xtickmarklength,const Standard_Integer ytickmarklength,const Standard_Integer ztickmarklength,const Quantity_Color & gridcolor,const Quantity_Color & xnamecolor,const Quantity_Color & ynamecolor,const Quantity_Color & znamecolor,const Quantity_Color & xcolor,const Quantity_Color & ycolor,const Quantity_Color & zcolor,const TCollection_AsciiString & fontOfNames,const Font_FontAspect styleOfNames,const Standard_Integer sizeOfNames,const TCollection_AsciiString & fontOfValues,const Font_FontAspect styleOfValues,const Standard_Integer sizeOfValues);
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases a graduated trihedron from the view.") GraduatedTrihedronErase;
		void GraduatedTrihedronErase ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_Background

Returns the value of the default window background.") Background;
		Aspect_Background Background ();
		%feature("autodoc", "Args:
	None
Returns:
	Aspect_GradientBackground

Returns the value of the window background.") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if one of the structures  
//!	    displayed in the view <self> contains Polygons,  
//!	    Triangles or Quadrangles.") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("autodoc", "Args:
	ASet(Graphic3d_MapOfStructure)

Returns:
	Standard_Boolean

Returns Standard_True if one of the structures  
//!	    in the set <ASet> contains Polygons, Triangles  
//!	    or Quadrangles.") ContainsFacet;
		Standard_Boolean ContainsFacet (const Graphic3d_MapOfStructure & ASet);
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_ContextView

Returns the current context of the view <self>.") Context;
		const Visual3d_ContextView & Context ();
		%feature("autodoc", "Args:
	SG(Graphic3d_MapOfStructure)

Returns:
	None

Returns the set of structures displayed in  
//!	    the view <self>.") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the activity flag of the view <self>.") IsActive;
		Standard_Boolean IsActive ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the window associated to the view  
//!	    <self> is defined.") IsDefined;
		Standard_Boolean IsDefined ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True is the view <self> is deleted.  
//!	    <self> is deleted after the call Remove (me).") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	ZMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	ZMax(Standard_Real)

Returns:
	None

Returns the coordinates of the boundary box of all  
//!	    structures displayed in the view <self>.") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	ASet(Graphic3d_MapOfStructure)
	XMin(Standard_Real)
	YMin(Standard_Real)
	ZMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	ZMax(Standard_Real)

Returns:
	None

Returns the coordinates of the boundary box of all  
//!	    structures in the set <ASet>.") MinMaxValues;
		void MinMaxValues (const Graphic3d_MapOfStructure & ASet,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)

Returns:
	None

Returns the coordinates of the projection of the  
//!	    boundary box of all structures displayed in the view <self>.") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	ASet(Graphic3d_MapOfStructure)
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)

Returns:
	None

Returns the coordinates of the projection of the  
//!	    boundary box of all structures in the set <ASet>.") MinMaxValues;
		void MinMaxValues (const Graphic3d_MapOfStructure & ASet,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of displayed structures in  
//!	    the view <self>.") NumberOfDisplayedStructures;
		Standard_Integer NumberOfDisplayedStructures ();
		%feature("autodoc", "Args:
	AX(Standard_Real)
	AY(Standard_Real)
	AZ(Standard_Real)
	APX(Standard_Real)
	APY(Standard_Real)
	APZ(Standard_Real)

Returns:
	None

Returns the coordinates of the projection of the  
//!	    3d coordinates <AX>, <AY>, <AZ>.") Projects;
		void Projects (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

Returns the transformation associated to the view <self>") Transform;
		const TColStd_Array2OfReal & Transform ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_ViewMapping

Returns the current mapping of the view <self>.") ViewMapping;
		Visual3d_ViewMapping ViewMapping ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_ViewMapping

Returns the current reset mapping of the view <self>.") ViewMappingDefault;
		Visual3d_ViewMapping ViewMappingDefault ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_ViewOrientation

Returns the current orientation of the view <self>.") ViewOrientation;
		Visual3d_ViewOrientation ViewOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_ViewOrientation

Returns the current reset orientation of the view <self>.") ViewOrientationDefault;
		Visual3d_ViewOrientation ViewOrientationDefault ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Aspect_Window

Returns the window associated to the view <self>.  
 Warning: Raises ViewDefinitionError if the associated  
//!	    window isn't defined.") Window;
		Handle_Aspect_Window Window ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the MAX number of light associated to the view <self>.") LightLimit;
		Standard_Integer LightLimit ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the MAX number of clipping planes  
associated to the view <self>.") PlaneLimit;
		Standard_Integer PlaneLimit ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_ViewManager

Returns the view manager handle which manage this view") ViewManager;
		Handle_Visual3d_ViewManager ViewManager ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Computes the new presentation of the  
//!	    structure <AStructure> displayed in <self>  
//!	    with the type Graphic3d_TOS_COMPUTED.") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the identification number of the view <self>.") Identification;
		Standard_Integer Identification ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

Returns the current matrix of mapping of the view <self>.  
 Warning: Stores the current matrix of mapping.") MatrixOfMapping;
		const TColStd_Array2OfReal & MatrixOfMapping ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

Returns the current matrix of orientation of the view <self>.  
 Warning: Stores the current matrix of orientation.") MatrixOfOrientation;
		const TColStd_Array2OfReal & MatrixOfOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

Returns the c structure associated to <self>.") CView;
		Standard_Address CView ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_GraphicDriver

Returns the associated GraphicDriver.") GraphicDriver;
		const Handle_Graphic3d_GraphicDriver & GraphicDriver ();
		%feature("autodoc", "Args:
	APlotter(Handle_Graphic3d_Plotter)

Returns:
	None

Calls the method Plot for each Structure  
//!	    displayed in <self>.") Plot;
		void Plot (const Handle_Graphic3d_Plotter & APlotter);
		%feature("autodoc", "Args:
	AFlag(Standard_Boolean)

Returns:
	None

if <AFlag> is Standard_True then the transparency  
//!	    is managed in the view <self>.  
//!	    Default Standard_False") SetTransparency;
		void SetTransparency (const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the ZBuffer is activated  
//!	    in the view <self> and Standard_False if not.") ZBufferIsActivated;
		Standard_Boolean ZBufferIsActivated ();
		%feature("autodoc", "Args:
	AnActivity(Standard_Integer)

Returns:
	None

Activates the ZBuffer if the integer <AnActivity>  
//!	    is equal to 1.  
//!	    Deactivates the ZBuffer if the integer <AnActivity>  
//!	    is equal to 0.  
//!	    If the integer <AnActivity> is equal to -1 then  
//!	    - the ZBuffer is activated if  
//!		me->Context ().Visualization () == Visual3d_TOV_SHADING  
//!	    - the ZBuffer is deactivated if  
//!		me->Context ().Visualization () == Visual3d_TOV_WIREFRAME") SetZBufferActivity;
		void SetZBufferActivity (const Standard_Integer AnActivity);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Layer

Returns the underlay of the view <self>.") UnderLayer;
		const Handle_Visual3d_Layer & UnderLayer ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Layer

Returns the underlay of the view <self>.") OverLayer;
		const Handle_Visual3d_Layer & OverLayer ();
		%feature("autodoc", "Args:
	enable(Standard_Boolean)

Returns:
	None

turns on/off opengl depth") EnableDepthTest;
		void EnableDepthTest (const Standard_Boolean enable);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns current state of the opengl depth testing") IsDepthTestEnabled;
		Standard_Boolean IsDepthTestEnabled ();
		%feature("autodoc", "Args:
	x(Standard_Integer)
	y(Standard_Integer)
	width(Standard_Integer)
	height(Standard_Integer)
	buffer(Standard_Address)

Returns:
	None

Reads depths of shown pixels of the given rectangle") ReadDepths;
		void ReadDepths (const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height,const Standard_Address buffer);
		%feature("autodoc", "Args:
	width(Standard_Integer)
	height(Standard_Integer)

Returns:
	Graphic3d_PtrFrameBuffer

Generate offscreen FBO in the graphic library") FBOCreate;
		Graphic3d_PtrFrameBuffer FBOCreate (const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "Args:
	fboPtr(Graphic3d_PtrFrameBuffer)

Returns:
	None

Remove offscreen FBO from the graphic library") FBORelease;
		void FBORelease (Graphic3d_PtrFrameBuffer & fboPtr);
		%feature("autodoc", "Args:
	fboPtr(Graphic3d_PtrFrameBuffer)
	width(Standard_Integer)
	height(Standard_Integer)
	widthMax(Standard_Integer)
	heightMax(Standard_Integer)

Returns:
	None

Read offscreen FBO configuration.") FBOGetDimensions;
		void FBOGetDimensions (const Graphic3d_PtrFrameBuffer fboPtr,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	fboPtr(Graphic3d_PtrFrameBuffer)
	width(Standard_Integer)
	height(Standard_Integer)

Returns:
	None

Change offscreen FBO viewport.") FBOChangeViewport;
		void FBOChangeViewport (Graphic3d_PtrFrameBuffer & fboPtr,const Standard_Integer width,const Standard_Integer height);
		%feature("autodoc", "Args:
	theImage(Image_PixMap)
	theBufferType(Graphic3d_BufferType)

Returns:
	Standard_Boolean

Dump active rendering buffer into specified memory buffer.") BufferDump;
		Standard_Boolean BufferDump (Image_PixMap & theImage,const Graphic3d_BufferType & theBufferType);
		%feature("autodoc", "Args:
	enable(Standard_Boolean)

Returns:
	None

turns on/off opengl lighting, currently used in triedron displaying") EnableGLLight;
		void EnableGLLight (const Standard_Boolean enable);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns the current state of the gl lighting  
         currently used in triedron displaying") IsGLLightEnabled;
		Standard_Boolean IsGLLightEnabled ();
		%feature("autodoc", "Args:
	theFileName(char *)
	theFormat(Graphic3d_ExportFormat)
	theSortType(Graphic3d_SortType)=Graphic3d_ST_BSP_Tree
	thePrecision(Standard_Real)=0.005
	theProgressBarFunc(Standard_Address)=NULL
	theProgressObject(Standard_Address)=NULL

Returns:
	Standard_Boolean

Export scene into the one of the Vector graphics formats (SVG, PS, PDF...).  
In contrast to Bitmaps, Vector graphics is scalable (so you may got quality benefits on printing to laser printer).  
Notice however that results may differ a lot and do not contain some elements.") Export;
		Standard_Boolean Export (const char * theFileName,const Graphic3d_ExportFormat theFormat,const Graphic3d_SortType theSortType = Graphic3d_ST_BSP_Tree,const Standard_Real thePrecision = 0.005,const Standard_Address theProgressBarFunc = NULL,const Standard_Address theProgressObject = NULL);
};


%feature("shadow") Visual3d_View::~Visual3d_View %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	theDriver(Handle_Graphic3d_GraphicDriver)

Returns:
	None

Creates a 3D visualizer.  
 Currently creating of more than 100 viewer instances  
 is not supported and leads to InitializationError and  
 initialisation failure.  
 This limitation might be addressed in some future OCCT releases.  
 
Category: Methods to modify the class definition") Visual3d_ViewManager;
		 Visual3d_ViewManager (const Handle_Graphic3d_GraphicDriver & theDriver);
		%feature("autodoc", "Args:
	None
Returns:
	None

Activates all the views of the manager <self>.") Activate;
		void Activate ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deactivates all the views of the manager <self>.") Deactivate;
		void Deactivate ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Deletes and erases the 3D visualiser <self>.") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases all of the structures displayed in the  
//!	    visualiser <self>.") Erase;
		void Erase ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Redraws all the displayed structures.") Redraw;
		void Redraw ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Deletes and erases the 3D visualiser <self>.") Remove;
		void Remove ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Updates screen in function of modifications of  
//!	    the structures.  
 Category: Methods to modify the class definition  
 Warning: Not necessary if the update mode is TOU_ASAP.") Update;
		void Update ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_HSetOfView

Returns the group of views activated in the visualiser <self>.") ActivatedView;
		Handle_Visual3d_HSetOfView ActivatedView ();
		%feature("autodoc", "Args:
	AWindow(Handle_Aspect_Window)
	AVertex(Graphic3d_Vertex)
	AU(Standard_Integer)
	AV(Standard_Integer)

Returns:
	None

Applies the view orientation transformation, the  
//!	    view mapping transformation and view clip, the  
//!	    display transformation to the vertex <AVertex>.  
//!	    Returns the pixel coordinates <AU>, <AV>.  
 Warning: Returns <AU> = <AV> = IntegerLast () if the  
//!	    evaluation is impossible.  
//!	    -- Bad Window, Numeric error...") ConvertCoord;
		void ConvertCoord (const Handle_Aspect_Window & AWindow,const Graphic3d_Vertex & AVertex,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	AWindow(Handle_Aspect_Window)
	AU(Standard_Integer)
	AV(Standard_Integer)

Returns:
	Graphic3d_Vertex

Applies the inverse of the display transformation, the  
//!	    inverse of the view mapping transformation and view clip,  
//!	    the inverse of the view orientation transformation to  
//!	    the pixel coordinates <AU>, <AV>.  
//!	    Returns the world coordinates <AVertex>.  
 Warning: Returns AVertex (X, Y, Z) with X = Y = Z = RealLast ()  
//!	    if the evaluation is impossible.  
//!	    -- Bad Window, Numeric error...") ConvertCoord;
		Graphic3d_Vertex ConvertCoord (const Handle_Aspect_Window & AWindow,const Standard_Integer AU,const Standard_Integer AV);
		%feature("autodoc", "Args:
	AWindow(Handle_Aspect_Window)
	AU(Standard_Integer)
	AV(Standard_Integer)
	Point(Graphic3d_Vertex)
	Proj(Graphic3d_Vector)

Returns:
	None

Applies the inverse of the display transformation, the  
//!	    inverse of the view mapping transformation and view clip,  
//!	    the inverse of the view orientation transformation to  
//!	    the pixel coordinates <AU>, <AV>.  
//!	    Returns the world coordinates <AVertex> and projection ray <AVector>.  
 Warning: Returns AVertex (X, Y, Z) with X = Y = Z = RealLast () and  
         AVector (VX, VY, VZ) with VX = VY = VZ = 0.  
//!	    if the evaluation is impossible.  
//!	    -- Bad Window, Numeric error...") ConvertCoordWithProj;
		void ConvertCoordWithProj (const Handle_Aspect_Window & AWindow,const Standard_Integer AU,const Standard_Integer AV,Graphic3d_Vertex & Point,Graphic3d_Vector & Proj);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_HSetOfView

Returns the group of views defined in the visualiser <self>.") DefinedView;
		Handle_Visual3d_HSetOfView DefinedView ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the theoretical maximum number of  
//!	    definable views in the view manager <self>.  
 Warning: It's not possible to accept an infinite  
//!	    number of definable views because each  
//!	    view must have an identification and we  
//!	    have different view managers.") MaxNumOfViews;
		Standard_Integer MaxNumOfViews ();
		%feature("autodoc", "Args:
	AView(Handle_Visual3d_View)

Returns:
	Standard_Integer

Returns :  
//!	    a new identification number for a new view  
//!	    in the visualiser.") Identification;
		Standard_Integer Identification (const Handle_Visual3d_View & AView);
		%feature("autodoc", "Args:
	aViewId(Standard_Integer)

Returns:
	None

Release a unique ID of the view reserved for the view on its creation.") UnIdentification;
		void UnIdentification (const Standard_Integer aViewId);
		%feature("autodoc", "Args:
	AId(Standard_Integer)

Returns:
	Handle_Graphic3d_Structure

Returns the structure with the identification number <AId>.") Identification;
		Handle_Graphic3d_Structure Identification (const Standard_Integer AId);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the identification number of the visualiser.") Identification;
		Standard_Integer Identification ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	OldPriority(Standard_Integer)
	NewPriority(Standard_Integer)

Returns:
	None

Changes the display priority of the structure <AStructure>.") ChangeDisplayPriority;
		void ChangeDisplayPriority (const Handle_Graphic3d_Structure & AStructure,const Standard_Integer OldPriority,const Standard_Integer NewPriority);
		%feature("autodoc", "Args:
	theStructure(Handle_Graphic3d_Structure)
	theLayerId(Standard_Integer)

Returns:
	None

Change Z layer for structure. The layer mechanism allows  
to display structures in higher layers in overlay of structures in  
lower layers.") ChangeZLayer;
		void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	theStructure(Handle_Graphic3d_Structure)

Returns:
	Standard_Integer

Get Z layer ID assigned for the structure.") GetZLayer;
		Standard_Integer GetZLayer (const Handle_Graphic3d_Structure & theStructure);
		%feature("autodoc", "Args:
	theLayerId(Standard_Integer)
	theSettings(Graphic3d_ZLayerSettings)

Returns:
	None

Sets the settings for a single Z layer for all managed views.") SetZLayerSettings;
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

Add a new top-level Z layer and get its ID as  
<theLayerId> value. The method returns Standard_False if the layer  
can not be created. The layer mechanism allows to display  
structures in higher layers in overlay of structures in lower layers.") AddZLayer;
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
	AStructure(Handle_Graphic3d_Structure)
	WithDestruction(Standard_Boolean)

Returns:
	None

Clears the structure <AStructure>.") Clear;
		void Clear (const Handle_Graphic3d_Structure & AStructure,const Standard_Boolean WithDestruction);
		%feature("autodoc", "Args:
	AMother(Handle_Graphic3d_Structure)
	ADaughter(Handle_Graphic3d_Structure)

Returns:
	None

Connects the structures <AMother> and <ADaughter>.") Connect;
		void Connect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "Args:
	AMother(Handle_Graphic3d_Structure)
	ADaughter(Handle_Graphic3d_Structure)

Returns:
	None

Disconnects the structures <AMother> and <ADaughter>.") Disconnect;
		void Disconnect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Display of the structure <AStructure>.") Display;
		void Display (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Erases the structure <AStructure>.") Erase;
		void Erase (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	AMethod(Aspect_TypeOfHighlightMethod)

Returns:
	None

Highlights the structure <AStructure>.") Highlight;
		void Highlight (const Handle_Graphic3d_Structure & AStructure,const Aspect_TypeOfHighlightMethod AMethod);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	ATrsf(TColStd_Array2OfReal)

Returns:
	None

No detailed docstring for this function.") SetTransform;
		void SetTransform (const Handle_Graphic3d_Structure & AStructure,const TColStd_Array2OfReal & ATrsf);
		%feature("autodoc", "Args:
	None
Returns:
	None

Suppress the highlighting on all the structures.") UnHighlight;
		void UnHighlight ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Suppress the highlighting on the structure <AStructure>.") UnHighlight;
		void UnHighlight (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AWindow(Handle_Aspect_Window)
	TheCView(Graphic3d_CView)

Returns:
	Standard_Boolean

Returns Standard_True if the view associated to the  
//!	    window <AWindow> exists and is activated.  
//!	    <TheViewId> contains the internal identification of  
//!	    the associated view.") ViewExists;
		Standard_Boolean ViewExists (const Handle_Aspect_Window & AWindow,Graphic3d_CView & TheCView);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Layer

Returns the underlay of the viewer <self>.") UnderLayer;
		const Handle_Visual3d_Layer & UnderLayer ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Visual3d_Layer

Returns the underlay of the viewer <self>.") OverLayer;
		const Handle_Visual3d_Layer & OverLayer ();
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)

Returns:
	None

Forces a new construction of the structure <AStructure>  
//!	    if <AStructure> is displayed and TOS_COMPUTED.") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("autodoc", "Args:
	AStructure(Handle_Graphic3d_Structure)
	AProjector(Handle_Graphic3d_DataStructureManager)

Returns:
	None

Forces a new construction of the structure <AStructure>  
//!	    if <AStructure> is displayed in <AProjector> and TOS_COMPUTED.") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & AStructure,const Handle_Graphic3d_DataStructureManager & AProjector);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the transparency  
//!	    is activated in all activated views.  
//!	    Default Standard_False") Transparency;
		Standard_Boolean Transparency ();
		%feature("autodoc", "Args:
	AFlag(Standard_Boolean)

Returns:
	None

if <AFlag> is Standard_True then the transparency  
//!	    is managed.  
//!	    Default Standard_False") SetTransparency;
		void SetTransparency (const Standard_Boolean AFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the zbuffer activity  
//!	    is managed automatically.  
//!	    Default Standard_False") ZBufferAuto;
		Standard_Boolean ZBufferAuto ();
		%feature("autodoc", "Args:
	AFlag(Standard_Boolean)

Returns:
	None

if <AFlag> is  Standard_True then the zbuffer activity  
//!	    is managed automatically.  
//!	    Default Standard_False") SetZBufferAuto;
		void SetZBufferAuto (const Standard_Boolean AFlag);
};


%feature("shadow") Visual3d_ViewManager::~Visual3d_ViewManager %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a projection.  
 
//!	TypeOfProjection		= TOP_PARALLEL  
//!	PRP : Projection Reference Point= (0.5, 0.5, 2.0)  
//!	BPD : Distance from Back Plane	= 0.0  
//!	FPD : Distance from Front Plane	= 1.0  
//!	VPD : Distance from View Plane	= 1.0  
//!	WUmin	= 0.0  
//!	WUmax	= 1.0  
//!	WVmin	= 0.0  
//!	WVmax	= 1.0") Visual3d_ViewMapping;
		 Visual3d_ViewMapping ();
		%feature("autodoc", "Args:
	AType(Visual3d_TypeOfProjection)
	PRP(Graphic3d_Vertex)
	BPD(Standard_Real)
	FPD(Standard_Real)
	VPD(Standard_Real)
	WUmin(Standard_Real)
	WVmin(Standard_Real)
	WUmax(Standard_Real)
	WVmax(Standard_Real)

Returns:
	None

Creates a projection.  
 
//!	TypeOfProjection : TOP_PERSPECTIVE  
//!			   TOP_PARALLEL  
//!	PRP : Projection Reference Point with respect to  
//!	      coordinate system VRC, defined by the  
//!	      class ViewOrientation.  
//!	BPD : Distance from Back Plane.  
//!	FPD : Distance from Front Plane.  
//!	VPD : Distance from View Plane.  
//!	These three values are with respect to VRP, according to  
//!	the N axis of the VRC coordinate system, defined by the class  
//!	ViewOrientation.  
//!	WUmin,WUmax,WVmin,WVmax : Visible part of the plane of  
//!	projection defined with respect to the UV axes of coordinate  
//!	system VRC.  
//!	   That's what allows modification of the zoom/panning.  
//!	The mapping of the visible part of the plane of projection  
//!	on the screen is done in the window.  
//!	   That's why multiple views on the same window is not allowed.  
 Warning: Raises ViewMappingDefinitionError  
//!	    if the specified window is invalid.  
//!	    if <PRP> is between the front and back planes.  
//!	    if <PRP> is positioned on the view plane.  
//!	    if the back plane is in front of the front plane.") Visual3d_ViewMapping;
		 Visual3d_ViewMapping (const Visual3d_TypeOfProjection AType,const Graphic3d_Vertex & PRP,const Standard_Real BPD,const Standard_Real FPD,const Standard_Real VPD,const Standard_Real WUmin,const Standard_Real WVmin,const Standard_Real WUmax,const Standard_Real WVmax);
		%feature("autodoc", "Args:
	BPD(Standard_Real)

Returns:
	None

Modifies the back clipping plane.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewMappingDefinitionError  
//!	    if <PRP> is between the front and back planes.  
//!	    if <PRP> is positioned on the view plane.  
//!	    if the back plane is in front of the front plane.") SetBackPlaneDistance;
		void SetBackPlaneDistance (const Standard_Real BPD);
		%feature("autodoc", "Args:
	FPD(Standard_Real)

Returns:
	None

Modifies the front clipping plane.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewMappingDefinitionError  
//!	    if <PRP> is between the front and back planes.  
//!	    if <PRP> is positioned on the view plane.  
//!	    if the back plane is in front of the front plane.") SetFrontPlaneDistance;
		void SetFrontPlaneDistance (const Standard_Real FPD);
		%feature("autodoc", "Args:
	AType(Visual3d_TypeOfProjection)

Returns:
	None

Modifies the type of projection.  
 
//!	    TypeOfProjection : TOP_PERSPECTIVE  
//!			       TOP_PARALLEL") SetProjection;
		void SetProjection (const Visual3d_TypeOfProjection AType);
		%feature("autodoc", "Args:
	PRP(Graphic3d_Vertex)

Returns:
	None

Modifies the PRP.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewMappingDefinitionError  
//!	    if <PRP> is between the front and back planes.  
//!	    if <PRP> is positioned on the view plane.") SetProjectionReferencePoint;
		void SetProjectionReferencePoint (const Graphic3d_Vertex & PRP);
		%feature("autodoc", "Args:
	VPD(Standard_Real)

Returns:
	None

Modifies the distance of the view plane of projection.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewMappingDefinitionError  
//!	    if <PRP> is positioned on the view plane.") SetViewPlaneDistance;
		void SetViewPlaneDistance (const Standard_Real VPD);
		%feature("autodoc", "Args:
	Umin(Standard_Real)
	Vmin(Standard_Real)
	Umax(Standard_Real)
	Vmax(Standard_Real)

Returns:
	None

Modifies the visible part of the projection plane.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewMappingDefinitionError if the  
//!	    specified window is invalid.") SetWindowLimit;
		void SetWindowLimit (const Standard_Real Umin,const Standard_Real Vmin,const Standard_Real Umax,const Standard_Real Vmax);
		%feature("autodoc", "Args:
	Mat(Handle_TColStd_HArray2OfReal)

Returns:
	None

Sets custom PROJECTION matrix for the OpenGl context") SetCustomProjectionMatrix;
		void SetCustomProjectionMatrix (const Handle_TColStd_HArray2OfReal & Mat);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance from the back clipping plane  
of this view mapping.") BackPlaneDistance;
		Standard_Real BackPlaneDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance from the front clipping plane  
of this view mapping.") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Visual3d_TypeOfProjection

Returns the type of projection.") Projection;
		Visual3d_TypeOfProjection Projection ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vertex

Returns the PRP.") ProjectionReferencePoint;
		Graphic3d_Vertex ProjectionReferencePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance from the projection plane.") ViewPlaneDistance;
		Standard_Real ViewPlaneDistance ();
		%feature("autodoc", "Args:
	Umin(Standard_Real)
	Vmin(Standard_Real)
	Umax(Standard_Real)
	Vmax(Standard_Real)

Returns:
	None

Returns the visible part of the projection plane.") WindowLimit;
		void WindowLimit (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns whether the custom PROJECTION matrix is used.") IsCustomMatrix;
		Standard_Boolean IsCustomMatrix ();
};


%feature("shadow") Visual3d_ViewMapping::~Visual3d_ViewMapping %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a VRC coordinate system.  
//!	    VRP		: Origin of the VRC coordinate system.  
//!			  (default value : 0.0, 0.0, 0.0)  
//!	    VPN		: Vector normal to the plane of visualisation.  
//!			  (default value : 0.0, 0.0, 1.0)  
//!	    VUP 	: Vector for which the projection in the plane  
//!			  of visualisation defines the axis V of a VRC  
//!			  coordinate system.  
//!			  (default value : 0.0, 1.0, 0.0)") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation ();
		%feature("autodoc", "Args:
	VRP(Graphic3d_Vertex)
	VPN(Graphic3d_Vector)
	VUP(Graphic3d_Vector)

Returns:
	None

Creates a VRC coordinate system.  
//!	    VRP		: Origin of the VRC coordinate system.  
//!	    VPN		: Vector normal to the plane of visualisation.  
//!	    VUP 	: Vector for which the projection in the plane  
//!			  of visualisation defines the axis V of a VRC  
//!			  coordinate system.  
//!			  This vector can be likened to the  
//!			  vertical of the observer.  
 Warning: Raises ViewOrientationDefinitionError  
//!	    if <VPN> is null.  
//!	    if <VUP> is null.  
//!	    if <VPN> and <VUP> are parallel.") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation (const Graphic3d_Vertex & VRP,const Graphic3d_Vector & VPN,const Graphic3d_Vector & VUP);
		%feature("autodoc", "Args:
	VRP(Graphic3d_Vertex)
	VPN(Graphic3d_Vector)
	Twist(Standard_Real)

Returns:
	None

Creates a VRC coordinate system.  
//!	    VRP		: Origin of VRC coordinate system.  
//!	    VPN		: Normal vector to the plane of visualisation.  
//!	    Twist 	: Angle in radians of the V axis in the VRC  
//!			  coordinate system with the projection in  
//!			  the plane of visualisation of the Zm axis  
//!			  in the model space.  
 Warning: Raises ViewOrientationDefinitionError if <VPN> is null.") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation (const Graphic3d_Vertex & VRP,const Graphic3d_Vector & VPN,const Standard_Real Twist);
		%feature("autodoc", "Args:
	VRP(Graphic3d_Vertex)
	Azim(Standard_Real)
	Inc(Standard_Real)
	Twist(Standard_Real)

Returns:
	None

Creates a VRC coordinate system.  
//!	    VRP		: Origin of the VRC coordinate system.  
//!	    Azim 	: Angle in radians of the plane of visualisation  
//!			  with the XmYm plane of the model space.  
//!	    Inc 	: Angle in radians of the plane of visualisation  
//!			  with the YmZm plane of the model space.  
//!	    Twist 	: Angle in radians of the V axis in the VRC  
//!			  coordinate system with the projection in  
//!			  the plane of visualisation of the Zm axis  
//!			  in the model space.  
 Warning: Raises ViewOrientationDefinitionError") Visual3d_ViewOrientation;
		 Visual3d_ViewOrientation (const Graphic3d_Vertex & VRP,const Standard_Real Azim,const Standard_Real Inc,const Standard_Real Twist);
		%feature("autodoc", "Args:
	VPN(Graphic3d_Vector)

Returns:
	None

Modifies the plane of visualisation  
//!	    defined by a normal vector.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewOrientationDefinitionError if <VPN> is null.") SetViewReferencePlane;
		void SetViewReferencePlane (const Graphic3d_Vector & VPN);
		%feature("autodoc", "Args:
	VRP(Graphic3d_Vertex)

Returns:
	None

Modifies the origin of the VRC coordinate system") SetViewReferencePoint;
		void SetViewReferencePoint (const Graphic3d_Vertex & VRP);
		%feature("autodoc", "Args:
	VUP(Graphic3d_Vector)

Returns:
	None

Modifies the vertical of the observer.  
 Category: Methods to modify the class definition  
 Warning: Raises ViewOrientationDefinitionError if <VUP> is null.") SetViewReferenceUp;
		void SetViewReferenceUp (const Graphic3d_Vector & VUP);
		%feature("autodoc", "Args:
	Sx(Standard_Real)
	Sy(Standard_Real)
	Sz(Standard_Real)

Returns:
	None

Sets axial scale factors of the view") SetAxialScale;
		void SetAxialScale (const Standard_Real Sx,const Standard_Real Sy,const Standard_Real Sz);
		%feature("autodoc", "Args:
	Mat(Handle_TColStd_HArray2OfReal)

Returns:
	None

Sets custom MODELVIEW matrix for the OpenGl context") SetCustomModelViewMatrix;
		void SetCustomModelViewMatrix (const Handle_TColStd_HArray2OfReal & Mat);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the angle in radians of the V axis in the VRC  
//!	    coordinate system with the projection in the plane of  
//!	    visualisation of the Zm axis in the model space.") Twist;
		Standard_Real Twist ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vector

Returns the normal to the plane of projection.") ViewReferencePlane;
		Graphic3d_Vector ViewReferencePlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vertex

Returns origin of the VRC coordinate system.") ViewReferencePoint;
		Graphic3d_Vertex ViewReferencePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_Vector

Returns the vertical of the observer.") ViewReferenceUp;
		Graphic3d_Vector ViewReferenceUp ();
		%feature("autodoc", "Args:
	Sx(Standard_Real)
	Sy(Standard_Real)
	Sz(Standard_Real)

Returns:
	None

Returns current values of the axial scale factors.") AxialScale;
		void AxialScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns whether the custom MODELVIEW matrix is used.") IsCustomMatrix;
		Standard_Boolean IsCustomMatrix ();
};


%feature("shadow") Visual3d_ViewOrientation::~Visual3d_ViewOrientation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Visual3d_ViewOrientation {
	void _kill_pointed() {
		delete $self;
	}
};
