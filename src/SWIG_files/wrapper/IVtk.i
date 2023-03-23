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
%define IVTKDOCSTRING
"IVtk module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_ivtk.html"
%enddef
%module (package="OCC.Core", docstring=IVTKDOCSTRING) IVtk


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
#include<IVtk_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Graphic3d_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Graphic3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IVtk_SelectionMode {
	SM_None = - 1,
	SM_Shape = 0,
	SM_Vertex = 1,
	SM_Edge = 2,
	SM_Wire = 3,
	SM_Face = 4,
	SM_Shell = 5,
	SM_Solid = 6,
	SM_CompSolid = 7,
	SM_Compound = 8,
};

enum IVtk_MeshType {
	MT_Undefined = - 1,
	MT_IsoLine = 0,
	MT_FreeVertex = 1,
	MT_SharedVertex = 2,
	MT_FreeEdge = 3,
	MT_BoundaryEdge = 4,
	MT_SharedEdge = 5,
	MT_WireFrameFace = 6,
	MT_ShadedFace = 7,
	MT_SeamEdge = 8,
};

enum IVtk_DisplayMode {
	DM_Wireframe = 0,
	DM_Shading = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IVtk_SelectionMode(IntEnum):
	SM_None = - 1
	SM_Shape = 0
	SM_Vertex = 1
	SM_Edge = 2
	SM_Wire = 3
	SM_Face = 4
	SM_Shell = 5
	SM_Solid = 6
	SM_CompSolid = 7
	SM_Compound = 8
SM_None = IVtk_SelectionMode.SM_None
SM_Shape = IVtk_SelectionMode.SM_Shape
SM_Vertex = IVtk_SelectionMode.SM_Vertex
SM_Edge = IVtk_SelectionMode.SM_Edge
SM_Wire = IVtk_SelectionMode.SM_Wire
SM_Face = IVtk_SelectionMode.SM_Face
SM_Shell = IVtk_SelectionMode.SM_Shell
SM_Solid = IVtk_SelectionMode.SM_Solid
SM_CompSolid = IVtk_SelectionMode.SM_CompSolid
SM_Compound = IVtk_SelectionMode.SM_Compound

class IVtk_MeshType(IntEnum):
	MT_Undefined = - 1
	MT_IsoLine = 0
	MT_FreeVertex = 1
	MT_SharedVertex = 2
	MT_FreeEdge = 3
	MT_BoundaryEdge = 4
	MT_SharedEdge = 5
	MT_WireFrameFace = 6
	MT_ShadedFace = 7
	MT_SeamEdge = 8
MT_Undefined = IVtk_MeshType.MT_Undefined
MT_IsoLine = IVtk_MeshType.MT_IsoLine
MT_FreeVertex = IVtk_MeshType.MT_FreeVertex
MT_SharedVertex = IVtk_MeshType.MT_SharedVertex
MT_FreeEdge = IVtk_MeshType.MT_FreeEdge
MT_BoundaryEdge = IVtk_MeshType.MT_BoundaryEdge
MT_SharedEdge = IVtk_MeshType.MT_SharedEdge
MT_WireFrameFace = IVtk_MeshType.MT_WireFrameFace
MT_ShadedFace = IVtk_MeshType.MT_ShadedFace
MT_SeamEdge = IVtk_MeshType.MT_SeamEdge

class IVtk_DisplayMode(IntEnum):
	DM_Wireframe = 0
	DM_Shading = 1
DM_Wireframe = IVtk_DisplayMode.DM_Wireframe
DM_Shading = IVtk_DisplayMode.DM_Shading
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IVtk_Interface)
%wrap_handle(IVtk_IShape)
%wrap_handle(IVtk_IShapeData)
%wrap_handle(IVtk_IShapeMesher)
%wrap_handle(IVtk_IShapePickerAlgo)
%wrap_handle(IVtk_IView)
/* end handles declaration */

/* templates */
%template(IVtk_IdTypeMap) NCollection_Map<IVtk_IdType>;
%template(IVtk_Pnt2dList) NCollection_List<gp_XY>;

%extend NCollection_List<gp_XY> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IVtk_PointIdList) NCollection_List<IVtk_PointId>;

%extend NCollection_List<IVtk_PointId> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IVtk_SelectionModeList) NCollection_List<IVtk_SelectionMode>;

%extend NCollection_List<IVtk_SelectionMode> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IVtk_ShapeIdList) NCollection_List<IVtk_IdType>;

