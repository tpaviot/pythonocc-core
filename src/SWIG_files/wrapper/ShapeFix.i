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
%define SHAPEFIXDOCSTRING
"ShapeFix module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapefix.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEFIXDOCSTRING) ShapeFix


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
#include<ShapeFix_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<ShapeBuild_module.hxx>
#include<Message_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<ShapeAnalysis_module.hxx>
#include<ShapeConstruct_module.hxx>
#include<Geom2d_module.hxx>
#include<TopAbs_module.hxx>
#include<TopTools_module.hxx>
#include<TColGeom_module.hxx>
#include<BRep_module.hxx>
#include<TShort_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Poly_module.hxx>
#include<BRepTools_module.hxx>
#include<Adaptor2d_module.hxx>
#include<IntRes2d_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import ShapeBuild.i
%import Message.i
%import ShapeExtend.i
%import Geom.i
%import TopLoc.i
%import ShapeAnalysis.i
%import ShapeConstruct.i
%import Geom2d.i
%import TopAbs.i
%import TopTools.i

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
%wrap_handle(ShapeFix_Edge)
%wrap_handle(ShapeFix_EdgeProjAux)
%wrap_handle(ShapeFix_Root)
%wrap_handle(ShapeFix_ComposeShell)
%wrap_handle(ShapeFix_Face)
%wrap_handle(ShapeFix_FixSmallFace)
%wrap_handle(ShapeFix_FixSmallSolid)
%wrap_handle(ShapeFix_Shape)
%wrap_handle(ShapeFix_Shell)
%wrap_handle(ShapeFix_Solid)
%wrap_handle(ShapeFix_SplitCommonVertex)
%wrap_handle(ShapeFix_Wire)
%wrap_handle(ShapeFix_Wireframe)
/* end handles declaration */

/* templates */
%template(ShapeFix_DataMapOfShapeBox2d) NCollection_DataMap<TopoDS_Shape,Bnd_Box2d,TopTools_ShapeMapHasher>;
%template(ShapeFix_SequenceOfWireSegment) NCollection_Sequence<ShapeFix_WireSegment>;

%extend NCollection_Sequence<ShapeFix_WireSegment> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, Bnd_Box2d, TopTools_ShapeMapHasher>::Iterator ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
typedef NCollection_DataMap<TopoDS_Shape, Bnd_Box2d, TopTools_ShapeMapHasher> ShapeFix_DataMapOfShapeBox2d;
typedef NCollection_Sequence<ShapeFix_WireSegment> ShapeFix_SequenceOfWireSegment;
/* end typedefs declaration */

