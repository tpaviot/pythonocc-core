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
%define IVTKVTKDOCSTRING
"IVtkVTK module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_ivtkvtk.html"
%enddef
%module (package="OCC.Core", docstring=IVTKVTKDOCSTRING) IVtkVTK


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
#include<IVtkVTK_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IVtk_module.hxx>
#include<gp_module.hxx>
#include<Graphic3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IVtk.i
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
%wrap_handle(IVtkVTK_ShapeData)
%wrap_handle(IVtkVTK_View)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************
* class IVtkVTK_ShapeData *
**************************/
class IVtkVTK_ShapeData : public IVtk_IShapeData {
	public:
typedef opencascade::handle <IVtkVTK_ShapeData> Handle;
		/****************** IVtkVTK_ShapeData ******************/
		/**** md5 signature: e1545288abcc262ac7d346f0ac48a8c0 ****/
		%feature("compactdefaultargs") IVtkVTK_ShapeData;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IVtkVTK_ShapeData;
		 IVtkVTK_ShapeData();

		/****************** ARRNAME_MESH_TYPES ******************/
		/**** md5 signature: c8df2819ddd6352792a031f001a59da6 ****/
		%feature("compactdefaultargs") ARRNAME_MESH_TYPES;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") ARRNAME_MESH_TYPES;
		static const char * ARRNAME_MESH_TYPES();

		/****************** ARRNAME_SUBSHAPE_IDS ******************/
		/**** md5 signature: adc6d38f0939f1fd6eaee98df1565f6a ****/
		%feature("compactdefaultargs") ARRNAME_SUBSHAPE_IDS;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") ARRNAME_SUBSHAPE_IDS;
		static const char * ARRNAME_SUBSHAPE_IDS();

		/****************** InsertLine ******************/
		/**** md5 signature: 73a0fde2acdd864d085d2acd26b4977f ****/
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "Insert a line. @param [in] theshapeid id of the subshape to which the line belongs. @param [in] thepointid1 id of the first point @param [in] thepointid2 id of the second point @param [in] themeshtype mesh type of the subshape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointId1: IVtk_PointId
thePointId2: IVtk_PointId
theMeshType: IVtk_MeshType

Returns
-------
None
") InsertLine;
		virtual void InsertLine(const IVtk_IdType theShapeID, const IVtk_PointId thePointId1, const IVtk_PointId thePointId2, const IVtk_MeshType theMeshType);

		/****************** InsertLine ******************/
		/**** md5 signature: b53cbabb302ac9839e8644a44e0a05eb ****/
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "Insert a poly-line. @param [in] theshapeid id of the subshape to which the polyline belongs. @param [in] thepointids vector of point ids @param [in] themeshtype mesh type of the subshape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointIds: IVtk_PointIdList *
theMeshType: IVtk_MeshType

Returns
-------
None
") InsertLine;
		virtual void InsertLine(const IVtk_IdType theShapeID, const IVtk_PointIdList * thePointIds, const IVtk_MeshType theMeshType);

