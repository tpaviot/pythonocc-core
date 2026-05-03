/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPLIBDOCSTRING
"BRepLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_breplib.html"
%enddef
%module (package="OCC.Core", docstring=BREPLIBDOCSTRING) BRepLib


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
#include<BRepLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<BRepTools_module.hxx>
#include<TopLoc_module.hxx>
#include<Poly_module.hxx>
#include<TopoDS_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopoDS.i
%import GeomAbs.i
%import Geom2d.i
%import Adaptor3d.i
%import Geom.i
%import BRepTools.i
%import TopLoc.i
%import Poly.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepLib_EdgeError {
	BRepLib_EdgeDone = 0,
	BRepLib_PointProjectionFailed = 1,
	BRepLib_ParameterOutOfRange = 2,
	BRepLib_DifferentPointsOnClosedCurve = 3,
	BRepLib_PointWithInfiniteParameter = 4,
	BRepLib_DifferentsPointAndParameter = 5,
	BRepLib_LineThroughIdenticPoints = 6,
};

enum BRepLib_FaceError {
	BRepLib_FaceDone = 0,
	BRepLib_NoFace = 1,
	BRepLib_NotPlanar = 2,
	BRepLib_CurveProjectionFailed = 3,
	BRepLib_ParametersOutOfRange = 4,
};

enum BRepLib_ShapeModification {
	BRepLib_Preserved = 0,
	BRepLib_Deleted = 1,
	BRepLib_Trimmed = 2,
	BRepLib_Merged = 3,
	BRepLib_BoundaryModified = 4,
};

enum BRepLib_ShellError {
	BRepLib_ShellDone = 0,
	BRepLib_EmptyShell = 1,
	BRepLib_DisconnectedShell = 2,
	BRepLib_ShellParametersOutOfRange = 3,
};

enum BRepLib_WireError {
	BRepLib_WireDone = 0,
	BRepLib_EmptyWire = 1,
	BRepLib_DisconnectedWire = 2,
	BRepLib_NonManifoldWire = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BRepLib_EdgeError(IntEnum):
	BRepLib_EdgeDone = 0
	BRepLib_PointProjectionFailed = 1
	BRepLib_ParameterOutOfRange = 2
	BRepLib_DifferentPointsOnClosedCurve = 3
	BRepLib_PointWithInfiniteParameter = 4
	BRepLib_DifferentsPointAndParameter = 5
	BRepLib_LineThroughIdenticPoints = 6
BRepLib_EdgeDone = BRepLib_EdgeError.BRepLib_EdgeDone
BRepLib_PointProjectionFailed = BRepLib_EdgeError.BRepLib_PointProjectionFailed
BRepLib_ParameterOutOfRange = BRepLib_EdgeError.BRepLib_ParameterOutOfRange
BRepLib_DifferentPointsOnClosedCurve = BRepLib_EdgeError.BRepLib_DifferentPointsOnClosedCurve
BRepLib_PointWithInfiniteParameter = BRepLib_EdgeError.BRepLib_PointWithInfiniteParameter
BRepLib_DifferentsPointAndParameter = BRepLib_EdgeError.BRepLib_DifferentsPointAndParameter
BRepLib_LineThroughIdenticPoints = BRepLib_EdgeError.BRepLib_LineThroughIdenticPoints

class BRepLib_FaceError(IntEnum):
	BRepLib_FaceDone = 0
	BRepLib_NoFace = 1
	BRepLib_NotPlanar = 2
	BRepLib_CurveProjectionFailed = 3
	BRepLib_ParametersOutOfRange = 4
BRepLib_FaceDone = BRepLib_FaceError.BRepLib_FaceDone
BRepLib_NoFace = BRepLib_FaceError.BRepLib_NoFace
BRepLib_NotPlanar = BRepLib_FaceError.BRepLib_NotPlanar
BRepLib_CurveProjectionFailed = BRepLib_FaceError.BRepLib_CurveProjectionFailed
BRepLib_ParametersOutOfRange = BRepLib_FaceError.BRepLib_ParametersOutOfRange

class BRepLib_ShapeModification(IntEnum):
	BRepLib_Preserved = 0
	BRepLib_Deleted = 1
	BRepLib_Trimmed = 2
	BRepLib_Merged = 3
	BRepLib_BoundaryModified = 4
BRepLib_Preserved = BRepLib_ShapeModification.BRepLib_Preserved
BRepLib_Deleted = BRepLib_ShapeModification.BRepLib_Deleted
BRepLib_Trimmed = BRepLib_ShapeModification.BRepLib_Trimmed
BRepLib_Merged = BRepLib_ShapeModification.BRepLib_Merged
BRepLib_BoundaryModified = BRepLib_ShapeModification.BRepLib_BoundaryModified

class BRepLib_ShellError(IntEnum):
	BRepLib_ShellDone = 0
	BRepLib_EmptyShell = 1
	BRepLib_DisconnectedShell = 2
	BRepLib_ShellParametersOutOfRange = 3
BRepLib_ShellDone = BRepLib_ShellError.BRepLib_ShellDone
BRepLib_EmptyShell = BRepLib_ShellError.BRepLib_EmptyShell
BRepLib_DisconnectedShell = BRepLib_ShellError.BRepLib_DisconnectedShell
BRepLib_ShellParametersOutOfRange = BRepLib_ShellError.BRepLib_ShellParametersOutOfRange

class BRepLib_WireError(IntEnum):
	BRepLib_WireDone = 0
	BRepLib_EmptyWire = 1
	BRepLib_DisconnectedWire = 2
	BRepLib_NonManifoldWire = 3
BRepLib_WireDone = BRepLib_WireError.BRepLib_WireDone
BRepLib_EmptyWire = BRepLib_WireError.BRepLib_EmptyWire
BRepLib_DisconnectedWire = BRepLib_WireError.BRepLib_DisconnectedWire
BRepLib_NonManifoldWire = BRepLib_WireError.BRepLib_NonManifoldWire
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************
* class BRepLib *
****************/
%rename(breplib) BRepLib;
class BRepLib {
	public:
		/****** BRepLib::BoundingVertex ******/
		/****** md5 signature: 44ef9202099c72cdb1465b821b583924 ******/
		%feature("compactdefaultargs") BoundingVertex;
		%feature("autodoc", "
Parameters
----------
theLV: NCollection_List<TopoDS_Shape>
theNewCenter: gp_Pnt

Return
-------
theNewTol: double

Description
-----------
Calculates the bounding sphere around the set of vertexes from the theLV list. Returns the center (theNewCenter) and the radius (theNewTol) of this sphere. This can be used to construct the new vertex which covers the given set of other vertices.
") BoundingVertex;
		static void BoundingVertex(const NCollection_List<TopoDS_Shape> & theLV, gp_Pnt & theNewCenter, Standard_Real &OutValue);

		/****** BRepLib::BuildCurve3d ******/
		/****** md5 signature: 9fe7a270bbad327f47685c8b8ced4221 ******/
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Tolerance: double (optional, default to 1.0e-5)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
MaxDegree: int (optional, default to 14)
MaxSegment: int (optional, default to 0)

Return
-------
bool

Description
-----------
Computes the 3d curve for the edge <E> if it does not exist. Returns True if the curve was computed or existed. Returns False if there is no planar pcurve or the computation failed. <MaxSegment> >= 30 in approximation.
") BuildCurve3d;
		static bool BuildCurve3d(const TopoDS_Edge & E, const double Tolerance = 1.0e-5, const GeomAbs_Shape Continuity = GeomAbs_C1, const int MaxDegree = 14, const int MaxSegment = 0);

		/****** BRepLib::BuildCurves3d ******/
		/****** md5 signature: 85b53a8b0e21948332027291614b2c56 ******/
		%feature("compactdefaultargs") BuildCurves3d;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tolerance: double
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
MaxDegree: int (optional, default to 14)
MaxSegment: int (optional, default to 0)

Return
-------
bool

Description
-----------
Computes the 3d curves for all the edges of <S> return False if one of the computation failed. <MaxSegment> >= 30 in approximation.
") BuildCurves3d;
		static bool BuildCurves3d(const TopoDS_Shape & S, const double Tolerance, const GeomAbs_Shape Continuity = GeomAbs_C1, const int MaxDegree = 14, const int MaxSegment = 0);

		/****** BRepLib::BuildCurves3d ******/
		/****** md5 signature: 1165cb939081d5fdfc73ea2b13742bc0 ******/
		%feature("compactdefaultargs") BuildCurves3d;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Computes the 3d curves for all the edges of <S> return False if one of the computation failed.
") BuildCurves3d;
		static bool BuildCurves3d(const TopoDS_Shape & S);

		/****** BRepLib::BuildPCurveForEdgeOnPlane ******/
		/****** md5 signature: eb2eaf6bd1e25fb580fd234600800513 ******/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
theF: TopoDS_Face

Return
-------
None

Description
-----------
Builds pcurve of edge on face if the surface is plane, and updates the edge.
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane(const TopoDS_Edge & theE, const TopoDS_Face & theF);

		/****** BRepLib::BuildPCurveForEdgeOnPlane ******/
		/****** md5 signature: b75c43d2840fdb12d2bc2d433173237a ******/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
theF: TopoDS_Face
aC2D: Geom2d_Curve

Return
-------
bToUpdate: bool

Description
-----------
Builds pcurve of edge on face if the surface is plane, but does not update the edge. The output are the pcurve and the flag telling that pcurve was built.
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane(const TopoDS_Edge & theE, const TopoDS_Face & theF, opencascade::handle<Geom2d_Curve> & aC2D, Standard_Boolean &OutValue);

		/****** BRepLib::CheckSameRange ******/
		/****** md5 signature: fa68f28e9e197bee22df3b34a5f0b797 ******/
		%feature("compactdefaultargs") CheckSameRange;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Confusion: double (optional, default to 1.0e-12)

Return
-------
bool

Description
-----------
checks if the Edge is same range IGNORING the same range flag of the edge Confusion argument is to compare real numbers idenpendently of any model space tolerance.
") CheckSameRange;
		static bool CheckSameRange(const TopoDS_Edge & E, const double Confusion = 1.0e-12);

		/****** BRepLib::ContinuityOfFaces ******/
		/****** md5 signature: c028e3c7201f03e998b22da01d434315 ******/
		%feature("compactdefaultargs") ContinuityOfFaces;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theAngleTol: double

Return
-------
GeomAbs_Shape

Description
-----------
Returns the order of continuity between two faces connected by an edge.
") ContinuityOfFaces;
		static GeomAbs_Shape ContinuityOfFaces(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const double theAngleTol);

		/****** BRepLib::EncodeRegularity ******/
		/****** md5 signature: 4d0116b5de7f8c4774343a6e2e1930a2 ******/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TolAng: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Encodes the Regularity of edges on a Shape. Warning: <TolAng> is an angular tolerance, expressed in Rad. Warning: If the edges's regularity are coded before, nothing is done.
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & S, const double TolAng = 1.0e-10);

