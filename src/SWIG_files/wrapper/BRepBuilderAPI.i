/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPBUILDERAPIDOCSTRING
"BRepBuilderAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepbuilderapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPBUILDERAPIDOCSTRING) BRepBuilderAPI


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
#include<BRepBuilderAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<BRepTools_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2d_module.hxx>
#include<BRep_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import TopoDS.i
%import TopTools.i
%import BRepTools.i
%import Message.i
%import gp.i
%import TColStd.i
%import Bnd.i
%import Geom2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepBuilderAPI_ShapeModification {
	BRepBuilderAPI_Preserved = 0,
	BRepBuilderAPI_Deleted = 1,
	BRepBuilderAPI_Trimmed = 2,
	BRepBuilderAPI_Merged = 3,
	BRepBuilderAPI_BoundaryModified = 4,
};

enum BRepBuilderAPI_WireError {
	BRepBuilderAPI_WireDone = 0,
	BRepBuilderAPI_EmptyWire = 1,
	BRepBuilderAPI_DisconnectedWire = 2,
	BRepBuilderAPI_NonManifoldWire = 3,
};

enum BRepBuilderAPI_EdgeError {
	BRepBuilderAPI_EdgeDone = 0,
	BRepBuilderAPI_PointProjectionFailed = 1,
	BRepBuilderAPI_ParameterOutOfRange = 2,
	BRepBuilderAPI_DifferentPointsOnClosedCurve = 3,
	BRepBuilderAPI_PointWithInfiniteParameter = 4,
	BRepBuilderAPI_DifferentsPointAndParameter = 5,
	BRepBuilderAPI_LineThroughIdenticPoints = 6,
};

enum BRepBuilderAPI_PipeError {
	BRepBuilderAPI_PipeDone = 0,
	BRepBuilderAPI_PipeNotDone = 1,
	BRepBuilderAPI_PlaneNotIntersectGuide = 2,
	BRepBuilderAPI_ImpossibleContact = 3,
};

enum BRepBuilderAPI_TransitionMode {
	BRepBuilderAPI_Transformed = 0,
	BRepBuilderAPI_RightCorner = 1,
	BRepBuilderAPI_RoundCorner = 2,
};

enum BRepBuilderAPI_FaceError {
	BRepBuilderAPI_FaceDone = 0,
	BRepBuilderAPI_NoFace = 1,
	BRepBuilderAPI_NotPlanar = 2,
	BRepBuilderAPI_CurveProjectionFailed = 3,
	BRepBuilderAPI_ParametersOutOfRange = 4,
};

enum BRepBuilderAPI_ShellError {
	BRepBuilderAPI_ShellDone = 0,
	BRepBuilderAPI_EmptyShell = 1,
	BRepBuilderAPI_DisconnectedShell = 2,
	BRepBuilderAPI_ShellParametersOutOfRange = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BRepBuilderAPI_ShapeModification(IntEnum):
	BRepBuilderAPI_Preserved = 0
	BRepBuilderAPI_Deleted = 1
	BRepBuilderAPI_Trimmed = 2
	BRepBuilderAPI_Merged = 3
	BRepBuilderAPI_BoundaryModified = 4
BRepBuilderAPI_Preserved = BRepBuilderAPI_ShapeModification.BRepBuilderAPI_Preserved
BRepBuilderAPI_Deleted = BRepBuilderAPI_ShapeModification.BRepBuilderAPI_Deleted
BRepBuilderAPI_Trimmed = BRepBuilderAPI_ShapeModification.BRepBuilderAPI_Trimmed
BRepBuilderAPI_Merged = BRepBuilderAPI_ShapeModification.BRepBuilderAPI_Merged
BRepBuilderAPI_BoundaryModified = BRepBuilderAPI_ShapeModification.BRepBuilderAPI_BoundaryModified

class BRepBuilderAPI_WireError(IntEnum):
	BRepBuilderAPI_WireDone = 0
	BRepBuilderAPI_EmptyWire = 1
	BRepBuilderAPI_DisconnectedWire = 2
	BRepBuilderAPI_NonManifoldWire = 3
BRepBuilderAPI_WireDone = BRepBuilderAPI_WireError.BRepBuilderAPI_WireDone
BRepBuilderAPI_EmptyWire = BRepBuilderAPI_WireError.BRepBuilderAPI_EmptyWire
BRepBuilderAPI_DisconnectedWire = BRepBuilderAPI_WireError.BRepBuilderAPI_DisconnectedWire
BRepBuilderAPI_NonManifoldWire = BRepBuilderAPI_WireError.BRepBuilderAPI_NonManifoldWire

class BRepBuilderAPI_EdgeError(IntEnum):
	BRepBuilderAPI_EdgeDone = 0
	BRepBuilderAPI_PointProjectionFailed = 1
	BRepBuilderAPI_ParameterOutOfRange = 2
	BRepBuilderAPI_DifferentPointsOnClosedCurve = 3
	BRepBuilderAPI_PointWithInfiniteParameter = 4
	BRepBuilderAPI_DifferentsPointAndParameter = 5
	BRepBuilderAPI_LineThroughIdenticPoints = 6
BRepBuilderAPI_EdgeDone = BRepBuilderAPI_EdgeError.BRepBuilderAPI_EdgeDone
BRepBuilderAPI_PointProjectionFailed = BRepBuilderAPI_EdgeError.BRepBuilderAPI_PointProjectionFailed
BRepBuilderAPI_ParameterOutOfRange = BRepBuilderAPI_EdgeError.BRepBuilderAPI_ParameterOutOfRange
BRepBuilderAPI_DifferentPointsOnClosedCurve = BRepBuilderAPI_EdgeError.BRepBuilderAPI_DifferentPointsOnClosedCurve
BRepBuilderAPI_PointWithInfiniteParameter = BRepBuilderAPI_EdgeError.BRepBuilderAPI_PointWithInfiniteParameter
BRepBuilderAPI_DifferentsPointAndParameter = BRepBuilderAPI_EdgeError.BRepBuilderAPI_DifferentsPointAndParameter
BRepBuilderAPI_LineThroughIdenticPoints = BRepBuilderAPI_EdgeError.BRepBuilderAPI_LineThroughIdenticPoints

class BRepBuilderAPI_PipeError(IntEnum):
	BRepBuilderAPI_PipeDone = 0
	BRepBuilderAPI_PipeNotDone = 1
	BRepBuilderAPI_PlaneNotIntersectGuide = 2
	BRepBuilderAPI_ImpossibleContact = 3
BRepBuilderAPI_PipeDone = BRepBuilderAPI_PipeError.BRepBuilderAPI_PipeDone
BRepBuilderAPI_PipeNotDone = BRepBuilderAPI_PipeError.BRepBuilderAPI_PipeNotDone
BRepBuilderAPI_PlaneNotIntersectGuide = BRepBuilderAPI_PipeError.BRepBuilderAPI_PlaneNotIntersectGuide
BRepBuilderAPI_ImpossibleContact = BRepBuilderAPI_PipeError.BRepBuilderAPI_ImpossibleContact

class BRepBuilderAPI_TransitionMode(IntEnum):
	BRepBuilderAPI_Transformed = 0
	BRepBuilderAPI_RightCorner = 1
	BRepBuilderAPI_RoundCorner = 2
BRepBuilderAPI_Transformed = BRepBuilderAPI_TransitionMode.BRepBuilderAPI_Transformed
BRepBuilderAPI_RightCorner = BRepBuilderAPI_TransitionMode.BRepBuilderAPI_RightCorner
BRepBuilderAPI_RoundCorner = BRepBuilderAPI_TransitionMode.BRepBuilderAPI_RoundCorner

class BRepBuilderAPI_FaceError(IntEnum):
	BRepBuilderAPI_FaceDone = 0
	BRepBuilderAPI_NoFace = 1
	BRepBuilderAPI_NotPlanar = 2
	BRepBuilderAPI_CurveProjectionFailed = 3
	BRepBuilderAPI_ParametersOutOfRange = 4
BRepBuilderAPI_FaceDone = BRepBuilderAPI_FaceError.BRepBuilderAPI_FaceDone
BRepBuilderAPI_NoFace = BRepBuilderAPI_FaceError.BRepBuilderAPI_NoFace
BRepBuilderAPI_NotPlanar = BRepBuilderAPI_FaceError.BRepBuilderAPI_NotPlanar
BRepBuilderAPI_CurveProjectionFailed = BRepBuilderAPI_FaceError.BRepBuilderAPI_CurveProjectionFailed
BRepBuilderAPI_ParametersOutOfRange = BRepBuilderAPI_FaceError.BRepBuilderAPI_ParametersOutOfRange

class BRepBuilderAPI_ShellError(IntEnum):
	BRepBuilderAPI_ShellDone = 0
	BRepBuilderAPI_EmptyShell = 1
	BRepBuilderAPI_DisconnectedShell = 2
	BRepBuilderAPI_ShellParametersOutOfRange = 3
BRepBuilderAPI_ShellDone = BRepBuilderAPI_ShellError.BRepBuilderAPI_ShellDone
BRepBuilderAPI_EmptyShell = BRepBuilderAPI_ShellError.BRepBuilderAPI_EmptyShell
BRepBuilderAPI_DisconnectedShell = BRepBuilderAPI_ShellError.BRepBuilderAPI_DisconnectedShell
BRepBuilderAPI_ShellParametersOutOfRange = BRepBuilderAPI_ShellError.BRepBuilderAPI_ShellParametersOutOfRange
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepBuilderAPI_FastSewing)
%wrap_handle(BRepBuilderAPI_Sewing)
/* end handles declaration */

/* templates */
%template(BRepBuilderAPI_BndBoxTree) NCollection_UBTree<Standard_Integer,Bnd_Box>;
/* end templates declaration */

/* typedefs */
typedef NCollection_UBTree<Standard_Integer, Bnd_Box> BRepBuilderAPI_BndBoxTree;
typedef NCollection_CellFilter<BRepBuilderAPI_VertexInspector> BRepBuilderAPI_CellFilter;
typedef NCollection_Vector<gp_XYZ> VectorOfPoint;
/* end typedefs declaration */