%extend NCollection_List<IVtk_IdType> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IVtk_ShapePtrList) NCollection_List<IVtk_IShape::Handle>;

%extend NCollection_List<IVtk_IShape::Handle> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IVtk_SubShapeMap) NCollection_DataMap<IVtk_IdType,IVtk_ShapeIdList>;
/* end templates declaration */

/* typedefs */
typedef IVtk_IdType IVtk_EdgeId;
typedef IVtk_IdType IVtk_FaceId;
typedef vtkIdType IVtk_IdType;
typedef NCollection_Map <IVtk_IdType> IVtk_IdTypeMap;
typedef NCollection_List <gp_XY> IVtk_Pnt2dList;
typedef IVtk_IdType IVtk_PointId;
typedef NCollection_List <IVtk_PointId> IVtk_PointIdList;
typedef NCollection_List<IVtk_SelectionMode> IVtk_SelectionModeList;
typedef NCollection_List <IVtk_IdType> IVtk_ShapeIdList;
typedef NCollection_List<IVtk_IShape::Handle> IVtk_ShapePtrList;
typedef NCollection_DataMap <IVtk_IdType, IVtk_ShapeIdList> IVtk_SubShapeMap;
/* end typedefs declaration */

/***********************
* class IVtk_Interface *
***********************/
class IVtk_Interface : public Standard_Transient {
	public:
typedef opencascade::handle <IVtk_Interface> Handle;
};


%make_alias(IVtk_Interface)