		/****** BRepLib::EncodeRegularity ******/
		/****** md5 signature: a635b01a3c2296e8c42d1285469bedfc ******/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LE: NCollection_List<TopoDS_Shape>
TolAng: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Encodes the Regularity of edges in list <LE> on the shape <S> Warning: <TolAng> is an angular tolerance, expressed in Rad. Warning: If the edges's regularity are coded before, nothing is done.
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & S, const NCollection_List<TopoDS_Shape> & LE, const double TolAng = 1.0e-10);

		/****** BRepLib::EncodeRegularity ******/
		/****** md5 signature: 8e5f272254cdf650c5b97e1466890104 ******/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
TolAng: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Encodes the Regularity between <F1> and <F2> by <E> Warning: <TolAng> is an angular tolerance, expressed in Rad. Warning: If the edge's regularity is coded before, nothing is done.
") EncodeRegularity;
		static void EncodeRegularity(TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const double TolAng = 1.0e-10);

		/****** BRepLib::EnsureNormalConsistency ******/
		/****** md5 signature: 20d46c10edec7be20d9852b5fdfc4c20 ******/
		%feature("compactdefaultargs") EnsureNormalConsistency;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
theAngTol: double (optional, default to 0.001)
ForceComputeNormals: bool (optional, default to false)

Return
-------
bool

Description
-----------
Corrects the normals in Poly_Triangulation of faces, in such way that normals at nodes lying along smooth edges have the same value on both adjacent triangulations. Returns True if any correction is done.
") EnsureNormalConsistency;
		static bool EnsureNormalConsistency(const TopoDS_Shape & S, const double theAngTol = 0.001, const bool ForceComputeNormals = false);

		/****** BRepLib::ExtendFace ******/
		/****** md5 signature: b3d232bac1d11ceb718b06edd218c5cc ******/
		%feature("compactdefaultargs") ExtendFace;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theExtVal: double
theExtUMin: bool
theExtUMax: bool
theExtVMin: bool
theExtVMax: bool
theFExtended: TopoDS_Face

Return
-------
None

Description
-----------
Enlarges the face on the given value. 
Input parameter: theF The face to extend 
Input parameter: theExtVal The extension value 
Input parameter: theExtUMin Defines whether to extend the face in UMin direction 
Input parameter: theExtUMax Defines whether to extend the face in UMax direction 
Input parameter: theExtVMin Defines whether to extend the face in VMin direction 
Input parameter: theExtVMax Defines whether to extend the face in VMax direction 
Input parameter: theFExtended The extended face.
") ExtendFace;
		static void ExtendFace(const TopoDS_Face & theF, const double theExtVal, const bool theExtUMin, const bool theExtUMax, const bool theExtVMin, const bool theExtVMax, TopoDS_Face & theFExtended);

