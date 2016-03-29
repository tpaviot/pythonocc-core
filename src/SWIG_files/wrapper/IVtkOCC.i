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
%module (package="OCC") IVtkOCC

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


%include IVtkOCC_headers.i


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
typedef NCollection_List <IVtk_Polyline> IVtk_PolylineList;
typedef NCollection_Sequence <gp_Pnt> IVtk_Polyline;
typedef NCollection_DataMap <TopoDS_Shape , IVtk_MeshType , TopTools_ShapeMapHasher> IVtk_ShapeTypeMap;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor IVtkOCC_SelectableObject;
class IVtkOCC_SelectableObject : public SelectMgr_SelectableObject {
	public:
		%feature("compactdefaultargs") IVtkOCC_SelectableObject;
		%feature("autodoc", "	* Constructs a selectable object initialized by the given shape @param [in] theShape Selectable shape

	:param theShape:
	:type theShape: IVtkOCC_Shape::Handle &
	:rtype: None
") IVtkOCC_SelectableObject;
		 IVtkOCC_SelectableObject (const IVtkOCC_Shape::Handle & theShape);
		%feature("compactdefaultargs") IVtkOCC_SelectableObject;
		%feature("autodoc", "	* Constructs uninitialized selectable object. setShape() should be called later.

	:rtype: None
") IVtkOCC_SelectableObject;
		 IVtkOCC_SelectableObject ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Sets the selectable shape @param [in] theShape Selectable shape

	:param theShape:
	:type theShape: IVtkOCC_Shape::Handle &
	:rtype: None
") SetShape;
		void SetShape (const IVtkOCC_Shape::Handle & theShape);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:rtype: IVtkOCC_Shape::Handle
") GetShape;
		const IVtkOCC_Shape::Handle & GetShape ();
};


%extend IVtkOCC_SelectableObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IVtkOCC_SelectableObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IVtkOCC_SelectableObject::Handle_IVtkOCC_SelectableObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IVtkOCC_SelectableObject;
class Handle_IVtkOCC_SelectableObject : public Handle_SelectMgr_SelectableObject {

    public:
        // constructors
        Handle_IVtkOCC_SelectableObject();
        Handle_IVtkOCC_SelectableObject(const Handle_IVtkOCC_SelectableObject &aHandle);
        Handle_IVtkOCC_SelectableObject(const IVtkOCC_SelectableObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IVtkOCC_SelectableObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IVtkOCC_SelectableObject {
    IVtkOCC_SelectableObject* GetObject() {
    return (IVtkOCC_SelectableObject*)$self->Access();
    }
};

%nodefaultctor IVtkOCC_Shape;
class IVtkOCC_Shape : public IVtk_IShape {
	public:
		%feature("compactdefaultargs") IVtkOCC_Shape;
		%feature("autodoc", "	* Constructor for OCC IShape implementation

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") IVtkOCC_Shape;
		 IVtkOCC_Shape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") GetSubShapeId;
		%feature("autodoc", "	:param &:
	:type &: IVtk_IShape::Handle
	:rtype: IVtk_IdType
") GetSubShapeId;
		IVtk_IdType GetSubShapeId (const IVtk_IShape::Handle &);
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	* Get the wrapped original OCCT shape returns TopoDS_Shape the wrapped original OCCT shape

	:param GetShape(:
	:type GetShape(: IVtkOCC_Shape) TopoDS_Shape
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (IVtkOCC_Shape) TopoDS_Shape GetShape();
		%feature("compactdefaultargs") GetSubShapeId;
		%feature("autodoc", "	* @brief Get local ID of a sub-shape. //! Returns unique ID of the given sub-shape within the top-level shape. Note that the sub-shape ID remains unchanged until the top-level is modified by some operation. @param [in] subShape sub-shape whose ID is returned returns local ID of the sub-shape.

	:param theSubShape:
	:type theSubShape: TopoDS_Shape &
	:rtype: IVtk_IdType
") GetSubShapeId;
		IVtk_IdType GetSubShapeId (const TopoDS_Shape & theSubShape);
		%feature("compactdefaultargs") GetSubIds;
		%feature("autodoc", "	* Get ids of sub-shapes composing a sub-shape with the given id

	:param IVtk_IdType:
	:type IVtk_IdType: 
	:rtype: IVtk_ShapeIdList
") GetSubIds;
		IVtk_ShapeIdList GetSubIds (const IVtk_IdType);
		%feature("compactdefaultargs") GetSubShape;
		%feature("autodoc", "	* @brief Get a sub-shape by its local ID. //! @param [in] id local ID of a sub-shape returns TopoDS_Shape& a sub-shape

	:param theId:
	:type theId: IVtk_IdType
	:rtype: TopoDS_Shape
") GetSubShape;
		const TopoDS_Shape  GetSubShape (const IVtk_IdType theId);
		%feature("compactdefaultargs") SetSelectableObject;
		%feature("autodoc", "	* Stores a handle to selectable object used by OCCT selection algorithm in a data field. This object internally caches selection data so it should be stored until the shape is no longer selectable. Note that the selectable object keeps a pointer to OccShape. @param [in] selObj Handle to the selectable object

	:param theSelObj:
	:type theSelObj: Handle_SelectMgr_SelectableObject &
	:rtype: None
") SetSelectableObject;
		void SetSelectableObject (const Handle_SelectMgr_SelectableObject & theSelObj);
		%feature("compactdefaultargs") GetSelectableObject;
		%feature("autodoc", "	* returns Handle to the selectable object for this shape.

	:rtype: Handle_SelectMgr_SelectableObject
") GetSelectableObject;
		Handle_SelectMgr_SelectableObject GetSelectableObject ();
};


%extend IVtkOCC_Shape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IVtkOCC_Shape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IVtkOCC_Shape::Handle_IVtkOCC_Shape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IVtkOCC_Shape;
class Handle_IVtkOCC_Shape : public Handle_IVtk_IShape {

    public:
        // constructors
        Handle_IVtkOCC_Shape();
        Handle_IVtkOCC_Shape(const Handle_IVtkOCC_Shape &aHandle);
        Handle_IVtkOCC_Shape(const IVtkOCC_Shape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IVtkOCC_Shape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IVtkOCC_Shape {
    IVtkOCC_Shape* GetObject() {
    return (IVtkOCC_Shape*)$self->Access();
    }
};

%nodefaultctor IVtkOCC_ShapeMesher;
class IVtkOCC_ShapeMesher : public IVtk_IShapeMesher {
	public:
		%feature("compactdefaultargs") IVtkOCC_ShapeMesher;
		%feature("autodoc", "	:param theDevCoeff: default value is 0.0001
	:type theDevCoeff: float &
	:param theDevAngle: default value is 12.0*M_PI/180.0
	:type theDevAngle: float &
	:param theNbUIsos: default value is 1
	:type theNbUIsos: int
	:param theNbVIsos: default value is 1
	:type theNbVIsos: int
	:rtype: None
") IVtkOCC_ShapeMesher;
		 IVtkOCC_ShapeMesher (const Standard_Real & theDevCoeff = 0.0001,const Standard_Real & theDevAngle = 12.0*M_PI/180.0,const Standard_Integer theNbUIsos = 1,const Standard_Integer theNbVIsos = 1);
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "	* Returns absolute deflection used by this algorithm. This value is calculated on the basis of the shape's bounding box. Zero might be returned in case if the underlying OCCT shape is empty or invalid. Thus check the returned value before passing it to OCCT meshing algorithms! returns absolute deflection value

	:rtype: float
") GetDeflection;
		Standard_Real GetDeflection ();
		%feature("compactdefaultargs") GetDeviationCoeff;
		%feature("autodoc", "	* Returns relative deviation coefficient used by this algorithm. returns relative deviation coefficient

	:rtype: float
") GetDeviationCoeff;
		Standard_Real GetDeviationCoeff ();
		%feature("compactdefaultargs") GetDeviationAngle;
		%feature("autodoc", "	* Returns deviation angle used by this algorithm. This is the maximum allowed angle between the normals to the curve/surface and the normals to polyline/faceted representation. returns deviation angle (in radians)

	:rtype: float
") GetDeviationAngle;
		Standard_Real GetDeviationAngle ();
};


%extend IVtkOCC_ShapeMesher {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IVtkOCC_ShapeMesher(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IVtkOCC_ShapeMesher::Handle_IVtkOCC_ShapeMesher %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IVtkOCC_ShapeMesher;
class Handle_IVtkOCC_ShapeMesher : public Handle_IVtk_IShapeMesher {

    public:
        // constructors
        Handle_IVtkOCC_ShapeMesher();
        Handle_IVtkOCC_ShapeMesher(const Handle_IVtkOCC_ShapeMesher &aHandle);
        Handle_IVtkOCC_ShapeMesher(const IVtkOCC_ShapeMesher *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IVtkOCC_ShapeMesher DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IVtkOCC_ShapeMesher {
    IVtkOCC_ShapeMesher* GetObject() {
    return (IVtkOCC_ShapeMesher*)$self->Access();
    }
};

%nodefaultctor IVtkOCC_ShapePickerAlgo;
class IVtkOCC_ShapePickerAlgo : public IVtk_IShapePickerAlgo {
	public:
		%feature("compactdefaultargs") IVtkOCC_ShapePickerAlgo;
		%feature("autodoc", "	* Constructor

	:rtype: None
") IVtkOCC_ShapePickerAlgo;
		 IVtkOCC_ShapePickerAlgo ();
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "	* Sets the picker's view interface. The picker uses the view to obtain parameters of the 3D view projection.

	:param theView:
	:type theView: IVtk_IView::Handle &
	:rtype: void
") SetView;
		virtual void SetView (const IVtk_IView::Handle & theView);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Informs the picker that some parameters of the view has been modified so it is necessary to recompute internal selection data. It makes sense to call this method automatically as soon as the underlying VTK object emits its ModifiedEvent.

	:rtype: void
") Modified;
		virtual void Modified ();
		%feature("compactdefaultargs") NbPicked;
		%feature("autodoc", "	* Get number of picked entities.

	:rtype: int
") NbPicked;
		virtual int NbPicked ();
		%feature("compactdefaultargs") GetSelectionModes;
		%feature("autodoc", "	* Get activated selection modes for a shape. @param [in] theShape a shape with activated selection mode(s) returns list of active selection modes

	:param theShape:
	:type theShape: IVtk_IShape::Handle &
	:rtype: IVtk_SelectionModeList
") GetSelectionModes;
		virtual IVtk_SelectionModeList GetSelectionModes (const IVtk_IShape::Handle & theShape);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* @name Set selectable shapes and selection modes Activates/deactivates the given selection mode for the shape. If mode == SM_None, the shape becomes non-selectable and is removed from the internal selection data. @param [in] theShape Shape for which the selection mode should be activated @param [in] theMode Selection mode to be activated @param [in] theIsTurnOn Flag to turn on/off the selection mode

	:param theShape:
	:type theShape: IVtk_IShape::Handle &
	:param theMode:
	:type theMode: IVtk_SelectionMode
	:param theIsTurnOn: default value is true
	:type theIsTurnOn: bool
	:rtype: void
") SetSelectionMode;
		virtual void SetSelectionMode (const IVtk_IShape::Handle & theShape,const IVtk_SelectionMode theMode,const bool theIsTurnOn = true);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* Activates/deactivates the given selection mode for the shape. If mode == SM_None, the shape becomes non-selectable and is removed from the internal selection data. @param [in] theShapes List of shapes for which the selection mode should be activated @param [in] theMode Selection mode to be activated @param [in] theIsTurnOn Flag to turn on/off the selection mode

	:param theShapes:
	:type theShapes: IVtk_ShapePtrList &
	:param theMode:
	:type theMode: IVtk_SelectionMode
	:param theIsTurnOn: default value is true
	:type theIsTurnOn: bool
	:rtype: void
") SetSelectionMode;
		virtual void SetSelectionMode (const IVtk_ShapePtrList & theShapes,const IVtk_SelectionMode theMode,const bool theIsTurnOn = true);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* @name Picking methods

	:param theX:
	:type theX: double
	:param theY:
	:type theY: double
	:rtype: bool
") Pick;
		virtual bool Pick (const double theX,const double theY);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	:param theXMin:
	:type theXMin: double
	:param theYMin:
	:type theYMin: double
	:param theXMax:
	:type theXMax: double
	:param theYMax:
	:type theYMax: double
	:rtype: bool
") Pick;
		virtual bool Pick (const double theXMin,const double theYMin,const double theXMax,const double theYMax);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	:param thePolyLine:
	:type thePolyLine: double * *
	:param theNbPoints:
	:type theNbPoints: int
	:rtype: bool
") Pick;
		virtual bool Pick (double * * thePolyLine,const int theNbPoints);
		%feature("compactdefaultargs") ShapesPicked;
		%feature("autodoc", "	* @name Obtain picking results returns the list of picked top-level shape IDs, in the order of increasing depth (the ID of the shape closest to the eye is the first in the list)

	:rtype: IVtk_ShapeIdList
") ShapesPicked;
		virtual const IVtk_ShapeIdList & ShapesPicked ();
		%feature("compactdefaultargs") SubShapesPicked;
		%feature("autodoc", "	* @param [in] theId Top-level shape ID @param [out] theShapeList the list of picked sub-shape IDs for the given top-level shape ID, in the order of increasing depth (the ID of the sub-shape closest to the eye is the first in the list)

	:param theId:
	:type theId: IVtk_IdType
	:param theShapeList:
	:type theShapeList: IVtk_ShapeIdList &
	:rtype: void
") SubShapesPicked;
		virtual void SubShapesPicked (const IVtk_IdType theId,IVtk_ShapeIdList & theShapeList);
};


%extend IVtkOCC_ShapePickerAlgo {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IVtkOCC_ShapePickerAlgo(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IVtkOCC_ShapePickerAlgo::Handle_IVtkOCC_ShapePickerAlgo %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IVtkOCC_ShapePickerAlgo;
class Handle_IVtkOCC_ShapePickerAlgo : public Handle_IVtk_IShapePickerAlgo {

    public:
        // constructors
        Handle_IVtkOCC_ShapePickerAlgo();
        Handle_IVtkOCC_ShapePickerAlgo(const Handle_IVtkOCC_ShapePickerAlgo &aHandle);
        Handle_IVtkOCC_ShapePickerAlgo(const IVtkOCC_ShapePickerAlgo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IVtkOCC_ShapePickerAlgo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IVtkOCC_ShapePickerAlgo {
    IVtkOCC_ShapePickerAlgo* GetObject() {
    return (IVtkOCC_ShapePickerAlgo*)$self->Access();
    }
};

%nodefaultctor IVtkOCC_ViewerSelector;
class IVtkOCC_ViewerSelector : public SelectMgr_ViewerSelector {
	public:
		%feature("compactdefaultargs") IVtkOCC_ViewerSelector;
		%feature("autodoc", "	:rtype: None
") IVtkOCC_ViewerSelector;
		 IVtkOCC_ViewerSelector ();
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Projects all sensitive entities from the given selection container to 2D space param [in] theSelection Container with sensitive entities to project

	:param theSelection:
	:type theSelection: Handle_SelectMgr_Selection &
	:rtype: None
") Convert;
		void Convert (const Handle_SelectMgr_Selection & theSelection);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* Implements point picking @param [in] theXPix, theYPix Display coordinates of the point @param [in] theView ICamera interface to update the projection parameters.

	:param theXPix:
	:type theXPix: int
	:param theYPix:
	:type theYPix: int
	:param theView:
	:type theView: IVtk_IView::Handle &
	:rtype: None
") Pick;
		void Pick (const Standard_Integer theXPix,const Standard_Integer theYPix,const IVtk_IView::Handle & theView);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* Picking by rectangle @param [in] theXMin, theYMin, theXMax, theYMax Rectangle coords @param [in] theView ICamera interface to calculate projections

	:param theXMin:
	:type theXMin: int
	:param theYMin:
	:type theYMin: int
	:param theXMax:
	:type theXMax: int
	:param theYMax:
	:type theYMax: int
	:param theView:
	:type theView: IVtk_IView::Handle &
	:rtype: None
") Pick;
		void Pick (const Standard_Integer theXMin,const Standard_Integer theYMin,const Standard_Integer theXMax,const Standard_Integer theYMax,const IVtk_IView::Handle & theView);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* Implements point picking

	:param thePoly:
	:type thePoly: double * *
	:param theNbPoints:
	:type theNbPoints: int
	:param theView:
	:type theView: IVtk_IView::Handle &
	:rtype: None
") Pick;
		void Pick (double * * thePoly,const int theNbPoints,const IVtk_IView::Handle & theView);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the given selection

	:param theSelection:
	:type theSelection: Handle_SelectMgr_Selection &
	:param isAutomaticProj: default value is Standard_True
	:type isAutomaticProj: bool
	:rtype: None
") Activate;
		void Activate (const Handle_SelectMgr_Selection & theSelection,const Standard_Boolean isAutomaticProj = Standard_True);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivate the given selection

	:param theSelection:
	:type theSelection: Handle_SelectMgr_Selection &
	:rtype: None
") Deactivate;
		void Deactivate (const Handle_SelectMgr_Selection & theSelection);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Checks if some projection parameters have changed, and updates the 2D projections of all sensitive entities if necessary. @param [in] theView Interface to VTK renderer to access projection parameters

	:param theView:
	:type theView: IVtk_IView::Handle &
	:rtype: bool
") Update;
		Standard_Boolean Update (const IVtk_IView::Handle & theView);
		%feature("compactdefaultargs") PickingLine;
		%feature("autodoc", "	* Returns picking line. @param theX direction X. @param theX direction Y. returns picking direction.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:rtype: gp_Lin
") PickingLine;
		gp_Lin PickingLine (const Standard_Real theX,const Standard_Real theY);
};


%extend IVtkOCC_ViewerSelector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IVtkOCC_ViewerSelector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IVtkOCC_ViewerSelector::Handle_IVtkOCC_ViewerSelector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IVtkOCC_ViewerSelector;
class Handle_IVtkOCC_ViewerSelector : public Handle_SelectMgr_ViewerSelector {

    public:
        // constructors
        Handle_IVtkOCC_ViewerSelector();
        Handle_IVtkOCC_ViewerSelector(const Handle_IVtkOCC_ViewerSelector &aHandle);
        Handle_IVtkOCC_ViewerSelector(const IVtkOCC_ViewerSelector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IVtkOCC_ViewerSelector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IVtkOCC_ViewerSelector {
    IVtkOCC_ViewerSelector* GetObject() {
    return (IVtkOCC_ViewerSelector*)$self->Access();
    }
};