%extend IVtk_Interface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class IVtk_IShape *
********************/
%nodefaultctor IVtk_IShape;
class IVtk_IShape : public IVtk_Interface {
	public:
typedef opencascade::handle <IVtk_IShape> Handle;
		/****************** GetId ******************/
		/**** md5 signature: 465b8ea98a774003cb018969fc28029b ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "No available documentation.

Returns
-------
IVtk_IdType
") GetId;
		IVtk_IdType GetId();

		/****************** GetSubIds ******************/
		/**** md5 signature: 87501b7c027c1117d7cd34bcd62e75e0 ****/
		%feature("compactdefaultargs") GetSubIds;
		%feature("autodoc", "Get ids of sub-shapes composing a sub-shape with the given id.

Parameters
----------
theId: IVtk_IdType

Returns
-------
IVtk_ShapeIdList
") GetSubIds;
		virtual IVtk_ShapeIdList GetSubIds(const IVtk_IdType theId);

		/****************** SetId ******************/
		/**** md5 signature: de646e8eb2cdb9ce66e4a16711465a7c ****/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
theId: IVtk_IdType

Returns
-------
None
") SetId;
		void SetId(const IVtk_IdType theId);

};


%make_alias(IVtk_IShape)

%extend IVtk_IShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IVtk_IShapeData *
************************/
%nodefaultctor IVtk_IShapeData;
class IVtk_IShapeData : public IVtk_Interface {
	public:
typedef opencascade::handle <IVtk_IShapeData> Handle;
		/****************** InsertCoordinate ******************/
		/**** md5 signature: d88d9ac72f42bd8ef9217406e573f448 ****/
		%feature("compactdefaultargs") InsertCoordinate;
		%feature("autodoc", "Insert a coordinate @param [in] thex x coordinate @param [in] they y coordinate @param [in] thez z coordinate returns id of added point.

Parameters
----------
theX: double
theY: double
theZ: double

Returns
-------
IVtk_PointId
") InsertCoordinate;
		virtual IVtk_PointId InsertCoordinate(double theX, double theY, double theZ);

		/****************** InsertCoordinate ******************/
		/**** md5 signature: 29e344c39c00f17e25618ec25d6ffcb7 ****/
		%feature("compactdefaultargs") InsertCoordinate;
		%feature("autodoc", "Insert a coordinate @param [in] thepnt point position returns id of added point.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
IVtk_PointId
") InsertCoordinate;
		IVtk_PointId InsertCoordinate(const gp_Pnt & thePnt);

		/****************** InsertLine ******************/
		/**** md5 signature: 7cf48504c0d2bf150e7d991d75b1f802 ****/
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "Insert a line. @param [in] theshapeid id of the subshape to which the line belongs. @param [in] thepointid1 id of the first point @param [in] thepointid2 id of the second point @param [in] themeshtype mesh type of the subshape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointId1: IVtk_PointId
thePointId2: IVtk_PointId
theMeshType: IVtk_MeshType,optional
	default value is MT_Undefined

Returns
-------
None
") InsertLine;
		virtual void InsertLine(const IVtk_IdType theShapeID, const IVtk_PointId thePointId1, const IVtk_PointId thePointId2, const IVtk_MeshType theMeshType = MT_Undefined);

		/****************** InsertLine ******************/
		/**** md5 signature: 4754d189e8d720d521852196a5a560f1 ****/
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "Insert a poly-line. @param [in] shapeid id of the subshape to which the polyline belongs. @param [in] pointids vector of point ids @param [in] meshtype mesh type of the subshape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointIds: IVtk_PointIdList *
theMeshType: IVtk_MeshType,optional
	default value is MT_Undefined

Returns
-------
None
") InsertLine;
		virtual void InsertLine(const IVtk_IdType theShapeID, const IVtk_PointIdList * thePointIds, const IVtk_MeshType theMeshType = MT_Undefined);

		/****************** InsertPoint ******************/
		/**** md5 signature: 6bd1c2882b8f9b4f560effd2d3aad922 ****/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "Insert a coordinate @param [in] thepnt point position @param [in] thenorm point normal returns id of added point.

Parameters
----------
thePnt: gp_Pnt
theNorm: NCollection_Vec3<float>

Returns
-------
IVtk_PointId
") InsertPoint;
		virtual IVtk_PointId InsertPoint(const gp_Pnt & thePnt, const NCollection_Vec3<float> & theNorm);

		/****************** InsertTriangle ******************/
		/**** md5 signature: f33e3be4dd28848f2dc915f852736595 ****/
		%feature("compactdefaultargs") InsertTriangle;
		%feature("autodoc", "Insert a triangle @param [in] theshapeid id of the subshape to which the triangle belongs. @param [in] thepointid1 id of the first point @param [in] thepointid2 id of the second point @param [in] thepointid3 id of the third point @param [in] themeshtype mesh type of the subshape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointId1: IVtk_PointId
thePointId2: IVtk_PointId
thePointId3: IVtk_PointId
theMeshType: IVtk_MeshType,optional
	default value is MT_Undefined

Returns
-------
None
") InsertTriangle;
		virtual void InsertTriangle(const IVtk_IdType theShapeID, const IVtk_PointId thePointId1, const IVtk_PointId thePointId2, const IVtk_PointId thePointId3, const IVtk_MeshType theMeshType = MT_Undefined);

		/****************** InsertVertex ******************/
		/**** md5 signature: 7e6d6c0044df8a54280b71709a65cade ****/
		%feature("compactdefaultargs") InsertVertex;
		%feature("autodoc", "Insert a vertex. @param [in] theshapeid id of the sub-shape to which the vertex belongs. @param [in] thepointid id of the point that defines the coordinates of the vertex @param [in] themeshtype mesh type of the sub-shape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointId: IVtk_PointId
theMeshType: IVtk_MeshType,optional
	default value is MT_Undefined

Returns
-------
None
") InsertVertex;
		virtual void InsertVertex(const IVtk_IdType theShapeID, const IVtk_PointId thePointId, const IVtk_MeshType theMeshType = MT_Undefined);

};


%make_alias(IVtk_IShapeData)

%extend IVtk_IShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IVtk_IShapeMesher *
**************************/
%nodefaultctor IVtk_IShapeMesher;
class IVtk_IShapeMesher : public IVtk_Interface {
	public:
typedef opencascade::handle <IVtk_IShapeMesher> Handle;
		/****************** Build ******************/
		/**** md5 signature: 069e6a1e96f7ecb4221ea12569c4b926 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Main entry point for building shape representation @param [in] shape ishape to be meshed @param [in] data ishapedata interface visualization data is passed to.

Parameters
----------
theShape: IVtk_IShape::Handle
theData: IVtk_IShapeData::Handle

Returns
-------
None
") Build;
		void Build(const IVtk_IShape::Handle & theShape, const IVtk_IShapeData::Handle & theData);

};


%make_alias(IVtk_IShapeMesher)

%extend IVtk_IShapeMesher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IVtk_IShapePickerAlgo *
******************************/
%nodefaultctor IVtk_IShapePickerAlgo;
class IVtk_IShapePickerAlgo : public IVtk_Interface {
	public:
typedef opencascade::handle <IVtk_IShapePickerAlgo> Handle;
		/****************** GetSelectionModes ******************/
		/**** md5 signature: e01ae27e5dea53b92b70250689f8eb82 ****/
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
		/**** md5 signature: e80ab95e8069727e3a8e8e166aef6fee ****/
		%feature("compactdefaultargs") NbPicked;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPicked;
		virtual int NbPicked();

		/****************** Pick ******************/
		/**** md5 signature: 5c80e519a5f9a09914dcd636d3a7d74c ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "No available documentation.

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
		/**** md5 signature: 82b15a90e5c74d63ff6228623dce542f ****/
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
		/**** md5 signature: b45431a3b1fbc7c084360c6db7b5e84c ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "No available documentation.

Parameters
----------
: double * *
theNbPoints: int

Returns
-------
bool
") Pick;
		virtual bool Pick(double * * , const int theNbPoints);

		/****************** SetSelectionMode ******************/
		/**** md5 signature: 5dd415fa35bedb3851d11ff433c98167 ****/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "Activates/deactivates the given selection mode for the shape. if mode == sm_none, the shape becomes non-selectable and is removed from the internal selection data. @param [in] theshape shape for which the selection mode should be activated @param [in] themode selection mode to be activated @param [in] theisturnon flag to turn on/off the selection mode.

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
		/**** md5 signature: 215ba1ffccf4694da4807132cd934610 ****/
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
		/**** md5 signature: aa9d441fd8a6cfc1b5bf0d43a4a746b9 ****/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "No available documentation.

Parameters
----------
theView: IVtk_IView::Handle

Returns
-------
None
") SetView;
		virtual void SetView(const IVtk_IView::Handle & theView);

		/****************** ShapesPicked ******************/
		/**** md5 signature: 5c97ae6b3afb5fb630e68a7e38704fe7 ****/
		%feature("compactdefaultargs") ShapesPicked;
		%feature("autodoc", "Returns the list of picked top-level shape ids, in the order of increasing depth (the id of the shape closest to the eye is the first in the list).

Returns
-------
IVtk_ShapeIdList
") ShapesPicked;
		virtual const IVtk_ShapeIdList & ShapesPicked();

		/****************** SubShapesPicked ******************/
		/**** md5 signature: f949184dd1e016df942382f572f9ce42 ****/
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

};


%make_alias(IVtk_IShapePickerAlgo)

%extend IVtk_IShapePickerAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class IVtk_IView *
*******************/
%nodefaultctor IVtk_IView;
class IVtk_IView : public IVtk_Interface {
	public:
typedef opencascade::handle <IVtk_IView> Handle;
		/****************** DisplayToWorld ******************/
		/**** md5 signature: bdf57e92477d3843d0c9d425fd216dbe ****/
		%feature("compactdefaultargs") DisplayToWorld;
		%feature("autodoc", "Converts 3d display coordinates into 3d world coordinates. @param [in] thedisplaypnt 2d point of display coordinates @param [out] theworldpnt 3d point of world coordinates returns true if conversion was successful, false otherwise.

Parameters
----------
theDisplayPnt: gp_XY
theWorldPnt: gp_XYZ

Returns
-------
bool
") DisplayToWorld;
		virtual bool DisplayToWorld(const gp_XY & theDisplayPnt, gp_XYZ & theWorldPnt);

		/****************** GetAspectRatio ******************/
		/**** md5 signature: f41f5f45b0c146460450b917be90dc77 ****/
		%feature("compactdefaultargs") GetAspectRatio;
		%feature("autodoc", "Returns the current view the aspect ratio.

Returns
-------
double
") GetAspectRatio;
		virtual double GetAspectRatio();

		/****************** GetCamera ******************/
		/**** md5 signature: 2bf9890e4cae44a1ed9a37a8b6498253 ****/
		%feature("compactdefaultargs") GetCamera;
		%feature("autodoc", "Gets camera projection and orientation matrices.

Parameters
----------
theProj: Graphic3d_Mat4d
theOrient: Graphic3d_Mat4d

Returns
-------
theIsOrtho: bool
") GetCamera;
		virtual void GetCamera(Graphic3d_Mat4d & theProj, Graphic3d_Mat4d & theOrient, Standard_Boolean &OutValue);

		/****************** GetClippingRange ******************/
		/**** md5 signature: bdbfa7cca7c25ac677b8c4839f438ca4 ****/
		%feature("compactdefaultargs") GetClippingRange;
		%feature("autodoc", "Returns the location of the near and far clipping planes along the direction of projection.

Parameters
----------

Returns
-------
theZNear: double
theZFar: double
") GetClippingRange;
		virtual void GetClippingRange(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetDirectionOfProjection ******************/
		/**** md5 signature: 0a2d5816e4219e76a9625b98d93cdbb1 ****/
		%feature("compactdefaultargs") GetDirectionOfProjection;
		%feature("autodoc", "Returns the projection direction vector of this view.

Parameters
----------

Returns
-------
theDx: double
theDy: double
theDz: double
") GetDirectionOfProjection;
		virtual void GetDirectionOfProjection(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetDistance ******************/
		/**** md5 signature: 399f3fa712e54955214ac8384272d2a9 ****/
		%feature("compactdefaultargs") GetDistance;
		%feature("autodoc", "Returns the focal distance of the view.

Returns
-------
double
") GetDistance;
		virtual double GetDistance();

		/****************** GetEyePosition ******************/
		/**** md5 signature: 84d3644f5d37c5f1815709d2526f76b3 ****/
		%feature("compactdefaultargs") GetEyePosition;
		%feature("autodoc", "Returns the world coordinates of the camera position.

Parameters
----------

Returns
-------
theX: double
theY: double
theZ: double
") GetEyePosition;
		virtual void GetEyePosition(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetParallelScale ******************/
		/**** md5 signature: 54bc71befa5ee236ae0ff19254827733 ****/
		%feature("compactdefaultargs") GetParallelScale;
		%feature("autodoc", "Returns the current view's zoom factor (for parallel projection).

Returns
-------
double
") GetParallelScale;
		virtual double GetParallelScale();

		/****************** GetPosition ******************/
		/**** md5 signature: 6d4f5ebff610235ddd88c17e75e79e5e ****/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "Returns the world coordinates of the view position.

Parameters
----------

Returns
-------
theX: double
theY: double
theZ: double
") GetPosition;
		virtual void GetPosition(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetScale ******************/
		/**** md5 signature: fd201fbf4c303472fe7d1471b3e1fab0 ****/
		%feature("compactdefaultargs") GetScale;
		%feature("autodoc", "Returns three doubles containing scale components of the view transformation.

Parameters
----------

Returns
-------
theX: double
theY: double
theZ: double
") GetScale;
		virtual void GetScale(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetViewAngle ******************/
		/**** md5 signature: 0b96f8cdde09bd0d039ba8ff81a8e68e ****/
		%feature("compactdefaultargs") GetViewAngle;
		%feature("autodoc", "Returns the current view angle (for perspective projection).

Returns
-------
double
") GetViewAngle;
		virtual double GetViewAngle();

		/****************** GetViewCenter ******************/
		/**** md5 signature: 8fd407cfc4ff6d660b6c2be2212f29f8 ****/
		%feature("compactdefaultargs") GetViewCenter;
		%feature("autodoc", "Returns two doubles containing the display coordinates of the view window center .

Parameters
----------

Returns
-------
theX: double
theY: double
") GetViewCenter;
		virtual void GetViewCenter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetViewUp ******************/
		/**** md5 signature: 8a8b85cfa439663cbb25644caa53e3f4 ****/
		%feature("compactdefaultargs") GetViewUp;
		%feature("autodoc", "Returns the 'view up' direction of the view.

Parameters
----------

Returns
-------
theDx: double
theDy: double
theDz: double
") GetViewUp;
		virtual void GetViewUp(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetViewport ******************/
		/**** md5 signature: f42d47f07441a2edf33a1e85e44a8396 ****/
		%feature("compactdefaultargs") GetViewport;
		%feature("autodoc", "Gets viewport coordinates.

Parameters
----------

Returns
-------
theX: float
theY: float
theWidth: float
theHeight: float
") GetViewport;
		virtual void GetViewport(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetWindowSize ******************/
		/**** md5 signature: ec0c0b43f4ffb86772753fd8ad24dcda ****/
		%feature("compactdefaultargs") GetWindowSize;
		%feature("autodoc", "Gets window size in screen coordinates in pixels.

Parameters
----------

Returns
-------
theX: int
theY: int
") GetWindowSize;
		virtual void GetWindowSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsPerspective ******************/
		/**** md5 signature: e029c601602bfd743c0591af0957bff9 ****/
		%feature("compactdefaultargs") IsPerspective;
		%feature("autodoc", "Returns true if this is a perspective view, and false otherwise.

Returns
-------
bool
") IsPerspective;
		virtual bool IsPerspective();

};


%make_alias(IVtk_IView)

%extend IVtk_IView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
IVtk_EdgeId=IVtk_IdType
IVtk_FaceId=IVtk_IdType
IVtk_PointId=IVtk_IdType
}
