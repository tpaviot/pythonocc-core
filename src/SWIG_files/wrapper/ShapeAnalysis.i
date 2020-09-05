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
%define SHAPEANALYSISDOCSTRING
"ShapeAnalysis module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapeanalysis.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEANALYSISDOCSTRING) ShapeAnalysis


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
#include<ShapeAnalysis_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TopTools_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopLoc_module.hxx>
#include<TColStd_module.hxx>
#include<TopAbs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<IntRes2d_module.hxx>
#include<TColGeom_module.hxx>
#include<Message_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import ShapeExtend.i
%import TopTools.i
%import gp.i
%import Geom2d.i
%import Bnd.i
%import TColgp.i
%import Geom.i
%import Adaptor3d.i
%import TopLoc.i
%import TColStd.i
%import TopAbs.i
%import GeomAdaptor.i
%import IntRes2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(ShapeAnalysis_FreeBoundData)
%wrap_handle(ShapeAnalysis_Surface)
%wrap_handle(ShapeAnalysis_TransferParameters)
%wrap_handle(ShapeAnalysis_Wire)
%wrap_handle(ShapeAnalysis_TransferParametersProj)
%wrap_handle(ShapeAnalysis_HSequenceOfFreeBounds)
/* end handles declaration */

/* templates */
%template(ShapeAnalysis_BoxBndTree) NCollection_UBTree<Standard_Integer,Bnd_Box>;
%template(ShapeAnalysis_DataMapOfShapeListOfReal) NCollection_DataMap<TopoDS_Shape,TColStd_ListOfReal,TopTools_ShapeMapHasher>;
%template(ShapeAnalysis_SequenceOfFreeBounds) NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>;

%extend NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_UBTree<Standard_Integer, Bnd_Box> ShapeAnalysis_BoxBndTree;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfReal, TopTools_ShapeMapHasher>::Iterator ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfReal, TopTools_ShapeMapHasher> ShapeAnalysis_DataMapOfShapeListOfReal;
typedef NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>> ShapeAnalysis_SequenceOfFreeBounds;
/* end typedefs declaration */