/*****************
* class ShapeFix *
*****************/
%rename(shapefix) ShapeFix;
class ShapeFix {
	public:
		/****************** EncodeRegularity ******************/
		/**** md5 signature: fea2b7603f2731e09966cc6f7e072a6c ****/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "Runs encoderegularity from breplib taking into account shared components of assemblies, so that each component is processed only once.

Parameters
----------
shape: TopoDS_Shape
tolang: float,optional
	default value is 1.0e-10

Returns
-------
None
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & shape, const Standard_Real tolang = 1.0e-10);

		/****************** FixVertexPosition ******************/
		/**** md5 signature: c7ff7f9c8281a8b8d4fcf5c591c62849 ****/
		%feature("compactdefaultargs") FixVertexPosition;
		%feature("autodoc", "Fix position of the vertices having tolerance more tnan specified one.;.

Parameters
----------
theshape: TopoDS_Shape
theTolerance: float
thecontext: ShapeBuild_ReShape

Returns
-------
bool
") FixVertexPosition;
		static Standard_Boolean FixVertexPosition(TopoDS_Shape & theshape, const Standard_Real theTolerance, const opencascade::handle<ShapeBuild_ReShape> & thecontext);

		/****************** LeastEdgeSize ******************/
		/**** md5 signature: 5588951499ff9209556b6640a2ce4be3 ****/
		%feature("compactdefaultargs") LeastEdgeSize;
		%feature("autodoc", "Calculate size of least edge;.

Parameters
----------
theshape: TopoDS_Shape

Returns
-------
float
") LeastEdgeSize;
		static Standard_Real LeastEdgeSize(TopoDS_Shape & theshape);

		/****************** RemoveSmallEdges ******************/
		/**** md5 signature: 54afd3ebf858885994d0e58ff4338566 ****/
		%feature("compactdefaultargs") RemoveSmallEdges;
		%feature("autodoc", "Removes edges which are less than given tolerance from shape with help of shapefix_wire::fixsmall().

Parameters
----------
shape: TopoDS_Shape
Tolerance: float
context: ShapeBuild_ReShape

Returns
-------
TopoDS_Shape
") RemoveSmallEdges;
		static TopoDS_Shape RemoveSmallEdges(TopoDS_Shape & shape, const Standard_Real Tolerance, opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** SameParameter ******************/
		/**** md5 signature: d44f3832a64831cc5982dced287455b3 ****/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Runs sameparameter from breplib with these adaptations : <enforce> forces computations, else they are made only on edges with flag sameparameter false <preci>, if not precised, is taken for each edge as its own tolerance returns true when done, false if an exception has been raised in case of exception anyway, as many edges as possible have been processed. the passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.

Parameters
----------
shape: TopoDS_Shape
enforce: bool
preci: float,optional
	default value is 0.0
theProgress: Message_ProgressIndicator,optional
	default value is 0
theMsgReg: ShapeExtend_BasicMsgRegistrator,optional
	default value is 0

Returns
-------
bool
") SameParameter;
		static Standard_Boolean SameParameter(const TopoDS_Shape & shape, const Standard_Boolean enforce, const Standard_Real preci = 0.0, const opencascade::handle<Message_ProgressIndicator> & theProgress = 0, const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & theMsgReg = 0);

};


%extend ShapeFix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ShapeFix_Edge *
**********************/
class ShapeFix_Edge : public Standard_Transient {
	public:
		/****************** ShapeFix_Edge ******************/
		/**** md5 signature: f63f1796cd112c36ec80b3d48f00b8b2 ****/
		%feature("compactdefaultargs") ShapeFix_Edge;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeFix_Edge;
		 ShapeFix_Edge();

		/****************** FixAddCurve3d ******************/
		/**** md5 signature: 17986ce720da4ac50894362099ba5a70 ****/
		%feature("compactdefaultargs") FixAddCurve3d;
		%feature("autodoc", "Tries to build 3d curve of the edge if missing use : it is to be called after fixremovecurve3d (if removed) or in any case when edge can have no 3d curve returns: true if 3d curve was added, else false status : ok : 3d curve exists fail1: breplib::buildcurve3d() has failed done1: 3d curve was added.

Parameters
----------
edge: TopoDS_Edge

Returns
-------
bool
") FixAddCurve3d;
		Standard_Boolean FixAddCurve3d(const TopoDS_Edge & edge);

		/****************** FixAddPCurve ******************/
		/**** md5 signature: a1422900457d4373f0ae3434fe69011b ****/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "See method below for information.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
isSeam: bool
prec: float,optional
	default value is 0.0

Returns
-------
bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, const Standard_Boolean isSeam, const Standard_Real prec = 0.0);

		/****************** FixAddPCurve ******************/
		/**** md5 signature: 9e39861379c44f9cc6e6cd923bbabe81 ****/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "See method below for information.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
isSeam: bool
prec: float,optional
	default value is 0.0

Returns
-------
bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const Standard_Boolean isSeam, const Standard_Real prec = 0.0);

		/****************** FixAddPCurve ******************/
		/**** md5 signature: 81ae90a15e65240a8c267e272d2195cd ****/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "See method below for information.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
isSeam: bool
surfana: ShapeAnalysis_Surface
prec: float,optional
	default value is 0.0

Returns
-------
bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, const Standard_Boolean isSeam, const opencascade::handle<ShapeAnalysis_Surface> & surfana, const Standard_Real prec = 0.0);

		/****************** FixAddPCurve ******************/
		/**** md5 signature: 40d7c918a6d425a71a2298dc9d5a5a23 ****/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "Adds pcurve(s) of the edge if missing (by projecting 3d curve) parameter isseam indicates if the edge is a seam. the parameter <prec> defines the precision for calculations. if it is 0 (default), the tolerance of the edge is taken. remark : this method is rather for internal use since it accepts parameter <surfana> for optimization of computations use : it is to be called after fixremovepcurve (if removed) or in any case when edge can have no pcurve returns: true if pcurve was added, else false status : ok : pcurve exists fail1: no 3d curve fail2: fail during projecting done1: pcurve was added done2: specific case of pcurve going through degenerated point on sphere encountered during projection (see class shapeconstruct_projectcurveonsurface for more info).

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
isSeam: bool
surfana: ShapeAnalysis_Surface
prec: float,optional
	default value is 0.0

Returns
-------
bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const Standard_Boolean isSeam, const opencascade::handle<ShapeAnalysis_Surface> & surfana, const Standard_Real prec = 0.0);

		/****************** FixRemoveCurve3d ******************/
		/**** md5 signature: 7bd251b4bbb540c3bb96047ac39ce441 ****/
		%feature("compactdefaultargs") FixRemoveCurve3d;
		%feature("autodoc", "Removes 3d curve of the edge if it does not match the vertices returns: true, if does not match, removed (status done) false, (status ok) if matches or (status fail) if no 3d curve, nothing done.

Parameters
----------
edge: TopoDS_Edge

Returns
-------
bool
") FixRemoveCurve3d;
		Standard_Boolean FixRemoveCurve3d(const TopoDS_Edge & edge);

		/****************** FixRemovePCurve ******************/
		/**** md5 signature: 1ed82394f56d81f9abf3639bfebed9b8 ****/
		%feature("compactdefaultargs") FixRemovePCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
bool
") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****************** FixRemovePCurve ******************/
		/**** md5 signature: f864c3b82118943711b5bbc63f649010 ****/
		%feature("compactdefaultargs") FixRemovePCurve;
		%feature("autodoc", "Removes the pcurve(s) of the edge if it does not match the vertices check is done use : it is to be called when pcurve of an edge can be wrong (e.g., after import from iges) returns: true, if does not match, removed (status done) false, (status ok) if matches or (status fail) if no pcurve, nothing done.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Returns
-------
bool
") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****************** FixReversed2d ******************/
		/**** md5 signature: 46ba9d544f0acefbd0c950d47989f69b ****/
		%feature("compactdefaultargs") FixReversed2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
bool
") FixReversed2d;
		Standard_Boolean FixReversed2d(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****************** FixReversed2d ******************/
		/**** md5 signature: 7597e7d41fe46b4bef689deb91cb2eae ****/
		%feature("compactdefaultargs") FixReversed2d;
		%feature("autodoc", "Fixes edge if pcurve is directed opposite to 3d curve check is done by call to the function shapeanalysis_edge::checkcurve3dwithpcurve() warning: for seam edge this method will check and fix the pcurve in only one direction. hence, it should be called twice for seam edge: once with edge orientation forward and once with reversed. returns: false if nothing done, true if reversed (status done) status: ok - pcurve ok, nothing done fail1 - no pcurve fail2 - no 3d curve done1 - pcurve was reversed.

Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location

Returns
-------
bool
") FixReversed2d;
		Standard_Boolean FixReversed2d(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****************** FixSameParameter ******************/
		/**** md5 signature: 85eced5adc6a9685ca17cb8245d872ae ****/
		%feature("compactdefaultargs") FixSameParameter;
		%feature("autodoc", "Tries to make edge sameparameter and sets corresponding tolerance and sameparameter flag. first, it makes edge same range if samerange flag is not set. //! if flag sameparameter is set, this method calls the function shapeanalysis_edge::checksameparameter() that calculates the maximal deviation of pcurves of the edge from its 3d curve. if deviation > tolerance, the tolerance of edge is increased to a value of deviation. if deviation < tolerance nothing happens. //! if flag sameparameter is not set, this method chooses the best variant (one that has minimal tolerance), either a. only after computing deviation (as above) or b. after calling standard procedure breplib::sameparameter and computing deviation (as above). if <tolerance> > 0, it is used as parameter for breplib::sameparameter, otherwise, tolerance of the edge is used. //! use : is to be called after all pcurves and 3d curve of the edge are correctly computed remark : sameparameter flag is always set to true after this method returns: true, if something done, else false status : ok - edge was initially sameparameter, nothing is done fail1 - computation of deviation of pcurves from 3d curve has failed fail2 - breplib::sameparameter() has failed done1 - tolerance of the edge was increased done2 - flag sameparameter was set to true (only if breplib::sameparameter() did not set it) done3 - edge was modified by breplib::sameparameter() to sameparameter done4 - not used anymore done5 - if the edge resulting from breplib has been chosen, i.e. variant b. above (only for edges with not set sameparameter).

Parameters
----------
edge: TopoDS_Edge
tolerance: float,optional
	default value is 0.0

Returns
-------
bool
") FixSameParameter;
		Standard_Boolean FixSameParameter(const TopoDS_Edge & edge, const Standard_Real tolerance = 0.0);

		/****************** FixSameParameter ******************/
		/**** md5 signature: 5aefb13c3d1e95353582a0f801e680f9 ****/
		%feature("compactdefaultargs") FixSameParameter;
		%feature("autodoc", "Tries to make edge sameparameter and sets corresponding tolerance and sameparameter flag. first, it makes edge same range if samerange flag is not set. //! if flag sameparameter is set, this method calls the function shapeanalysis_edge::checksameparameter() that calculates the maximal deviation of pcurves of the edge from its 3d curve. if deviation > tolerance, the tolerance of edge is increased to a value of deviation. if deviation < tolerance nothing happens. //! if flag sameparameter is not set, this method chooses the best variant (one that has minimal tolerance), either a. only after computing deviation (as above) or b. after calling standard procedure breplib::sameparameter and computing deviation (as above). if <tolerance> > 0, it is used as parameter for breplib::sameparameter, otherwise, tolerance of the edge is used. //! use : is to be called after all pcurves and 3d curve of the edge are correctly computed remark : sameparameter flag is always set to true after this method returns: true, if something done, else false status : ok - edge was initially sameparameter, nothing is done fail1 - computation of deviation of pcurves from 3d curve has failed fail2 - breplib::sameparameter() has failed done1 - tolerance of the edge was increased done2 - flag sameparameter was set to true (only if breplib::sameparameter() did not set it) done3 - edge was modified by breplib::sameparameter() to sameparameter done4 - not used anymore done5 - if the edge resulting from breplib has been chosen, i.e. variant b. above (only for edges with not set sameparameter).

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
tolerance: float,optional
	default value is 0.0

Returns
-------
bool
") FixSameParameter;
		Standard_Boolean FixSameParameter(const TopoDS_Edge & edge, const TopoDS_Face & face, const Standard_Real tolerance = 0.0);

		/****************** FixVertexTolerance ******************/
		/**** md5 signature: a626968c42c18892f4a6c83d23f8a488 ****/
		%feature("compactdefaultargs") FixVertexTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Returns
-------
bool
") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****************** FixVertexTolerance ******************/
		/**** md5 signature: dbd3a528a40746eacd169844d3ec6564 ****/
		%feature("compactdefaultargs") FixVertexTolerance;
		%feature("autodoc", "Increases the tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) returns: true, if tolerances have been increased, otherwise false status: ok : the original tolerances have not been changed done1: the tolerance of first vertex has been increased done2: the tolerance of last vertex has been increased.

Parameters
----------
edge: TopoDS_Edge

Returns
-------
bool
") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance(const TopoDS_Edge & edge);

		/****************** Projector ******************/
		/**** md5 signature: d7c337fc8423602b26620c0c4a1ed24a ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Returns the projector used for recomputing missing pcurves can be used for adjusting parameters of projector.

Returns
-------
opencascade::handle<ShapeConstruct_ProjectCurveOnSurface>
") Projector;
		opencascade::handle<ShapeConstruct_ProjectCurveOnSurface> Projector();

		/****************** SetContext ******************/
		/**** md5 signature: f37ffef0fea3299d082754a3f2f9af0c ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets context.

Parameters
----------
context: ShapeBuild_ReShape

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status (in the form of true/false) of last fix.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Edge)

%extend ShapeFix_Edge {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Context(self):
		pass
	}
};

/*****************************
* class ShapeFix_EdgeConnect *
*****************************/
class ShapeFix_EdgeConnect {
	public:
		/****************** ShapeFix_EdgeConnect ******************/
		/**** md5 signature: bd6ce7a1d676000fe3ac9e759cfc5c57 ****/
		%feature("compactdefaultargs") ShapeFix_EdgeConnect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_EdgeConnect;
		 ShapeFix_EdgeConnect();

		/****************** Add ******************/
		/**** md5 signature: f6e1fd05c99fbfc60ce15987a123628d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds information on connectivity between start vertex of second edge and end vertex of first edge, taking edges orientation into account.

Parameters
----------
aFirst: TopoDS_Edge
aSecond: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & aFirst, const TopoDS_Edge & aSecond);

		/****************** Add ******************/
		/**** md5 signature: 1c2c17ad83f5b4f9122afbf2d2376f4f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds connectivity information for the whole shape. note: edges in wires must be well ordered note: flag closed should be set for closed wires.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & aShape);

		/****************** Build ******************/
		/**** md5 signature: 634d88e5c99c5ce236c07b337243d591 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds shared vertices, updates their positions and tolerances.

Returns
-------
None
") Build;
		void Build();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal data structure.

Returns
-------
None
") Clear;
		void Clear();

};


%extend ShapeFix_EdgeConnect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeFix_EdgeProjAux *
*****************************/
class ShapeFix_EdgeProjAux : public Standard_Transient {
	public:
		/****************** ShapeFix_EdgeProjAux ******************/
		/**** md5 signature: 0e2ce94b0463e946ef6e4c5b51bb90ce ****/
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux();

		/****************** ShapeFix_EdgeProjAux ******************/
		/**** md5 signature: 5a22306eeac783995da6ee8c82b0ca85 ****/
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Returns
-------
None
") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****************** Compute ******************/
		/**** md5 signature: 101fd04c028b19056d70f3c0b7dc9422 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Parameters
----------
preci: float

Returns
-------
None
") Compute;
		void Compute(const Standard_Real preci);

		/****************** FirstParam ******************/
		/**** md5 signature: 5d66a8400e52b9f92dd399ea9b9289f6 ****/
		%feature("compactdefaultargs") FirstParam;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParam;
		Standard_Real FirstParam();

		/****************** Init ******************/
		/**** md5 signature: 246a9432c543ceed9ba47bf37f1257dc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****************** IsFirstDone ******************/
		/**** md5 signature: c3c894ef5fc56ac92ae52e13b557fe0e ****/
		%feature("compactdefaultargs") IsFirstDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsFirstDone;
		Standard_Boolean IsFirstDone();

		/****************** IsIso ******************/
		/**** md5 signature: f20fd2edeb722a138e08a79d2a567d64 ****/
		%feature("compactdefaultargs") IsIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
bool
") IsIso;
		Standard_Boolean IsIso(const opencascade::handle<Geom2d_Curve> & C);

		/****************** IsLastDone ******************/
		/**** md5 signature: 7bc2397fd2f2be3c553cb9a5e5b31c9c ****/
		%feature("compactdefaultargs") IsLastDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLastDone;
		Standard_Boolean IsLastDone();

		/****************** LastParam ******************/
		/**** md5 signature: 89ccbe370bc9c707c591b9642c247785 ****/
		%feature("compactdefaultargs") LastParam;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParam;
		Standard_Real LastParam();

};


%make_alias(ShapeFix_EdgeProjAux)

%extend ShapeFix_EdgeProjAux {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeFix_FaceConnect *
*****************************/
class ShapeFix_FaceConnect {
	public:
		/****************** ShapeFix_FaceConnect ******************/
		/**** md5 signature: 28540f2b0d244af2f831a8a2d5855554 ****/
		%feature("compactdefaultargs") ShapeFix_FaceConnect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_FaceConnect;
		 ShapeFix_FaceConnect();

		/****************** Add ******************/
		/**** md5 signature: 1f1c60a49bb1b7e3c6990322a7db218d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFirst: TopoDS_Face
aSecond: TopoDS_Face

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopoDS_Face & aFirst, const TopoDS_Face & aSecond);

		/****************** Build ******************/
		/**** md5 signature: 5e789671d5b53a158f689d110fc5c599 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "No available documentation.

Parameters
----------
shell: TopoDS_Shell
sewtoler: float
fixtoler: float

Returns
-------
TopoDS_Shell
") Build;
		TopoDS_Shell Build(const TopoDS_Shell & shell, const Standard_Real sewtoler, const Standard_Real fixtoler);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal data structure.

Returns
-------
None
") Clear;
		void Clear();

};


%extend ShapeFix_FaceConnect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeFix_FreeBounds *
****************************/
class ShapeFix_FreeBounds {
	public:
		/****************** ShapeFix_FreeBounds ******************/
		/**** md5 signature: 51221d26a9f2e1a24cfea213a36da9f8 ****/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds();

		/****************** ShapeFix_FreeBounds ******************/
		/**** md5 signature: ccd1973813f83deec3de22c6d89c159e ****/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "Builds forecasting free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of faces. tolerance <closetoler> should be greater than tolerance <sewtoler> used for initializing sewing analyzer, otherwise connection of open wires is not performed.

Parameters
----------
shape: TopoDS_Shape
sewtoler: float
closetoler: float
splitclosed: bool
splitopen: bool

Returns
-------
None
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds(const TopoDS_Shape & shape, const Standard_Real sewtoler, const Standard_Real closetoler, const Standard_Boolean splitclosed, const Standard_Boolean splitopen);

		/****************** ShapeFix_FreeBounds ******************/
		/**** md5 signature: 13ccb3bf9d728c9495f068d6cc26905f ****/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "Builds actual free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of shells.

Parameters
----------
shape: TopoDS_Shape
closetoler: float
splitclosed: bool
splitopen: bool

Returns
-------
None
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds(const TopoDS_Shape & shape, const Standard_Real closetoler, const Standard_Boolean splitclosed, const Standard_Boolean splitopen);

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

		/****************** GetShape ******************/
		/**** md5 signature: 68adf76e3cbb4c2e8340f398e62eb4da ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Returns modified source shape.

Returns
-------
TopoDS_Shape
") GetShape;
		const TopoDS_Shape GetShape();

};


%extend ShapeFix_FreeBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class ShapeFix_IntersectionTool *
**********************************/
class ShapeFix_IntersectionTool {
	public:
		/****************** ShapeFix_IntersectionTool ******************/
		/**** md5 signature: 1bdffc379964a023b91ac6c0132dc695 ****/
		%feature("compactdefaultargs") ShapeFix_IntersectionTool;
		%feature("autodoc", "Constructor.

Parameters
----------
context: ShapeBuild_ReShape
preci: float
maxtol: float,optional
	default value is 1.0

Returns
-------
None
") ShapeFix_IntersectionTool;
		 ShapeFix_IntersectionTool(const opencascade::handle<ShapeBuild_ReShape> & context, const Standard_Real preci, const Standard_Real maxtol = 1.0);

		/****************** Context ******************/
		/**** md5 signature: 89f59aaf74eb4221c2a98a0e91f389d7 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns context.

Returns
-------
opencascade::handle<ShapeBuild_ReShape>
") Context;
		opencascade::handle<ShapeBuild_ReShape> Context();

		/****************** CutEdge ******************/
		/**** md5 signature: ae5cc6d60f5363b7e248b602fbcfc764 ****/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "Cut edge by parameters pend and cut.

Parameters
----------
edge: TopoDS_Edge
pend: float
cut: float
face: TopoDS_Face

Returns
-------
iscutline: bool
") CutEdge;
		Standard_Boolean CutEdge(const TopoDS_Edge & edge, const Standard_Real pend, const Standard_Real cut, const TopoDS_Face & face, Standard_Boolean &OutValue);

		/****************** FixIntersectingWires ******************/
		/**** md5 signature: d95915c7fd39aab99b5fd53f99ca7dcf ****/
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
face: TopoDS_Face

Returns
-------
bool
") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires(TopoDS_Face & face);

		/****************** FixSelfIntersectWire ******************/
		/**** md5 signature: 3e6197a1b211aa6dd7590593466f9b2a ****/
		%feature("compactdefaultargs") FixSelfIntersectWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
sewd: ShapeExtend_WireData
face: TopoDS_Face

Returns
-------
NbSplit: int
NbCut: int
NbRemoved: int
") FixSelfIntersectWire;
		Standard_Boolean FixSelfIntersectWire(opencascade::handle<ShapeExtend_WireData> & sewd, const TopoDS_Face & face, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SplitEdge ******************/
		/**** md5 signature: faf85fd43715280470d01dee2e2c8759 ****/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting the 'face' is necessary for pcurves and using transferparameterproj.

Parameters
----------
edge: TopoDS_Edge
param: float
vert: TopoDS_Vertex
face: TopoDS_Face
newE1: TopoDS_Edge
newE2: TopoDS_Edge
preci: float

Returns
-------
bool
") SplitEdge;
		Standard_Boolean SplitEdge(const TopoDS_Edge & edge, const Standard_Real param, const TopoDS_Vertex & vert, const TopoDS_Face & face, TopoDS_Edge & newE1, TopoDS_Edge & newE2, const Standard_Real preci);

};


%extend ShapeFix_IntersectionTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ShapeFix_Root *
**********************/
class ShapeFix_Root : public Standard_Transient {
	public:
		/****************** ShapeFix_Root ******************/
		/**** md5 signature: 0429589d904ddf3e40509ee1aba9824e ****/
		%feature("compactdefaultargs") ShapeFix_Root;
		%feature("autodoc", "Empty constructor (no context is created).

Returns
-------
None
") ShapeFix_Root;
		 ShapeFix_Root();

		/****************** Context ******************/
		/**** md5 signature: 89f59aaf74eb4221c2a98a0e91f389d7 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns context.

Returns
-------
opencascade::handle<ShapeBuild_ReShape>
") Context;
		opencascade::handle<ShapeBuild_ReShape> Context();

		/****************** LimitTolerance ******************/
		/**** md5 signature: 1120a13b64b8d00fb9f9fc07e07ffa98 ****/
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "Returns tolerance limited by [mymintol,mymaxtol].

Parameters
----------
toler: float

Returns
-------
float
") LimitTolerance;
		Standard_Real LimitTolerance(const Standard_Real toler);

		/****************** MaxTolerance ******************/
		/**** md5 signature: b0c09a40965fea8fc4d63c52a795d7fd ****/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Returns maximal allowed tolerance.

Returns
-------
float
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****************** MinTolerance ******************/
		/**** md5 signature: 2629547ec2afd3a7a2edaa268cbc0366 ****/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "Returns minimal allowed tolerance.

Returns
-------
float
") MinTolerance;
		Standard_Real MinTolerance();

		/****************** MsgRegistrator ******************/
		/**** md5 signature: 75371a4ad2792d7881281f65d5c59c1b ****/
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "Returns message registrator.

Returns
-------
opencascade::handle<ShapeExtend_BasicMsgRegistrator>
") MsgRegistrator;
		opencascade::handle<ShapeExtend_BasicMsgRegistrator> MsgRegistrator();

		/****************** Precision ******************/
		/**** md5 signature: 34c7e39bd57a685873eea74fa4629747 ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns basic precision value.

Returns
-------
float
") Precision;
		Standard_Real Precision();

		/****************** SendFail ******************/
		/**** md5 signature: 8cfa9a9f964baf3ffe1f3268529e308a ****/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "Sends a fail to be attached to the shape. calls sendmsg with gravity set to message_fail.

Parameters
----------
shape: TopoDS_Shape
message: Message_Msg

Returns
-------
None
") SendFail;
		void SendFail(const TopoDS_Shape & shape, const Message_Msg & message);

		/****************** SendFail ******************/
		/**** md5 signature: bb5fe6cd5b2a82fbd6f821e6b716f469 ****/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "Calls previous method for myshape.

Parameters
----------
message: Message_Msg

Returns
-------
None
") SendFail;
		void SendFail(const Message_Msg & message);

		/****************** SendMsg ******************/
		/**** md5 signature: 63af56acccb2dd5832d840956eefee1e ****/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "Sends a message to be attached to the shape. calls corresponding message of message registrator.

Parameters
----------
shape: TopoDS_Shape
message: Message_Msg
gravity: Message_Gravity,optional
	default value is Message_Info

Returns
-------
None
") SendMsg;
		void SendMsg(const TopoDS_Shape & shape, const Message_Msg & message, const Message_Gravity gravity = Message_Info);

		/****************** SendMsg ******************/
		/**** md5 signature: 3926d6c44e447d96694bbec386b0ec60 ****/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "Sends a message to be attached to myshape. calls previous method.

Parameters
----------
message: Message_Msg
gravity: Message_Gravity,optional
	default value is Message_Info

Returns
-------
None
") SendMsg;
		void SendMsg(const Message_Msg & message, const Message_Gravity gravity = Message_Info);

		/****************** SendWarning ******************/
		/**** md5 signature: f01bef9c0702b9d5edea1ef70e1d4137 ****/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "Sends a warning to be attached to the shape. calls sendmsg with gravity set to message_warning.

Parameters
----------
shape: TopoDS_Shape
message: Message_Msg

Returns
-------
None
") SendWarning;
		void SendWarning(const TopoDS_Shape & shape, const Message_Msg & message);

		/****************** SendWarning ******************/
		/**** md5 signature: fa5c8bdada69aee67e8a7f89bf881433 ****/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "Calls previous method for myshape.

Parameters
----------
message: Message_Msg

Returns
-------
None
") SendWarning;
		void SendWarning(const Message_Msg & message);

		/****************** Set ******************/
		/**** md5 signature: 39aa8a21842f317d88d4b3daecb3a64c ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Copy all fields from another root object.

Parameters
----------
Root: ShapeFix_Root

Returns
-------
None
") Set;
		virtual void Set(const opencascade::handle<ShapeFix_Root> & Root);

		/****************** SetContext ******************/
		/**** md5 signature: 93cd3c1274c459de970a0dad7c4a45e1 ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets context.

Parameters
----------
context: ShapeBuild_ReShape

Returns
-------
None
") SetContext;
		virtual void SetContext(const opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: 208a8e0dcd3c4d1e347c7176eff58d2b ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal allowed tolerance.

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		virtual void SetMaxTolerance(const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: b5b624b2ff6f4be9adc4d57dfdc3a513 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets minimal allowed tolerance.

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTolerance;
		virtual void SetMinTolerance(const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		/**** md5 signature: 684cc840be09df59bc67d102aa6274f1 ****/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "Sets message registrator.

Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Returns
-------
None
") SetMsgRegistrator;
		virtual void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		/**** md5 signature: 3ff50d53ee86715713f9361f674240d3 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets basic precision value.

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		virtual void SetPrecision(const Standard_Real preci);

};


%make_alias(ShapeFix_Root)

%extend ShapeFix_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ShapeFix_ShapeTolerance *
********************************/
class ShapeFix_ShapeTolerance {
	public:
		/****************** ShapeFix_ShapeTolerance ******************/
		/**** md5 signature: f73d33ac6c9ace18d97fa9e0714ea572 ****/
		%feature("compactdefaultargs") ShapeFix_ShapeTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_ShapeTolerance;
		 ShapeFix_ShapeTolerance();

		/****************** LimitTolerance ******************/
		/**** md5 signature: d9fed03c1130a955e4d49618e7987006 ****/
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "Limits tolerances in a shape as follows : tmin = tmax -> as settolerance (forces) tmin = 0 -> maximum tolerance will be <tmax> tmax = 0 or not given (more generally, tmax < tmin) -> <tmax> ignored, minimum will be <tmin> else, maximum will be <max> and minimum will be <min> styp = vertex : only vertices are set styp = edge : only edges are set styp = face : only faces are set styp = wire : to have edges and their vertices set styp = other value : all (vertices,edges,faces) are set returns true if at least one tolerance of the sub-shape has been modified.

Parameters
----------
shape: TopoDS_Shape
tmin: float
tmax: float,optional
	default value is 0.0
styp: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
bool
") LimitTolerance;
		Standard_Boolean LimitTolerance(const TopoDS_Shape & shape, const Standard_Real tmin, const Standard_Real tmax = 0.0, const TopAbs_ShapeEnum styp = TopAbs_SHAPE);

		/****************** SetTolerance ******************/
		/**** md5 signature: 668e51e1df701aad06e61e72d110857a ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets (enforces) tolerances in a shape to the given value styp = vertex : only vertices are set styp = edge : only edges are set styp = face : only faces are set styp = wire : to have edges and their vertices set styp = other value : all (vertices,edges,faces) are set.

Parameters
----------
shape: TopoDS_Shape
preci: float
styp: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") SetTolerance;
		void SetTolerance(const TopoDS_Shape & shape, const Standard_Real preci, const TopAbs_ShapeEnum styp = TopAbs_SHAPE);

};


%extend ShapeFix_ShapeTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeFix_SplitTool *
***************************/
class ShapeFix_SplitTool {
	public:
		/****************** ShapeFix_SplitTool ******************/
		/**** md5 signature: f3038d3d62636e51849c2f5fefc09727 ****/
		%feature("compactdefaultargs") ShapeFix_SplitTool;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeFix_SplitTool;
		 ShapeFix_SplitTool();

		/****************** CutEdge ******************/
		/**** md5 signature: ae5cc6d60f5363b7e248b602fbcfc764 ****/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "Cut edge by parameters pend and cut.

Parameters
----------
edge: TopoDS_Edge
pend: float
cut: float
face: TopoDS_Face

Returns
-------
iscutline: bool
") CutEdge;
		Standard_Boolean CutEdge(const TopoDS_Edge & edge, const Standard_Real pend, const Standard_Real cut, const TopoDS_Face & face, Standard_Boolean &OutValue);

		/****************** SplitEdge ******************/
		/**** md5 signature: 4bd152bdd67a5f294c5da4ab381e8c42 ****/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting the 'face' is necessary for pcurves and using transferparameterproj.

Parameters
----------
edge: TopoDS_Edge
param: float
vert: TopoDS_Vertex
face: TopoDS_Face
newE1: TopoDS_Edge
newE2: TopoDS_Edge
tol3d: float
tol2d: float

Returns
-------
bool
") SplitEdge;
		Standard_Boolean SplitEdge(const TopoDS_Edge & edge, const Standard_Real param, const TopoDS_Vertex & vert, const TopoDS_Face & face, TopoDS_Edge & newE1, TopoDS_Edge & newE2, const Standard_Real tol3d, const Standard_Real tol2d);

		/****************** SplitEdge ******************/
		/**** md5 signature: 5a34faa237a000b667de279a4c7189ae ****/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "Split edge on two new edges using new vertex 'vert' and 'param1' and 'param2' - parameter for splitting and cutting the 'face' is necessary for pcurves and using transferparameterproj.

Parameters
----------
edge: TopoDS_Edge
param1: float
param2: float
vert: TopoDS_Vertex
face: TopoDS_Face
newE1: TopoDS_Edge
newE2: TopoDS_Edge
tol3d: float
tol2d: float

Returns
-------
bool
") SplitEdge;
		Standard_Boolean SplitEdge(const TopoDS_Edge & edge, const Standard_Real param1, const Standard_Real param2, const TopoDS_Vertex & vert, const TopoDS_Face & face, TopoDS_Edge & newE1, TopoDS_Edge & newE2, const Standard_Real tol3d, const Standard_Real tol2d);

		/****************** SplitEdge ******************/
		/**** md5 signature: c98c6fb65c11ba21498077d4ce5c7f38 ****/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "Split edge on two new edges using two new vertex v1 and v2 and two parameters for splitting - fp and lp correspondingly the 'face' is necessary for pcurves and using transferparameterproj anum - number of edge in seqe which corresponding to [fp,lp].

Parameters
----------
edge: TopoDS_Edge
fp: float
V1: TopoDS_Vertex
lp: float
V2: TopoDS_Vertex
face: TopoDS_Face
SeqE: TopTools_SequenceOfShape
context: ShapeBuild_ReShape
tol3d: float
tol2d: float

Returns
-------
aNum: int
") SplitEdge;
		Standard_Boolean SplitEdge(const TopoDS_Edge & edge, const Standard_Real fp, const TopoDS_Vertex & V1, const Standard_Real lp, const TopoDS_Vertex & V2, const TopoDS_Face & face, TopTools_SequenceOfShape & SeqE, Standard_Integer &OutValue, const opencascade::handle<ShapeBuild_ReShape> & context, const Standard_Real tol3d, const Standard_Real tol2d);

};


%extend ShapeFix_SplitTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeFix_WireSegment *
*****************************/
/****************************
* class ShapeFix_WireVertex *
****************************/
class ShapeFix_WireVertex {
	public:
		/****************** ShapeFix_WireVertex ******************/
		/**** md5 signature: 64943af3f3eb0afd1de7b3c12f34f047 ****/
		%feature("compactdefaultargs") ShapeFix_WireVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_WireVertex;
		 ShapeFix_WireVertex();

		/****************** Analyzer ******************/
		/**** md5 signature: 5e1625a1025a731a5fee17af33e388ff ****/
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "Returns internal analyzer.

Returns
-------
ShapeAnalysis_WireVertex
") Analyzer;
		const ShapeAnalysis_WireVertex & Analyzer();

		/****************** Fix ******************/
		/**** md5 signature: 215a881227de7e9204532f8d2fd8d794 ****/
		%feature("compactdefaultargs") Fix;
		%feature("autodoc", "Fixes all statuses except 'disjoined', i.e. the cases in which a common value has been set, with or without changing parameters returns the count of fixed vertices, 0 if none.

Returns
-------
int
") Fix;
		Standard_Integer Fix();

		/****************** FixSame ******************/
		/**** md5 signature: f69350a87bca147160c45322ce6b6fa4 ****/
		%feature("compactdefaultargs") FixSame;
		%feature("autodoc", "Fixes 'same' or 'close' status (same vertex may be set, without changing parameters) returns the count of fixed vertices, 0 if none.

Returns
-------
int
") FixSame;
		Standard_Integer FixSame();

		/****************** Init ******************/
		/**** md5 signature: ce6401735f705d8382645a726c79e907 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Loads the wire, ininializes internal analyzer (shapeanalysis_wirevertex) with the given precision, and performs analysis.

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
		/**** md5 signature: f41161adfbe2d37d2f0f25b5965004df ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Loads the wire, ininializes internal analyzer (shapeanalysis_wirevertex) with the given precision, and performs analysis.

Parameters
----------
sbwd: ShapeExtend_WireData
preci: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & sbwd, const Standard_Real preci);

		/****************** Init ******************/
		/**** md5 signature: 7d4943cc88255526a194903195389755 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Loads all the data on wire, already analysed by shapeanalysis_wirevertex.

Parameters
----------
sawv: ShapeAnalysis_WireVertex

Returns
-------
None
") Init;
		void Init(const ShapeAnalysis_WireVertex & sawv);

		/****************** Wire ******************/
		/**** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns resulting wire (fixed).

Returns
-------
TopoDS_Wire
") Wire;
		TopoDS_Wire Wire();

		/****************** WireData ******************/
		/**** md5 signature: c8792f073dea4df1af697814fbf5f311 ****/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Returns data on wire (fixed).

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData();

};


%extend ShapeFix_WireVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ShapeFix_ComposeShell *
******************************/
class ShapeFix_ComposeShell : public ShapeFix_Root {
	public:
		/****************** ShapeFix_ComposeShell ******************/
		/**** md5 signature: 23795f6942df730c844bd4a1f99bb726 ****/
		%feature("compactdefaultargs") ShapeFix_ComposeShell;
		%feature("autodoc", "Creates empty tool.

Returns
-------
None
") ShapeFix_ComposeShell;
		 ShapeFix_ComposeShell();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetClosedMode() {
            return (Standard_Boolean) $self->ClosedMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetClosedMode(Standard_Boolean value) {
            $self->ClosedMode()=value;
            }
        };
		/****************** DispatchWires ******************/
		/**** md5 signature: da08bb92d1c47ca130e30848d84a83b3 ****/
		%feature("compactdefaultargs") DispatchWires;
		%feature("autodoc", "Creates new faces from the set of (closed) wires. each wire is put on corresponding patch in the composite surface, and all pcurves on the initial (pseudo)face are reassigned to that surface. if several wires are one inside another, single face is created.

Parameters
----------
faces: TopTools_SequenceOfShape
wires: ShapeFix_SequenceOfWireSegment

Returns
-------
None
") DispatchWires;
		void DispatchWires(TopTools_SequenceOfShape & faces, ShapeFix_SequenceOfWireSegment & wires);

		/****************** GetTransferParamTool ******************/
		/**** md5 signature: b9e239d6f4c9de02af2a5cc4956eff51 ****/
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "Gets tool for transfer parameters from 3d to 2d and vice versa.

Returns
-------
opencascade::handle<ShapeAnalysis_TransferParameters>
") GetTransferParamTool;
		opencascade::handle<ShapeAnalysis_TransferParameters> GetTransferParamTool();

		/****************** Init ******************/
		/**** md5 signature: 7eb579e7aa3a05978fd870e7f72134a5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with composite surface, face and precision. here face defines both set of wires and way of getting pcurves. precision is used (together with tolerance of edges) for handling subtle cases, such as tangential intersections.

Parameters
----------
Grid: ShapeExtend_CompositeSurface
L: TopLoc_Location
Face: TopoDS_Face
Prec: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeExtend_CompositeSurface> & Grid, const TopLoc_Location & L, const TopoDS_Face & Face, const Standard_Real Prec);

		/****************** Perform ******************/
		/**** md5 signature: 13c494512ebd157b19de66d8b841f157 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the work on already loaded data.

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform();

		/****************** Result ******************/
		/**** md5 signature: 64e8e20a963b00a422945949bd4e1549 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns resulting shell or face (or null shape if not done).

Returns
-------
TopoDS_Shape
") Result;
		const TopoDS_Shape Result();

		/****************** SetTransferParamTool ******************/
		/**** md5 signature: 4188a11705a4f1a9d9396cc0ac077382 ****/
		%feature("compactdefaultargs") SetTransferParamTool;
		%feature("autodoc", "Sets tool for transfer parameters from 3d to 2d and vice versa.

Parameters
----------
TransferParam: ShapeAnalysis_TransferParameters

Returns
-------
None
") SetTransferParamTool;
		void SetTransferParamTool(const opencascade::handle<ShapeAnalysis_TransferParameters> & TransferParam);

		/****************** SplitEdges ******************/
		/**** md5 signature: 331bb3c5f5af91cdf07f7ad382ac1f69 ****/
		%feature("compactdefaultargs") SplitEdges;
		%feature("autodoc", "Splits edges in the original shape by grid. this is a part of perform() which does not produce any resulting shape; the only result is filled context where splittings are recorded. //! note: if edge is splitted, it is replaced by wire, and order of edges in the wire corresponds to forward orientation of the edge.

Returns
-------
None
") SplitEdges;
		void SplitEdges();

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Queries status of last call to perform() ok : nothing done (some kind of error) done1: splitting is done, at least one new face created done2: splitting is done, several new faces obtained fail1: misoriented wire encountered (handled) fail2: recoverable parity error fail3: edge with no pcurve on supporting face fail4: unrecoverable algorithm error (parity check).

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeFix_ComposeShell)

%extend ShapeFix_ComposeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ShapeFix_Face *
**********************/
class ShapeFix_Face : public ShapeFix_Root {
	public:
		/****************** ShapeFix_Face ******************/
		/**** md5 signature: 8515b78e3eb57447eafabb2cc591abb5 ****/
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") ShapeFix_Face;
		 ShapeFix_Face();

		/****************** ShapeFix_Face ******************/
		/**** md5 signature: f2684f8c11ec497c2c9257db58a910c9 ****/
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "Creates a tool and loads a face.

Parameters
----------
face: TopoDS_Face

Returns
-------
None
") ShapeFix_Face;
		 ShapeFix_Face(const TopoDS_Face & face);

		/****************** Add ******************/
		/**** md5 signature: dfcb95b19b591e4ebe7ce59a61e5168c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add a wire to current face using brep_builder. wire is added without taking into account orientation of face (as if face were forward).

Parameters
----------
wire: TopoDS_Wire

Returns
-------
None
") Add;
		void Add(const TopoDS_Wire & wire);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetAutoCorrectPrecisionMode() {
            return (Standard_Integer) $self->AutoCorrectPrecisionMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetAutoCorrectPrecisionMode(Standard_Integer value) {
            $self->AutoCorrectPrecisionMode()=value;
            }
        };
		/****************** ClearModes ******************/
		/**** md5 signature: dacb0a374c08161f5c8f0805fdf25f2f ****/
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "Sets all modes to default.

Returns
-------
None
") ClearModes;
		virtual void ClearModes();

		/****************** Face ******************/
		/**** md5 signature: 64c75db1e9c1285068e9dd474618f74f ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns a face which corresponds to the current state warning: the finally produced face may be another one ... but with the same support.

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face();

		/****************** FixAddNaturalBound ******************/
		/**** md5 signature: 9b3ad075c02662990a9cfa0d4ac8ec0d ****/
		%feature("compactdefaultargs") FixAddNaturalBound;
		%feature("autodoc", "Adds natural boundary on face if it is missing. two cases are supported: - face has no wires - face lies on geometrically double-closed surface (sphere or torus) and none of wires is left-oriented returns true if natural boundary was added.

Returns
-------
bool
") FixAddNaturalBound;
		Standard_Boolean FixAddNaturalBound();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixAddNaturalBoundMode() {
            return (Standard_Integer) $self->FixAddNaturalBoundMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixAddNaturalBoundMode(Standard_Integer value) {
            $self->FixAddNaturalBoundMode()=value;
            }
        };
		/****************** FixIntersectingWires ******************/
		/**** md5 signature: 983240c7ea46f94233cee9d79eb8ae2d ****/
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", "Detects and fixes the special case when face has more than one wire and this wires have intersection point.

Returns
-------
bool
") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixIntersectingWiresMode() {
            return (Standard_Integer) $self->FixIntersectingWiresMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixIntersectingWiresMode(Standard_Integer value) {
            $self->FixIntersectingWiresMode()=value;
            }
        };
		/****************** FixLoopWire ******************/
		/**** md5 signature: f97141bba35ff4c3a243e9711fbe3754 ****/
		%feature("compactdefaultargs") FixLoopWire;
		%feature("autodoc", "Detects if wire has a loop and fixes this situation by splitting on the few parts. if wire has a loops and it was splitted status was set to value shapeextend_done6.

Parameters
----------
aResWires: TopTools_SequenceOfShape

Returns
-------
bool
") FixLoopWire;
		Standard_Boolean FixLoopWire(TopTools_SequenceOfShape & aResWires);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixLoopWiresMode() {
            return (Standard_Integer) $self->FixLoopWiresMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixLoopWiresMode(Standard_Integer value) {
            $self->FixLoopWiresMode()=value;
            }
        };
		/****************** FixMissingSeam ******************/
		/**** md5 signature: 790dff73c7407407403ff6deff540a68 ****/
		%feature("compactdefaultargs") FixMissingSeam;
		%feature("autodoc", "Detects and fixes the special case when face on a closed surface is given by two wires closed in 3d but with gap in 2d. in that case it creates a new wire from the two, and adds a missing seam edge returns true if missing seam was added.

Returns
-------
bool
") FixMissingSeam;
		Standard_Boolean FixMissingSeam();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixMissingSeamMode() {
            return (Standard_Integer) $self->FixMissingSeamMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixMissingSeamMode(Standard_Integer value) {
            $self->FixMissingSeamMode()=value;
            }
        };
		/****************** FixOrientation ******************/
		/**** md5 signature: e6de7f40106f8e198731665b92da549a ****/
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "Fixes orientation of wires on the face it tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. if face lying on sphere or torus has single wire and addnaturalboundmode is true, that wire is not reversed in any case (supposing that natural bound will be added). returns true if wires were reversed.

Returns
-------
bool
") FixOrientation;
		Standard_Boolean FixOrientation();

		/****************** FixOrientation ******************/
		/**** md5 signature: a1ac25beb4754ae8559a627184382387 ****/
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "Fixes orientation of wires on the face it tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. if face lying on sphere or torus has single wire and addnaturalboundmode is true, that wire is not reversed in any case (supposing that natural bound will be added). returns true if wires were reversed outwires return information about out wires + list of internal wires for each (for performing split face).

Parameters
----------
MapWires: TopTools_DataMapOfShapeListOfShape

Returns
-------
bool
") FixOrientation;
		Standard_Boolean FixOrientation(TopTools_DataMapOfShapeListOfShape & MapWires);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixOrientationMode() {
            return (Standard_Integer) $self->FixOrientationMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixOrientationMode(Standard_Integer value) {
            $self->FixOrientationMode()=value;
            }
        };
		/****************** FixPeriodicDegenerated ******************/
		/**** md5 signature: 5867eb366738940d651b8f5a9b4794d5 ****/
		%feature("compactdefaultargs") FixPeriodicDegenerated;
		%feature("autodoc", "Fixes topology for a specific case when face is composed by a single wire belting a periodic surface. in that case a degenerated edge is reconstructed in the degenerated pole of the surface. initial wire gets consistent orientation. must be used in couple and before fixmissingseam routine.

Returns
-------
bool
") FixPeriodicDegenerated;
		Standard_Boolean FixPeriodicDegenerated();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixPeriodicDegeneratedMode() {
            return (Standard_Integer) $self->FixPeriodicDegeneratedMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixPeriodicDegeneratedMode(Standard_Integer value) {
            $self->FixPeriodicDegeneratedMode()=value;
            }
        };
		/****************** FixSmallAreaWire ******************/
		/**** md5 signature: a6de3c9119ea607ad8a18a4fd619f0a3 ****/
		%feature("compactdefaultargs") FixSmallAreaWire;
		%feature("autodoc", "Detects wires with small area (that is less than 100*precision::pconfusion(). removes these wires if they are internal. returns : true if at least one small wire removed, false if does nothing.

Parameters
----------
theIsRemoveSmallFace: bool

Returns
-------
bool
") FixSmallAreaWire;
		Standard_Boolean FixSmallAreaWire(const Standard_Boolean theIsRemoveSmallFace);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSmallAreaWireMode() {
            return (Standard_Integer) $self->FixSmallAreaWireMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSmallAreaWireMode(Standard_Integer value) {
            $self->FixSmallAreaWireMode()=value;
            }
        };
		/****************** FixSplitFace ******************/
		/**** md5 signature: 29d930b1cb1b14cd74d337d45a6317f2 ****/
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", "Split face if there are more than one out wire using inrormation after fixorientation().

Parameters
----------
MapWires: TopTools_DataMapOfShapeListOfShape

Returns
-------
bool
") FixSplitFace;
		Standard_Boolean FixSplitFace(const TopTools_DataMapOfShapeListOfShape & MapWires);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSplitFaceMode() {
            return (Standard_Integer) $self->FixSplitFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSplitFaceMode(Standard_Integer value) {
            $self->FixSplitFaceMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixWireMode() {
            return (Standard_Integer) $self->FixWireMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixWireMode(Standard_Integer value) {
            $self->FixWireMode()=value;
            }
        };
		/****************** FixWireTool ******************/
		/**** md5 signature: 0f06026c1e0aa8536ddc996f0ba4501a ****/
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "Returns tool for fixing wires.

Returns
-------
opencascade::handle<ShapeFix_Wire>
") FixWireTool;
		opencascade::handle<ShapeFix_Wire> FixWireTool();

		/****************** FixWiresTwoCoincEdges ******************/
		/**** md5 signature: 492754cb0a8c0497c5a444368d5499a8 ****/
		%feature("compactdefaultargs") FixWiresTwoCoincEdges;
		%feature("autodoc", "If wire contains two coincidence edges it must be removed queries on status after perform().

Returns
-------
bool
") FixWiresTwoCoincEdges;
		Standard_Boolean FixWiresTwoCoincEdges();

		/****************** Init ******************/
		/**** md5 signature: bf5e73c6f5e07feeee65de419942b9c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Loads a whole face already created, with its wires, sense and location.

Parameters
----------
face: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & face);

		/****************** Init ******************/
		/**** md5 signature: 47e3368959c0039cc9c82604eff91ce2 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Starts the creation of the face by default it will be forward, or reversed if <fwd> is false.

Parameters
----------
surf: Geom_Surface
preci: float
fwd: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & surf, const Standard_Real preci, const Standard_Boolean fwd = Standard_True);

		/****************** Init ******************/
		/**** md5 signature: 36ab1cdacf4b3b9d1e6c160db943ee10 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Starts the creation of the face by default it will be forward, or reversed if <fwd> is false.

Parameters
----------
surf: ShapeAnalysis_Surface
preci: float
fwd: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeAnalysis_Surface> & surf, const Standard_Real preci, const Standard_Boolean fwd = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs all the fixes, depending on modes function status returns the status of last call to perform() shapeextend_ok : face was ok, nothing done shapeextend_done1: some wires are fixed shapeextend_done2: orientation of wires fixed shapeextend_done3: missing seam added shapeextend_done4: small area wire removed shapeextend_done5: natural bounds added shapeextend_fail1: some fails during fixing wires shapeextend_fail2: cannot fix orientation of wires shapeextend_fail3: cannot add missing seam shapeextend_fail4: cannot remove small area wire.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetRemoveSmallAreaFaceMode() {
            return (Standard_Integer) $self->RemoveSmallAreaFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetRemoveSmallAreaFaceMode(Standard_Integer value) {
            $self->RemoveSmallAreaFaceMode()=value;
            }
        };
		/****************** Result ******************/
		/**** md5 signature: e7d296a4a4a5995509cb67e3ee28f5dc ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns resulting shape (face or shell if splitted) to be used instead of face() if fixmissingseam involved.

Returns
-------
TopoDS_Shape
") Result;
		TopoDS_Shape Result();

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: b7cb625408a036b53cb8ef0bd1f74be7 ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal allowed tolerance (also to fixwiretool).

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		virtual void SetMaxTolerance(const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: 118b24db5991a9b12505b50713610933 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets minimal allowed tolerance (also to fixwiretool).

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTolerance;
		virtual void SetMinTolerance(const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		/**** md5 signature: 7d0124cc4910ea7f49d1899bae9f9445 ****/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "Sets message registrator.

Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Returns
-------
None
") SetMsgRegistrator;
		virtual void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		/**** md5 signature: 92d78323d62150cdb5c9a0f5c7cac931 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets basic precision value (also to fixwiretool).

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		virtual void SetPrecision(const Standard_Real preci);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of last call to perform() shapeextend_ok : face was ok, nothing done shapeextend_done1: some wires are fixed shapeextend_done2: orientation of wires fixed shapeextend_done3: missing seam added shapeextend_done4: small area wire removed shapeextend_done5: natural bounds added shapeextend_done8: face may be splited shapeextend_fail1: some fails during fixing wires shapeextend_fail2: cannot fix orientation of wires shapeextend_fail3: cannot add missing seam shapeextend_fail4: cannot remove small area wire.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Face)

%extend ShapeFix_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ShapeFix_FixSmallFace *
******************************/
class ShapeFix_FixSmallFace : public ShapeFix_Root {
	public:
		/****************** ShapeFix_FixSmallFace ******************/
		/**** md5 signature: 6afb4049203da26745ef2bba554463fe ****/
		%feature("compactdefaultargs") ShapeFix_FixSmallFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_FixSmallFace;
		 ShapeFix_FixSmallFace();

		/****************** ComputeSharedEdgeForStripFace ******************/
		/**** md5 signature: 4f8efb90c70897fe3b4e98c710d39ae1 ****/
		%feature("compactdefaultargs") ComputeSharedEdgeForStripFace;
		%feature("autodoc", "Compute average edge for strip face.

Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
F1: TopoDS_Face
tol: float

Returns
-------
TopoDS_Edge
") ComputeSharedEdgeForStripFace;
		TopoDS_Edge ComputeSharedEdgeForStripFace(const TopoDS_Face & F, const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Face & F1, const Standard_Real tol);

		/****************** FixFace ******************/
		/**** md5 signature: 4b35b5a540a8001d3a226dac5e26a73f ****/
		%feature("compactdefaultargs") FixFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
TopoDS_Face
") FixFace;
		TopoDS_Face FixFace(const TopoDS_Face & F);

		/****************** FixPinFace ******************/
		/**** md5 signature: d0988d14330ff05e059cecc3df97bc51 ****/
		%feature("compactdefaultargs") FixPinFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") FixPinFace;
		Standard_Boolean FixPinFace(TopoDS_Face & F);

		/****************** FixShape ******************/
		/**** md5 signature: 44130b08f788133d21d1c73f557d186b ****/
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") FixShape;
		TopoDS_Shape FixShape();

		/****************** FixSplitFace ******************/
		/**** md5 signature: 96aa25d52cdd075b2457c6a993bcd878 ****/
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") FixSplitFace;
		TopoDS_Shape FixSplitFace(const TopoDS_Shape & S);

		/****************** FixSpotFace ******************/
		/**** md5 signature: 92fdf1a27d257e6c8e16c7929e436cc0 ****/
		%feature("compactdefaultargs") FixSpotFace;
		%feature("autodoc", "Fixing case of spot face, if tol = -1 used local tolerance.

Returns
-------
TopoDS_Shape
") FixSpotFace;
		TopoDS_Shape FixSpotFace();

		/****************** FixStripFace ******************/
		/**** md5 signature: fe2b6667af40ffe212e16d3b489bd5a4 ****/
		%feature("compactdefaultargs") FixStripFace;
		%feature("autodoc", "Fixing case of strip face, if tol = -1 used local tolerance.

Parameters
----------
wasdone: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Shape
") FixStripFace;
		TopoDS_Shape FixStripFace(const Standard_Boolean wasdone = Standard_False);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Fixing case of spot face.

Returns
-------
None
") Perform;
		void Perform();

		/****************** RemoveFacesInCaseOfSpot ******************/
		/**** md5 signature: 24874cb9697cc888631c05af607617fb ****/
		%feature("compactdefaultargs") RemoveFacesInCaseOfSpot;
		%feature("autodoc", "Remove spot face from compound.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") RemoveFacesInCaseOfSpot;
		Standard_Boolean RemoveFacesInCaseOfSpot(const TopoDS_Face & F);

		/****************** RemoveFacesInCaseOfStrip ******************/
		/**** md5 signature: cdf8dd702966acd98758c9b0e92a1ac4 ****/
		%feature("compactdefaultargs") RemoveFacesInCaseOfStrip;
		%feature("autodoc", "Remove strip face from compound.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") RemoveFacesInCaseOfStrip;
		Standard_Boolean RemoveFacesInCaseOfStrip(const TopoDS_Face & F);

		/****************** ReplaceInCaseOfStrip ******************/
		/**** md5 signature: c353dc1670c5c727c2438bacc6051f2a ****/
		%feature("compactdefaultargs") ReplaceInCaseOfStrip;
		%feature("autodoc", "Replace veretces and edges.

Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: float

Returns
-------
bool
") ReplaceInCaseOfStrip;
		Standard_Boolean ReplaceInCaseOfStrip(TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Real tol);

		/****************** ReplaceVerticesInCaseOfSpot ******************/
		/**** md5 signature: 27951c435043974a0642bb877db67afa ****/
		%feature("compactdefaultargs") ReplaceVerticesInCaseOfSpot;
		%feature("autodoc", "Compute average vertex and replacing vertices by new one.

Parameters
----------
F: TopoDS_Face
tol: float

Returns
-------
bool
") ReplaceVerticesInCaseOfSpot;
		Standard_Boolean ReplaceVerticesInCaseOfSpot(TopoDS_Face & F, const Standard_Real tol);

		/****************** Shape ******************/
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** SplitOneFace ******************/
		/**** md5 signature: 544c7785899882621109f596c88b204b ****/
		%feature("compactdefaultargs") SplitOneFace;
		%feature("autodoc", "Compute data for face splitting.

Parameters
----------
F: TopoDS_Face
theSplittedFaces: TopoDS_Compound

Returns
-------
bool
") SplitOneFace;
		Standard_Boolean SplitOneFace(TopoDS_Face & F, TopoDS_Compound & theSplittedFaces);

};


%make_alias(ShapeFix_FixSmallFace)

%extend ShapeFix_FixSmallFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class ShapeFix_FixSmallSolid *
*******************************/
class ShapeFix_FixSmallSolid : public ShapeFix_Root {
	public:
		/****************** ShapeFix_FixSmallSolid ******************/
		/**** md5 signature: 1215e01c3737a0a405527aec5fc9f652 ****/
		%feature("compactdefaultargs") ShapeFix_FixSmallSolid;
		%feature("autodoc", "Construct.

Returns
-------
None
") ShapeFix_FixSmallSolid;
		 ShapeFix_FixSmallSolid();

		/****************** Merge ******************/
		/**** md5 signature: fd2b6b6a765ccb2d560139b9b98ea64d ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Merge small solids in the given shape to adjacent non-small ones.

Parameters
----------
theShape: TopoDS_Shape
theContext: ShapeBuild_ReShape

Returns
-------
TopoDS_Shape
") Merge;
		TopoDS_Shape Merge(const TopoDS_Shape & theShape, const opencascade::handle<ShapeBuild_ReShape> & theContext);

		/****************** Remove ******************/
		/**** md5 signature: 912ec5a31c96f024aa7849c61adc982d ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove small solids from the given shape.

Parameters
----------
theShape: TopoDS_Shape
theContext: ShapeBuild_ReShape

Returns
-------
TopoDS_Shape
") Remove;
		TopoDS_Shape Remove(const TopoDS_Shape & theShape, const opencascade::handle<ShapeBuild_ReShape> & theContext);

		/****************** SetFixMode ******************/
		/**** md5 signature: 912625cdaaf5e4928855a026288e41f8 ****/
		%feature("compactdefaultargs") SetFixMode;
		%feature("autodoc", "Set working mode for operator: - themode = 0 use both widthfactorthreshold and volumethreshold parameters - themode = 1 use only widthfactorthreshold parameter - themode = 2 use only volumethreshold parameter.

Parameters
----------
theMode: int

Returns
-------
None
") SetFixMode;
		void SetFixMode(const Standard_Integer theMode);

		/****************** SetVolumeThreshold ******************/
		/**** md5 signature: b73a7d17d3c4cd5295fa2d4601e16571 ****/
		%feature("compactdefaultargs") SetVolumeThreshold;
		%feature("autodoc", "Set or clear volume threshold for small solids.

Parameters
----------
theThreshold: float,optional
	default value is -1.0

Returns
-------
None
") SetVolumeThreshold;
		void SetVolumeThreshold(const Standard_Real theThreshold = -1.0);

		/****************** SetWidthFactorThreshold ******************/
		/**** md5 signature: 291d5a1179edca204d7d47d940df7cdb ****/
		%feature("compactdefaultargs") SetWidthFactorThreshold;
		%feature("autodoc", "Set or clear width factor threshold for small solids.

Parameters
----------
theThreshold: float,optional
	default value is -1.0

Returns
-------
None
") SetWidthFactorThreshold;
		void SetWidthFactorThreshold(const Standard_Real theThreshold = -1.0);

};


%make_alias(ShapeFix_FixSmallSolid)

%extend ShapeFix_FixSmallSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ShapeFix_Shape *
***********************/
class ShapeFix_Shape : public ShapeFix_Root {
	public:
		/****************** ShapeFix_Shape ******************/
		/**** md5 signature: 418bd059aea173b18b96d71257c0aa80 ****/
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeFix_Shape;
		 ShapeFix_Shape();

		/****************** ShapeFix_Shape ******************/
		/**** md5 signature: b98768b62b5b20307ae7e059e41d0723 ****/
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "Initislises by shape.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") ShapeFix_Shape;
		 ShapeFix_Shape(const TopoDS_Shape & shape);

		/****************** FixEdgeTool ******************/
		/**** md5 signature: 89a2d8636a7be4b25bc33761daf78b13 ****/
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "Returns tool for fixing edges.

Returns
-------
opencascade::handle<ShapeFix_Edge>
") FixEdgeTool;
		opencascade::handle<ShapeFix_Edge> FixEdgeTool();

		/****************** FixFaceTool ******************/
		/**** md5 signature: 1c6766395d685063e9c5c3af8a0ff19d ****/
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "Returns tool for fixing faces.

Returns
-------
opencascade::handle<ShapeFix_Face>
") FixFaceTool;
		opencascade::handle<ShapeFix_Face> FixFaceTool();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixFreeFaceMode() {
            return (Standard_Integer) $self->FixFreeFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixFreeFaceMode(Standard_Integer value) {
            $self->FixFreeFaceMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixFreeShellMode() {
            return (Standard_Integer) $self->FixFreeShellMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixFreeShellMode(Standard_Integer value) {
            $self->FixFreeShellMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixFreeWireMode() {
            return (Standard_Integer) $self->FixFreeWireMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixFreeWireMode(Standard_Integer value) {
            $self->FixFreeWireMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSameParameterMode() {
            return (Standard_Integer) $self->FixSameParameterMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSameParameterMode(Standard_Integer value) {
            $self->FixSameParameterMode()=value;
            }
        };
		/****************** FixShellTool ******************/
		/**** md5 signature: cacf7f3f630c3a1f123d40c2897e1f9d ****/
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "Returns tool for fixing shells.

Returns
-------
opencascade::handle<ShapeFix_Shell>
") FixShellTool;
		opencascade::handle<ShapeFix_Shell> FixShellTool();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSolidMode() {
            return (Standard_Integer) $self->FixSolidMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSolidMode(Standard_Integer value) {
            $self->FixSolidMode()=value;
            }
        };
		/****************** FixSolidTool ******************/
		/**** md5 signature: e57644ad5d224591291ddd3c8a859f54 ****/
		%feature("compactdefaultargs") FixSolidTool;
		%feature("autodoc", "Returns tool for fixing solids.

Returns
-------
opencascade::handle<ShapeFix_Solid>
") FixSolidTool;
		opencascade::handle<ShapeFix_Solid> FixSolidTool();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixVertexPositionMode() {
            return (Standard_Integer) $self->FixVertexPositionMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixVertexPositionMode(Standard_Integer value) {
            $self->FixVertexPositionMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixVertexTolMode() {
            return (Standard_Integer) $self->FixVertexTolMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixVertexTolMode(Standard_Integer value) {
            $self->FixVertexTolMode()=value;
            }
        };
		/****************** FixWireTool ******************/
		/**** md5 signature: bef1b4e55d9ac1091d5ad9f06a3a442b ****/
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "Returns tool for fixing wires.

Returns
-------
opencascade::handle<ShapeFix_Wire>
") FixWireTool;
		opencascade::handle<ShapeFix_Wire> FixWireTool();

		/****************** Init ******************/
		/**** md5 signature: f0a1ccc9828c6324cb0569f2b373e697 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initislises by shape.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & shape);

		/****************** Perform ******************/
		/**** md5 signature: b8885f6294710667de5cde025b95e76c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Iterates on sub- shape and performs fixes.

Parameters
----------
theProgress: Message_ProgressIndicator,optional
	default value is 0

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const opencascade::handle<Message_ProgressIndicator> & theProgress = 0);

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: b7cb625408a036b53cb8ef0bd1f74be7 ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal allowed tolerance (also to fixsolidtool).

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		virtual void SetMaxTolerance(const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: 118b24db5991a9b12505b50713610933 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets minimal allowed tolerance (also to fixsolidtool).

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTolerance;
		virtual void SetMinTolerance(const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		/**** md5 signature: 7d0124cc4910ea7f49d1899bae9f9445 ****/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "Sets message registrator.

Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Returns
-------
None
") SetMsgRegistrator;
		virtual void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		/**** md5 signature: 92d78323d62150cdb5c9a0f5c7cac931 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets basic precision value (also to fixsolidtool).

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		virtual void SetPrecision(const Standard_Real preci);

		/****************** Shape ******************/
		/**** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns resulting shape.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of the last fix. this can be a combination of the following flags: shapeextend_done1: some free edges were fixed shapeextend_done2: some free wires were fixed shapeextend_done3: some free faces were fixed shapeextend_done4: some free shells were fixed shapeextend_done5: some free solids were fixed shapeextend_done6: shapes in compound(s) were fixed.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Shape)

%extend ShapeFix_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ShapeFix_Shell *
***********************/
class ShapeFix_Shell : public ShapeFix_Root {
	public:
		/****************** ShapeFix_Shell ******************/
		/**** md5 signature: cbd04a992325d1f7eef085431d2d953b ****/
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeFix_Shell;
		 ShapeFix_Shell();

		/****************** ShapeFix_Shell ******************/
		/**** md5 signature: 27bceb7ec31bb06a7692de93d94f0aa8 ****/
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "Initializes by shell.

Parameters
----------
shape: TopoDS_Shell

Returns
-------
None
") ShapeFix_Shell;
		 ShapeFix_Shell(const TopoDS_Shell & shape);

		/****************** ErrorFaces ******************/
		/**** md5 signature: 701e9a7b856fcfb35140db0e67024d33 ****/
		%feature("compactdefaultargs") ErrorFaces;
		%feature("autodoc", "Returns not oriented subset of faces.

Returns
-------
TopoDS_Compound
") ErrorFaces;
		TopoDS_Compound ErrorFaces();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixFaceMode() {
            return (Standard_Integer) $self->FixFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixFaceMode(Standard_Integer value) {
            $self->FixFaceMode()=value;
            }
        };
		/****************** FixFaceOrientation ******************/
		/**** md5 signature: ff34d366ae4848ab5f8277e68d81b0db ****/
		%feature("compactdefaultargs") FixFaceOrientation;
		%feature("autodoc", "Fixes orientation of faces in shell. changes orientation of face in the shell, if it is oriented opposite to neigbouring faces. if it is not possible to orient all faces in the shell (like in case of mebious band), this method orients only subset of faces. other faces are stored in error compound. modes : isaccountmulticonex - mode for account cases of multiconnexity. if this mode is equal to standard_true, separate shells will be created in the cases of multiconnexity. if this mode is equal to standard_false, one shell will be created without account of multiconnexity.by defautt - standard_true; nonmanifold - mode for creation of non-manifold shells. if this mode is equal to standard_true one non-manifold will be created from shell contains multishared edges. else if this mode is equal to standard_false only manifold shells will be created. by default - standard_false.

Parameters
----------
shell: TopoDS_Shell
isAccountMultiConex: bool,optional
	default value is Standard_True
NonManifold: bool,optional
	default value is Standard_False

Returns
-------
bool
") FixFaceOrientation;
		Standard_Boolean FixFaceOrientation(const TopoDS_Shell & shell, const Standard_Boolean isAccountMultiConex = Standard_True, const Standard_Boolean NonManifold = Standard_False);

		/****************** FixFaceTool ******************/
		/**** md5 signature: 428136b1e2cdf845f0e92b7dfc089c3d ****/
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "Returns tool for fixing faces.

Returns
-------
opencascade::handle<ShapeFix_Face>
") FixFaceTool;
		opencascade::handle<ShapeFix_Face> FixFaceTool();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixOrientationMode() {
            return (Standard_Integer) $self->FixOrientationMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixOrientationMode(Standard_Integer value) {
            $self->FixOrientationMode()=value;
            }
        };
		/****************** Init ******************/
		/**** md5 signature: 16f5a3fe30686a2f12aa382ba9bcb9bc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes by shell.

Parameters
----------
shell: TopoDS_Shell

Returns
-------
None
") Init;
		void Init(const TopoDS_Shell & shell);

		/****************** NbShells ******************/
		/**** md5 signature: ae5cea2f4ee50541dc840582f5c8441d ****/
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", "Returns number of obtainrd shells;.

Returns
-------
int
") NbShells;
		Standard_Integer NbShells();

		/****************** Perform ******************/
		/**** md5 signature: b8885f6294710667de5cde025b95e76c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Iterates on subshapes and performs fixes (for each face calls shapefix_face::perform and then calls fixfaceorientation). the passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.

Parameters
----------
theProgress: Message_ProgressIndicator,optional
	default value is 0

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const opencascade::handle<Message_ProgressIndicator> & theProgress = 0);

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: b7cb625408a036b53cb8ef0bd1f74be7 ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal allowed tolerance (also to fixwiretool).

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		virtual void SetMaxTolerance(const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: 118b24db5991a9b12505b50713610933 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets minimal allowed tolerance (also to fixwiretool).

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTolerance;
		virtual void SetMinTolerance(const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		/**** md5 signature: 7d0124cc4910ea7f49d1899bae9f9445 ****/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "Sets message registrator.

Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Returns
-------
None
") SetMsgRegistrator;
		virtual void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetNonManifoldFlag ******************/
		/**** md5 signature: 5c84704b9604761920abf08a9634cafe ****/
		%feature("compactdefaultargs") SetNonManifoldFlag;
		%feature("autodoc", "Sets nonmanifold flag.

Parameters
----------
isNonManifold: bool

Returns
-------
None
") SetNonManifoldFlag;
		virtual void SetNonManifoldFlag(const Standard_Boolean isNonManifold);

		/****************** SetPrecision ******************/
		/**** md5 signature: 92d78323d62150cdb5c9a0f5c7cac931 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets basic precision value (also to fixwiretool).

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		virtual void SetPrecision(const Standard_Real preci);

		/****************** Shape ******************/
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "In case of multiconnexity returns compound of fixed shells else returns one shell..

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Shell ******************/
		/**** md5 signature: 609dd1b8e0ccc93c20eff2a9beafbd4b ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns fixed shell (or subset of oriented faces).

Returns
-------
TopoDS_Shell
") Shell;
		TopoDS_Shell Shell();

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of the last fix.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Shell)

%extend ShapeFix_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ShapeFix_Solid *
***********************/
class ShapeFix_Solid : public ShapeFix_Root {
	public:
		/****************** ShapeFix_Solid ******************/
		/**** md5 signature: 8d7a890a725929271f1fd5143550f352 ****/
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "Empty constructor;.

Returns
-------
None
") ShapeFix_Solid;
		 ShapeFix_Solid();

		/****************** ShapeFix_Solid ******************/
		/**** md5 signature: e294df30da3ff07d0ec478b1c219ec97 ****/
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "Initializes by solid.

Parameters
----------
solid: TopoDS_Solid

Returns
-------
None
") ShapeFix_Solid;
		 ShapeFix_Solid(const TopoDS_Solid & solid);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetCreateOpenSolidMode() {
            return (Standard_Boolean) $self->CreateOpenSolidMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCreateOpenSolidMode(Standard_Boolean value) {
            $self->CreateOpenSolidMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixShellMode() {
            return (Standard_Integer) $self->FixShellMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixShellMode(Standard_Integer value) {
            $self->FixShellMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixShellOrientationMode() {
            return (Standard_Integer) $self->FixShellOrientationMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixShellOrientationMode(Standard_Integer value) {
            $self->FixShellOrientationMode()=value;
            }
        };
		/****************** FixShellTool ******************/
		/**** md5 signature: 6ba0e8439a28f3eb9566dba885f1ccc8 ****/
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "Returns tool for fixing shells.

Returns
-------
opencascade::handle<ShapeFix_Shell>
") FixShellTool;
		opencascade::handle<ShapeFix_Shell> FixShellTool();

		/****************** Init ******************/
		/**** md5 signature: f4cc4e066cfaa51a08d33cbbc31252d1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes by solid .

Parameters
----------
solid: TopoDS_Solid

Returns
-------
None
") Init;
		virtual void Init(const TopoDS_Solid & solid);

		/****************** Perform ******************/
		/**** md5 signature: a4646c692ade07bdeede9c095b7d593f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Iterates on shells and performs fixes (calls shapefix_shell for each subshell). the passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.

Parameters
----------
theProgress: Message_ProgressIndicator,optional
	default value is 0

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform(const opencascade::handle<Message_ProgressIndicator> & theProgress = 0);

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: b7cb625408a036b53cb8ef0bd1f74be7 ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal allowed tolerance (also to fixshelltool).

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		virtual void SetMaxTolerance(const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: 118b24db5991a9b12505b50713610933 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets minimal allowed tolerance (also to fixshelltool).

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTolerance;
		virtual void SetMinTolerance(const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		/**** md5 signature: 7d0124cc4910ea7f49d1899bae9f9445 ****/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "Sets message registrator.

Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Returns
-------
None
") SetMsgRegistrator;
		virtual void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		/**** md5 signature: 92d78323d62150cdb5c9a0f5c7cac931 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets basic precision value (also to fixshelltool).

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		virtual void SetPrecision(const Standard_Real preci);

		/****************** Shape ******************/
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "In case of multiconnexity returns compound of fixed solids else returns one solid.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Solid ******************/
		/**** md5 signature: c426390f4c3ad398e07f49b2a70eecdd ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns resulting solid.

Returns
-------
TopoDS_Shape
") Solid;
		TopoDS_Shape Solid();

		/****************** SolidFromShell ******************/
		/**** md5 signature: a30f21e58117c87b7d8d8a857b45a94a ****/
		%feature("compactdefaultargs") SolidFromShell;
		%feature("autodoc", "Calls makesolid and orients the solid to be 'not infinite'.

Parameters
----------
shell: TopoDS_Shell

Returns
-------
TopoDS_Solid
") SolidFromShell;
		TopoDS_Solid SolidFromShell(const TopoDS_Shell & shell);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of the last fix.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Solid)

%extend ShapeFix_Solid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class ShapeFix_SplitCommonVertex *
***********************************/
class ShapeFix_SplitCommonVertex : public ShapeFix_Root {
	public:
		/****************** ShapeFix_SplitCommonVertex ******************/
		/**** md5 signature: 81156f27849d973083b8d8d2bd53004b ****/
		%feature("compactdefaultargs") ShapeFix_SplitCommonVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_SplitCommonVertex;
		 ShapeFix_SplitCommonVertex();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Shape ******************/
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

};


%make_alias(ShapeFix_SplitCommonVertex)

%extend ShapeFix_SplitCommonVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ShapeFix_Wire *
**********************/
class ShapeFix_Wire : public ShapeFix_Root {
	public:
		/****************** ShapeFix_Wire ******************/
		/**** md5 signature: 0077bd6b4ffeb01fde948bf7107a6e6d ****/
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "Empty constructor, creates clear object with default flags.

Returns
-------
None
") ShapeFix_Wire;
		 ShapeFix_Wire();

		/****************** ShapeFix_Wire ******************/
		/**** md5 signature: 14a7e60b81f6ab68938dc84c502d2cc4 ****/
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "Create new object with default flags and prepare it for use (loads analyzer with all the data for the wire and face).

Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
prec: float

Returns
-------
None
") ShapeFix_Wire;
		 ShapeFix_Wire(const TopoDS_Wire & wire, const TopoDS_Face & face, const Standard_Real prec);

		/****************** Analyzer ******************/
		/**** md5 signature: 8cf283646b5d59870660ef74b5c32df7 ****/
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "Returns field analyzer (working tool).

Returns
-------
opencascade::handle<ShapeAnalysis_Wire>
") Analyzer;
		opencascade::handle<ShapeAnalysis_Wire> Analyzer();

		/****************** ClearModes ******************/
		/**** md5 signature: 542f30be660211907f6936f03139ba7f ****/
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "Sets all modes to default.

Returns
-------
None
") ClearModes;
		void ClearModes();

		/****************** ClearStatuses ******************/
		/**** md5 signature: a36409698de6df03133c5f14bec35cf8 ****/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "Clears all statuses.

Returns
-------
None
") ClearStatuses;
		void ClearStatuses();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetClosedWireMode() {
            return (Standard_Boolean) $self->ClosedWireMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetClosedWireMode(Standard_Boolean value) {
            $self->ClosedWireMode()=value;
            }
        };
		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns working face (analyzer.face()).

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixAddCurve3dMode() {
            return (Standard_Integer) $self->FixAddCurve3dMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixAddCurve3dMode(Standard_Integer value) {
            $self->FixAddCurve3dMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixAddPCurveMode() {
            return (Standard_Integer) $self->FixAddPCurveMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixAddPCurveMode(Standard_Integer value) {
            $self->FixAddPCurveMode()=value;
            }
        };
		/****************** FixClosed ******************/
		/**** md5 signature: 02594bcf14a153315678f8917f86a792 ****/
		%feature("compactdefaultargs") FixClosed;
		%feature("autodoc", "Fixes a wire to be well closed it performs fixconnected, fixdegenerated and fixlacking between last and first edges (independingly on flag closedmode and modes for these fixings) if <prec> is -1 then maxtolerance() is taken.

Parameters
----------
prec: float,optional
	default value is -1.0

Returns
-------
bool
") FixClosed;
		Standard_Boolean FixClosed(const Standard_Real prec = -1.0);

		/****************** FixConnected ******************/
		/**** md5 signature: 620050ec3514c62fc46e51f19aa61ede ****/
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "Applies fixconnected(num) to all edges in the wire connection between first and last edges is treated only if flag closedmode is true if <prec> is -1 then maxtolerance() is taken.

Parameters
----------
prec: float,optional
	default value is -1.0

Returns
-------
bool
") FixConnected;
		Standard_Boolean FixConnected(const Standard_Real prec = -1.0);

		/****************** FixConnected ******************/
		/**** md5 signature: 7d709d2fdd3a7b3c1d87cdd42f7e46a7 ****/
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "Fixes connected edges (preceeding and current) forces vertices (end of preceeding-begin of current) to be the same one tests with starting preci or, if given greater, <prec> if <prec> is -1 then maxtolerance() is taken.

Parameters
----------
num: int
prec: float

Returns
-------
bool
") FixConnected;
		Standard_Boolean FixConnected(const Standard_Integer num, const Standard_Real prec);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixConnectedMode() {
            return (Standard_Integer) $self->FixConnectedMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixConnectedMode(Standard_Integer value) {
            $self->FixConnectedMode()=value;
            }
        };
		/****************** FixDegenerated ******************/
		/**** md5 signature: 0e6830293f607b5180f93add12a2dcf9 ****/
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "Applies fixdegenerated(num) to all edges in the wire connection between first and last edges is treated only if flag closedmode is true.

Returns
-------
bool
") FixDegenerated;
		Standard_Boolean FixDegenerated();

		/****************** FixDegenerated ******************/
		/**** md5 signature: 1669c72627315d9bfb0b38c928c1edd1 ****/
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "Fixes degenerated edge checks an <num-th> edge or a point between <num>th-1 and <num>th edges for a singularity on a supporting surface. if singularity is detected, either adds new degenerated edge (before <num>th), or makes <num>th edge to be degenerated.

Parameters
----------
num: int

Returns
-------
bool
") FixDegenerated;
		Standard_Boolean FixDegenerated(const Standard_Integer num);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixDegeneratedMode() {
            return (Standard_Integer) $self->FixDegeneratedMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixDegeneratedMode(Standard_Integer value) {
            $self->FixDegeneratedMode()=value;
            }
        };
		/****************** FixEdgeCurves ******************/
		/**** md5 signature: 1ce0789d07da358dc1e3fe6e739d31e3 ****/
		%feature("compactdefaultargs") FixEdgeCurves;
		%feature("autodoc", "Groups the fixes dealing with 3d and pcurves of the edges. the order of the fixes and the default behaviour are: shapefix_edge::fixreversed2d shapefix_edge::fixremovepcurve (only if forced) shapefix_edge::fixaddpcurve shapefix_edge::fixremovecurve3d (only if forced) shapefix_edge::fixaddcurve3d fixseam, fixshifted, shapefix_edge::fixsameparameter.

Returns
-------
bool
") FixEdgeCurves;
		Standard_Boolean FixEdgeCurves();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixEdgeCurvesMode() {
            return (Standard_Integer) $self->FixEdgeCurvesMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixEdgeCurvesMode(Standard_Integer value) {
            $self->FixEdgeCurvesMode()=value;
            }
        };
		/****************** FixEdgeTool ******************/
		/**** md5 signature: 89a2d8636a7be4b25bc33761daf78b13 ****/
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "Returns tool for fixing wires.

Returns
-------
opencascade::handle<ShapeFix_Edge>
") FixEdgeTool;
		opencascade::handle<ShapeFix_Edge> FixEdgeTool();

		/****************** FixGap2d ******************/
		/**** md5 signature: d86090ad17682ceff1fdd23b52aee4e4 ****/
		%feature("compactdefaultargs") FixGap2d;
		%feature("autodoc", "Fixes gap between ends of pcurves on num-1 and num-th edges. myprecision is used to detect the gap. if convert is true, converts pcurves to bsplines to bend.

Parameters
----------
num: int
convert: bool,optional
	default value is Standard_False

Returns
-------
bool
") FixGap2d;
		Standard_Boolean FixGap2d(const Standard_Integer num, const Standard_Boolean convert = Standard_False);

		/****************** FixGap3d ******************/
		/**** md5 signature: 36bf4f6132101376fd247abbff4d6c66 ****/
		%feature("compactdefaultargs") FixGap3d;
		%feature("autodoc", "Fixes gap between ends of 3d curves on num-1 and num-th edges. myprecision is used to detect the gap. if convert is true, converts curves to bsplines to bend.

Parameters
----------
num: int
convert: bool,optional
	default value is Standard_False

Returns
-------
bool
") FixGap3d;
		Standard_Boolean FixGap3d(const Standard_Integer num, const Standard_Boolean convert = Standard_False);

		/****************** FixGaps2d ******************/
		/**** md5 signature: ddd5b89bc803d51a89801ba2a4ff1762 ****/
		%feature("compactdefaultargs") FixGaps2d;
		%feature("autodoc", "Fixes gaps between ends of pcurves on adjacent edges myprecision is used to detect the gaps.

Returns
-------
bool
") FixGaps2d;
		Standard_Boolean FixGaps2d();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixGaps2dMode() {
            return (Standard_Integer) $self->FixGaps2dMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixGaps2dMode(Standard_Integer value) {
            $self->FixGaps2dMode()=value;
            }
        };
		/****************** FixGaps3d ******************/
		/**** md5 signature: 6b4179fdad93d838515f4aa42801b0c4 ****/
		%feature("compactdefaultargs") FixGaps3d;
		%feature("autodoc", "Fixes gaps between ends of 3d curves on adjacent edges myprecision is used to detect the gaps.

Returns
-------
bool
") FixGaps3d;
		Standard_Boolean FixGaps3d();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixGaps3dMode() {
            return (Standard_Integer) $self->FixGaps3dMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixGaps3dMode(Standard_Integer value) {
            $self->FixGaps3dMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetFixGapsByRangesMode() {
            return (Standard_Boolean) $self->FixGapsByRangesMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixGapsByRangesMode(Standard_Boolean value) {
            $self->FixGapsByRangesMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixIntersectingEdgesMode() {
            return (Standard_Integer) $self->FixIntersectingEdgesMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixIntersectingEdgesMode(Standard_Integer value) {
            $self->FixIntersectingEdgesMode()=value;
            }
        };
		/****************** FixLacking ******************/
		/**** md5 signature: b75db5e25f0cf9f8dce6278ffab255b9 ****/
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "Applies fixlacking(num) to all edges in the wire connection between first and last edges is treated only if flag closedmode is true if <force> is false (default), test for connectness is done with precision of vertex between edges, else it is done with minimal value of vertex tolerance and analyzer.precision(). hence, <force> will lead to inserting lacking edges in replacement of vertices which have big tolerances.

Parameters
----------
force: bool,optional
	default value is Standard_False

Returns
-------
bool
") FixLacking;
		Standard_Boolean FixLacking(const Standard_Boolean force = Standard_False);

		/****************** FixLacking ******************/
		/**** md5 signature: 3fd5850761e0820d4e36758773896433 ****/
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "Fixes lacking edge test if two adjucent edges are disconnected in 2d (while connected in 3d), and in that case either increase tolerance of the vertex or add a new edge (straight in 2d space), in order to close wire in 2d. returns true if edge was added or tolerance was increased.

Parameters
----------
num: int
force: bool,optional
	default value is Standard_False

Returns
-------
bool
") FixLacking;
		Standard_Boolean FixLacking(const Standard_Integer num, const Standard_Boolean force = Standard_False);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixLackingMode() {
            return (Standard_Integer) $self->FixLackingMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixLackingMode(Standard_Integer value) {
            $self->FixLackingMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixNonAdjacentIntersectingEdgesMode() {
            return (Standard_Integer) $self->FixNonAdjacentIntersectingEdgesMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixNonAdjacentIntersectingEdgesMode(Standard_Integer value) {
            $self->FixNonAdjacentIntersectingEdgesMode()=value;
            }
        };
		/****************** FixNotchedEdges ******************/
		/**** md5 signature: 60073f14f9e9bca654a0dad251271fc0 ****/
		%feature("compactdefaultargs") FixNotchedEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FixNotchedEdges;
		Standard_Boolean FixNotchedEdges();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixNotchedEdgesMode() {
            return (Standard_Integer) $self->FixNotchedEdgesMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixNotchedEdgesMode(Standard_Integer value) {
            $self->FixNotchedEdgesMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixRemoveCurve3dMode() {
            return (Standard_Integer) $self->FixRemoveCurve3dMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixRemoveCurve3dMode(Standard_Integer value) {
            $self->FixRemoveCurve3dMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixRemovePCurveMode() {
            return (Standard_Integer) $self->FixRemovePCurveMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixRemovePCurveMode(Standard_Integer value) {
            $self->FixRemovePCurveMode()=value;
            }
        };
		/****************** FixReorder ******************/
		/**** md5 signature: 0d745aeb80c03bb878dfbe0d7f89eda2 ****/
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "Performs an analysis and reorders edges in the wire using class wireorder.

Returns
-------
bool
") FixReorder;
		Standard_Boolean FixReorder();

		/****************** FixReorder ******************/
		/**** md5 signature: 714f0bb13d626a574d67d5b76557a0ae ****/
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "Reorder edges in the wire as determined by wireorder that should be filled and computed before.

Parameters
----------
wi: ShapeAnalysis_WireOrder

Returns
-------
bool
") FixReorder;
		Standard_Boolean FixReorder(const ShapeAnalysis_WireOrder & wi);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixReorderMode() {
            return (Standard_Integer) $self->FixReorderMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixReorderMode(Standard_Integer value) {
            $self->FixReorderMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixReversed2dMode() {
            return (Standard_Integer) $self->FixReversed2dMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixReversed2dMode(Standard_Integer value) {
            $self->FixReversed2dMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSameParameterMode() {
            return (Standard_Integer) $self->FixSameParameterMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSameParameterMode(Standard_Integer value) {
            $self->FixSameParameterMode()=value;
            }
        };
		/****************** FixSeam ******************/
		/**** md5 signature: 9d2db9b87a2ed87b34f56a3ddb6a7507 ****/
		%feature("compactdefaultargs") FixSeam;
		%feature("autodoc", "Fixes a seam edge a seam edge has two pcurves, one for forward. one for reversed the forward pcurve must be set as first //! note that correct order of pcurves in the seam edge depends on its orientation (i.e., on orientation of the wire, method of exploration of edges etc.). since wire represented by the shapeextend_wiredata is always forward (orientation is accounted by edges), it will work correct if: 1. wire created from shapeextend_wiredata with methods shapeextend_wiredata::wire..() is added into the forward face (orientation can be applied later) 2. wire is extracted from the face with orientation not composed with orientation of the face.

Parameters
----------
num: int

Returns
-------
bool
") FixSeam;
		Standard_Boolean FixSeam(const Standard_Integer num);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSeamMode() {
            return (Standard_Integer) $self->FixSeamMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSeamMode(Standard_Integer value) {
            $self->FixSeamMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSelfIntersectingEdgeMode() {
            return (Standard_Integer) $self->FixSelfIntersectingEdgeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSelfIntersectingEdgeMode(Standard_Integer value) {
            $self->FixSelfIntersectingEdgeMode()=value;
            }
        };
		/****************** FixSelfIntersection ******************/
		/**** md5 signature: 818d07d9b6641ec293d251eda902ca90 ****/
		%feature("compactdefaultargs") FixSelfIntersection;
		%feature("autodoc", "Applies fixselfintersectingedge(num) and fixintersectingedges(num) to all edges in the wire and fixintersectingedges(num1, num2) for all pairs num1 and num2 such that num2 >= num1 + 2 and removes wrong edges if any.

Returns
-------
bool
") FixSelfIntersection;
		Standard_Boolean FixSelfIntersection();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSelfIntersectionMode() {
            return (Standard_Integer) $self->FixSelfIntersectionMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSelfIntersectionMode(Standard_Integer value) {
            $self->FixSelfIntersectionMode()=value;
            }
        };
		/****************** FixShifted ******************/
		/**** md5 signature: c4ce79a0df9317908ad7ea7f959d37d1 ****/
		%feature("compactdefaultargs") FixShifted;
		%feature("autodoc", "Fixes edges which have pcurves shifted by whole parameter range on the closed surface (the case may occur if pcurve of edge was computed by projecting 3d curve, which goes along the seam). it compares each two consequent edges and tries to connect them if distance between ends is near to range of the surface. it also can detect and fix the case if all pcurves are connected, but lie out of parametric bounds of the surface. in addition to fixshifted from shapefix_wire, more sophisticated check of degenerate points is performed, and special cases like sphere given by two meridians are treated.

Returns
-------
bool
") FixShifted;
		Standard_Boolean FixShifted();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixShiftedMode() {
            return (Standard_Integer) $self->FixShiftedMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixShiftedMode(Standard_Integer value) {
            $self->FixShiftedMode()=value;
            }
        };
		/****************** FixSmall ******************/
		/**** md5 signature: 80edde92d44c84fa1bab38a19564acae ****/
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "Applies fixsmall(num) to all edges in the wire.

Parameters
----------
lockvtx: bool
precsmall: float,optional
	default value is 0.0

Returns
-------
int
") FixSmall;
		Standard_Integer FixSmall(const Standard_Boolean lockvtx, const Standard_Real precsmall = 0.0);

		/****************** FixSmall ******************/
		/**** md5 signature: 58abaa56305b1fe5b2efde18d1cf22ad ****/
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "Fixes null length edge to be removed if an edge has null length (regarding preci, or <precsmall> - what is smaller), it should be removed it can be with no problem if its two vertices are the same else, if lockvtx is false, it is removed and its end vertex is put on the preceeding edge but if lockvtx is true, this edge must be kept ...

Parameters
----------
num: int
lockvtx: bool
precsmall: float

Returns
-------
bool
") FixSmall;
		Standard_Boolean FixSmall(const Standard_Integer num, const Standard_Boolean lockvtx, const Standard_Real precsmall);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixSmallMode() {
            return (Standard_Integer) $self->FixSmallMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixSmallMode(Standard_Integer value) {
            $self->FixSmallMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixTailMode() {
            return (Standard_Integer) $self->FixTailMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixTailMode(Standard_Integer value) {
            $self->FixTailMode()=value;
            }
        };
		/****************** FixTails ******************/
		/**** md5 signature: 025a27fb04abe9028ab260473d50c223 ****/
		%feature("compactdefaultargs") FixTails;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FixTails;
		Standard_Boolean FixTails();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetFixVertexToleranceMode() {
            return (Standard_Integer) $self->FixVertexToleranceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetFixVertexToleranceMode(Standard_Integer value) {
            $self->FixVertexToleranceMode()=value;
            }
        };
		/****************** Init ******************/
		/**** md5 signature: da988b40598522f685f7f9d7b47bdaa4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Load analyzer with all the data for the wire and face and drops all fixing statuses.

Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
prec: float

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & wire, const TopoDS_Face & face, const Standard_Real prec);

		/****************** Init ******************/
		/**** md5 signature: dcd292e408c7ae6f48c04414145d7558 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Load analyzer with all the data already prepared and drops all fixing statuses if analyzer contains face, there is no need to set it by setface or setsurface.

Parameters
----------
saw: ShapeAnalysis_Wire

Returns
-------
None
") Init;
		void Init(const opencascade::handle<ShapeAnalysis_Wire> & saw);

		/****************** IsLoaded ******************/
		/**** md5 signature: 5ed802f56c3a94dc70391badb380a6ed ****/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Tells if the wire is loaded.

Returns
-------
bool
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****************** IsReady ******************/
		/**** md5 signature: 68a96b040fc0b59848125a1a3ef33dcb ****/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Tells if the wire and face are loaded.

Returns
-------
bool
") IsReady;
		Standard_Boolean IsReady();

		/****************** LastFixStatus ******************/
		/**** md5 signature: a5b25a5fb32695c9e1c100e8f2249b5d ****/
		%feature("compactdefaultargs") LastFixStatus;
		%feature("autodoc", "Queries the status of last call to methods fix... of advanced level for details see corresponding methods; universal statuses are: ok : problem not detected; nothing done done: problem was detected and successfully fixed fail: problem cannot be fixed.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") LastFixStatus;
		Standard_Boolean LastFixStatus(const ShapeExtend_Status status);

		/****************** Load ******************/
		/**** md5 signature: 2fdca06c20821b51a2c36237ba0af41b ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Load data for the wire, and drops all fixing statuses.

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
		%feature("autodoc", "Load data for the wire, and drops all fixing statuses.

Parameters
----------
sbwd: ShapeExtend_WireData

Returns
-------
None
") Load;
		void Load(const opencascade::handle<ShapeExtend_WireData> & sbwd);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyGeometryMode() {
            return (Standard_Boolean) $self->ModifyGeometryMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyGeometryMode(Standard_Boolean value) {
            $self->ModifyGeometryMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetModifyRemoveLoopMode() {
            return (Standard_Integer) $self->ModifyRemoveLoopMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyRemoveLoopMode(Standard_Integer value) {
            $self->ModifyRemoveLoopMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModifyTopologyMode() {
            return (Standard_Boolean) $self->ModifyTopologyMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModifyTopologyMode(Standard_Boolean value) {
            $self->ModifyTopologyMode()=value;
            }
        };
		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns number of edges in the working wire.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** Perform ******************/
		/**** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "This method performs all the available fixes. if some fix is turned on or off explicitly by the fix..mode() flag, this fix is either called or not depending on that flag. else (i.e. if flag is default) fix is called depending on the situation: some fixes are not called or are limited if order of edges in the wire is not ok, or depending on modes //! the order of the fixes and default behaviour of perform() are: fixreorder fixsmall (with lockvtx true if ! topomode or if wire is not ordered) fixconnected (if wire is ordered) fixedgecurves (without fixshifted if wire is not ordered) fixdegenerated (if wire is ordered) fixselfintersection (if wire is ordered and closedmode is true) fixlacking (if wire is ordered).

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetPreferencePCurveMode() {
            return (Standard_Boolean) $self->PreferencePCurveMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetPreferencePCurveMode(Standard_Boolean value) {
            $self->PreferencePCurveMode()=value;
            }
        };
		/****************** SetFace ******************/
		/**** md5 signature: ad791c3e7afa47c0cda20c76d19a66b4 ****/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Set working face for the wire.

Parameters
----------
face: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & face);

		/****************** SetMaxTailAngle ******************/
		/**** md5 signature: 475a9e9041c1536c4dec5da71980b5b4 ****/
		%feature("compactdefaultargs") SetMaxTailAngle;
		%feature("autodoc", "Sets the maximal allowed angle of the tails in radians.

Parameters
----------
theMaxTailAngle: float

Returns
-------
None
") SetMaxTailAngle;
		void SetMaxTailAngle(const Standard_Real theMaxTailAngle);

		/****************** SetMaxTailWidth ******************/
		/**** md5 signature: 03078458077b762299199552239f8a99 ****/
		%feature("compactdefaultargs") SetMaxTailWidth;
		%feature("autodoc", "Sets the maximal allowed width of the tails.

Parameters
----------
theMaxTailWidth: float

Returns
-------
None
") SetMaxTailWidth;
		void SetMaxTailWidth(const Standard_Real theMaxTailWidth);

		/****************** SetPrecision ******************/
		/**** md5 signature: 892928b1928c1eee74646dc9b35b2350 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Set working precision (to root and to analyzer).

Parameters
----------
prec: float

Returns
-------
None
") SetPrecision;
		virtual void SetPrecision(const Standard_Real prec);

		/****************** SetSurface ******************/
		/**** md5 signature: ef3c30882af3f3cdd5459f6b9a1a3525 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Set surface for the wire.

Parameters
----------
surf: Geom_Surface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surf);

		/****************** SetSurface ******************/
		/**** md5 signature: b778304d2c3516cd661f9fd2b5dfeed7 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Set surface for the wire.

Parameters
----------
surf: Geom_Surface
loc: TopLoc_Location

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surf, const TopLoc_Location & loc);

		/****************** StatusClosed ******************/
		/**** md5 signature: 397ec850ca398b7fd0a894a002d47198 ****/
		%feature("compactdefaultargs") StatusClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusClosed;
		Standard_Boolean StatusClosed(const ShapeExtend_Status status);

		/****************** StatusConnected ******************/
		/**** md5 signature: 778e67ce9161a6c5b336734febb775f3 ****/
		%feature("compactdefaultargs") StatusConnected;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusConnected;
		Standard_Boolean StatusConnected(const ShapeExtend_Status status);

		/****************** StatusDegenerated ******************/
		/**** md5 signature: 83150213c249c7e49e122df8861b868c ****/
		%feature("compactdefaultargs") StatusDegenerated;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusDegenerated;
		Standard_Boolean StatusDegenerated(const ShapeExtend_Status status);

		/****************** StatusEdgeCurves ******************/
		/**** md5 signature: 7db5a16b2f75f1f3c8e3020d7471e69b ****/
		%feature("compactdefaultargs") StatusEdgeCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves(const ShapeExtend_Status status);

		/****************** StatusFixTails ******************/
		/**** md5 signature: ec7222dd1dad9993c8ebe67ae524ee10 ****/
		%feature("compactdefaultargs") StatusFixTails;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusFixTails;
		Standard_Boolean StatusFixTails(const ShapeExtend_Status status);

		/****************** StatusGaps2d ******************/
		/**** md5 signature: 1f5eabaad5dc9661856b002b6e183eee ****/
		%feature("compactdefaultargs") StatusGaps2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusGaps2d;
		Standard_Boolean StatusGaps2d(const ShapeExtend_Status status);

		/****************** StatusGaps3d ******************/
		/**** md5 signature: 825f4f566e8fba4e295cd4bec34c5c53 ****/
		%feature("compactdefaultargs") StatusGaps3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusGaps3d;
		Standard_Boolean StatusGaps3d(const ShapeExtend_Status status);

		/****************** StatusLacking ******************/
		/**** md5 signature: 52ad411d37899450cdc3de41cf0e88fc ****/
		%feature("compactdefaultargs") StatusLacking;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusLacking;
		Standard_Boolean StatusLacking(const ShapeExtend_Status status);

		/****************** StatusNotches ******************/
		/**** md5 signature: 8605c9e6388e4a5a05457c6be7c03876 ****/
		%feature("compactdefaultargs") StatusNotches;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusNotches;
		Standard_Boolean StatusNotches(const ShapeExtend_Status status);

		/****************** StatusRemovedSegment ******************/
		/**** md5 signature: 70675d4f6f1fd8791c8e40f92a56e97e ****/
		%feature("compactdefaultargs") StatusRemovedSegment;
		%feature("autodoc", "Querying the status of perfomed api fixing procedures each status..() methods gives information about the last call to the corresponding fix..() method of api level: ok : no problems detected; nothing done done: some problem(s) was(were) detected and successfully fixed fail: some problem(s) cannot be fixed.

Returns
-------
bool
") StatusRemovedSegment;
		Standard_Boolean StatusRemovedSegment();

		/****************** StatusReorder ******************/
		/**** md5 signature: 60ee52ad2ba83c2619f928bb00c25ae1 ****/
		%feature("compactdefaultargs") StatusReorder;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusReorder;
		Standard_Boolean StatusReorder(const ShapeExtend_Status status);

		/****************** StatusSelfIntersection ******************/
		/**** md5 signature: bccc7d7d1b860f4aeb57ab0f15684134 ****/
		%feature("compactdefaultargs") StatusSelfIntersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection(const ShapeExtend_Status status);

		/****************** StatusSmall ******************/
		/**** md5 signature: 946de8888b815d7dc1018b04a0e6371a ****/
		%feature("compactdefaultargs") StatusSmall;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusSmall;
		Standard_Boolean StatusSmall(const ShapeExtend_Status status);

		/****************** Wire ******************/
		/**** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Makes the resulting wire (by basic brep_builder).

Returns
-------
TopoDS_Wire
") Wire;
		TopoDS_Wire Wire();

		/****************** WireAPIMake ******************/
		/**** md5 signature: ee7817a9b0126700bae42396160d62de ****/
		%feature("compactdefaultargs") WireAPIMake;
		%feature("autodoc", "Makes the resulting wire (by brepapi_makewire).

Returns
-------
TopoDS_Wire
") WireAPIMake;
		TopoDS_Wire WireAPIMake();

		/****************** WireData ******************/
		/**** md5 signature: c8792f073dea4df1af697814fbf5f311 ****/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Returns working wire.

Returns
-------
opencascade::handle<ShapeExtend_WireData>
") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData();

};


%make_alias(ShapeFix_Wire)

%extend ShapeFix_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeFix_Wireframe *
***************************/
class ShapeFix_Wireframe : public ShapeFix_Root {
	public:
		/****************** ShapeFix_Wireframe ******************/
		/**** md5 signature: b9eeed4d99b50c144520663cc22c8fe2 ****/
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeFix_Wireframe;
		 ShapeFix_Wireframe();

		/****************** ShapeFix_Wireframe ******************/
		/**** md5 signature: 628dc98f08ade249b97eefc6cbfa57cc ****/
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", "No available documentation.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") ShapeFix_Wireframe;
		 ShapeFix_Wireframe(const TopoDS_Shape & shape);

		/****************** CheckSmallEdges ******************/
		/**** md5 signature: 4c5ce2c0c383992f36a4a1feefb66041 ****/
		%feature("compactdefaultargs") CheckSmallEdges;
		%feature("autodoc", "Auxiliary tool for fixsmalledges which checks for small edges and fills the maps. returns true if at least one small edge has been found.

Parameters
----------
theSmallEdges: TopTools_MapOfShape
theEdgeToFaces: TopTools_DataMapOfShapeListOfShape
theFaceWithSmall: TopTools_DataMapOfShapeListOfShape
theMultyEdges: TopTools_MapOfShape

Returns
-------
bool
") CheckSmallEdges;
		Standard_Boolean CheckSmallEdges(TopTools_MapOfShape & theSmallEdges, TopTools_DataMapOfShapeListOfShape & theEdgeToFaces, TopTools_DataMapOfShapeListOfShape & theFaceWithSmall, TopTools_MapOfShape & theMultyEdges);

		/****************** ClearStatuses ******************/
		/**** md5 signature: 8279d01a949362ea8fada8f9fd40957d ****/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "Clears all statuses.

Returns
-------
None
") ClearStatuses;
		virtual void ClearStatuses();

		/****************** FixSmallEdges ******************/
		/**** md5 signature: 050658591f9b62b8c507c8d4a85c8cf1 ****/
		%feature("compactdefaultargs") FixSmallEdges;
		%feature("autodoc", "Fixes small edges in shape by merging adjacent edges if precision is 0.0, uses precision::confusion().

Returns
-------
bool
") FixSmallEdges;
		Standard_Boolean FixSmallEdges();

		/****************** FixWireGaps ******************/
		/**** md5 signature: ff6d8d5392d953c6896a081c0ef72ee6 ****/
		%feature("compactdefaultargs") FixWireGaps;
		%feature("autodoc", "Fixes gaps between ends of curves of adjacent edges (both 3d and pcurves) in wires if precision is 0.0, uses precision::confusion().

Returns
-------
bool
") FixWireGaps;
		Standard_Boolean FixWireGaps();

		/****************** LimitAngle ******************/
		/**** md5 signature: 99518200b4b3977d7e1385612f859812 ****/
		%feature("compactdefaultargs") LimitAngle;
		%feature("autodoc", "Get limit angle for merging edges.

Returns
-------
float
") LimitAngle;
		Standard_Real LimitAngle();

		/****************** Load ******************/
		/**** md5 signature: 5e48307a99195c8c9f614df4cf55663d ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads a shape, resets statuses.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") Load;
		void Load(const TopoDS_Shape & shape);

		/****************** MergeSmallEdges ******************/
		/**** md5 signature: 3ca0513fad246fe51dd3df3fdf5a8d0e ****/
		%feature("compactdefaultargs") MergeSmallEdges;
		%feature("autodoc", "Auxiliary tool for fixsmalledges which merges small edges. if themodedrop is equal to standard_true then small edges, which cannot be connected with adjacent edges are dropped. otherwise they are kept. thelimitangle specifies maximum allowed tangency discontinuity between adjacent edges. if thelimitangle is equal to -1, this angle is not taken into account.

Parameters
----------
theSmallEdges: TopTools_MapOfShape
theEdgeToFaces: TopTools_DataMapOfShapeListOfShape
theFaceWithSmall: TopTools_DataMapOfShapeListOfShape
theMultyEdges: TopTools_MapOfShape
theModeDrop: bool,optional
	default value is Standard_False
theLimitAngle: float,optional
	default value is -1

Returns
-------
bool
") MergeSmallEdges;
		Standard_Boolean MergeSmallEdges(TopTools_MapOfShape & theSmallEdges, TopTools_DataMapOfShapeListOfShape & theEdgeToFaces, TopTools_DataMapOfShapeListOfShape & theFaceWithSmall, TopTools_MapOfShape & theMultyEdges, const Standard_Boolean theModeDrop = Standard_False, const Standard_Real theLimitAngle = -1);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModeDropSmallEdges() {
            return (Standard_Boolean) $self->ModeDropSmallEdges();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModeDropSmallEdges(Standard_Boolean value) {
            $self->ModeDropSmallEdges()=value;
            }
        };
		/****************** SetLimitAngle ******************/
		/**** md5 signature: 5e6b433fe3714c0361eac7da11cdd579 ****/
		%feature("compactdefaultargs") SetLimitAngle;
		%feature("autodoc", "Set limit angle for merging edges.

Parameters
----------
theLimitAngle: float

Returns
-------
None
") SetLimitAngle;
		void SetLimitAngle(const Standard_Real theLimitAngle);

		/****************** Shape ******************/
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** StatusSmallEdges ******************/
		/**** md5 signature: cacca60afaecf2ca57f95af46eb9f2fd ****/
		%feature("compactdefaultargs") StatusSmallEdges;
		%feature("autodoc", "Decodes the status of the last fixsmalledges. ok - no small edges were found done1 - some small edges were fixed fail1 - failed to fix some small edges.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusSmallEdges;
		Standard_Boolean StatusSmallEdges(const ShapeExtend_Status status);

		/****************** StatusWireGaps ******************/
		/**** md5 signature: b3df4d3f79c1800697ae60d5bafc10f1 ****/
		%feature("compactdefaultargs") StatusWireGaps;
		%feature("autodoc", "Decodes the status of the last fixwiregaps. ok - no gaps were found done1 - some gaps in 3d were fixed done2 - some gaps in 2d were fixed fail1 - failed to fix some gaps in 3d fail2 - failed to fix some gaps in 2d.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") StatusWireGaps;
		Standard_Boolean StatusWireGaps(const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Wireframe)

%extend ShapeFix_Wireframe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class ShapeFix_WireSegment:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
