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
%define BREPMESHDOCSTRING
"BRepMesh module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_brepmesh.html"
%enddef
%module (package="OCC.Core", docstring=BREPMESHDOCSTRING) BRepMesh


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
#include<BRepMesh_Delaun.hxx>
#include<BRepMesh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IMeshTools_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Poly_module.hxx>
#include<Bnd_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<TShort_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IMeshTools.i
%import Message.i
%import gp.i
%import TopAbs.i
%import BRepAdaptor.i
%import TopoDS.i
%import GeomAbs.i
%import TCollection.i
%import TColStd.i
%import Poly.i
%import Bnd.i
%import TopLoc.i
%import TColgp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepMesh_DegreeOfFreedom {
	BRepMesh_Free = 0,
	BRepMesh_InVolume = 1,
	BRepMesh_OnSurface = 2,
	BRepMesh_OnCurve = 3,
	BRepMesh_Fixed = 4,
	BRepMesh_Frontier = 5,
	BRepMesh_Deleted = 6,
};

enum BRepMesh_FactoryError {
	BRepMesh_FE_NOERROR = 0,
	BRepMesh_FE_LIBRARYNOTFOUND = 1,
	BRepMesh_FE_FUNCTIONNOTFOUND = 2,
	BRepMesh_FE_CANNOTCREATEALGO = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BRepMesh_DegreeOfFreedom(IntEnum):
	BRepMesh_Free = 0
	BRepMesh_InVolume = 1
	BRepMesh_OnSurface = 2
	BRepMesh_OnCurve = 3
	BRepMesh_Fixed = 4
	BRepMesh_Frontier = 5
	BRepMesh_Deleted = 6
BRepMesh_Free = BRepMesh_DegreeOfFreedom.BRepMesh_Free
BRepMesh_InVolume = BRepMesh_DegreeOfFreedom.BRepMesh_InVolume
BRepMesh_OnSurface = BRepMesh_DegreeOfFreedom.BRepMesh_OnSurface
BRepMesh_OnCurve = BRepMesh_DegreeOfFreedom.BRepMesh_OnCurve
BRepMesh_Fixed = BRepMesh_DegreeOfFreedom.BRepMesh_Fixed
BRepMesh_Frontier = BRepMesh_DegreeOfFreedom.BRepMesh_Frontier
BRepMesh_Deleted = BRepMesh_DegreeOfFreedom.BRepMesh_Deleted

class BRepMesh_FactoryError(IntEnum):
	BRepMesh_FE_NOERROR = 0
	BRepMesh_FE_LIBRARYNOTFOUND = 1
	BRepMesh_FE_FUNCTIONNOTFOUND = 2
	BRepMesh_FE_CANNOTCREATEALGO = 3
BRepMesh_FE_NOERROR = BRepMesh_FactoryError.BRepMesh_FE_NOERROR
BRepMesh_FE_LIBRARYNOTFOUND = BRepMesh_FactoryError.BRepMesh_FE_LIBRARYNOTFOUND
BRepMesh_FE_FUNCTIONNOTFOUND = BRepMesh_FactoryError.BRepMesh_FE_FUNCTIONNOTFOUND
BRepMesh_FE_CANNOTCREATEALGO = BRepMesh_FactoryError.BRepMesh_FE_CANNOTCREATEALGO
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepMesh_Classifier)
%wrap_handle(BRepMesh_DataStructureOfDelaun)
%wrap_handle(BRepMesh_Deflection)
%wrap_handle(BRepMesh_DiscretRoot)
%wrap_handle(BRepMesh_FaceChecker)
%wrap_handle(BRepMesh_MeshTool)
%wrap_handle(BRepMesh_SelectorOfDataStructureOfDelaun)
%wrap_handle(BRepMesh_ShapeTool)
%wrap_handle(BRepMesh_VertexTool)
%wrap_handle(BRepMesh_IncrementalMesh)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Standard_Integer ( * BRepMesh_PluginEntryType ) ( const TopoDS_Shape & theShape, const Standard_Real theLinDeflection, const Standard_Real theAngDeflection, BRepMesh_DiscretRoot * & theMeshAlgoInstance );
typedef IMeshTools_Parameters Parameters;
/* end typedefs declaration */

/*********
* class  *
*********/
/******************************
* class BRepMesh_BaseMeshAlgo *
******************************/
%nodefaultctor BRepMesh_BaseMeshAlgo;
class BRepMesh_BaseMeshAlgo : public IMeshTools_MeshAlgo {
	public:
typedef NCollection_Shared <NCollection_Vector <gp_Pnt>> VectorOfPnt;
		/****************** Perform ******************/
		/**** md5 signature: d685bfcd2d4c1ddec38b4671470322e6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs processing of the given face.

Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") Perform;
		virtual void Perform(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BRepMesh_BaseMeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepMesh_Circle *
************************/
class BRepMesh_Circle {
	public:
		/****************** BRepMesh_Circle ******************/
		/**** md5 signature: ed8ebf8a99cfa7f69dda333ca0ddde38 ****/
		%feature("compactdefaultargs") BRepMesh_Circle;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BRepMesh_Circle;
		 BRepMesh_Circle();