		/****** BRepLib::FindValidRange ******/
		/****** md5 signature: ccd0e6f1510e63a1fbb943f927e9f557 ******/
		%feature("compactdefaultargs") FindValidRange;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor3d_Curve
theTolE: double
theParV1: double
thePntV1: gp_Pnt
theTolV1: double
theParV2: double
thePntV2: gp_Pnt
theTolV2: double

Return
-------
theFirst: double
theLast: double

Description
-----------
For an edge defined by 3d curve and tolerance and vertices defined by points, parameters on curve and tolerances, finds a range of curve between vertices not covered by vertices tolerances. Returns false if there is no such range. Otherwise, sets theFirst and theLast as its bounds.
") FindValidRange;
		static bool FindValidRange(const Adaptor3d_Curve & theCurve, const double theTolE, const double theParV1, const gp_Pnt & thePntV1, const double theTolV1, const double theParV2, const gp_Pnt & thePntV2, const double theTolV2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepLib::FindValidRange ******/
		/****** md5 signature: 18bb7bc724a4bff38a0824ccd0dbe6f1 ******/
		%feature("compactdefaultargs") FindValidRange;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
theFirst: double
theLast: double

Description
-----------
Finds a range of 3d curve of the edge not covered by vertices tolerances. Returns false if there is no such range. Otherwise, sets theFirst and theLast as its bounds.
") FindValidRange;
		static bool FindValidRange(const TopoDS_Edge & theEdge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepLib::OrientClosedSolid ******/
		/****** md5 signature: 6fd937fff15cf2e790e8e08316e9694a ******/
		%feature("compactdefaultargs") OrientClosedSolid;
		%feature("autodoc", "
Parameters
----------
solid: TopoDS_Solid

Return
-------
bool

Description
-----------
Orients the solid forward and the shell with the orientation to have matter in the solid. Returns False if the solid is unOrientable (open or incoherent).
") OrientClosedSolid;
		static bool OrientClosedSolid(TopoDS_Solid & solid);

		/****** BRepLib::Plane ******/
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
Sets the current plane to P.
") Plane;
		static void Plane(const opencascade::handle<Geom_Plane> & P);

		/****** BRepLib::Plane ******/
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

		/****** BRepLib::Precision ******/
		/****** md5 signature: 8499a47a22c769b8f0294260f896e858 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
Computes the max distance between edge and its 2d representation on the face. Sets the default precision. The current Precision is returned.
") Precision;
		static void Precision(const double P);

		/****** BRepLib::Precision ******/
		/****** md5 signature: 2353c65be8f48fbd68786cb917cafb10 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the default precision.
") Precision;
		static double Precision();

		/****** BRepLib::ReverseSortFaces ******/
		/****** md5 signature: 239c8319defbcdf926a13aed26639637 ******/
		%feature("compactdefaultargs") ReverseSortFaces;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LF: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Sorts in LF the Faces of S on the reverse complexity of their surfaces (other,Torus,Sphere,Cone,Cylinder,Plane).
") ReverseSortFaces;
		static void ReverseSortFaces(const TopoDS_Shape & S, NCollection_List<TopoDS_Shape> & LF);

		/****** BRepLib::SameParameter ******/
		/****** md5 signature: 93361a379487c6a95ee9debc32df969d ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
Tolerance: double (optional, default to 1.0e-5)

Return
-------
None

Description
-----------
Computes new 2d curve(s) for the edge <theEdge> to have the same parameter as the 3d curve. The algorithm is not done if the flag SameParameter was True on the Edge.
") SameParameter;
		static void SameParameter(const TopoDS_Edge & theEdge, const double Tolerance = 1.0e-5);

		/****** BRepLib::SameParameter ******/
		/****** md5 signature: 2bbe553f0489dc508db9c1efc0c469cc ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theTolerance: double
IsUseOldEdge: bool

Return
-------
theNewTol: double

Description
-----------
Computes new 2d curve(s) for the edge <theEdge> to have the same parameter as the 3d curve. The algorithm is not done if the flag SameParameter was True on the Edge. theNewTol is a new tolerance of vertices of the input edge (not applied inside the algorithm, but pre-computed). If IsUseOldEdge is true then the input edge will be modified, otherwise the new copy of input edge will be created. Returns the new edge as a result, can be ignored if IsUseOldEdge is true.
") SameParameter;
		static TopoDS_Edge SameParameter(const TopoDS_Edge & theEdge, const double theTolerance, Standard_Real &OutValue, const bool IsUseOldEdge);

		/****** BRepLib::SameParameter ******/
		/****** md5 signature: a0c7528025a51ea967ec4233ad5999d7 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tolerance: double (optional, default to 1.0e-5)
forced: bool (optional, default to false)

Return
-------
None

Description
-----------
Computes new 2d curve(s) for all the edges of <S> to have the same parameter as the 3d curve. The algorithm is not done if the flag SameParameter was True on an Edge.
") SameParameter;
		static void SameParameter(const TopoDS_Shape & S, const double Tolerance = 1.0e-5, const bool forced = false);

		/****** BRepLib::SameParameter ******/
		/****** md5 signature: c863e189746665cf7ff4ed76dc0c7220 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
theReshaper: BRepTools_ReShape
Tolerance: double (optional, default to 1.0e-5)
forced: bool (optional, default to false)

Return
-------
None

Description
-----------
Computes new 2d curve(s) for all the edges of <S> to have the same parameter as the 3d curve. The algorithm is not done if the flag SameParameter was True on an Edge. theReshaper is used to record the modifications of input shape <S> to prevent any modifications on the shape itself. Thus the input shape (and its subshapes) will not be modified, instead the reshaper will contain a modified empty-copies of original subshapes as substitutions.
") SameParameter;
		static void SameParameter(const TopoDS_Shape & S, BRepTools_ReShape & theReshaper, const double Tolerance = 1.0e-5, const bool forced = false);

		/****** BRepLib::SameRange ******/
		/****** md5 signature: f4409793b16081022abec271ced97b15 ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Tolerance: double (optional, default to 1.0e-5)

Return
-------
None

Description
-----------
will make all the curve representation have the same range domain for the parameters. This will IGNORE the same range flag value to proceed. If there is a 3D curve there it will the range of that curve. If not the first curve representation encountered in the list will give its range to the all the other curves.
") SameRange;
		static void SameRange(const TopoDS_Edge & E, const double Tolerance = 1.0e-5);

		/****** BRepLib::SortFaces ******/
		/****** md5 signature: b3ed5a1d1f02597b292960e63560c045 ******/
		%feature("compactdefaultargs") SortFaces;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LF: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Sorts in LF the Faces of S on the complexity of their surfaces (Plane,Cylinder,Cone,Sphere,Torus,other).
") SortFaces;
		static void SortFaces(const TopoDS_Shape & S, NCollection_List<TopoDS_Shape> & LF);

		/****** BRepLib::UpdateDeflection ******/
		/****** md5 signature: 76d35fdabbd1c46be0db3f1ad51bcdc9 ******/
		%feature("compactdefaultargs") UpdateDeflection;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Updates value of deflection in Poly_Triangulation of faces by the maximum deviation measured on existing triangulation.
") UpdateDeflection;
		static void UpdateDeflection(const TopoDS_Shape & S);

		/****** BRepLib::UpdateEdgeTol ******/
		/****** md5 signature: 69b9c2a5cae5a166a9c8eaf8d016dc7a ******/
		%feature("compactdefaultargs") UpdateEdgeTol;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
MinToleranceRequest: double
MaxToleranceToCheck: double

Return
-------
bool

Description
-----------
Checks if the edge has a Tolerance smaller than MaxToleranceToCheck if so it will compute the radius of the cylindrical pipe surface that MinToleranceRequest is the minimum tolerance before it is useful to start testing. Usually it should be around 10e-5 contains all the curve representation of the edge returns True if the Edge tolerance had to be updated.
") UpdateEdgeTol;
		static bool UpdateEdgeTol(const TopoDS_Edge & E, const double MinToleranceRequest, const double MaxToleranceToCheck);

		/****** BRepLib::UpdateEdgeTolerance ******/
		/****** md5 signature: 3bde3c540e0f7f5fcef4861d3e68ab8a ******/
		%feature("compactdefaultargs") UpdateEdgeTolerance;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
MinToleranceRequest: double
MaxToleranceToCheck: double

Return
-------
bool

Description
-----------
Checks all the edges of the shape whose Tolerance is smaller than MaxToleranceToCheck Returns True if at least one edge was updated MinToleranceRequest is the minimum tolerance before it is useful to start testing. Usually it should be around 10e-5 //! Warning: The method is very slow as it checks all. Use only in interfaces or processing assimilate batch.
") UpdateEdgeTolerance;
		static bool UpdateEdgeTolerance(const TopoDS_Shape & S, const double MinToleranceRequest, const double MaxToleranceToCheck);

		/****** BRepLib::UpdateInnerTolerances ******/
		/****** md5 signature: f8274e750a439791de5f4024a2905387 ******/
		%feature("compactdefaultargs") UpdateInnerTolerances;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Checks tolerances of edges (including inner points) and vertices of a shape and updates them to satisfy 'SameParameter' condition.
") UpdateInnerTolerances;
		static void UpdateInnerTolerances(const TopoDS_Shape & S);

		/****** BRepLib::UpdateTolerances ******/
		/****** md5 signature: 070d895be262c373fd29d3bdcd126faf ******/
		%feature("compactdefaultargs") UpdateTolerances;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
verifyFaceTolerance: bool (optional, default to false)

Return
-------
None

Description
-----------
Replaces tolerance of FACE EDGE VERTEX by the tolerance Max of their connected handling shapes. It is not necessary to use this call after SameParameter. (called in).
") UpdateTolerances;
		static void UpdateTolerances(const TopoDS_Shape & S, const bool verifyFaceTolerance = false);

		/****** BRepLib::UpdateTolerances ******/
		/****** md5 signature: e1661b619f666a4c9c3175579c810203 ******/
		%feature("compactdefaultargs") UpdateTolerances;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
theReshaper: BRepTools_ReShape
verifyFaceTolerance: bool (optional, default to false)

Return
-------
None

Description
-----------
Replaces tolerance of FACE EDGE VERTEX by the tolerance Max of their connected handling shapes. It is not necessary to use this call after SameParameter. (called in) theReshaper is used to record the modifications of input shape <S> to prevent any modifications on the shape itself. Thus the input shape (and its subshapes) will not be modified, instead the reshaper will contain a modified empty-copies of original subshapes as substitutions.
") UpdateTolerances;
		static void UpdateTolerances(const TopoDS_Shape & S, BRepTools_ReShape & theReshaper, const bool verifyFaceTolerance = false);

};


%extend BRepLib {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def BuildPCurveForEdgesOnPlane(self):
		pass
	}
};

/************************************
* class BRepLib_CheckCurveOnSurface *
************************************/
class BRepLib_CheckCurveOnSurface {
	public:
		/****** BRepLib_CheckCurveOnSurface::BRepLib_CheckCurveOnSurface ******/
		/****** md5 signature: ad4740ee3e59e42d75e2ee6144706591 ******/
		%feature("compactdefaultargs") BRepLib_CheckCurveOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepLib_CheckCurveOnSurface;
		 BRepLib_CheckCurveOnSurface();

		/****** BRepLib_CheckCurveOnSurface::BRepLib_CheckCurveOnSurface ******/
		/****** md5 signature: 4463fa8016612b07a0638ab8e597c79a ******/
		%feature("compactdefaultargs") BRepLib_CheckCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Constructor.
") BRepLib_CheckCurveOnSurface;
		 BRepLib_CheckCurveOnSurface(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****** BRepLib_CheckCurveOnSurface::ErrorStatus ******/
		/****** md5 signature: d9fcbadbff0953c639e060241b086dec ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns error status The possible values are: 0 - OK; 1 - null curve or surface or 2d curve; 2 - invalid parametric range; 3 - error in calculations.
") ErrorStatus;
		int ErrorStatus();

		/****** BRepLib_CheckCurveOnSurface::Init ******/
		/****** md5 signature: 2a831d636c2c924d38adfdfa075e8336 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Sets the data for the algorithm.
") Init;
		void Init(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****** BRepLib_CheckCurveOnSurface::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the max distance has been found.
") IsDone;
		bool IsDone();

		/****** BRepLib_CheckCurveOnSurface::IsParallel ******/
		/****** md5 signature: b5dec32788c4cabf441ea364e8b4616c ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if parallel flag is set.
") IsParallel;
		bool IsParallel();

		/****** BRepLib_CheckCurveOnSurface::MaxDistance ******/
		/****** md5 signature: e99afdda005d648d0eb2efaa1f1e2e1b ******/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns max distance.
") MaxDistance;
		double MaxDistance();

		/****** BRepLib_CheckCurveOnSurface::MaxParameter ******/
		/****** md5 signature: 6206e00ea5d2de4bb7d2e735b3d64893 ******/
		%feature("compactdefaultargs") MaxParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter in which the distance is maximal.
") MaxParameter;
		double MaxParameter();

		/****** BRepLib_CheckCurveOnSurface::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the calculation If myIsParallel == true then computation will be performed in parallel.
") Perform;
		void Perform();

		/****** BRepLib_CheckCurveOnSurface::SetParallel ******/
		/****** md5 signature: 255bd129e77b56c0dddef79b343deb4b ******/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "
Parameters
----------
theIsParallel: bool

Return
-------
None

Description
-----------
Sets parallel flag.
") SetParallel;
		void SetParallel(const bool theIsParallel);

};


%extend BRepLib_CheckCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepLib_Command *
************************/
%nodefaultctor BRepLib_Command;
class BRepLib_Command {
	public:
		/****** BRepLib_Command::Check ******/
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

		/****** BRepLib_Command::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

};


%extend BRepLib_Command {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepLib_FindSurface *
****************************/
class BRepLib_FindSurface {
	public:
		/****** BRepLib_FindSurface::BRepLib_FindSurface ******/
		/****** md5 signature: 05d2a378003b1863b90b5e71c7ee98ab ******/
		%feature("compactdefaultargs") BRepLib_FindSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepLib_FindSurface;
		 BRepLib_FindSurface();

		/****** BRepLib_FindSurface::BRepLib_FindSurface ******/
		/****** md5 signature: b0530f52cd22101a5dfb0e429a2385d3 ******/
		%feature("compactdefaultargs") BRepLib_FindSurface;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tol: double (optional, default to -1)
OnlyPlane: bool (optional, default to false)
OnlyClosed: bool (optional, default to false)

Return
-------
None

Description
-----------
Computes the Surface from the edges of <S> with the given tolerance. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set. If <OnlyClosed> is true, then S should be a wire and the existing surface, on which wire S is not closed in 2D, will be ignored.
") BRepLib_FindSurface;
		 BRepLib_FindSurface(const TopoDS_Shape & S, const double Tol = -1, const bool OnlyPlane = false, const bool OnlyClosed = false);

		/****** BRepLib_FindSurface::Existed ******/
		/****** md5 signature: 1f292c389730fdd4546dfe3781d61bf2 ******/
		%feature("compactdefaultargs") Existed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Existed;
		bool Existed();

		/****** BRepLib_FindSurface::Found ******/
		/****** md5 signature: 5b4f2554092d035591453d3a6da63bd3 ******/
		%feature("compactdefaultargs") Found;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Found;
		bool Found();

		/****** BRepLib_FindSurface::Init ******/
		/****** md5 signature: fcd5e8d5250fc671c1ba05c35884a0c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tol: double (optional, default to -1)
OnlyPlane: bool (optional, default to false)
OnlyClosed: bool (optional, default to false)

Return
-------
None

Description
-----------
Computes the Surface from the edges of <S> with the given tolerance. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set. If <OnlyClosed> is true, then S should be a wire and the existing surface, on which wire S is not closed in 2D, will be ignored.
") Init;
		void Init(const TopoDS_Shape & S, const double Tol = -1, const bool OnlyPlane = false, const bool OnlyClosed = false);

		/****** BRepLib_FindSurface::Location ******/
		/****** md5 signature: 9aada9ca43432b6e0a1b3215ca813c4b ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") Location;
		TopLoc_Location Location();

		/****** BRepLib_FindSurface::Surface ******/
		/****** md5 signature: 352bd890213763e77e08756c09e1fdcc ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****** BRepLib_FindSurface::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** BRepLib_FindSurface::ToleranceReached ******/
		/****** md5 signature: 30e9580d438abb6d0f78978f7bdbf804 ******/
		%feature("compactdefaultargs") ToleranceReached;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ToleranceReached;
		double ToleranceReached();

};


%extend BRepLib_FindSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_FuseEdges *
**************************/
class BRepLib_FuseEdges {
	public:
		/****** BRepLib_FuseEdges::BRepLib_FuseEdges ******/
		/****** md5 signature: 55197ed840d8e15fc5df1188ff847219 ******/
		%feature("compactdefaultargs") BRepLib_FuseEdges;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool (optional, default to false)

Return
-------
None

Description
-----------
Initialise members and build construction of map of ancestors.
") BRepLib_FuseEdges;
		 BRepLib_FuseEdges(const TopoDS_Shape & theShape, const bool PerformNow = false);

		/****** BRepLib_FuseEdges::AvoidEdges ******/
		/****** md5 signature: f818e50fc2b6589ea6e4232f3ecf29b2 ******/
		%feature("compactdefaultargs") AvoidEdges;
		%feature("autodoc", "
Parameters
----------
theMapEdg: NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
set edges to avoid being fused.
") AvoidEdges;
		void AvoidEdges(const NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher> & theMapEdg);

		/****** BRepLib_FuseEdges::Edges ******/
		/****** md5 signature: 5379174e9d14e3e3ea311fe7df3bef29 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "
Parameters
----------
theMapLstEdg: NCollection_DataMap<int, NCollection_List<TopoDS_Shape> >

Return
-------
None

Description
-----------
returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.
") Edges;
		void Edges(NCollection_DataMap<int, NCollection_List<TopoDS_Shape> > & theMapLstEdg);

		/****** BRepLib_FuseEdges::Faces ******/
		/****** md5 signature: e6edd7a821bbcfb3e5ad657809fa2a22 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "
Parameters
----------
theMapFac: NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
returns the map of modified faces.
") Faces;
		void Faces(NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher> & theMapFac);

		/****** BRepLib_FuseEdges::NbVertices ******/
		/****** md5 signature: 45ce1fb31ba11f2d666ff6e9e2192133 ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of vertices candidate to be removed.
") NbVertices;
		int NbVertices();

		/****** BRepLib_FuseEdges::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Using map of list of connex edges, fuse each list to one edge and then update myShape.
") Perform;
		void Perform();

		/****** BRepLib_FuseEdges::ResultEdges ******/
		/****** md5 signature: 69dd616f0de4fac58c62191aaa94e718 ******/
		%feature("compactdefaultargs") ResultEdges;
		%feature("autodoc", "
Parameters
----------
theMapEdg: NCollection_DataMap<int, TopoDS_Shape>

Return
-------
None

Description
-----------
returns all the fused edges. each integer entry in the map corresponds to the integer in the DataMapOfIntegerListOfShape we get in method Edges. That is to say, to the list of edges in theMapLstEdg(i) corresponds the resulting edge theMapEdge(i).
") ResultEdges;
		void ResultEdges(NCollection_DataMap<int, TopoDS_Shape> & theMapEdg);

		/****** BRepLib_FuseEdges::SetConcatBSpl ******/
		/****** md5 signature: 6d129e69069790bcb6417528371bbae2 ******/
		%feature("compactdefaultargs") SetConcatBSpl;
		%feature("autodoc", "
Parameters
----------
theConcatBSpl: bool (optional, default to true)

Return
-------
None

Description
-----------
set mode to enable concatenation G1 BSpline edges in one End Modified by IFV 19.04.07.
") SetConcatBSpl;
		void SetConcatBSpl(const bool theConcatBSpl = true);

		/****** BRepLib_FuseEdges::Shape ******/
		/****** md5 signature: 4968b0e4669317ad9b7893680ac9a219 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns myShape modified with the list of internal edges removed from it.
") Shape;
		TopoDS_Shape Shape();

};


%extend BRepLib_FuseEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepLib_PointCloudShape *
********************************/
%nodefaultctor BRepLib_PointCloudShape;
class BRepLib_PointCloudShape {
	public:
		/****** BRepLib_PointCloudShape::GeneratePointsByDensity ******/
		/****** md5 signature: 90ff320d7adb2d5e35dcba62bc22c5e1 ******/
		%feature("compactdefaultargs") GeneratePointsByDensity;
		%feature("autodoc", "
Parameters
----------
theDensity: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Computes points with specified density for initial shape. If parameter Density is equal to 0 then density will be computed automatically by criterion: - 10 points per minimal unreduced face area. //! Note: this function should not be called from concurrent threads without external lock.
") GeneratePointsByDensity;
		bool GeneratePointsByDensity(const double theDensity = 0.0);

		/****** BRepLib_PointCloudShape::GeneratePointsByTriangulation ******/
		/****** md5 signature: d6e5202ea1bdf8257f79db0e16c10320 ******/
		%feature("compactdefaultargs") GeneratePointsByTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get points from triangulation existing in the shape.
") GeneratePointsByTriangulation;
		bool GeneratePointsByTriangulation();

		/****** BRepLib_PointCloudShape::GetDistance ******/
		/****** md5 signature: 0bfb16507b3914e8d46e66bb175d95a5 ******/
		%feature("compactdefaultargs") GetDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns value of the distance to define deflection of points from shape along normal to shape; 0.0 by default.
") GetDistance;
		double GetDistance();

		/****** BRepLib_PointCloudShape::NbPointsByDensity ******/
		/****** md5 signature: cfc1c1368284ddfdd4d00fa78c4159e9 ******/
		%feature("compactdefaultargs") NbPointsByDensity;
		%feature("autodoc", "
Parameters
----------
theDensity: double (optional, default to 0.0)

Return
-------
int

Description
-----------
Returns size of the point cloud for specified density.
") NbPointsByDensity;
		int NbPointsByDensity(const double theDensity = 0.0);

		/****** BRepLib_PointCloudShape::NbPointsByTriangulation ******/
		/****** md5 signature: ecdf6e03983b440e8bde79eadc7177df ******/
		%feature("compactdefaultargs") NbPointsByTriangulation;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns size of the point cloud for using triangulation.
") NbPointsByTriangulation;
		int NbPointsByTriangulation();

		/****** BRepLib_PointCloudShape::SetDistance ******/
		/****** md5 signature: dd0c791fae1e84f7e45db4a517f92b7c ******/
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "
Parameters
----------
theDist: double

Return
-------
None

Description
-----------
Sets value of the distance to define deflection of points from shape along normal to shape. Negative values of theDist parameter are ignored.
") SetDistance;
		void SetDistance(const double theDist);

		/****** BRepLib_PointCloudShape::SetShape ******/
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
Set shape.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****** BRepLib_PointCloudShape::SetTolerance ******/
		/****** md5 signature: 7a122d62cf37c0f7110c25c0847e82a8 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Set tolerance.
") SetTolerance;
		void SetTolerance(double theTol);

		/****** BRepLib_PointCloudShape::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return loaded shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** BRepLib_PointCloudShape::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return tolerance.
") Tolerance;
		double Tolerance();

};


%extend BRepLib_PointCloudShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepLib_ToolTriangulatedShape *
**************************************/
class BRepLib_ToolTriangulatedShape {
	public:
		/****** BRepLib_ToolTriangulatedShape::ComputeNormals ******/
		/****** md5 signature: 2d57466090fe2926dca8ad73827190c2 ******/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTris: Poly_Triangulation

Return
-------
None

Description
-----------
Computes nodal normals for Poly_Triangulation structure using UV coordinates and surface. Does nothing if triangulation already defines normals. 
Input parameter: theFace the face 
Input parameter: theTris the definition of a face triangulation.
") ComputeNormals;
		static void ComputeNormals(const TopoDS_Face & theFace, const opencascade::handle<Poly_Triangulation> & theTris);

		/****** BRepLib_ToolTriangulatedShape::ComputeNormals ******/
		/****** md5 signature: ff5b08874a5db62c157e96e68689a5a4 ******/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTris: Poly_Triangulation
thePolyConnect: Poly_Connect

Return
-------
None

Description
-----------
Computes nodal normals for Poly_Triangulation structure using UV coordinates and surface. Does nothing if triangulation already defines normals. 
Input parameter: theFace the face 
Input parameter: theTris the definition of a face triangulation @param[in,out] thePolyConnect optional, initialized tool for exploring triangulation.
") ComputeNormals;
		static void ComputeNormals(const TopoDS_Face & theFace, const opencascade::handle<Poly_Triangulation> & theTris, Poly_Connect & thePolyConnect);

};


%extend BRepLib_ToolTriangulatedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepLib_ValidateEdge *
*****************************/
class BRepLib_ValidateEdge {
	public:
		/****** BRepLib_ValidateEdge::BRepLib_ValidateEdge ******/
		/****** md5 signature: 2417e5b4337a85342d5f65b3bcf013cb ******/
		%feature("compactdefaultargs") BRepLib_ValidateEdge;
		%feature("autodoc", "
Parameters
----------
theReferenceCurve: Adaptor3d_Curve
theOtherCurve: Adaptor3d_CurveOnSurface
theSameParameter: bool

Return
-------
None

Description
-----------
Initialization constructor.
") BRepLib_ValidateEdge;
		 BRepLib_ValidateEdge(const opencascade::handle<Adaptor3d_Curve > theReferenceCurve, const opencascade::handle<Adaptor3d_CurveOnSurface > theOtherCurve, bool theSameParameter);

		/****** BRepLib_ValidateEdge::CheckTolerance ******/
		/****** md5 signature: cd63ceea2c55b19771ba46d4f5bde78a ******/
		%feature("compactdefaultargs") CheckTolerance;
		%feature("autodoc", "
Parameters
----------
theToleranceToCheck: double

Return
-------
bool

Description
-----------
Returns true if computed distance is less than <theToleranceToCheck>.
") CheckTolerance;
		bool CheckTolerance(double theToleranceToCheck);

		/****** BRepLib_ValidateEdge::GetMaxDistance ******/
		/****** md5 signature: 7ec2859170d83c36739259c139a41584 ******/
		%feature("compactdefaultargs") GetMaxDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns max distance.
") GetMaxDistance;
		double GetMaxDistance();

		/****** BRepLib_ValidateEdge::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance has been found for all points.
") IsDone;
		bool IsDone();

		/****** BRepLib_ValidateEdge::IsExactMethod ******/
		/****** md5 signature: a07bdef08a4b8aa4e8d81be4766f4e4d ******/
		%feature("compactdefaultargs") IsExactMethod;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if exact method selected.
") IsExactMethod;
		bool IsExactMethod();

		/****** BRepLib_ValidateEdge::IsParallel ******/
		/****** md5 signature: b5dec32788c4cabf441ea364e8b4616c ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if parallel flag is set.
") IsParallel;
		bool IsParallel();

		/****** BRepLib_ValidateEdge::Process ******/
		/****** md5 signature: f69ec5068362d1fb1c1da24f6f943a3d ******/
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the max distance for the 3d curve <myReferenceCurve> and curve on surface <myOtherCurve>. If the SetExitIfToleranceExceeded() function was called before <myCalculatedDistance> contains first greater than SetExitIfToleranceExceeded() parameter value. In case using exact method always computes real max distance.
") Process;
		void Process();

		/****** BRepLib_ValidateEdge::SetControlPointsNumber ******/
		/****** md5 signature: 501936f5e2383b5775793a4e78ebe5be ******/
		%feature("compactdefaultargs") SetControlPointsNumber;
		%feature("autodoc", "
Parameters
----------
theControlPointsNumber: int

Return
-------
None

Description
-----------
Set control points number (if you need a value other than 22).
") SetControlPointsNumber;
		void SetControlPointsNumber(int theControlPointsNumber);

		/****** BRepLib_ValidateEdge::SetExactMethod ******/
		/****** md5 signature: a6612f28201c4984d73119fb925235ee ******/
		%feature("compactdefaultargs") SetExactMethod;
		%feature("autodoc", "
Parameters
----------
theIsExact: bool

Return
-------
None

Description
-----------
Sets method to calculate distance: Calculating in finite number of points (if theIsExact is false, faster, but possible not correct result) or exact calculating by using BRepLib_CheckCurveOnSurface class (if theIsExact is true, slowly, but more correctly). Exact method is used only when edge is SameParameter. Default method is calculating in finite number of points.
") SetExactMethod;
		void SetExactMethod(bool theIsExact);

		/****** BRepLib_ValidateEdge::SetParallel ******/
		/****** md5 signature: edf502d8fced8f0a5916d1d68bf2e792 ******/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "
Parameters
----------
theIsMultiThread: bool

Return
-------
None

Description
-----------
Sets parallel flag.
") SetParallel;
		void SetParallel(bool theIsMultiThread);

		/****** BRepLib_ValidateEdge::UpdateTolerance ******/
		/****** md5 signature: 722f2785827beac017cbf3d2aa543f80 ******/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "
Parameters
----------

Return
-------
theToleranceToUpdate: double

Description
-----------
Increase <theToleranceToUpdate> if max distance is greater than <theToleranceToUpdate>.
") UpdateTolerance;
		void UpdateTolerance(Standard_Real &OutValue);

};


%extend BRepLib_ValidateEdge {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetExitIfToleranceExceeded(self):
		pass
	}
};

/**************************
* class BRepLib_MakeShape *
**************************/
%nodefaultctor BRepLib_MakeShape;
class BRepLib_MakeShape : public BRepLib_Command {
	public:
		/****** BRepLib_MakeShape::Build ******/
		/****** md5 signature: 634d88e5c99c5ce236c07b337243d591 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
This is called by Shape(). It does nothing but may be redefined.
") Build;
		void Build();

		/****** BRepLib_MakeShape::DescendantFaces ******/
		/****** md5 signature: aa40cd3f62c88531cb176b0bd70535db ******/
		%feature("compactdefaultargs") DescendantFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
returns the list of generated Faces.
") DescendantFaces;
		virtual const NCollection_List<TopoDS_Shape> DescendantFaces(const TopoDS_Face & F);

		/****** BRepLib_MakeShape::FaceStatus ******/
		/****** md5 signature: 5ba76a83c885c175dfdc1ccf1a0b227c ******/
		%feature("compactdefaultargs") FaceStatus;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
BRepLib_ShapeModification

Description
-----------
returns the status of the Face after the shape creation.
") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus(const TopoDS_Face & F);

		/****** BRepLib_MakeShape::FacesFromEdges ******/
		/****** md5 signature: 9f022964a5614d17de41931c8c96499d ******/
		%feature("compactdefaultargs") FacesFromEdges;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
returns a list of the created faces from the edge <E>.
") FacesFromEdges;
		virtual const NCollection_List<TopoDS_Shape> FacesFromEdges(const TopoDS_Edge & E);

		/****** BRepLib_MakeShape::HasDescendants ******/
		/****** md5 signature: ca2809a6d801cfc899d44016b6c2993b ******/
		%feature("compactdefaultargs") HasDescendants;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if the Face generates new topology.
") HasDescendants;
		virtual bool HasDescendants(const TopoDS_Face & F);

		/****** BRepLib_MakeShape::NbSurfaces ******/
		/****** md5 signature: 2375662626d3902aec7750ab9ae790bd ******/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of surfaces after the shape creation.
") NbSurfaces;
		virtual int NbSurfaces();

		/****** BRepLib_MakeShape::NewFaces ******/
		/****** md5 signature: 6bec6d356ff84edae7e7f3df1bf57418 ******/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Return the faces created for surface I.
") NewFaces;
		virtual const NCollection_List<TopoDS_Shape> NewFaces(const int I);

		/****** BRepLib_MakeShape::Shape ******/
		/****** md5 signature: 35cc6b8a92112f8b2067e768b8f01ff2 ******/
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


%extend BRepLib_MakeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepLib_MakeEdge *
*************************/
class BRepLib_MakeEdge : public BRepLib_MakeShape {
	public:
		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: ff5f9d42b34fd8755f3ceed6526aa3da ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge();

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 98a3610d3756d0b0ad66bdcccf794eba ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 2830aaf617c2443026ec071f091ca01b ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 26d9850e091998754b6ecaab1aef1d0e ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 5dff2befe9da5e4bbeb57752bca7dc7e ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 0d4017c8497dcacedd786f3dcdaac683 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: e0b62169f2368ccc53618e3a966136f2 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: dd78427649c02f0412acf4081b8db829 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: e1c08bcc392128d329c3a80628309c85 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: c91a90ae7df25d6b8e40b81940ca4b7c ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 14bd0128665af2258ebe47770d8fb6dd ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: cddc795a530ee6036d9962467cd53bf9 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 24154d599c0205d67bd1054091dc6e84 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 06d1280d59fc92a193890b79160b0e77 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 73aac35a868f95812b9563080ce3efe8 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: c95afe3eaf666dd7e15706577fde46d4 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 57c8f2850f48d768089819f858ba5800 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 26ce953ab7e802cc208f18f1cfbab2b6 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 6066a449187d5c176e51a8350853ddeb ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 41d01e90457d8bf5d5ef4297a021649c ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 92d2546a4f08d0d71fe76f9fe8a92e93 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: f3507502fb730d27f98864f12d561310 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: dac9ce58e588d6dc289841341d82be20 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 19bdf5463e96fedf9b11df992698709e ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 2b3b0cd4875c66f2b764b68ce401bc10 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: d743b1166a4aa754c0386de9a92c966d ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: d09e0cf3b86db9f98fb205636abfe802 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 5ae8190c352efdde0e3a942af566d131 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 474c91f96f67166ac529c5f1b99a37bc ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 8dee1765d199f2245a83cccdf28b5532 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: 9a9a0471340096a6511a7ea4d190e89f ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: c6bebde95ae610ff35a5d9ef3622e044 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: a0e02ae1e45cbbea5b7334ee5e607d15 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: c753960ce847c2a9e9a4955f41de371c ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::BRepLib_MakeEdge ******/
		/****** md5 signature: a3b605979559892f127f1dd98b3cd0b2 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::Edge ******/
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

		/****** BRepLib_MakeEdge::Error ******/
		/****** md5 signature: 20d9748fec77b6c2426dc27ab850ca5c ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepLib_EdgeError

Description
-----------
Returns the error description when NotDone.
") Error;
		BRepLib_EdgeError Error();

		/****** BRepLib_MakeEdge::Init ******/
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

		/****** BRepLib_MakeEdge::Init ******/
		/****** md5 signature: db52bb95b13038d980ab380aed071983 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const double p1, const double p2);

		/****** BRepLib_MakeEdge::Init ******/
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

		/****** BRepLib_MakeEdge::Init ******/
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

		/****** BRepLib_MakeEdge::Init ******/
		/****** md5 signature: 412e03566949b7e42dd24c71b9ce7422 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P1, const gp_Pnt & P2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::Init ******/
		/****** md5 signature: 022e39933a80148892b5a7415d2df3ec ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::Init ******/
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

		/****** BRepLib_MakeEdge::Init ******/
		/****** md5 signature: 7d1c78307a623b9f37bb35153ddce6a9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const double p1, const double p2);

		/****** BRepLib_MakeEdge::Init ******/
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

		/****** BRepLib_MakeEdge::Init ******/
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

		/****** BRepLib_MakeEdge::Init ******/
		/****** md5 signature: 9e1d937daa68062a67ed0f38b9f236a5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
P1: gp_Pnt
P2: gp_Pnt
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::Init ******/
		/****** md5 signature: 1443b848b33c02245039596ae4dac49c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
S: Geom_Surface
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const double p1, const double p2);

		/****** BRepLib_MakeEdge::Vertex1 ******/
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

		/****** BRepLib_MakeEdge::Vertex2 ******/
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


%extend BRepLib_MakeEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepLib_MakeEdge2d *
***************************/
class BRepLib_MakeEdge2d : public BRepLib_MakeShape {
	public:
		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: de8a8f3e23e69fc9e75ccd84c3760a77 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: da11ac145a027e24369a8c89b7db9475 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 4ebad4dd866258574acdda28b43ab270 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 79cfcb35a62c631c4cd82ba2b15ac2bb ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: f329f0e3c21f7ff3e9bc12ff69d8b321 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: a37e3586c16fd442625f90470567f62d ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 92e4f45eede977ee43643fee90b339d7 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 2d1cd5382ae1d248800d9c2d421e07ce ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Circ2d
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 8c7cc68166b1dd1eeec27938ba6fa2c4 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 34f9657fe0f8805108573ebc9b604dfc ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 9f3b9a91e9d758b0b96702cdc46d2d86 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: acc9b0325307cd51fcceb6b55681d882 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Elips2d
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 028cece37204c3539e721c37f7b9b093 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: ec539e76684e0af672cbb9828edd9d87 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 290b789dc756aeed7c876190b3160d65 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 379a56ee4366f0f0b57e35a411f5d05d ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Hypr2d
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 70ee7ca5e1e5bfe58065106dbb4dc8e0 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: d9f40eb1416118cebc6ac8b81f021c8c ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: efe9dbfb476842f7eab4b04dc0be9f93 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 88deb2cfcbc3c2a1ffaa485fc97e3d6b ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: gp_Parab2d
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 6916a6786470149e1f649e7b30d6b377 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 4e23bad0d2ddaf63837b9103d8c497f7 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 8399ce2ab3d8b76877d03914e74e0197 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 86dd2105d169e66f66057f6ed0bbf8f1 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 01ee21ab26910f427461fb97cb2e22e5 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 83a478b2aa930fd288a84ff4317e1bf0 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 68a59901fd161b611c677dde739d9da7 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::BRepLib_MakeEdge2d ******/
		/****** md5 signature: 261423f8e46d5b7f0a706a02a401b681 ******/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "
Parameters
----------
L: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::Edge ******/
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

		/****** BRepLib_MakeEdge2d::Error ******/
		/****** md5 signature: 20d9748fec77b6c2426dc27ab850ca5c ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepLib_EdgeError

Description
-----------
Returns the error description when NotDone.
") Error;
		BRepLib_EdgeError Error();

		/****** BRepLib_MakeEdge2d::Init ******/
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

		/****** BRepLib_MakeEdge2d::Init ******/
		/****** md5 signature: df4a86664fa2a622c4f3f9fb6cc6f46a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::Init ******/
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

		/****** BRepLib_MakeEdge2d::Init ******/
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

		/****** BRepLib_MakeEdge2d::Init ******/
		/****** md5 signature: 514f20b14aa76c7593782059c41a3b32 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::Init ******/
		/****** md5 signature: 934af206561188846e8d24e2e5dba24c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex
p1: double
p2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const double p1, const double p2);

		/****** BRepLib_MakeEdge2d::Vertex1 ******/
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

		/****** BRepLib_MakeEdge2d::Vertex2 ******/
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


%extend BRepLib_MakeEdge2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepLib_MakeFace *
*************************/
class BRepLib_MakeFace : public BRepLib_MakeShape {
	public:
		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 36f4b8fa3a3e86d49ad8175f15a6a181 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Not done.
") BRepLib_MakeFace;
		 BRepLib_MakeFace();

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 5ce188b7df2a0fe70e449d0f77eb834b ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Load a face. Useful to add wires.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Face & F);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: f58385a55702aaf05d7a60a8c4d06779 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 497b8219b83a91681ee6bac6143afbbf ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 7db1068be3142da374a0c117ba857df3 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: d3ddee166dcf5a3d7fa55005e8b00f6c ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 995e7af1530f86cd9ab3a4d3e4ea69ef ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 1229d21fa554a83562f671df33c1a5d7 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
TolDegen: double

Return
-------
None

Description
-----------
Make a face from a Surface. Accepts tolerance value (TolDegen) for resolution of degenerated edges.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const double TolDegen);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: c1ac56f2be1c10196674adb660c542c6 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
UMin: double
UMax: double
VMin: double
VMax: double

Return
-------
None

Description
-----------
Make a face from a plane.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P, const double UMin, const double UMax, const double VMin, const double VMax);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: d3b79a53207ce9b66a81eddb0f453702 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
UMin: double
UMax: double
VMin: double
VMax: double

Return
-------
None

Description
-----------
Make a face from a cylinder.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C, const double UMin, const double UMax, const double VMin, const double VMax);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 5856b5ad7a02a9225610d9d9fa46f98e ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
UMin: double
UMax: double
VMin: double
VMax: double

Return
-------
None

Description
-----------
Make a face from a cone.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C, const double UMin, const double UMax, const double VMin, const double VMax);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: dfa207f3579d561171aee292f48d3a7e ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
UMin: double
UMax: double
VMin: double
VMax: double

Return
-------
None

Description
-----------
Make a face from a sphere.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S, const double UMin, const double UMax, const double VMin, const double VMax);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 7252afdf5f1c0359b841d9eaf295b7db ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Torus
UMin: double
UMax: double
VMin: double
VMax: double

Return
-------
None

Description
-----------
Make a face from a torus.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C, const double UMin, const double UMax, const double VMin, const double VMax);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: eb4d70d8e8004e4afee8423aaa60eaf6 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: double
UMax: double
VMin: double
VMax: double
TolDegen: double

Return
-------
None

Description
-----------
Make a face from a Surface. Accepts min & max parameters to construct the face's bounds. Also accepts tolerance value (TolDegen) for resolution of degenerated edges.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const double UMin, const double UMax, const double VMin, const double VMax, const double TolDegen);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: e6f51fedbd1c972dc644dc8949d3043d ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
OnlyPlane: bool (optional, default to false)

Return
-------
None

Description
-----------
Find a surface from the wire and make a face. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Wire & W, const bool OnlyPlane = false);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 7a7e7287588e80db7a81e3e6f5d65276 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
W: TopoDS_Wire
Inside: bool (optional, default to true)

Return
-------
None

Description
-----------
Make a face from a plane and a wire.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P, const TopoDS_Wire & W, const bool Inside = true);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 283e05e1eb0105bed3ada6e3d76ca5c1 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
W: TopoDS_Wire
Inside: bool (optional, default to true)

Return
-------
None

Description
-----------
Make a face from a cylinder and a wire.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C, const TopoDS_Wire & W, const bool Inside = true);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 9509efc98ef1c1f1b922fc0cfaf1ae28 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
W: TopoDS_Wire
Inside: bool (optional, default to true)

Return
-------
None

Description
-----------
Make a face from a cone and a wire.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C, const TopoDS_Wire & W, const bool Inside = true);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 9d7338f5a668948793818d21a406fb57 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
W: TopoDS_Wire
Inside: bool (optional, default to true)

Return
-------
None

Description
-----------
Make a face from a sphere and a wire.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S, const TopoDS_Wire & W, const bool Inside = true);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 5ef1942b0c91ef9958b4df6c9901fb70 ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
C: gp_Torus
W: TopoDS_Wire
Inside: bool (optional, default to true)

Return
-------
None

Description
-----------
Make a face from a torus and a wire.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C, const TopoDS_Wire & W, const bool Inside = true);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 8614c35973ce648a30672c6f49829f4f ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
W: TopoDS_Wire
Inside: bool (optional, default to true)

Return
-------
None

Description
-----------
Make a face from a Surface and a wire.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const TopoDS_Wire & W, const bool Inside = true);

		/****** BRepLib_MakeFace::BRepLib_MakeFace ******/
		/****** md5 signature: 3a87da05adde53547b32a7202b8c6c7f ******/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
Adds the wire <W> in the face <F>.
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Face & F, const TopoDS_Wire & W);

		/****** BRepLib_MakeFace::Add ******/
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
Adds the wire <W> in the current face.
") Add;
		void Add(const TopoDS_Wire & W);

		/****** BRepLib_MakeFace::Error ******/
		/****** md5 signature: 3814c1ef789743cf136230fef8d22557 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepLib_FaceError

Description
-----------
No available documentation.
") Error;
		BRepLib_FaceError Error();

		/****** BRepLib_MakeFace::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the new face.
") Face;
		const TopoDS_Face Face();

		/****** BRepLib_MakeFace::Init ******/
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
Load the face.
") Init;
		void Init(const TopoDS_Face & F);

		/****** BRepLib_MakeFace::Init ******/
		/****** md5 signature: 59a79bdfb378004ca374a9c6f71209d4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Bound: bool
TolDegen: double

Return
-------
None

Description
-----------
Creates the face from the surface. If Bound is True a wire is made from the natural bounds. Accepts tolerance value (TolDegen) for resolution of degenerated edges.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const bool Bound, const double TolDegen);

		/****** BRepLib_MakeFace::Init ******/
		/****** md5 signature: a597d1760b0138e199fed686ed17455e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: double
UMax: double
VMin: double
VMax: double
TolDegen: double

Return
-------
None

Description
-----------
Creates the face from the surface and the min-max values. Accepts tolerance value (TolDegen) for resolution of degenerated edges.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const double UMin, const double UMax, const double VMin, const double VMax, const double TolDegen);

		/****** BRepLib_MakeFace::IsDegenerated ******/
		/****** md5 signature: 967595e0a3fa58aa7b3526a7d40cd506 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theMaxTol: double

Return
-------
theActTol: double

Description
-----------
Checks the specified curve is degenerated according to specified tolerance. Returns <theActTol> less than <theMaxTol>, which shows actual tolerance to decide the curve is degenerated. Warning: For internal use of BRepLib_MakeFace and BRepLib_MakeShell.
") IsDegenerated;
		static bool IsDegenerated(const opencascade::handle<Geom_Curve> & theCurve, const double theMaxTol, Standard_Real &OutValue);

};


%extend BRepLib_MakeFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepLib_MakePolygon *
****************************/
class BRepLib_MakePolygon : public BRepLib_MakeShape {
	public:
		/****** BRepLib_MakePolygon::BRepLib_MakePolygon ******/
		/****** md5 signature: aacb062117958abafc3d0fbec57de5b4 ******/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty MakePolygon.
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon();

		/****** BRepLib_MakePolygon::BRepLib_MakePolygon ******/
		/****** md5 signature: c5105a30c34383e158563a4a55c4b074 ******/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
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
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** BRepLib_MakePolygon::BRepLib_MakePolygon ******/
		/****** md5 signature: 2fd5459dadc123372392a19a1b17c18c ******/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
Close: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const bool Close = false);

		/****** BRepLib_MakePolygon::BRepLib_MakePolygon ******/
		/****** md5 signature: aff1e56cc13bf077c10820e402cd3c28 ******/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt
Close: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4, const bool Close = false);

		/****** BRepLib_MakePolygon::BRepLib_MakePolygon ******/
		/****** md5 signature: 7b0a8f06e39ac3e818558e82f36dc363 ******/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
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
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** BRepLib_MakePolygon::BRepLib_MakePolygon ******/
		/****** md5 signature: dfea62c23b7b18944aaa2c2ff2778800 ******/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex
V3: TopoDS_Vertex
Close: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const bool Close = false);