/***********************
* class BRepBuilderAPI *
***********************/
%rename(brepbuilderapi) BRepBuilderAPI;
class BRepBuilderAPI {
	public:
		/****************** Plane ******************/
		/**** md5 signature: 215779db6a724a03f9f8ce477370cef4 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Sets the current plane.

Parameters
----------
P: Geom_Plane

Returns
-------
None
") Plane;
		static void Plane(const opencascade::handle<Geom_Plane> & P);

		/****************** Plane ******************/
		/**** md5 signature: 6d27cd1f706ac4d5f7ea5e003d1302b0 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the current plane.

Returns
-------
opencascade::handle<Geom_Plane>
") Plane;
		static const opencascade::handle<Geom_Plane> & Plane();

		/****************** Precision ******************/
		/**** md5 signature: ced9db4ac4e8a407df5972bac5488688 ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Sets the default precision. the current precision is returned.

Parameters
----------
P: float

Returns
-------
None
") Precision;
		static void Precision(const Standard_Real P);

		/****************** Precision ******************/
		/**** md5 signature: 5a0c763be80263f1e28f9182713f12dc ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns the default precision.

Returns
-------
float
") Precision;
		static Standard_Real Precision();

};


%extend BRepBuilderAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepBuilderAPI_Collect *
*******************************/
class BRepBuilderAPI_Collect {
	public:
		/****************** BRepBuilderAPI_Collect ******************/
		/**** md5 signature: 389c61cabe5e3b0cdaed5ff1824ab60c ****/
		%feature("compactdefaultargs") BRepBuilderAPI_Collect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBuilderAPI_Collect;
		 BRepBuilderAPI_Collect();

		/****************** Add ******************/
		/**** md5 signature: a5c5cb395419acc4c81c2fc73ccd4b50 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
SI: TopoDS_Shape
MKS: BRepBuilderAPI_MakeShape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & SI, BRepBuilderAPI_MakeShape & MKS);

		/****************** AddGenerated ******************/
		/**** md5 signature: 24d2f071681238ae41ddf97ad14ec2c3 ****/
		%feature("compactdefaultargs") AddGenerated;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Gen: TopoDS_Shape

Returns
-------
None
") AddGenerated;
		void AddGenerated(const TopoDS_Shape & S, const TopoDS_Shape & Gen);

		/****************** AddModif ******************/
		/**** md5 signature: d42b5cf3b841c945de9d3d65afeede81 ****/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Mod: TopoDS_Shape

Returns
-------
None
") AddModif;
		void AddModif(const TopoDS_Shape & S, const TopoDS_Shape & Mod);

		/****************** Filter ******************/
		/**** md5 signature: 0a1acafd79b78748618f690fbfb61533 ****/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "No available documentation.

Parameters
----------
SF: TopoDS_Shape

Returns
-------
None
") Filter;
		void Filter(const TopoDS_Shape & SF);

		/****************** Generated ******************/
		/**** md5 signature: 176507b5ffd0100ab7a88bdc3ba1ff71 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_DataMapOfShapeListOfShape
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated();

		/****************** Modification ******************/
		/**** md5 signature: 8146072a56cfb726ec8891f6d418e953 ****/
		%feature("compactdefaultargs") Modification;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_DataMapOfShapeListOfShape
") Modification;
		const TopTools_DataMapOfShapeListOfShape & Modification();

};


%extend BRepBuilderAPI_Collect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepBuilderAPI_Command *
*******************************/
%nodefaultctor BRepBuilderAPI_Command;
class BRepBuilderAPI_Command {
	public:
		/****************** Check ******************/
		/**** md5 signature: f34c3545e20ecd4b70f0028e921e213b ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Raises notdone if done is false.

Returns
-------
None
") Check;
		void Check();

		/****************** IsDone ******************/
		/**** md5 signature: 1dfe5875b8bc7f7b11380fb4ab8a9eb0 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

};


%extend BRepBuilderAPI_Command {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_FastSewing *
**********************************/
class BRepBuilderAPI_FastSewing : public Standard_Transient {
	public:
typedef unsigned int FS_VARStatuses;
		class FS_Vertex {};
		class FS_Face {};
		class FS_Edge {};
		class NodeInspector {};
/* public enums */
enum FS_Statuses {
	FS_OK = 0,
	FS_Degenerated = 1,
	FS_FindVertexError = 2,
	FS_FindEdgeError = 4,
	FS_FaceWithNullSurface = 8,
	FS_NotNaturalBoundsFace = 16,
	FS_InfiniteSurface = 32,
	FS_EmptyInput = 64,
	FS_Exception = 128,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class FS_Statuses(IntEnum):
	FS_OK = 0
	FS_Degenerated = 1
	FS_FindVertexError = 2
	FS_FindEdgeError = 4
	FS_FaceWithNullSurface = 8
	FS_NotNaturalBoundsFace = 16
	FS_InfiniteSurface = 32
	FS_EmptyInput = 64
	FS_Exception = 128
FS_OK = FS_Statuses.FS_OK
FS_Degenerated = FS_Statuses.FS_Degenerated
FS_FindVertexError = FS_Statuses.FS_FindVertexError
FS_FindEdgeError = FS_Statuses.FS_FindEdgeError
FS_FaceWithNullSurface = FS_Statuses.FS_FaceWithNullSurface
FS_NotNaturalBoundsFace = FS_Statuses.FS_NotNaturalBoundsFace
FS_InfiniteSurface = FS_Statuses.FS_InfiniteSurface
FS_EmptyInput = FS_Statuses.FS_EmptyInput
FS_Exception = FS_Statuses.FS_Exception
};
/* end python proxy for enums */

