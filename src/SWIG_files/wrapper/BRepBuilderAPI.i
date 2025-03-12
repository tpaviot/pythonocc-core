/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepbuilderapi.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Poly_module.hxx>
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
%import Poly.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepBuilderAPI_EdgeError {
	BRepBuilderAPI_EdgeDone = 0,
	BRepBuilderAPI_PointProjectionFailed = 1,
	BRepBuilderAPI_ParameterOutOfRange = 2,
	BRepBuilderAPI_DifferentPointsOnClosedCurve = 3,
	BRepBuilderAPI_PointWithInfiniteParameter = 4,
	BRepBuilderAPI_DifferentsPointAndParameter = 5,
	BRepBuilderAPI_LineThroughIdenticPoints = 6,
};

enum BRepBuilderAPI_FaceError {
	BRepBuilderAPI_FaceDone = 0,
	BRepBuilderAPI_NoFace = 1,
	BRepBuilderAPI_NotPlanar = 2,
	BRepBuilderAPI_CurveProjectionFailed = 3,
	BRepBuilderAPI_ParametersOutOfRange = 4,
};

enum BRepBuilderAPI_PipeError {
	BRepBuilderAPI_PipeDone = 0,
	BRepBuilderAPI_PipeNotDone = 1,
	BRepBuilderAPI_PlaneNotIntersectGuide = 2,
	BRepBuilderAPI_ImpossibleContact = 3,
};

enum BRepBuilderAPI_ShapeModification {
	BRepBuilderAPI_Preserved = 0,
	BRepBuilderAPI_Deleted = 1,
	BRepBuilderAPI_Trimmed = 2,
	BRepBuilderAPI_Merged = 3,
	BRepBuilderAPI_BoundaryModified = 4,
};

enum BRepBuilderAPI_ShellError {
	BRepBuilderAPI_ShellDone = 0,
	BRepBuilderAPI_EmptyShell = 1,
	BRepBuilderAPI_DisconnectedShell = 2,
	BRepBuilderAPI_ShellParametersOutOfRange = 3,
};

enum BRepBuilderAPI_TransitionMode {
	BRepBuilderAPI_Transformed = 0,
	BRepBuilderAPI_RightCorner = 1,
	BRepBuilderAPI_RoundCorner = 2,
};

enum BRepBuilderAPI_WireError {
	BRepBuilderAPI_WireDone = 0,
	BRepBuilderAPI_EmptyWire = 1,
	BRepBuilderAPI_DisconnectedWire = 2,
	BRepBuilderAPI_NonManifoldWire = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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

class BRepBuilderAPI_PipeError(IntEnum):
	BRepBuilderAPI_PipeDone = 0
	BRepBuilderAPI_PipeNotDone = 1
	BRepBuilderAPI_PlaneNotIntersectGuide = 2
	BRepBuilderAPI_ImpossibleContact = 3
BRepBuilderAPI_PipeDone = BRepBuilderAPI_PipeError.BRepBuilderAPI_PipeDone
BRepBuilderAPI_PipeNotDone = BRepBuilderAPI_PipeError.BRepBuilderAPI_PipeNotDone
BRepBuilderAPI_PlaneNotIntersectGuide = BRepBuilderAPI_PipeError.BRepBuilderAPI_PlaneNotIntersectGuide
BRepBuilderAPI_ImpossibleContact = BRepBuilderAPI_PipeError.BRepBuilderAPI_ImpossibleContact

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

class BRepBuilderAPI_ShellError(IntEnum):
	BRepBuilderAPI_ShellDone = 0
	BRepBuilderAPI_EmptyShell = 1
	BRepBuilderAPI_DisconnectedShell = 2
	BRepBuilderAPI_ShellParametersOutOfRange = 3
BRepBuilderAPI_ShellDone = BRepBuilderAPI_ShellError.BRepBuilderAPI_ShellDone
BRepBuilderAPI_EmptyShell = BRepBuilderAPI_ShellError.BRepBuilderAPI_EmptyShell
BRepBuilderAPI_DisconnectedShell = BRepBuilderAPI_ShellError.BRepBuilderAPI_DisconnectedShell
BRepBuilderAPI_ShellParametersOutOfRange = BRepBuilderAPI_ShellError.BRepBuilderAPI_ShellParametersOutOfRange

class BRepBuilderAPI_TransitionMode(IntEnum):
	BRepBuilderAPI_Transformed = 0
	BRepBuilderAPI_RightCorner = 1
	BRepBuilderAPI_RoundCorner = 2
BRepBuilderAPI_Transformed = BRepBuilderAPI_TransitionMode.BRepBuilderAPI_Transformed
BRepBuilderAPI_RightCorner = BRepBuilderAPI_TransitionMode.BRepBuilderAPI_RightCorner
BRepBuilderAPI_RoundCorner = BRepBuilderAPI_TransitionMode.BRepBuilderAPI_RoundCorner

class BRepBuilderAPI_WireError(IntEnum):
	BRepBuilderAPI_WireDone = 0
	BRepBuilderAPI_EmptyWire = 1
	BRepBuilderAPI_DisconnectedWire = 2
	BRepBuilderAPI_NonManifoldWire = 3
BRepBuilderAPI_WireDone = BRepBuilderAPI_WireError.BRepBuilderAPI_WireDone
BRepBuilderAPI_EmptyWire = BRepBuilderAPI_WireError.BRepBuilderAPI_EmptyWire
BRepBuilderAPI_DisconnectedWire = BRepBuilderAPI_WireError.BRepBuilderAPI_DisconnectedWire
BRepBuilderAPI_NonManifoldWire = BRepBuilderAPI_WireError.BRepBuilderAPI_NonManifoldWire
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepBuilderAPI_FastSewing)
%wrap_handle(BRepBuilderAPI_Sewing)
/* end handles declaration */

/* templates */
%template(BRepBuilderAPI_BndBoxTree) NCollection_UBTree<Standard_Integer,Bnd_Box>;
%template(VectorOfPoint) NCollection_Vector<gp_XYZ>;
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
		/****** BRepBuilderAPI::Plane ******/
		/****** md5 signature: 215779db6a724a03f9f8ce477370cef4 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
P: Geom_Plane

Return
-------
None

Description
-----------
Sets the current plane.
") Plane;
		static void Plane(const opencascade::handle<Geom_Plane> & P);

		/****** BRepBuilderAPI::Plane ******/
		/****** md5 signature: 6d27cd1f706ac4d5f7ea5e003d1302b0 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the current plane.
") Plane;
		static const opencascade::handle<Geom_Plane> & Plane();

		/****** BRepBuilderAPI::Precision ******/
		/****** md5 signature: ced9db4ac4e8a407df5972bac5488688 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
Sets the default precision. The current Precision is returned.
") Precision;
		static void Precision(const Standard_Real P);

		/****** BRepBuilderAPI::Precision ******/
		/****** md5 signature: 5a0c763be80263f1e28f9182713f12dc ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the default precision.
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
		/****** BRepBuilderAPI_Collect::BRepBuilderAPI_Collect ******/
		/****** md5 signature: 389c61cabe5e3b0cdaed5ff1824ab60c ******/
		%feature("compactdefaultargs") BRepBuilderAPI_Collect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_Collect;
		 BRepBuilderAPI_Collect();

		/****** BRepBuilderAPI_Collect::Add ******/
		/****** md5 signature: a5c5cb395419acc4c81c2fc73ccd4b50 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
SI: TopoDS_Shape
MKS: BRepBuilderAPI_MakeShape

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & SI, BRepBuilderAPI_MakeShape & MKS);

		/****** BRepBuilderAPI_Collect::AddGenerated ******/
		/****** md5 signature: 24d2f071681238ae41ddf97ad14ec2c3 ******/
		%feature("compactdefaultargs") AddGenerated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Gen: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddGenerated;
		void AddGenerated(const TopoDS_Shape & S, const TopoDS_Shape & Gen);

		/****** BRepBuilderAPI_Collect::AddModif ******/
		/****** md5 signature: d42b5cf3b841c945de9d3d65afeede81 ******/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Mod: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddModif;
		void AddModif(const TopoDS_Shape & S, const TopoDS_Shape & Mod);

		/****** BRepBuilderAPI_Collect::Filter ******/
		/****** md5 signature: 0a1acafd79b78748618f690fbfb61533 ******/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "
Parameters
----------
SF: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Filter;
		void Filter(const TopoDS_Shape & SF);

		/****** BRepBuilderAPI_Collect::Generated ******/
		/****** md5 signature: 176507b5ffd0100ab7a88bdc3ba1ff71 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeListOfShape

Description
-----------
No available documentation.
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated();

		/****** BRepBuilderAPI_Collect::Modification ******/
		/****** md5 signature: 8146072a56cfb726ec8891f6d418e953 ******/
		%feature("compactdefaultargs") Modification;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeListOfShape

