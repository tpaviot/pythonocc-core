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
%module (package="OCC") IVtkTools

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


%include IVtkTools_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor IVtkTools_ShapeDataSource;
class IVtkTools_ShapeDataSource : public vtkPolyDataAlgorithm {
	public:
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "	:param :
	:type : IVtkTools_ShapeDataSource
	:param :
	:type : vtkPolyDataAlgorithm
	:rtype: None
") vtkTypeMacro;
		 vtkTypeMacro (IVtkTools_ShapeDataSource ,vtkPolyDataAlgorithm );
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	:rtype: IVtkTools_ShapeDataSource *
") New;
		static IVtkTools_ShapeDataSource * New ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* @name Initialization Set the source OCCT shape. @param theOccShape [in] OCCT shape wrapper.

	:param theOccShape:
	:type theOccShape: IVtkOCC_Shape::Handle &
	:rtype: None
") SetShape;
		void SetShape (const IVtkOCC_Shape::Handle & theOccShape);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	* Get the source OCCT shape. returns occShape OCCT shape wrapper.

	:rtype: IVtkOCC_Shape::Handle
") GetShape;
		IVtkOCC_Shape::Handle GetShape ();
		%feature("compactdefaultargs") FastTransformModeOn;
		%feature("autodoc", "	:rtype: inline void
") FastTransformModeOn;
		inline void FastTransformModeOn ();
		%feature("compactdefaultargs") FastTransformModeOff;
		%feature("autodoc", "	:rtype: inline void
") FastTransformModeOff;
		inline void FastTransformModeOff ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* @name Data accessors Returns ID of the shape used as a topological input for this data source. returns requested ID.

	:rtype: IVtk_IdType
") GetId;
		IVtk_IdType GetId ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Checks if the internal OccShape pointer is the same the argument. @param [in] shape OccShape pointer to be checked. returns true if the two OccShape instances are the same, and false otherwise.

	:param theOccShape:
	:type theOccShape: IVtkOCC_Shape::Handle &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const IVtkOCC_Shape::Handle & theOccShape);
		%feature("compactdefaultargs") SubShapeIDs;
		%feature("autodoc", "	* Access to the shape's sub-shape ids array returnss the array cast to vtkIdTypeArray

	:rtype: vtkSmartPointer<vtkIdTypeArray>
") SubShapeIDs;
		vtkSmartPointer<vtkIdTypeArray> SubShapeIDs ();
};


%nodefaultctor IVtkTools_ShapeObject;
class IVtkTools_ShapeObject : public vtkDataObject {
	public:
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "	:param :
	:type : IVtkTools_ShapeObject
	:param :
	:type : vtkObject
	:rtype: None
") vtkTypeMacro;
		 vtkTypeMacro (IVtkTools_ShapeObject ,vtkObject );
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	:rtype: IVtkTools_ShapeObject *
") New;
		static IVtkTools_ShapeObject * New ();
		%feature("compactdefaultargs") GetShapeSource;
		%feature("autodoc", "	* Get OCC shape source from VTK data from actor's information object by key.

	:param theActor:
	:type theActor: vtkActor *
	:rtype: IVtkTools_ShapeDataSource *
") GetShapeSource;
		static IVtkTools_ShapeDataSource * GetShapeSource (vtkActor * theActor);
		%feature("compactdefaultargs") GetOccShape;
		%feature("autodoc", "	* Get OCC shape from VTK data from actor's information object by key.

	:param theActor:
	:type theActor: vtkActor *
	:rtype: IVtkOCC_Shape::Handle
") GetOccShape;
		static IVtkOCC_Shape::Handle GetOccShape (vtkActor * theActor);
		%feature("compactdefaultargs") SetShapeSource;
		%feature("autodoc", "	* Static method to set OCC shape source to VTK dataset in information object with key.

	:param theDataSource:
	:type theDataSource: IVtkTools_ShapeDataSource *
	:param theData:
	:type theData: vtkDataSet *
	:rtype: void
") SetShapeSource;
		static void SetShapeSource (IVtkTools_ShapeDataSource * theDataSource,vtkDataSet * theData);
		%feature("compactdefaultargs") SetShapeSource;
		%feature("autodoc", "	* Static method to set OCC shape source to VTK actor in information object with key.

	:param theDataSource:
	:type theDataSource: IVtkTools_ShapeDataSource *
	:param theActor:
	:type theActor: vtkActor *
	:rtype: void
") SetShapeSource;
		static void SetShapeSource (IVtkTools_ShapeDataSource * theDataSource,vtkActor * theActor);
		%feature("compactdefaultargs") getKey;
		%feature("autodoc", "	* Static method used by shape selection logic in order to establish a connection from vtkActor to OccShape instance. returns vtkInformationKey for retrieving OccShape instance from the actor

	:rtype: KeyPtr
") getKey;
		static KeyPtr getKey ();
		%feature("compactdefaultargs") SetShapeSource;
		%feature("autodoc", "	* OCC shape source setter.

	:param theDataSource:
	:type theDataSource: IVtkTools_ShapeDataSource *
	:rtype: None
") SetShapeSource;
		void SetShapeSource (IVtkTools_ShapeDataSource * theDataSource);
		%feature("compactdefaultargs") GetShapeSource;
		%feature("autodoc", "	* OCC shape source getter.

	:rtype: IVtkTools_ShapeDataSource *
") GetShapeSource;
		IVtkTools_ShapeDataSource * GetShapeSource ();
};


%nodefaultctor IVtkTools_ShapePicker;
class IVtkTools_ShapePicker : public vtkAbstractPropPicker {
	public:
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "	:param :
	:type : IVtkTools_ShapePicker
	:param :
	:type : vtkAbstractPropPicker
	:rtype: None
") vtkTypeMacro;
		 vtkTypeMacro (IVtkTools_ShapePicker ,vtkAbstractPropPicker );
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	:rtype: IVtkTools_ShapePicker *
") New;
		static IVtkTools_ShapePicker * New ();
		%feature("compactdefaultargs") pick;
		%feature("autodoc", "	* Pick entities in the given point or area. returns Number of detected entities.

	:param thePos:
	:type thePos: double *
	:param theRenderer:
	:type theRenderer: vtkRenderer *
	:param theNbPoints: default value is -1
	:type theNbPoints: int
	:rtype: int
") pick;
		int pick (double * thePos,vtkRenderer * theRenderer,const int theNbPoints = -1);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* Pick entities in the given point. returns Number of detected entities.

	:param theX:
	:type theX: double
	:param theY:
	:type theY: double
	:param theZ:
	:type theZ: double
	:param theRenderer: default value is NULL
	:type theRenderer: vtkRenderer *
	:rtype: int
") Pick;
		int Pick (double theX,double theY,double theZ,vtkRenderer * theRenderer = NULL);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* Pick entities in the given rectangle area. returns Number of detected entities.

	:param theX0:
	:type theX0: double
	:param theY0:
	:type theY0: double
	:param theX1:
	:type theX1: double
	:param theY1:
	:type theY1: double
	:param theRenderer: default value is NULL
	:type theRenderer: vtkRenderer *
	:rtype: int
") Pick;
		int Pick (double theX0,double theY0,double theX1,double theY1,vtkRenderer * theRenderer = NULL);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* Pick entities in the given polygonal area. returns Number of detected entities.

	:param poly:
	:type poly: double
	:param theNbPoints:
	:type theNbPoints: int
	:param theRenderer: default value is NULL
	:type theRenderer: vtkRenderer *
	:rtype: int
") Pick;
		int Pick (double poly,const int theNbPoints,vtkRenderer * theRenderer = NULL);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Setter for tolerance of picking.

	:param theTolerance:
	:type theTolerance: float
	:rtype: None
") SetTolerance;
		void SetTolerance (float theTolerance);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Getter for tolerance of picking.

	:rtype: float
") GetTolerance;
		float GetTolerance ();
		%feature("compactdefaultargs") SetRenderer;
		%feature("autodoc", "	* Sets the renderer to be used by OCCT selection algorithm

	:param theRenderer:
	:type theRenderer: vtkRenderer *
	:rtype: None
") SetRenderer;
		void SetRenderer (vtkRenderer * theRenderer);
		%feature("compactdefaultargs") SetAreaSelection;
		%feature("autodoc", "	* Sets area selection on/off @param [in] theIsOn true if area selection is turned on, false otherwise.

	:param theIsOn:
	:type theIsOn: bool
	:rtype: None
") SetAreaSelection;
		void SetAreaSelection (bool theIsOn);
		%feature("compactdefaultargs") GetSelectionModes;
		%feature("autodoc", "	* Get activated selection modes for a shape. @param [in] theShape a shape with activated selection mode(s) returns list of active selection modes

	:param theShape:
	:type theShape: IVtk_IShape::Handle &
	:rtype: IVtk_SelectionModeList
") GetSelectionModes;
		IVtk_SelectionModeList GetSelectionModes (const IVtk_IShape::Handle & theShape);
		%feature("compactdefaultargs") GetSelectionModes;
		%feature("autodoc", "	* Get activated selection modes for a shape actor. @param [in] theShapeActor an actor with activated selection mode(s) returns list of active selection modes

	:param theShapeActor:
	:type theShapeActor: vtkActor *
	:rtype: IVtk_SelectionModeList
") GetSelectionModes;
		IVtk_SelectionModeList GetSelectionModes (vtkActor * theShapeActor);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* Turn on/off a selection mode for a shape actor. @param [in] theShape a shape to set a selection mode for @param [in] theMode selection mode to be activated @param [in] theIsTurnOn Flag to turn on/off the selection mode

	:param theShape:
	:type theShape: IVtk_IShape::Handle &
	:param theMode:
	:type theMode: IVtk_SelectionMode
	:param theIsTurnOn: default value is true
	:type theIsTurnOn: bool
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (const IVtk_IShape::Handle & theShape,const IVtk_SelectionMode theMode,const bool theIsTurnOn = true);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* Turn on/off a selection mode for a shape actor. @param [in] shapeActor shape presentation actor to set a selection mode for @param [in] mode selection mode to be activated @param [in] turnOn Flag to turn on/off the selection mode

	:param theShapeActor:
	:type theShapeActor: vtkActor *
	:param theMode:
	:type theMode: IVtk_SelectionMode
	:param theIsTurnOn: default value is true
	:type theIsTurnOn: bool
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (vtkActor * theShapeActor,const IVtk_SelectionMode theMode,const bool theIsTurnOn = true);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* Sets the current selection mode for all visible shape objects. @param [in] theMode selection mode to be activated @param [in] theIsTurnOn Flag to turn on/off the selection mode

	:param theMode:
	:type theMode: IVtk_SelectionMode
	:param theIsTurnOn: default value is true
	:type theIsTurnOn: bool
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (const IVtk_SelectionMode theMode,const bool theIsTurnOn = true);
		%feature("compactdefaultargs") GetPickedShapesIds;
		%feature("autodoc", "	* Access to the list of top-level shapes picked. If all argument is true, the picker returns the list of all OccShape objects found by the picking algorithm. e.g. all shapes under the mouse cursor. Otherwise, ID of the shape closest to the eye is returned. @param [in] all Controls if all selected shapes or just the only top one is returned, has no effect during area selection. returns List of top-level shape IDs

	:param theIsAll: default value is false
	:type theIsAll: bool
	:rtype: IVtk_ShapeIdList
") GetPickedShapesIds;
		IVtk_ShapeIdList GetPickedShapesIds (bool theIsAll = false);
		%feature("compactdefaultargs") GetPickedSubShapesIds;
		%feature("autodoc", "	* Access to the list of sub-shapes ids picked. @param [in] id top-level shape ID @param [in] all Controls if all selected sub-shapes or just the only top one is returned, has no effect during area selection. returns List of sub-shapes IDs

	:param theId:
	:type theId: IVtk_IdType
	:param theIsAll: default value is false
	:type theIsAll: bool
	:rtype: IVtk_ShapeIdList
") GetPickedSubShapesIds;
		IVtk_ShapeIdList GetPickedSubShapesIds (const IVtk_IdType theId,bool theIsAll = false);
		%feature("compactdefaultargs") GetPickedActors;
		%feature("autodoc", "	* Access to the list of actors picked. @param [in] all Controls if all selected actors or just the only top one is returned, has no effect during area selection. returns List of actors IDs

	:param theIsAll: default value is false
	:type theIsAll: bool
	:rtype: vtkActorCollection *
") GetPickedActors;
		vtkActorCollection * GetPickedActors (bool theIsAll = false);
};


%nodefaultctor IVtkTools_SubPolyDataFilter;
class IVtkTools_SubPolyDataFilter : public vtkPolyDataAlgorithm {
	public:
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "	:param :
	:type : IVtkTools_SubPolyDataFilter
	:param :
	:type : vtkPolyDataAlgorithm
	:rtype: None
") vtkTypeMacro;
		 vtkTypeMacro (IVtkTools_SubPolyDataFilter ,vtkPolyDataAlgorithm );
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	:rtype: IVtkTools_SubPolyDataFilter *
") New;
		static IVtkTools_SubPolyDataFilter * New ();
		%feature("compactdefaultargs") PrintSelf;
		%feature("autodoc", "	:param theOs:
	:type theOs: std::ostream &
	:param theIndent:
	:type theIndent: vtkIndent
	:rtype: None
") PrintSelf;
		void PrintSelf (std::ostream & theOs,vtkIndent theIndent);
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	* Set ids to be passed through this filter.

	:param theSet:
	:type theSet: IVtk_IdTypeMap
	:rtype: None
") SetData;
		void SetData (const IVtk_IdTypeMap theSet);
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "	* Add ids to be passed through this filter.

	:param theSet:
	:type theSet: IVtk_IdTypeMap
	:rtype: None
") AddData;
		void AddData (const IVtk_IdTypeMap theSet);
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	* Set ids to be passed through this filter.

	:param theIds:
	:type theIds: IVtk_ShapeIdList
	:rtype: None
") SetData;
		void SetData (const IVtk_ShapeIdList theIds);
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "	* Add ids to be passed through this filter.

	:param theIds:
	:type theIds: IVtk_ShapeIdList
	:rtype: None
") AddData;
		void AddData (const IVtk_ShapeIdList theIds);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear ids set to be passed through this filter.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetIdsArrayName;
		%feature("autodoc", "	* Set ids array name.

	:param theArrayName:
	:type theArrayName: char *
	:rtype: None
") SetIdsArrayName;
		void SetIdsArrayName (const char * theArrayName);
		%feature("compactdefaultargs") SetDoFiltering;
		%feature("autodoc", "	:param theDoFiltering:
	:type theDoFiltering: bool
	:rtype: None
") SetDoFiltering;
		void SetDoFiltering (const bool theDoFiltering);
};


%nodefaultctor IVtkTools_DisplayModeFilter;
class IVtkTools_DisplayModeFilter : public IVtkTools_SubPolyDataFilter {
	public:
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "	:param :
	:type : IVtkTools_DisplayModeFilter
	:param :
	:type : IVtkTools_SubPolyDataFilter
	:rtype: None
") vtkTypeMacro;
		 vtkTypeMacro (IVtkTools_DisplayModeFilter ,IVtkTools_SubPolyDataFilter );
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	:rtype: IVtkTools_DisplayModeFilter *
") New;
		static IVtkTools_DisplayModeFilter * New ();
		%feature("compactdefaultargs") PrintSelf;
		%feature("autodoc", "	:param os:
	:type os: std::ostream &
	:param indent:
	:type indent: vtkIndent
	:rtype: None
") PrintSelf;
		void PrintSelf (std::ostream & os,vtkIndent indent);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Set display mode to define cells types to be passed through this filter.

	:param aMode:
	:type aMode: IVtk_DisplayMode
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const IVtk_DisplayMode aMode);
		%feature("compactdefaultargs") SetDisplaySharedVertices;
		%feature("autodoc", "	* Display or not shared vertices.

	:param doDisplay:
	:type doDisplay: bool
	:rtype: None
") SetDisplaySharedVertices;
		void SetDisplaySharedVertices (const bool doDisplay);
		%feature("compactdefaultargs") GetDisplayMode;
		%feature("autodoc", "	* Get current display mode.

	:rtype: IVtk_DisplayMode
") GetDisplayMode;
		const IVtk_DisplayMode GetDisplayMode ();
};


