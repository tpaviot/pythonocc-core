/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(ShapeAnalysis_FreeBoundData)
%wrap_handle(ShapeAnalysis_Surface)
%wrap_handle(ShapeAnalysis_TransferParameters)
%wrap_handle(ShapeAnalysis_Wire)
%wrap_handle(ShapeAnalysis_TransferParametersProj)
%wrap_handle(ShapeAnalysis_HSequenceOfFreeBounds)
/* end handles declaration */

/* templates */
%template(ShapeAnalysis_SequenceOfFreeBounds) NCollection_Sequence <opencascade::handle <ShapeAnalysis_FreeBoundData>>;
%template(ShapeAnalysis_DataMapOfShapeListOfReal) NCollection_DataMap <TopoDS_Shape , TColStd_ListOfReal , TopTools_ShapeMapHasher>;
%template(ShapeAnalysis_BoxBndTree) NCollection_UBTree <Standard_Integer , Bnd_Box>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <ShapeAnalysis_FreeBoundData>> ShapeAnalysis_SequenceOfFreeBounds;
typedef NCollection_DataMap <TopoDS_Shape , TColStd_ListOfReal , TopTools_ShapeMapHasher> ShapeAnalysis_DataMapOfShapeListOfReal;
typedef NCollection_DataMap <TopoDS_Shape , TColStd_ListOfReal , TopTools_ShapeMapHasher>::Iterator ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal;
typedef NCollection_UBTree <Standard_Integer , Bnd_Box> ShapeAnalysis_BoxBndTree;
/* end typedefs declaration */

