/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepmesh.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
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
#include<Adaptor3d_module.hxx>
#include<Poly_module.hxx>
#include<Bnd_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<IMeshData_module.hxx>
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
%import Adaptor3d.i
%import Poly.i
%import Bnd.i
%import TopLoc.i
%import Geom2d.i
%import Geom.i
%import IMeshData.i
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
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepMesh_BaseMeshAlgo)
%wrap_handle(BRepMesh_Classifier)
%wrap_handle(BRepMesh_Context)
%wrap_handle(BRepMesh_CurveTessellator)
%wrap_handle(BRepMesh_DataStructureOfDelaun)
%wrap_handle(BRepMesh_Deflection)
%wrap_handle(BRepMesh_DelabellaMeshAlgoFactory)
%wrap_handle(BRepMesh_DiscretAlgoFactory)
%wrap_handle(BRepMesh_DiscretRoot)
%wrap_handle(BRepMesh_EdgeDiscret)
%wrap_handle(BRepMesh_FaceChecker)
%wrap_handle(BRepMesh_FaceDiscret)
%wrap_handle(BRepMesh_MeshAlgoFactory)
%wrap_handle(BRepMesh_MeshTool)
%wrap_handle(BRepMesh_ModelBuilder)
%wrap_handle(BRepMesh_ModelHealer)
%wrap_handle(BRepMesh_ModelPostProcessor)
%wrap_handle(BRepMesh_ModelPreProcessor)
%wrap_handle(BRepMesh_SelectorOfDataStructureOfDelaun)
%wrap_handle(BRepMesh_ShapeTool)
%wrap_handle(BRepMesh_ShapeVisitor)
%wrap_handle(BRepMesh_VertexTool)
%wrap_handle(BRepMesh_IncrementalMesh)
%wrap_handle(BRepMesh_IncrementalMeshFactory)
%wrap_handle(BRepMesh_DelaunayBaseMeshAlgo)
%wrap_handle(BRepMesh_DelabellaBaseMeshAlgo)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class BRepMesh_BaseMeshAlgo *
******************************/
%nodefaultctor BRepMesh_BaseMeshAlgo;
class BRepMesh_BaseMeshAlgo : public IMeshTools_MeshAlgo {
	public:
typedef NCollection_Shared<NCollection_DynamicArray<gp_Pnt>> VectorOfPnt;
		/****** BRepMesh_BaseMeshAlgo::Perform ******/
		/****** md5 signature: a8d5e9a9a4e2a82eb235898db8b8c964 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs processing of the given face.
") Perform;
		void Perform(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(BRepMesh_BaseMeshAlgo)

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
		/****** BRepMesh_Circle::BRepMesh_Circle ******/
		/****** md5 signature: 351446427e4f3cd2ee3d37f31f7510db ******/
		%feature("compactdefaultargs") BRepMesh_Circle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_Circle;
		 BRepMesh_Circle();