		/****** BRepLib_MakePolygon::BRepLib_MakePolygon ******/
		/****** md5 signature: a6095d0bb56f314fb5eca3a1e2902f8b ******/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex
V3: TopoDS_Vertex
V4: TopoDS_Vertex
Close: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const TopoDS_Vertex & V4, const bool Close = false);

		/****** BRepLib_MakePolygon::Add ******/
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

		/****** BRepLib_MakePolygon::Add ******/
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
No available documentation.
") Add;
		void Add(const TopoDS_Vertex & V);

		/****** BRepLib_MakePolygon::Added ******/
		/****** md5 signature: 0ff01a94154508f30c229b29032dd902 ******/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the last vertex or point was successfully added.
") Added;
		bool Added();

		/****** BRepLib_MakePolygon::Close ******/
		/****** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Close;
		void Close();

		/****** BRepLib_MakePolygon::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the last edge added to the polygon.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepLib_MakePolygon::FirstVertex ******/
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

		/****** BRepLib_MakePolygon::LastVertex ******/
		/****** md5 signature: 00579001fbfcdaa6b9840a736dc9243f ******/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") LastVertex;
		const TopoDS_Vertex LastVertex();

		/****** BRepLib_MakePolygon::Wire ******/
		/****** md5 signature: 1a80266ab027407949727610f03160e2 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
No available documentation.
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepLib_MakePolygon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_MakeShell *
**************************/
class BRepLib_MakeShell : public BRepLib_MakeShape {
	public:
		/****** BRepLib_MakeShell::BRepLib_MakeShell ******/
		/****** md5 signature: 101951819e82b2bc8aae4ad919232ab5 ******/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Not done.
") BRepLib_MakeShell;
		 BRepLib_MakeShell();

