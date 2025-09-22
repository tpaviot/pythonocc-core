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
%define SHAPEANALYSISDOCSTRING
"ShapeAnalysis module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_shapeanalysis.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<ShapeAnalysis_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<ShapeExtend_module.hxx>
#include<gp_module.hxx>
#include<TopTools_module.hxx>
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
%import gp.i
%import TopTools.i
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

/* python proxy classes for enums */
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
		/****** ShapeAnalysis::AdjustByPeriod ******/
		/****** md5 signature: be1804eaaac865fa80ec1f574f0e78ff ******/
		%feature("compactdefaultargs") AdjustByPeriod;
		%feature("autodoc", "
Parameters
----------
Val: float
ToVal: float
Period: float

Return
-------
float

Description
-----------
Returns a shift required to move point <Val> to the range [ToVal-Period/2,ToVal+Period/2]. This shift will be the divisible by Period. Intended for adjusting parameters on periodic surfaces.
") AdjustByPeriod;
		static Standard_Real AdjustByPeriod(const Standard_Real Val, const Standard_Real ToVal, const Standard_Real Period);

		/****** ShapeAnalysis::AdjustToPeriod ******/
		/****** md5 signature: 232511229d47cce6737abd010c6492ba ******/
		%feature("compactdefaultargs") AdjustToPeriod;
		%feature("autodoc", "
Parameters
----------
Val: float
ValMin: float
ValMax: float

Return
-------
float

Description
-----------
Returns a shift required to move point <Val> to the range [ValMin,ValMax]. This shift will be the divisible by Period with Period = ValMax - ValMin. Intended for adjusting parameters on periodic surfaces.
") AdjustToPeriod;
		static Standard_Real AdjustToPeriod(const Standard_Real Val, const Standard_Real ValMin, const Standard_Real ValMax);

		/****** ShapeAnalysis::ContourArea ******/
		/****** md5 signature: 4c9212a6c58b05d0930827ce004d7ec7 ******/
		%feature("compactdefaultargs") ContourArea;
		%feature("autodoc", "
Parameters
----------
theWire: TopoDS_Wire

Return
-------
float

Description
-----------
Returns a total area of 3d wire.
") ContourArea;
		static Standard_Real ContourArea(const TopoDS_Wire & theWire);

		/****** ShapeAnalysis::FindBounds ******/
		/****** md5 signature: 5d164ba876b522b672fae6c0b8983a06 ******/
		%feature("compactdefaultargs") FindBounds;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
None

Description
-----------
Finds the start and end vertices of the shape Shape can be of the following type: vertex: V1 and V2 are the same and equal to <shape>, edge: V1 is start and V2 is end vertex (see ShapeAnalysis_Edge methods FirstVertex and LastVertex), wire: V1 is start vertex of the first edge, V2 is end vertex of the last edge (also see ShapeAnalysis_Edge). If wire contains no edges V1 and V2 are nullified If none of the above V1 and V2 are nullified.
") FindBounds;
		static void FindBounds(const TopoDS_Shape & shape, TopoDS_Vertex & V1, TopoDS_Vertex & V2);

		/****** ShapeAnalysis::GetFaceUVBounds ******/
		/****** md5 signature: 9503e389b6155ebde06f66b1966a448f ******/
		%feature("compactdefaultargs") GetFaceUVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
Umin: float
Umax: float
Vmin: float
Vmax: float

Description
-----------
Computes exact UV bounds of all wires on the face.
") GetFaceUVBounds;
		static void GetFaceUVBounds(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis::IsOuterBound ******/
		/****** md5 signature: 97a2819fb02af6841f518636ffd8f746 ******/
		%feature("compactdefaultargs") IsOuterBound;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if <F> has outer bound.
") IsOuterBound;
		static Standard_Boolean IsOuterBound(const TopoDS_Face & face);

		/****** ShapeAnalysis::OuterWire ******/
		/****** md5 signature: 4eacb2464bf572e4b11b76bcce3c541d ******/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
TopoDS_Wire

Description
-----------
Returns positively oriented wire in the face. If there is no such wire - returns the last wire of the face.
") OuterWire;
		static TopoDS_Wire OuterWire(const TopoDS_Face & theFace);

		/****** ShapeAnalysis::TotCross2D ******/
		/****** md5 signature: d02b539165ef061eca69acd36cb763dd ******/
		%feature("compactdefaultargs") TotCross2D;
		%feature("autodoc", "
Parameters
----------
sewd: ShapeExtend_WireData
aFace: TopoDS_Face

Return
-------
float

Description
-----------
Returns a total area of 2d wire.
") TotCross2D;
		static Standard_Real TotCross2D(const opencascade::handle<ShapeExtend_WireData> & sewd, const TopoDS_Face & aFace);

};


%extend ShapeAnalysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class ShapeAnalysis_CanonicalRecognition *
*******************************************/
class ShapeAnalysis_CanonicalRecognition {
	public:
		/****** ShapeAnalysis_CanonicalRecognition::ShapeAnalysis_CanonicalRecognition ******/
		/****** md5 signature: 5c815ddb5c04eb763ce71ef952e88976 ******/
		%feature("compactdefaultargs") ShapeAnalysis_CanonicalRecognition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_CanonicalRecognition;
		 ShapeAnalysis_CanonicalRecognition();

		/****** ShapeAnalysis_CanonicalRecognition::ShapeAnalysis_CanonicalRecognition ******/
		/****** md5 signature: c724d5f7f97549ca385d39f6f5ad765d ******/
		%feature("compactdefaultargs") ShapeAnalysis_CanonicalRecognition;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
constructor with shape initialisation.
") ShapeAnalysis_CanonicalRecognition;
		 ShapeAnalysis_CanonicalRecognition(const TopoDS_Shape & theShape);

		/****** ShapeAnalysis_CanonicalRecognition::ClearStatus ******/
		/****** md5 signature: 868f4799999f2c207835d2d54d713a4f ******/
		%feature("compactdefaultargs") ClearStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns status to be equal 0.
") ClearStatus;
		void ClearStatus();

		/****** ShapeAnalysis_CanonicalRecognition::GetGap ******/
		/****** md5 signature: 6750af4846e7c73d2306166a820dd5a3 ******/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns deviation between input geometry entity and analytical entity.
") GetGap;
		Standard_Real GetGap();

		/****** ShapeAnalysis_CanonicalRecognition::GetShape ******/
		/****** md5 signature: 7c167c51f2939d15d5bfddc807114b00 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns input shape.
") GetShape;
		const TopoDS_Shape GetShape();

		/****** ShapeAnalysis_CanonicalRecognition::GetStatus ******/
		/****** md5 signature: 5833e1b616ca4e6620ae6e8d9d361c54 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns status of operation. Current meaning of possible values of status: -1 - algorithm is not initalazed by shape 0 - no errors 1 - error during any operation (usually - because of wrong input data) Any operation (calling any methods like IsPlane(...), ...) can be performed when current staue is equal 0. If after any operation status != 0, it is necessary to set it 0 by method ClearStatus() before calling other operation.
") GetStatus;
		Standard_Integer GetStatus();

		/****** ShapeAnalysis_CanonicalRecognition::IsCircle ******/
		/****** md5 signature: 291c319ba30921dc2ce073891dcd1c6a ******/
		%feature("compactdefaultargs") IsCircle;
		%feature("autodoc", "
Parameters
----------
theTol: float
theCirc: gp_Circ

Return
-------
bool

Description
-----------
Returns true if the underlined curve can be represent by circle with tolerance theTol and sets in theCirc the result circle.
") IsCircle;
		Standard_Boolean IsCircle(const Standard_Real theTol, gp_Circ & theCirc);

		/****** ShapeAnalysis_CanonicalRecognition::IsCone ******/
		/****** md5 signature: 3ee8d204db0a9969c37a9a077c5209c5 ******/
		%feature("compactdefaultargs") IsCone;
		%feature("autodoc", "
Parameters
----------
theTol: float
theCone: gp_Cone

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by conical one with tolerance theTol and sets in theCone the result conical surface.
") IsCone;
		Standard_Boolean IsCone(const Standard_Real theTol, gp_Cone & theCone);

		/****** ShapeAnalysis_CanonicalRecognition::IsCylinder ******/
		/****** md5 signature: 3cd23f6df09c0359b8056833b2ae5115 ******/
		%feature("compactdefaultargs") IsCylinder;
		%feature("autodoc", "
Parameters
----------
theTol: float
theCyl: gp_Cylinder

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by cylindrical one with tolerance theTol and sets in theCyl the result cylinrical surface.
") IsCylinder;
		Standard_Boolean IsCylinder(const Standard_Real theTol, gp_Cylinder & theCyl);

		/****** ShapeAnalysis_CanonicalRecognition::IsEllipse ******/
		/****** md5 signature: 7b3958be9b23168fa3898fe37a797c86 ******/
		%feature("compactdefaultargs") IsEllipse;
		%feature("autodoc", "
Parameters
----------
theTol: float
theElips: gp_Elips

Return
-------
bool

Description
-----------
Returns true if the underlined curve can be represent by ellipse with tolerance theTol and sets in theCirc the result ellipse.
") IsEllipse;
		Standard_Boolean IsEllipse(const Standard_Real theTol, gp_Elips & theElips);

		/****** ShapeAnalysis_CanonicalRecognition::IsLine ******/
		/****** md5 signature: fbfb5e40e9ca6661061ebe1c8bdb8322 ******/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "
Parameters
----------
theTol: float
theLin: gp_Lin

Return
-------
bool

Description
-----------
Returns true if the underlined curve can be represent by line with tolerance theTol and sets in theLin the result line.
") IsLine;
		Standard_Boolean IsLine(const Standard_Real theTol, gp_Lin & theLin);

		/****** ShapeAnalysis_CanonicalRecognition::IsPlane ******/
		/****** md5 signature: 2d5e0a085eb132b5333a0b8de3ec7e9d ******/
		%feature("compactdefaultargs") IsPlane;
		%feature("autodoc", "
Parameters
----------
theTol: float
thePln: gp_Pln

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by plane with tolerance theTol and sets in thePln the result plane.
") IsPlane;
		Standard_Boolean IsPlane(const Standard_Real theTol, gp_Pln & thePln);

		/****** ShapeAnalysis_CanonicalRecognition::IsSphere ******/
		/****** md5 signature: a9c3a50effc875d233eb621174f5f38c ******/
		%feature("compactdefaultargs") IsSphere;
		%feature("autodoc", "
Parameters
----------
theTol: float
theSphere: gp_Sphere

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by spherical one with tolerance theTol and sets in theSphere the result spherical surface.
") IsSphere;
		Standard_Boolean IsSphere(const Standard_Real theTol, gp_Sphere & theSphere);

		/****** ShapeAnalysis_CanonicalRecognition::SetShape ******/
		/****** md5 signature: 26c388bb1dfffadc50ffdc7a812f81ef ******/
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
Sets shape.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

};


%extend ShapeAnalysis_CanonicalRecognition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeAnalysis_CheckSmallFace *
*************************************/
class ShapeAnalysis_CheckSmallFace {
	public:
		/****** ShapeAnalysis_CheckSmallFace::ShapeAnalysis_CheckSmallFace ******/
		/****** md5 signature: 682c1315e887393b2bb9d3f1f6aa911f ******/
		%feature("compactdefaultargs") ShapeAnalysis_CheckSmallFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool Checks a Shape i.e. each of its faces, records checks as diagnostics in the <infos> //! If <infos> has not been set before, no check is done //! For faces which are in a Shell, topological data are recorded to allow recovering connectivities after fixing or removing the small faces or parts of faces Enchains various checks on a face inshell: to compute more information, relevant to topology.
") ShapeAnalysis_CheckSmallFace;
		 ShapeAnalysis_CheckSmallFace();

		/****** ShapeAnalysis_CheckSmallFace::CheckPin ******/
		/****** md5 signature: ec914c3ed292a266d322789b08190a90 ******/
		%feature("compactdefaultargs") CheckPin;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
whatrow: int
sence: int

Description
-----------
Checks if a Face has a pin, which can be edited No singularity: no pin, returns 0 If there is a pin, checked topics, with returned value: - 0: nothing to do more - 1: 'smooth', i.e. not a really sharp pin -> diagnostic 'SmoothPin' - 2: stretched pin, i.e. is possible to relimit the face by another vertex, so that this vertex still gives a pin -> diagnostic 'StretchedPin' with location of vertex (Pnt).
") CheckPin;
		Standard_Boolean CheckPin(const TopoDS_Face & F, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::CheckPinEdges ******/
		/****** md5 signature: 9d8afc6cc952c4c1da332e8e3bc992ed ******/
		%feature("compactdefaultargs") CheckPinEdges;
		%feature("autodoc", "
Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge
coef1: float
coef2: float
toler: float

Return
-------
bool

Description
-----------
No available documentation.
") CheckPinEdges;
		Standard_Boolean CheckPinEdges(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, const Standard_Real coef1, const Standard_Real coef2, const Standard_Real toler);

		/****** ShapeAnalysis_CheckSmallFace::CheckPinFace ******/
		/****** md5 signature: 135637d57e18b98615c1a47af6cd6df6 ******/
		%feature("compactdefaultargs") CheckPinFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
mapEdges: TopTools_DataMapOfShapeShape
toler: float (optional, default to -1.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckPinFace;
		Standard_Boolean CheckPinFace(const TopoDS_Face & F, TopTools_DataMapOfShapeShape & mapEdges, const Standard_Real toler = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckSingleStrip ******/
		/****** md5 signature: aebb017176453136c30b9fcf29cd2793 ******/
		%feature("compactdefaultargs") CheckSingleStrip;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float (optional, default to -1.0)

Return
-------
bool

Description
-----------
Checks if a Face is a single strip, i.e. brings two great edges which are confused on their whole length, possible other edges are small or null length //! Returns 0 if not a strip support, 1 strip in U, 2 strip in V Records diagnostic in info if it is a single strip.
") CheckSingleStrip;
		Standard_Boolean CheckSingleStrip(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Real tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckSplittingVertices ******/
		/****** md5 signature: 0fcbdf30e6784d94388046ae44d18275 ******/
		%feature("compactdefaultargs") CheckSplittingVertices;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
MapEdges: TopTools_DataMapOfShapeListOfShape
MapParam: ShapeAnalysis_DataMapOfShapeListOfReal
theAllVert: TopoDS_Compound

Return
-------
int

Description
-----------
Checks if a Face brings vertices which split it, either confused with non adjacent vertices, or confused with their projection on non adjacent edges Returns the count of found splitting vertices Each vertex then brings a diagnostic 'SplittingVertex', with data: 'Face' for the face, 'Edge' for the split edge.
") CheckSplittingVertices;
		Standard_Integer CheckSplittingVertices(const TopoDS_Face & F, TopTools_DataMapOfShapeListOfShape & MapEdges, ShapeAnalysis_DataMapOfShapeListOfReal & MapParam, TopoDS_Compound & theAllVert);

		/****** ShapeAnalysis_CheckSmallFace::CheckSpotFace ******/
		/****** md5 signature: 9f5f36ac1f166da259f547599106aeed ******/
		%feature("compactdefaultargs") CheckSpotFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
tol: float (optional, default to -1.0)

Return
-------
bool

Description
-----------
Acts as IsSpotFace, but records in <infos> a diagnostic 'SpotFace' with the Pnt as value (data 'Location').
") CheckSpotFace;
		Standard_Boolean CheckSpotFace(const TopoDS_Face & F, const Standard_Real tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckStripEdges ******/
		/****** md5 signature: 42ba06453bc54a008a2fceabf501b5fa ******/
		%feature("compactdefaultargs") CheckStripEdges;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float

Return
-------
dmax: float

Description
-----------
Checks if two edges define a strip, i.e. distance maxi below tolerance, given or some of those of E1 and E2.
") CheckStripEdges;
		Standard_Boolean CheckStripEdges(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real tol, Standard_Real &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::CheckStripFace ******/
		/****** md5 signature: bb1c74772a52f3068a401268987912f6 ******/
		%feature("compactdefaultargs") CheckStripFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float (optional, default to -1.0)

Return
-------
bool

Description
-----------
Checks if a Face is as a Strip Returns 0 if not or non determined, 1 if in U, 2 if in V By default, considers the tolerance zone of its edges A given value <tol> may be given to check a strip of max this width //! If a Face is determined as a Strip, it is delinited by two lists of edges. These lists are recorded in diagnostic Diagnostic 'StripFace' brings data 'Direction' (U or V), 'List1' , 'List2' (if they could be computed).
") CheckStripFace;
		Standard_Boolean CheckStripFace(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Real tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckTwisted ******/
		/****** md5 signature: 9d566bb09d1596d6f36a8c1556c983db ******/
		%feature("compactdefaultargs") CheckTwisted;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
paramu: float
paramv: float

Description
-----------
Checks if a Face is twisted (apart from checking Pin, i.e. it does not give information on pin, only 'it is twisted').
") CheckTwisted;
		Standard_Boolean CheckTwisted(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::FindStripEdges ******/
		/****** md5 signature: 488fc04364bde628e00f8bf16852f40f ******/
		%feature("compactdefaultargs") FindStripEdges;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float

Return
-------
dmax: float

Description
-----------
Searches for two and only two edges up tolerance Returns True if OK, false if not 2 edges If True, returns the two edges and their maximum distance.
") FindStripEdges;
		Standard_Boolean FindStripEdges(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Real tol, Standard_Real &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::IsSpotFace ******/
		/****** md5 signature: 8c34df07c1fdc08c125976674dda3d88 ******/
		%feature("compactdefaultargs") IsSpotFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
spot: gp_Pnt
tol: float (optional, default to -1.0)

Return
-------
spotol: float

Description
-----------
Checks if a Face is as a Spot Returns 0 if not, 1 if yes, 2 if yes and all vertices are the same By default, considers the tolerance zone of its vertices A given value <tol> may be given to check a spot of this size If a Face is a Spot, its location is returned in <spot>, and <spotol> returns an equivalent tolerance, which is computed as half of max dimension of min-max box of the face.
") IsSpotFace;
		Standard_Integer IsSpotFace(const TopoDS_Face & F, gp_Pnt & spot, Standard_Real &OutValue, const Standard_Real tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::IsStripSupport ******/
		/****** md5 signature: b15b26fb47eda2274229ed81f7963b1a ******/
		%feature("compactdefaultargs") IsStripSupport;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
tol: float (optional, default to -1.0)

Return
-------
bool

Description
-----------
Checks if a Face lies on a Surface which is a strip So the Face is a strip. But a Face may be a strip elsewhere .. //! A given value <tol> may be given to check max width By default, considers the tolerance zone of its edges Returns 0 if not a strip support, 1 strip in U, 2 strip in V.
") IsStripSupport;
		Standard_Boolean IsStripSupport(const TopoDS_Face & F, const Standard_Real tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
None

Description
-----------
Sets a fixed Tolerance to check small face By default, local tolerance zone is considered Sets a fixed MaxTolerance to check small face Sets a fixed Tolerance to check small face By default, local tolerance zone is considered Unset fixed tolerance, comes back to local tolerance zones Unset fixed tolerance, comes back to local tolerance zones.
") SetTolerance;
		void SetTolerance(const Standard_Real tol);

		/****** ShapeAnalysis_CheckSmallFace::Status ******/
		/****** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Returns the status of last call to Perform() ShapeExtend_OK: face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire.
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusPin ******/
		/****** md5 signature: 45b836979dc59d2b7b6c234582b1b72f ******/
		%feature("compactdefaultargs") StatusPin;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusPin;
		Standard_Boolean StatusPin(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusPinEdges ******/
		/****** md5 signature: 723d6f964223beb649a25c0f85ed663a ******/
		%feature("compactdefaultargs") StatusPinEdges;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusPinEdges;
		Standard_Boolean StatusPinEdges(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusPinFace ******/
		/****** md5 signature: 59e4599274ed14a030688190ace532f5 ******/
		%feature("compactdefaultargs") StatusPinFace;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusPinFace;
		Standard_Boolean StatusPinFace(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusSplitVert ******/
		/****** md5 signature: 0adcd483785ac3ebc36cc37402218893 ******/
		%feature("compactdefaultargs") StatusSplitVert;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusSplitVert;
		Standard_Boolean StatusSplitVert(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusSpot ******/
		/****** md5 signature: 9a0a63ed0084d833e10cc12c34d3539e ******/
		%feature("compactdefaultargs") StatusSpot;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusSpot;
		Standard_Boolean StatusSpot(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusStrip ******/
		/****** md5 signature: 9368cd6c24b8903ef7a265abae338ec3 ******/
		%feature("compactdefaultargs") StatusStrip;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusStrip;
		Standard_Boolean StatusStrip(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusTwisted ******/
		/****** md5 signature: 79ba4e0de264d0a5e360f383f04ae6ec ******/
		%feature("compactdefaultargs") StatusTwisted;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusTwisted;
		Standard_Boolean StatusTwisted(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tolerance to check small faces, negative value if local tolerances zones are to be considered.
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
		/****** ShapeAnalysis_Curve::FillBndBox ******/
		/****** md5 signature: f89b9c3c2b8dd0039e709244626bb65e ******/
		%feature("compactdefaultargs") FillBndBox;
		%feature("autodoc", "
Parameters
----------
C2d: Geom2d_Curve
First: float
Last: float
NPoints: int
Exact: bool
Box: Bnd_Box2d

Return
-------
None

Description
-----------
Computes a boundary box on segment of curve C2d from First to Last. This is done by taking NPoints points from the curve and, if Exact is True, by searching for exact extrema. All these points are added to Box.
") FillBndBox;
		void FillBndBox(const opencascade::handle<Geom2d_Curve> & C2d, const Standard_Real First, const Standard_Real Last, const Standard_Integer NPoints, const Standard_Boolean Exact, Bnd_Box2d & Box);

		/****** ShapeAnalysis_Curve::GetSamplePoints ******/
		/****** md5 signature: 35ed63bcd8b3dcf25b492ce90c8d7391 ******/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "
Parameters
----------
curve: Geom2d_Curve
first: float
last: float
seq: TColgp_SequenceOfPnt2d

Return
-------
bool

Description
-----------
Returns sample points which will serve as linearisation of the2d curve in range (first, last) The distribution of sample points is consystent with what is used by BRepTopAdaptor_FClass2d.
") GetSamplePoints;
		static Standard_Boolean GetSamplePoints(const opencascade::handle<Geom2d_Curve> & curve, const Standard_Real first, const Standard_Real last, TColgp_SequenceOfPnt2d & seq);

		/****** ShapeAnalysis_Curve::GetSamplePoints ******/
		/****** md5 signature: 27536dca3bf5cbe57386f53deec75fa4 ******/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
first: float
last: float
seq: TColgp_SequenceOfPnt

Return
-------
bool

Description
-----------
Returns sample points which will serve as linearisation of the curve in range (first, last).
") GetSamplePoints;
		static Standard_Boolean GetSamplePoints(const opencascade::handle<Geom_Curve> & curve, const Standard_Real first, const Standard_Real last, TColgp_SequenceOfPnt & seq);

		/****** ShapeAnalysis_Curve::IsClosed ******/
		/****** md5 signature: ffd30074e57d137811ed8c73f85b663f ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
preci: float (optional, default to -1)

Return
-------
bool

Description
-----------
Tells if the Curve is closed with given precision. If <preci> < 0 then Precision::Confusion is used.
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Geom_Curve> & curve, const Standard_Real preci = -1);

		/****** ShapeAnalysis_Curve::IsPeriodic ******/
		/****** md5 signature: 77bfaeae3bd1dc05e7cd84ea4c4fbc6a ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve

Return
-------
bool

Description
-----------
This method was implemented as fix for changes in trimmed curve behaviour. For the moment trimmed curve returns false anyway. So it is necessary to adapt all Data exchange tools for this behaviour. Current implementation takes into account that curve may be offset.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Geom_Curve> & curve);

		/****** ShapeAnalysis_Curve::IsPeriodic ******/
		/****** md5 signature: 74012048a4f42b6a8953853367de2d1e ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
curve: Geom2d_Curve

Return
-------
bool

Description
-----------
The same as for Curve3d.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Geom2d_Curve> & curve);

		/****** ShapeAnalysis_Curve::IsPlanar ******/
		/****** md5 signature: 8d42e9d9d775ff62270b1ea21363217d ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "
Parameters
----------
pnts: TColgp_Array1OfPnt
Normal: gp_XYZ
preci: float (optional, default to 0)

Return
-------
bool

Description
-----------
Checks if points are planar with given preci. If Normal has not zero modulus, checks with given normal.
") IsPlanar;
		static Standard_Boolean IsPlanar(const TColgp_Array1OfPnt & pnts, gp_XYZ & Normal, const Standard_Real preci = 0);

		/****** ShapeAnalysis_Curve::IsPlanar ******/
		/****** md5 signature: 51381d62b31dcf78c955461d276c0d26 ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
Normal: gp_XYZ
preci: float (optional, default to 0)

Return
-------
bool

Description
-----------
Checks if curve is planar with given preci. If Normal has not zero modulus, checks with given normal.
") IsPlanar;
		static Standard_Boolean IsPlanar(const opencascade::handle<Geom_Curve> & curve, gp_XYZ & Normal, const Standard_Real preci = 0);

		/****** ShapeAnalysis_Curve::NextProject ******/
		/****** md5 signature: 574e0b66ca9898b75d27ec40fcac4b72 ******/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "
Parameters
----------
paramPrev: float
C3D: Geom_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
cf: float
cl: float
AdjustToEnds: bool (optional, default to Standard_True)

Return
-------
param: float

Description
-----------
Projects a Point on a Curve using Newton method. <paramPrev> is taken as the first approximation of solution. If Newton algorithm fails the method Project() is used. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci>.
") NextProject;
		Standard_Real NextProject(const Standard_Real paramPrev, const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Real cf, const Standard_Real cl, const Standard_Boolean AdjustToEnds = Standard_True);

		/****** ShapeAnalysis_Curve::NextProject ******/
		/****** md5 signature: 43e8de3fcfb3bb035f141dbbfaaec453 ******/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "
Parameters
----------
paramPrev: float
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt

Return
-------
param: float

Description
-----------
Projects a Point on a Curve using Newton method. <paramPrev> is taken as the first approximation of solution. If Newton algorithm fails the method Project() is used.
") NextProject;
		Standard_Real NextProject(const Standard_Real paramPrev, const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue);

		/****** ShapeAnalysis_Curve::Project ******/
		/****** md5 signature: 186437c4729079938ebb98c0875bb8a7 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
AdjustToEnds: bool (optional, default to Standard_True)

Return
-------
param: float

Description
-----------
Projects a Point on a Curve. Computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). The number of iterations is limited. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci> //! Returned value is the distance between the given point and computed one.
") Project;
		Standard_Real Project(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Boolean AdjustToEnds = Standard_True);

		/****** ShapeAnalysis_Curve::Project ******/
		/****** md5 signature: 0beba894dd1fd86f65e71a22d532cef4 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
AdjustToEnds: bool (optional, default to Standard_True)

Return
-------
param: float

Description
-----------
Projects a Point on a Curve. Computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). The number of iterations is limited. //! Returned value is the distance between the given point and computed one.
") Project;
		Standard_Real Project(const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Boolean AdjustToEnds = Standard_True);

		/****** ShapeAnalysis_Curve::Project ******/
		/****** md5 signature: 3d1aeb0cc5527c48ff4e25cf4bee7958 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt
cf: float
cl: float
AdjustToEnds: bool (optional, default to Standard_True)

Return
-------
param: float

Description
-----------
Projects a Point on a Curve, but parameters are limited between <cf> and <cl>. The range [cf, cl] is extended with help of Adaptor3d on the basis of 3d precision <preci>. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci>.
") Project;
		Standard_Real Project(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue, const Standard_Real cf, const Standard_Real cl, const Standard_Boolean AdjustToEnds = Standard_True);

		/****** ShapeAnalysis_Curve::ProjectAct ******/
		/****** md5 signature: f2146af7b32beba8e530690f1149ab19 ******/
		%feature("compactdefaultargs") ProjectAct;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: float
proj: gp_Pnt

Return
-------
param: float

Description
-----------
No available documentation.
") ProjectAct;
		Standard_Real ProjectAct(const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const Standard_Real preci, gp_Pnt & proj, Standard_Real &OutValue);

		/****** ShapeAnalysis_Curve::SelectForwardSeam ******/
		/****** md5 signature: 5e6ac6f0ed4d3dd993a587de809382d5 ******/
		%feature("compactdefaultargs") SelectForwardSeam;
		%feature("autodoc", "
Parameters
----------
C1: Geom2d_Curve
C2: Geom2d_Curve

Return
-------
int

Description
-----------
Defines which pcurve (C1 or C2) should be chosen for FORWARD seam edge.
") SelectForwardSeam;
		Standard_Integer SelectForwardSeam(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2);

		/****** ShapeAnalysis_Curve::ValidateRange ******/
		/****** md5 signature: fb7b86b0323f61587893e47a01c31271 ******/
		%feature("compactdefaultargs") ValidateRange;
		%feature("autodoc", "
Parameters
----------
Crv: Geom_Curve
prec: float

Return
-------
First: float
Last: float

Description
-----------
Validate parameters First and Last for the given curve in order to make them valid for creation of edge. This includes: - limiting range [First,Last] by range of curve - adjusting range [First,Last] for periodic (or closed) curve if Last < First Returns True if parameters are OK or are successfully corrected, or False if parameters cannot be corrected. In the latter case, parameters are reset to range of curve.
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
		/****** ShapeAnalysis_Edge::ShapeAnalysis_Edge ******/
		/****** md5 signature: c99946c01f04aee5eb380ccca26bc3af ******/
		%feature("compactdefaultargs") ShapeAnalysis_Edge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor; initialises Status to OK.
") ShapeAnalysis_Edge;
		 ShapeAnalysis_Edge();

		/****** ShapeAnalysis_Edge::BoundUV ******/
		/****** md5 signature: e5e22bda7ac9cae9eec606988778f69f ******/
		%feature("compactdefaultargs") BoundUV;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
first: gp_Pnt2d
last: gp_Pnt2d

Return
-------
bool

Description
-----------
No available documentation.
") BoundUV;
		Standard_Boolean BoundUV(const TopoDS_Edge & edge, const TopoDS_Face & face, gp_Pnt2d & first, gp_Pnt2d & last);

		/****** ShapeAnalysis_Edge::BoundUV ******/
		/****** md5 signature: adf12ad3021cfe06ac86d8a18e1a6831 ******/
		%feature("compactdefaultargs") BoundUV;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
first: gp_Pnt2d
last: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns the ends of pcurve Calls method PCurve with <orient> equal to True.
") BoundUV;
		Standard_Boolean BoundUV(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, gp_Pnt2d & first, gp_Pnt2d & last);

		/****** ShapeAnalysis_Edge::CheckCurve3dWithPCurve ******/
		/****** md5 signature: 75d50ab437af2b4443581722613dc01a ******/
		%feature("compactdefaultargs") CheckCurve3dWithPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeAnalysis_Edge::CheckCurve3dWithPCurve ******/
		/****** md5 signature: 27026b5c86a00e977fe1bd7242941752 ******/
		%feature("compactdefaultargs") CheckCurve3dWithPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Return
-------
bool

Description
-----------
Checks mutual orientation of 3d curve and pcurve on the analysis of curves bounding points.
") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeAnalysis_Edge::CheckOverlapping ******/
		/****** md5 signature: 8ce837196cc14fae3f308905714a9765 ******/
		%feature("compactdefaultargs") CheckOverlapping;
		%feature("autodoc", "
Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
theDomainDist: float (optional, default to 0.0)

Return
-------
theTolOverlap: float

Description
-----------
Checks the first edge is overlapped with second edge. If distance between two edges is less then theTolOverlap edges are overlapped. theDomainDis - length of part of edges on which edges are overlapped.
") CheckOverlapping;
		Standard_Boolean CheckOverlapping(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, Standard_Real &OutValue, const Standard_Real theDomainDist = 0.0);

		/****** ShapeAnalysis_Edge::CheckPCurveRange ******/
		/****** md5 signature: 1c915eee568b23ca90e4d13b9e928749 ******/
		%feature("compactdefaultargs") CheckPCurveRange;
		%feature("autodoc", "
Parameters
----------
theFirst: float
theLast: float
thePC: Geom2d_Curve

Return
-------
bool

Description
-----------
Checks possibility for pcurve thePC to have range [theFirst, theLast] (edge range) having respect to real first, last parameters of thePC.
") CheckPCurveRange;
		Standard_Boolean CheckPCurveRange(const Standard_Real theFirst, const Standard_Real theLast, const opencascade::handle<Geom2d_Curve> & thePC);

		/****** ShapeAnalysis_Edge::CheckSameParameter ******/
		/****** md5 signature: 2ae6dcdc8bd749faeacf199fa53d23aa ******/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
NbControl: int (optional, default to 23)

Return
-------
maxdev: float

Description
-----------
Checks the edge to be SameParameter. Calculates the maximal deviation between 3d curve and each pcurve of the edge on <NbControl> equidistant points (the same algorithm as in BRepCheck; default value is 23 as in BRepCheck). This deviation is returned in <maxdev> parameter. If deviation is greater than tolerance of the edge (i.e. incorrect flag) returns False, else returns True.
") CheckSameParameter;
		Standard_Boolean CheckSameParameter(const TopoDS_Edge & edge, Standard_Real &OutValue, const Standard_Integer NbControl = 23);

		/****** ShapeAnalysis_Edge::CheckSameParameter ******/
		/****** md5 signature: ea9136dabd409c2bd866cf4e9355e8a5 ******/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theNbControl: int (optional, default to 23)

Return
-------
theMaxdev: float

Description
-----------
Checks the edge to be SameParameter. Calculates the maximal deviation between 3d curve and each pcurve of the edge on <NbControl> equidistant points (the same algorithm as in BRepCheck; default value is 23 as in BRepCheck). This deviation is returned in <maxdev> parameter. If deviation is greater than tolerance of the edge (i.e. incorrect flag) returns False, else returns True.
") CheckSameParameter;
		Standard_Boolean CheckSameParameter(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, Standard_Real &OutValue, const Standard_Integer theNbControl = 23);

		/****** ShapeAnalysis_Edge::CheckVertexTolerance ******/
		/****** md5 signature: 661b5f3482d8c846735ebcb84acb3420 ******/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Return
-------
toler1: float
toler2: float

Description
-----------
No available documentation.
") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance(const TopoDS_Edge & edge, const TopoDS_Face & face, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Edge::CheckVertexTolerance ******/
		/****** md5 signature: 809a2185e68e2c2577b90ce440e968a1 ******/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
toler1: float
toler2: float

Description
-----------
Checks if it is necessary to increase tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) toler1 returns necessary tolerance for first vertex, toler2 returns necessary tolerance for last vertex.
") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance(const TopoDS_Edge & edge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Edge::CheckVerticesWithCurve3d ******/
		/****** md5 signature: ef9c76a46a86528df9f9bc0c626bb285 ******/
		%feature("compactdefaultargs") CheckVerticesWithCurve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
preci: float (optional, default to -1)
vtx: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks the start and/or end vertex of the edge for matching with 3d curve with the given precision. <vtx> = 1: start vertex only <vtx> = 2: end vertex only <vtx> = 0: both (default) If preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.
") CheckVerticesWithCurve3d;
		Standard_Boolean CheckVerticesWithCurve3d(const TopoDS_Edge & edge, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

		/****** ShapeAnalysis_Edge::CheckVerticesWithPCurve ******/
		/****** md5 signature: 073672091cfedac6c0b89f7faf486702 ******/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
preci: float (optional, default to -1)
vtx: int (optional, default to 0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

		/****** ShapeAnalysis_Edge::CheckVerticesWithPCurve ******/
		/****** md5 signature: 6dcb667f22bcd8c805c80d0f2322ed47 ******/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
preci: float (optional, default to -1)
vtx: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks the start and/or end vertex of the edge for matching with pcurve with the given precision. <vtx> = 1: start vertex <vtx> = 2: end vertex <vtx> = 0: both If preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.
") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

		/****** ShapeAnalysis_Edge::Curve3d ******/
		/****** md5 signature: a62c7816a4324c1eb17a7617f6fa678f ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
C3d: Geom_Curve
orient: bool (optional, default to Standard_True)

Return
-------
cf: float
cl: float

Description
-----------
Returns the 3d curve and bounding parameters for the edge Returns False if no 3d curve. If <orient> is True (default), takes orientation into account: if the edge is reversed, cf and cl are toggled.
") Curve3d;
		Standard_Boolean Curve3d(const TopoDS_Edge & edge, opencascade::handle<Geom_Curve> & C3d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean orient = Standard_True);

		/****** ShapeAnalysis_Edge::FirstVertex ******/
		/****** md5 signature: c76f9f550e6853d1bca033d063cd7695 ******/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
TopoDS_Vertex

Description
-----------
Returns start vertex of the edge (taking edge orientation into account).
") FirstVertex;
		TopoDS_Vertex FirstVertex(const TopoDS_Edge & edge);

		/****** ShapeAnalysis_Edge::GetEndTangent2d ******/
		/****** md5 signature: bc383e612c5da27eed0047cfdefac844 ******/
		%feature("compactdefaultargs") GetEndTangent2d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
atEnd: bool
pos: gp_Pnt2d
tang: gp_Vec2d
dparam: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d(const TopoDS_Edge & edge, const TopoDS_Face & face, const Standard_Boolean atEnd, gp_Pnt2d & pos, gp_Vec2d & tang, const Standard_Real dparam = 0.0);

		/****** ShapeAnalysis_Edge::GetEndTangent2d ******/
		/****** md5 signature: c54ab8ad8f5a550116a71bb84550b206 ******/
		%feature("compactdefaultargs") GetEndTangent2d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
atEnd: bool
pos: gp_Pnt2d
tang: gp_Vec2d
dparam: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Returns tangent of the edge pcurve at its start (if atEnd is False) or end (if True), regarding the orientation of edge. If edge is REVERSED, tangent is reversed before return. Returns True if pcurve is available and tangent is computed and is not null, else False.
") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const Standard_Boolean atEnd, gp_Pnt2d & pos, gp_Vec2d & tang, const Standard_Real dparam = 0.0);

		/****** ShapeAnalysis_Edge::HasCurve3d ******/
		/****** md5 signature: d78b94609050f6e09a2bfa1b5ea3a34e ******/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
bool

Description
-----------
Tells if the edge has a 3d curve.
") HasCurve3d;
		Standard_Boolean HasCurve3d(const TopoDS_Edge & edge);

		/****** ShapeAnalysis_Edge::HasPCurve ******/
		/****** md5 signature: f605c533d49084a841df7413f97d5c66 ******/
		%feature("compactdefaultargs") HasPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Return
-------
bool

Description
-----------
Tells if the Edge has a pcurve on the face.
") HasPCurve;
		Standard_Boolean HasPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeAnalysis_Edge::HasPCurve ******/
		/****** md5 signature: 2b47f8283d127329517d4019a6fd4de6 ******/
		%feature("compactdefaultargs") HasPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Return
-------
bool

Description
-----------
Tells if the edge has a pcurve on the surface (with location).
") HasPCurve;
		Standard_Boolean HasPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeAnalysis_Edge::IsClosed3d ******/
		/****** md5 signature: 61d8e2f9ed5200ce2ecef6abfdcc8389 ******/
		%feature("compactdefaultargs") IsClosed3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
bool

Description
-----------
Gives True if the edge has a 3d curve, this curve is closed, and the edge has the same vertex at start and end.
") IsClosed3d;
		Standard_Boolean IsClosed3d(const TopoDS_Edge & edge);

		/****** ShapeAnalysis_Edge::IsSeam ******/
		/****** md5 signature: 0fc8e916c998f86260978e3135d9950c ******/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") IsSeam;
		Standard_Boolean IsSeam(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeAnalysis_Edge::IsSeam ******/
		/****** md5 signature: 2d9e2b62d151785ef467c6500e14f00c ******/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Return
-------
bool

Description
-----------
Returns True if the edge has two pcurves on one surface.
") IsSeam;
		Standard_Boolean IsSeam(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeAnalysis_Edge::LastVertex ******/
		/****** md5 signature: f5a64f47da5ff503b5b692bcee807785 ******/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
TopoDS_Vertex

Description
-----------
Returns end vertex of the edge (taking edge orientation into account).
") LastVertex;
		TopoDS_Vertex LastVertex(const TopoDS_Edge & edge);

		/****** ShapeAnalysis_Edge::PCurve ******/
		/****** md5 signature: 8fb620ff338d11fa9b54fa8e15c7fe67 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
C2d: Geom2d_Curve
orient: bool (optional, default to Standard_True)

Return
-------
cf: float
cl: float

Description
-----------
No available documentation.
") PCurve;
		Standard_Boolean PCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, opencascade::handle<Geom2d_Curve> & C2d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean orient = Standard_True);

		/****** ShapeAnalysis_Edge::PCurve ******/
		/****** md5 signature: 6f3235c72f09fd5bbf5e17072f2b330b ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
C2d: Geom2d_Curve
orient: bool (optional, default to Standard_True)

Return
-------
cf: float
cl: float

Description
-----------
Returns the pcurve and bounding parameters for the edge lying on the surface. Returns False if the edge has no pcurve on this surface. If <orient> is True (default), takes orientation into account: if the edge is reversed, cf and cl are toggled.
") PCurve;
		Standard_Boolean PCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, opencascade::handle<Geom2d_Curve> & C2d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean orient = Standard_True);

		/****** ShapeAnalysis_Edge::Status ******/
		/****** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Returns the status (in the form of True/False) of last Check.
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
		/****** ShapeAnalysis_FreeBoundData::ShapeAnalysis_FreeBoundData ******/
		/****** md5 signature: 673f7c237d3c08e9bc5d7e90947aabeb ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData();

		/****** ShapeAnalysis_FreeBoundData::ShapeAnalysis_FreeBoundData ******/
		/****** md5 signature: 5c230c41d6e0726fe9ccfc7ed409f380 ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundData;
		%feature("autodoc", "
Parameters
----------
freebound: TopoDS_Wire

Return
-------
None

Description
-----------
Creates object with contour given in the form of TopoDS_Wire.
") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData(const TopoDS_Wire & freebound);

		/****** ShapeAnalysis_FreeBoundData::AddNotch ******/
		/****** md5 signature: 296cc4725ce03a2bad8cbeccc177d04d ******/
		%feature("compactdefaultargs") AddNotch;
		%feature("autodoc", "
Parameters
----------
notch: TopoDS_Wire
width: float

Return
-------
None

Description
-----------
Adds notch on the contour with its maximum width.
") AddNotch;
		void AddNotch(const TopoDS_Wire & notch, const Standard_Real width);

		/****** ShapeAnalysis_FreeBoundData::Area ******/
		/****** md5 signature: a514cbcf0bd2f53e9374f58dcecded92 ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns area of the contour.
") Area;
		Standard_Real Area();

		/****** ShapeAnalysis_FreeBoundData::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all properties of the contour. Contour bound itself is not cleared.
") Clear;
		void Clear();

		/****** ShapeAnalysis_FreeBoundData::FreeBound ******/
		/****** md5 signature: 8bc13ac492a4bb5f0e5014bae56b0d19 ******/
		%feature("compactdefaultargs") FreeBound;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns contour.
") FreeBound;
		TopoDS_Wire FreeBound();

		/****** ShapeAnalysis_FreeBoundData::NbNotches ******/
		/****** md5 signature: 3d1684d1cd9b93f5c29f2bd6573355fd ******/
		%feature("compactdefaultargs") NbNotches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of notches on the contour.
") NbNotches;
		Standard_Integer NbNotches();

		/****** ShapeAnalysis_FreeBoundData::Notch ******/
		/****** md5 signature: 8e9156bec4aa1837516ae821060b1117 ******/
		%feature("compactdefaultargs") Notch;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Wire

Description
-----------
Returns notch on the contour.
") Notch;
		TopoDS_Wire Notch(const Standard_Integer index);

		/****** ShapeAnalysis_FreeBoundData::NotchWidth ******/
		/****** md5 signature: 61d945a5d7959176a609a43b1fa9f5dc ******/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
float

Description
-----------
Returns maximum width of notch specified by its rank number on the contour.
") NotchWidth;
		Standard_Real NotchWidth(const Standard_Integer index);

		/****** ShapeAnalysis_FreeBoundData::NotchWidth ******/
		/****** md5 signature: b55832f9bd5a1d184c7dabacbc932f36 ******/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "
Parameters
----------
notch: TopoDS_Wire

Return
-------
float

Description
-----------
Returns maximum width of notch specified as TopoDS_Wire on the contour.
") NotchWidth;
		Standard_Real NotchWidth(const TopoDS_Wire & notch);

		/****** ShapeAnalysis_FreeBoundData::Notches ******/
		/****** md5 signature: ddeba163c0380866b24b518f9f1db364 ******/
		%feature("compactdefaultargs") Notches;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Returns sequence of notches on the contour.
") Notches;
		opencascade::handle<TopTools_HSequenceOfShape> Notches();

		/****** ShapeAnalysis_FreeBoundData::Perimeter ******/
		/****** md5 signature: c2755d4db216dfa69dda7f57131c1224 ******/
		%feature("compactdefaultargs") Perimeter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns perimeter of the contour.
") Perimeter;
		Standard_Real Perimeter();

		/****** ShapeAnalysis_FreeBoundData::Ratio ******/
		/****** md5 signature: f6ad8c294bcbb055f97a9d19ae1aa2a2 ******/
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns ratio of average length to average width of the contour.
") Ratio;
		Standard_Real Ratio();

		/****** ShapeAnalysis_FreeBoundData::SetArea ******/
		/****** md5 signature: ca196224c16686242be84aef415b6e2c ******/
		%feature("compactdefaultargs") SetArea;
		%feature("autodoc", "
Parameters
----------
area: float

Return
-------
None

Description
-----------
Sets area of the contour.
") SetArea;
		void SetArea(const Standard_Real area);

		/****** ShapeAnalysis_FreeBoundData::SetFreeBound ******/
		/****** md5 signature: 4c1843023f46905f032f30ae4c3c6696 ******/
		%feature("compactdefaultargs") SetFreeBound;
		%feature("autodoc", "
Parameters
----------
freebound: TopoDS_Wire

Return
-------
None

Description
-----------
Sets contour.
") SetFreeBound;
		void SetFreeBound(const TopoDS_Wire & freebound);

		/****** ShapeAnalysis_FreeBoundData::SetPerimeter ******/
		/****** md5 signature: 7108a39a557363155f1a5e4a4e1f31b9 ******/
		%feature("compactdefaultargs") SetPerimeter;
		%feature("autodoc", "
Parameters
----------
perimeter: float

Return
-------
None

Description
-----------
Sets perimeter of the contour.
") SetPerimeter;
		void SetPerimeter(const Standard_Real perimeter);

		/****** ShapeAnalysis_FreeBoundData::SetRatio ******/
		/****** md5 signature: cc4a35be4cdecff3ce638489af66189a ******/
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "
Parameters
----------
ratio: float

Return
-------
None

Description
-----------
Sets ratio of average length to average width of the contour.
") SetRatio;
		void SetRatio(const Standard_Real ratio);

		/****** ShapeAnalysis_FreeBoundData::SetWidth ******/
		/****** md5 signature: 59e35a19d9637de95c5046e29f33e9bb ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
width: float

Return
-------
None

Description
-----------
Sets average width of the contour.
") SetWidth;
		void SetWidth(const Standard_Real width);

		/****** ShapeAnalysis_FreeBoundData::Width ******/
		/****** md5 signature: e40fe8cb5cdcf41ad2ab06ede13e859b ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns average width of the contour.
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
		/****** ShapeAnalysis_FreeBounds::ShapeAnalysis_FreeBounds ******/
		/****** md5 signature: 5da92b1e8a436f1cc0d04bb54787a6bf ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds();

		/****** ShapeAnalysis_FreeBounds::ShapeAnalysis_FreeBounds ******/
		/****** md5 signature: ce4ce708210e4665a3c9bed93e0bf258 ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
toler: float
splitclosed: bool (optional, default to Standard_False)
splitopen: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Builds forecasting free bounds of the <shape>. <shape> should be a compound of faces. This constructor is to be used for forecasting free edges with help of sewing analyzer BRepAlgo_Sewing which is called with tolerance <toler>. Free edges are connected into wires only when their ends are at distance less than <toler>. If <splitclosed> is True extracts closed sub-wires out of built closed wires. If <splitopen> is True extracts closed sub-wires out of built open wires.
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds(const TopoDS_Shape & shape, const Standard_Real toler, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_True);

		/****** ShapeAnalysis_FreeBounds::ShapeAnalysis_FreeBounds ******/
		/****** md5 signature: 1c11ce8aaf8a9c07156a0ca820ea6f78 ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
splitclosed: bool (optional, default to Standard_False)
splitopen: bool (optional, default to Standard_True)
checkinternaledges: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds actual free bounds of the <shape>. <shape> should be a compound of shells. This constructor is to be used for getting free edges (ones referenced by the only face) with help of analyzer ShapeAnalysis_Shell. Free edges are connected into wires only when they share the same vertex. If <splitclosed> is True extracts closed sub-wires out of built closed wires. If <splitopen> is True extracts closed sub-wires out of built open wires.
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds(const TopoDS_Shape & shape, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_True, const Standard_Boolean checkinternaledges = Standard_False);

		/****** ShapeAnalysis_FreeBounds::ConnectEdgesToWires ******/
		/****** md5 signature: 6fcc51b9a4f6e720b15cb08a6b8abe01 ******/
		%feature("compactdefaultargs") ConnectEdgesToWires;
		%feature("autodoc", "
Parameters
----------
edges: TopTools_HSequenceOfShape
toler: float
shared: bool
wires: TopTools_HSequenceOfShape

Return
-------
None

Description
-----------
Builds sequence of <wires> out of sequence of not sorted <edges>. Tries to build wires of maximum length. Building a wire is stopped when no edges can be connected to it at its head or at its tail. //! Orientation of the edge can change when connecting. If <shared> is True connection is performed only when adjacent edges share the same vertex. If <shared> is False connection is performed only when ends of adjacent edges are at distance less than <toler>.
") ConnectEdgesToWires;
		static void ConnectEdgesToWires(opencascade::handle<TopTools_HSequenceOfShape> & edges, const Standard_Real toler, const Standard_Boolean shared, opencascade::handle<TopTools_HSequenceOfShape> & wires);

		/****** ShapeAnalysis_FreeBounds::ConnectWiresToWires ******/
		/****** md5 signature: 65e7beffc0860523c7e2928eb79c19e4 ******/
		%feature("compactdefaultargs") ConnectWiresToWires;
		%feature("autodoc", "
Parameters
----------
iwires: TopTools_HSequenceOfShape
toler: float
shared: bool
owires: TopTools_HSequenceOfShape

Return
-------
None

Description
-----------
No available documentation.
") ConnectWiresToWires;
		static void ConnectWiresToWires(opencascade::handle<TopTools_HSequenceOfShape> & iwires, const Standard_Real toler, const Standard_Boolean shared, opencascade::handle<TopTools_HSequenceOfShape> & owires);

		/****** ShapeAnalysis_FreeBounds::ConnectWiresToWires ******/
		/****** md5 signature: 009f594b7e71f4d33210458b3bbfb661 ******/
		%feature("compactdefaultargs") ConnectWiresToWires;
		%feature("autodoc", "
Parameters
----------
iwires: TopTools_HSequenceOfShape
toler: float
shared: bool
owires: TopTools_HSequenceOfShape
vertices: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Builds sequence of <owires> out of sequence of not sorted <iwires>. Tries to build wires of maximum length. Building a wire is stopped when no wires can be connected to it at its head or at its tail. //! Orientation of the wire can change when connecting. If <shared> is True connection is performed only when adjacent wires share the same vertex. If <shared> is False connection is performed only when ends of adjacent wires are at distance less than <toler>. Map <vertices> stores the correspondence between original end vertices of the wires and new connecting vertices.
") ConnectWiresToWires;
		static void ConnectWiresToWires(opencascade::handle<TopTools_HSequenceOfShape> & iwires, const Standard_Real toler, const Standard_Boolean shared, opencascade::handle<TopTools_HSequenceOfShape> & owires, TopTools_DataMapOfShapeShape & vertices);

		/****** ShapeAnalysis_FreeBounds::DispatchWires ******/
		/****** md5 signature: 10c7bcfb1c66932d655ad49617f8df2b ******/
		%feature("compactdefaultargs") DispatchWires;
		%feature("autodoc", "
Parameters
----------
wires: TopTools_HSequenceOfShape
closed: TopoDS_Compound
open: TopoDS_Compound

Return
-------
None

Description
-----------
Dispatches sequence of <wires> into two compounds <closed> for closed wires and <open> for open wires. If a compound is not empty wires are added into it.
") DispatchWires;
		static void DispatchWires(const opencascade::handle<TopTools_HSequenceOfShape> & wires, TopoDS_Compound & closed, TopoDS_Compound & open);

		/****** ShapeAnalysis_FreeBounds::GetClosedWires ******/
		/****** md5 signature: 90f975347145fad77d9189e1b9eb60f3 ******/
		%feature("compactdefaultargs") GetClosedWires;
		%feature("autodoc", "Return
-------
TopoDS_Compound

Description
-----------
Returns compound of closed wires out of free edges.
") GetClosedWires;
		const TopoDS_Compound GetClosedWires();

		/****** ShapeAnalysis_FreeBounds::GetOpenWires ******/
		/****** md5 signature: 593c247336f0173d978a7190a7ee588f ******/
		%feature("compactdefaultargs") GetOpenWires;
		%feature("autodoc", "Return
-------
TopoDS_Compound

Description
-----------
Returns compound of open wires out of free edges.
") GetOpenWires;
		const TopoDS_Compound GetOpenWires();

		/****** ShapeAnalysis_FreeBounds::SplitWires ******/
		/****** md5 signature: 3c46178d0a5bed184b71d617a06437ea ******/
		%feature("compactdefaultargs") SplitWires;
		%feature("autodoc", "
Parameters
----------
wires: TopTools_HSequenceOfShape
toler: float
shared: bool
closed: TopTools_HSequenceOfShape
open: TopTools_HSequenceOfShape

Return
-------
None

Description
-----------
Extracts closed sub-wires out of <wires> and adds them to <closed>, open wires remained after extraction are put into <open>. If <shared> is True extraction is performed only when edges share the same vertex. If <shared> is False connection is performed only when ends of the edges are at distance less than <toler>.
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
		/****** ShapeAnalysis_FreeBoundsProperties::ShapeAnalysis_FreeBoundsProperties ******/
		/****** md5 signature: 6902457036bde4e2dfacfed7ad607c36 ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties();

		/****** ShapeAnalysis_FreeBoundsProperties::ShapeAnalysis_FreeBoundsProperties ******/
		/****** md5 signature: 2371a658568ed2f269ca1d7fed42a9b1 ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tolerance: float
splitclosed: bool (optional, default to Standard_False)
splitopen: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates the object and calls corresponding Init. <shape> should be a compound of faces.
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties(const TopoDS_Shape & shape, const Standard_Real tolerance, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****** ShapeAnalysis_FreeBoundsProperties::ShapeAnalysis_FreeBoundsProperties ******/
		/****** md5 signature: 132b5d79208ca37c5eb1d92d0f663df9 ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
splitclosed: bool (optional, default to Standard_False)
splitopen: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates the object and calls corresponding Init. <shape> should be a compound of shells.
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties(const TopoDS_Shape & shape, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckContours ******/
		/****** md5 signature: 5bae4be1fe56ada2c3fba18f4955d6ce ******/
		%feature("compactdefaultargs") CheckContours;
		%feature("autodoc", "
Parameters
----------
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckContours;
		Standard_Boolean CheckContours(const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckNotches ******/
		/****** md5 signature: e0adbd03dc5e2e35f4a2145fb24837fc ******/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "
Parameters
----------
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckNotches;
		Standard_Boolean CheckNotches(const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckNotches ******/
		/****** md5 signature: c2af94c18680779c1fe35c641fa9181f ******/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "
Parameters
----------
fbData: ShapeAnalysis_FreeBoundData
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckNotches;
		Standard_Boolean CheckNotches(opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData, const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckNotches ******/
		/****** md5 signature: 688bb40fbae25b5be28e2d92ecdf9d58 ******/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "
Parameters
----------
freebound: TopoDS_Wire
num: int
notch: TopoDS_Wire
prec: float (optional, default to 0.0)

Return
-------
distMax: float

Description
-----------
No available documentation.
") CheckNotches;
		Standard_Boolean CheckNotches(const TopoDS_Wire & freebound, const Standard_Integer num, TopoDS_Wire & notch, Standard_Real &OutValue, const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::ClosedFreeBound ******/
		/****** md5 signature: 448f89098fcf19a7253dcb8d477c56aa ******/
		%feature("compactdefaultargs") ClosedFreeBound;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<ShapeAnalysis_FreeBoundData>

Description
-----------
Returns properties of closed free bound specified by its rank number.
") ClosedFreeBound;
		opencascade::handle<ShapeAnalysis_FreeBoundData> ClosedFreeBound(const Standard_Integer index);

		/****** ShapeAnalysis_FreeBoundsProperties::ClosedFreeBounds ******/
		/****** md5 signature: 51ee12dff9915049e3a7ce415979dd66 ******/
		%feature("compactdefaultargs") ClosedFreeBounds;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds>

Description
-----------
Returns all closed free bounds.
") ClosedFreeBounds;
		opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds> ClosedFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::DispatchBounds ******/
		/****** md5 signature: ff99f9e699cdc42c2fb973a818fde35f ******/
		%feature("compactdefaultargs") DispatchBounds;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DispatchBounds;
		Standard_Boolean DispatchBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::FillProperties ******/
		/****** md5 signature: dc2629081041ef4e84d2550dd2f4168c ******/
		%feature("compactdefaultargs") FillProperties;
		%feature("autodoc", "
Parameters
----------
fbData: ShapeAnalysis_FreeBoundData
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") FillProperties;
		Standard_Boolean FillProperties(opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData, const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::Init ******/
		/****** md5 signature: 4f89df93af73e5b28d51583b204c1cb4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tolerance: float
splitclosed: bool (optional, default to Standard_False)
splitopen: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the object with given parameters. <shape> should be a compound of faces.
") Init;
		void Init(const TopoDS_Shape & shape, const Standard_Real tolerance, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****** ShapeAnalysis_FreeBoundsProperties::Init ******/
		/****** md5 signature: 733d5f1e34b89852a44f53b4380084f3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
splitclosed: bool (optional, default to Standard_False)
splitopen: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the object with given parameters. <shape> should be a compound of shells.
") Init;
		void Init(const TopoDS_Shape & shape, const Standard_Boolean splitclosed = Standard_False, const Standard_Boolean splitopen = Standard_False);

		/****** ShapeAnalysis_FreeBoundsProperties::IsLoaded ******/
		/****** md5 signature: 5ed802f56c3a94dc70391badb380a6ed ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if shape is loaded.
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****** ShapeAnalysis_FreeBoundsProperties::NbClosedFreeBounds ******/
		/****** md5 signature: 45470f062c41c14a8e9dcdef889185e4 ******/
		%feature("compactdefaultargs") NbClosedFreeBounds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of closed free bounds.
") NbClosedFreeBounds;
		Standard_Integer NbClosedFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::NbFreeBounds ******/
		/****** md5 signature: 7d1a3929ae11c65651a7b6696268014d ******/
		%feature("compactdefaultargs") NbFreeBounds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of free bounds.
") NbFreeBounds;
		Standard_Integer NbFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::NbOpenFreeBounds ******/
		/****** md5 signature: 7c7a0fd03a368d42fc99bc6f8213179b ******/
		%feature("compactdefaultargs") NbOpenFreeBounds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of open free bounds.
") NbOpenFreeBounds;
		Standard_Integer NbOpenFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::OpenFreeBound ******/
		/****** md5 signature: 759aa7338b83d3e58c42dc695040d019 ******/
		%feature("compactdefaultargs") OpenFreeBound;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<ShapeAnalysis_FreeBoundData>

Description
-----------
Returns properties of open free bound specified by its rank number.
") OpenFreeBound;
		opencascade::handle<ShapeAnalysis_FreeBoundData> OpenFreeBound(const Standard_Integer index);

		/****** ShapeAnalysis_FreeBoundsProperties::OpenFreeBounds ******/
		/****** md5 signature: 0c359373fc2a8ebaaaab8ff06e382edb ******/
		%feature("compactdefaultargs") OpenFreeBounds;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds>

Description
-----------
Returns all open free bounds.
") OpenFreeBounds;
		opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds> OpenFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::Perform ******/
		/****** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Builds and analyzes free bounds of the shape. First calls ShapeAnalysis_FreeBounds for building free bounds. Then on each free bound computes its properties: - area of the contour, - perimeter of the contour, - ratio of average length to average width of the contour, - average width of contour, - notches on the contour and for each notch - maximum width of the notch.
") Perform;
		Standard_Boolean Perform();

		/****** ShapeAnalysis_FreeBoundsProperties::Shape ******/
		/****** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns shape.
") Shape;
		TopoDS_Shape Shape();

		/****** ShapeAnalysis_FreeBoundsProperties::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns tolerance.
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
		/****** ShapeAnalysis_Geom::NearestPlane ******/
		/****** md5 signature: 1abacc2e7c3cb3438e51b9db1f625c35 ******/
		%feature("compactdefaultargs") NearestPlane;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array1OfPnt
aPln: gp_Pln

Return
-------
Dmax: float

Description
-----------
Builds a plane out of a set of points in array Returns in <dmax> the maximal distance between the produced plane and given points.
") NearestPlane;
		static Standard_Boolean NearestPlane(const TColgp_Array1OfPnt & Pnts, gp_Pln & aPln, Standard_Real &OutValue);

		/****** ShapeAnalysis_Geom::PositionTrsf ******/
		/****** md5 signature: 2a3f3a6e4f8ae606dbb46116193e80b1 ******/
		%feature("compactdefaultargs") PositionTrsf;
		%feature("autodoc", "
Parameters
----------
coefs: TColStd_HArray2OfReal
trsf: gp_Trsf
unit: float
prec: float

Return
-------
bool

Description
-----------
Builds transformation object out of matrix. Matrix must be 3 x 4. Unit is used as multiplier.
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
		/****** ShapeAnalysis_ShapeContents::ShapeAnalysis_ShapeContents ******/
		/****** md5 signature: 37f686aff70d09482f8278b2e5ede2ed ******/
		%feature("compactdefaultargs") ShapeAnalysis_ShapeContents;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initialize fields and call ClearFlags().
") ShapeAnalysis_ShapeContents;
		 ShapeAnalysis_ShapeContents();

		/****** ShapeAnalysis_ShapeContents::BigSplineSec ******/
		/****** md5 signature: 54d972c865f7c7aa668cde4b02c0832a ******/
		%feature("compactdefaultargs") BigSplineSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") BigSplineSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & BigSplineSec();

		/****** ShapeAnalysis_ShapeContents::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all accumulated statistics.
") Clear;
		void Clear();

		/****** ShapeAnalysis_ShapeContents::ClearFlags ******/
		/****** md5 signature: 85d2349db84c8892f957d96fa3a7b729 ******/
		%feature("compactdefaultargs") ClearFlags;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all flags.
") ClearFlags;
		void ClearFlags();

		/****** ShapeAnalysis_ShapeContents::IndirectSec ******/
		/****** md5 signature: 4fcb801915109654e44e027f9cf7dd5e ******/
		%feature("compactdefaultargs") IndirectSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") IndirectSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & IndirectSec();


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
            Standard_Boolean GetModifyOffsetSurfaceMode() {
            return (Standard_Boolean) $self->ModifyOffsetSurfaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyOffsetSurfaceMode(Standard_Boolean value) {
            $self->ModifyOffsetSurfaceMode()=value;
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
		/****** ShapeAnalysis_ShapeContents::NbBSplibeSurf ******/
		/****** md5 signature: a158c4118473734c13a9c47a1a1d0965 ******/
		%feature("compactdefaultargs") NbBSplibeSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBSplibeSurf;
		Standard_Integer NbBSplibeSurf();

		/****** ShapeAnalysis_ShapeContents::NbBezierSurf ******/
		/****** md5 signature: f230d6bd348270373890003db3887aa7 ******/
		%feature("compactdefaultargs") NbBezierSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBezierSurf;
		Standard_Integer NbBezierSurf();

		/****** ShapeAnalysis_ShapeContents::NbBigSplines ******/
		/****** md5 signature: b902850b4b063fb8100fe14f9ec25d99 ******/
		%feature("compactdefaultargs") NbBigSplines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBigSplines;
		Standard_Integer NbBigSplines();

		/****** ShapeAnalysis_ShapeContents::NbC0Curves ******/
		/****** md5 signature: eb9f63c0673c781381a6e9316402f984 ******/
		%feature("compactdefaultargs") NbC0Curves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbC0Curves;
		Standard_Integer NbC0Curves();

		/****** ShapeAnalysis_ShapeContents::NbC0Surfaces ******/
		/****** md5 signature: 02810c9805ebe930183428b77fee41da ******/
		%feature("compactdefaultargs") NbC0Surfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbC0Surfaces;
		Standard_Integer NbC0Surfaces();

		/****** ShapeAnalysis_ShapeContents::NbEdges ******/
		/****** md5 signature: 31924aa1f5b2c848f6f0ca402e060038 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		Standard_Integer NbEdges();

		/****** ShapeAnalysis_ShapeContents::NbFaceWithSevWires ******/
		/****** md5 signature: 775f8eb64ab3f3c9a3a49c47fe16047b ******/
		%feature("compactdefaultargs") NbFaceWithSevWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFaceWithSevWires;
		Standard_Integer NbFaceWithSevWires();

		/****** ShapeAnalysis_ShapeContents::NbFaces ******/
		/****** md5 signature: d13128d0cc6393b9d04e2d25833180b2 ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFaces;
		Standard_Integer NbFaces();

		/****** ShapeAnalysis_ShapeContents::NbFreeEdges ******/
		/****** md5 signature: aee040571e4e5e4bf01f4afeb43b0c31 ******/
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFreeEdges;
		Standard_Integer NbFreeEdges();

		/****** ShapeAnalysis_ShapeContents::NbFreeFaces ******/
		/****** md5 signature: c0112838d3d1e64094a2d567b7b46be2 ******/
		%feature("compactdefaultargs") NbFreeFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFreeFaces;
		Standard_Integer NbFreeFaces();

		/****** ShapeAnalysis_ShapeContents::NbFreeWires ******/
		/****** md5 signature: c92f135ee9df08cc79c9ef24cefda860 ******/
		%feature("compactdefaultargs") NbFreeWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFreeWires;
		Standard_Integer NbFreeWires();

		/****** ShapeAnalysis_ShapeContents::NbIndirectSurf ******/
		/****** md5 signature: cce29bb337068b157451319ee82ba077 ******/
		%feature("compactdefaultargs") NbIndirectSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIndirectSurf;
		Standard_Integer NbIndirectSurf();

		/****** ShapeAnalysis_ShapeContents::NbNoPCurve ******/
		/****** md5 signature: dd9ab53719003ad1fff0d19d4ec2a383 ******/
		%feature("compactdefaultargs") NbNoPCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbNoPCurve;
		Standard_Integer NbNoPCurve();

		/****** ShapeAnalysis_ShapeContents::NbOffsetCurves ******/
		/****** md5 signature: 967fb9d18380f7c2bcc8319df6e8df84 ******/
		%feature("compactdefaultargs") NbOffsetCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOffsetCurves;
		Standard_Integer NbOffsetCurves();

		/****** ShapeAnalysis_ShapeContents::NbOffsetSurf ******/
		/****** md5 signature: e57363e69044105891867110d2345e39 ******/
		%feature("compactdefaultargs") NbOffsetSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOffsetSurf;
		Standard_Integer NbOffsetSurf();

		/****** ShapeAnalysis_ShapeContents::NbSharedEdges ******/
		/****** md5 signature: c61367063a15b3c10c7d747eb798d342 ******/
		%feature("compactdefaultargs") NbSharedEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedEdges;
		Standard_Integer NbSharedEdges();

		/****** ShapeAnalysis_ShapeContents::NbSharedFaces ******/
		/****** md5 signature: 933c219efa9e6b7b0da7310630ac52f9 ******/
		%feature("compactdefaultargs") NbSharedFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedFaces;
		Standard_Integer NbSharedFaces();

		/****** ShapeAnalysis_ShapeContents::NbSharedFreeEdges ******/
		/****** md5 signature: 8ca35fad5a9eb10427cf93e1412d3b7c ******/
		%feature("compactdefaultargs") NbSharedFreeEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedFreeEdges;
		Standard_Integer NbSharedFreeEdges();

		/****** ShapeAnalysis_ShapeContents::NbSharedFreeWires ******/
		/****** md5 signature: 20452abf53c6cf2997c540ef9f6240f8 ******/
		%feature("compactdefaultargs") NbSharedFreeWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedFreeWires;
		Standard_Integer NbSharedFreeWires();

		/****** ShapeAnalysis_ShapeContents::NbSharedShells ******/
		/****** md5 signature: 21799d026c4b5244949caca935eb9973 ******/
		%feature("compactdefaultargs") NbSharedShells;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedShells;
		Standard_Integer NbSharedShells();

		/****** ShapeAnalysis_ShapeContents::NbSharedSolids ******/
		/****** md5 signature: e889313fe5c4a42d2e3a95ea02050236 ******/
		%feature("compactdefaultargs") NbSharedSolids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedSolids;
		Standard_Integer NbSharedSolids();

		/****** ShapeAnalysis_ShapeContents::NbSharedVertices ******/
		/****** md5 signature: 372916a5a5f969d74b8ce75741bf9c8b ******/
		%feature("compactdefaultargs") NbSharedVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedVertices;
		Standard_Integer NbSharedVertices();

		/****** ShapeAnalysis_ShapeContents::NbSharedWires ******/
		/****** md5 signature: 45baeee356041349c927f30542e85ac6 ******/
		%feature("compactdefaultargs") NbSharedWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedWires;
		Standard_Integer NbSharedWires();

		/****** ShapeAnalysis_ShapeContents::NbShells ******/
		/****** md5 signature: 90611081501be215cf608e5c6dbae82b ******/
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShells;
		Standard_Integer NbShells();

		/****** ShapeAnalysis_ShapeContents::NbSolids ******/
		/****** md5 signature: e487e0540ab54972941cb8ff851eb69d ******/
		%feature("compactdefaultargs") NbSolids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSolids;
		Standard_Integer NbSolids();

		/****** ShapeAnalysis_ShapeContents::NbSolidsWithVoids ******/
		/****** md5 signature: 061a635d0c847222bbd6ab14fadeb7dd ******/
		%feature("compactdefaultargs") NbSolidsWithVoids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSolidsWithVoids;
		Standard_Integer NbSolidsWithVoids();

		/****** ShapeAnalysis_ShapeContents::NbTrimSurf ******/
		/****** md5 signature: 3efdf188aeaea9dcfc5fd783da55a4bd ******/
		%feature("compactdefaultargs") NbTrimSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrimSurf;
		Standard_Integer NbTrimSurf();

		/****** ShapeAnalysis_ShapeContents::NbTrimmedCurve2d ******/
		/****** md5 signature: ecad0e4f50e5e6221cc5208bcc031620 ******/
		%feature("compactdefaultargs") NbTrimmedCurve2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrimmedCurve2d;
		Standard_Integer NbTrimmedCurve2d();

		/****** ShapeAnalysis_ShapeContents::NbTrimmedCurve3d ******/
		/****** md5 signature: ab37744f32810f0b89cc4c34952add89 ******/
		%feature("compactdefaultargs") NbTrimmedCurve3d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrimmedCurve3d;
		Standard_Integer NbTrimmedCurve3d();

		/****** ShapeAnalysis_ShapeContents::NbVertices ******/
		/****** md5 signature: fdb7d948cb5ffe9c7da397697d4125c9 ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertices;
		Standard_Integer NbVertices();

		/****** ShapeAnalysis_ShapeContents::NbWireWithSevSeams ******/
		/****** md5 signature: 980097a25054a46469c805a1232fc68b ******/
		%feature("compactdefaultargs") NbWireWithSevSeams;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWireWithSevSeams;
		Standard_Integer NbWireWithSevSeams();

		/****** ShapeAnalysis_ShapeContents::NbWireWitnSeam ******/
		/****** md5 signature: 4c637a5e0b69a5fbb251f366da6bc6f2 ******/
		%feature("compactdefaultargs") NbWireWitnSeam;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWireWitnSeam;
		Standard_Integer NbWireWitnSeam();

		/****** ShapeAnalysis_ShapeContents::NbWires ******/
		/****** md5 signature: bce549b9d0543bc5dacda7fa2e69e8be ******/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWires;
		Standard_Integer NbWires();

		/****** ShapeAnalysis_ShapeContents::OffsetCurveSec ******/
		/****** md5 signature: eb1ffd42724130745142fbafb6d6f429 ******/
		%feature("compactdefaultargs") OffsetCurveSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") OffsetCurveSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & OffsetCurveSec();

		/****** ShapeAnalysis_ShapeContents::OffsetSurfaceSec ******/
		/****** md5 signature: 9dea0424704ec339188ce6a0460530ef ******/
		%feature("compactdefaultargs") OffsetSurfaceSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") OffsetSurfaceSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & OffsetSurfaceSec();

		/****** ShapeAnalysis_ShapeContents::Perform ******/
		/****** md5 signature: 16888c81df64e609e09767552e6bb5d4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Counts quantities of sun-shapes in shape and stores sub-shapes according to flags.
") Perform;
		void Perform(const TopoDS_Shape & shape);

		/****** ShapeAnalysis_ShapeContents::Trimmed2dSec ******/
		/****** md5 signature: 693d57b465052fb2bdb308b10040bd27 ******/
		%feature("compactdefaultargs") Trimmed2dSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") Trimmed2dSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & Trimmed2dSec();

		/****** ShapeAnalysis_ShapeContents::Trimmed3dSec ******/
		/****** md5 signature: e81b2c686b92f9cab25b8105b7b0deaf ******/
		%feature("compactdefaultargs") Trimmed3dSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") Trimmed3dSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & Trimmed3dSec();

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
		/****** ShapeAnalysis_ShapeTolerance::ShapeAnalysis_ShapeTolerance ******/
		/****** md5 signature: 752fdf574bf9608126622d6475fe8772 ******/
		%feature("compactdefaultargs") ShapeAnalysis_ShapeTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_ShapeTolerance;
		 ShapeAnalysis_ShapeTolerance();

		/****** ShapeAnalysis_ShapeTolerance::AddTolerance ******/
		/****** md5 signature: c795a520a700e7a235b1f6e3cfa644eb ******/
		%feature("compactdefaultargs") AddTolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
Adds data on new Shape to compute Cumulated Tolerance (prepares three computations: maximal, average, minimal).
") AddTolerance;
		void AddTolerance(const TopoDS_Shape & shape, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****** ShapeAnalysis_ShapeTolerance::GlobalTolerance ******/
		/****** md5 signature: 115c6d7ad9f1f8f4b668991936ba059b ******/
		%feature("compactdefaultargs") GlobalTolerance;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
float

Description
-----------
Returns the computed tolerance according to the <mode> <mode> = 0: average <mode> > 0: maximal <mode> < 0: minimal.
") GlobalTolerance;
		Standard_Real GlobalTolerance(const Standard_Integer mode);

		/****** ShapeAnalysis_ShapeTolerance::InTolerance ******/
		/****** md5 signature: 34f3d0dc44ad0b857efc153f6da3a07f ******/
		%feature("compactdefaultargs") InTolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
valmin: float
valmax: float
type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Determines which shapes have a tolerance within a given interval <type> is interpreted as in the method Tolerance.
") InTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> InTolerance(const TopoDS_Shape & shape, const Standard_Real valmin, const Standard_Real valmax, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****** ShapeAnalysis_ShapeTolerance::InitTolerance ******/
		/****** md5 signature: b0b32e3190ada2249e730ea00f6d78db ******/
		%feature("compactdefaultargs") InitTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes computation of cumulated tolerance.
") InitTolerance;
		void InitTolerance();

		/****** ShapeAnalysis_ShapeTolerance::OverTolerance ******/
		/****** md5 signature: c7797ddd43e323f4bfc02b03651ea6eb ******/
		%feature("compactdefaultargs") OverTolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
value: float
type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Determines which shapes have a tolerance over the given value <type> is interpreted as in the method Tolerance.
") OverTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> OverTolerance(const TopoDS_Shape & shape, const Standard_Real value, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****** ShapeAnalysis_ShapeTolerance::Tolerance ******/
		/****** md5 signature: 4fba2d270084aa728e36b5461151c988 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
mode: int
type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
float

Description
-----------
Determines a tolerance from the ones stored in a shape Remark: calls InitTolerance and AddTolerance, hence, can be used to start a series for cumulating tolerance <mode> = 0: returns the average value between sub-shapes, <mode> > 0: returns the maximal found, <mode> < 0: returns the minimal found. <type> defines what kinds of sub-shapes to consider: SHAPE (default): all: VERTEX, EDGE, FACE, VERTEX: only vertices, EDGE: only edges, FACE: only faces, SHELL: combined SHELL + FACE, for each face (and containing shell), also checks EDGE and VERTEX.
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
		/****** ShapeAnalysis_Shell::ShapeAnalysis_Shell ******/
		/****** md5 signature: 030764f0c6c6127fdde3ea04e3e06130 ******/
		%feature("compactdefaultargs") ShapeAnalysis_Shell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_Shell;
		 ShapeAnalysis_Shell();

		/****** ShapeAnalysis_Shell::BadEdges ******/
		/****** md5 signature: 271874605067d1f8e996561e77de6c92 ******/
		%feature("compactdefaultargs") BadEdges;
		%feature("autodoc", "Return
-------
TopoDS_Compound

Description
-----------
Returns the list of bad edges as a Compound It is empty (not null) if no edge are recorded as bad.
") BadEdges;
		TopoDS_Compound BadEdges();

		/****** ShapeAnalysis_Shell::CheckOrientedShells ******/
		/****** md5 signature: 3972e6d2240bfe7162bfdcaaf99283d5 ******/
		%feature("compactdefaultargs") CheckOrientedShells;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
alsofree: bool (optional, default to Standard_False)
checkinternaledges: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Checks if shells fulfill orientation condition, i.e. if each edge is, either present once (free edge) or twice (connected edge) but with different orientations (FORWARD/REVERSED) Edges which do not fulfill these conditions are bad //! If <alsofree> is True free edges are considered. Free edges can be queried but are not bad.
") CheckOrientedShells;
		Standard_Boolean CheckOrientedShells(const TopoDS_Shape & shape, const Standard_Boolean alsofree = Standard_False, const Standard_Boolean checkinternaledges = Standard_False);

		/****** ShapeAnalysis_Shell::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears data about loaded shells and performed checks.
") Clear;
		void Clear();

		/****** ShapeAnalysis_Shell::FreeEdges ******/
		/****** md5 signature: 0cd90c82c4861535bb5e6f08392933ea ******/
		%feature("compactdefaultargs") FreeEdges;
		%feature("autodoc", "Return
-------
TopoDS_Compound

Description
-----------
Returns the list of free (not connected) edges as a Compound It is empty (not null) if no edge are recorded as free.
") FreeEdges;
		TopoDS_Compound FreeEdges();

		/****** ShapeAnalysis_Shell::HasBadEdges ******/
		/****** md5 signature: 1fdc9d123b53c4be47feca0d4b89c645 ******/
		%feature("compactdefaultargs") HasBadEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if at least one edge is recorded as bad.
") HasBadEdges;
		Standard_Boolean HasBadEdges();

		/****** ShapeAnalysis_Shell::HasConnectedEdges ******/
		/****** md5 signature: 373f92fac7e5286dd20af827cf765c81 ******/
		%feature("compactdefaultargs") HasConnectedEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if at least one edge is connected (shared twice or more).
") HasConnectedEdges;
		Standard_Boolean HasConnectedEdges();

		/****** ShapeAnalysis_Shell::HasFreeEdges ******/
		/****** md5 signature: 453c0e08bc8a20438ea1fa8a96a1d03d ******/
		%feature("compactdefaultargs") HasFreeEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if at least one edge is recorded as free (not connected).
") HasFreeEdges;
		Standard_Boolean HasFreeEdges();

		/****** ShapeAnalysis_Shell::IsLoaded ******/
		/****** md5 signature: 09f9f0a8c6a9692ece2c431867ab4a4b ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Tells if a shape is loaded (only shells are checked).
") IsLoaded;
		Standard_Boolean IsLoaded(const TopoDS_Shape & shape);

		/****** ShapeAnalysis_Shell::LoadShells ******/
		/****** md5 signature: 2024b788d50a942b98ddddf711a74af9 ******/
		%feature("compactdefaultargs") LoadShells;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Adds shells contained in the <shape> to the list of loaded shells.
") LoadShells;
		void LoadShells(const TopoDS_Shape & shape);

		/****** ShapeAnalysis_Shell::Loaded ******/
		/****** md5 signature: f983b60bdef3285fe766a30d6d4f39bf ******/
		%feature("compactdefaultargs") Loaded;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Shape

Description
-----------
Returns a loaded shape specified by its rank number. Returns null shape if <num> is out of range.
") Loaded;
		TopoDS_Shape Loaded(const Standard_Integer num);

		/****** ShapeAnalysis_Shell::NbLoaded ******/
		/****** md5 signature: e3f6e4c2ee1e6268545981474925e902 ******/
		%feature("compactdefaultargs") NbLoaded;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the actual number of loaded shapes (i.e. shells).
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
		/****** ShapeAnalysis_Surface::ShapeAnalysis_Surface ******/
		/****** md5 signature: 21960ac3090a4d57a0c39ee76c52d600 ******/
		%feature("compactdefaultargs") ShapeAnalysis_Surface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
Creates an analyzer object on the basis of existing surface.
") ShapeAnalysis_Surface;
		 ShapeAnalysis_Surface(const opencascade::handle<Geom_Surface> & S);

		/****** ShapeAnalysis_Surface::Adaptor3d ******/
		/****** md5 signature: 4a7d7b95e745d7a630f736bb0273d63e ******/
		%feature("compactdefaultargs") Adaptor3d;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomAdaptor_Surface>

Description
-----------
Returns the Adaptor. Creates it if not yet done.
") Adaptor3d;
		const opencascade::handle<GeomAdaptor_Surface> & Adaptor3d();

		/****** ShapeAnalysis_Surface::Bounds ******/
		/****** md5 signature: 76f4d0acb9d784f5c349713b7a3066ed ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
ufirst: float
ulast: float
vfirst: float
vlast: float

Description
-----------
Returns the bounds of the surface (from Bounds from Surface, but buffered).
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Surface::ComputeBoundIsos ******/
		/****** md5 signature: 3dcfe49429fdfd803732ee03b652e6e1 ******/
		%feature("compactdefaultargs") ComputeBoundIsos;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes bound isos (protected against exceptions).
") ComputeBoundIsos;
		void ComputeBoundIsos();

		/****** ShapeAnalysis_Surface::DegeneratedValues ******/
		/****** md5 signature: 57e334455cc553bf915f92b359503cb8 ******/
		%feature("compactdefaultargs") DegeneratedValues;
		%feature("autodoc", "
Parameters
----------
P3d: gp_Pnt
preci: float
firstP2d: gp_Pnt2d
lastP2d: gp_Pnt2d
forward: bool (optional, default to Standard_True)

Return
-------
firstpar: float
lastpar: float

Description
-----------
Returns True if there is at least one surface iso-line which is considered as degenerated with <preci> and distance between P3d and corresponding singular point is less than <preci> (like IsDegenerated). Returns characteristics of the first found boundary matching those criteria.
") DegeneratedValues;
		Standard_Boolean DegeneratedValues(const gp_Pnt & P3d, const Standard_Real preci, gp_Pnt2d & firstP2d, gp_Pnt2d & lastP2d, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean forward = Standard_True);

		/****** ShapeAnalysis_Surface::Gap ******/
		/****** md5 signature: 57884ecbe8d7b5b092e706848a3678db ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns 3D distance found by one of the following methods. IsDegenerated, DegeneratedValues, ProjectDegenerated (distance between 3D point and found or last (if not found) singularity), IsUClosed, IsVClosed (minimum value of precision to consider the surface to be closed), ValueOfUV (distance between 3D point and found solution).
") Gap;
		Standard_Real Gap();

		/****** ShapeAnalysis_Surface::GetBoxUF ******/
		/****** md5 signature: c9dc3f4e9f51cd84d29c0f0f9a257ab0 ******/
		%feature("compactdefaultargs") GetBoxUF;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") GetBoxUF;
		const Bnd_Box & GetBoxUF();

		/****** ShapeAnalysis_Surface::GetBoxUL ******/
		/****** md5 signature: d318da69dd8f77566946e59fbbc6953c ******/
		%feature("compactdefaultargs") GetBoxUL;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") GetBoxUL;
		const Bnd_Box & GetBoxUL();

		/****** ShapeAnalysis_Surface::GetBoxVF ******/
		/****** md5 signature: ca11982da2a9d9bf73b8fa28c6b275c7 ******/
		%feature("compactdefaultargs") GetBoxVF;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") GetBoxVF;
		const Bnd_Box & GetBoxVF();

		/****** ShapeAnalysis_Surface::GetBoxVL ******/
		/****** md5 signature: d91c1f96f4c164c0878a8c290feb374d ******/
		%feature("compactdefaultargs") GetBoxVL;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") GetBoxVL;
		const Bnd_Box & GetBoxVL();

		/****** ShapeAnalysis_Surface::HasSingularities ******/
		/****** md5 signature: 9ce7b9e8c08f14f920b7503e4fd1ae36 ******/
		%feature("compactdefaultargs") HasSingularities;
		%feature("autodoc", "
Parameters
----------
preci: float

Return
-------
bool

Description
-----------
Returns True if the surface has singularities for the given precision (i.e. if there are surface singularities with sizes not greater than precision).
") HasSingularities;
		Standard_Boolean HasSingularities(const Standard_Real preci);

		/****** ShapeAnalysis_Surface::Init ******/
		/****** md5 signature: ae778074c5c355f705c26cfe08f002f6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
Loads existing surface.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S);

		/****** ShapeAnalysis_Surface::Init ******/
		/****** md5 signature: da66c8f34aff2bbbe192e6bb10dec122 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
other: ShapeAnalysis_Surface

Return
-------
None

Description
-----------
Reads all the data from another Surface, without recomputing.
") Init;
		void Init(const opencascade::handle<ShapeAnalysis_Surface> & other);

		/****** ShapeAnalysis_Surface::IsDegenerated ******/
		/****** md5 signature: 2e83fa02bb73008ad42dcf354f3309e0 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
P3d: gp_Pnt
preci: float

Return
-------
bool

Description
-----------
Returns True if there is at least one surface boundary which is considered as degenerated with <preci> and distance between P3d and corresponding singular point is less than <preci>.
") IsDegenerated;
		Standard_Boolean IsDegenerated(const gp_Pnt & P3d, const Standard_Real preci);

		/****** ShapeAnalysis_Surface::IsDegenerated ******/
		/****** md5 signature: 73b532d2945208b748a3d0135fc0559d ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
p2d1: gp_Pnt2d
p2d2: gp_Pnt2d
tol: float
ratio: float

Return
-------
bool

Description
-----------
Returns True if straight pcurve going from point p2d1 to p2d2 is degenerate, i.e. lies in the singularity of the surface. NOTE: it uses another method of detecting singularity than used by ComputeSingularities() et al.! For that, maximums of distances between points p2d1, p2d2 and 0.5*(p2d1+p2d2) and between corresponding 3d points are computed. The pcurve (p2d1, p2d2) is considered as degenerate if: - max distance in 3d is less than <tol> - max distance in 2d is at least <ratio> times greater than the Resolution computed from max distance in 3d (max3d < tol && max2d > ratio * Resolution(max3d)) NOTE: <ratio> should be >1 (e.g. 10).
") IsDegenerated;
		Standard_Boolean IsDegenerated(const gp_Pnt2d & p2d1, const gp_Pnt2d & p2d2, const Standard_Real tol, const Standard_Real ratio);

		/****** ShapeAnalysis_Surface::IsUClosed ******/
		/****** md5 signature: c40ec6bf32caddb2bddec999a738f122 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "
Parameters
----------
preci: float (optional, default to -1)

Return
-------
bool

Description
-----------
Tells if the Surface is spatially closed in U with given precision. If <preci> < 0 then Precision::Confusion is used. If Geom_Surface says that the surface is U-closed, this method also says this. Otherwise additional analysis is performed, comparing given precision with the following distances: - periodic B-Splines are closed, - polynomial B-Spline with boundary multiplicities degree+1 and Bezier - maximum distance between poles, - rational B-Spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of extrusion - distance between ends of basis curve, - other (RectangularTrimmed and Offset) - maximum distance computed at 100 equi-distanted points.
") IsUClosed;
		Standard_Boolean IsUClosed(const Standard_Real preci = -1);

		/****** ShapeAnalysis_Surface::IsVClosed ******/
		/****** md5 signature: f6d9fabf565ea50ba091c941e92de75d ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "
Parameters
----------
preci: float (optional, default to -1)

Return
-------
bool

Description
-----------
Tells if the Surface is spatially closed in V with given precision. If <preci> < 0 then Precision::Confusion is used. If Geom_Surface says that the surface is V-closed, this method also says this. Otherwise additional analysis is performed, comparing given precision with the following distances: - periodic B-Splines are closed, - polynomial B-Spline with boundary multiplicities degree+1 and Bezier - maximum distance between poles, - rational B-Spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of revolution - distance between ends of basis curve, - other (RectangularTrimmed and Offset) - maximum distance computed at 100 equi-distanted points.
") IsVClosed;
		Standard_Boolean IsVClosed(const Standard_Real preci = -1);

		/****** ShapeAnalysis_Surface::NbSingularities ******/
		/****** md5 signature: 7d7076a67b99b706ffbc6b95cf1eb7d6 ******/
		%feature("compactdefaultargs") NbSingularities;
		%feature("autodoc", "
Parameters
----------
preci: float

Return
-------
int

Description
-----------
Returns the number of singularities for the given precision (i.e. number of surface singularities with sizes not greater than precision).
") NbSingularities;
		Standard_Integer NbSingularities(const Standard_Real preci);

		/****** ShapeAnalysis_Surface::NextValueOfUV ******/
		/****** md5 signature: 8f75d76c37899f095d2b498ceb77fdd1 ******/
		%feature("compactdefaultargs") NextValueOfUV;
		%feature("autodoc", "
Parameters
----------
p2dPrev: gp_Pnt2d
P3D: gp_Pnt
preci: float
maxpreci: float (optional, default to -1.0)

Return
-------
gp_Pnt2d

Description
-----------
Projects a point P3D on the surface. Does the same thing as ValueOfUV but tries to optimize computations by taking into account previous point <p2dPrev>: makes a step by UV and tries Newton algorithm. If <maxpreci> >0. and distance between solution and P3D is greater than <maxpreci>, that solution is considered as bad, and ValueOfUV() is used. If not succeeded, calls ValueOfUV().
") NextValueOfUV;
		gp_Pnt2d NextValueOfUV(const gp_Pnt2d & p2dPrev, const gp_Pnt & P3D, const Standard_Real preci, const Standard_Real maxpreci = -1.0);

		/****** ShapeAnalysis_Surface::ProjectDegenerated ******/
		/****** md5 signature: 68d10f9a8bc6625bfc577f28b5ce9a6e ******/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "
Parameters
----------
P3d: gp_Pnt
preci: float
neighbour: gp_Pnt2d
result: gp_Pnt2d

Return
-------
bool

Description
-----------
Projects a point <P3d> on a singularity by computing one of the coordinates of preliminary computed <result>. //! Finds the iso-line which is considered as degenerated with <preci> and a. distance between P3d and corresponding singular point is less than <preci> (like IsDegenerated) or b. difference between already computed <result>'s coordinate and iso-coordinate of the boundary is less than 2D resolution (computed from <preci> by Geom_Adaptor). Then sets not yet computed <result>'s coordinate taking it from <neighbour> and returns True.
") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated(const gp_Pnt & P3d, const Standard_Real preci, const gp_Pnt2d & neighbour, gp_Pnt2d & result);

		/****** ShapeAnalysis_Surface::ProjectDegenerated ******/
		/****** md5 signature: 3f70c3d1eada5fb87f6635ce6fb33825 ******/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "
Parameters
----------
nbrPnt: int
points: TColgp_SequenceOfPnt
pnt2d: TColgp_SequenceOfPnt2d
preci: float
direct: bool

Return
-------
bool

Description
-----------
Checks points at the beginning (direct is True) or end (direct is False) of array <points> to lie in singularity of surface, and if yes, adjusts the indeterminate 2d coordinate of these points by nearest point which is not in singularity. Returns True if some points were adjusted.
") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated(const Standard_Integer nbrPnt, const TColgp_SequenceOfPnt & points, TColgp_SequenceOfPnt2d & pnt2d, const Standard_Real preci, const Standard_Boolean direct);

		/****** ShapeAnalysis_Surface::SetDomain ******/
		/****** md5 signature: 242f6d4e5af20c56462421b031aafd66 ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
V1: float
V2: float

Return
-------
None

Description
-----------
No available documentation.
") SetDomain;
		void SetDomain(const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2);

		/****** ShapeAnalysis_Surface::Singularity ******/
		/****** md5 signature: 3da019b1f8fced06e45e0430b0c745b0 ******/
		%feature("compactdefaultargs") Singularity;
		%feature("autodoc", "
Parameters
----------
num: int
P3d: gp_Pnt
firstP2d: gp_Pnt2d
lastP2d: gp_Pnt2d

Return
-------
preci: float
firstpar: float
lastpar: float
uisodeg: bool

Description
-----------
Returns the characteristics of the singularity specified by its rank number <num>. That means, that it is not necessary for <num> to be in the range [1, NbSingularities] but must be not greater than possible (see ComputeSingularities). The returned characteristics are: preci: the smallest precision with which the iso-line is considered as degenerated, P3d: 3D point of singularity (middle point of the surface iso-line), firstP2d and lastP2d: first and last 2D points of the iso-line in parametrical surface, firstpar and lastpar: first and last parameters of the iso-line in parametrical surface, uisodeg: if the degenerated iso-line is U-iso (True) or V-iso (False). Returns False if <num> is out of range, else returns True.
") Singularity;
		Standard_Boolean Singularity(const Standard_Integer num, Standard_Real &OutValue, gp_Pnt & P3d, gp_Pnt2d & firstP2d, gp_Pnt2d & lastP2d, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****** ShapeAnalysis_Surface::Surface ******/
		/****** md5 signature: a469e18cbceeb351572a461f96ff0f4d ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns a surface being analyzed.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****** ShapeAnalysis_Surface::TrueAdaptor3d ******/
		/****** md5 signature: 83b3798d6206a15a81c91320fc25472f ******/
		%feature("compactdefaultargs") TrueAdaptor3d;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomAdaptor_Surface>

Description
-----------
Returns the Adaptor (may be Null if method Adaptor() was not called).
") TrueAdaptor3d;
		const opencascade::handle<GeomAdaptor_Surface> & TrueAdaptor3d();

		/****** ShapeAnalysis_Surface::UCloseVal ******/
		/****** md5 signature: 6b05bece8dc5d04e6e44b77fe1c48cb5 ******/
		%feature("compactdefaultargs") UCloseVal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns minimum value to consider the surface as U-closed.
") UCloseVal;
		Standard_Real UCloseVal();

		/****** ShapeAnalysis_Surface::UIso ******/
		/****** md5 signature: c1c342549cd981b000bd1d4af5482ca4 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns a U-Iso. Null if not possible or failed Remark: bound isos are buffered.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** ShapeAnalysis_Surface::UVFromIso ******/
		/****** md5 signature: e2de878450fa82115c49dd434fcfc093 ******/
		%feature("compactdefaultargs") UVFromIso;
		%feature("autodoc", "
Parameters
----------
P3D: gp_Pnt
preci: float

Return
-------
U: float
V: float

Description
-----------
Tries a refinement of an already computed couple (U,V) by using projecting 3D point on iso-lines: 1. boundaries of the surface, 2. iso-lines passing through (U,V) 3. iteratively received iso-lines passing through new U and new V (number of iterations is limited by 5 in each direction) Returns the best resulting distance between P3D and Value(U,V) in the case of success. Else, returns a very great value.
") UVFromIso;
		Standard_Real UVFromIso(const gp_Pnt & P3D, const Standard_Real preci, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Surface::VCloseVal ******/
		/****** md5 signature: b8919a074acc63a2b5cc3c96ab56f22f ******/
		%feature("compactdefaultargs") VCloseVal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns minimum value to consider the surface as V-closed.
") VCloseVal;
		Standard_Real VCloseVal();

		/****** ShapeAnalysis_Surface::VIso ******/
		/****** md5 signature: ebe921330c7ad9c072516f16a826029a ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns a V-Iso. Null if not possible or failed Remark: bound isos are buffered.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** ShapeAnalysis_Surface::Value ******/
		/****** md5 signature: cbce9954c3f8356bc5ff7daec7cc3d73 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
u: float
v: float

Return
-------
gp_Pnt

Description
-----------
Returns a 3D point specified by parameters in surface parametrical space.
") Value;
		gp_Pnt Value(const Standard_Real u, const Standard_Real v);

		/****** ShapeAnalysis_Surface::Value ******/
		/****** md5 signature: 0fe24f801581318aa93b8fb433b0846a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
p2d: gp_Pnt2d

Return
-------
gp_Pnt

Description
-----------
Returns a 3d point specified by a point in surface parametrical space.
") Value;
		gp_Pnt Value(const gp_Pnt2d & p2d);

		/****** ShapeAnalysis_Surface::ValueOfUV ******/
		/****** md5 signature: 30c2501f79ba8097c2637171078cf0f6 ******/
		%feature("compactdefaultargs") ValueOfUV;
		%feature("autodoc", "
Parameters
----------
P3D: gp_Pnt
preci: float

Return
-------
gp_Pnt2d

Description
-----------
Computes the parameters in the surface parametrical space of 3D point. The result is parameters of the point projected onto the surface. This method enhances functionality provided by the standard tool GeomAPI_ProjectPointOnSurface by treatment of cases when the projected point is near to the surface boundaries and when this standard tool fails.
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
		/****** ShapeAnalysis_TransferParameters::ShapeAnalysis_TransferParameters ******/
		/****** md5 signature: e478d03b43439148c5c85e4933eadb2d ******/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty tool with myShift = 0 and myScale = 1.
") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters();

		/****** ShapeAnalysis_TransferParameters::ShapeAnalysis_TransferParameters ******/
		/****** md5 signature: 35134c0d6d2075be25ca3b61e29d1a6b ******/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParameters;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Creates a tool and initializes it with edge and face.
") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** ShapeAnalysis_TransferParameters::Init ******/
		/****** md5 signature: ef2c331746b4da93a143b60fab0ba8d9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Initialize a tool with edge and face.
") Init;
		virtual void Init(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** ShapeAnalysis_TransferParameters::IsSameRange ******/
		/****** md5 signature: 99648b02a9860bd70f64a9d5370c88dc ******/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if 3d curve of edge and pcurve are SameRange (in default implementation, if myScale == 1 and myShift == 0).
") IsSameRange;
		virtual Standard_Boolean IsSameRange();

		/****** ShapeAnalysis_TransferParameters::Perform ******/
		/****** md5 signature: 569a38113f890abeb573d5f03eff3bee ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Params: TColStd_HSequenceOfReal
To2d: bool

Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
Transfers parameters given by sequence Params from 3d curve to pcurve (if To2d is True) or back (if To2d is False).
") Perform;
		virtual opencascade::handle<TColStd_HSequenceOfReal> Perform(const opencascade::handle<TColStd_HSequenceOfReal> & Params, const Standard_Boolean To2d);

		/****** ShapeAnalysis_TransferParameters::Perform ******/
		/****** md5 signature: 219bbdcc68f6f7c5ccf614efead2dc54 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: float
To2d: bool

Return
-------
float

Description
-----------
Transfers parameter given by sequence Params from 3d curve to pcurve (if To2d is True) or back (if To2d is False).
") Perform;
		virtual Standard_Real Perform(const Standard_Real Param, const Standard_Boolean To2d);

		/****** ShapeAnalysis_TransferParameters::SetMaxTolerance ******/
		/****** md5 signature: ab801fe49011ef1da17c304e1a6984da ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
maxtol: float

Return
-------
None

Description
-----------
Sets maximal tolerance to use linear recomputation of parameters.
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real maxtol);

		/****** ShapeAnalysis_TransferParameters::TransferRange ******/
		/****** md5 signature: 48dc87038b2cb3597a7bacd486d3949a ******/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "
Parameters
----------
newEdge: TopoDS_Edge
prevPar: float
currPar: float
To2d: bool

Return
-------
None

Description
-----------
Recomputes range of curves from NewEdge. If Is2d equals True parameters are recomputed by curve2d else by curve3d.
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
		/****** ShapeAnalysis_Wire::ShapeAnalysis_Wire ******/
		/****** md5 signature: cce979af71799d0af9492d8d05e74c7f ******/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire();

		/****** ShapeAnalysis_Wire::ShapeAnalysis_Wire ******/
		/****** md5 signature: ffbc3647ff20aed51e29b0e68f1b9b48 ******/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
precision: float

Return
-------
None

Description
-----------
Creates object with standard TopoDS_Wire, face and precision.
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire(const TopoDS_Wire & wire, const TopoDS_Face & face, const Standard_Real precision);

		/****** ShapeAnalysis_Wire::ShapeAnalysis_Wire ******/
		/****** md5 signature: dae85a89d668b4972f6f80ec74417e75 ******/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "
Parameters
----------
sbwd: ShapeExtend_WireData
face: TopoDS_Face
precision: float

Return
-------
None

Description
-----------
Creates the object with WireData object, face and precision.
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire(const opencascade::handle<ShapeExtend_WireData> & sbwd, const TopoDS_Face & face, const Standard_Real precision);

		/****** ShapeAnalysis_Wire::CheckClosed ******/
		/****** md5 signature: c049a36b9fb9e1ba653b29bb7648cddf ******/
		%feature("compactdefaultargs") CheckClosed;
		%feature("autodoc", "
Parameters
----------
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks if wire is closed, performs CheckConnected, CheckDegenerated and CheckLacking for the first and the last edges Returns: True if at least one check returned True Status: FAIL1 or DONE1: see CheckConnected FAIL2 or DONE2: see CheckDegenerated.
") CheckClosed;
		Standard_Boolean CheckClosed(const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckConnected ******/
		/****** md5 signature: af19f6a4d210c6631cae8c4163489f90 ******/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "
Parameters
----------
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Calls to CheckConnected for each edge Returns: True if at least one pair of disconnected edges (not sharing the same vertex) was detected.
") CheckConnected;
		Standard_Boolean CheckConnected(const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckConnected ******/
		/****** md5 signature: abaeb0271f4e2c19ab97ef3799de3bfd ******/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "
Parameters
----------
num: int
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks connected edges (num-th and preceding). Tests with starting preci from <SBWD> or with <prec> if it is greater. Considers Vertices. Returns: False if edges are connected by the common vertex, else True Status: OK: Vertices (end of num-1 th edge and start on num-th one) are already the same DONE1: Absolutely confused (gp::Resolution) DONE2: Confused at starting <preci> from <SBWD> DONE3: Confused at <prec> but not <preci> FAIL1: Not confused FAIL2: Not confused but confused with <preci> if reverse num-th edge.
") CheckConnected;
		Standard_Boolean CheckConnected(const Standard_Integer num, const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckCurveGap ******/
		/****** md5 signature: 5fa6f13569f3b55f1b6a53093f41a4fc ******/
		%feature("compactdefaultargs") CheckCurveGap;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks gap between points on 3D curve and points on surface generated by pcurve of the num-th edge. The distance can be queried by MinDistance3d. //! Returns: True if status is DONE Status: OK: Gap is less than myPrecision DONE: Gap is greater than myPrecision FAIL: No 3d curve(s) on the edge(s).
") CheckCurveGap;
		Standard_Boolean CheckCurveGap(const Standard_Integer num = 0);

		/****** ShapeAnalysis_Wire::CheckCurveGaps ******/
		/****** md5 signature: 868735f423ab1e8b899d12d32c2e2d3c ******/
		%feature("compactdefaultargs") CheckCurveGaps;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckCurveGaps;
		Standard_Boolean CheckCurveGaps();

		/****** ShapeAnalysis_Wire::CheckDegenerated ******/
		/****** md5 signature: 7bfd145b6f006c99f2e59a712b4f8356 ******/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Calls to CheckDegenerated for each edge Returns: True if at least one incorrect degenerated edge was detected.
") CheckDegenerated;
		Standard_Boolean CheckDegenerated();

		/****** ShapeAnalysis_Wire::CheckDegenerated ******/
		/****** md5 signature: 1fa1510ebdf1a3475b2c4f751616ed2a ******/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "
Parameters
----------
num: int
dgnr1: gp_Pnt2d
dgnr2: gp_Pnt2d

Return
-------
bool

Description
-----------
Checks for degenerated edge between two adjacent ones. Fills parameters dgnr1 and dgnr2 with points in parametric space that correspond to the singularity (either gap that needs to be filled by degenerated edge or that already filled) Returns: False if no singularity or edge is already degenerated, otherwise True Status: OK: No surface singularity, or edge is already degenerated DONE1: Degenerated edge should be inserted (gap in 2D) DONE2: Edge <num> should be made degenerated (recompute pcurve and set the flag) FAIL1: One of edges neighbouring to degenerated one has no pcurve FAIL2: Edge marked as degenerated and has no pcurve but singularity is not detected.
") CheckDegenerated;
		Standard_Boolean CheckDegenerated(const Standard_Integer num, gp_Pnt2d & dgnr1, gp_Pnt2d & dgnr2);

		/****** ShapeAnalysis_Wire::CheckDegenerated ******/
		/****** md5 signature: 3b6ebe420548c955a4d9aa0875ccbfd4 ******/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Checks for degenerated edge between two adjacent ones. Remark: Calls previous function Status: See the function above for details.
") CheckDegenerated;
		Standard_Boolean CheckDegenerated(const Standard_Integer num);

		/****** ShapeAnalysis_Wire::CheckEdgeCurves ******/
		/****** md5 signature: f765d450e50275b806856816ca07a0ce ******/
		%feature("compactdefaultargs") CheckEdgeCurves;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks edges geometry (consistency of 2d and 3d senses, adjasment of curves to the vertices, etc.). The order of the checks: Call ShapeAnalysis_Wire to check: ShapeAnalysis_Edge::CheckCurve3dWithPCurve (1), ShapeAnalysis_Edge::CheckVertcesWithPCurve (2), ShapeAnalysis_Edge::CheckVertcesWithCurve3d (3), CheckSeam   (4) Additional: CheckGap3d  (5), CheckGap2d  (6), ShapeAnalysis_Edge::CheckSameParameter (7) Returns: True if at least one check returned True Remark: The numbers in brackets show with what DONEi or FAILi the status can be queried.
") CheckEdgeCurves;
		Standard_Boolean CheckEdgeCurves();

		/****** ShapeAnalysis_Wire::CheckGap2d ******/
		/****** md5 signature: 24f4a5e0b2b4a9af5acc632ecdd068d3 ******/
		%feature("compactdefaultargs") CheckGap2d;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks gap between edges in 2D (pcurves). Checks the distance between ends of pcurves of the num-th and preceding edge. The distance can be queried by MinDistance2d. //! Returns: True if status is DONE Status: OK: Gap is less than parametric precision out of myPrecision DONE: Gap is greater than parametric precision out of myPrecision FAIL: No pcurve(s) on the edge(s).
") CheckGap2d;
		Standard_Boolean CheckGap2d(const Standard_Integer num = 0);

		/****** ShapeAnalysis_Wire::CheckGap3d ******/
		/****** md5 signature: ffb83a77fe32afc90de4b17a854712b9 ******/
		%feature("compactdefaultargs") CheckGap3d;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks gap between edges in 3D (3d curves). Checks the distance between ends of 3d curves of the num-th and preceding edge. The distance can be queried by MinDistance3d. //! Returns: True if status is DONE Status: OK: Gap is less than myPrecision DONE: Gap is greater than myPrecision FAIL: No 3d curve(s) on the edge(s).
") CheckGap3d;
		Standard_Boolean CheckGap3d(const Standard_Integer num = 0);

		/****** ShapeAnalysis_Wire::CheckGaps2d ******/
		/****** md5 signature: 8410cfe06b9be03db82c22b21ff5c6c3 ******/
		%feature("compactdefaultargs") CheckGaps2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckGaps2d;
		Standard_Boolean CheckGaps2d();

		/****** ShapeAnalysis_Wire::CheckGaps3d ******/
		/****** md5 signature: a0d70b63c85bc72ac2abc05d68972a68 ******/
		%feature("compactdefaultargs") CheckGaps3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckGaps3d;
		Standard_Boolean CheckGaps3d();

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: fddcf1c5324c54e2c483221ecc83134d ******/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "
Parameters
----------
num: int
points2d: IntRes2d_SequenceOfIntersectionPoint
points3d: TColgp_SequenceOfPnt
errors: TColStd_SequenceOfReal

Return
-------
bool

Description
-----------
Checks two adjacent edges for intersecting. Intersection is reported only if intersection point is not enclosed by the common end vertex of the edges. Returns: True if intersection is found. If returns True it also fills the sequences of intersection points, corresponding 3d points, and errors for them (half-distances between intersection points in 3d calculated from one and from another edge) Status: FAIL1: No pcurve FAIL2: No vertices DONE1: Self-intersection found.
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num, IntRes2d_SequenceOfIntersectionPoint & points2d, TColgp_SequenceOfPnt & points3d, TColStd_SequenceOfReal & errors);

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: f391a41b1a78af6ec3a8c8d3350a1ce0 ******/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Checks two adjacent edges for intersecting. Remark: Calls the previous method Status: See the function above for details.
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num);

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: 7f7647c46034ee073b7fc12bde95bba7 ******/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int
points2d: IntRes2d_SequenceOfIntersectionPoint
points3d: TColgp_SequenceOfPnt
errors: TColStd_SequenceOfReal

Return
-------
bool

Description
-----------
Checks i-th and j-th edges for intersecting. Remark: See the previous method for details.
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num1, const Standard_Integer num2, IntRes2d_SequenceOfIntersectionPoint & points2d, TColgp_SequenceOfPnt & points3d, TColStd_SequenceOfReal & errors);

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: f20740aaee100f7e77b31f2e64a64c53 ******/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
bool

Description
-----------
Checks i-th and j-th edges for intersecting. Remark: Calls previous method. Status: See the function above for details.
") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges(const Standard_Integer num1, const Standard_Integer num2);

		/****** ShapeAnalysis_Wire::CheckLacking ******/
		/****** md5 signature: b9a150e87c8ddbaeb71fedfce81e0e0a ******/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Calls to CheckLacking for each edge Returns: True if at least one lacking edge was detected.
") CheckLacking;
		Standard_Boolean CheckLacking();

		/****** ShapeAnalysis_Wire::CheckLacking ******/
		/****** md5 signature: 46fb470311870e747acd5d1ce85dca8a ******/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "
Parameters
----------
num: int
Tolerance: float
p2d1: gp_Pnt2d
p2d2: gp_Pnt2d

Return
-------
bool

Description
-----------
Checks if there is a gap in 2d between edges, not comprised by the tolerance of their common vertex. If <Tolerance> is greater than 0. and less than tolerance of the vertex, then this value is used for check. Returns: True if not closed gap was detected p2d1 and p2d2 are the endpoint of <num-1>th edge and start of the <num>th edge in 2d. Status: OK: No edge is lacking (3d and 2d connection) FAIL1: edges have no vertices (at least one of them) FAIL2: edges are neither connected by common vertex, nor have coincided vertices FAIL1: edges have no pcurves DONE1: the gap is detected which cannot be closed by the tolerance of the common vertex (or with value of <Tolerance>) DONE2: is set (together with DONE1) if gap is detected and the vector (p2d2 - p2d1) goes in direction opposite to the pcurves of the edges (if angle is more than 0.9*PI).
") CheckLacking;
		Standard_Boolean CheckLacking(const Standard_Integer num, const Standard_Real Tolerance, gp_Pnt2d & p2d1, gp_Pnt2d & p2d2);

		/****** ShapeAnalysis_Wire::CheckLacking ******/
		/****** md5 signature: 2206a679277c4649255f484456730ef6 ******/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "
Parameters
----------
num: int
Tolerance: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks if there is a gap in 2D between edges and not comprised by vertex tolerance The value of SBWD.thepreci is used. Returns: False if no edge should be inserted Status: OK: No edge is lacking (3d and 2d connection) DONE1: The vertex tolerance should be increased only (2d gap is small) DONE2: Edge can be inserted (3d and 2d gaps are large enough).
") CheckLacking;
		Standard_Boolean CheckLacking(const Standard_Integer num, const Standard_Real Tolerance = 0.0);

		/****** ShapeAnalysis_Wire::CheckLoop ******/
		/****** md5 signature: c95ccb397df77c1565de7d6d15910099 ******/
		%feature("compactdefaultargs") CheckLoop;
		%feature("autodoc", "
Parameters
----------
aMapLoopVertices: TopTools_IndexedMapOfShape
aMapVertexEdges: TopTools_DataMapOfShapeListOfShape
aMapSmallEdges: TopTools_MapOfShape
aMapSeemEdges: TopTools_MapOfShape

Return
-------
bool

Description
-----------
Checks existence of loop on wire and return vertices which are loop vertices (vertices belonging to a few pairs of edges).
") CheckLoop;
		Standard_Boolean CheckLoop(TopTools_IndexedMapOfShape & aMapLoopVertices, TopTools_DataMapOfShapeListOfShape & aMapVertexEdges, TopTools_MapOfShape & aMapSmallEdges, TopTools_MapOfShape & aMapSeemEdges);

		/****** ShapeAnalysis_Wire::CheckNotchedEdges ******/
		/****** md5 signature: fa138234ce28880d741cf30db7ee496f ******/
		%feature("compactdefaultargs") CheckNotchedEdges;
		%feature("autodoc", "
Parameters
----------
num: int
Tolerance: float (optional, default to 0.0)

Return
-------
shortNum: int
param: float

Description
-----------
Detects a notch.
") CheckNotchedEdges;
		Standard_Boolean CheckNotchedEdges(const Standard_Integer num, Standard_Integer &OutValue, Standard_Real &OutValue, const Standard_Real Tolerance = 0.0);

		/****** ShapeAnalysis_Wire::CheckOrder ******/
		/****** md5 signature: 0c24436001ebd425c86bdc68dbe4c3c5 ******/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "
Parameters
----------
isClosed: bool (optional, default to Standard_True)
mode3d: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Calls CheckOrder and returns False if wire is already ordered (tail-to-head), True otherwise Flag <isClosed> defines if the wire is closed or not Flag <mode3d> defines which mode is used (3d or 2d).
") CheckOrder;
		Standard_Boolean CheckOrder(const Standard_Boolean isClosed = Standard_True, const Standard_Boolean mode3d = Standard_True);

		/****** ShapeAnalysis_Wire::CheckOrder ******/
		/****** md5 signature: 90589d1674c86d09625d55d1a899f1bb ******/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "
Parameters
----------
sawo: ShapeAnalysis_WireOrder
isClosed: bool (optional, default to Standard_True)
theMode3D: bool (optional, default to Standard_True)
theModeBoth: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Analyzes the order of the edges in the wire, uses class WireOrder for that purpose. Flag <isClosed> defines if the wire is closed or not Flag <theMode3D> defines 3D or 2d mode. Flag <theModeBoth> defines miscible mode and the flag <theMode3D> is ignored. Returns False if wire is already ordered (tail-to-head), True otherwise. Use returned WireOrder object for deeper analysis. Status: OK: the same edges orientation, the same edges sequence DONE1: the same edges orientation, not the same edges sequence DONE2: as DONE1 and gaps more than myPrecision DONE3: not the same edges orientation (some need to be reversed) DONE4: as DONE3 and gaps more than myPrecision FAIL: algorithm failed (could not detect order).
") CheckOrder;
		Standard_Boolean CheckOrder(ShapeAnalysis_WireOrder & sawo, Standard_Boolean isClosed = Standard_True, Standard_Boolean theMode3D = Standard_True, Standard_Boolean theModeBoth = Standard_False);

		/****** ShapeAnalysis_Wire::CheckOuterBound ******/
		/****** md5 signature: fa98a8de9235f276333826373de925cc ******/
		%feature("compactdefaultargs") CheckOuterBound;
		%feature("autodoc", "
Parameters
----------
APIMake: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Checks if wire defines an outer bound on the face Uses ShapeAnalysis::IsOuterBound for analysis If <APIMake> is True uses BRepAPI_MakeWire to build the wire, if False (to be used only when edges share common vertices) uses BRep_Builder to build the wire.
") CheckOuterBound;
		Standard_Boolean CheckOuterBound(const Standard_Boolean APIMake = Standard_True);

		/****** ShapeAnalysis_Wire::CheckSeam ******/
		/****** md5 signature: 3e220d590fcf51314c04169f7c36b88c ******/
		%feature("compactdefaultargs") CheckSeam;
		%feature("autodoc", "
Parameters
----------
num: int
C1: Geom2d_Curve
C2: Geom2d_Curve

Return
-------
cf: float
cl: float

Description
-----------
Checks if a seam pcurves are correct oriented Returns: False (status OK) if given edge is not a seam or if it is OK C1 - current pcurve for FORWARD edge, C2 - current pcurve for REVERSED edge (if returns True they should be swapped for the seam), cf, cl - first and last parameters on curves Status: OK: Pcurves are correct or edge is not seam DONE: Seam pcurves should be swapped.
") CheckSeam;
		Standard_Boolean CheckSeam(const Standard_Integer num, opencascade::handle<Geom2d_Curve> & C1, opencascade::handle<Geom2d_Curve> & C2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Wire::CheckSeam ******/
		/****** md5 signature: f6efbc8a6369b2127add9abc08f468a7 ******/
		%feature("compactdefaultargs") CheckSeam;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Checks if a seam pcurves are correct oriented See previous functions for details.
") CheckSeam;
		Standard_Boolean CheckSeam(const Standard_Integer num);

		/****** ShapeAnalysis_Wire::CheckSelfIntersectingEdge ******/
		/****** md5 signature: 3e1cfb25605cda3e634c2fe6a570e449 ******/
		%feature("compactdefaultargs") CheckSelfIntersectingEdge;
		%feature("autodoc", "
Parameters
----------
num: int
points2d: IntRes2d_SequenceOfIntersectionPoint
points3d: TColgp_SequenceOfPnt

Return
-------
bool

Description
-----------
Checks if num-th edge is self-intersecting. Self-intersection is reported only if intersection point lies outside of both end vertices of the edge. Returns: True if edge is self-intersecting. If returns True it also fills the sequences of intersection points and corresponding 3d points (only that are not enclosed by a vertices) Status: FAIL1: No pcurve FAIL2: No vertices DONE1: Self-intersection found.
") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge(const Standard_Integer num, IntRes2d_SequenceOfIntersectionPoint & points2d, TColgp_SequenceOfPnt & points3d);

		/****** ShapeAnalysis_Wire::CheckSelfIntersectingEdge ******/
		/****** md5 signature: f867bf45439d9b4871e37a6621b4cdc0 ******/
		%feature("compactdefaultargs") CheckSelfIntersectingEdge;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
No available documentation.
") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge(const Standard_Integer num);

		/****** ShapeAnalysis_Wire::CheckSelfIntersection ******/
		/****** md5 signature: 828f8e26a77ac090be6a96994828b03d ******/
		%feature("compactdefaultargs") CheckSelfIntersection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks self-intersection of the wire (considering pcurves) Looks for self-intersecting edges and each pair of intersecting edges. Warning: It does not check each edge with any other one (only each two adjacent edges) The order of the checks: CheckSelfIntersectingEdge, CheckIntersectingEdges Returns: True if at least one check returned True Status: FAIL1 or DONE1 - see CheckSelfIntersectingEdge FAIL2 or DONE2 - see CheckIntersectingEdges.
") CheckSelfIntersection;
		Standard_Boolean CheckSelfIntersection();

		/****** ShapeAnalysis_Wire::CheckShapeConnect ******/
		/****** md5 signature: 0a79b66d7b431d4b26c20c6461576e0b ******/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
prec: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks with what orientation <shape> (wire or edge) can be connected to the wire. Tests distances with starting <preci> from <SBWD> (close confusion), but if given <prec> is greater, tests with <prec> (coarse confusion). The smallest found distance can be returned by MinDistance3d //! Returns: False if status is FAIL (see below) Status: DONE1: If <shape> follows <SBWD>, direct sense (normal) DONE2: If <shape> follows <SBWD>, but if reversed DONE3: If <shape> precedes <SBWD>, direct sense DONE4: If <shape> precedes <SBWD>, but if reversed FAIL1: If <shape> is neither an edge nor a wire FAIL2: If <shape> cannot be connected to <SBWD> //! DONE5: To the tail of <SBWD> the <shape> is closer with direct sense DONE6: To the head of <SBWD> the <shape> is closer with direct sense //! Remark: Statuses DONE1 - DONE4, FAIL1 - FAIL2 are basic and describe the nearest connection of the <shape> to <SBWD>. Statuses DONE5 and DONE6 are advanced and are to be used when analyzing with what sense (direct or reversed) the <shape> should be connected to <SBWD>: For tail of <SBWD> if DONE4 is True <shape> should be direct, otherwise reversed. For head of <SBWD> if DONE5 is True <shape> should be direct, otherwise reversed.
") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect(const TopoDS_Shape & shape, const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckShapeConnect ******/
		/****** md5 signature: 0b1571f9c750cbf62d65d5a450d12b85 ******/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
prec: float (optional, default to 0.0)

Return
-------
tailhead: float
tailtail: float
headtail: float
headhead: float

Description
-----------
The same as previous CheckShapeConnect but is more advanced. It returns the distances between each end of <sbwd> and each end of <shape>. For example, <tailhead> stores distance between tail of <sbwd> and head of <shape> Remark: First method CheckShapeConnect calls this one.
") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const TopoDS_Shape & shape, const Standard_Real prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckSmall ******/
		/****** md5 signature: 5573c69b574523f74c4f89bcac123cff ******/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "
Parameters
----------
precsmall: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Calls to CheckSmall for each edge Returns: True if at least one small edge was detected.
") CheckSmall;
		Standard_Boolean CheckSmall(const Standard_Real precsmall = 0.0);

		/****** ShapeAnalysis_Wire::CheckSmall ******/
		/****** md5 signature: 920ff3411d0f144713715d87d6f71556 ******/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "
Parameters
----------
num: int
precsmall: float (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks if an edge has a length not greater than myPreci or precsmall (if it is smaller) Returns: False if its length is greater than precision Status: OK: edge is not small or degenerated DONE1: edge is small, vertices are the same DONE2: edge is small, vertices are not the same FAIL: no 3d curve and pcurve.
") CheckSmall;
		Standard_Boolean CheckSmall(const Standard_Integer num, const Standard_Real precsmall = 0.0);

		/****** ShapeAnalysis_Wire::CheckSmallArea ******/
		/****** md5 signature: e3d75b4d4d23e31912c108414bc6189c ******/
		%feature("compactdefaultargs") CheckSmallArea;
		%feature("autodoc", "
Parameters
----------
theWire: TopoDS_Wire

Return
-------
bool

Description
-----------
Checks if wire has parametric area less than precision.
") CheckSmallArea;
		Standard_Boolean CheckSmallArea(const TopoDS_Wire & theWire);

		/****** ShapeAnalysis_Wire::CheckTail ******/
		/****** md5 signature: 321fb81a600bd5e9a348e9ae3975c76a ******/
		%feature("compactdefaultargs") CheckTail;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
No available documentation.
") CheckTail;
		Standard_Boolean CheckTail(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const Standard_Real theMaxSine, const Standard_Real theMaxWidth, const Standard_Real theMaxTolerance, TopoDS_Edge & theEdge11, TopoDS_Edge & theEdge12, TopoDS_Edge & theEdge21, TopoDS_Edge & theEdge22);

		/****** ShapeAnalysis_Wire::ClearStatuses ******/
		/****** md5 signature: a36409698de6df03133c5f14bec35cf8 ******/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets all the status and distance fields wire, face and precision are not cleared.
") ClearStatuses;
		void ClearStatuses();

		/****** ShapeAnalysis_Wire::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the working face.
") Face;
		const TopoDS_Face Face();

		/****** ShapeAnalysis_Wire::Init ******/
		/****** md5 signature: 68dad83539fb82c5a5e93add092d0610 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
precision: float

Return
-------
None

Description
-----------
Initializes the object with standard TopoDS_Wire, face and precision.
") Init;
		void Init(const TopoDS_Wire & wire, const TopoDS_Face & face, const Standard_Real precision);

		/****** ShapeAnalysis_Wire::Init ******/
		/****** md5 signature: 11ec60f70bd155e35a6abf335e18eb63 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
sbwd: ShapeExtend_WireData
face: TopoDS_Face
precision: float

Return
-------
None

Description
-----------
Initializes the object with WireData object, face and precision.
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & sbwd, const TopoDS_Face & face, const Standard_Real precision);

		/****** ShapeAnalysis_Wire::IsLoaded ******/
		/****** md5 signature: 5ed802f56c3a94dc70391badb380a6ed ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if wire is loaded and has number of edges >0.
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****** ShapeAnalysis_Wire::IsReady ******/
		/****** md5 signature: 68a96b040fc0b59848125a1a3ef33dcb ******/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if IsLoaded and underlying face is not null.
") IsReady;
		Standard_Boolean IsReady();

		/****** ShapeAnalysis_Wire::LastCheckStatus ******/
		/****** md5 signature: 51a8334fdef2c5ed71ca2129b25a052b ******/
		%feature("compactdefaultargs") LastCheckStatus;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Querying the status of the LAST performed 'Advanced' checking procedure.
") LastCheckStatus;
		Standard_Boolean LastCheckStatus(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::Load ******/
		/****** md5 signature: 2fdca06c20821b51a2c36237ba0af41b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire

Return
-------
None

Description
-----------
Loads the object with standard TopoDS_Wire.
") Load;
		void Load(const TopoDS_Wire & wire);

		/****** ShapeAnalysis_Wire::Load ******/
		/****** md5 signature: 16e0e231784ecdcbd10a3dadfc16b8d6 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
sbwd: ShapeExtend_WireData

Return
-------
None

Description
-----------
Loads the object with WireData object.
") Load;
		void Load(const opencascade::handle<ShapeExtend_WireData> & sbwd);

		/****** ShapeAnalysis_Wire::MaxDistance2d ******/
		/****** md5 signature: 7dd9f555060a06797b716d88f0343b12 ******/
		%feature("compactdefaultargs") MaxDistance2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the last maximal distance in 2D-UV computed by CheckContinuity2d.
") MaxDistance2d;
		Standard_Real MaxDistance2d();

		/****** ShapeAnalysis_Wire::MaxDistance3d ******/
		/****** md5 signature: cf45bbfcae90a0b146267435ebec2958 ******/
		%feature("compactdefaultargs") MaxDistance3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the last maximal distance in 3D computed by CheckOrientation, CheckConnected, CheckContinuity3d, CheckVertex, CheckNewVertex, CheckSameParameter.
") MaxDistance3d;
		Standard_Real MaxDistance3d();

		/****** ShapeAnalysis_Wire::MinDistance2d ******/
		/****** md5 signature: 8a48ed473b0d51a316aea751627b5127 ******/
		%feature("compactdefaultargs") MinDistance2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the last lowest distance in 2D-UV computed by CheckContinuity2d.
") MinDistance2d;
		Standard_Real MinDistance2d();

		/****** ShapeAnalysis_Wire::MinDistance3d ******/
		/****** md5 signature: 3fff8e0c66577dd711e9ba64f1975381 ******/
		%feature("compactdefaultargs") MinDistance3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the last lowest distance in 3D computed by CheckOrientation, CheckConnected, CheckContinuity3d, CheckVertex, CheckNewVertex.
") MinDistance3d;
		Standard_Real MinDistance3d();

		/****** ShapeAnalysis_Wire::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of edges in the wire, or 0 if it is not loaded.
") NbEdges;
		Standard_Integer NbEdges();

		/****** ShapeAnalysis_Wire::Perform ******/
		/****** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs all the checks in the following order: CheckOrder, CheckSmall, CheckConnected, CheckEdgeCurves, CheckDegenerated, CheckSelfIntersection, CheckLacking, CheckClosed Returns: True if at least one method returned True; For deeper analysis use Status...(status) methods.
") Perform;
		Standard_Boolean Perform();

		/****** ShapeAnalysis_Wire::Precision ******/
		/****** md5 signature: 34c7e39bd57a685873eea74fa4629747 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of precision.
") Precision;
		Standard_Real Precision();

		/****** ShapeAnalysis_Wire::SetFace ******/
		/****** md5 signature: ad791c3e7afa47c0cda20c76d19a66b4 ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face

Return
-------
None

Description
-----------
Loads the face the wire lies on.
") SetFace;
		void SetFace(const TopoDS_Face & face);

		/****** ShapeAnalysis_Wire::SetPrecision ******/
		/****** md5 signature: e3b8a71e74ae511a0d07cc55d5930b63 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
precision: float

Return
-------
None

Description
-----------
No available documentation.
") SetPrecision;
		void SetPrecision(const Standard_Real precision);

		/****** ShapeAnalysis_Wire::SetSurface ******/
		/****** md5 signature: 3ac5100009a432b14cb9404ac523d9ec ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
surface: Geom_Surface

Return
-------
None

Description
-----------
Loads the surface the wire lies on.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surface);

		/****** ShapeAnalysis_Wire::SetSurface ******/
		/****** md5 signature: fbd30086fe99f723922515229a71cc75 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
surface: Geom_Surface
location: TopLoc_Location

Return
-------
None

Description
-----------
Loads the surface the wire lies on.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeAnalysis_Wire::StatusClosed ******/
		/****** md5 signature: 397ec850ca398b7fd0a894a002d47198 ******/
		%feature("compactdefaultargs") StatusClosed;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusClosed;
		Standard_Boolean StatusClosed(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusConnected ******/
		/****** md5 signature: 778e67ce9161a6c5b336734febb775f3 ******/
		%feature("compactdefaultargs") StatusConnected;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusConnected;
		Standard_Boolean StatusConnected(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusCurveGaps ******/
		/****** md5 signature: 615d7aa6851d43464e3e5ed3fde9cba6 ******/
		%feature("compactdefaultargs") StatusCurveGaps;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusCurveGaps;
		Standard_Boolean StatusCurveGaps(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusDegenerated ******/
		/****** md5 signature: 83150213c249c7e49e122df8861b868c ******/
		%feature("compactdefaultargs") StatusDegenerated;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusDegenerated;
		Standard_Boolean StatusDegenerated(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusEdgeCurves ******/
		/****** md5 signature: 7db5a16b2f75f1f3c8e3020d7471e69b ******/
		%feature("compactdefaultargs") StatusEdgeCurves;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusGaps2d ******/
		/****** md5 signature: 1f5eabaad5dc9661856b002b6e183eee ******/
		%feature("compactdefaultargs") StatusGaps2d;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusGaps2d;
		Standard_Boolean StatusGaps2d(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusGaps3d ******/
		/****** md5 signature: 825f4f566e8fba4e295cd4bec34c5c53 ******/
		%feature("compactdefaultargs") StatusGaps3d;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusGaps3d;
		Standard_Boolean StatusGaps3d(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusLacking ******/
		/****** md5 signature: 52ad411d37899450cdc3de41cf0e88fc ******/
		%feature("compactdefaultargs") StatusLacking;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusLacking;
		Standard_Boolean StatusLacking(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusLoop ******/
		/****** md5 signature: fad1872c07eb0301e971a36d93da478e ******/
		%feature("compactdefaultargs") StatusLoop;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusLoop;
		Standard_Boolean StatusLoop(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusOrder ******/
		/****** md5 signature: 5ff6f9a9e3f6f4cb2f5b7fcce399309e ******/
		%feature("compactdefaultargs") StatusOrder;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusOrder;
		Standard_Boolean StatusOrder(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusSelfIntersection ******/
		/****** md5 signature: bccc7d7d1b860f4aeb57ab0f15684134 ******/
		%feature("compactdefaultargs") StatusSelfIntersection;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusSmall ******/
		/****** md5 signature: 946de8888b815d7dc1018b04a0e6371a ******/
		%feature("compactdefaultargs") StatusSmall;
		%feature("autodoc", "
Parameters
----------
Status: ShapeExtend_Status

Return
-------
bool

Description
-----------
No available documentation.
") StatusSmall;
		Standard_Boolean StatusSmall(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::Surface ******/
		/****** md5 signature: 218f80180f9895a3f4012d683258cf67 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeAnalysis_Surface>

Description
-----------
Returns the working surface.
") Surface;
		const opencascade::handle<ShapeAnalysis_Surface> & Surface();

		/****** ShapeAnalysis_Wire::WireData ******/
		/****** md5 signature: c8792f073dea4df1af697814fbf5f311 ******/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_WireData>

Description
-----------
Returns wire object being analyzed.
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
		/****** ShapeAnalysis_WireOrder::ShapeAnalysis_WireOrder ******/
		/****** md5 signature: 001651a67bf407b71fcd46ae3b8b54a3 ******/
		%feature("compactdefaultargs") ShapeAnalysis_WireOrder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder();

		/****** ShapeAnalysis_WireOrder::ShapeAnalysis_WireOrder ******/
		/****** md5 signature: d0ab6ef719feb71ca41da9094852a860 ******/
		%feature("compactdefaultargs") ShapeAnalysis_WireOrder;
		%feature("autodoc", "
Parameters
----------
theMode3D: bool
theTolerance: float
theModeBoth: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a WireOrder. Flag <theMode3D> defines 3D or 2d mode. Flag <theModeBoth> defines miscible mode and the flag <theMode3D> is ignored. Warning: Parameter <theTolerance> is not used in algorithm.
") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder(const Standard_Boolean theMode3D, const Standard_Real theTolerance, const Standard_Boolean theModeBoth = Standard_False);

		/****** ShapeAnalysis_WireOrder::Add ******/
		/****** md5 signature: 754529ef22ef038c5c7a4f365a6100e0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theStart3d: gp_XYZ
theEnd3d: gp_XYZ

Return
-------
None

Description
-----------
Adds a couple of points 3D (start, end).
") Add;
		void Add(const gp_XYZ & theStart3d, const gp_XYZ & theEnd3d);

		/****** ShapeAnalysis_WireOrder::Add ******/
		/****** md5 signature: de1924393c4f894699d89aee766a6d97 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theStart2d: gp_XY
theEnd2d: gp_XY

Return
-------
None

Description
-----------
Adds a couple of points 2D (start, end).
") Add;
		void Add(const gp_XY & theStart2d, const gp_XY & theEnd2d);

		/****** ShapeAnalysis_WireOrder::Add ******/
		/****** md5 signature: 99e5beddea56c9e57f7d6f9f9780408d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theStart3d: gp_XYZ
theEnd3d: gp_XYZ
theStart2d: gp_XY
theEnd2d: gp_XY

Return
-------
None

Description
-----------
Adds a couple of points 3D and 2D (start, end).
") Add;
		void Add(const gp_XYZ & theStart3d, const gp_XYZ & theEnd3d, const gp_XY & theStart2d, const gp_XY & theEnd2d);

		/****** ShapeAnalysis_WireOrder::Chain ******/
		/****** md5 signature: 5a804521be62174818d234e9543ffe87 ******/
		%feature("compactdefaultargs") Chain;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
n1: int
n2: int

Description
-----------
Returns, for the chain n0 num, starting and ending numbers of edges. In the list of ordered edges (see Ordered for originals).
") Chain;
		void Chain(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ShapeAnalysis_WireOrder::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of edges, but not mode and tol.
") Clear;
		void Clear();

		/****** ShapeAnalysis_WireOrder::Couple ******/
		/****** md5 signature: 2a340a10e5a036164b759e5917463d42 ******/
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
n1: int
n2: int

Description
-----------
Returns, for the couple n0 num, the two implied edges In the list of ordered edges.
") Couple;
		void Couple(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ShapeAnalysis_WireOrder::Gap ******/
		/****** md5 signature: 367d72f7f9d9f8ac382afd0e4369ad2c ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
float

Description
-----------
Returns the gap between a couple and its preceding <num> is considered ordered If <num> = 0 (D), returns the greatest gap found.
") Gap;
		Standard_Real Gap(const Standard_Integer num = 0);

		/****** ShapeAnalysis_WireOrder::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if Perform has been done Else, the following methods returns original values.
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
		/****** ShapeAnalysis_WireOrder::NbChains ******/
		/****** md5 signature: d1b0201e9b14205fe927c9a01e044ab3 ******/
		%feature("compactdefaultargs") NbChains;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of computed chains.
") NbChains;
		Standard_Integer NbChains();

		/****** ShapeAnalysis_WireOrder::NbCouples ******/
		/****** md5 signature: 8136e94ad4eb50396f3e8640b01713e3 ******/
		%feature("compactdefaultargs") NbCouples;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of computed couples.
") NbCouples;
		Standard_Integer NbCouples();

		/****** ShapeAnalysis_WireOrder::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of added couples of points (one per edges).
") NbEdges;
		Standard_Integer NbEdges();

		/****** ShapeAnalysis_WireOrder::Ordered ******/
		/****** md5 signature: a6b04776796d4f3e7848f3e21c897904 ******/
		%feature("compactdefaultargs") Ordered;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
int

Description
-----------
Returns the number of original edge which correspond to the newly ordered number <n> Warning: the returned value is NEGATIVE if edge should be reversed.
") Ordered;
		Standard_Integer Ordered(const Standard_Integer theIdx);

		/****** ShapeAnalysis_WireOrder::Perform ******/
		/****** md5 signature: 076cdff70150a5d09e5d54a72cb0d21a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
closed: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Computes the better order Optimised if the couples were already in order The criterium is: two couples in order if distance between end-prec and start-cur is less then starting tolerance <tol> Else, the smallest distance is reached Warning: Parameter <closed> not used.
") Perform;
		void Perform(const Standard_Boolean closed = Standard_True);

		/****** ShapeAnalysis_WireOrder::SetChains ******/
		/****** md5 signature: dbd76054f8e57d3c27a853a9a2aceb72 ******/
		%feature("compactdefaultargs") SetChains;
		%feature("autodoc", "
Parameters
----------
gap: float

Return
-------
None

Description
-----------
Determines the chains inside which successive edges have a gap less than a given value. Queried by NbChains and Chain.
") SetChains;
		void SetChains(const Standard_Real gap);

		/****** ShapeAnalysis_WireOrder::SetCouples ******/
		/****** md5 signature: a10a2fc2bfd71b64ba1ba3a44e57e444 ******/
		%feature("compactdefaultargs") SetCouples;
		%feature("autodoc", "
Parameters
----------
gap: float

Return
-------
None

Description
-----------
Determines the couples of edges for which end and start fit inside a given gap. Queried by NbCouples and Couple Warning: function isn't implemented.
") SetCouples;
		void SetCouples(const Standard_Real gap);

		/****** ShapeAnalysis_WireOrder::SetMode ******/
		/****** md5 signature: cfbbac7a6fa12a25d1c54f35b11c32ef ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
theMode3D: bool
theTolerance: float
theModeBoth: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets new values. Clears the edge list if the mode (<theMode3D> or <theModeBoth> ) changes. Clears the connexion list. Warning: Parameter <theTolerance> is not used in algorithm.
") SetMode;
		void SetMode(const Standard_Boolean theMode3D, const Standard_Real theTolerance, const Standard_Boolean theModeBoth = Standard_False);

		/****** ShapeAnalysis_WireOrder::Status ******/
		/****** md5 signature: 95453a41824a64084ab7e8075846ede5 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the status of the order (0 if not done): 0: all edges are direct and in sequence 1: all edges are direct but some are not in sequence -1: some edges are reversed, but no gap remain 3: edges in sequence are just shifted in forward or reverse manner.
") Status;
		Standard_Integer Status();

		/****** ShapeAnalysis_WireOrder::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the working tolerance.
") Tolerance;
		Standard_Real Tolerance();

		/****** ShapeAnalysis_WireOrder::XY ******/
		/****** md5 signature: 7e9845fe73353a5c68a0d556a4e79634 ******/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theStart2D: gp_XY
theEnd2D: gp_XY

Return
-------
None

Description
-----------
Returns the values of the couple <num>, as 2D values.
") XY;
		void XY(const Standard_Integer theIdx, gp_XY & theStart2D, gp_XY & theEnd2D);

		/****** ShapeAnalysis_WireOrder::XYZ ******/
		/****** md5 signature: 9e110ee78927a99c1388f3839593d1eb ******/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theStart3D: gp_XYZ
theEnd3D: gp_XYZ

Return
-------
None

Description
-----------
Returns the values of the couple <num>, as 3D values.
") XYZ;
		void XYZ(const Standard_Integer theIdx, gp_XYZ & theStart3D, gp_XYZ & theEnd3D);

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
		/****** ShapeAnalysis_WireVertex::ShapeAnalysis_WireVertex ******/
		/****** md5 signature: 444b04297e14f11e95d21a75cdc9e8a3 ******/
		%feature("compactdefaultargs") ShapeAnalysis_WireVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeAnalysis_WireVertex;
		 ShapeAnalysis_WireVertex();

		/****** ShapeAnalysis_WireVertex::Analyze ******/
		/****** md5 signature: fb838ab94d167046cb960d898ad849da ******/
		%feature("compactdefaultargs") Analyze;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Analyze;
		void Analyze();

		/****** ShapeAnalysis_WireVertex::Data ******/
		/****** md5 signature: ebe1966f41fb4acf2b591d40ed683c05 ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ

Return
-------
upre: float
ufol: float

Description
-----------
Returns the recorded status for a vertex With its recorded position and parameters on both edges These values are relevant regarding the status: Status Meaning Position Preceding Following 0 Same no no no 1 SameCoord no no no 2 Close no no no 3 End yes no yes 4 Start yes yes no 5 Inters yes yes yes -1 Disjoined no no no.
") Data;
		Standard_Integer Data(const Standard_Integer num, gp_XYZ & pos, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_WireVertex::Init ******/
		/****** md5 signature: ce6401735f705d8382645a726c79e907 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
preci: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Wire & wire, const Standard_Real preci);

		/****** ShapeAnalysis_WireVertex::Init ******/
		/****** md5 signature: 76c5d44fec2bd90d7a469781424ff530 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
swbd: ShapeExtend_WireData
preci: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & swbd, const Standard_Real preci);

		/****** ShapeAnalysis_WireVertex::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if analysis was performed, else returns False.
") IsDone;
		Standard_Boolean IsDone();

		/****** ShapeAnalysis_WireVertex::Load ******/
		/****** md5 signature: 2fdca06c20821b51a2c36237ba0af41b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const TopoDS_Wire & wire);

		/****** ShapeAnalysis_WireVertex::Load ******/
		/****** md5 signature: 16e0e231784ecdcbd10a3dadfc16b8d6 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
sbwd: ShapeExtend_WireData

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const opencascade::handle<ShapeExtend_WireData> & sbwd);

		/****** ShapeAnalysis_WireVertex::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of edges in analyzed wire (i.e. the length of all arrays).
") NbEdges;
		Standard_Integer NbEdges();

		/****** ShapeAnalysis_WireVertex::NextCriter ******/
		/****** md5 signature: 8d20f809415da8f7521c50560380badb ******/
		%feature("compactdefaultargs") NextCriter;
		%feature("autodoc", "
Parameters
----------
crit: int
num: int (optional, default to 0)

Return
-------
int

Description
-----------
For a given criter, returns the rank of the vertex which follows <num> and has the same status. 0 if no more Acts as an iterator, starts on the first one Criters are: 0: same vertex (status 0) 1: a solution exists (status >= 0) 2: same coords (i.e. same params) (status 0 1 2) 3: same coods but not same vertex (status 1 2) 4: redefined coords (status 3 4 5) -1: no solution (status -1).
") NextCriter;
		Standard_Integer NextCriter(const Standard_Integer crit, const Standard_Integer num = 0);

		/****** ShapeAnalysis_WireVertex::NextStatus ******/
		/****** md5 signature: b6638b4681eae9cc19224bb9aed78215 ******/
		%feature("compactdefaultargs") NextStatus;
		%feature("autodoc", "
Parameters
----------
stat: int
num: int (optional, default to 0)

Return
-------
int

Description
-----------
For a given status, returns the rank of the vertex which follows <num> and has the same status. 0 if no more Acts as an iterator, starts on the first one.
") NextStatus;
		Standard_Integer NextStatus(const Standard_Integer stat, const Standard_Integer num = 0);

		/****** ShapeAnalysis_WireVertex::Position ******/
		/****** md5 signature: f9981d08b82f33639f27e8c71acde75d ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") Position;
		gp_XYZ Position(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::Precision ******/
		/****** md5 signature: 34c7e39bd57a685873eea74fa4629747 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns precision value used in analysis.
") Precision;
		Standard_Real Precision();

		/****** ShapeAnalysis_WireVertex::SetClose ******/
		/****** md5 signature: c3009edf142ec6f875d8378bfdca0af8 ******/
		%feature("compactdefaultargs") SetClose;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Records status 'Close Coords' (at the Precision of <self>).
") SetClose;
		void SetClose(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::SetDisjoined ******/
		/****** md5 signature: a40c9d24ea6472d55c9cee7bb946d2a1 ******/
		%feature("compactdefaultargs") SetDisjoined;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
<num> cannot be said as same vertex.
") SetDisjoined;
		void SetDisjoined(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::SetEnd ******/
		/****** md5 signature: c7fabda1b23b9b9674f25e44bc282ae3 ******/
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ
ufol: float

Return
-------
None

Description
-----------
<num> is the End of preceding Edge, and its projection on the following one lies on it at the Precision of <self> <ufol> gives the parameter on the following edge.
") SetEnd;
		void SetEnd(const Standard_Integer num, const gp_XYZ & pos, const Standard_Real ufol);

		/****** ShapeAnalysis_WireVertex::SetInters ******/
		/****** md5 signature: fe3d221c509ef08f54b84f9770f207e3 ******/
		%feature("compactdefaultargs") SetInters;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ
upre: float
ufol: float

Return
-------
None

Description
-----------
<num> is the Intersection of both Edges <upre> is the parameter on preceding edge, <ufol> on following edge.
") SetInters;
		void SetInters(const Standard_Integer num, const gp_XYZ & pos, const Standard_Real upre, const Standard_Real ufol);

		/****** ShapeAnalysis_WireVertex::SetPrecision ******/
		/****** md5 signature: a601cf881702916ad1a5bcd1fec314c4 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
preci: float

Return
-------
None

Description
-----------
Sets the precision for work Analysing: for each Vertex, comparison between the end of the preceding edge and the start of the following edge Each Vertex rank corresponds to the End Vertex of the Edge of same rank, in the ShapeExtend_WireData. I.E. for Vertex <num>, Edge <num> is the preceding one, <num+1> is the following one.
") SetPrecision;
		void SetPrecision(const Standard_Real preci);

		/****** ShapeAnalysis_WireVertex::SetSameCoords ******/
		/****** md5 signature: 342c4783b9bbe5879b60d8401f809824 ******/
		%feature("compactdefaultargs") SetSameCoords;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Records status 'Same Coords' (at the Vertices Tolerances).
") SetSameCoords;
		void SetSameCoords(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::SetSameVertex ******/
		/****** md5 signature: 076a84d63f82cbff4929d872c559a795 ******/
		%feature("compactdefaultargs") SetSameVertex;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Records status 'Same Vertex' (logically) on Vertex <num>.
") SetSameVertex;
		void SetSameVertex(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::SetStart ******/
		/****** md5 signature: 1b976331febdffff9819237d0da2d19b ******/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ
upre: float

Return
-------
None

Description
-----------
<num> is the Start of following Edge, its projection on the preceding one lies on it at the Precision of <self> <upre> gives the parameter on the preceding edge.
") SetStart;
		void SetStart(const Standard_Integer num, const gp_XYZ & pos, const Standard_Real upre);

		/****** ShapeAnalysis_WireVertex::Status ******/
		/****** md5 signature: fe83936279a1a53fbd5bae4ee4fd0684 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns the recorded status for a vertex More detail by method Data.
") Status;
		Standard_Integer Status(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::UFollowing ******/
		/****** md5 signature: 6cb314fd1e9b110d50f5297ae810bcfb ******/
		%feature("compactdefaultargs") UFollowing;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
float

Description
-----------
No available documentation.
") UFollowing;
		Standard_Real UFollowing(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::UPrevious ******/
		/****** md5 signature: 987cbdeff9f2aa95add4bb35a6575252 ******/
		%feature("compactdefaultargs") UPrevious;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
float

Description
-----------
No available documentation.
") UPrevious;
		Standard_Real UPrevious(const Standard_Integer num);

		/****** ShapeAnalysis_WireVertex::WireData ******/
		/****** md5 signature: c8792f073dea4df1af697814fbf5f311 ******/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_WireData>

Description
-----------
Returns analyzed wire.
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
		/****** ShapeAnalysis_TransferParametersProj::ShapeAnalysis_TransferParametersProj ******/
		/****** md5 signature: 05907c49624548dfe8719171abdd39c5 ******/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParametersProj;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty constructor.
") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj();

		/****** ShapeAnalysis_TransferParametersProj::ShapeAnalysis_TransferParametersProj ******/
		/****** md5 signature: c3846ac7e9f414d4e4ed6ff260e1e218 ******/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParametersProj;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** ShapeAnalysis_TransferParametersProj::CopyNMVertex ******/
		/****** md5 signature: 2fd9e6642b19e8c9963f6bdb0cdbaa3c ******/
		%feature("compactdefaultargs") CopyNMVertex;
		%feature("autodoc", "
Parameters
----------
theVert: TopoDS_Vertex
toedge: TopoDS_Edge
fromedge: TopoDS_Edge

Return
-------
TopoDS_Vertex

Description
-----------
Make a copy of non-manifold vertex theVert (i.e. create new TVertex and replace PointRepresentations for this vertex from fromedge to toedge. Other representations were copied).
") CopyNMVertex;
		static TopoDS_Vertex CopyNMVertex(const TopoDS_Vertex & theVert, const TopoDS_Edge & toedge, const TopoDS_Edge & fromedge);

		/****** ShapeAnalysis_TransferParametersProj::CopyNMVertex ******/
		/****** md5 signature: c1184339f62e903b30e9b1b1d5b694cf ******/
		%feature("compactdefaultargs") CopyNMVertex;
		%feature("autodoc", "
Parameters
----------
theVert: TopoDS_Vertex
toFace: TopoDS_Face
fromFace: TopoDS_Face

Return
-------
TopoDS_Vertex

Description
-----------
Make a copy of non-manifold vertex theVert (i.e. create new TVertex and replace PointRepresentations for this vertex from fromFace to toFace. Other representations were copied).
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
		/****** ShapeAnalysis_TransferParametersProj::Init ******/
		/****** md5 signature: 3c32c972be306684e0073a8837daa347 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Init;
		virtual void Init(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** ShapeAnalysis_TransferParametersProj::IsSameRange ******/
		/****** md5 signature: b43cec9b7a0b7a0b0a76b1621fd6cbe2 ******/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False;.
") IsSameRange;
		virtual Standard_Boolean IsSameRange();

		/****** ShapeAnalysis_TransferParametersProj::Perform ******/
		/****** md5 signature: da484c93300b4b1696cc44e270785889 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Papams: TColStd_HSequenceOfReal
To2d: bool

Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
Transfers parameters given by sequence Params from 3d curve to pcurve (if To2d is True) or back (if To2d is False).
") Perform;
		virtual opencascade::handle<TColStd_HSequenceOfReal> Perform(const opencascade::handle<TColStd_HSequenceOfReal> & Papams, const Standard_Boolean To2d);

		/****** ShapeAnalysis_TransferParametersProj::Perform ******/
		/****** md5 signature: b4f4fac0124409915bf808658afa996b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: float
To2d: bool

Return
-------
float

Description
-----------
Transfers parameter given by Param from 3d curve to pcurve (if To2d is True) or back (if To2d is False).
") Perform;
		virtual Standard_Real Perform(const Standard_Real Param, const Standard_Boolean To2d);

		/****** ShapeAnalysis_TransferParametersProj::TransferRange ******/
		/****** md5 signature: 2048b3cf3f6e338e1741a033a65021be ******/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "
Parameters
----------
newEdge: TopoDS_Edge
prevPar: float
currPar: float
Is2d: bool

Return
-------
None

Description
-----------
Recomputes range of curves from NewEdge. If Is2d equals True parameters are recomputed by curve2d else by curve3d.
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


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def shapeanalysis_AdjustByPeriod(*args):
	return shapeanalysis.AdjustByPeriod(*args)

@deprecated
def shapeanalysis_AdjustToPeriod(*args):
	return shapeanalysis.AdjustToPeriod(*args)

@deprecated
def shapeanalysis_ContourArea(*args):
	return shapeanalysis.ContourArea(*args)

@deprecated
def shapeanalysis_FindBounds(*args):
	return shapeanalysis.FindBounds(*args)

@deprecated
def shapeanalysis_GetFaceUVBounds(*args):
	return shapeanalysis.GetFaceUVBounds(*args)

@deprecated
def shapeanalysis_IsOuterBound(*args):
	return shapeanalysis.IsOuterBound(*args)

@deprecated
def shapeanalysis_OuterWire(*args):
	return shapeanalysis.OuterWire(*args)

@deprecated
def shapeanalysis_TotCross2D(*args):
	return shapeanalysis.TotCross2D(*args)

@deprecated
def ShapeAnalysis_Curve_GetSamplePoints(*args):
	return ShapeAnalysis_Curve.GetSamplePoints(*args)

@deprecated
def ShapeAnalysis_Curve_GetSamplePoints(*args):
	return ShapeAnalysis_Curve.GetSamplePoints(*args)

@deprecated
def ShapeAnalysis_Curve_IsClosed(*args):
	return ShapeAnalysis_Curve.IsClosed(*args)

@deprecated
def ShapeAnalysis_Curve_IsPeriodic(*args):
	return ShapeAnalysis_Curve.IsPeriodic(*args)

@deprecated
def ShapeAnalysis_Curve_IsPeriodic(*args):
	return ShapeAnalysis_Curve.IsPeriodic(*args)

@deprecated
def ShapeAnalysis_Curve_IsPlanar(*args):
	return ShapeAnalysis_Curve.IsPlanar(*args)

@deprecated
def ShapeAnalysis_Curve_IsPlanar(*args):
	return ShapeAnalysis_Curve.IsPlanar(*args)

@deprecated
def ShapeAnalysis_FreeBounds_ConnectEdgesToWires(*args):
	return ShapeAnalysis_FreeBounds.ConnectEdgesToWires(*args)

@deprecated
def ShapeAnalysis_FreeBounds_ConnectWiresToWires(*args):
	return ShapeAnalysis_FreeBounds.ConnectWiresToWires(*args)

@deprecated
def ShapeAnalysis_FreeBounds_ConnectWiresToWires(*args):
	return ShapeAnalysis_FreeBounds.ConnectWiresToWires(*args)

@deprecated
def ShapeAnalysis_FreeBounds_DispatchWires(*args):
	return ShapeAnalysis_FreeBounds.DispatchWires(*args)

@deprecated
def ShapeAnalysis_FreeBounds_SplitWires(*args):
	return ShapeAnalysis_FreeBounds.SplitWires(*args)

@deprecated
def ShapeAnalysis_Geom_NearestPlane(*args):
	return ShapeAnalysis_Geom.NearestPlane(*args)

@deprecated
def ShapeAnalysis_Geom_PositionTrsf(*args):
	return ShapeAnalysis_Geom.PositionTrsf(*args)

@deprecated
def ShapeAnalysis_TransferParametersProj_CopyNMVertex(*args):
	return ShapeAnalysis_TransferParametersProj.CopyNMVertex(*args)

@deprecated
def ShapeAnalysis_TransferParametersProj_CopyNMVertex(*args):
	return ShapeAnalysis_TransferParametersProj.CopyNMVertex(*args)

}