		/****************** InsertPoint ******************/
		/**** md5 signature: 06fbb878d4a77c624a149e041cf3e101 ****/
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
		/**** md5 signature: ca1b72478523b8c5fcc65bcb8751f101 ****/
		%feature("compactdefaultargs") InsertTriangle;
		%feature("autodoc", "Insert a triangle @param [in] theshapeid id of the subshape to which the triangle belongs. @param [in] thepointid1 id of the first point @param [in] thepointid2 id of the second point @param [in] thepointid3 id of the third point @param [in] themeshtype mesh type of the subshape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointId1: IVtk_PointId
thePointId2: IVtk_PointId
thePointId3: IVtk_PointId
theMeshType: IVtk_MeshType

Returns
-------
None
") InsertTriangle;
		virtual void InsertTriangle(const IVtk_IdType theShapeID, const IVtk_PointId thePointId1, const IVtk_PointId thePointId2, const IVtk_PointId thePointId3, const IVtk_MeshType theMeshType);

		/****************** InsertVertex ******************/
		/**** md5 signature: 81d8a3854504de8eaf0cbf8720374479 ****/
		%feature("compactdefaultargs") InsertVertex;
		%feature("autodoc", "Insert a vertex. @param [in] theshapeid id of the subshape to which the vertex belongs. @param [in] thepointid id of the point that defines the coordinates of the vertex @param [in] themeshtype mesh type of the subshape (mt_undefined by default).

Parameters
----------
theShapeID: IVtk_IdType
thePointId: IVtk_PointId
theMeshType: IVtk_MeshType

Returns
-------
None
") InsertVertex;
		virtual void InsertVertex(const IVtk_IdType theShapeID, const IVtk_PointId thePointId, const IVtk_MeshType theMeshType);

		/****************** getVtkPolyData ******************/
		/**** md5 signature: 7e1fe614fc75e6289b33045f8f880a72 ****/
		%feature("compactdefaultargs") getVtkPolyData;
		%feature("autodoc", "@name specific methods get vtk polydata. returns vtk polydata.

Returns
-------
vtkPolyData *
") getVtkPolyData;
		vtkPolyData * getVtkPolyData();

};


%make_alias(IVtkVTK_ShapeData)

%extend IVtkVTK_ShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class IVtkVTK_View *
*********************/
class IVtkVTK_View : public IVtk_IView {
	public:
typedef opencascade::handle <IVtkVTK_View> Handle;
		/****************** IVtkVTK_View ******************/
		/**** md5 signature: 13bbc96849c52ccb2acac3258254a0c4 ****/
		%feature("compactdefaultargs") IVtkVTK_View;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRenderer: vtkRenderer *

Returns
-------
None
") IVtkVTK_View;
		 IVtkVTK_View(vtkRenderer * theRenderer);

		/****************** DisplayToWorld ******************/
		/**** md5 signature: c14b8a7cae1cff2d5a505cc19eec9341 ****/
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
		/**** md5 signature: 2440dad9a887ec23f249835bce25203c ****/
		%feature("compactdefaultargs") GetAspectRatio;
		%feature("autodoc", "Returns the current view the aspect ratio.

Returns
-------
double
") GetAspectRatio;
		virtual double GetAspectRatio();

		/****************** GetCamera ******************/
		/**** md5 signature: 71f40dfd6be4d9e2b889735a2b7d4738 ****/
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
		/**** md5 signature: ad13606afb9e7c1335b6a3ee3be05949 ****/
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
		/**** md5 signature: 83fb4451719b0216a3b71bded759a3e4 ****/
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
		/**** md5 signature: f41d383dbd986b52028619053ac7e39c ****/
		%feature("compactdefaultargs") GetDistance;
		%feature("autodoc", "Returns the focal distance of the view.

Returns
-------
double
") GetDistance;
		virtual double GetDistance();

		/****************** GetEyePosition ******************/
		/**** md5 signature: 2be2d6a1e3a06c55e902cd949a79b918 ****/
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
		/**** md5 signature: 86c48c7050103a61c0abfaf24bd26739 ****/
		%feature("compactdefaultargs") GetParallelScale;
		%feature("autodoc", "Returns the current view's zoom factor (for parallel projection).

Returns
-------
double
") GetParallelScale;
		virtual double GetParallelScale();

		/****************** GetPosition ******************/
		/**** md5 signature: 1752a48462335e535b6b0780cea0c910 ****/
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
		/**** md5 signature: 306cddcb4a75ee2eabd0f042637d51a2 ****/
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
		/**** md5 signature: f31f79df7a7f9369bf8a5b10ee2bf917 ****/
		%feature("compactdefaultargs") GetViewAngle;
		%feature("autodoc", "Returns the current view angle (for perspective projection).

Returns
-------
double
") GetViewAngle;
		virtual double GetViewAngle();

		/****************** GetViewCenter ******************/
		/**** md5 signature: ed0dcec58d4f390efe108060ca27e4ce ****/
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
		/**** md5 signature: 7480db5ce484894a2e2e5d43ed672f6c ****/
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
		/**** md5 signature: 185d60388c3ac66fbd4fa9cad6439d1b ****/
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
		/**** md5 signature: c012e64c6c82361f8d515254d484a1d6 ****/
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
		/**** md5 signature: 6784aaf09901e21c49b28d45066b471b ****/
		%feature("compactdefaultargs") IsPerspective;
		%feature("autodoc", "Returns true if this is a perspective view, and false otherwise.

Returns
-------
bool
") IsPerspective;
		virtual bool IsPerspective();

};


%make_alias(IVtkVTK_View)

%extend IVtkVTK_View {
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
