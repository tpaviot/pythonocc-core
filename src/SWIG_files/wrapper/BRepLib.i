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
%define BREPLIBDOCSTRING
"BRepLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_breplib.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BRepLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<BRepTools_module.hxx>
#include<TopLoc_module.hxx>
#include<TopoDS_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
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
%import TopTools.i
%import Adaptor3d.i
%import Geom.i
%import BRepTools.i
%import TopLoc.i

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

enum BRepLib_ShellError {
	BRepLib_ShellDone = 0,
	BRepLib_EmptyShell = 1,
	BRepLib_DisconnectedShell = 2,
	BRepLib_ShellParametersOutOfRange = 3,
};

enum BRepLib_ShapeModification {
	BRepLib_Preserved = 0,
	BRepLib_Deleted = 1,
	BRepLib_Trimmed = 2,
	BRepLib_Merged = 3,
	BRepLib_BoundaryModified = 4,
};

enum BRepLib_WireError {
	BRepLib_WireDone = 0,
	BRepLib_EmptyWire = 1,
	BRepLib_DisconnectedWire = 2,
	BRepLib_NonManifoldWire = 3,
};

enum BRepLib_FaceError {
	BRepLib_FaceDone = 0,
	BRepLib_NoFace = 1,
	BRepLib_NotPlanar = 2,
	BRepLib_CurveProjectionFailed = 3,
	BRepLib_ParametersOutOfRange = 4,
};

/* end public enums declaration */

/* python proy classes for enums */
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

class BRepLib_ShellError(IntEnum):
	BRepLib_ShellDone = 0
	BRepLib_EmptyShell = 1
	BRepLib_DisconnectedShell = 2
	BRepLib_ShellParametersOutOfRange = 3
BRepLib_ShellDone = BRepLib_ShellError.BRepLib_ShellDone
BRepLib_EmptyShell = BRepLib_ShellError.BRepLib_EmptyShell
BRepLib_DisconnectedShell = BRepLib_ShellError.BRepLib_DisconnectedShell
BRepLib_ShellParametersOutOfRange = BRepLib_ShellError.BRepLib_ShellParametersOutOfRange

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

class BRepLib_WireError(IntEnum):
	BRepLib_WireDone = 0
	BRepLib_EmptyWire = 1
	BRepLib_DisconnectedWire = 2
	BRepLib_NonManifoldWire = 3