Description
-----------
No available documentation.
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
		/****** BRepBuilderAPI_Command::Check ******/
		/****** md5 signature: f34c3545e20ecd4b70f0028e921e213b ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
None

Description
-----------
Raises NotDone if done is false.
") Check;
		void Check();

		/****** BRepBuilderAPI_Command::IsDone ******/
		/****** md5 signature: 1dfe5875b8bc7f7b11380fb4ab8a9eb0 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
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

/* python proxy classes for enums */
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

		/****** BRepBuilderAPI_FastSewing::BRepBuilderAPI_FastSewing ******/
		/****** md5 signature: 5cdf281365d4a008fe89ed2644d07eef ******/
		%feature("compactdefaultargs") BRepBuilderAPI_FastSewing;
		%feature("autodoc", "
Parameters
----------
theTolerance: float (optional, default to 1.0e-06)

Return
-------
None

Description
-----------
Creates an object with tolerance of connexity.
") BRepBuilderAPI_FastSewing;
		 BRepBuilderAPI_FastSewing(const Standard_Real theTolerance = 1.0e-06);

		/****** BRepBuilderAPI_FastSewing::Add ******/
		/****** md5 signature: 68dfa588b1680a2069907b2bf05e1c65 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Adds faces of a shape.
") Add;
		Standard_Boolean Add(const TopoDS_Shape & theShape);

		/****** BRepBuilderAPI_FastSewing::Add ******/
		/****** md5 signature: 5c877fb8c71029cef3b4fa5692a20197 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface

Return
-------
bool

Description
-----------
Adds a surface.
") Add;
		Standard_Boolean Add(const opencascade::handle<Geom_Surface> & theSurface);

		/****** BRepBuilderAPI_FastSewing::GetResult ******/
		/****** md5 signature: 9bb8729ba64a056c1d3bbe9695c34e70 ******/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns resulted shape.
") GetResult;
		const TopoDS_Shape GetResult();

		/****** BRepBuilderAPI_FastSewing::GetTolerance ******/
		/****** md5 signature: 08094ae040a166d1b252ee02000bca27 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns tolerance.
") GetTolerance;
		Standard_Real GetTolerance();

		/****** BRepBuilderAPI_FastSewing::Perform ******/
		/****** md5 signature: edb59e2ca9c97ae6c4d9ce2566330337 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Compute resulted shape.
") Perform;
		void Perform();

		/****** BRepBuilderAPI_FastSewing::SetTolerance ******/
		/****** md5 signature: 4181eb50f502c475b9b01c03a6a70db9 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theToler: float

Return
-------
None

Description
-----------
Sets tolerance.
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
		/****** BRepBuilderAPI_FindPlane::BRepBuilderAPI_FindPlane ******/
		/****** md5 signature: ef4ea376286fb1ede698f0b19cc4f429 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes an empty algorithm. The function Init is then used to define the shape.
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane();

		/****** BRepBuilderAPI_FindPlane::BRepBuilderAPI_FindPlane ******/
		/****** md5 signature: 763aa4ae1a7235c1609845cf21bc92e2 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tol: float (optional, default to -1)

Return
-------
None

Description
-----------
Constructs the plane containing the edges of the shape S. A plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. This tolerance value is equal to the larger of the following two values: - Tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of S. Use the function Found to verify that a plane is built. The resulting plane is then retrieved using the function Plane.
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane(const TopoDS_Shape & S, const Standard_Real Tol = -1);

		/****** BRepBuilderAPI_FindPlane::Found ******/
		/****** md5 signature: f98a87b5981b48fa74222eaa5aa8feb6 ******/
		%feature("compactdefaultargs") Found;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a plane containing the edges of the shape is found and built. Use the function Plane to consult the result.
") Found;
		Standard_Boolean Found();

		/****** BRepBuilderAPI_FindPlane::Init ******/
		/****** md5 signature: 4d646163f720cb1bdaa4671839b00b98 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tol: float (optional, default to -1)

Return
-------
None

Description
-----------
Constructs the plane containing the edges of the shape S. A plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. This tolerance value is equal to the larger of the following two values: - Tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of S. Use the function Found to verify that a plane is built. The resulting plane is then retrieved using the function Plane.
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Real Tol = -1);

		/****** BRepBuilderAPI_FindPlane::Plane ******/
		/****** md5 signature: 5c94d426c8cb0ea718d9147a0f1d68f5 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the plane containing the edges of the shape. Warning Use the function Found to verify that the plane is built. If a plane is not found, Plane returns a null handle.
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
		/****** BRepBuilderAPI_Sewing::BRepBuilderAPI_Sewing ******/
		/****** md5 signature: e18a1d19a8b6425820c30aa95cb1c4b9 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_Sewing;
		%feature("autodoc", "
Parameters
----------
tolerance: float (optional, default to 1.0e-06)
option1: bool (optional, default to Standard_True)
option2: bool (optional, default to Standard_True)
option3: bool (optional, default to Standard_True)
option4: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates an object with tolerance of connexity option for sewing (if false only control) option for analysis of degenerated shapes option for cutting of free edges. option for non manifold processing.
") BRepBuilderAPI_Sewing;
		 BRepBuilderAPI_Sewing(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option1 = Standard_True, const Standard_Boolean option2 = Standard_True, const Standard_Boolean option3 = Standard_True, const Standard_Boolean option4 = Standard_False);

		/****** BRepBuilderAPI_Sewing::Add ******/
		/****** md5 signature: e2be6f2074943772e403ebcbe671347a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Defines the shapes to be sewed or controlled.
") Add;
		void Add(const TopoDS_Shape & shape);

		/****** BRepBuilderAPI_Sewing::ContigousEdge ******/
		/****** md5 signature: 528f0ebefe61a096548f88451970603d ******/
		%feature("compactdefaultargs") ContigousEdge;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Edge

Description
-----------
Gives each contiguous edge.
") ContigousEdge;
		const TopoDS_Edge ContigousEdge(const Standard_Integer index);

		/****** BRepBuilderAPI_Sewing::ContigousEdgeCouple ******/
		/****** md5 signature: 783b24657c04ecf4547ffd8cfddcc368 ******/
		%feature("compactdefaultargs") ContigousEdgeCouple;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopTools_ListOfShape

Description
-----------
Gives the sections (edge) belonging to a contiguous edge.
") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple(const Standard_Integer index);

		/****** BRepBuilderAPI_Sewing::DegeneratedShape ******/
		/****** md5 signature: e6eb24cfb41ed6276abbd22e81382ad4 ******/
		%feature("compactdefaultargs") DegeneratedShape;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Shape

Description
-----------
Gives each degenerated shape.
") DegeneratedShape;
		const TopoDS_Shape DegeneratedShape(const Standard_Integer index);

		/****** BRepBuilderAPI_Sewing::DeletedFace ******/
		/****** md5 signature: e964b07feb42f72561b85423c8033fca ******/
		%feature("compactdefaultargs") DeletedFace;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Face

Description
-----------
Gives each deleted face.
") DeletedFace;
		const TopoDS_Face DeletedFace(const Standard_Integer index);

		/****** BRepBuilderAPI_Sewing::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
print the information.
") Dump;
		void Dump();

		/****** BRepBuilderAPI_Sewing::FaceMode ******/
		/****** md5 signature: 21661531f4beeda56376b9777120d25d ******/
		%feature("compactdefaultargs") FaceMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns mode for sewing faces By default - true.
") FaceMode;
		Standard_Boolean FaceMode();

		/****** BRepBuilderAPI_Sewing::FloatingEdgesMode ******/
		/****** md5 signature: 4a5c8040ae5369a46adc16bfcec4bd53 ******/
		%feature("compactdefaultargs") FloatingEdgesMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns mode for sewing floating edges By default - false.
") FloatingEdgesMode;
		Standard_Boolean FloatingEdgesMode();

		/****** BRepBuilderAPI_Sewing::FreeEdge ******/
		/****** md5 signature: d7877d5632d059ec28a98ec8914a60d4 ******/
		%feature("compactdefaultargs") FreeEdge;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Edge

Description
-----------
Gives each free edge.
") FreeEdge;
		const TopoDS_Edge FreeEdge(const Standard_Integer index);

		/****** BRepBuilderAPI_Sewing::GetContext ******/
		/****** md5 signature: 4fb4f0ef4e8072c0449192799698250c ******/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_ReShape>

Description
-----------
return context.
") GetContext;
		const opencascade::handle<BRepTools_ReShape> & GetContext();

		/****** BRepBuilderAPI_Sewing::Init ******/
		/****** md5 signature: 9a7c36413c1eb2ae42b6435c1c7d2e86 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
tolerance: float (optional, default to 1.0e-06)
option1: bool (optional, default to Standard_True)
option2: bool (optional, default to Standard_True)
option3: bool (optional, default to Standard_True)
option4: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
initialize the parameters if necessary.
") Init;
		void Init(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option1 = Standard_True, const Standard_Boolean option2 = Standard_True, const Standard_Boolean option3 = Standard_True, const Standard_Boolean option4 = Standard_False);

		/****** BRepBuilderAPI_Sewing::IsDegenerated ******/
		/****** md5 signature: 84979167278e746e62a21a790a7cd87e ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Indicates if a input shape is degenerated.
") IsDegenerated;
		Standard_Boolean IsDegenerated(const TopoDS_Shape & shape);

		/****** BRepBuilderAPI_Sewing::IsModified ******/
		/****** md5 signature: 1d5d4f025b62ca0ccc6672d39cdf22fc ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Indicates if a input shape has been modified.
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Shape & shape);

		/****** BRepBuilderAPI_Sewing::IsModifiedSubShape ******/
		/****** md5 signature: 7a0857a507d3c4158ac7100a028d6a23 ******/
		%feature("compactdefaultargs") IsModifiedSubShape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Indicates if a input subshape has been modified.
") IsModifiedSubShape;
		Standard_Boolean IsModifiedSubShape(const TopoDS_Shape & shape);

		/****** BRepBuilderAPI_Sewing::IsSectionBound ******/
		/****** md5 signature: cd9153a526df9f57af17b95cfb016aa1 ******/
		%feature("compactdefaultargs") IsSectionBound;
		%feature("autodoc", "
Parameters
----------
section: TopoDS_Edge

Return
-------
bool

Description
-----------
Indicates if a section is bound (before use SectionToBoundary).
") IsSectionBound;
		Standard_Boolean IsSectionBound(const TopoDS_Edge & section);

		/****** BRepBuilderAPI_Sewing::Load ******/
		/****** md5 signature: 5e48307a99195c8c9f614df4cf55663d ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Loads the context shape.
") Load;
		void Load(const TopoDS_Shape & shape);

		/****** BRepBuilderAPI_Sewing::LocalTolerancesMode ******/
		/****** md5 signature: d909e2ebc0fc932438ad29d4934d9840 ******/
		%feature("compactdefaultargs") LocalTolerancesMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns mode for accounting of local tolerances of edges and vertices during of merging.
") LocalTolerancesMode;
		Standard_Boolean LocalTolerancesMode();

		/****** BRepBuilderAPI_Sewing::MaxTolerance ******/
		/****** md5 signature: b0c09a40965fea8fc4d63c52a795d7fd ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Gives set max tolerance.
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****** BRepBuilderAPI_Sewing::MinTolerance ******/
		/****** md5 signature: 2629547ec2afd3a7a2edaa268cbc0366 ******/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Gives set min tolerance.
") MinTolerance;
		Standard_Real MinTolerance();

		/****** BRepBuilderAPI_Sewing::Modified ******/
		/****** md5 signature: 8eae36e55014fa2f45331a4af35cda4c ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Gives a modifieded shape.
") Modified;
		const TopoDS_Shape Modified(const TopoDS_Shape & shape);

		/****** BRepBuilderAPI_Sewing::ModifiedSubShape ******/
		/****** md5 signature: 73e3082562f6dcafa13952269a08c5fa ******/
		%feature("compactdefaultargs") ModifiedSubShape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Gives a modifieded subshape.
") ModifiedSubShape;
		TopoDS_Shape ModifiedSubShape(const TopoDS_Shape & shape);

		/****** BRepBuilderAPI_Sewing::MultipleEdge ******/
		/****** md5 signature: 128ede0c8440ddd28a067c7bb024d295 ******/
		%feature("compactdefaultargs") MultipleEdge;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Edge

Description
-----------
Gives each multiple edge.
") MultipleEdge;
		const TopoDS_Edge MultipleEdge(const Standard_Integer index);

		/****** BRepBuilderAPI_Sewing::NbContigousEdges ******/
		/****** md5 signature: c293fac1d421e2d1f7207054b4a45923 ******/
		%feature("compactdefaultargs") NbContigousEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of contiguous edges (edge shared by two faces).
") NbContigousEdges;
		Standard_Integer NbContigousEdges();

		/****** BRepBuilderAPI_Sewing::NbDegeneratedShapes ******/
		/****** md5 signature: 002576d80bfb4575f6cdfeeff5b81a1e ******/
		%feature("compactdefaultargs") NbDegeneratedShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of degenerated shapes.
") NbDegeneratedShapes;
		Standard_Integer NbDegeneratedShapes();

		/****** BRepBuilderAPI_Sewing::NbDeletedFaces ******/
		/****** md5 signature: 4ba093eaaa12ab2808b2529553c686f1 ******/
		%feature("compactdefaultargs") NbDeletedFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of deleted faces (faces smallest than tolerance).
") NbDeletedFaces;
		Standard_Integer NbDeletedFaces();

		/****** BRepBuilderAPI_Sewing::NbFreeEdges ******/
		/****** md5 signature: 601078396c3dc97b2847707250e5a03a ******/
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of free edges (edge shared by one face).
") NbFreeEdges;
		Standard_Integer NbFreeEdges();

		/****** BRepBuilderAPI_Sewing::NbMultipleEdges ******/
		/****** md5 signature: 656b6af0bb5cea1fea2a3c70157e30b5 ******/
		%feature("compactdefaultargs") NbMultipleEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of multiple edges (edge shared by more than two faces).
") NbMultipleEdges;
		Standard_Integer NbMultipleEdges();

		/****** BRepBuilderAPI_Sewing::NonManifoldMode ******/
		/****** md5 signature: 34f87de0adb2c358ab80ad641118c76e ******/
		%feature("compactdefaultargs") NonManifoldMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets mode for non-manifold sewing. //! INTERNAL FUNCTIONS ---.
") NonManifoldMode;
		Standard_Boolean NonManifoldMode();

		/****** BRepBuilderAPI_Sewing::Perform ******/
		/****** md5 signature: d7fed22833997c4a8f7923f6a29bd664 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Computing theProgress - progress indicator of algorithm.
") Perform;
		void Perform(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** BRepBuilderAPI_Sewing::SameParameterMode ******/
		/****** md5 signature: 7e498208ee59dfaf63264199ca1716c8 ******/
		%feature("compactdefaultargs") SameParameterMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets same parameter mode.
") SameParameterMode;
		Standard_Boolean SameParameterMode();

		/****** BRepBuilderAPI_Sewing::SectionToBoundary ******/
		/****** md5 signature: 8753cd22e70a557633e4602d07baeefe ******/
		%feature("compactdefaultargs") SectionToBoundary;
		%feature("autodoc", "
Parameters
----------
section: TopoDS_Edge

Return
-------
TopoDS_Edge

Description
-----------
Gives the original edge (free boundary) which becomes the the section. Remember that sections constitute common edges. This information is important for control because with original edge we can find the surface to which the section is attached.
") SectionToBoundary;
		const TopoDS_Edge SectionToBoundary(const TopoDS_Edge & section);

		/****** BRepBuilderAPI_Sewing::SetContext ******/
		/****** md5 signature: d164363977e75e7eed55b6d2c433f4ef ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theContext: BRepTools_ReShape

Return
-------
None

Description
-----------
set context.
") SetContext;
		void SetContext(const opencascade::handle<BRepTools_ReShape> & theContext);

		/****** BRepBuilderAPI_Sewing::SetFaceMode ******/
		/****** md5 signature: be33d5623b757a136bdeb5a9404588b8 ******/
		%feature("compactdefaultargs") SetFaceMode;
		%feature("autodoc", "
Parameters
----------
theFaceMode: bool

Return
-------
None

Description
-----------
Sets mode for sewing faces By default - true.
") SetFaceMode;
		void SetFaceMode(const Standard_Boolean theFaceMode);

		/****** BRepBuilderAPI_Sewing::SetFloatingEdgesMode ******/
		/****** md5 signature: 9e535d43ee813c0bb3f60089705740ad ******/
		%feature("compactdefaultargs") SetFloatingEdgesMode;
		%feature("autodoc", "
Parameters
----------
theFloatingEdgesMode: bool

Return
-------
None

Description
-----------
Sets mode for sewing floating edges By default - false. Returns mode for cutting floating edges By default - false. Sets mode for cutting floating edges By default - false.
") SetFloatingEdgesMode;
		void SetFloatingEdgesMode(const Standard_Boolean theFloatingEdgesMode);

		/****** BRepBuilderAPI_Sewing::SetLocalTolerancesMode ******/
		/****** md5 signature: 11968066a6abf7bbfe86e1caa2d4682f ******/
		%feature("compactdefaultargs") SetLocalTolerancesMode;
		%feature("autodoc", "
Parameters
----------
theLocalTolerancesMode: bool

Return
-------
None

Description
-----------
Sets mode for accounting of local tolerances of edges and vertices during of merging in this case WorkTolerance = myTolerance + tolEdge1+ tolEdg2;.
") SetLocalTolerancesMode;
		void SetLocalTolerancesMode(const Standard_Boolean theLocalTolerancesMode);

		/****** BRepBuilderAPI_Sewing::SetMaxTolerance ******/
		/****** md5 signature: 4b5771be6c78dcae85f644f87aad2350 ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
theMaxToler: float

Return
-------
None

Description
-----------
Sets max tolerance.
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real theMaxToler);

		/****** BRepBuilderAPI_Sewing::SetMinTolerance ******/
		/****** md5 signature: 7ba51e2f5c5991bb95f9e3c8a5d6f1f3 ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
theMinToler: float

Return
-------
None

Description
-----------
Sets min tolerance.
") SetMinTolerance;
		void SetMinTolerance(const Standard_Real theMinToler);

		/****** BRepBuilderAPI_Sewing::SetNonManifoldMode ******/
		/****** md5 signature: 5d218b8a6549d6b81b32f7e6532da86f ******/
		%feature("compactdefaultargs") SetNonManifoldMode;
		%feature("autodoc", "
Parameters
----------
theNonManifoldMode: bool

Return
-------
None

Description
-----------
Sets mode for non-manifold sewing.
") SetNonManifoldMode;
		void SetNonManifoldMode(const Standard_Boolean theNonManifoldMode);

		/****** BRepBuilderAPI_Sewing::SetSameParameterMode ******/
		/****** md5 signature: 31ed69081c7788c7c8d7bac985fad0fb ******/
		%feature("compactdefaultargs") SetSameParameterMode;
		%feature("autodoc", "
Parameters
----------
SameParameterMode: bool

Return
-------
None

Description
-----------
Sets same parameter mode.
") SetSameParameterMode;
		void SetSameParameterMode(const Standard_Boolean SameParameterMode);

		/****** BRepBuilderAPI_Sewing::SetTolerance ******/
		/****** md5 signature: 6adfe96b6feba352d7526961c84ccdab ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theToler: float

Return
-------
None

Description
-----------
Sets tolerance.
") SetTolerance;
		void SetTolerance(const Standard_Real theToler);

		/****** BRepBuilderAPI_Sewing::SewedShape ******/
		/****** md5 signature: 15c4b701ec45daeb64ce5999149305ef ******/
		%feature("compactdefaultargs") SewedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Gives the sewed shape a null shape if nothing constructed may be a face, a shell, a solid or a compound.
") SewedShape;
		const TopoDS_Shape SewedShape();

		/****** BRepBuilderAPI_Sewing::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Gives set tolerance.
") Tolerance;
		Standard_Real Tolerance();

		/****** BRepBuilderAPI_Sewing::WhichFace ******/
		/****** md5 signature: 3e589a12446d56482439b5fd7cbfa5d8 ******/
		%feature("compactdefaultargs") WhichFace;
		%feature("autodoc", "
Parameters
----------
theEdg: TopoDS_Edge
index: int (optional, default to 1)

Return
-------
TopoDS_Face

Description
-----------
Gives a modified shape.
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
		/****** BRepBuilderAPI_VertexInspector::BRepBuilderAPI_VertexInspector ******/
		/****** md5 signature: 0eeefa290e63d77a3860d0886de050c7 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_VertexInspector;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
Constructor; remembers the tolerance.
") BRepBuilderAPI_VertexInspector;
		 BRepBuilderAPI_VertexInspector(const Standard_Real theTol);

		/****** BRepBuilderAPI_VertexInspector::Add ******/
		/****** md5 signature: 674df0f2056599deaae173500780a92d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
None

Description
-----------
Keep the points used for comparison.
") Add;
		void Add(const gp_XYZ & thePnt);

		/****** BRepBuilderAPI_VertexInspector::ClearResList ******/
		/****** md5 signature: 437c3c9842327f69417ece821777001d ******/
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear the list of adjacent points.
") ClearResList;
		void ClearResList();

		/****** BRepBuilderAPI_VertexInspector::Inspect ******/
		/****** md5 signature: 261093865d6e31515b7e7f70c791b792 ******/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "
Parameters
----------
theTarget: int

Return
-------
NCollection_CellFilter_Action

Description
-----------
Implementation of inspection method.
") Inspect;
		NCollection_CellFilter_Action Inspect(const Standard_Integer theTarget);

		/****** BRepBuilderAPI_VertexInspector::ResInd ******/
		/****** md5 signature: 06a54f141487331d8d67cc5507fd93fe ******/
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Get list of indexes of points adjacent with the current.
") ResInd;
		const TColStd_ListOfInteger & ResInd();

		/****** BRepBuilderAPI_VertexInspector::SetCurrent ******/
		/****** md5 signature: 52c7652c9c3b17a93e1b9f74b55265ec ******/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "
Parameters
----------
theCurPnt: gp_XYZ

Return
-------
None

Description
-----------
Set current point to search for coincidence.
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
		/****** BRepBuilderAPI_BndBoxTreeSelector::BRepBuilderAPI_BndBoxTreeSelector ******/
		/****** md5 signature: 701377c6f5b5b4ad360057f52164f1cc ******/
		%feature("compactdefaultargs") BRepBuilderAPI_BndBoxTreeSelector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor; calls the base class constructor.
") BRepBuilderAPI_BndBoxTreeSelector;
		 BRepBuilderAPI_BndBoxTreeSelector();

		/****** BRepBuilderAPI_BndBoxTreeSelector::Accept ******/
		/****** md5 signature: 5815dd7c853dd2ee8117fbcdf8728805 ******/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "
Parameters
----------
theObj: int

Return
-------
bool

Description
-----------
Implementation of acceptance method This method is called when the bounding box intersect with the current. It stores the object - the index of box in the list of accepted objects. 
Return: True, because the object is accepted.
") Accept;
		Standard_Boolean Accept(const Standard_Integer & theObj);

		/****** BRepBuilderAPI_BndBoxTreeSelector::ClearResList ******/
		/****** md5 signature: 437c3c9842327f69417ece821777001d ******/
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear the list of intersecting boxes.
") ClearResList;
		void ClearResList();

		/****** BRepBuilderAPI_BndBoxTreeSelector::Reject ******/
		/****** md5 signature: d86ca564c619503e8a9e9a9dd035781a ******/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
bool

Description
-----------
Implementation of rejection method 
Return: True if the bounding box does not intersect with the current.
") Reject;
		Standard_Boolean Reject(const Bnd_Box & theBox);

		/****** BRepBuilderAPI_BndBoxTreeSelector::ResInd ******/
		/****** md5 signature: 06a54f141487331d8d67cc5507fd93fe ******/
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Get list of indexes of boxes intersecting with the current box.
") ResInd;
		const TColStd_ListOfInteger & ResInd();

		/****** BRepBuilderAPI_BndBoxTreeSelector::SetCurrent ******/
		/****** md5 signature: f630ad6cec547ab81dd1ff7942351413 ******/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
None

Description
-----------
Set current box to search for overlapping with him.
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
		/****** BRepBuilderAPI_MakeShape::Build ******/
		/****** md5 signature: d39f8b7cbf799a16c2e10ed4575e82fe ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
This is called by Shape(). It does nothing but may be redefined.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepBuilderAPI_MakeShape::Generated ******/
		/****** md5 signature: ec0cc02a1efd6cf2ce3c0b78f26c1d07 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_MakeShape::IsDeleted ******/
		/****** md5 signature: eb6924b9523d7e4f22d23c7c973700db ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape S has been deleted.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_MakeShape::Modified ******/
		/****** md5 signature: a806cf91fce8bea1007aadababd10388 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_MakeShape::Shape ******/
		/****** md5 signature: 2d17c0c46a6272e892d56c2b4312553d ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a shape built by the shape construction algorithm. Raises exception StdFail_NotDone if the shape was not built.
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
		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 0f4dfcd8f012cf307355479d4f35ebf8 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge();

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 03760e464316327715c9f60169e5c353 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 1d9c138e8ad8dac88bf15ba61ca8eeea ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: a5bad4ad36582766f329b2997750bd64 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: cab45d250f4e44f193c7ef6ad550c658 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: f2a39fbc1a11abf4d5ee9cb892172a65 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 180771a5e26f55185893bfbc74200e26 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 01f9144f68791c93ea0b77b16ae7f738 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 9c413b91f4f43dbb36a6be7b3575c890 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 3dfc053e7499ca226c956c4bd26ed85d ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: ffe72e79252ec3798fe6ad30ff8a9d8c ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: f0af09a1e0509e61e8f46e9b99a5f265 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 4ee630b3a076bf0e9dad64f944eba049 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 2ef92171d9092a0e8f3c7bf0b7d90e0f ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 5df7d682759ac8fa2d83101a9ae6744a ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 13812eb3449432a1961fdc8707025659 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: fc8c25337ccae7524af5016c0558529d ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 125132cc5b68b71332321fdb8ed75aef ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 5c1bf3d6aaa00d737afd406d3c012341 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: d97ef5d901ee9aab613ae11dba6cb537 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 9bdd925165b2ff5d5abb2947ee8d711a ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 3b344cb2d8419d529ee9d54d2f6cc669 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 5f6deb41b0ccadcc0541de06b4588820 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 230e0e9c29476df7018fb49aef783237 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: d49aaa94a0b6680c60d31379455f3068 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 9add2febba648d64ba90e4afe104291e ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 45ce7c9f95893c06e5e00995284ecf21 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 72e4841e5d7e7c2edb5bc8aa27592395 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 07688a814bb54bebc945f45067aefbe5 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: a4782af46daf51d670da12ea4e8c9988 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: b8076f60fd8e4e00baf4eb4e6d15d226 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 8695836e69885815046f06b0ae0bc482 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 03da4358eb0602d842c54753b709c010 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: 1129d1ac8dade951df00631adc5bd7eb ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::BRepBuilderAPI_MakeEdge ******/
		/****** md5 signature: acd21d73401432f2c365942d82c1fc03 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Return
-------
None

Description
-----------
The general method to directly create an edge is to give - a 3D curve C as the support (geometric domain) of the edge, - two vertices V1 and V2 to limit the curve (definition of the restriction of the edge), and - two real values p1 and p2 which are the parameters for the vertices V1 and V2 on the curve. The curve may be defined as a 2d curve in the parametric space of a surface: a pcurve. The surface on which the edge is built is then kept at the level of the edge. The default tolerance will be associated with this edge. Rules applied to the arguments: For the curve: - The curve must not be a 'null handle'. - If the curve is a trimmed curve the basis curve is used. For the vertices: - Vertices may be null shapes. When V1 or V2 is null the edge is open in the corresponding direction and the parameter value p1 or p2 must be infinite (remember that Precision::Infinite() defines an infinite value). - The two vertices must be identical if they have the same 3D location. Identical vertices are used in particular when the curve is closed. For the parameters: - The parameters must be in the parametric range of the curve (or the basis curve if the curve is trimmed). If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_ParameterOutOfRange. - Parameter values must not be equal. If this condition is not satisfied (i.e. if | p1 - p2 | ) the edge is not built, and the Error function will return BRepAPI_LineThroughIdenticPoints. Parameter values are expected to be given in increasing order: C->FirstParameter() - If the parameter values are given in decreasing order the vertices are switched, i.e. the 'first vertex' is on the point of parameter p2 and the 'second vertex' is on the point of parameter p1. In such a case, to keep the original intent of the construction, the edge will be oriented 'reversed'. - On a periodic curve the parameter values p1 and p2 are adjusted by adding or subtracting the period to obtain p1 in the parametric range of the curve, and p2] such that [ p1 , where Period is the period of the curve. - A parameter value may be infinite. The edge is open in the corresponding direction. However the corresponding vertex must be a null shape. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_PointWithInfiniteParameter. - The distance between the vertex and the point evaluated on the curve with the parameter, must be lower than the precision of the vertex. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_DifferentsPointAndParameter. Other edge constructions - The parameter values can be omitted, they will be computed by projecting the vertices on the curve. Note that projection is the only way to evaluate the parameter values of the vertices on the curve: vertices must be given on the curve, i.e. the distance from a vertex to the curve must be less than or equal to the precision of the vertex. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_PointProjectionFailed. - 3D points can be given in place of vertices. Vertices will be created from the points (with the default topological precision Precision::Confusion()). Note: - Giving vertices is useful when creating a connected edge. - If the parameter values correspond to the extremities of a closed curve, points must be identical, or at least coincident. If this condition is not satisfied the edge is not built, and the Error function will return BRepAPI_DifferentPointsOnClosedCurve. - The vertices or points can be omitted if the parameter values are given. The points will be computed from the parameters on the curve. The vertices or points and the parameter values can be omitted. The first and last parameters of the curve will then be used. //! Auxiliary methods.
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::Edge ******/
		/****** md5 signature: 768a18012e715670ae29301e23e2cf8b ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the constructed edge. Exceptions StdFail_NotDone if the edge is not built.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepBuilderAPI_MakeEdge::Error ******/
		/****** md5 signature: eed0e2d16bc922bda6437a7e6e62f61b ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepBuilderAPI_EdgeError

Description
-----------
Returns the construction status - BRepBuilderAPI_EdgeDone if the edge is built, or - another value of the BRepBuilderAPI_EdgeError enumeration indicating the reason of construction failure.
") Error;
		BRepBuilderAPI_EdgeError Error();

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 3a7fb0adde1a97c68f435539513bba2c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 69ab6deacb22a5a946bd084862db1233 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 235ac27b5a022827b7d54091e2111592 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 9b236210e3d8f5b8c0ae08f9ff665d2d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: b7311420b3eb1ee66bd9b3232f6bbf14 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: f0ddd1dcd6baa38ff9d6ad052ec8cf95 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 2207b24682fbbcefc3a70c5dcfc79e41 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 46ba1cf0906b7383d025da040ff8be26 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 0b0c938b079b5bfdc1085e8f8a945803 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: cc30f692d59f3ba69b1c4b104a9aba38 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 13f84c1b43401d2a23e02820d3c88735 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::Init ******/
		/****** md5 signature: 59918a63418830ecee317dd35f9016cc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Return
-------
None

Description
-----------
Defines or redefines the arguments for the construction of an edge. This function is currently used after the empty constructor BRepAPI_MakeEdge().
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the edge is built.
") IsDone;
		virtual Standard_Boolean IsDone();

		/****** BRepBuilderAPI_MakeEdge::Vertex1 ******/
		/****** md5 signature: 3013872331c1fad0ef9330909eb27447 ******/
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the first vertex of the edge. May be Null.
") Vertex1;
		const TopoDS_Vertex Vertex1();

		/****** BRepBuilderAPI_MakeEdge::Vertex2 ******/
		/****** md5 signature: ce52ea817fb1fca460491831377f3811 ******/
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the second vertex of the edge. May be Null. //! Warning The returned vertex in each function corresponds respectively to - the lowest, or - the highest parameter on the curve along which the edge is built. It does not correspond to the first or second vertex given at the time of the construction, if the edge is oriented reversed. Exceptions StdFail_NotDone if the edge is not built.
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
		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: bfcf05f03d1155d3e3138fd904ebec30 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 005fbf9b30edf45cd1d556cd57449b52 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: f90665f57f4d23d3332cedf8ded3559b ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 517f958b659e1ac3a0ae753bf31ac3db ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 645572569e68cc969305ed87c8785980 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 9e194e6799c2033512dfc9a79fac26a8 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 9b27412010f85348ad711cccbd4623c7 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 18039721aab72cd4872f8a52d0333539 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ2d
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 3f6e055266559e7e5feb71876b03cebb ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 90e59e52a38ceac1b93d35076ac4b470 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: dec7d4c0169150a2e86b3ee1b6fd23d0 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: ac65cdde53679ed90ba1f3521c9a3285 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips2d
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 1c65a339c0b972e42e9c595f9c5b6f4d ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 0fae436d0a0a9fe9d4eeb533df3f44eb ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 2811ce4e0a900a196d2b1018f783f418 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 646a459c3c2f033deab8f144a96e5357 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr2d
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 6c97acd26146d4579544d00e0b8754b4 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: e685718a19517adce0bcf4152dbab516 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 3be5ea6bf0eccd78bd66cc84a44a1315 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: ab84070f23b486412154603704adccd1 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab2d
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: e0927bb381df58d6b09770a3a3a2eb6b ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 92f0a714ee22f0a05ae1cc70b4cc3960 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 4f70f767c647552694ba5cb2a0398a22 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 347d8e971dc03f71d278f01c11915918 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 523fe18ae6edb34b5d4509345437720d ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 02288724f7a44b2381d52b1c08ffb0db ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 26d33d19f47440e8800d85f2d5408a0e ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::BRepBuilderAPI_MakeEdge2d ******/
		/****** md5 signature: 56473d16c2838587271d3f4ea5327365 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::Edge ******/
		/****** md5 signature: 768a18012e715670ae29301e23e2cf8b ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepBuilderAPI_MakeEdge2d::Error ******/
		/****** md5 signature: eed0e2d16bc922bda6437a7e6e62f61b ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepBuilderAPI_EdgeError

Description
-----------
Returns the error description when NotDone.
") Error;
		BRepBuilderAPI_EdgeError Error();

		/****** BRepBuilderAPI_MakeEdge2d::Init ******/
		/****** md5 signature: 9265e5f0d4ffc1952c67390e1e4fa21c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C);

		/****** BRepBuilderAPI_MakeEdge2d::Init ******/
		/****** md5 signature: 0961809b47e34c89a735be9bbe4cd201 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::Init ******/
		/****** md5 signature: 3aebe7beccd2278aab8e691a1202290a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepBuilderAPI_MakeEdge2d::Init ******/
		/****** md5 signature: 9ea2122c0b47e1c54f550895e77a510a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakeEdge2d::Init ******/
		/****** md5 signature: 909c5b62ad2dddf89a9e7ed6c45abf2e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::Init ******/
		/****** md5 signature: c6a6dc0247fd8deba360e5bd07dc5e73 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: float
p2: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****** BRepBuilderAPI_MakeEdge2d::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		virtual Standard_Boolean IsDone();

		/****** BRepBuilderAPI_MakeEdge2d::Vertex1 ******/
		/****** md5 signature: 3013872331c1fad0ef9330909eb27447 ******/
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the first vertex of the edge. May be Null.
") Vertex1;
		const TopoDS_Vertex Vertex1();

		/****** BRepBuilderAPI_MakeEdge2d::Vertex2 ******/
		/****** md5 signature: ce52ea817fb1fca460491831377f3811 ******/
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the second vertex of the edge. May be Null.
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
		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 541fc4c7355d3a6bfcb60a10e43cf520 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Not done.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace();

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: ac0ecdd4e8a721d62679f96f7f91809d ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Load a face. useful to add wires.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Face & F);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 09cbbdd333649801fb329dbe37136e63 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
None

Description
-----------
Make a face from a plane.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 32764c05c024544669d521c68d438194 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder

Return
-------
None

Description
-----------
Make a face from a cylinder.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: a8014928898748a8afd97b723642bfde ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone

Return
-------
None

Description
-----------
Make a face from a cone.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 601ec600164793fe1616d7fb2ccbac9c ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere

Return
-------
None

Description
-----------
Make a face from a sphere.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: b49168111fb28a9fbfcf81267cbe8113 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Torus

Return
-------
None

Description
-----------
Make a face from a torus.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 19698edbc93d15eb12e95d38e52b3f6c ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
TolDegen: float

Return
-------
None

Description
-----------
Make a face from a Surface. Accepts tolerance value (TolDegen) for resolution of degenerated edges.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real TolDegen);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 7d4d076aa11a1d86947f3f83700ec90a ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
Make a face from a plane.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 86ebae58c5c914174876b10e55d9ff25 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
Make a face from a cylinder.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 267ce5594216afaf1147e246c8b90396 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
Make a face from a cone.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 730d0df0fe03cbb16abd38a38bf6a663 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
Make a face from a sphere.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 70893c6c780557b1c1313442260a61b5 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Torus
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
Make a face from a torus.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: e23dfaea01284f0f537f62f6d18ac86e ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
TolDegen: float

Return
-------
None

Description
-----------
Make a face from a Surface. Accepts tolerance value (TolDegen) for resolution of degenerated edges.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 445f7f291f4fd9242a0baacb4a8f70b7 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
OnlyPlane: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Find a surface from the wire and make a face. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Wire & W, const Standard_Boolean OnlyPlane = Standard_False);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: c51c2e33e6a98cb7fbfd33a45d8d698e ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
W: TopoDS_Wire
Inside: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make a face from a plane and a wire.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 0472770e0d262b823eb560efae3e6e5c ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
W: TopoDS_Wire
Inside: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make a face from a cylinder and a wire.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 462af6579232e59b54ec8e3d75b73582 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
W: TopoDS_Wire
Inside: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make a face from a cone and a wire.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 99a77f7d6e2680966ddcd548f37f569b ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
W: TopoDS_Wire
Inside: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make a face from a sphere and a wire.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 63a33d76e4d34c48ee138e308eb1db38 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Torus
W: TopoDS_Wire
Inside: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make a face from a torus and a wire.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: a23085932fa89afc65030dc882efe010 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
W: TopoDS_Wire
Inside: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make a face from a Surface and a wire. If the surface S is not plane, it must contain pcurves for all edges in W, otherwise the wrong shape will be created.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****** BRepBuilderAPI_MakeFace::BRepBuilderAPI_MakeFace ******/
		/****** md5 signature: 7f01fc7c4e918e13e23cec82d2e59e87 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire

Return
-------
None

Description
-----------
Adds the wire <W> in the face <F> A general method to create a face is to give - a surface S as the support (the geometric domain) of the face, - and a wire W to bound it. The bounds of the face can also be defined by four parameter values umin, umax, vmin, vmax which determine isoparametric limitations on the parametric space of the surface. In this way, a patch is defined. The parameter values are optional. If they are omitted, the natural bounds of the surface are used. A wire is automatically built using the defined bounds. Up to four edges and four vertices are created with this wire (no edge is created when the corresponding parameter value is infinite). Wires can then be added using the function Add to define other restrictions on the face. These restrictions represent holes. More than one wire may be added by this way, provided that the wires do not cross each other and that they define only one area on the surface. (Be careful, however, as this is not checked). Forbidden addition of wires Note that in this schema, the third case is valid if edges of the wire W are declared internal to the face. As a result, these edges are no longer bounds of the face. A default tolerance (Precision::Confusion()) is given to the face, this tolerance may be increased during construction of the face using various algorithms. Rules applied to the arguments For the surface: - The surface must not be a 'null handle'. - If the surface is a trimmed surface, the basis surface is used. - For the wire: the wire is composed of connected edges, each edge having a parametric curve description in the parametric domain of the surface; in other words, as a pcurve. For the parameters: - The parameter values must be in the parametric range of the surface (or the basis surface, if the surface is trimmed). If this condition is not satisfied, the face is not built, and the Error function will return BRepBuilderAPI_ParametersOutOfRange. - The bounding parameters p1 and p2 are adjusted on a periodic surface in a given parametric direction by adding or subtracting the period to obtain p1 in the parametric range of the surface and such p2, that p2 - p1 <= Period, where Period is the period of the surface in this parametric direction. - A parameter value may be infinite. There will be no edge and no vertex in the corresponding direction.
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Face & F, const TopoDS_Wire & W);

		/****** BRepBuilderAPI_MakeFace::Add ******/
		/****** md5 signature: 3257e47f30128eb5440b1eab5065e724 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Adds the wire W to the constructed face as a hole. Warning W must not cross the other bounds of the face, and all the bounds must define only one area on the surface. (Be careful, however, as this is not checked.) Example // a cylinder gp_Cylinder C = ..; // a wire TopoDS_Wire W = ...; BRepBuilderAPI_MakeFace MF(C); MF.Add(W); TopoDS_Face F = MF;.
") Add;
		void Add(const TopoDS_Wire & W);

		/****** BRepBuilderAPI_MakeFace::Error ******/
		/****** md5 signature: eb6c34bb46d70357b5b10c7d3da472d1 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepBuilderAPI_FaceError

Description
-----------
Returns the construction status BRepBuilderAPI_FaceDone if the face is built, or - another value of the BRepBuilderAPI_FaceError enumeration indicating why the construction failed, in particular when the given parameters are outside the bounds of the surface.
") Error;
		BRepBuilderAPI_FaceError Error();

		/****** BRepBuilderAPI_MakeFace::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the constructed face. Exceptions StdFail_NotDone if no face is built.
") Face;
		const TopoDS_Face Face();

		/****** BRepBuilderAPI_MakeFace::Init ******/
		/****** md5 signature: a8dfaa68079e743e08190fe58d950a9a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Initializes (or reinitializes) the construction of a face by creating a new object which is a copy of the face F, in order to add wires to it, using the function Add. Note: this complete copy of the geometry is only required if you want to work on the geometries of the two faces independently.
") Init;
		void Init(const TopoDS_Face & F);

		/****** BRepBuilderAPI_MakeFace::Init ******/
		/****** md5 signature: 4537ccbc32157e9ea035d63999e8cd22 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Bound: bool
TolDegen: float

Return
-------
None

Description
-----------
Initializes (or reinitializes) the construction of a face on the surface S. If Bound is true, a wire is automatically created from the natural bounds of the surface S and added to the face in order to bound it. If Bound is false, no wire is added. This option is used when real bounds are known. These will be added to the face after this initialization, using the function Add. TolDegen parameter is used for resolution of degenerated edges if calculation of natural bounds is turned on.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Bound, const Standard_Real TolDegen);

		/****** BRepBuilderAPI_MakeFace::Init ******/
		/****** md5 signature: 1577db0535b260fa5404a98f8fa219d8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
TolDegen: float

Return
-------
None

Description
-----------
Initializes (or reinitializes) the construction of a face on the surface S, limited in the u parametric direction by the two parameter values UMin and UMax and in the v parametric direction by the two parameter values VMin and VMax. Warning Error returns: - BRepBuilderAPI_ParametersOutOfRange when the parameters given are outside the bounds of the surface or the basis surface of a trimmed surface. TolDegen parameter is used for resolution of degenerated edges.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****** BRepBuilderAPI_MakeFace::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this algorithm has a valid face.
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
		/****** BRepBuilderAPI_MakePolygon::BRepBuilderAPI_MakePolygon ******/
		/****** md5 signature: 76b9dec7e7af466015f22b4541dcf01f ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes an empty polygonal wire, to which points or vertices are added using the Add function. As soon as the polygonal wire under construction contains vertices, it can be consulted using the Wire function.
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon();

		/****** BRepBuilderAPI_MakePolygon::BRepBuilderAPI_MakePolygon ******/
		/****** md5 signature: 098299ba5eb88578080ae78ecfe81e1f ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepBuilderAPI_MakePolygon::BRepBuilderAPI_MakePolygon ******/
		/****** md5 signature: c6858b7d36146f5d63c0fd944672bfba ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
Close: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const Standard_Boolean Close = Standard_False);

		/****** BRepBuilderAPI_MakePolygon::BRepBuilderAPI_MakePolygon ******/
		/****** md5 signature: ff8e512f1837d0f4a96f00091a06e596 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt
Close: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a polygonal wire from 2, 3 or 4 points. Vertices are automatically created on the given points. The polygonal wire is closed if Close is true; otherwise it is open. Further vertices can be added using the Add function. The polygonal wire under construction can be consulted at any time by using the Wire function. Example //an open polygon from four points TopoDS_Wire W = BRepBuilderAPI_MakePolygon(P1,P2,P3,P4); Warning: The process is equivalent to: - initializing an empty polygonal wire, - and adding the given points in sequence. Consequently, be careful when using this function: if the sequence of points p1 - p2 - p1 is found among the arguments of the constructor, you will create a polygonal wire with two consecutive coincident edges.
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4, const Standard_Boolean Close = Standard_False);

		/****** BRepBuilderAPI_MakePolygon::BRepBuilderAPI_MakePolygon ******/
		/****** md5 signature: db14a595777414d9224a0d464b0087f4 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepBuilderAPI_MakePolygon::BRepBuilderAPI_MakePolygon ******/
		/****** md5 signature: 14bb91facda291b2240bb410e1aa87ac ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex
V3: TopoDS_Vertex
Close: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const Standard_Boolean Close = Standard_False);

		/****** BRepBuilderAPI_MakePolygon::BRepBuilderAPI_MakePolygon ******/
		/****** md5 signature: 09e12386b8a6639bf1930f50b100b12f ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex
V3: TopoDS_Vertex
V4: TopoDS_Vertex
Close: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a polygonal wire from 2, 3 or 4 vertices. The polygonal wire is closed if Close is true; otherwise it is open (default value). Further vertices can be added using the Add function. The polygonal wire under construction can be consulted at any time by using the Wire function. Example //a closed triangle from three vertices TopoDS_Wire W = BRepBuilderAPI_MakePolygon(V1,V2,V3,Standard_True); Warning The process is equivalent to: - initializing an empty polygonal wire, - then adding the given points in sequence. So be careful, as when using this function, you could create a polygonal wire with two consecutive coincident edges if the sequence of vertices v1 - v2 - v1 is found among the constructor's arguments.
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const TopoDS_Vertex & V4, const Standard_Boolean Close = Standard_False);

		/****** BRepBuilderAPI_MakePolygon::Add ******/
		/****** md5 signature: b714bfb888eecda75b87221b873365bd ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const gp_Pnt & P);

		/****** BRepBuilderAPI_MakePolygon::Add ******/
		/****** md5 signature: 50c25a05b9135c3510f0a532439b09c2 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
Adds the point P or the vertex V at the end of the polygonal wire under construction. A vertex is automatically created on the point P. Warning - When P or V is coincident to the previous vertex, no edge is built. The method Added can be used to test for this. Neither P nor V is checked to verify that it is coincident with another vertex than the last one, of the polygonal wire under construction. It is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the Close function). Consequently, be careful using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non manifold polygonal wire. - P or V is not checked to verify if it is coincident with another vertex but the last one, of the polygonal wire under construction. It is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the Close function). Consequently, be careful when using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non-manifold polygonal wire.
") Add;
		void Add(const TopoDS_Vertex & V);

		/****** BRepBuilderAPI_MakePolygon::Added ******/
		/****** md5 signature: ae76eff202ef54dd186494f9fb9a5cb0 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the last vertex added to the constructed polygonal wire is not coincident with the previous one.
") Added;
		Standard_Boolean Added();

		/****** BRepBuilderAPI_MakePolygon::Close ******/
		/****** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
Closes the polygonal wire under construction. Note - this is equivalent to adding the first vertex to the polygonal wire under construction.
") Close;
		void Close();

		/****** BRepBuilderAPI_MakePolygon::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the edge built between the last two points or vertices added to the constructed polygonal wire under construction. Warning If there is only one vertex in the polygonal wire, the result is a null edge.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepBuilderAPI_MakePolygon::FirstVertex ******/
		/****** md5 signature: 4e5c0d56a66d88d33c820ea69fb94d01 ******/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") FirstVertex;
		const TopoDS_Vertex FirstVertex();

		/****** BRepBuilderAPI_MakePolygon::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this algorithm contains a valid polygonal wire (i.e. if there is at least one edge). IsDone returns false if fewer than two vertices have been chained together by this construction algorithm.
") IsDone;
		virtual Standard_Boolean IsDone();

		/****** BRepBuilderAPI_MakePolygon::LastVertex ******/
		/****** md5 signature: 00579001fbfcdaa6b9840a736dc9243f ******/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the first or the last vertex of the polygonal wire under construction. If the constructed polygonal wire is closed, the first and the last vertices are identical.
") LastVertex;
		const TopoDS_Vertex LastVertex();

		/****** BRepBuilderAPI_MakePolygon::Wire ******/
		/****** md5 signature: 1a80266ab027407949727610f03160e2 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the constructed polygonal wire, or the already built part of the polygonal wire under construction. Exceptions StdFail_NotDone if the wire is not built, i.e. if fewer than two vertices have been chained together by this construction algorithm.
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepBuilderAPI_MakePolygon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepBuilderAPI_MakeShapeOnMesh *
***************************************/
class BRepBuilderAPI_MakeShapeOnMesh : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepBuilderAPI_MakeShapeOnMesh::BRepBuilderAPI_MakeShapeOnMesh ******/
		/****** md5 signature: d9775140ece54795f4552a05eb93688b ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShapeOnMesh;
		%feature("autodoc", "
Parameters
----------
theMesh: Poly_Triangulation

Return
-------
None

Description
-----------
Ctor. Sets mesh to process. 
Input parameter: theMesh - Mesh to construct shape for.
") BRepBuilderAPI_MakeShapeOnMesh;
		 BRepBuilderAPI_MakeShapeOnMesh(const opencascade::handle<Poly_Triangulation> & theMesh);

		/****** BRepBuilderAPI_MakeShapeOnMesh::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds shape on mesh.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BRepBuilderAPI_MakeShapeOnMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_MakeShell *
*********************************/
class BRepBuilderAPI_MakeShell : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepBuilderAPI_MakeShell::BRepBuilderAPI_MakeShell ******/
		/****** md5 signature: f66e5150c2a308218c8635771a238ba1 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty shell framework. The Init function is used to define the construction arguments. Warning The function Error will return BRepBuilderAPI_EmptyShell if it is called before the function Init.
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell();

		/****** BRepBuilderAPI_MakeShell::BRepBuilderAPI_MakeShell ******/
		/****** md5 signature: 87884626f1f7fdf07d62fe74f501184a ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Segment: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a shell from the surface S.
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Segment = Standard_False);

		/****** BRepBuilderAPI_MakeShell::BRepBuilderAPI_MakeShell ******/
		/****** md5 signature: 62bc5e6495312d5200397401e6149645 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
Segment: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a shell from the surface S, limited in the u parametric direction by the two parameter values UMin and UMax, and limited in the v parametric direction by the two parameter values VMin and VMax.
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****** BRepBuilderAPI_MakeShell::Error ******/
		/****** md5 signature: 0aa62273be80712ad65930b43e4dfd23 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepBuilderAPI_ShellError

Description
-----------
Returns the construction status: - BRepBuilderAPI_ShellDone if the shell is built, or - another value of the BRepBuilderAPI_ShellError enumeration indicating why the construction failed. This is frequently BRepBuilderAPI_ShellParametersOutOfRange indicating that the given parameters are outside the bounds of the surface.
") Error;
		BRepBuilderAPI_ShellError Error();

		/****** BRepBuilderAPI_MakeShell::Init ******/
		/****** md5 signature: ee785ff5defa7d18e86d0ad913d864fa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float
Segment: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines or redefines the arguments for the construction of a shell. The construction is initialized with the surface S, limited in the u parametric direction by the two parameter values UMin and UMax, and in the v parametric direction by the two parameter values VMin and VMax. Warning The function Error returns: - BRepBuilderAPI_ShellParametersOutOfRange when the given parameters are outside the bounds of the surface or the basis surface if S is trimmed.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****** BRepBuilderAPI_MakeShell::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the shell is built.
") IsDone;
		virtual Standard_Boolean IsDone();

		/****** BRepBuilderAPI_MakeShell::Shell ******/
		/****** md5 signature: c581862d26a0a34b15cf9dd6d442e65d ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the new Shell.
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
		/****** BRepBuilderAPI_MakeSolid::BRepBuilderAPI_MakeSolid ******/
		/****** md5 signature: a5b7a0bcf7177389d2c0fbff22c20022 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the construction of a solid. An empty solid is considered to cover the whole space. The Add function is used to define shells to bound it.
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid();

		/****** BRepBuilderAPI_MakeSolid::BRepBuilderAPI_MakeSolid ******/
		/****** md5 signature: d3b423f1106df0dc0090ff23b3ee24ef ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_CompSolid

Return
-------
None

Description
-----------
Make a solid from a CompSolid.
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_CompSolid & S);

		/****** BRepBuilderAPI_MakeSolid::BRepBuilderAPI_MakeSolid ******/
		/****** md5 signature: b45624aedbdaace00f5a4fd4cf1bc27e ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
Make a solid from a shell.
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S);

		/****** BRepBuilderAPI_MakeSolid::BRepBuilderAPI_MakeSolid ******/
		/****** md5 signature: 0f9a5bc9bb6cb89c67cea5b1bc4d5b2a ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shell
S2: TopoDS_Shell

Return
-------
None

Description
-----------
Make a solid from two shells.
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2);

		/****** BRepBuilderAPI_MakeSolid::BRepBuilderAPI_MakeSolid ******/
		/****** md5 signature: d3948f38236bf5b8c03aeea98dbc39e8 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shell
S2: TopoDS_Shell
S3: TopoDS_Shell

Return
-------
None

Description
-----------
Make a solid from three shells. Constructs a solid - covering the whole space, or - from shell S, or - from two shells S1 and S2, or - from three shells S1, S2 and S3, or Warning No check is done to verify the conditions of coherence of the resulting solid. In particular, S1, S2 (and S3) must not intersect each other. Besides, after all shells have been added using the Add function, one of these shells should constitute the outside skin of the solid; it may be closed (a finite solid) or open (an infinite solid). Other shells form hollows (cavities) in these previous ones. Each must bound a closed volume.
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2, const TopoDS_Shell & S3);

		/****** BRepBuilderAPI_MakeSolid::BRepBuilderAPI_MakeSolid ******/
		/****** md5 signature: d269b933200bdc54c7639ac73cae0e58 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "
Parameters
----------
So: TopoDS_Solid

Return
-------
None

Description
-----------
Make a solid from a solid. useful for adding later.
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Solid & So);

		/****** BRepBuilderAPI_MakeSolid::BRepBuilderAPI_MakeSolid ******/
		/****** md5 signature: d8eb662f7f3e18001233ce551b0f73d9 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "
Parameters
----------
So: TopoDS_Solid
S: TopoDS_Shell

Return
-------
None

Description
-----------
Add a shell to a solid. //! Constructs a solid: - from the solid So, to which shells can be added, or - by adding the shell S to the solid So. Warning No check is done to verify the conditions of coherence of the resulting solid. In particular S must not intersect the solid S0. Besides, after all shells have been added using the Add function, one of these shells should constitute the outside skin of the solid. It may be closed (a finite solid) or open (an infinite solid). Other shells form hollows (cavities) in the previous ones. Each must bound a closed volume.
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Solid & So, const TopoDS_Shell & S);

		/****** BRepBuilderAPI_MakeSolid::Add ******/
		/****** md5 signature: 755d393a8f453c7309ea9f34b76a9857 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
Adds the shell to the current solid. Warning No check is done to verify the conditions of coherence of the resulting solid. In particular, S must not intersect other shells of the solid under construction. Besides, after all shells have been added, one of these shells should constitute the outside skin of the solid. It may be closed (a finite solid) or open (an infinite solid). Other shells form hollows (cavities) in these previous ones. Each must bound a closed volume.
") Add;
		void Add(const TopoDS_Shell & S);

		/****** BRepBuilderAPI_MakeSolid::IsDeleted ******/
		/****** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_MakeSolid::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the solid is built. For this class, a solid under construction is always valid. If no shell has been added, it could be a whole-space solid. However, no check was done to verify the conditions of coherence of the resulting solid.
") IsDone;
		virtual Standard_Boolean IsDone();

		/****** BRepBuilderAPI_MakeSolid::Solid ******/
		/****** md5 signature: 2538cb0f3104aa1b86470e63b7cc116d ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
Returns the new Solid.
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
		/****** BRepBuilderAPI_MakeVertex::BRepBuilderAPI_MakeVertex ******/
		/****** md5 signature: 76b4a67f4a0d412d52fe80f15569e02f ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeVertex;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Constructs a vertex from point P. Example create a vertex from a 3D point. gp_Pnt P(0,0,10); TopoDS_Vertex V = BRepBuilderAPI_MakeVertex(P);.
") BRepBuilderAPI_MakeVertex;
		 BRepBuilderAPI_MakeVertex(const gp_Pnt & P);

		/****** BRepBuilderAPI_MakeVertex::Vertex ******/
		/****** md5 signature: c8025d701d2a4994ffc4b119d7279582 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the constructed vertex.
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
		/****** BRepBuilderAPI_MakeWire::BRepBuilderAPI_MakeWire ******/
		/****** md5 signature: a01271fd9c59f1930aae350997331097 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty wire framework, to which edges are added using the Add function. As soon as the wire contains one edge, it can return with the use of the function Wire. Warning The function Error will return BRepBuilderAPI_EmptyWire if it is called before at least one edge is added to the wire under construction.
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire();

		/****** BRepBuilderAPI_MakeWire::BRepBuilderAPI_MakeWire ******/
		/****** md5 signature: 35268938f48dfb41e577c864ce8837b0 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Make a Wire from an edge.
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E);

		/****** BRepBuilderAPI_MakeWire::BRepBuilderAPI_MakeWire ******/
		/****** md5 signature: 6fbd8669e7f97e678d8f6fe0553aab2c ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Return
-------
None

Description
-----------
Make a Wire from two edges.
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** BRepBuilderAPI_MakeWire::BRepBuilderAPI_MakeWire ******/
		/****** md5 signature: 6b399cddd86d79169964ba26015dd934 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
E3: TopoDS_Edge

Return
-------
None

Description
-----------
Make a Wire from three edges.
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3);

		/****** BRepBuilderAPI_MakeWire::BRepBuilderAPI_MakeWire ******/
		/****** md5 signature: c0179625e4bc4e90d4f0be5171bf6b0e ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
E3: TopoDS_Edge
E4: TopoDS_Edge

Return
-------
None

Description
-----------
Make a Wire from four edges. Constructs a wire - from the TopoDS_Wire W composed of the edge E, or - from edge E, or - from two edges E1 and E2, or - from three edges E1, E2 and E3, or - from four edges E1, E2, E3 and E4. Further edges can be added using the function Add. Given edges are added in a sequence. Each of them must be connectable to the wire under construction, and so must satisfy the following condition (unless it is the first edge of the wire): one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). It could also be the same vertex. Warning If an edge is not connectable to the wire under construction it is not added. The function Error will return BRepBuilderAPI_DisconnectedWire, the function IsDone will return false and the function Wire will raise an error, until a new connectable edge is added.
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3, const TopoDS_Edge & E4);

		/****** BRepBuilderAPI_MakeWire::BRepBuilderAPI_MakeWire ******/
		/****** md5 signature: 307db2e099310281146759f5119b202b ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Make a Wire from a Wire. useful for adding later.
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Wire & W);

		/****** BRepBuilderAPI_MakeWire::BRepBuilderAPI_MakeWire ******/
		/****** md5 signature: 01bfeedca98a0748591c3cfaec81cb52 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
E: TopoDS_Edge

Return
-------
None

Description
-----------
Add an edge to a wire.
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Wire & W, const TopoDS_Edge & E);

		/****** BRepBuilderAPI_MakeWire::Add ******/
		/****** md5 signature: 2689ece383041802da1cd80a0167e44a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds the edge E to the wire under construction. E must be connectable to the wire under construction, and, unless it is the first edge of the wire, must satisfy the following condition: one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). It could also be the same vertex. Warning If E is not connectable to the wire under construction it is not added. The function Error will return BRepBuilderAPI_DisconnectedWire, the function IsDone will return false and the function Wire will raise an error, until a new connectable edge is added.
") Add;
		void Add(const TopoDS_Edge & E);

		/****** BRepBuilderAPI_MakeWire::Add ******/
		/****** md5 signature: 3257e47f30128eb5440b1eab5065e724 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Add the edges of <W> to the current wire.
") Add;
		void Add(const TopoDS_Wire & W);

		/****** BRepBuilderAPI_MakeWire::Add ******/
		/****** md5 signature: acaf1f40b8e0173007b2aad5fa46572c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
Adds the edges of <L> to the current wire. The edges are not to be consecutive. But they are to be all connected geometrically or topologically. If some of them are not connected the Status give DisconnectedWire but the 'Maker' is Done() and you can get the partial result. (ie connected to the first edgeof the list <L>).
") Add;
		void Add(const TopTools_ListOfShape & L);

		/****** BRepBuilderAPI_MakeWire::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the last edge added to the wire under construction. Warning - This edge can be different from the original one (the argument of the function Add, for instance,) - A null edge is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectable..
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepBuilderAPI_MakeWire::Error ******/
		/****** md5 signature: c54fcbd964e19f731ce241d941c68253 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepBuilderAPI_WireError

Description
-----------
Returns the construction status - BRepBuilderAPI_WireDone if the wire is built, or - another value of the BRepBuilderAPI_WireError enumeration indicating why the construction failed.
") Error;
		BRepBuilderAPI_WireError Error();

		/****** BRepBuilderAPI_MakeWire::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this algorithm contains a valid wire. IsDone returns false if: - there are no edges in the wire, or - the last edge which you tried to add was not connectable.
") IsDone;
		virtual Standard_Boolean IsDone();

		/****** BRepBuilderAPI_MakeWire::Vertex ******/
		/****** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the last vertex of the last edge added to the wire under construction. Warning A null vertex is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectableR.
") Vertex;
		const TopoDS_Vertex Vertex();

		/****** BRepBuilderAPI_MakeWire::Wire ******/
		/****** md5 signature: 1a80266ab027407949727610f03160e2 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the constructed wire; or the part of the wire under construction already built. Exceptions StdFail_NotDone if a wire is not built.
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
		/****** BRepBuilderAPI_ModifyShape::Modified ******/
		/****** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_ModifyShape::ModifiedShape ******/
		/****** md5 signature: 2b7ee5e0dcc7da5f7f19b64339c05803 ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape corresponding to <S>. S can correspond to the entire initial shape or to its subshape. Exceptions Standard_NoSuchObject if S is not the initial shape or a subshape of the initial shape to which the transformation has been applied. Raises NoSuchObject from Standard if S is not the initial shape or a sub-shape of the initial shape.
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
		/****** BRepBuilderAPI_Copy::BRepBuilderAPI_Copy ******/
		/****** md5 signature: f814be791462311b9bd70700b07a803c ******/
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty copy framework. Use the function Perform to copy shapes.
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy();

		/****** BRepBuilderAPI_Copy::BRepBuilderAPI_Copy ******/
		/****** md5 signature: 3cb4979fa2e75d4803c748d02780b980 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
copyGeom: bool (optional, default to Standard_True)
copyMesh: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a copy framework and copies the shape S. Use the function Shape to access the result. If copyMesh is True, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). If copyGeom is False, only topological objects will be copied, while geometry and triangulation will be shared with original shape. Note: the constructed framework can be reused to copy other shapes: just specify them with the function Perform.
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy(const TopoDS_Shape & S, const Standard_Boolean copyGeom = Standard_True, const Standard_Boolean copyMesh = Standard_False);

		/****** BRepBuilderAPI_Copy::Perform ******/
		/****** md5 signature: fd7a196bf04e4d1c7c8c422daf764262 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
copyGeom: bool (optional, default to Standard_True)
copyMesh: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Copies the shape S. Use the function Shape to access the result. If copyMesh is True, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). If copyGeom is False, only topological objects will be copied, while geometry and triangulation will be shared with original shape.
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
		/****** BRepBuilderAPI_GTransform::BRepBuilderAPI_GTransform ******/
		/****** md5 signature: e9a10c3514cc17ff8ed09aec00d8cb93 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "
Parameters
----------
T: gp_GTrsf

Return
-------
None

Description
-----------
Constructs a framework for applying the geometric transformation T to a shape. Use the function Perform to define the shape to transform.
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform(const gp_GTrsf & T);

		/****** BRepBuilderAPI_GTransform::BRepBuilderAPI_GTransform ******/
		/****** md5 signature: 802e107723be9776d843f3a4e2d6fab3 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: gp_GTrsf
Copy: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a framework for applying the geometric transformation T to a shape, and applies it to the shape S. - If the transformation T is direct and isometric (i.e. if the determinant of the vectorial part of T is equal to 1.), and if Copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - In all other cases, the transformation is applied to a duplicate of S. Use the function Shape to access the result. Note: the constructed framework can be reused to apply the same geometric transformation to other shapes: just specify them with the function Perform.
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform(const TopoDS_Shape & S, const gp_GTrsf & T, const Standard_Boolean Copy = Standard_False);

		/****** BRepBuilderAPI_GTransform::Modified ******/
		/****** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_GTransform::ModifiedShape ******/
		/****** md5 signature: 52b70a5b01905688e2ddbc00ab060e3c ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape corresponding to <S>.
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_GTransform::Perform ******/
		/****** md5 signature: 18b546559b34b40c9a50445613009c29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Copy: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Applies the geometric transformation defined at the time of construction of this framework to the shape S. - If the transformation T is direct and isometric (i.e. if the determinant of the vectorial part of T is equal to 1.), and if Copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - In all other cases, the transformation is applied to a duplicate of S. Use the function Shape to access the result. Note: this framework can be reused to apply the same geometric transformation to other shapes: just specify them by calling the function Perform again.
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
		/****** BRepBuilderAPI_NurbsConvert::BRepBuilderAPI_NurbsConvert ******/
		/****** md5 signature: cb8a8d7eea9b92ec4e01dce2e0e52c7d ******/
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a framework for converting the geometry of a shape into NURBS geometry. Use the function Perform to define the shape to convert.
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert();

		/****** BRepBuilderAPI_NurbsConvert::BRepBuilderAPI_NurbsConvert ******/
		/****** md5 signature: 97b829c018fc2c7268806ac155e1b4cf ******/
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Copy: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds a new shape by converting the geometry of the shape S into NURBS geometry. Specifically, all curves supporting edges of S are converted into BSpline curves, and all surfaces supporting its faces are converted into BSpline surfaces. Use the function Shape to access the new shape. Note: the constructed framework can be reused to convert other shapes. You specify these with the function Perform.
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

		/****** BRepBuilderAPI_NurbsConvert::Modified ******/
		/****** md5 signature: a806cf91fce8bea1007aadababd10388 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_NurbsConvert::ModifiedShape ******/
		/****** md5 signature: 2b7ee5e0dcc7da5f7f19b64339c05803 ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape corresponding to <S>. S can correspond to the entire initial shape or to its subshape. Exceptions Standard_NoSuchObject if S is not the initial shape or a subshape of the initial shape to which the transformation has been applied.
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_NurbsConvert::Perform ******/
		/****** md5 signature: 18b546559b34b40c9a50445613009c29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Copy: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds a new shape by converting the geometry of the shape S into NURBS geometry. Specifically, all curves supporting edges of S are converted into BSpline curves, and all surfaces supporting its faces are converted into BSpline surfaces. Use the function Shape to access the new shape. Note: this framework can be reused to convert other shapes: you specify them by calling the function Perform again.
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
		/****** BRepBuilderAPI_Transform::BRepBuilderAPI_Transform ******/
		/****** md5 signature: cbdf3e6dd6a17d83bfe43442a75e4924 ******/
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Constructs a framework for applying the geometric transformation T to a shape. Use the function Perform to define the shape to transform.
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform(const gp_Trsf & T);

		/****** BRepBuilderAPI_Transform::BRepBuilderAPI_Transform ******/
		/****** md5 signature: 0ab1a7312e9d2fe5b40a55da4604dabf ******/
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTrsf: gp_Trsf
theCopyGeom: bool (optional, default to Standard_False)
theCopyMesh: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a transformation from the gp_Trsf <theTrsf>, and applies it to the shape <theShape>. If the transformation is direct and isometric (determinant = 1) and <theCopyGeom> = Standard_False, the resulting shape is <theShape> on which a new location has been set. Otherwise, the transformation is applied on a duplication of <theShape>. If <theCopyMesh> is true, the triangulation will be copied, and the copy will be assigned to the result shape.
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform(const TopoDS_Shape & theShape, const gp_Trsf & theTrsf, const Standard_Boolean theCopyGeom = Standard_False, const Standard_Boolean theCopyMesh = Standard_False);

		/****** BRepBuilderAPI_Transform::Modified ******/
		/****** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_Transform::ModifiedShape ******/
		/****** md5 signature: 52b70a5b01905688e2ddbc00ab060e3c ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape corresponding to <S>.
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****** BRepBuilderAPI_Transform::Perform ******/
		/****** md5 signature: 373b1849db31ffa26c084b85e421ba70 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theCopyGeom: bool (optional, default to Standard_False)
theCopyMesh: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Applies the geometric transformation defined at the time of construction of this framework to the shape S. - If the transformation T is direct and isometric, in other words, if the determinant of the vectorial part of T is equal to 1., and if theCopyGeom equals false (the default value), the resulting shape is the same as the original but with a new location assigned to it. - In all other cases, the transformation is applied to a duplicate of theShape. - If theCopyMesh is true, the triangulation will be copied, and the copy will be assigned to the result shape. Use the function Shape to access the result. Note: this framework can be reused to apply the same geometric transformation to other shapes. You only need to specify them by calling the function Perform again.
") Perform;
		void Perform(const TopoDS_Shape & theShape, const Standard_Boolean theCopyGeom = Standard_False, const Standard_Boolean theCopyMesh = Standard_False);

};


%extend BRepBuilderAPI_Transform {
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
/* deprecated methods */
%pythoncode {
@deprecated
def brepbuilderapi_Plane(*args):
	return brepbuilderapi.Plane(*args)

@deprecated
def brepbuilderapi_Plane(*args):
	return brepbuilderapi.Plane(*args)

@deprecated
def brepbuilderapi_Precision(*args):
	return brepbuilderapi.Precision(*args)

@deprecated
def brepbuilderapi_Precision(*args):
	return brepbuilderapi.Precision(*args)

}