/**********************
* class ShapeAnalysis *
**********************/
%rename(shapeanalysis) ShapeAnalysis;
class ShapeAnalysis {
	public:
		/****************** AdjustByPeriod ******************/
		%feature("compactdefaultargs") AdjustByPeriod;
		%feature("autodoc", "* Returns a shift required to move point <Val> to the range [ToVal-Period/2,ToVal+Period/2]. This shift will be the divisible by Period. Intended for adjusting parameters on periodic surfaces.
	:param Val:
	:type Val: float
	:param ToVal:
	:type ToVal: float
	:param Period:
	:type Period: float
	:rtype: float") AdjustByPeriod;
		static Standard_Real AdjustByPeriod (const Standard_Real Val,const Standard_Real ToVal,const Standard_Real Period);

		/****************** AdjustToPeriod ******************/
		%feature("compactdefaultargs") AdjustToPeriod;
		%feature("autodoc", "* Returns a shift required to move point <Val> to the range [ValMin,ValMax]. This shift will be the divisible by Period with Period = ValMax - ValMin. Intended for adjusting parameters on periodic surfaces.
	:param Val:
	:type Val: float
	:param ValMin:
	:type ValMin: float
	:param ValMax:
	:type ValMax: float
	:rtype: float") AdjustToPeriod;
		static Standard_Real AdjustToPeriod (const Standard_Real Val,const Standard_Real ValMin,const Standard_Real ValMax);

		/****************** ContourArea ******************/
		%feature("compactdefaultargs") ContourArea;
		%feature("autodoc", "* Returns a total area of 3d wire
	:param theWire:
	:type theWire: TopoDS_Wire
	:rtype: float") ContourArea;
		static Standard_Real ContourArea (const TopoDS_Wire & theWire);

		/****************** FindBounds ******************/
		%feature("compactdefaultargs") FindBounds;
		%feature("autodoc", "* Finds the start and end vertices of the shape Shape can be of the following type: vertex: V1 and V2 are the same and equal to <shape>, edge : V1 is start and V2 is end vertex (see ShapeAnalysis_Edge methods FirstVertex and LastVertex), wire : V1 is start vertex of the first edge, V2 is end vertex of the last edge (also see ShapeAnalysis_Edge). If wire contains no edges V1 and V2 are nullified If none of the above V1 and V2 are nullified
	:param shape:
	:type shape: TopoDS_Shape
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: void") FindBounds;
		static void FindBounds (const TopoDS_Shape & shape,TopoDS_Vertex & V1,TopoDS_Vertex & V2);

		/****************** GetFaceUVBounds ******************/
		%feature("compactdefaultargs") GetFaceUVBounds;
		%feature("autodoc", "* Computes exact UV bounds of all wires on the face
	:param F:
	:type F: TopoDS_Face
	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: void") GetFaceUVBounds;
		static void GetFaceUVBounds (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsOuterBound ******************/
		%feature("compactdefaultargs") IsOuterBound;
		%feature("autodoc", "* Returns True if <F> has outer bound.
	:param face:
	:type face: TopoDS_Face
	:rtype: bool") IsOuterBound;
		static Standard_Boolean IsOuterBound (const TopoDS_Face & face);

		/****************** OuterWire ******************/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "* Returns the outer wire on the face <Face>. This is replacement of the method BRepTools::OuterWire until it works badly. Returns the first wire oriented as outer according to FClass2d_Classifier. If none, last wire is returned.
	:param face:
	:type face: TopoDS_Face
	:rtype: TopoDS_Wire") OuterWire;
		static TopoDS_Wire OuterWire (const TopoDS_Face & face);

		/****************** TotCross2D ******************/
		%feature("compactdefaultargs") TotCross2D;
		%feature("autodoc", "* Returns a total area of 2d wire
	:param sewd:
	:type sewd: ShapeExtend_WireData
	:param aFace:
	:type aFace: TopoDS_Face
	:rtype: float") TotCross2D;
		static Standard_Real TotCross2D (const opencascade::handle<ShapeExtend_WireData> & sewd,const TopoDS_Face & aFace);

};


%extend ShapeAnalysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeAnalysis_CheckSmallFace *
*************************************/
%nodefaultctor ShapeAnalysis_CheckSmallFace;
class ShapeAnalysis_CheckSmallFace {
	public:
		/****************** CheckPin ******************/
		%feature("compactdefaultargs") CheckPin;
		%feature("autodoc", "* Checks if a Face has a pin, which can be edited No singularity : no pin, returns 0 If there is a pin, checked topics, with returned value : - 0 : nothing to do more - 1 : 'smooth', i.e. not a really sharp pin -> diagnostic 'SmoothPin' - 2 : stretched pin, i.e. is possible to relimit the face by another vertex, so that this vertex still gives a pin -> diagnostic 'StretchedPin' with location of vertex (Pnt)
	:param F:
	:type F: TopoDS_Face
	:param whatrow:
	:type whatrow: int
	:param sence:
	:type sence: int
	:rtype: bool") CheckPin;
		Standard_Boolean CheckPin (const TopoDS_Face & F,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** CheckPinEdges ******************/
		%feature("compactdefaultargs") CheckPinEdges;
		%feature("autodoc", ":param theFirstEdge:
	:type theFirstEdge: TopoDS_Edge
	:param theSecondEdge:
	:type theSecondEdge: TopoDS_Edge
	:param coef1:
	:type coef1: float
	:param coef2:
	:type coef2: float
	:param toler:
	:type toler: float
	:rtype: bool") CheckPinEdges;
		Standard_Boolean CheckPinEdges (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,const Standard_Real coef1,const Standard_Real coef2,const Standard_Real toler);

		/****************** CheckPinFace ******************/
		%feature("compactdefaultargs") CheckPinFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param mapEdges:
	:type mapEdges: TopTools_DataMapOfShapeShape
	:param toler: default value is -1.0
	:type toler: float
	:rtype: bool") CheckPinFace;
		Standard_Boolean CheckPinFace (const TopoDS_Face & F,TopTools_DataMapOfShapeShape & mapEdges,const Standard_Real toler = -1.0);

		/****************** CheckSingleStrip ******************/
		%feature("compactdefaultargs") CheckSingleStrip;
		%feature("autodoc", "* Checks if a Face is a single strip, i.e. brings two great edges which are confused on their whole length, possible other edges are small or null length //! Returns 0 if not a strip support, 1 strip in U, 2 strip in V Records diagnostic in info if it is a single strip
	:param F:
	:type F: TopoDS_Face
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param tol: default value is -1.0
	:type tol: float
	:rtype: bool") CheckSingleStrip;
		Standard_Boolean CheckSingleStrip (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol = -1.0);

		/****************** CheckSplittingVertices ******************/
		%feature("compactdefaultargs") CheckSplittingVertices;
		%feature("autodoc", "* Checks if a Face brings vertices which split it, either confused with non adjacent vertices, or confused with their projection on non adjacent edges Returns the count of found splitting vertices Each vertex then brings a diagnostic 'SplittingVertex', with data : 'Face' for the face, 'Edge' for the split edge
	:param F:
	:type F: TopoDS_Face
	:param MapEdges:
	:type MapEdges: TopTools_DataMapOfShapeListOfShape
	:param MapParam:
	:type MapParam: ShapeAnalysis_DataMapOfShapeListOfReal
	:param theAllVert:
	:type theAllVert: TopoDS_Compound
	:rtype: int") CheckSplittingVertices;
		Standard_Integer CheckSplittingVertices (const TopoDS_Face & F,TopTools_DataMapOfShapeListOfShape & MapEdges,ShapeAnalysis_DataMapOfShapeListOfReal & MapParam,TopoDS_Compound & theAllVert);

		/****************** CheckSpotFace ******************/
		%feature("compactdefaultargs") CheckSpotFace;
		%feature("autodoc", "* Acts as IsSpotFace, but records in <infos> a diagnostic 'SpotFace' with the Pnt as value (data 'Location')
	:param F:
	:type F: TopoDS_Face
	:param tol: default value is -1.0
	:type tol: float
	:rtype: bool") CheckSpotFace;
		Standard_Boolean CheckSpotFace (const TopoDS_Face & F,const Standard_Real tol = -1.0);

		/****************** CheckStripEdges ******************/
		%feature("compactdefaultargs") CheckStripEdges;
		%feature("autodoc", "* Checks if two edges define a strip, i.e. distance maxi below tolerance, given or some of those of E1 and E2
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param tol:
	:type tol: float
	:param dmax:
	:type dmax: float
	:rtype: bool") CheckStripEdges;
		Standard_Boolean CheckStripEdges (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real tol,Standard_Real &OutValue);

		/****************** CheckStripFace ******************/
		%feature("compactdefaultargs") CheckStripFace;
		%feature("autodoc", "* Checks if a Face is as a Strip Returns 0 if not or non determined, 1 if in U, 2 if in V By default, considers the tolerance zone of its edges A given value <tol> may be given to check a strip of max this width //! If a Face is determined as a Strip, it is delinited by two lists of edges. These lists are recorded in diagnostic Diagnostic 'StripFace' brings data 'Direction' (U or V), 'List1' , 'List2' (if they could be computed)
	:param F:
	:type F: TopoDS_Face
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param tol: default value is -1.0
	:type tol: float
	:rtype: bool") CheckStripFace;
		Standard_Boolean CheckStripFace (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol = -1.0);

		/****************** CheckTwisted ******************/
		%feature("compactdefaultargs") CheckTwisted;
		%feature("autodoc", "* Checks if a Face is twisted (apart from checking Pin, i.e. it does not give information on pin, only 'it is twisted')
	:param F:
	:type F: TopoDS_Face
	:param paramu:
	:type paramu: float
	:param paramv:
	:type paramv: float
	:rtype: bool") CheckTwisted;
		Standard_Boolean CheckTwisted (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FindStripEdges ******************/
		%feature("compactdefaultargs") FindStripEdges;
		%feature("autodoc", "* Searchs for two and only two edges up tolerance Returns True if OK, false if not 2 edges If True, returns the two edges and their maximum distance
	:param F:
	:type F: TopoDS_Face
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param tol:
	:type tol: float
	:param dmax:
	:type dmax: float
	:rtype: bool") FindStripEdges;
		Standard_Boolean FindStripEdges (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol,Standard_Real &OutValue);

		/****************** IsSpotFace ******************/
		%feature("compactdefaultargs") IsSpotFace;
		%feature("autodoc", "* Checks if a Face is as a Spot Returns 0 if not, 1 if yes, 2 if yes and all vertices are the same By default, considers the tolerance zone of its vertices A given value <tol> may be given to check a spot of this size If a Face is a Spot, its location is returned in <spot>, and <spotol> returns an equivalent tolerance, which is computed as half of max dimension of min-max box of the face
	:param F:
	:type F: TopoDS_Face
	:param spot:
	:type spot: gp_Pnt
	:param spotol:
	:type spotol: float
	:param tol: default value is -1.0
	:type tol: float
	:rtype: int") IsSpotFace;
		Standard_Integer IsSpotFace (const TopoDS_Face & F,gp_Pnt & spot,Standard_Real &OutValue,const Standard_Real tol = -1.0);

		/****************** IsStripSupport ******************/
		%feature("compactdefaultargs") IsStripSupport;
		%feature("autodoc", "* Checks if a Face lies on a Surface which is a strip So the Face is a strip. But a Face may be a strip elsewhere .. //! A given value <tol> may be given to check max width By default, considers the tolerance zone of its edges Returns 0 if not a strip support, 1 strip in U, 2 strip in V
	:param F:
	:type F: TopoDS_Face
	:param tol: default value is -1.0
	:type tol: float
	:rtype: bool") IsStripSupport;
		Standard_Boolean IsStripSupport (const TopoDS_Face & F,const Standard_Real tol = -1.0);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets a fixed Tolerance to check small face By default, local tolerance zone is considered Sets a fixed MaxTolerance to check small face Sets a fixed Tolerance to check small face By default, local tolerance zone is considered Unset fixed tolerance, comes back to local tolerance zones Unset fixed tolerance, comes back to local tolerance zones
	:param tol:
	:type tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real tol);

		/****************** ShapeAnalysis_CheckSmallFace ******************/
		%feature("compactdefaultargs") ShapeAnalysis_CheckSmallFace;
		%feature("autodoc", "* Creates an empty tool Checks a Shape i.e. each of its faces, records checks as diagnostics in the <infos> //! If <infos> has not been set before, no check is done //! For faces which are in a Shell, topological data are recorded to allow recovering connectivities after fixing or removing the small faces or parts of faces Enchains various checks on a face inshell : to compute more informations, relevant to topology
	:rtype: None") ShapeAnalysis_CheckSmallFace;
		 ShapeAnalysis_CheckSmallFace ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of last call to Perform() ShapeExtend_OK : face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

		/****************** StatusPin ******************/
		%feature("compactdefaultargs") StatusPin;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusPin;
		Standard_Boolean StatusPin (const ShapeExtend_Status status);

		/****************** StatusPinEdges ******************/
		%feature("compactdefaultargs") StatusPinEdges;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusPinEdges;
		Standard_Boolean StatusPinEdges (const ShapeExtend_Status status);

		/****************** StatusPinFace ******************/
		%feature("compactdefaultargs") StatusPinFace;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusPinFace;
		Standard_Boolean StatusPinFace (const ShapeExtend_Status status);

		/****************** StatusSplitVert ******************/
		%feature("compactdefaultargs") StatusSplitVert;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusSplitVert;
		Standard_Boolean StatusSplitVert (const ShapeExtend_Status status);

		/****************** StatusSpot ******************/
		%feature("compactdefaultargs") StatusSpot;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusSpot;
		Standard_Boolean StatusSpot (const ShapeExtend_Status status);

		/****************** StatusStrip ******************/
		%feature("compactdefaultargs") StatusStrip;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusStrip;
		Standard_Boolean StatusStrip (const ShapeExtend_Status status);

		/****************** StatusTwisted ******************/
		%feature("compactdefaultargs") StatusTwisted;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusTwisted;
		Standard_Boolean StatusTwisted (const ShapeExtend_Status status);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the tolerance to check small faces, negative value if local tolerances zones are to be considered
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

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
		%feature("compactdefaultargs") FillBndBox;
		%feature("autodoc", "* Computes a boundary box on segment of curve C2d from First to Last. This is done by taking NPoints points from the curve and, if Exact is True, by searching for exact extrema. All these points are added to Box.
	:param C2d:
	:type C2d: Geom2d_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param NPoints:
	:type NPoints: int
	:param Exact:
	:type Exact: bool
	:param Box:
	:type Box: Bnd_Box2d
	:rtype: None") FillBndBox;
		void FillBndBox (const opencascade::handle<Geom2d_Curve> & C2d,const Standard_Real First,const Standard_Real Last,const Standard_Integer NPoints,const Standard_Boolean Exact,Bnd_Box2d & Box);

		/****************** GetSamplePoints ******************/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "* Returns sample points which will serve as linearisation of the2d curve in range (first, last) The distribution of sample points is consystent with what is used by BRepTopAdaptor_FClass2d
	:param curve:
	:type curve: Geom2d_Curve
	:param first:
	:type first: float
	:param last:
	:type last: float
	:param seq:
	:type seq: TColgp_SequenceOfPnt2d
	:rtype: bool") GetSamplePoints;
		static Standard_Boolean GetSamplePoints (const opencascade::handle<Geom2d_Curve> & curve,const Standard_Real first,const Standard_Real last,TColgp_SequenceOfPnt2d & seq);

		/****************** GetSamplePoints ******************/
		%feature("compactdefaultargs") GetSamplePoints;
		%feature("autodoc", "* Returns sample points which will serve as linearisation of the curve in range (first, last)
	:param curve:
	:type curve: Geom_Curve
	:param first:
	:type first: float
	:param last:
	:type last: float
	:param seq:
	:type seq: TColgp_SequenceOfPnt
	:rtype: bool") GetSamplePoints;
		static Standard_Boolean GetSamplePoints (const opencascade::handle<Geom_Curve> & curve,const Standard_Real first,const Standard_Real last,TColgp_SequenceOfPnt & seq);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Tells if the Curve is closed with given precision. If <preci> < 0 then Precision::Confusion is used.
	:param curve:
	:type curve: Geom_Curve
	:param preci: default value is -1
	:type preci: float
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const opencascade::handle<Geom_Curve> & curve,const Standard_Real preci = -1);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "* This method was implemented as fix for changes in trimmed curve behaviour. For the moment trimmed curve returns false anyway. So it is necessary to adapt all Data exchange tools for this behaviour. Current implementation takes into account that curve may be offset.
	:param curve:
	:type curve: Geom_Curve
	:rtype: bool") IsPeriodic;
		static Standard_Boolean IsPeriodic (const opencascade::handle<Geom_Curve> & curve);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "* The same as for Curve3d.
	:param curve:
	:type curve: Geom2d_Curve
	:rtype: bool") IsPeriodic;
		static Standard_Boolean IsPeriodic (const opencascade::handle<Geom2d_Curve> & curve);

		/****************** IsPlanar ******************/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "* Checks if points are planar with given preci. If Normal has not zero modulus, checks with given normal
	:param pnts:
	:type pnts: TColgp_Array1OfPnt
	:param Normal:
	:type Normal: gp_XYZ
	:param preci: default value is 0
	:type preci: float
	:rtype: bool") IsPlanar;
		static Standard_Boolean IsPlanar (const TColgp_Array1OfPnt & pnts,gp_XYZ & Normal,const Standard_Real preci = 0);

		/****************** IsPlanar ******************/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "* Checks if curve is planar with given preci. If Normal has not zero modulus, checks with given normal
	:param curve:
	:type curve: Geom_Curve
	:param Normal:
	:type Normal: gp_XYZ
	:param preci: default value is 0
	:type preci: float
	:rtype: bool") IsPlanar;
		static Standard_Boolean IsPlanar (const opencascade::handle<Geom_Curve> & curve,gp_XYZ & Normal,const Standard_Real preci = 0);

		/****************** NextProject ******************/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "* Projects a Point on a Curve using Newton method. <paramPrev> is taken as the first approximation of solution. If Newton algorithm fails the method Project() is used. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci>
	:param paramPrev:
	:type paramPrev: float
	:param C3D:
	:type C3D: Geom_Curve
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param proj:
	:type proj: gp_Pnt
	:param param:
	:type param: float
	:param cf:
	:type cf: float
	:param cl:
	:type cl: float
	:param AdjustToEnds: default value is Standard_True
	:type AdjustToEnds: bool
	:rtype: float") NextProject;
		Standard_Real NextProject (const Standard_Real paramPrev,const opencascade::handle<Geom_Curve> & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Real cf,const Standard_Real cl,const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** NextProject ******************/
		%feature("compactdefaultargs") NextProject;
		%feature("autodoc", "* Projects a Point on a Curve using Newton method. <paramPrev> is taken as the first approximation of solution. If Newton algorithm fails the method Project() is used.
	:param paramPrev:
	:type paramPrev: float
	:param C3D:
	:type C3D: Adaptor3d_Curve
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param proj:
	:type proj: gp_Pnt
	:param param:
	:type param: float
	:rtype: float") NextProject;
		Standard_Real NextProject (const Standard_Real paramPrev,const Adaptor3d_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Projects a Point on a Curve. Computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). The number of iterations is limited. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci> //! Returned value is the distance between the given point and computed one.
	:param C3D:
	:type C3D: Geom_Curve
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param proj:
	:type proj: gp_Pnt
	:param param:
	:type param: float
	:param AdjustToEnds: default value is Standard_True
	:type AdjustToEnds: bool
	:rtype: float") Project;
		Standard_Real Project (const opencascade::handle<Geom_Curve> & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Projects a Point on a Curve. Computes the projected point and its parameter on the curve. <preci> is used as 3d precision (hence, 0 will produce reject unless exact confusion). The number of iterations is limited. //! Returned value is the distance between the given point and computed one.
	:param C3D:
	:type C3D: Adaptor3d_Curve
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param proj:
	:type proj: gp_Pnt
	:param param:
	:type param: float
	:param AdjustToEnds: default value is Standard_True
	:type AdjustToEnds: bool
	:rtype: float") Project;
		Standard_Real Project (const Adaptor3d_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Projects a Point on a Curve, but parameters are limited between <cf> and <cl>. The range [cf, cl] is extended with help of Adaptor3d on the basis of 3d precision <preci>. If AdjustToEnds is True, point will be adjusted to the end of the curve if distance is less than <preci>
	:param C3D:
	:type C3D: Geom_Curve
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param proj:
	:type proj: gp_Pnt
	:param param:
	:type param: float
	:param cf:
	:type cf: float
	:param cl:
	:type cl: float
	:param AdjustToEnds: default value is Standard_True
	:type AdjustToEnds: bool
	:rtype: float") Project;
		Standard_Real Project (const opencascade::handle<Geom_Curve> & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Real cf,const Standard_Real cl,const Standard_Boolean AdjustToEnds = Standard_True);

		/****************** ProjectAct ******************/
		%feature("compactdefaultargs") ProjectAct;
		%feature("autodoc", ":param C3D:
	:type C3D: Adaptor3d_Curve
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param proj:
	:type proj: gp_Pnt
	:param param:
	:type param: float
	:rtype: float") ProjectAct;
		Standard_Real ProjectAct (const Adaptor3d_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue);

		/****************** SelectForwardSeam ******************/
		%feature("compactdefaultargs") SelectForwardSeam;
		%feature("autodoc", "* Defines which pcurve (C1 or C2) should be chosen for FORWARD seam edge.
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:rtype: int") SelectForwardSeam;
		Standard_Integer SelectForwardSeam (const opencascade::handle<Geom2d_Curve> & C1,const opencascade::handle<Geom2d_Curve> & C2);

		/****************** ValidateRange ******************/
		%feature("compactdefaultargs") ValidateRange;
		%feature("autodoc", "* Validate parameters First and Last for the given curve in order to make them valid for creation of edge. This includes: - limiting range [First,Last] by range of curve - adjusting range [First,Last] for periodic (or closed) curve if Last < First Returns True if parameters are OK or are successfully corrected, or False if parameters cannot be corrected. In the latter case, parameters are reset to range of curve.
	:param Crv:
	:type Crv: Geom_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param prec:
	:type prec: float
	:rtype: bool") ValidateRange;
		Standard_Boolean ValidateRange (const opencascade::handle<Geom_Curve> & Crv,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real prec);

};


%extend ShapeAnalysis_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeAnalysis_Edge *
***************************/
%nodefaultctor ShapeAnalysis_Edge;
class ShapeAnalysis_Edge {
	public:
		/****************** BoundUV ******************/
		%feature("compactdefaultargs") BoundUV;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:param first:
	:type first: gp_Pnt2d
	:param last:
	:type last: gp_Pnt2d
	:rtype: bool") BoundUV;
		Standard_Boolean BoundUV (const TopoDS_Edge & edge,const TopoDS_Face & face,gp_Pnt2d & first,gp_Pnt2d & last);

		/****************** BoundUV ******************/
		%feature("compactdefaultargs") BoundUV;
		%feature("autodoc", "* Returns the ends of pcurve Calls method PCurve with <orient> equal to True
	:param edge:
	:type edge: TopoDS_Edge
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:param first:
	:type first: gp_Pnt2d
	:param last:
	:type last: gp_Pnt2d
	:rtype: bool") BoundUV;
		Standard_Boolean BoundUV (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location,gp_Pnt2d & first,gp_Pnt2d & last);

		/****************** CheckCurve3dWithPCurve ******************/
		%feature("compactdefaultargs") CheckCurve3dWithPCurve;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:rtype: bool") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);

		/****************** CheckCurve3dWithPCurve ******************/
		%feature("compactdefaultargs") CheckCurve3dWithPCurve;
		%feature("autodoc", "* Checks mutual orientation of 3d curve and pcurve on the analysis of curves bounding points
	:param edge:
	:type edge: TopoDS_Edge
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:rtype: bool") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location);

		/****************** CheckOverlapping ******************/
		%feature("compactdefaultargs") CheckOverlapping;
		%feature("autodoc", "* Checks the first edge is overlapped with second edge. If distance between two edges is less then theTolOverlap edges is overlapped. theDomainDis - length of part of edges on wich edges is overlapped.
	:param theEdge1:
	:type theEdge1: TopoDS_Edge
	:param theEdge2:
	:type theEdge2: TopoDS_Edge
	:param theTolOverlap:
	:type theTolOverlap: float
	:param theDomainDist: default value is 0.0
	:type theDomainDist: float
	:rtype: bool") CheckOverlapping;
		Standard_Boolean CheckOverlapping (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,Standard_Real &OutValue,const Standard_Real theDomainDist = 0.0);

		/****************** CheckPCurveRange ******************/
		%feature("compactdefaultargs") CheckPCurveRange;
		%feature("autodoc", "* Checks possibility for pcurve thePC to have range [theFirst, theLast] (edge range) having respect to real first, last parameters of thePC
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:param thePC:
	:type thePC: Geom2d_Curve
	:rtype: bool") CheckPCurveRange;
		Standard_Boolean CheckPCurveRange (const Standard_Real theFirst,const Standard_Real theLast,const opencascade::handle<Geom2d_Curve> & thePC);

		/****************** CheckSameParameter ******************/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "* Checks the edge to be SameParameter. Calculates the maximal deviation between 3d curve and each pcurve of the edge on <NbControl> equidistant points (the same algorithm as in BRepCheck; default value is 23 as in BRepCheck). This deviation is returned in <maxdev> parameter. If deviation is greater than tolerance of the edge (i.e. incorrect flag) returns False, else returns True.
	:param edge:
	:type edge: TopoDS_Edge
	:param maxdev:
	:type maxdev: float
	:param NbControl: default value is 23
	:type NbControl: int
	:rtype: bool") CheckSameParameter;
		Standard_Boolean CheckSameParameter (const TopoDS_Edge & edge,Standard_Real &OutValue,const Standard_Integer NbControl = 23);

		/****************** CheckSameParameter ******************/
		%feature("compactdefaultargs") CheckSameParameter;
		%feature("autodoc", "* Checks the edge to be SameParameter. Calculates the maximal deviation between 3d curve and each pcurve of the edge on <NbControl> equidistant points (the same algorithm as in BRepCheck; default value is 23 as in BRepCheck). This deviation is returned in <maxdev> parameter. If deviation is greater than tolerance of the edge (i.e. incorrect flag) returns False, else returns True.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:param theMaxdev:
	:type theMaxdev: float
	:param theNbControl: default value is 23
	:type theNbControl: int
	:rtype: bool") CheckSameParameter;
		Standard_Boolean CheckSameParameter (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,Standard_Real &OutValue,const Standard_Integer theNbControl = 23);

		/****************** CheckVertexTolerance ******************/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:param toler1:
	:type toler1: float
	:param toler2:
	:type toler2: float
	:rtype: bool") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance (const TopoDS_Edge & edge,const TopoDS_Face & face,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CheckVertexTolerance ******************/
		%feature("compactdefaultargs") CheckVertexTolerance;
		%feature("autodoc", "* Checks if it is necessary to increase tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) toler1 returns necessary tolerance for first vertex, toler2 returns necessary tolerance for last vertex.
	:param edge:
	:type edge: TopoDS_Edge
	:param toler1:
	:type toler1: float
	:param toler2:
	:type toler2: float
	:rtype: bool") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance (const TopoDS_Edge & edge,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CheckVerticesWithCurve3d ******************/
		%feature("compactdefaultargs") CheckVerticesWithCurve3d;
		%feature("autodoc", "* Checks the start and/or end vertex of the edge for matching with 3d curve with the given precision. <vtx> = 1 : start vertex only <vtx> = 2 : end vertex only <vtx> = 0 : both (default) If preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.
	:param edge:
	:type edge: TopoDS_Edge
	:param preci: default value is -1
	:type preci: float
	:param vtx: default value is 0
	:type vtx: int
	:rtype: bool") CheckVerticesWithCurve3d;
		Standard_Boolean CheckVerticesWithCurve3d (const TopoDS_Edge & edge,const Standard_Real preci = -1,const Standard_Integer vtx = 0);

		/****************** CheckVerticesWithPCurve ******************/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:param preci: default value is -1
	:type preci: float
	:param vtx: default value is 0
	:type vtx: int
	:rtype: bool") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Real preci = -1,const Standard_Integer vtx = 0);

		/****************** CheckVerticesWithPCurve ******************/
		%feature("compactdefaultargs") CheckVerticesWithPCurve;
		%feature("autodoc", "* Checks the start and/or end vertex of the edge for matching with pcurve with the given precision. <vtx> = 1 : start vertex <vtx> = 2 : end vertex <vtx> = 0 : both If preci < 0 the vertices are considered with their own tolerances, else with the given <preci>.
	:param edge:
	:type edge: TopoDS_Edge
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:param preci: default value is -1
	:type preci: float
	:param vtx: default value is 0
	:type vtx: int
	:rtype: bool") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location,const Standard_Real preci = -1,const Standard_Integer vtx = 0);

		/****************** ComputeDeviation ******************/
		%feature("compactdefaultargs") ComputeDeviation;
		%feature("autodoc", "* Computes the maximal deviation between the two curve representations. dev is an input/output parameter and contains the computed deviation (should be initialized with 0. for the first call). Used by CheckSameParameter().
	:param CRef:
	:type CRef: Adaptor3d_Curve
	:param Other:
	:type Other: Adaptor3d_Curve
	:param SameParameter:
	:type SameParameter: bool
	:param dev:
	:type dev: float
	:param NCONTROL:
	:type NCONTROL: int
	:rtype: bool") ComputeDeviation;
		static Standard_Boolean ComputeDeviation (const Adaptor3d_Curve & CRef,const Adaptor3d_Curve & Other,const Standard_Boolean SameParameter,Standard_Real &OutValue,const Standard_Integer NCONTROL);

		/****************** Curve3d ******************/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "* Returns the 3d curve and bounding parameteres for the edge Returns False if no 3d curve. If <orient> is True (default), takes orientation into account: if the edge is reversed, cf and cl are toggled
	:param edge:
	:type edge: TopoDS_Edge
	:param C3d:
	:type C3d: Geom_Curve
	:param cf:
	:type cf: float
	:param cl:
	:type cl: float
	:param orient: default value is Standard_True
	:type orient: bool
	:rtype: bool") Curve3d;
		Standard_Boolean Curve3d (const TopoDS_Edge & edge,opencascade::handle<Geom_Curve> & C3d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean orient = Standard_True);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "* Returns start vertex of the edge (taking edge orientation into account).
	:param edge:
	:type edge: TopoDS_Edge
	:rtype: TopoDS_Vertex") FirstVertex;
		TopoDS_Vertex FirstVertex (const TopoDS_Edge & edge);

		/****************** GetEndTangent2d ******************/
		%feature("compactdefaultargs") GetEndTangent2d;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:param atEnd:
	:type atEnd: bool
	:param pos:
	:type pos: gp_Pnt2d
	:param tang:
	:type tang: gp_Vec2d
	:param dparam: default value is 0.0
	:type dparam: float
	:rtype: bool") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean atEnd,gp_Pnt2d & pos,gp_Vec2d & tang,const Standard_Real dparam = 0.0);

		/****************** GetEndTangent2d ******************/
		%feature("compactdefaultargs") GetEndTangent2d;
		%feature("autodoc", "* Returns tangent of the edge pcurve at its start (if atEnd is False) or end (if True), regarding the orientation of edge. If edge is REVERSED, tangent is reversed before return. Returns True if pcurve is available and tangent is computed and is not null, else False.
	:param edge:
	:type edge: TopoDS_Edge
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:param atEnd:
	:type atEnd: bool
	:param pos:
	:type pos: gp_Pnt2d
	:param tang:
	:type tang: gp_Vec2d
	:param dparam: default value is 0.0
	:type dparam: float
	:rtype: bool") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location,const Standard_Boolean atEnd,gp_Pnt2d & pos,gp_Vec2d & tang,const Standard_Real dparam = 0.0);

		/****************** HasCurve3d ******************/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "* Tells if the edge has a 3d curve
	:param edge:
	:type edge: TopoDS_Edge
	:rtype: bool") HasCurve3d;
		Standard_Boolean HasCurve3d (const TopoDS_Edge & edge);

		/****************** HasPCurve ******************/
		%feature("compactdefaultargs") HasPCurve;
		%feature("autodoc", "* Tells if the Edge has a pcurve on the face.
	:param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:rtype: bool") HasPCurve;
		Standard_Boolean HasPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);

		/****************** HasPCurve ******************/
		%feature("compactdefaultargs") HasPCurve;
		%feature("autodoc", "* Tells if the edge has a pcurve on the surface (with location).
	:param edge:
	:type edge: TopoDS_Edge
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:rtype: bool") HasPCurve;
		Standard_Boolean HasPCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location);

		/****************** IsClosed3d ******************/
		%feature("compactdefaultargs") IsClosed3d;
		%feature("autodoc", "* Gives True if the edge has a 3d curve, this curve is closed, and the edge has the same vertex at start and end
	:param edge:
	:type edge: TopoDS_Edge
	:rtype: bool") IsClosed3d;
		Standard_Boolean IsClosed3d (const TopoDS_Edge & edge);

		/****************** IsSeam ******************/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:rtype: bool") IsSeam;
		Standard_Boolean IsSeam (const TopoDS_Edge & edge,const TopoDS_Face & face);

		/****************** IsSeam ******************/
		%feature("compactdefaultargs") IsSeam;
		%feature("autodoc", "* Returns True if the edge has two pcurves on one surface
	:param edge:
	:type edge: TopoDS_Edge
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:rtype: bool") IsSeam;
		Standard_Boolean IsSeam (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "* Returns end vertex of the edge (taking edge orientation into account).
	:param edge:
	:type edge: TopoDS_Edge
	:rtype: TopoDS_Vertex") LastVertex;
		TopoDS_Vertex LastVertex (const TopoDS_Edge & edge);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:param C2d:
	:type C2d: Geom2d_Curve
	:param cf:
	:type cf: float
	:param cl:
	:type cl: float
	:param orient: default value is Standard_True
	:type orient: bool
	:rtype: bool") PCurve;
		Standard_Boolean PCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,opencascade::handle<Geom2d_Curve> & C2d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean orient = Standard_True);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "* Returns the pcurve and bounding parameteres for the edge lying on the surface. Returns False if the edge has no pcurve on this surface. If <orient> is True (default), takes orientation into account: if the edge is reversed, cf and cl are toggled
	:param edge:
	:type edge: TopoDS_Edge
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:param C2d:
	:type C2d: Geom2d_Curve
	:param cf:
	:type cf: float
	:param cl:
	:type cl: float
	:param orient: default value is Standard_True
	:type orient: bool
	:rtype: bool") PCurve;
		Standard_Boolean PCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location,opencascade::handle<Geom2d_Curve> & C2d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean orient = Standard_True);

		/****************** ShapeAnalysis_Edge ******************/
		%feature("compactdefaultargs") ShapeAnalysis_Edge;
		%feature("autodoc", "* Empty constructor; initialises Status to OK
	:rtype: None") ShapeAnalysis_Edge;
		 ShapeAnalysis_Edge ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status (in the form of True/False) of last Check
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

};


%extend ShapeAnalysis_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ShapeAnalysis_FreeBoundData *
************************************/
%nodefaultctor ShapeAnalysis_FreeBoundData;
class ShapeAnalysis_FreeBoundData : public Standard_Transient {
	public:
		/****************** AddNotch ******************/
		%feature("compactdefaultargs") AddNotch;
		%feature("autodoc", "* Adds notch on the contour with its maximum width
	:param notch:
	:type notch: TopoDS_Wire
	:param width:
	:type width: float
	:rtype: None") AddNotch;
		void AddNotch (const TopoDS_Wire & notch,const Standard_Real width);

		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "* Returns area of the contour
	:rtype: float") Area;
		Standard_Real Area ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears all properties of the contour. Contour bound itself is not cleared.
	:rtype: None") Clear;
		void Clear ();

		/****************** FreeBound ******************/
		%feature("compactdefaultargs") FreeBound;
		%feature("autodoc", "* Returns contour
	:rtype: TopoDS_Wire") FreeBound;
		TopoDS_Wire FreeBound ();

		/****************** NbNotches ******************/
		%feature("compactdefaultargs") NbNotches;
		%feature("autodoc", "* Returns number of notches on the contour
	:rtype: int") NbNotches;
		Standard_Integer NbNotches ();

		/****************** Notch ******************/
		%feature("compactdefaultargs") Notch;
		%feature("autodoc", "* Returns notch on the contour
	:param index:
	:type index: int
	:rtype: TopoDS_Wire") Notch;
		TopoDS_Wire Notch (const Standard_Integer index);

		/****************** NotchWidth ******************/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "* Returns maximum width of notch specified by its rank number on the contour
	:param index:
	:type index: int
	:rtype: float") NotchWidth;
		Standard_Real NotchWidth (const Standard_Integer index);

		/****************** NotchWidth ******************/
		%feature("compactdefaultargs") NotchWidth;
		%feature("autodoc", "* Returns maximum width of notch specified as TopoDS_Wire on the contour
	:param notch:
	:type notch: TopoDS_Wire
	:rtype: float") NotchWidth;
		Standard_Real NotchWidth (const TopoDS_Wire & notch);

		/****************** Notches ******************/
		%feature("compactdefaultargs") Notches;
		%feature("autodoc", "* Returns sequence of notches on the contour
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") Notches;
		opencascade::handle<TopTools_HSequenceOfShape> Notches ();

		/****************** Perimeter ******************/
		%feature("compactdefaultargs") Perimeter;
		%feature("autodoc", "* Returns perimeter of the contour
	:rtype: float") Perimeter;
		Standard_Real Perimeter ();

		/****************** Ratio ******************/
		%feature("compactdefaultargs") Ratio;
		%feature("autodoc", "* Returns ratio of average length to average width of the contour
	:rtype: float") Ratio;
		Standard_Real Ratio ();

		/****************** SetArea ******************/
		%feature("compactdefaultargs") SetArea;
		%feature("autodoc", "* Sets area of the contour
	:param area:
	:type area: float
	:rtype: None") SetArea;
		void SetArea (const Standard_Real area);

		/****************** SetFreeBound ******************/
		%feature("compactdefaultargs") SetFreeBound;
		%feature("autodoc", "* Sets contour
	:param freebound:
	:type freebound: TopoDS_Wire
	:rtype: None") SetFreeBound;
		void SetFreeBound (const TopoDS_Wire & freebound);

		/****************** SetPerimeter ******************/
		%feature("compactdefaultargs") SetPerimeter;
		%feature("autodoc", "* Sets perimeter of the contour
	:param perimeter:
	:type perimeter: float
	:rtype: None") SetPerimeter;
		void SetPerimeter (const Standard_Real perimeter);

		/****************** SetRatio ******************/
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "* Sets ratio of average length to average width of the contour
	:param ratio:
	:type ratio: float
	:rtype: None") SetRatio;
		void SetRatio (const Standard_Real ratio);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "* Sets average width of the contour
	:param width:
	:type width: float
	:rtype: None") SetWidth;
		void SetWidth (const Standard_Real width);

		/****************** ShapeAnalysis_FreeBoundData ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundData;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData ();

		/****************** ShapeAnalysis_FreeBoundData ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundData;
		%feature("autodoc", "* Creates object with contour given in the form of TopoDS_Wire
	:param freebound:
	:type freebound: TopoDS_Wire
	:rtype: None") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData (const TopoDS_Wire & freebound);

		/****************** Width ******************/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "* Returns average width of the contour
	:rtype: float") Width;
		Standard_Real Width ();

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
%nodefaultctor ShapeAnalysis_FreeBounds;
class ShapeAnalysis_FreeBounds {
	public:
		/****************** ConnectEdgesToWires ******************/
		%feature("compactdefaultargs") ConnectEdgesToWires;
		%feature("autodoc", "* Builds sequnce of <wires> out of sequence of not sorted <edges>. Tries to build wires of maximum length. Building a wire is stopped when no edges can be connected to it at its head or at its tail. //! Orientation of the edge can change when connecting. If <shared> is True connection is performed only when adjacent edges share the same vertex. If <shared> is False connection is performed only when ends of adjacent edges are at distance less than <toler>.
	:param edges:
	:type edges: TopTools_HSequenceOfShape
	:param toler:
	:type toler: float
	:param shared:
	:type shared: bool
	:param wires:
	:type wires: TopTools_HSequenceOfShape
	:rtype: void") ConnectEdgesToWires;
		static void ConnectEdgesToWires (opencascade::handle<TopTools_HSequenceOfShape> & edges,const Standard_Real toler,const Standard_Boolean shared,opencascade::handle<TopTools_HSequenceOfShape> & wires);

		/****************** ConnectWiresToWires ******************/
		%feature("compactdefaultargs") ConnectWiresToWires;
		%feature("autodoc", ":param iwires:
	:type iwires: TopTools_HSequenceOfShape
	:param toler:
	:type toler: float
	:param shared:
	:type shared: bool
	:param owires:
	:type owires: TopTools_HSequenceOfShape
	:rtype: void") ConnectWiresToWires;
		static void ConnectWiresToWires (opencascade::handle<TopTools_HSequenceOfShape> & iwires,const Standard_Real toler,const Standard_Boolean shared,opencascade::handle<TopTools_HSequenceOfShape> & owires);

		/****************** ConnectWiresToWires ******************/
		%feature("compactdefaultargs") ConnectWiresToWires;
		%feature("autodoc", "* Builds sequnce of <owires> out of sequence of not sorted <iwires>. Tries to build wires of maximum length. Building a wire is stopped when no wires can be connected to it at its head or at its tail. //! Orientation of the wire can change when connecting. If <shared> is True connection is performed only when adjacent wires share the same vertex. If <shared> is False connection is performed only when ends of adjacent wires are at distance less than <toler>. Map <vertices> stores the correspondence between original end vertices of the wires and new connecting vertices.
	:param iwires:
	:type iwires: TopTools_HSequenceOfShape
	:param toler:
	:type toler: float
	:param shared:
	:type shared: bool
	:param owires:
	:type owires: TopTools_HSequenceOfShape
	:param vertices:
	:type vertices: TopTools_DataMapOfShapeShape
	:rtype: void") ConnectWiresToWires;
		static void ConnectWiresToWires (opencascade::handle<TopTools_HSequenceOfShape> & iwires,const Standard_Real toler,const Standard_Boolean shared,opencascade::handle<TopTools_HSequenceOfShape> & owires,TopTools_DataMapOfShapeShape & vertices);

		/****************** DispatchWires ******************/
		%feature("compactdefaultargs") DispatchWires;
		%feature("autodoc", "* Dispatches sequence of <wires> into two compounds <closed> for closed wires and <open> for open wires. If a compound is not empty wires are added into it.
	:param wires:
	:type wires: TopTools_HSequenceOfShape
	:param closed:
	:type closed: TopoDS_Compound
	:param open:
	:type open: TopoDS_Compound
	:rtype: void") DispatchWires;
		static void DispatchWires (const opencascade::handle<TopTools_HSequenceOfShape> & wires,TopoDS_Compound & closed,TopoDS_Compound & open);

		/****************** GetClosedWires ******************/
		%feature("compactdefaultargs") GetClosedWires;
		%feature("autodoc", "* Returns compound of closed wires out of free edges.
	:rtype: TopoDS_Compound") GetClosedWires;
		const TopoDS_Compound  GetClosedWires ();

		/****************** GetOpenWires ******************/
		%feature("compactdefaultargs") GetOpenWires;
		%feature("autodoc", "* Returns compound of open wires out of free edges.
	:rtype: TopoDS_Compound") GetOpenWires;
		const TopoDS_Compound  GetOpenWires ();

		/****************** ShapeAnalysis_FreeBounds ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds ();

		/****************** ShapeAnalysis_FreeBounds ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "* Builds forecasting free bounds of the <shape>. <shape> should be a compound of faces. This constructor is to be used for forecasting free edges with help of sewing analyzer BRepAlgo_Sewing which is called with tolerance <toler>. Free edges are connected into wires only when their ends are at distance less than <toler>. If <splitclosed> is True extracts closed sub-wires out of built closed wires. If <splitopen> is True extracts closed sub-wires out of built open wires.
	:param shape:
	:type shape: TopoDS_Shape
	:param toler:
	:type toler: float
	:param splitclosed: default value is Standard_False
	:type splitclosed: bool
	:param splitopen: default value is Standard_True
	:type splitopen: bool
	:rtype: None") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds (const TopoDS_Shape & shape,const Standard_Real toler,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_True);

		/****************** ShapeAnalysis_FreeBounds ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBounds;
		%feature("autodoc", "* Builds actual free bounds of the <shape>. <shape> should be a compound of shells. This constructor is to be used for getting free edges (ones referenced by the only face) with help of analyzer ShapeAnalysis_Shell. Free edges are connected into wires only when they share the same vertex. If <splitclosed> is True extracts closed sub-wires out of built closed wires. If <splitopen> is True extracts closed sub-wires out of built open wires.
	:param shape:
	:type shape: TopoDS_Shape
	:param splitclosed: default value is Standard_False
	:type splitclosed: bool
	:param splitopen: default value is Standard_True
	:type splitopen: bool
	:param checkinternaledges: default value is Standard_False
	:type checkinternaledges: bool
	:rtype: None") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds (const TopoDS_Shape & shape,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_True,const Standard_Boolean checkinternaledges = Standard_False);

		/****************** SplitWires ******************/
		%feature("compactdefaultargs") SplitWires;
		%feature("autodoc", "* Extracts closed sub-wires out of <wires> and adds them to <closed>, open wires remained after extraction are put into <open>. If <shared> is True extraction is performed only when edges share the same vertex. If <shared> is False connection is performed only when ends of the edges are at distance less than <toler>.
	:param wires:
	:type wires: TopTools_HSequenceOfShape
	:param toler:
	:type toler: float
	:param shared:
	:type shared: bool
	:param closed:
	:type closed: TopTools_HSequenceOfShape
	:param open:
	:type open: TopTools_HSequenceOfShape
	:rtype: void") SplitWires;
		static void SplitWires (const opencascade::handle<TopTools_HSequenceOfShape> & wires,const Standard_Real toler,const Standard_Boolean shared,opencascade::handle<TopTools_HSequenceOfShape> & closed,opencascade::handle<TopTools_HSequenceOfShape> & open);

};


%extend ShapeAnalysis_FreeBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class ShapeAnalysis_FreeBoundsProperties *
*******************************************/
%nodefaultctor ShapeAnalysis_FreeBoundsProperties;
class ShapeAnalysis_FreeBoundsProperties {
	public:
		/****************** CheckContours ******************/
		%feature("compactdefaultargs") CheckContours;
		%feature("autodoc", ":param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckContours;
		Standard_Boolean CheckContours (const Standard_Real prec = 0.0);

		/****************** CheckNotches ******************/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", ":param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckNotches;
		Standard_Boolean CheckNotches (const Standard_Real prec = 0.0);

		/****************** CheckNotches ******************/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", ":param fbData:
	:type fbData: ShapeAnalysis_FreeBoundData
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckNotches;
		Standard_Boolean CheckNotches (opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData,const Standard_Real prec = 0.0);

		/****************** CheckNotches ******************/
		%feature("compactdefaultargs") CheckNotches;
		%feature("autodoc", ":param freebound:
	:type freebound: TopoDS_Wire
	:param num:
	:type num: int
	:param notch:
	:type notch: TopoDS_Wire
	:param distMax:
	:type distMax: float
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckNotches;
		Standard_Boolean CheckNotches (const TopoDS_Wire & freebound,const Standard_Integer num,TopoDS_Wire & notch,Standard_Real &OutValue,const Standard_Real prec = 0.0);

		/****************** ClosedFreeBound ******************/
		%feature("compactdefaultargs") ClosedFreeBound;
		%feature("autodoc", "* Returns properties of closed free bound specified by its rank number
	:param index:
	:type index: int
	:rtype: opencascade::handle<ShapeAnalysis_FreeBoundData>") ClosedFreeBound;
		opencascade::handle<ShapeAnalysis_FreeBoundData> ClosedFreeBound (const Standard_Integer index);

		/****************** ClosedFreeBounds ******************/
		%feature("compactdefaultargs") ClosedFreeBounds;
		%feature("autodoc", "* Returns all closed free bounds
	:rtype: opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds>") ClosedFreeBounds;
		opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds> ClosedFreeBounds ();

		/****************** DispatchBounds ******************/
		%feature("compactdefaultargs") DispatchBounds;
		%feature("autodoc", ":rtype: bool") DispatchBounds;
		Standard_Boolean DispatchBounds ();

		/****************** FillProperties ******************/
		%feature("compactdefaultargs") FillProperties;
		%feature("autodoc", ":param fbData:
	:type fbData: ShapeAnalysis_FreeBoundData
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") FillProperties;
		Standard_Boolean FillProperties (opencascade::handle<ShapeAnalysis_FreeBoundData> & fbData,const Standard_Real prec = 0.0);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the object with given parameters. <shape> should be a compound of faces.
	:param shape:
	:type shape: TopoDS_Shape
	:param tolerance:
	:type tolerance: float
	:param splitclosed: default value is Standard_False
	:type splitclosed: bool
	:param splitopen: default value is Standard_False
	:type splitopen: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & shape,const Standard_Real tolerance,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the object with given parameters. <shape> should be a compound of shells.
	:param shape:
	:type shape: TopoDS_Shape
	:param splitclosed: default value is Standard_False
	:type splitclosed: bool
	:param splitopen: default value is Standard_False
	:type splitopen: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & shape,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "* Returns True if shape is loaded
	:rtype: bool") IsLoaded;
		Standard_Boolean IsLoaded ();

		/****************** NbClosedFreeBounds ******************/
		%feature("compactdefaultargs") NbClosedFreeBounds;
		%feature("autodoc", "* Returns number of closed free bounds
	:rtype: int") NbClosedFreeBounds;
		Standard_Integer NbClosedFreeBounds ();

		/****************** NbFreeBounds ******************/
		%feature("compactdefaultargs") NbFreeBounds;
		%feature("autodoc", "* Returns number of free bounds
	:rtype: int") NbFreeBounds;
		Standard_Integer NbFreeBounds ();

		/****************** NbOpenFreeBounds ******************/
		%feature("compactdefaultargs") NbOpenFreeBounds;
		%feature("autodoc", "* Returns number of open free bounds
	:rtype: int") NbOpenFreeBounds;
		Standard_Integer NbOpenFreeBounds ();

		/****************** OpenFreeBound ******************/
		%feature("compactdefaultargs") OpenFreeBound;
		%feature("autodoc", "* Returns properties of open free bound specified by its rank number
	:param index:
	:type index: int
	:rtype: opencascade::handle<ShapeAnalysis_FreeBoundData>") OpenFreeBound;
		opencascade::handle<ShapeAnalysis_FreeBoundData> OpenFreeBound (const Standard_Integer index);

		/****************** OpenFreeBounds ******************/
		%feature("compactdefaultargs") OpenFreeBounds;
		%feature("autodoc", "* Returns all open free bounds
	:rtype: opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds>") OpenFreeBounds;
		opencascade::handle<ShapeAnalysis_HSequenceOfFreeBounds> OpenFreeBounds ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Builds and analyzes free bounds of the shape. First calls ShapeAnalysis_FreeBounds for building free bounds. Then on each free bound computes its properties: - area of the contour, - perimeter of the contour, - ratio of average length to average width of the contour, - average width of contour, - notches on the contour and for each notch - maximum width of the notch.
	:rtype: bool") Perform;
		Standard_Boolean Perform ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns shape
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeAnalysis_FreeBoundsProperties ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties ();

		/****************** ShapeAnalysis_FreeBoundsProperties ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "* Creates the object and calls corresponding Init. <shape> should be a compound of faces.
	:param shape:
	:type shape: TopoDS_Shape
	:param tolerance:
	:type tolerance: float
	:param splitclosed: default value is Standard_False
	:type splitclosed: bool
	:param splitopen: default value is Standard_False
	:type splitopen: bool
	:rtype: None") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties (const TopoDS_Shape & shape,const Standard_Real tolerance,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);

		/****************** ShapeAnalysis_FreeBoundsProperties ******************/
		%feature("compactdefaultargs") ShapeAnalysis_FreeBoundsProperties;
		%feature("autodoc", "* Creates the object and calls corresponding Init. <shape> should be a compound of shells.
	:param shape:
	:type shape: TopoDS_Shape
	:param splitclosed: default value is Standard_False
	:type splitclosed: bool
	:param splitopen: default value is Standard_False
	:type splitopen: bool
	:rtype: None") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties (const TopoDS_Shape & shape,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns tolerance
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

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
		%feature("compactdefaultargs") NearestPlane;
		%feature("autodoc", "* Builds a plane out of a set of points in array Returns in <dmax> the maximal distance between the produced plane and given points
	:param Pnts:
	:type Pnts: TColgp_Array1OfPnt
	:param aPln:
	:type aPln: gp_Pln
	:param Dmax:
	:type Dmax: float
	:rtype: bool") NearestPlane;
		static Standard_Boolean NearestPlane (const TColgp_Array1OfPnt & Pnts,gp_Pln & aPln,Standard_Real &OutValue);

		/****************** PositionTrsf ******************/
		%feature("compactdefaultargs") PositionTrsf;
		%feature("autodoc", "* Builds transfromation object out of matrix. Matrix must be 3 x 4. Unit is used as multiplier.
	:param coefs:
	:type coefs: TColStd_HArray2OfReal
	:param trsf:
	:type trsf: gp_Trsf
	:param unit:
	:type unit: float
	:param prec:
	:type prec: float
	:rtype: bool") PositionTrsf;
		static Standard_Boolean PositionTrsf (const opencascade::handle<TColStd_HArray2OfReal> & coefs,gp_Trsf & trsf,const Standard_Real unit,const Standard_Real prec);

};


%extend ShapeAnalysis_Geom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ShapeAnalysis_ShapeContents *
************************************/
%nodefaultctor ShapeAnalysis_ShapeContents;
class ShapeAnalysis_ShapeContents {
	public:
		/****************** BigSplineSec ******************/
		%feature("compactdefaultargs") BigSplineSec;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") BigSplineSec;
		opencascade::handle<TopTools_HSequenceOfShape> BigSplineSec ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears all accumulated statictics
	:rtype: None") Clear;
		void Clear ();

		/****************** ClearFlags ******************/
		%feature("compactdefaultargs") ClearFlags;
		%feature("autodoc", "* Clears all flags
	:rtype: None") ClearFlags;
		void ClearFlags ();

		/****************** IndirectSec ******************/
		%feature("compactdefaultargs") IndirectSec;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") IndirectSec;
		opencascade::handle<TopTools_HSequenceOfShape> IndirectSec ();


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
		%feature("compactdefaultargs") NbBSplibeSurf;
		%feature("autodoc", ":rtype: int") NbBSplibeSurf;
		Standard_Integer NbBSplibeSurf ();

		/****************** NbBezierSurf ******************/
		%feature("compactdefaultargs") NbBezierSurf;
		%feature("autodoc", ":rtype: int") NbBezierSurf;
		Standard_Integer NbBezierSurf ();

		/****************** NbBigSplines ******************/
		%feature("compactdefaultargs") NbBigSplines;
		%feature("autodoc", ":rtype: int") NbBigSplines;
		Standard_Integer NbBigSplines ();

		/****************** NbC0Curves ******************/
		%feature("compactdefaultargs") NbC0Curves;
		%feature("autodoc", ":rtype: int") NbC0Curves;
		Standard_Integer NbC0Curves ();

		/****************** NbC0Surfaces ******************/
		%feature("compactdefaultargs") NbC0Surfaces;
		%feature("autodoc", ":rtype: int") NbC0Surfaces;
		Standard_Integer NbC0Surfaces ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", ":rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** NbFaceWithSevWires ******************/
		%feature("compactdefaultargs") NbFaceWithSevWires;
		%feature("autodoc", ":rtype: int") NbFaceWithSevWires;
		Standard_Integer NbFaceWithSevWires ();

		/****************** NbFaces ******************/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", ":rtype: int") NbFaces;
		Standard_Integer NbFaces ();

		/****************** NbFreeEdges ******************/
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", ":rtype: int") NbFreeEdges;
		Standard_Integer NbFreeEdges ();

		/****************** NbFreeFaces ******************/
		%feature("compactdefaultargs") NbFreeFaces;
		%feature("autodoc", ":rtype: int") NbFreeFaces;
		Standard_Integer NbFreeFaces ();

		/****************** NbFreeWires ******************/
		%feature("compactdefaultargs") NbFreeWires;
		%feature("autodoc", ":rtype: int") NbFreeWires;
		Standard_Integer NbFreeWires ();

		/****************** NbIndirectSurf ******************/
		%feature("compactdefaultargs") NbIndirectSurf;
		%feature("autodoc", ":rtype: int") NbIndirectSurf;
		Standard_Integer NbIndirectSurf ();

		/****************** NbNoPCurve ******************/
		%feature("compactdefaultargs") NbNoPCurve;
		%feature("autodoc", ":rtype: int") NbNoPCurve;
		Standard_Integer NbNoPCurve ();

		/****************** NbOffsetCurves ******************/
		%feature("compactdefaultargs") NbOffsetCurves;
		%feature("autodoc", ":rtype: int") NbOffsetCurves;
		Standard_Integer NbOffsetCurves ();

		/****************** NbOffsetSurf ******************/
		%feature("compactdefaultargs") NbOffsetSurf;
		%feature("autodoc", ":rtype: int") NbOffsetSurf;
		Standard_Integer NbOffsetSurf ();

		/****************** NbSharedEdges ******************/
		%feature("compactdefaultargs") NbSharedEdges;
		%feature("autodoc", ":rtype: int") NbSharedEdges;
		Standard_Integer NbSharedEdges ();

		/****************** NbSharedFaces ******************/
		%feature("compactdefaultargs") NbSharedFaces;
		%feature("autodoc", ":rtype: int") NbSharedFaces;
		Standard_Integer NbSharedFaces ();

		/****************** NbSharedFreeEdges ******************/
		%feature("compactdefaultargs") NbSharedFreeEdges;
		%feature("autodoc", ":rtype: int") NbSharedFreeEdges;
		Standard_Integer NbSharedFreeEdges ();

		/****************** NbSharedFreeWires ******************/
		%feature("compactdefaultargs") NbSharedFreeWires;
		%feature("autodoc", ":rtype: int") NbSharedFreeWires;
		Standard_Integer NbSharedFreeWires ();

		/****************** NbSharedShells ******************/
		%feature("compactdefaultargs") NbSharedShells;
		%feature("autodoc", ":rtype: int") NbSharedShells;
		Standard_Integer NbSharedShells ();

		/****************** NbSharedSolids ******************/
		%feature("compactdefaultargs") NbSharedSolids;
		%feature("autodoc", ":rtype: int") NbSharedSolids;
		Standard_Integer NbSharedSolids ();

		/****************** NbSharedVertices ******************/
		%feature("compactdefaultargs") NbSharedVertices;
		%feature("autodoc", ":rtype: int") NbSharedVertices;
		Standard_Integer NbSharedVertices ();

		/****************** NbSharedWires ******************/
		%feature("compactdefaultargs") NbSharedWires;
		%feature("autodoc", ":rtype: int") NbSharedWires;
		Standard_Integer NbSharedWires ();

		/****************** NbShells ******************/
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", ":rtype: int") NbShells;
		Standard_Integer NbShells ();

		/****************** NbSolids ******************/
		%feature("compactdefaultargs") NbSolids;
		%feature("autodoc", ":rtype: int") NbSolids;
		Standard_Integer NbSolids ();

		/****************** NbSolidsWithVoids ******************/
		%feature("compactdefaultargs") NbSolidsWithVoids;
		%feature("autodoc", ":rtype: int") NbSolidsWithVoids;
		Standard_Integer NbSolidsWithVoids ();

		/****************** NbTrimSurf ******************/
		%feature("compactdefaultargs") NbTrimSurf;
		%feature("autodoc", ":rtype: int") NbTrimSurf;
		Standard_Integer NbTrimSurf ();

		/****************** NbTrimmedCurve2d ******************/
		%feature("compactdefaultargs") NbTrimmedCurve2d;
		%feature("autodoc", ":rtype: int") NbTrimmedCurve2d;
		Standard_Integer NbTrimmedCurve2d ();

		/****************** NbTrimmedCurve3d ******************/
		%feature("compactdefaultargs") NbTrimmedCurve3d;
		%feature("autodoc", ":rtype: int") NbTrimmedCurve3d;
		Standard_Integer NbTrimmedCurve3d ();

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", ":rtype: int") NbVertices;
		Standard_Integer NbVertices ();

		/****************** NbWireWithSevSeams ******************/
		%feature("compactdefaultargs") NbWireWithSevSeams;
		%feature("autodoc", ":rtype: int") NbWireWithSevSeams;
		Standard_Integer NbWireWithSevSeams ();

		/****************** NbWireWitnSeam ******************/
		%feature("compactdefaultargs") NbWireWitnSeam;
		%feature("autodoc", ":rtype: int") NbWireWitnSeam;
		Standard_Integer NbWireWitnSeam ();

		/****************** NbWires ******************/
		%feature("compactdefaultargs") NbWires;
		%feature("autodoc", ":rtype: int") NbWires;
		Standard_Integer NbWires ();

		/****************** OffsetCurveSec ******************/
		%feature("compactdefaultargs") OffsetCurveSec;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") OffsetCurveSec;
		opencascade::handle<TopTools_HSequenceOfShape> OffsetCurveSec ();

		/****************** OffsetSurfaceSec ******************/
		%feature("compactdefaultargs") OffsetSurfaceSec;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") OffsetSurfaceSec;
		opencascade::handle<TopTools_HSequenceOfShape> OffsetSurfaceSec ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Counts quantities of sun-shapes in shape and stores sub-shapes according to flags
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & shape);

		/****************** ShapeAnalysis_ShapeContents ******************/
		%feature("compactdefaultargs") ShapeAnalysis_ShapeContents;
		%feature("autodoc", "* Initialize fields and call ClearFlags()
	:rtype: None") ShapeAnalysis_ShapeContents;
		 ShapeAnalysis_ShapeContents ();

		/****************** Trimmed2dSec ******************/
		%feature("compactdefaultargs") Trimmed2dSec;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") Trimmed2dSec;
		opencascade::handle<TopTools_HSequenceOfShape> Trimmed2dSec ();

		/****************** Trimmed3dSec ******************/
		%feature("compactdefaultargs") Trimmed3dSec;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") Trimmed3dSec;
		opencascade::handle<TopTools_HSequenceOfShape> Trimmed3dSec ();

};


%extend ShapeAnalysis_ShapeContents {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeAnalysis_ShapeTolerance *
*************************************/
%nodefaultctor ShapeAnalysis_ShapeTolerance;
class ShapeAnalysis_ShapeTolerance {
	public:
		/****************** AddTolerance ******************/
		%feature("compactdefaultargs") AddTolerance;
		%feature("autodoc", "* Adds data on new Shape to compute Cumulated Tolerance (prepares three computations : maximal, average, minimal)
	:param shape:
	:type shape: TopoDS_Shape
	:param type: default value is TopAbs_SHAPE
	:type type: TopAbs_ShapeEnum
	:rtype: None") AddTolerance;
		void AddTolerance (const TopoDS_Shape & shape,const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****************** GlobalTolerance ******************/
		%feature("compactdefaultargs") GlobalTolerance;
		%feature("autodoc", "* Returns the computed tolerance according to the <mode> <mode> = 0 : average <mode> > 0 : maximal <mode> < 0 : minimal
	:param mode:
	:type mode: int
	:rtype: float") GlobalTolerance;
		Standard_Real GlobalTolerance (const Standard_Integer mode);

		/****************** InTolerance ******************/
		%feature("compactdefaultargs") InTolerance;
		%feature("autodoc", "* Determines which shapes have a tolerance within a given interval <type> is interpreted as in the method Tolerance
	:param shape:
	:type shape: TopoDS_Shape
	:param valmin:
	:type valmin: float
	:param valmax:
	:type valmax: float
	:param type: default value is TopAbs_SHAPE
	:type type: TopAbs_ShapeEnum
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") InTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> InTolerance (const TopoDS_Shape & shape,const Standard_Real valmin,const Standard_Real valmax,const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****************** InitTolerance ******************/
		%feature("compactdefaultargs") InitTolerance;
		%feature("autodoc", "* Initializes computation of cumulated tolerance
	:rtype: None") InitTolerance;
		void InitTolerance ();

		/****************** OverTolerance ******************/
		%feature("compactdefaultargs") OverTolerance;
		%feature("autodoc", "* Determines which shapes have a tolerance over the given value <type> is interpreted as in the method Tolerance
	:param shape:
	:type shape: TopoDS_Shape
	:param value:
	:type value: float
	:param type: default value is TopAbs_SHAPE
	:type type: TopAbs_ShapeEnum
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") OverTolerance;
		opencascade::handle<TopTools_HSequenceOfShape> OverTolerance (const TopoDS_Shape & shape,const Standard_Real value,const TopAbs_ShapeEnum type = TopAbs_SHAPE);

		/****************** ShapeAnalysis_ShapeTolerance ******************/
		%feature("compactdefaultargs") ShapeAnalysis_ShapeTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAnalysis_ShapeTolerance;
		 ShapeAnalysis_ShapeTolerance ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Determines a tolerance from the ones stored in a shape Remark : calls InitTolerance and AddTolerance, hence, can be used to start a series for cumulating tolerance <mode> = 0 : returns the average value between sub-shapes, <mode> > 0 : returns the maximal found, <mode> < 0 : returns the minimal found. <type> defines what kinds of sub-shapes to consider: SHAPE (default) : all : VERTEX, EDGE, FACE, VERTEX : only vertices, EDGE : only edges, FACE : only faces, SHELL : combined SHELL + FACE, for each face (and containing shell), also checks EDGE and VERTEX
	:param shape:
	:type shape: TopoDS_Shape
	:param mode:
	:type mode: int
	:param type: default value is TopAbs_SHAPE
	:type type: TopAbs_ShapeEnum
	:rtype: float") Tolerance;
		Standard_Real Tolerance (const TopoDS_Shape & shape,const Standard_Integer mode,const TopAbs_ShapeEnum type = TopAbs_SHAPE);

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
		%feature("compactdefaultargs") BadEdges;
		%feature("autodoc", "* Returns the list of bad edges as a Compound It is empty (not null) if no edge are recorded as bad
	:rtype: TopoDS_Compound") BadEdges;
		TopoDS_Compound BadEdges ();

		/****************** CheckOrientedShells ******************/
		%feature("compactdefaultargs") CheckOrientedShells;
		%feature("autodoc", "* Checks if shells fulfill orientation condition, i.e. if each edge is, either present once (free edge) or twice (connected edge) but with different orientations (FORWARD/REVERSED) Edges which do not fulfill these conditions are bad //! If <alsofree> is True free edges are considered. Free edges can be queried but are not bad
	:param shape:
	:type shape: TopoDS_Shape
	:param alsofree: default value is Standard_False
	:type alsofree: bool
	:param checkinternaledges: default value is Standard_False
	:type checkinternaledges: bool
	:rtype: bool") CheckOrientedShells;
		Standard_Boolean CheckOrientedShells (const TopoDS_Shape & shape,const Standard_Boolean alsofree = Standard_False,const Standard_Boolean checkinternaledges = Standard_False);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears data about loaded shells and performed checks
	:rtype: None") Clear;
		void Clear ();

		/****************** FreeEdges ******************/
		%feature("compactdefaultargs") FreeEdges;
		%feature("autodoc", "* Returns the list of free (not connected) edges as a Compound It is empty (not null) if no edge are recorded as free
	:rtype: TopoDS_Compound") FreeEdges;
		TopoDS_Compound FreeEdges ();

		/****************** HasBadEdges ******************/
		%feature("compactdefaultargs") HasBadEdges;
		%feature("autodoc", "* Tells if at least one edge is recorded as bad
	:rtype: bool") HasBadEdges;
		Standard_Boolean HasBadEdges ();

		/****************** HasConnectedEdges ******************/
		%feature("compactdefaultargs") HasConnectedEdges;
		%feature("autodoc", "* Tells if at least one edge is connected (shared twice or more)
	:rtype: bool") HasConnectedEdges;
		Standard_Boolean HasConnectedEdges ();

		/****************** HasFreeEdges ******************/
		%feature("compactdefaultargs") HasFreeEdges;
		%feature("autodoc", "* Tells if at least one edge is recorded as free (not connected)
	:rtype: bool") HasFreeEdges;
		Standard_Boolean HasFreeEdges ();

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "* Tells if a shape is loaded (only shells are checked)
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: bool") IsLoaded;
		Standard_Boolean IsLoaded (const TopoDS_Shape & shape);

		/****************** LoadShells ******************/
		%feature("compactdefaultargs") LoadShells;
		%feature("autodoc", "* Adds shells contained in the <shape> to the list of loaded shells
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: None") LoadShells;
		void LoadShells (const TopoDS_Shape & shape);

		/****************** Loaded ******************/
		%feature("compactdefaultargs") Loaded;
		%feature("autodoc", "* Returns a loaded shape specified by its rank number. Returns null shape if <num> is out of range
	:param num:
	:type num: int
	:rtype: TopoDS_Shape") Loaded;
		TopoDS_Shape Loaded (const Standard_Integer num);

		/****************** NbLoaded ******************/
		%feature("compactdefaultargs") NbLoaded;
		%feature("autodoc", "* Returns the actual number of loaded shapes (i.e. shells)
	:rtype: int") NbLoaded;
		Standard_Integer NbLoaded ();

};


%extend ShapeAnalysis_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ShapeAnalysis_Surface *
******************************/
%nodefaultctor ShapeAnalysis_Surface;
class ShapeAnalysis_Surface : public Standard_Transient {
	public:
		/****************** Adaptor3d ******************/
		%feature("compactdefaultargs") Adaptor3d;
		%feature("autodoc", "* Returns the Adaptor. Creates it if not yet done.
	:rtype: opencascade::handle<GeomAdaptor_HSurface>") Adaptor3d;
		const opencascade::handle<GeomAdaptor_HSurface> & Adaptor3d ();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* Returns the bounds of the surface (from Bounds from Surface, but buffered)
	:param ufirst:
	:type ufirst: float
	:param ulast:
	:type ulast: float
	:param vfirst:
	:type vfirst: float
	:param vlast:
	:type vlast: float
	:rtype: None") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ComputeBoundIsos ******************/
		%feature("compactdefaultargs") ComputeBoundIsos;
		%feature("autodoc", "* Computes bound isos (protected against exceptions)
	:rtype: None") ComputeBoundIsos;
		void ComputeBoundIsos ();

		/****************** DegeneratedValues ******************/
		%feature("compactdefaultargs") DegeneratedValues;
		%feature("autodoc", "* Returns True if there is at least one surface iso-line which is considered as degenerated with <preci> and distance between P3d and corresponding singular point is less than <preci> (like IsDegenerated). Returns characteristics of the first found boundary matching those criteria.
	:param P3d:
	:type P3d: gp_Pnt
	:param preci:
	:type preci: float
	:param firstP2d:
	:type firstP2d: gp_Pnt2d
	:param lastP2d:
	:type lastP2d: gp_Pnt2d
	:param firstpar:
	:type firstpar: float
	:param lastpar:
	:type lastpar: float
	:param forward: default value is Standard_True
	:type forward: bool
	:rtype: bool") DegeneratedValues;
		Standard_Boolean DegeneratedValues (const gp_Pnt & P3d,const Standard_Real preci,gp_Pnt2d & firstP2d,gp_Pnt2d & lastP2d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean forward = Standard_True);

		/****************** Gap ******************/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "* Returns 3D distance found by one of the following methods. IsDegenerated, DegeneratedValues, ProjectDegenerated (distance between 3D point and found or last (if not found) singularity), IsUClosed, IsVClosed (minimum value of precision to consider the surface to be closed), ValueOfUV (distance between 3D point and found solution).
	:rtype: float") Gap;
		Standard_Real Gap ();

		/****************** GetBoxUF ******************/
		%feature("compactdefaultargs") GetBoxUF;
		%feature("autodoc", ":rtype: Bnd_Box") GetBoxUF;
		const Bnd_Box & GetBoxUF ();

		/****************** GetBoxUL ******************/
		%feature("compactdefaultargs") GetBoxUL;
		%feature("autodoc", ":rtype: Bnd_Box") GetBoxUL;
		const Bnd_Box & GetBoxUL ();

		/****************** GetBoxVF ******************/
		%feature("compactdefaultargs") GetBoxVF;
		%feature("autodoc", ":rtype: Bnd_Box") GetBoxVF;
		const Bnd_Box & GetBoxVF ();

		/****************** GetBoxVL ******************/
		%feature("compactdefaultargs") GetBoxVL;
		%feature("autodoc", ":rtype: Bnd_Box") GetBoxVL;
		const Bnd_Box & GetBoxVL ();

		/****************** HasSingularities ******************/
		%feature("compactdefaultargs") HasSingularities;
		%feature("autodoc", "* Returns True if the surface has singularities for the given precision (i.e. if there are surface singularities with sizes not greater than precision).
	:param preci:
	:type preci: float
	:rtype: bool") HasSingularities;
		Standard_Boolean HasSingularities (const Standard_Real preci);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Loads existing surface
	:param S:
	:type S: Geom_Surface
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom_Surface> & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Reads all the data from another Surface, without recomputing
	:param other:
	:type other: ShapeAnalysis_Surface
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeAnalysis_Surface> & other);

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "* Returns True if there is at least one surface boundary which is considered as degenerated with <preci> and distance between P3d and corresponding singular point is less than <preci>
	:param P3d:
	:type P3d: gp_Pnt
	:param preci:
	:type preci: float
	:rtype: bool") IsDegenerated;
		Standard_Boolean IsDegenerated (const gp_Pnt & P3d,const Standard_Real preci);

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "* Returns True if straight pcurve going from point p2d1 to p2d2 is degenerate, i.e. lies in the singularity of the surface. NOTE: it uses another method of detecting singularity than used by ComputeSingularities() et al.! For that, maximums of distances between points p2d1, p2d2 and 0.5*(p2d1+p2d2) and between corresponding 3d points are computed. The pcurve (p2d1, p2d2) is considered as degenerate if: - max distance in 3d is less than <tol> - max distance in 2d is at least <ratio> times greather than the Resolution computed from max distance in 3d (max3d < tol && max2d > ratio * Resolution(max3d)) NOTE: <ratio> should be >1 (e.g. 10)
	:param p2d1:
	:type p2d1: gp_Pnt2d
	:param p2d2:
	:type p2d2: gp_Pnt2d
	:param tol:
	:type tol: float
	:param ratio:
	:type ratio: float
	:rtype: bool") IsDegenerated;
		Standard_Boolean IsDegenerated (const gp_Pnt2d & p2d1,const gp_Pnt2d & p2d2,const Standard_Real tol,const Standard_Real ratio);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "* Tells if the Surface is spatially closed in U with given precision. If <preci> < 0 then Precision::Confusion is used. If Geom_Surface says that the surface is U-closed, this method also says this. Otherwise additional analysis is performed, comparing given precision with the following distances: - periodic B-Splines are closed, - polinomial B-Spline with boundary multiplicities degree+1 and Bezier - maximum distance between poles, - rational B-Spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of extrusion - distance between ends of basis curve, - other (RectangularTrimmed and Offset) - maximum distance computed at 100 equi-distanted points.
	:param preci: default value is -1
	:type preci: float
	:rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed (const Standard_Real preci = -1);

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "* Tells if the Surface is spatially closed in V with given precision. If <preci> < 0 then Precision::Confusion is used. If Geom_Surface says that the surface is V-closed, this method also says this. Otherwise additional analysis is performed, comparing given precision with the following distances: - periodic B-Splines are closed, - polinomial B-Spline with boundary multiplicities degree+1 and Bezier - maximum distance between poles, - rational B-Spline or one with boundary multiplicities not degree+1 - maximum distance computed at knots and their middles, - surface of revolution - distance between ends of basis curve, - other (RectangularTrimmed and Offset) - maximum distance computed at 100 equi-distanted points.
	:param preci: default value is -1
	:type preci: float
	:rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed (const Standard_Real preci = -1);

		/****************** NbSingularities ******************/
		%feature("compactdefaultargs") NbSingularities;
		%feature("autodoc", "* Returns the number of singularities for the given precision (i.e. number of surface singularities with sizes not greater than precision).
	:param preci:
	:type preci: float
	:rtype: int") NbSingularities;
		Standard_Integer NbSingularities (const Standard_Real preci);

		/****************** NextValueOfUV ******************/
		%feature("compactdefaultargs") NextValueOfUV;
		%feature("autodoc", "* Projects a point P3D on the surface. Does the same thing as ValueOfUV but tries to optimize computations by taking into account previous point <p2dPrev>: makes a step by UV and tries Newton algorithm. If <maxpreci> >0. and distance between solution and P3D is greater than <maxpreci>, that solution is considered as bad, and ValueOfUV() is used. If not succeded, calls ValueOfUV()
	:param p2dPrev:
	:type p2dPrev: gp_Pnt2d
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param maxpreci: default value is -1.0
	:type maxpreci: float
	:rtype: gp_Pnt2d") NextValueOfUV;
		gp_Pnt2d NextValueOfUV (const gp_Pnt2d & p2dPrev,const gp_Pnt & P3D,const Standard_Real preci,const Standard_Real maxpreci = -1.0);

		/****************** ProjectDegenerated ******************/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "* Projects a point <P3d> on a singularity by computing one of the coordinates of preliminary computed <result>. //! Finds the iso-line which is considered as degenerated with <preci> and a. distance between P3d and corresponding singular point is less than <preci> (like IsDegenerated) or b. difference between already computed <result>'s coordinate and iso-coordinate of the boundary is less than 2D resolution (computed from <preci> by Geom_Adaptor). Then sets not yet computed <result>'s coordinate taking it from <neighbour> and returns True.
	:param P3d:
	:type P3d: gp_Pnt
	:param preci:
	:type preci: float
	:param neighbour:
	:type neighbour: gp_Pnt2d
	:param result:
	:type result: gp_Pnt2d
	:rtype: bool") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated (const gp_Pnt & P3d,const Standard_Real preci,const gp_Pnt2d & neighbour,gp_Pnt2d & result);

		/****************** ProjectDegenerated ******************/
		%feature("compactdefaultargs") ProjectDegenerated;
		%feature("autodoc", "* Checks points at the beginning (direct is True) or end (direct is False) of array <points> to lie in singularity of surface, and if yes, adjusts the indeterminate 2d coordinate of these points by nearest point which is not in singularity. Returns True if some points were adjusted.
	:param nbrPnt:
	:type nbrPnt: int
	:param points:
	:type points: TColgp_SequenceOfPnt
	:param pnt2d:
	:type pnt2d: TColgp_SequenceOfPnt2d
	:param preci:
	:type preci: float
	:param direct:
	:type direct: bool
	:rtype: bool") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated (const Standard_Integer nbrPnt,const TColgp_SequenceOfPnt & points,TColgp_SequenceOfPnt2d & pnt2d,const Standard_Real preci,const Standard_Boolean direct);

		/****************** SetDomain ******************/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", ":param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None") SetDomain;
		void SetDomain (const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);

		/****************** ShapeAnalysis_Surface ******************/
		%feature("compactdefaultargs") ShapeAnalysis_Surface;
		%feature("autodoc", "* Creates an analyzer object on the basis of existing surface
	:param S:
	:type S: Geom_Surface
	:rtype: None") ShapeAnalysis_Surface;
		 ShapeAnalysis_Surface (const opencascade::handle<Geom_Surface> & S);

		/****************** Singularity ******************/
		%feature("compactdefaultargs") Singularity;
		%feature("autodoc", "* Returns the characteristics of the singularity specified by its rank number <num>. That means, that it is not neccessary for <num> to be in the range [1, NbSingularities] but must be not greater than possible (see ComputeSingularities). The returned characteristics are: preci: the smallest precision with which the iso-line is considered as degenerated, P3d: 3D point of singularity (middle point of the surface iso-line), firstP2d and lastP2d: first and last 2D points of the iso-line in parametrical surface, firstpar and lastpar: first and last parameters of the iso-line in parametrical surface, uisodeg: if the degenerated iso-line is U-iso (True) or V-iso (False). Returns False if <num> is out of range, else returns True.
	:param num:
	:type num: int
	:param preci:
	:type preci: float
	:param P3d:
	:type P3d: gp_Pnt
	:param firstP2d:
	:type firstP2d: gp_Pnt2d
	:param lastP2d:
	:type lastP2d: gp_Pnt2d
	:param firstpar:
	:type firstpar: float
	:param lastpar:
	:type lastpar: float
	:param uisodeg:
	:type uisodeg: bool
	:rtype: bool") Singularity;
		Standard_Boolean Singularity (const Standard_Integer num,Standard_Real &OutValue,gp_Pnt & P3d,gp_Pnt2d & firstP2d,gp_Pnt2d & lastP2d,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean &OutValue);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns a surface being analyzed
	:rtype: opencascade::handle<Geom_Surface>") Surface;
		const opencascade::handle<Geom_Surface> & Surface ();

		/****************** TrueAdaptor3d ******************/
		%feature("compactdefaultargs") TrueAdaptor3d;
		%feature("autodoc", "* Returns the Adaptor (may be Null if method Adaptor() was not called)
	:rtype: opencascade::handle<GeomAdaptor_HSurface>") TrueAdaptor3d;
		const opencascade::handle<GeomAdaptor_HSurface> & TrueAdaptor3d ();

		/****************** UCloseVal ******************/
		%feature("compactdefaultargs") UCloseVal;
		%feature("autodoc", "* Returns minimum value to consider the surface as U-closed
	:rtype: float") UCloseVal;
		Standard_Real UCloseVal ();

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "* Returns a U-Iso. Null if not possible or failed Remark : bound isos are buffered
	:param U:
	:type U: float
	:rtype: opencascade::handle<Geom_Curve>") UIso;
		opencascade::handle<Geom_Curve> UIso (const Standard_Real U);

		/****************** UVFromIso ******************/
		%feature("compactdefaultargs") UVFromIso;
		%feature("autodoc", "* Tries a refinement of an already computed couple (U,V) by using projecting 3D point on iso-lines: 1. boundaries of the surface, 2. iso-lines passing through (U,V) 3. iteratively received iso-lines passing through new U and new V (number of iterations is limited by 5 in each direction) Returns the best resulting distance between P3D and Value(U,V) in the case of success. Else, returns a very great value
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: float") UVFromIso;
		Standard_Real UVFromIso (const gp_Pnt & P3D,const Standard_Real preci,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** VCloseVal ******************/
		%feature("compactdefaultargs") VCloseVal;
		%feature("autodoc", "* Returns minimum value to consider the surface as V-closed
	:rtype: float") VCloseVal;
		Standard_Real VCloseVal ();

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "* Returns a V-Iso. Null if not possible or failed Remark : bound isos are buffered
	:param V:
	:type V: float
	:rtype: opencascade::handle<Geom_Curve>") VIso;
		opencascade::handle<Geom_Curve> VIso (const Standard_Real V);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns a 3D point specified by parameters in surface parametrical space
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real u,const Standard_Real v);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns a 3d point specified by a point in surface parametrical space
	:param p2d:
	:type p2d: gp_Pnt2d
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const gp_Pnt2d & p2d);

		/****************** ValueOfUV ******************/
		%feature("compactdefaultargs") ValueOfUV;
		%feature("autodoc", "* Computes the parameters in the surface parametrical space of 3D point. The result is parameters of the point projected onto the surface. This method enhances functionality provided by the standard tool GeomAPI_ProjectPointOnSurface by treatment of cases when the projected point is near to the surface boundaries and when this standard tool fails.
	:param P3D:
	:type P3D: gp_Pnt
	:param preci:
	:type preci: float
	:rtype: gp_Pnt2d") ValueOfUV;
		gp_Pnt2d ValueOfUV (const gp_Pnt & P3D,const Standard_Real preci);

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
%nodefaultctor ShapeAnalysis_TransferParameters;
class ShapeAnalysis_TransferParameters : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize a tool with edge and face
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: void") Init;
		virtual void Init (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** IsSameRange ******************/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "* Returns True if 3d curve of edge and pcurve are SameRange (in default implementation, if myScale == 1 and myShift == 0)
	:rtype: bool") IsSameRange;
		virtual Standard_Boolean IsSameRange ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Transfers parameters given by sequence Params from 3d curve to pcurve (if To2d is True) or back (if To2d is False)
	:param Params:
	:type Params: TColStd_HSequenceOfReal
	:param To2d:
	:type To2d: bool
	:rtype: opencascade::handle<TColStd_HSequenceOfReal>") Perform;
		virtual opencascade::handle<TColStd_HSequenceOfReal> Perform (const opencascade::handle<TColStd_HSequenceOfReal> & Params,const Standard_Boolean To2d);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Transfers parameter given by sequence Params from 3d curve to pcurve (if To2d is True) or back (if To2d is False)
	:param Param:
	:type Param: float
	:param To2d:
	:type To2d: bool
	:rtype: float") Perform;
		virtual Standard_Real Perform (const Standard_Real Param,const Standard_Boolean To2d);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal tolerance to use linear recomputation of parameters.
	:param maxtol:
	:type maxtol: float
	:rtype: None") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);

		/****************** ShapeAnalysis_TransferParameters ******************/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParameters;
		%feature("autodoc", "* Creates empty tool with myShift = 0 and myScale = 1
	:rtype: None") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters ();

		/****************** ShapeAnalysis_TransferParameters ******************/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParameters;
		%feature("autodoc", "* Creates a tool and initializes it with edge and face
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** TransferRange ******************/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "* Recomputes range of curves from NewEdge. If Is2d equals True parameters are recomputed by curve2d else by curve3d.
	:param newEdge:
	:type newEdge: TopoDS_Edge
	:param prevPar:
	:type prevPar: float
	:param currPar:
	:type currPar: float
	:param To2d:
	:type To2d: bool
	:rtype: void") TransferRange;
		virtual void TransferRange (TopoDS_Edge & newEdge,const Standard_Real prevPar,const Standard_Real currPar,const Standard_Boolean To2d);

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
%nodefaultctor ShapeAnalysis_Wire;
class ShapeAnalysis_Wire : public Standard_Transient {
	public:
		/****************** CheckClosed ******************/
		%feature("compactdefaultargs") CheckClosed;
		%feature("autodoc", "* Checks if wire is closed, performs CheckConnected, CheckDegenerated and CheckLacking for the first and the last edges Returns: True if at least one check returned True Status: FAIL1 or DONE1: see CheckConnected FAIL2 or DONE2: see CheckDegenerated
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckClosed;
		Standard_Boolean CheckClosed (const Standard_Real prec = 0.0);

		/****************** CheckConnected ******************/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "* Calls to CheckConnected for each edge Returns: True if at least one pair of disconnected edges (not sharing the same vertex) was detected
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckConnected;
		Standard_Boolean CheckConnected (const Standard_Real prec = 0.0);

		/****************** CheckConnected ******************/
		%feature("compactdefaultargs") CheckConnected;
		%feature("autodoc", "* Checks connected edges (num-th and preceeding). Tests with starting preci from <SBWD> or with <prec> if it is greater. Considers Vertices. Returns: False if edges are connected by the common vertex, else True Status : OK : Vertices (end of num-1 th edge and start on num-th one) are already the same DONE1 : Absolutely confused (gp::Resolution) DONE2 : Confused at starting <preci> from <SBWD> DONE3 : Confused at <prec> but not <preci> FAIL1 : Not confused FAIL2 : Not confused but confused with <preci> if reverse num-th edge
	:param num:
	:type num: int
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckConnected;
		Standard_Boolean CheckConnected (const Standard_Integer num,const Standard_Real prec = 0.0);

		/****************** CheckCurveGap ******************/
		%feature("compactdefaultargs") CheckCurveGap;
		%feature("autodoc", "* Checks gap between points on 3D curve and points on surface generated by pcurve of the num-th edge. The distance can be queried by MinDistance3d. //! Returns: True if status is DONE Status: OK : Gap is less than myPrecision DONE : Gap is greater than myPrecision FAIL : No 3d curve(s) on the edge(s)
	:param num: default value is 0
	:type num: int
	:rtype: bool") CheckCurveGap;
		Standard_Boolean CheckCurveGap (const Standard_Integer num = 0);

		/****************** CheckCurveGaps ******************/
		%feature("compactdefaultargs") CheckCurveGaps;
		%feature("autodoc", ":rtype: bool") CheckCurveGaps;
		Standard_Boolean CheckCurveGaps ();

		/****************** CheckDegenerated ******************/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "* Calls to CheckDegenerated for each edge Returns: True if at least one incorrect degenerated edge was detected
	:rtype: bool") CheckDegenerated;
		Standard_Boolean CheckDegenerated ();

		/****************** CheckDegenerated ******************/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "* Checks for degenerated edge between two adjacent ones. Fills parameters dgnr1 and dgnr2 with points in paramterical space that correspond to the singularity (either gap that needs to be filled by degenerated edge or that already filled) Returns: False if no singularity or edge is already degenerated, otherwise True Status: OK : No surface singularity, or edge is already degenerated DONE1: Degenerated edge should be inserted (gap in 2D) DONE2: Edge <num> should be made degenerated (recompute pcurve and set the flag) FAIL1: One of edges neighbouring to degenerated one has no pcurve FAIL2: Edge marked as degenerated and has no pcurve but singularity is not detected
	:param num:
	:type num: int
	:param dgnr1:
	:type dgnr1: gp_Pnt2d
	:param dgnr2:
	:type dgnr2: gp_Pnt2d
	:rtype: bool") CheckDegenerated;
		Standard_Boolean CheckDegenerated (const Standard_Integer num,gp_Pnt2d & dgnr1,gp_Pnt2d & dgnr2);

		/****************** CheckDegenerated ******************/
		%feature("compactdefaultargs") CheckDegenerated;
		%feature("autodoc", "* Checks for degenerated edge between two adjacent ones. Remark : Calls previous function Status : See the function above for details
	:param num:
	:type num: int
	:rtype: bool") CheckDegenerated;
		Standard_Boolean CheckDegenerated (const Standard_Integer num);

		/****************** CheckEdgeCurves ******************/
		%feature("compactdefaultargs") CheckEdgeCurves;
		%feature("autodoc", "* Checks edges geometry (consitency of 2d and 3d senses, adjasment of curves to the vertices, etc.). The order of the checks : Call ShapeAnalysis_Wire to check: ShapeAnalysis_Edge::CheckCurve3dWithPCurve (1), ShapeAnalysis_Edge::CheckVertcesWithPCurve (2), ShapeAnalysis_Edge::CheckVertcesWithCurve3d (3), CheckSeam   (4) Additional: CheckGap3d  (5), CheckGap2d  (6), ShapeAnalysis_Edge::CheckSameParameter (7) Returns: True if at least one check returned True Remark: The numbers in brackets show with what DONEi or FAILi the status can be queried
	:rtype: bool") CheckEdgeCurves;
		Standard_Boolean CheckEdgeCurves ();

		/****************** CheckGap2d ******************/
		%feature("compactdefaultargs") CheckGap2d;
		%feature("autodoc", "* Checks gap between edges in 2D (pcurves). Checks the distance between ends of pcurves of the num-th and preceeding edge. The distance can be queried by MinDistance2d. //! Returns: True if status is DONE Status: OK : Gap is less than parametric precision out of myPrecision DONE : Gap is greater than parametric precision out of myPrecision FAIL : No pcurve(s) on the edge(s)
	:param num: default value is 0
	:type num: int
	:rtype: bool") CheckGap2d;
		Standard_Boolean CheckGap2d (const Standard_Integer num = 0);

		/****************** CheckGap3d ******************/
		%feature("compactdefaultargs") CheckGap3d;
		%feature("autodoc", "* Checks gap between edges in 3D (3d curves). Checks the distance between ends of 3d curves of the num-th and preceeding edge. The distance can be queried by MinDistance3d. //! Returns: True if status is DONE Status: OK : Gap is less than myPrecision DONE : Gap is greater than myPrecision FAIL : No 3d curve(s) on the edge(s)
	:param num: default value is 0
	:type num: int
	:rtype: bool") CheckGap3d;
		Standard_Boolean CheckGap3d (const Standard_Integer num = 0);

		/****************** CheckGaps2d ******************/
		%feature("compactdefaultargs") CheckGaps2d;
		%feature("autodoc", ":rtype: bool") CheckGaps2d;
		Standard_Boolean CheckGaps2d ();

		/****************** CheckGaps3d ******************/
		%feature("compactdefaultargs") CheckGaps3d;
		%feature("autodoc", ":rtype: bool") CheckGaps3d;
		Standard_Boolean CheckGaps3d ();

		/****************** CheckIntersectingEdges ******************/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "* Checks two adjacent edges for intersecting. Intersection is reported only if intersection point is not enclosed by the common end vertex of the edges. Returns: True if intersection is found. If returns True it also fills the sequences of intersection points, corresponding 3d points, and errors for them (half-distances between intersection points in 3d calculated from one and from another edge) Status: FAIL1 : No pcurve FAIL2 : No vertices DONE1 : Self-intersection found
	:param num:
	:type num: int
	:param points2d:
	:type points2d: IntRes2d_SequenceOfIntersectionPoint
	:param points3d:
	:type points3d: TColgp_SequenceOfPnt
	:param errors:
	:type errors: TColStd_SequenceOfReal
	:rtype: bool") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num,IntRes2d_SequenceOfIntersectionPoint & points2d,TColgp_SequenceOfPnt & points3d,TColStd_SequenceOfReal & errors);

		/****************** CheckIntersectingEdges ******************/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "* Checks two adjacent edges for intersecting. Remark : Calls the previous method Status : See the function above for details
	:param num:
	:type num: int
	:rtype: bool") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num);

		/****************** CheckIntersectingEdges ******************/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "* Checks i-th and j-th edges for intersecting. Remark : See the previous method for details
	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:param points2d:
	:type points2d: IntRes2d_SequenceOfIntersectionPoint
	:param points3d:
	:type points3d: TColgp_SequenceOfPnt
	:param errors:
	:type errors: TColStd_SequenceOfReal
	:rtype: bool") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num1,const Standard_Integer num2,IntRes2d_SequenceOfIntersectionPoint & points2d,TColgp_SequenceOfPnt & points3d,TColStd_SequenceOfReal & errors);

		/****************** CheckIntersectingEdges ******************/
		%feature("compactdefaultargs") CheckIntersectingEdges;
		%feature("autodoc", "* Checks i-th and j-th edges for intersecting. Remark : Calls previous method. Status : See the function above for details
	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: bool") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num1,const Standard_Integer num2);

		/****************** CheckLacking ******************/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "* Calls to CheckLacking for each edge Returns: True if at least one lacking edge was detected
	:rtype: bool") CheckLacking;
		Standard_Boolean CheckLacking ();

		/****************** CheckLacking ******************/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "* Checks if there is a gap in 2d between edges, not comprised by the tolerance of their common vertex. If <Tolerance> is greater than 0. and less than tolerance of the vertex, then this value is used for check. Returns: True if not closed gap was detected p2d1 and p2d2 are the endpoint of <num-1>th edge and start of the <num>th edge in 2d. Status: OK: No edge is lacking (3d and 2d connection) FAIL1: edges have no vertices (at least one of them) FAIL2: edges are neither connected by common vertex, nor have coincided vertices FAIL1: edges have no pcurves DONE1: the gap is detected which cannot be closed by the tolerance of the common vertex (or with value of <Tolerance>) DONE2: is set (together with DONE1) if gap is detected and the vector (p2d2 - p2d1) goes in direction opposite to the pcurves of the edges (if angle is more than 0.9*PI).
	:param num:
	:type num: int
	:param Tolerance:
	:type Tolerance: float
	:param p2d1:
	:type p2d1: gp_Pnt2d
	:param p2d2:
	:type p2d2: gp_Pnt2d
	:rtype: bool") CheckLacking;
		Standard_Boolean CheckLacking (const Standard_Integer num,const Standard_Real Tolerance,gp_Pnt2d & p2d1,gp_Pnt2d & p2d2);

		/****************** CheckLacking ******************/
		%feature("compactdefaultargs") CheckLacking;
		%feature("autodoc", "* Checks if there is a gap in 2D between edges and not comprised by vertex tolerance The value of SBWD.thepreci is used. Returns: False if no edge should be inserted Status: OK : No edge is lacking (3d and 2d connection) DONE1 : The vertex tolerance should be increased only (2d gap is small) DONE2 : Edge can be inserted (3d and 2d gaps are large enough)
	:param num:
	:type num: int
	:param Tolerance: default value is 0.0
	:type Tolerance: float
	:rtype: bool") CheckLacking;
		Standard_Boolean CheckLacking (const Standard_Integer num,const Standard_Real Tolerance = 0.0);

		/****************** CheckLoop ******************/
		%feature("compactdefaultargs") CheckLoop;
		%feature("autodoc", "* Checks existance of loop on wire and return vertices wich are loop vertices (vertices belonging to a few pairs of edges)
	:param aMapLoopVertices:
	:type aMapLoopVertices: TopTools_IndexedMapOfShape
	:param aMapVertexEdges:
	:type aMapVertexEdges: TopTools_DataMapOfShapeListOfShape
	:param aMapSmallEdges:
	:type aMapSmallEdges: TopTools_MapOfShape
	:param aMapSeemEdges:
	:type aMapSeemEdges: TopTools_MapOfShape
	:rtype: bool") CheckLoop;
		Standard_Boolean CheckLoop (TopTools_IndexedMapOfShape & aMapLoopVertices,TopTools_DataMapOfShapeListOfShape & aMapVertexEdges,TopTools_MapOfShape & aMapSmallEdges,TopTools_MapOfShape & aMapSeemEdges);

		/****************** CheckNotchedEdges ******************/
		%feature("compactdefaultargs") CheckNotchedEdges;
		%feature("autodoc", "* Detects a notch
	:param num:
	:type num: int
	:param shortNum:
	:type shortNum: int
	:param param:
	:type param: float
	:param Tolerance: default value is 0.0
	:type Tolerance: float
	:rtype: bool") CheckNotchedEdges;
		Standard_Boolean CheckNotchedEdges (const Standard_Integer num,Standard_Integer &OutValue,Standard_Real &OutValue,const Standard_Real Tolerance = 0.0);

		/****************** CheckOrder ******************/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "* Calls CheckOrder and returns False if wire is already ordered (tail-to-head), True otherwise Flag <isClosed> defines if the wire is closed or not Flag <mode3d> defines which mode is used (3d or 2d)
	:param isClosed: default value is Standard_True
	:type isClosed: bool
	:param mode3d: default value is Standard_True
	:type mode3d: bool
	:rtype: bool") CheckOrder;
		Standard_Boolean CheckOrder (const Standard_Boolean isClosed = Standard_True,const Standard_Boolean mode3d = Standard_True);

		/****************** CheckOrder ******************/
		%feature("compactdefaultargs") CheckOrder;
		%feature("autodoc", "* Analyzes the order of the edges in the wire, uses class WireOrder for that purpose. Flag <isClosed> defines if the wire is closed or not Flag <mode3d> defines which mode is used (3d or 2d) Returns False if wire is already ordered (tail-to-head), True otherwise. Use returned WireOrder object for deeper analysis. Status: OK : the same edges orientation, the same edges sequence DONE1: the same edges orientation, not the same edges sequence DONE2: as DONE1 and gaps more than myPrecision DONE3: not the same edges orientation (some need to be reversed) DONE4: as DONE3 and gaps more than myPrecision FAIL : algorithm failed (could not detect order)
	:param sawo:
	:type sawo: ShapeAnalysis_WireOrder
	:param isClosed: default value is Standard_True
	:type isClosed: bool
	:param mode3d: default value is Standard_True
	:type mode3d: bool
	:rtype: bool") CheckOrder;
		Standard_Boolean CheckOrder (ShapeAnalysis_WireOrder & sawo,const Standard_Boolean isClosed = Standard_True,const Standard_Boolean mode3d = Standard_True);

		/****************** CheckOuterBound ******************/
		%feature("compactdefaultargs") CheckOuterBound;
		%feature("autodoc", "* Checks if wire defines an outer bound on the face Uses ShapeAnalysis::IsOuterBound for analysis If <APIMake> is True uses BRepAPI_MakeWire to build the wire, if False (to be used only when edges share common vertices) uses BRep_Builder to build the wire
	:param APIMake: default value is Standard_True
	:type APIMake: bool
	:rtype: bool") CheckOuterBound;
		Standard_Boolean CheckOuterBound (const Standard_Boolean APIMake = Standard_True);

		/****************** CheckSeam ******************/
		%feature("compactdefaultargs") CheckSeam;
		%feature("autodoc", "* Checks if a seam pcurves are correct oriented Returns: False (status OK) if given edge is not a seam or if it is OK C1 - current pcurve for FORWARD edge, C2 - current pcurve for REVERSED edge (if returns True they should be swapped for the seam), cf, cl - first and last parameters on curves Status: OK : Pcurves are correct or edge is not seam DONE : Seam pcurves should be swapped
	:param num:
	:type num: int
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:param cf:
	:type cf: float
	:param cl:
	:type cl: float
	:rtype: bool") CheckSeam;
		Standard_Boolean CheckSeam (const Standard_Integer num,opencascade::handle<Geom2d_Curve> & C1,opencascade::handle<Geom2d_Curve> & C2,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CheckSeam ******************/
		%feature("compactdefaultargs") CheckSeam;
		%feature("autodoc", "* Checks if a seam pcurves are correct oriented See previous functions for details
	:param num:
	:type num: int
	:rtype: bool") CheckSeam;
		Standard_Boolean CheckSeam (const Standard_Integer num);

		/****************** CheckSelfIntersectingEdge ******************/
		%feature("compactdefaultargs") CheckSelfIntersectingEdge;
		%feature("autodoc", "* Checks if num-th edge is self-intersecting. Self-intersection is reported only if intersection point lies outside of both end vertices of the edge. Returns: True if edge is self-intersecting. If returns True it also fills the sequences of intersection points and corresponding 3d points (only that are not enclosed by a vertices) Status: FAIL1 : No pcurve FAIL2 : No vertices DONE1 : Self-intersection found
	:param num:
	:type num: int
	:param points2d:
	:type points2d: IntRes2d_SequenceOfIntersectionPoint
	:param points3d:
	:type points3d: TColgp_SequenceOfPnt
	:rtype: bool") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge (const Standard_Integer num,IntRes2d_SequenceOfIntersectionPoint & points2d,TColgp_SequenceOfPnt & points3d);

		/****************** CheckSelfIntersectingEdge ******************/
		%feature("compactdefaultargs") CheckSelfIntersectingEdge;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: bool") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge (const Standard_Integer num);

		/****************** CheckSelfIntersection ******************/
		%feature("compactdefaultargs") CheckSelfIntersection;
		%feature("autodoc", "* Checks self-intersection of the wire (considering pcurves) Looks for self-intersecting edges and each pair of intersecting edges. Warning: It does not check each edge with any other one (only each two adjacent edges) The order of the checks : CheckSelfIntersectingEdge, CheckIntersectingEdges Returns: True if at least one check returned True Status: FAIL1 or DONE1 - see CheckSelfIntersectingEdge FAIL2 or DONE2 - see CheckIntersectingEdges
	:rtype: bool") CheckSelfIntersection;
		Standard_Boolean CheckSelfIntersection ();

		/****************** CheckShapeConnect ******************/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "* Checks with what orientation <shape> (wire or edge) can be connected to the wire. Tests distances with starting <preci> from <SBWD> (close confusion), but if given <prec> is greater, tests with <prec> (coarse confusion). The smallest found distance can be returned by MinDistance3d //! Returns: False if status is FAIL (see below) Status: DONE1 : If <shape> follows <SBWD>, direct sense (normal) DONE2 : If <shape> follows <SBWD>, but if reversed DONE3 : If <shape> preceeds <SBWD>, direct sense DONE4 : If <shape> preceeds <SBWD>, but if reversed FAIL1 : If <shape> is neither an edge nor a wire FAIL2 : If <shape> cannot be connected to <SBWD> //! DONE5 : To the tail of <SBWD> the <shape> is closer with direct sense DONE6 : To the head of <SBWD> the <shape> is closer with direct sense //! Remark: Statuses DONE1 - DONE4, FAIL1 - FAIL2 are basic and describe the nearest connection of the <shape> to <SBWD>. Statuses DONE5 and DONE6 are advanced and are to be used when analyzing with what sense (direct or reversed) the <shape> should be connected to <SBWD>: For tail of <SBWD> if DONE4 is True <shape> should be direct, otherwise reversed. For head of <SBWD> if DONE5 is True <shape> should be direct, otherwise reversed.
	:param shape:
	:type shape: TopoDS_Shape
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect (const TopoDS_Shape & shape,const Standard_Real prec = 0.0);

		/****************** CheckShapeConnect ******************/
		%feature("compactdefaultargs") CheckShapeConnect;
		%feature("autodoc", "* The same as previous CheckShapeConnect but is more advanced. It returns the distances between each end of <sbwd> and each end of <shape>. For example, <tailhead> stores distance between tail of <sbwd> and head of <shape> Remark: First method CheckShapeConnect calls this one
	:param tailhead:
	:type tailhead: float
	:param tailtail:
	:type tailtail: float
	:param headtail:
	:type headtail: float
	:param headhead:
	:type headhead: float
	:param shape:
	:type shape: TopoDS_Shape
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const TopoDS_Shape & shape,const Standard_Real prec = 0.0);

		/****************** CheckSmall ******************/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "* Calls to CheckSmall for each edge Returns: True if at least one small edge was detected
	:param precsmall: default value is 0.0
	:type precsmall: float
	:rtype: bool") CheckSmall;
		Standard_Boolean CheckSmall (const Standard_Real precsmall = 0.0);

		/****************** CheckSmall ******************/
		%feature("compactdefaultargs") CheckSmall;
		%feature("autodoc", "* Checks if an edge has a length not greater than myPreci or precsmall (if it is smaller) Returns: False if its length is greater than precision Status: OK : edge is not small or degenerated DONE1: edge is small, vertices are the same DONE2: edge is small, vertices are not the same FAIL : no 3d curve and pcurve
	:param num:
	:type num: int
	:param precsmall: default value is 0.0
	:type precsmall: float
	:rtype: bool") CheckSmall;
		Standard_Boolean CheckSmall (const Standard_Integer num,const Standard_Real precsmall = 0.0);

		/****************** CheckSmallArea ******************/
		%feature("compactdefaultargs") CheckSmallArea;
		%feature("autodoc", "* Checks if wire has parametric area less than precision.
	:param theWire:
	:type theWire: TopoDS_Wire
	:rtype: bool") CheckSmallArea;
		Standard_Boolean CheckSmallArea (const TopoDS_Wire & theWire);

		/****************** CheckTail ******************/
		%feature("compactdefaultargs") CheckTail;
		%feature("autodoc", ":param theEdge1:
	:type theEdge1: TopoDS_Edge
	:param theEdge2:
	:type theEdge2: TopoDS_Edge
	:param theMaxSine:
	:type theMaxSine: float
	:param theMaxWidth:
	:type theMaxWidth: float
	:param theMaxTolerance:
	:type theMaxTolerance: float
	:param theEdge11:
	:type theEdge11: TopoDS_Edge
	:param theEdge12:
	:type theEdge12: TopoDS_Edge
	:param theEdge21:
	:type theEdge21: TopoDS_Edge
	:param theEdge22:
	:type theEdge22: TopoDS_Edge
	:rtype: bool") CheckTail;
		Standard_Boolean CheckTail (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,const Standard_Real theMaxSine,const Standard_Real theMaxWidth,const Standard_Real theMaxTolerance,TopoDS_Edge & theEdge11,TopoDS_Edge & theEdge12,TopoDS_Edge & theEdge21,TopoDS_Edge & theEdge22);

		/****************** ClearStatuses ******************/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "* Unsets all the status and distance fields wire, face and precision are not cleared
	:rtype: None") ClearStatuses;
		void ClearStatuses ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns the working face
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the object with standard TopoDS_Wire, face and precision
	:param wire:
	:type wire: TopoDS_Wire
	:param face:
	:type face: TopoDS_Face
	:param precision:
	:type precision: float
	:rtype: None") Init;
		void Init (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real precision);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the object with WireData object, face and precision
	:param sbwd:
	:type sbwd: ShapeExtend_WireData
	:param face:
	:type face: TopoDS_Face
	:param precision:
	:type precision: float
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeExtend_WireData> & sbwd,const TopoDS_Face & face,const Standard_Real precision);

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "* Returns True if wire is loaded and has number of edges >0
	:rtype: bool") IsLoaded;
		Standard_Boolean IsLoaded ();

		/****************** IsReady ******************/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "* Returns True if IsLoaded and underlying face is not null
	:rtype: bool") IsReady;
		Standard_Boolean IsReady ();

		/****************** LastCheckStatus ******************/
		%feature("compactdefaultargs") LastCheckStatus;
		%feature("autodoc", "* Querying the status of the LAST perfomed 'Advanced' checking procedure
	:param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") LastCheckStatus;
		Standard_Boolean LastCheckStatus (const ShapeExtend_Status Status);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads the object with standard TopoDS_Wire
	:param wire:
	:type wire: TopoDS_Wire
	:rtype: None") Load;
		void Load (const TopoDS_Wire & wire);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads the object with WireData object
	:param sbwd:
	:type sbwd: ShapeExtend_WireData
	:rtype: None") Load;
		void Load (const opencascade::handle<ShapeExtend_WireData> & sbwd);

		/****************** MaxDistance2d ******************/
		%feature("compactdefaultargs") MaxDistance2d;
		%feature("autodoc", "* Returns the last maximal distance in 2D-UV computed by CheckContinuity2d
	:rtype: float") MaxDistance2d;
		Standard_Real MaxDistance2d ();

		/****************** MaxDistance3d ******************/
		%feature("compactdefaultargs") MaxDistance3d;
		%feature("autodoc", "* Returns the last maximal distance in 3D computed by CheckOrientation, CheckConnected, CheckContinuity3d, CheckVertex, CheckNewVertex, CheckSameParameter
	:rtype: float") MaxDistance3d;
		Standard_Real MaxDistance3d ();

		/****************** MinDistance2d ******************/
		%feature("compactdefaultargs") MinDistance2d;
		%feature("autodoc", "* Returns the last lowest distance in 2D-UV computed by CheckContinuity2d
	:rtype: float") MinDistance2d;
		Standard_Real MinDistance2d ();

		/****************** MinDistance3d ******************/
		%feature("compactdefaultargs") MinDistance3d;
		%feature("autodoc", "* Returns the last lowest distance in 3D computed by CheckOrientation, CheckConnected, CheckContinuity3d, CheckVertex, CheckNewVertex
	:rtype: float") MinDistance3d;
		Standard_Real MinDistance3d ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* Returns the number of edges in the wire, or 0 if it is not loaded
	:rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs all the checks in the following order : CheckOrder, CheckSmall, CheckConected, CheckEdgeCurves, CheckDegenerated, CheckSelfIntersection, CheckLacking, CheckClosed Returns: True if at least one method returned True; For deeper analysis use Status...(status) methods
	:rtype: bool") Perform;
		Standard_Boolean Perform ();

		/****************** Precision ******************/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "* Returns the value of precision
	:rtype: float") Precision;
		Standard_Real Precision ();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "* Loads the face the wire lies on
	:param face:
	:type face: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & face);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", ":param precision:
	:type precision: float
	:rtype: None") SetPrecision;
		void SetPrecision (const Standard_Real precision);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Loads the surface the wire lies on
	:param surface:
	:type surface: Geom_Surface
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & surface);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Loads the surface the wire lies on
	:param surface:
	:type surface: Geom_Surface
	:param location:
	:type location: TopLoc_Location
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location);

		/****************** ShapeAnalysis_Wire ******************/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire ();

		/****************** ShapeAnalysis_Wire ******************/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "* Creates object with standard TopoDS_Wire, face and precision
	:param wire:
	:type wire: TopoDS_Wire
	:param face:
	:type face: TopoDS_Face
	:param precision:
	:type precision: float
	:rtype: None") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real precision);

		/****************** ShapeAnalysis_Wire ******************/
		%feature("compactdefaultargs") ShapeAnalysis_Wire;
		%feature("autodoc", "* Creates the object with WireData object, face and precision
	:param sbwd:
	:type sbwd: ShapeExtend_WireData
	:param face:
	:type face: TopoDS_Face
	:param precision:
	:type precision: float
	:rtype: None") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire (const opencascade::handle<ShapeExtend_WireData> & sbwd,const TopoDS_Face & face,const Standard_Real precision);

		/****************** StatusClosed ******************/
		%feature("compactdefaultargs") StatusClosed;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusClosed;
		Standard_Boolean StatusClosed (const ShapeExtend_Status Status);

		/****************** StatusConnected ******************/
		%feature("compactdefaultargs") StatusConnected;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusConnected;
		Standard_Boolean StatusConnected (const ShapeExtend_Status Status);

		/****************** StatusCurveGaps ******************/
		%feature("compactdefaultargs") StatusCurveGaps;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusCurveGaps;
		Standard_Boolean StatusCurveGaps (const ShapeExtend_Status Status);

		/****************** StatusDegenerated ******************/
		%feature("compactdefaultargs") StatusDegenerated;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusDegenerated;
		Standard_Boolean StatusDegenerated (const ShapeExtend_Status Status);

		/****************** StatusEdgeCurves ******************/
		%feature("compactdefaultargs") StatusEdgeCurves;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves (const ShapeExtend_Status Status);

		/****************** StatusGaps2d ******************/
		%feature("compactdefaultargs") StatusGaps2d;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusGaps2d;
		Standard_Boolean StatusGaps2d (const ShapeExtend_Status Status);

		/****************** StatusGaps3d ******************/
		%feature("compactdefaultargs") StatusGaps3d;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusGaps3d;
		Standard_Boolean StatusGaps3d (const ShapeExtend_Status Status);

		/****************** StatusLacking ******************/
		%feature("compactdefaultargs") StatusLacking;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusLacking;
		Standard_Boolean StatusLacking (const ShapeExtend_Status Status);

		/****************** StatusLoop ******************/
		%feature("compactdefaultargs") StatusLoop;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusLoop;
		Standard_Boolean StatusLoop (const ShapeExtend_Status Status);

		/****************** StatusOrder ******************/
		%feature("compactdefaultargs") StatusOrder;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusOrder;
		Standard_Boolean StatusOrder (const ShapeExtend_Status Status);

		/****************** StatusSelfIntersection ******************/
		%feature("compactdefaultargs") StatusSelfIntersection;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection (const ShapeExtend_Status Status);

		/****************** StatusSmall ******************/
		%feature("compactdefaultargs") StatusSmall;
		%feature("autodoc", ":param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool") StatusSmall;
		Standard_Boolean StatusSmall (const ShapeExtend_Status Status);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the working surface
	:rtype: opencascade::handle<ShapeAnalysis_Surface>") Surface;
		const opencascade::handle<ShapeAnalysis_Surface> & Surface ();

		/****************** WireData ******************/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "* Returns wire object being analyzed
	:rtype: opencascade::handle<ShapeExtend_WireData>") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData ();

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
%nodefaultctor ShapeAnalysis_WireOrder;
class ShapeAnalysis_WireOrder {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a couple of points 3D (start,end)
	:param start3d:
	:type start3d: gp_XYZ
	:param end3d:
	:type end3d: gp_XYZ
	:rtype: None") Add;
		void Add (const gp_XYZ & start3d,const gp_XYZ & end3d);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a couple of points 2D (start,end)
	:param start2d:
	:type start2d: gp_XY
	:param end2d:
	:type end2d: gp_XY
	:rtype: None") Add;
		void Add (const gp_XY & start2d,const gp_XY & end2d);

		/****************** Chain ******************/
		%feature("compactdefaultargs") Chain;
		%feature("autodoc", "* Returns, for the chain n0 num, starting and ending numbers of edges. In the list of ordered edges (see Ordered for originals)
	:param num:
	:type num: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:rtype: None") Chain;
		void Chain (const Standard_Integer num,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the list of edges, but not mode and tol
	:rtype: None") Clear;
		void Clear ();

		/****************** Couple ******************/
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "* Returns, for the couple n0 num, the two implied edges In the list of ordered edges
	:param num:
	:type num: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:rtype: None") Couple;
		void Couple (const Standard_Integer num,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Gap ******************/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "* Returns the gap between a couple and its preceeding <num> is considered ordered If <num> = 0 (D), returns the greatest gap found
	:param num: default value is 0
	:type num: int
	:rtype: float") Gap;
		Standard_Real Gap (const Standard_Integer num = 0);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Tells if Perform has been done Else, the following methods returns original values
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();


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
		%feature("compactdefaultargs") NbChains;
		%feature("autodoc", "* Returns the count of computed chains
	:rtype: int") NbChains;
		Standard_Integer NbChains ();

		/****************** NbCouples ******************/
		%feature("compactdefaultargs") NbCouples;
		%feature("autodoc", "* Returns the count of computed couples
	:rtype: int") NbCouples;
		Standard_Integer NbCouples ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* Returns the count of added couples of points (one per edges)
	:rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** Ordered ******************/
		%feature("compactdefaultargs") Ordered;
		%feature("autodoc", "* Returns the number of original edge which correspond to the newly ordered number <n> Warning : the returned value is NEGATIVE if edge should be reversed
	:param n:
	:type n: int
	:rtype: int") Ordered;
		Standard_Integer Ordered (const Standard_Integer n);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the better order If <closed> is True (D) considers also closure Optimised if the couples were already in order The criterium is : two couples in order if distance between end-prec and start-cur is less then starting tolerance <tol> Else, the smallest distance is reached Gap corresponds to a smallest distance greater than <tol>
	:param closed: default value is Standard_True
	:type closed: bool
	:rtype: None") Perform;
		void Perform (const Standard_Boolean closed = Standard_True);

		/****************** SetChains ******************/
		%feature("compactdefaultargs") SetChains;
		%feature("autodoc", "* Determines the chains inside which successive edges have a gap less than a given value. Queried by NbChains and Chain
	:param gap:
	:type gap: float
	:rtype: None") SetChains;
		void SetChains (const Standard_Real gap);

		/****************** SetCouples ******************/
		%feature("compactdefaultargs") SetCouples;
		%feature("autodoc", "* Determines the couples of edges for which end and start fit inside a given gap. Queried by NbCouples and Couple
	:param gap:
	:type gap: float
	:rtype: None") SetCouples;
		void SetCouples (const Standard_Real gap);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "* Sets new values. Clears the connexion list If <mode3d> changes, also clears the edge list (else, doesnt)
	:param mode3d:
	:type mode3d: bool
	:param tol:
	:type tol: float
	:rtype: None") SetMode;
		void SetMode (const Standard_Boolean mode3d,const Standard_Real tol);

		/****************** ShapeAnalysis_WireOrder ******************/
		%feature("compactdefaultargs") ShapeAnalysis_WireOrder;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder ();

		/****************** ShapeAnalysis_WireOrder ******************/
		%feature("compactdefaultargs") ShapeAnalysis_WireOrder;
		%feature("autodoc", "* Creates a WireOrder in 3D (if mode3d is True) or 2D (if False) with a tolerance
	:param mode3d:
	:type mode3d: bool
	:param tol:
	:type tol: float
	:rtype: None") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder (const Standard_Boolean mode3d,const Standard_Real tol);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of the order (0 if not done) : 0 : all edges are direct and in sequence 1 : all edges are direct but some are not in sequence 2 : in addition, unresolved gaps remain -1 : some edges are reversed, but no gap remain -2 : some edges are reversed and some gaps remain -10 : COULD NOT BE RESOLVED, Failure on Reorder gap : regarding starting <tol>
	:rtype: int") Status;
		Standard_Integer Status ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the working tolerance
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "* Returns the values of the couple <num>, as 2D values
	:param num:
	:type num: int
	:param start2d:
	:type start2d: gp_XY
	:param end2d:
	:type end2d: gp_XY
	:rtype: None") XY;
		void XY (const Standard_Integer num,gp_XY & start2d,gp_XY & end2d);

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "* Returns the values of the couple <num>, as 3D values
	:param num:
	:type num: int
	:param start3d:
	:type start3d: gp_XYZ
	:param end3d:
	:type end3d: gp_XYZ
	:rtype: None") XYZ;
		void XYZ (const Standard_Integer num,gp_XYZ & start3d,gp_XYZ & end3d);

};


%extend ShapeAnalysis_WireOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeAnalysis_WireVertex *
*********************************/
%nodefaultctor ShapeAnalysis_WireVertex;
class ShapeAnalysis_WireVertex {
	public:
		/****************** Analyze ******************/
		%feature("compactdefaultargs") Analyze;
		%feature("autodoc", ":rtype: None") Analyze;
		void Analyze ();

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "* Returns the recorded status for a vertex With its recorded position and parameters on both edges These values are relevant regarding the status: Status Meaning Position Preceeding Following 0 Same no no no 1 SameCoord no no no 2 Close no no no 3 End yes no yes 4 Start yes yes no 5 Inters yes yes yes -1 Disjoined no no no
	:param num:
	:type num: int
	:param pos:
	:type pos: gp_XYZ
	:param upre:
	:type upre: float
	:param ufol:
	:type ufol: float
	:rtype: int") Data;
		Standard_Integer Data (const Standard_Integer num,gp_XYZ & pos,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param wire:
	:type wire: TopoDS_Wire
	:param preci:
	:type preci: float
	:rtype: None") Init;
		void Init (const TopoDS_Wire & wire,const Standard_Real preci);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param swbd:
	:type swbd: ShapeExtend_WireData
	:param preci:
	:type preci: float
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeExtend_WireData> & swbd,const Standard_Real preci);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if analysis was performed, else returns False
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param wire:
	:type wire: TopoDS_Wire
	:rtype: None") Load;
		void Load (const TopoDS_Wire & wire);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param sbwd:
	:type sbwd: ShapeExtend_WireData
	:rtype: None") Load;
		void Load (const opencascade::handle<ShapeExtend_WireData> & sbwd);

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* Returns the number of edges in analyzed wire (i.e. the length of all arrays)
	:rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** NextCriter ******************/
		%feature("compactdefaultargs") NextCriter;
		%feature("autodoc", "* For a given criter, returns the rank of the vertex which follows <num> and has the same status. 0 if no more Acts as an iterator, starts on the first one Criters are: 0: same vertex (status 0) 1: a solution exists (status >= 0) 2: same coords (i.e. same params) (status 0 1 2) 3: same coods but not same vertex (status 1 2) 4: redefined coords (status 3 4 5) -1: no solution (status -1)
	:param crit:
	:type crit: int
	:param num: default value is 0
	:type num: int
	:rtype: int") NextCriter;
		Standard_Integer NextCriter (const Standard_Integer crit,const Standard_Integer num = 0);

		/****************** NextStatus ******************/
		%feature("compactdefaultargs") NextStatus;
		%feature("autodoc", "* For a given status, returns the rank of the vertex which follows <num> and has the same status. 0 if no more Acts as an iterator, starts on the first one
	:param stat:
	:type stat: int
	:param num: default value is 0
	:type num: int
	:rtype: int") NextStatus;
		Standard_Integer NextStatus (const Standard_Integer stat,const Standard_Integer num = 0);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: gp_XYZ") Position;
		gp_XYZ Position (const Standard_Integer num);

		/****************** Precision ******************/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "* Returns precision value used in analysis
	:rtype: float") Precision;
		Standard_Real Precision ();

		/****************** SetClose ******************/
		%feature("compactdefaultargs") SetClose;
		%feature("autodoc", "* Records status 'Close Coords' (at the Precision of <self>)
	:param num:
	:type num: int
	:rtype: None") SetClose;
		void SetClose (const Standard_Integer num);

		/****************** SetDisjoined ******************/
		%feature("compactdefaultargs") SetDisjoined;
		%feature("autodoc", "* <num> cannot be said as same vertex
	:param num:
	:type num: int
	:rtype: None") SetDisjoined;
		void SetDisjoined (const Standard_Integer num);

		/****************** SetEnd ******************/
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "* <num> is the End of preceeding Edge, and its projection on the following one lies on it at the Precision of <self> <ufol> gives the parameter on the following edge
	:param num:
	:type num: int
	:param pos:
	:type pos: gp_XYZ
	:param ufol:
	:type ufol: float
	:rtype: None") SetEnd;
		void SetEnd (const Standard_Integer num,const gp_XYZ & pos,const Standard_Real ufol);

		/****************** SetInters ******************/
		%feature("compactdefaultargs") SetInters;
		%feature("autodoc", "* <num> is the Intersection of both Edges <upre> is the parameter on preceeding edge, <ufol> on following edge
	:param num:
	:type num: int
	:param pos:
	:type pos: gp_XYZ
	:param upre:
	:type upre: float
	:param ufol:
	:type ufol: float
	:rtype: None") SetInters;
		void SetInters (const Standard_Integer num,const gp_XYZ & pos,const Standard_Real upre,const Standard_Real ufol);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets the precision for work Analysing: for each Vertex, comparison between the end of the preceeding edge and the start of the following edge Each Vertex rank corresponds to the End Vertex of the Edge of same rank, in the ShapeExtend_WireData. I.E. for Vertex <num>, Edge <num> is the preceeding one, <num+1> is the following one
	:param preci:
	:type preci: float
	:rtype: None") SetPrecision;
		void SetPrecision (const Standard_Real preci);

		/****************** SetSameCoords ******************/
		%feature("compactdefaultargs") SetSameCoords;
		%feature("autodoc", "* Records status 'Same Coords' (at the Vertices Tolerances)
	:param num:
	:type num: int
	:rtype: None") SetSameCoords;
		void SetSameCoords (const Standard_Integer num);

		/****************** SetSameVertex ******************/
		%feature("compactdefaultargs") SetSameVertex;
		%feature("autodoc", "* Records status 'Same Vertex' (logically) on Vertex <num>
	:param num:
	:type num: int
	:rtype: None") SetSameVertex;
		void SetSameVertex (const Standard_Integer num);

		/****************** SetStart ******************/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "* <num> is the Start of following Edge, its projection on the preceeding one lies on it at the Precision of <self> <upre> gives the parameter on the preceeding edge
	:param num:
	:type num: int
	:param pos:
	:type pos: gp_XYZ
	:param upre:
	:type upre: float
	:rtype: None") SetStart;
		void SetStart (const Standard_Integer num,const gp_XYZ & pos,const Standard_Real upre);

		/****************** ShapeAnalysis_WireVertex ******************/
		%feature("compactdefaultargs") ShapeAnalysis_WireVertex;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAnalysis_WireVertex;
		 ShapeAnalysis_WireVertex ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the recorded status for a vertex More detail by method Data
	:param num:
	:type num: int
	:rtype: int") Status;
		Standard_Integer Status (const Standard_Integer num);

		/****************** UFollowing ******************/
		%feature("compactdefaultargs") UFollowing;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: float") UFollowing;
		Standard_Real UFollowing (const Standard_Integer num);

		/****************** UPrevious ******************/
		%feature("compactdefaultargs") UPrevious;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: float") UPrevious;
		Standard_Real UPrevious (const Standard_Integer num);

		/****************** WireData ******************/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "* Returns analyzed wire
	:rtype: opencascade::handle<ShapeExtend_WireData>") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData ();

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
%nodefaultctor ShapeAnalysis_TransferParametersProj;
class ShapeAnalysis_TransferParametersProj : public ShapeAnalysis_TransferParameters {
	public:
		/****************** CopyNMVertex ******************/
		%feature("compactdefaultargs") CopyNMVertex;
		%feature("autodoc", "* Make a copy of non-manifold vertex theVert (i.e. create new TVertex and replace PointRepresentations for this vertex from fromedge to toedge. Other representations were copied)
	:param theVert:
	:type theVert: TopoDS_Vertex
	:param toedge:
	:type toedge: TopoDS_Edge
	:param fromedge:
	:type fromedge: TopoDS_Edge
	:rtype: TopoDS_Vertex") CopyNMVertex;
		static TopoDS_Vertex CopyNMVertex (const TopoDS_Vertex & theVert,const TopoDS_Edge & toedge,const TopoDS_Edge & fromedge);

		/****************** CopyNMVertex ******************/
		%feature("compactdefaultargs") CopyNMVertex;
		%feature("autodoc", "* Make a copy of non-manifold vertex theVert (i.e. create new TVertex and replace PointRepresentations for this vertex from fromFace to toFace. Other representations were copied)
	:param theVert:
	:type theVert: TopoDS_Vertex
	:param toFace:
	:type toFace: TopoDS_Face
	:param fromFace:
	:type fromFace: TopoDS_Face
	:rtype: TopoDS_Vertex") CopyNMVertex;
		static TopoDS_Vertex CopyNMVertex (const TopoDS_Vertex & theVert,const TopoDS_Face & toFace,const TopoDS_Face & fromFace);


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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: void") Init;
		virtual void Init (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** IsSameRange ******************/
		%feature("compactdefaultargs") IsSameRange;
		%feature("autodoc", "* Returns False;
	:rtype: bool") IsSameRange;
		virtual Standard_Boolean IsSameRange ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Transfers parameters given by sequence Params from 3d curve to pcurve (if To2d is True) or back (if To2d is False)
	:param Papams:
	:type Papams: TColStd_HSequenceOfReal
	:param To2d:
	:type To2d: bool
	:rtype: opencascade::handle<TColStd_HSequenceOfReal>") Perform;
		virtual opencascade::handle<TColStd_HSequenceOfReal> Perform (const opencascade::handle<TColStd_HSequenceOfReal> & Papams,const Standard_Boolean To2d);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Transfers parameter given by Param from 3d curve to pcurve (if To2d is True) or back (if To2d is False)
	:param Param:
	:type Param: float
	:param To2d:
	:type To2d: bool
	:rtype: float") Perform;
		virtual Standard_Real Perform (const Standard_Real Param,const Standard_Boolean To2d);

		/****************** ShapeAnalysis_TransferParametersProj ******************/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParametersProj;
		%feature("autodoc", "* Creats empty constructor.
	:rtype: None") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj ();

		/****************** ShapeAnalysis_TransferParametersProj ******************/
		%feature("compactdefaultargs") ShapeAnalysis_TransferParametersProj;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** TransferRange ******************/
		%feature("compactdefaultargs") TransferRange;
		%feature("autodoc", "* Recomputes range of curves from NewEdge. If Is2d equals True parameters are recomputed by curve2d else by curve3d.
	:param newEdge:
	:type newEdge: TopoDS_Edge
	:param prevPar:
	:type prevPar: float
	:param currPar:
	:type currPar: float
	:param Is2d:
	:type Is2d: bool
	:rtype: void") TransferRange;
		virtual void TransferRange (TopoDS_Edge & newEdge,const Standard_Real prevPar,const Standard_Real currPar,const Standard_Boolean Is2d);

};


%make_alias(ShapeAnalysis_TransferParametersProj)

%extend ShapeAnalysis_TransferParametersProj {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class ShapeAnalysis_HSequenceOfFreeBounds : public  ShapeAnalysis_SequenceOfFreeBounds, public Standard_Transient {
  public:
    ShapeAnalysis_HSequenceOfFreeBounds();
    ShapeAnalysis_HSequenceOfFreeBounds(const  ShapeAnalysis_SequenceOfFreeBounds& theOther);
    const  ShapeAnalysis_SequenceOfFreeBounds& Sequence();
    void Append (const  ShapeAnalysis_SequenceOfFreeBounds::value_type& theItem);
    void Append ( ShapeAnalysis_SequenceOfFreeBounds& theSequence);
     ShapeAnalysis_SequenceOfFreeBounds& ChangeSequence();
};
%make_alias(ShapeAnalysis_HSequenceOfFreeBounds)