		/****** BRepLib_MakeShell::BRepLib_MakeShell ******/
		/****** md5 signature: 20a9947d117012f90e0deb3f92333f12 ******/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Segment: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeShell;
		 BRepLib_MakeShell(const opencascade::handle<Geom_Surface> & S, const bool Segment = false);

		/****** BRepLib_MakeShell::BRepLib_MakeShell ******/
		/****** md5 signature: ee072aad7a3e63036a8f71d2bfc8cbfe ******/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: double
UMax: double
VMin: double
VMax: double
Segment: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepLib_MakeShell;
		 BRepLib_MakeShell(const opencascade::handle<Geom_Surface> & S, const double UMin, const double UMax, const double VMin, const double VMax, const bool Segment = false);

		/****** BRepLib_MakeShell::Error ******/
		/****** md5 signature: f86105343d1f7a8c438926b5ff57d481 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepLib_ShellError

Description
-----------
No available documentation.
") Error;
		BRepLib_ShellError Error();

		/****** BRepLib_MakeShell::Init ******/
		/****** md5 signature: 69d67daed41794b8ce653a8118f3fd38 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UMin: double
UMax: double
VMin: double
VMax: double
Segment: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates the shell from the surface and the min-max values.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const double UMin, const double UMax, const double VMin, const double VMax, const bool Segment = false);

		/****** BRepLib_MakeShell::Shell ******/
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


%extend BRepLib_MakeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_MakeSolid *
**************************/
class BRepLib_MakeSolid : public BRepLib_MakeShape {
	public:
		/****** BRepLib_MakeSolid::BRepLib_MakeSolid ******/
		/****** md5 signature: 4a21e1a4b5fa5a59bf841cd097ade425 ******/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Solid covers whole space.
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid();