/**********************
* class ShapeAnalysis *
**********************/
%rename(shapeanalysis) ShapeAnalysis;
class ShapeAnalysis {
	public:
		/****************** AdjustByPeriod ******************/
		/**** md5 signature: be1804eaaac865fa80ec1f574f0e78ff ****/
		%feature("compactdefaultargs") AdjustByPeriod;
		%feature("autodoc", "Returns a shift required to move point <val> to the range [toval-period/2,toval+period/2]. this shift will be the divisible by period. intended for adjusting parameters on periodic surfaces.

Parameters
----------
Val: float
ToVal: float
Period: float

Returns
-------
float
") AdjustByPeriod;
		static Standard_Real AdjustByPeriod(const Standard_Real Val, const Standard_Real ToVal, const Standard_Real Period);

		/****************** AdjustToPeriod ******************/
		/**** md5 signature: 232511229d47cce6737abd010c6492ba ****/
		%feature("compactdefaultargs") AdjustToPeriod;
		%feature("autodoc", "Returns a shift required to move point <val> to the range [valmin,valmax]. this shift will be the divisible by period with period = valmax - valmin. intended for adjusting parameters on periodic surfaces.

Parameters
----------
Val: float
ValMin: float
ValMax: float

Returns
-------
float
") AdjustToPeriod;
		static Standard_Real AdjustToPeriod(const Standard_Real Val, const Standard_Real ValMin, const Standard_Real ValMax);

		/****************** ContourArea ******************/
		/**** md5 signature: 4c9212a6c58b05d0930827ce004d7ec7 ****/
		%feature("compactdefaultargs") ContourArea;
		%feature("autodoc", "Returns a total area of 3d wire.

Parameters
----------
theWire: TopoDS_Wire

Returns
-------
float
") ContourArea;
		static Standard_Real ContourArea(const TopoDS_Wire & theWire);

		/****************** FindBounds ******************/
		/**** md5 signature: 5d164ba876b522b672fae6c0b8983a06 ****/
		%feature("compactdefaultargs") FindBounds;
		%feature("autodoc", "Finds the start and end vertices of the shape shape can be of the following type: vertex: v1 and v2 are the same and equal to <shape>, edge : v1 is start and v2 is end vertex (see shapeanalysis_edge methods firstvertex and lastvertex), wire : v1 is start vertex of the first edge, v2 is end vertex of the last edge (also see shapeanalysis_edge). if wire contains no edges v1 and v2 are nullified if none of the above v1 and v2 are nullified.

Parameters
----------
shape: TopoDS_Shape
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Returns
-------
None
") FindBounds;
		static void FindBounds(const TopoDS_Shape & shape, TopoDS_Vertex & V1, TopoDS_Vertex & V2);

		/****************** GetFaceUVBounds ******************/
		/**** md5 signature: 9503e389b6155ebde06f66b1966a448f ****/
		%feature("compactdefaultargs") GetFaceUVBounds;
		%feature("autodoc", "Computes exact uv bounds of all wires on the face.

Parameters
----------
F: TopoDS_Face

Returns
-------
Umin: float
Umax: float
Vmin: float
Vmax: float
") GetFaceUVBounds;
		static void GetFaceUVBounds(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsOuterBound ******************/
		/**** md5 signature: 97a2819fb02af6841f518636ffd8f746 ****/
		%feature("compactdefaultargs") IsOuterBound;
		%feature("autodoc", "Returns true if <f> has outer bound.

Parameters
----------
face: TopoDS_Face

Returns
-------
bool
") IsOuterBound;
		static Standard_Boolean IsOuterBound(const TopoDS_Face & face);

		/****************** OuterWire ******************/
		/**** md5 signature: 4cd1946e11004f8f3553337959c92b15 ****/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "Returns the outer wire on the face <face>. this is replacement of the method breptools::outerwire until it works badly. returns the first wire oriented as outer according to fclass2d_classifier. if none, last wire is returned.

Parameters
----------
face: TopoDS_Face

Returns
-------
TopoDS_Wire
") OuterWire;
		static TopoDS_Wire OuterWire(const TopoDS_Face & face);

		/****************** TotCross2D ******************/
		/**** md5 signature: d02b539165ef061eca69acd36cb763dd ****/
		%feature("compactdefaultargs") TotCross2D;
		%feature("autodoc", "Returns a total area of 2d wire.

Parameters
----------
sewd: ShapeExtend_WireData
aFace: TopoDS_Face

Returns
-------
float
") TotCross2D;
		static Standard_Real TotCross2D(const opencascade::handle<ShapeExtend_WireData> & sewd, const TopoDS_Face & aFace);

};


%extend ShapeAnalysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeAnalysis_CheckSmallFace *
*************************************/
class ShapeAnalysis_CheckSmallFace {
	public:
		/****************** ShapeAnalysis_CheckSmallFace ******************/
		/**** md5 signature: 682c1315e887393b2bb9d3f1f6aa911f ****/
		%feature("compactdefaultargs") ShapeAnalysis_CheckSmallFace;
		%feature("autodoc", "Creates an empty tool checks a shape i.e. each of its faces, records checks as diagnostics in the <infos> //! if <infos> has not been set before, no check is done //! for faces which are in a shell, topological data are recorded to allow recovering connectivities after fixing or removing the small faces or parts of faces enchains various checks on a face inshell : to compute more informations, relevant to topology.

Returns
-------
None
") ShapeAnalysis_CheckSmallFace;
		 ShapeAnalysis_CheckSmallFace();

		/****************** CheckPin ******************/
		/**** md5 signature: ec914c3ed292a266d322789b08190a90 ****/
		%feature("compactdefaultargs") CheckPin;
		%feature("autodoc", "Checks if a face has a pin, which can be edited no singularity : no pin, returns 0 if there is a pin, checked topics, with returned value : - 0 : nothing to do more - 1 : 'smooth', i.e. not a really sharp pin -> diagnostic 'smoothpin' - 2 : stretched pin, i.e. is possible to relimit the face by another vertex, so that this vertex still gives a pin -> diagnostic 'stretchedpin' with location of vertex (pnt).

Parameters
----------
F: TopoDS_Face

Returns
-------
whatrow: int
sence: int
") CheckPin;
		Standard_Boolean CheckPin(const TopoDS_Face & F, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** CheckPinEdges ******************/
		/**** md5 signature: 9d8afc6cc952c4c1da332e8e3bc992ed ****/
		%feature("compactdefaultargs") CheckPinEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge
coef1: float
coef2: float
toler: float

Returns
-------
bool
") CheckPinEdges;
		Standard_Boolean CheckPinEdges(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, const Standard_Real coef1, const Standard_Real coef2, const Standard_Real toler);

		/****************** CheckPinFace ******************/
		/**** md5 signature: 135637d57e18b98615c1a47af6cd6df6 ****/
		%feature("compactdefaultargs") CheckPinFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
mapEdges: TopTools_DataMapOfShapeShape
toler: float,optional
	default value is -1.0

Returns
-------
bool
") CheckPinFace;
		Standard_Boolean CheckPinFace(const TopoDS_Face & F, TopTools_DataMapOfShapeShape & mapEdges, const Standard_Real toler = -1.0);

		/****************** CheckSingleStrip ******************/
		/**** md5 signature: aebb017176453136c30b9fcf29cd2793 ****/
		%feature("compactdefaultargs") CheckSingleStrip;
		%feature("autodoc", "Checks if a face is a single strip, i.e. brings two great edges which are confused on their whole length, possible other edges are small or null length //! returns 0 if not a strip support, 1 strip in u, 2 strip in v records diagnostic in info if it is a single strip.

Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float,optional
	default value is -1.0

Returns
-------
bool
") CheckSingleStrip;
		Standard_Boolean CheckSingleStrip(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Real tol = -1.0);

		/****************** CheckSplittingVertices ******************/
		/**** md5 signature: 0fcbdf30e6784d94388046ae44d18275 ****/
		%feature("compactdefaultargs") CheckSplittingVertices;
		%feature("autodoc", "Checks if a face brings vertices which split it, either confused with non adjacent vertices, or confused with their projection on non adjacent edges returns the count of found splitting vertices each vertex then brings a diagnostic 'splittingvertex', with data : 'face' for the face, 'edge' for the split edge.

Parameters
----------
F: TopoDS_Face
MapEdges: TopTools_DataMapOfShapeListOfShape
MapParam: ShapeAnalysis_DataMapOfShapeListOfReal
theAllVert: TopoDS_Compound

Returns
-------
int
") CheckSplittingVertices;
		Standard_Integer CheckSplittingVertices(const TopoDS_Face & F, TopTools_DataMapOfShapeListOfShape & MapEdges, ShapeAnalysis_DataMapOfShapeListOfReal & MapParam, TopoDS_Compound & theAllVert);

		/****************** CheckSpotFace ******************/
		/**** md5 signature: 9f5f36ac1f166da259f547599106aeed ****/
		%feature("compactdefaultargs") CheckSpotFace;
		%feature("autodoc", "Acts as isspotface, but records in <infos> a diagnostic 'spotface' with the pnt as value (data 'location').

Parameters
----------
F: TopoDS_Face
tol: float,optional
	default value is -1.0

Returns
-------
bool
") CheckSpotFace;
		Standard_Boolean CheckSpotFace(const TopoDS_Face & F, const Standard_Real tol = -1.0);

		/****************** CheckStripEdges ******************/
		/**** md5 signature: 42ba06453bc54a008a2fceabf501b5fa ****/
		%feature("compactdefaultargs") CheckStripEdges;
		%feature("autodoc", "Checks if two edges define a strip, i.e. distance maxi below tolerance, given or some of those of e1 and e2.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float

Returns
-------
dmax: float
") CheckStripEdges;
		Standard_Boolean CheckStripEdges(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real tol, Standard_Real &OutValue);

		/****************** CheckStripFace ******************/
		/**** md5 signature: bb1c74772a52f3068a401268987912f6 ****/
		%feature("compactdefaultargs") CheckStripFace;
		%feature("autodoc", "Checks if a face is as a strip returns 0 if not or non determined, 1 if in u, 2 if in v by default, considers the tolerance zone of its edges a given value <tol> may be given to check a strip of max this width //! if a face is determined as a strip, it is delinited by two lists of edges. these lists are recorded in diagnostic diagnostic 'stripface' brings data 'direction' (u or v), 'list1' , 'list2' (if they could be computed).

Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float,optional
	default value is -1.0

Returns
-------
bool
") CheckStripFace;
		Standard_Boolean CheckStripFace(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Real tol = -1.0);

		/****************** CheckTwisted ******************/
		/**** md5 signature: 9d566bb09d1596d6f36a8c1556c983db ****/
		%feature("compactdefaultargs") CheckTwisted;
		%feature("autodoc", "Checks if a face is twisted (apart from checking pin, i.e. it does not give information on pin, only 'it is twisted').

Parameters
----------
F: TopoDS_Face

Returns
-------
paramu: float
paramv: float
") CheckTwisted;
		Standard_Boolean CheckTwisted(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FindStripEdges ******************/
		/**** md5 signature: 488fc04364bde628e00f8bf16852f40f ****/
		%feature("compactdefaultargs") FindStripEdges;
		%feature("autodoc", "Searchs for two and only two edges up tolerance returns true if ok, false if not 2 edges if true, returns the two edges and their maximum distance.

Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float

Returns
-------
dmax: float
") FindStripEdges;
		Standard_Boolean FindStripEdges(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Real tol, Standard_Real &OutValue);

		/****************** IsSpotFace ******************/
		/**** md5 signature: 8c34df07c1fdc08c125976674dda3d88 ****/
		%feature("compactdefaultargs") IsSpotFace;
		%feature("autodoc", "Checks if a face is as a spot returns 0 if not, 1 if yes, 2 if yes and all vertices are the same by default, considers the tolerance zone of its vertices a given value <tol> may be given to check a spot of this size if a face is a spot, its location is returned in <spot>, and <spotol> returns an equivalent tolerance, which is computed as half of max dimension of min-max box of the face.

Parameters
----------
F: TopoDS_Face
spot: gp_Pnt
tol: float,optional
	default value is -1.0

Returns
-------
spotol: float
") IsSpotFace;
		Standard_Integer IsSpotFace(const TopoDS_Face & F, gp_Pnt & spot, Standard_Real &OutValue, const Standard_Real tol = -1.0);

		/****************** IsStripSupport ******************/
		/**** md5 signature: b15b26fb47eda2274229ed81f7963b1a ****/
		%feature("compactdefaultargs") IsStripSupport;
		%feature("autodoc", "Checks if a face lies on a surface which is a strip so the face is a strip. but a face may be a strip elsewhere .. //! a given value <tol> may be given to check max width by default, considers the tolerance zone of its edges returns 0 if not a strip support, 1 strip in u, 2 strip in v.

Parameters
----------
F: TopoDS_Face
tol: float,optional
	default value is -1.0

Returns
-------
bool
") IsStripSupport;
		Standard_Boolean IsStripSupport(const TopoDS_Face & F, const Standard_Real tol = -1.0);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets a fixed tolerance to check small face by default, local tolerance zone is considered sets a fixed maxtolerance to check small face sets a fixed tolerance to check small face by default, local tolerance zone is considered unset fixed tolerance, comes back to local tolerance zones unset fixed tolerance, comes back to local tolerance zones.

Parameters
----------
tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real tol);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of last call to perform() shapeextend_ok : face was ok, nothing done shapeextend_done1: some wires are fixed shapeextend_done2: orientation of wires fixed shapeextend_done3: missing seam added shapeextend_done4: small area wire removed shapeextend_done5: natural bounds added shapeextend_fail1: some fails during fixing wires shapeextend_fail2: cannot fix orientation of wires shapeextend_fail3: cannot add missing seam shapeextend_fail4: cannot remove small area wire.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

		/****************** StatusPin ******************/
		/**** md5 signature: 45b836979dc59d2b7b6c234582b1b72f ****/
		%feature("compactdefaultargs") StatusPin;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusPin;
		Standard_Boolean StatusPin(const ShapeExtend_Status status);

		/****************** StatusPinEdges ******************/
		/**** md5 signature: 723d6f964223beb649a25c0f85ed663a ****/
		%feature("compactdefaultargs") StatusPinEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusPinEdges;
		Standard_Boolean StatusPinEdges(const ShapeExtend_Status status);

		/****************** StatusPinFace ******************/
		/**** md5 signature: 59e4599274ed14a030688190ace532f5 ****/
		%feature("compactdefaultargs") StatusPinFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusPinFace;
		Standard_Boolean StatusPinFace(const ShapeExtend_Status status);

		/****************** StatusSplitVert ******************/
		/**** md5 signature: 0adcd483785ac3ebc36cc37402218893 ****/
		%feature("compactdefaultargs") StatusSplitVert;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusSplitVert;
		Standard_Boolean StatusSplitVert(const ShapeExtend_Status status);

		/****************** StatusSpot ******************/
		/**** md5 signature: 9a0a63ed0084d833e10cc12c34d3539e ****/
		%feature("compactdefaultargs") StatusSpot;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusSpot;
		Standard_Boolean StatusSpot(const ShapeExtend_Status status);

		/****************** StatusStrip ******************/
		/**** md5 signature: 9368cd6c24b8903ef7a265abae338ec3 ****/
		%feature("compactdefaultargs") StatusStrip;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusStrip;
		Standard_Boolean StatusStrip(const ShapeExtend_Status status);

		/****************** StatusTwisted ******************/
		/**** md5 signature: 79ba4e0de264d0a5e360f383f04ae6ec ****/
		%feature("compactdefaultargs") StatusTwisted;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusTwisted;
		Standard_Boolean StatusTwisted(const ShapeExtend_Status status);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance to check small faces, negative value if local tolerances zones are to be considered.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

};


%extend ShapeAnalysis_CheckSmallFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeAnalysis_Curve *
****************************/
class ShapeAnalysis_Curve {
	public:
		/****************** FillBndBox ******************/
		/**** md5 signature: f89b9c3c2b8dd0039e709244626bb65e ****/
		%feature("compactdefaultargs") FillBndBox;
		%feature("autodoc", "Computes a boundary box on segment of curve c2d from first to last. this is done by taking npoints points from the curve and, if exact is true, by searching for exact extrema. all these points are added to box.

Parameters
----------
C2d: Geom2d_Curve
First: float
Last: float
NPoints: int
Exact: bool
Box: Bnd_Box2d

Returns
-------
None
") FillBndBox;
		void FillBndBox(const opencascade::handle<Geom2d_Curve> & C2d, const Standard_Real First, const Standard_Real Last, const Standard_Integer NPoints, const Standard_Boolean Exact, Bnd_Box2d & Box);

		/****************** GetSamplePoints ******************/
		/**** md5 signature: 35ed63bcd8b3dcf25b492ce90c8d7391 ****/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "Returns sample points which will serve as linearisation of the2d curve in range (first, last) the distribution of sample points is consystent with what is used by breptopadaptor_fclass2d.

Parameters
----------
curve: Geom2d_Curve
first: float
last: float
seq: TColgp_SequenceOfPnt2d

Returns
-------
bool
") GetSamplePoints;
		static Standard_Boolean GetSamplePoints(const opencascade::handle<Geom2d_Curve> & curve, const Standard_Real first, const Standard_Real last, TColgp_SequenceOfPnt2d & seq);

		/****************** GetSamplePoints ******************/
		/**** md5 signature: 27536dca3bf5cbe57386f53deec75fa4 ****/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "Returns sample points which will serve as linearisation of the curve in range (first, last).

Parameters
----------
curve: Geom_Curve
first: float
last: float
seq: TColgp_SequenceOfPnt

Returns
-------
bool
") GetSamplePoints;
		static Standard_Boolean GetSamplePoints(const opencascade::handle<Geom_Curve> & curve, const Standard_Real first, const Standard_Real last, TColgp_SequenceOfPnt & seq);

		/****************** IsClosed ******************/
		/**** md5 signature: ffd30074e57d137811ed8c73f85b663f ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Tells if the curve is closed with given precision. if <preci> < 0 then precision::confusion is used.

Parameters
----------
curve: Geom_Curve
preci: float,optional
	default value is -1

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Geom_Curve> & curve, const Standard_Real preci = -1);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 77bfaeae3bd1dc05e7cd84ea4c4fbc6a ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "This method was implemented as fix for changes in trimmed curve behaviour. for the moment trimmed curve returns false anyway. so it is necessary to adapt all data exchange tools for this behaviour. current implementation takes into account that curve may be offset.

Parameters
----------
curve: Geom_Curve

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Geom_Curve> & curve);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 74012048a4f42b6a8953853367de2d1e ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "The same as for curve3d.

Parameters
----------
curve: Geom2d_Curve

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Geom2d_Curve> & curve);

		/****************** IsPlanar ******************/
		/**** md5 signature: 8d42e9d9d775ff62270b1ea21363217d ****/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Checks if points are planar with given preci. if normal has not zero modulus, checks with given normal.

Parameters
----------
pnts: TColgp_Array1OfPnt
Normal: gp_XYZ
preci: float,optional
	default value is 0

Returns
-------
bool
") IsPlanar;
		static Standard_Boolean IsPlanar(const TColgp_Array1OfPnt & pnts, gp_XYZ & Normal, const Standard_Real preci = 0);

		/****************** IsPlanar ******************/
		/**** md5 signature: 51381d62b31dcf78c955461d276c0d26 ****/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Checks if curve is planar with given preci. if normal has not zero modulus, checks with given normal.

Parameters
----------
curve: Geom_Curve
Normal: gp_XYZ
preci: float,optional
	default value is 0

Returns
-------
bool
") IsPlanar;
		static Standard_Boolean IsPlanar(const opencascade::handle<Geom_Curve> & curve, gp_XYZ & Normal, const Standard_Real preci = 0);

		/****************** NextProject ******************/
		/**** md5 signature: 574e0b66ca9898b75d27ec40fcac4b72 ****/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "Projects a point on a curve using newton method. <paramprev> is taken as the first approximation of solution. if newton algorithm fails the method project() is used. if adjusttoends is true, point will be adjusted to the end of the curve if distance is less than <preci>.

Parameters
----------
paramPrev: float
C3D: Geom_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
cf: float
cl: float
AdjustToEnds: bool,optional
	default value is Standard_True

Returns
-------
param: float
") NextProject;
		Standard_Real NextProject(const Standard_Real paramPrev, const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Real cf, const Standard_Real cl, const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** NextProject ******************/
		/**** md5 signature: 43e8de3fcfb3bb035f141dbbfaaec453 ****/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "Projects a point on a curve using newton method. <paramprev> is taken as the first approximation of solution. if newton algorithm fails the method project() is used.

Parameters
----------
paramPrev: float
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt

Returns
-------
param: float
") NextProject;
		Standard_Real NextProject(const Standard_Real paramPrev, const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue);

		/****************** Project ******************/
		/**** md5 signature: 186437c4729079938ebb98c0875bb8a7 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects a point on a curve. computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). the number of iterations is limited. if adjusttoends is true, point will be adjusted to the end of the curve if distance is less than <preci> //! returned value is the distance between the given point and computed one.

Parameters
----------
C3D: Geom_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
AdjustToEnds: bool,optional
	default value is Standard_True

Returns
-------
param: float
") Project;
		Standard_Real Project(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** Project ******************/
		/**** md5 signature: 0beba894dd1fd86f65e71a22d532cef4 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects a point on a curve. computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). the number of iterations is limited. //! returned value is the distance between the given point and computed one.

Parameters
----------
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
AdjustToEnds: bool,optional
	default value is Standard_True

Returns
-------
param: float
") Project;
		Standard_Real Project(const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** Project ******************/
		/**** md5 signature: 3d1aeb0cc5527c48ff4e25cf4bee7958 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects a point on a curve, but parameters are limited between <cf> and <cl>. the range [cf, cl] is extended with help of adaptor3d on the basis of 3d precision <preci>. if adjusttoends is true, point will be adjusted to the end of the curve if distance is less than <preci>.

Parameters
----------
C3D: Geom_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
cf: float
cl: float
AdjustToEnds: bool,optional
	default value is Standard_True

Returns
-------
param: float
") Project;
		Standard_Real Project(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Real cf, const Standard_Real cl, const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** ProjectAct ******************/
		/**** md5 signature: f2146af7b32beba8e530690f1149ab19 ****/
		%feature("compactdefaultargs") ProjectAct;
		%feature("autodoc", "No available documentation.

Parameters
----------
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt

Returns
-------
param: float
") ProjectAct;
		Standard_Real ProjectAct(const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue);

		/****************** SelectForwardSeam ******************/
		/**** md5 signature: 5e6ac6f0ed4d3dd993a587de809382d5 ****/
		%feature("compactdefaultargs") SelectForwardSeam;
		%feature("autodoc", "Defines which pcurve (c1 or c2) should be chosen for forward seam edge.

Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve

Returns
-------
int
") SelectForwardSeam;
		Standard_Integer SelectForwardSeam(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2);

		/****************** ValidateRange ******************/
		/**** md5 signature: fb7b86b0323f61587893e47a01c31271 ****/
		%feature("compactdefaultargs") ValidateRange;
		%feature("autodoc", "Validate parameters first and last for the given curve in order to make them valid for creation of edge. this includes: - limiting range [first,last] by range of curve - adjusting range [first,last] for periodic (or closed) curve if last < first returns true if parameters are ok or are successfully corrected, or false if parameters cannot be corrected. in the latter case, parameters are reset to range of curve.

Parameters
----------
Crv: Geom_Curve
prec: float

Returns
-------
First: float
Last: float
") ValidateRange;
		Standard_Boolean ValidateRange(const opencascade::handle<Geom_Curve> & Crv, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real prec);

};


%extend ShapeAnalysis_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeAnalysis_Edge *
***************************/
class ShapeAnalysis_Edge {
	public:
		/****************** ShapeAnalysis_Edge ******************/
		/**** md5 signature: c99946c01f04aee5eb380ccca26bc3af ****/
		%feature("compactdefaultargs") ShapeAnalysis_Edge;
		%feature("autodoc", "Empty constructor; initialises status to ok.

Returns
-------
None
") ShapeAnalysis_Edge;
		 ShapeAnalysis_Edge();

		/****************** BoundUV ******************/
		/**** md5 signature: e5e22bda7ac9cae9eec606988778f69f ****/
		%feature("compactdefaultargs") BoundUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
first: gp_Pnt2d
last: gp_Pnt2d

Returns
-------
bool
") BoundUV;
		Standard_Boolean BoundUV(const TopoDS_Edge & edge, const TopoDS_Face & face, gp_Pnt2d & first, gp_Pnt2d & last);

		/****************** BoundUV ******************/
		/**** md5 signature: adf12ad3021cfe06ac86d8a18e1a6831 ****/
		%feature("compactdefaultargs") BoundUV;
		%feature("autodoc", "Returns the ends of pcurve calls method pcurve with <orient> equal to true.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
first: gp_Pnt2d
last: gp_Pnt2d

Returns
-------
bool
") BoundUV;
		Standard_Boolean BoundUV(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, gp_Pnt2d & first, gp_Pnt2d & last);

		/****************** CheckCurve3dWithPCurve ******************/
		/**** md5 signature: 75d50ab437af2b4443581722613dc01a ****/
		%feature("compactdefaultargs") CheckCurve3dWithPCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
bool
") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****************** CheckCurve3dWithPCurve ******************/
		/**** md5 signature: 27026b5c86a00e977fe1bd7242941752 ****/
		%feature("compactdefaultargs") CheckCurve3dWithPCurve;
		%feature("autodoc", "Checks mutual orientation of 3d curve and pcurve on the analysis of curves bounding points.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Returns
-------
bool
") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****************** CheckOverlapping ******************/
		/**** md5 signature: 8ce837196cc14fae3f308905714a9765 ****/
		%feature("compactdefaultargs") CheckOverlapping;
		%feature("autodoc", "Checks the first edge is overlapped with second edge. if distance between two edges is less then thetoloverlap edges is overlapped. thedomaindis - length of part of edges on wich edges is overlapped.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
theDomainDist: float,optional
	default value is 0.0

Returns
-------
theTolOverlap: float
") CheckOverlapping;
		Standard_Boolean CheckOverlapping(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, Standard_Real &OutValue, const Standard_Real theDomainDist = 0.0);

		/****************** CheckPCurveRange ******************/
		/**** md5 signature: 1c915eee568b23ca90e4d13b9e928749 ****/
		%feature("compactdefaultargs") CheckPCurveRange;
		%feature("autodoc", "Checks possibility for pcurve thepc to have range [thefirst, thelast] (edge range) having respect to real first, last parameters of thepc .

Parameters
----------
theFirst: float
theLast: float
thePC: Geom2d_Curve

Returns
-------
bool
") CheckPCurveRange;
		Standard_Boolean CheckPCurveRange(const Standard_Real theFirst, const Standard_Real theLast, const opencascade::handle<Geom2d_Curve> & thePC);

		/****************** CheckSameParameter ******************/
		/**** md5 signature: 2ae6dcdc8bd749faeacf199fa53d23aa ****/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "Checks the edge to be sameparameter. calculates the maximal deviation between 3d curve and each pcurve of the edge on <nbcontrol> equidistant points (the same algorithm as in brepcheck; default value is 23 as in brepcheck). this deviation is returned in <maxdev> parameter. if deviation is greater than tolerance of the edge (i.e. incorrect flag) returns false, else returns true.

Parameters
----------
edge: TopoDS_Edge
NbControl: int,optional
	default value is 23

Returns
-------
maxdev: float
") CheckSameParameter;
		Standard_Boolean CheckSameParameter(const TopoDS_Edge & edge, Standard_Real &OutValue, const Standard_Integer NbControl = 23);

		/****************** CheckSameParameter ******************/
		/**** md5 signature: ea9136dabd409c2bd866cf4e9355e8a5 ****/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "Checks the edge to be sameparameter. calculates the maximal deviation between 3d curve and each pcurve of the edge on <nbcontrol> equidistant points (the same algorithm as in brepcheck; default value is 23 as in brepcheck). this deviation is returned in <maxdev> parameter. if deviation is greater than tolerance of the edge (i.e. incorrect flag) returns false, else returns true.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theNbControl: int,optional
	default value is 23

Returns
-------
theMaxdev: float
") CheckSameParameter;
		Standard_Boolean CheckSameParameter(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, Standard_Real &OutValue, const Standard_Integer theNbControl = 23);

		/****************** CheckVertexTolerance ******************/
		/**** md5 signature: 661b5f3482d8c846735ebcb84acb3420 ****/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
toler1: float
toler2: float
") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance(const TopoDS_Edge & edge, const TopoDS_Face & face, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CheckVertexTolerance ******************/
		/**** md5 signature: 809a2185e68e2c2577b90ce440e968a1 ****/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", "Checks if it is necessary to increase tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) toler1 returns necessary tolerance for first vertex, toler2 returns necessary tolerance for last vertex.

Parameters
----------
edge: TopoDS_Edge

Returns
-------
toler1: float
toler2: float
") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance(const TopoDS_Edge & edge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CheckVerticesWithCurve3d ******************/
		/**** md5 signature: ef9c76a46a86528df9f9bc0c626bb285 ****/
		%feature("compactdefaultargs") CheckVerticesWithCurve3d;
		%feature("autodoc", "Checks the start and/or end vertex of the edge for matching with 3d curve with the given precision. <vtx> = 1 : start vertex only <vtx> = 2 : end vertex only <vtx> = 0 : both (default) if preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.

Parameters
----------
edge: TopoDS_Edge
preci: float,optional
	default value is -1
vtx: int,optional
	default value is 0

Returns
-------
bool
") CheckVerticesWithCurve3d;
		Standard_Boolean CheckVerticesWithCurve3d(const TopoDS_Edge & edge, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

		/****************** CheckVerticesWithPCurve ******************/
		/**** md5 signature: 073672091cfedac6c0b89f7faf486702 ****/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
preci: float,optional
	default value is -1
vtx: int,optional
	default value is 0

Returns
-------
bool
") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

		/****************** CheckVerticesWithPCurve ******************/
		/**** md5 signature: 6dcb667f22bcd8c805c80d0f2322ed47 ****/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", "Checks the start and/or end vertex of the edge for matching with pcurve with the given precision. <vtx> = 1 : start vertex <vtx> = 2 : end vertex <vtx> = 0 : both if preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
preci: float,optional
	default value is -1
vtx: int,optional
	default value is 0

Returns
-------
bool
") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

		/****************** ComputeDeviation ******************/
		/**** md5 signature: 5b28f41a99747c3f5e998147e40c2e30 ****/
		%feature("compactdefaultargs") ComputeDeviation;
		%feature("autodoc", "Computes the maximal deviation between the two curve representations. dev is an input/output parameter and contains the computed deviation (should be initialized with 0. for the first call). used by checksameparameter().

Parameters
----------
CRef: Adaptor3d_Curve
Other: Adaptor3d_Curve
SameParameter: bool
NCONTROL: int

Returns
-------
dev: float
") ComputeDeviation;
		static Standard_Boolean ComputeDeviation(const Adaptor3d_Curve & CRef, const Adaptor3d_Curve & Other, const Standard_Boolean SameParameter, Standard_Real &OutValue, const Standard_Integer NCONTROL);

		/****************** Curve3d ******************/
		/**** md5 signature: a62c7816a4324c1eb17a7617f6fa678f ****/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Returns the 3d curve and bounding parameteres for the edge returns false if no 3d curve. if <orient> is true (default), takes orientation into account: if the edge is reversed, cf and cl are toggled.

Parameters
----------
edge: TopoDS_Edge
C3d: Geom_Curve
orient: bool,optional
	default value is Standard_True

Returns
-------
cf: float
cl: float
") Curve3d;
		Standard_Boolean Curve3d(const TopoDS_Edge & edge, opencascade::handle<Geom_Curve> & C3d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean orient = Standard_True);

		/****************** FirstVertex ******************/
		/**** md5 signature: c76f9f550e6853d1bca033d063cd7695 ****/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns start vertex of the edge (taking edge orientation into account).

Parameters
----------
edge: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex(const TopoDS_Edge & edge);

		/****************** GetEndTangent2d ******************/
		/**** md5 signature: bc383e612c5da27eed0047cfdefac844 ****/
		%feature("compactdefaultargs") GetEndTangent2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
atEnd: bool
pos: gp_Pnt2d
tang: gp_Vec2d
dparam: float,optional
	default value is 0.0

Returns
-------
bool
") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d(const TopoDS_Edge & edge, const TopoDS_Face & face, const Standard_Boolean atEnd, gp_Pnt2d & pos, gp_Vec2d & tang, const Standard_Real dparam = 0.0);

		/****************** GetEndTangent2d ******************/
		/**** md5 signature: c54ab8ad8f5a550116a71bb84550b206 ****/
		%feature("compactdefaultargs") GetEndTangent2d;
		%feature("autodoc", "Returns tangent of the edge pcurve at its start (if atend is false) or end (if true), regarding the orientation of edge. if edge is reversed, tangent is reversed before return. returns true if pcurve is available and tangent is computed and is not null, else false.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
atEnd: bool
pos: gp_Pnt2d
tang: gp_Vec2d
dparam: float,optional
	default value is 0.0

Returns
-------
bool
") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const Standard_Boolean atEnd, gp_Pnt2d & pos, gp_Vec2d & tang, const Standard_Real dparam = 0.0);

		/****************** HasCurve3d ******************/
		/**** md5 signature: d78b94609050f6e09a2bfa1b5ea3a34e ****/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "Tells if the edge has a 3d curve.

Parameters
----------
edge: TopoDS_Edge

Returns
-------
bool
") HasCurve3d;
		Standard_Boolean HasCurve3d(const TopoDS_Edge & edge);

		/****************** HasPCurve ******************/
		/**** md5 signature: f605c533d49084a841df7413f97d5c66 ****/
		%feature("compactdefaultargs") HasPCurve;
		%feature("autodoc", "Tells if the edge has a pcurve on the face.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
bool
") HasPCurve;
		Standard_Boolean HasPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****************** HasPCurve ******************/
		/**** md5 signature: 2b47f8283d127329517d4019a6fd4de6 ****/
		%feature("compactdefaultargs") HasPCurve;
		%feature("autodoc", "Tells if the edge has a pcurve on the surface (with location).

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Returns
-------
bool
") HasPCurve;
		Standard_Boolean HasPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****************** IsClosed3d ******************/
		/**** md5 signature: 61d8e2f9ed5200ce2ecef6abfdcc8389 ****/
		%feature("compactdefaultargs") IsClosed3d;
		%feature("autodoc", "Gives true if the edge has a 3d curve, this curve is closed, and the edge has the same vertex at start and end.

Parameters
----------
edge: TopoDS_Edge

Returns
-------
bool
") IsClosed3d;
		Standard_Boolean IsClosed3d(const TopoDS_Edge & edge);

		/****************** IsSeam ******************/
		/**** md5 signature: 0fc8e916c998f86260978e3135d9950c ****/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
bool
") IsSeam;
		Standard_Boolean IsSeam(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****************** IsSeam ******************/
		/**** md5 signature: 2d9e2b62d151785ef467c6500e14f00c ****/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "Returns true if the edge has two pcurves on one surface.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Returns
-------
bool
") IsSeam;
		Standard_Boolean IsSeam(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****************** LastVertex ******************/
		/**** md5 signature: f5a64f47da5ff503b5b692bcee807785 ****/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns end vertex of the edge (taking edge orientation into account).

Parameters
----------
edge: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex(const TopoDS_Edge & edge);

		/****************** PCurve ******************/
		/**** md5 signature: 8fb620ff338d11fa9b54fa8e15c7fe67 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
C2d: Geom2d_Curve
orient: bool,optional
	default value is Standard_True

Returns
-------
cf: float
cl: float
") PCurve;
		Standard_Boolean PCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, opencascade::handle<Geom2d_Curve> & C2d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean orient = Standard_True);

		/****************** PCurve ******************/
		/**** md5 signature: 6f3235c72f09fd5bbf5e17072f2b330b ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Returns the pcurve and bounding parameteres for the edge lying on the surface. returns false if the edge has no pcurve on this surface. if <orient> is true (default), takes orientation into account: if the edge is reversed, cf and cl are toggled.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
C2d: Geom2d_Curve
orient: bool,optional
	default value is Standard_True

Returns
-------
cf: float
cl: float
") PCurve;
		Standard_Boolean PCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, opencascade::handle<Geom2d_Curve> & C2d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean orient = Standard_True);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status (in the form of true/false) of last check.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%extend ShapeAnalysis_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ShapeAnalysis_FreeBoundData *
************************************/
class ShapeAnalysis_FreeBoundData : public Standard_Transient {
	public:
		/****************** ShapeAnalysis_FreeBoundData ******************/
		/**** md5 signature: 673f7c237d3c08e9bc5d7e90947aabeb ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundData;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData();

		/****************** ShapeAnalysis_FreeBoundData ******************/
		/**** md5 signature: 5c230c41d6e0726fe9ccfc7ed409f380 ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundData;
		%feature("autodoc", "Creates object with contour given in the form of topods_wire.

Parameters
----------
freebound: TopoDS_Wire

Returns
-------
None
") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData(const TopoDS_Wire & freebound);

		/****************** AddNotch ******************/
		/**** md5 signature: 296cc4725ce03a2bad8cbeccc177d04d ****/
		%feature("compactdefaultargs") AddNotch;
		%feature("autodoc", "Adds notch on the contour with its maximum width.

Parameters
----------
notch: TopoDS_Wire
width: float

Returns
-------
None
") AddNotch;
		void AddNotch(const TopoDS_Wire & notch, const Standard_Real width);

		/****************** Area ******************/
		/**** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Returns area of the contour.

Returns
-------
float
") Area;
		Standard_Real Area();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all properties of the contour. contour bound itself is not cleared.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FreeBound ******************/
		/**** md5 signature: 8bc13ac492a4bb5f0e5014bae56b0d19 ****/
		%feature("compactdefaultargs") FreeBound;
		%feature("autodoc", "Returns contour.

Returns
-------
TopoDS_Wire
") FreeBound;
		TopoDS_Wire FreeBound();

		/****************** NbNotches ******************/
		/**** md5 signature: 3d1684d1cd9b93f5c29f2bd6573355fd ****/
		%feature("compactdefaultargs") NbNotches;
		%feature("autodoc", "Returns number of notches on the contour.

Returns
-------
int
") NbNotches;
		Standard_Integer NbNotches();

		/****************** Notch ******************/
		/**** md5 signature: 8e9156bec4aa1837516ae821060b1117 ****/
		%feature("compactdefaultargs") Notch;
		%feature("autodoc", "Returns notch on the contour.

Parameters
----------
index: int

Returns
-------
TopoDS_Wire
") Notch;
		TopoDS_Wire Notch(const Standard_Integer index);

		/****************** NotchWidth ******************/
		/**** md5 signature: 61d945a5d7959176a609a43b1fa9f5dc ****/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "Returns maximum width of notch specified by its rank number on the contour.

Parameters
----------
index: int

Returns
-------
float
") NotchWidth;
		Standard_Real NotchWidth(const Standard_Integer index);

		/****************** NotchWidth ******************/
		/**** md5 signature: b55832f9bd5a1d184c7dabacbc932f36 ****/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "Returns maximum width of notch specified as topods_wire on the contour.

Parameters
----------
notch: TopoDS_Wire

Returns
-------
float
") NotchWidth;
		Standard_Real NotchWidth(const TopoDS_Wire & notch);

		/****************** Notches ******************/
		/**** md5 signature: ddeba163c0380866b24b518f9f1db364 ****/
		%feature("compactdefaultargs") Notches;
		%feature("autodoc", "Returns sequence of notches on the contour.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Notches;
		opencascade::handle<TopTools_HSequenceOfShape> Notches();

		/****************** Perimeter ******************/
		/**** md5 signature: c2755d4db216dfa69dda7f57131c1224 ****/
		%feature("compactdefaultargs") Perimeter;
		%feature("autodoc", "Returns perimeter of the contour.

Returns
-------
float
") Perimeter;
		Standard_Real Perimeter();

		/****************** Ratio ******************/
		/**** md5 signature: f6ad8c294bcbb055f97a9d19ae1aa2a2 ****/
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "Returns ratio of average length to average width of the contour.

Returns
-------
float
") Ratio;
		Standard_Real Ratio();

		/****************** SetArea ******************/
		/**** md5 signature: ca196224c16686242be84aef415b6e2c ****/
		%feature("compactdefaultargs") SetArea;
		%feature("autodoc", "Sets area of the contour.

Parameters
----------
area: float

Returns
-------
None
") SetArea;
		void SetArea(const Standard_Real area);

		/****************** SetFreeBound ******************/
		/**** md5 signature: 4c1843023f46905f032f30ae4c3c6696 ****/
		%feature("compactdefaultargs") SetFreeBound;
		%feature("autodoc", "Sets contour.

Parameters
----------
freebound: TopoDS_Wire

Returns
-------
None
") SetFreeBound;
		void SetFreeBound(const TopoDS_Wire & freebound);

		/****************** SetPerimeter ******************/
		/**** md5 signature: 7108a39a557363155f1a5e4a4e1f31b9 ****/
		%feature("compactdefaultargs") SetPerimeter;
		%feature("autodoc", "Sets perimeter of the contour.

Parameters
----------
perimeter: float

Returns
-------
None
") SetPerimeter;
		void SetPerimeter(const Standard_Real perimeter);

		/****************** SetRatio ******************/
		/**** md5 signature: cc4a35be4cdecff3ce638489af66189a ****/
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "Sets ratio of average length to average width of the contour.

Parameters
----------
ratio: float

Returns
-------
None
") SetRatio;
		void SetRatio(const Standard_Real ratio);

		/****************** SetWidth ******************/
		/**** md5 signature: 59e35a19d9637de95c5046e29f33e9bb ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Sets average width of the contour.

Parameters
----------
width: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real width);

		/****************** Width ******************/
		/**** md5 signature: e40fe8cb5cdcf41ad2ab06ede13e859b ****/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Returns average width of the contour.

Returns
-------
float
") Width;
		Standard_Real Width();

};


%make_alias(ShapeAnalysis_FreeBoundData)

%extend ShapeAnalysis_FreeBoundData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeAnalysis_FreeBounds *
*********************************/
class ShapeAnalysis_FreeBounds {
	public:
		/****************** ShapeAnalysis_FreeBounds ******************/
		/**** md5 signature: 5da92b1e8a436f1cc0d04bb54787a6bf ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds();

		/****************** ShapeAnalysis_FreeBounds ******************/
		/**** md5 signature: ce4ce708210e4665a3c9bed93e0bf258 ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "Builds forecasting free bounds of the <shape>. <shape> should be a compound of faces. this constructor is to be used for forecasting free edges with help of sewing analyzer brepalgo_sewing which is called with tolerance <toler>. free edges are connected into wires only when their ends are at distance less than <toler>. if <splitclosed> is true extracts closed sub-wires out of built closed wires. if <splitopen> is true extracts closed sub-wires out of built open wires.

Parameters
----------
shape: TopoDS_Shape
toler: float
splitclosed: bool,optional
	default value is Standard_False
splitopen: bool,optional
	default value is Standard_True

Returns
-------
None
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds(const TopoDS_Shape & shape, const Standard_Real toler, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_True);

		/****************** ShapeAnalysis_FreeBounds ******************/
		/**** md5 signature: 1c11ce8aaf8a9c07156a0ca820ea6f78 ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "Builds actual free bounds of the <shape>. <shape> should be a compound of shells. this constructor is to be used for getting free edges (ones referenced by the only face) with help of analyzer shapeanalysis_shell. free edges are connected into wires only when they share the same vertex. if <splitclosed> is true extracts closed sub-wires out of built closed wires. if <splitopen> is true extracts closed sub-wires out of built open wires.

Parameters
----------
shape: TopoDS_Shape
splitclosed: bool,optional
	default value is Standard_False
splitopen: bool,optional
	default value is Standard_True
checkinternaledges: bool,optional
	default value is Standard_False

Returns
-------
None
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds(const TopoDS_Shape & shape, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_True, const Standard_Boolean checkinternaledges = Standard_False);

		/****************** ConnectEdgesToWires ******************/
		/**** md5 signature: 6fcc51b9a4f6e720b15cb08a6b8abe01 ****/
		%feature("compactdefaultargs") ConnectEdgesToWires;
		%feature("autodoc", "Builds sequnce of <wires> out of sequence of not sorted <edges>. tries to build wires of maximum length. building a wire is stopped when no edges can be connected to it at its head or at its tail. //! orientation of the edge can change when connecting. if <shared> is true connection is performed only when adjacent edges share the same vertex. if <shared> is false connection is performed only when ends of adjacent edges are at distance less than <toler>.

Parameters
----------
edges: TopTools_HSequenceOfShape
toler: float
shared: bool
wires: TopTools_HSequenceOfShape

Returns
-------
None
") ConnectEdgesToWires;
		static void ConnectEdgesToWires(opencascade::handle<TopTools_HSequenceOfShape> & edges, const Standard_Real toler, const Standard_Boolean shared, opencascade::handle<TopTools_HSequenceOfShape> & wires);

		/****************** ConnectWiresToWires ******************/
		/**** md5 signature: 65e7beffc0860523c7e2928eb79c19e4 ****/
		%feature("compactdefaultargs") ConnectWiresToWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
iwires: TopTools_HSequenceOfShape
toler: float
shared: bool
owires: TopTools_HSequenceOfShape

Returns
-------
None
") ConnectWiresToWires;
		static void ConnectWiresToWires(opencascade::handle<TopTools_HSequenceOfShape> & iwires, const Standard_Real toler, const Standard_Boolean shared, opencascade::handle<TopTools_HSequenceOfShape> & owires);

		/****************** ConnectWiresToWires ******************/
		/**** md5 signature: 009f594b7e71f4d33210458b3bbfb661 ****/
		%feature("compactdefaultargs") ConnectWiresToWires;
		%feature("autodoc", "Builds sequnce of <owires> out of sequence of not sorted <iwires>. tries to build wires of maximum length. building a wire is stopped when no wires can be connected to it at its head or at its tail. //! orientation of the wire can change when connecting. if <shared> is true connection is performed only when adjacent wires share the same vertex. if <shared> is false connection is performed only when ends of adjacent wires are at distance less than <toler>. map <vertices> stores the correspondence between original end vertices of the wires and new connecting vertices.

Parameters
----------
iwires: TopTools_HSequenceOfShape
toler: float
shared: bool
owires: TopTools_HSequenceOfShape
vertices: TopTools_DataMapOfShapeShape

Returns
-------
None
") ConnectWiresToWires;
		static void ConnectWiresToWires(opencascade::handle<TopTools_HSequenceOfShape> & iwires, const Standard_Real toler, const Standard_Boolean shared, opencascade::handle<TopTools_HSequenceOfShape> & owires, TopTools_DataMapOfShapeShape & vertices);

		/****************** DispatchWires ******************/
		/**** md5 signature: 10c7bcfb1c66932d655ad49617f8df2b ****/
		%feature("compactdefaultargs") DispatchWires;
		%feature("autodoc", "Dispatches sequence of <wires> into two compounds <closed> for closed wires and <open> for open wires. if a compound is not empty wires are added into it.

Parameters
----------
wires: TopTools_HSequenceOfShape
closed: TopoDS_Compound
open: TopoDS_Compound

Returns
-------
None
") DispatchWires;
		static void DispatchWires(const opencascade::handle<TopTools_HSequenceOfShape> & wires, TopoDS_Compound & closed, TopoDS_Compound & open);

		/****************** GetClosedWires ******************/
		/**** md5 signature: 90f975347145fad77d9189e1b9eb60f3 ****/
		%feature("compactdefaultargs") GetClosedWires;
		%feature("autodoc", "Returns compound of closed wires out of free edges.

Returns
-------
TopoDS_Compound
") GetClosedWires;
		const TopoDS_Compound GetClosedWires();

		/****************** GetOpenWires ******************/
		/**** md5 signature: 593c247336f0173d978a7190a7ee588f ****/
		%feature("compactdefaultargs") GetOpenWires;
		%feature("autodoc", "Returns compound of open wires out of free edges.

Returns
-------
TopoDS_Compound
") GetOpenWires;
		const TopoDS_Compound GetOpenWires();

		/****************** SplitWires ******************/
		/**** md5 signature: 3c46178d0a5bed184b71d617a06437ea ****/
		%feature("compactdefaultargs") SplitWires;
		%feature("autodoc", "Extracts closed sub-wires out of <wires> and adds them to <closed>, open wires remained after extraction are put into <open>. if <shared> is true extraction is performed only when edges share the same vertex. if <shared> is false connection is performed only when ends of the edges are at distance less than <toler>.

Parameters
----------
wires: TopTools_HSequenceOfShape
toler: float
shared: bool
closed: TopTools_HSequenceOfShape
open: TopTools_HSequenceOfShape

Returns
-------
None
") SplitWires;
		static void SplitWires(const opencascade::handle<TopTools_HSequenceOfShape> & wires, const Standard_Real toler, const Standard_Boolean shared, opencascade::handle<TopTools_HSequenceOfShape> & closed, opencascade::handle<TopTools_HSequenceOfShape> & open);

};


%extend ShapeAnalysis_FreeBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class ShapeAnalysis_FreeBoundsProperties *
*******************************************/
class ShapeAnalysis_FreeBoundsProperties {
	public:
		/****************** ShapeAnalysis_FreeBoundsProperties ******************/
		/**** md5 signature: 6902457036bde4e2dfacfed7ad607c36 ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties();

		/****************** ShapeAnalysis_FreeBoundsProperties ******************/
		/**** md5 signature: 2371a658568ed2f269ca1d7fed42a9b1 ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "Creates the object and calls corresponding init. <shape> should be a compound of faces.

Parameters
----------
shape: TopoDS_Shape
tolerance: float
splitclosed: bool,optional
	default value is Standard_False
splitopen: bool,optional
	default value is Standard_False

Returns
-------
None
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties(const TopoDS_Shape & shape, const Standard_Real tolerance, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****************** ShapeAnalysis_FreeBoundsProperties ******************/
		/**** md5 signature: 132b5d79208ca37c5eb1d92d0f663df9 ****/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "Creates the object and calls corresponding init. <shape> should be a compound of shells.

Parameters
----------
shape: TopoDS_Shape
splitclosed: bool,optional
	default value is Standard_False
splitopen: bool,optional
	default value is Standard_False

Returns
-------
None
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties(const TopoDS_Shape & shape, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****************** CheckContours ******************/
		/**** md5 signature: 5bae4be1fe56ada2c3fba18f4955d6ce ****/
		%feature("compactdefaultargs") CheckContours;
		%feature("autodoc", "No available documentation.

Parameters
----------
prec: float,optional
	default value is 0.0

Returns
-------
bool
") CheckContours;
		Standard_Boolean CheckContours(const Standard_Real prec = 0.0);

		/****************** CheckNotches ******************/
		/**** md5 signature: e0adbd03dc5e2e35f4a2145fb24837fc ****/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "No available documentation.

Parameters
----------
prec: float,optional
	default value is 0.0

Returns
-------
bool
") CheckNotches;
		Standard_Boolean CheckNotches(const Standard_Real prec = 0.0);

		/****************** CheckNotches ******************/
		/**** md5 signature: c2af94c18680779c1fe35c641fa9181f ****/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "No available documentation.

Parameters
----------
fbData: ShapeAnalysis_FreeBoundData
prec: float,optional
	default value is 0.0

Returns
-------
bool
") CheckNotches;
		Standard_Boolean CheckNotches(opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData, const Standard_Real prec = 0.0);

		/****************** CheckNotches ******************/
		/**** md5 signature: 688bb40fbae25b5be28e2d92ecdf9d58 ****/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "No available documentation.

Parameters
----------
freebound: TopoDS_Wire
num: int
notch: TopoDS_Wire
prec: float,optional
	default value is 0.0

Returns
-------
distMax: float
") CheckNotches;
		Standard_Boolean CheckNotches(const TopoDS_Wire & freebound, const Standard_Integer num, TopoDS_Wire & notch, Standard_Real &OutValue, const Standard_Real prec = 0.0);

		/****************** ClosedFreeBound ******************/
		/**** md5 signature: 448f89098fcf19a7253dcb8d477c56aa ****/
		%feature("compactdefaultargs") ClosedFreeBound;
		%feature("autodoc", "Returns properties of closed free bound specified by its rank number.

Parameters
----------
index: int

Returns
-------
opencascade::handle<ShapeAnalysis_FreeBoundData>
") ClosedFreeBound;
		opencascade::handle<ShapeAnalysis_FreeBoundData> ClosedFreeBound(const Standard_Integer index);

		/****************** ClosedFreeBounds ******************/
		/**** md5 signature: 51ee12dff9915049e3a7ce415979dd66 ****/
		%feature("compactdefaultargs") ClosedFreeBounds;
		%feature("autodoc", "Returns all closed free bounds.

Returns
-------
opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds>
") ClosedFreeBounds;
		opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds> ClosedFreeBounds();

		/****************** DispatchBounds ******************/
		/**** md5 signature: ff99f9e699cdc42c2fb973a818fde35f ****/
		%feature("compactdefaultargs") DispatchBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DispatchBounds;
		Standard_Boolean DispatchBounds();

		/****************** FillProperties ******************/
		/**** md5 signature: dc2629081041ef4e84d2550dd2f4168c ****/
		%feature("compactdefaultargs") FillProperties;
		%feature("autodoc", "No available documentation.

Parameters
----------
fbData: ShapeAnalysis_FreeBoundData
prec: float,optional
	default value is 0.0

Returns
-------
bool
") FillProperties;
		Standard_Boolean FillProperties(opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData, const Standard_Real prec = 0.0);

		/****************** Init ******************/
		/**** md5 signature: 4f89df93af73e5b28d51583b204c1cb4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the object with given parameters. <shape> should be a compound of faces.

Parameters
----------
shape: TopoDS_Shape
tolerance: float
splitclosed: bool,optional
	default value is Standard_False
splitopen: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & shape, const Standard_Real tolerance, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****************** Init ******************/
		/**** md5 signature: 733d5f1e34b89852a44f53b4380084f3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the object with given parameters. <shape> should be a compound of shells.

Parameters
----------
shape: TopoDS_Shape
splitclosed: bool,optional
	default value is Standard_False
splitopen: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & shape, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****************** IsLoaded ******************/
		/**** md5 signature: 5ed802f56c3a94dc70391badb380a6ed ****/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Returns true if shape is loaded.

Returns
-------
bool
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****************** NbClosedFreeBounds ******************/
		/**** md5 signature: 45470f062c41c14a8e9dcdef889185e4 ****/
		%feature("compactdefaultargs") NbClosedFreeBounds;
		%feature("autodoc", "Returns number of closed free bounds.

Returns
-------
int
") NbClosedFreeBounds;
		Standard_Integer NbClosedFreeBounds();

		/****************** NbFreeBounds ******************/
		/**** md5 signature: 7d1a3929ae11c65651a7b6696268014d ****/
		%feature("compactdefaultargs") NbFreeBounds;
		%feature("autodoc", "Returns number of free bounds.

Returns
-------
int
") NbFreeBounds;
		Standard_Integer NbFreeBounds();

		/****************** NbOpenFreeBounds ******************/
		/**** md5 signature: 7c7a0fd03a368d42fc99bc6f8213179b ****/
		%feature("compactdefaultargs") NbOpenFreeBounds;
		%feature("autodoc", "Returns number of open free bounds.

Returns
-------
int
") NbOpenFreeBounds;
		Standard_Integer NbOpenFreeBounds();

		/****************** OpenFreeBound ******************/
		/**** md5 signature: 759aa7338b83d3e58c42dc695040d019 ****/
		%feature("compactdefaultargs") OpenFreeBound;
		%feature("autodoc", "Returns properties of open free bound specified by its rank number.

Parameters
----------
index: int

Returns
-------
opencascade::handle<ShapeAnalysis_FreeBoundData>
") OpenFreeBound;
		opencascade::handle<ShapeAnalysis_FreeBoundData> OpenFreeBound(const Standard_Integer index);

		/****************** OpenFreeBounds ******************/
		/**** md5 signature: 0c359373fc2a8ebaaaab8ff06e382edb ****/
		%feature("compactdefaultargs") OpenFreeBounds;
		%feature("autodoc", "Returns all open free bounds.

Returns
-------
opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds>
") OpenFreeBounds;
		opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds> OpenFreeBounds();

		/****************** Perform ******************/
		/**** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Builds and analyzes free bounds of the shape. first calls shapeanalysis_freebounds for building free bounds. then on each free bound computes its properties: - area of the contour, - perimeter of the contour, - ratio of average length to average width of the contour, - average width of contour, - notches on the contour and for each notch - maximum width of the notch.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

		/****************** Shape ******************/
		/**** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns shape.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

};


%extend ShapeAnalysis_FreeBoundsProperties {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeAnalysis_Geom *
***************************/
class ShapeAnalysis_Geom {
	public:
		/****************** NearestPlane ******************/
		/**** md5 signature: 1abacc2e7c3cb3438e51b9db1f625c35 ****/
		%feature("compactdefaultargs") NearestPlane;
		%feature("autodoc", "Builds a plane out of a set of points in array returns in <dmax> the maximal distance between the produced plane and given points.

Parameters
----------
Pnts: TColgp_Array1OfPnt
aPln: gp_Pln

Returns
-------
Dmax: float
") NearestPlane;
		static Standard_Boolean NearestPlane(const TColgp_Array1OfPnt & Pnts, gp_Pln & aPln, Standard_Real &OutValue);

		/****************** PositionTrsf ******************/
		/**** md5 signature: 2a3f3a6e4f8ae606dbb46116193e80b1 ****/
		%feature("compactdefaultargs") PositionTrsf;
		%feature("autodoc", "Builds transfromation object out of matrix. matrix must be 3 x 4. unit is used as multiplier.

Parameters
----------
coefs: TColStd_HArray2OfReal
trsf: gp_Trsf
unit: float
prec: float

Returns
-------
bool
") PositionTrsf;
		static Standard_Boolean PositionTrsf(const opencascade::handle<TColStd_HArray2OfReal> & coefs, gp_Trsf & trsf, const Standard_Real unit, const Standard_Real prec);

};


%extend ShapeAnalysis_Geom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ShapeAnalysis_ShapeContents *
************************************/
class ShapeAnalysis_ShapeContents {
	public:
		/****************** ShapeAnalysis_ShapeContents ******************/
		/**** md5 signature: 37f686aff70d09482f8278b2e5ede2ed ****/
		%feature("compactdefaultargs") ShapeAnalysis_ShapeContents;
		%feature("autodoc", "Initialize fields and call clearflags().

Returns
-------
None
") ShapeAnalysis_ShapeContents;
		 ShapeAnalysis_ShapeContents();

		/****************** BigSplineSec ******************/
		/**** md5 signature: 0199bf9d3b269b35de6e5df96995f45b ****/
		%feature("compactdefaultargs") BigSplineSec;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") BigSplineSec;
		opencascade::handle<TopTools_HSequenceOfShape> BigSplineSec();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all accumulated statictics.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClearFlags ******************/
		/**** md5 signature: 85d2349db84c8892f957d96fa3a7b729 ****/
		%feature("compactdefaultargs") ClearFlags;
		%feature("autodoc", "Clears all flags.

Returns
-------
None
") ClearFlags;
		void ClearFlags();

		/****************** IndirectSec ******************/
		/**** md5 signature: 887bf1fe521a9bc268eab0bae4d389a9 ****/
		%feature("compactdefaultargs") IndirectSec;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") IndirectSec;
		opencascade::handle<TopTools_HSequenceOfShape> IndirectSec();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyBigSplineMode() {
            return (Standard_Boolean) $self->ModifyBigSplineMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyBigSplineMode(Standard_Boolean value) {
            $self->ModifyBigSplineMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyIndirectMode() {
            return (Standard_Boolean) $self->ModifyIndirectMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyIndirectMode(Standard_Boolean value) {
            $self->ModifyIndirectMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyOffestSurfaceMode() {
            return (Standard_Boolean) $self->ModifyOffestSurfaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyOffestSurfaceMode(Standard_Boolean value) {
            $self->ModifyOffestSurfaceMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyOffsetCurveMode() {
            return (Standard_Boolean) $self->ModifyOffsetCurveMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyOffsetCurveMode(Standard_Boolean value) {
            $self->ModifyOffsetCurveMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyTrimmed2dMode() {
            return (Standard_Boolean) $self->ModifyTrimmed2dMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyTrimmed2dMode(Standard_Boolean value) {
            $self->ModifyTrimmed2dMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyTrimmed3dMode() {
            return (Standard_Boolean) $self->ModifyTrimmed3dMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyTrimmed3dMode(Standard_Boolean value) {
            $self->ModifyTrimmed3dMode()=value;
            }
        };
		/****************** NbBSplibeSurf ******************/
		/**** md5 signature: 5518306eba90b729aeb9509ffb7e5c57 ****/
		%feature("compactdefaultargs") NbBSplibeSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBSplibeSurf;
		Standard_Integer NbBSplibeSurf();

		/****************** NbBezierSurf ******************/
		/**** md5 signature: aad955c6e7f01e3cbcdf2eca83c00882 ****/
		%feature("compactdefaultargs") NbBezierSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBezierSurf;
		Standard_Integer NbBezierSurf();

		/****************** NbBigSplines ******************/
		/**** md5 signature: 68bc3e8419d2afe5d9531b608b9e4abf ****/
		%feature("compactdefaultargs") NbBigSplines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBigSplines;
		Standard_Integer NbBigSplines();

		/****************** NbC0Curves ******************/
		/**** md5 signature: 88262560ac1a169e11bd6ec19ce400ec ****/
		%feature("compactdefaultargs") NbC0Curves;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbC0Curves;
		Standard_Integer NbC0Curves();

		/****************** NbC0Surfaces ******************/
		/**** md5 signature: ec9baf8d36619044ba930bb4dbfb9be2 ****/
		%feature("compactdefaultargs") NbC0Surfaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbC0Surfaces;
		Standard_Integer NbC0Surfaces();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NbFaceWithSevWires ******************/
		/**** md5 signature: 5b11391afc09f8c5235c581f024acc84 ****/
		%feature("compactdefaultargs") NbFaceWithSevWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFaceWithSevWires;
		Standard_Integer NbFaceWithSevWires();

		/****************** NbFaces ******************/
		/**** md5 signature: 1f0fd1808c5306ae27c425978ee57bb5 ****/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFaces;
		Standard_Integer NbFaces();

		/****************** NbFreeEdges ******************/
		/**** md5 signature: 601078396c3dc97b2847707250e5a03a ****/
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFreeEdges;
		Standard_Integer NbFreeEdges();

		/****************** NbFreeFaces ******************/
		/**** md5 signature: d14e5d9b9438b37023c56265f1a0fd84 ****/
		%feature("compactdefaultargs") NbFreeFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFreeFaces;
		Standard_Integer NbFreeFaces();

		/****************** NbFreeWires ******************/
		/**** md5 signature: b4cae47e68f24434447587fe37aa4a96 ****/
		%feature("compactdefaultargs") NbFreeWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFreeWires;
		Standard_Integer NbFreeWires();

		/****************** NbIndirectSurf ******************/
		/**** md5 signature: 62bb42974b6575f299b28b4c7df40ebc ****/
		%feature("compactdefaultargs") NbIndirectSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbIndirectSurf;
		Standard_Integer NbIndirectSurf();

		/****************** NbNoPCurve ******************/
		/**** md5 signature: 66b4c6e6be9e1e2afa51e5bcbd91d4b7 ****/
		%feature("compactdefaultargs") NbNoPCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbNoPCurve;
		Standard_Integer NbNoPCurve();

		/****************** NbOffsetCurves ******************/
		/**** md5 signature: 0100d7755e19a7b810cce7c045dfc6a6 ****/
		%feature("compactdefaultargs") NbOffsetCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbOffsetCurves;
		Standard_Integer NbOffsetCurves();

		/****************** NbOffsetSurf ******************/
		/**** md5 signature: ff2b55704598daf353e2b689eca41be7 ****/
		%feature("compactdefaultargs") NbOffsetSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbOffsetSurf;
		Standard_Integer NbOffsetSurf();

		/****************** NbSharedEdges ******************/
		/**** md5 signature: b457072352fd9c3e9218f83200b5cc6b ****/
		%feature("compactdefaultargs") NbSharedEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedEdges;
		Standard_Integer NbSharedEdges();

		/****************** NbSharedFaces ******************/
		/**** md5 signature: 79dbba2af2b754e7d8cdde9015b549bb ****/
		%feature("compactdefaultargs") NbSharedFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedFaces;
		Standard_Integer NbSharedFaces();

		/****************** NbSharedFreeEdges ******************/
		/**** md5 signature: a64b2515b8fad4c0c0d765921807f4cc ****/
		%feature("compactdefaultargs") NbSharedFreeEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedFreeEdges;
		Standard_Integer NbSharedFreeEdges();

		/****************** NbSharedFreeWires ******************/
		/**** md5 signature: becd02110340153e5fd0d0cfda811d73 ****/
		%feature("compactdefaultargs") NbSharedFreeWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedFreeWires;
		Standard_Integer NbSharedFreeWires();

		/****************** NbSharedShells ******************/
		/**** md5 signature: ff2bdfc65a99a1214bb8e015935783d8 ****/
		%feature("compactdefaultargs") NbSharedShells;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedShells;
		Standard_Integer NbSharedShells();

		/****************** NbSharedSolids ******************/
		/**** md5 signature: 8ef1260b45d13decb139a9012acb3bab ****/
		%feature("compactdefaultargs") NbSharedSolids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedSolids;
		Standard_Integer NbSharedSolids();

		/****************** NbSharedVertices ******************/
		/**** md5 signature: a5453d48f2fa5e932a80ea375c45927a ****/
		%feature("compactdefaultargs") NbSharedVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedVertices;
		Standard_Integer NbSharedVertices();

		/****************** NbSharedWires ******************/
		/**** md5 signature: 0e5fcf8be89f57bb1edef788c1cc64be ****/
		%feature("compactdefaultargs") NbSharedWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSharedWires;
		Standard_Integer NbSharedWires();

		/****************** NbShells ******************/
		/**** md5 signature: ae5cea2f4ee50541dc840582f5c8441d ****/
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShells;
		Standard_Integer NbShells();

		/****************** NbSolids ******************/
		/**** md5 signature: fe0e5621a431c37f6921d15dbbe777ad ****/
		%feature("compactdefaultargs") NbSolids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSolids;
		Standard_Integer NbSolids();

		/****************** NbSolidsWithVoids ******************/
		/**** md5 signature: 5e8b39b93411bd17075211cb049009c3 ****/
		%feature("compactdefaultargs") NbSolidsWithVoids;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSolidsWithVoids;
		Standard_Integer NbSolidsWithVoids();

		/****************** NbTrimSurf ******************/
		/**** md5 signature: 4c86d57bd7fe16c78e81715d7d26ac8b ****/
		%feature("compactdefaultargs") NbTrimSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTrimSurf;
		Standard_Integer NbTrimSurf();

		/****************** NbTrimmedCurve2d ******************/
		/**** md5 signature: 831cc19d09373e57246c50afb40fde09 ****/
		%feature("compactdefaultargs") NbTrimmedCurve2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTrimmedCurve2d;
		Standard_Integer NbTrimmedCurve2d();

		/****************** NbTrimmedCurve3d ******************/
		/**** md5 signature: 6cdd535fa28199051b9643900b4c70c2 ****/
		%feature("compactdefaultargs") NbTrimmedCurve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTrimmedCurve3d;
		Standard_Integer NbTrimmedCurve3d();

		/****************** NbVertices ******************/
		/**** md5 signature: 435b05539d6b9d704dc04d9218f26996 ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** NbWireWithSevSeams ******************/
		/**** md5 signature: 7b1c334798f5c46aaa4ebcffaef9298b ****/
		%feature("compactdefaultargs") NbWireWithSevSeams;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbWireWithSevSeams;
		Standard_Integer NbWireWithSevSeams();

		/****************** NbWireWitnSeam ******************/
		/**** md5 signature: 20e8473d0ecf8ebdba112f78f9e77fad ****/
		%feature("compactdefaultargs") NbWireWitnSeam;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbWireWitnSeam;
		Standard_Integer NbWireWitnSeam();

		/****************** NbWires ******************/
		/**** md5 signature: 623d3933020942cf2c5912f50d17d660 ****/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbWires;
		Standard_Integer NbWires();

		/****************** OffsetCurveSec ******************/
		/**** md5 signature: 490f03227f3d12f47c0434fda729f5da ****/
		%feature("compactdefaultargs") OffsetCurveSec;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") OffsetCurveSec;
		opencascade::handle<TopTools_HSequenceOfShape> OffsetCurveSec();

		/****************** OffsetSurfaceSec ******************/
		/**** md5 signature: 6c55196f30d06cbadfc0d2456d8b105c ****/
		%feature("compactdefaultargs") OffsetSurfaceSec;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") OffsetSurfaceSec;
		opencascade::handle<TopTools_HSequenceOfShape> OffsetSurfaceSec();

		/****************** Perform ******************/
		/**** md5 signature: 16888c81df64e609e09767552e6bb5d4 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Counts quantities of sun-shapes in shape and stores sub-shapes according to flags.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & shape);

		/****************** Trimmed2dSec ******************/
		/**** md5 signature: a5b6c4cf8a74d62bf08dd5a061b72b8a ****/
		%feature("compactdefaultargs") Trimmed2dSec;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Trimmed2dSec;
		opencascade::handle<TopTools_HSequenceOfShape> Trimmed2dSec();

		/****************** Trimmed3dSec ******************/
		/**** md5 signature: db189311bbf0a26bd1a7e654a6e20b81 ****/
		%feature("compactdefaultargs") Trimmed3dSec;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Trimmed3dSec;
		opencascade::handle<TopTools_HSequenceOfShape> Trimmed3dSec();

};


%extend ShapeAnalysis_ShapeContents {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeAnalysis_ShapeTolerance *
*************************************/
class ShapeAnalysis_ShapeTolerance {
	public:
		/****************** ShapeAnalysis_ShapeTolerance ******************/
		/**** md5 signature: 752fdf574bf9608126622d6475fe8772 ****/
		%feature("compactdefaultargs") ShapeAnalysis_ShapeTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAnalysis_ShapeTolerance;
		 ShapeAnalysis_ShapeTolerance();

		/****************** AddTolerance ******************/
		/**** md5 signature: c795a520a700e7a235b1f6e3cfa644eb ****/
		%feature("compactdefaultargs") AddTolerance;
		%feature("autodoc", "Adds data on new shape to compute cumulated tolerance (prepares three computations : maximal, average, minimal).

Parameters
----------
shape: TopoDS_Shape
type: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") AddTolerance;
		void AddTolerance(const TopoDS_Shape & shape, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****************** GlobalTolerance ******************/
		/**** md5 signature: 115c6d7ad9f1f8f4b668991936ba059b ****/
		%feature("compactdefaultargs") GlobalTolerance;
		%feature("autodoc", "Returns the computed tolerance according to the <mode> <mode> = 0 : average <mode> > 0 : maximal <mode> < 0 : minimal.

Parameters
----------
mode: int

Returns
-------
float
") GlobalTolerance;
		Standard_Real GlobalTolerance(const Standard_Integer mode);

		/****************** InTolerance ******************/
		/**** md5 signature: 34f3d0dc44ad0b857efc153f6da3a07f ****/
		%feature("compactdefaultargs") InTolerance;
		%feature("autodoc", "Determines which shapes have a tolerance within a given interval <type> is interpreted as in the method tolerance.

Parameters
----------
shape: TopoDS_Shape
valmin: float
valmax: float
type: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") InTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> InTolerance(const TopoDS_Shape & shape, const Standard_Real valmin, const Standard_Real valmax, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****************** InitTolerance ******************/
		/**** md5 signature: b0b32e3190ada2249e730ea00f6d78db ****/
		%feature("compactdefaultargs") InitTolerance;
		%feature("autodoc", "Initializes computation of cumulated tolerance.

Returns
-------
None
") InitTolerance;
		void InitTolerance();

		/****************** OverTolerance ******************/
		/**** md5 signature: c7797ddd43e323f4bfc02b03651ea6eb ****/
		%feature("compactdefaultargs") OverTolerance;
		%feature("autodoc", "Determines which shapes have a tolerance over the given value <type> is interpreted as in the method tolerance.

Parameters
----------
shape: TopoDS_Shape
value: float
type: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") OverTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> OverTolerance(const TopoDS_Shape & shape, const Standard_Real value, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****************** Tolerance ******************/
		/**** md5 signature: 4fba2d270084aa728e36b5461151c988 ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Determines a tolerance from the ones stored in a shape remark : calls inittolerance and addtolerance, hence, can be used to start a series for cumulating tolerance <mode> = 0 : returns the average value between sub-shapes, <mode> > 0 : returns the maximal found, <mode> < 0 : returns the minimal found. <type> defines what kinds of sub-shapes to consider: shape (default) : all : vertex, edge, face, vertex : only vertices, edge : only edges, face : only faces, shell : combined shell + face, for each face (and containing shell), also checks edge and vertex.

Parameters
----------
shape: TopoDS_Shape
mode: int
type: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance(const TopoDS_Shape & shape, const Standard_Integer mode, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

};


%extend ShapeAnalysis_ShapeTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeAnalysis_Shell *
****************************/
class ShapeAnalysis_Shell {
	public:
		/****************** BadEdges ******************/
		/**** md5 signature: 271874605067d1f8e996561e77de6c92 ****/
		%feature("compactdefaultargs") BadEdges;
		%feature("autodoc", "Returns the list of bad edges as a compound it is empty (not null) if no edge are recorded as bad.

Returns
-------
TopoDS_Compound
") BadEdges;
		TopoDS_Compound BadEdges();

		/****************** CheckOrientedShells ******************/
		/**** md5 signature: 3972e6d2240bfe7162bfdcaaf99283d5 ****/
		%feature("compactdefaultargs") CheckOrientedShells;
		%feature("autodoc", "Checks if shells fulfill orientation condition, i.e. if each edge is, either present once (free edge) or twice (connected edge) but with different orientations (forward/reversed) edges which do not fulfill these conditions are bad //! if <alsofree> is true free edges are considered. free edges can be queried but are not bad.

Parameters
----------
shape: TopoDS_Shape
alsofree: bool,optional
	default value is Standard_False
checkinternaledges: bool,optional
	default value is Standard_False

Returns
-------
bool
") CheckOrientedShells;
		Standard_Boolean CheckOrientedShells(const TopoDS_Shape & shape, const Standard_Boolean alsofree = Standard_False, const Standard_Boolean checkinternaledges = Standard_False);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears data about loaded shells and performed checks.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FreeEdges ******************/
		/**** md5 signature: 0cd90c82c4861535bb5e6f08392933ea ****/
		%feature("compactdefaultargs") FreeEdges;
		%feature("autodoc", "Returns the list of free (not connected) edges as a compound it is empty (not null) if no edge are recorded as free.

Returns
-------
TopoDS_Compound
") FreeEdges;
		TopoDS_Compound FreeEdges();

		/****************** HasBadEdges ******************/
		/**** md5 signature: 1fdc9d123b53c4be47feca0d4b89c645 ****/
		%feature("compactdefaultargs") HasBadEdges;
		%feature("autodoc", "Tells if at least one edge is recorded as bad.

Returns
-------
bool
") HasBadEdges;
		Standard_Boolean HasBadEdges();

		/****************** HasConnectedEdges ******************/
		/**** md5 signature: 373f92fac7e5286dd20af827cf765c81 ****/
		%feature("compactdefaultargs") HasConnectedEdges;
		%feature("autodoc", "Tells if at least one edge is connected (shared twice or more).

Returns
-------
bool
") HasConnectedEdges;
		Standard_Boolean HasConnectedEdges();

		/****************** HasFreeEdges ******************/
		/**** md5 signature: 453c0e08bc8a20438ea1fa8a96a1d03d ****/
		%feature("compactdefaultargs") HasFreeEdges;
		%feature("autodoc", "Tells if at least one edge is recorded as free (not connected).

Returns
-------
bool
") HasFreeEdges;
		Standard_Boolean HasFreeEdges();

		/****************** IsLoaded ******************/
		/**** md5 signature: 09f9f0a8c6a9692ece2c431867ab4a4b ****/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Tells if a shape is loaded (only shells are checked).

Parameters
----------
shape: TopoDS_Shape

Returns
-------
bool
") IsLoaded;
		Standard_Boolean IsLoaded(const TopoDS_Shape & shape);

		/****************** LoadShells ******************/
		/**** md5 signature: 2024b788d50a942b98ddddf711a74af9 ****/
		%feature("compactdefaultargs") LoadShells;
		%feature("autodoc", "Adds shells contained in the <shape> to the list of loaded shells.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") LoadShells;
		void LoadShells(const TopoDS_Shape & shape);

		/****************** Loaded ******************/
		/**** md5 signature: f983b60bdef3285fe766a30d6d4f39bf ****/
		%feature("compactdefaultargs") Loaded;
		%feature("autodoc", "Returns a loaded shape specified by its rank number. returns null shape if <num> is out of range.

Parameters
----------
num: int

Returns
-------
TopoDS_Shape
") Loaded;
		TopoDS_Shape Loaded(const Standard_Integer num);

		/****************** NbLoaded ******************/
		/**** md5 signature: e3f6e4c2ee1e6268545981474925e902 ****/
		%feature("compactdefaultargs") NbLoaded;
		%feature("autodoc", "Returns the actual number of loaded shapes (i.e. shells).

Returns
-------
int
") NbLoaded;
		Standard_Integer NbLoaded();

};


%extend ShapeAnalysis_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ShapeAnalysis_Surface *
******************************/
class ShapeAnalysis_Surface : public Standard_Transient {
	public:
		/****************** ShapeAnalysis_Surface ******************/
		/**** md5 signature: 21960ac3090a4d57a0c39ee76c52d600 ****/
		%feature("compactdefaultargs") ShapeAnalysis_Surface;
		%feature("autodoc", "Creates an analyzer object on the basis of existing surface.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") ShapeAnalysis_Surface;
		 ShapeAnalysis_Surface(const opencascade::handle<Geom_Surface> & S);

		/****************** Adaptor3d ******************/
		/**** md5 signature: 477869ea05f2394b5dbd824c2b39e9e9 ****/
		%feature("compactdefaultargs") Adaptor3d;
		%feature("autodoc", "Returns the adaptor. creates it if not yet done.

Returns
-------
opencascade::handle<GeomAdaptor_HSurface>
") Adaptor3d;
		const opencascade::handle<GeomAdaptor_HSurface> & Adaptor3d();

		/****************** Bounds ******************/
		/**** md5 signature: 76f4d0acb9d784f5c349713b7a3066ed ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the bounds of the surface (from bounds from surface, but buffered).

Parameters
----------

Returns
-------
ufirst: float
ulast: float
vfirst: float
vlast: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ComputeBoundIsos ******************/
		/**** md5 signature: 3dcfe49429fdfd803732ee03b652e6e1 ****/
		%feature("compactdefaultargs") ComputeBoundIsos;
		%feature("autodoc", "Computes bound isos (protected against exceptions).

Returns
-------
None
") ComputeBoundIsos;
		void ComputeBoundIsos();

		/****************** DegeneratedValues ******************/
		/**** md5 signature: 57e334455cc553bf915f92b359503cb8 ****/
		%feature("compactdefaultargs") DegeneratedValues;
		%feature("autodoc", "Returns true if there is at least one surface iso-line which is considered as degenerated with <preci> and distance between p3d and corresponding singular point is less than <preci> (like isdegenerated). returns characteristics of the first found boundary matching those criteria.

Parameters
----------
P3d: gp_Pnt
preci: float
firstP2d: gp_Pnt2d
lastP2d: gp_Pnt2d
forward: bool,optional
	default value is Standard_True

Returns
-------
firstpar: float
lastpar: float
") DegeneratedValues;
		Standard_Boolean DegeneratedValues(const gp_Pnt & P3d, const Standard_Real preci, gp_Pnt2d & firstP2d, gp_Pnt2d & lastP2d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean forward = Standard_True);

		/****************** Gap ******************/
		/**** md5 signature: 57884ecbe8d7b5b092e706848a3678db ****/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Returns 3d distance found by one of the following methods. isdegenerated, degeneratedvalues, projectdegenerated (distance between 3d point and found or last (if not found) singularity), isuclosed, isvclosed (minimum value of precision to consider the surface to be closed), valueofuv (distance between 3d point and found solution).

Returns
-------
float
") Gap;
		Standard_Real Gap();

		/****************** GetBoxUF ******************/
		/**** md5 signature: c9dc3f4e9f51cd84d29c0f0f9a257ab0 ****/
		%feature("compactdefaultargs") GetBoxUF;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") GetBoxUF;
		const Bnd_Box & GetBoxUF();

		/****************** GetBoxUL ******************/
		/**** md5 signature: d318da69dd8f77566946e59fbbc6953c ****/
		%feature("compactdefaultargs") GetBoxUL;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") GetBoxUL;
		const Bnd_Box & GetBoxUL();

		/****************** GetBoxVF ******************/
		/**** md5 signature: ca11982da2a9d9bf73b8fa28c6b275c7 ****/
		%feature("compactdefaultargs") GetBoxVF;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") GetBoxVF;
		const Bnd_Box & GetBoxVF();

		/****************** GetBoxVL ******************/
		/**** md5 signature: d91c1f96f4c164c0878a8c290feb374d ****/
		%feature("compactdefaultargs") GetBoxVL;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") GetBoxVL;
		const Bnd_Box & GetBoxVL();

		/****************** HasSingularities ******************/
		/**** md5 signature: 9ce7b9e8c08f14f920b7503e4fd1ae36 ****/
		%feature("compactdefaultargs") HasSingularities;
		%feature("autodoc", "Returns true if the surface has singularities for the given precision (i.e. if there are surface singularities with sizes not greater than precision).

Parameters
----------
preci: float

Returns
-------
bool
") HasSingularities;
		Standard_Boolean HasSingularities(const Standard_Real preci);

		/****************** Init ******************/
		/**** md5 signature: ae778074c5c355f705c26cfe08f002f6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Loads existing surface.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S);

		/****************** Init ******************/
		/**** md5 signature: da66c8f34aff2bbbe192e6bb10dec122 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Reads all the data from another surface, without recomputing.

Parameters
----------
other: ShapeAnalysis_Surface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeAnalysis_Surface> & other);

		/****************** IsDegenerated ******************/
		/**** md5 signature: 2e83fa02bb73008ad42dcf354f3309e0 ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Returns true if there is at least one surface boundary which is considered as degenerated with <preci> and distance between p3d and corresponding singular point is less than <preci>.

Parameters
----------
P3d: gp_Pnt
preci: float

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated(const gp_Pnt & P3d, const Standard_Real preci);

		/****************** IsDegenerated ******************/
		/**** md5 signature: 73b532d2945208b748a3d0135fc0559d ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Returns true if straight pcurve going from point p2d1 to p2d2 is degenerate, i.e. lies in the singularity of the surface. note: it uses another method of detecting singularity than used by computesingularities() et al.! for that, maximums of distances between points p2d1, p2d2 and 0.5*(p2d1+p2d2) and between corresponding 3d points are computed. the pcurve (p2d1, p2d2) is considered as degenerate if: - max distance in 3d is less than <tol> - max distance in 2d is at least <ratio> times greather than the resolution computed from max distance in 3d (max3d < tol && max2d > ratio * resolution(max3d)) note: <ratio> should be >1 (e.g. 10).

Parameters
----------
p2d1: gp_Pnt2d
p2d2: gp_Pnt2d
tol: float
ratio: float

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated(const gp_Pnt2d & p2d1, const gp_Pnt2d & p2d2, const Standard_Real tol, const Standard_Real ratio);

		/****************** IsUClosed ******************/
		/**** md5 signature: c40ec6bf32caddb2bddec999a738f122 ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Tells if the surface is spatially closed in u with given precision. if <preci> < 0 then precision::confusion is used. if geom_surface says that the surface is u-closed, this method also says this. otherwise additional analysis is performed, comparing given precision with the following distances: - periodic b-splines are closed, - polinomial b-spline with boundary multiplicities degree+1 and bezier - maximum distance between poles, - rational b-spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of extrusion - distance between ends of basis curve, - other (rectangulartrimmed and offset) - maximum distance computed at 100 equi-distanted points.

Parameters
----------
preci: float,optional
	default value is -1

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed(const Standard_Real preci = -1);

		/****************** IsVClosed ******************/
		/**** md5 signature: f6d9fabf565ea50ba091c941e92de75d ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Tells if the surface is spatially closed in v with given precision. if <preci> < 0 then precision::confusion is used. if geom_surface says that the surface is v-closed, this method also says this. otherwise additional analysis is performed, comparing given precision with the following distances: - periodic b-splines are closed, - polinomial b-spline with boundary multiplicities degree+1 and bezier - maximum distance between poles, - rational b-spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of revolution - distance between ends of basis curve, - other (rectangulartrimmed and offset) - maximum distance computed at 100 equi-distanted points.

Parameters
----------
preci: float,optional
	default value is -1

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed(const Standard_Real preci = -1);

		/****************** NbSingularities ******************/
		/**** md5 signature: 7d7076a67b99b706ffbc6b95cf1eb7d6 ****/
		%feature("compactdefaultargs") NbSingularities;
		%feature("autodoc", "Returns the number of singularities for the given precision (i.e. number of surface singularities with sizes not greater than precision).

Parameters
----------
preci: float

Returns
-------
int
") NbSingularities;
		Standard_Integer NbSingularities(const Standard_Real preci);

		/****************** NextValueOfUV ******************/
		/**** md5 signature: 8f75d76c37899f095d2b498ceb77fdd1 ****/
		%feature("compactdefaultargs") NextValueOfUV;
		%feature("autodoc", "Projects a point p3d on the surface. does the same thing as valueofuv but tries to optimize computations by taking into account previous point <p2dprev>: makes a step by uv and tries newton algorithm. if <maxpreci> >0. and distance between solution and p3d is greater than <maxpreci>, that solution is considered as bad, and valueofuv() is used. if not succeded, calls valueofuv().

Parameters
----------
p2dPrev: gp_Pnt2d
P3D: gp_Pnt
preci: float
maxpreci: float,optional
	default value is -1.0

Returns
-------
gp_Pnt2d
") NextValueOfUV;
		gp_Pnt2d NextValueOfUV(const gp_Pnt2d & p2dPrev, const gp_Pnt & P3D, const Standard_Real preci, const Standard_Real maxpreci = -1.0);

		/****************** ProjectDegenerated ******************/
		/**** md5 signature: 68d10f9a8bc6625bfc577f28b5ce9a6e ****/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "Projects a point <p3d> on a singularity by computing one of the coordinates of preliminary computed <result>. //! finds the iso-line which is considered as degenerated with <preci> and a. distance between p3d and corresponding singular point is less than <preci> (like isdegenerated) or b. difference between already computed <result>'s coordinate and iso-coordinate of the boundary is less than 2d resolution (computed from <preci> by geom_adaptor). then sets not yet computed <result>'s coordinate taking it from <neighbour> and returns true.

Parameters
----------
P3d: gp_Pnt
preci: float
neighbour: gp_Pnt2d
result: gp_Pnt2d

Returns
-------
bool
") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated(const gp_Pnt & P3d, const Standard_Real preci, const gp_Pnt2d & neighbour, gp_Pnt2d & result);

		/****************** ProjectDegenerated ******************/
		/**** md5 signature: 3f70c3d1eada5fb87f6635ce6fb33825 ****/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "Checks points at the beginning (direct is true) or end (direct is false) of array <points> to lie in singularity of surface, and if yes, adjusts the indeterminate 2d coordinate of these points by nearest point which is not in singularity. returns true if some points were adjusted.

Parameters
----------
nbrPnt: int
points: TColgp_SequenceOfPnt
pnt2d: TColgp_SequenceOfPnt2d
preci: float
direct: bool

Returns
-------
bool
") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated(const Standard_Integer nbrPnt, const TColgp_SequenceOfPnt & points, TColgp_SequenceOfPnt2d & pnt2d, const Standard_Real preci, const Standard_Boolean direct);

		/****************** SetDomain ******************/
		/**** md5 signature: 242f6d4e5af20c56462421b031aafd66 ****/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
V1: float
V2: float

Returns
-------
None
") SetDomain;
		void SetDomain(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****************** Singularity ******************/
		/**** md5 signature: 3da019b1f8fced06e45e0430b0c745b0 ****/
		%feature("compactdefaultargs") Singularity;
		%feature("autodoc", "Returns the characteristics of the singularity specified by its rank number <num>. that means, that it is not neccessary for <num> to be in the range [1, nbsingularities] but must be not greater than possible (see computesingularities). the returned characteristics are: preci: the smallest precision with which the iso-line is considered as degenerated, p3d: 3d point of singularity (middle point of the surface iso-line), firstp2d and lastp2d: first and last 2d points of the iso-line in parametrical surface, firstpar and lastpar: first and last parameters of the iso-line in parametrical surface, uisodeg: if the degenerated iso-line is u-iso (true) or v-iso (false). returns false if <num> is out of range, else returns true.

Parameters
----------
num: int
P3d: gp_Pnt
firstP2d: gp_Pnt2d
lastP2d: gp_Pnt2d

Returns
-------
preci: float
firstpar: float
lastpar: float
uisodeg: bool
") Singularity;
		Standard_Boolean Singularity(const Standard_Integer num, Standard_Real &OutValue, gp_Pnt & P3d, gp_Pnt2d & firstP2d, gp_Pnt2d & lastP2d, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****************** Surface ******************/
		/**** md5 signature: a469e18cbceeb351572a461f96ff0f4d ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns a surface being analyzed.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****************** TrueAdaptor3d ******************/
		/**** md5 signature: d3d46dd2f2341546bef219e67daf51db ****/
		%feature("compactdefaultargs") TrueAdaptor3d;
		%feature("autodoc", "Returns the adaptor (may be null if method adaptor() was not called).

Returns
-------
opencascade::handle<GeomAdaptor_HSurface>
") TrueAdaptor3d;
		const opencascade::handle<GeomAdaptor_HSurface> & TrueAdaptor3d();

		/****************** UCloseVal ******************/
		/**** md5 signature: 6b05bece8dc5d04e6e44b77fe1c48cb5 ****/
		%feature("compactdefaultargs") UCloseVal;
		%feature("autodoc", "Returns minimum value to consider the surface as u-closed.

Returns
-------
float
") UCloseVal;
		Standard_Real UCloseVal();

		/****************** UIso ******************/
		/**** md5 signature: c1c342549cd981b000bd1d4af5482ca4 ****/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Returns a u-iso. null if not possible or failed remark : bound isos are buffered.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UVFromIso ******************/
		/**** md5 signature: e2de878450fa82115c49dd434fcfc093 ****/
		%feature("compactdefaultargs") UVFromIso;
		%feature("autodoc", "Tries a refinement of an already computed couple (u,v) by using projecting 3d point on iso-lines: 1. boundaries of the surface, 2. iso-lines passing through (u,v) 3. iteratively received iso-lines passing through new u and new v (number of iterations is limited by 5 in each direction) returns the best resulting distance between p3d and value(u,v) in the case of success. else, returns a very great value.

Parameters
----------
P3D: gp_Pnt
preci: float

Returns
-------
U: float
V: float
") UVFromIso;
		Standard_Real UVFromIso(const gp_Pnt & P3D, const Standard_Real preci, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** VCloseVal ******************/
		/**** md5 signature: b8919a074acc63a2b5cc3c96ab56f22f ****/
		%feature("compactdefaultargs") VCloseVal;
		%feature("autodoc", "Returns minimum value to consider the surface as v-closed.

Returns
-------
float
") VCloseVal;
		Standard_Real VCloseVal();

		/****************** VIso ******************/
		/**** md5 signature: ebe921330c7ad9c072516f16a826029a ****/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Returns a v-iso. null if not possible or failed remark : bound isos are buffered.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** Value ******************/
		/**** md5 signature: cbce9954c3f8356bc5ff7daec7cc3d73 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns a 3d point specified by parameters in surface parametrical space.

Parameters
----------
u: float
v: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real u, const Standard_Real v);

		/****************** Value ******************/
		/**** md5 signature: 0fe24f801581318aa93b8fb433b0846a ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns a 3d point specified by a point in surface parametrical space.

Parameters
----------
p2d: gp_Pnt2d

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const gp_Pnt2d & p2d);

		/****************** ValueOfUV ******************/
		/**** md5 signature: 30c2501f79ba8097c2637171078cf0f6 ****/
		%feature("compactdefaultargs") ValueOfUV;
		%feature("autodoc", "Computes the parameters in the surface parametrical space of 3d point. the result is parameters of the point projected onto the surface. this method enhances functionality provided by the standard tool geomapi_projectpointonsurface by treatment of cases when the projected point is near to the surface boundaries and when this standard tool fails.

Parameters
----------
P3D: gp_Pnt
preci: float

Returns
-------
gp_Pnt2d
") ValueOfUV;
		gp_Pnt2d ValueOfUV(const gp_Pnt & P3D, const Standard_Real preci);

};


%make_alias(ShapeAnalysis_Surface)

%extend ShapeAnalysis_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class ShapeAnalysis_TransferParameters *
*****************************************/
class ShapeAnalysis_TransferParameters : public Standard_Transient {
	public:
		/****************** ShapeAnalysis_TransferParameters ******************/
		/**** md5 signature: e478d03b43439148c5c85e4933eadb2d ****/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParameters;
		%feature("autodoc", "Creates empty tool with myshift = 0 and myscale = 1.

Returns
-------
None
") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters();

		/****************** ShapeAnalysis_TransferParameters ******************/
		/**** md5 signature: 35134c0d6d2075be25ca3b61e29d1a6b ****/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParameters;
		%feature("autodoc", "Creates a tool and initializes it with edge and face.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Init ******************/
		/**** md5 signature: ef2c331746b4da93a143b60fab0ba8d9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize a tool with edge and face.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Init;
		virtual void Init(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** IsSameRange ******************/
		/**** md5 signature: 99648b02a9860bd70f64a9d5370c88dc ****/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "Returns true if 3d curve of edge and pcurve are samerange (in default implementation, if myscale == 1 and myshift == 0).

Returns
-------
bool
") IsSameRange;
		virtual Standard_Boolean IsSameRange();

		/****************** Perform ******************/
		/**** md5 signature: 569a38113f890abeb573d5f03eff3bee ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Transfers parameters given by sequence params from 3d curve to pcurve (if to2d is true) or back (if to2d is false).

Parameters
----------
Params: TColStd_HSequenceOfReal
To2d: bool

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") Perform;
		virtual opencascade::handle<TColStd_HSequenceOfReal> Perform(const opencascade::handle<TColStd_HSequenceOfReal> & Params, const Standard_Boolean To2d);

		/****************** Perform ******************/
		/**** md5 signature: 219bbdcc68f6f7c5ccf614efead2dc54 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Transfers parameter given by sequence params from 3d curve to pcurve (if to2d is true) or back (if to2d is false).

Parameters
----------
Param: float
To2d: bool

Returns
-------
float
") Perform;
		virtual Standard_Real Perform(const Standard_Real Param, const Standard_Boolean To2d);

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: ab801fe49011ef1da17c304e1a6984da ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal tolerance to use linear recomputation of parameters.

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real maxtol);

		/****************** TransferRange ******************/
		/**** md5 signature: 48dc87038b2cb3597a7bacd486d3949a ****/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "Recomputes range of curves from newedge. if is2d equals true parameters are recomputed by curve2d else by curve3d.

Parameters
----------
newEdge: TopoDS_Edge
prevPar: float
currPar: float
To2d: bool

Returns
-------
None
") TransferRange;
		virtual void TransferRange(TopoDS_Edge & newEdge, const Standard_Real prevPar, const Standard_Real currPar, const Standard_Boolean To2d);

};


%make_alias(ShapeAnalysis_TransferParameters)

%extend ShapeAnalysis_TransferParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeAnalysis_Wire *
***************************/
class ShapeAnalysis_Wire : public Standard_Transient {
	public:
		/****************** ShapeAnalysis_Wire ******************/
		/**** md5 signature: cce979af71799d0af9492d8d05e74c7f ****/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire();

		/****************** ShapeAnalysis_Wire ******************/
		/**** md5 signature: ffbc3647ff20aed51e29b0e68f1b9b48 ****/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "Creates object with standard topods_wire, face and precision.

Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
precision: float

Returns
-------
None
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire(const TopoDS_Wire & wire, const TopoDS_Face & face, const Standard_Real precision);

		/****************** ShapeAnalysis_Wire ******************/
		/**** md5 signature: dae85a89d668b4972f6f80ec74417e75 ****/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "Creates the object with wiredata object, face and precision.

Parameters
----------
sbwd: ShapeExtend_WireData
face: TopoDS_Face
precision: float

Returns
-------
None
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire(const opencascade::handle<ShapeExtend_WireData> & sbwd, const TopoDS_Face & face, const Standard_Real precision);

		/****************** CheckClosed ******************/
		/**** md5 signature: c049a36b9fb9e1ba653b29bb7648cddf ****/
		%feature("compactdefaultargs") CheckClosed;
		%feature("autodoc", "Checks if wire is closed, performs checkconnected, checkdegenerated and checklacking for the first and the last edges returns: true if at least one check returned true status: fail1 or done1: see checkconnected fail2 or done2: see checkdegenerated.

Parameters
----------
prec: float,optional
	default value is 0.0

Returns
-------
bool
") CheckClosed;
		Standard_Boolean CheckClosed(const Standard_Real prec = 0.0);

		/****************** CheckConnected ******************/
		/**** md5 signature: af19f6a4d210c6631cae8c4163489f90 ****/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "Calls to checkconnected for each edge returns: true if at least one pair of disconnected edges (not sharing the same vertex) was detected.

Parameters
----------
prec: float,optional
	default value is 0.0

Returns
-------
bool
") CheckConnected;
		Standard_Boolean CheckConnected(const Standard_Real prec = 0.0);

		/****************** CheckConnected ******************/
		/**** md5 signature: abaeb0271f4e2c19ab97ef3799de3bfd ****/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "Checks connected edges (num-th and preceeding). tests with starting preci from <sbwd> or with <prec> if it is greater. considers vertices. returns: false if edges are connected by the common vertex, else true status : ok : vertices (end of num-1 th edge and start on num-th one) are already the same done1 : absolutely confused (gp::resolution) done2 : confused at starting <preci> from <sbwd> done3 : confused at <prec> but not <preci> fail1 : not confused fail2 : not confused but confused with <preci> if reverse num-th edge.

Parameters
----------
num: int
prec: float,optional
	default value is 0.0

Returns
-------
bool
") CheckConnected;
		Standard_Boolean CheckConnected(const Standard_Integer num, const Standard_Real prec = 0.0);

		/****************** CheckCurveGap ******************/
		/**** md5 signature: 5fa6f13569f3b55f1b6a53093f41a4fc ****/
		%feature("compactdefaultargs") CheckCurveGap;
		%feature("autodoc", "Checks gap between points on 3d curve and points on surface generated by pcurve of the num-th edge. the distance can be queried by mindistance3d. //! returns: true if status is done status: ok : gap is less than myprecision done : gap is greater than myprecision fail : no 3d curve(s) on the edge(s).

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
bool
") CheckCurveGap;
		Standard_Boolean CheckCurveGap(const Standard_Integer num = 0);

		/****************** CheckCurveGaps ******************/
		/**** md5 signature: 868735f423ab1e8b899d12d32c2e2d3c ****/
		%feature("compactdefaultargs") CheckCurveGaps;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CheckCurveGaps;
		Standard_Boolean CheckCurveGaps();

		/****************** CheckDegenerated ******************/
		/**** md5 signature: 7bfd145b6f006c99f2e59a712b4f8356 ****/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "Calls to checkdegenerated for each edge returns: true if at least one incorrect degenerated edge was detected.

Returns
-------
bool
") CheckDegenerated;
		Standard_Boolean CheckDegenerated();

		/****************** CheckDegenerated ******************/
		/**** md5 signature: 1fa1510ebdf1a3475b2c4f751616ed2a ****/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "Checks for degenerated edge between two adjacent ones. fills parameters dgnr1 and dgnr2 with points in paramterical space that correspond to the singularity (either gap that needs to be filled by degenerated edge or that already filled) returns: false if no singularity or edge is already degenerated, otherwise true status: ok : no surface singularity, or edge is already degenerated done1: degenerated edge should be inserted (gap in 2d) done2: edge <num> should be made degenerated (recompute pcurve and set the flag) fail1: one of edges neighbouring to degenerated one has no pcurve fail2: edge marked as degenerated and has no pcurve but singularity is not detected.

Parameters
----------
num: int
dgnr1: gp_Pnt2d
dgnr2: gp_Pnt2d

Returns
-------
bool
") CheckDegenerated;
		Standard_Boolean CheckDegenerated(const Standard_Integer num, gp_Pnt2d & dgnr1, gp_Pnt2d & dgnr2);

		/****************** CheckDegenerated ******************/
		/**** md5 signature: 3b6ebe420548c955a4d9aa0875ccbfd4 ****/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "Checks for degenerated edge between two adjacent ones. remark : calls previous function status : see the function above for details.

Parameters
----------
num: int

Returns
-------
bool
") CheckDegenerated;
		Standard_Boolean CheckDegenerated(const Standard_Integer num);

		/****************** CheckEdgeCurves ******************/
		/**** md5 signature: f765d450e50275b806856816ca07a0ce ****/
		%feature("compactdefaultargs") CheckEdgeCurves;
		%feature("autodoc", "Checks edges geometry (consitency of 2d and 3d senses, adjasment of curves to the vertices, etc.). the order of the checks : call shapeanalysis_wire to check: shapeanalysis_edge::checkcurve3dwithpcurve (1), shapeanalysis_edge::checkvertceswithpcurve (2), shapeanalysis_edge::checkvertceswithcurve3d (3), checkseam   (4) additional: checkgap3d  (5), checkgap2d  (6), shapeanalysis_edge::checksameparameter (7) returns: true if at least one check returned true remark: the numbers in brackets show with what donei or faili the status can be queried.

Returns
-------
bool
") CheckEdgeCurves;
		Standard_Boolean CheckEdgeCurves();

		/****************** CheckGap2d ******************/
		/**** md5 signature: 24f4a5e0b2b4a9af5acc632ecdd068d3 ****/
		%feature("compactdefaultargs") CheckGap2d;
		%feature("autodoc", "Checks gap between edges in 2d (pcurves). checks the distance between ends of pcurves of the num-th and preceeding edge. the distance can be queried by mindistance2d. //! returns: true if status is done status: ok : gap is less than parametric precision out of myprecision done : gap is greater than parametric precision out of myprecision fail : no pcurve(s) on the edge(s).

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
bool
") CheckGap2d;
		Standard_Boolean CheckGap2d(const Standard_Integer num = 0);

		/****************** CheckGap3d ******************/
		/**** md5 signature: ffb83a77fe32afc90de4b17a854712b9 ****/
		%feature("compactdefaultargs") CheckGap3d;
		%feature("autodoc", "Checks gap between edges in 3d (3d curves). checks the distance between ends of 3d curves of the num-th and preceeding edge. the distance can be queried by mindistance3d. //! returns: true if status is done status: ok : gap is less than myprecision done : gap is greater than myprecision fail : no 3d curve(s) on the edge(s).

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
bool
") CheckGap3d;
		Standard_Boolean CheckGap3d(const Standard_Integer num = 0);

		/****************** CheckGaps2d ******************/
		/**** md5 signature: 8410cfe06b9be03db82c22b21ff5c6c3 ****/
		%feature("compactdefaultargs") CheckGaps2d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CheckGaps2d;
		Standard_Boolean CheckGaps2d();

		/****************** CheckGaps3d ******************/
		/**** md5 signature: a0d70b63c85bc72ac2abc05d68972a68 ****/
		%feature("compactdefaultargs") CheckGaps3d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CheckGaps3d;
		Standard_Boolean CheckGaps3d();

		/****************** CheckIntersectingEdges ******************/
		/**** md5 signature: fddcf1c5324c54e2c483221ecc83134d ****/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "Checks two adjacent edges for intersecting. intersection is reported only if intersection point is not enclosed by the common end vertex of the edges. returns: true if intersection is found. if returns true it also fills the sequences of intersection points, corresponding 3d points, and errors for them (half-distances between intersection points in 3d calculated from one and from another edge) status: fail1 : no pcurve fail2 : no vertices done1 : self-intersection found.

Parameters
----------
num: int
points2d: IntRes2d_SequenceOfIntersectionPoint
points3d: TColgp_SequenceOfPnt
errors: TColStd_SequenceOfReal

Returns
-------
bool
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num, IntRes2d_SequenceOfIntersectionPoint & points2d, TColgp_SequenceOfPnt & points3d, TColStd_SequenceOfReal & errors);

		/****************** CheckIntersectingEdges ******************/
		/**** md5 signature: f391a41b1a78af6ec3a8c8d3350a1ce0 ****/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "Checks two adjacent edges for intersecting. remark : calls the previous method status : see the function above for details.

Parameters
----------
num: int

Returns
-------
bool
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num);

		/****************** CheckIntersectingEdges ******************/
		/**** md5 signature: 7f7647c46034ee073b7fc12bde95bba7 ****/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "Checks i-th and j-th edges for intersecting. remark : see the previous method for details.

Parameters
----------
num1: int
num2: int
points2d: IntRes2d_SequenceOfIntersectionPoint
points3d: TColgp_SequenceOfPnt
errors: TColStd_SequenceOfReal

Returns
-------
bool
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num1, const Standard_Integer num2, IntRes2d_SequenceOfIntersectionPoint & points2d, TColgp_SequenceOfPnt & points3d, TColStd_SequenceOfReal & errors);

		/****************** CheckIntersectingEdges ******************/
		/**** md5 signature: f20740aaee100f7e77b31f2e64a64c53 ****/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "Checks i-th and j-th edges for intersecting. remark : calls previous method. status : see the function above for details.

Parameters
----------
num1: int
num2: int

Returns
-------
bool
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num1, const Standard_Integer num2);

		/****************** CheckLacking ******************/
		/**** md5 signature: b9a150e87c8ddbaeb71fedfce81e0e0a ****/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "Calls to checklacking for each edge returns: true if at least one lacking edge was detected.

Returns
-------
bool
") CheckLacking;
		Standard_Boolean CheckLacking();

		/****************** CheckLacking ******************/
		/**** md5 signature: 46fb470311870e747acd5d1ce85dca8a ****/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "Checks if there is a gap in 2d between edges, not comprised by the tolerance of their common vertex. if <tolerance> is greater than 0. and less than tolerance of the vertex, then this value is used for check. returns: true if not closed gap was detected p2d1 and p2d2 are the endpoint of <num-1>th edge and start of the <num>th edge in 2d. status: ok: no edge is lacking (3d and 2d connection) fail1: edges have no vertices (at least one of them) fail2: edges are neither connected by common vertex, nor have coincided vertices fail1: edges have no pcurves done1: the gap is detected which cannot be closed by the tolerance of the common vertex (or with value of <tolerance>) done2: is set (together with done1) if gap is detected and the vector (p2d2 - p2d1) goes in direction opposite to the pcurves of the edges (if angle is more than 0.9*pi).

Parameters
----------
num: int
Tolerance: float
p2d1: gp_Pnt2d
p2d2: gp_Pnt2d

Returns
-------
bool
") CheckLacking;
		Standard_Boolean CheckLacking(const Standard_Integer num, const Standard_Real Tolerance, gp_Pnt2d & p2d1, gp_Pnt2d & p2d2);

		/****************** CheckLacking ******************/
		/**** md5 signature: 2206a679277c4649255f484456730ef6 ****/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "Checks if there is a gap in 2d between edges and not comprised by vertex tolerance the value of sbwd.thepreci is used. returns: false if no edge should be inserted status: ok : no edge is lacking (3d and 2d connection) done1 : the vertex tolerance should be increased only (2d gap is small) done2 : edge can be inserted (3d and 2d gaps are large enough).

Parameters
----------
num: int
Tolerance: float,optional
	default value is 0.0

Returns
-------
bool
") CheckLacking;
		Standard_Boolean CheckLacking(const Standard_Integer num, const Standard_Real Tolerance = 0.0);

		/****************** CheckLoop ******************/
		/**** md5 signature: c95ccb397df77c1565de7d6d15910099 ****/
		%feature("compactdefaultargs") CheckLoop;
		%feature("autodoc", "Checks existance of loop on wire and return vertices wich are loop vertices (vertices belonging to a few pairs of edges).

Parameters
----------
aMapLoopVertices: TopTools_IndexedMapOfShape
aMapVertexEdges: TopTools_DataMapOfShapeListOfShape
aMapSmallEdges: TopTools_MapOfShape
aMapSeemEdges: TopTools_MapOfShape

Returns
-------
bool
") CheckLoop;
		Standard_Boolean CheckLoop(TopTools_IndexedMapOfShape & aMapLoopVertices, TopTools_DataMapOfShapeListOfShape & aMapVertexEdges, TopTools_MapOfShape & aMapSmallEdges, TopTools_MapOfShape & aMapSeemEdges);

		/****************** CheckNotchedEdges ******************/
		/**** md5 signature: fa138234ce28880d741cf30db7ee496f ****/
		%feature("compactdefaultargs") CheckNotchedEdges;
		%feature("autodoc", "Detects a notch.

Parameters
----------
num: int
Tolerance: float,optional
	default value is 0.0

Returns
-------
shortNum: int
param: float
") CheckNotchedEdges;
		Standard_Boolean CheckNotchedEdges(const Standard_Integer num, Standard_Integer &OutValue, Standard_Real &OutValue, const Standard_Real Tolerance = 0.0);

		/****************** CheckOrder ******************/
		/**** md5 signature: 0c24436001ebd425c86bdc68dbe4c3c5 ****/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "Calls checkorder and returns false if wire is already ordered (tail-to-head), true otherwise flag <isclosed> defines if the wire is closed or not flag <mode3d> defines which mode is used (3d or 2d).

Parameters
----------
isClosed: bool,optional
	default value is Standard_True
mode3d: bool,optional
	default value is Standard_True

Returns
-------
bool
") CheckOrder;
		Standard_Boolean CheckOrder(const Standard_Boolean isClosed = Standard_True, const Standard_Boolean mode3d = Standard_True);

		/****************** CheckOrder ******************/
		/**** md5 signature: a2e2eaf75d1e119872f29bc306daff0b ****/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "Analyzes the order of the edges in the wire, uses class wireorder for that purpose. flag <isclosed> defines if the wire is closed or not flag <mode3d> defines which mode is used (3d or 2d) returns false if wire is already ordered (tail-to-head), true otherwise. use returned wireorder object for deeper analysis. status: ok : the same edges orientation, the same edges sequence done1: the same edges orientation, not the same edges sequence done2: as done1 and gaps more than myprecision done3: not the same edges orientation (some need to be reversed) done4: as done3 and gaps more than myprecision fail : algorithm failed (could not detect order).

Parameters
----------
sawo: ShapeAnalysis_WireOrder
isClosed: bool,optional
	default value is Standard_True
mode3d: bool,optional
	default value is Standard_True

Returns
-------
bool
") CheckOrder;
		Standard_Boolean CheckOrder(ShapeAnalysis_WireOrder & sawo, const Standard_Boolean isClosed = Standard_True, const Standard_Boolean mode3d = Standard_True);

		/****************** CheckOuterBound ******************/
		/**** md5 signature: fa98a8de9235f276333826373de925cc ****/
		%feature("compactdefaultargs") CheckOuterBound;
		%feature("autodoc", "Checks if wire defines an outer bound on the face uses shapeanalysis::isouterbound for analysis if <apimake> is true uses brepapi_makewire to build the wire, if false (to be used only when edges share common vertices) uses brep_builder to build the wire.

Parameters
----------
APIMake: bool,optional
	default value is Standard_True

Returns
-------
bool
") CheckOuterBound;
		Standard_Boolean CheckOuterBound(const Standard_Boolean APIMake = Standard_True);

		/****************** CheckSeam ******************/
		/**** md5 signature: 3e220d590fcf51314c04169f7c36b88c ****/
		%feature("compactdefaultargs") CheckSeam;
		%feature("autodoc", "Checks if a seam pcurves are correct oriented returns: false (status ok) if given edge is not a seam or if it is ok c1 - current pcurve for forward edge, c2 - current pcurve for reversed edge (if returns true they should be swapped for the seam), cf, cl - first and last parameters on curves status: ok : pcurves are correct or edge is not seam done : seam pcurves should be swapped.

Parameters
----------
num: int
C1: Geom2d_Curve
C2: Geom2d_Curve

Returns
-------
cf: float
cl: float
") CheckSeam;
		Standard_Boolean CheckSeam(const Standard_Integer num, opencascade::handle<Geom2d_Curve> & C1, opencascade::handle<Geom2d_Curve> & C2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CheckSeam ******************/
		/**** md5 signature: f6efbc8a6369b2127add9abc08f468a7 ****/
		%feature("compactdefaultargs") CheckSeam;
		%feature("autodoc", "Checks if a seam pcurves are correct oriented see previous functions for details.

Parameters
----------
num: int

Returns
-------
bool
") CheckSeam;
		Standard_Boolean CheckSeam(const Standard_Integer num);

		/****************** CheckSelfIntersectingEdge ******************/
		/**** md5 signature: 3e1cfb25605cda3e634c2fe6a570e449 ****/
		%feature("compactdefaultargs") CheckSelfIntersectingEdge;
		%feature("autodoc", "Checks if num-th edge is self-intersecting. self-intersection is reported only if intersection point lies outside of both end vertices of the edge. returns: true if edge is self-intersecting. if returns true it also fills the sequences of intersection points and corresponding 3d points (only that are not enclosed by a vertices) status: fail1 : no pcurve fail2 : no vertices done1 : self-intersection found.

Parameters
----------
num: int
points2d: IntRes2d_SequenceOfIntersectionPoint
points3d: TColgp_SequenceOfPnt

Returns
-------
bool
") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge(const Standard_Integer num, IntRes2d_SequenceOfIntersectionPoint & points2d, TColgp_SequenceOfPnt & points3d);

		/****************** CheckSelfIntersectingEdge ******************/
		/**** md5 signature: f867bf45439d9b4871e37a6621b4cdc0 ****/
		%feature("compactdefaultargs") CheckSelfIntersectingEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
bool
") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge(const Standard_Integer num);

		/****************** CheckSelfIntersection ******************/
		/**** md5 signature: 828f8e26a77ac090be6a96994828b03d ****/
		%feature("compactdefaultargs") CheckSelfIntersection;
		%feature("autodoc", "Checks self-intersection of the wire (considering pcurves) looks for self-intersecting edges and each pair of intersecting edges. warning: it does not check each edge with any other one (only each two adjacent edges) the order of the checks : checkselfintersectingedge, checkintersectingedges returns: true if at least one check returned true status: fail1 or done1 - see checkselfintersectingedge fail2 or done2 - see checkintersectingedges.

Returns
-------
bool
") CheckSelfIntersection;
		Standard_Boolean CheckSelfIntersection();

		/****************** CheckShapeConnect ******************/
		/**** md5 signature: 0a79b66d7b431d4b26c20c6461576e0b ****/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "Checks with what orientation <shape> (wire or edge) can be connected to the wire. tests distances with starting <preci> from <sbwd> (close confusion), but if given <prec> is greater, tests with <prec> (coarse confusion). the smallest found distance can be returned by mindistance3d //! returns: false if status is fail (see below) status: done1 : if <shape> follows <sbwd>, direct sense (normal) done2 : if <shape> follows <sbwd>, but if reversed done3 : if <shape> preceeds <sbwd>, direct sense done4 : if <shape> preceeds <sbwd>, but if reversed fail1 : if <shape> is neither an edge nor a wire fail2 : if <shape> cannot be connected to <sbwd> //! done5 : to the tail of <sbwd> the <shape> is closer with direct sense done6 : to the head of <sbwd> the <shape> is closer with direct sense //! remark: statuses done1 - done4, fail1 - fail2 are basic and describe the nearest connection of the <shape> to <sbwd>. statuses done5 and done6 are advanced and are to be used when analyzing with what sense (direct or reversed) the <shape> should be connected to <sbwd>: for tail of <sbwd> if done4 is true <shape> should be direct, otherwise reversed. for head of <sbwd> if done5 is true <shape> should be direct, otherwise reversed.

Parameters
----------
shape: TopoDS_Shape
prec: float,optional
	default value is 0.0

Returns
-------
bool
") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect(const TopoDS_Shape & shape, const Standard_Real prec = 0.0);

		/****************** CheckShapeConnect ******************/
		/**** md5 signature: 0b1571f9c750cbf62d65d5a450d12b85 ****/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "The same as previous checkshapeconnect but is more advanced. it returns the distances between each end of <sbwd> and each end of <shape>. for example, <tailhead> stores distance between tail of <sbwd> and head of <shape> remark: first method checkshapeconnect calls this one.

Parameters
----------
shape: TopoDS_Shape
prec: float,optional
	default value is 0.0

Returns
-------
tailhead: float
tailtail: float
headtail: float
headhead: float
") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const TopoDS_Shape & shape, const Standard_Real prec = 0.0);

		/****************** CheckSmall ******************/
		/**** md5 signature: 5573c69b574523f74c4f89bcac123cff ****/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "Calls to checksmall for each edge returns: true if at least one small edge was detected.

Parameters
----------
precsmall: float,optional
	default value is 0.0

Returns
-------
bool
") CheckSmall;
		Standard_Boolean CheckSmall(const Standard_Real precsmall = 0.0);

		/****************** CheckSmall ******************/
		/**** md5 signature: 920ff3411d0f144713715d87d6f71556 ****/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "Checks if an edge has a length not greater than mypreci or precsmall (if it is smaller) returns: false if its length is greater than precision status: ok : edge is not small or degenerated done1: edge is small, vertices are the same done2: edge is small, vertices are not the same fail : no 3d curve and pcurve.

Parameters
----------
num: int
precsmall: float,optional
	default value is 0.0

Returns
-------
bool
") CheckSmall;
		Standard_Boolean CheckSmall(const Standard_Integer num, const Standard_Real precsmall = 0.0);

		/****************** CheckSmallArea ******************/
		/**** md5 signature: e3d75b4d4d23e31912c108414bc6189c ****/
		%feature("compactdefaultargs") CheckSmallArea;
		%feature("autodoc", "Checks if wire has parametric area less than precision.

Parameters
----------
theWire: TopoDS_Wire

Returns
-------
bool
") CheckSmallArea;
		Standard_Boolean CheckSmallArea(const TopoDS_Wire & theWire);

		/****************** CheckTail ******************/
		/**** md5 signature: 321fb81a600bd5e9a348e9ae3975c76a ****/
		%feature("compactdefaultargs") CheckTail;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
theMaxSine: float
theMaxWidth: float
theMaxTolerance: float
theEdge11: TopoDS_Edge
theEdge12: TopoDS_Edge
theEdge21: TopoDS_Edge
theEdge22: TopoDS_Edge

Returns
-------
bool
") CheckTail;
		Standard_Boolean CheckTail(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const Standard_Real theMaxSine, const Standard_Real theMaxWidth, const Standard_Real theMaxTolerance, TopoDS_Edge & theEdge11, TopoDS_Edge & theEdge12, TopoDS_Edge & theEdge21, TopoDS_Edge & theEdge22);

		/****************** ClearStatuses ******************/
		/**** md5 signature: a36409698de6df03133c5f14bec35cf8 ****/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "Unsets all the status and distance fields wire, face and precision are not cleared.

Returns
-------
None
") ClearStatuses;
		void ClearStatuses();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the working face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		/**** md5 signature: 68dad83539fb82c5a5e93add092d0610 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the object with standard topods_wire, face and precision.

Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
precision: float

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & wire, const TopoDS_Face & face, const Standard_Real precision);

		/****************** Init ******************/
		/**** md5 signature: 11ec60f70bd155e35a6abf335e18eb63 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the object with wiredata object, face and precision.

Parameters
----------
sbwd: ShapeExtend_WireData
face: TopoDS_Face
precision: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & sbwd, const TopoDS_Face & face, const Standard_Real precision);

		/****************** IsLoaded ******************/
		/**** md5 signature: 5ed802f56c3a94dc70391badb380a6ed ****/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Returns true if wire is loaded and has number of edges >0.

Returns
-------
bool
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****************** IsReady ******************/
		/**** md5 signature: 68a96b040fc0b59848125a1a3ef33dcb ****/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Returns true if isloaded and underlying face is not null.

Returns
-------
bool
") IsReady;
		Standard_Boolean IsReady();

		/****************** LastCheckStatus ******************/
		/**** md5 signature: 51a8334fdef2c5ed71ca2129b25a052b ****/
		%feature("compactdefaultargs") LastCheckStatus;
		%feature("autodoc", "Querying the status of the last perfomed 'advanced' checking procedure.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") LastCheckStatus;
		Standard_Boolean LastCheckStatus(const ShapeExtend_Status Status);

		/****************** Load ******************/
		/**** md5 signature: 2fdca06c20821b51a2c36237ba0af41b ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads the object with standard topods_wire.

Parameters
----------
wire: TopoDS_Wire

Returns
-------
None
") Load;
		void Load(const TopoDS_Wire & wire);

		/****************** Load ******************/
		/**** md5 signature: 16e0e231784ecdcbd10a3dadfc16b8d6 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads the object with wiredata object.

Parameters
----------
sbwd: ShapeExtend_WireData

Returns
-------
None
") Load;
		void Load(const opencascade::handle<ShapeExtend_WireData> & sbwd);

		/****************** MaxDistance2d ******************/
		/**** md5 signature: 7dd9f555060a06797b716d88f0343b12 ****/
		%feature("compactdefaultargs") MaxDistance2d;
		%feature("autodoc", "Returns the last maximal distance in 2d-uv computed by checkcontinuity2d.

Returns
-------
float
") MaxDistance2d;
		Standard_Real MaxDistance2d();

		/****************** MaxDistance3d ******************/
		/**** md5 signature: cf45bbfcae90a0b146267435ebec2958 ****/
		%feature("compactdefaultargs") MaxDistance3d;
		%feature("autodoc", "Returns the last maximal distance in 3d computed by checkorientation, checkconnected, checkcontinuity3d, checkvertex, checknewvertex, checksameparameter.

Returns
-------
float
") MaxDistance3d;
		Standard_Real MaxDistance3d();

		/****************** MinDistance2d ******************/
		/**** md5 signature: 8a48ed473b0d51a316aea751627b5127 ****/
		%feature("compactdefaultargs") MinDistance2d;
		%feature("autodoc", "Returns the last lowest distance in 2d-uv computed by checkcontinuity2d.

Returns
-------
float
") MinDistance2d;
		Standard_Real MinDistance2d();

		/****************** MinDistance3d ******************/
		/**** md5 signature: 3fff8e0c66577dd711e9ba64f1975381 ****/
		%feature("compactdefaultargs") MinDistance3d;
		%feature("autodoc", "Returns the last lowest distance in 3d computed by checkorientation, checkconnected, checkcontinuity3d, checkvertex, checknewvertex.

Returns
-------
float
") MinDistance3d;
		Standard_Real MinDistance3d();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edges in the wire, or 0 if it is not loaded.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** Perform ******************/
		/**** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs all the checks in the following order : checkorder, checksmall, checkconected, checkedgecurves, checkdegenerated, checkselfintersection, checklacking, checkclosed returns: true if at least one method returned true; for deeper analysis use status...(status) methods.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

		/****************** Precision ******************/
		/**** md5 signature: 34c7e39bd57a685873eea74fa4629747 ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns the value of precision.

Returns
-------
float
") Precision;
		Standard_Real Precision();

		/****************** SetFace ******************/
		/**** md5 signature: ad791c3e7afa47c0cda20c76d19a66b4 ****/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Loads the face the wire lies on.

Parameters
----------
face: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & face);

		/****************** SetPrecision ******************/
		/**** md5 signature: e3b8a71e74ae511a0d07cc55d5930b63 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "No available documentation.

Parameters
----------
precision: float

Returns
-------
None
") SetPrecision;
		void SetPrecision(const Standard_Real precision);

		/****************** SetSurface ******************/
		/**** md5 signature: 3ac5100009a432b14cb9404ac523d9ec ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Loads the surface the wire lies on.

Parameters
----------
surface: Geom_Surface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surface);

		/****************** SetSurface ******************/
		/**** md5 signature: fbd30086fe99f723922515229a71cc75 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Loads the surface the wire lies on.

Parameters
----------
surface: Geom_Surface
location: TopLoc_Location

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****************** StatusClosed ******************/
		/**** md5 signature: 397ec850ca398b7fd0a894a002d47198 ****/
		%feature("compactdefaultargs") StatusClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusClosed;
		Standard_Boolean StatusClosed(const ShapeExtend_Status Status);

		/****************** StatusConnected ******************/
		/**** md5 signature: 778e67ce9161a6c5b336734febb775f3 ****/
		%feature("compactdefaultargs") StatusConnected;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusConnected;
		Standard_Boolean StatusConnected(const ShapeExtend_Status Status);

		/****************** StatusCurveGaps ******************/
		/**** md5 signature: 615d7aa6851d43464e3e5ed3fde9cba6 ****/
		%feature("compactdefaultargs") StatusCurveGaps;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusCurveGaps;
		Standard_Boolean StatusCurveGaps(const ShapeExtend_Status Status);

		/****************** StatusDegenerated ******************/
		/**** md5 signature: 83150213c249c7e49e122df8861b868c ****/
		%feature("compactdefaultargs") StatusDegenerated;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusDegenerated;
		Standard_Boolean StatusDegenerated(const ShapeExtend_Status Status);

		/****************** StatusEdgeCurves ******************/
		/**** md5 signature: 7db5a16b2f75f1f3c8e3020d7471e69b ****/
		%feature("compactdefaultargs") StatusEdgeCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves(const ShapeExtend_Status Status);

		/****************** StatusGaps2d ******************/
		/**** md5 signature: 1f5eabaad5dc9661856b002b6e183eee ****/
		%feature("compactdefaultargs") StatusGaps2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusGaps2d;
		Standard_Boolean StatusGaps2d(const ShapeExtend_Status Status);

		/****************** StatusGaps3d ******************/
		/**** md5 signature: 825f4f566e8fba4e295cd4bec34c5c53 ****/
		%feature("compactdefaultargs") StatusGaps3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusGaps3d;
		Standard_Boolean StatusGaps3d(const ShapeExtend_Status Status);

		/****************** StatusLacking ******************/
		/**** md5 signature: 52ad411d37899450cdc3de41cf0e88fc ****/
		%feature("compactdefaultargs") StatusLacking;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusLacking;
		Standard_Boolean StatusLacking(const ShapeExtend_Status Status);

		/****************** StatusLoop ******************/
		/**** md5 signature: fad1872c07eb0301e971a36d93da478e ****/
		%feature("compactdefaultargs") StatusLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusLoop;
		Standard_Boolean StatusLoop(const ShapeExtend_Status Status);

		/****************** StatusOrder ******************/
		/**** md5 signature: 5ff6f9a9e3f6f4cb2f5b7fcce399309e ****/
		%feature("compactdefaultargs") StatusOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusOrder;
		Standard_Boolean StatusOrder(const ShapeExtend_Status Status);

		/****************** StatusSelfIntersection ******************/
		/**** md5 signature: bccc7d7d1b860f4aeb57ab0f15684134 ****/
		%feature("compactdefaultargs") StatusSelfIntersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection(const ShapeExtend_Status Status);

		/****************** StatusSmall ******************/
		/**** md5 signature: 946de8888b815d7dc1018b04a0e6371a ****/
		%feature("compactdefaultargs") StatusSmall;
		%feature("autodoc", "No available documentation.

Parameters
----------
Status: ShapeExtend_Status

Returns
-------
bool
") StatusSmall;
		Standard_Boolean StatusSmall(const ShapeExtend_Status Status);

		/****************** Surface ******************/
		/**** md5 signature: 218f80180f9895a3f4012d683258cf67 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the working surface.

Returns
-------
opencascade::handle<ShapeAnalysis_Surface>
") Surface;
		const opencascade::handle<ShapeAnalysis_Surface> & Surface();

		/****************** WireData ******************/
		/**** md5 signature: c8792f073dea4df1af697814fbf5f311 ****/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Returns wire object being analyzed.

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData();

};


%make_alias(ShapeAnalysis_Wire)

%extend ShapeAnalysis_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ShapeAnalysis_WireOrder *
********************************/
class ShapeAnalysis_WireOrder {
	public:
		/****************** ShapeAnalysis_WireOrder ******************/
		/**** md5 signature: 001651a67bf407b71fcd46ae3b8b54a3 ****/
		%feature("compactdefaultargs") ShapeAnalysis_WireOrder;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder();

		/****************** ShapeAnalysis_WireOrder ******************/
		/**** md5 signature: 7ba3558c4d0e2c01260ab61f9a5b9adb ****/
		%feature("compactdefaultargs") ShapeAnalysis_WireOrder;
		%feature("autodoc", "Creates a wireorder in 3d (if mode3d is true) or 2d (if false) with a tolerance.

Parameters
----------
mode3d: bool
tol: float

Returns
-------
None
") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder(const Standard_Boolean mode3d, const Standard_Real tol);

		/****************** Add ******************/
		/**** md5 signature: c594d7a0f5591d51480bf9a89b733e4d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a couple of points 3d (start,end).

Parameters
----------
start3d: gp_XYZ
end3d: gp_XYZ

Returns
-------
None
") Add;
		void Add(const gp_XYZ & start3d, const gp_XYZ & end3d);

		/****************** Add ******************/
		/**** md5 signature: 8de64abf7dc8e839fe1f10f9fe02790a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a couple of points 2d (start,end).

Parameters
----------
start2d: gp_XY
end2d: gp_XY

Returns
-------
None
") Add;
		void Add(const gp_XY & start2d, const gp_XY & end2d);

		/****************** Chain ******************/
		/**** md5 signature: 5a804521be62174818d234e9543ffe87 ****/
		%feature("compactdefaultargs") Chain;
		%feature("autodoc", "Returns, for the chain n0 num, starting and ending numbers of edges. in the list of ordered edges (see ordered for originals).

Parameters
----------
num: int

Returns
-------
n1: int
n2: int
") Chain;
		void Chain(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of edges, but not mode and tol.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Couple ******************/
		/**** md5 signature: 2a340a10e5a036164b759e5917463d42 ****/
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "Returns, for the couple n0 num, the two implied edges in the list of ordered edges.

Parameters
----------
num: int

Returns
-------
n1: int
n2: int
") Couple;
		void Couple(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Gap ******************/
		/**** md5 signature: 367d72f7f9d9f8ac382afd0e4369ad2c ****/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Returns the gap between a couple and its preceeding <num> is considered ordered if <num> = 0 (d), returns the greatest gap found.

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
float
") Gap;
		Standard_Real Gap(const Standard_Integer num = 0);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Tells if perform has been done else, the following methods returns original values.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetKeepLoopsMode() {
            return (Standard_Boolean) $self->KeepLoopsMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetKeepLoopsMode(Standard_Boolean value) {
            $self->KeepLoopsMode()=value;
            }
        };
		/****************** NbChains ******************/
		/**** md5 signature: d1b0201e9b14205fe927c9a01e044ab3 ****/
		%feature("compactdefaultargs") NbChains;
		%feature("autodoc", "Returns the count of computed chains.

Returns
-------
int
") NbChains;
		Standard_Integer NbChains();

		/****************** NbCouples ******************/
		/**** md5 signature: 8136e94ad4eb50396f3e8640b01713e3 ****/
		%feature("compactdefaultargs") NbCouples;
		%feature("autodoc", "Returns the count of computed couples.

Returns
-------
int
") NbCouples;
		Standard_Integer NbCouples();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the count of added couples of points (one per edges).

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** Ordered ******************/
		/**** md5 signature: 0344e7c24208d035518227431c148714 ****/
		%feature("compactdefaultargs") Ordered;
		%feature("autodoc", "Returns the number of original edge which correspond to the newly ordered number <n> warning : the returned value is negative if edge should be reversed.

Parameters
----------
n: int

Returns
-------
int
") Ordered;
		Standard_Integer Ordered(const Standard_Integer n);

		/****************** Perform ******************/
		/**** md5 signature: 076cdff70150a5d09e5d54a72cb0d21a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the better order if <closed> is true (d) considers also closure optimised if the couples were already in order the criterium is : two couples in order if distance between end-prec and start-cur is less then starting tolerance <tol> else, the smallest distance is reached gap corresponds to a smallest distance greater than <tol>.

Parameters
----------
closed: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean closed = Standard_True);

		/****************** SetChains ******************/
		/**** md5 signature: dbd76054f8e57d3c27a853a9a2aceb72 ****/
		%feature("compactdefaultargs") SetChains;
		%feature("autodoc", "Determines the chains inside which successive edges have a gap less than a given value. queried by nbchains and chain.

Parameters
----------
gap: float

Returns
-------
None
") SetChains;
		void SetChains(const Standard_Real gap);

		/****************** SetCouples ******************/
		/**** md5 signature: a10a2fc2bfd71b64ba1ba3a44e57e444 ****/
		%feature("compactdefaultargs") SetCouples;
		%feature("autodoc", "Determines the couples of edges for which end and start fit inside a given gap. queried by nbcouples and couple.

Parameters
----------
gap: float

Returns
-------
None
") SetCouples;
		void SetCouples(const Standard_Real gap);

		/****************** SetMode ******************/
		/**** md5 signature: ba0fdbb4cb9a7fffbf1cee2688fbb2ce ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets new values. clears the connexion list if <mode3d> changes, also clears the edge list (else, doesnt).

Parameters
----------
mode3d: bool
tol: float

Returns
-------
None
") SetMode;
		void SetMode(const Standard_Boolean mode3d, const Standard_Real tol);

		/****************** Status ******************/
		/**** md5 signature: 95453a41824a64084ab7e8075846ede5 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of the order (0 if not done) : 0 : all edges are direct and in sequence 1 : all edges are direct but some are not in sequence 2 : in addition, unresolved gaps remain -1 : some edges are reversed, but no gap remain -2 : some edges are reversed and some gaps remain -10 : could not be resolved, failure on reorder gap : regarding starting <tol>.

Returns
-------
int
") Status;
		Standard_Integer Status();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the working tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** XY ******************/
		/**** md5 signature: cc8eac1d4cceca0ab81542864d197b96 ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Returns the values of the couple <num>, as 2d values.

Parameters
----------
num: int
start2d: gp_XY
end2d: gp_XY

Returns
-------
None
") XY;
		void XY(const Standard_Integer num, gp_XY & start2d, gp_XY & end2d);

		/****************** XYZ ******************/
		/**** md5 signature: 5231a95bc657ee715aaac556f4c4b645 ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Returns the values of the couple <num>, as 3d values.

Parameters
----------
num: int
start3d: gp_XYZ
end3d: gp_XYZ

Returns
-------
None
") XYZ;
		void XYZ(const Standard_Integer num, gp_XYZ & start3d, gp_XYZ & end3d);

};


%extend ShapeAnalysis_WireOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeAnalysis_WireVertex *
*********************************/
class ShapeAnalysis_WireVertex {
	public:
		/****************** ShapeAnalysis_WireVertex ******************/
		/**** md5 signature: 444b04297e14f11e95d21a75cdc9e8a3 ****/
		%feature("compactdefaultargs") ShapeAnalysis_WireVertex;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAnalysis_WireVertex;
		 ShapeAnalysis_WireVertex();

		/****************** Analyze ******************/
		/**** md5 signature: fb838ab94d167046cb960d898ad849da ****/
		%feature("compactdefaultargs") Analyze;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Analyze;
		void Analyze();

		/****************** Data ******************/
		/**** md5 signature: ebe1966f41fb4acf2b591d40ed683c05 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the recorded status for a vertex with its recorded position and parameters on both edges these values are relevant regarding the status: status meaning position preceeding following 0 same no no no 1 samecoord no no no 2 close no no no 3 end yes no yes 4 start yes yes no 5 inters yes yes yes -1 disjoined no no no.

Parameters
----------
num: int
pos: gp_XYZ

Returns
-------
upre: float
ufol: float
") Data;
		Standard_Integer Data(const Standard_Integer num, gp_XYZ & pos, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: ce6401735f705d8382645a726c79e907 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
wire: TopoDS_Wire
preci: float

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & wire, const Standard_Real preci);

		/****************** Init ******************/
		/**** md5 signature: 76c5d44fec2bd90d7a469781424ff530 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
swbd: ShapeExtend_WireData
preci: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & swbd, const Standard_Real preci);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if analysis was performed, else returns false.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		/**** md5 signature: 2fdca06c20821b51a2c36237ba0af41b ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
wire: TopoDS_Wire

Returns
-------
None
") Load;
		void Load(const TopoDS_Wire & wire);

		/****************** Load ******************/
		/**** md5 signature: 16e0e231784ecdcbd10a3dadfc16b8d6 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
sbwd: ShapeExtend_WireData

Returns
-------
None
") Load;
		void Load(const opencascade::handle<ShapeExtend_WireData> & sbwd);

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edges in analyzed wire (i.e. the length of all arrays).

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NextCriter ******************/
		/**** md5 signature: 8d20f809415da8f7521c50560380badb ****/
		%feature("compactdefaultargs") NextCriter;
		%feature("autodoc", "For a given criter, returns the rank of the vertex which follows <num> and has the same status. 0 if no more acts as an iterator, starts on the first one criters are: 0: same vertex (status 0) 1: a solution exists (status >= 0) 2: same coords (i.e. same params) (status 0 1 2) 3: same coods but not same vertex (status 1 2) 4: redefined coords (status 3 4 5) -1: no solution (status -1).

Parameters
----------
crit: int
num: int,optional
	default value is 0

Returns
-------
int
") NextCriter;
		Standard_Integer NextCriter(const Standard_Integer crit, const Standard_Integer num = 0);

		/****************** NextStatus ******************/
		/**** md5 signature: b6638b4681eae9cc19224bb9aed78215 ****/
		%feature("compactdefaultargs") NextStatus;
		%feature("autodoc", "For a given status, returns the rank of the vertex which follows <num> and has the same status. 0 if no more acts as an iterator, starts on the first one.

Parameters
----------
stat: int
num: int,optional
	default value is 0

Returns
-------
int
") NextStatus;
		Standard_Integer NextStatus(const Standard_Integer stat, const Standard_Integer num = 0);

		/****************** Position ******************/
		/**** md5 signature: f9981d08b82f33639f27e8c71acde75d ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
gp_XYZ
") Position;
		gp_XYZ Position(const Standard_Integer num);

		/****************** Precision ******************/
		/**** md5 signature: 34c7e39bd57a685873eea74fa4629747 ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns precision value used in analysis.

Returns
-------
float
") Precision;
		Standard_Real Precision();

		/****************** SetClose ******************/
		/**** md5 signature: c3009edf142ec6f875d8378bfdca0af8 ****/
		%feature("compactdefaultargs") SetClose;
		%feature("autodoc", "Records status 'close coords' (at the precision of <self>).

Parameters
----------
num: int

Returns
-------
None
") SetClose;
		void SetClose(const Standard_Integer num);

		/****************** SetDisjoined ******************/
		/**** md5 signature: a40c9d24ea6472d55c9cee7bb946d2a1 ****/
		%feature("compactdefaultargs") SetDisjoined;
		%feature("autodoc", "<num> cannot be said as same vertex.

Parameters
----------
num: int

Returns
-------
None
") SetDisjoined;
		void SetDisjoined(const Standard_Integer num);

		/****************** SetEnd ******************/
		/**** md5 signature: c7fabda1b23b9b9674f25e44bc282ae3 ****/
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "<num> is the end of preceeding edge, and its projection on the following one lies on it at the precision of <self> <ufol> gives the parameter on the following edge.

Parameters
----------
num: int
pos: gp_XYZ
ufol: float

Returns
-------
None
") SetEnd;
		void SetEnd(const Standard_Integer num, const gp_XYZ & pos, const Standard_Real ufol);

		/****************** SetInters ******************/
		/**** md5 signature: fe3d221c509ef08f54b84f9770f207e3 ****/
		%feature("compactdefaultargs") SetInters;
		%feature("autodoc", "<num> is the intersection of both edges <upre> is the parameter on preceeding edge, <ufol> on following edge.

Parameters
----------
num: int
pos: gp_XYZ
upre: float
ufol: float

Returns
-------
None
") SetInters;
		void SetInters(const Standard_Integer num, const gp_XYZ & pos, const Standard_Real upre, const Standard_Real ufol);

		/****************** SetPrecision ******************/
		/**** md5 signature: a601cf881702916ad1a5bcd1fec314c4 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets the precision for work analysing: for each vertex, comparison between the end of the preceeding edge and the start of the following edge each vertex rank corresponds to the end vertex of the edge of same rank, in the shapeextend_wiredata. i.e. for vertex <num>, edge <num> is the preceeding one, <num+1> is the following one.

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		void SetPrecision(const Standard_Real preci);

		/****************** SetSameCoords ******************/
		/**** md5 signature: 342c4783b9bbe5879b60d8401f809824 ****/
		%feature("compactdefaultargs") SetSameCoords;
		%feature("autodoc", "Records status 'same coords' (at the vertices tolerances).

Parameters
----------
num: int

Returns
-------
None
") SetSameCoords;
		void SetSameCoords(const Standard_Integer num);

		/****************** SetSameVertex ******************/
		/**** md5 signature: 076a84d63f82cbff4929d872c559a795 ****/
		%feature("compactdefaultargs") SetSameVertex;
		%feature("autodoc", "Records status 'same vertex' (logically) on vertex <num>.

Parameters
----------
num: int

Returns
-------
None
") SetSameVertex;
		void SetSameVertex(const Standard_Integer num);

		/****************** SetStart ******************/
		/**** md5 signature: 1b976331febdffff9819237d0da2d19b ****/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "<num> is the start of following edge, its projection on the preceeding one lies on it at the precision of <self> <upre> gives the parameter on the preceeding edge.

Parameters
----------
num: int
pos: gp_XYZ
upre: float

Returns
-------
None
") SetStart;
		void SetStart(const Standard_Integer num, const gp_XYZ & pos, const Standard_Real upre);

		/****************** Status ******************/
		/**** md5 signature: fe83936279a1a53fbd5bae4ee4fd0684 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the recorded status for a vertex more detail by method data.

Parameters
----------
num: int

Returns
-------
int
") Status;
		Standard_Integer Status(const Standard_Integer num);

		/****************** UFollowing ******************/
		/**** md5 signature: 6cb314fd1e9b110d50f5297ae810bcfb ****/
		%feature("compactdefaultargs") UFollowing;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
float
") UFollowing;
		Standard_Real UFollowing(const Standard_Integer num);

		/****************** UPrevious ******************/
		/**** md5 signature: 987cbdeff9f2aa95add4bb35a6575252 ****/
		%feature("compactdefaultargs") UPrevious;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
float
") UPrevious;
		Standard_Real UPrevious(const Standard_Integer num);

		/****************** WireData ******************/
		/**** md5 signature: c8792f073dea4df1af697814fbf5f311 ****/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Returns analyzed wire.

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData();

};


%extend ShapeAnalysis_WireVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class ShapeAnalysis_BoxBndTreeSelector *
*****************************************/
/*********************************************
* class ShapeAnalysis_TransferParametersProj *
*********************************************/
class ShapeAnalysis_TransferParametersProj : public ShapeAnalysis_TransferParameters {
	public:
		/****************** ShapeAnalysis_TransferParametersProj ******************/
		/**** md5 signature: 05907c49624548dfe8719171abdd39c5 ****/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParametersProj;
		%feature("autodoc", "Creats empty constructor.

Returns
-------
None
") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj();

		/****************** ShapeAnalysis_TransferParametersProj ******************/
		/**** md5 signature: c3846ac7e9f414d4e4ed6ff260e1e218 ****/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParametersProj;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** CopyNMVertex ******************/
		/**** md5 signature: 2fd9e6642b19e8c9963f6bdb0cdbaa3c ****/
		%feature("compactdefaultargs") CopyNMVertex;
		%feature("autodoc", "Make a copy of non-manifold vertex thevert (i.e. create new tvertex and replace pointrepresentations for this vertex from fromedge to toedge. other representations were copied).

Parameters
----------
theVert: TopoDS_Vertex
toedge: TopoDS_Edge
fromedge: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") CopyNMVertex;
		static TopoDS_Vertex CopyNMVertex(const TopoDS_Vertex & theVert, const TopoDS_Edge & toedge, const TopoDS_Edge & fromedge);

		/****************** CopyNMVertex ******************/
		/**** md5 signature: c1184339f62e903b30e9b1b1d5b694cf ****/
		%feature("compactdefaultargs") CopyNMVertex;
		%feature("autodoc", "Make a copy of non-manifold vertex thevert (i.e. create new tvertex and replace pointrepresentations for this vertex from fromface to toface. other representations were copied).

Parameters
----------
theVert: TopoDS_Vertex
toFace: TopoDS_Face
fromFace: TopoDS_Face

Returns
-------
TopoDS_Vertex
") CopyNMVertex;
		static TopoDS_Vertex CopyNMVertex(const TopoDS_Vertex & theVert, const TopoDS_Face & toFace, const TopoDS_Face & fromFace);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetForceProjection() {
            return (Standard_Boolean) $self->ForceProjection();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetForceProjection(Standard_Boolean value) {
            $self->ForceProjection()=value;
            }
        };
		/****************** Init ******************/
		/**** md5 signature: 3c32c972be306684e0073a8837daa347 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Init;
		virtual void Init(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** IsSameRange ******************/
		/**** md5 signature: b43cec9b7a0b7a0b0a76b1621fd6cbe2 ****/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "Returns false;.

Returns
-------
bool
") IsSameRange;
		virtual Standard_Boolean IsSameRange();

		/****************** Perform ******************/
		/**** md5 signature: da484c93300b4b1696cc44e270785889 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Transfers parameters given by sequence params from 3d curve to pcurve (if to2d is true) or back (if to2d is false).

Parameters
----------
Papams: TColStd_HSequenceOfReal
To2d: bool

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") Perform;
		virtual opencascade::handle<TColStd_HSequenceOfReal> Perform(const opencascade::handle<TColStd_HSequenceOfReal> & Papams, const Standard_Boolean To2d);

		/****************** Perform ******************/
		/**** md5 signature: b4f4fac0124409915bf808658afa996b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Transfers parameter given by param from 3d curve to pcurve (if to2d is true) or back (if to2d is false).

Parameters
----------
Param: float
To2d: bool

Returns
-------
float
") Perform;
		virtual Standard_Real Perform(const Standard_Real Param, const Standard_Boolean To2d);

		/****************** TransferRange ******************/
		/**** md5 signature: 2048b3cf3f6e338e1741a033a65021be ****/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "Recomputes range of curves from newedge. if is2d equals true parameters are recomputed by curve2d else by curve3d.

Parameters
----------
newEdge: TopoDS_Edge
prevPar: float
currPar: float
Is2d: bool

Returns
-------
None
") TransferRange;
		virtual void TransferRange(TopoDS_Edge & newEdge, const Standard_Real prevPar, const Standard_Real currPar, const Standard_Boolean Is2d);

};


%make_alias(ShapeAnalysis_TransferParametersProj)

%extend ShapeAnalysis_TransferParametersProj {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class ShapeAnalysis_BoxBndTreeSelector:
	pass

@classnotwrapped
class ShapeCustom_ConvertToRevolution:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class ShapeAnalysis_HSequenceOfFreeBounds : public ShapeAnalysis_SequenceOfFreeBounds, public Standard_Transient {
  public:
    ShapeAnalysis_HSequenceOfFreeBounds();
    ShapeAnalysis_HSequenceOfFreeBounds(const ShapeAnalysis_SequenceOfFreeBounds& theOther);
    const ShapeAnalysis_SequenceOfFreeBounds& Sequence();
    void Append (const ShapeAnalysis_SequenceOfFreeBounds::value_type& theItem);
    void Append (ShapeAnalysis_SequenceOfFreeBounds& theSequence);
    ShapeAnalysis_SequenceOfFreeBounds& ChangeSequence();
};
%make_alias(ShapeAnalysis_HSequenceOfFreeBounds)