		/****************** BRepBuilderAPI_FastSewing ******************/
		/**** md5 signature: 5cdf281365d4a008fe89ed2644d07eef ****/
		%feature("compactdefaultargs") BRepBuilderAPI_FastSewing;
		%feature("autodoc", "Creates an object with tolerance of connexity.

Parameters
----------
theTolerance: float,optional
	default value is 1.0e-06

Returns
-------
None
") BRepBuilderAPI_FastSewing;
		 BRepBuilderAPI_FastSewing(const Standard_Real theTolerance = 1.0e-06);

		/****************** Add ******************/
		/**** md5 signature: 68dfa588b1680a2069907b2bf05e1c65 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds faces of a shape.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopoDS_Shape & theShape);

		/****************** Add ******************/
		/**** md5 signature: 5c877fb8c71029cef3b4fa5692a20197 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a surface.

Parameters
----------
theSurface: Geom_Surface

Returns
-------
bool
") Add;
		Standard_Boolean Add(const opencascade::handle<Geom_Surface> & theSurface);

		/****************** GetResult ******************/
		/**** md5 signature: 9bb8729ba64a056c1d3bbe9695c34e70 ****/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Returns resulted shape.

Returns
-------
TopoDS_Shape
") GetResult;
		const TopoDS_Shape GetResult();

		/****************** GetTolerance ******************/
		/**** md5 signature: 08094ae040a166d1b252ee02000bca27 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns tolerance.

Returns
-------
float
") GetTolerance;
		Standard_Real GetTolerance();

		/****************** Perform ******************/
		/**** md5 signature: edb59e2ca9c97ae6c4d9ce2566330337 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute resulted shape.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetTolerance ******************/
		/**** md5 signature: 4181eb50f502c475b9b01c03a6a70db9 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

Parameters
----------
theToler: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theToler);

};


%make_alias(BRepBuilderAPI_FastSewing)

%extend BRepBuilderAPI_FastSewing {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetStatuses(self):
		pass
	}
};

/*********************************
* class BRepBuilderAPI_FindPlane *
*********************************/
class BRepBuilderAPI_FindPlane {
	public:
		/****************** BRepBuilderAPI_FindPlane ******************/
		/**** md5 signature: ef4ea376286fb1ede698f0b19cc4f429 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "Initializes an empty algorithm. the function init is then used to define the shape.

Returns
-------
None
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane();

		/****************** BRepBuilderAPI_FindPlane ******************/
		/**** md5 signature: 763aa4ae1a7235c1609845cf21bc92e2 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "Constructs the plane containing the edges of the shape s. a plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. this tolerance value is equal to the larger of the following two values: - tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of s. use the function found to verify that a plane is built. the resulting plane is then retrieved using the function plane.

Parameters
----------
S: TopoDS_Shape
Tol: float,optional
	default value is -1

Returns
-------
None
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane(const TopoDS_Shape & S, const Standard_Real Tol = -1);

		/****************** Found ******************/
		/**** md5 signature: f98a87b5981b48fa74222eaa5aa8feb6 ****/
		%feature("compactdefaultargs") Found;
		%feature("autodoc", "Returns true if a plane containing the edges of the shape is found and built. use the function plane to consult the result.

Returns
-------
bool
") Found;
		Standard_Boolean Found();

		/****************** Init ******************/
		/**** md5 signature: 4d646163f720cb1bdaa4671839b00b98 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Constructs the plane containing the edges of the shape s. a plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. this tolerance value is equal to the larger of the following two values: - tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of s. use the function found to verify that a plane is built. the resulting plane is then retrieved using the function plane.

Parameters
----------
S: TopoDS_Shape
Tol: float,optional
	default value is -1

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Real Tol = -1);

		/****************** Plane ******************/
		/**** md5 signature: 5c94d426c8cb0ea718d9147a0f1d68f5 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the plane containing the edges of the shape. warning use the function found to verify that the plane is built. if a plane is not found, plane returns a null handle.

Returns
-------
opencascade::handle<Geom_Plane>
") Plane;
		opencascade::handle<Geom_Plane> Plane();

};


%extend BRepBuilderAPI_FindPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepBuilderAPI_Sewing *
******************************/
class BRepBuilderAPI_Sewing : public Standard_Transient {
	public:
		/****************** BRepBuilderAPI_Sewing ******************/
		/**** md5 signature: e18a1d19a8b6425820c30aa95cb1c4b9 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_Sewing;
		%feature("autodoc", "Creates an object with tolerance of connexity option for sewing (if false only control) option for analysis of degenerated shapes option for cutting of free edges. option for non manifold processing.

Parameters
----------
tolerance: float,optional
	default value is 1.0e-06
option1: bool,optional
	default value is Standard_True
option2: bool,optional
	default value is Standard_True
option3: bool,optional
	default value is Standard_True
option4: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_Sewing;
		 BRepBuilderAPI_Sewing(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option1 = Standard_True, const Standard_Boolean option2 = Standard_True, const Standard_Boolean option3 = Standard_True, const Standard_Boolean option4 = Standard_False);

		/****************** Add ******************/
		/**** md5 signature: e2be6f2074943772e403ebcbe671347a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines the shapes to be sewed or controlled.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & shape);

		/****************** ContigousEdge ******************/
		/**** md5 signature: 528f0ebefe61a096548f88451970603d ****/
		%feature("compactdefaultargs") ContigousEdge;
		%feature("autodoc", "Gives each contigous edge.

Parameters
----------
index: int

Returns
-------
TopoDS_Edge
") ContigousEdge;
		const TopoDS_Edge ContigousEdge(const Standard_Integer index);

		/****************** ContigousEdgeCouple ******************/
		/**** md5 signature: 783b24657c04ecf4547ffd8cfddcc368 ****/
		%feature("compactdefaultargs") ContigousEdgeCouple;
		%feature("autodoc", "Gives the sections (edge) belonging to a contigous edge.

Parameters
----------
index: int

Returns
-------
TopTools_ListOfShape
") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple(const Standard_Integer index);

		/****************** DegeneratedShape ******************/
		/**** md5 signature: e6eb24cfb41ed6276abbd22e81382ad4 ****/
		%feature("compactdefaultargs") DegeneratedShape;
		%feature("autodoc", "Gives each degenerated shape.

Parameters
----------
index: int

Returns
-------
TopoDS_Shape
") DegeneratedShape;
		const TopoDS_Shape DegeneratedShape(const Standard_Integer index);

		/****************** DeletedFace ******************/
		/**** md5 signature: e964b07feb42f72561b85423c8033fca ****/
		%feature("compactdefaultargs") DeletedFace;
		%feature("autodoc", "Gives each deleted face.

Parameters
----------
index: int

Returns
-------
TopoDS_Face
") DeletedFace;
		const TopoDS_Face DeletedFace(const Standard_Integer index);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Print the informations.

Returns
-------
None
") Dump;
		void Dump();

		/****************** FaceMode ******************/
		/**** md5 signature: 21661531f4beeda56376b9777120d25d ****/
		%feature("compactdefaultargs") FaceMode;
		%feature("autodoc", "Returns mode for sewing faces by default - true.

Returns
-------
bool
") FaceMode;
		Standard_Boolean FaceMode();

		/****************** FloatingEdgesMode ******************/
		/**** md5 signature: 4a5c8040ae5369a46adc16bfcec4bd53 ****/
		%feature("compactdefaultargs") FloatingEdgesMode;
		%feature("autodoc", "Returns mode for sewing floating edges by default - false.

Returns
-------
bool
") FloatingEdgesMode;
		Standard_Boolean FloatingEdgesMode();

		/****************** FreeEdge ******************/
		/**** md5 signature: d7877d5632d059ec28a98ec8914a60d4 ****/
		%feature("compactdefaultargs") FreeEdge;
		%feature("autodoc", "Gives each free edge.

Parameters
----------
index: int

Returns
-------
TopoDS_Edge
") FreeEdge;
		const TopoDS_Edge FreeEdge(const Standard_Integer index);

		/****************** GetContext ******************/
		/**** md5 signature: 4fb4f0ef4e8072c0449192799698250c ****/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Return context.

Returns
-------
opencascade::handle<BRepTools_ReShape>
") GetContext;
		const opencascade::handle<BRepTools_ReShape> & GetContext();

		/****************** Init ******************/
		/**** md5 signature: 9a7c36413c1eb2ae42b6435c1c7d2e86 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the parameters if necessary.

Parameters
----------
tolerance: float,optional
	default value is 1.0e-06
option1: bool,optional
	default value is Standard_True
option2: bool,optional
	default value is Standard_True
option3: bool,optional
	default value is Standard_True
option4: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option1 = Standard_True, const Standard_Boolean option2 = Standard_True, const Standard_Boolean option3 = Standard_True, const Standard_Boolean option4 = Standard_False);

		/****************** IsDegenerated ******************/
		/**** md5 signature: 84979167278e746e62a21a790a7cd87e ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Indicates if a input shape is degenerated.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated(const TopoDS_Shape & shape);

		/****************** IsModified ******************/
		/**** md5 signature: 1d5d4f025b62ca0ccc6672d39cdf22fc ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Indicates if a input shape has been modified.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Shape & shape);

		/****************** IsModifiedSubShape ******************/
		/**** md5 signature: 7a0857a507d3c4158ac7100a028d6a23 ****/
		%feature("compactdefaultargs") IsModifiedSubShape;
		%feature("autodoc", "Indicates if a input subshape has been modified.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
bool
") IsModifiedSubShape;
		Standard_Boolean IsModifiedSubShape(const TopoDS_Shape & shape);

		/****************** IsSectionBound ******************/
		/**** md5 signature: cd9153a526df9f57af17b95cfb016aa1 ****/
		%feature("compactdefaultargs") IsSectionBound;
		%feature("autodoc", "Indicates if a section is bound (before use sectiontoboundary).

Parameters
----------
section: TopoDS_Edge

Returns
-------
bool
") IsSectionBound;
		Standard_Boolean IsSectionBound(const TopoDS_Edge & section);

		/****************** Load ******************/
		/**** md5 signature: 5e48307a99195c8c9f614df4cf55663d ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loades the context shape.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") Load;
		void Load(const TopoDS_Shape & shape);

		/****************** LocalTolerancesMode ******************/
		/**** md5 signature: d909e2ebc0fc932438ad29d4934d9840 ****/
		%feature("compactdefaultargs") LocalTolerancesMode;
		%feature("autodoc", "Returns mode for accounting of local tolerances of edges and vertices during of merging.

Returns
-------
bool
") LocalTolerancesMode;
		Standard_Boolean LocalTolerancesMode();

		/****************** MaxTolerance ******************/
		/**** md5 signature: b0c09a40965fea8fc4d63c52a795d7fd ****/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Gives set max tolerance.

Returns
-------
float
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****************** MinTolerance ******************/
		/**** md5 signature: 2629547ec2afd3a7a2edaa268cbc0366 ****/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "Gives set min tolerance.

Returns
-------
float
") MinTolerance;
		Standard_Real MinTolerance();

		/****************** Modified ******************/
		/**** md5 signature: 8eae36e55014fa2f45331a4af35cda4c ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Gives a modifieded shape.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Modified;
		const TopoDS_Shape Modified(const TopoDS_Shape & shape);

		/****************** ModifiedSubShape ******************/
		/**** md5 signature: 73e3082562f6dcafa13952269a08c5fa ****/
		%feature("compactdefaultargs") ModifiedSubShape;
		%feature("autodoc", "Gives a modifieded subshape.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedSubShape;
		TopoDS_Shape ModifiedSubShape(const TopoDS_Shape & shape);

		/****************** MultipleEdge ******************/
		/**** md5 signature: 128ede0c8440ddd28a067c7bb024d295 ****/
		%feature("compactdefaultargs") MultipleEdge;
		%feature("autodoc", "Gives each multiple edge.

Parameters
----------
index: int

Returns
-------
TopoDS_Edge
") MultipleEdge;
		const TopoDS_Edge MultipleEdge(const Standard_Integer index);

		/****************** NbContigousEdges ******************/
		/**** md5 signature: c293fac1d421e2d1f7207054b4a45923 ****/
		%feature("compactdefaultargs") NbContigousEdges;
		%feature("autodoc", "Gives the number of contigous edges (edge shared by two faces).

Returns
-------
int
") NbContigousEdges;
		Standard_Integer NbContigousEdges();

		/****************** NbDegeneratedShapes ******************/
		/**** md5 signature: 002576d80bfb4575f6cdfeeff5b81a1e ****/
		%feature("compactdefaultargs") NbDegeneratedShapes;
		%feature("autodoc", "Gives the number of degenerated shapes.

Returns
-------
int
") NbDegeneratedShapes;
		Standard_Integer NbDegeneratedShapes();

		/****************** NbDeletedFaces ******************/
		/**** md5 signature: 4ba093eaaa12ab2808b2529553c686f1 ****/
		%feature("compactdefaultargs") NbDeletedFaces;
		%feature("autodoc", "Gives the number of deleted faces (faces smallest than tolerance).

Returns
-------
int
") NbDeletedFaces;
		Standard_Integer NbDeletedFaces();

		/****************** NbFreeEdges ******************/
		/**** md5 signature: 601078396c3dc97b2847707250e5a03a ****/
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", "Gives the number of free edges (edge shared by one face).

Returns
-------
int
") NbFreeEdges;
		Standard_Integer NbFreeEdges();

		/****************** NbMultipleEdges ******************/
		/**** md5 signature: 656b6af0bb5cea1fea2a3c70157e30b5 ****/
		%feature("compactdefaultargs") NbMultipleEdges;
		%feature("autodoc", "Gives the number of multiple edges (edge shared by more than two faces).

Returns
-------
int
") NbMultipleEdges;
		Standard_Integer NbMultipleEdges();

		/****************** NonManifoldMode ******************/
		/**** md5 signature: 34f87de0adb2c358ab80ad641118c76e ****/
		%feature("compactdefaultargs") NonManifoldMode;
		%feature("autodoc", "Gets mode for non-manifold sewing. //! internal fuctions ---.

Returns
-------
bool
") NonManifoldMode;
		Standard_Boolean NonManifoldMode();

		/****************** Perform ******************/
		/**** md5 signature: a21418fb1f637bb5f01a2fe1d0fd7cbe ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computing thepi - progress indicator of algorithm.

Parameters
----------
thePI: Message_ProgressIndicator,optional
	default value is 0

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Message_ProgressIndicator> & thePI = 0);

		/****************** SameParameterMode ******************/
		/**** md5 signature: 7e498208ee59dfaf63264199ca1716c8 ****/
		%feature("compactdefaultargs") SameParameterMode;
		%feature("autodoc", "Gets same parameter mode.

Returns
-------
bool
") SameParameterMode;
		Standard_Boolean SameParameterMode();

		/****************** SectionToBoundary ******************/
		/**** md5 signature: 8753cd22e70a557633e4602d07baeefe ****/
		%feature("compactdefaultargs") SectionToBoundary;
		%feature("autodoc", "Gives the original edge (free boundary) which becomes the the section. remember that sections constitute common edges. this imformation is important for control because with original edge we can find the surface to which the section is attached.

Parameters
----------
section: TopoDS_Edge

Returns
-------
TopoDS_Edge
") SectionToBoundary;
		const TopoDS_Edge SectionToBoundary(const TopoDS_Edge & section);

		/****************** SetContext ******************/
		/**** md5 signature: d164363977e75e7eed55b6d2c433f4ef ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Set context.

Parameters
----------
theContext: BRepTools_ReShape

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<BRepTools_ReShape> & theContext);

		/****************** SetFaceMode ******************/
		/**** md5 signature: be33d5623b757a136bdeb5a9404588b8 ****/
		%feature("compactdefaultargs") SetFaceMode;
		%feature("autodoc", "Sets mode for sewing faces by default - true.

Parameters
----------
theFaceMode: bool

Returns
-------
None
") SetFaceMode;
		void SetFaceMode(const Standard_Boolean theFaceMode);

		/****************** SetFloatingEdgesMode ******************/
		/**** md5 signature: 9e535d43ee813c0bb3f60089705740ad ****/
		%feature("compactdefaultargs") SetFloatingEdgesMode;
		%feature("autodoc", "Sets mode for sewing floating edges by default - false. returns mode for cutting floating edges by default - false. sets mode for cutting floating edges by default - false.

Parameters
----------
theFloatingEdgesMode: bool

Returns
-------
None
") SetFloatingEdgesMode;
		void SetFloatingEdgesMode(const Standard_Boolean theFloatingEdgesMode);

		/****************** SetLocalTolerancesMode ******************/
		/**** md5 signature: 11968066a6abf7bbfe86e1caa2d4682f ****/
		%feature("compactdefaultargs") SetLocalTolerancesMode;
		%feature("autodoc", "Sets mode for accounting of local tolerances of edges and vertices during of merging in this case worktolerance = mytolerance + toledge1+ toledg2;.

Parameters
----------
theLocalTolerancesMode: bool

Returns
-------
None
") SetLocalTolerancesMode;
		void SetLocalTolerancesMode(const Standard_Boolean theLocalTolerancesMode);

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: 4b5771be6c78dcae85f644f87aad2350 ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets max tolerance.

Parameters
----------
theMaxToler: float

Returns
-------
None
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real theMaxToler);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: 7ba51e2f5c5991bb95f9e3c8a5d6f1f3 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets min tolerance.

Parameters
----------
theMinToler: float

Returns
-------
None
") SetMinTolerance;
		void SetMinTolerance(const Standard_Real theMinToler);

		/****************** SetNonManifoldMode ******************/
		/**** md5 signature: 5d218b8a6549d6b81b32f7e6532da86f ****/
		%feature("compactdefaultargs") SetNonManifoldMode;
		%feature("autodoc", "Sets mode for non-manifold sewing.

Parameters
----------
theNonManifoldMode: bool

Returns
-------
None
") SetNonManifoldMode;
		void SetNonManifoldMode(const Standard_Boolean theNonManifoldMode);

		/****************** SetSameParameterMode ******************/
		/**** md5 signature: 31ed69081c7788c7c8d7bac985fad0fb ****/
		%feature("compactdefaultargs") SetSameParameterMode;
		%feature("autodoc", "Sets same parameter mode.

Parameters
----------
SameParameterMode: bool

Returns
-------
None
") SetSameParameterMode;
		void SetSameParameterMode(const Standard_Boolean SameParameterMode);

		/****************** SetTolerance ******************/
		/**** md5 signature: 6adfe96b6feba352d7526961c84ccdab ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

Parameters
----------
theToler: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theToler);

		/****************** SewedShape ******************/
		/**** md5 signature: 15c4b701ec45daeb64ce5999149305ef ****/
		%feature("compactdefaultargs") SewedShape;
		%feature("autodoc", "Gives the sewed shape a null shape if nothing constructed may be a face, a shell, a solid or a compound.

Returns
-------
TopoDS_Shape
") SewedShape;
		const TopoDS_Shape SewedShape();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Gives set tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** WhichFace ******************/
		/**** md5 signature: 3e589a12446d56482439b5fd7cbfa5d8 ****/
		%feature("compactdefaultargs") WhichFace;
		%feature("autodoc", "Gives a modified shape.

Parameters
----------
theEdg: TopoDS_Edge
index: int,optional
	default value is 1

Returns
-------
TopoDS_Face
") WhichFace;
		TopoDS_Face WhichFace(const TopoDS_Edge & theEdg, const Standard_Integer index = 1);

};


%make_alias(BRepBuilderAPI_Sewing)

%extend BRepBuilderAPI_Sewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepBuilderAPI_VertexInspector *
***************************************/
class BRepBuilderAPI_VertexInspector : public NCollection_CellFilter_InspectorXYZ {
	public:
typedef Standard_Integer Target;
		/****************** BRepBuilderAPI_VertexInspector ******************/
		/**** md5 signature: 0eeefa290e63d77a3860d0886de050c7 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_VertexInspector;
		%feature("autodoc", "Constructor; remembers the tolerance.

Parameters
----------
theTol: float

Returns
-------
None
") BRepBuilderAPI_VertexInspector;
		 BRepBuilderAPI_VertexInspector(const Standard_Real theTol);

		/****************** Add ******************/
		/**** md5 signature: 674df0f2056599deaae173500780a92d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Keep the points used for comparison.

Parameters
----------
thePnt: gp_XYZ

Returns
-------
None
") Add;
		void Add(const gp_XYZ & thePnt);

		/****************** ClearResList ******************/
		/**** md5 signature: 437c3c9842327f69417ece821777001d ****/
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "Clear the list of adjacent points.

Returns
-------
None
") ClearResList;
		void ClearResList();

		/****************** Inspect ******************/
		/**** md5 signature: 261093865d6e31515b7e7f70c791b792 ****/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "Implementation of inspection method.

Parameters
----------
theTarget: int

Returns
-------
NCollection_CellFilter_Action
") Inspect;
		NCollection_CellFilter_Action Inspect(const Standard_Integer theTarget);

		/****************** ResInd ******************/
		/**** md5 signature: 06a54f141487331d8d67cc5507fd93fe ****/
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "Get list of indexes of points adjacent with the current.

Returns
-------
TColStd_ListOfInteger
") ResInd;
		const TColStd_ListOfInteger & ResInd();

		/****************** SetCurrent ******************/
		/**** md5 signature: 52c7652c9c3b17a93e1b9f74b55265ec ****/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "Set current point to search for coincidence.

Parameters
----------
theCurPnt: gp_XYZ

Returns
-------
None
") SetCurrent;
		void SetCurrent(const gp_XYZ & theCurPnt);

};


%extend BRepBuilderAPI_VertexInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRepBuilderAPI_BndBoxTreeSelector *
******************************************/
class BRepBuilderAPI_BndBoxTreeSelector : public BRepBuilderAPI_BndBoxTree::Selector {
	public:
		/****************** BRepBuilderAPI_BndBoxTreeSelector ******************/
		/**** md5 signature: 701377c6f5b5b4ad360057f52164f1cc ****/
		%feature("compactdefaultargs") BRepBuilderAPI_BndBoxTreeSelector;
		%feature("autodoc", "Constructor; calls the base class constructor.

Returns
-------
None
") BRepBuilderAPI_BndBoxTreeSelector;
		 BRepBuilderAPI_BndBoxTreeSelector();

		/****************** Accept ******************/
		/**** md5 signature: 5815dd7c853dd2ee8117fbcdf8728805 ****/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "Implementation of acceptance method this method is called when the bounding box intersect with the current. it stores the object - the index of box in the list of accepted objects. returns true, because the object is accepted.

Parameters
----------
theObj: int

Returns
-------
bool
") Accept;
		Standard_Boolean Accept(const Standard_Integer & theObj);

		/****************** ClearResList ******************/
		/**** md5 signature: 437c3c9842327f69417ece821777001d ****/
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "Clear the list of intersecting boxes.

Returns
-------
None
") ClearResList;
		void ClearResList();

		/****************** Reject ******************/
		/**** md5 signature: d86ca564c619503e8a9e9a9dd035781a ****/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "Implementation of rejection method returns true if the bounding box does not intersect with the current .

Parameters
----------
theBox: Bnd_Box

Returns
-------
bool
") Reject;
		Standard_Boolean Reject(const Bnd_Box & theBox);

		/****************** ResInd ******************/
		/**** md5 signature: 06a54f141487331d8d67cc5507fd93fe ****/
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "Get list of indexes of boxes intersecting with the current box.

Returns
-------
TColStd_ListOfInteger
") ResInd;
		const TColStd_ListOfInteger & ResInd();

		/****************** SetCurrent ******************/
		/**** md5 signature: f630ad6cec547ab81dd1ff7942351413 ****/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "Set current box to search for overlapping with him.

Parameters
----------
theBox: Bnd_Box

Returns
-------
None
") SetCurrent;
		void SetCurrent(const Bnd_Box & theBox);

};


%extend BRepBuilderAPI_BndBoxTreeSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_MakeShape *
*********************************/
%nodefaultctor BRepBuilderAPI_MakeShape;
class BRepBuilderAPI_MakeShape : public BRepBuilderAPI_Command {
	public:
		/****************** Build ******************/
		/**** md5 signature: 66e0ade7e3cfb9cd9bdff795cda9b98c ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "This is called by shape(). it does nothing but may be redefined.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Generated ******************/
		/**** md5 signature: ec0cc02a1efd6cf2ce3c0b78f26c1d07 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** IsDeleted ******************/
		/**** md5 signature: eb6924b9523d7e4f22d23c7c973700db ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape s has been deleted.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** Modified ******************/
		/**** md5 signature: a806cf91fce8bea1007aadababd10388 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** Shape ******************/
		/**** md5 signature: 2d17c0c46a6272e892d56c2b4312553d ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns a shape built by the shape construction algorithm. raises exception stdfail_notdone if the shape was not built.

Returns
-------
TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape Shape();

};


%extend BRepBuilderAPI_MakeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBuilderAPI_MakeEdge *
********************************/
class BRepBuilderAPI_MakeEdge : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 0f4dfcd8f012cf307355479d4f35ebf8 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge();

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 03760e464316327715c9f60169e5c353 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 1d9c138e8ad8dac88bf15ba61ca8eeea ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: a5bad4ad36582766f329b2997750bd64 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: cab45d250f4e44f193c7ef6ad550c658 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: f2a39fbc1a11abf4d5ee9cb892172a65 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 180771a5e26f55185893bfbc74200e26 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 01f9144f68791c93ea0b77b16ae7f738 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 9c413b91f4f43dbb36a6be7b3575c890 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 3dfc053e7499ca226c956c4bd26ed85d ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: ffe72e79252ec3798fe6ad30ff8a9d8c ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: f0af09a1e0509e61e8f46e9b99a5f265 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 4ee630b3a076bf0e9dad64f944eba049 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 2ef92171d9092a0e8f3c7bf0b7d90e0f ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 5df7d682759ac8fa2d83101a9ae6744a ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 13812eb3449432a1961fdc8707025659 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: fc8c25337ccae7524af5016c0558529d ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 125132cc5b68b71332321fdb8ed75aef ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 5c1bf3d6aaa00d737afd406d3c012341 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: d97ef5d901ee9aab613ae11dba6cb537 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 9bdd925165b2ff5d5abb2947ee8d711a ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 3b344cb2d8419d529ee9d54d2f6cc669 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 5f6deb41b0ccadcc0541de06b4588820 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 230e0e9c29476df7018fb49aef783237 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: d49aaa94a0b6680c60d31379455f3068 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 9add2febba648d64ba90e4afe104291e ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 45ce7c9f95893c06e5e00995284ecf21 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 72e4841e5d7e7c2edb5bc8aa27592395 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 07688a814bb54bebc945f45067aefbe5 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: a4782af46daf51d670da12ea4e8c9988 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
S: Geom_Surface

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: b8076f60fd8e4e00baf4eb4e6d15d226 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 8695836e69885815046f06b0ae0bc482 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 03da4358eb0602d842c54753b709c010 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: 1129d1ac8dade951df00631adc5bd7eb ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		/**** md5 signature: acd21d73401432f2c365942d82c1fc03 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "The general method to directly create an edge is to give - a 3d curve c as the support (geometric domain) of the edge, - two vertices v1 and v2 to limit the curve (definition of the restriction of the edge), and - two real values p1 and p2 which are the parameters for the vertices v1 and v2 on the curve. the curve may be defined as a 2d curve in the parametric space of a surface: a pcurve. the surface on which the edge is built is then kept at the level of the edge. the default tolerance will be associated with this edge. rules applied to the arguments: for the curve: - the curve must not be a 'null handle'. - if the curve is a trimmed curve the basis curve is used. for the vertices: - vertices may be null shapes. when v1 or v2 is null the edge is open in the corresponding direction and the parameter value p1 or p2 must be infinite (remember that precision::infinite() defines an infinite value). - the two vertices must be identical if they have the same 3d location. identical vertices are used in particular when the curve is closed. for the parameters: - the parameters must be in the parametric range of the curve (or the basis curve if the curve is trimmed). if this condition is not satisfied the edge is not built, and the error function will return brepapi_parameteroutofrange. - parameter values must not be equal. if this condition is not satisfied (i.e. if | p1 - p2 | ) the edge is not built, and the error function will return brepapi_linethroughidenticpoints. parameter values are expected to be given in increasing order: c->firstparameter() - if the parameter values are given in decreasing order the vertices are switched, i.e. the 'first vertex' is on the point of parameter p2 and the 'second vertex' is on the point of parameter p1. in such a case, to keep the original intent of the construction, the edge will be oriented 'reversed'. - on a periodic curve the parameter values p1 and p2 are adjusted by adding or subtracting the period to obtain p1 in the parametric range of the curve, and p2] such that [ p1 , where period is the period of the curve. - a parameter value may be infinite. the edge is open in the corresponding direction. however the corresponding vertex must be a null shape. if this condition is not satisfied the edge is not built, and the error function will return brepapi_pointwithinfiniteparameter. - the distance between the vertex and the point evaluated on the curve with the parameter, must be lower than the precision of the vertex. if this condition is not satisfied the edge is not built, and the error function will return brepapi_differentspointandparameter. other edge constructions - the parameter values can be omitted, they will be computed by projecting the vertices on the curve. note that projection is the only way to evaluate the parameter values of the vertices on the curve: vertices must be given on the curve, i.e. the distance from a vertex to the curve must be less than or equal to the precision of the vertex. if this condition is not satisfied the edge is not built, and the error function will return brepapi_pointprojectionfailed. - 3d points can be given in place of vertices. vertices will be created from the points (with the default topological precision precision::confusion()). note: - giving vertices is useful when creating a connected edge. - if the parameter values correspond to the extremities of a closed curve, points must be identical, or at least coincident. if this condition is not satisfied the edge is not built, and the error function will return brepapi_differentpointsonclosedcurve. - the vertices or points can be omitted if the parameter values are given. the points will be computed from the parameters on the curve. the vertices or points and the parameter values can be omitted. the first and last parameters of the curve will then be used. //! auxiliary methods.

Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Edge ******************/
		/**** md5 signature: 768a18012e715670ae29301e23e2cf8b ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the constructed edge. exceptions stdfail_notdone if the edge is not built.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		/**** md5 signature: eed0e2d16bc922bda6437a7e6e62f61b ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status - brepbuilderapi_edgedone if the edge is built, or - another value of the brepbuilderapi_edgeerror enumeration indicating the reason of construction failure.

Returns
-------
BRepBuilderAPI_EdgeError
") Error;
		BRepBuilderAPI_EdgeError Error();

		/****************** Init ******************/
		/**** md5 signature: 3a7fb0adde1a97c68f435539513bba2c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

		/****************** Init ******************/
		/**** md5 signature: 69ab6deacb22a5a946bd084862db1233 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		/**** md5 signature: 235ac27b5a022827b7d54091e2111592 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Init ******************/
		/**** md5 signature: 9b236210e3d8f5b8c0ae08f9ff665d2d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** Init ******************/
		/**** md5 signature: b7311420b3eb1ee66bd9b3232f6bbf14 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		/**** md5 signature: f0ddd1dcd6baa38ff9d6ad052ec8cf95 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		/**** md5 signature: 2207b24682fbbcefc3a70c5dcfc79e41 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
S: Geom_Surface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****************** Init ******************/
		/**** md5 signature: 46ba1cf0906b7383d025da040ff8be26 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		/**** md5 signature: 0b0c938b079b5bfdc1085e8f8a945803 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Init ******************/
		/**** md5 signature: cc30f692d59f3ba69b1c4b104a9aba38 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** Init ******************/
		/**** md5 signature: 13f84c1b43401d2a23e02820d3c88735 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		/**** md5 signature: 59918a63418830ecee317dd35f9016cc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines or redefines the arguments for the construction of an edge. this function is currently used after the empty constructor brepapi_makeedge().

Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the edge is built.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Vertex1 ******************/
		/**** md5 signature: 3013872331c1fad0ef9330909eb27447 ****/
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "Returns the first vertex of the edge. may be null.

Returns
-------
TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex Vertex1();

		/****************** Vertex2 ******************/
		/**** md5 signature: ce52ea817fb1fca460491831377f3811 ****/
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "Returns the second vertex of the edge. may be null. //! warning the returned vertex in each function corresponds respectively to - the lowest, or - the highest parameter on the curve along which the edge is built. it does not correspond to the first or second vertex given at the time of the construction, if the edge is oriented reversed. exceptions stdfail_notdone if the edge is not built.

Returns
-------
TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex Vertex2();

};


%extend BRepBuilderAPI_MakeEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_MakeEdge2d *
**********************************/
class BRepBuilderAPI_MakeEdge2d : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: bfcf05f03d1155d3e3138fd904ebec30 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 005fbf9b30edf45cd1d556cd57449b52 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: f90665f57f4d23d3332cedf8ded3559b ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 517f958b659e1ac3a0ae753bf31ac3db ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 645572569e68cc969305ed87c8785980 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 9e194e6799c2033512dfc9a79fac26a8 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 9b27412010f85348ad711cccbd4623c7 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 18039721aab72cd4872f8a52d0333539 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 3f6e055266559e7e5feb71876b03cebb ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 90e59e52a38ceac1b93d35076ac4b470 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: dec7d4c0169150a2e86b3ee1b6fd23d0 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: ac65cdde53679ed90ba1f3521c9a3285 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 1c65a339c0b972e42e9c595f9c5b6f4d ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 0fae436d0a0a9fe9d4eeb533df3f44eb ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 2811ce4e0a900a196d2b1018f783f418 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 646a459c3c2f033deab8f144a96e5357 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 6c97acd26146d4579544d00e0b8754b4 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: e685718a19517adce0bcf4152dbab516 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 3be5ea6bf0eccd78bd66cc84a44a1315 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: ab84070f23b486412154603704adccd1 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: e0927bb381df58d6b09770a3a3a2eb6b ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 92f0a714ee22f0a05ae1cc70b4cc3960 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 4f70f767c647552694ba5cb2a0398a22 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 347d8e971dc03f71d278f01c11915918 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 523fe18ae6edb34b5d4509345437720d ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 02288724f7a44b2381d52b1c08ffb0db ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 26d33d19f47440e8800d85f2d5408a0e ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		/**** md5 signature: 56473d16c2838587271d3f4ea5327365 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Returns
-------
None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Edge ******************/
		/**** md5 signature: 768a18012e715670ae29301e23e2cf8b ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		/**** md5 signature: eed0e2d16bc922bda6437a7e6e62f61b ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the error description when notdone.

Returns
-------
BRepBuilderAPI_EdgeError
") Error;
		BRepBuilderAPI_EdgeError Error();

		/****************** Init ******************/
		/**** md5 signature: 9265e5f0d4ffc1952c67390e1e4fa21c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Init ******************/
		/**** md5 signature: 0961809b47e34c89a735be9bbe4cd201 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		/**** md5 signature: 3aebe7beccd2278aab8e691a1202290a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Init ******************/
		/**** md5 signature: 9ea2122c0b47e1c54f550895e77a510a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** Init ******************/
		/**** md5 signature: 909c5b62ad2dddf89a9e7ed6c45abf2e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		/**** md5 signature: c6a6dc0247fd8deba360e5bd07dc5e73 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Vertex1 ******************/
		/**** md5 signature: 3013872331c1fad0ef9330909eb27447 ****/
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "Returns the first vertex of the edge. may be null.

Returns
-------
TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex Vertex1();

		/****************** Vertex2 ******************/
		/**** md5 signature: ce52ea817fb1fca460491831377f3811 ****/
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "Returns the second vertex of the edge. may be null.

Returns
-------
TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex Vertex2();

};


%extend BRepBuilderAPI_MakeEdge2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBuilderAPI_MakeFace *
********************************/
class BRepBuilderAPI_MakeFace : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 541fc4c7355d3a6bfcb60a10e43cf520 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Not done.

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace();

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: ac0ecdd4e8a721d62679f96f7f91809d ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Load a face. usefull to add wires.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Face & F);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 09cbbdd333649801fb329dbe37136e63 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a plane.

Parameters
----------
P: gp_Pln

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 32764c05c024544669d521c68d438194 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cylinder.

Parameters
----------
C: gp_Cylinder

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: a8014928898748a8afd97b723642bfde ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cone.

Parameters
----------
C: gp_Cone

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 601ec600164793fe1616d7fb2ccbac9c ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a sphere.

Parameters
----------
S: gp_Sphere

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: b49168111fb28a9fbfcf81267cbe8113 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a torus.

Parameters
----------
C: gp_Torus

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 19698edbc93d15eb12e95d38e52b3f6c ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts tolerance value (toldegen) for resolution of degenerated edges.

Parameters
----------
S: Geom_Surface
TolDegen: float

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real TolDegen);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 7d4d076aa11a1d86947f3f83700ec90a ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a plane.

Parameters
----------
P: gp_Pln
UMin: float
UMax: float
VMin: float
VMax: float

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 86ebae58c5c914174876b10e55d9ff25 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cylinder.

Parameters
----------
C: gp_Cylinder
UMin: float
UMax: float
VMin: float
VMax: float

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 267ce5594216afaf1147e246c8b90396 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cone.

Parameters
----------
C: gp_Cone
UMin: float
UMax: float
VMin: float
VMax: float

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 730d0df0fe03cbb16abd38a38bf6a663 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a sphere.

Parameters
----------
S: gp_Sphere
UMin: float
UMax: float
VMin: float
VMax: float

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 70893c6c780557b1c1313442260a61b5 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a torus.

Parameters
----------
C: gp_Torus
UMin: float
UMax: float
VMin: float
VMax: float

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: e23dfaea01284f0f537f62f6d18ac86e ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts tolerance value (toldegen) for resolution of degenerated edges.

Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
TolDegen: float

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 445f7f291f4fd9242a0baacb4a8f70b7 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Find a surface from the wire and make a face. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set.

Parameters
----------
W: TopoDS_Wire
OnlyPlane: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Wire & W, const Standard_Boolean OnlyPlane = Standard_False);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: c51c2e33e6a98cb7fbfd33a45d8d698e ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a plane and a wire.

Parameters
----------
P: gp_Pln
W: TopoDS_Wire
Inside: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 0472770e0d262b823eb560efae3e6e5c ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cylinder and a wire.

Parameters
----------
C: gp_Cylinder
W: TopoDS_Wire
Inside: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 462af6579232e59b54ec8e3d75b73582 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cone and a wire.

Parameters
----------
C: gp_Cone
W: TopoDS_Wire
Inside: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 99a77f7d6e2680966ddcd548f37f569b ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a sphere and a wire.

Parameters
----------
S: gp_Sphere
W: TopoDS_Wire
Inside: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 63a33d76e4d34c48ee138e308eb1db38 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a torus and a wire.

Parameters
----------
C: gp_Torus
W: TopoDS_Wire
Inside: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: a23085932fa89afc65030dc882efe010 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a surface and a wire.

Parameters
----------
S: Geom_Surface
W: TopoDS_Wire
Inside: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		/**** md5 signature: 7f01fc7c4e918e13e23cec82d2e59e87 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Adds the wire <w> in the face <f> a general method to create a face is to give - a surface s as the support (the geometric domain) of the face, - and a wire w to bound it. the bounds of the face can also be defined by four parameter values umin, umax, vmin, vmax which determine isoparametric limitations on the parametric space of the surface. in this way, a patch is defined. the parameter values are optional. if they are omitted, the natural bounds of the surface are used. a wire is automatically built using the defined bounds. up to four edges and four vertices are created with this wire (no edge is created when the corresponding parameter value is infinite). wires can then be added using the function add to define other restrictions on the face. these restrictions represent holes. more than one wire may be added by this way, provided that the wires do not cross each other and that they define only one area on the surface. (be careful, however, as this is not checked). forbidden addition of wires note that in this schema, the third case is valid if edges of the wire w are declared internal to the face. as a result, these edges are no longer bounds of the face. a default tolerance (precision::confusion()) is given to the face, this tolerance may be increased during construction of the face using various algorithms. rules applied to the arguments for the surface: - the surface must not be a 'null handle'. - if the surface is a trimmed surface, the basis surface is used. - for the wire: the wire is composed of connected edges, each edge having a parametric curve description in the parametric domain of the surface; in other words, as a pcurve. for the parameters: - the parameter values must be in the parametric range of the surface (or the basis surface, if the surface is trimmed). if this condition is not satisfied, the face is not built, and the error function will return brepbuilderapi_parametersoutofrange. - the bounding parameters p1 and p2 are adjusted on a periodic surface in a given parametric direction by adding or subtracting the period to obtain p1 in the parametric range of the surface and such p2, that p2 - p1 <= period, where period is the period of the surface in this parametric direction. - a parameter value may be infinite. there will be no edge and no vertex in the corresponding direction.

Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire

Returns
-------
None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Face & F, const TopoDS_Wire & W);

		/****************** Add ******************/
		/**** md5 signature: 3257e47f30128eb5440b1eab5065e724 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the wire w to the constructed face as a hole. warning w must not cross the other bounds of the face, and all the bounds must define only one area on the surface. (be careful, however, as this is not checked.) example // a cylinder gp_cylinder c = ..; // a wire topods_wire w = ...; brepbuilderapi_makeface mf(c); mf.add(w); topods_face f = mf;.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") Add;
		void Add(const TopoDS_Wire & W);

		/****************** Error ******************/
		/**** md5 signature: eb6c34bb46d70357b5b10c7d3da472d1 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status brepbuilderapi_facedone if the face is built, or - another value of the brepbuilderapi_faceerror enumeration indicating why the construction failed, in particular when the given parameters are outside the bounds of the surface.

Returns
-------
BRepBuilderAPI_FaceError
") Error;
		BRepBuilderAPI_FaceError Error();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the constructed face. exceptions stdfail_notdone if no face is built.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		/**** md5 signature: a8dfaa68079e743e08190fe58d950a9a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes (or reinitializes) the construction of a face by creating a new object which is a copy of the face f, in order to add wires to it, using the function add. note: this complete copy of the geometry is only required if you want to work on the geometries of the two faces independently.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** Init ******************/
		/**** md5 signature: 4537ccbc32157e9ea035d63999e8cd22 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes (or reinitializes) the construction of a face on the surface s. if bound is true, a wire is automatically created from the natural bounds of the surface s and added to the face in order to bound it. if bound is false, no wire is added. this option is used when real bounds are known. these will be added to the face after this initialization, using the function add. toldegen parameter is used for resolution of degenerated edges if calculation of natural bounds is turned on.

Parameters
----------
S: Geom_Surface
Bound: bool
TolDegen: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Bound, const Standard_Real TolDegen);

		/****************** Init ******************/
		/**** md5 signature: 1577db0535b260fa5404a98f8fa219d8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes (or reinitializes) the construction of a face on the surface s, limited in the u parametric direction by the two parameter values umin and umax and in the v parametric direction by the two parameter values vmin and vmax. warning error returns: - brepbuilderapi_parametersoutofrange when the parameters given are outside the bounds of the surface or the basis surface of a trimmed surface. toldegen parameter is used for resolution of degenerated edges.

Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
TolDegen: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if this algorithm has a valid face.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

};


%extend BRepBuilderAPI_MakeFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepBuilderAPI_MakePolygon *
***********************************/
class BRepBuilderAPI_MakePolygon : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakePolygon ******************/
		/**** md5 signature: 76b9dec7e7af466015f22b4541dcf01f ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "Initializes an empty polygonal wire, to which points or vertices are added using the add function. as soon as the polygonal wire under construction contains vertices, it can be consulted using the wire function.

Returns
-------
None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon();

		/****************** BRepBuilderAPI_MakePolygon ******************/
		/**** md5 signature: 098299ba5eb88578080ae78ecfe81e1f ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		/**** md5 signature: c6858b7d36146f5d63c0fd944672bfba ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
Close: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const Standard_Boolean Close = Standard_False);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		/**** md5 signature: ff8e512f1837d0f4a96f00091a06e596 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "Constructs a polygonal wire from 2, 3 or 4 points. vertices are automatically created on the given points. the polygonal wire is closed if close is true; otherwise it is open. further vertices can be added using the add function. the polygonal wire under construction can be consulted at any time by using the wire function. example //an open polygon from four points topods_wire w = brepbuilderapi_makepolygon(p1,p2,p3,p4); warning: the process is equivalent to: - initializing an empty polygonal wire, - and adding the given points in sequence. consequently, be careful when using this function: if the sequence of points p1 - p2 - p1 is found among the arguments of the constructor, you will create a polygonal wire with two consecutive coincident edges.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt
Close: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4, const Standard_Boolean Close = Standard_False);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		/**** md5 signature: db14a595777414d9224a0d464b0087f4 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		/**** md5 signature: 14bb91facda291b2240bb410e1aa87ac ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex
V3: TopoDS_Vertex
Close: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const Standard_Boolean Close = Standard_False);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		/**** md5 signature: 09e12386b8a6639bf1930f50b100b12f ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "Constructs a polygonal wire from 2, 3 or 4 vertices. the polygonal wire is closed if close is true; otherwise it is open (default value). further vertices can be added using the add function. the polygonal wire under construction can be consulted at any time by using the wire function. example //a closed triangle from three vertices topods_wire w = brepbuilderapi_makepolygon(v1,v2,v3,standard_true); warning the process is equivalent to: - initializing an empty polygonal wire, - then adding the given points in sequence. so be careful, as when using this function, you could create a polygonal wire with two consecutive coincident edges if the sequence of vertices v1 - v2 - v1 is found among the constructor's arguments.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex
V3: TopoDS_Vertex
V4: TopoDS_Vertex
Close: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const TopoDS_Vertex & V4, const Standard_Boolean Close = Standard_False);

		/****************** Add ******************/
		/**** md5 signature: b714bfb888eecda75b87221b873365bd ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Add;
		void Add(const gp_Pnt & P);

		/****************** Add ******************/
		/**** md5 signature: 50c25a05b9135c3510f0a532439b09c2 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the point p or the vertex v at the end of the polygonal wire under construction. a vertex is automatically created on the point p. warning - when p or v is coincident to the previous vertex, no edge is built. the method added can be used to test for this. neither p nor v is checked to verify that it is coincident with another vertex than the last one, of the polygonal wire under construction. it is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the close function). consequently, be careful using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non manifold polygonal wire. - p or v is not checked to verify if it is coincident with another vertex but the last one, of the polygonal wire under construction. it is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the close function). consequently, be careful when using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non-manifold polygonal wire.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
None
") Add;
		void Add(const TopoDS_Vertex & V);

		/****************** Added ******************/
		/**** md5 signature: ae76eff202ef54dd186494f9fb9a5cb0 ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Returns true if the last vertex added to the constructed polygonal wire is not coincident with the previous one.

Returns
-------
bool
") Added;
		Standard_Boolean Added();

		/****************** Close ******************/
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Closes the polygonal wire under construction. note - this is equivalent to adding the first vertex to the polygonal wire under construction.

Returns
-------
None
") Close;
		void Close();

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge built between the last two points or vertices added to the constructed polygonal wire under construction. warning if there is only one vertex in the polygonal wire, the result is a null edge.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** FirstVertex ******************/
		/**** md5 signature: 4e5c0d56a66d88d33c820ea69fb94d01 ****/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") FirstVertex;
		const TopoDS_Vertex FirstVertex();

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if this algorithm contains a valid polygonal wire (i.e. if there is at least one edge). isdone returns false if fewer than two vertices have been chained together by this construction algorithm.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** LastVertex ******************/
		/**** md5 signature: 00579001fbfcdaa6b9840a736dc9243f ****/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the first or the last vertex of the polygonal wire under construction. if the constructed polygonal wire is closed, the first and the last vertices are identical.

Returns
-------
TopoDS_Vertex
") LastVertex;
		const TopoDS_Vertex LastVertex();

		/****************** Wire ******************/
		/**** md5 signature: 1a80266ab027407949727610f03160e2 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the constructed polygonal wire, or the already built part of the polygonal wire under construction. exceptions stdfail_notdone if the wire is not built, i.e. if fewer than two vertices have been chained together by this construction algorithm.

Returns
-------
TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepBuilderAPI_MakePolygon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_MakeShell *
*********************************/
class BRepBuilderAPI_MakeShell : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeShell ******************/
		/**** md5 signature: f66e5150c2a308218c8635771a238ba1 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "Constructs an empty shell framework. the init function is used to define the construction arguments. warning the function error will return brepbuilderapi_emptyshell if it is called before the function init.

Returns
-------
None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell();

		/****************** BRepBuilderAPI_MakeShell ******************/
		/**** md5 signature: 87884626f1f7fdf07d62fe74f501184a ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "Constructs a shell from the surface s.

Parameters
----------
S: Geom_Surface
Segment: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Segment = Standard_False);

		/****************** BRepBuilderAPI_MakeShell ******************/
		/**** md5 signature: 62bc5e6495312d5200397401e6149645 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "Constructs a shell from the surface s, limited in the u parametric direction by the two parameter values umin and umax, and limited in the v parametric direction by the two parameter values vmin and vmax.

Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
Segment: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****************** Error ******************/
		/**** md5 signature: 0aa62273be80712ad65930b43e4dfd23 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status: - brepbuilderapi_shelldone if the shell is built, or - another value of the brepbuilderapi_shellerror enumeration indicating why the construction failed. this is frequently brepbuilderapi_shellparametersoutofrange indicating that the given parameters are outside the bounds of the surface.

Returns
-------
BRepBuilderAPI_ShellError
") Error;
		BRepBuilderAPI_ShellError Error();

		/****************** Init ******************/
		/**** md5 signature: ee785ff5defa7d18e86d0ad913d864fa ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines or redefines the arguments for the construction of a shell. the construction is initialized with the surface s, limited in the u parametric direction by the two parameter values umin and umax, and in the v parametric direction by the two parameter values vmin and vmax. warning the function error returns: - brepbuilderapi_shellparametersoutofrange when the given parameters are outside the bounds of the surface or the basis surface if s is trimmed.

Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
Segment: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the shell is built.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Shell ******************/
		/**** md5 signature: c581862d26a0a34b15cf9dd6d442e65d ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the new shell.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

};


%extend BRepBuilderAPI_MakeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_MakeSolid *
*********************************/
class BRepBuilderAPI_MakeSolid : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeSolid ******************/
		/**** md5 signature: a5b7a0bcf7177389d2c0fbff22c20022 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Initializes the construction of a solid. an empty solid is considered to cover the whole space. the add function is used to define shells to bound it.

Returns
-------
None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid();

		/****************** BRepBuilderAPI_MakeSolid ******************/
		/**** md5 signature: d3b423f1106df0dc0090ff23b3ee24ef ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from a compsolid.

Parameters
----------
S: TopoDS_CompSolid

Returns
-------
None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_CompSolid & S);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		/**** md5 signature: b45624aedbdaace00f5a4fd4cf1bc27e ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from a shell.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		/**** md5 signature: 0f9a5bc9bb6cb89c67cea5b1bc4d5b2a ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from two shells.

Parameters
----------
S1: TopoDS_Shell
S2: TopoDS_Shell

Returns
-------
None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		/**** md5 signature: d3948f38236bf5b8c03aeea98dbc39e8 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from three shells. constructs a solid - covering the whole space, or - from shell s, or - from two shells s1 and s2, or - from three shells s1, s2 and s3, or warning no check is done to verify the conditions of coherence of the resulting solid. in particular, s1, s2 (and s3) must not intersect each other. besides, after all shells have been added using the add function, one of these shells should constitute the outside skin of the solid; it may be closed (a finite solid) or open (an infinite solid). other shells form hollows (cavities) in these previous ones. each must bound a closed volume.

Parameters
----------
S1: TopoDS_Shell
S2: TopoDS_Shell
S3: TopoDS_Shell

Returns
-------
None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2, const TopoDS_Shell & S3);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		/**** md5 signature: d269b933200bdc54c7639ac73cae0e58 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from a solid. usefull for adding later.

Parameters
----------
So: TopoDS_Solid

Returns
-------
None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Solid & So);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		/**** md5 signature: d8eb662f7f3e18001233ce551b0f73d9 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Add a shell to a solid. //! constructs a solid: - from the solid so, to which shells can be added, or - by adding the shell s to the solid so. warning no check is done to verify the conditions of coherence of the resulting solid. in particular s must not intersect the solid s0. besides, after all shells have been added using the add function, one of these shells should constitute the outside skin of the solid. it may be closed (a finite solid) or open (an infinite solid). other shells form hollows (cavities) in the previous ones. each must bound a closed volume.

Parameters
----------
So: TopoDS_Solid
S: TopoDS_Shell

Returns
-------
None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Solid & So, const TopoDS_Shell & S);

		/****************** Add ******************/
		/**** md5 signature: 755d393a8f453c7309ea9f34b76a9857 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shell to the current solid. warning no check is done to verify the conditions of coherence of the resulting solid. in particular, s must not intersect other shells of the solid under construction. besides, after all shells have been added, one of these shells should constitute the outside skin of the solid. it may be closed (a finite solid) or open (an infinite solid). other shells form hollows (cavities) in these previous ones. each must bound a closed volume.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") Add;
		void Add(const TopoDS_Shell & S);

		/****************** IsDeleted ******************/
		/**** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the solid is built. for this class, a solid under construction is always valid. if no shell has been added, it could be a whole-space solid. however, no check was done to verify the conditions of coherence of the resulting solid.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Solid ******************/
		/**** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the new solid.

Returns
-------
TopoDS_Solid
") Solid;
		const TopoDS_Solid Solid();

};


%extend BRepBuilderAPI_MakeSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_MakeVertex *
**********************************/
class BRepBuilderAPI_MakeVertex : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeVertex ******************/
		/**** md5 signature: 76b4a67f4a0d412d52fe80f15569e02f ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeVertex;
		%feature("autodoc", "Constructs a vertex from point p. example create a vertex from a 3d point. gp_pnt p(0,0,10); topods_vertex v = brepbuilderapi_makevertex(p);.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") BRepBuilderAPI_MakeVertex;
		 BRepBuilderAPI_MakeVertex(const gp_Pnt & P);

		/****************** Vertex ******************/
		/**** md5 signature: c8025d701d2a4994ffc4b119d7279582 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the constructed vertex.

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend BRepBuilderAPI_MakeVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBuilderAPI_MakeWire *
********************************/
class BRepBuilderAPI_MakeWire : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeWire ******************/
		/**** md5 signature: a01271fd9c59f1930aae350997331097 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Constructs an empty wire framework, to which edges are added using the add function. as soon as the wire contains one edge, it can return with the use of the function wire. warning the function error will return brepbuilderapi_emptywire if it is called before at least one edge is added to the wire under construction.

Returns
-------
None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire();

		/****************** BRepBuilderAPI_MakeWire ******************/
		/**** md5 signature: 35268938f48dfb41e577c864ce8837b0 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from an edge.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E);

		/****************** BRepBuilderAPI_MakeWire ******************/
		/**** md5 signature: 6fbd8669e7f97e678d8f6fe0553aab2c ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from two edges.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Returns
-------
None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** BRepBuilderAPI_MakeWire ******************/
		/**** md5 signature: 6b399cddd86d79169964ba26015dd934 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from three edges.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
E3: TopoDS_Edge

Returns
-------
None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3);

		/****************** BRepBuilderAPI_MakeWire ******************/
		/**** md5 signature: c0179625e4bc4e90d4f0be5171bf6b0e ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from four edges. constructs a wire - from the topods_wire w composed of the edge e, or - from edge e, or - from two edges e1 and e2, or - from three edges e1, e2 and e3, or - from four edges e1, e2, e3 and e4. further edges can be added using the function add. given edges are added in a sequence. each of them must be connectable to the wire under construction, and so must satisfy the following condition (unless it is the first edge of the wire): one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). it could also be the same vertex. warning if an edge is not connectable to the wire under construction it is not added. the function error will return brepbuilderapi_disconnectedwire, the function isdone will return false and the function wire will raise an error, until a new connectable edge is added.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
E3: TopoDS_Edge
E4: TopoDS_Edge

Returns
-------
None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3, const TopoDS_Edge & E4);

		/****************** BRepBuilderAPI_MakeWire ******************/
		/**** md5 signature: 307db2e099310281146759f5119b202b ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from a wire. usefull for adding later.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Wire & W);

		/****************** BRepBuilderAPI_MakeWire ******************/
		/**** md5 signature: 01bfeedca98a0748591c3cfaec81cb52 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Add an edge to a wire.

Parameters
----------
W: TopoDS_Wire
E: TopoDS_Edge

Returns
-------
None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Wire & W, const TopoDS_Edge & E);

		/****************** Add ******************/
		/**** md5 signature: 2689ece383041802da1cd80a0167e44a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the edge e to the wire under construction. e must be connectable to the wire under construction, and, unless it is the first edge of the wire, must satisfy the following condition: one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). it could also be the same vertex. warning if e is not connectable to the wire under construction it is not added. the function error will return brepbuilderapi_disconnectedwire, the function isdone will return false and the function wire will raise an error, until a new connectable edge is added.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** Add ******************/
		/**** md5 signature: 3257e47f30128eb5440b1eab5065e724 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the edges of <w> to the current wire.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") Add;
		void Add(const TopoDS_Wire & W);

		/****************** Add ******************/
		/**** md5 signature: acaf1f40b8e0173007b2aad5fa46572c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the edges of <l> to the current wire. the edges are not to be consecutive. but they are to be all connected geometrically or topologically. if some of them are not connected the status give disconnectedwire but the 'maker' is done() and you can get the partial result. (ie connected to the first edgeof the list <l>).

Parameters
----------
L: TopTools_ListOfShape

Returns
-------
None
") Add;
		void Add(const TopTools_ListOfShape & L);

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the last edge added to the wire under construction. warning - this edge can be different from the original one (the argument of the function add, for instance,) - a null edge is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectable..

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		/**** md5 signature: c54fcbd964e19f731ce241d941c68253 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status - brepbuilderapi_wiredone if the wire is built, or - another value of the brepbuilderapi_wireerror enumeration indicating why the construction failed.

Returns
-------
BRepBuilderAPI_WireError
") Error;
		BRepBuilderAPI_WireError Error();

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if this algorithm contains a valid wire. isdone returns false if: - there are no edges in the wire, or - the last edge which you tried to add was not connectable.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Vertex ******************/
		/**** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the last vertex of the last edge added to the wire under construction. warning a null vertex is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectabler.

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

		/****************** Wire ******************/
		/**** md5 signature: 1a80266ab027407949727610f03160e2 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the constructed wire; or the part of the wire under construction already built. exceptions stdfail_notdone if a wire is not built.

Returns
-------
TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepBuilderAPI_MakeWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepBuilderAPI_ModifyShape *
***********************************/
%nodefaultctor BRepBuilderAPI_ModifyShape;
class BRepBuilderAPI_ModifyShape : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Modified ******************/
		/**** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		/**** md5 signature: 2b7ee5e0dcc7da5f7f19b64339c05803 ****/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>. s can correspond to the entire initial shape or to its subshape. exceptions standard_nosuchobject if s is not the initial shape or a subshape of the initial shape to which the transformation has been applied. raises nosuchobject from standard if s is not the initial shape or a sub-shape of the initial shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

};


%extend BRepBuilderAPI_ModifyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepBuilderAPI_Copy *
****************************/
class BRepBuilderAPI_Copy : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_Copy ******************/
		/**** md5 signature: f814be791462311b9bd70700b07a803c ****/
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "Constructs an empty copy framework. use the function perform to copy shapes.

Returns
-------
None
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy();

		/****************** BRepBuilderAPI_Copy ******************/
		/**** md5 signature: 3cb4979fa2e75d4803c748d02780b980 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "Constructs a copy framework and copies the shape s. use the function shape to access the result. if copymesh is true, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). if copygeom is false, only topological objects will be copied, while geometry and triangulation will be shared with original shape. note: the constructed framework can be reused to copy other shapes: just specify them with the function perform.

Parameters
----------
S: TopoDS_Shape
copyGeom: bool,optional
	default value is Standard_True
copyMesh: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy(const TopoDS_Shape & S, const Standard_Boolean copyGeom = Standard_True, const Standard_Boolean copyMesh = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: fd7a196bf04e4d1c7c8c422daf764262 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Copies the shape s. use the function shape to access the result. if copymesh is true, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). if copygeom is false, only topological objects will be copied, while geometry and triangulation will be shared with original shape.

Parameters
----------
S: TopoDS_Shape
copyGeom: bool,optional
	default value is Standard_True
copyMesh: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean copyGeom = Standard_True, const Standard_Boolean copyMesh = Standard_False);

};


%extend BRepBuilderAPI_Copy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_GTransform *
**********************************/
class BRepBuilderAPI_GTransform : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_GTransform ******************/
		/**** md5 signature: e9a10c3514cc17ff8ed09aec00d8cb93 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "Constructs a framework for applying the geometric transformation t to a shape. use the function perform to define the shape to transform.

Parameters
----------
T: gp_GTrsf

Returns
-------
None
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform(const gp_GTrsf & T);

		/****************** BRepBuilderAPI_GTransform ******************/
		/**** md5 signature: 802e107723be9776d843f3a4e2d6fab3 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "Constructs a framework for applying the geometric transformation t to a shape, and applies it to the shape s. - if the transformation t is direct and isometric (i.e. if the determinant of the vectorial part of t is equal to 1.), and if copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - in all other cases, the transformation is applied to a duplicate of s. use the function shape to access the result. note: the constructed framework can be reused to apply the same geometric transformation to other shapes: just specify them with the function perform.

Parameters
----------
S: TopoDS_Shape
T: gp_GTrsf
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform(const TopoDS_Shape & S, const gp_GTrsf & T, const Standard_Boolean Copy = Standard_False);

		/****************** Modified ******************/
		/**** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		/**** md5 signature: 52b70a5b01905688e2ddbc00ab060e3c ****/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** Perform ******************/
		/**** md5 signature: 18b546559b34b40c9a50445613009c29 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Applies the geometric transformation defined at the time of construction of this framework to the shape s. - if the transformation t is direct and isometric (i.e. if the determinant of the vectorial part of t is equal to 1.), and if copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - in all other cases, the transformation is applied to a duplicate of s. use the function shape to access the result. note: this framework can be reused to apply the same geometric transformation to other shapes: just specify them by calling the function perform again.

Parameters
----------
S: TopoDS_Shape
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

};


%extend BRepBuilderAPI_GTransform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepBuilderAPI_NurbsConvert *
************************************/
class BRepBuilderAPI_NurbsConvert : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_NurbsConvert ******************/
		/**** md5 signature: cb8a8d7eea9b92ec4e01dce2e0e52c7d ****/
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "Constructs a framework for converting the geometry of a shape into nurbs geometry. use the function perform to define the shape to convert.

Returns
-------
None
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert();

		/****************** BRepBuilderAPI_NurbsConvert ******************/
		/**** md5 signature: 97b829c018fc2c7268806ac155e1b4cf ****/
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "Builds a new shape by converting the geometry of the shape s into nurbs geometry. specifically, all curves supporting edges of s are converted into bspline curves, and all surfaces supporting its faces are converted into bspline surfaces. use the function shape to access the new shape. note: the constructed framework can be reused to convert other shapes. you specify these with the function perform.

Parameters
----------
S: TopoDS_Shape
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

		/****************** Modified ******************/
		/**** md5 signature: a806cf91fce8bea1007aadababd10388 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		/**** md5 signature: 2b7ee5e0dcc7da5f7f19b64339c05803 ****/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>. s can correspond to the entire initial shape or to its subshape. exceptions standard_nosuchobject if s is not the initial shape or a subshape of the initial shape to which the transformation has been applied. .

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** Perform ******************/
		/**** md5 signature: 18b546559b34b40c9a50445613009c29 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Builds a new shape by converting the geometry of the shape s into nurbs geometry. specifically, all curves supporting edges of s are converted into bspline curves, and all surfaces supporting its faces are converted into bspline surfaces. use the function shape to access the new shape. note: this framework can be reused to convert other shapes: you specify them by calling the function perform again.

Parameters
----------
S: TopoDS_Shape
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

};


%extend BRepBuilderAPI_NurbsConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_Transform *
*********************************/
class BRepBuilderAPI_Transform : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_Transform ******************/
		/**** md5 signature: cbdf3e6dd6a17d83bfe43442a75e4924 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "Constructs a framework for applying the geometric transformation t to a shape. use the function perform to define the shape to transform.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform(const gp_Trsf & T);

		/****************** BRepBuilderAPI_Transform ******************/
		/**** md5 signature: 580043d7d7072f80daac5d9450a520d9 ****/
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "Creates a transformation from the gp_trsf <t>, and applies it to the shape <s>. if the transformation is direct and isometric (determinant = 1) and <copy> = standard_false, the resulting shape is <s> on which a new location has been set. otherwise, the transformation is applied on a duplication of <s>.

Parameters
----------
S: TopoDS_Shape
T: gp_Trsf
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform(const TopoDS_Shape & S, const gp_Trsf & T, const Standard_Boolean Copy = Standard_False);

		/****************** Modified ******************/
		/**** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		/**** md5 signature: 52b70a5b01905688e2ddbc00ab060e3c ****/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** Perform ******************/
		/**** md5 signature: 18b546559b34b40c9a50445613009c29 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Pplies the geometric transformation defined at the time of construction of this framework to the shape s. - if the transformation t is direct and isometric, in other words, if the determinant of the vectorial part of t is equal to 1., and if copy equals false (the default value), the resulting shape is the same as the original but with a new location assigned to it. - in all other cases, the transformation is applied to a duplicate of s. use the function shape to access the result. note: this framework can be reused to apply the same geometric transformation to other shapes. you only need to specify them by calling the function perform again.

Parameters
----------
S: TopoDS_Shape
Copy: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

};


%extend BRepBuilderAPI_Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