		/****** BRepMesh_Circle::BRepMesh_Circle ******/
		/****** md5 signature: ad182fbcc847b97deccdbcc81003aa6a ******/
		%feature("compactdefaultargs") BRepMesh_Circle;
		%feature("autodoc", "
Parameters
----------
theLocation: gp_XY
theRadius: double

Return
-------
None

Description
-----------
Constructor. 
Parameter theLocation location of a circle. 
Parameter theRadius radius of a circle.
") BRepMesh_Circle;
		 BRepMesh_Circle(const gp_XY & theLocation, const double theRadius);

		/****** BRepMesh_Circle::Location ******/
		/****** md5 signature: 2ecc9f07f1d8eda4bb4073a2c1f35c81 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns location of a circle.
") Location;
		const gp_XY Location();

		/****** BRepMesh_Circle::Radius ******/
		/****** md5 signature: db702c34fab9ce5d6ca4b3f00bc8f0b6 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns radius of a circle.
") Radius;
		const double & Radius();

		/****** BRepMesh_Circle::SetLocation ******/
		/****** md5 signature: 9327d7a19f0eeac7a91ff9bb889d6b3f ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLocation: gp_XY

Return
-------
None

Description
-----------
Sets location of a circle. 
Parameter theLocation location of a circle.
") SetLocation;
		void SetLocation(const gp_XY & theLocation);

		/****** BRepMesh_Circle::SetRadius ******/
		/****** md5 signature: 33acdaa90253f5b439514ff8a38f6451 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: double

Return
-------
None

Description
-----------
Sets radius of a circle. 
Parameter theRadius radius of a circle.
") SetRadius;
		void SetRadius(const double theRadius);

};


%extend BRepMesh_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepMesh_CircleInspector *
*********************************/
class BRepMesh_CircleInspector {
	public:
typedef gp_XY Point;
typedef int Target;
		/****** BRepMesh_CircleInspector::BRepMesh_CircleInspector ******/
		/****** md5 signature: 59c4581bbb3f6f31b83002687a5fa473 ******/
		%feature("compactdefaultargs") BRepMesh_CircleInspector;
		%feature("autodoc", "
Parameters
----------
theTolerance: double
theReservedSize: int
theAllocator: NCollection_IncAllocator

Return
-------
None

Description
-----------
Constructor. 
Parameter theTolerance tolerance to be used for identification of shot circles. 
Parameter theReservedSize size to be reserved for vector of circles. 
Parameter theAllocator memory allocator to be used by internal collections.
") BRepMesh_CircleInspector;
		 BRepMesh_CircleInspector(const double theTolerance, const int theReservedSize, const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****** BRepMesh_CircleInspector::Bind ******/
		/****** md5 signature: ef83e159497e19601bc6f8ad12ecad6a ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theCircle: BRepMesh_Circle

Return
-------
None

Description
-----------
Adds the circle to vector of circles at the given position. 
Parameter theIndex position of circle in the vector. 
Parameter theCircle circle to be added.
") Bind;
		void Bind(const int theIndex, const BRepMesh_Circle & theCircle);

		/****** BRepMesh_CircleInspector::Circle ******/
		/****** md5 signature: 7dd1c40fd1f62b13f9dc0370b4519992 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Circle

Description
-----------
Returns circle with the given index. 
Parameter theIndex index of circle. 
Return: circle with the given index.
") Circle;
		BRepMesh_Circle & Circle(const int theIndex);

		/****** BRepMesh_CircleInspector::Circles ******/
		/****** md5 signature: 5715a9c41d841e4058a32bbf582cd2f3 ******/
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "Return
-------
IMeshData::VectorOfCircle

Description
-----------
Resutns vector of registered circles.
") Circles;
		const IMeshData::VectorOfCircle & Circles();

		/****** BRepMesh_CircleInspector::Coord ******/
		/****** md5 signature: 5eba5f8729bea7ab978c1279517b0fd3 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
i: int
thePnt: Point

Return
-------
double

Description
-----------
No available documentation.
") Coord;
		static double Coord(int i, const Point & thePnt);

		/****** BRepMesh_CircleInspector::GetShotCircles ******/
		/****** md5 signature: c1409009f8ad619775420c881c945c8f ******/
		%feature("compactdefaultargs") GetShotCircles;
		%feature("autodoc", "Return
-------
IMeshData::ListOfInteger

Description
-----------
Returns list of circles shot by the reference point.
") GetShotCircles;
		IMeshData::ListOfInteger & GetShotCircles();

		/****** BRepMesh_CircleInspector::Inspect ******/
		/****** md5 signature: a949a67ecb5a34a9ae8bf14fe47901b3 ******/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "
Parameters
----------
theTargetIndex: int

Return
-------
NCollection_CellFilter_Action

Description
-----------
Performs inspection of a circle with the given index. 
Parameter theTargetIndex index of a circle to be checked. 
Return: status of the check.
") Inspect;
		NCollection_CellFilter_Action Inspect(const int theTargetIndex);

		/****** BRepMesh_CircleInspector::IsEqual ******/
		/****** md5 signature: a72cd5cdf256628a847fe84b7fdf8a16 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theTargetIndex: int

Return
-------
bool

Description
-----------
Checks indices for equality.
") IsEqual;
		static bool IsEqual(const int theIndex, const int theTargetIndex);

		/****** BRepMesh_CircleInspector::SetPoint ******/
		/****** md5 signature: b521bfcebdca3f9d4da8c66d87603bc7 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_XY

Return
-------
None

Description
-----------
Set reference point to be checked. 
Parameter thePoint bullet point.
") SetPoint;
		void SetPoint(const gp_XY & thePoint);

		/****** BRepMesh_CircleInspector::Shift ******/
		/****** md5 signature: a5c275ed1417a8e4b122622e7231a266 ******/
		%feature("compactdefaultargs") Shift;
		%feature("autodoc", "
Parameters
----------
thePnt: Point
theTol: double

Return
-------
Point

Description
-----------
No available documentation.
") Shift;
		static Point Shift(const Point & thePnt, double theTol);

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
		/****** BRepMesh_CircleTool::BRepMesh_CircleTool ******/
		/****** md5 signature: cd4fc4f8a4dbaf9bbda62ee6ed26b484 ******/
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_IncAllocator

Return
-------
None

Description
-----------
Constructor. 
Parameter theAllocator memory allocator to be used by internal structures.
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool(const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****** BRepMesh_CircleTool::BRepMesh_CircleTool ******/
		/****** md5 signature: 6d56735e75a0a09fe9ca4f06266d7b52 ******/
		%feature("compactdefaultargs") BRepMesh_CircleTool;
		%feature("autodoc", "
Parameters
----------
theReservedSize: int
theAllocator: NCollection_IncAllocator

Return
-------
None

Description
-----------
Constructor. 
Parameter theReservedSize size to be reserved for vector of circles. 
Parameter theAllocator memory allocator to be used by internal structures.
") BRepMesh_CircleTool;
		 BRepMesh_CircleTool(const int theReservedSize, const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****** BRepMesh_CircleTool::Bind ******/
		/****** md5 signature: bebc9974ae26182bf2c501fea51693b6 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theCircle: gp_Circ2d

Return
-------
None

Description
-----------
Binds the circle to the tool. 
Parameter theIndex index a circle should be bound with. 
Parameter theCircle circle to be bound.
") Bind;
		void Bind(const int theIndex, const gp_Circ2d & theCircle);

		/****** BRepMesh_CircleTool::Bind ******/
		/****** md5 signature: 4b517266d68b85fab74c773fe1455031 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePoint1: gp_XY
thePoint2: gp_XY
thePoint3: gp_XY

Return
-------
bool

Description
-----------
Computes circle on three points and bind it to the tool. 
Parameter theIndex index a circle should be bound with. 
Parameter thePoint1 first point. 
Parameter thePoint2 second point. 
Parameter thePoint3 third point. 
Return: False in case of impossibility to build a circle on the given points, True elsewhere.
") Bind;
		bool Bind(const int theIndex, const gp_XY & thePoint1, const gp_XY & thePoint2, const gp_XY & thePoint3);

		/****** BRepMesh_CircleTool::Delete ******/
		/****** md5 signature: 96217fbebcc467dbfaaea285d1bfc971 ******/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Deletes a circle from the tool. 
Parameter theIndex index of a circle to be removed.
") Delete;
		void Delete(const int theIndex);

		/****** BRepMesh_CircleTool::Init ******/
		/****** md5 signature: c46e095e748bc1ac2a33ff2ecb6b4408 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
: int

Return
-------
None

Description
-----------
Initializes the tool. 
Parameter theReservedSize size to be reserved for vector of circles.
") Init;
		void Init(const int );

		/****** BRepMesh_CircleTool::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if cell filter contains no circle.
") IsEmpty;
		bool IsEmpty();

		/****** BRepMesh_CircleTool::MakeCircle ******/
		/****** md5 signature: 22e8b3e372568e59c4b155c2fd862aa5 ******/
		%feature("compactdefaultargs") MakeCircle;
		%feature("autodoc", "
Parameters
----------
thePoint1: gp_XY
thePoint2: gp_XY
thePoint3: gp_XY
theLocation: gp_XY

Return
-------
theRadius: double

Description
-----------
Computes circle on three points. 
Parameter thePoint1 first point. 
Parameter thePoint2 second point. 
Parameter thePoint3 third point. @param[out] theLocation center of computed circle. @param[out] theRadius radius of computed circle. 
Return: False in case of impossibility to build a circle on the given points, True elsewhere.
") MakeCircle;
		static bool MakeCircle(const gp_XY & thePoint1, const gp_XY & thePoint2, const gp_XY & thePoint3, gp_XY & theLocation, Standard_Real &OutValue);

		/****** BRepMesh_CircleTool::MocBind ******/
		/****** md5 signature: 442aa0d648fd46190f85f719c3508166 ******/
		%feature("compactdefaultargs") MocBind;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Binds implicit zero circle. 
Parameter theIndex index a zero circle should be bound with.
") MocBind;
		void MocBind(const int theIndex);

		/****** BRepMesh_CircleTool::Select ******/
		/****** md5 signature: 42d7f08c8f789406b882043c70333ebd ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_XY

Return
-------
IMeshData::ListOfInteger

Description
-----------
Select the circles shot by the given point. 
Parameter thePoint bullet point.
") Select;
		IMeshData::ListOfInteger & Select(const gp_XY & thePoint);

		/****** BRepMesh_CircleTool::SetCellSize ******/
		/****** md5 signature: 57f2ef2a03c8923e07186467a5158dcd ******/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
Sets new size for cell filter. 
Parameter theSize cell size to be set for X and Y dimensions.
") SetCellSize;
		void SetCellSize(const double theSize);

		/****** BRepMesh_CircleTool::SetCellSize ******/
		/****** md5 signature: aad2055aac5834179dae9bca8ec7e206 ******/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "
Parameters
----------
theSizeX: double
theSizeY: double

Return
-------
None

Description
-----------
Sets new size for cell filter. 
Parameter theSizeX cell size to be set for X dimension. 
Parameter theSizeY cell size to be set for Y dimension.
") SetCellSize;
		void SetCellSize(const double theSizeX, const double theSizeY);

		/****** BRepMesh_CircleTool::SetMinMaxSize ******/
		/****** md5 signature: f153182deac2fb83c6f4bb26b9903fb1 ******/
		%feature("compactdefaultargs") SetMinMaxSize;
		%feature("autodoc", "
Parameters
----------
theMin: gp_XY
theMax: gp_XY

Return
-------
None

Description
-----------
Sets limits of inspection area. 
Parameter theMin bottom left corner of inspection area. 
Parameter theMax top right corner of inspection area.
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
		/****** BRepMesh_Classifier::BRepMesh_Classifier ******/
		/****** md5 signature: 985f7a67456acfd7e203609355094286 ******/
		%feature("compactdefaultargs") BRepMesh_Classifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_Classifier;
		 BRepMesh_Classifier();

		/****** BRepMesh_Classifier::Perform ******/
		/****** md5 signature: 668466fd138ea01dcd174ac83e766ee1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
TopAbs_State

Description
-----------
Performs classification of the given point regarding to face internals. 
Parameter thePoint Point in parametric space to be classified. 
Return: TopAbs_IN if point lies within face boundaries and TopAbs_OUT elsewhere.
") Perform;
		TopAbs_State Perform(const gp_Pnt2d & thePoint);

		/****** BRepMesh_Classifier::RegisterWire ******/
		/****** md5 signature: 70aa94adbab8b920e657859b7e7a6583 ******/
		%feature("compactdefaultargs") RegisterWire;
		%feature("autodoc", "
Parameters
----------
theWire: NCollection_Sequence< gp_Pnt2d *>
theTolUV: std::pair<double, double>
theRangeU: std::pair<double, double>
theRangeV: std::pair<double, double>

Return
-------
None

Description
-----------
Registers wire specified by sequence of points for further classification of points. 
Parameter theWire Wire to be registered. Specified by sequence of points. 
Parameter theTolUV Tolerance to be used for calculations in parametric space. 
Parameter theUmin Lower U boundary of the face in parametric space. 
Parameter theUmax Upper U boundary of the face in parametric space. 
Parameter theVmin Lower V boundary of the face in parametric space. 
Parameter theVmax Upper V boundary of the face in parametric space.
") RegisterWire;
		void RegisterWire(const NCollection_Sequence<const gp_Pnt2d *> & theWire, const std::pair<double, double> & theTolUV, const std::pair<double, double> & theRangeU, const std::pair<double, double> & theRangeV);

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
		/****** BRepMesh_Context::BRepMesh_Context ******/
		/****** md5 signature: b9a5ecaf630ba21afab7902c0bd2fa8b ******/
		%feature("compactdefaultargs") BRepMesh_Context;
		%feature("autodoc", "
Parameters
----------
theMeshType: IMeshTools_MeshAlgoType (optional, default to IMeshTools_MeshAlgoType_DEFAULT)

Return
-------
None

Description
-----------
Constructor.
") BRepMesh_Context;
		 BRepMesh_Context(IMeshTools_MeshAlgoType theMeshType = IMeshTools_MeshAlgoType_DEFAULT);

};


%make_alias(BRepMesh_Context)

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
		/****** BRepMesh_CurveTessellator::BRepMesh_CurveTessellator ******/
		/****** md5 signature: 3a2229b06c711121e0ef96633a288c31 ******/
		%feature("compactdefaultargs") BRepMesh_CurveTessellator;
		%feature("autodoc", "
Parameters
----------
theEdge: IMeshData::IEdgeHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int (optional, default to 2)

Return
-------
None

Description
-----------
Constructor.
") BRepMesh_CurveTessellator;
		 BRepMesh_CurveTessellator(const IMeshData::IEdgeHandle & theEdge, const IMeshTools_Parameters & theParameters, const int theMinPointsNb = 2);

		/****** BRepMesh_CurveTessellator::BRepMesh_CurveTessellator ******/
		/****** md5 signature: 051a66089114a7027c06f5cb382a9089 ******/
		%feature("compactdefaultargs") BRepMesh_CurveTessellator;
		%feature("autodoc", "
Parameters
----------
theEdge: IMeshData::IEdgeHandle
theOrientation: TopAbs_Orientation
theFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int (optional, default to 2)

Return
-------
None

Description
-----------
Constructor.
") BRepMesh_CurveTessellator;
		 BRepMesh_CurveTessellator(const IMeshData::IEdgeHandle & theEdge, const TopAbs_Orientation theOrientation, const IMeshData::IFaceHandle & theFace, const IMeshTools_Parameters & theParameters, const int theMinPointsNb = 2);

		/****** BRepMesh_CurveTessellator::PointsNb ******/
		/****** md5 signature: a26ed20f10aa03e884a65ec6a7c8efa0 ******/
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of tessellation points.
") PointsNb;
		int PointsNb();

		/****** BRepMesh_CurveTessellator::Value ******/
		/****** md5 signature: 27c4b8d992fb91c76b7ad7d0db701fe6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePoint: gp_Pnt

Return
-------
theParameter: double

Description
-----------
Returns parameters of solution with the given index. 
Parameter theIndex index of tessellation point. 
Parameter theParameter parameters on PCurve corresponded to the solution. 
Parameter thePoint tessellation point. 
Return: True in case of valid result, false elewhere.
") Value;
		bool Value(const int theIndex, gp_Pnt & thePoint, Standard_Real &OutValue);

};


%make_alias(BRepMesh_CurveTessellator)

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
		/****** BRepMesh_DataStructureOfDelaun::BRepMesh_DataStructureOfDelaun ******/
		/****** md5 signature: 846633f22c98c765627343e6c7a06b60 ******/
		%feature("compactdefaultargs") BRepMesh_DataStructureOfDelaun;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_IncAllocator
theReservedNodeSize: int (optional, default to 100)

Return
-------
None

Description
-----------
Constructor. 
Parameter theAllocator memory allocator to be used by internal structures. 
Parameter theReservedNodeSize presumed number of nodes in this mesh.
") BRepMesh_DataStructureOfDelaun;
		 BRepMesh_DataStructureOfDelaun(const opencascade::handle<NCollection_IncAllocator> & theAllocator, const int theReservedNodeSize = 100);

		/****** BRepMesh_DataStructureOfDelaun::AddElement ******/
		/****** md5 signature: a61b6b832ad9d13f0ec239a1aeb0b77d ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
theElement: BRepMesh_Triangle

Return
-------
int

Description
-----------
Adds element to the mesh if it is not already in the mesh. 
Parameter theElement element to be added to the mesh. 
Return: index of the element in the structure.
") AddElement;
		int AddElement(const BRepMesh_Triangle & theElement);

		/****** BRepMesh_DataStructureOfDelaun::AddLink ******/
		/****** md5 signature: 3c09b69d84df2fdc3823b7c9100218fe ******/
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "
Parameters
----------
theLink: BRepMesh_Edge

Return
-------
int

Description
-----------
Adds link to the mesh if it is not already in the mesh. 
Parameter theLink link to be added to the mesh. 
Return: index of the link in the structure.
") AddLink;
		int AddLink(const BRepMesh_Edge & theLink);

		/****** BRepMesh_DataStructureOfDelaun::AddNode ******/
		/****** md5 signature: c17b4fe7d4ca6469649659f7ad6949ee ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
theNode: BRepMesh_Vertex
isForceAdd: bool (optional, default to false)

Return
-------
int

Description
-----------
Adds node to the mesh if it is not already in the mesh. 
Parameter theNode node to be added to the mesh. 
Parameter isForceAdd adds the given node to structure without checking on coincidence with other nodes. 
Return: index of the node in the structure.
") AddNode;
		int AddNode(const BRepMesh_Vertex & theNode, const bool isForceAdd = false);

		/****** BRepMesh_DataStructureOfDelaun::Allocator ******/
		/****** md5 signature: f62593783d4573ef5624106d77d9bbd9 ******/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_IncAllocator>

Description
-----------
Returns memory allocator used by the structure.
") Allocator;
		const opencascade::handle<NCollection_IncAllocator> & Allocator();

		/****** BRepMesh_DataStructureOfDelaun::ClearDeleted ******/
		/****** md5 signature: 2f79f0e58312517eed899c340fbc034c ******/
		%feature("compactdefaultargs") ClearDeleted;
		%feature("autodoc", "Return
-------
None

Description
-----------
Substitutes deleted items by the last one from corresponding map to have only non-deleted elements, links or nodes in the structure.
") ClearDeleted;
		void ClearDeleted();

		/****** BRepMesh_DataStructureOfDelaun::ClearDomain ******/
		/****** md5 signature: cba3b5048c974ffd2154c94ad129dd31 ******/
		%feature("compactdefaultargs") ClearDomain;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all elements.
") ClearDomain;
		void ClearDomain();

		/****** BRepMesh_DataStructureOfDelaun::Data ******/
		/****** md5 signature: 60a87eb41dbe1e7bddca17ebc155ae95 ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepMesh_VertexTool>

Description
-----------
Gives the data structure for initialization of cell size and tolerance.
") Data;
		const opencascade::handle<BRepMesh_VertexTool> & Data();

		/****** BRepMesh_DataStructureOfDelaun::Dump ******/
		/****** md5 signature: 6fe979dcc9e0efc467584683ff90b643 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
theFileNameStr: char *

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const char * theFileNameStr);

		/****** BRepMesh_DataStructureOfDelaun::ElementNodes ******/
		/****** md5 signature: 41c4e01fed0fd7f1ace4ad09d0c2fb8b ******/
		%feature("compactdefaultargs") ElementNodes;
		%feature("autodoc", "
Parameters
----------
theElement: BRepMesh_Triangle
): int (  theNodes

Return
-------
None

Description
-----------
Returns indices of nodes forming the given element. 
Parameter theElement element which nodes should be retrieved. @param[out] theNodes nodes of the given element.
") ElementNodes;
		void ElementNodes(const BRepMesh_Triangle & theElement, int ( & theNodes )[3]);

		/****** BRepMesh_DataStructureOfDelaun::ElementsConnectedTo ******/
		/****** md5 signature: c0b1229b5a3bab9e70b56e8cba8c0a75 ******/
		%feature("compactdefaultargs") ElementsConnectedTo;
		%feature("autodoc", "
Parameters
----------
theLinkIndex: int

Return
-------
BRepMesh_PairOfIndex

Description
-----------
Returns indices of elements connected to the link with the given index. 
Parameter theLinkIndex index of link whose data should be retrieved. 
Return: indices of elements connected to the link.
") ElementsConnectedTo;
		const BRepMesh_PairOfIndex & ElementsConnectedTo(const int theLinkIndex);

		/****** BRepMesh_DataStructureOfDelaun::ElementsOfDomain ******/
		/****** md5 signature: 69b3fc4ed234e9f90fe6024d34e76746 ******/
		%feature("compactdefaultargs") ElementsOfDomain;
		%feature("autodoc", "Return
-------
IMeshData::MapOfInteger

Description
-----------
Returns map of indices of elements registered in mesh.
") ElementsOfDomain;
		const IMeshData::MapOfInteger & ElementsOfDomain();

		/****** BRepMesh_DataStructureOfDelaun::GetElement ******/
		/****** md5 signature: d4a052a27e671f7350a62922db2c7c26 ******/
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Triangle

Description
-----------
Get element by the index. 
Parameter theIndex index of an element. 
Return: element with the given index.
") GetElement;
		const BRepMesh_Triangle & GetElement(const int theIndex);

		/****** BRepMesh_DataStructureOfDelaun::GetLink ******/
		/****** md5 signature: 9ac5252ee326a7e771fe912295ff7053 ******/
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Edge

Description
-----------
Get link by the index. 
Parameter theIndex index of a link. 
Return: link with the given index.
") GetLink;
		const BRepMesh_Edge & GetLink(const int theIndex);

		/****** BRepMesh_DataStructureOfDelaun::GetNode ******/
		/****** md5 signature: 893dfab6d9d6306db50ac7e0ac274341 ******/
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Vertex

Description
-----------
Get node by the index. 
Parameter theIndex index of a node. 
Return: node with the given index.
") GetNode;
		const BRepMesh_Vertex & GetNode(const int theIndex);

		/****** BRepMesh_DataStructureOfDelaun::IndexOf ******/
		/****** md5 signature: ebb1681fd27ce9dcc58cef9bac6ce3e8 ******/
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "
Parameters
----------
theNode: BRepMesh_Vertex

Return
-------
int

Description
-----------
Finds the index of the given node. 
Parameter theNode node to find. 
Return: index of the given element of zero if node is not in the mesh.
") IndexOf;
		int IndexOf(const BRepMesh_Vertex & theNode);

		/****** BRepMesh_DataStructureOfDelaun::IndexOf ******/
		/****** md5 signature: 50aee1d7bd722dc624d3451c13d7433d ******/
		%feature("compactdefaultargs") IndexOf;
		%feature("autodoc", "
Parameters
----------
theLink: BRepMesh_Edge

Return
-------
int

Description
-----------
Finds the index of the given link. 
Parameter theLink link to find. 
Return: index of the given element of zero if link is not in the mesh.
") IndexOf;
		int IndexOf(const BRepMesh_Edge & theLink);

		/****** BRepMesh_DataStructureOfDelaun::LinksConnectedTo ******/
		/****** md5 signature: 48e97084398ab557645d9247012fb26f ******/
		%feature("compactdefaultargs") LinksConnectedTo;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::ListOfInteger

Description
-----------
Get list of links attached to the node with the given index. 
Parameter theIndex index of node whose links should be retrieved. 
Return: list of links attached to the node.
") LinksConnectedTo;
		const IMeshData::ListOfInteger & LinksConnectedTo(const int theIndex);

		/****** BRepMesh_DataStructureOfDelaun::LinksOfDomain ******/
		/****** md5 signature: 912b45a268b81eb750fcd0b09b5744a5 ******/
		%feature("compactdefaultargs") LinksOfDomain;
		%feature("autodoc", "Return
-------
IMeshData::MapOfInteger

Description
-----------
Returns map of indices of links registered in mesh.
") LinksOfDomain;
		const IMeshData::MapOfInteger & LinksOfDomain();

		/****** BRepMesh_DataStructureOfDelaun::NbElements ******/
		/****** md5 signature: a3bde70b76cbd01fd87444d7af358185 ******/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of links.
") NbElements;
		int NbElements();

		/****** BRepMesh_DataStructureOfDelaun::NbLinks ******/
		/****** md5 signature: 2e2a423522fbddc44bdf690dfdfa436c ******/
		%feature("compactdefaultargs") NbLinks;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of links.
") NbLinks;
		int NbLinks();

		/****** BRepMesh_DataStructureOfDelaun::NbNodes ******/
		/****** md5 signature: d40157e610feffebe18aa0d56c09a4f4 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of nodes.
") NbNodes;
		int NbNodes();

		/****** BRepMesh_DataStructureOfDelaun::RemoveElement ******/
		/****** md5 signature: 12b50fa17aa0bb9162a239fa7fd2d478 ******/
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes element from the mesh. 
Parameter theIndex index of element to be removed.
") RemoveElement;
		void RemoveElement(const int theIndex);

		/****** BRepMesh_DataStructureOfDelaun::RemoveLink ******/
		/****** md5 signature: 81ee4e569bdfac58bcc1efdce08b18e7 ******/
		%feature("compactdefaultargs") RemoveLink;
		%feature("autodoc", "
Parameters
----------
theIndex: int
isForce: bool (optional, default to false)

Return
-------
None

Description
-----------
Removes link from the mesh in case if it has no connected elements and its type is Free. 
Parameter theIndex index of link to be removed. 
Parameter isForce if True link will be removed even if movability is not Free.
") RemoveLink;
		void RemoveLink(const int theIndex, const bool isForce = false);

		/****** BRepMesh_DataStructureOfDelaun::RemoveNode ******/
		/****** md5 signature: 5fb951d052ba81296ed365ac03ec666b ******/
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int
isForce: bool (optional, default to false)

Return
-------
None

Description
-----------
Removes node from the mesh in case if it has no connected links and its type is Free. 
Parameter theIndex index of node to be removed. 
Parameter isForce if True node will be removed even if movability is not Free.
") RemoveNode;
		void RemoveNode(const int theIndex, const bool isForce = false);

		/****** BRepMesh_DataStructureOfDelaun::SubstituteElement ******/
		/****** md5 signature: d63528a82ccda5662087898549f08f62 ******/
		%feature("compactdefaultargs") SubstituteElement;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNewElement: BRepMesh_Triangle

Return
-------
bool

Description
-----------
Substitutes the element with the given index by new one. 
Parameter theIndex index of element to be substituted. 
Parameter theNewLink substituting element. 
Return: False in case if new element is already in the structure, True elsewhere.
") SubstituteElement;
		bool SubstituteElement(const int theIndex, const BRepMesh_Triangle & theNewElement);

		/****** BRepMesh_DataStructureOfDelaun::SubstituteLink ******/
		/****** md5 signature: e89211efe14e092edddc6ea1d1e920c6 ******/
		%feature("compactdefaultargs") SubstituteLink;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNewLink: BRepMesh_Edge

Return
-------
bool

Description
-----------
Substitutes the link with the given index by new one. 
Parameter theIndex index of link to be substituted. 
Parameter theNewLink substituting link. 
Return: False in case if new link is already in the structure, True elsewhere.
") SubstituteLink;
		bool SubstituteLink(const int theIndex, const BRepMesh_Edge & theNewLink);

		/****** BRepMesh_DataStructureOfDelaun::SubstituteNode ******/
		/****** md5 signature: f7dab10478373778a67a92c9e5278bab ******/
		%feature("compactdefaultargs") SubstituteNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNewNode: BRepMesh_Vertex

Return
-------
bool

Description
-----------
Substitutes the node with the given index by new one. 
Parameter theIndex index of node to be substituted. 
Parameter theNewNode substituting node. 
Return: False in case if new node is already in the structure, True elsewhere.
") SubstituteNode;
		bool SubstituteNode(const int theIndex, const BRepMesh_Vertex & theNewNode);

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
		/****** BRepMesh_DefaultRangeSplitter::BRepMesh_DefaultRangeSplitter ******/
		/****** md5 signature: f6f76c0a073db41195586070561931fd ******/
		%feature("compactdefaultargs") BRepMesh_DefaultRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_DefaultRangeSplitter;
		 BRepMesh_DefaultRangeSplitter();

		/****** BRepMesh_DefaultRangeSplitter::AddPoint ******/
		/****** md5 signature: 3771804d13147da01f7a0a6ebdcc9a45 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Registers border point.
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint);

		/****** BRepMesh_DefaultRangeSplitter::AdjustRange ******/
		/****** md5 signature: ddbe360d718a2ef25835d18d405aa99b ******/
		%feature("compactdefaultargs") AdjustRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates discrete range of surface according to its geometric range.
") AdjustRange;
		virtual void AdjustRange();

		/****** BRepMesh_DefaultRangeSplitter::GetDFace ******/
		/****** md5 signature: 66ba0efe4a5555cea366f7d6aabb3193 ******/
		%feature("compactdefaultargs") GetDFace;
		%feature("autodoc", "Return
-------
IMeshData::IFaceHandle

Description
-----------
Returns face model.
") GetDFace;
		const IMeshData::IFaceHandle & GetDFace();

		/****** BRepMesh_DefaultRangeSplitter::GetDelta ******/
		/****** md5 signature: 5e1aacaf8255ec8e33949bde50a5a3c5 ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
std::pair<double, double>

Description
-----------
Returns delta.
") GetDelta;
		const std::pair<double, double> & GetDelta();

		/****** BRepMesh_DefaultRangeSplitter::GetRangeU ******/
		/****** md5 signature: fd4b16fb478ff3bd674ea23273de4ddf ******/
		%feature("compactdefaultargs") GetRangeU;
		%feature("autodoc", "Return
-------
std::pair<double, double>

Description
-----------
Returns U range.
") GetRangeU;
		const std::pair<double, double> & GetRangeU();

		/****** BRepMesh_DefaultRangeSplitter::GetRangeV ******/
		/****** md5 signature: f7b80dd32384711e09197c7847afdf3a ******/
		%feature("compactdefaultargs") GetRangeV;
		%feature("autodoc", "Return
-------
std::pair<double, double>

Description
-----------
Returns V range.
") GetRangeV;
		const std::pair<double, double> & GetRangeV();

		/****** BRepMesh_DefaultRangeSplitter::GetSurface ******/
		/****** md5 signature: 6aa03522ab6b1d17fd10abc283bef0d7 ******/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepAdaptor_Surface>

Description
-----------
Returns surface.
") GetSurface;
		const opencascade::handle<BRepAdaptor_Surface> & GetSurface();

		/****** BRepMesh_DefaultRangeSplitter::GetToleranceUV ******/
		/****** md5 signature: d9c83ef060afc1e15a6572d2846671b3 ******/
		%feature("compactdefaultargs") GetToleranceUV;
		%feature("autodoc", "Return
-------
std::pair<double, double>

Description
-----------
No available documentation.
") GetToleranceUV;
		const std::pair<double, double> & GetToleranceUV();

		/****** BRepMesh_DefaultRangeSplitter::IsValid ******/
		/****** md5 signature: 8726db90cfbc885e9bb4f13fdad9b84c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if computed range is valid.
") IsValid;
		virtual bool IsValid();

		/****** BRepMesh_DefaultRangeSplitter::Point ******/
		/****** md5 signature: a5831d9dd1c33d274655f020e0ba9a9e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
thePoint2d: gp_Pnt2d

Return
-------
gp_Pnt

Description
-----------
Returns point in 3d space corresponded to the given point defined in parametric space of surface.
") Point;
		gp_Pnt Point(const gp_Pnt2d & thePoint2d);

		/****** BRepMesh_DefaultRangeSplitter::Reset ******/
		/****** md5 signature: ac4f00ee28ad32a0f5f23f21d5b1091c ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Return
-------
None

Description
-----------
Resets this splitter. Must be called before first use.
") Reset;
		virtual void Reset(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

		/****** BRepMesh_DefaultRangeSplitter::Scale ******/
		/****** md5 signature: 7e412c4bd3d692338c3993ede6f32aa4 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
isToFaceBasis: bool

Return
-------
gp_Pnt2d

Description
-----------
Scales the given point from real parametric space to face basis and otherwise. 
Parameter thePoint point to be scaled. 
Parameter isToFaceBasis if True converts point to face basis, otherwise performs reverse conversion. 
Return: scaled point.
") Scale;
		gp_Pnt2d Scale(const gp_Pnt2d & thePoint, const bool isToFaceBasis);

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
		/****** BRepMesh_Deflection::ComputeAbsoluteDeflection ******/
		/****** md5 signature: 9427060f5c1fa07bda3caf62a7e274d6 ******/
		%feature("compactdefaultargs") ComputeAbsoluteDeflection;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theRelativeDeflection: double
theMaxShapeSize: double

Return
-------
double

Description
-----------
Returns absolute deflection for theShape with respect to the relative deflection and theMaxShapeSize. 
Parameter theShape shape for that the deflection should be computed. 
Parameter theRelativeDeflection relative deflection. 
Parameter theMaxShapeSize maximum size of the whole shape. 
Return: absolute deflection for the shape.
") ComputeAbsoluteDeflection;
		static double ComputeAbsoluteDeflection(const TopoDS_Shape & theShape, const double theRelativeDeflection, const double theMaxShapeSize);

		/****** BRepMesh_Deflection::ComputeDeflection ******/
		/****** md5 signature: 3339c677d12bf5bccf288e2cabdaa5ce ******/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theMaxShapeSize: double
theParameters: IMeshTools_Parameters

Return
-------
None

Description
-----------
Computes and updates deflection of the given discrete edge.
") ComputeDeflection;
		static void ComputeDeflection(const IMeshData::IEdgeHandle & theDEdge, const double theMaxShapeSize, const IMeshTools_Parameters & theParameters);

		/****** BRepMesh_Deflection::ComputeDeflection ******/
		/****** md5 signature: e1d2e8148982b00889ee52b5925e1300 ******/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "
Parameters
----------
theDWire: IMeshData::IWireHandle
theParameters: IMeshTools_Parameters

Return
-------
None

Description
-----------
Computes and updates deflection of the given discrete wire.
") ComputeDeflection;
		static void ComputeDeflection(const IMeshData::IWireHandle & theDWire, const IMeshTools_Parameters & theParameters);

		/****** BRepMesh_Deflection::ComputeDeflection ******/
		/****** md5 signature: 394c2d7076288b46094dbb60cdf403a4 ******/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Return
-------
None

Description
-----------
Computes and updates deflection of the given discrete face.
") ComputeDeflection;
		static void ComputeDeflection(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

		/****** BRepMesh_Deflection::IsConsistent ******/
		/****** md5 signature: 9d03b6cfc003cc7b685dd693ac8c9e0f ******/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "
Parameters
----------
theCurrent: double
theRequired: double
theAllowDecrease: bool
theRatio: double (optional, default to 0.1)

Return
-------
bool

Description
-----------
Checks if the deflection of current polygonal representation is consistent with the required deflection. 
Input parameter: theCurrent Current deflection. 
Input parameter: theRequired Required deflection. 
Input parameter: theAllowDecrease Flag controlling the check. If decrease is allowed, to be consistent the current and required deflections should be approximately the same. If not allowed, the current deflection should be less than required. 
Input parameter: theRatio The ratio for comparison of the deflections (value from 0 to 1).
") IsConsistent;
		static bool IsConsistent(const double theCurrent, const double theRequired, const bool theAllowDecrease, const double theRatio = 0.1);

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
		/****** BRepMesh_DelabellaMeshAlgoFactory::BRepMesh_DelabellaMeshAlgoFactory ******/
		/****** md5 signature: 7e764d1ee3a95c966901000e31a5d227 ******/
		%feature("compactdefaultargs") BRepMesh_DelabellaMeshAlgoFactory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_DelabellaMeshAlgoFactory;
		 BRepMesh_DelabellaMeshAlgoFactory();

		/****** BRepMesh_DelabellaMeshAlgoFactory::GetAlgo ******/
		/****** md5 signature: a53690b3bb6a5ae23930dfea1a68b3df ******/
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "
Parameters
----------
theSurfaceType: GeomAbs_SurfaceType
theParameters: IMeshTools_Parameters

Return
-------
opencascade::handle<IMeshTools_MeshAlgo>

Description
-----------
Creates instance of meshing algorithm for the given type of surface.
") GetAlgo;
		opencascade::handle<IMeshTools_MeshAlgo> GetAlgo(const GeomAbs_SurfaceType theSurfaceType, const IMeshTools_Parameters & theParameters);

};


%make_alias(BRepMesh_DelabellaMeshAlgoFactory)

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
		/****** BRepMesh_Delaun::BRepMesh_Delaun ******/
		/****** md5 signature: 1a48a5d42bed0a66261ff53f7a7203ec ******/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "
Parameters
----------
theOldMesh: BRepMesh_DataStructureOfDelaun
theCellsCountU: int
theCellsCountV: int
isFillCircles: bool

Return
-------
None

Description
-----------
Creates instance of triangulator, but do not run the algorithm automatically.
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh, const int theCellsCountU, const int theCellsCountV, const bool isFillCircles);

		/****** BRepMesh_Delaun::BRepMesh_Delaun ******/
		/****** md5 signature: 67a9f1d69a5229d991569f29fce7a648 ******/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "
Parameters
----------
theVertices: IMeshData::Array1OfVertexOfDelaun

Return
-------
None

Description
-----------
Creates the triangulation with an empty Mesh data structure.
") BRepMesh_Delaun;
		 BRepMesh_Delaun(IMeshData::Array1OfVertexOfDelaun & theVertices);

		/****** BRepMesh_Delaun::BRepMesh_Delaun ******/
		/****** md5 signature: df88784074ba4bf377dd6ca7843b0be2 ******/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "
Parameters
----------
theOldMesh: BRepMesh_DataStructureOfDelaun
theVertices: IMeshData::Array1OfVertexOfDelaun

Return
-------
None

Description
-----------
Creates the triangulation with an existent Mesh data structure.
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh, IMeshData::Array1OfVertexOfDelaun & theVertices);

		/****** BRepMesh_Delaun::BRepMesh_Delaun ******/
		/****** md5 signature: 548fe3ab0ed5446122fb6a1a75317e5a ******/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "
Parameters
----------
theOldMesh: BRepMesh_DataStructureOfDelaun
theVertexIndices: IMeshData::VectorOfInteger

Return
-------
None

Description
-----------
Creates the triangulation with an existant Mesh data structure.
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh, IMeshData::VectorOfInteger & theVertexIndices);

		/****** BRepMesh_Delaun::BRepMesh_Delaun ******/
		/****** md5 signature: c30fa8a7bc2275bc9cb4bf0954816686 ******/
		%feature("compactdefaultargs") BRepMesh_Delaun;
		%feature("autodoc", "
Parameters
----------
theOldMesh: BRepMesh_DataStructureOfDelaun
theVertexIndices: IMeshData::VectorOfInteger
theCellsCountU: int
theCellsCountV: int

Return
-------
None

Description
-----------
Creates the triangulation with an existant Mesh data structure.
") BRepMesh_Delaun;
		 BRepMesh_Delaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theOldMesh, IMeshData::VectorOfInteger & theVertexIndices, const int theCellsCountU, const int theCellsCountV);

		/****** BRepMesh_Delaun::AddVertices ******/
		/****** md5 signature: 113e996513917ce7251d5a839da38bcc ******/
		%feature("compactdefaultargs") AddVertices;
		%feature("autodoc", "
Parameters
----------
theVerticesIndices: IMeshData::VectorOfInteger
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Adds some vertices into the triangulation.
") AddVertices;
		void AddVertices(IMeshData::VectorOfInteger & theVerticesIndices, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepMesh_Delaun::Circles ******/
		/****** md5 signature: 33d52e752207c405b226546e9af83859 ******/
		%feature("compactdefaultargs") Circles;
		%feature("autodoc", "Return
-------
BRepMesh_CircleTool

Description
-----------
Returns tool used to build mesh consistent to Delaunay criteria.
") Circles;
		const BRepMesh_CircleTool & Circles();

		/****** BRepMesh_Delaun::Contains ******/
		/****** md5 signature: 55f516f976566cef5cfed6079c6c9f5d ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theTriangleId: int
theVertex: BRepMesh_Vertex
theSqTolerance: double

Return
-------
theEdgeOn: int

Description
-----------
Test is the given triangle contains the given vertex. 
Parameter theSqTolerance square tolerance to check closeness to some edge 
Parameter theEdgeOn If it is != 0 the vertex lies onto the edge index returned through this parameter.
") Contains;
		bool Contains(const int theTriangleId, const BRepMesh_Vertex & theVertex, const double theSqTolerance, Standard_Integer &OutValue);

		/****** BRepMesh_Delaun::GetEdge ******/
		/****** md5 signature: cd9c34785e78fa92eb807ad4641fba69 ******/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Edge

Description
-----------
Gives edge with the given index.
") GetEdge;
		const BRepMesh_Edge & GetEdge(const int theIndex);

		/****** BRepMesh_Delaun::GetTriangle ******/
		/****** md5 signature: 68f14f1b10b37bf3fb917db0b5a44795 ******/
		%feature("compactdefaultargs") GetTriangle;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Triangle

Description
-----------
Gives triangle with the given index.
") GetTriangle;
		const BRepMesh_Triangle & GetTriangle(const int theIndex);

		/****** BRepMesh_Delaun::GetVertex ******/
		/****** md5 signature: 76ada6c0fe2c5b7bc884f8f76fd16b2b ******/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Vertex

Description
-----------
Gives vertex with the given index.
") GetVertex;
		const BRepMesh_Vertex & GetVertex(const int theIndex);

		/****** BRepMesh_Delaun::Init ******/
		/****** md5 signature: 315fb83d9713d47297c33011a2c6b575 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theVertices: IMeshData::Array1OfVertexOfDelaun

Return
-------
None

Description
-----------
Initializes the triangulation with an array of vertices.
") Init;
		void Init(IMeshData::Array1OfVertexOfDelaun & theVertices);

		/****** BRepMesh_Delaun::InitCirclesTool ******/
		/****** md5 signature: 8fb1f917e8ab72a4118e300d2f40849a ******/
		%feature("compactdefaultargs") InitCirclesTool;
		%feature("autodoc", "
Parameters
----------
theCellsCountU: int
theCellsCountV: int

Return
-------
None

Description
-----------
Forces initialization of circles cell filter using working structure.
") InitCirclesTool;
		void InitCirclesTool(const int theCellsCountU, const int theCellsCountV);

		/****** BRepMesh_Delaun::RemoveAuxElements ******/
		/****** md5 signature: f5c31c7ed6200793d7e443c838782af8 ******/
		%feature("compactdefaultargs") RemoveAuxElements;
		%feature("autodoc", "Return
-------
None

Description
-----------
Destruction of auxiliary triangles containing the given vertices. Removes auxiliary vertices also. 
Parameter theAuxVertices auxiliary vertices to be cleaned up.
") RemoveAuxElements;
		void RemoveAuxElements();

		/****** BRepMesh_Delaun::RemoveVertex ******/
		/****** md5 signature: 45b088f9c013183a935581ea0ea79936 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepMesh_Vertex

Return
-------
None

Description
-----------
Removes a vertex from the triangulation.
") RemoveVertex;
		void RemoveVertex(const BRepMesh_Vertex & theVertex);

		/****** BRepMesh_Delaun::Result ******/
		/****** md5 signature: 1244aaba5231d45d599f841b2370df2a ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepMesh_DataStructureOfDelaun>

Description
-----------
Gives the Mesh data structure.
") Result;
		const opencascade::handle<BRepMesh_DataStructureOfDelaun> & Result();

		/****** BRepMesh_Delaun::SetAuxVertices ******/
		/****** md5 signature: 49ee655c1fb99403e0e07ccbb417bbae ******/
		%feature("compactdefaultargs") SetAuxVertices;
		%feature("autodoc", "
Parameters
----------
theSupVert: IMeshData::VectorOfInteger

Return
-------
None

Description
-----------
Explicitly sets ids of auxiliary vertices used to build mesh and used by 3rd-party algorithms.
") SetAuxVertices;
		void SetAuxVertices(const IMeshData::VectorOfInteger & theSupVert);

		/****** BRepMesh_Delaun::UseEdge ******/
		/****** md5 signature: adec830ed16a29ce85dad726b18fcd00 ******/
		%feature("compactdefaultargs") UseEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: int

Return
-------
bool

Description
-----------
Modify mesh to use the edge. 
Return: True if done.
") UseEdge;
		bool UseEdge(const int theEdge);

};


%extend BRepMesh_Delaun {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Frontier(self):
		pass

	@methodnotwrapped
	def InternalEdges(self):
		pass

	@methodnotwrapped
	def FreeEdges(self):
		pass

	@methodnotwrapped
	def ProcessConstraints(self):
		pass
	}
};

/************************************
* class BRepMesh_DiscretAlgoFactory *
************************************/
%nodefaultctor BRepMesh_DiscretAlgoFactory;
class BRepMesh_DiscretAlgoFactory : public Standard_Transient {
	public:
		/****** BRepMesh_DiscretAlgoFactory::CreateAlgorithm ******/
		/****** md5 signature: a136e330d1e31d04e85d39b64f4576bd ******/
		%feature("compactdefaultargs") CreateAlgorithm;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: double
theAngDeflection: double

Return
-------
opencascade::handle<BRepMesh_DiscretRoot>

Description
-----------
Creates a new meshing algorithm instance. 
Input parameter: theShape shape to be meshed 
Input parameter: theLinDeflection linear deflection for meshing 
Input parameter: theAngDeflection angular deflection for meshing 
Return: new meshing algorithm instance.
") CreateAlgorithm;
		virtual opencascade::handle<BRepMesh_DiscretRoot> CreateAlgorithm(const TopoDS_Shape & theShape, double theLinDeflection, double theAngDeflection);

		/****** BRepMesh_DiscretAlgoFactory::DefaultFactory ******/
		/****** md5 signature: bf7827fe9775e23daefa71bba6cd1c37 ******/
		%feature("compactdefaultargs") DefaultFactory;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepMesh_DiscretAlgoFactory>

Description
-----------
Returns the default (first registered) factory, or NULL if none registered.
") DefaultFactory;
		static opencascade::handle<BRepMesh_DiscretAlgoFactory> DefaultFactory();

		/****** BRepMesh_DiscretAlgoFactory::Factories ******/
		/****** md5 signature: a0c16995b97b5dfe48231eb8c5cfaf5d ******/
		%feature("compactdefaultargs") Factories;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BRepMesh_DiscretAlgoFactory>>

Description
-----------
Returns the global list of registered factories.
") Factories;
		static const NCollection_List<opencascade::handle<BRepMesh_DiscretAlgoFactory>> & Factories();

		/****** BRepMesh_DiscretAlgoFactory::FindFactory ******/
		/****** md5 signature: 231ed804db539bb8fb7e563e605e10fd ******/
		%feature("compactdefaultargs") FindFactory;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
opencascade::handle<BRepMesh_DiscretAlgoFactory>

Description
-----------
Finds a factory by name. 
Input parameter: theName name of the factory to find 
Return: factory handle, or NULL if not found.
") FindFactory;
		static opencascade::handle<BRepMesh_DiscretAlgoFactory> FindFactory(TCollection_AsciiString theName);

		/****** BRepMesh_DiscretAlgoFactory::Name ******/
		/****** md5 signature: efed61b92683387cd746fb27e0376505 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the factory name.
") Name;
		const TCollection_AsciiString & Name();

		/****** BRepMesh_DiscretAlgoFactory::RegisterFactory ******/
		/****** md5 signature: 3ed0fca46ecc6a0c0bbdafe677305a9d ******/
		%feature("compactdefaultargs") RegisterFactory;
		%feature("autodoc", "
Parameters
----------
theFactory: BRepMesh_DiscretAlgoFactory
theIsPreferred: bool (optional, default to false)

Return
-------
None

Description
-----------
Registers a factory in the global registry. 
Input parameter: theFactory factory to register 
Input parameter: theIsPreferred if True, add to the beginning of the list (making it default),  otherwise add to the end.
") RegisterFactory;
		static void RegisterFactory(const opencascade::handle<BRepMesh_DiscretAlgoFactory> & theFactory, bool theIsPreferred = false);

		/****** BRepMesh_DiscretAlgoFactory::UnregisterFactory ******/
		/****** md5 signature: 9fe2bdc1459cba7162127ec6a3412054 ******/
		%feature("compactdefaultargs") UnregisterFactory;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
Unregisters a factory by name. 
Input parameter: theName name of the factory to unregister.
") UnregisterFactory;
		static void UnregisterFactory(TCollection_AsciiString theName);

};


%make_alias(BRepMesh_DiscretAlgoFactory)

%extend BRepMesh_DiscretAlgoFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepMesh_DiscretFactory *
********************************/
%nodefaultctor BRepMesh_DiscretFactory;
class BRepMesh_DiscretFactory {
	public:
		/****** BRepMesh_DiscretFactory::DefaultName ******/
		/****** md5 signature: 9098ac4c9fc2d3e09ad2b84fe3c2e228 ******/
		%feature("compactdefaultargs") DefaultName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns name of current meshing algorithm.
") DefaultName;
		const TCollection_AsciiString & DefaultName();

		/****** BRepMesh_DiscretFactory::Discret ******/
		/****** md5 signature: c93ed2e118afb74339d536ce0febe14a ******/
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: double
theAngDeflection: double

Return
-------
opencascade::handle<BRepMesh_DiscretRoot>

Description
-----------
Returns triangulation algorithm instance. 
Input parameter: theShape shape to be meshed 
Input parameter: theLinDeflection linear deflection to be used for meshing 
Input parameter: theAngDeflection angular deflection to be used for meshing 
Return: new meshing algorithm instance, or NULL if no algorithm available.
") Discret;
		opencascade::handle<BRepMesh_DiscretRoot> Discret(const TopoDS_Shape & theShape, double theLinDeflection, double theAngDeflection);

		/****** BRepMesh_DiscretFactory::Get ******/
		/****** md5 signature: a56c29cb1f600621510ef3cd3ac740da ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
BRepMesh_DiscretFactory

Description
-----------
Returns the global factory instance.
") Get;
		static BRepMesh_DiscretFactory & Get();

		/****** BRepMesh_DiscretFactory::SetDefaultName ******/
		/****** md5 signature: 0aa4f7bc4600d05c38f2e6347dcf098b ******/
		%feature("compactdefaultargs") SetDefaultName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Setup meshing algorithm by name. Returns True if requested algorithm is available. On fail Factory will continue to use previous algorithm. 
Input parameter: theName name of the algorithm to use.
") SetDefaultName;
		bool SetDefaultName(TCollection_AsciiString theName);

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
		/****** BRepMesh_DiscretRoot::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if triangualtion was performed and has success.
") IsDone;
		bool IsDone();

		/****** BRepMesh_DiscretRoot::Perform ******/
		/****** md5 signature: 398f71859219956837273801c6ed1f07 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Compute triangulation for set shape.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepMesh_DiscretRoot::SetShape ******/
		/****** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Set the shape to triangulate.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****** BRepMesh_DiscretRoot::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/****** BRepMesh_EdgeDiscret::BRepMesh_EdgeDiscret ******/
		/****** md5 signature: e7e4c18c9537514f706c9a42008e7796 ******/
		%feature("compactdefaultargs") BRepMesh_EdgeDiscret;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_EdgeDiscret;
		 BRepMesh_EdgeDiscret();

		/****** BRepMesh_EdgeDiscret::CreateEdgeTessellationExtractor ******/
		/****** md5 signature: 99b0722065c37d2ebe83652d7c58d139 ******/
		%feature("compactdefaultargs") CreateEdgeTessellationExtractor;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theDFace: IMeshData::IFaceHandle

Return
-------
opencascade::handle<IMeshTools_CurveTessellator>

Description
-----------
Creates instance of tessellation extractor.
") CreateEdgeTessellationExtractor;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellationExtractor(const IMeshData::IEdgeHandle & theDEdge, const IMeshData::IFaceHandle & theDFace);

		/****** BRepMesh_EdgeDiscret::CreateEdgeTessellator ******/
		/****** md5 signature: 2691dea04b31bd95a12b49ac3aed47ba ******/
		%feature("compactdefaultargs") CreateEdgeTessellator;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int (optional, default to 2)

Return
-------
opencascade::handle<IMeshTools_CurveTessellator>

Description
-----------
Creates instance of free edge tessellator.
") CreateEdgeTessellator;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellator(const IMeshData::IEdgeHandle & theDEdge, const IMeshTools_Parameters & theParameters, const int theMinPointsNb = 2);

		/****** BRepMesh_EdgeDiscret::CreateEdgeTessellator ******/
		/****** md5 signature: 6b7bc0fd5adce9d47814326709ce78a5 ******/
		%feature("compactdefaultargs") CreateEdgeTessellator;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theOrientation: TopAbs_Orientation
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theMinPointsNb: int (optional, default to 2)

Return
-------
opencascade::handle<IMeshTools_CurveTessellator>

Description
-----------
Creates instance of edge tessellator.
") CreateEdgeTessellator;
		static opencascade::handle<IMeshTools_CurveTessellator> CreateEdgeTessellator(const IMeshData::IEdgeHandle & theDEdge, const TopAbs_Orientation theOrientation, const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters, const int theMinPointsNb = 2);

		/****** BRepMesh_EdgeDiscret::Tessellate2d ******/
		/****** md5 signature: f64a36cc7b762fdce662fc2ec1080f56 ******/
		%feature("compactdefaultargs") Tessellate2d;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theUpdateEnds: bool

Return
-------
None

Description
-----------
Updates 2d discrete edge model using tessellation of 3D curve.
") Tessellate2d;
		static void Tessellate2d(const IMeshData::IEdgeHandle & theDEdge, const bool theUpdateEnds);

		/****** BRepMesh_EdgeDiscret::Tessellate3d ******/
		/****** md5 signature: 8eb7714194a56f8c88cd8a4b6370b3e9 ******/
		%feature("compactdefaultargs") Tessellate3d;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgeHandle
theTessellator: IMeshTools_CurveTessellator
theUpdateEnds: bool

Return
-------
None

Description
-----------
Updates 3d discrete edge model using the given tessellation tool.
") Tessellate3d;
		static void Tessellate3d(const IMeshData::IEdgeHandle & theDEdge, const opencascade::handle<IMeshTools_CurveTessellator> & theTessellator, const bool theUpdateEnds);

};


%make_alias(BRepMesh_EdgeDiscret)

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
/*****************************
* class BRepMesh_FaceChecker *
*****************************/
class BRepMesh_FaceChecker : public Standard_Transient {
	public:
typedef NCollection_Shared<NCollection_DynamicArray<Segment>> Segments;
typedef NCollection_Shared<NCollection_Array1<opencascade ::handle<Segments>>> ArrayOfSegments;
		class Segment {};
		/****** BRepMesh_FaceChecker::BRepMesh_FaceChecker ******/
		/****** md5 signature: 5e1e1f82e3705e28ebff9dc29b27b5a6 ******/
		%feature("compactdefaultargs") BRepMesh_FaceChecker;
		%feature("autodoc", "
Parameters
----------
theFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_FaceChecker;
		 BRepMesh_FaceChecker(const IMeshData::IFaceHandle & theFace, const IMeshTools_Parameters & theParameters);

		/****** BRepMesh_FaceChecker::Perform ******/
		/****** md5 signature: 836e5d294e107797e3a08ad4bfbbad29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs check wires of the face for intersections. 
Return: True if there is no intersection, False elsewhere.
") Perform;
		bool Perform();

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
		/****** BRepMesh_FaceDiscret::BRepMesh_FaceDiscret ******/
		/****** md5 signature: 5eb1feec00b8e23febb0ac8f82432245 ******/
		%feature("compactdefaultargs") BRepMesh_FaceDiscret;
		%feature("autodoc", "
Parameters
----------
theAlgoFactory: IMeshTools_MeshAlgoFactory

Return
-------
None

Description
-----------
Constructor.
") BRepMesh_FaceDiscret;
		 BRepMesh_FaceDiscret(const opencascade::handle<IMeshTools_MeshAlgoFactory> & theAlgoFactory);

};


%make_alias(BRepMesh_FaceDiscret)

%extend BRepMesh_FaceDiscret {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepMesh_FastDiscret *
*****************************/
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

		/****** BRepMesh_GeomTool::BRepMesh_GeomTool ******/
		/****** md5 signature: 395ad9964488ae7d57dbaa3445f3ffdd ******/
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "
Parameters
----------
theCurve: BRepAdaptor_Curve
theFirstParam: double
theLastParam: double
theLinDeflection: double
theAngDeflection: double
theMinPointsNb: int (optional, default to 2)
theMinSize: double (optional, default to Precision::Confusion())

Return
-------
None

Description
-----------
Constructor. Initiates discretization of the given geometric curve. 
Parameter theCurve curve to be discretized. 
Parameter theFirstParam first parameter of the curve. 
Parameter theLastParam last parameter of the curve. 
Parameter theLinDeflection linear deflection. 
Parameter theAngDeflection angular deflection. 
Parameter theMinPointsNb minimum number of points to be produced.
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool(const BRepAdaptor_Curve & theCurve, const double theFirstParam, const double theLastParam, const double theLinDeflection, const double theAngDeflection, const int theMinPointsNb = 2, const double theMinSize = Precision::Confusion());

		/****** BRepMesh_GeomTool::BRepMesh_GeomTool ******/
		/****** md5 signature: 215fc5542b52d309b825b8f9c2a641a7 ******/
		%feature("compactdefaultargs") BRepMesh_GeomTool;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepAdaptor_Surface
theIsoType: GeomAbs_IsoType
theParamIso: double
theFirstParam: double
theLastParam: double
theLinDeflection: double
theAngDeflection: double
theMinPointsNb: int (optional, default to 2)
theMinSize: double (optional, default to Precision::Confusion())

Return
-------
None

Description
-----------
Constructor. Initiates discretization of geometric curve corresponding to iso curve of the given surface. 
Parameter theSurface surface the iso curve to be taken from. 
Parameter theIsoType type of iso curve to be used, U or V. 
Parameter theParamIso parameter on the surface specifying the iso curve. 
Parameter theFirstParam first parameter of the curve. 
Parameter theLastParam last parameter of the curve. 
Parameter theLinDeflection linear deflection. 
Parameter theAngDeflection angular deflection. 
Parameter theMinPointsNb minimum number of points to be produced.
") BRepMesh_GeomTool;
		 BRepMesh_GeomTool(const opencascade::handle<BRepAdaptor_Surface> & theSurface, const GeomAbs_IsoType theIsoType, const double theParamIso, const double theFirstParam, const double theLastParam, const double theLinDeflection, const double theAngDeflection, const int theMinPointsNb = 2, const double theMinSize = Precision::Confusion());

		/****** BRepMesh_GeomTool::AddPoint ******/
		/****** md5 signature: 8cbf864390479793fcde56fe8d7d4fa2 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theParam: double
theIsReplace: bool (optional, default to true)

Return
-------
int

Description
-----------
Adds point to already calculated points (or replaces existing). 
Parameter thePoint point to be added. 
Parameter theParam parameter on the curve corresponding to the given point. 
Parameter theIsReplace if True replaces existing point lying within parametric tolerance of the given point. 
Return: index of new added point or found with parametric tolerance.
") AddPoint;
		int AddPoint(const gp_Pnt & thePoint, const double theParam, const bool theIsReplace = true);

		/****** BRepMesh_GeomTool::CellsCount ******/
		/****** md5 signature: ccb87ec8a4a6521c7325ce39b5e26ebf ******/
		%feature("compactdefaultargs") CellsCount;
		%feature("autodoc", "
Parameters
----------
theSurface: Adaptor3d_Surface
theVerticesNb: int
theDeflection: double
theRangeSplitter: BRepMesh_DefaultRangeSplitter *

Return
-------
std::pair<int, int >

Description
-----------
No available documentation.
") CellsCount;
		static std::pair<int, int > CellsCount(const opencascade::handle<Adaptor3d_Surface> & theSurface, const int theVerticesNb, const double theDeflection, const BRepMesh_DefaultRangeSplitter * theRangeSplitter);

		/****** BRepMesh_GeomTool::NbPoints ******/
		/****** md5 signature: 30bb12ae17a0afd90d9bd428b1b70e1c ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of discretization points.
") NbPoints;
		int NbPoints();

		/****** BRepMesh_GeomTool::SquareDeflectionOfSegment ******/
		/****** md5 signature: 1607ee3d75ef6ada59c4e181898e8a5f ******/
		%feature("compactdefaultargs") SquareDeflectionOfSegment;
		%feature("autodoc", "
Parameters
----------
theFirstPoint: gp_Pnt
theLastPoint: gp_Pnt
theMidPoint: gp_Pnt

Return
-------
double

Description
-----------
Compute deflection of the given segment.
") SquareDeflectionOfSegment;
		static double SquareDeflectionOfSegment(const gp_Pnt & theFirstPoint, const gp_Pnt & theLastPoint, const gp_Pnt & theMidPoint);

		/****** BRepMesh_GeomTool::Value ******/
		/****** md5 signature: 1c3d9e0402ba40354e5bb2ab89e2a1de ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theIsoParam: double
thePoint: gp_Pnt
theUV: gp_Pnt2d

Return
-------
theParam: double

Description
-----------
Gets parameters of discretization point with the given index. 
Parameter theIndex index of discretization point. 
Parameter theIsoParam parameter on surface to be used as second coordinate of resulting 2d point. @param[out] theParam parameter of the point on the iso curve. @param[out] thePoint discretization point. @param[out] theUV discretization point in parametric space of the surface. 
Return: True on success, False elsewhere.
") Value;
		bool Value(const int theIndex, const double theIsoParam, Standard_Real &OutValue, gp_Pnt & thePoint, gp_Pnt2d & theUV);

		/****** BRepMesh_GeomTool::Value ******/
		/****** md5 signature: eb36e8a45e406d6970f20f877b91d0fd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theSurface: BRepAdaptor_Surface
thePoint: gp_Pnt
theUV: gp_Pnt2d

Return
-------
theParam: double

Description
-----------
Gets parameters of discretization point with the given index. 
Parameter theIndex index of discretization point. 
Parameter theSurface surface the curve is lying onto. @param[out] theParam parameter of the point on the curve. @param[out] thePoint discretization point. @param[out] theUV discretization point in parametric space of the surface. 
Return: True on success, False elsewhere.
") Value;
		bool Value(const int theIndex, const opencascade::handle<BRepAdaptor_Surface> & theSurface, Standard_Real &OutValue, gp_Pnt & thePoint, gp_Pnt2d & theUV);

};


%extend BRepMesh_GeomTool {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IntLinLin(self):
		pass

	@methodnotwrapped
	def Normal(self):
		pass

	@methodnotwrapped
	def IntSegSeg(self):
		pass
	}
};

/*********************************
* class BRepMesh_MeshAlgoFactory *
*********************************/
class BRepMesh_MeshAlgoFactory : public IMeshTools_MeshAlgoFactory {
	public:
		/****** BRepMesh_MeshAlgoFactory::BRepMesh_MeshAlgoFactory ******/
		/****** md5 signature: 7549d3b374f6b6d36de722de051c7f9d ******/
		%feature("compactdefaultargs") BRepMesh_MeshAlgoFactory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_MeshAlgoFactory;
		 BRepMesh_MeshAlgoFactory();

		/****** BRepMesh_MeshAlgoFactory::GetAlgo ******/
		/****** md5 signature: a53690b3bb6a5ae23930dfea1a68b3df ******/
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "
Parameters
----------
theSurfaceType: GeomAbs_SurfaceType
theParameters: IMeshTools_Parameters

Return
-------
opencascade::handle<IMeshTools_MeshAlgo>

Description
-----------
Creates instance of meshing algorithm for the given type of surface.
") GetAlgo;
		opencascade::handle<IMeshTools_MeshAlgo> GetAlgo(const GeomAbs_SurfaceType theSurfaceType, const IMeshTools_Parameters & theParameters);

};


%make_alias(BRepMesh_MeshAlgoFactory)

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
		/****** BRepMesh_MeshTool::BRepMesh_MeshTool ******/
		/****** md5 signature: abf7f04fd724790ff05678b98f579e57 ******/
		%feature("compactdefaultargs") BRepMesh_MeshTool;
		%feature("autodoc", "
Parameters
----------
theStructure: BRepMesh_DataStructureOfDelaun

Return
-------
None

Description
-----------
Constructor. Initializes tool by the given data structure.
") BRepMesh_MeshTool;
		 BRepMesh_MeshTool(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theStructure);

		/****** BRepMesh_MeshTool::AddAndLegalizeTriangle ******/
		/****** md5 signature: 7829bddbfa7544e1077a59eaf6915dd6 ******/
		%feature("compactdefaultargs") AddAndLegalizeTriangle;
		%feature("autodoc", "
Parameters
----------
thePoint1: int
thePoint2: int
thePoint3: int

Return
-------
None

Description
-----------
Adds new triangle with specified nodes to mesh. Legalizes triangle in case if it violates circle criteria.
") AddAndLegalizeTriangle;
		void AddAndLegalizeTriangle(const int thePoint1, const int thePoint2, const int thePoint3);

		/****** BRepMesh_MeshTool::AddLink ******/
		/****** md5 signature: 7c20c0d2b9c506e1c1b536bdb9d03c94 ******/
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "
Parameters
----------
theFirstNode: int
theLastNode: int

Return
-------
theLinkIndex: int
theLinkOri: bool

Description
-----------
Adds new link to mesh. Updates link index and link orientation parameters.
") AddLink;
		void AddLink(const int theFirstNode, const int theLastNode, Standard_Integer &OutValue, Standard_Boolean &OutValue);

		/****** BRepMesh_MeshTool::AddTriangle ******/
		/****** md5 signature: 237839282ad05c5b4a869f237473daf1 ******/
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "
Parameters
----------
thePoint1: int
thePoint2: int
thePoint3: int
): int (  theEdges

Return
-------
None

Description
-----------
Adds new triangle with specified nodes to mesh.
") AddTriangle;
		void AddTriangle(const int thePoint1, const int thePoint2, const int thePoint3, int ( & theEdges )[3]);

		/****** BRepMesh_MeshTool::CleanFrontierLinks ******/
		/****** md5 signature: 63fc3ce6394f9f579070f64eb2be550d ******/
		%feature("compactdefaultargs") CleanFrontierLinks;
		%feature("autodoc", "Return
-------
None

Description
-----------
Cleans frontier links from triangles to the right.
") CleanFrontierLinks;
		void CleanFrontierLinks();

		/****** BRepMesh_MeshTool::EraseFreeLinks ******/
		/****** md5 signature: 9ab79c596458db6053095518f88e3455 ******/
		%feature("compactdefaultargs") EraseFreeLinks;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases all links that have no elements connected to them.
") EraseFreeLinks;
		void EraseFreeLinks();

		/****** BRepMesh_MeshTool::EraseFreeLinks ******/
		/****** md5 signature: f67077e6548c65402e2c7e421b63e2cb ******/
		%feature("compactdefaultargs") EraseFreeLinks;
		%feature("autodoc", "
Parameters
----------
theLinks: IMeshData::MapOfIntegerInteger

Return
-------
None

Description
-----------
Erases links from the specified map that have no elements connected to them.
") EraseFreeLinks;
		void EraseFreeLinks(const IMeshData::MapOfIntegerInteger & theLinks);

		/****** BRepMesh_MeshTool::EraseItemsConnectedTo ******/
		/****** md5 signature: 21d973629f787936107ce48979cab510 ******/
		%feature("compactdefaultargs") EraseItemsConnectedTo;
		%feature("autodoc", "
Parameters
----------
theNodeIndex: int

Return
-------
None

Description
-----------
Erases all elements connected to the specified artificial node. In addition, erases the artificial node itself.
") EraseItemsConnectedTo;
		void EraseItemsConnectedTo(const int theNodeIndex);

		/****** BRepMesh_MeshTool::EraseTriangle ******/
		/****** md5 signature: aa238953256144dca1ee178b2ed84f75 ******/
		%feature("compactdefaultargs") EraseTriangle;
		%feature("autodoc", "
Parameters
----------
theTriangleIndex: int
theLoopEdges: IMeshData::MapOfIntegerInteger

Return
-------
None

Description
-----------
Erases triangle with the given index and adds the free edges into the map. When an edge is suppressed more than one time it is destroyed.
") EraseTriangle;
		void EraseTriangle(const int theTriangleIndex, IMeshData::MapOfIntegerInteger & theLoopEdges);

		/****** BRepMesh_MeshTool::GetStructure ******/
		/****** md5 signature: e795ea8cb85d33692d442ec73fdda3d7 ******/
		%feature("compactdefaultargs") GetStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepMesh_DataStructureOfDelaun>

Description
-----------
Returns data structure manipulated by this tool.
") GetStructure;
		const opencascade::handle<BRepMesh_DataStructureOfDelaun> & GetStructure();

		/****** BRepMesh_MeshTool::Legalize ******/
		/****** md5 signature: ee96c75fb416bba75b2492d76e70e1f9 ******/
		%feature("compactdefaultargs") Legalize;
		%feature("autodoc", "
Parameters
----------
theLinkIndex: int

Return
-------
None

Description
-----------
Performs legalization of triangles connected to the specified link.
") Legalize;
		void Legalize(const int theLinkIndex);

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
		/****** BRepMesh_ModelBuilder::BRepMesh_ModelBuilder ******/
		/****** md5 signature: e21163d4054202c03d83d9426b67fc24 ******/
		%feature("compactdefaultargs") BRepMesh_ModelBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_ModelBuilder;
		 BRepMesh_ModelBuilder();

};


%make_alias(BRepMesh_ModelBuilder)

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
		/****** BRepMesh_ModelHealer::BRepMesh_ModelHealer ******/
		/****** md5 signature: 948893bb90e26ca087bd4ad5180e7013 ******/
		%feature("compactdefaultargs") BRepMesh_ModelHealer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_ModelHealer;
		 BRepMesh_ModelHealer();

};


%make_alias(BRepMesh_ModelHealer)

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
		/****** BRepMesh_ModelPostProcessor::BRepMesh_ModelPostProcessor ******/
		/****** md5 signature: 220accc2449438695c2ea192fc8ed2eb ******/
		%feature("compactdefaultargs") BRepMesh_ModelPostProcessor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_ModelPostProcessor;
		 BRepMesh_ModelPostProcessor();

};


%make_alias(BRepMesh_ModelPostProcessor)

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
		/****** BRepMesh_ModelPreProcessor::BRepMesh_ModelPreProcessor ******/
		/****** md5 signature: 033fde83a46641bf0c1cfc1161f23e39 ******/
		%feature("compactdefaultargs") BRepMesh_ModelPreProcessor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_ModelPreProcessor;
		 BRepMesh_ModelPreProcessor();

};


%make_alias(BRepMesh_ModelPreProcessor)

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
		/****** BRepMesh_OrientedEdge::BRepMesh_OrientedEdge ******/
		/****** md5 signature: 40cd54f8ff406e529cbca096a4dcba4a ******/
		%feature("compactdefaultargs") BRepMesh_OrientedEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_OrientedEdge;
		 BRepMesh_OrientedEdge();

		/****** BRepMesh_OrientedEdge::BRepMesh_OrientedEdge ******/
		/****** md5 signature: 01d2ba67be7a43b6938bb37f0ceaac5f ******/
		%feature("compactdefaultargs") BRepMesh_OrientedEdge;
		%feature("autodoc", "
Parameters
----------
theFirstNode: int
theLastNode: int

Return
-------
None

Description
-----------
Constructs a link between two vertices.
") BRepMesh_OrientedEdge;
		 BRepMesh_OrientedEdge(const int theFirstNode, const int theLastNode);

		/****** BRepMesh_OrientedEdge::FirstNode ******/
		/****** md5 signature: 72bbe0159880443ad8652c56d034da98 ******/
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index of first node of the Link.
") FirstNode;
		int FirstNode();

		/****** BRepMesh_OrientedEdge::IsEqual ******/
		/****** md5 signature: a3482701b3dd30b560f616dca1b3777d ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: BRepMesh_OrientedEdge

Return
-------
bool

Description
-----------
Checks this and other edge for equality. 
Parameter theOther edge to be checked against this one. 
Return: True if edges have the same orientation, False if not.
") IsEqual;
		bool IsEqual(const BRepMesh_OrientedEdge & theOther);

		/****** BRepMesh_OrientedEdge::LastNode ******/
		/****** md5 signature: 350c19624913baa6ef1e913c6c664f8f ******/
		%feature("compactdefaultargs") LastNode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index of last node of the Link.
") LastNode;
		int LastNode();


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
		/****** BRepMesh_PairOfIndex::BRepMesh_PairOfIndex ******/
		/****** md5 signature: 6097b08360d507b0b25a96e63ec387fc ******/
		%feature("compactdefaultargs") BRepMesh_PairOfIndex;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_PairOfIndex;
		 BRepMesh_PairOfIndex();

		/****** BRepMesh_PairOfIndex::Append ******/
		/****** md5 signature: c9bca4b81ea35764ef8b2def361b9b52 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Appends index to the pair.
") Append;
		void Append(const int theIndex);

		/****** BRepMesh_PairOfIndex::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears indices.
") Clear;
		void Clear();

		/****** BRepMesh_PairOfIndex::Extent ******/
		/****** md5 signature: 5ab265087cc74fd902b499a31008b06c ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of initialized indices.
") Extent;
		int Extent();

		/****** BRepMesh_PairOfIndex::FirstIndex ******/
		/****** md5 signature: 3d0ecf45a4218db4d290b67efa7d7062 ******/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns first index of pair.
") FirstIndex;
		int FirstIndex();

		/****** BRepMesh_PairOfIndex::Index ******/
		/****** md5 signature: 8bf42e5d7097224741dafc28df9c9372 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
thePairPos: int

Return
-------
int

Description
-----------
Returns index corresponding to the given position in the pair. 
Parameter thePairPos position of index in the pair (1 or 2).
") Index;
		int Index(const int thePairPos);

		/****** BRepMesh_PairOfIndex::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns is pair is empty.
") IsEmpty;
		bool IsEmpty();

		/****** BRepMesh_PairOfIndex::LastIndex ******/
		/****** md5 signature: 295d21a2bfa22b2d1acca0b940da470c ******/
		%feature("compactdefaultargs") LastIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns last index of pair.
") LastIndex;
		int LastIndex();

		/****** BRepMesh_PairOfIndex::Prepend ******/
		/****** md5 signature: 908f0c10b91bf830cb19a12d6039a999 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Prepends index to the pair.
") Prepend;
		void Prepend(const int theIndex);

		/****** BRepMesh_PairOfIndex::RemoveIndex ******/
		/****** md5 signature: 79e6867fa92ee555fe8d6aa81512abb8 ******/
		%feature("compactdefaultargs") RemoveIndex;
		%feature("autodoc", "
Parameters
----------
thePairPos: int

Return
-------
None

Description
-----------
Remove index from the given position. 
Parameter thePairPos position of index in the pair (1 or 2).
") RemoveIndex;
		void RemoveIndex(const int thePairPos);

		/****** BRepMesh_PairOfIndex::SetIndex ******/
		/****** md5 signature: 4688d216169ec6f0492ae3e8ec0a87e7 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
thePairPos: int
theIndex: int

Return
-------
None

Description
-----------
Sets index corresponding to the given position in the pair. 
Parameter thePairPos position of index in the pair (1 or 2). 
Parameter theIndex index to be stored.
") SetIndex;
		void SetIndex(const int thePairPos, const int theIndex);

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
		/****** BRepMesh_SelectorOfDataStructureOfDelaun::BRepMesh_SelectorOfDataStructureOfDelaun ******/
		/****** md5 signature: ae219e3399acd48f3ab1cb6666248e37 ******/
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun();

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::BRepMesh_SelectorOfDataStructureOfDelaun ******/
		/****** md5 signature: 48c378a21324a2a2e3f9741f9bb572cb ******/
		%feature("compactdefaultargs") BRepMesh_SelectorOfDataStructureOfDelaun;
		%feature("autodoc", "
Parameters
----------
theMesh: BRepMesh_DataStructureOfDelaun

Return
-------
None

Description
-----------
Constructor. Initializes selector by the mesh.
") BRepMesh_SelectorOfDataStructureOfDelaun;
		 BRepMesh_SelectorOfDataStructureOfDelaun(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theMesh);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::AddNeighbours ******/
		/****** md5 signature: 612e38bbb1676e77f251fed4962bc3c0 ******/
		%feature("compactdefaultargs") AddNeighbours;
		%feature("autodoc", "Return
-------
None

Description
-----------
Adds a level of neighbours by edge the selector.
") AddNeighbours;
		void AddNeighbours();

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::Elements ******/
		/****** md5 signature: f292154361efe8cff70b7224e0dd92bc ******/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Return
-------
IMeshData::MapOfInteger

Description
-----------
Returns selected elements.
") Elements;
		const IMeshData::MapOfInteger & Elements();

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::FrontierLinks ******/
		/****** md5 signature: e9fc3775f2eaeb5f9f3fb50a11ef1575 ******/
		%feature("compactdefaultargs") FrontierLinks;
		%feature("autodoc", "Return
-------
IMeshData::MapOfInteger

Description
-----------
Gives the list of incices of frontier links.
") FrontierLinks;
		const IMeshData::MapOfInteger & FrontierLinks();

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::Initialize ******/
		/****** md5 signature: c1c8bd53787e0b316ccb49ba7dddc083 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theMesh: BRepMesh_DataStructureOfDelaun

Return
-------
None

Description
-----------
Initializes selector by the mesh.
") Initialize;
		void Initialize(const opencascade::handle<BRepMesh_DataStructureOfDelaun> & theMesh);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::Links ******/
		/****** md5 signature: 444dc2c6e495f4e680bd1e7ea076ff0b ******/
		%feature("compactdefaultargs") Links;
		%feature("autodoc", "Return
-------
IMeshData::MapOfInteger

Description
-----------
Returns selected links.
") Links;
		const IMeshData::MapOfInteger & Links();

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursByEdgeOf ******/
		/****** md5 signature: 703ce4b8dca000f5c5b72a118362bf0f ******/
		%feature("compactdefaultargs") NeighboursByEdgeOf;
		%feature("autodoc", "
Parameters
----------
theElement: BRepMesh_Triangle

Return
-------
None

Description
-----------
Selects all neighboring elements by links of the given element.
") NeighboursByEdgeOf;
		void NeighboursByEdgeOf(const BRepMesh_Triangle & theElement);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursOf ******/
		/****** md5 signature: e712f7145e0999578d5e386408e4eda2 ******/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "
Parameters
----------
theNode: BRepMesh_Vertex

Return
-------
None

Description
-----------
Selects all neighboring elements of the given node.
") NeighboursOf;
		void NeighboursOf(const BRepMesh_Vertex & theNode);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursOf ******/
		/****** md5 signature: 255f43d123986364bff66ede6dd8a3a5 ******/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "
Parameters
----------
theLink: BRepMesh_Edge

Return
-------
None

Description
-----------
Selects all neighboring elements of the given link.
") NeighboursOf;
		void NeighboursOf(const BRepMesh_Edge & theLink);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursOf ******/
		/****** md5 signature: 851532ee376e16c26bffc7adba34cc4c ******/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "
Parameters
----------
theElement: BRepMesh_Triangle

Return
-------
None

Description
-----------
Selects all neighboring elements of the given element.
") NeighboursOf;
		void NeighboursOf(const BRepMesh_Triangle & theElement);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursOf ******/
		/****** md5 signature: eda74ad1f0361cb0f21c76c0370a0cc5 ******/
		%feature("compactdefaultargs") NeighboursOf;
		%feature("autodoc", "
Parameters
----------
&: BRepMesh_SelectorOfDataStructureOfDelaun

Return
-------
None

Description
-----------
Adds a level of neighbours by edge to the selector.
") NeighboursOf;
		void NeighboursOf(const BRepMesh_SelectorOfDataStructureOfDelaun &);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursOfElement ******/
		/****** md5 signature: c4a303eb0cdd551c752a54aa2faa497a ******/
		%feature("compactdefaultargs") NeighboursOfElement;
		%feature("autodoc", "
Parameters
----------
theElementIndex: int

Return
-------
None

Description
-----------
Selects all neighboring elements by nodes of the given element.
") NeighboursOfElement;
		void NeighboursOfElement(const int theElementIndex);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursOfLink ******/
		/****** md5 signature: b5508bd9dbae1dbcbf867500d9f81a99 ******/
		%feature("compactdefaultargs") NeighboursOfLink;
		%feature("autodoc", "
Parameters
----------
theLinkIndex: int

Return
-------
None

Description
-----------
Selects all neighboring elements of link with the given index.
") NeighboursOfLink;
		void NeighboursOfLink(const int theLinkIndex);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::NeighboursOfNode ******/
		/****** md5 signature: 3d4d6d3fed27cf0090867c042df67bc6 ******/
		%feature("compactdefaultargs") NeighboursOfNode;
		%feature("autodoc", "
Parameters
----------
theNodeIndex: int

Return
-------
None

Description
-----------
Selects all neighboring elements of node with the given index.
") NeighboursOfNode;
		void NeighboursOfNode(const int theNodeIndex);

		/****** BRepMesh_SelectorOfDataStructureOfDelaun::Nodes ******/
		/****** md5 signature: cc6f002fa70de151d7f5a1decc5ae05a ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
IMeshData::MapOfInteger

Description
-----------
Returns selected nodes.
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
		/****** BRepMesh_ShapeTool::AddInFace ******/
		/****** md5 signature: 198ec20231e3f0017b5211964797c170 ******/
		%feature("compactdefaultargs") AddInFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Stores the given triangulation into the given face. 
Parameter theFace face to be updated by triangulation. 
Parameter theTriangulation triangulation to be stored into the face.
") AddInFace;
		static void AddInFace(const TopoDS_Face & theFace, opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** BRepMesh_ShapeTool::BoxMaxDimension ******/
		/****** md5 signature: a0421cf67eb9f6c6a3385f2608069f49 ******/
		%feature("compactdefaultargs") BoxMaxDimension;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
theMaxDimension: double

Description
-----------
Gets the maximum dimension of the given bounding box. If the given bounding box is void leaves the resulting value unchanged. 
Parameter theBox bounding box to be processed. 
Parameter theMaxDimension maximum dimension of the given box.
") BoxMaxDimension;
		static void BoxMaxDimension(const Bnd_Box & theBox, Standard_Real &OutValue);

		/****** BRepMesh_ShapeTool::CheckAndUpdateFlags ******/
		/****** md5 signature: 3ee821bb2711b7bd7a20479acafb6e16 ******/
		%feature("compactdefaultargs") CheckAndUpdateFlags;
		%feature("autodoc", "
Parameters
----------
theEdge: IMeshData::IEdgeHandle
thePCurve: IMeshData::IPCurveHandle

Return
-------
None

Description
-----------
Checks same parameter, same range and degenerativity attributes using geometrical data of the given edge and updates edge model by computed parameters in case of worst case - it can drop flags same parameter and same range to False but never to True if it is already set to False. In contrary, it can also drop degenerated flag to True, but never to False if it is already set to True.
") CheckAndUpdateFlags;
		static void CheckAndUpdateFlags(const IMeshData::IEdgeHandle & theEdge, const IMeshData::IPCurveHandle & thePCurve);

		/****** BRepMesh_ShapeTool::MaxFaceTolerance ******/
		/****** md5 signature: 6b7fbb94c12e591400ca9a5a0d0705d1 ******/
		%feature("compactdefaultargs") MaxFaceTolerance;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
double

Description
-----------
Returns maximum tolerance of the given face. Considers tolerances of edges and vertices contained in the given face.
") MaxFaceTolerance;
		static double MaxFaceTolerance(const TopoDS_Face & theFace);

		/****** BRepMesh_ShapeTool::NullifyEdge ******/
		/****** md5 signature: 63cb3ab20f7b3e61366af5e02e4b252b ******/
		%feature("compactdefaultargs") NullifyEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theTriangulation: Poly_Triangulation
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Nullifies polygon on triangulation stored in the edge. 
Parameter theEdge edge to be updated by null polygon. 
Parameter theTriangulation triangulation the given edge is associated to. 
Parameter theLocation face location.
") NullifyEdge;
		static void NullifyEdge(const TopoDS_Edge & theEdge, const opencascade::handle<Poly_Triangulation> & theTriangulation, const TopLoc_Location & theLocation);

		/****** BRepMesh_ShapeTool::NullifyEdge ******/
		/****** md5 signature: a40c1f6240ceb504d322009c0248d48a ******/
		%feature("compactdefaultargs") NullifyEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Nullifies 3d polygon stored in the edge. 
Parameter theEdge edge to be updated by null polygon. 
Parameter theLocation face location.
") NullifyEdge;
		static void NullifyEdge(const TopoDS_Edge & theEdge, const TopLoc_Location & theLocation);

		/****** BRepMesh_ShapeTool::NullifyFace ******/
		/****** md5 signature: a54d800748c7d813530610836c345d65 ******/
		%feature("compactdefaultargs") NullifyFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Nullifies triangulation stored in the face. 
Parameter theFace face to be updated by null triangulation.
") NullifyFace;
		static void NullifyFace(const TopoDS_Face & theFace);

		/****** BRepMesh_ShapeTool::Range ******/
		/****** md5 signature: de45039a804cfa715ce16f5bc22cb788 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
thePCurve: Geom2d_Curve
isConsiderOrientation: bool (optional, default to false)

Return
-------
theFirstParam: double
theLastParam: double

Description
-----------
Gets the parametric range of the given edge on the given face.
") Range;
		static bool Range(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, opencascade::handle<Geom2d_Curve> & thePCurve, Standard_Real &OutValue, Standard_Real &OutValue, const bool isConsiderOrientation = false);

		/****** BRepMesh_ShapeTool::Range ******/
		/****** md5 signature: a9afccd7a30e8035170c515c7c5cc6aa ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theCurve: Geom_Curve
isConsiderOrientation: bool (optional, default to false)

Return
-------
theFirstParam: double
theLastParam: double

Description
-----------
Gets the 3d range of the given edge.
") Range;
		static bool Range(const TopoDS_Edge & theEdge, opencascade::handle<Geom_Curve> & theCurve, Standard_Real &OutValue, Standard_Real &OutValue, const bool isConsiderOrientation = false);

		/****** BRepMesh_ShapeTool::UVPoints ******/
		/****** md5 signature: 7083d0d1038d40b42b31303485a8b0b0 ******/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theFirstPoint2d: gp_Pnt2d
theLastPoint2d: gp_Pnt2d
isConsiderOrientation: bool (optional, default to false)

Return
-------
bool

Description
-----------
Gets the strict UV locations of the extremities of the edge using pcurve.
") UVPoints;
		static bool UVPoints(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, gp_Pnt2d & theFirstPoint2d, gp_Pnt2d & theLastPoint2d, const bool isConsiderOrientation = false);

		/****** BRepMesh_ShapeTool::UpdateEdge ******/
		/****** md5 signature: 1dec07dab2f9af22cc20cfc99d1d0b25 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePolygon: Poly_PolygonOnTriangulation
theTriangulation: Poly_Triangulation
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Updates the given edge by the given tessellated representation. 
Parameter theEdge edge to be updated. 
Parameter thePolygon tessellated representation of the edge to be stored. 
Parameter theTriangulation triangulation the given edge is associated to. 
Parameter theLocation face location.
") UpdateEdge;
		static void UpdateEdge(const TopoDS_Edge & theEdge, const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygon, const opencascade::handle<Poly_Triangulation> & theTriangulation, const TopLoc_Location & theLocation);

		/****** BRepMesh_ShapeTool::UpdateEdge ******/
		/****** md5 signature: 7d40445fe5ea272ec9d3f2c1b9ae4074 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePolygon: Poly_Polygon3D

Return
-------
None

Description
-----------
Updates the given edge by the given tessellated representation. 
Parameter theEdge edge to be updated. 
Parameter thePolygon tessellated representation of the edge to be stored.
") UpdateEdge;
		static void UpdateEdge(const TopoDS_Edge & theEdge, const opencascade::handle<Poly_Polygon3D> & thePolygon);

		/****** BRepMesh_ShapeTool::UpdateEdge ******/
		/****** md5 signature: 0272d97a0e3b199c5e8e189f4ac6c8b4 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
thePolygon1: Poly_PolygonOnTriangulation
thePolygon2: Poly_PolygonOnTriangulation
theTriangulation: Poly_Triangulation
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Updates the given seam edge by the given tessellated representations. 
Parameter theEdge edge to be updated. 
Parameter thePolygon1 tessellated representation corresponding to forward direction of the seam edge. 
Parameter thePolygon2 tessellated representation corresponding to reversed direction of the seam edge. 
Parameter theTriangulation triangulation the given edge is associated to. 
Parameter theLocation face location.
") UpdateEdge;
		static void UpdateEdge(const TopoDS_Edge & theEdge, const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygon1, const opencascade::handle<Poly_PolygonOnTriangulation> & thePolygon2, const opencascade::handle<Poly_Triangulation> & theTriangulation, const TopLoc_Location & theLocation);

		/****** BRepMesh_ShapeTool::UseLocation ******/
		/****** md5 signature: 1d483b4a9b5ac80702e3ffccb5ce462e ******/
		%feature("compactdefaultargs") UseLocation;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theLoc: TopLoc_Location

Return
-------
gp_Pnt

Description
-----------
Applies location to the given point and return result. 
Parameter thePnt point to be transformed. 
Parameter theLoc location to be applied.
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
		/****** BRepMesh_ShapeVisitor::BRepMesh_ShapeVisitor ******/
		/****** md5 signature: d1268466f38acd808d96645b2c71543a ******/
		%feature("compactdefaultargs") BRepMesh_ShapeVisitor;
		%feature("autodoc", "
Parameters
----------
theModel: IMeshData_Model

Return
-------
None

Description
-----------
Constructor.
") BRepMesh_ShapeVisitor;
		 BRepMesh_ShapeVisitor(const opencascade::handle<IMeshData_Model> & theModel);

		/****** BRepMesh_ShapeVisitor::Visit ******/
		/****** md5 signature: 36ac3c07a86e0160cfce1bcdaed621f9 ******/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Handles TopoDS_Face object.
") Visit;
		void Visit(const TopoDS_Face & theFace);

		/****** BRepMesh_ShapeVisitor::Visit ******/
		/****** md5 signature: 20969b16e89a24852ff9531667703226 ******/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Handles TopoDS_Edge object.
") Visit;
		void Visit(const TopoDS_Edge & theEdge);

};


%make_alias(BRepMesh_ShapeVisitor)

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
		/****** BRepMesh_Triangle::BRepMesh_Triangle ******/
		/****** md5 signature: a7b2afb496f1368f3f769aedd8d11850 ******/
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_Triangle;
		 BRepMesh_Triangle();

		/****** BRepMesh_Triangle::BRepMesh_Triangle ******/
		/****** md5 signature: 5f6639fc02e758d62a8cab90247fcf82 ******/
		%feature("compactdefaultargs") BRepMesh_Triangle;
		%feature("autodoc", "
Parameters
----------
): int (  theEdges
): bool (  theOrientations
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Constructor. 
Parameter theEdges array of edges of triangle. 
Parameter theOrientations array of edge's orientations. 
Parameter theMovability movability of triangle.
") BRepMesh_Triangle;
		 BRepMesh_Triangle(const int ( & theEdges )[3], const bool ( & theOrientations )[3], const BRepMesh_DegreeOfFreedom theMovability);

		/****** BRepMesh_Triangle::Edges ******/
		/****** md5 signature: 330d6929b7caebf54390223f2930cf3a ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
): int (  theEdges
): bool (  theOrientations

Return
-------
None

Description
-----------
Gets edges with orientations composing the triangle. @param[out] theEdges array edges are stored to. @param[out] theOrientations array orientations are stored to.
") Edges;
		void Edges(int ( & theEdges )[3], bool ( & theOrientations )[3]);

		/****** BRepMesh_Triangle::Initialize ******/
		/****** md5 signature: 0c5f2d8a14ac1a74f252add29cbd764b ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
): int (  theEdges
): bool (  theOrientations
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Initializes the triangle by the given parameters. 
Parameter theEdges array of edges of triangle. 
Parameter theOrientations array of edge's orientations. 
Parameter theMovability movability of triangle.
") Initialize;
		void Initialize(const int ( & theEdges )[3], const bool ( & theOrientations )[3], const BRepMesh_DegreeOfFreedom theMovability);

		/****** BRepMesh_Triangle::IsEqual ******/
		/****** md5 signature: d10424445dacf21ec39e4df652e4ab22 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: BRepMesh_Triangle

Return
-------
bool

Description
-----------
Checks for equality with another triangle. 
Parameter theOther triangle to be checked against this one. 
Return: True if equal, False if not.
") IsEqual;
		bool IsEqual(const BRepMesh_Triangle & theOther);

		/****** BRepMesh_Triangle::Movability ******/
		/****** md5 signature: 6205d0abeb2bc94f438d25da760d9f0b ******/
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "Return
-------
BRepMesh_DegreeOfFreedom

Description
-----------
Returns movability of the triangle.
") Movability;
		BRepMesh_DegreeOfFreedom Movability();

		/****** BRepMesh_Triangle::SetMovability ******/
		/****** md5 signature: 6a061b38c31857ee1d61d08ac2b621a5 ******/
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "
Parameters
----------
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Sets movability of the triangle.
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
		/****** BRepMesh_Triangulator::BRepMesh_Triangulator ******/
		/****** md5 signature: 699052d5cc149a39c6622c82868ab031 ******/
		%feature("compactdefaultargs") BRepMesh_Triangulator;
		%feature("autodoc", "
Parameters
----------
theXYZs: NCollection_DynamicArray<gp_XYZ>
theWires: NCollection_List<TColStd_SequenceOfInteger>
theNorm: gp_Dir

Return
-------
None

Description
-----------
Constructor. Initialized tool by the given parameters.
") BRepMesh_Triangulator;
		 BRepMesh_Triangulator(const NCollection_DynamicArray<gp_XYZ> & theXYZs, const NCollection_List<TColStd_SequenceOfInteger> & theWires, const gp_Dir & theNorm);

		/****** BRepMesh_Triangulator::Perform ******/
		/****** md5 signature: 12b937c665ea1f7fb66486a29a7a1903 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
thePolyTriangles: NCollection_List<Poly_Triangle>

Return
-------
bool

Description
-----------
Performs triangulation of source wires and stores triangles the output list.
") Perform;
		bool Perform(NCollection_List<Poly_Triangle> & thePolyTriangles);

		/****** BRepMesh_Triangulator::SetMessenger ******/
		/****** md5 signature: 64d8b30fe8bddfb6111cbf1a0e26e584 ******/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "
Parameters
----------
theMess: Message_Messenger

Return
-------
None

Description
-----------
Set messenger for output information without this Message::DefaultMessenger() will be used.
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & theMess);

		/****** BRepMesh_Triangulator::ToPolyTriangulation ******/
		/****** md5 signature: aec2641b2dd0980fb2f1535499d08137 ******/
		%feature("compactdefaultargs") ToPolyTriangulation;
		%feature("autodoc", "
Parameters
----------
theNodes: TColgp_Array1OfPnt
thePolyTriangles: NCollection_List<Poly_Triangle>

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Performs conversion of the given list of triangles to Poly_Triangulation.
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
		/****** BRepMesh_Vertex::BRepMesh_Vertex ******/
		/****** md5 signature: 3973d06ef43acb5c8647a9d5a5d533af ******/
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_Vertex;
		 BRepMesh_Vertex();

		/****** BRepMesh_Vertex::BRepMesh_Vertex ******/
		/****** md5 signature: 565493d5e074eef375bff6c75f7cd051 ******/
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "
Parameters
----------
theUV: gp_XY
theLocation3d: int
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Creates vertex associated with point in 3d space. 
Parameter theUV position of vertex in parametric space. 
Parameter theLocation3d index of 3d point to be associated with vertex. 
Parameter theMovability movability of the vertex.
") BRepMesh_Vertex;
		 BRepMesh_Vertex(const gp_XY & theUV, const int theLocation3d, const BRepMesh_DegreeOfFreedom theMovability);

		/****** BRepMesh_Vertex::BRepMesh_Vertex ******/
		/****** md5 signature: 8933f273c147399d8a851247bd221fc9 ******/
		%feature("compactdefaultargs") BRepMesh_Vertex;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Creates vertex without association with point in 3d space. 
Parameter theU U position of vertex in parametric space. 
Parameter theV V position of vertex in parametric space. 
Parameter theMovability movability of the vertex.
") BRepMesh_Vertex;
		 BRepMesh_Vertex(const double theU, const double theV, const BRepMesh_DegreeOfFreedom theMovability);

		/****** BRepMesh_Vertex::ChangeCoord ******/
		/****** md5 signature: f799b091563773cd52b21654e211a935 ******/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns position of the vertex in parametric space for modification.
") ChangeCoord;
		gp_XY ChangeCoord();

		/****** BRepMesh_Vertex::Coord ******/
		/****** md5 signature: 55c3583d2b85a3d85724dfd062f17fa4 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns position of the vertex in parametric space.
") Coord;
		const gp_XY Coord();

		/****** BRepMesh_Vertex::Initialize ******/
		/****** md5 signature: dfc8b3a89735b1eb8a7c1646cd8cf79d ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theUV: gp_XY
theLocation3d: int
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Initializes vertex associated with point in 3d space. 
Parameter theUV position of vertex in parametric space. 
Parameter theLocation3d index of 3d point to be associated with vertex. 
Parameter theMovability movability of the vertex.
") Initialize;
		void Initialize(const gp_XY & theUV, const int theLocation3d, const BRepMesh_DegreeOfFreedom theMovability);

		/****** BRepMesh_Vertex::IsEqual ******/
		/****** md5 signature: ddfa98b17760d5e270749e307c5e3748 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: BRepMesh_Vertex

Return
-------
bool

Description
-----------
Checks for equality with another vertex. 
Parameter theOther vertex to be checked against this one. 
Return: True if equal, False if not.
") IsEqual;
		bool IsEqual(const BRepMesh_Vertex & theOther);

		/****** BRepMesh_Vertex::Location3d ******/
		/****** md5 signature: f70ff1b961a607a23c12706262d40fd6 ******/
		%feature("compactdefaultargs") Location3d;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index of 3d point associated with the vertex.
") Location3d;
		int Location3d();

		/****** BRepMesh_Vertex::Movability ******/
		/****** md5 signature: 6205d0abeb2bc94f438d25da760d9f0b ******/
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "Return
-------
BRepMesh_DegreeOfFreedom

Description
-----------
Returns movability of the vertex.
") Movability;
		BRepMesh_DegreeOfFreedom Movability();

		/****** BRepMesh_Vertex::SetMovability ******/
		/****** md5 signature: 6a061b38c31857ee1d61d08ac2b621a5 ******/
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "
Parameters
----------
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Sets movability of the vertex.
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
class BRepMesh_VertexInspector {
	public:
typedef gp_XY Point;
typedef int Target;
		/****** BRepMesh_VertexInspector::BRepMesh_VertexInspector ******/
		/****** md5 signature: 7c9c8f3e11f83e3929f77935677ecf69 ******/
		%feature("compactdefaultargs") BRepMesh_VertexInspector;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_IncAllocator

Return
-------
None

Description
-----------
Constructor. 
Parameter theAllocator memory allocator to be used by internal collections.
") BRepMesh_VertexInspector;
		 BRepMesh_VertexInspector(const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****** BRepMesh_VertexInspector::Add ******/
		/****** md5 signature: be60a83b980ad08b9aae1070418e59e3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepMesh_Vertex

Return
-------
int

Description
-----------
Registers the given vertex. 
Parameter theVertex vertex to be registered.
") Add;
		int Add(const BRepMesh_Vertex & theVertex);

		/****** BRepMesh_VertexInspector::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear inspector's internal data structures.
") Clear;
		void Clear();

		/****** BRepMesh_VertexInspector::Coord ******/
		/****** md5 signature: 5eba5f8729bea7ab978c1279517b0fd3 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
i: int
thePnt: Point

Return
-------
double

Description
-----------
No available documentation.
") Coord;
		static double Coord(int i, const Point & thePnt);

		/****** BRepMesh_VertexInspector::Delete ******/
		/****** md5 signature: f462215551acb072a10b54b651f9e86b ******/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Deletes vertex with the given index. 
Parameter theIndex index of vertex to be removed.
") Delete;
		void Delete(const int theIndex);

		/****** BRepMesh_VertexInspector::GetCoincidentPoint ******/
		/****** md5 signature: 02d9f44434acf2f0b69d6380da86712d ******/
		%feature("compactdefaultargs") GetCoincidentPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns index of point coinciding with regerence one.
") GetCoincidentPoint;
		int GetCoincidentPoint();

		/****** BRepMesh_VertexInspector::GetListOfDelPoints ******/
		/****** md5 signature: 9164fa1026581bd683bb92f8b029f619 ******/
		%feature("compactdefaultargs") GetListOfDelPoints;
		%feature("autodoc", "Return
-------
IMeshData::ListOfInteger

Description
-----------
Returns list with indexes of vertices that have movability attribute equal to BRepMesh_Deleted and can be replaced with another node.
") GetListOfDelPoints;
		const IMeshData::ListOfInteger & GetListOfDelPoints();

		/****** BRepMesh_VertexInspector::GetVertex ******/
		/****** md5 signature: a60cc41aeebfb4392125ce0ea5ed2b2d ******/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Vertex

Description
-----------
Returns vertex with the given index.
") GetVertex;
		BRepMesh_Vertex & GetVertex(int theIndex);

		/****** BRepMesh_VertexInspector::Inspect ******/
		/****** md5 signature: dd798c744e199b3f5c30ca015e90aad3 ******/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "
Parameters
----------
theTargetIndex: int

Return
-------
NCollection_CellFilter_Action

Description
-----------
Performs inspection of a point with the given index. 
Parameter theTargetIndex index of a circle to be checked. 
Return: status of the check.
") Inspect;
		NCollection_CellFilter_Action Inspect(const int theTargetIndex);

		/****** BRepMesh_VertexInspector::IsEqual ******/
		/****** md5 signature: a72cd5cdf256628a847fe84b7fdf8a16 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theTargetIndex: int

Return
-------
bool

Description
-----------
Checks indices for equality.
") IsEqual;
		static bool IsEqual(const int theIndex, const int theTargetIndex);

		/****** BRepMesh_VertexInspector::NbVertices ******/
		/****** md5 signature: 676ffa5138c16f6d415a522aadbbc34b ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of registered vertices.
") NbVertices;
		int NbVertices();

		/****** BRepMesh_VertexInspector::SetPoint ******/
		/****** md5 signature: b521bfcebdca3f9d4da8c66d87603bc7 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_XY

Return
-------
None

Description
-----------
Set reference point to be checked.
") SetPoint;
		void SetPoint(const gp_XY & thePoint);

		/****** BRepMesh_VertexInspector::SetTolerance ******/
		/****** md5 signature: de1d8196b7a6b9be7e63e964a0a3482e ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Sets the tolerance to be used for identification of coincident vertices equal for both dimensions.
") SetTolerance;
		void SetTolerance(const double theTolerance);

		/****** BRepMesh_VertexInspector::SetTolerance ******/
		/****** md5 signature: 912c7c5e62fe1d7897120acc035dd203 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theToleranceX: double
theToleranceY: double

Return
-------
None

Description
-----------
Sets the tolerance to be used for identification of coincident vertices. 
Parameter theToleranceX tolerance for X dimension. 
Parameter theToleranceY tolerance for Y dimension.
") SetTolerance;
		void SetTolerance(const double theToleranceX, const double theToleranceY);

		/****** BRepMesh_VertexInspector::Shift ******/
		/****** md5 signature: a5c275ed1417a8e4b122622e7231a266 ******/
		%feature("compactdefaultargs") Shift;
		%feature("autodoc", "
Parameters
----------
thePnt: Point
theTol: double

Return
-------
Point

Description
-----------
No available documentation.
") Shift;
		static Point Shift(const Point & thePnt, double theTol);

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
		/****** BRepMesh_VertexTool::BRepMesh_VertexTool ******/
		/****** md5 signature: c1d46446841c2a0b024a242364fe45b0 ******/
		%feature("compactdefaultargs") BRepMesh_VertexTool;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_IncAllocator

Return
-------
None

Description
-----------
Constructor. 
Parameter theAllocator memory allocator to be used by internal collections.
") BRepMesh_VertexTool;
		 BRepMesh_VertexTool(const opencascade::handle<NCollection_IncAllocator> & theAllocator);

		/****** BRepMesh_VertexTool::Add ******/
		/****** md5 signature: de44ebf2aed5e681c392e155838cf399 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepMesh_Vertex
isForceAdd: bool

Return
-------
int

Description
-----------
Adds vertex with empty data to the tool. 
Parameter theVertex node to be added to the mesh. 
Parameter isForceAdd adds the given node to structure without checking on coincidence with other nodes. 
Return: index of the node in the structure.
") Add;
		int Add(const BRepMesh_Vertex & theVertex, const bool isForceAdd);

		/****** BRepMesh_VertexTool::DeleteVertex ******/
		/****** md5 signature: 506301e9131b658d8e4946bfd123c96f ******/
		%feature("compactdefaultargs") DeleteVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Deletes vertex with the given index from the tool.
") DeleteVertex;
		void DeleteVertex(const int theIndex);

		/****** BRepMesh_VertexTool::Extent ******/
		/****** md5 signature: 5ab265087cc74fd902b499a31008b06c ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns a number of vertices.
") Extent;
		int Extent();

		/****** BRepMesh_VertexTool::FindIndex ******/
		/****** md5 signature: d6aa12ad3c308d6ba263536323809697 ******/
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "
Parameters
----------
theVertex: BRepMesh_Vertex

Return
-------
int

Description
-----------
Returns index of the given vertex.
") FindIndex;
		int FindIndex(const BRepMesh_Vertex & theVertex);

		/****** BRepMesh_VertexTool::FindKey ******/
		/****** md5 signature: 74ee41303ebd354cfed8afd08d135a6f ******/
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BRepMesh_Vertex

Description
-----------
Returns vertex by the given index.
") FindKey;
		const BRepMesh_Vertex & FindKey(const int theIndex);

		/****** BRepMesh_VertexTool::GetListOfDelNodes ******/
		/****** md5 signature: 2052380f0276c30f6b6945ebb21ced96 ******/
		%feature("compactdefaultargs") GetListOfDelNodes;
		%feature("autodoc", "Return
-------
IMeshData::ListOfInteger

Description
-----------
Returns the list with indexes of vertices that have movability attribute equal to BRepMesh_Deleted and can be replaced with another node.
") GetListOfDelNodes;
		const IMeshData::ListOfInteger & GetListOfDelNodes();

		/****** BRepMesh_VertexTool::GetTolerance ******/
		/****** md5 signature: f94945fd97a98112479a800488135dab ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------

Return
-------
theToleranceX: double
theToleranceY: double

Description
-----------
Gets the tolerance to be used for identification of coincident vertices. 
Parameter theToleranceX tolerance for X dimension. 
Parameter theToleranceY tolerance for Y dimension.
") GetTolerance;
		void GetTolerance(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepMesh_VertexTool::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the map contains no keys.
") IsEmpty;
		bool IsEmpty();

		/****** BRepMesh_VertexTool::RemoveLast ******/
		/****** md5 signature: a5b2be74b40472d88621f86eb0fc42c1 ******/
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove last node from the structure.
") RemoveLast;
		void RemoveLast();

		/****** BRepMesh_VertexTool::SetCellSize ******/
		/****** md5 signature: 57f2ef2a03c8923e07186467a5158dcd ******/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
Sets new size of cell for cellfilter equal in both directions.
") SetCellSize;
		void SetCellSize(const double theSize);

		/****** BRepMesh_VertexTool::SetCellSize ******/
		/****** md5 signature: aad2055aac5834179dae9bca8ec7e206 ******/
		%feature("compactdefaultargs") SetCellSize;
		%feature("autodoc", "
Parameters
----------
theSizeX: double
theSizeY: double

Return
-------
None

Description
-----------
Sets new size of cell for cellfilter. 
Parameter theSizeX size for X dimension. 
Parameter theSizeY size for Y dimension.
") SetCellSize;
		void SetCellSize(const double theSizeX, const double theSizeY);

		/****** BRepMesh_VertexTool::SetTolerance ******/
		/****** md5 signature: de1d8196b7a6b9be7e63e964a0a3482e ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Sets the tolerance to be used for identification of coincident vertices equal for both dimensions.
") SetTolerance;
		void SetTolerance(const double theTolerance);

		/****** BRepMesh_VertexTool::SetTolerance ******/
		/****** md5 signature: 912c7c5e62fe1d7897120acc035dd203 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theToleranceX: double
theToleranceY: double

Return
-------
None

Description
-----------
Sets the tolerance to be used for identification of coincident vertices. 
Parameter theToleranceX tolerance for X dimension. 
Parameter theToleranceY tolerance for Y dimension.
") SetTolerance;
		void SetTolerance(const double theToleranceX, const double theToleranceY);

		/****** BRepMesh_VertexTool::Substitute ******/
		/****** md5 signature: 2a4563718012e8ba084360267c1d7acc ******/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVertex: BRepMesh_Vertex

Return
-------
None

Description
-----------
Substitutes vertex with the given by the given vertex with attributes. 
Parameter theIndex index of vertex to be substituted. 
Parameter theVertex replacement vertex.
") Substitute;
		void Substitute(const int theIndex, const BRepMesh_Vertex & theVertex);

};


%make_alias(BRepMesh_VertexTool)

%extend BRepMesh_VertexTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class hash<BRepMesh_Edge> *
****************************/
/************************************
* class hash<BRepMesh_OrientedEdge> *
************************************/
/********************************
* class hash<BRepMesh_Triangle> *
********************************/
/******************************
* class hash<BRepMesh_Vertex> *
******************************/
/***********************************
* class BRepMesh_ConeRangeSplitter *
***********************************/
class BRepMesh_ConeRangeSplitter : public BRepMesh_DefaultRangeSplitter {
	public:
		/****** BRepMesh_ConeRangeSplitter::BRepMesh_ConeRangeSplitter ******/
		/****** md5 signature: c2a09d5b5fa7cc75a1ed337e179842fc ******/
		%feature("compactdefaultargs") BRepMesh_ConeRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_ConeRangeSplitter;
		 BRepMesh_ConeRangeSplitter();

};


%extend BRepMesh_ConeRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetSplitSteps(self):
		pass
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
		/****** BRepMesh_CylinderRangeSplitter::BRepMesh_CylinderRangeSplitter ******/
		/****** md5 signature: 2727878f8b6f6d1e103a1f10931a8b01 ******/
		%feature("compactdefaultargs") BRepMesh_CylinderRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_CylinderRangeSplitter;
		 BRepMesh_CylinderRangeSplitter();

		/****** BRepMesh_CylinderRangeSplitter::Reset ******/
		/****** md5 signature: 962bdd43d5037ea92b4107fc702ce207 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Return
-------
None

Description
-----------
Resets this splitter. Must be called before first use.
") Reset;
		void Reset(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

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
		/****** BRepMesh_Edge::BRepMesh_Edge ******/
		/****** md5 signature: 148292be386085c6fd2cc96072e9c3de ******/
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_Edge;
		 BRepMesh_Edge();

		/****** BRepMesh_Edge::BRepMesh_Edge ******/
		/****** md5 signature: cc85ab387923d7f1a8acec59b88d27c4 ******/
		%feature("compactdefaultargs") BRepMesh_Edge;
		%feature("autodoc", "
Parameters
----------
theFirstNode: int
theLastNode: int
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Constructs a link between two vertices.
") BRepMesh_Edge;
		 BRepMesh_Edge(const int theFirstNode, const int theLastNode, const BRepMesh_DegreeOfFreedom theMovability);

		/****** BRepMesh_Edge::IsEqual ******/
		/****** md5 signature: cd3149de362fc6f7111de149727e9edb ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: BRepMesh_Edge

Return
-------
bool

Description
-----------
Checks for equality with another edge. 
Parameter theOther edge to be checked against this one. 
Return: True if equal, False if not.
") IsEqual;
		bool IsEqual(const BRepMesh_Edge & theOther);

		/****** BRepMesh_Edge::IsSameOrientation ******/
		/****** md5 signature: 071b04cf38b3c93a1a89c8f465e4ec85 ******/
		%feature("compactdefaultargs") IsSameOrientation;
		%feature("autodoc", "
Parameters
----------
theOther: BRepMesh_Edge

Return
-------
bool

Description
-----------
Checks if the given edge and this one have the same orientation. 
Parameter theOther edge to be checked against this one. eturn True if edges have the same orientation, False if not.
") IsSameOrientation;
		bool IsSameOrientation(const BRepMesh_Edge & theOther);

		/****** BRepMesh_Edge::Movability ******/
		/****** md5 signature: 6205d0abeb2bc94f438d25da760d9f0b ******/
		%feature("compactdefaultargs") Movability;
		%feature("autodoc", "Return
-------
BRepMesh_DegreeOfFreedom

Description
-----------
Returns movability flag of the Link.
") Movability;
		BRepMesh_DegreeOfFreedom Movability();

		/****** BRepMesh_Edge::SetMovability ******/
		/****** md5 signature: 6a061b38c31857ee1d61d08ac2b621a5 ******/
		%feature("compactdefaultargs") SetMovability;
		%feature("autodoc", "
Parameters
----------
theMovability: BRepMesh_DegreeOfFreedom

Return
-------
None

Description
-----------
Sets movability flag of the Link. 
Parameter theMovability flag to be set.
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
		/****** BRepMesh_IncrementalMesh::BRepMesh_IncrementalMesh ******/
		/****** md5 signature: 423409375831fd5b22ca5152c321696e ******/
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh();

		/****** BRepMesh_IncrementalMesh::BRepMesh_IncrementalMesh ******/
		/****** md5 signature: 1b34a6f67da30ab050f3b9cdd9843e1c ******/
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: double
isRelative: bool (optional, default to false)
theAngDeflection: double (optional, default to 0.5)
isInParallel: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructor. Automatically calls method Perform. 
Parameter theShape shape to be meshed. 
Parameter theLinDeflection linear deflection. 
Parameter isRelative if True deflection used for discretization of each edge will be <theLinDeflection> * <size of edge>. Deflection used for the faces will be the maximum deflection of their edges. 
Parameter theAngDeflection angular deflection. 
Parameter isInParallel if True shape will be meshed in parallel.
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh(const TopoDS_Shape & theShape, const double theLinDeflection, const bool isRelative = false, const double theAngDeflection = 0.5, const bool isInParallel = false);

		/****** BRepMesh_IncrementalMesh::BRepMesh_IncrementalMesh ******/
		/****** md5 signature: e5fd880315ea23df47b710ecb652dcf7 ******/
		%feature("compactdefaultargs") BRepMesh_IncrementalMesh;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor. Automatically calls method Perform. 
Parameter theShape shape to be meshed. 
Parameter theParameters - parameters of meshing.
") BRepMesh_IncrementalMesh;
		 BRepMesh_IncrementalMesh(const TopoDS_Shape & theShape, const IMeshTools_Parameters & theParameters, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepMesh_IncrementalMesh::ChangeParameters ******/
		/****** md5 signature: 7d357d2d707ea7c6e435ce7944cdbaeb ******/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Return
-------
IMeshTools_Parameters

Description
-----------
Returns modifiable meshing parameters.
") ChangeParameters;
		IMeshTools_Parameters & ChangeParameters();

		/****** BRepMesh_IncrementalMesh::Discret ******/
		/****** md5 signature: 50469435724d2f862dad65bb3e692d2b ******/
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: double
theAngDeflection: double
theAlgo: BRepMesh_DiscretRoot *

Return
-------
int

Description
-----------
Plugin interface for the Mesh Factories. Initializes meshing algorithm with the given parameters. 
Parameter theShape shape to be meshed. 
Parameter theLinDeflection linear deflection. 
Parameter theAngDeflection angular deflection. @param[out] theAlgo pointer to initialized algorithm.
") Discret;
		static int Discret(const TopoDS_Shape & theShape, const double theLinDeflection, const double theAngDeflection, BRepMesh_DiscretRoot * & theAlgo);

		/****** BRepMesh_IncrementalMesh::GetStatusFlags ******/
		/****** md5 signature: 596c7030e115827971ca94c5a7306fe7 ******/
		%feature("compactdefaultargs") GetStatusFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns accumulated status flags faced during meshing.
") GetStatusFlags;
		int GetStatusFlags();

		/****** BRepMesh_IncrementalMesh::IsModified ******/
		/****** md5 signature: 920c2209f061a6fd99334d34c69acfea ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns modified flag.
") IsModified;
		bool IsModified();

		/****** BRepMesh_IncrementalMesh::IsParallelDefault ******/
		/****** md5 signature: a0691187914df3165ddb16a17023155a ******/
		%feature("compactdefaultargs") IsParallelDefault;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).
") IsParallelDefault;
		static bool IsParallelDefault();

		/****** BRepMesh_IncrementalMesh::Parameters ******/
		/****** md5 signature: 80bd17a03936a7214968019ed0fbca90 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Return
-------
IMeshTools_Parameters

Description
-----------
Returns meshing parameters.
") Parameters;
		const IMeshTools_Parameters & Parameters();

		/****** BRepMesh_IncrementalMesh::Perform ******/
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs meshing of the shape.
") Perform;
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepMesh_IncrementalMesh::Perform ******/
		/****** md5 signature: 80d0d01860d5254f4b440d16b1acdcaf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theContext: IMeshTools_Context
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs meshing using custom context;.
") Perform;
		void Perform(const opencascade::handle<IMeshTools_Context> & theContext, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepMesh_IncrementalMesh::SetParallelDefault ******/
		/****** md5 signature: f87f1b287d9fbc2aa1ed840d65fc6d93 ******/
		%feature("compactdefaultargs") SetParallelDefault;
		%feature("autodoc", "
Parameters
----------
isInParallel: bool

Return
-------
None

Description
-----------
Setup multi-threading usage flag set by default in Discret() static method (thus applied only to Mesh Factories).
") SetParallelDefault;
		static void SetParallelDefault(const bool isInParallel);

};


%make_alias(BRepMesh_IncrementalMesh)

%extend BRepMesh_IncrementalMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepMesh_IncrementalMeshFactory *
****************************************/
class BRepMesh_IncrementalMeshFactory : public BRepMesh_DiscretAlgoFactory {
	public:
		/****** BRepMesh_IncrementalMeshFactory::BRepMesh_IncrementalMeshFactory ******/
		/****** md5 signature: be33913570f73fc80410ca5d74c5d367 ******/
		%feature("compactdefaultargs") BRepMesh_IncrementalMeshFactory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor. Registers this factory under the name 'FastDiscret'.
") BRepMesh_IncrementalMeshFactory;
		 BRepMesh_IncrementalMeshFactory();

		/****** BRepMesh_IncrementalMeshFactory::CreateAlgorithm ******/
		/****** md5 signature: e1b970da472d5716fb372949d240fb66 ******/
		%feature("compactdefaultargs") CreateAlgorithm;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theLinDeflection: double
theAngDeflection: double

Return
-------
opencascade::handle<BRepMesh_DiscretRoot>

Description
-----------
Creates a new BRepMesh_IncrementalMesh instance. 
Input parameter: theShape shape to be meshed 
Input parameter: theLinDeflection linear deflection for meshing 
Input parameter: theAngDeflection angular deflection for meshing 
Return: new meshing algorithm instance.
") CreateAlgorithm;
		opencascade::handle<BRepMesh_DiscretRoot> CreateAlgorithm(const TopoDS_Shape & theShape, double theLinDeflection, double theAngDeflection);

};


%make_alias(BRepMesh_IncrementalMeshFactory)

%extend BRepMesh_IncrementalMeshFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepMesh_SphereRangeSplitter *
*************************************/
class BRepMesh_SphereRangeSplitter : public BRepMesh_DefaultRangeSplitter {
	public:
		/****** BRepMesh_SphereRangeSplitter::BRepMesh_SphereRangeSplitter ******/
		/****** md5 signature: fa2ba708f742ef5f4220c463e61bba0f ******/
		%feature("compactdefaultargs") BRepMesh_SphereRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
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
		/****** BRepMesh_UVParamRangeSplitter::BRepMesh_UVParamRangeSplitter ******/
		/****** md5 signature: 67ecdfad250fd0a84fb935ac4c1d8a40 ******/
		%feature("compactdefaultargs") BRepMesh_UVParamRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_UVParamRangeSplitter;
		 BRepMesh_UVParamRangeSplitter();

		/****** BRepMesh_UVParamRangeSplitter::GetParametersU ******/
		/****** md5 signature: 5ee87ca295b7089622b34597ba0fa7dc ******/
		%feature("compactdefaultargs") GetParametersU;
		%feature("autodoc", "Return
-------
IMeshData::IMapOfReal

Description
-----------
Returns U parameters.
") GetParametersU;
		const IMeshData::IMapOfReal & GetParametersU();

		/****** BRepMesh_UVParamRangeSplitter::GetParametersU ******/
		/****** md5 signature: 6ffbc2e9c1bbf06f60cc0560c30ac041 ******/
		%feature("compactdefaultargs") GetParametersU;
		%feature("autodoc", "Return
-------
IMeshData::IMapOfReal

Description
-----------
Returns U parameters.
") GetParametersU;
		IMeshData::IMapOfReal & GetParametersU();

		/****** BRepMesh_UVParamRangeSplitter::GetParametersV ******/
		/****** md5 signature: 307ff0c2c9d7f6c020220dd1bb3fafcb ******/
		%feature("compactdefaultargs") GetParametersV;
		%feature("autodoc", "Return
-------
IMeshData::IMapOfReal

Description
-----------
Returns V parameters.
") GetParametersV;
		const IMeshData::IMapOfReal & GetParametersV();

		/****** BRepMesh_UVParamRangeSplitter::GetParametersV ******/
		/****** md5 signature: da5da90265c614d65bf736490d481963 ******/
		%feature("compactdefaultargs") GetParametersV;
		%feature("autodoc", "Return
-------
IMeshData::IMapOfReal

Description
-----------
Returns V parameters.
") GetParametersV;
		IMeshData::IMapOfReal & GetParametersV();

		/****** BRepMesh_UVParamRangeSplitter::Reset ******/
		/****** md5 signature: d4c1d758d2f2656d49088dafefac9897 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters

Return
-------
None

Description
-----------
Resets this splitter.
") Reset;
		void Reset(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters);

};


%extend BRepMesh_UVParamRangeSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepMesh_CustomBaseMeshAlgo *
************************************/
/**************************************
* class BRepMesh_DelaunayBaseMeshAlgo *
**************************************/
class BRepMesh_DelaunayBaseMeshAlgo : public BRepMesh_ConstrainedBaseMeshAlgo {
	public:
		/****** BRepMesh_DelaunayBaseMeshAlgo::BRepMesh_DelaunayBaseMeshAlgo ******/
		/****** md5 signature: 97c6d3100758038d31c815f1082e8034 ******/
		%feature("compactdefaultargs") BRepMesh_DelaunayBaseMeshAlgo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_DelaunayBaseMeshAlgo;
		 BRepMesh_DelaunayBaseMeshAlgo();

};


%make_alias(BRepMesh_DelaunayBaseMeshAlgo)

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
		/****** BRepMesh_NURBSRangeSplitter::BRepMesh_NURBSRangeSplitter ******/
		/****** md5 signature: 10713871cb23211ba4a316e12a7f927a ******/
		%feature("compactdefaultargs") BRepMesh_NURBSRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_NURBSRangeSplitter;
		 BRepMesh_NURBSRangeSplitter();

		/****** BRepMesh_NURBSRangeSplitter::AdjustRange ******/
		/****** md5 signature: 669ac551a5f5969d5f8dc788f9ae4baa ******/
		%feature("compactdefaultargs") AdjustRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates discrete range of surface according to its geometric range.
") AdjustRange;
		void AdjustRange();

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
		/****** BRepMesh_TorusRangeSplitter::BRepMesh_TorusRangeSplitter ******/
		/****** md5 signature: 0244663b5af259d86cf8cb43480cb4a7 ******/
		%feature("compactdefaultargs") BRepMesh_TorusRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_TorusRangeSplitter;
		 BRepMesh_TorusRangeSplitter();

		/****** BRepMesh_TorusRangeSplitter::AddPoint ******/
		/****** md5 signature: b573c284768181be61b81bd4d501f662 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Registers border point.
") AddPoint;
		void AddPoint(const gp_Pnt2d & thePoint);

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
		/****** BRepMesh_BoundaryParamsRangeSplitter::BRepMesh_BoundaryParamsRangeSplitter ******/
		/****** md5 signature: 30ad7c76fd8178815b6514841e1fdcc8 ******/
		%feature("compactdefaultargs") BRepMesh_BoundaryParamsRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_BoundaryParamsRangeSplitter;
		 BRepMesh_BoundaryParamsRangeSplitter();

		/****** BRepMesh_BoundaryParamsRangeSplitter::AddPoint ******/
		/****** md5 signature: 0cd6ea3b190c636d24d41ce8dcca254e ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Registers border point.
") AddPoint;
		void AddPoint(const gp_Pnt2d & thePoint);

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
		/****** BRepMesh_DelabellaBaseMeshAlgo::BRepMesh_DelabellaBaseMeshAlgo ******/
		/****** md5 signature: b41dc635f954c50092b5b7a76bf71647 ******/
		%feature("compactdefaultargs") BRepMesh_DelabellaBaseMeshAlgo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepMesh_DelabellaBaseMeshAlgo;
		 BRepMesh_DelabellaBaseMeshAlgo();

};


%make_alias(BRepMesh_DelabellaBaseMeshAlgo)

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
		/****** BRepMesh_ExtrusionRangeSplitter::BRepMesh_ExtrusionRangeSplitter ******/
		/****** md5 signature: 3c559a04dcb6f650591e1bfa9a0f4b84 ******/
		%feature("compactdefaultargs") BRepMesh_ExtrusionRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
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
		/****** BRepMesh_UndefinedRangeSplitter::BRepMesh_UndefinedRangeSplitter ******/
		/****** md5 signature: 5c53eb23928b63c40a7d556a5d49e6e7 ******/
		%feature("compactdefaultargs") BRepMesh_UndefinedRangeSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
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
class BRepMesh_WireInterferenceChecker:
	pass

@classnotwrapped
class BRepMesh_EdgeTessellator:
	pass

@classnotwrapped
class BRepMesh_EdgeTessellationExtractor:
	pass

@classnotwrapped
class BRepMesh_EdgeParameterProvider:
	pass

@classnotwrapped
class BRepMesh_FastDiscret:
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
class BRepMesh_CustomBaseMeshAlgo:
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
}
/* deprecated methods */
%pythoncode {
@deprecated
def BRepMesh_CircleInspector_Coord(*args):
	return BRepMesh_CircleInspector.Coord(*args)

@deprecated
def BRepMesh_CircleInspector_IsEqual(*args):
	return BRepMesh_CircleInspector.IsEqual(*args)

@deprecated
def BRepMesh_CircleInspector_Shift(*args):
	return BRepMesh_CircleInspector.Shift(*args)

@deprecated
def BRepMesh_CircleTool_MakeCircle(*args):
	return BRepMesh_CircleTool.MakeCircle(*args)

@deprecated
def BRepMesh_Deflection_ComputeAbsoluteDeflection(*args):
	return BRepMesh_Deflection.ComputeAbsoluteDeflection(*args)

@deprecated
def BRepMesh_Deflection_ComputeDeflection(*args):
	return BRepMesh_Deflection.ComputeDeflection(*args)

@deprecated
def BRepMesh_Deflection_ComputeDeflection(*args):
	return BRepMesh_Deflection.ComputeDeflection(*args)

@deprecated
def BRepMesh_Deflection_ComputeDeflection(*args):
	return BRepMesh_Deflection.ComputeDeflection(*args)

@deprecated
def BRepMesh_Deflection_IsConsistent(*args):
	return BRepMesh_Deflection.IsConsistent(*args)

@deprecated
def BRepMesh_DiscretAlgoFactory_DefaultFactory(*args):
	return BRepMesh_DiscretAlgoFactory.DefaultFactory(*args)

@deprecated
def BRepMesh_DiscretAlgoFactory_Factories(*args):
	return BRepMesh_DiscretAlgoFactory.Factories(*args)

@deprecated
def BRepMesh_DiscretAlgoFactory_FindFactory(*args):
	return BRepMesh_DiscretAlgoFactory.FindFactory(*args)

@deprecated
def BRepMesh_DiscretAlgoFactory_RegisterFactory(*args):
	return BRepMesh_DiscretAlgoFactory.RegisterFactory(*args)

@deprecated
def BRepMesh_DiscretAlgoFactory_UnregisterFactory(*args):
	return BRepMesh_DiscretAlgoFactory.UnregisterFactory(*args)

@deprecated
def BRepMesh_DiscretFactory_Get(*args):
	return BRepMesh_DiscretFactory.Get(*args)

@deprecated
def BRepMesh_EdgeDiscret_CreateEdgeTessellationExtractor(*args):
	return BRepMesh_EdgeDiscret.CreateEdgeTessellationExtractor(*args)

@deprecated
def BRepMesh_EdgeDiscret_CreateEdgeTessellator(*args):
	return BRepMesh_EdgeDiscret.CreateEdgeTessellator(*args)

@deprecated
def BRepMesh_EdgeDiscret_CreateEdgeTessellator(*args):
	return BRepMesh_EdgeDiscret.CreateEdgeTessellator(*args)

@deprecated
def BRepMesh_EdgeDiscret_Tessellate2d(*args):
	return BRepMesh_EdgeDiscret.Tessellate2d(*args)

@deprecated
def BRepMesh_EdgeDiscret_Tessellate3d(*args):
	return BRepMesh_EdgeDiscret.Tessellate3d(*args)

@deprecated
def BRepMesh_GeomTool_CellsCount(*args):
	return BRepMesh_GeomTool.CellsCount(*args)

@deprecated
def BRepMesh_GeomTool_SquareDeflectionOfSegment(*args):
	return BRepMesh_GeomTool.SquareDeflectionOfSegment(*args)

@deprecated
def BRepMesh_ShapeTool_AddInFace(*args):
	return BRepMesh_ShapeTool.AddInFace(*args)

@deprecated
def BRepMesh_ShapeTool_BoxMaxDimension(*args):
	return BRepMesh_ShapeTool.BoxMaxDimension(*args)

@deprecated
def BRepMesh_ShapeTool_CheckAndUpdateFlags(*args):
	return BRepMesh_ShapeTool.CheckAndUpdateFlags(*args)

@deprecated
def BRepMesh_ShapeTool_MaxFaceTolerance(*args):
	return BRepMesh_ShapeTool.MaxFaceTolerance(*args)

@deprecated
def BRepMesh_ShapeTool_NullifyEdge(*args):
	return BRepMesh_ShapeTool.NullifyEdge(*args)

@deprecated
def BRepMesh_ShapeTool_NullifyEdge(*args):
	return BRepMesh_ShapeTool.NullifyEdge(*args)

@deprecated
def BRepMesh_ShapeTool_NullifyFace(*args):
	return BRepMesh_ShapeTool.NullifyFace(*args)

@deprecated
def BRepMesh_ShapeTool_Range(*args):
	return BRepMesh_ShapeTool.Range(*args)

@deprecated
def BRepMesh_ShapeTool_Range(*args):
	return BRepMesh_ShapeTool.Range(*args)

@deprecated
def BRepMesh_ShapeTool_UVPoints(*args):
	return BRepMesh_ShapeTool.UVPoints(*args)

@deprecated
def BRepMesh_ShapeTool_UpdateEdge(*args):
	return BRepMesh_ShapeTool.UpdateEdge(*args)

@deprecated
def BRepMesh_ShapeTool_UpdateEdge(*args):
	return BRepMesh_ShapeTool.UpdateEdge(*args)

@deprecated
def BRepMesh_ShapeTool_UpdateEdge(*args):
	return BRepMesh_ShapeTool.UpdateEdge(*args)

@deprecated
def BRepMesh_ShapeTool_UseLocation(*args):
	return BRepMesh_ShapeTool.UseLocation(*args)

@deprecated
def BRepMesh_Triangulator_ToPolyTriangulation(*args):
	return BRepMesh_Triangulator.ToPolyTriangulation(*args)

@deprecated
def BRepMesh_VertexInspector_Coord(*args):
	return BRepMesh_VertexInspector.Coord(*args)

@deprecated
def BRepMesh_VertexInspector_IsEqual(*args):
	return BRepMesh_VertexInspector.IsEqual(*args)

@deprecated
def BRepMesh_VertexInspector_Shift(*args):
	return BRepMesh_VertexInspector.Shift(*args)

@deprecated
def BRepMesh_IncrementalMesh_Discret(*args):
	return BRepMesh_IncrementalMesh.Discret(*args)

@deprecated
def BRepMesh_IncrementalMesh_IsParallelDefault(*args):
	return BRepMesh_IncrementalMesh.IsParallelDefault(*args)

@deprecated
def BRepMesh_IncrementalMesh_SetParallelDefault(*args):
	return BRepMesh_IncrementalMesh.SetParallelDefault(*args)

}
