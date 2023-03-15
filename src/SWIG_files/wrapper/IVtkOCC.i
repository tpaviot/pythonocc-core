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
%define IVTKOCCDOCSTRING
"IVtkOCC module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_ivtkocc.html"
%enddef
%module (package="OCC.Core", docstring=IVTKOCCDOCSTRING) IVtkOCC


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
#include<IVtkOCC_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<SelectMgr_module.hxx>
#include<Bnd_module.hxx>
#include<IVtk_module.hxx>
#include<TopoDS_module.hxx>
#include<Prs3d_module.hxx>
#include<gp_module.hxx>
#include<Graphic3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import SelectMgr.i
%import Bnd.i
%import IVtk.i
%import TopoDS.i
%import Prs3d.i
%import gp.i
%import Graphic3d.i

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
%wrap_handle(IVtkOCC_SelectableObject)
%wrap_handle(IVtkOCC_Shape)
%wrap_handle(IVtkOCC_ShapeMesher)
%wrap_handle(IVtkOCC_ShapePickerAlgo)
/* end handles declaration */

/* templates */
%template(IVtk_Polyline) NCollection_Sequence<gp_Pnt>;

%extend NCollection_Sequence<gp_Pnt> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IVtk_PolylineList) NCollection_List<IVtk_Polyline>;

%extend NCollection_List<IVtk_Polyline> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IVtk_ShapeTypeMap) NCollection_DataMap<TopoDS_Shape,IVtk_MeshType,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <gp_Pnt> IVtk_Polyline;
typedef NCollection_List <IVtk_Polyline> IVtk_PolylineList;
typedef NCollection_DataMap <TopoDS_Shape, IVtk_MeshType, TopTools_ShapeMapHasher> IVtk_ShapeTypeMap;
/* end typedefs declaration */