		/****** BRepLib_MakeSolid::BRepLib_MakeSolid ******/
		/****** md5 signature: cfb38d2d7469f4b813037d06d55c44ca ******/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
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
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_CompSolid & S);

		/****** BRepLib_MakeSolid::BRepLib_MakeSolid ******/
		/****** md5 signature: 664e37b9a739671129f23ee949599dab ******/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
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
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S);

		/****** BRepLib_MakeSolid::BRepLib_MakeSolid ******/
		/****** md5 signature: b341b5861b7a90a52fdd2f8cf6d43c6b ******/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
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
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2);

		/****** BRepLib_MakeSolid::BRepLib_MakeSolid ******/
		/****** md5 signature: e41b5e97a7160462f5cf846dd7ea74f4 ******/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
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
Make a solid from three shells.
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2, const TopoDS_Shell & S3);

		/****** BRepLib_MakeSolid::BRepLib_MakeSolid ******/
		/****** md5 signature: d194d2606b4ba8b1988d6dbd38da4766 ******/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "
Parameters
----------
So: TopoDS_Solid

Return
-------
None

Description
-----------
Make a solid from a solid. Useful for adding later.
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Solid & So);

		/****** BRepLib_MakeSolid::BRepLib_MakeSolid ******/
		/****** md5 signature: 56608c108f73f7ee1451b5e3910c003e ******/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
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
Add a shell to a solid.
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Solid & So, const TopoDS_Shell & S);

		/****** BRepLib_MakeSolid::Add ******/
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
Add the shell to the current solid.
") Add;
		void Add(const TopoDS_Shell & S);

		/****** BRepLib_MakeSolid::FaceStatus ******/
		/****** md5 signature: 60eaf2fc9c7953b9266e8a04d9fab3d8 ******/
		%feature("compactdefaultargs") FaceStatus;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