		/****************** BRepMesh_Circle ******************/
		/**** md5 signature: bc9e30cbf8bd58cbdca4f332242514be ****/
		%feature("compactdefaultargs") BRepMesh_Circle;
		%feature("autodoc", "Constructor. @param thelocation location of a circle. @param theradius radius of a circle.

Parameters
----------
theLocation: gp_XY
theRadius: float

Returns
-------
None
") BRepMesh_Circle;
		 BRepMesh_Circle(const gp_XY & theLocation, const Standard_Real theRadius);

		/****************** Location ******************/
		/**** md5 signature: 2ecc9f07f1d8eda4bb4073a2c1f35c81 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns location of a circle.

Returns
-------
gp_XY
") Location;
		const gp_XY Location();

		/****************** Radius ******************/
		/**** md5 signature: a23a06a93bcd6b6bd7a4525b4ccf66ac ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns radius of a circle.

Returns
-------
float
") Radius;
		const Standard_Real & Radius();

		/****************** SetLocation ******************/
		/**** md5 signature: 9327d7a19f0eeac7a91ff9bb889d6b3f ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Sets location of a circle. @param thelocation location of a circle.

Parameters
----------
theLocation: gp_XY

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_XY & theLocation);

		/****************** SetRadius ******************/
		/**** md5 signature: ec1ecbc6b8d5250d29d2812fb870ef3b ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Sets radius of a circle. @param theradius radius of a circle.

Parameters
----------
theRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real theRadius);

};


%extend BRepMesh_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepMesh_CircleInspector *
*********************************/
class BRepMesh_CircleInspector : public NCollection_CellFilter_InspectorXY {
	public:
typedef Standard_Integer Target;
		/****************** BRepMesh_CircleInspector ******************/
		/**** md5 signature: 563c55cd8a07b4e78bfb1d00b84f7844 ****/
		%feature("compactdefaultargs") BRepMesh_CircleInspector;
		%feature("autodoc", "Constructor. @param thetolerance tolerance to be used for identification of shot circles. @param thereservedsize size to be reserved for vector of circles. @param theallocator memory allocator to be used by internal collections.

Parameters
----------
theTolerance: float
theReservedSize: int
theAllocator: NCollection_IncAllocator

Returns
-------
None
") BRepMesh_CircleInspector;
		 BRepMesh_CircleInspector(const Standard_Real theTolerance, const Standard_Integer theReservedSize, const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****************** Bind ******************/
		/**** md5 signature: 7cebd699dfcb51866c850e6e54217a62 ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Adds the circle to vector of circles at the given position. @param theindex position of circle in the vector. @param thecircle circle to be added.

Parameters
----------
theIndex: int
theCircle: BRepMesh_Circle

Returns
-------
None
") Bind;
		void Bind(const Standard_Integer theIndex, const BRepMesh_Circle & theCircle);

		/****************** Circle ******************/
		/**** md5 signature: 06e7c3749668870601f344d946e7bede ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns circle with the given index. @param theindex index of circle. returns circle with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Circle
") Circle;
		BRepMesh_Circle & Circle(const Standard_Integer theIndex);

		/****************** Circles ******************/
		/**** md5 signature: 5715a9c41d841e4058a32bbf582cd2f3 ****/
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "Resutns vector of registered circles.

Returns
-------
IMeshData::VectorOfCircle
") Circles;
		const IMeshData::VectorOfCircle & Circles();

		/****************** GetShotCircles ******************/
		/**** md5 signature: c1409009f8ad619775420c881c945c8f ****/
		%feature("compactdefaultargs") GetShotCircles;
		%feature("autodoc", "Returns list of circles shot by the reference point.

Returns
-------
IMeshData::ListOfInteger
") GetShotCircles;
		IMeshData::ListOfInteger & GetShotCircles();

		/****************** Inspect ******************/
		/**** md5 signature: 36ed0deca30ac42bb917d21f9193ca76 ****/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "Performs inspection of a circle with the given index. @param thetargetindex index of a circle to be checked. returns status of the check.

Parameters
----------
theTargetIndex: int

Returns
-------
NCollection_CellFilter_Action
") Inspect;
		NCollection_CellFilter_Action Inspect(const Standard_Integer theTargetIndex);

		/****************** IsEqual ******************/
		/**** md5 signature: dd38878b9463f31ea5c2351dd2f590e3 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks indices for equlity.

Parameters
----------
theIndex: int
theTargetIndex: int

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const Standard_Integer theIndex, const Standard_Integer theTargetIndex);

		/****************** SetPoint ******************/
		/**** md5 signature: b521bfcebdca3f9d4da8c66d87603bc7 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Set reference point to be checked. @param thepoint bullet point.

Parameters
----------
thePoint: gp_XY

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_XY & thePoint);

};


%extend BRepMesh_CircleInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepMesh_CircleTool *
****************************/
class BRepMesh_CircleTool {
	public:
		/****************** BRepMesh_CircleTool ******************/
		/**** md5 signature: cd4fc4f8a4dbaf9bbda62ee6ed26b484 ****/
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "Constructor. @param theallocator memory allocator to be used by internal structures.

Parameters
----------
theAllocator: NCollection_IncAllocator

Returns
-------
None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool(const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****************** BRepMesh_CircleTool ******************/
		/**** md5 signature: c6eb5dae5ac79dcae0854f80344cf319 ****/
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "Constructor. @param thereservedsize size to be reserved for vector of circles. @param theallocator memory allocator to be used by internal structures.

Parameters
----------
theReservedSize: int
theAllocator: NCollection_IncAllocator

Returns
-------
None
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool(const Standard_Integer theReservedSize, const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****************** Bind ******************/
		/**** md5 signature: 154690b42ecbd10f375f8b7af8b5b652 ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Binds the circle to the tool. @param theindex index a circle should be bound with. @param thecircle circle to be bound.

Parameters
----------
theIndex: int
theCircle: gp_Circ2d

Returns
-------
None
") Bind;
		void Bind(const Standard_Integer theIndex, const gp_Circ2d & theCircle);

		/****************** Bind ******************/
		/**** md5 signature: 6c8a2596059211c4304b11964bd3737f ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Computes circle on three points and bind it to the tool. @param theindex index a circle should be bound with. @param thepoint1 first point. @param thepoint2 second point. @param thepoint3 third point. returns false in case of impossibility to build a circle on the given points, true elsewhere.

Parameters
----------
theIndex: int
thePoint1: gp_XY
thePoint2: gp_XY
thePoint3: gp_XY

Returns
-------
bool
") Bind;
		Standard_Boolean Bind(const Standard_Integer theIndex, const gp_XY & thePoint1, const gp_XY & thePoint2, const gp_XY & thePoint3);

		/****************** Delete ******************/
		/**** md5 signature: 071690f016ae5c038b98161e982d077e ****/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "Deletes a circle from the tool. @param theindex index of a circle to be removed.

Parameters
----------
theIndex: int

Returns
-------
None
") Delete;
		void Delete(const Standard_Integer theIndex);

		/****************** Init ******************/
		/**** md5 signature: 3dd4080a86e69636d0123b416448c0ee ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the tool. @param thereservedsize size to be reserved for vector of circles.

Parameters
----------
Standard_Integer: 

Returns
-------
None
") Init;
		void Init(const Standard_Integer);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if cell filter contains no circle.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** MakeCircle ******************/
		/**** md5 signature: 46bcabfe7710c009f41e63b1f25fea06 ****/
		%feature("compactdefaultargs") MakeCircle;
		%feature("autodoc", "Computes circle on three points. @param thepoint1 first point. @param thepoint2 second point. @param thepoint3 third point. @param[out] thelocation center of computed circle. @param[out] theradius radius of computed circle. returns false in case of impossibility to build a circle on the given points, true elsewhere.

Parameters
----------
thePoint1: gp_XY
thePoint2: gp_XY
thePoint3: gp_XY
theLocation: gp_XY

Returns
-------
theRadius: float
") MakeCircle;
		static Standard_Boolean MakeCircle(const gp_XY & thePoint1, const gp_XY & thePoint2, const gp_XY & thePoint3, gp_XY & theLocation, Standard_Real &OutValue);

		/****************** MocBind ******************/
		/**** md5 signature: ef973aed188f7fc29293e962039e4ce6 ****/
		%feature("compactdefaultargs") MocBind;
		%feature("autodoc", "Binds implicit zero circle. @param theindex index a zero circle should be bound with.

Parameters
----------
theIndex: int

Returns
-------
None
") MocBind;
		void MocBind(const Standard_Integer theIndex);

		/****************** Select ******************/
		/**** md5 signature: 42d7f08c8f789406b882043c70333ebd ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Select the circles shot by the given point. @param thepoint bullet point.

Parameters
----------
thePoint: gp_XY

Returns
-------
IMeshData::ListOfInteger
") Select;
		IMeshData::ListOfInteger & Select(const gp_XY & thePoint);

		/****************** SetCellSize ******************/
		/**** md5 signature: 415a8b91be50170d2af0ba27dd19bc6c ****/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "Sets new size for cell filter. @param thesize cell size to be set for x and y dimensions.

Parameters
----------
theSize: float

Returns
-------
None
") SetCellSize;
		void SetCellSize(const Standard_Real theSize);

		/****************** SetCellSize ******************/
		/**** md5 signature: 28e49b1c038f46447a07e18f6d52b3eb ****/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "Sets new size for cell filter. @param thesizex cell size to be set for x dimension. @param thesizey cell size to be set for y dimension.

Parameters
----------
theSizeX: float
theSizeY: float

Returns
-------
None
") SetCellSize;
		void SetCellSize(const Standard_Real theSizeX, const Standard_Real theSizeY);

		/****************** SetMinMaxSize ******************/
		/**** md5 signature: f153182deac2fb83c6f4bb26b9903fb1 ****/
		%feature("compactdefaultargs") SetMinMaxSize;
		%feature("autodoc", "Sets limits of inspection area. @param themin bottom left corner of inspection area. @param themax top right corner of inspection area.

Parameters
----------
theMin: gp_XY
theMax: gp_XY

Returns
-------
None
") SetMinMaxSize;
		void SetMinMaxSize(const gp_XY & theMin, const gp_XY & theMax);

};


%extend BRepMesh_CircleTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepMesh_Classifier *
****************************/
class BRepMesh_Classifier : public Standard_Transient {
	public:
		/****************** BRepMesh_Classifier ******************/
		/**** md5 signature: 985f7a67456acfd7e203609355094286 ****/
		%feature("compactdefaultargs") BRepMesh_Classifier;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_Classifier;
		 BRepMesh_Classifier();

		/****************** Perform ******************/
		/**** md5 signature: 668466fd138ea01dcd174ac83e766ee1 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs classification of the given point regarding to face internals. @param thepoint point in parametric space to be classified. returns topabs_in if point lies within face boundaries and topabs_out elsewhere.

Parameters
----------
thePoint: gp_Pnt2d

Returns
-------
TopAbs_State
") Perform;
		TopAbs_State Perform(const gp_Pnt2d & thePoint);

		/****************** RegisterWire ******************/
		/**** md5 signature: 9967b6710a5502eb1c8eafb8149cecf8 ****/
		%feature("compactdefaultargs") RegisterWire;
		%feature("autodoc", "Registers wire specified by sequence of points for further classification of points. @param thewire wire to be registered. specified by sequence of points. @param thetoluv tolerance to be used for calculations in parametric space. @param theumin lower u boundary of the face in parametric space. @param theumax upper u boundary of the face in parametric space. @param thevmin lower v boundary of the face in parametric space. @param thevmax upper v boundary of the face in parametric space.

Parameters
----------
theWire: NCollection_Sequence< gp_Pnt2d *>
theTolUV: std::pair<float, float>
theRangeU: std::pair<float, float>
theRangeV: std::pair<float, float>

Returns
-------
None
") RegisterWire;
		void RegisterWire(const NCollection_Sequence<const gp_Pnt2d *> & theWire, const std::pair<Standard_Real, Standard_Real> & theTolUV, const std::pair<Standard_Real, Standard_Real> & theRangeU, const std::pair<Standard_Real, Standard_Real> & theRangeV);

};


%make_alias(BRepMesh_Classifier)

%extend BRepMesh_Classifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepMesh_Context *
*************************/
class BRepMesh_Context : public IMeshTools_Context {
	public:
		/****************** BRepMesh_Context ******************/
		/**** md5 signature: b9a5ecaf630ba21afab7902c0bd2fa8b ****/
		%feature("compactdefaultargs") BRepMesh_Context;
		%feature("autodoc", "Constructor.

Parameters
----------
theMeshType: IMeshTools_MeshAlgoType,optional
	default value is IMeshTools_MeshAlgoType_DEFAULT

Returns
-------
None
") BRepMesh_Context;
		 BRepMesh_Context(IMeshTools_MeshAlgoType theMeshType = IMeshTools_MeshAlgoType_DEFAULT);

};


%extend BRepMesh_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepMesh_CurveTessellator *
**********************************/
class BRepMesh_CurveTessellator : public IMeshTools_CurveTessellator {
	public:
		/****************** BRepMesh_CurveTessellator ******************/
		/**** md5 signature: 8969af78dec0b3b693d65dedebb220b7 ****/
		%feature("compactdefaultargs") BRepMesh_CurveTessellator;
		%feature("autodoc", "Constructor.

Parameters
----------
theEdge: IMeshData::IEdgeHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int,optional
	default value is 2

Returns
-------
None
") BRepMesh_CurveTessellator;
		 BRepMesh_CurveTessellator(const IMeshData::IEdgeHandle & theEdge, const IMeshTools_Parameters & theParameters, const Standard_Integer theMinPointsNb = 2);

		/****************** BRepMesh_CurveTessellator ******************/
		/**** md5 signature: f45923b0468f038ca021eb1a2e3c68a7 ****/
		%feature("compactdefaultargs") BRepMesh_CurveTessellator;
		%feature("autodoc", "Constructor.

Parameters
----------
theEdge: IMeshData::IEdgeHandle
theOrientation: TopAbs_Orientation
theFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int,optional
	default value is 2

Returns
-------
None
") BRepMesh_CurveTessellator;
		 BRepMesh_CurveTessellator(const IMeshData::IEdgeHandle & theEdge, const TopAbs_Orientation theOrientation, const IMeshData::IFaceHandle & theFace, const IMeshTools_Parameters & theParameters, const Standard_Integer theMinPointsNb = 2);

		/****************** PointsNb ******************/
		/**** md5 signature: c7dec7b525c6ed3a148d8633ce567fe8 ****/
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "Returns number of tessellation points.

Returns
-------
int
") PointsNb;
		virtual Standard_Integer PointsNb();

		/****************** Value ******************/
		/**** md5 signature: 4110d8d1bb060691997a3dfc00ca0b94 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns parameters of solution with the given index. @param theindex index of tessellation point. @param theparameter parameters on pcurve corresponded to the solution. @param thepoint tessellation point. returns true in case of valid result, false elewhere.

Parameters
----------
theIndex: int
thePoint: gp_Pnt

Returns
-------
theParameter: float
") Value;
		virtual Standard_Boolean Value(const Standard_Integer theIndex, gp_Pnt & thePoint, Standard_Real &OutValue);

};


%extend BRepMesh_CurveTessellator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BRepMesh_CustomDelaunayBaseMeshAlgo *
********************************************/
/***************************************
* class BRepMesh_DataStructureOfDelaun *
***************************************/
class BRepMesh_DataStructureOfDelaun : public Standard_Transient {
	public:
		/****************** BRepMesh_DataStructureOfDelaun ******************/
		/**** md5 signature: 2287ac69950ef2b0749f3b921b91ce4f ****/
		%feature("compactdefaultargs") BRepMesh_DataStructureOfDelaun;
		%feature("autodoc", "Constructor. @param theallocator memory allocator to be used by internal structures. @param thereservednodesize presumed number of nodes in this mesh.

Parameters
----------
theAllocator: NCollection_IncAllocator
theReservedNodeSize: int,optional
	default value is 100

Returns
-------
None
") BRepMesh_DataStructureOfDelaun;
		 BRepMesh_DataStructureOfDelaun(const opencascade::handle<NCollection_IncAllocator> & theAllocator, const Standard_Integer theReservedNodeSize = 100);

		/****************** AddElement ******************/
		/**** md5 signature: 94a8b8e1417772021ce81c09a3356dbe ****/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "Adds element to the mesh if it is not already in the mesh. @param theelement element to be added to the mesh. returns index of the element in the structure.

Parameters
----------
theElement: BRepMesh_Triangle

Returns
-------
int
") AddElement;
		Standard_Integer AddElement(const BRepMesh_Triangle & theElement);

		/****************** AddLink ******************/
		/**** md5 signature: 4691508da394d212a95c84d4b6e052e8 ****/
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "Adds link to the mesh if it is not already in the mesh. @param thelink link to be added to the mesh. returns index of the link in the structure.

Parameters
----------
theLink: BRepMesh_Edge

Returns
-------
int
") AddLink;
		Standard_Integer AddLink(const BRepMesh_Edge & theLink);

		/****************** AddNode ******************/
		/**** md5 signature: 0516fd4a8f3c95f7b1ed562c74328f62 ****/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "Adds node to the mesh if it is not already in the mesh. @param thenode node to be added to the mesh. @param isforceadd adds the given node to structure without checking on coincidence with other nodes. returns index of the node in the structure.

Parameters
----------
theNode: BRepMesh_Vertex
isForceAdd: bool,optional
	default value is Standard_False

Returns
-------
int
") AddNode;
		Standard_Integer AddNode(const BRepMesh_Vertex & theNode, const Standard_Boolean isForceAdd = Standard_False);

		/****************** Allocator ******************/
		/**** md5 signature: f62593783d4573ef5624106d77d9bbd9 ****/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Returns memory allocator used by the structure.

Returns
-------
opencascade::handle<NCollection_IncAllocator>
") Allocator;
		const opencascade::handle<NCollection_IncAllocator> & Allocator();

		/****************** ClearDeleted ******************/
		/**** md5 signature: 2f79f0e58312517eed899c340fbc034c ****/
		%feature("compactdefaultargs") ClearDeleted;
		%feature("autodoc", "Substitutes deleted items by the last one from corresponding map to have only non-deleted elements, links or nodes in the structure.

Returns
-------
None
") ClearDeleted;
		void ClearDeleted();

		/****************** ClearDomain ******************/
		/**** md5 signature: cba3b5048c974ffd2154c94ad129dd31 ****/
		%feature("compactdefaultargs") ClearDomain;
		%feature("autodoc", "Removes all elements.

Returns
-------
None
") ClearDomain;
		void ClearDomain();

		/****************** Data ******************/
		/**** md5 signature: 60a87eb41dbe1e7bddca17ebc155ae95 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Gives the data structure for initialization of cell size and tolerance.

Returns
-------
opencascade::handle<BRepMesh_VertexTool>
") Data;
		const opencascade::handle<BRepMesh_VertexTool> & Data();

		/****************** Dump ******************/
		/**** md5 signature: d3d8c72524995f78a1b0cc6995a49cf5 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileNameStr: str

Returns
-------
None
") Dump;
		void Dump(Standard_CString theFileNameStr);

		/****************** ElementNodes ******************/
		/**** md5 signature: 5db4f2cf5cd97ae13ac71bb7f7bf46de ****/
		%feature("compactdefaultargs") ElementNodes;
		%feature("autodoc", "Returns indices of nodes forming the given element. @param theelement element which nodes should be retrieved. @param[out] thenodes nodes of the given element.

Parameters
----------
theElement: BRepMesh_Triangle
: int(theNodes)

Returns
-------
None
") ElementNodes;
		void ElementNodes(const BRepMesh_Triangle & theElement, Standard_Integer(&theNodes) [3]);

		/****************** ElementsConnectedTo ******************/
		/**** md5 signature: 6a0793321d2308e1d5fc176a3a016706 ****/
		%feature("compactdefaultargs") ElementsConnectedTo;
		%feature("autodoc", "Returns indices of elements connected to the link with the given index. @param thelinkindex index of link whose data should be retrieved. returns indices of elements connected to the link.

Parameters
----------
theLinkIndex: int

Returns
-------
BRepMesh_PairOfIndex
") ElementsConnectedTo;
		const BRepMesh_PairOfIndex & ElementsConnectedTo(const Standard_Integer theLinkIndex);

		/****************** ElementsOfDomain ******************/
		/**** md5 signature: 69b3fc4ed234e9f90fe6024d34e76746 ****/
		%feature("compactdefaultargs") ElementsOfDomain;
		%feature("autodoc", "Returns map of indices of elements registered in mesh.

Returns
-------
IMeshData::MapOfInteger
") ElementsOfDomain;
		const IMeshData::MapOfInteger & ElementsOfDomain();

		/****************** GetElement ******************/
		/**** md5 signature: c9b9801039484bfc9f57f5dc42578498 ****/
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "Get element by the index. @param theindex index of an element. returns element with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Triangle
") GetElement;
		const BRepMesh_Triangle & GetElement(const Standard_Integer theIndex);

		/****************** GetLink ******************/
		/**** md5 signature: 4ab6f14e075232adda60803210dc0a9f ****/
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "Get link by the index. @param theindex index of a link. returns link with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Edge
") GetLink;
		const BRepMesh_Edge & GetLink(const Standard_Integer theIndex);

		/****************** GetNode ******************/
		/**** md5 signature: 292c7b2f2aea3bfbafc99b3d94fdd1a2 ****/
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "Get node by the index. @param theindex index of a node. returns node with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Vertex
") GetNode;
		const BRepMesh_Vertex & GetNode(const Standard_Integer theIndex);

		/****************** IndexOf ******************/
		/**** md5 signature: 3f434eceeff0c6557949e02cf119e10c ****/
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "Finds the index of the given node. @param thenode node to find. returns index of the given element of zero if node is not in the mesh.

Parameters
----------
theNode: BRepMesh_Vertex

Returns
-------
int
") IndexOf;
		Standard_Integer IndexOf(const BRepMesh_Vertex & theNode);

		/****************** IndexOf ******************/
		/**** md5 signature: 1936fca1064f882cb3a704a0b57bf41b ****/
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "Finds the index of the given link. @param thelink link to find. returns index of the given element of zero if link is not in the mesh.

Parameters
----------
theLink: BRepMesh_Edge

Returns
-------
int
") IndexOf;
		Standard_Integer IndexOf(const BRepMesh_Edge & theLink);

		/****************** LinksConnectedTo ******************/
		/**** md5 signature: 9857b8f97159eb2d3ff586fadab236b8 ****/
		%feature("compactdefaultargs") LinksConnectedTo;
		%feature("autodoc", "Get list of links attached to the node with the given index. @param theindex index of node whose links should be retrieved. returns list of links attached to the node.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::ListOfInteger
") LinksConnectedTo;
		const IMeshData::ListOfInteger & LinksConnectedTo(const Standard_Integer theIndex);

		/****************** LinksOfDomain ******************/
		/**** md5 signature: 912b45a268b81eb750fcd0b09b5744a5 ****/
		%feature("compactdefaultargs") LinksOfDomain;
		%feature("autodoc", "Returns map of indices of links registered in mesh.

Returns
-------
IMeshData::MapOfInteger
") LinksOfDomain;
		const IMeshData::MapOfInteger & LinksOfDomain();

		/****************** NbElements ******************/
		/**** md5 signature: 31ab3b416016e435682ef37235c33db1 ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "@name api for accessing mesh elements. returns number of links.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** NbLinks ******************/
		/**** md5 signature: 2c9671a2bdbbb6b3c071b4befae3ab9c ****/
		%feature("compactdefaultargs") NbLinks;
		%feature("autodoc", "@name api for accessing mesh links. returns number of links.

Returns
-------
int
") NbLinks;
		Standard_Integer NbLinks();

		/****************** NbNodes ******************/
		/**** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "@name api for accessing mesh nodes. returns number of nodes.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** RemoveElement ******************/
		/**** md5 signature: 2865f98473668f1017ebd476792ecce7 ****/
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "Removes element from the mesh. @param theindex index of element to be removed.

Parameters
----------
theIndex: int

Returns
-------
None
") RemoveElement;
		void RemoveElement(const Standard_Integer theIndex);

		/****************** RemoveLink ******************/
		/**** md5 signature: 69f63c171a16ac211e5cc3d4eb18ef27 ****/
		%feature("compactdefaultargs") RemoveLink;
		%feature("autodoc", "Removes link from the mesh in case if it has no connected elements and its type is free. @param theindex index of link to be removed. @param isforce if true link will be removed even if movability is not free.

Parameters
----------
theIndex: int
isForce: bool,optional
	default value is Standard_False

Returns
-------
None
") RemoveLink;
		void RemoveLink(const Standard_Integer theIndex, const Standard_Boolean isForce = Standard_False);

		/****************** RemoveNode ******************/
		/**** md5 signature: 9b6d945ac16fe90d29639d80839df411 ****/
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "Removes node from the mesh in case if it has no connected links and its type is free. @param theindex index of node to be removed. @param isforce if true node will be removed even if movability is not free.

Parameters
----------
theIndex: int
isForce: bool,optional
	default value is Standard_False

Returns
-------
None
") RemoveNode;
		void RemoveNode(const Standard_Integer theIndex, const Standard_Boolean isForce = Standard_False);


        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
		/****************** SubstituteElement ******************/
		/**** md5 signature: 12a4e39048c62f85d59c6cb6b113dccd ****/
		%feature("compactdefaultargs") SubstituteElement;
		%feature("autodoc", "Substitutes the element with the given index by new one. @param theindex index of element to be substituted. @param thenewlink substituting element. returns false in case if new element is already in the structure, true elsewhere.

Parameters
----------
theIndex: int
theNewElement: BRepMesh_Triangle

Returns
-------
bool
") SubstituteElement;
		Standard_Boolean SubstituteElement(const Standard_Integer theIndex, const BRepMesh_Triangle & theNewElement);

		/****************** SubstituteLink ******************/
		/**** md5 signature: f2c0b3ec79ede5578f8804e858107d49 ****/
		%feature("compactdefaultargs") SubstituteLink;
		%feature("autodoc", "Substitutes the link with the given index by new one. @param theindex index of link to be substituted. @param thenewlink substituting link. returns false in case if new link is already in the structure, true elsewhere.

Parameters
----------
theIndex: int
theNewLink: BRepMesh_Edge

Returns
-------
bool
") SubstituteLink;
		Standard_Boolean SubstituteLink(const Standard_Integer theIndex, const BRepMesh_Edge & theNewLink);

		/****************** SubstituteNode ******************/
		/**** md5 signature: ef7beda41b0e96083c85b8b05b5dbdb1 ****/
		%feature("compactdefaultargs") SubstituteNode;
		%feature("autodoc", "Substitutes the node with the given index by new one. @param theindex index of node to be substituted. @param thenewnode substituting node. returns false in case if new node is already in the structure, true elsewhere.

Parameters
----------
theIndex: int
theNewNode: BRepMesh_Vertex

Returns
-------
bool
") SubstituteNode;
		Standard_Boolean SubstituteNode(const Standard_Integer theIndex, const BRepMesh_Vertex & theNewNode);

};


%make_alias(BRepMesh_DataStructureOfDelaun)

%extend BRepMesh_DataStructureOfDelaun {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepMesh_DefaultRangeSplitter *
**************************************/
class BRepMesh_DefaultRangeSplitter {
	public:
		/****************** BRepMesh_DefaultRangeSplitter ******************/
		/**** md5 signature: e5ff6a4040f11f5ba79d0762f73e7a48 ****/
		%feature("compactdefaultargs") BRepMesh_DefaultRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_DefaultRangeSplitter;
		 BRepMesh_DefaultRangeSplitter();

		/****************** AddPoint ******************/
		/**** md5 signature: 3771804d13147da01f7a0a6ebdcc9a45 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Registers border point.

Parameters
----------
thePoint: gp_Pnt2d

Returns
-------
None
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint);

		/****************** AdjustRange ******************/
		/**** md5 signature: ddbe360d718a2ef25835d18d405aa99b ****/
		%feature("compactdefaultargs") AdjustRange;
		%feature("autodoc", "Updates discrete range of surface according to its geometric range.

Returns
-------
None
") AdjustRange;
		virtual void AdjustRange();

		/****************** GetDFace ******************/
		/**** md5 signature: 66ba0efe4a5555cea366f7d6aabb3193 ****/
		%feature("compactdefaultargs") GetDFace;
		%feature("autodoc", "Returns face model.

Returns
-------
IMeshData::IFaceHandle
") GetDFace;
		const IMeshData::IFaceHandle & GetDFace();

		/****************** GetDelta ******************/
		/**** md5 signature: edc641b55de58529d198ed0511aa6fd8 ****/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Returns delta.

Returns
-------
std::pair<float, float>
") GetDelta;
		const std::pair<Standard_Real, Standard_Real> & GetDelta();

		/****************** GetRangeU ******************/
		/**** md5 signature: c43a174b289ad155ae8bf9f1e53b8062 ****/
		%feature("compactdefaultargs") GetRangeU;
		%feature("autodoc", "Returns u range.

Returns
-------
std::pair<float, float>
") GetRangeU;
		const std::pair<Standard_Real, Standard_Real> & GetRangeU();

		/****************** GetRangeV ******************/
		/**** md5 signature: f67b728346251d3015b0f0c227498055 ****/
		%feature("compactdefaultargs") GetRangeV;
		%feature("autodoc", "Returns v range.

Returns
-------
std::pair<float, float>
") GetRangeV;
		const std::pair<Standard_Real, Standard_Real> & GetRangeV();

		/****************** GetSurface ******************/
		/**** md5 signature: 6aa03522ab6b1d17fd10abc283bef0d7 ****/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Returns surface.

Returns
-------
opencascade::handle<BRepAdaptor_Surface>
") GetSurface;
		const opencascade::handle<BRepAdaptor_Surface> & GetSurface();

		/****************** GetToleranceUV ******************/
		/**** md5 signature: fc1231c20c5ec088ee9c6e57c8d00c11 ****/
		%feature("compactdefaultargs") GetToleranceUV;
		%feature("autodoc", "No available documentation.

Returns
-------
std::pair<float, float>
") GetToleranceUV;
		const std::pair<Standard_Real, Standard_Real> & GetToleranceUV();

		/****************** IsValid ******************/
		/**** md5 signature: 4e89d8566bfc31662c40412a922c328e ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns true if computed range is valid.

Returns
-------
bool
") IsValid;
		virtual Standard_Boolean IsValid();

		/****************** Point ******************/
		/**** md5 signature: a5831d9dd1c33d274655f020e0ba9a9e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns point in 3d space corresponded to the given point defined in parameteric space of surface.

Parameters
----------
thePoint2d: gp_Pnt2d

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const gp_Pnt2d & thePoint2d);

		/****************** Reset ******************/
		/**** md5 signature: ac4f00ee28ad32a0f5f23f21d5b1091c ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Resets this splitter. must be called before first use.

Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Returns
-------
None
") Reset;
		virtual void Reset(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

		/****************** Scale ******************/
		/**** md5 signature: a9c2738909350fd1cfc1874519d9a0d4 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Scales the given point from real parametric space to face basis and otherwise. @param thepoint point to be scaled. @param istofacebasis if true converts point to face basis, otherwise performs reverse conversion. returns scaled point.

Parameters
----------
thePoint: gp_Pnt2d
isToFaceBasis: bool

Returns
-------
gp_Pnt2d
") Scale;
		gp_Pnt2d Scale(const gp_Pnt2d & thePoint, const Standard_Boolean isToFaceBasis);

};


%extend BRepMesh_DefaultRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepMesh_Deflection *
****************************/
class BRepMesh_Deflection : public Standard_Transient {
	public:
		/****************** ComputeAbsoluteDeflection ******************/
		/**** md5 signature: a9344eab611d641e9e7e51e496c627ab ****/
		%feature("compactdefaultargs") ComputeAbsoluteDeflection;
		%feature("autodoc", "Returns absolute deflection for theshape with respect to the relative deflection and themaxshapesize. @param theshape shape for that the deflection should be computed. @param therelativedeflection relative deflection. @param themaxshapesize maximum size of the whole shape. returns absolute deflection for the shape.

Parameters
----------
theShape: TopoDS_Shape
theRelativeDeflection: float
theMaxShapeSize: float

Returns
-------
float
") ComputeAbsoluteDeflection;
		static Standard_Real ComputeAbsoluteDeflection(const TopoDS_Shape & theShape, const Standard_Real theRelativeDeflection, const Standard_Real theMaxShapeSize);

		/****************** ComputeDeflection ******************/
		/**** md5 signature: 1512902f294799f73df16c37c0f03108 ****/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "Computes and updates deflection of the given discrete edge.

Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theMaxShapeSize: float
theParameters: IMeshTools_Parameters

Returns
-------
void
") ComputeDeflection;
		static void ComputeDeflection(const IMeshData::IEdgeHandle & theDEdge, const Standard_Real theMaxShapeSize, const IMeshTools_Parameters & theParameters);

		/****************** ComputeDeflection ******************/
		/**** md5 signature: e1d2e8148982b00889ee52b5925e1300 ****/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "Computes and updates deflection of the given discrete wire.

Parameters
----------
theDWire: IMeshData::IWireHandle
theParameters: IMeshTools_Parameters

Returns
-------
void
") ComputeDeflection;
		static void ComputeDeflection(const IMeshData::IWireHandle & theDWire, const IMeshTools_Parameters & theParameters);

		/****************** ComputeDeflection ******************/
		/**** md5 signature: 394c2d7076288b46094dbb60cdf403a4 ****/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "Computes and updates deflection of the given discrete face.

Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Returns
-------
void
") ComputeDeflection;
		static void ComputeDeflection(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

		/****************** IsConsistent ******************/
		/**** md5 signature: f1f59248e21270aff44097869389da31 ****/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "Checks if the deflection of current polygonal representation is consistent with the required deflection. @param thecurrent [in] current deflection. @param therequired [in] required deflection. @param theallowdecrease [in] flag controlling the check. if decrease is allowed, to be consistent the current and required deflections should be approximately the same. if not allowed, the current deflection should be less than required. @param theratio [in] the ratio for comparison of the deflections (value from 0 to 1).

Parameters
----------
theCurrent: float
theRequired: float
theAllowDecrease: bool
theRatio: float,optional
	default value is 0.1

Returns
-------
bool
") IsConsistent;
		static Standard_Boolean IsConsistent(const Standard_Real theCurrent, const Standard_Real theRequired, const Standard_Boolean theAllowDecrease, const Standard_Real theRatio = 0.1);

};


%make_alias(BRepMesh_Deflection)

%extend BRepMesh_Deflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRepMesh_DelabellaMeshAlgoFactory *
******************************************/
class BRepMesh_DelabellaMeshAlgoFactory : public IMeshTools_MeshAlgoFactory {
	public:
		/****************** BRepMesh_DelabellaMeshAlgoFactory ******************/
		/**** md5 signature: 7e764d1ee3a95c966901000e31a5d227 ****/
		%feature("compactdefaultargs") BRepMesh_DelabellaMeshAlgoFactory;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_DelabellaMeshAlgoFactory;
		 BRepMesh_DelabellaMeshAlgoFactory();

		/****************** GetAlgo ******************/
		/**** md5 signature: b5f3831f9f5db3705d1be887bba92f22 ****/
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "Creates instance of meshing algorithm for the given type of surface.

Parameters
----------
theSurfaceType: GeomAbs_SurfaceType
theParameters: IMeshTools_Parameters

Returns
-------
opencascade::handle<IMeshTools_MeshAlgo>
") GetAlgo;
		virtual opencascade::handle<IMeshTools_MeshAlgo> GetAlgo(const GeomAbs_SurfaceType theSurfaceType, const IMeshTools_Parameters & theParameters);

};


%extend BRepMesh_DelabellaMeshAlgoFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepMesh_Delaun *
************************/
class BRepMesh_Delaun {
	public:
		/****************** BRepMesh_Delaun ******************/
		/**** md5 signature: 675af52751de76071975fb45f4fe4d11 ****/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "Creates instance of triangulator, but do not run the algorithm automatically.

Parameters
----------
theOldMesh: BRepMesh_DataStructureOfDelaun
theCellsCountU: int
theCellsCountV: int
isFillCircles: bool

Returns
-------
None
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh, const Standard_Integer theCellsCountU, const Standard_Integer theCellsCountV, const Standard_Boolean isFillCircles);

		/****************** BRepMesh_Delaun ******************/
		/**** md5 signature: 67a9f1d69a5229d991569f29fce7a648 ****/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "Creates the triangulation with an empty mesh data structure.

Parameters
----------
theVertices: IMeshData::Array1OfVertexOfDelaun

Returns
-------
None
") BRepMesh_Delaun;
		 BRepMesh_Delaun(IMeshData::Array1OfVertexOfDelaun & theVertices);

		/****************** BRepMesh_Delaun ******************/
		/**** md5 signature: df88784074ba4bf377dd6ca7843b0be2 ****/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "Creates the triangulation with an existent mesh data structure.

Parameters
----------
theOldMesh: BRepMesh_DataStructureOfDelaun
theVertices: IMeshData::Array1OfVertexOfDelaun

Returns
-------
None
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh, IMeshData::Array1OfVertexOfDelaun & theVertices);

		/****************** BRepMesh_Delaun ******************/
		/**** md5 signature: 548fe3ab0ed5446122fb6a1a75317e5a ****/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "Creates the triangulation with an existant mesh data structure.

Parameters
----------
theOldMesh: BRepMesh_DataStructureOfDelaun
theVertexIndices: IMeshData::VectorOfInteger

Returns
-------
None
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh, IMeshData::VectorOfInteger & theVertexIndices);

		/****************** BRepMesh_Delaun ******************/
		/**** md5 signature: 369ae05e7ad78835ff2b9029f41d1d44 ****/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "Creates the triangulation with an existant mesh data structure.

Parameters
----------
theOldMesh: Handle(BRepMesh_DataStructureOfDelaun)
theVertexIndices: IMeshData::VectorOfInteger
theCellsCountU: int
theCellsCountV: int

Returns
-------
None
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const Handle(BRepMesh_DataStructureOfDelaun) & theOldMesh, IMeshData::VectorOfInteger & theVertexIndices, const Standard_Integer theCellsCountU, const Standard_Integer theCellsCountV);

		/****************** AddVertices ******************/
		/**** md5 signature: 113e996513917ce7251d5a839da38bcc ****/
		%feature("compactdefaultargs") AddVertices;
		%feature("autodoc", "Adds some vertices into the triangulation.

Parameters
----------
theVerticesIndices: IMeshData::VectorOfInteger
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") AddVertices;
		void AddVertices(IMeshData::VectorOfInteger & theVerticesIndices, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Circles ******************/
		/**** md5 signature: 33d52e752207c405b226546e9af83859 ****/
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "Returns tool used to build mesh consistent to delaunay criteria.

Returns
-------
BRepMesh_CircleTool
") Circles;
		const BRepMesh_CircleTool & Circles();

		/****************** Contains ******************/
		/**** md5 signature: eab3390394ef3941bab180cccfcd77f6 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Test is the given triangle contains the given vertex. @param thesqtolerance square tolerance to check closeness to some edge @param theedgeon if it is != 0 the vertex lies onto the edge index returned through this parameter.

Parameters
----------
theTriangleId: int
theVertex: BRepMesh_Vertex
theSqTolerance: float

Returns
-------
theEdgeOn: int
") Contains;
		Standard_Boolean Contains(const Standard_Integer theTriangleId, const BRepMesh_Vertex & theVertex, const Standard_Real theSqTolerance, Standard_Integer &OutValue);

		/****************** GetEdge ******************/
		/**** md5 signature: 9210edd1005034060d95da674efa9dbf ****/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "Gives edge with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Edge
") GetEdge;
		const BRepMesh_Edge & GetEdge(const Standard_Integer theIndex);

		/****************** GetTriangle ******************/
		/**** md5 signature: 461ad6dfa4bf78d3a59eb076d0a6e2f2 ****/
		%feature("compactdefaultargs") GetTriangle;
		%feature("autodoc", "Gives triangle with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Triangle
") GetTriangle;
		const BRepMesh_Triangle & GetTriangle(const Standard_Integer theIndex);

		/****************** GetVertex ******************/
		/**** md5 signature: 79dd510956ad78ac9dc3b4423557d902 ****/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "Gives vertex with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Vertex
") GetVertex;
		const BRepMesh_Vertex & GetVertex(const Standard_Integer theIndex);

		/****************** Init ******************/
		/**** md5 signature: 315fb83d9713d47297c33011a2c6b575 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the triangulation with an array of vertices.

Parameters
----------
theVertices: IMeshData::Array1OfVertexOfDelaun

Returns
-------
None
") Init;
		void Init(IMeshData::Array1OfVertexOfDelaun & theVertices);

		/****************** InitCirclesTool ******************/
		/**** md5 signature: 0df31355d061303be30d5738e8b960c4 ****/
		%feature("compactdefaultargs") InitCirclesTool;
		%feature("autodoc", "Forces initialization of circles cell filter using working structure.

Parameters
----------
theCellsCountU: int
theCellsCountV: int

Returns
-------
None
") InitCirclesTool;
		void InitCirclesTool(const Standard_Integer theCellsCountU, const Standard_Integer theCellsCountV);

		/****************** RemoveAuxElements ******************/
		/**** md5 signature: f5c31c7ed6200793d7e443c838782af8 ****/
		%feature("compactdefaultargs") RemoveAuxElements;
		%feature("autodoc", "Destruction of auxiliary triangles containing the given vertices. removes auxiliary vertices also. @param theauxvertices auxiliary vertices to be cleaned up.

Returns
-------
None
") RemoveAuxElements;
		void RemoveAuxElements();

		/****************** RemoveVertex ******************/
		/**** md5 signature: 45b088f9c013183a935581ea0ea79936 ****/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "Removes a vertex from the triangulation.

Parameters
----------
theVertex: BRepMesh_Vertex

Returns
-------
None
") RemoveVertex;
		void RemoveVertex(const BRepMesh_Vertex & theVertex);

		/****************** Result ******************/
		/**** md5 signature: 1244aaba5231d45d599f841b2370df2a ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Gives the mesh data structure.

Returns
-------
opencascade::handle<BRepMesh_DataStructureOfDelaun>
") Result;
		const opencascade::handle<BRepMesh_DataStructureOfDelaun> & Result();

		/****************** SetAuxVertices ******************/
		/**** md5 signature: 49ee655c1fb99403e0e07ccbb417bbae ****/
		%feature("compactdefaultargs") SetAuxVertices;
		%feature("autodoc", "Explicitly sets ids of auxiliary vertices used to build mesh and used by 3rd-party algorithms.

Parameters
----------
theSupVert: IMeshData::VectorOfInteger

Returns
-------
inline void
") SetAuxVertices;
		inline void SetAuxVertices(const IMeshData::VectorOfInteger & theSupVert);

		/****************** UseEdge ******************/
		/**** md5 signature: 02fbf448c47cf1029f0cd536b06426d3 ****/
		%feature("compactdefaultargs") UseEdge;
		%feature("autodoc", "Modify mesh to use the edge. returns true if done.

Parameters
----------
theEdge: int

Returns
-------
bool
") UseEdge;
		Standard_Boolean UseEdge(const Standard_Integer theEdge);

};


%extend BRepMesh_Delaun {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def FreeEdges(self):
		pass

	@methodnotwrapped
	def ProcessConstraints(self):
		pass
	}
};

/********************************
* class BRepMesh_DiscretFactory *
********************************/
%nodefaultctor BRepMesh_DiscretFactory;
%ignore BRepMesh_DiscretFactory::~BRepMesh_DiscretFactory();
class BRepMesh_DiscretFactory {
	public:
		/****************** DefaultName ******************/
		/**** md5 signature: 9098ac4c9fc2d3e09ad2b84fe3c2e228 ****/
		%feature("compactdefaultargs") DefaultName;
		%feature("autodoc", "Returns name for current meshing algorithm.

Returns
-------
TCollection_AsciiString
") DefaultName;
		const TCollection_AsciiString & DefaultName();

		/****************** Discret ******************/
		/**** md5 signature: cd4cb93c82fdb51e80e4cdeb0479c6db ****/
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "Returns triangulation algorithm instance. @param theshape shape to be meshed. @param thelindeflection linear deflection to be used for meshing. @param theangdeflection angular deflection to be used for meshing.

Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: float
theAngDeflection: float

Returns
-------
opencascade::handle<BRepMesh_DiscretRoot>
") Discret;
		opencascade::handle<BRepMesh_DiscretRoot> Discret(const TopoDS_Shape & theShape, const Standard_Real theLinDeflection, const Standard_Real theAngDeflection);

		/****************** ErrorStatus ******************/
		/**** md5 signature: 4cc2f68be5a9afe2a68332ec12784419 ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Returns error status for last meshing algorithm switch.

Returns
-------
BRepMesh_FactoryError
") ErrorStatus;
		BRepMesh_FactoryError ErrorStatus();

		/****************** FunctionName ******************/
		/**** md5 signature: 4584d85a4e0c158104ade1647616436f ****/
		%feature("compactdefaultargs") FunctionName;
		%feature("autodoc", "Returns function name that should be exported by plugin.

Returns
-------
TCollection_AsciiString
") FunctionName;
		const TCollection_AsciiString & FunctionName();

		/****************** Get ******************/
		/**** md5 signature: a56c29cb1f600621510ef3cd3ac740da ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the global factory instance.

Returns
-------
BRepMesh_DiscretFactory
") Get;
		static BRepMesh_DiscretFactory & Get();

		/****************** Names ******************/
		/**** md5 signature: 454bedd4396a8ba0ae7740d89904e192 ****/
		%feature("compactdefaultargs") Names;
		%feature("autodoc", "Returns the list of registered meshing algorithms.

Returns
-------
TColStd_MapOfAsciiString
") Names;
		const TColStd_MapOfAsciiString & Names();

		/****************** SetDefault ******************/
		/**** md5 signature: 2912f3989ff003b7d120238def0f78d6 ****/
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "Setup meshing algorithm that should be created by this factory. returns true if requested tool is available. on fail factory will continue to use previous algo. call ::errorstatus() method to retrieve fault reason.

Parameters
----------
theName: str
theFuncName: str,optional
	default value is 'DISCRETALGO'

Returns
-------
bool
") SetDefault;
		Standard_Boolean SetDefault(TCollection_AsciiString theName, TCollection_AsciiString theFuncName = "DISCRETALGO");

		/****************** SetDefaultName ******************/
		/**** md5 signature: 93c5c55f8eba457c231a268a0ebe4017 ****/
		%feature("compactdefaultargs") SetDefaultName;
		%feature("autodoc", "Setup meshing algorithm by name. returns true if requested tool is available. on fail factory will continue to use previous algo.

Parameters
----------
theName: str

Returns
-------
bool
") SetDefaultName;
		Standard_Boolean SetDefaultName(TCollection_AsciiString theName);

		/****************** SetFunctionName ******************/
		/**** md5 signature: 7082400624fff321b966b58b2455fbbd ****/
		%feature("compactdefaultargs") SetFunctionName;
		%feature("autodoc", "Advanced function. changes function name to retrieve from plugin. returns true if requested tool is available. on fail factory will continue to use previous algo.

Parameters
----------
theFuncName: str

Returns
-------
bool
") SetFunctionName;
		Standard_Boolean SetFunctionName(TCollection_AsciiString theFuncName);

};


%extend BRepMesh_DiscretFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepMesh_DiscretRoot *
*****************************/
%nodefaultctor BRepMesh_DiscretRoot;
class BRepMesh_DiscretRoot : public Standard_Transient {
	public:
		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if triangualtion was performed and has success.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: 398f71859219956837273801c6ed1f07 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute triangulation for set shape.

Parameters
----------
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Set the shape to triangulate.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(BRepMesh_DiscretRoot)

%extend BRepMesh_DiscretRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepMesh_EdgeDiscret *
*****************************/
class BRepMesh_EdgeDiscret : public IMeshTools_ModelAlgo {
	public:
		/****************** BRepMesh_EdgeDiscret ******************/
		/**** md5 signature: e7e4c18c9537514f706c9a42008e7796 ****/
		%feature("compactdefaultargs") BRepMesh_EdgeDiscret;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_EdgeDiscret;
		 BRepMesh_EdgeDiscret();

		/****************** CreateEdgeTessellationExtractor ******************/
		/**** md5 signature: 99b0722065c37d2ebe83652d7c58d139 ****/
		%feature("compactdefaultargs") CreateEdgeTessellationExtractor;
		%feature("autodoc", "Creates instance of tessellation extractor.

Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theDFace: IMeshData::IFaceHandle

Returns
-------
opencascade::handle<IMeshTools_CurveTessellator>
") CreateEdgeTessellationExtractor;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellationExtractor(const IMeshData::IEdgeHandle & theDEdge, const IMeshData::IFaceHandle & theDFace);

		/****************** CreateEdgeTessellator ******************/
		/**** md5 signature: c54c3d94cb5163c340c6d04455184934 ****/
		%feature("compactdefaultargs") CreateEdgeTessellator;
		%feature("autodoc", "Creates instance of free edge tessellator.

Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int,optional
	default value is 2

Returns
-------
opencascade::handle<IMeshTools_CurveTessellator>
") CreateEdgeTessellator;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellator(const IMeshData::IEdgeHandle & theDEdge, const IMeshTools_Parameters & theParameters, const Standard_Integer theMinPointsNb = 2);

		/****************** CreateEdgeTessellator ******************/
		/**** md5 signature: 1278d9934a8c73c14a0e219eab804270 ****/
		%feature("compactdefaultargs") CreateEdgeTessellator;
		%feature("autodoc", "Creates instance of edge tessellator.

Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theOrientation: TopAbs_Orientation
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int,optional
	default value is 2

Returns
-------
opencascade::handle<IMeshTools_CurveTessellator>
") CreateEdgeTessellator;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellator(const IMeshData::IEdgeHandle & theDEdge, const TopAbs_Orientation theOrientation, const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters, const Standard_Integer theMinPointsNb = 2);

		/****************** Tessellate2d ******************/
		/**** md5 signature: 07584604f6427ce52a0d4cc717031e44 ****/
		%feature("compactdefaultargs") Tessellate2d;
		%feature("autodoc", "Updates 2d discrete edge model using tessellation of 3d curve.

Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theUpdateEnds: bool

Returns
-------
void
") Tessellate2d;
		static void Tessellate2d(const IMeshData::IEdgeHandle & theDEdge, const Standard_Boolean theUpdateEnds);

		/****************** Tessellate3d ******************/
		/**** md5 signature: 2e020b9f6dbd64cfb83efca215597b2c ****/
		%feature("compactdefaultargs") Tessellate3d;
		%feature("autodoc", "Updates 3d discrete edge model using the given tessellation tool.

Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theTessellator: IMeshTools_CurveTessellator
theUpdateEnds: bool

Returns
-------
void
") Tessellate3d;
		static void Tessellate3d(const IMeshData::IEdgeHandle & theDEdge, const opencascade::handle<IMeshTools_CurveTessellator> & theTessellator, const Standard_Boolean theUpdateEnds);

};


%extend BRepMesh_EdgeDiscret {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepMesh_EdgeParameterProvider *
***************************************/
/*******************************************
* class BRepMesh_EdgeTessellationExtractor *
*******************************************/
class BRepMesh_EdgeTessellationExtractor : public IMeshTools_CurveTessellator {
	public:
		/****************** BRepMesh_EdgeTessellationExtractor ******************/
		/**** md5 signature: 05d1deb1d7983a1bc146c5070debf9bd ****/
		%feature("compactdefaultargs") BRepMesh_EdgeTessellationExtractor;
		%feature("autodoc", "Constructor.

Parameters
----------
theEdge: IMeshData::IEdgeHandle
theFace: IMeshData::IFaceHandle

Returns
-------
None
") BRepMesh_EdgeTessellationExtractor;
		 BRepMesh_EdgeTessellationExtractor(const IMeshData::IEdgeHandle & theEdge, const IMeshData::IFaceHandle & theFace);

		/****************** PointsNb ******************/
		/**** md5 signature: c7dec7b525c6ed3a148d8633ce567fe8 ****/
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "Returns number of tessellation points.

Returns
-------
int
") PointsNb;
		virtual Standard_Integer PointsNb();

		/****************** Value ******************/
		/**** md5 signature: 4110d8d1bb060691997a3dfc00ca0b94 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns parameters of solution with the given index. @param theindex index of tessellation point. @param theparameter parameters on pcurve corresponded to the solution. @param thepoint tessellation point. returns true in case of valid result, false elewhere.

Parameters
----------
theIndex: int
thePoint: gp_Pnt

Returns
-------
theParameter: float
") Value;
		virtual Standard_Boolean Value(const Standard_Integer theIndex, gp_Pnt & thePoint, Standard_Real &OutValue);

};


%extend BRepMesh_EdgeTessellationExtractor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepMesh_FaceChecker *
*****************************/
class BRepMesh_FaceChecker : public Standard_Transient {
	public:
typedef NCollection_Shared <NCollection_Vector <Segment>> Segments;
typedef NCollection_Shared <NCollection_Array1 <opencascade::handle <Segments>>> ArrayOfSegments;
		class Segment {};
		/****************** BRepMesh_FaceChecker ******************/
		/**** md5 signature: 5e1e1f82e3705e28ebff9dc29b27b5a6 ****/
		%feature("compactdefaultargs") BRepMesh_FaceChecker;
		%feature("autodoc", "Default constructor.

Parameters
----------
theFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Returns
-------
None
") BRepMesh_FaceChecker;
		 BRepMesh_FaceChecker(const IMeshData::IFaceHandle & theFace, const IMeshTools_Parameters & theParameters);

		/****************** Perform ******************/
		/**** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs check wires of the face for intersections. returns true if there is no intersection, false elsewhere.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

};


%make_alias(BRepMesh_FaceChecker)

%extend BRepMesh_FaceChecker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepMesh_FaceDiscret *
*****************************/
class BRepMesh_FaceDiscret : public IMeshTools_ModelAlgo {
	public:
		/****************** BRepMesh_FaceDiscret ******************/
		/**** md5 signature: 5eb1feec00b8e23febb0ac8f82432245 ****/
		%feature("compactdefaultargs") BRepMesh_FaceDiscret;
		%feature("autodoc", "Constructor.

Parameters
----------
theAlgoFactory: IMeshTools_MeshAlgoFactory

Returns
-------
None
") BRepMesh_FaceDiscret;
		 BRepMesh_FaceDiscret(const opencascade::handle<IMeshTools_MeshAlgoFactory> & theAlgoFactory);

};


%extend BRepMesh_FaceDiscret {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepMesh_GeomTool *
**************************/
class BRepMesh_GeomTool {
	public:
/* public enums */
enum IntFlag {
	NoIntersection = 0,
	Cross = 1,
	EndPointTouch = 2,
	PointOnSegment = 3,
	Glued = 4,
	Same = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IntFlag(IntEnum):
	NoIntersection = 0
	Cross = 1
	EndPointTouch = 2
	PointOnSegment = 3
	Glued = 4
	Same = 5
NoIntersection = IntFlag.NoIntersection
Cross = IntFlag.Cross
EndPointTouch = IntFlag.EndPointTouch
PointOnSegment = IntFlag.PointOnSegment
Glued = IntFlag.Glued
Same = IntFlag.Same
};
/* end python proxy for enums */

		/****************** BRepMesh_GeomTool ******************/
		/**** md5 signature: ec04b4c4c9e0ee7dd6affaf9f42c0597 ****/
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "Constructor. initiates discretization of the given geometric curve. @param thecurve curve to be discretized. @param thefirstparam first parameter of the curve. @param thelastparam last parameter of the curve. @param thelindeflection linear deflection. @param theangdeflection angular deflection. @param theminpointsnb minimum number of points to be produced.

Parameters
----------
theCurve: BRepAdaptor_Curve
theFirstParam: float
theLastParam: float
theLinDeflection: float
theAngDeflection: float
theMinPointsNb: int,optional
	default value is 2
theMinSize: float,optional
	default value is Precision::Confusion()

Returns
-------
None
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool(const BRepAdaptor_Curve & theCurve, const Standard_Real theFirstParam, const Standard_Real theLastParam, const Standard_Real theLinDeflection, const Standard_Real theAngDeflection, const Standard_Integer theMinPointsNb = 2, const Standard_Real theMinSize = Precision::Confusion());

		/****************** BRepMesh_GeomTool ******************/
		/**** md5 signature: d38bb75f11ee9f3b3aa475e4ac404495 ****/
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "Constructor. initiates discretization of geometric curve corresponding to iso curve of the given surface. @param thesurface surface the iso curve to be taken from. @param theisotype type of iso curve to be used, u or v. @param theparamiso parameter on the surface specifying the iso curve. @param thefirstparam first parameter of the curve. @param thelastparam last parameter of the curve. @param thelindeflection linear deflection. @param theangdeflection angular deflection. @param theminpointsnb minimum number of points to be produced.

Parameters
----------
theSurface: BRepAdaptor_Surface
theIsoType: GeomAbs_IsoType
theParamIso: float
theFirstParam: float
theLastParam: float
theLinDeflection: float
theAngDeflection: float
theMinPointsNb: int,optional
	default value is 2
theMinSize: float,optional
	default value is Precision::Confusion()

Returns
-------
None
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool(const opencascade::handle<BRepAdaptor_Surface> & theSurface, const GeomAbs_IsoType theIsoType, const Standard_Real theParamIso, const Standard_Real theFirstParam, const Standard_Real theLastParam, const Standard_Real theLinDeflection, const Standard_Real theAngDeflection, const Standard_Integer theMinPointsNb = 2, const Standard_Real theMinSize = Precision::Confusion());

		/****************** AddPoint ******************/
		/**** md5 signature: 23339736f9d509a41c0708ffbbc4a1c0 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds point to already calculated points (or replaces existing). @param thepoint point to be added. @param theparam parameter on the curve corresponding to the given point. @param theisreplace if true replaces existing point lying within parameteric tolerance of the given point. returns index of new added point or found with parametric tolerance.

Parameters
----------
thePoint: gp_Pnt
theParam: float
theIsReplace: bool,optional
	default value is Standard_True

Returns
-------
int
") AddPoint;
		Standard_Integer AddPoint(const gp_Pnt & thePoint, const Standard_Real theParam, const Standard_Boolean theIsReplace = Standard_True);

		/****************** CellsCount ******************/
		/**** md5 signature: fe52990183566da293fd7fa3dff8d5e3 ****/
		%feature("compactdefaultargs") CellsCount;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurface: Handle(Adaptor3d_Surface)
theVerticesNb: int
theDeflection: float
theRangeSplitter: BRepMesh_DefaultRangeSplitter *

Returns
-------
std::pair<int, int>
") CellsCount;
		static std::pair<Standard_Integer, Standard_Integer> CellsCount(const Handle(Adaptor3d_Surface) & theSurface, const Standard_Integer theVerticesNb, const Standard_Real theDeflection, const BRepMesh_DefaultRangeSplitter * theRangeSplitter);

		/****************** IntLinLin ******************/
		/**** md5 signature: e2953d0dde189ac0d48e66845c4ae790 ****/
		%feature("compactdefaultargs") IntLinLin;
		%feature("autodoc", "Checks intersection between two lines defined by two points. @param thestartpnt1 start point of first line. @param theendpnt1 end point of first line. @param thestartpnt2 start point of second line. @param theendpnt2 end point of second line. @param[out] theintpnt point of intersection. @param[out] theparamonsegment parameters of intersection point corresponding to first and second segment. returns status of intersection check.

Parameters
----------
theStartPnt1: gp_XY
theEndPnt1: gp_XY
theStartPnt2: gp_XY
theEndPnt2: gp_XY
theIntPnt: gp_XY
: float(theParamOnSegment)

Returns
-------
IntFlag
") IntLinLin;
		static IntFlag IntLinLin(const gp_XY & theStartPnt1, const gp_XY & theEndPnt1, const gp_XY & theStartPnt2, const gp_XY & theEndPnt2, gp_XY & theIntPnt, Standard_Real(&theParamOnSegment) [2]);

		/****************** IntSegSeg ******************/
		/**** md5 signature: 9efbfbad869a7589f6d4b211dd1b27a2 ****/
		%feature("compactdefaultargs") IntSegSeg;
		%feature("autodoc", "Checks intersection between the two segments. checks that intersection point lies within ranges of both segments. @param thestartpnt1 start point of first segment. @param theendpnt1 end point of first segment. @param thestartpnt2 start point of second segment. @param theendpnt2 end point of second segment. @param isconsiderendpointtouch if true endpointtouch status will be returned in case if segments are touching by end points, if false returns nointersection flag. @param isconsiderpointonsegment if true pointonsegment status will be returned in case if end point of one segment lies onto another one, if false returns nointersection flag. @param[out] theintpnt point of intersection. returns status of intersection check.

Parameters
----------
theStartPnt1: gp_XY
theEndPnt1: gp_XY
theStartPnt2: gp_XY
theEndPnt2: gp_XY
isConsiderEndPointTouch: bool
isConsiderPointOnSegment: bool
theIntPnt: gp_Pnt2d

Returns
-------
IntFlag
") IntSegSeg;
		static IntFlag IntSegSeg(const gp_XY & theStartPnt1, const gp_XY & theEndPnt1, const gp_XY & theStartPnt2, const gp_XY & theEndPnt2, const Standard_Boolean isConsiderEndPointTouch, const Standard_Boolean isConsiderPointOnSegment, gp_Pnt2d & theIntPnt);

		/****************** NbPoints ******************/
		/**** md5 signature: e92014a2f157c195ed77b7745c7eae3f ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns number of discretization points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Normal ******************/
		/**** md5 signature: cb0bf8ba7f44d8ded12ec50ce5f5d107 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "@name static api computes normal to the given surface at the specified position in parametric space. @param thesurface surface the normal should be found for. @param theparamu u parameter in parametric space of the surface. @param theparamv v parameter in parametric space of the surface. @param[out] thepoint 3d point corresponding to the given parameters. @param[out] thenormal normal vector at the point specified by the parameters. returns false if the normal can not be computed, true elsewhere.

Parameters
----------
theSurface: BRepAdaptor_Surface
theParamU: float
theParamV: float
thePoint: gp_Pnt
theNormal: gp_Dir

Returns
-------
bool
") Normal;
		static Standard_Boolean Normal(const opencascade::handle<BRepAdaptor_Surface> & theSurface, const Standard_Real theParamU, const Standard_Real theParamV, gp_Pnt & thePoint, gp_Dir & theNormal);

		/****************** SquareDeflectionOfSegment ******************/
		/**** md5 signature: bb1429876d80ee455b34cd6dd607d563 ****/
		%feature("compactdefaultargs") SquareDeflectionOfSegment;
		%feature("autodoc", "Compute deflection of the given segment.

Parameters
----------
theFirstPoint: gp_Pnt
theLastPoint: gp_Pnt
theMidPoint: gp_Pnt

Returns
-------
float
") SquareDeflectionOfSegment;
		static Standard_Real SquareDeflectionOfSegment(const gp_Pnt & theFirstPoint, const gp_Pnt & theLastPoint, const gp_Pnt & theMidPoint);

		/****************** Value ******************/
		/**** md5 signature: 92cb1b96fe286a153a6adfa7a6447e7e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Gets parameters of discretization point with the given index. @param theindex index of discretization point. @param theisoparam parameter on surface to be used as second coordinate of resulting 2d point. @param theparam[out] parameter of the point on the iso curve. @param thepoint[out] discretization point. @param theuv[out] discretization point in parametric space of the surface. returns true on success, false elsewhere.

Parameters
----------
theIndex: int
theIsoParam: float
thePoint: gp_Pnt
theUV: gp_Pnt2d

Returns
-------
theParam: float
") Value;
		Standard_Boolean Value(const Standard_Integer theIndex, const Standard_Real theIsoParam, Standard_Real &OutValue, gp_Pnt & thePoint, gp_Pnt2d & theUV);

		/****************** Value ******************/
		/**** md5 signature: fbc0396de3fa600b97894c7f57e3dffd ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Gets parameters of discretization point with the given index. @param theindex index of discretization point. @param thesurface surface the curve is lying onto. @param theparam[out] parameter of the point on the curve. @param thepoint[out] discretization point. @param theuv[out] discretization point in parametric space of the surface. returns true on success, false elsewhere.

Parameters
----------
theIndex: int
theSurface: BRepAdaptor_Surface
thePoint: gp_Pnt
theUV: gp_Pnt2d

Returns
-------
theParam: float
") Value;
		Standard_Boolean Value(const Standard_Integer theIndex, const opencascade::handle<BRepAdaptor_Surface> & theSurface, Standard_Real &OutValue, gp_Pnt & thePoint, gp_Pnt2d & theUV);

};


%extend BRepMesh_GeomTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepMesh_MeshAlgoFactory *
*********************************/
class BRepMesh_MeshAlgoFactory : public IMeshTools_MeshAlgoFactory {
	public:
		/****************** BRepMesh_MeshAlgoFactory ******************/
		/**** md5 signature: 7549d3b374f6b6d36de722de051c7f9d ****/
		%feature("compactdefaultargs") BRepMesh_MeshAlgoFactory;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_MeshAlgoFactory;
		 BRepMesh_MeshAlgoFactory();

		/****************** GetAlgo ******************/
		/**** md5 signature: b5f3831f9f5db3705d1be887bba92f22 ****/
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "Creates instance of meshing algorithm for the given type of surface.

Parameters
----------
theSurfaceType: GeomAbs_SurfaceType
theParameters: IMeshTools_Parameters

Returns
-------
opencascade::handle<IMeshTools_MeshAlgo>
") GetAlgo;
		virtual opencascade::handle<IMeshTools_MeshAlgo> GetAlgo(const GeomAbs_SurfaceType theSurfaceType, const IMeshTools_Parameters & theParameters);

};


%extend BRepMesh_MeshAlgoFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepMesh_MeshTool *
**************************/
class BRepMesh_MeshTool : public Standard_Transient {
	public:
		class NodeClassifier {};
		/****************** BRepMesh_MeshTool ******************/
		/**** md5 signature: abf7f04fd724790ff05678b98f579e57 ****/
		%feature("compactdefaultargs") BRepMesh_MeshTool;
		%feature("autodoc", "Constructor. initializes tool by the given data structure.

Parameters
----------
theStructure: BRepMesh_DataStructureOfDelaun

Returns
-------
None
") BRepMesh_MeshTool;
		 BRepMesh_MeshTool(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theStructure);

		/****************** AddAndLegalizeTriangle ******************/
		/**** md5 signature: 0ac46c0a145add63243db67bd9f3f0bc ****/
		%feature("compactdefaultargs") AddAndLegalizeTriangle;
		%feature("autodoc", "Adds new triangle with specified nodes to mesh. legalizes triangle in case if it violates circle criteria.

Parameters
----------
thePoint1: int
thePoint2: int
thePoint3: int

Returns
-------
None
") AddAndLegalizeTriangle;
		void AddAndLegalizeTriangle(const Standard_Integer thePoint1, const Standard_Integer thePoint2, const Standard_Integer thePoint3);

		/****************** AddLink ******************/
		/**** md5 signature: d24cd13523eaaf65a058f4a062b08f96 ****/
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "Adds new link to mesh. updates link index and link orientation parameters.

Parameters
----------
theFirstNode: int
theLastNode: int

Returns
-------
theLinkIndex: int
theLinkOri: bool
") AddLink;
		void AddLink(const Standard_Integer theFirstNode, const Standard_Integer theLastNode, Standard_Integer &OutValue, Standard_Boolean &OutValue);

		/****************** AddTriangle ******************/
		/**** md5 signature: 673ff11382e26742f4b619105414f585 ****/
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "Adds new triangle with specified nodes to mesh.

Parameters
----------
thePoint1: int
thePoint2: int
thePoint3: int
: int(theEdges)

Returns
-------
None
") AddTriangle;
		void AddTriangle(const Standard_Integer thePoint1, const Standard_Integer thePoint2, const Standard_Integer thePoint3, Standard_Integer(&theEdges) [3]);

		/****************** CleanFrontierLinks ******************/
		/**** md5 signature: 63fc3ce6394f9f579070f64eb2be550d ****/
		%feature("compactdefaultargs") CleanFrontierLinks;
		%feature("autodoc", "Cleans frontier links from triangles to the right.

Returns
-------
None
") CleanFrontierLinks;
		void CleanFrontierLinks();

		/****************** EraseFreeLinks ******************/
		/**** md5 signature: 9ab79c596458db6053095518f88e3455 ****/
		%feature("compactdefaultargs") EraseFreeLinks;
		%feature("autodoc", "Erases all links that have no elements connected to them.

Returns
-------
None
") EraseFreeLinks;
		void EraseFreeLinks();

		/****************** EraseFreeLinks ******************/
		/**** md5 signature: f67077e6548c65402e2c7e421b63e2cb ****/
		%feature("compactdefaultargs") EraseFreeLinks;
		%feature("autodoc", "Erases links from the specified map that have no elements connected to them.

Parameters
----------
theLinks: IMeshData::MapOfIntegerInteger

Returns
-------
None
") EraseFreeLinks;
		void EraseFreeLinks(const IMeshData::MapOfIntegerInteger & theLinks);

		/****************** EraseItemsConnectedTo ******************/
		/**** md5 signature: 9a384f9ea370b86a8ff45e9bd841eea8 ****/
		%feature("compactdefaultargs") EraseItemsConnectedTo;
		%feature("autodoc", "Erases all elements connected to the specified artificial node. in addition, erases the artificial node itself.

Parameters
----------
theNodeIndex: int

Returns
-------
None
") EraseItemsConnectedTo;
		void EraseItemsConnectedTo(const Standard_Integer theNodeIndex);

		/****************** EraseTriangle ******************/
		/**** md5 signature: 2bf76361d266b0cdd4f017b9c1ba88d4 ****/
		%feature("compactdefaultargs") EraseTriangle;
		%feature("autodoc", "Erases triangle with the given index and adds the free edges into the map. when an edge is suppressed more than one time it is destroyed.

Parameters
----------
theTriangleIndex: int
theLoopEdges: IMeshData::MapOfIntegerInteger

Returns
-------
None
") EraseTriangle;
		void EraseTriangle(const Standard_Integer theTriangleIndex, IMeshData::MapOfIntegerInteger & theLoopEdges);

		/****************** GetStructure ******************/
		/**** md5 signature: e795ea8cb85d33692d442ec73fdda3d7 ****/
		%feature("compactdefaultargs") GetStructure;
		%feature("autodoc", "Returns data structure manipulated by this tool.

Returns
-------
opencascade::handle<BRepMesh_DataStructureOfDelaun>
") GetStructure;
		const opencascade::handle<BRepMesh_DataStructureOfDelaun> & GetStructure();

		/****************** Legalize ******************/
		/**** md5 signature: 2963ec91475d45200900c9ae3a191f98 ****/
		%feature("compactdefaultargs") Legalize;
		%feature("autodoc", "Performs legalization of triangles connected to the specified link.

Parameters
----------
theLinkIndex: int

Returns
-------
None
") Legalize;
		void Legalize(const Standard_Integer theLinkIndex);

};


%make_alias(BRepMesh_MeshTool)

%extend BRepMesh_MeshTool {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def DumpTriangles(self):
		pass

	@methodnotwrapped
	def EraseTriangles(self):
		pass
	}
};

/******************************
* class BRepMesh_ModelBuilder *
******************************/
class BRepMesh_ModelBuilder : public IMeshTools_ModelBuilder {
	public:
		/****************** BRepMesh_ModelBuilder ******************/
		/**** md5 signature: e21163d4054202c03d83d9426b67fc24 ****/
		%feature("compactdefaultargs") BRepMesh_ModelBuilder;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_ModelBuilder;
		 BRepMesh_ModelBuilder();

};


%extend BRepMesh_ModelBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepMesh_ModelHealer *
*****************************/
class BRepMesh_ModelHealer : public IMeshTools_ModelAlgo {
	public:
		/****************** BRepMesh_ModelHealer ******************/
		/**** md5 signature: 948893bb90e26ca087bd4ad5180e7013 ****/
		%feature("compactdefaultargs") BRepMesh_ModelHealer;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_ModelHealer;
		 BRepMesh_ModelHealer();

};


%extend BRepMesh_ModelHealer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepMesh_ModelPostProcessor *
************************************/
class BRepMesh_ModelPostProcessor : public IMeshTools_ModelAlgo {
	public:
		/****************** BRepMesh_ModelPostProcessor ******************/
		/**** md5 signature: 220accc2449438695c2ea192fc8ed2eb ****/
		%feature("compactdefaultargs") BRepMesh_ModelPostProcessor;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_ModelPostProcessor;
		 BRepMesh_ModelPostProcessor();

};


%extend BRepMesh_ModelPostProcessor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepMesh_ModelPreProcessor *
***********************************/
class BRepMesh_ModelPreProcessor : public IMeshTools_ModelAlgo {
	public:
		/****************** BRepMesh_ModelPreProcessor ******************/
		/**** md5 signature: 033fde83a46641bf0c1cfc1161f23e39 ****/
		%feature("compactdefaultargs") BRepMesh_ModelPreProcessor;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_ModelPreProcessor;
		 BRepMesh_ModelPreProcessor();

};


%extend BRepMesh_ModelPreProcessor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepMesh_NodeInsertionMeshAlgo *
***************************************/
/******************************
* class BRepMesh_OrientedEdge *
******************************/
class BRepMesh_OrientedEdge {
	public:
		/****************** BRepMesh_OrientedEdge ******************/
		/**** md5 signature: cfa44193269da7bf9e9672e7353cd685 ****/
		%feature("compactdefaultargs") BRepMesh_OrientedEdge;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BRepMesh_OrientedEdge;
		 BRepMesh_OrientedEdge();

		/****************** BRepMesh_OrientedEdge ******************/
		/**** md5 signature: 4ec24ec192d27fa335b14e08787c3c06 ****/
		%feature("compactdefaultargs") BRepMesh_OrientedEdge;
		%feature("autodoc", "Constructs a link between two vertices.

Parameters
----------
theFirstNode: int
theLastNode: int

Returns
-------
None
") BRepMesh_OrientedEdge;
		 BRepMesh_OrientedEdge(const Standard_Integer theFirstNode, const Standard_Integer theLastNode);

		/****************** FirstNode ******************/
		/**** md5 signature: 5e5a409216676a4f7e0861e57fd4aebf ****/
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "Returns index of first node of the link.

Returns
-------
int
") FirstNode;
		Standard_Integer FirstNode();

		/****************** HashCode ******************/
		/**** md5 signature: 72f7d6afdc2f4b2c860a8e39d683afaf ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for this oriented edge, in the range [1, theupperbound] @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theUpperBound: int

Returns
-------
int
") HashCode;
		Standard_Integer HashCode(const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** IsEqual ******************/
		/**** md5 signature: 1a1e5601f44f2e973a1227eedc8ed008 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks this and other edge for equality. @param theother edge to be checked against this one. returns true if edges have the same orientation, false if not.

Parameters
----------
theOther: BRepMesh_OrientedEdge

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const BRepMesh_OrientedEdge & theOther);

		/****************** LastNode ******************/
		/**** md5 signature: 862c96d90a2f2e5a03235f217e321b6a ****/
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "Returns index of last node of the link.

Returns
-------
int
") LastNode;
		Standard_Integer LastNode();


            %extend{
                bool __eq_wrapper__(const BRepMesh_OrientedEdge other) {
                if (*self==other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __eq__(self, right):
                try:
                    return self.__eq_wrapper__(right)
                except:
                    return False
            }
};


%extend BRepMesh_OrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepMesh_PairOfIndex *
*****************************/
class BRepMesh_PairOfIndex {
	public:
		/****************** BRepMesh_PairOfIndex ******************/
		/**** md5 signature: 6097b08360d507b0b25a96e63ec387fc ****/
		%feature("compactdefaultargs") BRepMesh_PairOfIndex;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BRepMesh_PairOfIndex;
		 BRepMesh_PairOfIndex();

		/****************** Append ******************/
		/**** md5 signature: 6d1b3d282e85f1e28613e9ddd5c1b92a ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends index to the pair.

Parameters
----------
theIndex: int

Returns
-------
None
") Append;
		void Append(const Standard_Integer theIndex);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears indices.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Extent ******************/
		/**** md5 signature: 19453f219e568f9c5109a0fd06459e95 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Returns number of initialized indices.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** FirstIndex ******************/
		/**** md5 signature: dd170f153aee261c6137ad51fb804301 ****/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "Returns first index of pair.

Returns
-------
int
") FirstIndex;
		Standard_Integer FirstIndex();

		/****************** Index ******************/
		/**** md5 signature: be92a83d0312a29299b83fe0df2a8e6a ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns index corresponding to the given position in the pair. @param thepairpos position of index in the pair (1 or 2).

Parameters
----------
thePairPos: int

Returns
-------
int
") Index;
		Standard_Integer Index(const Standard_Integer thePairPos);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns is pair is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** LastIndex ******************/
		/**** md5 signature: ac91d431c1bc97c7f705173d9a480bea ****/
		%feature("compactdefaultargs") LastIndex;
		%feature("autodoc", "Returns last index of pair.

Returns
-------
int
") LastIndex;
		Standard_Integer LastIndex();

		/****************** Prepend ******************/
		/**** md5 signature: 6a5240977116a74c5fb3353b10c6424a ****/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "Prepends index to the pair.

Parameters
----------
theIndex: int

Returns
-------
None
") Prepend;
		void Prepend(const Standard_Integer theIndex);

		/****************** RemoveIndex ******************/
		/**** md5 signature: 895ffb3475d21aba5f9bd97bb9d7062f ****/
		%feature("compactdefaultargs") RemoveIndex;
		%feature("autodoc", "Remove index from the given position. @param thepairpos position of index in the pair (1 or 2).

Parameters
----------
thePairPos: int

Returns
-------
None
") RemoveIndex;
		void RemoveIndex(const Standard_Integer thePairPos);

		/****************** SetIndex ******************/
		/**** md5 signature: 4340ed7d7bec46bb9359a9523e5758d2 ****/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Sets index corresponding to the given position in the pair. @param thepairpos position of index in the pair (1 or 2). @param theindex index to be stored.

Parameters
----------
thePairPos: int
theIndex: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer thePairPos, const Standard_Integer theIndex);

};


%extend BRepMesh_PairOfIndex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class BRepMesh_SelectorOfDataStructureOfDelaun *
*************************************************/
class BRepMesh_SelectorOfDataStructureOfDelaun : public Standard_Transient {
	public:
		/****************** BRepMesh_SelectorOfDataStructureOfDelaun ******************/
		/**** md5 signature: ae219e3399acd48f3ab1cb6666248e37 ****/
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun();

		/****************** BRepMesh_SelectorOfDataStructureOfDelaun ******************/
		/**** md5 signature: 48c378a21324a2a2e3f9741f9bb572cb ****/
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "Constructor. initializes selector by the mesh.

Parameters
----------
theMesh: BRepMesh_DataStructureOfDelaun

Returns
-------
None
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theMesh);

		/****************** AddNeighbours ******************/
		/**** md5 signature: 612e38bbb1676e77f251fed4962bc3c0 ****/
		%feature("compactdefaultargs") AddNeighbours;
		%feature("autodoc", "Adds a level of neighbours by edge the selector.

Returns
-------
None
") AddNeighbours;
		void AddNeighbours();

		/****************** Elements ******************/
		/**** md5 signature: f292154361efe8cff70b7224e0dd92bc ****/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Returns selected elements.

Returns
-------
IMeshData::MapOfInteger
") Elements;
		const IMeshData::MapOfInteger & Elements();

		/****************** FrontierLinks ******************/
		/**** md5 signature: e9fc3775f2eaeb5f9f3fb50a11ef1575 ****/
		%feature("compactdefaultargs") FrontierLinks;
		%feature("autodoc", "Gives the list of incices of frontier links.

Returns
-------
IMeshData::MapOfInteger
") FrontierLinks;
		const IMeshData::MapOfInteger & FrontierLinks();

		/****************** Initialize ******************/
		/**** md5 signature: c1c8bd53787e0b316ccb49ba7dddc083 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes selector by the mesh.

Parameters
----------
theMesh: BRepMesh_DataStructureOfDelaun

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theMesh);

		/****************** Links ******************/
		/**** md5 signature: 444dc2c6e495f4e680bd1e7ea076ff0b ****/
		%feature("compactdefaultargs") Links;
		%feature("autodoc", "Returns selected links.

Returns
-------
IMeshData::MapOfInteger
") Links;
		const IMeshData::MapOfInteger & Links();

		/****************** NeighboursByEdgeOf ******************/
		/**** md5 signature: 703ce4b8dca000f5c5b72a118362bf0f ****/
		%feature("compactdefaultargs") NeighboursByEdgeOf;
		%feature("autodoc", "Selects all neighboring elements by links of the given element.

Parameters
----------
theElement: BRepMesh_Triangle

Returns
-------
None
") NeighboursByEdgeOf;
		void NeighboursByEdgeOf(const BRepMesh_Triangle & theElement);

		/****************** NeighboursOf ******************/
		/**** md5 signature: e712f7145e0999578d5e386408e4eda2 ****/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "Selects all neighboring elements of the given node.

Parameters
----------
theNode: BRepMesh_Vertex

Returns
-------
None
") NeighboursOf;
		void NeighboursOf(const BRepMesh_Vertex & theNode);

		/****************** NeighboursOf ******************/
		/**** md5 signature: 255f43d123986364bff66ede6dd8a3a5 ****/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "Selects all neighboring elements of the given link.

Parameters
----------
theLink: BRepMesh_Edge

Returns
-------
None
") NeighboursOf;
		void NeighboursOf(const BRepMesh_Edge & theLink);

		/****************** NeighboursOf ******************/
		/**** md5 signature: 851532ee376e16c26bffc7adba34cc4c ****/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "Selects all neighboring elements of the given element.

Parameters
----------
theElement: BRepMesh_Triangle

Returns
-------
None
") NeighboursOf;
		void NeighboursOf(const BRepMesh_Triangle & theElement);

		/****************** NeighboursOf ******************/
		/**** md5 signature: eda74ad1f0361cb0f21c76c0370a0cc5 ****/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "Adds a level of neighbours by edge to the selector.

Parameters
----------
&: BRepMesh_SelectorOfDataStructureOfDelaun

Returns
-------
None
") NeighboursOf;
		void NeighboursOf(const BRepMesh_SelectorOfDataStructureOfDelaun &);

		/****************** NeighboursOfElement ******************/
		/**** md5 signature: 27e6f82fa64a584058fb9702fde37b8a ****/
		%feature("compactdefaultargs") NeighboursOfElement;
		%feature("autodoc", "Selects all neighboring elements by nodes of the given element.

Parameters
----------
theElementIndex: int

Returns
-------
None
") NeighboursOfElement;
		void NeighboursOfElement(const Standard_Integer theElementIndex);

		/****************** NeighboursOfLink ******************/
		/**** md5 signature: d999fd58ec77e60ca0529edd278a9268 ****/
		%feature("compactdefaultargs") NeighboursOfLink;
		%feature("autodoc", "Selects all neighboring elements of link with the given index.

Parameters
----------
theLinkIndex: int

Returns
-------
None
") NeighboursOfLink;
		void NeighboursOfLink(const Standard_Integer theLinkIndex);

		/****************** NeighboursOfNode ******************/
		/**** md5 signature: df612c0d8f76e199098b2e68e6002413 ****/
		%feature("compactdefaultargs") NeighboursOfNode;
		%feature("autodoc", "Selects all neighboring elements of node with the given index.

Parameters
----------
theNodeIndex: int

Returns
-------
None
") NeighboursOfNode;
		void NeighboursOfNode(const Standard_Integer theNodeIndex);

		/****************** Nodes ******************/
		/**** md5 signature: cc6f002fa70de151d7f5a1decc5ae05a ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns selected nodes.

Returns
-------
IMeshData::MapOfInteger
") Nodes;
		const IMeshData::MapOfInteger & Nodes();

};


%make_alias(BRepMesh_SelectorOfDataStructureOfDelaun)

%extend BRepMesh_SelectorOfDataStructureOfDelaun {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepMesh_ShapeTool *
***************************/
class BRepMesh_ShapeTool : public Standard_Transient {
	public:
		/****************** AddInFace ******************/
		/**** md5 signature: 198ec20231e3f0017b5211964797c170 ****/
		%feature("compactdefaultargs") AddInFace;
		%feature("autodoc", "Stores the given triangulation into the given face. @param theface face to be updated by triangulation. @param thetriangulation triangulation to be stored into the face.

Parameters
----------
theFace: TopoDS_Face
theTriangulation: Poly_Triangulation

Returns
-------
void
") AddInFace;
		static void AddInFace(const TopoDS_Face & theFace, opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** BoxMaxDimension ******************/
		/**** md5 signature: 7a8580d106df4eb195ec4234b808b3e3 ****/
		%feature("compactdefaultargs") BoxMaxDimension;
		%feature("autodoc", "Gets the maximum dimension of the given bounding box. if the given bounding box is void leaves the resulting value unchanged. @param thebox bounding box to be processed. @param themaxdimension maximum dimension of the given box.

Parameters
----------
theBox: Bnd_Box

Returns
-------
theMaxDimension: float
") BoxMaxDimension;
		static void BoxMaxDimension(const Bnd_Box & theBox, Standard_Real &OutValue);

		/****************** CheckAndUpdateFlags ******************/
		/**** md5 signature: 3ee821bb2711b7bd7a20479acafb6e16 ****/
		%feature("compactdefaultargs") CheckAndUpdateFlags;
		%feature("autodoc", "Checks same parameter, same range and degenerativity attributes using geometrical data of the given edge and updates edge model by computed parameters in case of worst case - it can drop flags same parameter and same range to false but never to true if it is already set to false. in contrary, it can also drop degenerated flag to true, but never to false if it is already set to true.

Parameters
----------
theEdge: IMeshData::IEdgeHandle
thePCurve: IMeshData::IPCurveHandle

Returns
-------
void
") CheckAndUpdateFlags;
		static void CheckAndUpdateFlags(const IMeshData::IEdgeHandle & theEdge, const IMeshData::IPCurveHandle & thePCurve);

		/****************** MaxFaceTolerance ******************/
		/**** md5 signature: b54ecfd1939ae9305b99a30d7dc05008 ****/
		%feature("compactdefaultargs") MaxFaceTolerance;
		%feature("autodoc", "Returns maximum tolerance of the given face. considers tolerances of edges and vertices contained in the given face.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
float
") MaxFaceTolerance;
		static Standard_Real MaxFaceTolerance(const TopoDS_Face & theFace);

		/****************** NullifyEdge ******************/
		/**** md5 signature: b05e15fa2e892634fc8e8532f2f87e58 ****/
		%feature("compactdefaultargs") NullifyEdge;
		%feature("autodoc", "Nullifies polygon on triangulation stored in the edge. @param theedge edge to be updated by null polygon. @param thetriangulation triangulation the given edge is associated to. @param thelocation face location.

Parameters
----------
theEdge: TopoDS_Edge
theTriangulation: Handle(Poly_Triangulation)
theLocation: TopLoc_Location

Returns
-------
void
") NullifyEdge;
		static void NullifyEdge(const TopoDS_Edge & theEdge, const Handle(Poly_Triangulation) & theTriangulation, const TopLoc_Location & theLocation);

		/****************** NullifyEdge ******************/
		/**** md5 signature: a40c1f6240ceb504d322009c0248d48a ****/
		%feature("compactdefaultargs") NullifyEdge;
		%feature("autodoc", "Nullifies 3d polygon stored in the edge. @param theedge edge to be updated by null polygon. @param thelocation face location.

Parameters
----------
theEdge: TopoDS_Edge
theLocation: TopLoc_Location

Returns
-------
void
") NullifyEdge;
		static void NullifyEdge(const TopoDS_Edge & theEdge, const TopLoc_Location & theLocation);

		/****************** NullifyFace ******************/
		/**** md5 signature: a54d800748c7d813530610836c345d65 ****/
		%feature("compactdefaultargs") NullifyFace;
		%feature("autodoc", "Nullifies triangulation stored in the face. @param theface face to be updated by null triangulation.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
void
") NullifyFace;
		static void NullifyFace(const TopoDS_Face & theFace);

		/****************** Range ******************/
		/**** md5 signature: ba29b5964a00fcbb857a8ba4cd82cf5a ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Gets the parametric range of the given edge on the given face.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
thePCurve: Handle(Geom2d_Curve)
isConsiderOrientation: bool,optional
	default value is Standard_False

Returns
-------
theFirstParam: float
theLastParam: float
") Range;
		static Standard_Boolean Range(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, Handle(Geom2d_Curve) & thePCurve, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean isConsiderOrientation = Standard_False);

		/****************** Range ******************/
		/**** md5 signature: 4f2c0c58738d79d22379878c484ed3af ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Gets the 3d range of the given edge.

Parameters
----------
theEdge: TopoDS_Edge
theCurve: Handle(Geom_Curve)
isConsiderOrientation: bool,optional
	default value is Standard_False

Returns
-------
theFirstParam: float
theLastParam: float
") Range;
		static Standard_Boolean Range(const TopoDS_Edge & theEdge, Handle(Geom_Curve) & theCurve, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean isConsiderOrientation = Standard_False);

		/****************** UVPoints ******************/
		/**** md5 signature: 1252140d03973dd7dff854c69c805cd8 ****/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "Gets the strict uv locations of the extremities of the edge using pcurve.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theFirstPoint2d: gp_Pnt2d
theLastPoint2d: gp_Pnt2d
isConsiderOrientation: bool,optional
	default value is Standard_False

Returns
-------
bool
") UVPoints;
		static Standard_Boolean UVPoints(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, gp_Pnt2d & theFirstPoint2d, gp_Pnt2d & theLastPoint2d, const Standard_Boolean isConsiderOrientation = Standard_False);

		/****************** UpdateEdge ******************/
		/**** md5 signature: d215b477d4979261f29a8084a2b9d5cd ****/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Updates the given edge by the given tessellated representation. @param theedge edge to be updated. @param thepolygon tessellated representation of the edge to be stored. @param thetriangulation triangulation the given edge is associated to. @param thelocation face location.

Parameters
----------
theEdge: TopoDS_Edge
thePolygon: Handle(Poly_PolygonOnTriangulation)
theTriangulation: Handle(Poly_Triangulation)
theLocation: TopLoc_Location

Returns
-------
void
") UpdateEdge;
		static void UpdateEdge(const TopoDS_Edge & theEdge, const Handle(Poly_PolygonOnTriangulation) & thePolygon, const Handle(Poly_Triangulation) & theTriangulation, const TopLoc_Location & theLocation);

		/****************** UpdateEdge ******************/
		/**** md5 signature: 7d40445fe5ea272ec9d3f2c1b9ae4074 ****/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Updates the given edge by the given tessellated representation. @param theedge edge to be updated. @param thepolygon tessellated representation of the edge to be stored.

Parameters
----------
theEdge: TopoDS_Edge
thePolygon: Poly_Polygon3D

Returns
-------
void
") UpdateEdge;
		static void UpdateEdge(const TopoDS_Edge & theEdge, const opencascade::handle<Poly_Polygon3D> & thePolygon);

		/****************** UpdateEdge ******************/
		/**** md5 signature: 68252ad4636fc7ab6104d38f6a659701 ****/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Updates the given seam edge by the given tessellated representations. @param theedge edge to be updated. @param thepolygon1 tessellated representation corresponding to forward direction of the seam edge. @param thepolygon2 tessellated representation corresponding to reversed direction of the seam edge. @param thetriangulation triangulation the given edge is associated to. @param thelocation face location.

Parameters
----------
theEdge: TopoDS_Edge
thePolygon1: Handle(Poly_PolygonOnTriangulation)
thePolygon2: Handle(Poly_PolygonOnTriangulation)
theTriangulation: Handle(Poly_Triangulation)
theLocation: TopLoc_Location

Returns
-------
void
") UpdateEdge;
		static void UpdateEdge(const TopoDS_Edge & theEdge, const Handle(Poly_PolygonOnTriangulation) & thePolygon1, const Handle(Poly_PolygonOnTriangulation) & thePolygon2, const Handle(Poly_Triangulation) & theTriangulation, const TopLoc_Location & theLocation);

		/****************** UseLocation ******************/
		/**** md5 signature: 1d483b4a9b5ac80702e3ffccb5ce462e ****/
		%feature("compactdefaultargs") UseLocation;
		%feature("autodoc", "Applies location to the given point and return result. @param thepnt point to be transformed. @param theloc location to be applied.

Parameters
----------
thePnt: gp_Pnt
theLoc: TopLoc_Location

Returns
-------
gp_Pnt
") UseLocation;
		static gp_Pnt UseLocation(const gp_Pnt & thePnt, const TopLoc_Location & theLoc);

};


%make_alias(BRepMesh_ShapeTool)

%extend BRepMesh_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepMesh_ShapeVisitor *
******************************/
class BRepMesh_ShapeVisitor : public IMeshTools_ShapeVisitor {
	public:
		/****************** BRepMesh_ShapeVisitor ******************/
		/**** md5 signature: 50f3cb8177633f4a40e8a4e91969cbfb ****/
		%feature("compactdefaultargs") BRepMesh_ShapeVisitor;
		%feature("autodoc", "Constructor.

Parameters
----------
theModel: Handle(IMeshData_Model)

Returns
-------
None
") BRepMesh_ShapeVisitor;
		 BRepMesh_ShapeVisitor(const Handle(IMeshData_Model) & theModel);

		/****************** Visit ******************/
		/**** md5 signature: ebcbeb83d8be062abed52fb56f5b893f ****/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "Handles topods_face object.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
None
") Visit;
		virtual void Visit(const TopoDS_Face & theFace);

		/****************** Visit ******************/
		/**** md5 signature: cf5c08dbf617f19b91434ef5c2f3cecf ****/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "Handles topods_edge object.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
None
") Visit;
		virtual void Visit(const TopoDS_Edge & theEdge);

};


%extend BRepMesh_ShapeVisitor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepMesh_Triangle *
**************************/
class BRepMesh_Triangle {
	public:
		int myEdges[3];
		bool myOrientations[3];
		BRepMesh_DegreeOfFreedom myMovability;
		/****************** BRepMesh_Triangle ******************/
		/**** md5 signature: 4263569a51b9e153bc1f4edcacd0d9a7 ****/
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BRepMesh_Triangle;
		 BRepMesh_Triangle();

		/****************** BRepMesh_Triangle ******************/
		/**** md5 signature: cbddbeee06fde838e21869caf41b5dc5 ****/
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "Constructor. @param theedges array of edges of triangle. @param theorientations array of edge's orientations. @param themovability movability of triangle.

Parameters
----------
Standard_Integer(&theEdges): 
Standard_Boolean(&theOrientations): 
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") BRepMesh_Triangle;
		 BRepMesh_Triangle(const Standard_Integer(&theEdges)[3], const Standard_Boolean(&theOrientations)[3], const BRepMesh_DegreeOfFreedom theMovability);

		/****************** Edges ******************/
		/**** md5 signature: 4d9a1eb522cb4c5f438c181c4cc333a2 ****/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Gets edges with orientations composing the triangle. @param[out] theedges array edges are stored to. @param[out] theorientations array orientations are stored to.

Parameters
----------
: int(theEdges)
: bool(theOrientations)

Returns
-------
None
") Edges;
		void Edges(Standard_Integer(&theEdges) [3], Standard_Boolean(&theOrientations) [3]);

		/****************** HashCode ******************/
		/**** md5 signature: 72f7d6afdc2f4b2c860a8e39d683afaf ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for this triangle, in the range [1, theupperbound] @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theUpperBound: int

Returns
-------
int
") HashCode;
		Standard_Integer HashCode(const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** Initialize ******************/
		/**** md5 signature: ee51ba187d1dbaa84273b1e2cd325f9a ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the triangle by the given parameters. @param theedges array of edges of triangle. @param theorientations array of edge's orientations. @param themovability movability of triangle.

Parameters
----------
Standard_Integer(&theEdges): 
Standard_Boolean(&theOrientations): 
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer(&theEdges)[3], const Standard_Boolean(&theOrientations)[3], const BRepMesh_DegreeOfFreedom theMovability);

		/****************** IsEqual ******************/
		/**** md5 signature: 475c8cafbb251ef77ebaff68a5aa0c19 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks for equality with another triangle. @param theother triangle to be checked against this one. returns true if equal, false if not.

Parameters
----------
theOther: BRepMesh_Triangle

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const BRepMesh_Triangle & theOther);

		/****************** Movability ******************/
		/**** md5 signature: 6205d0abeb2bc94f438d25da760d9f0b ****/
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "Returns movability of the triangle.

Returns
-------
BRepMesh_DegreeOfFreedom
") Movability;
		BRepMesh_DegreeOfFreedom Movability();

		/****************** SetMovability ******************/
		/**** md5 signature: 6a061b38c31857ee1d61d08ac2b621a5 ****/
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "Sets movability of the triangle.

Parameters
----------
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") SetMovability;
		void SetMovability(const BRepMesh_DegreeOfFreedom theMovability);


            %extend{
                bool __eq_wrapper__(const BRepMesh_Triangle other) {
                if (*self==other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __eq__(self, right):
                try:
                    return self.__eq_wrapper__(right)
                except:
                    return False
            }
};


%extend BRepMesh_Triangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepMesh_Triangulator *
******************************/
class BRepMesh_Triangulator {
	public:
		/****************** BRepMesh_Triangulator ******************/
		/**** md5 signature: acefc005fa22073e6e50e1f3d9e880a2 ****/
		%feature("compactdefaultargs") BRepMesh_Triangulator;
		%feature("autodoc", "Constructor. initialized tool by the given parameters.

Parameters
----------
theXYZs: NCollection_Vector<gp_XYZ>
theWires: NCollection_List<TColStd_SequenceOfInteger>
theNorm: gp_Dir

Returns
-------
None
") BRepMesh_Triangulator;
		 BRepMesh_Triangulator(const NCollection_Vector<gp_XYZ> & theXYZs, const NCollection_List<TColStd_SequenceOfInteger> & theWires, const gp_Dir & theNorm);

		/****************** Perform ******************/
		/**** md5 signature: c533ed821316fe1176fce590cecfd805 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs triangulation of source wires and stores triangles the output list.

Parameters
----------
thePolyTriangles: NCollection_List<Poly_Triangle>

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(NCollection_List<Poly_Triangle> & thePolyTriangles);

		/****************** SetMessenger ******************/
		/**** md5 signature: 64d8b30fe8bddfb6111cbf1a0e26e584 ****/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "Set messenger for output information without this message::defaultmessenger() will be used.

Parameters
----------
theMess: Message_Messenger

Returns
-------
None
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & theMess);

		/****************** ToPolyTriangulation ******************/
		/**** md5 signature: f294791c79f89b5907206362dfc74a77 ****/
		%feature("compactdefaultargs") ToPolyTriangulation;
		%feature("autodoc", "Performs conversion of the given list of triangles to poly_triangulation.

Parameters
----------
theNodes: TColgp_Array1OfPnt
thePolyTriangles: NCollection_List<Poly_Triangle>

Returns
-------
opencascade::handle<Poly_Triangulation>
") ToPolyTriangulation;
		static opencascade::handle<Poly_Triangulation> ToPolyTriangulation(const TColgp_Array1OfPnt & theNodes, const NCollection_List<Poly_Triangle> & thePolyTriangles);

};


%extend BRepMesh_Triangulator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepMesh_Vertex *
************************/
class BRepMesh_Vertex {
	public:
		/****************** BRepMesh_Vertex ******************/
		/**** md5 signature: bc83d1490327509889d04f8f155ccf1e ****/
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BRepMesh_Vertex;
		 BRepMesh_Vertex();

		/****************** BRepMesh_Vertex ******************/
		/**** md5 signature: ebcd0a55a388a1da8ff8135977c78e51 ****/
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "Creates vertex associated with point in 3d space. @param theuv position of vertex in parametric space. @param thelocation3d index of 3d point to be associated with vertex. @param themovability movability of the vertex.

Parameters
----------
theUV: gp_XY
theLocation3d: int
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") BRepMesh_Vertex;
		 BRepMesh_Vertex(const gp_XY & theUV, const Standard_Integer theLocation3d, const BRepMesh_DegreeOfFreedom theMovability);

		/****************** BRepMesh_Vertex ******************/
		/**** md5 signature: 9ce636f570700ce9f9335bb16de8b27d ****/
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "Creates vertex without association with point in 3d space. @param theu u position of vertex in parametric space. @param thev v position of vertex in parametric space. @param themovability movability of the vertex.

Parameters
----------
theU: float
theV: float
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") BRepMesh_Vertex;
		 BRepMesh_Vertex(const Standard_Real theU, const Standard_Real theV, const BRepMesh_DegreeOfFreedom theMovability);

		/****************** ChangeCoord ******************/
		/**** md5 signature: f799b091563773cd52b21654e211a935 ****/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Returns position of the vertex in parametric space for modification.

Returns
-------
gp_XY
") ChangeCoord;
		gp_XY ChangeCoord();

		/****************** Coord ******************/
		/**** md5 signature: 55c3583d2b85a3d85724dfd062f17fa4 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns position of the vertex in parametric space.

Returns
-------
gp_XY
") Coord;
		const gp_XY Coord();

		/****************** HashCode ******************/
		/**** md5 signature: 72f7d6afdc2f4b2c860a8e39d683afaf ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for this vertex, in the range [1, theupperbound] @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theUpperBound: int

Returns
-------
int
") HashCode;
		Standard_Integer HashCode(const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** Initialize ******************/
		/**** md5 signature: 50c4b34339c1d3c34b891aeeeeec544f ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes vertex associated with point in 3d space. @param theuv position of vertex in parametric space. @param thelocation3d index of 3d point to be associated with vertex. @param themovability movability of the vertex.

Parameters
----------
theUV: gp_XY
theLocation3d: int
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") Initialize;
		void Initialize(const gp_XY & theUV, const Standard_Integer theLocation3d, const BRepMesh_DegreeOfFreedom theMovability);

		/****************** IsEqual ******************/
		/**** md5 signature: 6ba7c96c1bc66ed1c4cfb395d24095c8 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks for equality with another vertex. @param theother vertex to be checked against this one. returns true if equal, false if not.

Parameters
----------
theOther: BRepMesh_Vertex

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const BRepMesh_Vertex & theOther);

		/****************** Location3d ******************/
		/**** md5 signature: 82faaa1833ea67e80110e3e864a252d9 ****/
		%feature("compactdefaultargs") Location3d;
		%feature("autodoc", "Returns index of 3d point associated with the vertex.

Returns
-------
int
") Location3d;
		Standard_Integer Location3d();

		/****************** Movability ******************/
		/**** md5 signature: 6205d0abeb2bc94f438d25da760d9f0b ****/
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "Returns movability of the vertex.

Returns
-------
BRepMesh_DegreeOfFreedom
") Movability;
		BRepMesh_DegreeOfFreedom Movability();

		/****************** SetMovability ******************/
		/**** md5 signature: 6a061b38c31857ee1d61d08ac2b621a5 ****/
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "Sets movability of the vertex.

Parameters
----------
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") SetMovability;
		void SetMovability(const BRepMesh_DegreeOfFreedom theMovability);


            %extend{
                bool __eq_wrapper__(const BRepMesh_Vertex other) {
                if (*self==other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __eq__(self, right):
                try:
                    return self.__eq_wrapper__(right)
                except:
                    return False
            }
};


%extend BRepMesh_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepMesh_VertexInspector *
*********************************/
class BRepMesh_VertexInspector : public NCollection_CellFilter_InspectorXY {
	public:
typedef Standard_Integer Target;
		/****************** BRepMesh_VertexInspector ******************/
		/**** md5 signature: 08f4123104eb925eca3f59afd5cd72d4 ****/
		%feature("compactdefaultargs") BRepMesh_VertexInspector;
		%feature("autodoc", "Constructor. @param theallocator memory allocator to be used by internal collections.

Parameters
----------
theAllocator: NCollection_IncAllocator

Returns
-------
None
") BRepMesh_VertexInspector;
		 BRepMesh_VertexInspector(const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****************** Add ******************/
		/**** md5 signature: f816def4550502906f62b11fcad10037 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Registers the given vertex. @param thevertex vertex to be registered.

Parameters
----------
theVertex: BRepMesh_Vertex

Returns
-------
int
") Add;
		Standard_Integer Add(const BRepMesh_Vertex & theVertex);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear inspector's internal data structures.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Delete ******************/
		/**** md5 signature: e64b6eae227c09ac378172a70bde8a50 ****/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "Deletes vertex with the given index. @param theindex index of vertex to be removed.

Parameters
----------
theIndex: int

Returns
-------
None
") Delete;
		void Delete(const Standard_Integer theIndex);

		/****************** GetCoincidentPoint ******************/
		/**** md5 signature: 9f635bc58f8d3443d64e425e92d1d95a ****/
		%feature("compactdefaultargs") GetCoincidentPoint;
		%feature("autodoc", "Returns index of point coinciding with regerence one.

Returns
-------
int
") GetCoincidentPoint;
		Standard_Integer GetCoincidentPoint();

		/****************** GetListOfDelPoints ******************/
		/**** md5 signature: 9164fa1026581bd683bb92f8b029f619 ****/
		%feature("compactdefaultargs") GetListOfDelPoints;
		%feature("autodoc", "Returns list with indexes of vertices that have movability attribute equal to brepmesh_deleted and can be replaced with another node.

Returns
-------
IMeshData::ListOfInteger
") GetListOfDelPoints;
		const IMeshData::ListOfInteger & GetListOfDelPoints();

		/****************** GetVertex ******************/
		/**** md5 signature: 1a4c7186869a78a1e0d446255dea8b76 ****/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "Returns vertex with the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Vertex
") GetVertex;
		BRepMesh_Vertex & GetVertex(Standard_Integer theIndex);

		/****************** Inspect ******************/
		/**** md5 signature: 5c5862e6d70f17de4a117a71b7550cc2 ****/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "Performs inspection of a point with the given index. @param thetargetindex index of a circle to be checked. returns status of the check.

Parameters
----------
theTargetIndex: int

Returns
-------
NCollection_CellFilter_Action
") Inspect;
		NCollection_CellFilter_Action Inspect(const Standard_Integer theTargetIndex);

		/****************** IsEqual ******************/
		/**** md5 signature: dd38878b9463f31ea5c2351dd2f590e3 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks indices for equlity.

Parameters
----------
theIndex: int
theTargetIndex: int

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const Standard_Integer theIndex, const Standard_Integer theTargetIndex);

		/****************** NbVertices ******************/
		/**** md5 signature: fdb7d948cb5ffe9c7da397697d4125c9 ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Returns number of registered vertices.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** SetPoint ******************/
		/**** md5 signature: b521bfcebdca3f9d4da8c66d87603bc7 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Set reference point to be checked.

Parameters
----------
thePoint: gp_XY

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_XY & thePoint);

		/****************** SetTolerance ******************/
		/**** md5 signature: 2df6ca87a12fc10518568e45d2ce38db ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the tolerance to be used for identification of coincident vertices equal for both dimensions.

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** SetTolerance ******************/
		/**** md5 signature: a955a7d6f39e831632ff59e80f51118b ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the tolerance to be used for identification of coincident vertices. @param thetolerancex tolerance for x dimension. @param thetolerancey tolerance for y dimension.

Parameters
----------
theToleranceX: float
theToleranceY: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theToleranceX, const Standard_Real theToleranceY);

};


%extend BRepMesh_VertexInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepMesh_VertexTool *
****************************/
class BRepMesh_VertexTool : public Standard_Transient {
	public:
		/****************** BRepMesh_VertexTool ******************/
		/**** md5 signature: c1d46446841c2a0b024a242364fe45b0 ****/
		%feature("compactdefaultargs") BRepMesh_VertexTool;
		%feature("autodoc", "Constructor. @param theallocator memory allocator to be used by internal collections.

Parameters
----------
theAllocator: NCollection_IncAllocator

Returns
-------
None
") BRepMesh_VertexTool;
		 BRepMesh_VertexTool(const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****************** Add ******************/
		/**** md5 signature: 4bb380d0d4ce81ef097ec263b902da2f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds vertex with empty data to the tool. @param thevertex node to be added to the mesh. @param isforceadd adds the given node to structure without checking on coincidence with other nodes. returns index of the node in the structure.

Parameters
----------
theVertex: BRepMesh_Vertex
isForceAdd: bool

Returns
-------
int
") Add;
		Standard_Integer Add(const BRepMesh_Vertex & theVertex, const Standard_Boolean isForceAdd);

		/****************** DeleteVertex ******************/
		/**** md5 signature: e0b876f76bdf9c448f455affb633c26b ****/
		%feature("compactdefaultargs") DeleteVertex;
		%feature("autodoc", "Deletes vertex with the given index from the tool.

Parameters
----------
theIndex: int

Returns
-------
None
") DeleteVertex;
		void DeleteVertex(const Standard_Integer theIndex);

		/****************** Extent ******************/
		/**** md5 signature: 19453f219e568f9c5109a0fd06459e95 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Returns a number of vertices.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** FindIndex ******************/
		/**** md5 signature: 60932e657cd5c0a3a285a9c67b5f84f0 ****/
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "Returns index of the given vertex.

Parameters
----------
theVertex: BRepMesh_Vertex

Returns
-------
int
") FindIndex;
		Standard_Integer FindIndex(const BRepMesh_Vertex & theVertex);

		/****************** FindKey ******************/
		/**** md5 signature: 50cfc9a2c0f6d9bdc4c2fccc76309be1 ****/
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "Returns vertex by the given index.

Parameters
----------
theIndex: int

Returns
-------
BRepMesh_Vertex
") FindKey;
		const BRepMesh_Vertex & FindKey(const Standard_Integer theIndex);

		/****************** GetListOfDelNodes ******************/
		/**** md5 signature: 2052380f0276c30f6b6945ebb21ced96 ****/
		%feature("compactdefaultargs") GetListOfDelNodes;
		%feature("autodoc", "Returns the list with indexes of vertices that have movability attribute equal to brepmesh_deleted and can be replaced with another node.

Returns
-------
IMeshData::ListOfInteger
") GetListOfDelNodes;
		const IMeshData::ListOfInteger & GetListOfDelNodes();

		/****************** GetTolerance ******************/
		/**** md5 signature: ef1a1d705d43f87bb8eeb1b1b048c3c3 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Gets the tolerance to be used for identification of coincident vertices. @param thetolerancex tolerance for x dimension. @param thetolerancey tolerance for y dimension.

Parameters
----------

Returns
-------
theToleranceX: float
theToleranceY: float
") GetTolerance;
		void GetTolerance(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true when the map contains no keys. .

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** RemoveLast ******************/
		/**** md5 signature: a5b2be74b40472d88621f86eb0fc42c1 ****/
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "Remove last node from the structure.

Returns
-------
None
") RemoveLast;
		void RemoveLast();

		/****************** SetCellSize ******************/
		/**** md5 signature: 415a8b91be50170d2af0ba27dd19bc6c ****/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "Sets new size of cell for cellfilter equal in both directions.

Parameters
----------
theSize: float

Returns
-------
None
") SetCellSize;
		void SetCellSize(const Standard_Real theSize);

		/****************** SetCellSize ******************/
		/**** md5 signature: 28e49b1c038f46447a07e18f6d52b3eb ****/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "Sets new size of cell for cellfilter. @param thesizex size for x dimension. @param thesizey size for y dimension.

Parameters
----------
theSizeX: float
theSizeY: float

Returns
-------
None
") SetCellSize;
		void SetCellSize(const Standard_Real theSizeX, const Standard_Real theSizeY);

		/****************** SetTolerance ******************/
		/**** md5 signature: 2df6ca87a12fc10518568e45d2ce38db ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the tolerance to be used for identification of coincident vertices equal for both dimensions.

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** SetTolerance ******************/
		/**** md5 signature: a955a7d6f39e831632ff59e80f51118b ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the tolerance to be used for identification of coincident vertices. @param thetolerancex tolerance for x dimension. @param thetolerancey tolerance for y dimension.

Parameters
----------
theToleranceX: float
theToleranceY: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theToleranceX, const Standard_Real theToleranceY);


        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
		/****************** Substitute ******************/
		/**** md5 signature: 02ac53c87b5a046c4ee9a0b10ac44d20 ****/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "Substitutes vertex with the given by the given vertex with attributes. @param theindex index of vertex to be substituted. @param thevertex replacement vertex.

Parameters
----------
theIndex: int
theVertex: BRepMesh_Vertex

Returns
-------
None
") Substitute;
		void Substitute(const Standard_Integer theIndex, const BRepMesh_Vertex & theVertex);

};


%make_alias(BRepMesh_VertexTool)

%extend BRepMesh_VertexTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BRepMesh_ConstrainedBaseMeshAlgo *
*****************************************/
/***************************************
* class BRepMesh_CylinderRangeSplitter *
***************************************/
class BRepMesh_CylinderRangeSplitter : public BRepMesh_DefaultRangeSplitter {
	public:
		/****************** BRepMesh_CylinderRangeSplitter ******************/
		/**** md5 signature: 4b65430ead1a18f07eb61bf52d9793f6 ****/
		%feature("compactdefaultargs") BRepMesh_CylinderRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_CylinderRangeSplitter;
		 BRepMesh_CylinderRangeSplitter();

		/****************** Reset ******************/
		/**** md5 signature: aa395f2a8deaeb8df261ef127aeaa147 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Resets this splitter. must be called before first use.

Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Returns
-------
None
") Reset;
		virtual void Reset(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

};


%extend BRepMesh_CylinderRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class BRepMesh_DelaunayDeflectionControlMeshAlgo *
***************************************************/
/***********************************************
* class BRepMesh_DelaunayNodeInsertionMeshAlgo *
***********************************************/
/**********************
* class BRepMesh_Edge *
**********************/
class BRepMesh_Edge : public BRepMesh_OrientedEdge {
	public:
		/****************** BRepMesh_Edge ******************/
		/**** md5 signature: 9dab0ad64083c2468b24e4e0c4b4d9dd ****/
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BRepMesh_Edge;
		 BRepMesh_Edge();

		/****************** BRepMesh_Edge ******************/
		/**** md5 signature: d281845402b06d742466c13f5b7500d9 ****/
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "Constructs a link between two vertices.

Parameters
----------
theFirstNode: int
theLastNode: int
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") BRepMesh_Edge;
		 BRepMesh_Edge(const Standard_Integer theFirstNode, const Standard_Integer theLastNode, const BRepMesh_DegreeOfFreedom theMovability);

		/****************** IsEqual ******************/
		/**** md5 signature: 837c7d9cc3c326697db7581cc5f5fb40 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks for equality with another edge. @param theother edge to be checked against this one. returns true if equal, false if not.

Parameters
----------
theOther: BRepMesh_Edge

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const BRepMesh_Edge & theOther);

		/****************** IsSameOrientation ******************/
		/**** md5 signature: 89af0bb4a997d047c8d1bc9628fad9dd ****/
		%feature("compactdefaultargs") IsSameOrientation;
		%feature("autodoc", "Checks if the given edge and this one have the same orientation. @param theother edge to be checked against this one. eturn true if edges have the same orientation, false if not.

Parameters
----------
theOther: BRepMesh_Edge

Returns
-------
bool
") IsSameOrientation;
		Standard_Boolean IsSameOrientation(const BRepMesh_Edge & theOther);

		/****************** Movability ******************/
		/**** md5 signature: 6205d0abeb2bc94f438d25da760d9f0b ****/
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "Returns movability flag of the link.

Returns
-------
BRepMesh_DegreeOfFreedom
") Movability;
		BRepMesh_DegreeOfFreedom Movability();

		/****************** SetMovability ******************/
		/**** md5 signature: 6a061b38c31857ee1d61d08ac2b621a5 ****/
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "Sets movability flag of the link. @param themovability flag to be set.

Parameters
----------
theMovability: BRepMesh_DegreeOfFreedom

Returns
-------
None
") SetMovability;
		void SetMovability(const BRepMesh_DegreeOfFreedom theMovability);


            %extend{
                bool __eq_wrapper__(const BRepMesh_Edge other) {
                if (*self==other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __eq__(self, right):
                try:
                    return self.__eq_wrapper__(right)
                except:
                    return False
            }
};


%extend BRepMesh_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepMesh_IncrementalMesh *
*********************************/
class BRepMesh_IncrementalMesh : public BRepMesh_DiscretRoot {
	public:
		/****************** BRepMesh_IncrementalMesh ******************/
		/**** md5 signature: 423409375831fd5b22ca5152c321696e ****/
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "@name mesher api default constructor.

Returns
-------
None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh();

		/****************** BRepMesh_IncrementalMesh ******************/
		/**** md5 signature: d4b51aeef0e1f61b5938e57b03c660b3 ****/
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "Constructor. automatically calls method perform. @param theshape shape to be meshed. @param thelindeflection linear deflection. @param isrelative if true deflection used for discretization of each edge will be <thelindeflection> * <size of edge>. deflection used for the faces will be the maximum deflection of their edges. @param theangdeflection angular deflection. @param isinparallel if true shape will be meshed in parallel.

Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: float
isRelative: bool,optional
	default value is Standard_False
theAngDeflection: float,optional
	default value is 0.5
isInParallel: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh(const TopoDS_Shape & theShape, const Standard_Real theLinDeflection, const Standard_Boolean isRelative = Standard_False, const Standard_Real theAngDeflection = 0.5, const Standard_Boolean isInParallel = Standard_False);

		/****************** BRepMesh_IncrementalMesh ******************/
		/**** md5 signature: e5fd880315ea23df47b710ecb652dcf7 ****/
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "Constructor. automatically calls method perform. @param theshape shape to be meshed. @param theparameters - parameters of meshing.

Parameters
----------
theShape: TopoDS_Shape
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh(const TopoDS_Shape & theShape, const IMeshTools_Parameters & theParameters, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** ChangeParameters ******************/
		/**** md5 signature: 7d357d2d707ea7c6e435ce7944cdbaeb ****/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Returns modifiable meshing parameters.

Returns
-------
IMeshTools_Parameters
") ChangeParameters;
		IMeshTools_Parameters & ChangeParameters();

		/****************** Discret ******************/
		/**** md5 signature: 48d8518acd93b0a2608de45caeb5d913 ****/
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "@name plugin api plugin interface for the mesh factories. initializes meshing algorithm with the given parameters. @param theshape shape to be meshed. @param thelindeflection linear deflection. @param theangdeflection angular deflection. @param[out] thealgo pointer to initialized algorithm.

Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: float
theAngDeflection: float
theAlgo: BRepMesh_DiscretRoot *

Returns
-------
int
") Discret;
		static Standard_Integer Discret(const TopoDS_Shape & theShape, const Standard_Real theLinDeflection, const Standard_Real theAngDeflection, BRepMesh_DiscretRoot * & theAlgo);

		/****************** GetStatusFlags ******************/
		/**** md5 signature: e398513992ccf52274fdd58a2054886e ****/
		%feature("compactdefaultargs") GetStatusFlags;
		%feature("autodoc", "Returns accumulated status flags faced during meshing.

Returns
-------
int
") GetStatusFlags;
		Standard_Integer GetStatusFlags();

		/****************** IsModified ******************/
		/**** md5 signature: 95dc34039aea53686862c95397ed3e81 ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Returns modified flag.

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified();

		/****************** IsParallelDefault ******************/
		/**** md5 signature: 9f90f914ac4f7b5622f3986fe4a4ede3 ****/
		%feature("compactdefaultargs") IsParallelDefault;
		%feature("autodoc", "Returns multi-threading usage flag set by default in discret() static method (thus applied only to mesh factories).

Returns
-------
bool
") IsParallelDefault;
		static Standard_Boolean IsParallelDefault();

		/****************** Parameters ******************/
		/**** md5 signature: 80bd17a03936a7214968019ed0fbca90 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "@name accessing to parameters. returns meshing parameters.

Returns
-------
IMeshTools_Parameters
") Parameters;
		const IMeshTools_Parameters & Parameters();

		/****************** Perform ******************/
		/**** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs meshing of the shape.

Parameters
----------
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Perform ******************/
		/**** md5 signature: 80d0d01860d5254f4b440d16b1acdcaf ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs meshing using custom context;.

Parameters
----------
theContext: IMeshTools_Context
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<IMeshTools_Context> & theContext, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** SetParallelDefault ******************/
		/**** md5 signature: ecfba5f6dedb3ffdd55b2640e270ebdb ****/
		%feature("compactdefaultargs") SetParallelDefault;
		%feature("autodoc", "Setup multi-threading usage flag set by default in discret() static method (thus applied only to mesh factories).

Parameters
----------
isInParallel: bool

Returns
-------
void
") SetParallelDefault;
		static void SetParallelDefault(const Standard_Boolean isInParallel);

};


%make_alias(BRepMesh_IncrementalMesh)

%extend BRepMesh_IncrementalMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepMesh_SphereRangeSplitter *
*************************************/
class BRepMesh_SphereRangeSplitter : public BRepMesh_DefaultRangeSplitter {
	public:
		/****************** BRepMesh_SphereRangeSplitter ******************/
		/**** md5 signature: 87cfa646eba8434e78ad57e06fec3877 ****/
		%feature("compactdefaultargs") BRepMesh_SphereRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_SphereRangeSplitter;
		 BRepMesh_SphereRangeSplitter();

};


%extend BRepMesh_SphereRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepMesh_UVParamRangeSplitter *
**************************************/
class BRepMesh_UVParamRangeSplitter : public BRepMesh_DefaultRangeSplitter {
	public:
		/****************** BRepMesh_UVParamRangeSplitter ******************/
		/**** md5 signature: aa39c1dd0b586ad08fa2faee27946497 ****/
		%feature("compactdefaultargs") BRepMesh_UVParamRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_UVParamRangeSplitter;
		 BRepMesh_UVParamRangeSplitter();

		/****************** GetParametersU ******************/
		/**** md5 signature: 5ee87ca295b7089622b34597ba0fa7dc ****/
		%feature("compactdefaultargs") GetParametersU;
		%feature("autodoc", "Returns u parameters.

Returns
-------
IMeshData::IMapOfReal
") GetParametersU;
		const IMeshData::IMapOfReal & GetParametersU();

		/****************** GetParametersU ******************/
		/**** md5 signature: 6ffbc2e9c1bbf06f60cc0560c30ac041 ****/
		%feature("compactdefaultargs") GetParametersU;
		%feature("autodoc", "Returns u parameters.

Returns
-------
IMeshData::IMapOfReal
") GetParametersU;
		IMeshData::IMapOfReal & GetParametersU();

		/****************** GetParametersV ******************/
		/**** md5 signature: 307ff0c2c9d7f6c020220dd1bb3fafcb ****/
		%feature("compactdefaultargs") GetParametersV;
		%feature("autodoc", "Returns v parameters.

Returns
-------
IMeshData::IMapOfReal
") GetParametersV;
		const IMeshData::IMapOfReal & GetParametersV();

		/****************** GetParametersV ******************/
		/**** md5 signature: da5da90265c614d65bf736490d481963 ****/
		%feature("compactdefaultargs") GetParametersV;
		%feature("autodoc", "Returns v parameters.

Returns
-------
IMeshData::IMapOfReal
") GetParametersV;
		IMeshData::IMapOfReal & GetParametersV();

		/****************** Reset ******************/
		/**** md5 signature: 4e9461d13bccb12249cf7fc75170d1a6 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Resets this splitter.

Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Returns
-------
None
") Reset;
		virtual void Reset(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

};


%extend BRepMesh_UVParamRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepMesh_CustomBaseMeshAlgo *
************************************/
%nodefaultctor BRepMesh_CustomBaseMeshAlgo;
class BRepMesh_CustomBaseMeshAlgo : public BRepMesh_ConstrainedBaseMeshAlgo {
	public:
};


%extend BRepMesh_CustomBaseMeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepMesh_DelaunayBaseMeshAlgo *
**************************************/
class BRepMesh_DelaunayBaseMeshAlgo : public BRepMesh_ConstrainedBaseMeshAlgo {
	public:
		/****************** BRepMesh_DelaunayBaseMeshAlgo ******************/
		/**** md5 signature: 97c6d3100758038d31c815f1082e8034 ****/
		%feature("compactdefaultargs") BRepMesh_DelaunayBaseMeshAlgo;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_DelaunayBaseMeshAlgo;
		 BRepMesh_DelaunayBaseMeshAlgo();

};


%extend BRepMesh_DelaunayBaseMeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepMesh_NURBSRangeSplitter *
************************************/
class BRepMesh_NURBSRangeSplitter : public BRepMesh_UVParamRangeSplitter {
	public:
		/****************** BRepMesh_NURBSRangeSplitter ******************/
		/**** md5 signature: dd965f02fffcb07e0c24e70588fcd511 ****/
		%feature("compactdefaultargs") BRepMesh_NURBSRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_NURBSRangeSplitter;
		 BRepMesh_NURBSRangeSplitter();

		/****************** AdjustRange ******************/
		/**** md5 signature: c094c053316b0e2e1a84ba1d968cecee ****/
		%feature("compactdefaultargs") AdjustRange;
		%feature("autodoc", "Updates discrete range of surface according to its geometric range.

Returns
-------
None
") AdjustRange;
		virtual void AdjustRange();

};


%extend BRepMesh_NURBSRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepMesh_TorusRangeSplitter *
************************************/
class BRepMesh_TorusRangeSplitter : public BRepMesh_UVParamRangeSplitter {
	public:
		/****************** BRepMesh_TorusRangeSplitter ******************/
		/**** md5 signature: 6d8b6c55817e30ebe786ea5e4218b2a5 ****/
		%feature("compactdefaultargs") BRepMesh_TorusRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_TorusRangeSplitter;
		 BRepMesh_TorusRangeSplitter();

		/****************** AddPoint ******************/
		/**** md5 signature: e522468f1a359a4578ca51a7b27bd0e5 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Registers border point.

Parameters
----------
thePoint: gp_Pnt2d

Returns
-------
None
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint);

};


%extend BRepMesh_TorusRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class BRepMesh_BoundaryParamsRangeSplitter *
*********************************************/
class BRepMesh_BoundaryParamsRangeSplitter : public BRepMesh_NURBSRangeSplitter {
	public:
		/****************** BRepMesh_BoundaryParamsRangeSplitter ******************/
		/**** md5 signature: d6bdcdb002fbb8b2b9d893b2ba111ff7 ****/
		%feature("compactdefaultargs") BRepMesh_BoundaryParamsRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_BoundaryParamsRangeSplitter;
		 BRepMesh_BoundaryParamsRangeSplitter();

		/****************** AddPoint ******************/
		/**** md5 signature: 6d02802acf31247d3e34a9fd4dfdf153 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Registers border point.

Parameters
----------
thePoint: gp_Pnt2d

Returns
-------
None
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint);

};


%extend BRepMesh_BoundaryParamsRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepMesh_DelabellaBaseMeshAlgo *
***************************************/
class BRepMesh_DelabellaBaseMeshAlgo : public BRepMesh_CustomBaseMeshAlgo {
	public:
		/****************** BRepMesh_DelabellaBaseMeshAlgo ******************/
		/**** md5 signature: b41dc635f954c50092b5b7a76bf71647 ****/
		%feature("compactdefaultargs") BRepMesh_DelabellaBaseMeshAlgo;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_DelabellaBaseMeshAlgo;
		 BRepMesh_DelabellaBaseMeshAlgo();

};


%extend BRepMesh_DelabellaBaseMeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepMesh_ExtrusionRangeSplitter *
****************************************/
class BRepMesh_ExtrusionRangeSplitter : public BRepMesh_NURBSRangeSplitter {
	public:
		/****************** BRepMesh_ExtrusionRangeSplitter ******************/
		/**** md5 signature: d07f4ec89669b0f89c1b66fc1e06d3ae ****/
		%feature("compactdefaultargs") BRepMesh_ExtrusionRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_ExtrusionRangeSplitter;
		 BRepMesh_ExtrusionRangeSplitter();

};


%extend BRepMesh_ExtrusionRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepMesh_UndefinedRangeSplitter *
****************************************/
class BRepMesh_UndefinedRangeSplitter : public BRepMesh_NURBSRangeSplitter {
	public:
		/****************** BRepMesh_UndefinedRangeSplitter ******************/
		/**** md5 signature: 8f04bf79f8ca9eff32045bf37a6720ba ****/
		%feature("compactdefaultargs") BRepMesh_UndefinedRangeSplitter;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepMesh_UndefinedRangeSplitter;
		 BRepMesh_UndefinedRangeSplitter();

};


%extend BRepMesh_UndefinedRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepMesh_EdgeParameterProvider:
	pass

@classnotwrapped
class BRepMesh_CustomDelaunayBaseMeshAlgo:
	pass

@classnotwrapped
class BRepMesh_NodeInsertionMeshAlgo:
	pass

@classnotwrapped
class BRepMesh_ConstrainedBaseMeshAlgo:
	pass

@classnotwrapped
class BRepMesh_DelaunayDeflectionControlMeshAlgo:
	pass

@classnotwrapped
class BRepMesh_DelaunayNodeInsertionMeshAlgo:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
Parameters=OCC.Core.IMeshTools.IMeshTools_Parameters
}
