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
#include<TColGeom_module.hxx>
#include<Message_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
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
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TopoDS_Shape,TColStd_ListOfReal,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TColStd_ListOfReal,TopTools_ShapeMapHasher>::KeyValues;
%template(ShapeAnalysis_DataMapOfShapeListOfReal) NCollection_DataMap<TopoDS_Shape,TColStd_ListOfReal,TopTools_ShapeMapHasher>;
%template(ShapeAnalysis_SequenceOfFreeBounds) NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>;

%extend NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfReal, TopTools_ShapeMapHasher>::Iterator ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfReal, TopTools_ShapeMapHasher> ShapeAnalysis_DataMapOfShapeListOfReal;
typedef NCollection_HSequence<opencascade::handle<ShapeAnalysis_FreeBoundData>> ShapeAnalysis_HSequenceOfFreeBounds;
typedef NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>> ShapeAnalysis_SequenceOfFreeBounds;
/* end typedefs declaration */

/**********************
* class ShapeAnalysis *
**********************/
%rename(shapeanalysis) ShapeAnalysis;
class ShapeAnalysis {
	public:
		/****** ShapeAnalysis::AdjustByPeriod ******/
		/****** md5 signature: e5d7a9ea49cef55dfc2375a6ce577998 ******/
		%feature("compactdefaultargs") AdjustByPeriod;
		%feature("autodoc", "
Parameters
----------
Val: double
ToVal: double
Period: double

Return
-------
double

Description
-----------
Returns a shift required to move point <Val> to the range [ToVal-Period/2,ToVal+Period/2]. This shift will be the divisible by Period. Intended for adjusting parameters on periodic surfaces.
") AdjustByPeriod;
		static double AdjustByPeriod(const double Val, const double ToVal, const double Period);

		/****** ShapeAnalysis::AdjustToPeriod ******/
		/****** md5 signature: 8ab4f72c9254cafeaa3f49e2d67bdd37 ******/
		%feature("compactdefaultargs") AdjustToPeriod;
		%feature("autodoc", "
Parameters
----------
Val: double
ValMin: double
ValMax: double

Return
-------
double

Description
-----------
Returns a shift required to move point <Val> to the range [ValMin,ValMax]. This shift will be the divisible by Period with Period = ValMax - ValMin. Intended for adjusting parameters on periodic surfaces.
") AdjustToPeriod;
		static double AdjustToPeriod(const double Val, const double ValMin, const double ValMax);

		/****** ShapeAnalysis::ContourArea ******/
		/****** md5 signature: a344c68283ecc5629aac845e8f4945eb ******/
		%feature("compactdefaultargs") ContourArea;
		%feature("autodoc", "
Parameters
----------
theWire: TopoDS_Wire

Return
-------
double

Description
-----------
Returns a total area of 3d wire.
") ContourArea;
		static double ContourArea(const TopoDS_Wire & theWire);

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
		/****** md5 signature: bc27bfde9b05f22498e0e2ab2e4a3169 ******/
		%feature("compactdefaultargs") GetFaceUVBounds;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
Umin: double
Umax: double
Vmin: double
Vmax: double

Description
-----------
Computes exact UV bounds of all wires on the face.
") GetFaceUVBounds;
		static void GetFaceUVBounds(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis::IsOuterBound ******/
		/****** md5 signature: d282719f5147d5463823950769dfa252 ******/
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
		static bool IsOuterBound(const TopoDS_Face & face);

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
		/****** md5 signature: 0b341f2f2e8ff5867d97e637537e65dd ******/
		%feature("compactdefaultargs") TotCross2D;
		%feature("autodoc", "
Parameters
----------
sewd: ShapeExtend_WireData
aFace: TopoDS_Face

Return
-------
double

Description
-----------
Returns a total area of 2d wire.
") TotCross2D;
		static double TotCross2D(const opencascade::handle<ShapeExtend_WireData> & sewd, const TopoDS_Face & aFace);

};


%extend ShapeAnalysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class ShapeAnalysis_BoxBndTreeSelector *
*****************************************/
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
		/****** md5 signature: d59e7722dbbb235ccf0d2abd39c7611b ******/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns deviation between input geometry entity and analytical entity.
") GetGap;
		double GetGap();

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
		/****** md5 signature: 1b0130fbf02c49416d948962380b6efd ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns status of operation. Current meaning of possible values of status: -1 - algorithm is not initalazed by shape 0 - no errors 1 - error during any operation (usually - because of wrong input data) Any operation (calling any methods like IsPlane(...), ...) can be performed when current staue is equal 0. If after any operation status != 0, it is necessary to set it 0 by method ClearStatus() before calling other operation.
") GetStatus;
		int GetStatus();

		/****** ShapeAnalysis_CanonicalRecognition::IsCircle ******/
		/****** md5 signature: 00fed571c54bb2faf17326a7893296e5 ******/
		%feature("compactdefaultargs") IsCircle;
		%feature("autodoc", "
Parameters
----------
theTol: double
theCirc: gp_Circ

Return
-------
bool

Description
-----------
Returns true if the underlined curve can be represent by circle with tolerance theTol and sets in theCirc the result circle.
") IsCircle;
		bool IsCircle(const double theTol, gp_Circ & theCirc);

		/****** ShapeAnalysis_CanonicalRecognition::IsCone ******/
		/****** md5 signature: 49c0ef40e6c1397aead0843f86c5019c ******/
		%feature("compactdefaultargs") IsCone;
		%feature("autodoc", "
Parameters
----------
theTol: double
theCone: gp_Cone

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by conical one with tolerance theTol and sets in theCone the result conical surface.
") IsCone;
		bool IsCone(const double theTol, gp_Cone & theCone);

		/****** ShapeAnalysis_CanonicalRecognition::IsCylinder ******/
		/****** md5 signature: f540e42b83bfb846b8acd5d966596dac ******/
		%feature("compactdefaultargs") IsCylinder;
		%feature("autodoc", "
Parameters
----------
theTol: double
theCyl: gp_Cylinder

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by cylindrical one with tolerance theTol and sets in theCyl the result cylinrical surface.
") IsCylinder;
		bool IsCylinder(const double theTol, gp_Cylinder & theCyl);

		/****** ShapeAnalysis_CanonicalRecognition::IsEllipse ******/
		/****** md5 signature: c5701229d57386b19bd63acce89af2d7 ******/
		%feature("compactdefaultargs") IsEllipse;
		%feature("autodoc", "
Parameters
----------
theTol: double
theElips: gp_Elips

Return
-------
bool

Description
-----------
Returns true if the underlined curve can be represent by ellipse with tolerance theTol and sets in theCirc the result ellipse.
") IsEllipse;
		bool IsEllipse(const double theTol, gp_Elips & theElips);

		/****** ShapeAnalysis_CanonicalRecognition::IsLine ******/
		/****** md5 signature: 8df8a8d3b89ede43db6182fd8a2cedf7 ******/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "
Parameters
----------
theTol: double
theLin: gp_Lin

Return
-------
bool

Description
-----------
Returns true if the underlined curve can be represent by line with tolerance theTol and sets in theLin the result line.
") IsLine;
		bool IsLine(const double theTol, gp_Lin & theLin);

		/****** ShapeAnalysis_CanonicalRecognition::IsPlane ******/
		/****** md5 signature: e1bf826b12af88757ef495418d1d92a2 ******/
		%feature("compactdefaultargs") IsPlane;
		%feature("autodoc", "
Parameters
----------
theTol: double
thePln: gp_Pln

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by plane with tolerance theTol and sets in thePln the result plane.
") IsPlane;
		bool IsPlane(const double theTol, gp_Pln & thePln);

		/****** ShapeAnalysis_CanonicalRecognition::IsSphere ******/
		/****** md5 signature: 666cbc3ca9f061185c37df809313a520 ******/
		%feature("compactdefaultargs") IsSphere;
		%feature("autodoc", "
Parameters
----------
theTol: double
theSphere: gp_Sphere

Return
-------
bool

Description
-----------
Returns true if the underlined surface can be represent by spherical one with tolerance theTol and sets in theSphere the result spherical surface.
") IsSphere;
		bool IsSphere(const double theTol, gp_Sphere & theSphere);

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
		/****** md5 signature: 4841aba7a41bf9c252fe7a12a0203d6c ******/
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
		bool CheckPin(const TopoDS_Face & F, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::CheckPinEdges ******/
		/****** md5 signature: 69bcb042d6f0edcf5c4ef2a479e00f93 ******/
		%feature("compactdefaultargs") CheckPinEdges;
		%feature("autodoc", "
Parameters
----------
theFirstEdge: TopoDS_Edge
theSecondEdge: TopoDS_Edge
coef1: double
coef2: double
toler: double

Return
-------
bool

Description
-----------
No available documentation.
") CheckPinEdges;
		bool CheckPinEdges(const TopoDS_Edge & theFirstEdge, const TopoDS_Edge & theSecondEdge, const double coef1, const double coef2, const double toler);

		/****** ShapeAnalysis_CheckSmallFace::CheckPinFace ******/
		/****** md5 signature: f63edd36786e2311a4c4212f2ca3f6b9 ******/
		%feature("compactdefaultargs") CheckPinFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
mapEdges: TopTools_DataMapOfShapeShape
toler: double (optional, default to -1.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckPinFace;
		bool CheckPinFace(const TopoDS_Face & F, TopTools_DataMapOfShapeShape & mapEdges, const double toler = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckSingleStrip ******/
		/****** md5 signature: e56df29343f39cd02bd460e62b02d6f9 ******/
		%feature("compactdefaultargs") CheckSingleStrip;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: double (optional, default to -1.0)

Return
-------
bool

Description
-----------
Checks if a Face is a single strip, i.e. brings two great edges which are confused on their whole length, possible other edges are small or null length //! Returns 0 if not a strip support, 1 strip in U, 2 strip in V Records diagnostic in info if it is a single strip.
") CheckSingleStrip;
		bool CheckSingleStrip(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const double tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckSplittingVertices ******/
		/****** md5 signature: f6d24a10703a33a8e3887720ea38d3aa ******/
		%feature("compactdefaultargs") CheckSplittingVertices;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
MapEdges: TopTools_DataMapOfShapeListOfShape
MapParam: NCollection_DataMap<TopoDS_Shape, TColStd_ListOfReal, TopTools_ShapeMapHasher>
theAllVert: TopoDS_Compound

Return
-------
int

Description
-----------
Checks if a Face brings vertices which split it, either confused with non adjacent vertices, or confused with their projection on non adjacent edges Returns the count of found splitting vertices Each vertex then brings a diagnostic 'SplittingVertex', with data: 'Face' for the face, 'Edge' for the split edge.
") CheckSplittingVertices;
		int CheckSplittingVertices(const TopoDS_Face & F, TopTools_DataMapOfShapeListOfShape & MapEdges, NCollection_DataMap<TopoDS_Shape, TColStd_ListOfReal, TopTools_ShapeMapHasher> & MapParam, TopoDS_Compound & theAllVert);

		/****** ShapeAnalysis_CheckSmallFace::CheckSpotFace ******/
		/****** md5 signature: 6bb1a549f18de04d7816e2cc89e0fe83 ******/
		%feature("compactdefaultargs") CheckSpotFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
tol: double (optional, default to -1.0)

Return
-------
bool

Description
-----------
Acts as IsSpotFace, but records in <infos> a diagnostic 'SpotFace' with the Pnt as value (data 'Location').
") CheckSpotFace;
		bool CheckSpotFace(const TopoDS_Face & F, const double tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckStripEdges ******/
		/****** md5 signature: 027fd52853b8b09c5d3ee0b948c22e44 ******/
		%feature("compactdefaultargs") CheckStripEdges;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: double

Return
-------
dmax: double

Description
-----------
Checks if two edges define a strip, i.e. distance maxi below tolerance, given or some of those of E1 and E2.
") CheckStripEdges;
		bool CheckStripEdges(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const double tol, Standard_Real &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::CheckStripFace ******/
		/****** md5 signature: ea4743a5bbc0cfa73e97c1c3d0380c1e ******/
		%feature("compactdefaultargs") CheckStripFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: double (optional, default to -1.0)

Return
-------
bool

Description
-----------
Checks if a Face is as a Strip Returns 0 if not or non determined, 1 if in U, 2 if in V By default, considers the tolerance zone of its edges A given value <tol> may be given to check a strip of max this width //! If a Face is determined as a Strip, it is delinited by two lists of edges. These lists are recorded in diagnostic Diagnostic 'StripFace' brings data 'Direction' (U or V), 'List1' , 'List2' (if they could be computed).
") CheckStripFace;
		bool CheckStripFace(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const double tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::CheckTwisted ******/
		/****** md5 signature: 4bfde55678bfe484bf9c20c481b6f07d ******/
		%feature("compactdefaultargs") CheckTwisted;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
paramu: double
paramv: double

Description
-----------
Checks if a Face is twisted (apart from checking Pin, i.e. it does not give information on pin, only 'it is twisted').
") CheckTwisted;
		bool CheckTwisted(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::FindStripEdges ******/
		/****** md5 signature: 258a04c3d91027fc502a36803b36b187 ******/
		%feature("compactdefaultargs") FindStripEdges;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: double

Return
-------
dmax: double

Description
-----------
Searches for two and only two edges up tolerance Returns True if OK, false if not 2 edges If True, returns the two edges and their maximum distance.
") FindStripEdges;
		bool FindStripEdges(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const double tol, Standard_Real &OutValue);

		/****** ShapeAnalysis_CheckSmallFace::IsSpotFace ******/
		/****** md5 signature: 9976263369f7a47884ccadc9abd4f835 ******/
		%feature("compactdefaultargs") IsSpotFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
spot: gp_Pnt
tol: double (optional, default to -1.0)

Return
-------
spotol: double

Description
-----------
Checks if a Face is as a Spot Returns 0 if not, 1 if yes, 2 if yes and all vertices are the same By default, considers the tolerance zone of its vertices A given value <tol> may be given to check a spot of this size If a Face is a Spot, its location is returned in <spot>, and <spotol> returns an equivalent tolerance, which is computed as half of max dimension of min-max box of the face.
") IsSpotFace;
		int IsSpotFace(const TopoDS_Face & F, gp_Pnt & spot, Standard_Real &OutValue, const double tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::IsStripSupport ******/
		/****** md5 signature: 2bfb7dac93908e6413d06e170211fe30 ******/
		%feature("compactdefaultargs") IsStripSupport;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
tol: double (optional, default to -1.0)

Return
-------
bool

Description
-----------
Checks if a Face lies on a Surface which is a strip So the Face is a strip. But a Face may be a strip elsewhere .. //! A given value <tol> may be given to check max width By default, considers the tolerance zone of its edges Returns 0 if not a strip support, 1 strip in U, 2 strip in V.
") IsStripSupport;
		bool IsStripSupport(const TopoDS_Face & F, const double tol = -1.0);

		/****** ShapeAnalysis_CheckSmallFace::SetTolerance ******/
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
tol: double

Return
-------
None

Description
-----------
Sets a fixed Tolerance to check small face By default, local tolerance zone is considered Sets a fixed MaxTolerance to check small face Sets a fixed Tolerance to check small face By default, local tolerance zone is considered Unset fixed tolerance, comes back to local tolerance zones Unset fixed tolerance, comes back to local tolerance zones.
") SetTolerance;
		void SetTolerance(const double tol);

		/****** ShapeAnalysis_CheckSmallFace::Status ******/
		/****** md5 signature: a05ed6c88abfa8b368ed1faac2258e92 ******/
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
		bool Status(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusPin ******/
		/****** md5 signature: 36d64e93aac3f9a190fead4cb5fcfd92 ******/
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
		bool StatusPin(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusPinEdges ******/
		/****** md5 signature: 62053566995aad109c15f67421ca7bf5 ******/
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
		bool StatusPinEdges(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusPinFace ******/
		/****** md5 signature: 9bf1e3b9c859e13c2a6282109ac600b3 ******/
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
		bool StatusPinFace(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusSplitVert ******/
		/****** md5 signature: d94af7a9a2ce241fea8aa9093f22b364 ******/
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
		bool StatusSplitVert(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusSpot ******/
		/****** md5 signature: 9dcdec42e5f905ec0e62c575bcff187b ******/
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
		bool StatusSpot(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusStrip ******/
		/****** md5 signature: 3c1bcf9baf92164c93c3b9d5ac12b353 ******/
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
		bool StatusStrip(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::StatusTwisted ******/
		/****** md5 signature: 074d1df3a7a66da27b07334be76b556c ******/
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
		bool StatusTwisted(const ShapeExtend_Status status);

		/****** ShapeAnalysis_CheckSmallFace::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance to check small faces, negative value if local tolerances zones are to be considered.
") Tolerance;
		double Tolerance();

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
		/****** md5 signature: 17f9dc6f12a4875467db6fba7d2b2228 ******/
		%feature("compactdefaultargs") FillBndBox;
		%feature("autodoc", "
Parameters
----------
C2d: Geom2d_Curve
First: double
Last: double
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
		void FillBndBox(const opencascade::handle<Geom2d_Curve> & C2d, const double First, const double Last, const int NPoints, const bool Exact, Bnd_Box2d & Box);

		/****** ShapeAnalysis_Curve::GetSamplePoints ******/
		/****** md5 signature: 22031773b7c2aef6fdfa490d44674877 ******/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "
Parameters
----------
curve: Geom2d_Curve
first: double
last: double
seq: TColgp_SequenceOfPnt2d

Return
-------
bool

Description
-----------
Returns sample points which will serve as linearisation of the2d curve in range (first, last) The distribution of sample points is consystent with what is used by BRepTopAdaptor_FClass2d.
") GetSamplePoints;
		static bool GetSamplePoints(const opencascade::handle<Geom2d_Curve> & curve, const double first, const double last, TColgp_SequenceOfPnt2d & seq);

		/****** ShapeAnalysis_Curve::GetSamplePoints ******/
		/****** md5 signature: 36e165301ff4328ad00899447f2be4e5 ******/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
first: double
last: double
seq: TColgp_SequenceOfPnt

Return
-------
bool

Description
-----------
Returns sample points which will serve as linearisation of the curve in range (first, last).
") GetSamplePoints;
		static bool GetSamplePoints(const opencascade::handle<Geom_Curve> & curve, const double first, const double last, TColgp_SequenceOfPnt & seq);

		/****** ShapeAnalysis_Curve::IsClosed ******/
		/****** md5 signature: fa93031c0fbc363deb726584cee227fc ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
preci: double (optional, default to -1)

Return
-------
bool

Description
-----------
Tells if the Curve is closed with given precision. If <preci> < 0 then Precision::Confusion is used.
") IsClosed;
		static bool IsClosed(const opencascade::handle<Geom_Curve> & curve, const double preci = -1);

		/****** ShapeAnalysis_Curve::IsPeriodic ******/
		/****** md5 signature: 41e1ef1df8bd977ee0faf79299dd0e62 ******/
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
		static bool IsPeriodic(const opencascade::handle<Geom_Curve> & curve);

		/****** ShapeAnalysis_Curve::IsPeriodic ******/
		/****** md5 signature: 14b4ec3a44c3d382e75f9f0a5765c51e ******/
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
		static bool IsPeriodic(const opencascade::handle<Geom2d_Curve> & curve);

		/****** ShapeAnalysis_Curve::IsPlanar ******/
		/****** md5 signature: 6ca914784b525e7c53938273a90b7cf2 ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "
Parameters
----------
pnts: TColgp_Array1OfPnt
Normal: gp_XYZ
preci: double (optional, default to 0)

Return
-------
bool

Description
-----------
Checks if points are planar with given preci. If Normal has not zero modulus, checks with given normal.
") IsPlanar;
		static bool IsPlanar(const TColgp_Array1OfPnt & pnts, gp_XYZ & Normal, const double preci = 0);

		/****** ShapeAnalysis_Curve::IsPlanar ******/
		/****** md5 signature: ee92727855774f763e33435fd7ad7366 ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "
Parameters
----------
curve: Geom_Curve
Normal: gp_XYZ
preci: double (optional, default to 0)

Return
-------
bool

Description
-----------
Checks if curve is planar with given preci. If Normal has not zero modulus, checks with given normal.
") IsPlanar;
		static bool IsPlanar(const opencascade::handle<Geom_Curve> & curve, gp_XYZ & Normal, const double preci = 0);

		/****** ShapeAnalysis_Curve::NextProject ******/
		/****** md5 signature: 04c1a9dce61693e2b4b05e06e0cde0f8 ******/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "
Parameters
----------
paramPrev: double
C3D: Geom_Curve
P3D: gp_Pnt
preci: double
proj: gp_Pnt
cf: double
cl: double
AdjustToEnds: bool (optional, default to true)

Return
-------
param: double

Description
-----------
Projects a Point on a Curve using Newton method. <paramPrev> is taken as the first approximation of solution. If Newton algorithm fails the method Project() is used. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci>.
") NextProject;
		double NextProject(const double paramPrev, const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const double preci, gp_Pnt & proj, Standard_Real &OutValue, const double cf, const double cl, const bool AdjustToEnds = true);

		/****** ShapeAnalysis_Curve::NextProject ******/
		/****** md5 signature: fdb88d16c4d3c59923b6be6af73ce4f0 ******/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "
Parameters
----------
paramPrev: double
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: double
proj: gp_Pnt

Return
-------
param: double

Description
-----------
Projects a Point on a Curve using Newton method. <paramPrev> is taken as the first approximation of solution. If Newton algorithm fails the method Project() is used.
") NextProject;
		double NextProject(const double paramPrev, const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const double preci, gp_Pnt & proj, Standard_Real &OutValue);

		/****** ShapeAnalysis_Curve::Project ******/
		/****** md5 signature: b7350503ffab98524522ea8ee7bd8a84 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P3D: gp_Pnt
preci: double
proj: gp_Pnt
AdjustToEnds: bool (optional, default to true)

Return
-------
param: double

Description
-----------
Projects a Point on a Curve. Computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). The number of iterations is limited. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci> //! Returned value is the distance between the given point and computed one.
") Project;
		double Project(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const double preci, gp_Pnt & proj, Standard_Real &OutValue, const bool AdjustToEnds = true);

		/****** ShapeAnalysis_Curve::Project ******/
		/****** md5 signature: b363b82e4296402d8b4cda0aa01d3bae ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: double
proj: gp_Pnt
AdjustToEnds: bool (optional, default to true)

Return
-------
param: double

Description
-----------
Projects a Point on a Curve. Computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). The number of iterations is limited. //! Returned value is the distance between the given point and computed one.
") Project;
		double Project(const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const double preci, gp_Pnt & proj, Standard_Real &OutValue, const bool AdjustToEnds = true);

		/****** ShapeAnalysis_Curve::Project ******/
		/****** md5 signature: 72dbcc086638e914f9d13223a409efd7 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P3D: gp_Pnt
preci: double
proj: gp_Pnt
cf: double
cl: double
AdjustToEnds: bool (optional, default to true)

Return
-------
param: double

Description
-----------
Projects a Point on a Curve, but parameters are limited between <cf> and <cl>. The range [cf, cl] is extended with help of Adaptor3d on the basis of 3d precision <preci>. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci>.
") Project;
		double Project(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P3D, const double preci, gp_Pnt & proj, Standard_Real &OutValue, const double cf, const double cl, const bool AdjustToEnds = true);

		/****** ShapeAnalysis_Curve::ProjectAct ******/
		/****** md5 signature: 806349664b40ab2320d36563e97a177f ******/
		%feature("compactdefaultargs") ProjectAct;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
P3D: gp_Pnt
preci: double
proj: gp_Pnt

Return
-------
param: double

Description
-----------
No available documentation.
") ProjectAct;
		double ProjectAct(const Adaptor3d_Curve & C3D, const gp_Pnt & P3D, const double preci, gp_Pnt & proj, Standard_Real &OutValue);

		/****** ShapeAnalysis_Curve::SelectForwardSeam ******/
		/****** md5 signature: 5b24715bef03ee5bafb38f046a2460fd ******/
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
		int SelectForwardSeam(const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2);

		/****** ShapeAnalysis_Curve::ValidateRange ******/
		/****** md5 signature: 2673602c8d8215b5ad3d68f680ae6e29 ******/
		%feature("compactdefaultargs") ValidateRange;
		%feature("autodoc", "
Parameters
----------
Crv: Geom_Curve
prec: double

Return
-------
First: double
Last: double

Description
-----------
Validate parameters First and Last for the given curve in order to make them valid for creation of edge. This includes: - limiting range [First,Last] by range of curve - adjusting range [First,Last] for periodic (or closed) curve if Last < First Returns True if parameters are OK or are successfully corrected, or False if parameters cannot be corrected. In the latter case, parameters are reset to range of curve.
") ValidateRange;
		bool ValidateRange(const opencascade::handle<Geom_Curve> & Crv, Standard_Real &OutValue, Standard_Real &OutValue, const double prec);

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
		/****** md5 signature: c39949f29c1a1ac4e6b20e2e41b82b50 ******/
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
		bool BoundUV(const TopoDS_Edge & edge, const TopoDS_Face & face, gp_Pnt2d & first, gp_Pnt2d & last);

		/****** ShapeAnalysis_Edge::BoundUV ******/
		/****** md5 signature: 21714493e3fc99ac45745b4cada0d636 ******/
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
		bool BoundUV(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, gp_Pnt2d & first, gp_Pnt2d & last);

		/****** ShapeAnalysis_Edge::CheckCurve3dWithPCurve ******/
		/****** md5 signature: 866bf6c289a8ced6bab6a83b13de4c65 ******/
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
		bool CheckCurve3dWithPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeAnalysis_Edge::CheckCurve3dWithPCurve ******/
		/****** md5 signature: 71dfbb8deb9a98caf72122f295e72481 ******/
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
		bool CheckCurve3dWithPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeAnalysis_Edge::CheckOverlapping ******/
		/****** md5 signature: 9f7520cb13a85346018359b0e3b0c787 ******/
		%feature("compactdefaultargs") CheckOverlapping;
		%feature("autodoc", "
Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
theDomainDist: double (optional, default to 0.0)

Return
-------
theTolOverlap: double

Description
-----------
Checks the first edge is overlapped with second edge. If distance between two edges is less then theTolOverlap edges are overlapped. theDomainDis - length of part of edges on which edges are overlapped.
") CheckOverlapping;
		bool CheckOverlapping(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, Standard_Real &OutValue, const double theDomainDist = 0.0);

		/****** ShapeAnalysis_Edge::CheckPCurveRange ******/
		/****** md5 signature: 7959bd9b2aa039a8c040de6ce10a1f93 ******/
		%feature("compactdefaultargs") CheckPCurveRange;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double
thePC: Geom2d_Curve

Return
-------
bool

Description
-----------
Checks possibility for pcurve thePC to have range [theFirst, theLast] (edge range) having respect to real first, last parameters of thePC.
") CheckPCurveRange;
		bool CheckPCurveRange(const double theFirst, const double theLast, const opencascade::handle<Geom2d_Curve> & thePC);

		/****** ShapeAnalysis_Edge::CheckSameParameter ******/
		/****** md5 signature: abfcf03fd9ad5a25be8bf3870e00813d ******/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
NbControl: int (optional, default to 23)

Return
-------
maxdev: double

Description
-----------
Checks the edge to be SameParameter. Calculates the maximal deviation between 3d curve and each pcurve of the edge on <NbControl> equidistant points (the same algorithm as in BRepCheck; default value is 23 as in BRepCheck). This deviation is returned in <maxdev> parameter. If deviation is greater than tolerance of the edge (i.e. incorrect flag) returns False, else returns True.
") CheckSameParameter;
		bool CheckSameParameter(const TopoDS_Edge & edge, Standard_Real &OutValue, const int NbControl = 23);

		/****** ShapeAnalysis_Edge::CheckSameParameter ******/
		/****** md5 signature: 1af1f62c136f1485a9a67bf432f73b3a ******/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theNbControl: int (optional, default to 23)

Return
-------
theMaxdev: double

Description
-----------
Checks the edge to be SameParameter. Calculates the maximal deviation between 3d curve and each pcurve of the edge on <NbControl> equidistant points (the same algorithm as in BRepCheck; default value is 23 as in BRepCheck). This deviation is returned in <maxdev> parameter. If deviation is greater than tolerance of the edge (i.e. incorrect flag) returns False, else returns True.
") CheckSameParameter;
		bool CheckSameParameter(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, Standard_Real &OutValue, const int theNbControl = 23);

		/****** ShapeAnalysis_Edge::CheckVertexTolerance ******/
		/****** md5 signature: 0dca0ff0fcff823a5eb1b6f948816360 ******/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Return
-------
toler1: double
toler2: double

Description
-----------
No available documentation.
") CheckVertexTolerance;
		bool CheckVertexTolerance(const TopoDS_Edge & edge, const TopoDS_Face & face, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Edge::CheckVertexTolerance ******/
		/****** md5 signature: a5fc1430d80195d6c3fb24b6c1b4c6fd ******/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
toler1: double
toler2: double

Description
-----------
Checks if it is necessary to increase tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) toler1 returns necessary tolerance for first vertex, toler2 returns necessary tolerance for last vertex.
") CheckVertexTolerance;
		bool CheckVertexTolerance(const TopoDS_Edge & edge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Edge::CheckVerticesWithCurve3d ******/
		/****** md5 signature: 99bd3f96b0f6e4aeccf7630b47df9fe6 ******/
		%feature("compactdefaultargs") CheckVerticesWithCurve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
preci: double (optional, default to -1)
vtx: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks the start and/or end vertex of the edge for matching with 3d curve with the given precision. <vtx> = 1: start vertex only <vtx> = 2: end vertex only <vtx> = 0: both (default) If preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.
") CheckVerticesWithCurve3d;
		bool CheckVerticesWithCurve3d(const TopoDS_Edge & edge, const double preci = -1, const int vtx = 0);

		/****** ShapeAnalysis_Edge::CheckVerticesWithPCurve ******/
		/****** md5 signature: 6d496057aab82fd19a0bc45da68bb87d ******/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
preci: double (optional, default to -1)
vtx: int (optional, default to 0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckVerticesWithPCurve;
		bool CheckVerticesWithPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, const double preci = -1, const int vtx = 0);

		/****** ShapeAnalysis_Edge::CheckVerticesWithPCurve ******/
		/****** md5 signature: db517d0d8e7b81bf15988658d33cfb3c ******/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
preci: double (optional, default to -1)
vtx: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks the start and/or end vertex of the edge for matching with pcurve with the given precision. <vtx> = 1: start vertex <vtx> = 2: end vertex <vtx> = 0: both If preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.
") CheckVerticesWithPCurve;
		bool CheckVerticesWithPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const double preci = -1, const int vtx = 0);

		/****** ShapeAnalysis_Edge::Curve3d ******/
		/****** md5 signature: 7e0eba7e1859fb0f14ae6b86eceaf3e7 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
C3d: Geom_Curve
orient: bool (optional, default to true)

Return
-------
cf: double
cl: double

Description
-----------
Returns the 3d curve and bounding parameters for the edge Returns False if no 3d curve. If <orient> is True (default), takes orientation into account: if the edge is reversed, cf and cl are toggled.
") Curve3d;
		bool Curve3d(const TopoDS_Edge & edge, opencascade::handle<Geom_Curve> & C3d, Standard_Real &OutValue, Standard_Real &OutValue, const bool orient = true);

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
		/****** md5 signature: 52545aab43b984e50625b5ec0a837143 ******/
		%feature("compactdefaultargs") GetEndTangent2d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
atEnd: bool
pos: gp_Pnt2d
tang: gp_Vec2d
dparam: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") GetEndTangent2d;
		bool GetEndTangent2d(const TopoDS_Edge & edge, const TopoDS_Face & face, const bool atEnd, gp_Pnt2d & pos, gp_Vec2d & tang, const double dparam = 0.0);

		/****** ShapeAnalysis_Edge::GetEndTangent2d ******/
		/****** md5 signature: c1bc766b9ea5aa398fab1652510d6be6 ******/
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
dparam: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Returns tangent of the edge pcurve at its start (if atEnd is False) or end (if True), regarding the orientation of edge. If edge is REVERSED, tangent is reversed before return. Returns True if pcurve is available and tangent is computed and is not null, else False.
") GetEndTangent2d;
		bool GetEndTangent2d(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const bool atEnd, gp_Pnt2d & pos, gp_Vec2d & tang, const double dparam = 0.0);

		/****** ShapeAnalysis_Edge::HasCurve3d ******/
		/****** md5 signature: d0f409d2b19fa5fc17649a1e6206e486 ******/
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
		bool HasCurve3d(const TopoDS_Edge & edge);

		/****** ShapeAnalysis_Edge::HasPCurve ******/
		/****** md5 signature: 2610fb9965bd2dba6e5f9a5f4fc7aa5a ******/
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
		bool HasPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeAnalysis_Edge::HasPCurve ******/
		/****** md5 signature: 607f05aa58df4e0fe1237973fe9076cb ******/
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
		bool HasPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeAnalysis_Edge::IsClosed3d ******/
		/****** md5 signature: baaa6ecdd8efae44fee8f4fc678aa521 ******/
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
		bool IsClosed3d(const TopoDS_Edge & edge);

		/****** ShapeAnalysis_Edge::IsSeam ******/
		/****** md5 signature: 3343ffefd1f10eacef6f15582cb49e7d ******/
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
		bool IsSeam(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeAnalysis_Edge::IsSeam ******/
		/****** md5 signature: ab2fc0aeaf6d4c767cc30a452c1fab14 ******/
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
		bool IsSeam(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

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
		/****** md5 signature: ffbe64e0b3412d0c4197c02b8e2d2c83 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
C2d: Geom2d_Curve
orient: bool (optional, default to true)

Return
-------
cf: double
cl: double

Description
-----------
No available documentation.
") PCurve;
		bool PCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, opencascade::handle<Geom2d_Curve> & C2d, Standard_Real &OutValue, Standard_Real &OutValue, const bool orient = true);

		/****** ShapeAnalysis_Edge::PCurve ******/
		/****** md5 signature: c1921ac32e0c46e902e8021f290eac8f ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
C2d: Geom2d_Curve
orient: bool (optional, default to true)

Return
-------
cf: double
cl: double

Description
-----------
Returns the pcurve and bounding parameters for the edge lying on the surface. Returns False if the edge has no pcurve on this surface. If <orient> is True (default), takes orientation into account: if the edge is reversed, cf and cl are toggled.
") PCurve;
		bool PCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, opencascade::handle<Geom2d_Curve> & C2d, Standard_Real &OutValue, Standard_Real &OutValue, const bool orient = true);

		/****** ShapeAnalysis_Edge::Status ******/
		/****** md5 signature: a05ed6c88abfa8b368ed1faac2258e92 ******/
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
		bool Status(const ShapeExtend_Status status);

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
		/****** md5 signature: cef23f3abfeac8dc7a6aa4c08644e616 ******/
		%feature("compactdefaultargs") AddNotch;
		%feature("autodoc", "
Parameters
----------
notch: TopoDS_Wire
width: double

Return
-------
None

Description
-----------
Adds notch on the contour with its maximum width.
") AddNotch;
		void AddNotch(const TopoDS_Wire & notch, const double width);

		/****** ShapeAnalysis_FreeBoundData::Area ******/
		/****** md5 signature: 4b82d5560f2561bf4d5ec4dc5ee230a0 ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns area of the contour.
") Area;
		double Area();

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
		/****** md5 signature: 11b8535068d290329ab8ddf4ec24b9ca ******/
		%feature("compactdefaultargs") NbNotches;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of notches on the contour.
") NbNotches;
		int NbNotches();

		/****** ShapeAnalysis_FreeBoundData::Notch ******/
		/****** md5 signature: ddbcefe164fc6c6b7f6c8361d80e9d0c ******/
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
		TopoDS_Wire Notch(const int index);

		/****** ShapeAnalysis_FreeBoundData::NotchWidth ******/
		/****** md5 signature: 86e8ed071cf24693a1c9d13102696173 ******/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
double

Description
-----------
Returns maximum width of notch specified by its rank number on the contour.
") NotchWidth;
		double NotchWidth(const int index);

		/****** ShapeAnalysis_FreeBoundData::NotchWidth ******/
		/****** md5 signature: 1f4124b30973e1d30e992350062f9743 ******/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "
Parameters
----------
notch: TopoDS_Wire

Return
-------
double

Description
-----------
Returns maximum width of notch specified as TopoDS_Wire on the contour.
") NotchWidth;
		double NotchWidth(const TopoDS_Wire & notch);

		/****** ShapeAnalysis_FreeBoundData::Notches ******/
		/****** md5 signature: 4ee1252c1edfd1a4e189d256d2eb7588 ******/
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
		/****** md5 signature: ee1b3ad56336a8f29e194fade4831521 ******/
		%feature("compactdefaultargs") Perimeter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns perimeter of the contour.
") Perimeter;
		double Perimeter();

		/****** ShapeAnalysis_FreeBoundData::Ratio ******/
		/****** md5 signature: f5a84ad44a687ba1d8800b4abce03bbc ******/
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns ratio of average length to average width of the contour.
") Ratio;
		double Ratio();

		/****** ShapeAnalysis_FreeBoundData::SetArea ******/
		/****** md5 signature: 3d5cd18ad6bfab54dea7d540624affb5 ******/
		%feature("compactdefaultargs") SetArea;
		%feature("autodoc", "
Parameters
----------
area: double

Return
-------
None

Description
-----------
Sets area of the contour.
") SetArea;
		void SetArea(const double area);

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
		/****** md5 signature: 77d51a7e323fafb6a10f5488c24808b4 ******/
		%feature("compactdefaultargs") SetPerimeter;
		%feature("autodoc", "
Parameters
----------
perimeter: double

Return
-------
None

Description
-----------
Sets perimeter of the contour.
") SetPerimeter;
		void SetPerimeter(const double perimeter);

		/****** ShapeAnalysis_FreeBoundData::SetRatio ******/
		/****** md5 signature: ba3285104c1357c7a9122c777c7bc560 ******/
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "
Parameters
----------
ratio: double

Return
-------
None

Description
-----------
Sets ratio of average length to average width of the contour.
") SetRatio;
		void SetRatio(const double ratio);

		/****** ShapeAnalysis_FreeBoundData::SetWidth ******/
		/****** md5 signature: bbd315f9e3ce99b908a4c7aa8adcb168 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
width: double

Return
-------
None

Description
-----------
Sets average width of the contour.
") SetWidth;
		void SetWidth(const double width);

		/****** ShapeAnalysis_FreeBoundData::Width ******/
		/****** md5 signature: 1fd4c6d3d33fbd8b282f769785a59bae ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns average width of the contour.
") Width;
		double Width();

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
		/****** md5 signature: aca264759c4ff578d6633836a21f4d13 ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
toler: double
splitclosed: bool (optional, default to false)
splitopen: bool (optional, default to true)

Return
-------
None

Description
-----------
Builds forecasting free bounds of the <shape>. <shape> should be a compound of faces. This constructor is to be used for forecasting free edges with help of sewing analyzer BRepAlgo_Sewing which is called with tolerance <toler>. Free edges are connected into wires only when their ends are at distance less than <toler>. If <splitclosed> is True extracts closed sub-wires out of built closed wires. If <splitopen> is True extracts closed sub-wires out of built open wires.
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds(const TopoDS_Shape & shape, const double toler, const bool splitclosed = false, const bool splitopen = true);

		/****** ShapeAnalysis_FreeBounds::ShapeAnalysis_FreeBounds ******/
		/****** md5 signature: e24bd9687f9330d4562c2904ea22106e ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
splitclosed: bool (optional, default to false)
splitopen: bool (optional, default to true)
checkinternaledges: bool (optional, default to false)

Return
-------
None

Description
-----------
Builds actual free bounds of the <shape>. <shape> should be a compound of shells. This constructor is to be used for getting free edges (ones referenced by the only face) with help of analyzer ShapeAnalysis_Shell. Free edges are connected into wires only when they share the same vertex. If <splitclosed> is True extracts closed sub-wires out of built closed wires. If <splitopen> is True extracts closed sub-wires out of built open wires.
") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds(const TopoDS_Shape & shape, const bool splitclosed = false, const bool splitopen = true, const bool checkinternaledges = false);

		/****** ShapeAnalysis_FreeBounds::DispatchWires ******/
		/****** md5 signature: ab913347d2d0c8c5ba110fdbc7e3018d ******/
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
		/****** md5 signature: c00926d8356712a9ebbe1d473e119360 ******/
		%feature("compactdefaultargs") SplitWires;
		%feature("autodoc", "
Parameters
----------
wires: TopTools_HSequenceOfShape
toler: double
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
		static void SplitWires(const opencascade::handle<TopTools_HSequenceOfShape> & wires, const double toler, const bool shared, opencascade::handle<TopTools_HSequenceOfShape> & closed, opencascade::handle<TopTools_HSequenceOfShape> & open);

};



%extend ShapeAnalysis_FreeBounds {
    static Handle(TopTools_HSequenceOfShape) ConnectEdgesToWires(opencascade::handle<TopTools_HSequenceOfShape> & edges,
              const Standard_Real toler,
              const Standard_Boolean shared)
        {
            Handle(TopTools_HSequenceOfShape) owires = new TopTools_HSequenceOfShape;
            ShapeAnalysis_FreeBounds::ConnectEdgesToWires(edges, toler, shared, owires);
            return owires;
        }
    };

%extend ShapeAnalysis_FreeBounds {
    static Handle(TopTools_HSequenceOfShape) ConnectWiresToWires(opencascade::handle<TopTools_HSequenceOfShape> & iwires,
              const Standard_Real toler,
              const Standard_Boolean shared)
        {
            Handle(TopTools_HSequenceOfShape) owires = new TopTools_HSequenceOfShape;
            ShapeAnalysis_FreeBounds::ConnectWiresToWires(iwires, toler, shared, owires);
            return owires;
        }
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
		/****** md5 signature: 2080da84972bc639ae4e913e21e611aa ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tolerance: double
splitclosed: bool (optional, default to false)
splitopen: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates the object and calls corresponding Init. <shape> should be a compound of faces.
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties(const TopoDS_Shape & shape, const double tolerance, const bool splitclosed = false, const bool splitopen = false);

		/****** ShapeAnalysis_FreeBoundsProperties::ShapeAnalysis_FreeBoundsProperties ******/
		/****** md5 signature: 031fc7da80e2086456fbaf4bab34525a ******/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
splitclosed: bool (optional, default to false)
splitopen: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates the object and calls corresponding Init. <shape> should be a compound of shells.
") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties(const TopoDS_Shape & shape, const bool splitclosed = false, const bool splitopen = false);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckContours ******/
		/****** md5 signature: 5f6f6a4210be7a2e7f62f5274b5d7432 ******/
		%feature("compactdefaultargs") CheckContours;
		%feature("autodoc", "
Parameters
----------
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckContours;
		bool CheckContours(const double prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckNotches ******/
		/****** md5 signature: b9f8443bfdf75d0fceb0c9a3fd7dcba8 ******/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "
Parameters
----------
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckNotches;
		bool CheckNotches(const double prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckNotches ******/
		/****** md5 signature: 57ef3ff1e36a289fb21f5ef8193ade99 ******/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "
Parameters
----------
fbData: ShapeAnalysis_FreeBoundData
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") CheckNotches;
		bool CheckNotches(opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData, const double prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::CheckNotches ******/
		/****** md5 signature: 69a1347963a131fced2dc3c3a47b35cc ******/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", "
Parameters
----------
freebound: TopoDS_Wire
num: int
notch: TopoDS_Wire
prec: double (optional, default to 0.0)

Return
-------
distMax: double

Description
-----------
No available documentation.
") CheckNotches;
		bool CheckNotches(const TopoDS_Wire & freebound, const int num, TopoDS_Wire & notch, Standard_Real &OutValue, const double prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::ClosedFreeBound ******/
		/****** md5 signature: 1f8ee12b43b4c2de5634401ce0db6d64 ******/
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
		opencascade::handle<ShapeAnalysis_FreeBoundData> ClosedFreeBound(const int index);

		/****** ShapeAnalysis_FreeBoundsProperties::ClosedFreeBounds ******/
		/****** md5 signature: 4e65f1ec3c7fc64d7171846b7a1b23b3 ******/
		%feature("compactdefaultargs") ClosedFreeBounds;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>>

Description
-----------
Returns all closed free bounds.
") ClosedFreeBounds;
		opencascade::handle<NCollection_HSequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>> ClosedFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::DispatchBounds ******/
		/****** md5 signature: d80abeafa323eea87622b669643415a4 ******/
		%feature("compactdefaultargs") DispatchBounds;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DispatchBounds;
		bool DispatchBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::FillProperties ******/
		/****** md5 signature: 281c8465df04d5ddaf96ae0a986ca9b8 ******/
		%feature("compactdefaultargs") FillProperties;
		%feature("autodoc", "
Parameters
----------
fbData: ShapeAnalysis_FreeBoundData
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
No available documentation.
") FillProperties;
		bool FillProperties(opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData, const double prec = 0.0);

		/****** ShapeAnalysis_FreeBoundsProperties::Init ******/
		/****** md5 signature: 63d1713e61cf8c9d5a81340954807a1f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tolerance: double
splitclosed: bool (optional, default to false)
splitopen: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the object with given parameters. <shape> should be a compound of faces.
") Init;
		void Init(const TopoDS_Shape & shape, const double tolerance, const bool splitclosed = false, const bool splitopen = false);

		/****** ShapeAnalysis_FreeBoundsProperties::Init ******/
		/****** md5 signature: 962cc1469b89196e601d4757b85aa69a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
splitclosed: bool (optional, default to false)
splitopen: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the object with given parameters. <shape> should be a compound of shells.
") Init;
		void Init(const TopoDS_Shape & shape, const bool splitclosed = false, const bool splitopen = false);

		/****** ShapeAnalysis_FreeBoundsProperties::IsLoaded ******/
		/****** md5 signature: fc2ce1bc5ddcb407c056c0f8bbdeface ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if shape is loaded.
") IsLoaded;
		bool IsLoaded();

		/****** ShapeAnalysis_FreeBoundsProperties::NbClosedFreeBounds ******/
		/****** md5 signature: 366f2d09e910f07dee1e62e80e54ffea ******/
		%feature("compactdefaultargs") NbClosedFreeBounds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of closed free bounds.
") NbClosedFreeBounds;
		int NbClosedFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::NbFreeBounds ******/
		/****** md5 signature: 97a17f5c3268f1c323dd6732e1c8562f ******/
		%feature("compactdefaultargs") NbFreeBounds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of free bounds.
") NbFreeBounds;
		int NbFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::NbOpenFreeBounds ******/
		/****** md5 signature: 5c1d0f6a9965966225e100bb623788c7 ******/
		%feature("compactdefaultargs") NbOpenFreeBounds;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of open free bounds.
") NbOpenFreeBounds;
		int NbOpenFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::OpenFreeBound ******/
		/****** md5 signature: 1472ad4f4eba74e60f3e4db553dc9d48 ******/
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
		opencascade::handle<ShapeAnalysis_FreeBoundData> OpenFreeBound(const int index);

		/****** ShapeAnalysis_FreeBoundsProperties::OpenFreeBounds ******/
		/****** md5 signature: f8d30073474b5f092c1f2d92d8698b2f ******/
		%feature("compactdefaultargs") OpenFreeBounds;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>>

Description
-----------
Returns all open free bounds.
") OpenFreeBounds;
		opencascade::handle<NCollection_HSequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>> OpenFreeBounds();

		/****** ShapeAnalysis_FreeBoundsProperties::Perform ******/
		/****** md5 signature: 836e5d294e107797e3a08ad4bfbbad29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Builds and analyzes free bounds of the shape. First calls ShapeAnalysis_FreeBounds for building free bounds. Then on each free bound computes its properties: - area of the contour, - perimeter of the contour, - ratio of average length to average width of the contour, - average width of contour, - notches on the contour and for each notch - maximum width of the notch.
") Perform;
		bool Perform();

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
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance.
") Tolerance;
		double Tolerance();

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
		/****** md5 signature: 6de033d2a1cdaacac0e8b0a128c20d8e ******/
		%feature("compactdefaultargs") NearestPlane;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array1OfPnt
aPln: gp_Pln

Return
-------
Dmax: double

Description
-----------
Builds a plane out of a set of points in array Returns in <dmax> the maximal distance between the produced plane and given points.
") NearestPlane;
		static bool NearestPlane(const TColgp_Array1OfPnt & Pnts, gp_Pln & aPln, Standard_Real &OutValue);

		/****** ShapeAnalysis_Geom::PositionTrsf ******/
		/****** md5 signature: abccdb811ee784b602b5f513079e5fc5 ******/
		%feature("compactdefaultargs") PositionTrsf;
		%feature("autodoc", "
Parameters
----------
coefs: TColStd_HArray2OfReal
trsf: gp_Trsf
unit: double
prec: double

Return
-------
bool

Description
-----------
Builds transformation object out of matrix. Matrix must be 3 x 4. Unit is used as multiplier.
") PositionTrsf;
		static bool PositionTrsf(const opencascade::handle<TColStd_HArray2OfReal> & coefs, gp_Trsf & trsf, const double unit, const double prec);

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
		/****** md5 signature: eb5e83d73a70b711eeeeab1c77d9066f ******/
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
		/****** md5 signature: a7ae9a8ca0ca31c0a2f13f4e3d2018ad ******/
		%feature("compactdefaultargs") IndirectSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") IndirectSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & IndirectSec();

		/****** ShapeAnalysis_ShapeContents::ModifyBigSplineMode ******/
		/****** md5 signature: 66ead8cdb7d2fd8ac04c28569fdc4a8a ******/
		%feature("compactdefaultargs") ModifyBigSplineMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether to store faces with edges if its 3D curves has more than 8192 poles.
") ModifyBigSplineMode;
		bool & ModifyBigSplineMode();

		/****** ShapeAnalysis_ShapeContents::ModifyIndirectMode ******/
		/****** md5 signature: 7a1bc0975061f492e8728be8f31ba26a ******/
		%feature("compactdefaultargs") ModifyIndirectMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether to store faces on indirect surfaces.
") ModifyIndirectMode;
		bool & ModifyIndirectMode();

		/****** ShapeAnalysis_ShapeContents::ModifyOffestSurfaceMode ******/
		/****** md5 signature: 20e850bcd30208b31840ea5aa7dca26e ******/
		%feature("compactdefaultargs") ModifyOffestSurfaceMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ModifyOffestSurfaceMode;
		bool & ModifyOffestSurfaceMode();

		/****** ShapeAnalysis_ShapeContents::ModifyOffsetCurveMode ******/
		/****** md5 signature: cbaf1a4c83dc70fc3b18b5837e7f2765 ******/
		%feature("compactdefaultargs") ModifyOffsetCurveMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether to store faces with edges if its 3D curves and pcurves are offset curves.
") ModifyOffsetCurveMode;
		bool & ModifyOffsetCurveMode();

		/****** ShapeAnalysis_ShapeContents::ModifyOffsetSurfaceMode ******/
		/****** md5 signature: 52ebb831db5a7d5f883be1c8c81151ca ******/
		%feature("compactdefaultargs") ModifyOffsetSurfaceMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether to store faces on offset surfaces.
") ModifyOffsetSurfaceMode;
		bool & ModifyOffsetSurfaceMode();

		/****** ShapeAnalysis_ShapeContents::ModifyTrimmed2dMode ******/
		/****** md5 signature: a9581e3ab561637a90fe7bdfa4c703bf ******/
		%feature("compactdefaultargs") ModifyTrimmed2dMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether to store faces with edges if its pcurves are trimmed curves.
") ModifyTrimmed2dMode;
		bool & ModifyTrimmed2dMode();

		/****** ShapeAnalysis_ShapeContents::ModifyTrimmed3dMode ******/
		/****** md5 signature: 08885bb233d40ee4f0077e8b5737b51c ******/
		%feature("compactdefaultargs") ModifyTrimmed3dMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether to store faces with edges if its 3D curves are trimmed curves.
") ModifyTrimmed3dMode;
		bool & ModifyTrimmed3dMode();

		/****** ShapeAnalysis_ShapeContents::NbBSplibeSurf ******/
		/****** md5 signature: 504ed189f31e6f63b63d77a444978d18 ******/
		%feature("compactdefaultargs") NbBSplibeSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBSplibeSurf;
		int NbBSplibeSurf();

		/****** ShapeAnalysis_ShapeContents::NbBezierSurf ******/
		/****** md5 signature: a83988a028e4c8bcbe2511a9bf1ebd3c ******/
		%feature("compactdefaultargs") NbBezierSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBezierSurf;
		int NbBezierSurf();

		/****** ShapeAnalysis_ShapeContents::NbBigSplines ******/
		/****** md5 signature: dcb8760be076e3b2eb16b6ea19ccfb1f ******/
		%feature("compactdefaultargs") NbBigSplines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBigSplines;
		int NbBigSplines();

		/****** ShapeAnalysis_ShapeContents::NbC0Curves ******/
		/****** md5 signature: b39a3f50f9a3506de9da9ee9eb08b11c ******/
		%feature("compactdefaultargs") NbC0Curves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbC0Curves;
		int NbC0Curves();

		/****** ShapeAnalysis_ShapeContents::NbC0Surfaces ******/
		/****** md5 signature: de8ed7ccc84549886700bfba0bac009a ******/
		%feature("compactdefaultargs") NbC0Surfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbC0Surfaces;
		int NbC0Surfaces();

		/****** ShapeAnalysis_ShapeContents::NbEdges ******/
		/****** md5 signature: 54a1d338afeb2b34e693b9eb0a27ecb6 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		int NbEdges();

		/****** ShapeAnalysis_ShapeContents::NbFaceWithSevWires ******/
		/****** md5 signature: d6afb7e6d2f9c8d7b3b89a5de1fad7d1 ******/
		%feature("compactdefaultargs") NbFaceWithSevWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFaceWithSevWires;
		int NbFaceWithSevWires();

		/****** ShapeAnalysis_ShapeContents::NbFaces ******/
		/****** md5 signature: ca0e57d3019bd799207efa4bb76fb8a2 ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFaces;
		int NbFaces();

		/****** ShapeAnalysis_ShapeContents::NbFreeEdges ******/
		/****** md5 signature: 8176479433878493da4a7b7699b04e3f ******/
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFreeEdges;
		int NbFreeEdges();

		/****** ShapeAnalysis_ShapeContents::NbFreeFaces ******/
		/****** md5 signature: 8e1b92273cfb5ce5a1514424857419f2 ******/
		%feature("compactdefaultargs") NbFreeFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFreeFaces;
		int NbFreeFaces();

		/****** ShapeAnalysis_ShapeContents::NbFreeWires ******/
		/****** md5 signature: 822488f79e5b3a590f72ea136ee821e2 ******/
		%feature("compactdefaultargs") NbFreeWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFreeWires;
		int NbFreeWires();

		/****** ShapeAnalysis_ShapeContents::NbIndirectSurf ******/
		/****** md5 signature: c24adcccf4ac9031f90e395b78fc2194 ******/
		%feature("compactdefaultargs") NbIndirectSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIndirectSurf;
		int NbIndirectSurf();

		/****** ShapeAnalysis_ShapeContents::NbNoPCurve ******/
		/****** md5 signature: 5cdbea7d945bcc6a19067f9d2ebec8b6 ******/
		%feature("compactdefaultargs") NbNoPCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbNoPCurve;
		int NbNoPCurve();

		/****** ShapeAnalysis_ShapeContents::NbOffsetCurves ******/
		/****** md5 signature: f730c2fa342e7fb773198d1bc014fb9e ******/
		%feature("compactdefaultargs") NbOffsetCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOffsetCurves;
		int NbOffsetCurves();

		/****** ShapeAnalysis_ShapeContents::NbOffsetSurf ******/
		/****** md5 signature: cd6595e91a025ee7afec565521ab1e6e ******/
		%feature("compactdefaultargs") NbOffsetSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOffsetSurf;
		int NbOffsetSurf();

		/****** ShapeAnalysis_ShapeContents::NbSharedEdges ******/
		/****** md5 signature: a4a12e33e8449cfa79c7d5c360e81220 ******/
		%feature("compactdefaultargs") NbSharedEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedEdges;
		int NbSharedEdges();

		/****** ShapeAnalysis_ShapeContents::NbSharedFaces ******/
		/****** md5 signature: 6a333ef102990098b01d74d54db1aabc ******/
		%feature("compactdefaultargs") NbSharedFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedFaces;
		int NbSharedFaces();

		/****** ShapeAnalysis_ShapeContents::NbSharedFreeEdges ******/
		/****** md5 signature: cb1a0ac3aea56bc68ec265ba42341f01 ******/
		%feature("compactdefaultargs") NbSharedFreeEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedFreeEdges;
		int NbSharedFreeEdges();

		/****** ShapeAnalysis_ShapeContents::NbSharedFreeWires ******/
		/****** md5 signature: 8ceef097db5da79cacae1d86de777d7c ******/
		%feature("compactdefaultargs") NbSharedFreeWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedFreeWires;
		int NbSharedFreeWires();

		/****** ShapeAnalysis_ShapeContents::NbSharedShells ******/
		/****** md5 signature: 5446be4cf055cf92311689fe7c0829da ******/
		%feature("compactdefaultargs") NbSharedShells;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedShells;
		int NbSharedShells();

		/****** ShapeAnalysis_ShapeContents::NbSharedSolids ******/
		/****** md5 signature: daccca0c9c120ef1293e678be98b557f ******/
		%feature("compactdefaultargs") NbSharedSolids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedSolids;
		int NbSharedSolids();

		/****** ShapeAnalysis_ShapeContents::NbSharedVertices ******/
		/****** md5 signature: 6a2d6cb8ffdce8e0745bd35e3051e0c2 ******/
		%feature("compactdefaultargs") NbSharedVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedVertices;
		int NbSharedVertices();

		/****** ShapeAnalysis_ShapeContents::NbSharedWires ******/
		/****** md5 signature: 6bd9ce6c6cf1cdc6f3931bab5e83379a ******/
		%feature("compactdefaultargs") NbSharedWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSharedWires;
		int NbSharedWires();

		/****** ShapeAnalysis_ShapeContents::NbShells ******/
		/****** md5 signature: fe6d9163be39bb805387107ba72762ee ******/
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShells;
		int NbShells();

		/****** ShapeAnalysis_ShapeContents::NbSolids ******/
		/****** md5 signature: a087000c0e9d57ce4c34d524c89f067e ******/
		%feature("compactdefaultargs") NbSolids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSolids;
		int NbSolids();

		/****** ShapeAnalysis_ShapeContents::NbSolidsWithVoids ******/
		/****** md5 signature: b91ec04cbff36243068a13edfb928fc9 ******/
		%feature("compactdefaultargs") NbSolidsWithVoids;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSolidsWithVoids;
		int NbSolidsWithVoids();

		/****** ShapeAnalysis_ShapeContents::NbTrimSurf ******/
		/****** md5 signature: a6ad73ea8931f5829d5cfc90b13dba1d ******/
		%feature("compactdefaultargs") NbTrimSurf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrimSurf;
		int NbTrimSurf();

		/****** ShapeAnalysis_ShapeContents::NbTrimmedCurve2d ******/
		/****** md5 signature: 158efdebf5a6ff465b6928c71ca58cd6 ******/
		%feature("compactdefaultargs") NbTrimmedCurve2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrimmedCurve2d;
		int NbTrimmedCurve2d();

		/****** ShapeAnalysis_ShapeContents::NbTrimmedCurve3d ******/
		/****** md5 signature: 3e3c29cb42360344137a2a2e0c0787a9 ******/
		%feature("compactdefaultargs") NbTrimmedCurve3d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrimmedCurve3d;
		int NbTrimmedCurve3d();

		/****** ShapeAnalysis_ShapeContents::NbVertices ******/
		/****** md5 signature: 676ffa5138c16f6d415a522aadbbc34b ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertices;
		int NbVertices();

		/****** ShapeAnalysis_ShapeContents::NbWireWithSevSeams ******/
		/****** md5 signature: c7d01effbc62fd61514d661a9593c905 ******/
		%feature("compactdefaultargs") NbWireWithSevSeams;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWireWithSevSeams;
		int NbWireWithSevSeams();

		/****** ShapeAnalysis_ShapeContents::NbWireWitnSeam ******/
		/****** md5 signature: 3fd56e1a577876d2029824ad29313b3b ******/
		%feature("compactdefaultargs") NbWireWitnSeam;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWireWitnSeam;
		int NbWireWitnSeam();

		/****** ShapeAnalysis_ShapeContents::NbWires ******/
		/****** md5 signature: fd4feeac48e0420944f46658b8fcc010 ******/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWires;
		int NbWires();

		/****** ShapeAnalysis_ShapeContents::OffsetCurveSec ******/
		/****** md5 signature: 292cc8589d9b28b92c308b69b36fac50 ******/
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
		/****** md5 signature: 126875f716cee4fbd577ee1dec97703e ******/
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
		/****** md5 signature: d216dfcf0aec17578493d3d334f73d8d ******/
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
		/****** md5 signature: 63e5f462429def2e28721648c5f7c5eb ******/
		%feature("compactdefaultargs") Trimmed3dSec;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") Trimmed3dSec;
		const opencascade::handle<TopTools_HSequenceOfShape> & Trimmed3dSec();

		%extend{
			bool GetModifyBigSplineMode() { return self->ModifyBigSplineMode(); }
			void SetModifyBigSplineMode(bool value) { self->ModifyBigSplineMode() = value; }
		};
		%extend{
			bool GetModifyIndirectMode() { return self->ModifyIndirectMode(); }
			void SetModifyIndirectMode(bool value) { self->ModifyIndirectMode() = value; }
		};
		%extend{
			bool GetModifyOffsetSurfaceMode() { return self->ModifyOffsetSurfaceMode(); }
			void SetModifyOffsetSurfaceMode(bool value) { self->ModifyOffsetSurfaceMode() = value; }
		};
		%extend{
			bool GetModifyTrimmed3dMode() { return self->ModifyTrimmed3dMode(); }
			void SetModifyTrimmed3dMode(bool value) { self->ModifyTrimmed3dMode() = value; }
		};
		%extend{
			bool GetModifyOffsetCurveMode() { return self->ModifyOffsetCurveMode(); }
			void SetModifyOffsetCurveMode(bool value) { self->ModifyOffsetCurveMode() = value; }
		};
		%extend{
			bool GetModifyTrimmed2dMode() { return self->ModifyTrimmed2dMode(); }
			void SetModifyTrimmed2dMode(bool value) { self->ModifyTrimmed2dMode() = value; }
		};
		%extend{
			bool GetModifyOffestSurfaceMode() { return self->ModifyOffestSurfaceMode(); }
			void SetModifyOffestSurfaceMode(bool value) { self->ModifyOffestSurfaceMode() = value; }
		};
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
		/****** md5 signature: a96a1a624105f666f7cf18857f025094 ******/
		%feature("compactdefaultargs") GlobalTolerance;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
double

Description
-----------
Returns the computed tolerance according to the <mode> <mode> = 0: average <mode> > 0: maximal <mode> < 0: minimal.
") GlobalTolerance;
		double GlobalTolerance(const int mode);

		/****** ShapeAnalysis_ShapeTolerance::InTolerance ******/
		/****** md5 signature: d74a649434a59432adb15bde16f2e819 ******/
		%feature("compactdefaultargs") InTolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
valmin: double
valmax: double
type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Determines which shapes have a tolerance within a given interval <type> is interpreted as in the method Tolerance.
") InTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> InTolerance(const TopoDS_Shape & shape, const double valmin, const double valmax, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

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
		/****** md5 signature: e42c326a4c018563bd855fa7a70bb6e6 ******/
		%feature("compactdefaultargs") OverTolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
value: double
type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Determines which shapes have a tolerance over the given value <type> is interpreted as in the method Tolerance.
") OverTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> OverTolerance(const TopoDS_Shape & shape, const double value, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****** ShapeAnalysis_ShapeTolerance::Tolerance ******/
		/****** md5 signature: da5807f6b9cda350fe3d57aeacb10ca5 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
mode: int
type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
double

Description
-----------
Determines a tolerance from the ones stored in a shape Remark: calls InitTolerance and AddTolerance, hence, can be used to start a series for cumulating tolerance <mode> = 0: returns the average value between sub-shapes, <mode> > 0: returns the maximal found, <mode> < 0: returns the minimal found. <type> defines what kinds of sub-shapes to consider: SHAPE (default): all: VERTEX, EDGE, FACE, VERTEX: only vertices, EDGE: only edges, FACE: only faces, SHELL: combined SHELL + FACE, for each face (and containing shell), also checks EDGE and VERTEX.
") Tolerance;
		double Tolerance(const TopoDS_Shape & shape, const int mode, const TopAbs_ShapeEnum type = TopAbs_SHAPE);

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
		/****** md5 signature: 6a2a9289d5c8bcf1bb8b8d46a8b0856e ******/
		%feature("compactdefaultargs") CheckOrientedShells;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
alsofree: bool (optional, default to false)
checkinternaledges: bool (optional, default to false)

Return
-------
bool

Description
-----------
Checks if shells fulfill orientation condition, i.e. if each edge is, either present once (free edge) or twice (connected edge) but with different orientations (FORWARD/REVERSED) Edges which do not fulfill these conditions are bad //! If <alsofree> is True free edges are considered. Free edges can be queried but are not bad.
") CheckOrientedShells;
		bool CheckOrientedShells(const TopoDS_Shape & shape, const bool alsofree = false, const bool checkinternaledges = false);

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
		/****** md5 signature: 9ef97fe9cea49d40f5ac5e80d06a6b11 ******/
		%feature("compactdefaultargs") HasBadEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if at least one edge is recorded as bad.
") HasBadEdges;
		bool HasBadEdges();

		/****** ShapeAnalysis_Shell::HasConnectedEdges ******/
		/****** md5 signature: bccea26bb010d99de601a802f12799a4 ******/
		%feature("compactdefaultargs") HasConnectedEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if at least one edge is connected (shared twice or more).
") HasConnectedEdges;
		bool HasConnectedEdges();

		/****** ShapeAnalysis_Shell::HasFreeEdges ******/
		/****** md5 signature: 8bf16eee1cd216f78566e1889e92c675 ******/
		%feature("compactdefaultargs") HasFreeEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if at least one edge is recorded as free (not connected).
") HasFreeEdges;
		bool HasFreeEdges();

		/****** ShapeAnalysis_Shell::IsLoaded ******/
		/****** md5 signature: 85dc670a1124ae773e89cfef2bf23347 ******/
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
		bool IsLoaded(const TopoDS_Shape & shape);

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
		/****** md5 signature: 38b72af9f674af694bb55f4077a96ce7 ******/
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
		TopoDS_Shape Loaded(const int num);

		/****** ShapeAnalysis_Shell::NbLoaded ******/
		/****** md5 signature: 07321964ec461bfb4033dc5d220454ca ******/
		%feature("compactdefaultargs") NbLoaded;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the actual number of loaded shapes (i.e. shells).
") NbLoaded;
		int NbLoaded();

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
		/****** md5 signature: 179376ffed4a09483af8f5ac2d926db4 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
ufirst: double
ulast: double
vfirst: double
vlast: double

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
		/****** md5 signature: ef27664d05674eba0ac76cd18982cbca ******/
		%feature("compactdefaultargs") DegeneratedValues;
		%feature("autodoc", "
Parameters
----------
P3d: gp_Pnt
preci: double
firstP2d: gp_Pnt2d
lastP2d: gp_Pnt2d
forward: bool (optional, default to true)

Return
-------
firstpar: double
lastpar: double

Description
-----------
Returns True if there is at least one surface iso-line which is considered as degenerated with <preci> and distance between P3d and corresponding singular point is less than <preci> (like IsDegenerated). Returns characteristics of the first found boundary matching those criteria.
") DegeneratedValues;
		bool DegeneratedValues(const gp_Pnt & P3d, const double preci, gp_Pnt2d & firstP2d, gp_Pnt2d & lastP2d, Standard_Real &OutValue, Standard_Real &OutValue, const bool forward = true);

		/****** ShapeAnalysis_Surface::Gap ******/
		/****** md5 signature: 440448988cf9c1f10c0497f08aa39855 ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 3D distance found by one of the following methods. IsDegenerated, DegeneratedValues, ProjectDegenerated (distance between 3D point and found or last (if not found) singularity), IsUClosed, IsVClosed (minimum value of precision to consider the surface to be closed), ValueOfUV (distance between 3D point and found solution).
") Gap;
		double Gap();

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
		/****** md5 signature: 4b8874f19dcd9801e30d113e3db97d77 ******/
		%feature("compactdefaultargs") HasSingularities;
		%feature("autodoc", "
Parameters
----------
preci: double

Return
-------
bool

Description
-----------
Returns True if the surface has singularities for the given precision (i.e. if there are surface singularities with sizes not greater than precision).
") HasSingularities;
		bool HasSingularities(const double preci);

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
		/****** md5 signature: fbb91604c660b83b63a68ddd153913a8 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
P3d: gp_Pnt
preci: double

Return
-------
bool

Description
-----------
Returns True if there is at least one surface boundary which is considered as degenerated with <preci> and distance between P3d and corresponding singular point is less than <preci>.
") IsDegenerated;
		bool IsDegenerated(const gp_Pnt & P3d, const double preci);

		/****** ShapeAnalysis_Surface::IsDegenerated ******/
		/****** md5 signature: f147e90b1b197605252e7f6401ba0691 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
p2d1: gp_Pnt2d
p2d2: gp_Pnt2d
tol: double
ratio: double

Return
-------
bool

Description
-----------
Returns True if straight pcurve going from point p2d1 to p2d2 is degenerate, i.e. lies in the singularity of the surface. NOTE: it uses another method of detecting singularity than used by ComputeSingularities() et al.! For that, maximums of distances between points p2d1, p2d2 and 0.5*(p2d1+p2d2) and between corresponding 3d points are computed. The pcurve (p2d1, p2d2) is considered as degenerate if: - max distance in 3d is less than <tol> - max distance in 2d is at least <ratio> times greater than the Resolution computed from max distance in 3d (max3d < tol && max2d > ratio * Resolution(max3d)) NOTE: <ratio> should be >1 (e.g. 10).
") IsDegenerated;
		bool IsDegenerated(const gp_Pnt2d & p2d1, const gp_Pnt2d & p2d2, const double tol, const double ratio);

		/****** ShapeAnalysis_Surface::IsUClosed ******/
		/****** md5 signature: e2ca38f7f2f9c2e5e65e50a6fd37fbfd ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "
Parameters
----------
preci: double (optional, default to -1)

Return
-------
bool

Description
-----------
Tells if the Surface is spatially closed in U with given precision. If <preci> < 0 then Precision::Confusion is used. If Geom_Surface says that the surface is U-closed, this method also says this. Otherwise additional analysis is performed, comparing given precision with the following distances: - periodic B-Splines are closed, - polynomial B-Spline with boundary multiplicities degree+1 and Bezier - maximum distance between poles, - rational B-Spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of extrusion - distance between ends of basis curve, - other (RectangularTrimmed and Offset) - maximum distance computed at 100 equi-distanted points.
") IsUClosed;
		bool IsUClosed(const double preci = -1);

		/****** ShapeAnalysis_Surface::IsVClosed ******/
		/****** md5 signature: 165df088c7073d9a6d00d2c69eb824e5 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "
Parameters
----------
preci: double (optional, default to -1)

Return
-------
bool

Description
-----------
Tells if the Surface is spatially closed in V with given precision. If <preci> < 0 then Precision::Confusion is used. If Geom_Surface says that the surface is V-closed, this method also says this. Otherwise additional analysis is performed, comparing given precision with the following distances: - periodic B-Splines are closed, - polynomial B-Spline with boundary multiplicities degree+1 and Bezier - maximum distance between poles, - rational B-Spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of revolution - distance between ends of basis curve, - other (RectangularTrimmed and Offset) - maximum distance computed at 100 equi-distanted points.
") IsVClosed;
		bool IsVClosed(const double preci = -1);

		/****** ShapeAnalysis_Surface::NbSingularities ******/
		/****** md5 signature: abc2639e0c756d130bd9e0e58ab5b95f ******/
		%feature("compactdefaultargs") NbSingularities;
		%feature("autodoc", "
Parameters
----------
preci: double

Return
-------
int

Description
-----------
Returns the number of singularities for the given precision (i.e. number of surface singularities with sizes not greater than precision).
") NbSingularities;
		int NbSingularities(const double preci);

		/****** ShapeAnalysis_Surface::NextValueOfUV ******/
		/****** md5 signature: 1e9b9f856785488799b10ec4cc8e956f ******/
		%feature("compactdefaultargs") NextValueOfUV;
		%feature("autodoc", "
Parameters
----------
p2dPrev: gp_Pnt2d
P3D: gp_Pnt
preci: double
maxpreci: double (optional, default to -1.0)

Return
-------
gp_Pnt2d

Description
-----------
Projects a point P3D on the surface. Does the same thing as ValueOfUV but tries to optimize computations by taking into account previous point <p2dPrev>: makes a step by UV and tries Newton algorithm. If <maxpreci> >0. and distance between solution and P3D is greater than <maxpreci>, that solution is considered as bad, and ValueOfUV() is used. If not succeeded, calls ValueOfUV().
") NextValueOfUV;
		gp_Pnt2d NextValueOfUV(const gp_Pnt2d & p2dPrev, const gp_Pnt & P3D, const double preci, const double maxpreci = -1.0);

		/****** ShapeAnalysis_Surface::ProjectDegenerated ******/
		/****** md5 signature: d18b8a5b1c314c9308032665d285cf8c ******/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "
Parameters
----------
P3d: gp_Pnt
preci: double
neighbour: gp_Pnt2d
result: gp_Pnt2d

Return
-------
bool

Description
-----------
Projects a point <P3d> on a singularity by computing one of the coordinates of preliminary computed <result>. //! Finds the iso-line which is considered as degenerated with <preci> and a. distance between P3d and corresponding singular point is less than <preci> (like IsDegenerated) or b. difference between already computed <result>'s coordinate and iso-coordinate of the boundary is less than 2D resolution (computed from <preci> by Geom_Adaptor). Then sets not yet computed <result>'s coordinate taking it from <neighbour> and returns True.
") ProjectDegenerated;
		bool ProjectDegenerated(const gp_Pnt & P3d, const double preci, const gp_Pnt2d & neighbour, gp_Pnt2d & result);

		/****** ShapeAnalysis_Surface::ProjectDegenerated ******/
		/****** md5 signature: 011cd16da71815e8a2d607c6d1da8ffa ******/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "
Parameters
----------
nbrPnt: int
points: TColgp_SequenceOfPnt
pnt2d: TColgp_SequenceOfPnt2d
preci: double
direct: bool

Return
-------
bool

Description
-----------
Checks points at the beginning (direct is True) or end (direct is False) of array <points> to lie in singularity of surface, and if yes, adjusts the indeterminate 2d coordinate of these points by nearest point which is not in singularity. Returns True if some points were adjusted.
") ProjectDegenerated;
		bool ProjectDegenerated(const int nbrPnt, const TColgp_SequenceOfPnt & points, TColgp_SequenceOfPnt2d & pnt2d, const double preci, const bool direct);

		/****** ShapeAnalysis_Surface::SetDomain ******/
		/****** md5 signature: a5686de16aed57be95a29075060ece4e ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
V1: double
V2: double

Return
-------
None

Description
-----------
No available documentation.
") SetDomain;
		void SetDomain(const double U1, const double U2, const double V1, const double V2);

		/****** ShapeAnalysis_Surface::Singularity ******/
		/****** md5 signature: 66d22a8088ec9a51088db195ad35c7e6 ******/
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
preci: double
firstpar: double
lastpar: double
uisodeg: bool

Description
-----------
Returns the characteristics of the singularity specified by its rank number <num>. That means, that it is not necessary for <num> to be in the range [1, NbSingularities] but must be not greater than possible (see ComputeSingularities). The returned characteristics are: preci: the smallest precision with which the iso-line is considered as degenerated, P3d: 3D point of singularity (middle point of the surface iso-line), firstP2d and lastP2d: first and last 2D points of the iso-line in parametrical surface, firstpar and lastpar: first and last parameters of the iso-line in parametrical surface, uisodeg: if the degenerated iso-line is U-iso (True) or V-iso (False). Returns False if <num> is out of range, else returns True.
") Singularity;
		bool Singularity(const int num, Standard_Real &OutValue, gp_Pnt & P3d, gp_Pnt2d & firstP2d, gp_Pnt2d & lastP2d, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue);

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
		/****** md5 signature: e732eb3e0b7fcfaedfe5c4f8fedbc8c0 ******/
		%feature("compactdefaultargs") UCloseVal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns minimum value to consider the surface as U-closed.
") UCloseVal;
		double UCloseVal();

		/****** ShapeAnalysis_Surface::UIso ******/
		/****** md5 signature: 75a476d854683c59d1aa1e4f590a9832 ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns a U-Iso. Null if not possible or failed Remark: bound isos are buffered.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const double U);

		/****** ShapeAnalysis_Surface::UVFromIso ******/
		/****** md5 signature: e313ccdaf078abe41b0011787fc82415 ******/
		%feature("compactdefaultargs") UVFromIso;
		%feature("autodoc", "
Parameters
----------
P3D: gp_Pnt
preci: double

Return
-------
U: double
V: double

Description
-----------
Tries a refinement of an already computed couple (U,V) by using projecting 3D point on iso-lines: 1. boundaries of the surface, 2. iso-lines passing through (U,V) 3. iteratively received iso-lines passing through new U and new V (number of iterations is limited by 5 in each direction) Returns the best resulting distance between P3D and Value(U,V) in the case of success. Else, returns a very great value.
") UVFromIso;
		double UVFromIso(const gp_Pnt & P3D, const double preci, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Surface::VCloseVal ******/
		/****** md5 signature: fc90fa4826767ca0367a86f3ed24e0d7 ******/
		%feature("compactdefaultargs") VCloseVal;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns minimum value to consider the surface as V-closed.
") VCloseVal;
		double VCloseVal();

		/****** ShapeAnalysis_Surface::VIso ******/
		/****** md5 signature: 077776dd19f143feb9a9bb5b176a0a67 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns a V-Iso. Null if not possible or failed Remark: bound isos are buffered.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const double V);

		/****** ShapeAnalysis_Surface::Value ******/
		/****** md5 signature: 4be9e1bad96cdadd1f2d5ad83cbae04d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
u: double
v: double

Return
-------
gp_Pnt

Description
-----------
Returns a 3D point specified by parameters in surface parametrical space.
") Value;
		gp_Pnt Value(const double u, const double v);

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
		/****** md5 signature: 5b51933f64d4bd72063ec88d1032a611 ******/
		%feature("compactdefaultargs") ValueOfUV;
		%feature("autodoc", "
Parameters
----------
P3D: gp_Pnt
preci: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the parameters in the surface parametrical space of 3D point. The result is parameters of the point projected onto the surface. This method enhances functionality provided by the standard tool GeomAPI_ProjectPointOnSurface by treatment of cases when the projected point is near to the surface boundaries and when this standard tool fails.
") ValueOfUV;
		gp_Pnt2d ValueOfUV(const gp_Pnt & P3D, const double preci);

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
		/****** md5 signature: 1b73166412bc4aa652420da7dd024ceb ******/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if 3d curve of edge and pcurve are SameRange (in default implementation, if myScale == 1 and myShift == 0).
") IsSameRange;
		virtual bool IsSameRange();

		/****** ShapeAnalysis_TransferParameters::Perform ******/
		/****** md5 signature: 4835ddc9a75dffbd3b41be347bd90f85 ******/
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
		virtual opencascade::handle<TColStd_HSequenceOfReal> Perform(const opencascade::handle<TColStd_HSequenceOfReal> & Params, const bool To2d);

		/****** ShapeAnalysis_TransferParameters::Perform ******/
		/****** md5 signature: 493b31afe82967aaa5e1d6e0e19bd29d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: double
To2d: bool

Return
-------
double

Description
-----------
Transfers parameter given by sequence Params from 3d curve to pcurve (if To2d is True) or back (if To2d is False).
") Perform;
		virtual double Perform(const double Param, const bool To2d);

		/****** ShapeAnalysis_TransferParameters::SetMaxTolerance ******/
		/****** md5 signature: 89c2fe708f49a26d4248897f865c07e8 ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
maxtol: double

Return
-------
None

Description
-----------
Sets maximal tolerance to use linear recomputation of parameters.
") SetMaxTolerance;
		void SetMaxTolerance(const double maxtol);

		/****** ShapeAnalysis_TransferParameters::TransferRange ******/
		/****** md5 signature: b5a38a721ba404197d4b2f75cd412684 ******/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "
Parameters
----------
newEdge: TopoDS_Edge
prevPar: double
currPar: double
To2d: bool

Return
-------
None

Description
-----------
Recomputes range of curves from NewEdge. If Is2d equals True parameters are recomputed by curve2d else by curve3d.
") TransferRange;
		virtual void TransferRange(TopoDS_Edge & newEdge, const double prevPar, const double currPar, const bool To2d);

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
		/****** md5 signature: 46757d2a48b63d7cf62ed03fd48f9500 ******/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
precision: double

Return
-------
None

Description
-----------
Creates object with standard TopoDS_Wire, face and precision.
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire(const TopoDS_Wire & wire, const TopoDS_Face & face, const double precision);

		/****** ShapeAnalysis_Wire::ShapeAnalysis_Wire ******/
		/****** md5 signature: bc7b072b9f30e667de819e0d9ed230ae ******/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "
Parameters
----------
sbwd: ShapeExtend_WireData
face: TopoDS_Face
precision: double

Return
-------
None

Description
-----------
Creates the object with WireData object, face and precision.
") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire(const opencascade::handle<ShapeExtend_WireData> & sbwd, const TopoDS_Face & face, const double precision);

		/****** ShapeAnalysis_Wire::CheckClosed ******/
		/****** md5 signature: fbd9f5dce8f2a95289f49f419abff319 ******/
		%feature("compactdefaultargs") CheckClosed;
		%feature("autodoc", "
Parameters
----------
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks if wire is closed, performs CheckConnected, CheckDegenerated and CheckLacking for the first and the last edges Returns: True if at least one check returned True Status: FAIL1 or DONE1: see CheckConnected FAIL2 or DONE2: see CheckDegenerated.
") CheckClosed;
		bool CheckClosed(const double prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckConnected ******/
		/****** md5 signature: 7eb80a4c523df5f015cc7094df13f943 ******/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "
Parameters
----------
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Calls to CheckConnected for each edge Returns: True if at least one pair of disconnected edges (not sharing the same vertex) was detected.
") CheckConnected;
		bool CheckConnected(const double prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckConnected ******/
		/****** md5 signature: 62441fa831118aafab759e466d87e7d8 ******/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "
Parameters
----------
num: int
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks connected edges (num-th and preceding). Tests with starting preci from <SBWD> or with <prec> if it is greater. Considers Vertices. Returns: False if edges are connected by the common vertex, else True Status: OK: Vertices (end of num-1 th edge and start on num-th one) are already the same DONE1: Absolutely confused (gp::Resolution) DONE2: Confused at starting <preci> from <SBWD> DONE3: Confused at <prec> but not <preci> FAIL1: Not confused FAIL2: Not confused but confused with <preci> if reverse num-th edge.
") CheckConnected;
		bool CheckConnected(const int num, const double prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckCurveGap ******/
		/****** md5 signature: dfa244db49c02899eb36a83aeec2b42e ******/
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
		bool CheckCurveGap(const int num = 0);

		/****** ShapeAnalysis_Wire::CheckCurveGaps ******/
		/****** md5 signature: ed6d70f87ff760f31f4099d497edbffb ******/
		%feature("compactdefaultargs") CheckCurveGaps;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckCurveGaps;
		bool CheckCurveGaps();

		/****** ShapeAnalysis_Wire::CheckDegenerated ******/
		/****** md5 signature: b40263668f1f1df4c3c889ab1eae361a ******/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Calls to CheckDegenerated for each edge Returns: True if at least one incorrect degenerated edge was detected.
") CheckDegenerated;
		bool CheckDegenerated();

		/****** ShapeAnalysis_Wire::CheckDegenerated ******/
		/****** md5 signature: b06af945c758ba31af24e19043abf4ab ******/
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
		bool CheckDegenerated(const int num, gp_Pnt2d & dgnr1, gp_Pnt2d & dgnr2);

		/****** ShapeAnalysis_Wire::CheckDegenerated ******/
		/****** md5 signature: 1fdb07e61c62b27e7e49062a243fb9a9 ******/
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
		bool CheckDegenerated(const int num);

		/****** ShapeAnalysis_Wire::CheckEdgeCurves ******/
		/****** md5 signature: 96bcddf1c1a447af63756710bc906ec7 ******/
		%feature("compactdefaultargs") CheckEdgeCurves;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks edges geometry (consistency of 2d and 3d senses, adjasment of curves to the vertices, etc.). The order of the checks: Call ShapeAnalysis_Wire to check: ShapeAnalysis_Edge::CheckCurve3dWithPCurve (1), ShapeAnalysis_Edge::CheckVertcesWithPCurve (2), ShapeAnalysis_Edge::CheckVertcesWithCurve3d (3), CheckSeam   (4) Additional: CheckGap3d  (5), CheckGap2d  (6), ShapeAnalysis_Edge::CheckSameParameter (7) Returns: True if at least one check returned True Remark: The numbers in brackets show with what DONEi or FAILi the status can be queried.
") CheckEdgeCurves;
		bool CheckEdgeCurves();

		/****** ShapeAnalysis_Wire::CheckGap2d ******/
		/****** md5 signature: aa7a5c8d941bae4af707a06e5ae0d64a ******/
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
		bool CheckGap2d(const int num = 0);

		/****** ShapeAnalysis_Wire::CheckGap3d ******/
		/****** md5 signature: 587d581168b5445cd5bd7b85f669e26b ******/
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
		bool CheckGap3d(const int num = 0);

		/****** ShapeAnalysis_Wire::CheckGaps2d ******/
		/****** md5 signature: 24e508213b9193a803fa1d753c3f68b8 ******/
		%feature("compactdefaultargs") CheckGaps2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckGaps2d;
		bool CheckGaps2d();

		/****** ShapeAnalysis_Wire::CheckGaps3d ******/
		/****** md5 signature: c080ebab2522c2e5c79329e29c701d84 ******/
		%feature("compactdefaultargs") CheckGaps3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckGaps3d;
		bool CheckGaps3d();

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: 5eadf5786089b2f6f60ba8755ae81e7e ******/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "
Parameters
----------
num: int
points2d: NCollection_Sequence<IntRes2d_IntersectionPoint>
points3d: TColgp_SequenceOfPnt
errors: TColStd_SequenceOfReal

Return
-------
bool

Description
-----------
Checks two adjacent edges for intersecting. Intersection is reported only if intersection point is not enclosed by the common end vertex of the edges. Returns: True if intersection is found. If returns True it also fills the sequences of intersection points, corresponding 3d points, and errors for them (half-distances between intersection points in 3d calculated from one and from another edge) Status: FAIL1: No pcurve FAIL2: No vertices DONE1: Self-intersection found.
") CheckIntersectingEdges;
		bool CheckIntersectingEdges(const int num, NCollection_Sequence<IntRes2d_IntersectionPoint> & points2d, TColgp_SequenceOfPnt & points3d, TColStd_SequenceOfReal & errors);

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: 27f68c61d50c41a9fbbf27b6aed6a9da ******/
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
		bool CheckIntersectingEdges(const int num);

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: 31a201c307796026fff066e3f8245d85 ******/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int
points2d: NCollection_Sequence<IntRes2d_IntersectionPoint>
points3d: TColgp_SequenceOfPnt
errors: TColStd_SequenceOfReal

Return
-------
bool

Description
-----------
Checks i-th and j-th edges for intersecting. Remark: See the previous method for details.
") CheckIntersectingEdges;
		bool CheckIntersectingEdges(const int num1, const int num2, NCollection_Sequence<IntRes2d_IntersectionPoint> & points2d, TColgp_SequenceOfPnt & points3d, TColStd_SequenceOfReal & errors);

		/****** ShapeAnalysis_Wire::CheckIntersectingEdges ******/
		/****** md5 signature: 2df27f896a8a027384ea0df86d27de3c ******/
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
		bool CheckIntersectingEdges(const int num1, const int num2);

		/****** ShapeAnalysis_Wire::CheckLacking ******/
		/****** md5 signature: 86a7838824fadd06f132ca21a12194e3 ******/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Calls to CheckLacking for each edge Returns: True if at least one lacking edge was detected.
") CheckLacking;
		bool CheckLacking();

		/****** ShapeAnalysis_Wire::CheckLacking ******/
		/****** md5 signature: b60e25609bbf86f417165077abf10ba2 ******/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "
Parameters
----------
num: int
Tolerance: double
p2d1: gp_Pnt2d
p2d2: gp_Pnt2d

Return
-------
bool

Description
-----------
Checks if there is a gap in 2d between edges, not comprised by the tolerance of their common vertex. If <Tolerance> is greater than 0. and less than tolerance of the vertex, then this value is used for check. Returns: True if not closed gap was detected p2d1 and p2d2 are the endpoint of <num-1>th edge and start of the <num>th edge in 2d. Status: OK: No edge is lacking (3d and 2d connection) FAIL1: edges have no vertices (at least one of them) FAIL2: edges are neither connected by common vertex, nor have coincided vertices FAIL1: edges have no pcurves DONE1: the gap is detected which cannot be closed by the tolerance of the common vertex (or with value of <Tolerance>) DONE2: is set (together with DONE1) if gap is detected and the vector (p2d2 - p2d1) goes in direction opposite to the pcurves of the edges (if angle is more than 0.9*PI).
") CheckLacking;
		bool CheckLacking(const int num, const double Tolerance, gp_Pnt2d & p2d1, gp_Pnt2d & p2d2);

		/****** ShapeAnalysis_Wire::CheckLacking ******/
		/****** md5 signature: 043e00a42a5e8417f5a37ff759007603 ******/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "
Parameters
----------
num: int
Tolerance: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks if there is a gap in 2D between edges and not comprised by vertex tolerance The value of SBWD.thepreci is used. Returns: False if no edge should be inserted Status: OK: No edge is lacking (3d and 2d connection) DONE1: The vertex tolerance should be increased only (2d gap is small) DONE2: Edge can be inserted (3d and 2d gaps are large enough).
") CheckLacking;
		bool CheckLacking(const int num, const double Tolerance = 0.0);

		/****** ShapeAnalysis_Wire::CheckLoop ******/
		/****** md5 signature: a52fc5c1057b935c19a662e7958e2b44 ******/
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
		bool CheckLoop(TopTools_IndexedMapOfShape & aMapLoopVertices, TopTools_DataMapOfShapeListOfShape & aMapVertexEdges, TopTools_MapOfShape & aMapSmallEdges, TopTools_MapOfShape & aMapSeemEdges);

		/****** ShapeAnalysis_Wire::CheckNotchedEdges ******/
		/****** md5 signature: ea2eea5f659c933e14ab476979aece94 ******/
		%feature("compactdefaultargs") CheckNotchedEdges;
		%feature("autodoc", "
Parameters
----------
num: int
Tolerance: double (optional, default to 0.0)

Return
-------
shortNum: int
param: double

Description
-----------
Detects a notch.
") CheckNotchedEdges;
		bool CheckNotchedEdges(const int num, Standard_Integer &OutValue, Standard_Real &OutValue, const double Tolerance = 0.0);

		/****** ShapeAnalysis_Wire::CheckOrder ******/
		/****** md5 signature: 03c1575439a75d7933a6ffe8a9fb4197 ******/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "
Parameters
----------
isClosed: bool (optional, default to true)
mode3d: bool (optional, default to true)

Return
-------
bool

Description
-----------
Calls CheckOrder and returns False if wire is already ordered (tail-to-head), True otherwise Flag <isClosed> defines if the wire is closed or not Flag <mode3d> defines which mode is used (3d or 2d).
") CheckOrder;
		bool CheckOrder(const bool isClosed = true, const bool mode3d = true);

		/****** ShapeAnalysis_Wire::CheckOrder ******/
		/****** md5 signature: e0f6c1dc3dce54773c7d1f6a2ec79ec3 ******/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "
Parameters
----------
sawo: ShapeAnalysis_WireOrder
isClosed: bool (optional, default to true)
theMode3D: bool (optional, default to true)
theModeBoth: bool (optional, default to false)

Return
-------
bool

Description
-----------
Analyzes the order of the edges in the wire, uses class WireOrder for that purpose. Flag <isClosed> defines if the wire is closed or not Flag <theMode3D> defines 3D or 2d mode. Flag <theModeBoth> defines miscible mode and the flag <theMode3D> is ignored. Returns False if wire is already ordered (tail-to-head), True otherwise. Use returned WireOrder object for deeper analysis. Status: OK: the same edges orientation, the same edges sequence DONE1: the same edges orientation, not the same edges sequence DONE2: as DONE1 and gaps more than myPrecision DONE3: not the same edges orientation (some need to be reversed) DONE4: as DONE3 and gaps more than myPrecision FAIL: algorithm failed (could not detect order).
") CheckOrder;
		bool CheckOrder(ShapeAnalysis_WireOrder & sawo, bool isClosed = true, bool theMode3D = true, bool theModeBoth = false);

		/****** ShapeAnalysis_Wire::CheckOuterBound ******/
		/****** md5 signature: b76eb57e9988ca18ca8db1d21fd2a94b ******/
		%feature("compactdefaultargs") CheckOuterBound;
		%feature("autodoc", "
Parameters
----------
APIMake: bool (optional, default to true)

Return
-------
bool

Description
-----------
Checks if wire defines an outer bound on the face Uses ShapeAnalysis::IsOuterBound for analysis If <APIMake> is True uses BRepAPI_MakeWire to build the wire, if False (to be used only when edges share common vertices) uses BRep_Builder to build the wire.
") CheckOuterBound;
		bool CheckOuterBound(const bool APIMake = true);

		/****** ShapeAnalysis_Wire::CheckSeam ******/
		/****** md5 signature: 96dc28f5bdc01c64a69bdf30630a338f ******/
		%feature("compactdefaultargs") CheckSeam;
		%feature("autodoc", "
Parameters
----------
num: int
C1: Geom2d_Curve
C2: Geom2d_Curve

Return
-------
cf: double
cl: double

Description
-----------
Checks if a seam pcurves are correct oriented Returns: False (status OK) if given edge is not a seam or if it is OK C1 - current pcurve for FORWARD edge, C2 - current pcurve for REVERSED edge (if returns True they should be swapped for the seam), cf, cl - first and last parameters on curves Status: OK: Pcurves are correct or edge is not seam DONE: Seam pcurves should be swapped.
") CheckSeam;
		bool CheckSeam(const int num, opencascade::handle<Geom2d_Curve> & C1, opencascade::handle<Geom2d_Curve> & C2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_Wire::CheckSeam ******/
		/****** md5 signature: c974d002de3fbc9a5e0390c9b8caf9a6 ******/
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
		bool CheckSeam(const int num);

		/****** ShapeAnalysis_Wire::CheckSelfIntersectingEdge ******/
		/****** md5 signature: 7cd1c0f516171d915ed7f083052aea2d ******/
		%feature("compactdefaultargs") CheckSelfIntersectingEdge;
		%feature("autodoc", "
Parameters
----------
num: int
points2d: NCollection_Sequence<IntRes2d_IntersectionPoint>
points3d: TColgp_SequenceOfPnt

Return
-------
bool

Description
-----------
Checks if num-th edge is self-intersecting. Self-intersection is reported only if intersection point lies outside of both end vertices of the edge. Returns: True if edge is self-intersecting. If returns True it also fills the sequences of intersection points and corresponding 3d points (only that are not enclosed by a vertices) Status: FAIL1: No pcurve FAIL2: No vertices DONE1: Self-intersection found.
") CheckSelfIntersectingEdge;
		bool CheckSelfIntersectingEdge(const int num, NCollection_Sequence<IntRes2d_IntersectionPoint> & points2d, TColgp_SequenceOfPnt & points3d);

		/****** ShapeAnalysis_Wire::CheckSelfIntersectingEdge ******/
		/****** md5 signature: e2a4345c2dba78792676d560a65a0c13 ******/
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
		bool CheckSelfIntersectingEdge(const int num);

		/****** ShapeAnalysis_Wire::CheckSelfIntersection ******/
		/****** md5 signature: 6281274a089ef8b5fe8e80128f3bfb0b ******/
		%feature("compactdefaultargs") CheckSelfIntersection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks self-intersection of the wire (considering pcurves) Looks for self-intersecting edges and each pair of intersecting edges. Warning: It does not check each edge with any other one (only each two adjacent edges) The order of the checks: CheckSelfIntersectingEdge, CheckIntersectingEdges Returns: True if at least one check returned True Status: FAIL1 or DONE1 - see CheckSelfIntersectingEdge FAIL2 or DONE2 - see CheckIntersectingEdges.
") CheckSelfIntersection;
		bool CheckSelfIntersection();

		/****** ShapeAnalysis_Wire::CheckShapeConnect ******/
		/****** md5 signature: 6457f0d1cadfdc8726e9f8c381d66b56 ******/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks with what orientation <shape> (wire or edge) can be connected to the wire. Tests distances with starting <preci> from <SBWD> (close confusion), but if given <prec> is greater, tests with <prec> (coarse confusion). The smallest found distance can be returned by MinDistance3d //! Returns: False if status is FAIL (see below) Status: DONE1: If <shape> follows <SBWD>, direct sense (normal) DONE2: If <shape> follows <SBWD>, but if reversed DONE3: If <shape> precedes <SBWD>, direct sense DONE4: If <shape> precedes <SBWD>, but if reversed FAIL1: If <shape> is neither an edge nor a wire FAIL2: If <shape> cannot be connected to <SBWD> //! DONE5: To the tail of <SBWD> the <shape> is closer with direct sense DONE6: To the head of <SBWD> the <shape> is closer with direct sense //! Remark: Statuses DONE1 - DONE4, FAIL1 - FAIL2 are basic and describe the nearest connection of the <shape> to <SBWD>. Statuses DONE5 and DONE6 are advanced and are to be used when analyzing with what sense (direct or reversed) the <shape> should be connected to <SBWD>: For tail of <SBWD> if DONE4 is True <shape> should be direct, otherwise reversed. For head of <SBWD> if DONE5 is True <shape> should be direct, otherwise reversed.
") CheckShapeConnect;
		bool CheckShapeConnect(const TopoDS_Shape & shape, const double prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckShapeConnect ******/
		/****** md5 signature: 7891d0a72e2f97ce545f31aaf783b616 ******/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
prec: double (optional, default to 0.0)

Return
-------
tailhead: double
tailtail: double
headtail: double
headhead: double

Description
-----------
The same as previous CheckShapeConnect but is more advanced. It returns the distances between each end of <sbwd> and each end of <shape>. For example, <tailhead> stores distance between tail of <sbwd> and head of <shape> Remark: First method CheckShapeConnect calls this one.
") CheckShapeConnect;
		bool CheckShapeConnect(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const TopoDS_Shape & shape, const double prec = 0.0);

		/****** ShapeAnalysis_Wire::CheckSmall ******/
		/****** md5 signature: d750ece397dc247a376092e006bf22d7 ******/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "
Parameters
----------
precsmall: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Calls to CheckSmall for each edge Returns: True if at least one small edge was detected.
") CheckSmall;
		bool CheckSmall(const double precsmall = 0.0);

		/****** ShapeAnalysis_Wire::CheckSmall ******/
		/****** md5 signature: 15ad21c52dd128d85a7cb291787a2ab9 ******/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "
Parameters
----------
num: int
precsmall: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Checks if an edge has a length not greater than myPreci or precsmall (if it is smaller) Returns: False if its length is greater than precision Status: OK: edge is not small or degenerated DONE1: edge is small, vertices are the same DONE2: edge is small, vertices are not the same FAIL: no 3d curve and pcurve.
") CheckSmall;
		bool CheckSmall(const int num, const double precsmall = 0.0);

		/****** ShapeAnalysis_Wire::CheckSmallArea ******/
		/****** md5 signature: a25ff35dcb76a6f0323cacb750e2661c ******/
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
		bool CheckSmallArea(const TopoDS_Wire & theWire);

		/****** ShapeAnalysis_Wire::CheckTail ******/
		/****** md5 signature: 51ee67dc4f7431ee4253df46eab462a9 ******/
		%feature("compactdefaultargs") CheckTail;
		%feature("autodoc", "
Parameters
----------
theEdge1: TopoDS_Edge
theEdge2: TopoDS_Edge
theMaxSine: double
theMaxWidth: double
theMaxTolerance: double
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
		bool CheckTail(const TopoDS_Edge & theEdge1, const TopoDS_Edge & theEdge2, const double theMaxSine, const double theMaxWidth, const double theMaxTolerance, TopoDS_Edge & theEdge11, TopoDS_Edge & theEdge12, TopoDS_Edge & theEdge21, TopoDS_Edge & theEdge22);

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
		/****** md5 signature: 18107918b44b834f7cfeaa09837f41a4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
precision: double

Return
-------
None

Description
-----------
Initializes the object with standard TopoDS_Wire, face and precision.
") Init;
		void Init(const TopoDS_Wire & wire, const TopoDS_Face & face, const double precision);

		/****** ShapeAnalysis_Wire::Init ******/
		/****** md5 signature: 881a50a3fcaad28ddd0a009c15e297b6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
sbwd: ShapeExtend_WireData
face: TopoDS_Face
precision: double

Return
-------
None

Description
-----------
Initializes the object with WireData object, face and precision.
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & sbwd, const TopoDS_Face & face, const double precision);

		/****** ShapeAnalysis_Wire::IsLoaded ******/
		/****** md5 signature: fc2ce1bc5ddcb407c056c0f8bbdeface ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if wire is loaded and has number of edges >0.
") IsLoaded;
		bool IsLoaded();

		/****** ShapeAnalysis_Wire::IsReady ******/
		/****** md5 signature: c55402f1e031fb2faa07c9375fee061b ******/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if IsLoaded and underlying face is not null.
") IsReady;
		bool IsReady();

		/****** ShapeAnalysis_Wire::LastCheckStatus ******/
		/****** md5 signature: 7dee7dd081e6f73e41f9938fa08a4322 ******/
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
		bool LastCheckStatus(const ShapeExtend_Status Status);

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
		/****** md5 signature: 371b31173344db86bb91614ccc52e692 ******/
		%feature("compactdefaultargs") MaxDistance2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last maximal distance in 2D-UV computed by CheckContinuity2d.
") MaxDistance2d;
		double MaxDistance2d();

		/****** ShapeAnalysis_Wire::MaxDistance3d ******/
		/****** md5 signature: c3bed5d6a67136b45c27f48f7b05cb75 ******/
		%feature("compactdefaultargs") MaxDistance3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last maximal distance in 3D computed by CheckOrientation, CheckConnected, CheckContinuity3d, CheckVertex, CheckNewVertex, CheckSameParameter.
") MaxDistance3d;
		double MaxDistance3d();

		/****** ShapeAnalysis_Wire::MinDistance2d ******/
		/****** md5 signature: e9b4831dbea15018d73664ab1825c379 ******/
		%feature("compactdefaultargs") MinDistance2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last lowest distance in 2D-UV computed by CheckContinuity2d.
") MinDistance2d;
		double MinDistance2d();

		/****** ShapeAnalysis_Wire::MinDistance3d ******/
		/****** md5 signature: 72348c54a35f4a601271390871e0a9ff ******/
		%feature("compactdefaultargs") MinDistance3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last lowest distance in 3D computed by CheckOrientation, CheckConnected, CheckContinuity3d, CheckVertex, CheckNewVertex.
") MinDistance3d;
		double MinDistance3d();

		/****** ShapeAnalysis_Wire::NbEdges ******/
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of edges in the wire, or 0 if it is not loaded.
") NbEdges;
		int NbEdges();

		/****** ShapeAnalysis_Wire::Perform ******/
		/****** md5 signature: 836e5d294e107797e3a08ad4bfbbad29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs all the checks in the following order: CheckOrder, CheckSmall, CheckConnected, CheckEdgeCurves, CheckDegenerated, CheckSelfIntersection, CheckLacking, CheckClosed Returns: True if at least one method returned True; For deeper analysis use Status...(status) methods.
") Perform;
		bool Perform();

		/****** ShapeAnalysis_Wire::Precision ******/
		/****** md5 signature: 619d4ae2a460550f8d9105bf9304b5d1 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of precision.
") Precision;
		double Precision();

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

		/****** ShapeAnalysis_Wire::SetFace ******/
		/****** md5 signature: 963ef92469acffd9ffbff9603c45aff7 ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theSurfaceAnalysis: ShapeAnalysis_Surface

Return
-------
None

Description
-----------
Loads the face the wire lies on and surface analysis object.
") SetFace;
		void SetFace(const TopoDS_Face & theFace, const opencascade::handle<ShapeAnalysis_Surface> & theSurfaceAnalysis);

		/****** ShapeAnalysis_Wire::SetPrecision ******/
		/****** md5 signature: 844f67f85f1714fe78a63ce93f6f8371 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
precision: double

Return
-------
None

Description
-----------
No available documentation.
") SetPrecision;
		void SetPrecision(const double precision);

		/****** ShapeAnalysis_Wire::SetSurface ******/
		/****** md5 signature: c7dba3cd6c0b76225847bdfadee04fb7 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
theSurfaceAnalysis: ShapeAnalysis_Surface

Return
-------
None

Description
-----------
Loads the surface analysis object.
") SetSurface;
		void SetSurface(const opencascade::handle<ShapeAnalysis_Surface> & theSurfaceAnalysis);

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
		/****** md5 signature: 25bafa024af2fc11cb27a8ac610a19b8 ******/
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
		bool StatusClosed(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusConnected ******/
		/****** md5 signature: c5ddd7de28534aec0c35ccd746c29747 ******/
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
		bool StatusConnected(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusCurveGaps ******/
		/****** md5 signature: bb2ee31df325fbc2c609a692551a6b9d ******/
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
		bool StatusCurveGaps(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusDegenerated ******/
		/****** md5 signature: 830f4427a84c562451f05c5d3c57d517 ******/
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
		bool StatusDegenerated(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusEdgeCurves ******/
		/****** md5 signature: 5e3c87b202ce0097742113026303e254 ******/
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
		bool StatusEdgeCurves(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusGaps2d ******/
		/****** md5 signature: 69c52c08e3bca0fbf68a1f155c236295 ******/
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
		bool StatusGaps2d(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusGaps3d ******/
		/****** md5 signature: 51c67c005b614b43ae947faa11825ef8 ******/
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
		bool StatusGaps3d(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusLacking ******/
		/****** md5 signature: c84868dcf3f6380c07cf572efe82cd2b ******/
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
		bool StatusLacking(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusLoop ******/
		/****** md5 signature: 6c8c889a3bac002c46cd270e8fa13c04 ******/
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
		bool StatusLoop(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusOrder ******/
		/****** md5 signature: c7aed7e37ea9421de9dd42807ae095f4 ******/
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
		bool StatusOrder(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusSelfIntersection ******/
		/****** md5 signature: 524de3c8347db23980b2c217028e8006 ******/
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
		bool StatusSelfIntersection(const ShapeExtend_Status Status);

		/****** ShapeAnalysis_Wire::StatusSmall ******/
		/****** md5 signature: 39864f93f64adc8bb8a7fbbc7ce24c9a ******/
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
		bool StatusSmall(const ShapeExtend_Status Status);

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
		/****** md5 signature: 235fd5b53e01ef900ded1f6cd1cec3ca ******/
		%feature("compactdefaultargs") ShapeAnalysis_WireOrder;
		%feature("autodoc", "
Parameters
----------
theMode3D: bool
theTolerance: double
theModeBoth: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a WireOrder. Flag <theMode3D> defines 3D or 2d mode. Flag <theModeBoth> defines miscible mode and the flag <theMode3D> is ignored. Warning: Parameter <theTolerance> is not used in algorithm.
") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder(const bool theMode3D, const double theTolerance, const bool theModeBoth = false);

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
		/****** md5 signature: b71ad1f04d65f90f3f161376f5ad921c ******/
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
		void Chain(const int num, Standard_Integer &OutValue, Standard_Integer &OutValue);

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
		/****** md5 signature: 41df938520b3477408275f670630fde2 ******/
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
		void Couple(const int num, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ShapeAnalysis_WireOrder::Gap ******/
		/****** md5 signature: 341853cde18f4cc6cee4927fe9250539 ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 0)

Return
-------
double

Description
-----------
Returns the gap between a couple and its preceding <num> is considered ordered If <num> = 0 (D), returns the greatest gap found.
") Gap;
		double Gap(const int num = 0);

		/****** ShapeAnalysis_WireOrder::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if Perform has been done Else, the following methods returns original values.
") IsDone;
		bool IsDone();

		/****** ShapeAnalysis_WireOrder::KeepLoopsMode ******/
		/****** md5 signature: 2cb260f4e5a4958785a6a719e7fef75e ******/
		%feature("compactdefaultargs") KeepLoopsMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If this mode is True method perform does not sort edges of different loops. The resulting order is first loop, second one etc...
") KeepLoopsMode;
		bool & KeepLoopsMode();

		/****** ShapeAnalysis_WireOrder::NbChains ******/
		/****** md5 signature: 43c2a26ff2b7753c3b4d4e0e7b97b9c8 ******/
		%feature("compactdefaultargs") NbChains;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of computed chains.
") NbChains;
		int NbChains();

		/****** ShapeAnalysis_WireOrder::NbCouples ******/
		/****** md5 signature: fa97d409bb01ecada20fd079ac30a65c ******/
		%feature("compactdefaultargs") NbCouples;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of computed couples.
") NbCouples;
		int NbCouples();

		/****** ShapeAnalysis_WireOrder::NbEdges ******/
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of added couples of points (one per edges).
") NbEdges;
		int NbEdges();

		/****** ShapeAnalysis_WireOrder::Ordered ******/
		/****** md5 signature: 0e6ca83cd77f66d676c0d4ec7ca19c3d ******/
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
		int Ordered(const int theIdx);

		/****** ShapeAnalysis_WireOrder::Perform ******/
		/****** md5 signature: a12e544919e2c352446d3fd7c76263e7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
closed: bool (optional, default to true)

Return
-------
None

Description
-----------
Computes the better order Optimised if the couples were already in order The criterium is: two couples in order if distance between end-prec and start-cur is less then starting tolerance <tol> Else, the smallest distance is reached Warning: Parameter <closed> not used.
") Perform;
		void Perform(const bool closed = true);

		/****** ShapeAnalysis_WireOrder::SetChains ******/
		/****** md5 signature: 24a39f2db31b78a4d11bf67c7e528c44 ******/
		%feature("compactdefaultargs") SetChains;
		%feature("autodoc", "
Parameters
----------
gap: double

Return
-------
None

Description
-----------
Determines the chains inside which successive edges have a gap less than a given value. Queried by NbChains and Chain.
") SetChains;
		void SetChains(const double gap);

		/****** ShapeAnalysis_WireOrder::SetCouples ******/
		/****** md5 signature: 01bdc324e3f47c1a90aafe294593bab8 ******/
		%feature("compactdefaultargs") SetCouples;
		%feature("autodoc", "
Parameters
----------
gap: double

Return
-------
None

Description
-----------
Determines the couples of edges for which end and start fit inside a given gap. Queried by NbCouples and Couple Warning: function isn't implemented.
") SetCouples;
		void SetCouples(const double gap);

		/****** ShapeAnalysis_WireOrder::SetMode ******/
		/****** md5 signature: f6b609da21b72818381a893672c7c3e7 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
theMode3D: bool
theTolerance: double
theModeBoth: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets new values. Clears the edge list if the mode (<theMode3D> or <theModeBoth> ) changes. Clears the connexion list. Warning: Parameter <theTolerance> is not used in algorithm.
") SetMode;
		void SetMode(const bool theMode3D, const double theTolerance, const bool theModeBoth = false);

		/****** ShapeAnalysis_WireOrder::Status ******/
		/****** md5 signature: e8805e81784daa3cd9bf13eeaff1ed6d ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the status of the order (0 if not done): 0: all edges are direct and in sequence 1: all edges are direct but some are not in sequence -1: some edges are reversed, but no gap remain 3: edges in sequence are just shifted in forward or reverse manner.
") Status;
		int Status();

		/****** ShapeAnalysis_WireOrder::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the working tolerance.
") Tolerance;
		double Tolerance();

		/****** ShapeAnalysis_WireOrder::XY ******/
		/****** md5 signature: 8a0e50ec30492cd990a3991d45b78a90 ******/
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
		void XY(const int theIdx, gp_XY & theStart2D, gp_XY & theEnd2D);

		/****** ShapeAnalysis_WireOrder::XYZ ******/
		/****** md5 signature: 851eac160ac86df789e6e29c9f433246 ******/
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
		void XYZ(const int theIdx, gp_XYZ & theStart3D, gp_XYZ & theEnd3D);

		%extend{
			bool GetKeepLoopsMode() { return self->KeepLoopsMode(); }
			void SetKeepLoopsMode(bool value) { self->KeepLoopsMode() = value; }
		};
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
		/****** md5 signature: e7b29f85ac13d56be79518273eefaa48 ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ

Return
-------
upre: double
ufol: double

Description
-----------
Returns the recorded status for a vertex With its recorded position and parameters on both edges These values are relevant regarding the status: Status Meaning Position Preceding Following 0 Same no no no 1 SameCoord no no no 2 Close no no no 3 End yes no yes 4 Start yes yes no 5 Inters yes yes yes -1 Disjoined no no no.
") Data;
		int Data(const int num, gp_XYZ & pos, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeAnalysis_WireVertex::Init ******/
		/****** md5 signature: 5ebf3b271a3a11ad432d82eac9a6c12a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
preci: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Wire & wire, const double preci);

		/****** ShapeAnalysis_WireVertex::Init ******/
		/****** md5 signature: 83d4e9a2bf5eb70fab22493c32151f53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
swbd: ShapeExtend_WireData
preci: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & swbd, const double preci);

		/****** ShapeAnalysis_WireVertex::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if analysis was performed, else returns False.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of edges in analyzed wire (i.e. the length of all arrays).
") NbEdges;
		int NbEdges();

		/****** ShapeAnalysis_WireVertex::NextCriter ******/
		/****** md5 signature: 8632174e178cdbff99821f23e77428b4 ******/
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
		int NextCriter(const int crit, const int num = 0);

		/****** ShapeAnalysis_WireVertex::NextStatus ******/
		/****** md5 signature: dfd9177805499345ef00ae6effc36d89 ******/
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
		int NextStatus(const int stat, const int num = 0);

		/****** ShapeAnalysis_WireVertex::Position ******/
		/****** md5 signature: 8a1516466407424cd5f4b131e723640f ******/
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
		gp_XYZ Position(const int num);

		/****** ShapeAnalysis_WireVertex::Precision ******/
		/****** md5 signature: 619d4ae2a460550f8d9105bf9304b5d1 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns precision value used in analysis.
") Precision;
		double Precision();

		/****** ShapeAnalysis_WireVertex::SetClose ******/
		/****** md5 signature: fd44c5c0d29039a7434d448969e1b107 ******/
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
		void SetClose(const int num);

		/****** ShapeAnalysis_WireVertex::SetDisjoined ******/
		/****** md5 signature: a0ebd53e3c4d5a0d62edc84556d33e00 ******/
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
		void SetDisjoined(const int num);

		/****** ShapeAnalysis_WireVertex::SetEnd ******/
		/****** md5 signature: ba2506d7d2c7f016487a50c300d27fd7 ******/
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ
ufol: double

Return
-------
None

Description
-----------
<num> is the End of preceding Edge, and its projection on the following one lies on it at the Precision of <self> <ufol> gives the parameter on the following edge.
") SetEnd;
		void SetEnd(const int num, const gp_XYZ & pos, const double ufol);

		/****** ShapeAnalysis_WireVertex::SetInters ******/
		/****** md5 signature: 8f304313462865970c5d411d89e77c00 ******/
		%feature("compactdefaultargs") SetInters;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ
upre: double
ufol: double

Return
-------
None

Description
-----------
<num> is the Intersection of both Edges <upre> is the parameter on preceding edge, <ufol> on following edge.
") SetInters;
		void SetInters(const int num, const gp_XYZ & pos, const double upre, const double ufol);

		/****** ShapeAnalysis_WireVertex::SetPrecision ******/
		/****** md5 signature: e2e651a513d3749ed1bd1fef071518ff ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
preci: double

Return
-------
None

Description
-----------
Sets the precision for work Analysing: for each Vertex, comparison between the end of the preceding edge and the start of the following edge Each Vertex rank corresponds to the End Vertex of the Edge of same rank, in the ShapeExtend_WireData. I.E. for Vertex <num>, Edge <num> is the preceding one, <num+1> is the following one.
") SetPrecision;
		void SetPrecision(const double preci);

		/****** ShapeAnalysis_WireVertex::SetSameCoords ******/
		/****** md5 signature: d78cf216ced94675802589aa31910807 ******/
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
		void SetSameCoords(const int num);

		/****** ShapeAnalysis_WireVertex::SetSameVertex ******/
		/****** md5 signature: 92c7c6f0dd4489592dca1d7d67d58276 ******/
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
		void SetSameVertex(const int num);

		/****** ShapeAnalysis_WireVertex::SetStart ******/
		/****** md5 signature: 7cc173c5e0001144ef5e30e88b0c12c8 ******/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "
Parameters
----------
num: int
pos: gp_XYZ
upre: double

Return
-------
None

Description
-----------
<num> is the Start of following Edge, its projection on the preceding one lies on it at the Precision of <self> <upre> gives the parameter on the preceding edge.
") SetStart;
		void SetStart(const int num, const gp_XYZ & pos, const double upre);

		/****** ShapeAnalysis_WireVertex::Status ******/
		/****** md5 signature: f4e83bb2b0fb664b8efe54a023fff8d0 ******/
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
		int Status(const int num);

		/****** ShapeAnalysis_WireVertex::UFollowing ******/
		/****** md5 signature: e29c40daef52c1f23d593109df315fef ******/
		%feature("compactdefaultargs") UFollowing;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") UFollowing;
		double UFollowing(const int num);

		/****** ShapeAnalysis_WireVertex::UPrevious ******/
		/****** md5 signature: 591fae20e866a8a953daf655cca619d6 ******/
		%feature("compactdefaultargs") UPrevious;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") UPrevious;
		double UPrevious(const int num);

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

		/****** ShapeAnalysis_TransferParametersProj::ForceProjection ******/
		/****** md5 signature: 8865e7e811dc78e1733d82f7566e188a ******/
		%feature("compactdefaultargs") ForceProjection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns modifiable flag forcing projection If it is False (default), projection is done only if edge is not SameParameter or if tolerance of edge is greater than MaxTolerance().
") ForceProjection;
		bool & ForceProjection();

		/****** ShapeAnalysis_TransferParametersProj::Init ******/
		/****** md5 signature: 585374b52cc2ee3e4100bf02f60e9f83 ******/
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
		void Init(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** ShapeAnalysis_TransferParametersProj::IsSameRange ******/
		/****** md5 signature: 242dcae51c671ce10102363fcc461871 ******/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False;.
") IsSameRange;
		bool IsSameRange();

		/****** ShapeAnalysis_TransferParametersProj::Perform ******/
		/****** md5 signature: b300a9326e2694564b18d752118de701 ******/
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
		opencascade::handle<TColStd_HSequenceOfReal> Perform(const opencascade::handle<TColStd_HSequenceOfReal> & Papams, const bool To2d);

		/****** ShapeAnalysis_TransferParametersProj::Perform ******/
		/****** md5 signature: 2048dd4e0f73a51a118b98ac2e6cf411 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Param: double
To2d: bool

Return
-------
double

Description
-----------
Transfers parameter given by Param from 3d curve to pcurve (if To2d is True) or back (if To2d is False).
") Perform;
		double Perform(const double Param, const bool To2d);

		/****** ShapeAnalysis_TransferParametersProj::TransferRange ******/
		/****** md5 signature: a1d835628f82bbdf3b86fa104b96da23 ******/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "
Parameters
----------
newEdge: TopoDS_Edge
prevPar: double
currPar: double
Is2d: bool

Return
-------
None

Description
-----------
Recomputes range of curves from NewEdge. If Is2d equals True parameters are recomputed by curve2d else by curve3d.
") TransferRange;
		void TransferRange(TopoDS_Edge & newEdge, const double prevPar, const double currPar, const bool Is2d);

		%extend{
			bool GetForceProjection() { return self->ForceProjection(); }
			void SetForceProjection(bool value) { self->ForceProjection() = value; }
		};
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
class ShapeAnalysis_HSequenceOfFreeBounds : public NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>, public Standard_Transient {
  public:
    ShapeAnalysis_HSequenceOfFreeBounds();
    ShapeAnalysis_HSequenceOfFreeBounds(const NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>& theOther);
    const NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>& theSequence);
    NCollection_Sequence<opencascade::handle<ShapeAnalysis_FreeBoundData>>& ChangeSequence();
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