BRepLib_ShapeModification

Description
-----------
returns the status of the Face after the shape creation.
") FaceStatus;
		BRepLib_ShapeModification FaceStatus(const TopoDS_Face & F);

		/****** BRepLib_MakeSolid::Solid ******/
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


%extend BRepLib_MakeSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepLib_MakeVertex *
***************************/
class BRepLib_MakeVertex : public BRepLib_MakeShape {
	public:
		/****** BRepLib_MakeVertex::BRepLib_MakeVertex ******/
		/****** md5 signature: 5af511bb8d68685e3175885cc6d40c2c ******/
		%feature("compactdefaultargs") BRepLib_MakeVertex;
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
") BRepLib_MakeVertex;
		 BRepLib_MakeVertex(const gp_Pnt & P);

		/****** BRepLib_MakeVertex::Vertex ******/
		/****** md5 signature: c8025d701d2a4994ffc4b119d7279582 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend BRepLib_MakeVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepLib_MakeWire *
*************************/
class BRepLib_MakeWire : public BRepLib_MakeShape {
	public:
		class BRepLib_BndBoxVertexSelector {};
		/****** BRepLib_MakeWire::BRepLib_MakeWire ******/
		/****** md5 signature: 5efb7d08579a4f93c331a3c336d25a18 ******/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
NotDone MakeWire.
") BRepLib_MakeWire;
		 BRepLib_MakeWire();