BRepLib_WireDone = BRepLib_WireError.BRepLib_WireDone
BRepLib_EmptyWire = BRepLib_WireError.BRepLib_EmptyWire
BRepLib_DisconnectedWire = BRepLib_WireError.BRepLib_DisconnectedWire
BRepLib_NonManifoldWire = BRepLib_WireError.BRepLib_NonManifoldWire

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
		/****************** BoundingVertex ******************/
		/**** md5 signature: 9d6407d339f4bd152392962cf95ced95 ****/
		%feature("compactdefaultargs") BoundingVertex;
		%feature("autodoc", "Calculates the bounding sphere around the set of vertexes from the thelv list. returns the center (thenewcenter) and the radius (thenewtol) of this sphere. this can be used to construct the new vertex which covers the given set of other vertices.

Parameters
----------
theLV: NCollection_List<TopoDS_Shape>
theNewCenter: gp_Pnt

Returns
-------
theNewTol: float
") BoundingVertex;
		static void BoundingVertex(const NCollection_List<TopoDS_Shape> & theLV, gp_Pnt & theNewCenter, Standard_Real &OutValue);

		/****************** BuildCurve3d ******************/
		/**** md5 signature: d8e9099e9a30a929518b09d1cd9244fb ****/
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "Computes the 3d curve for the edge <e> if it does not exist. returns true if the curve was computed or existed. returns false if there is no planar pcurve or the computation failed. <maxsegment> >= 30 in approximation.

Parameters
----------
E: TopoDS_Edge
Tolerance: float,optional
	default value is 1.0e-5
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1
MaxDegree: int,optional
	default value is 14
MaxSegment: int,optional
	default value is 0

Returns
-------
bool
") BuildCurve3d;
		static Standard_Boolean BuildCurve3d(const TopoDS_Edge & E, const Standard_Real Tolerance = 1.0e-5, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 0);

		/****************** BuildCurves3d ******************/
		/**** md5 signature: f2e476cec2d67740b544a128660a06ff ****/
		%feature("compactdefaultargs") BuildCurves3d;
		%feature("autodoc", "Computes the 3d curves for all the edges of <s> return false if one of the computation failed. <maxsegment> >= 30 in approximation.

Parameters
----------
S: TopoDS_Shape
Tolerance: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1
MaxDegree: int,optional
	default value is 14
MaxSegment: int,optional
	default value is 0

Returns
-------
bool
") BuildCurves3d;
		static Standard_Boolean BuildCurves3d(const TopoDS_Shape & S, const Standard_Real Tolerance, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 0);

		/****************** BuildCurves3d ******************/
		/**** md5 signature: 204d092b783dfacd75dfb95b12784384 ****/
		%feature("compactdefaultargs") BuildCurves3d;
		%feature("autodoc", "Computes the 3d curves for all the edges of <s> return false if one of the computation failed.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") BuildCurves3d;
		static Standard_Boolean BuildCurves3d(const TopoDS_Shape & S);

		/****************** BuildPCurveForEdgeOnPlane ******************/
		/**** md5 signature: eb2eaf6bd1e25fb580fd234600800513 ****/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "Builds pcurve of edge on face if the surface is plane, and updates the edge.

Parameters
----------
theE: TopoDS_Edge
theF: TopoDS_Face

Returns
-------
None
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane(const TopoDS_Edge & theE, const TopoDS_Face & theF);

		/****************** BuildPCurveForEdgeOnPlane ******************/
		/**** md5 signature: 74f8fb705bcddf6e8ff15664dc8d47b7 ****/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "Builds pcurve of edge on face if the surface is plane, but does not update the edge. the output are the pcurve and the flag telling that pcurve was built.

Parameters
----------
theE: TopoDS_Edge
theF: TopoDS_Face
aC2D: Geom2d_Curve

Returns
-------
bToUpdate: bool
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane(const TopoDS_Edge & theE, const TopoDS_Face & theF, opencascade::handle<Geom2d_Curve> & aC2D, Standard_Boolean &OutValue);

		/****************** CheckSameRange ******************/
		/**** md5 signature: d9ef2cd4ef3374a22ba2fd4a9050572c ****/
		%feature("compactdefaultargs") CheckSameRange;
		%feature("autodoc", "Checks if the edge is same range ignoring the same range flag of the edge confusion argument is to compare real numbers idenpendently of any model space tolerance.

Parameters
----------
E: TopoDS_Edge
Confusion: float,optional
	default value is 1.0e-12

Returns
-------
bool
") CheckSameRange;
		static Standard_Boolean CheckSameRange(const TopoDS_Edge & E, const Standard_Real Confusion = 1.0e-12);

		/****************** EncodeRegularity ******************/
		/**** md5 signature: 19c910eb7197237b12eb01c92eebe9e5 ****/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "Encodes the regularity of edges on a shape. warning: <tolang> is an angular tolerance, expressed in rad. warning: if the edges's regularity are coded before, nothing is done.

Parameters
----------
S: TopoDS_Shape
TolAng: float,optional
	default value is 1.0e-10

Returns
-------
None
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & S, const Standard_Real TolAng = 1.0e-10);

		/****************** EncodeRegularity ******************/
		/**** md5 signature: 0fb005a839a1ca0e40b83d5aa3066041 ****/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "Encodes the regularity of edges in list <le> on the shape <s> warning: <tolang> is an angular tolerance, expressed in rad. warning: if the edges's regularity are coded before, nothing is done.

Parameters
----------
S: TopoDS_Shape
LE: TopTools_ListOfShape
TolAng: float,optional
	default value is 1.0e-10

Returns
-------
None
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & S, const TopTools_ListOfShape & LE, const Standard_Real TolAng = 1.0e-10);

		/****************** EncodeRegularity ******************/
		/**** md5 signature: 172eaf1d13de1fe1ad03867f4f67dce0 ****/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "Encodes the regularity beetween <f1> and <f2> by <e> warning: <tolang> is an angular tolerance, expressed in rad. warning: if the edge's regularity is coded before, nothing is done.

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
TolAng: float,optional
	default value is 1.0e-10

Returns
-------
None
") EncodeRegularity;
		static void EncodeRegularity(TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const Standard_Real TolAng = 1.0e-10);

		/****************** EnsureNormalConsistency ******************/
		/**** md5 signature: 333cd3af6b2fdcd6cde8b593c31284a9 ****/
		%feature("compactdefaultargs") EnsureNormalConsistency;
		%feature("autodoc", "Corrects the normals in poly_triangulation of faces, in such way that normals at nodes lying along smooth edges have the same value on both adjacent triangulations. returns true if any correction is done.

Parameters
----------
S: TopoDS_Shape
theAngTol: float,optional
	default value is 0.001
ForceComputeNormals: bool,optional
	default value is Standard_False

Returns
-------
bool
") EnsureNormalConsistency;
		static Standard_Boolean EnsureNormalConsistency(const TopoDS_Shape & S, const Standard_Real theAngTol = 0.001, const Standard_Boolean ForceComputeNormals = Standard_False);

		/****************** ExtendFace ******************/
		/**** md5 signature: b2c07a72140e36de05af305bcd484489 ****/
		%feature("compactdefaultargs") ExtendFace;
		%feature("autodoc", "Enlarges the face on the given value. @param thef [in] the face to extend @param theextval [in] the extension value @param theextumin [in] defines whether to extend the face in umin direction @param theextumax [in] defines whether to extend the face in umax direction @param theextvmin [in] defines whether to extend the face in vmin direction @param theextvmax [in] defines whether to extend the face in vmax direction @param thefextended [in] the extended face.

Parameters
----------
theF: TopoDS_Face
theExtVal: float
theExtUMin: bool
theExtUMax: bool
theExtVMin: bool
theExtVMax: bool
theFExtended: TopoDS_Face

Returns
-------
None
") ExtendFace;
		static void ExtendFace(const TopoDS_Face & theF, const Standard_Real theExtVal, const Standard_Boolean theExtUMin, const Standard_Boolean theExtUMax, const Standard_Boolean theExtVMin, const Standard_Boolean theExtVMax, TopoDS_Face & theFExtended);

		/****************** FindValidRange ******************/
		/**** md5 signature: 5d83ca03919e4732c16bdd3ceefc7d56 ****/
		%feature("compactdefaultargs") FindValidRange;
		%feature("autodoc", "For an edge defined by 3d curve and tolerance and vertices defined by points, parameters on curve and tolerances, finds a range of curve between vertices not covered by vertices tolerances. returns false if there is no such range. otherwise, sets thefirst and thelast as its bounds.

Parameters
----------
theCurve: Adaptor3d_Curve
theTolE: float
theParV1: float
thePntV1: gp_Pnt
theTolV1: float
theParV2: float
thePntV2: gp_Pnt
theTolV2: float

Returns
-------
theFirst: float
theLast: float
") FindValidRange;
		static Standard_Boolean FindValidRange(const Adaptor3d_Curve & theCurve, const Standard_Real theTolE, const Standard_Real theParV1, const gp_Pnt & thePntV1, const Standard_Real theTolV1, const Standard_Real theParV2, const gp_Pnt & thePntV2, const Standard_Real theTolV2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FindValidRange ******************/
		/**** md5 signature: 16a8dd6346bc70745b1437c644d131d2 ****/
		%feature("compactdefaultargs") FindValidRange;
		%feature("autodoc", "Finds a range of 3d curve of the edge not covered by vertices tolerances. returns false if there is no such range. otherwise, sets thefirst and thelast as its bounds.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
theFirst: float
theLast: float
") FindValidRange;
		static Standard_Boolean FindValidRange(const TopoDS_Edge & theEdge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** OrientClosedSolid ******************/
		/**** md5 signature: cde24280a2621155ab6f58b7cc92c489 ****/
		%feature("compactdefaultargs") OrientClosedSolid;
		%feature("autodoc", "Orients the solid forward and the shell with the orientation to have matter in the solid. returns false if the solid is unorientable (open or incoherent).

Parameters
----------
solid: TopoDS_Solid

Returns
-------
bool
") OrientClosedSolid;
		static Standard_Boolean OrientClosedSolid(TopoDS_Solid & solid);

		/****************** Plane ******************/
		/**** md5 signature: 215779db6a724a03f9f8ce477370cef4 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Sets the current plane to p.

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
		%feature("autodoc", "Computes the max distance between edge and its 2d representation on the face. sets the default precision. the current precision is returned.

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

		/****************** ReverseSortFaces ******************/
		/**** md5 signature: 5c834edf3fced01cd530658b4e20344b ****/
		%feature("compactdefaultargs") ReverseSortFaces;
		%feature("autodoc", "Sorts in lf the faces of s on the reverse complexity of their surfaces (other,torus,sphere,cone,cylinder,plane).

Parameters
----------
S: TopoDS_Shape
LF: TopTools_ListOfShape

Returns
-------
None
") ReverseSortFaces;
		static void ReverseSortFaces(const TopoDS_Shape & S, TopTools_ListOfShape & LF);

		/****************** SameParameter ******************/
		/**** md5 signature: 5c5d4240cd8907cefccc80b8b3ea011e ****/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for the edge <theedge> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on the edge.

Parameters
----------
theEdge: TopoDS_Edge
Tolerance: float,optional
	default value is 1.0e-5

Returns
-------
None
") SameParameter;
		static void SameParameter(const TopoDS_Edge & theEdge, const Standard_Real Tolerance = 1.0e-5);

		/****************** SameParameter ******************/
		/**** md5 signature: b4fbeb89b4594cf9352322c9856b5950 ****/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for the edge <theedge> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on the edge. thenewtol is a new tolerance of vertices of the input edge (not applied inside the algorithm, but pre-computed). if isuseoldedge is true then the input edge will be modified, otherwise the new copy of input edge will be created. returns the new edge as a result, can be ignored if isuseoldedge is true.

Parameters
----------
theEdge: TopoDS_Edge
theTolerance: float
IsUseOldEdge: bool

Returns
-------
theNewTol: float
") SameParameter;
		static TopoDS_Edge SameParameter(const TopoDS_Edge & theEdge, const Standard_Real theTolerance, Standard_Real &OutValue, const Standard_Boolean IsUseOldEdge);

		/****************** SameParameter ******************/
		/**** md5 signature: 2b6345dbc9df15880edd16e53a03b47f ****/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for all the edges of <s> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on an edge.

Parameters
----------
S: TopoDS_Shape
Tolerance: float,optional
	default value is 1.0e-5
forced: bool,optional
	default value is Standard_False

Returns
-------
None
") SameParameter;
		static void SameParameter(const TopoDS_Shape & S, const Standard_Real Tolerance = 1.0e-5, const Standard_Boolean forced = Standard_False);

		/****************** SameParameter ******************/
		/**** md5 signature: cfb21365f9a6e6262e51c4374bfdfcc0 ****/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for all the edges of <s> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on an edge. thereshaper is used to record the modifications of input shape <s> to prevent any modifications on the shape itself. thus the input shape (and its subshapes) will not be modified, instead the reshaper will contain a modified empty-copies of original subshapes as substitutions.

Parameters
----------
S: TopoDS_Shape
theReshaper: BRepTools_ReShape
Tolerance: float,optional
	default value is 1.0e-5
forced: bool,optional
	default value is Standard_False

Returns
-------
None
") SameParameter;
		static void SameParameter(const TopoDS_Shape & S, BRepTools_ReShape & theReshaper, const Standard_Real Tolerance = 1.0e-5, const Standard_Boolean forced = Standard_False);

		/****************** SameRange ******************/
		/**** md5 signature: e07686d7b9c2e87d078e9cf28f531b62 ****/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "Will make all the curve representation have the same range domain for the parameters. this will ignore the same range flag value to proceed. if there is a 3d curve there it will the range of that curve. if not the first curve representation encountered in the list will give its range to the all the other curves.

Parameters
----------
E: TopoDS_Edge
Tolerance: float,optional
	default value is 1.0e-5

Returns
-------
None
") SameRange;
		static void SameRange(const TopoDS_Edge & E, const Standard_Real Tolerance = 1.0e-5);

		/****************** SortFaces ******************/
		/**** md5 signature: c670dbe0a47983eb81dd61ba0887f298 ****/
		%feature("compactdefaultargs") SortFaces;
		%feature("autodoc", "Sorts in lf the faces of s on the complexity of their surfaces (plane,cylinder,cone,sphere,torus,other).

Parameters
----------
S: TopoDS_Shape
LF: TopTools_ListOfShape

Returns
-------
None
") SortFaces;
		static void SortFaces(const TopoDS_Shape & S, TopTools_ListOfShape & LF);

		/****************** UpdateEdgeTol ******************/
		/**** md5 signature: 38bb8b704b359479ae8f63fd5e383848 ****/
		%feature("compactdefaultargs") UpdateEdgeTol;
		%feature("autodoc", "Checks if the edge has a tolerance smaller than -- -- -- -- maxtolerancetocheck if so it will compute the radius of -- the cylindrical pipe surface that mintolerancerequest is the minimum tolerance before it is usefull to start testing. usually it should be arround 10e-5 contains all -- the curve represenation of the edge returns true if the edge tolerance had to be updated.

Parameters
----------
E: TopoDS_Edge
MinToleranceRequest: float
MaxToleranceToCheck: float

Returns
-------
bool
") UpdateEdgeTol;
		static Standard_Boolean UpdateEdgeTol(const TopoDS_Edge & E, const Standard_Real MinToleranceRequest, const Standard_Real MaxToleranceToCheck);

		/****************** UpdateEdgeTolerance ******************/
		/**** md5 signature: a900570e66aa87edd638ebad627eb240 ****/
		%feature("compactdefaultargs") UpdateEdgeTolerance;
		%feature("autodoc", "-- checks all the edges of the shape whose -- -- -- tolerance is smaller than maxtolerancetocheck -- returns true if at least one edge was updated -- mintolerancerequest is the minimum tolerance before -- it -- is usefull to start testing. usually it should be arround -- 10e-5-- //! warning :the method is very slow as it checks all. use only in interfaces or processing assimilate batch.

Parameters
----------
S: TopoDS_Shape
MinToleranceRequest: float
MaxToleranceToCheck: float

Returns
-------
bool
") UpdateEdgeTolerance;
		static Standard_Boolean UpdateEdgeTolerance(const TopoDS_Shape & S, const Standard_Real MinToleranceRequest, const Standard_Real MaxToleranceToCheck);

		/****************** UpdateInnerTolerances ******************/
		/**** md5 signature: f8274e750a439791de5f4024a2905387 ****/
		%feature("compactdefaultargs") UpdateInnerTolerances;
		%feature("autodoc", "Checks tolerances of edges (including inner points) and vertices of a shape and updates them to satisfy 'sameparameter' condition.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") UpdateInnerTolerances;
		static void UpdateInnerTolerances(const TopoDS_Shape & S);

		/****************** UpdateTolerances ******************/
		/**** md5 signature: 0198d839071a3de5f272c500a29a7eae ****/
		%feature("compactdefaultargs") UpdateTolerances;
		%feature("autodoc", "Replaces tolerance of face edge vertex by the tolerance max of their connected handling shapes. it is not necessary to use this call after sameparameter. (called in).

Parameters
----------
S: TopoDS_Shape
verifyFaceTolerance: bool,optional
	default value is Standard_False

Returns
-------
None
") UpdateTolerances;
		static void UpdateTolerances(const TopoDS_Shape & S, const Standard_Boolean verifyFaceTolerance = Standard_False);

		/****************** UpdateTolerances ******************/
		/**** md5 signature: d1c1288e8bbb918e38ee02d611522fe2 ****/
		%feature("compactdefaultargs") UpdateTolerances;
		%feature("autodoc", "Replaces tolerance of face edge vertex by the tolerance max of their connected handling shapes. it is not necessary to use this call after sameparameter. (called in) thereshaper is used to record the modifications of input shape <s> to prevent any modifications on the shape itself. thus the input shape (and its subshapes) will not be modified, instead the reshaper will contain a modified empty-copies of original subshapes as substitutions.

Parameters
----------
S: TopoDS_Shape
theReshaper: BRepTools_ReShape
verifyFaceTolerance: bool,optional
	default value is Standard_False

Returns
-------
None
") UpdateTolerances;
		static void UpdateTolerances(const TopoDS_Shape & S, BRepTools_ReShape & theReshaper, const Standard_Boolean verifyFaceTolerance = Standard_False);

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
		/****************** BRepLib_CheckCurveOnSurface ******************/
		/**** md5 signature: 588c2b7becc8474a44af769cd1861cc0 ****/
		%feature("compactdefaultargs") BRepLib_CheckCurveOnSurface;
		%feature("autodoc", "Default contructor.

Returns
-------
None
") BRepLib_CheckCurveOnSurface;
		 BRepLib_CheckCurveOnSurface();

		/****************** BRepLib_CheckCurveOnSurface ******************/
		/**** md5 signature: 4463fa8016612b07a0638ab8e597c79a ****/
		%feature("compactdefaultargs") BRepLib_CheckCurveOnSurface;
		%feature("autodoc", "Contructor.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Returns
-------
None
") BRepLib_CheckCurveOnSurface;
		 BRepLib_CheckCurveOnSurface(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****************** Curve ******************/
		/**** md5 signature: 62a16889fb975efa1b2de012099c169b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns source 3d-curve.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** ErrorStatus ******************/
		/**** md5 signature: 23ccaf4f25108c0b871675cdf964cbf6 ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Returns error status the possible values are: 0 - ok; 1 - null curve or surface or 2d curve; 2 - invalid parametric range; 3 - error in calculations.

Returns
-------
int
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****************** Init ******************/
		/**** md5 signature: 2a831d636c2c924d38adfdfa075e8336 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Sets the data for the algorithm.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the max distance has been found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxDistance ******************/
		/**** md5 signature: eb56c1d1489e07dddfaf89c1bd00ff56 ****/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "Returns max distance.

Returns
-------
float
") MaxDistance;
		Standard_Real MaxDistance();

		/****************** MaxParameter ******************/
		/**** md5 signature: 23a45560d6d0376bf4b799705df1e0c0 ****/
		%feature("compactdefaultargs") MaxParameter;
		%feature("autodoc", "Returns parameter in which the distance is maximal.

Returns
-------
float
") MaxParameter;
		Standard_Real MaxParameter();

		/****************** PCurve ******************/
		/**** md5 signature: 02216b6aba2c78f7fc310936f46a0781 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Returns mine 2d-curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve2 ******************/
		/**** md5 signature: 59fdc85af76719d116ff8e4e51299a26 ****/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "Returns 2nd 2d-curve (if it exists, e.g. for seam-edge).

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve2;
		const opencascade::handle<Geom2d_Curve> & PCurve2();

		/****************** Perform ******************/
		/**** md5 signature: be005fa96430b01dfd3d5c428d6ad6e3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the calculation if isthemultytheaddisabled == true then computation will be made without any parallelization.

Parameters
----------
isTheMultyTheradDisabled: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean isTheMultyTheradDisabled = Standard_False);

		/****************** Range ******************/
		/**** md5 signature: d6d291eeedf26e22d25b030eceff7dfa ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Returns first and last parameter of the curves (2d- and 3d-curves are considered to have same range).

Parameters
----------

Returns
-------
theFirst: float
theLast: float
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Surface ******************/
		/**** md5 signature: 3aa31a6d63da8a25f018cf96599c0928 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns source surface.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

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
		/****************** BRepLib_FindSurface ******************/
		/**** md5 signature: 05d2a378003b1863b90b5e71c7ee98ab ****/
		%feature("compactdefaultargs") BRepLib_FindSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepLib_FindSurface;
		 BRepLib_FindSurface();

		/****************** BRepLib_FindSurface ******************/
		/**** md5 signature: b8cba8dda11d30fdcb78d4560e9a7962 ****/
		%feature("compactdefaultargs") BRepLib_FindSurface;
		%feature("autodoc", "Computes the surface from the edges of <s> with the given tolerance. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set. if <onlyclosed> is true, then s sould be a wire and the existing surface, on which wire s is not closed in 2d, will be ignored.

Parameters
----------
S: TopoDS_Shape
Tol: float,optional
	default value is -1
OnlyPlane: bool,optional
	default value is Standard_False
OnlyClosed: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepLib_FindSurface;
		 BRepLib_FindSurface(const TopoDS_Shape & S, const Standard_Real Tol = -1, const Standard_Boolean OnlyPlane = Standard_False, const Standard_Boolean OnlyClosed = Standard_False);

		/****************** Existed ******************/
		/**** md5 signature: 3e9d26310a54bcfa26ae446236bcd326 ****/
		%feature("compactdefaultargs") Existed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Existed;
		Standard_Boolean Existed();

		/****************** Found ******************/
		/**** md5 signature: f98a87b5981b48fa74222eaa5aa8feb6 ****/
		%feature("compactdefaultargs") Found;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Found;
		Standard_Boolean Found();

		/****************** Init ******************/
		/**** md5 signature: ffdff77a564b351561b3277d0ad3c0f6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes the surface from the edges of <s> with the given tolerance. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set. if <onlyclosed> is true, then s sould be a wire and the existing surface, on which wire s is not closed in 2d, will be ignored.

Parameters
----------
S: TopoDS_Shape
Tol: float,optional
	default value is -1
OnlyPlane: bool,optional
	default value is Standard_False
OnlyClosed: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Real Tol = -1, const Standard_Boolean OnlyPlane = Standard_False, const Standard_Boolean OnlyClosed = Standard_False);

		/****************** Location ******************/
		/**** md5 signature: 9aada9ca43432b6e0a1b3215ca813c4b ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
TopLoc_Location
") Location;
		TopLoc_Location Location();

		/****************** Surface ******************/
		/**** md5 signature: 352bd890213763e77e08756c09e1fdcc ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** ToleranceReached ******************/
		/**** md5 signature: a6314d79889dbea629fdb016144cc500 ****/
		%feature("compactdefaultargs") ToleranceReached;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ToleranceReached;
		Standard_Real ToleranceReached();

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
		/****************** BRepLib_FuseEdges ******************/
		/**** md5 signature: 3192e647e21f5c4050a8d8df456f8b45 ****/
		%feature("compactdefaultargs") BRepLib_FuseEdges;
		%feature("autodoc", "Initialise members and build construction of map of ancestors.

Parameters
----------
theShape: TopoDS_Shape
PerformNow: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepLib_FuseEdges;
		 BRepLib_FuseEdges(const TopoDS_Shape & theShape, const Standard_Boolean PerformNow = Standard_False);

		/****************** AvoidEdges ******************/
		/**** md5 signature: d76ba44d4c0d9554fdf47f67049f8da0 ****/
		%feature("compactdefaultargs") AvoidEdges;
		%feature("autodoc", "Set edges to avoid being fused.

Parameters
----------
theMapEdg: TopTools_IndexedMapOfShape

Returns
-------
None
") AvoidEdges;
		void AvoidEdges(const TopTools_IndexedMapOfShape & theMapEdg);

		/****************** Edges ******************/
		/**** md5 signature: 8084c179e24e67079a00b4a173ee9313 ****/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.

Parameters
----------
theMapLstEdg: TopTools_DataMapOfIntegerListOfShape

Returns
-------
None
") Edges;
		void Edges(TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);

		/****************** Faces ******************/
		/**** md5 signature: f5abad97fb8ff03cd2b7955c20acd767 ****/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Returns the map of modified faces.

Parameters
----------
theMapFac: TopTools_DataMapOfShapeShape

Returns
-------
None
") Faces;
		void Faces(TopTools_DataMapOfShapeShape & theMapFac);

		/****************** NbVertices ******************/
		/**** md5 signature: 18584eb261816370021ae75041e9f83a ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Returns the number of vertices candidate to be removed.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Using map of list of connex edges, fuse each list to one edge and then update myshape.

Returns
-------
None
") Perform;
		void Perform();

		/****************** ResultEdges ******************/
		/**** md5 signature: c473d3c90614f31ceb4528d8ba7addb5 ****/
		%feature("compactdefaultargs") ResultEdges;
		%feature("autodoc", "Returns all the fused edges. each integer entry in the map corresponds to the integer in the datamapofintegerlistofshape we get in method edges. that is to say, to the list of edges in themaplstedg(i) corresponds the resulting edge themapedge(i).

Parameters
----------
theMapEdg: TopTools_DataMapOfIntegerShape

Returns
-------
None
") ResultEdges;
		void ResultEdges(TopTools_DataMapOfIntegerShape & theMapEdg);

		/****************** SetConcatBSpl ******************/
		/**** md5 signature: 3dafc254ea0616772e4fe7729e2596de ****/
		%feature("compactdefaultargs") SetConcatBSpl;
		%feature("autodoc", "Set mode to enable concatenation g1 bspline edges in one end modified by ifv 19.04.07.

Parameters
----------
theConcatBSpl: bool,optional
	default value is Standard_True

Returns
-------
None
") SetConcatBSpl;
		void SetConcatBSpl(const Standard_Boolean theConcatBSpl = Standard_True);

		/****************** Shape ******************/
		/**** md5 signature: 4968b0e4669317ad9b7893680ac9a219 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns myshape modified with the list of internal edges removed from it.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

};


%extend BRepLib_FuseEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_MakeShape *
**************************/
%nodefaultctor BRepLib_MakeShape;
class BRepLib_MakeShape : public BRepLib_Command {
	public:
		/****************** Build ******************/
		/**** md5 signature: 634d88e5c99c5ce236c07b337243d591 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "This is called by shape(). it does nothing but may be redefined.

Returns
-------
None
") Build;
		void Build();

		/****************** DescendantFaces ******************/
		/**** md5 signature: 8df58efb7992f4d5a7fd3ff07c209ade ****/
		%feature("compactdefaultargs") DescendantFaces;
		%feature("autodoc", "Returns the list of generated faces.

Parameters
----------
F: TopoDS_Face

Returns
-------
TopTools_ListOfShape
") DescendantFaces;
		virtual const TopTools_ListOfShape & DescendantFaces(const TopoDS_Face & F);

		/****************** FaceStatus ******************/
		/**** md5 signature: 5ba76a83c885c175dfdc1ccf1a0b227c ****/
		%feature("compactdefaultargs") FaceStatus;
		%feature("autodoc", "Returns the status of the face after the shape creation.

Parameters
----------
F: TopoDS_Face

Returns
-------
BRepLib_ShapeModification
") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus(const TopoDS_Face & F);

		/****************** FacesFromEdges ******************/
		/**** md5 signature: ede406fa6cad5565fccbde10219d8cdc ****/
		%feature("compactdefaultargs") FacesFromEdges;
		%feature("autodoc", "Returns a list of the created faces from the edge <e>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopTools_ListOfShape
") FacesFromEdges;
		virtual const TopTools_ListOfShape & FacesFromEdges(const TopoDS_Edge & E);

		/****************** HasDescendants ******************/
		/**** md5 signature: 5dfd9dee6a174cf40b37fcc3fc769ec8 ****/
		%feature("compactdefaultargs") HasDescendants;
		%feature("autodoc", "Returns true if the face generates new topology.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") HasDescendants;
		virtual Standard_Boolean HasDescendants(const TopoDS_Face & F);

		/****************** NbSurfaces ******************/
		/**** md5 signature: 9fc085a7006ba3837eefd2b047c50505 ****/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Returns the number of surfaces after the shape creation.

Returns
-------
int
") NbSurfaces;
		virtual Standard_Integer NbSurfaces();

		/****************** NewFaces ******************/
		/**** md5 signature: e7c3baccbeecb1721ee5663fcedbeab2 ****/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Return the faces created for surface i.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") NewFaces;
		virtual const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****************** Shape ******************/
		/**** md5 signature: 35cc6b8a92112f8b2067e768b8f01ff2 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: ff5f9d42b34fd8755f3ceed6526aa3da ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge();

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 98a3610d3756d0b0ad66bdcccf794eba ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 2830aaf617c2443026ec071f091ca01b ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 26d9850e091998754b6ecaab1aef1d0e ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: af34800776240963b0b7ad5bf6dced9a ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 0d4017c8497dcacedd786f3dcdaac683 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: e0b62169f2368ccc53618e3a966136f2 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: dd78427649c02f0412acf4081b8db829 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 8010b690a9edf1d81b0ba93c583608fe ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: c91a90ae7df25d6b8e40b81940ca4b7c ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 14bd0128665af2258ebe47770d8fb6dd ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: cddc795a530ee6036d9962467cd53bf9 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 108b98c6e7ed81c7015103c1a1a29781 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 06d1280d59fc92a193890b79160b0e77 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 73aac35a868f95812b9563080ce3efe8 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: c95afe3eaf666dd7e15706577fde46d4 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 0397aae04f47fff57560d095d3e7437b ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 26ce953ab7e802cc208f18f1cfbab2b6 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 6066a449187d5c176e51a8350853ddeb ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 41d01e90457d8bf5d5ef4297a021649c ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: c7b5a08fc84bfe38d0a90725df5bbd9c ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: f3507502fb730d27f98864f12d561310 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: dac9ce58e588d6dc289841341d82be20 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 19bdf5463e96fedf9b11df992698709e ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 106f831047c13089c37f719079f78549 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: d743b1166a4aa754c0386de9a92c966d ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: d09e0cf3b86db9f98fb205636abfe802 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 89bd22fddf706495b67ddcef6ea6bbfd ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: b89ec974f95c1dfee86f5665308a042d ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 8dee1765d199f2245a83cccdf28b5532 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
S: Geom_Surface

Returns
-------
None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 0bf5e5b81574251e312a4e57ecadac83 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: c6bebde95ae610ff35a5d9ef3622e044 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: a0e02ae1e45cbbea5b7334ee5e607d15 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: fa7462603260f1fe2035d75f5e6f4c61 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		/**** md5 signature: 1dd23a8eff7c5f01c11450ba4106db9d ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "No available documentation.

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
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

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
		/**** md5 signature: 20d9748fec77b6c2426dc27ab850ca5c ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the error description when notdone.

Returns
-------
BRepLib_EdgeError
") Error;
		BRepLib_EdgeError Error();

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
		%feature("autodoc", "No available documentation.

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
		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: de8a8f3e23e69fc9e75ccd84c3760a77 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: da11ac145a027e24369a8c89b7db9475 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 4ebad4dd866258574acdda28b43ab270 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: a997108b16e661a09a24601c5679b3f0 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: f329f0e3c21f7ff3e9bc12ff69d8b321 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: a37e3586c16fd442625f90470567f62d ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 92e4f45eede977ee43643fee90b339d7 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 81bf556eb25414c4ddc242abe229d407 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 8c7cc68166b1dd1eeec27938ba6fa2c4 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 34f9657fe0f8805108573ebc9b604dfc ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Circ2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 9f3b9a91e9d758b0b96702cdc46d2d86 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 6cb9ee1cd761cae52b422fd6a23516ec ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 028cece37204c3539e721c37f7b9b093 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: ec539e76684e0af672cbb9828edd9d87 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Elips2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 290b789dc756aeed7c876190b3160d65 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: a996888dfa7a37ac3d5c3f51d223671c ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 70ee7ca5e1e5bfe58065106dbb4dc8e0 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: d9f40eb1416118cebc6ac8b81f021c8c ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Hypr2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: efe9dbfb476842f7eab4b04dc0be9f93 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 390fd21101740f5959dc03f6e4d3c944 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 6916a6786470149e1f649e7b30d6b377 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 4e23bad0d2ddaf63837b9103d8c497f7 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Parab2d
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 8399ce2ab3d8b76877d03914e74e0197 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: d94e150f6ac8f771336a088e1e0ad54d ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
p1: float
p2: float

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 01ee21ab26910f427461fb97cb2e22e5 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 83a478b2aa930fd288a84ff4317e1bf0 ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: Geom2d_Curve
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 300875173ff311f28ba469b85de9fc1e ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		/**** md5 signature: 20f292df496f48d81091104b3ad42efa ****/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
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
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

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
		/**** md5 signature: 20d9748fec77b6c2426dc27ab850ca5c ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the error description when notdone.

Returns
-------
BRepLib_EdgeError
") Error;
		BRepLib_EdgeError Error();

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
		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 36f4b8fa3a3e86d49ad8175f15a6a181 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Not done.

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace();

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 5ce188b7df2a0fe70e449d0f77eb834b ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Load a face. usefull to add wires.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Face & F);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: f58385a55702aaf05d7a60a8c4d06779 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a plane.

Parameters
----------
P: gp_Pln

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 497b8219b83a91681ee6bac6143afbbf ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cylinder.

Parameters
----------
C: gp_Cylinder

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 7db1068be3142da374a0c117ba857df3 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cone.

Parameters
----------
C: gp_Cone

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: d3ddee166dcf5a3d7fa55005e8b00f6c ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a sphere.

Parameters
----------
S: gp_Sphere

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 995e7af1530f86cd9ab3a4d3e4ea69ef ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a torus.

Parameters
----------
C: gp_Torus

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 71fcda54bfeccc386fb75b2aff873cfb ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts tolerance value (toldegen) for resolution of degenerated edges.

Parameters
----------
S: Geom_Surface
TolDegen: float

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real TolDegen);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: e22b1b0fb58fd884291f1e45462b13b1 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: d8da7666ae167d4a95b1316b8cd9e07c ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: ad0c69f42c45c8362f1abab4fbbf43a8 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: d521384eae57a8868ab132a84828ba6f ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: f3864ce104fe0b7123172ce1e14051c7 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: f016cba06f591c9b61ab608145612651 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts min & max parameters to construct the face's bounds. also accepts tolerance value (toldegen) for resolution of degenerated edges.

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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: ed28ba4982d2f9b3dddc1392d53f7acd ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Find a surface from the wire and make a face. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set.

Parameters
----------
W: TopoDS_Wire
OnlyPlane: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Wire & W, const Standard_Boolean OnlyPlane = Standard_False);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 354be0c0ac63645d25f576674820f14a ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: a4de9a65b88a70bbef252d71c2886c6c ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 642cbd945296b1bbb29dd1d9b4177253 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: f2e533bf67075db9c8a755d4745f4351 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: f588f43ab7388d61ecf7054cc98e3736 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 7b3f376200a4a9abc0db46cc88285ec9 ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
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
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		/**** md5 signature: 3a87da05adde53547b32a7202b8c6c7f ****/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Adds the wire <w> in the face <f>.

Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire

Returns
-------
None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Face & F, const TopoDS_Wire & W);

		/****************** Add ******************/
		/**** md5 signature: 3257e47f30128eb5440b1eab5065e724 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the wire <w> in the current face.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") Add;
		void Add(const TopoDS_Wire & W);

		/****************** Error ******************/
		/**** md5 signature: 3814c1ef789743cf136230fef8d22557 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepLib_FaceError
") Error;
		BRepLib_FaceError Error();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the new face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		/**** md5 signature: a8dfaa68079e743e08190fe58d950a9a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Load the face.

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
		%feature("autodoc", "Creates the face from the surface. if bound is true a wire is made from the natural bounds. accepts tolerance value (toldegen) for resolution of degenerated edges.

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
		%feature("autodoc", "Creates the face from the surface and the min-max values. accepts tolerance value (toldegen) for resolution of degenerated edges.

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

		/****************** IsDegenerated ******************/
		/**** md5 signature: 8569447db8fb27d83d66da5cfdd04d4e ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Checks the specified curve is degenerated according to specified tolerance. returns <theacttol> less than <themaxtol>, which shows actual tolerance to decide the curve is degenerated. warning: for internal use of breplib_makeface and breplib_makeshell.

Parameters
----------
theCurve: Geom_Curve
theMaxTol: float

Returns
-------
theActTol: float
") IsDegenerated;
		static Standard_Boolean IsDegenerated(const opencascade::handle<Geom_Curve> & theCurve, const Standard_Real theMaxTol, Standard_Real &OutValue);

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
		/****************** BRepLib_MakePolygon ******************/
		/**** md5 signature: aacb062117958abafc3d0fbec57de5b4 ****/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "Creates an empty makepolygon.

Returns
-------
None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon();

		/****************** BRepLib_MakePolygon ******************/
		/**** md5 signature: c5105a30c34383e158563a4a55c4b074 ****/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakePolygon ******************/
		/**** md5 signature: 8773333921c39918b59dcd751d310fed ****/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
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
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const Standard_Boolean Close = Standard_False);

		/****************** BRepLib_MakePolygon ******************/
		/**** md5 signature: 29183b2578b472750b34c4ce98f6f3bf ****/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "No available documentation.

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
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4, const Standard_Boolean Close = Standard_False);

		/****************** BRepLib_MakePolygon ******************/
		/**** md5 signature: 7b0a8f06e39ac3e818558e82f36dc363 ****/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakePolygon ******************/
		/**** md5 signature: 3641e43af47b1d25d5f849e10b5b22b1 ****/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
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
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const Standard_Boolean Close = Standard_False);

		/****************** BRepLib_MakePolygon ******************/
		/**** md5 signature: 9216cf1c809a9fbfc2560c5240b6f8d9 ****/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "No available documentation.

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
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const TopoDS_Vertex & V4, const Standard_Boolean Close = Standard_False);

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "Returns true if the last vertex or point was succesfully added.

Returns
-------
bool
") Added;
		Standard_Boolean Added();

		/****************** Close ******************/
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Close;
		void Close();

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the last edge added to the polygon.

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

		/****************** LastVertex ******************/
		/**** md5 signature: 00579001fbfcdaa6b9840a736dc9243f ****/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") LastVertex;
		const TopoDS_Vertex LastVertex();

		/****************** Wire ******************/
		/**** md5 signature: 1a80266ab027407949727610f03160e2 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Wire
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
		/****************** BRepLib_MakeShell ******************/
		/**** md5 signature: 101951819e82b2bc8aae4ad919232ab5 ****/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "Not done.

Returns
-------
None
") BRepLib_MakeShell;
		 BRepLib_MakeShell();

		/****************** BRepLib_MakeShell ******************/
		/**** md5 signature: bc40882509752595dfaf04541e1aa7c9 ****/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface
Segment: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepLib_MakeShell;
		 BRepLib_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Segment = Standard_False);

		/****************** BRepLib_MakeShell ******************/
		/**** md5 signature: f722e53312cdff1b556905c138f432a4 ****/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "No available documentation.

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
") BRepLib_MakeShell;
		 BRepLib_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****************** Error ******************/
		/**** md5 signature: f86105343d1f7a8c438926b5ff57d481 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepLib_ShellError
") Error;
		BRepLib_ShellError Error();

		/****************** Init ******************/
		/**** md5 signature: ee785ff5defa7d18e86d0ad913d864fa ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates the shell from the surface and the min-max values.

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
		/****************** BRepLib_MakeSolid ******************/
		/**** md5 signature: 4a21e1a4b5fa5a59bf841cd097ade425 ****/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Solid covers whole space.

Returns
-------
None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid();

		/****************** BRepLib_MakeSolid ******************/
		/**** md5 signature: cfb38d2d7469f4b813037d06d55c44ca ****/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from a compsolid.

Parameters
----------
S: TopoDS_CompSolid

Returns
-------
None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_CompSolid & S);

		/****************** BRepLib_MakeSolid ******************/
		/**** md5 signature: 664e37b9a739671129f23ee949599dab ****/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from a shell.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S);

		/****************** BRepLib_MakeSolid ******************/
		/**** md5 signature: b341b5861b7a90a52fdd2f8cf6d43c6b ****/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from two shells.

Parameters
----------
S1: TopoDS_Shell
S2: TopoDS_Shell

Returns
-------
None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2);

		/****************** BRepLib_MakeSolid ******************/
		/**** md5 signature: e41b5e97a7160462f5cf846dd7ea74f4 ****/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from three shells.

Parameters
----------
S1: TopoDS_Shell
S2: TopoDS_Shell
S3: TopoDS_Shell

Returns
-------
None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2, const TopoDS_Shell & S3);

		/****************** BRepLib_MakeSolid ******************/
		/**** md5 signature: d194d2606b4ba8b1988d6dbd38da4766 ****/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from a solid. usefull for adding later.

Parameters
----------
So: TopoDS_Solid

Returns
-------
None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Solid & So);

		/****************** BRepLib_MakeSolid ******************/
		/**** md5 signature: 56608c108f73f7ee1451b5e3910c003e ****/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Add a shell to a solid.

Parameters
----------
So: TopoDS_Solid
S: TopoDS_Shell

Returns
-------
None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Solid & So, const TopoDS_Shell & S);

		/****************** Add ******************/
		/**** md5 signature: 755d393a8f453c7309ea9f34b76a9857 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the shell to the current solid.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") Add;
		void Add(const TopoDS_Shell & S);

		/****************** FaceStatus ******************/
		/**** md5 signature: dfb2223b5e4227b4e612837e5f690792 ****/
		%feature("compactdefaultargs") FaceStatus;
		%feature("autodoc", "Returns the status of the face after the shape creation.

Parameters
----------
F: TopoDS_Face

Returns
-------
BRepLib_ShapeModification
") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus(const TopoDS_Face & F);

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
		/****************** BRepLib_MakeVertex ******************/
		/**** md5 signature: 5af511bb8d68685e3175885cc6d40c2c ****/
		%feature("compactdefaultargs") BRepLib_MakeVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") BRepLib_MakeVertex;
		 BRepLib_MakeVertex(const gp_Pnt & P);

		/****************** Vertex ******************/
		/**** md5 signature: c8025d701d2a4994ffc4b119d7279582 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
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
		/****************** BRepLib_MakeWire ******************/
		/**** md5 signature: 5efb7d08579a4f93c331a3c336d25a18 ****/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Notdone makewire.

Returns
-------
None
") BRepLib_MakeWire;
		 BRepLib_MakeWire();

		/****************** BRepLib_MakeWire ******************/
		/**** md5 signature: 16f751950933f9d3ec660f17fe46c4b3 ****/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from an edge.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E);

		/****************** BRepLib_MakeWire ******************/
		/**** md5 signature: e6e448e9f05337273a6a95077e19042c ****/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from two edges.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Returns
-------
None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** BRepLib_MakeWire ******************/
		/**** md5 signature: a5e0c18c038618f90f69e6ba184360b9 ****/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from three edges.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
E3: TopoDS_Edge

Returns
-------
None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3);

		/****************** BRepLib_MakeWire ******************/
		/**** md5 signature: 10f231939f09dc1712a688b6ea19507a ****/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from four edges.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
E3: TopoDS_Edge
E4: TopoDS_Edge

Returns
-------
None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3, const TopoDS_Edge & E4);

		/****************** BRepLib_MakeWire ******************/
		/**** md5 signature: ac5c38632b4fb819b03eb4dc3b435233 ****/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from a wire. usefull for adding later.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Wire & W);

		/****************** BRepLib_MakeWire ******************/
		/**** md5 signature: ddacfdfbc909129eba28735466e6531c ****/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Add an edge to a wire.

Parameters
----------
W: TopoDS_Wire
E: TopoDS_Edge

Returns
-------
None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Wire & W, const TopoDS_Edge & E);

		/****************** Add ******************/
		/**** md5 signature: 2689ece383041802da1cd80a0167e44a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the edge <e> to the current wire.

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
		%feature("autodoc", "Add the edges of <l> to the current wire. the edges are not to be consecutive. but they are to be all connected geometrically or topologically.

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
		%feature("autodoc", "Returns the last edge added to the wire.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		/**** md5 signature: ae5b245502f5cc9eb925e95c017c85dd ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepLib_WireError
") Error;
		BRepLib_WireError Error();

		/****************** Vertex ******************/
		/**** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the last connecting vertex.

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

		/****************** Wire ******************/
		/**** md5 signature: 1a80266ab027407949727610f03160e2 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the new wire.

Returns
-------
TopoDS_Wire
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
