/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define IVTKTOOLSDOCSTRING
"IVtkTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_ivtktools.html"
%enddef
%module (package="OCC.Core", docstring=IVTKTOOLSDOCSTRING) IVtkTools


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<IVtkTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IVtkOCC_module.hxx>
#include<IVtk_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IVtkOCC.i
%import IVtk.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************************
* class IVtkTools_ShapeDataSource *
**********************************/
%nodefaultctor IVtkTools_ShapeDataSource;
%ignore IVtkTools_ShapeDataSource::~IVtkTools_ShapeDataSource();
class IVtkTools_ShapeDataSource : public vtkPolyDataAlgorithm {
	public:
		/****************** vtkTypeMacro ******************/
		/**** md5 signature: 99fc4a1b5484ef6bf8c2e7e9c52402ee ****/
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "No available documentation.

Parameters
----------
: IVtkTools_ShapeDataSource
New(: vtkPolyDataAlgorithm) static IVtkTools_ShapeDataSource *

Returns
-------
None
") vtkTypeMacro;
		 vtkTypeMacro(IVtkTools_ShapeDataSource , vtkPolyDataAlgorithm) static IVtkTools_ShapeDataSource * New();

		/****************** Contains ******************/
		/**** md5 signature: 05ace343f570281f10fc6d294aacf6d3 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Checks if the internal occshape pointer is the same the argument. @param [in] shape occshape pointer to be checked. returns true if the two occshape instances are the same, and false otherwise.

Parameters
----------
theOccShape: IVtkOCC_Shape::Handle

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const IVtkOCC_Shape::Handle & theOccShape);

		/****************** FastTransformModeOff ******************/
		/**** md5 signature: 75a5185f210e81cb4ace46e3bbe72859 ****/
		%feature("compactdefaultargs") FastTransformModeOff;
		%feature("autodoc", "No available documentation.

Returns
-------
inline void
") FastTransformModeOff;
		inline void FastTransformModeOff();

		/****************** FastTransformModeOn ******************/
		/**** md5 signature: 9630a5ca95bb772fe4641db59f771ca9 ****/
		%feature("compactdefaultargs") FastTransformModeOn;
		%feature("autodoc", "No available documentation.

Returns
-------
inline void
") FastTransformModeOn;
		inline void FastTransformModeOn();

		/****************** GetId ******************/
		/**** md5 signature: f0a6cd08fb1b6930c65d2329a0da5ec9 ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "@name data accessors returns id of the shape used as a topological input for this data source. returns requested id.

Returns
-------
IVtk_IdType
") GetId;
		IVtk_IdType GetId();

		/****************** GetShape ******************/
		/**** md5 signature: 3d3ca5e2a3725ee018994ff953e947dd ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Get the source occt shape. returns occshape occt shape wrapper.

Returns
-------
IVtkOCC_Shape::Handle
") GetShape;
		const IVtkOCC_Shape::Handle & GetShape();

		/****************** SetShape ******************/
		/**** md5 signature: 829d0b8121ad35f9095657b9a786b388 ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "@name initialization set the source occt shape. @param theoccshape [in] occt shape wrapper.

Parameters
----------
theOccShape: IVtkOCC_Shape::Handle

Returns
-------
None
") SetShape;
		void SetShape(const IVtkOCC_Shape::Handle & theOccShape);

		/****************** SubShapeIDs ******************/
		/**** md5 signature: ecf7f16df643cb50cf16d51d22696f69 ****/
		%feature("compactdefaultargs") SubShapeIDs;
		%feature("autodoc", "Access to the shape's sub-shape ids array returnss the array cast to vtkidtypearray.

Returns
-------
vtkSmartPointer<vtkIdTypeArray>
") SubShapeIDs;
		vtkSmartPointer<vtkIdTypeArray> SubShapeIDs();

};


%extend IVtkTools_ShapeDataSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IVtkTools_ShapeObject *
******************************/
%nodefaultctor IVtkTools_ShapeObject;
%ignore IVtkTools_ShapeObject::~IVtkTools_ShapeObject();
class IVtkTools_ShapeObject : public vtkDataObject {
	public:
typedef vtkInformationObjectBaseKey * KeyPtr;
		/****************** vtkTypeMacro ******************/
		/**** md5 signature: c4e0c28581aaa737e669cf8b83e1cfb2 ****/
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "No available documentation.

Parameters
----------
: IVtkTools_ShapeObject
New(: vtkDataObject) static IVtkTools_ShapeObject *

Returns
-------
None
") vtkTypeMacro;
		 vtkTypeMacro(IVtkTools_ShapeObject , vtkDataObject) static IVtkTools_ShapeObject * New();

		/****************** GetOccShape ******************/
		/**** md5 signature: b2b39499ff485982f1b8e50b9ff6074d ****/
		%feature("compactdefaultargs") GetOccShape;
		%feature("autodoc", "Get occ shape from vtk data from actor's information object by key.

Parameters
----------
theActor: vtkActor *

Returns
-------
IVtkOCC_Shape::Handle
") GetOccShape;
		static IVtkOCC_Shape::Handle GetOccShape(vtkActor * theActor);

		/****************** GetShapeSource ******************/
		/**** md5 signature: 0328dcbc8b178d6b43ef51bd78deae3f ****/
		%feature("compactdefaultargs") GetShapeSource;
		%feature("autodoc", "Get occ shape source from vtk data from actor's information object by key.

Parameters
----------
theActor: vtkActor *

Returns
-------
vtkSmartPointer<IVtkTools_ShapeDataSource>
") GetShapeSource;
		static vtkSmartPointer<IVtkTools_ShapeDataSource> GetShapeSource(vtkActor * theActor);

		/****************** GetShapeSource ******************/
		/**** md5 signature: e8a398cfccbecd87b13859d7a9e3d1f4 ****/
		%feature("compactdefaultargs") GetShapeSource;
		%feature("autodoc", "Occ shape source getter.

Returns
-------
IVtkTools_ShapeDataSource *
") GetShapeSource;
		IVtkTools_ShapeDataSource * GetShapeSource();

		/****************** SetShapeSource ******************/
		/**** md5 signature: 05e12e29cf22bb8891963582262ed762 ****/
		%feature("compactdefaultargs") SetShapeSource;
		%feature("autodoc", "Static method to set occ shape source to vtk dataset in information object with key.

Parameters
----------
theDataSource: IVtkTools_ShapeDataSource *
theData: vtkDataSet *

Returns
-------
void
") SetShapeSource;
		static void SetShapeSource(IVtkTools_ShapeDataSource * theDataSource, vtkDataSet * theData);

		/****************** SetShapeSource ******************/
		/**** md5 signature: 71994c4cc82cff424a5a950b6954cbd8 ****/
		%feature("compactdefaultargs") SetShapeSource;
		%feature("autodoc", "Static method to set occ shape source to vtk actor in information object with key.

Parameters
----------
theDataSource: IVtkTools_ShapeDataSource *
theActor: vtkActor *

Returns
-------
void
") SetShapeSource;
		static void SetShapeSource(IVtkTools_ShapeDataSource * theDataSource, vtkActor * theActor);

		/****************** SetShapeSource ******************/
		/**** md5 signature: 028a65ee5ebaa821efa0a277c4b82ca6 ****/
		%feature("compactdefaultargs") SetShapeSource;
		%feature("autodoc", "Occ shape source setter.

Parameters
----------
theDataSource: IVtkTools_ShapeDataSource *

Returns
-------
None
") SetShapeSource;
		void SetShapeSource(IVtkTools_ShapeDataSource * theDataSource);

		/****************** getKey ******************/
		/**** md5 signature: dd3d583dfb8a1138fc45c1dd7175b061 ****/
		%feature("compactdefaultargs") getKey;
		%feature("autodoc", "Static method used by shape selection logic in order to establish a connection from vtkactor to occshape instance. returns vtkinformationkey for retrieving occshape instance from the actor.

Returns
-------
KeyPtr
") getKey;
		static KeyPtr getKey();

};


%extend IVtkTools_ShapeObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IVtkTools_ShapePicker *
******************************/
%nodefaultctor IVtkTools_ShapePicker;
%ignore IVtkTools_ShapePicker::~IVtkTools_ShapePicker();
class IVtkTools_ShapePicker : public vtkAbstractPropPicker {
	public:
		/****************** vtkTypeMacro ******************/
		/**** md5 signature: 4a76478f40f0f781eac3c7ed6ec365f8 ****/
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "No available documentation.

Parameters
----------
: IVtkTools_ShapePicker
New(: vtkAbstractPropPicker) static IVtkTools_ShapePicker *

Returns
-------
None
") vtkTypeMacro;
		 vtkTypeMacro(IVtkTools_ShapePicker , vtkAbstractPropPicker) static IVtkTools_ShapePicker * New();

		/****************** GetPickedActors ******************/
		/**** md5 signature: 39b1d8615db6ea0fef5e2ea00a972204 ****/
		%feature("compactdefaultargs") GetPickedActors;
		%feature("autodoc", "Access to the list of actors picked. @param [in] theisall get all selected actors or just the only top one is returned, has no effect during area selection. returns list of actors ids.

Parameters
----------
theIsAll: bool,optional
	default value is false

Returns
-------
vtkSmartPointer<vtkActorCollection>
") GetPickedActors;
		vtkSmartPointer<vtkActorCollection> GetPickedActors(bool theIsAll = false);

		/****************** GetPickedShapesIds ******************/
		/**** md5 signature: 126ec3f77c433ed78ac82c55658d21b0 ****/
		%feature("compactdefaultargs") GetPickedShapesIds;
		%feature("autodoc", "Access to the list of top-level shapes picked. if all argument is true, the picker returns the list of all occshape objects found by the picking algorithm. e.g. all shapes under the mouse cursor. otherwise, id of the shape closest to the eye is returned. @param [in] theisall get all selected shapes or just the only top one is returned, has no effect during area selection. returns list of top-level shape ids.

Parameters
----------
theIsAll: bool,optional
	default value is false

Returns
-------
IVtk_ShapeIdList
") GetPickedShapesIds;
		IVtk_ShapeIdList GetPickedShapesIds(bool theIsAll = false);

		/****************** GetPickedSubShapesIds ******************/
		/**** md5 signature: bf795f5ae42845f9969eaf3586e7d7f0 ****/
		%feature("compactdefaultargs") GetPickedSubShapesIds;
		%feature("autodoc", "Access to the list of sub-shapes ids picked. @param [in] theid top-level shape id @param [in] theisall get all selected sub-shapes or just the only top one is returned, has no effect during area selection. returns list of sub-shapes ids.

Parameters
----------
theId: IVtk_IdType
theIsAll: bool,optional
	default value is false

Returns
-------
IVtk_ShapeIdList
") GetPickedSubShapesIds;
		IVtk_ShapeIdList GetPickedSubShapesIds(const IVtk_IdType theId, bool theIsAll = false);

		/****************** GetSelectionModes ******************/
		/**** md5 signature: dcde76caf2509f7ebc1d80aaa9a5c0d5 ****/
		%feature("compactdefaultargs") GetSelectionModes;
		%feature("autodoc", "Get activated selection modes for a shape. @param [in] theshape a shape with activated selection mode(s) returns list of active selection modes.

Parameters
----------
theShape: IVtk_IShape::Handle

Returns
-------
IVtk_SelectionModeList
") GetSelectionModes;
		IVtk_SelectionModeList GetSelectionModes(const IVtk_IShape::Handle & theShape);

		/****************** GetSelectionModes ******************/
		/**** md5 signature: fd13ae1033fedfe537d61994a5ccb38a ****/
		%feature("compactdefaultargs") GetSelectionModes;
		%feature("autodoc", "Get activated selection modes for a shape actor. @param [in] theshapeactor an actor with activated selection mode(s) returns list of active selection modes.

Parameters
----------
theShapeActor: vtkActor *

Returns
-------
IVtk_SelectionModeList
") GetSelectionModes;
		IVtk_SelectionModeList GetSelectionModes(vtkActor * theShapeActor);

		/****************** GetTolerance ******************/
		/**** md5 signature: d61f68211022ece561763d14f766d2ae ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Getter for tolerance of picking.

Returns
-------
float
") GetTolerance;
		float GetTolerance();

		/****************** Pick ******************/
		/**** md5 signature: 8dc8477c139a8958a5b12fd81641fce6 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Pick entities in the given point. returns number of detected entities.

Parameters
----------
theX: double
theY: double
theZ: double
theRenderer: vtkRenderer *,optional
	default value is NULL

Returns
-------
int
") Pick;
		virtual int Pick(double theX, double theY, double theZ, vtkRenderer * theRenderer = NULL);

		/****************** Pick ******************/
		/**** md5 signature: 45f6d2a17e87f07f18c797dd8ce9ef13 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Pick entities in the given rectangle area. returns number of detected entities.

Parameters
----------
theX0: double
theY0: double
theX1: double
theY1: double
theRenderer: vtkRenderer *,optional
	default value is NULL

Returns
-------
int
") Pick;
		int Pick(double theX0, double theY0, double theX1, double theY1, vtkRenderer * theRenderer = NULL);

		/****************** Pick ******************/
		/**** md5 signature: c803378216a63f6cb3d46694ca341743 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Pick entities in the given polygonal area. returns number of detected entities.

Parameters
----------
poly: double
theNbPoints: int
theRenderer: vtkRenderer *,optional
	default value is NULL

Returns
-------
int
") Pick;
		int Pick(double poly[3], const int theNbPoints, vtkRenderer * theRenderer = NULL);

		/****************** RemoveSelectableActor ******************/
		/**** md5 signature: 6771f157b509b520b255acd383b27504 ****/
		%feature("compactdefaultargs") RemoveSelectableActor;
		%feature("autodoc", "Remove selectable object from the picker (from internal maps). @param [in] theshapeactor the shape presentation actor to be removed from the picker.

Parameters
----------
theShapeActor: vtkActor *

Returns
-------
None
") RemoveSelectableActor;
		void RemoveSelectableActor(vtkActor * theShapeActor);

		/****************** RemoveSelectableObject ******************/
		/**** md5 signature: 3c56c015654c69ee0cd4b6acf1be9701 ****/
		%feature("compactdefaultargs") RemoveSelectableObject;
		%feature("autodoc", "Remove selectable object from the picker (from internal maps). @param [in] theshape the selectable shape.

Parameters
----------
theShape: IVtk_IShape::Handle

Returns
-------
None
") RemoveSelectableObject;
		void RemoveSelectableObject(const IVtk_IShape::Handle & theShape);

		/****************** SetAreaSelection ******************/
		/**** md5 signature: 55df2b0ab568973fa09041ecea5860a4 ****/
		%feature("compactdefaultargs") SetAreaSelection;
		%feature("autodoc", "Sets area selection on/off @param [in] theison true if area selection is turned on, false otherwise.

Parameters
----------
theIsOn: bool

Returns
-------
None
") SetAreaSelection;
		void SetAreaSelection(bool theIsOn);

		/****************** SetRenderer ******************/
		/**** md5 signature: e5b3a78c29d05f9be617af56815a2eb6 ****/
		%feature("compactdefaultargs") SetRenderer;
		%feature("autodoc", "Sets the renderer to be used by occt selection algorithm.

Parameters
----------
theRenderer: vtkRenderer *

Returns
-------
None
") SetRenderer;
		void SetRenderer(vtkRenderer * theRenderer);

		/****************** SetSelectionMode ******************/
		/**** md5 signature: d2803ec189d18a9cfc5ae38c28af997f ****/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "Turn on/off a selection mode for a shape actor. @param [in] theshape a shape to set a selection mode for @param [in] themode selection mode to be activated @param [in] theisturnon flag to turn on/off the selection mode.

Parameters
----------
theShape: IVtk_IShape::Handle
theMode: IVtk_SelectionMode
theIsTurnOn: bool,optional
	default value is true

Returns
-------
None
") SetSelectionMode;
		void SetSelectionMode(const IVtk_IShape::Handle & theShape, const IVtk_SelectionMode theMode, const bool theIsTurnOn = true);

		/****************** SetSelectionMode ******************/
		/**** md5 signature: 0615dfe1317a4f6ceaf32bb4ca91ea07 ****/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "Turn on/off a selection mode for a shape actor. @param [in] theshapeactor shape presentation actor to set a selection mode for @param [in] themode selection mode to be activated @param [in] theisturnon flag to turn on/off the selection mode.

Parameters
----------
theShapeActor: vtkActor *
theMode: IVtk_SelectionMode
theIsTurnOn: bool,optional
	default value is true

Returns
-------
None
") SetSelectionMode;
		void SetSelectionMode(vtkActor * theShapeActor, const IVtk_SelectionMode theMode, const bool theIsTurnOn = true);

		/****************** SetSelectionMode ******************/
		/**** md5 signature: daf94b1435cf4e436d7591baee74eb2f ****/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "Sets the current selection mode for all visible shape objects. @param [in] themode selection mode to be activated @param [in] theisturnon flag to turn on/off the selection mode.

Parameters
----------
theMode: IVtk_SelectionMode
theIsTurnOn: bool,optional
	default value is true

Returns
-------
None
") SetSelectionMode;
		void SetSelectionMode(const IVtk_SelectionMode theMode, const bool theIsTurnOn = true);

		/****************** SetTolerance ******************/
		/**** md5 signature: f800ad464a1ac8c0cf7ba901e28e8359 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Setter for tolerance of picking.

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(float theTolerance);

		/****************** pick ******************/
		/**** md5 signature: 943ef30c921e6e39fdf5bac2443cf938 ****/
		%feature("compactdefaultargs") pick;
		%feature("autodoc", "Pick entities in the given point or area. returns number of detected entities.

Parameters
----------
thePos: double *
theRenderer: vtkRenderer *
theNbPoints: int,optional
	default value is -1

Returns
-------
int
") pick;
		int pick(double * thePos, vtkRenderer * theRenderer, const int theNbPoints = -1);

};


%extend IVtkTools_ShapePicker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IVtkTools_SubPolyDataFilter *
************************************/
%nodefaultctor IVtkTools_SubPolyDataFilter;
%ignore IVtkTools_SubPolyDataFilter::~IVtkTools_SubPolyDataFilter();
class IVtkTools_SubPolyDataFilter : public vtkPolyDataAlgorithm {
	public:
		/****************** vtkTypeMacro ******************/
		/**** md5 signature: d1facaeaca6e3af2fe3e9cfa0160d528 ****/
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "No available documentation.

Parameters
----------
: IVtkTools_SubPolyDataFilter
New(: vtkPolyDataAlgorithm) static IVtkTools_SubPolyDataFilter *

Returns
-------
None
") vtkTypeMacro;
		 vtkTypeMacro(IVtkTools_SubPolyDataFilter , vtkPolyDataAlgorithm) static IVtkTools_SubPolyDataFilter * New();

		/****************** AddData ******************/
		/**** md5 signature: 7aba768dbf7406570d61fee63d7b3447 ****/
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "Add ids to be passed through this filter.

Parameters
----------
theSet: IVtk_IdTypeMap

Returns
-------
None
") AddData;
		void AddData(const IVtk_IdTypeMap theSet);

		/****************** AddData ******************/
		/**** md5 signature: 3908e7fe86b1fdcfa9de4c97705d8a73 ****/
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "Add ids to be passed through this filter.

Parameters
----------
theIds: IVtk_ShapeIdList

Returns
-------
None
") AddData;
		void AddData(const IVtk_ShapeIdList theIds);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear ids set to be passed through this filter.

Returns
-------
None
") Clear;
		void Clear();

		/****************** PrintSelf ******************/
		/**** md5 signature: 1c7283b7b9088cd2f177904d6a579e22 ****/
		%feature("compactdefaultargs") PrintSelf;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOs: std::ostream
theIndent: vtkIndent

Returns
-------
None
") PrintSelf;
		void PrintSelf(std::ostream & theOs, vtkIndent theIndent);

		/****************** SetData ******************/
		/**** md5 signature: 225dc159ea9b26e6fbc9dca24768f9e8 ****/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "Set ids to be passed through this filter.

Parameters
----------
theSet: IVtk_IdTypeMap

Returns
-------
None
") SetData;
		void SetData(const IVtk_IdTypeMap theSet);

		/****************** SetData ******************/
		/**** md5 signature: 5f353aeacbce6410921bde3a92827303 ****/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "Set ids to be passed through this filter.

Parameters
----------
theIds: IVtk_ShapeIdList

Returns
-------
None
") SetData;
		void SetData(const IVtk_ShapeIdList theIds);

		/****************** SetDoFiltering ******************/
		/**** md5 signature: 67e36ad4db4e094c06acf31fe4c81ac6 ****/
		%feature("compactdefaultargs") SetDoFiltering;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDoFiltering: bool

Returns
-------
None
") SetDoFiltering;
		void SetDoFiltering(const bool theDoFiltering);

		/****************** SetIdsArrayName ******************/
		/**** md5 signature: 2c218a986f2a1ce7ea8226e9f5f3e2bc ****/
		%feature("compactdefaultargs") SetIdsArrayName;
		%feature("autodoc", "Set ids array name.

Parameters
----------
theArrayName: char *

Returns
-------
None
") SetIdsArrayName;
		void SetIdsArrayName(const char * theArrayName);

};


%extend IVtkTools_SubPolyDataFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IVtkTools_DisplayModeFilter *
************************************/
%nodefaultctor IVtkTools_DisplayModeFilter;
%ignore IVtkTools_DisplayModeFilter::~IVtkTools_DisplayModeFilter();
class IVtkTools_DisplayModeFilter : public IVtkTools_SubPolyDataFilter {
	public:
		/****************** vtkTypeMacro ******************/
		/**** md5 signature: 27fd212649d1bef1565ed3b0daa7940a ****/
		%feature("compactdefaultargs") vtkTypeMacro;
		%feature("autodoc", "No available documentation.

Parameters
----------
: IVtkTools_DisplayModeFilter
New(: IVtkTools_SubPolyDataFilter) static IVtkTools_DisplayModeFilter *

Returns
-------
None
") vtkTypeMacro;
		 vtkTypeMacro(IVtkTools_DisplayModeFilter , IVtkTools_SubPolyDataFilter) static IVtkTools_DisplayModeFilter * New();

		/****************** FaceBoundaryDraw ******************/
		/**** md5 signature: a9ee11e82b1aa12b8b9fb471af0522c6 ****/
		%feature("compactdefaultargs") FaceBoundaryDraw;
		%feature("autodoc", "Returns true if drawing boundary of faces for shading mode is defined.

Returns
-------
bool
") FaceBoundaryDraw;
		bool FaceBoundaryDraw();

		/****************** GetDisplayMode ******************/
		/**** md5 signature: 930f187075b5d87f38a60457e5ff6c00 ****/
		%feature("compactdefaultargs") GetDisplayMode;
		%feature("autodoc", "Get current display mode.

Returns
-------
IVtk_DisplayMode
") GetDisplayMode;
		IVtk_DisplayMode GetDisplayMode();

		/****************** IsSmoothShading ******************/
		/**** md5 signature: 3ba3b50d410b93fa9b7ab508d4740cd1 ****/
		%feature("compactdefaultargs") IsSmoothShading;
		%feature("autodoc", "Returns true if vertex normals should be included for smooth shading within dm_shading mode or not.

Returns
-------
bool
") IsSmoothShading;
		bool IsSmoothShading();

		/****************** MeshTypesForMode ******************/
		/**** md5 signature: b2b975c92c69dcc9a3d318657c78d281 ****/
		%feature("compactdefaultargs") MeshTypesForMode;
		%feature("autodoc", "Returns list of displaying mesh element types for the given display mode.

Parameters
----------
theMode: IVtk_DisplayMode

Returns
-------
IVtk_IdTypeMap
") MeshTypesForMode;
		const IVtk_IdTypeMap & MeshTypesForMode(IVtk_DisplayMode theMode);

		/****************** PrintSelf ******************/
		/**** md5 signature: 1385623d7717658b7a332aef9a8c656d ****/
		%feature("compactdefaultargs") PrintSelf;
		%feature("autodoc", "No available documentation.

Parameters
----------
os: std::ostream
indent: vtkIndent

Returns
-------
None
") PrintSelf;
		void PrintSelf(std::ostream & os, vtkIndent indent);

		/****************** SetDisplayMode ******************/
		/**** md5 signature: e6d70dd1758cf09de547397cf637da10 ****/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "Set display mode to define cells types to be passed through this filter.

Parameters
----------
aMode: IVtk_DisplayMode

Returns
-------
None
") SetDisplayMode;
		void SetDisplayMode(const IVtk_DisplayMode aMode);

		/****************** SetDisplaySharedVertices ******************/
		/**** md5 signature: a8dd1d102d4ea453395839f4503904d1 ****/
		%feature("compactdefaultargs") SetDisplaySharedVertices;
		%feature("autodoc", "Display or not shared vertices.

Parameters
----------
doDisplay: bool

Returns
-------
None
") SetDisplaySharedVertices;
		void SetDisplaySharedVertices(const bool doDisplay);

		/****************** SetFaceBoundaryDraw ******************/
		/**** md5 signature: 70c85778c6118c6b9120d72610235671 ****/
		%feature("compactdefaultargs") SetFaceBoundaryDraw;
		%feature("autodoc", "Draw boundary of faces for shading mode.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetFaceBoundaryDraw;
		void SetFaceBoundaryDraw(bool theToDraw);

		/****************** SetMeshTypesForMode ******************/
		/**** md5 signature: c6726a056fc1577031785350a1acce5a ****/
		%feature("compactdefaultargs") SetMeshTypesForMode;
		%feature("autodoc", "Set a list of displaying mesh element types for the given display mode.

Parameters
----------
theMode: IVtk_DisplayMode
theMeshTypes: IVtk_IdTypeMap

Returns
-------
None
") SetMeshTypesForMode;
		void SetMeshTypesForMode(IVtk_DisplayMode theMode, const IVtk_IdTypeMap & theMeshTypes);

		/****************** SetSmoothShading ******************/
		/**** md5 signature: 38c3dac1d38380ff92cd9dec113953a0 ****/
		%feature("compactdefaultargs") SetSmoothShading;
		%feature("autodoc", "Set if vertex normals should be included for smooth shading or not.

Parameters
----------
theIsSmooth: bool

Returns
-------
None
") SetSmoothShading;
		void SetSmoothShading(bool theIsSmooth);

};


%extend IVtkTools_DisplayModeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