/*********************************
* class IVtkOCC_SelectableObject *
*********************************/
class IVtkOCC_SelectableObject : public SelectMgr_SelectableObject {
	public:
typedef opencascade::handle <IVtkOCC_SelectableObject> Handle;
		/****************** IVtkOCC_SelectableObject ******************/
		/**** md5 signature: 6976ef6f6078357a07e8c0d1c4a96da3 ****/
		%feature("compactdefaultargs") IVtkOCC_SelectableObject;
		%feature("autodoc", "Constructs a selectable object initialized by the given shape @param [in] theshape selectable shape.

Parameters
----------
theShape: IVtkOCC_Shape::Handle

Returns
-------
None
") IVtkOCC_SelectableObject;
		 IVtkOCC_SelectableObject(const IVtkOCC_Shape::Handle & theShape);

		/****************** IVtkOCC_SelectableObject ******************/
		/**** md5 signature: 64790a8eb1fde3fc75d3ca7ee15f1969 ****/
		%feature("compactdefaultargs") IVtkOCC_SelectableObject;
		%feature("autodoc", "Constructs uninitialized selectable object. setshape() should be called later.

Returns
-------
None
") IVtkOCC_SelectableObject;
		 IVtkOCC_SelectableObject();

		/****************** BoundingBox ******************/
		/**** md5 signature: dd3ae785a3dd5a43f78c647df93cb692 ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of object.

Parameters
----------
theBndBox: Bnd_Box

Returns
-------
None
") BoundingBox;
		virtual void BoundingBox(Bnd_Box & theBndBox);

		/****************** GetShape ******************/
		/**** md5 signature: 7dcbd1bc14dc0278453a8904b611c0f8 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Returns
-------
IVtkOCC_Shape::Handle
") GetShape;
		const IVtkOCC_Shape::Handle & GetShape();

		/****************** SetShape ******************/
		/**** md5 signature: c577988be6b8a08af8eb6775951506be ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the selectable shape @param [in] theshape selectable shape.

Parameters
----------
theShape: IVtkOCC_Shape::Handle

Returns
-------
None
") SetShape;
		void SetShape(const IVtkOCC_Shape::Handle & theShape);

};


%make_alias(IVtkOCC_SelectableObject)

%extend IVtkOCC_SelectableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IVtkOCC_Shape *
**********************/
class IVtkOCC_Shape : public IVtk_IShape {
	public:
typedef opencascade::handle <IVtkOCC_Shape> Handle;
		/****************** IVtkOCC_Shape ******************/
		/**** md5 signature: 01d50b6a045c85b24892f4cf1ecc1957 ****/
		%feature("compactdefaultargs") IVtkOCC_Shape;
		%feature("autodoc", "Constructor for occ ishape implementation. @param theshape [in] shape to display @param thedrawerlink [in] default attributes to link.

Parameters
----------
theShape: TopoDS_Shape
theDrawerLink: Prs3d_Drawer,optional
	default value is opencascade::handle<Prs3d_Drawer>()

Returns
-------
None
") IVtkOCC_Shape;
		 IVtkOCC_Shape(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawerLink = opencascade::handle<Prs3d_Drawer>());

		/****************** Attributes ******************/
		/**** md5 signature: 7c024beac873893f3a088f538b4ad41a ****/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Return presentation attributes.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") Attributes;
		const opencascade::handle<Prs3d_Drawer> & Attributes();

		/****************** GetSelectableObject ******************/
		/**** md5 signature: af4a9a5e44f7e8363e4ed041de6d8588 ****/
		%feature("compactdefaultargs") GetSelectableObject;
		%feature("autodoc", "Returns handle to the selectable object for this shape.

Returns
-------
opencascade::handle<SelectMgr_SelectableObject>
") GetSelectableObject;
		const opencascade::handle<SelectMgr_SelectableObject> & GetSelectableObject();

		/****************** GetShape ******************/
		/**** md5 signature: 7c167c51f2939d15d5bfddc807114b00 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Get the wrapped original occt shape returns topods_shape the wrapped original occt shape.

Returns
-------
TopoDS_Shape
") GetShape;
		const TopoDS_Shape GetShape();

		/****************** GetSubIds ******************/
		/**** md5 signature: 1ad95704b86b79f3fd2bf76ae0384451 ****/
		%feature("compactdefaultargs") GetSubIds;
		%feature("autodoc", "Get ids of sub-shapes composing a sub-shape with the given id.

Parameters
----------
IVtk_IdType: 

Returns
-------
IVtk_ShapeIdList
") GetSubIds;
		IVtk_ShapeIdList GetSubIds(const IVtk_IdType);

		/****************** GetSubShape ******************/
		/**** md5 signature: 8084354a05d2012c15dbf21fcf0ee0e3 ****/
		%feature("compactdefaultargs") GetSubShape;
		%feature("autodoc", "@brief get a sub-shape by its local id. //! @param [in] id local id of a sub-shape returns topods_shape& a sub-shape.

Parameters
----------
theId: IVtk_IdType

Returns
-------
TopoDS_Shape
") GetSubShape;
		const TopoDS_Shape GetSubShape(const IVtk_IdType theId);

		/****************** GetSubShapeId ******************/
		/**** md5 signature: f5b0111c21a51ad96db88da0b9b7bb84 ****/
		%feature("compactdefaultargs") GetSubShapeId;
		%feature("autodoc", "Returns unique id of the given sub-shape within the top-level shape.

Parameters
----------
&: IVtk_IShape::Handle

Returns
-------
IVtk_IdType
") GetSubShapeId;
		IVtk_IdType GetSubShapeId(const IVtk_IShape::Handle &);

		/****************** GetSubShapeId ******************/
		/**** md5 signature: ca939c5aec13962c9dc7b909eb2715b5 ****/
		%feature("compactdefaultargs") GetSubShapeId;
		%feature("autodoc", "@brief get local id of a sub-shape. //! returns unique id of the given sub-shape within the top-level shape. note that the sub-shape id remains unchanged until the top-level is modified by some operation. @param [in] subshape sub-shape whose id is returned returns local id of the sub-shape.

Parameters
----------
theSubShape: TopoDS_Shape

Returns
-------
IVtk_IdType
") GetSubShapeId;
		IVtk_IdType GetSubShapeId(const TopoDS_Shape & theSubShape);

		/****************** SetAttributes ******************/
		/**** md5 signature: 137d1ef36e32767dd2fa60405467f37a ****/
		%feature("compactdefaultargs") SetAttributes;
		%feature("autodoc", "Set presentation attributes.

Parameters
----------
theDrawer: Prs3d_Drawer

Returns
-------
None
") SetAttributes;
		void SetAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetSelectableObject ******************/
		/**** md5 signature: 5d3c62caccca8fe137d7aa019f395dd6 ****/
		%feature("compactdefaultargs") SetSelectableObject;
		%feature("autodoc", "Stores a handle to selectable object used by occt selection algorithm in a data field. this object internally caches selection data so it should be stored until the shape is no longer selectable. note that the selectable object keeps a pointer to occshape. @param [in] selobj handle to the selectable object.

Parameters
----------
theSelObj: SelectMgr_SelectableObject

Returns
-------
None
") SetSelectableObject;
		void SetSelectableObject(const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

};


%make_alias(IVtkOCC_Shape)

%extend IVtkOCC_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IVtkOCC_ShapeMesher *
****************************/
class IVtkOCC_ShapeMesher : public IVtk_IShapeMesher {
	public:
		/****************** IVtkOCC_ShapeMesher ******************/
		/**** md5 signature: de98261a27b6864773cdff2149a9c8a3 ****/
		%feature("compactdefaultargs") IVtkOCC_ShapeMesher;
		%feature("autodoc", "Main constructor.

Returns
-------
None
") IVtkOCC_ShapeMesher;
		 IVtkOCC_ShapeMesher();

		/****************** GetDeflection ******************/
		/**** md5 signature: 4c0490d8fb866e044cdf1aea23ca849e ****/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "Returns absolute deflection used by this algorithm. this value is calculated on the basis of the shape's bounding box. zero might be returned in case if the underlying occt shape is empty or invalid. thus check the returned value before passing it to occt meshing algorithms! returns absolute deflection value.

Returns
-------
float
") GetDeflection;
		Standard_Real GetDeflection();

		/****************** GetDeviationAngle ******************/
		/**** md5 signature: 6d0f20ff47341fe7abb21a2562772984 ****/
		%feature("compactdefaultargs") GetDeviationAngle;
		%feature("autodoc", "Returns deviation angle used by this algorithm. this is the maximum allowed angle between the normals to the curve/surface and the normals to polyline/faceted representation. returns deviation angle (in radians).

Returns
-------
float
") GetDeviationAngle;
		Standard_Real GetDeviationAngle();

		/****************** GetDeviationCoeff ******************/
		/**** md5 signature: 1fce58454181906a5ec832a1b42a9810 ****/
		%feature("compactdefaultargs") GetDeviationCoeff;
		%feature("autodoc", "Returns relative deviation coefficient used by this algorithm. returns relative deviation coefficient.

Returns
-------
float
") GetDeviationCoeff;
		Standard_Real GetDeviationCoeff();

};


%make_alias(IVtkOCC_ShapeMesher)

%extend IVtkOCC_ShapeMesher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IVtkOCC_ShapePickerAlgo *
********************************/
class IVtkOCC_ShapePickerAlgo : public IVtk_IShapePickerAlgo {
	public:
typedef opencascade::handle <IVtkOCC_ShapePickerAlgo> Handle;
		/****************** IVtkOCC_ShapePickerAlgo ******************/
		/**** md5 signature: eada25dd77a575f21bfbb13350c363f2 ****/
		%feature("compactdefaultargs") IVtkOCC_ShapePickerAlgo;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IVtkOCC_ShapePickerAlgo;
		 IVtkOCC_ShapePickerAlgo();

		/****************** GetSelectionModes ******************/
		/**** md5 signature: 1a5d4cc86177bede0378dda326809098 ****/
		%feature("compactdefaultargs") GetSelectionModes;
		%feature("autodoc", "Get activated selection modes for a shape. @param [in] theshape a shape with activated selection mode(s) returns list of active selection modes.

Parameters
----------
theShape: IVtk_IShape::Handle

Returns
-------
IVtk_SelectionModeList
") GetSelectionModes;
		virtual IVtk_SelectionModeList GetSelectionModes(const IVtk_IShape::Handle & theShape);

		/****************** NbPicked ******************/
		/**** md5 signature: 685bd83a402c951675e0c39bab48076d ****/
		%feature("compactdefaultargs") NbPicked;
		%feature("autodoc", "Get number of picked entities.

Returns
-------
int
") NbPicked;
		virtual int NbPicked();

		/****************** Pick ******************/
		/**** md5 signature: 268d0b2761970b1d3561eb24af6911fe ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "@name picking methods.

Parameters
----------
theX: double
theY: double

Returns
-------
bool
") Pick;
		virtual bool Pick(const double theX, const double theY);

		/****************** Pick ******************/
		/**** md5 signature: a35a81408d6f33e5a35f473d44c17d6f ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "No available documentation.

Parameters
----------
theXMin: double
theYMin: double
theXMax: double
theYMax: double

Returns
-------
bool
") Pick;
		virtual bool Pick(const double theXMin, const double theYMin, const double theXMax, const double theYMax);

		/****************** Pick ******************/
		/**** md5 signature: 4b901b8d995070b7ee7bf9a0b6d09810 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolyLine: double * *
theNbPoints: int

Returns
-------
bool
") Pick;
		virtual bool Pick(double * * thePolyLine, const int theNbPoints);

		/****************** RemoveSelectableObject ******************/
		/**** md5 signature: 83fcdb5447b910e77d5722db2df47da6 ****/
		%feature("compactdefaultargs") RemoveSelectableObject;
		%feature("autodoc", "Remove selectable object from the picker (from internal maps). @param [in] theshape the selectable shape.

Parameters
----------
theShape: IVtk_IShape::Handle

Returns
-------
None
") RemoveSelectableObject;
		virtual void RemoveSelectableObject(const IVtk_IShape::Handle & theShape);

		/****************** SetSelectionMode ******************/
		/**** md5 signature: 729da27ac8e7d380edb44c6b6da39090 ****/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "@name set selectable shapes and selection modes activates/deactivates the given selection mode for the shape. if mode == sm_none, the shape becomes non-selectable and is removed from the internal selection data. @param [in] theshape shape for which the selection mode should be activated @param [in] themode selection mode to be activated @param [in] theisturnon flag to turn on/off the selection mode.

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
		virtual void SetSelectionMode(const IVtk_IShape::Handle & theShape, const IVtk_SelectionMode theMode, const bool theIsTurnOn = true);

		/****************** SetSelectionMode ******************/
		/**** md5 signature: beb4bcb5c218cb1cc122bbc9e3842588 ****/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "Activates/deactivates the given selection mode for the shape. if mode == sm_none, the shape becomes non-selectable and is removed from the internal selection data. @param [in] theshapes list of shapes for which the selection mode should be activated @param [in] themode selection mode to be activated @param [in] theisturnon flag to turn on/off the selection mode.

Parameters
----------
theShapes: IVtk_ShapePtrList
theMode: IVtk_SelectionMode
theIsTurnOn: bool,optional
	default value is true

Returns
-------
None
") SetSelectionMode;
		virtual void SetSelectionMode(const IVtk_ShapePtrList & theShapes, const IVtk_SelectionMode theMode, const bool theIsTurnOn = true);

		/****************** SetView ******************/
		/**** md5 signature: f6e838339a4de542890d6526f31d7b8f ****/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Sets the picker's view interface. the picker uses the view to obtain parameters of the 3d view projection.

Parameters
----------
theView: IVtk_IView::Handle

Returns
-------
None
") SetView;
		virtual void SetView(const IVtk_IView::Handle & theView);

		/****************** ShapesPicked ******************/
		/**** md5 signature: 77a1b9412dbb822100a80f7e5e4836b2 ****/
		%feature("compactdefaultargs") ShapesPicked;
		%feature("autodoc", "@name obtain picking results returns the list of picked top-level shape ids, in the order of increasing depth (the id of the shape closest to the eye is the first in the list).

Returns
-------
IVtk_ShapeIdList
") ShapesPicked;
		virtual const IVtk_ShapeIdList & ShapesPicked();

		/****************** SubShapesPicked ******************/
		/**** md5 signature: e34dff53ef9c19d7a8c90e8f7bb23ccf ****/
		%feature("compactdefaultargs") SubShapesPicked;
		%feature("autodoc", "@param [in] theid top-level shape id @param [out] theshapelist the list of picked sub-shape ids for the given top-level shape id, in the order of increasing depth (the id of the sub-shape closest to the eye is the first in the list).

Parameters
----------
theId: IVtk_IdType
theShapeList: IVtk_ShapeIdList

Returns
-------
None
") SubShapesPicked;
		virtual void SubShapesPicked(const IVtk_IdType theId, IVtk_ShapeIdList & theShapeList);

		/****************** TopPickedPoint ******************/
		/**** md5 signature: 7b647404b7731d94d60504819fb779d0 ****/
		%feature("compactdefaultargs") TopPickedPoint;
		%feature("autodoc", "Return topmost picked 3d point or (inf, inf, inf) if undefined.

Returns
-------
gp_Pnt
") TopPickedPoint;
		const gp_Pnt TopPickedPoint();

};


%make_alias(IVtkOCC_ShapePickerAlgo)

%extend IVtkOCC_ShapePickerAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IVtkOCC_ViewerSelector *
*******************************/
class IVtkOCC_ViewerSelector : public SelectMgr_ViewerSelector {
	public:
		/****************** IVtkOCC_ViewerSelector ******************/
		/**** md5 signature: a0b82a02316b02114bfaf45c1ac2a9f6 ****/
		%feature("compactdefaultargs") IVtkOCC_ViewerSelector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IVtkOCC_ViewerSelector;
		 IVtkOCC_ViewerSelector();

		/****************** Activate ******************/
		/**** md5 signature: 52942fe66c255f65aff9612a4df9e3ba ****/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Activates the given selection.

Parameters
----------
theSelection: SelectMgr_Selection

Returns
-------
None
") Activate;
		void Activate(const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****************** ConvertVtkToOccCamera ******************/
		/**** md5 signature: cac7ddbd5680425ce55d870d9e33080e ****/
		%feature("compactdefaultargs") ConvertVtkToOccCamera;
		%feature("autodoc", "Converts vtk camera defiened for input view to occ camera.

Parameters
----------
theView: IVtk_IView::Handle

Returns
-------
opencascade::handle<Graphic3d_Camera>
") ConvertVtkToOccCamera;
		static opencascade::handle<Graphic3d_Camera> ConvertVtkToOccCamera(const IVtk_IView::Handle & theView);

		/****************** Deactivate ******************/
		/**** md5 signature: 7e7e66d29d90cb363b5854cd9d988470 ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivate the given selection.

Parameters
----------
theSelection: SelectMgr_Selection

Returns
-------
None
") Deactivate;
		void Deactivate(const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****************** Pick ******************/
		/**** md5 signature: 3e9c50ebcd0d190e1590d490a0e121f2 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Implements point picking @param [in] thexpix, theypix display coordinates of the point @param [in] theview icamera interface to update the projection parameters.

Parameters
----------
theXPix: int
theYPix: int
theView: IVtk_IView::Handle

Returns
-------
None
") Pick;
		void Pick(const Standard_Integer theXPix, const Standard_Integer theYPix, const IVtk_IView::Handle & theView);

		/****************** Pick ******************/
		/**** md5 signature: 43e46437d463e75ccc3d2d288ba04cee ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Picking by rectangle @param [in] thexmin, theymin, thexmax, theymax rectangle coords @param [in] theview icamera interface to calculate projections.

Parameters
----------
theXMin: int
theYMin: int
theXMax: int
theYMax: int
theView: IVtk_IView::Handle

Returns
-------
None
") Pick;
		void Pick(const Standard_Integer theXMin, const Standard_Integer theYMin, const Standard_Integer theXMax, const Standard_Integer theYMax, const IVtk_IView::Handle & theView);

		/****************** Pick ******************/
		/**** md5 signature: 6914ddcd0ab07a7771e35cfe35941d51 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Implements point picking.

Parameters
----------
thePoly: double * *
theNbPoints: int
theView: IVtk_IView::Handle

Returns
-------
None
") Pick;
		void Pick(double * * thePoly, const int theNbPoints, const IVtk_IView::Handle & theView);

};


%extend IVtkOCC_ViewerSelector {
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