		/****** BRepLib_MakeWire::BRepLib_MakeWire ******/
		/****** md5 signature: 16f751950933f9d3ec660f17fe46c4b3 ******/
		%feature("compactdefaultargs") BRepLib_MakeWire;
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
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E);

		/****** BRepLib_MakeWire::BRepLib_MakeWire ******/
		/****** md5 signature: e6e448e9f05337273a6a95077e19042c ******/
		%feature("compactdefaultargs") BRepLib_MakeWire;
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
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** BRepLib_MakeWire::BRepLib_MakeWire ******/
		/****** md5 signature: a5e0c18c038618f90f69e6ba184360b9 ******/
		%feature("compactdefaultargs") BRepLib_MakeWire;
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
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3);

		/****** BRepLib_MakeWire::BRepLib_MakeWire ******/
		/****** md5 signature: 10f231939f09dc1712a688b6ea19507a ******/
		%feature("compactdefaultargs") BRepLib_MakeWire;
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
Make a Wire from four edges.
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3, const TopoDS_Edge & E4);

		/****** BRepLib_MakeWire::BRepLib_MakeWire ******/
		/****** md5 signature: ac5c38632b4fb819b03eb4dc3b435233 ******/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Make a Wire from a Wire. Useful for adding later.
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Wire & W);

		/****** BRepLib_MakeWire::BRepLib_MakeWire ******/
		/****** md5 signature: ddacfdfbc909129eba28735466e6531c ******/
		%feature("compactdefaultargs") BRepLib_MakeWire;
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
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Wire & W, const TopoDS_Edge & E);

		/****** BRepLib_MakeWire::Add ******/
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
Add the edge <E> to the current wire.
") Add;
		void Add(const TopoDS_Edge & E);

		/****** BRepLib_MakeWire::Add ******/
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

		/****** BRepLib_MakeWire::Add ******/
		/****** md5 signature: d1ddbe829aeb1ce590d51acd2c54c9aa ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Add the edges of <L> to the current wire. The edges are not to be consecutive. But they are to be all connected geometrically or topologically.
") Add;
		void Add(const NCollection_List<TopoDS_Shape> & L);

		/****** BRepLib_MakeWire::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the last edge added to the wire.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepLib_MakeWire::Error ******/
		/****** md5 signature: ae5b245502f5cc9eb925e95c017c85dd ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
BRepLib_WireError

Description
-----------
No available documentation.
") Error;
		BRepLib_WireError Error();

		/****** BRepLib_MakeWire::Vertex ******/
		/****** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the last connecting vertex.
") Vertex;
		const TopoDS_Vertex Vertex();

		/****** BRepLib_MakeWire::Wire ******/
		/****** md5 signature: 1a80266ab027407949727610f03160e2 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the new wire.
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepLib_MakeWire {
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
def breplib_BoundingVertex(*args):
	return breplib.BoundingVertex(*args)

@deprecated
def breplib_BuildCurve3d(*args):
	return breplib.BuildCurve3d(*args)

@deprecated
def breplib_BuildCurves3d(*args):
	return breplib.BuildCurves3d(*args)

@deprecated
def breplib_BuildCurves3d(*args):
	return breplib.BuildCurves3d(*args)

@deprecated
def breplib_BuildPCurveForEdgeOnPlane(*args):
	return breplib.BuildPCurveForEdgeOnPlane(*args)

@deprecated
def breplib_BuildPCurveForEdgeOnPlane(*args):
	return breplib.BuildPCurveForEdgeOnPlane(*args)

@deprecated
def breplib_CheckSameRange(*args):
	return breplib.CheckSameRange(*args)

@deprecated
def breplib_ContinuityOfFaces(*args):
	return breplib.ContinuityOfFaces(*args)

@deprecated
def breplib_EncodeRegularity(*args):
	return breplib.EncodeRegularity(*args)

@deprecated
def breplib_EncodeRegularity(*args):
	return breplib.EncodeRegularity(*args)

@deprecated
def breplib_EncodeRegularity(*args):
	return breplib.EncodeRegularity(*args)

@deprecated
def breplib_EnsureNormalConsistency(*args):
	return breplib.EnsureNormalConsistency(*args)

@deprecated
def breplib_ExtendFace(*args):
	return breplib.ExtendFace(*args)

@deprecated
def breplib_FindValidRange(*args):
	return breplib.FindValidRange(*args)

@deprecated
def breplib_FindValidRange(*args):
	return breplib.FindValidRange(*args)

@deprecated
def breplib_OrientClosedSolid(*args):
	return breplib.OrientClosedSolid(*args)

@deprecated
def breplib_Plane(*args):
	return breplib.Plane(*args)

@deprecated
def breplib_Plane(*args):
	return breplib.Plane(*args)

@deprecated
def breplib_Precision(*args):
	return breplib.Precision(*args)

@deprecated
def breplib_Precision(*args):
	return breplib.Precision(*args)

@deprecated
def breplib_ReverseSortFaces(*args):
	return breplib.ReverseSortFaces(*args)

@deprecated
def breplib_SameParameter(*args):
	return breplib.SameParameter(*args)

@deprecated
def breplib_SameParameter(*args):
	return breplib.SameParameter(*args)

@deprecated
def breplib_SameParameter(*args):
	return breplib.SameParameter(*args)

@deprecated
def breplib_SameParameter(*args):
	return breplib.SameParameter(*args)

@deprecated
def breplib_SameRange(*args):
	return breplib.SameRange(*args)

@deprecated
def breplib_SortFaces(*args):
	return breplib.SortFaces(*args)

@deprecated
def breplib_UpdateDeflection(*args):
	return breplib.UpdateDeflection(*args)

@deprecated
def breplib_UpdateEdgeTol(*args):
	return breplib.UpdateEdgeTol(*args)

@deprecated
def breplib_UpdateEdgeTolerance(*args):
	return breplib.UpdateEdgeTolerance(*args)

@deprecated
def breplib_UpdateInnerTolerances(*args):
	return breplib.UpdateInnerTolerances(*args)

@deprecated
def breplib_UpdateTolerances(*args):
	return breplib.UpdateTolerances(*args)

@deprecated
def breplib_UpdateTolerances(*args):
	return breplib.UpdateTolerances(*args)

@deprecated
def BRepLib_ToolTriangulatedShape_ComputeNormals(*args):
	return BRepLib_ToolTriangulatedShape.ComputeNormals(*args)

@deprecated
def BRepLib_ToolTriangulatedShape_ComputeNormals(*args):
	return BRepLib_ToolTriangulatedShape.ComputeNormals(*args)

@deprecated
def BRepLib_MakeFace_IsDegenerated(*args):
	return BRepLib_MakeFace.IsDegenerated(*args)

}
