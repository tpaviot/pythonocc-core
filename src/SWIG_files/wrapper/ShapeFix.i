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
/* public enums */
/* end public enums declaration */

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
%template(ShapeFix_DataMapOfShapeBox2d) NCollection_DataMap <TopoDS_Shape , Bnd_Box2d , TopTools_ShapeMapHasher>;
%template(ShapeFix_SequenceOfWireSegment) NCollection_Sequence <ShapeFix_WireSegment>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , Bnd_Box2d , TopTools_ShapeMapHasher> ShapeFix_DataMapOfShapeBox2d;
typedef NCollection_DataMap <TopoDS_Shape , Bnd_Box2d , TopTools_ShapeMapHasher>::Iterator ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
typedef NCollection_Sequence <ShapeFix_WireSegment> ShapeFix_SequenceOfWireSegment;
/* end typedefs declaration */

/*****************
* class ShapeFix *
*****************/
%rename(shapefix) ShapeFix;
class ShapeFix {
	public:
		/****************** EncodeRegularity ******************/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "* Runs EncodeRegularity from BRepLib taking into account shared components of assemblies, so that each component is processed only once
	:param shape:
	:type shape: TopoDS_Shape &
	:param tolang: default value is 1.0e-10
	:type tolang: float
	:rtype: void") EncodeRegularity;
		static void EncodeRegularity (const TopoDS_Shape & shape,const Standard_Real tolang = 1.0e-10);

		/****************** FixVertexPosition ******************/
		%feature("compactdefaultargs") FixVertexPosition;
		%feature("autodoc", "* Fix position of the vertices having tolerance more tnan specified one.;
	:param theshape:
	:type theshape: TopoDS_Shape &
	:param theTolerance:
	:type theTolerance: float
	:param thecontext:
	:type thecontext: opencascade::handle<ShapeBuild_ReShape> &
	:rtype: bool") FixVertexPosition;
		static Standard_Boolean FixVertexPosition (TopoDS_Shape & theshape,const Standard_Real theTolerance,const opencascade::handle<ShapeBuild_ReShape> & thecontext);

		/****************** LeastEdgeSize ******************/
		%feature("compactdefaultargs") LeastEdgeSize;
		%feature("autodoc", "* Calculate size of least edge;
	:param theshape:
	:type theshape: TopoDS_Shape &
	:rtype: float") LeastEdgeSize;
		static Standard_Real LeastEdgeSize (TopoDS_Shape & theshape);

		/****************** RemoveSmallEdges ******************/
		%feature("compactdefaultargs") RemoveSmallEdges;
		%feature("autodoc", "* Removes edges which are less than given tolerance from shape with help of ShapeFix_Wire::FixSmall()
	:param shape:
	:type shape: TopoDS_Shape &
	:param Tolerance:
	:type Tolerance: float
	:param context:
	:type context: opencascade::handle<ShapeBuild_ReShape> &
	:rtype: TopoDS_Shape") RemoveSmallEdges;
		static TopoDS_Shape RemoveSmallEdges (TopoDS_Shape & shape,const Standard_Real Tolerance,opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "* Runs SameParameter from BRepLib with these adaptations : <enforce> forces computations, else they are made only on Edges with flag SameParameter false <preci>, if not precised, is taken for each EDge as its own Tolerance Returns True when done, False if an exception has been raised In case of exception anyway, as many edges as possible have been processed. The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.
	:param shape:
	:type shape: TopoDS_Shape &
	:param enforce:
	:type enforce: bool
	:param preci: default value is 0.0
	:type preci: float
	:param theProgress: default value is 0
	:type theProgress: opencascade::handle<Message_ProgressIndicator> &
	:param theMsgReg: default value is 0
	:type theMsgReg: opencascade::handle<ShapeExtend_BasicMsgRegistrator> &
	:rtype: bool") SameParameter;
		static Standard_Boolean SameParameter (const TopoDS_Shape & shape,const Standard_Boolean enforce,const Standard_Real preci = 0.0,const opencascade::handle<Message_ProgressIndicator> & theProgress = 0,const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & theMsgReg = 0);

};


%extend ShapeFix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ShapeFix_Edge *
**********************/
%nodefaultctor ShapeFix_Edge;
class ShapeFix_Edge : public Standard_Transient {
	public:
		/****************** FixAddCurve3d ******************/
		%feature("compactdefaultargs") FixAddCurve3d;
		%feature("autodoc", "* Tries to build 3d curve of the edge if missing Use : It is to be called after FixRemoveCurve3d (if removed) or in any case when edge can have no 3d curve Returns: True if 3d curve was added, else False Status : OK : 3d curve exists FAIL1: BRepLib::BuildCurve3d() has failed DONE1: 3d curve was added
	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: bool") FixAddCurve3d;
		Standard_Boolean FixAddCurve3d (const TopoDS_Edge & edge);

		/****************** FixAddPCurve ******************/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "* See method below for information
	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:param isSeam:
	:type isSeam: bool
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean isSeam,const Standard_Real prec = 0.0);

		/****************** FixAddPCurve ******************/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "* See method below for information
	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: opencascade::handle<Geom_Surface> &
	:param location:
	:type location: TopLoc_Location &
	:param isSeam:
	:type isSeam: bool
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location,const Standard_Boolean isSeam,const Standard_Real prec = 0.0);

		/****************** FixAddPCurve ******************/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "* See method below for information
	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:param isSeam:
	:type isSeam: bool
	:param surfana:
	:type surfana: opencascade::handle<ShapeAnalysis_Surface> &
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean isSeam,const opencascade::handle<ShapeAnalysis_Surface> & surfana,const Standard_Real prec = 0.0);

		/****************** FixAddPCurve ******************/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "* Adds pcurve(s) of the edge if missing (by projecting 3d curve) Parameter isSeam indicates if the edge is a seam. The parameter <prec> defines the precision for calculations. If it is 0 (default), the tolerance of the edge is taken. Remark : This method is rather for internal use since it accepts parameter <surfana> for optimization of computations Use : It is to be called after FixRemovePCurve (if removed) or in any case when edge can have no pcurve Returns: True if pcurve was added, else False Status : OK : Pcurve exists FAIL1: No 3d curve FAIL2: fail during projecting DONE1: Pcurve was added DONE2: specific case of pcurve going through degenerated point on sphere encountered during projection (see class ShapeConstruct_ProjectCurveOnSurface for more info)
	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: opencascade::handle<Geom_Surface> &
	:param location:
	:type location: TopLoc_Location &
	:param isSeam:
	:type isSeam: bool
	:param surfana:
	:type surfana: opencascade::handle<ShapeAnalysis_Surface> &
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location,const Standard_Boolean isSeam,const opencascade::handle<ShapeAnalysis_Surface> & surfana,const Standard_Real prec = 0.0);

		/****************** FixRemoveCurve3d ******************/
		%feature("compactdefaultargs") FixRemoveCurve3d;
		%feature("autodoc", "* Removes 3d curve of the edge if it does not match the vertices Returns: True, if does not match, removed (status DONE) False, (status OK) if matches or (status FAIL) if no 3d curve, nothing done
	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: bool") FixRemoveCurve3d;
		Standard_Boolean FixRemoveCurve3d (const TopoDS_Edge & edge);

		/****************** FixRemovePCurve ******************/
		%feature("compactdefaultargs") FixRemovePCurve;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:rtype: bool") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);

		/****************** FixRemovePCurve ******************/
		%feature("compactdefaultargs") FixRemovePCurve;
		%feature("autodoc", "* Removes the pcurve(s) of the edge if it does not match the vertices Check is done Use : It is to be called when pcurve of an edge can be wrong (e.g., after import from IGES) Returns: True, if does not match, removed (status DONE) False, (status OK) if matches or (status FAIL) if no pcurve, nothing done
	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: opencascade::handle<Geom_Surface> &
	:param location:
	:type location: TopLoc_Location &
	:rtype: bool") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location);

		/****************** FixReversed2d ******************/
		%feature("compactdefaultargs") FixReversed2d;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:rtype: bool") FixReversed2d;
		Standard_Boolean FixReversed2d (const TopoDS_Edge & edge,const TopoDS_Face & face);

		/****************** FixReversed2d ******************/
		%feature("compactdefaultargs") FixReversed2d;
		%feature("autodoc", "* Fixes edge if pcurve is directed opposite to 3d curve Check is done by call to the function ShapeAnalysis_Edge::CheckCurve3dWithPCurve() Warning: For seam edge this method will check and fix the pcurve in only one direction. Hence, it should be called twice for seam edge: once with edge orientation FORWARD and once with REVERSED. Returns: False if nothing done, True if reversed (status DONE) Status: OK - pcurve OK, nothing done FAIL1 - no pcurve FAIL2 - no 3d curve DONE1 - pcurve was reversed
	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: opencascade::handle<Geom_Surface> &
	:param location:
	:type location: TopLoc_Location &
	:rtype: bool") FixReversed2d;
		Standard_Boolean FixReversed2d (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surface,const TopLoc_Location & location);

		/****************** FixSameParameter ******************/
		%feature("compactdefaultargs") FixSameParameter;
		%feature("autodoc", "* Tries to make edge SameParameter and sets corresponding tolerance and SameParameter flag. First, it makes edge same range if SameRange flag is not set. //! If flag SameParameter is set, this method calls the function ShapeAnalysis_Edge::CheckSameParameter() that calculates the maximal deviation of pcurves of the edge from its 3d curve. If deviation > tolerance, the tolerance of edge is increased to a value of deviation. If deviation < tolerance nothing happens. //! If flag SameParameter is not set, this method chooses the best variant (one that has minimal tolerance), either a. only after computing deviation (as above) or b. after calling standard procedure BRepLib::SameParameter and computing deviation (as above). If <tolerance> > 0, it is used as parameter for BRepLib::SameParameter, otherwise, tolerance of the edge is used. //! Use : Is to be called after all pcurves and 3d curve of the edge are correctly computed Remark : SameParameter flag is always set to True after this method Returns: True, if something done, else False Status : OK - edge was initially SameParameter, nothing is done FAIL1 - computation of deviation of pcurves from 3d curve has failed FAIL2 - BRepLib::SameParameter() has failed DONE1 - tolerance of the edge was increased DONE2 - flag SameParameter was set to True (only if BRepLib::SameParameter() did not set it) DONE3 - edge was modified by BRepLib::SameParameter() to SameParameter DONE4 - not used anymore DONE5 - if the edge resulting from BRepLib has been chosen, i.e. variant b. above (only for edges with not set SameParameter)
	:param edge:
	:type edge: TopoDS_Edge &
	:param tolerance: default value is 0.0
	:type tolerance: float
	:rtype: bool") FixSameParameter;
		Standard_Boolean FixSameParameter (const TopoDS_Edge & edge,const Standard_Real tolerance = 0.0);

		/****************** FixSameParameter ******************/
		%feature("compactdefaultargs") FixSameParameter;
		%feature("autodoc", "* Tries to make edge SameParameter and sets corresponding tolerance and SameParameter flag. First, it makes edge same range if SameRange flag is not set. //! If flag SameParameter is set, this method calls the function ShapeAnalysis_Edge::CheckSameParameter() that calculates the maximal deviation of pcurves of the edge from its 3d curve. If deviation > tolerance, the tolerance of edge is increased to a value of deviation. If deviation < tolerance nothing happens. //! If flag SameParameter is not set, this method chooses the best variant (one that has minimal tolerance), either a. only after computing deviation (as above) or b. after calling standard procedure BRepLib::SameParameter and computing deviation (as above). If <tolerance> > 0, it is used as parameter for BRepLib::SameParameter, otherwise, tolerance of the edge is used. //! Use : Is to be called after all pcurves and 3d curve of the edge are correctly computed Remark : SameParameter flag is always set to True after this method Returns: True, if something done, else False Status : OK - edge was initially SameParameter, nothing is done FAIL1 - computation of deviation of pcurves from 3d curve has failed FAIL2 - BRepLib::SameParameter() has failed DONE1 - tolerance of the edge was increased DONE2 - flag SameParameter was set to True (only if BRepLib::SameParameter() did not set it) DONE3 - edge was modified by BRepLib::SameParameter() to SameParameter DONE4 - not used anymore DONE5 - if the edge resulting from BRepLib has been chosen, i.e. variant b. above (only for edges with not set SameParameter)
	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:param tolerance: default value is 0.0
	:type tolerance: float
	:rtype: bool") FixSameParameter;
		Standard_Boolean FixSameParameter (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Real tolerance = 0.0);

		/****************** FixVertexTolerance ******************/
		%feature("compactdefaultargs") FixVertexTolerance;
		%feature("autodoc", ":param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:rtype: bool") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance (const TopoDS_Edge & edge,const TopoDS_Face & face);

		/****************** FixVertexTolerance ******************/
		%feature("compactdefaultargs") FixVertexTolerance;
		%feature("autodoc", "* Increases the tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) Returns: True, if tolerances have been increased, otherwise False Status: OK : the original tolerances have not been changed DONE1: the tolerance of first vertex has been increased DONE2: the tolerance of last vertex has been increased
	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: bool") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance (const TopoDS_Edge & edge);

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "* Returns the projector used for recomputing missing pcurves Can be used for adjusting parameters of projector
	:rtype: opencascade::handle<ShapeConstruct_ProjectCurveOnSurface>") Projector;
		opencascade::handle<ShapeConstruct_ProjectCurveOnSurface> Projector ();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets context
	:param context:
	:type context: opencascade::handle<ShapeBuild_ReShape> &
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** ShapeFix_Edge ******************/
		%feature("compactdefaultargs") ShapeFix_Edge;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeFix_Edge;
		 ShapeFix_Edge ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status (in the form of True/False) of last Fix
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Edge)

%extend ShapeFix_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeFix_EdgeConnect *
*****************************/
%nodefaultctor ShapeFix_EdgeConnect;
class ShapeFix_EdgeConnect {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds information on connectivity between start vertex of second edge and end vertex of first edge, taking edges orientation into account
	:param aFirst:
	:type aFirst: TopoDS_Edge &
	:param aSecond:
	:type aSecond: TopoDS_Edge &
	:rtype: None") Add;
		void Add (const TopoDS_Edge & aFirst,const TopoDS_Edge & aSecond);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds connectivity information for the whole shape. Note: edges in wires must be well ordered Note: flag Closed should be set for closed wires
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None") Add;
		void Add (const TopoDS_Shape & aShape);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds shared vertices, updates their positions and tolerances
	:rtype: None") Build;
		void Build ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears internal data structure
	:rtype: None") Clear;
		void Clear ();

		/****************** ShapeFix_EdgeConnect ******************/
		%feature("compactdefaultargs") ShapeFix_EdgeConnect;
		%feature("autodoc", ":rtype: None") ShapeFix_EdgeConnect;
		 ShapeFix_EdgeConnect ();

};


%extend ShapeFix_EdgeConnect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeFix_EdgeProjAux *
*****************************/
%nodefaultctor ShapeFix_EdgeProjAux;
class ShapeFix_EdgeProjAux : public Standard_Transient {
	public:
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", ":param preci:
	:type preci: float
	:rtype: None") Compute;
		void Compute (const Standard_Real preci);

		/****************** FirstParam ******************/
		%feature("compactdefaultargs") FirstParam;
		%feature("autodoc", ":rtype: float") FirstParam;
		Standard_Real FirstParam ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None") Init;
		void Init (const TopoDS_Face & F,const TopoDS_Edge & E);

		/****************** IsFirstDone ******************/
		%feature("compactdefaultargs") IsFirstDone;
		%feature("autodoc", ":rtype: bool") IsFirstDone;
		Standard_Boolean IsFirstDone ();

		/****************** IsIso ******************/
		%feature("compactdefaultargs") IsIso;
		%feature("autodoc", ":param C:
	:type C: opencascade::handle<Geom2d_Curve> &
	:rtype: bool") IsIso;
		Standard_Boolean IsIso (const opencascade::handle<Geom2d_Curve> & C);

		/****************** IsLastDone ******************/
		%feature("compactdefaultargs") IsLastDone;
		%feature("autodoc", ":rtype: bool") IsLastDone;
		Standard_Boolean IsLastDone ();

		/****************** LastParam ******************/
		%feature("compactdefaultargs") LastParam;
		%feature("autodoc", ":rtype: float") LastParam;
		Standard_Real LastParam ();

		/****************** ShapeFix_EdgeProjAux ******************/
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", ":rtype: None") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux ();

		/****************** ShapeFix_EdgeProjAux ******************/
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux (const TopoDS_Face & F,const TopoDS_Edge & E);

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
%nodefaultctor ShapeFix_FaceConnect;
class ShapeFix_FaceConnect {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param aFirst:
	:type aFirst: TopoDS_Face &
	:param aSecond:
	:type aSecond: TopoDS_Face &
	:rtype: bool") Add;
		Standard_Boolean Add (const TopoDS_Face & aFirst,const TopoDS_Face & aSecond);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", ":param shell:
	:type shell: TopoDS_Shell &
	:param sewtoler:
	:type sewtoler: float
	:param fixtoler:
	:type fixtoler: float
	:rtype: TopoDS_Shell") Build;
		TopoDS_Shell Build (const TopoDS_Shell & shell,const Standard_Real sewtoler,const Standard_Real fixtoler);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears internal data structure
	:rtype: None") Clear;
		void Clear ();

		/****************** ShapeFix_FaceConnect ******************/
		%feature("compactdefaultargs") ShapeFix_FaceConnect;
		%feature("autodoc", ":rtype: None") ShapeFix_FaceConnect;
		 ShapeFix_FaceConnect ();

};


%extend ShapeFix_FaceConnect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeFix_FreeBounds *
****************************/
%nodefaultctor ShapeFix_FreeBounds;
class ShapeFix_FreeBounds {
	public:
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

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "* Returns modified source shape.
	:rtype: TopoDS_Shape") GetShape;
		const TopoDS_Shape  GetShape ();

		/****************** ShapeFix_FreeBounds ******************/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds ();

		/****************** ShapeFix_FreeBounds ******************/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "* Builds forecasting free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of faces. Tolerance <closetoler> should be greater than tolerance <sewtoler> used for initializing sewing analyzer, otherwise connection of open wires is not performed.
	:param shape:
	:type shape: TopoDS_Shape &
	:param sewtoler:
	:type sewtoler: float
	:param closetoler:
	:type closetoler: float
	:param splitclosed:
	:type splitclosed: bool
	:param splitopen:
	:type splitopen: bool
	:rtype: None") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds (const TopoDS_Shape & shape,const Standard_Real sewtoler,const Standard_Real closetoler,const Standard_Boolean splitclosed,const Standard_Boolean splitopen);

		/****************** ShapeFix_FreeBounds ******************/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "* Builds actual free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of shells.
	:param shape:
	:type shape: TopoDS_Shape &
	:param closetoler:
	:type closetoler: float
	:param splitclosed:
	:type splitclosed: bool
	:param splitopen:
	:type splitopen: bool
	:rtype: None") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds (const TopoDS_Shape & shape,const Standard_Real closetoler,const Standard_Boolean splitclosed,const Standard_Boolean splitopen);

};


%extend ShapeFix_FreeBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class ShapeFix_IntersectionTool *
**********************************/
%nodefaultctor ShapeFix_IntersectionTool;
class ShapeFix_IntersectionTool {
	public:
		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Returns context
	:rtype: opencascade::handle<ShapeBuild_ReShape>") Context;
		opencascade::handle<ShapeBuild_ReShape> Context ();

		/****************** CutEdge ******************/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "* Cut edge by parameters pend and cut
	:param edge:
	:type edge: TopoDS_Edge &
	:param pend:
	:type pend: float
	:param cut:
	:type cut: float
	:param face:
	:type face: TopoDS_Face &
	:param iscutline:
	:type iscutline: bool
	:rtype: bool") CutEdge;
		Standard_Boolean CutEdge (const TopoDS_Edge & edge,const Standard_Real pend,const Standard_Real cut,const TopoDS_Face & face,Standard_Boolean &OutValue);

		/****************** FixIntersectingWires ******************/
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", ":param face:
	:type face: TopoDS_Face &
	:rtype: bool") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires (TopoDS_Face & face);

		/****************** FixSelfIntersectWire ******************/
		%feature("compactdefaultargs") FixSelfIntersectWire;
		%feature("autodoc", ":param sewd:
	:type sewd: opencascade::handle<ShapeExtend_WireData> &
	:param face:
	:type face: TopoDS_Face &
	:param NbSplit:
	:type NbSplit: int &
	:param NbCut:
	:type NbCut: int &
	:param NbRemoved:
	:type NbRemoved: int &
	:rtype: bool") FixSelfIntersectWire;
		Standard_Boolean FixSelfIntersectWire (opencascade::handle<ShapeExtend_WireData> & sewd,const TopoDS_Face & face,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** ShapeFix_IntersectionTool ******************/
		%feature("compactdefaultargs") ShapeFix_IntersectionTool;
		%feature("autodoc", "* Constructor
	:param context:
	:type context: opencascade::handle<ShapeBuild_ReShape> &
	:param preci:
	:type preci: float
	:param maxtol: default value is 1.0
	:type maxtol: float
	:rtype: None") ShapeFix_IntersectionTool;
		 ShapeFix_IntersectionTool (const opencascade::handle<ShapeBuild_ReShape> & context,const Standard_Real preci,const Standard_Real maxtol = 1.0);

		/****************** SplitEdge ******************/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "* Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting The 'face' is necessary for pcurves and using TransferParameterProj
	:param edge:
	:type edge: TopoDS_Edge &
	:param param:
	:type param: float
	:param vert:
	:type vert: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param newE1:
	:type newE1: TopoDS_Edge &
	:param newE2:
	:type newE2: TopoDS_Edge &
	:param preci:
	:type preci: float
	:rtype: bool") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real preci);

};


%extend ShapeFix_IntersectionTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ShapeFix_Root *
**********************/
%nodefaultctor ShapeFix_Root;
class ShapeFix_Root : public Standard_Transient {
	public:
		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Returns context
	:rtype: opencascade::handle<ShapeBuild_ReShape>") Context;
		opencascade::handle<ShapeBuild_ReShape> Context ();

		/****************** LimitTolerance ******************/
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "* Returns tolerance limited by [myMinTol,myMaxTol]
	:param toler:
	:type toler: float
	:rtype: float") LimitTolerance;
		Standard_Real LimitTolerance (const Standard_Real toler);

		/****************** MaxTolerance ******************/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "* Returns maximal allowed tolerance
	:rtype: float") MaxTolerance;
		Standard_Real MaxTolerance ();

		/****************** MinTolerance ******************/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "* Returns minimal allowed tolerance
	:rtype: float") MinTolerance;
		Standard_Real MinTolerance ();

		/****************** MsgRegistrator ******************/
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "* Returns message registrator
	:rtype: opencascade::handle<ShapeExtend_BasicMsgRegistrator>") MsgRegistrator;
		opencascade::handle<ShapeExtend_BasicMsgRegistrator> MsgRegistrator ();

		/****************** Precision ******************/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "* Returns basic precision value
	:rtype: float") Precision;
		Standard_Real Precision ();

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "* Sends a fail to be attached to the shape. Calls SendMsg with gravity set to Message_Fail.
	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:rtype: None") SendFail;
		void SendFail (const TopoDS_Shape & shape,const Message_Msg & message);

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "* Calls previous method for myShape.
	:param message:
	:type message: Message_Msg &
	:rtype: None") SendFail;
		void SendFail (const Message_Msg & message);

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "* Sends a message to be attached to the shape. Calls corresponding message of message registrator.
	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:param gravity: default value is Message_Info
	:type gravity: Message_Gravity
	:rtype: None") SendMsg;
		void SendMsg (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity = Message_Info);

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "* Sends a message to be attached to myShape. Calls previous method.
	:param message:
	:type message: Message_Msg &
	:param gravity: default value is Message_Info
	:type gravity: Message_Gravity
	:rtype: None") SendMsg;
		void SendMsg (const Message_Msg & message,const Message_Gravity gravity = Message_Info);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "* Sends a warning to be attached to the shape. Calls SendMsg with gravity set to Message_Warning.
	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:rtype: None") SendWarning;
		void SendWarning (const TopoDS_Shape & shape,const Message_Msg & message);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "* Calls previous method for myShape.
	:param message:
	:type message: Message_Msg &
	:rtype: None") SendWarning;
		void SendWarning (const Message_Msg & message);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Copy all fields from another Root object
	:param Root:
	:type Root: opencascade::handle<ShapeFix_Root> &
	:rtype: void") Set;
		virtual void Set (const opencascade::handle<ShapeFix_Root> & Root);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets context
	:param context:
	:type context: opencascade::handle<ShapeBuild_ReShape> &
	:rtype: void") SetContext;
		virtual void SetContext (const opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal allowed tolerance
	:param maxtol:
	:type maxtol: float
	:rtype: void") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "* Sets minimal allowed tolerance
	:param mintol:
	:type mintol: float
	:rtype: void") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "* Sets message registrator
	:param msgreg:
	:type msgreg: opencascade::handle<ShapeExtend_BasicMsgRegistrator> &
	:rtype: void") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets basic precision value
	:param preci:
	:type preci: float
	:rtype: void") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);

		/****************** ShapeFix_Root ******************/
		%feature("compactdefaultargs") ShapeFix_Root;
		%feature("autodoc", "* Empty Constructor (no context is created)
	:rtype: None") ShapeFix_Root;
		 ShapeFix_Root ();

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
%nodefaultctor ShapeFix_ShapeTolerance;
class ShapeFix_ShapeTolerance {
	public:
		/****************** LimitTolerance ******************/
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "* Limits tolerances in a shape as follows : tmin = tmax -> as SetTolerance (forces) tmin = 0 -> maximum tolerance will be <tmax> tmax = 0 or not given (more generally, tmax < tmin) -> <tmax> ignored, minimum will be <tmin> else, maximum will be <max> and minimum will be <min> styp = VERTEX : only vertices are set styp = EDGE : only edges are set styp = FACE : only faces are set styp = WIRE : to have edges and their vertices set styp = other value : all (vertices,edges,faces) are set Returns True if at least one tolerance of the sub-shape has been modified
	:param shape:
	:type shape: TopoDS_Shape &
	:param tmin:
	:type tmin: float
	:param tmax: default value is 0.0
	:type tmax: float
	:param styp: default value is TopAbs_SHAPE
	:type styp: TopAbs_ShapeEnum
	:rtype: bool") LimitTolerance;
		Standard_Boolean LimitTolerance (const TopoDS_Shape & shape,const Standard_Real tmin,const Standard_Real tmax = 0.0,const TopAbs_ShapeEnum styp = TopAbs_SHAPE);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets (enforces) tolerances in a shape to the given value styp = VERTEX : only vertices are set styp = EDGE : only edges are set styp = FACE : only faces are set styp = WIRE : to have edges and their vertices set styp = other value : all (vertices,edges,faces) are set
	:param shape:
	:type shape: TopoDS_Shape &
	:param preci:
	:type preci: float
	:param styp: default value is TopAbs_SHAPE
	:type styp: TopAbs_ShapeEnum
	:rtype: None") SetTolerance;
		void SetTolerance (const TopoDS_Shape & shape,const Standard_Real preci,const TopAbs_ShapeEnum styp = TopAbs_SHAPE);

		/****************** ShapeFix_ShapeTolerance ******************/
		%feature("compactdefaultargs") ShapeFix_ShapeTolerance;
		%feature("autodoc", ":rtype: None") ShapeFix_ShapeTolerance;
		 ShapeFix_ShapeTolerance ();

};


%extend ShapeFix_ShapeTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeFix_SplitTool *
***************************/
%nodefaultctor ShapeFix_SplitTool;
class ShapeFix_SplitTool {
	public:
		/****************** CutEdge ******************/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "* Cut edge by parameters pend and cut
	:param edge:
	:type edge: TopoDS_Edge &
	:param pend:
	:type pend: float
	:param cut:
	:type cut: float
	:param face:
	:type face: TopoDS_Face &
	:param iscutline:
	:type iscutline: bool
	:rtype: bool") CutEdge;
		Standard_Boolean CutEdge (const TopoDS_Edge & edge,const Standard_Real pend,const Standard_Real cut,const TopoDS_Face & face,Standard_Boolean &OutValue);

		/****************** ShapeFix_SplitTool ******************/
		%feature("compactdefaultargs") ShapeFix_SplitTool;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeFix_SplitTool;
		 ShapeFix_SplitTool ();

		/****************** SplitEdge ******************/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "* Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting The 'face' is necessary for pcurves and using TransferParameterProj
	:param edge:
	:type edge: TopoDS_Edge &
	:param param:
	:type param: float
	:param vert:
	:type vert: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param newE1:
	:type newE1: TopoDS_Edge &
	:param newE2:
	:type newE2: TopoDS_Edge &
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: bool") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real tol3d,const Standard_Real tol2d);

		/****************** SplitEdge ******************/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "* Split edge on two new edges using new vertex 'vert' and 'param1' and 'param2' - parameter for splitting and cutting The 'face' is necessary for pcurves and using TransferParameterProj
	:param edge:
	:type edge: TopoDS_Edge &
	:param param1:
	:type param1: float
	:param param2:
	:type param2: float
	:param vert:
	:type vert: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param newE1:
	:type newE1: TopoDS_Edge &
	:param newE2:
	:type newE2: TopoDS_Edge &
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: bool") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param1,const Standard_Real param2,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real tol3d,const Standard_Real tol2d);

		/****************** SplitEdge ******************/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "* Split edge on two new edges using two new vertex V1 and V2 and two parameters for splitting - fp and lp correspondingly The 'face' is necessary for pcurves and using TransferParameterProj aNum - number of edge in SeqE which corresponding to [fp,lp]
	:param edge:
	:type edge: TopoDS_Edge &
	:param fp:
	:type fp: float
	:param V1:
	:type V1: TopoDS_Vertex &
	:param lp:
	:type lp: float
	:param V2:
	:type V2: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param SeqE:
	:type SeqE: TopTools_SequenceOfShape &
	:param aNum:
	:type aNum: int &
	:param context:
	:type context: opencascade::handle<ShapeBuild_ReShape> &
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: bool") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real fp,const TopoDS_Vertex & V1,const Standard_Real lp,const TopoDS_Vertex & V2,const TopoDS_Face & face,TopTools_SequenceOfShape & SeqE,Standard_Integer &OutValue,const opencascade::handle<ShapeBuild_ReShape> & context,const Standard_Real tol3d,const Standard_Real tol2d);

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
%nodefaultctor ShapeFix_WireVertex;
class ShapeFix_WireVertex {
	public:
		/****************** Analyzer ******************/
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "* returns internal analyzer
	:rtype: ShapeAnalysis_WireVertex") Analyzer;
		const ShapeAnalysis_WireVertex & Analyzer ();

		/****************** Fix ******************/
		%feature("compactdefaultargs") Fix;
		%feature("autodoc", "* Fixes all statuses except 'Disjoined', i.e. the cases in which a common value has been set, with or without changing parameters Returns the count of fixed vertices, 0 if none
	:rtype: int") Fix;
		Standard_Integer Fix ();

		/****************** FixSame ******************/
		%feature("compactdefaultargs") FixSame;
		%feature("autodoc", "* Fixes 'Same' or 'Close' status (same vertex may be set, without changing parameters) Returns the count of fixed vertices, 0 if none
	:rtype: int") FixSame;
		Standard_Integer FixSame ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Loads the wire, ininializes internal analyzer (ShapeAnalysis_WireVertex) with the given precision, and performs analysis
	:param wire:
	:type wire: TopoDS_Wire &
	:param preci:
	:type preci: float
	:rtype: None") Init;
		void Init (const TopoDS_Wire & wire,const Standard_Real preci);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Loads the wire, ininializes internal analyzer (ShapeAnalysis_WireVertex) with the given precision, and performs analysis
	:param sbwd:
	:type sbwd: opencascade::handle<ShapeExtend_WireData> &
	:param preci:
	:type preci: float
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeExtend_WireData> & sbwd,const Standard_Real preci);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Loads all the data on wire, already analysed by ShapeAnalysis_WireVertex
	:param sawv:
	:type sawv: ShapeAnalysis_WireVertex &
	:rtype: None") Init;
		void Init (const ShapeAnalysis_WireVertex & sawv);

		/****************** ShapeFix_WireVertex ******************/
		%feature("compactdefaultargs") ShapeFix_WireVertex;
		%feature("autodoc", ":rtype: None") ShapeFix_WireVertex;
		 ShapeFix_WireVertex ();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "* returns resulting wire (fixed)
	:rtype: TopoDS_Wire") Wire;
		TopoDS_Wire Wire ();

		/****************** WireData ******************/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "* returns data on wire (fixed)
	:rtype: opencascade::handle<ShapeExtend_WireData>") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData ();

};


%extend ShapeFix_WireVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ShapeFix_ComposeShell *
******************************/
%nodefaultctor ShapeFix_ComposeShell;
class ShapeFix_ComposeShell : public ShapeFix_Root {
	public:

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
		%feature("compactdefaultargs") DispatchWires;
		%feature("autodoc", "* Creates new faces from the set of (closed) wires. Each wire is put on corresponding patch in the composite surface, and all pcurves on the initial (pseudo)face are reassigned to that surface. If several wires are one inside another, single face is created.
	:param faces:
	:type faces: TopTools_SequenceOfShape &
	:param wires:
	:type wires: ShapeFix_SequenceOfWireSegment &
	:rtype: None") DispatchWires;
		void DispatchWires (TopTools_SequenceOfShape & faces,ShapeFix_SequenceOfWireSegment & wires);

		/****************** GetTransferParamTool ******************/
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "* Gets tool for transfer parameters from 3d to 2d and vice versa.
	:rtype: opencascade::handle<ShapeAnalysis_TransferParameters>") GetTransferParamTool;
		opencascade::handle<ShapeAnalysis_TransferParameters> GetTransferParamTool ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with composite surface, face and precision. Here face defines both set of wires and way of getting pcurves. Precision is used (together with tolerance of edges) for handling subtle cases, such as tangential intersections.
	:param Grid:
	:type Grid: opencascade::handle<ShapeExtend_CompositeSurface> &
	:param L:
	:type L: TopLoc_Location &
	:param Face:
	:type Face: TopoDS_Face &
	:param Prec:
	:type Prec: float
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeExtend_CompositeSurface> & Grid,const TopLoc_Location & L,const TopoDS_Face & Face,const Standard_Real Prec);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the work on already loaded data.
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Returns resulting shell or face (or Null shape if not done)
	:rtype: TopoDS_Shape") Result;
		const TopoDS_Shape  Result ();

		/****************** SetTransferParamTool ******************/
		%feature("compactdefaultargs") SetTransferParamTool;
		%feature("autodoc", "* Sets tool for transfer parameters from 3d to 2d and vice versa.
	:param TransferParam:
	:type TransferParam: opencascade::handle<ShapeAnalysis_TransferParameters> &
	:rtype: None") SetTransferParamTool;
		void SetTransferParamTool (const opencascade::handle<ShapeAnalysis_TransferParameters> & TransferParam);

		/****************** ShapeFix_ComposeShell ******************/
		%feature("compactdefaultargs") ShapeFix_ComposeShell;
		%feature("autodoc", "* Creates empty tool.
	:rtype: None") ShapeFix_ComposeShell;
		 ShapeFix_ComposeShell ();

		/****************** SplitEdges ******************/
		%feature("compactdefaultargs") SplitEdges;
		%feature("autodoc", "* Splits edges in the original shape by grid. This is a part of Perform() which does not produce any resulting shape; the only result is filled context where splittings are recorded. //! NOTE: If edge is splitted, it is replaced by wire, and order of edges in the wire corresponds to FORWARD orientation of the edge.
	:rtype: None") SplitEdges;
		void SplitEdges ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Queries status of last call to Perform() OK : nothing done (some kind of error) DONE1: splitting is done, at least one new face created DONE2: splitting is done, several new faces obtained FAIL1: misoriented wire encountered (handled) FAIL2: recoverable parity error FAIL3: edge with no pcurve on supporting face FAIL4: unrecoverable algorithm error (parity check)
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
%nodefaultctor ShapeFix_Face;
class ShapeFix_Face : public ShapeFix_Root {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add a wire to current face using BRep_Builder. Wire is added without taking into account orientation of face (as if face were FORWARD).
	:param wire:
	:type wire: TopoDS_Wire &
	:rtype: None") Add;
		void Add (const TopoDS_Wire & wire);


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
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "* Sets all modes to default
	:rtype: void") ClearModes;
		virtual void ClearModes ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns a face which corresponds to the current state Warning: The finally produced face may be another one ... but with the same support
	:rtype: TopoDS_Face") Face;
		TopoDS_Face Face ();

		/****************** FixAddNaturalBound ******************/
		%feature("compactdefaultargs") FixAddNaturalBound;
		%feature("autodoc", "* Adds natural boundary on face if it is missing. Two cases are supported: - face has no wires - face lies on geometrically double-closed surface (sphere or torus) and none of wires is left-oriented Returns True if natural boundary was added
	:rtype: bool") FixAddNaturalBound;
		Standard_Boolean FixAddNaturalBound ();


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
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", "* Detects and fixes the special case when face has more than one wire and this wires have intersection point
	:rtype: bool") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires ();


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
		%feature("compactdefaultargs") FixLoopWire;
		%feature("autodoc", "* Detects if wire has a loop and fixes this situation by splitting on the few parts. if wire has a loops and it was splitted Status was set to value ShapeExtend_DONE6.
	:param aResWires:
	:type aResWires: TopTools_SequenceOfShape &
	:rtype: bool") FixLoopWire;
		Standard_Boolean FixLoopWire (TopTools_SequenceOfShape & aResWires);


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
		%feature("compactdefaultargs") FixMissingSeam;
		%feature("autodoc", "* Detects and fixes the special case when face on a closed surface is given by two wires closed in 3d but with gap in 2d. In that case it creates a new wire from the two, and adds a missing seam edge Returns True if missing seam was added
	:rtype: bool") FixMissingSeam;
		Standard_Boolean FixMissingSeam ();


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
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "* Fixes orientation of wires on the face It tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. If face lying on sphere or torus has single wire and AddNaturalBoundMode is True, that wire is not reversed in any case (supposing that natural bound will be added). Returns True if wires were reversed
	:rtype: bool") FixOrientation;
		Standard_Boolean FixOrientation ();

		/****************** FixOrientation ******************/
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "* Fixes orientation of wires on the face It tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. If face lying on sphere or torus has single wire and AddNaturalBoundMode is True, that wire is not reversed in any case (supposing that natural bound will be added). Returns True if wires were reversed OutWires return information about out wires + list of internal wires for each (for performing split face).
	:param MapWires:
	:type MapWires: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool") FixOrientation;
		Standard_Boolean FixOrientation (TopTools_DataMapOfShapeListOfShape & MapWires);


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
		%feature("compactdefaultargs") FixPeriodicDegenerated;
		%feature("autodoc", "* Fixes topology for a specific case when face is composed by a single wire belting a periodic surface. In that case a degenerated edge is reconstructed in the degenerated pole of the surface. Initial wire gets consistent orientation. Must be used in couple and before FixMissingSeam routine
	:rtype: bool") FixPeriodicDegenerated;
		Standard_Boolean FixPeriodicDegenerated ();


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
		%feature("compactdefaultargs") FixSmallAreaWire;
		%feature("autodoc", "* Detects wires with small area (that is less than 100*Precision::PConfusion(). Removes these wires if they are internal. Returns : True if at least one small wire removed, False if does nothing.
	:param theIsRemoveSmallFace:
	:type theIsRemoveSmallFace: bool
	:rtype: bool") FixSmallAreaWire;
		Standard_Boolean FixSmallAreaWire (const Standard_Boolean theIsRemoveSmallFace);


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
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", "* Split face if there are more than one out wire using inrormation after FixOrientation()
	:param MapWires:
	:type MapWires: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool") FixSplitFace;
		Standard_Boolean FixSplitFace (const TopTools_DataMapOfShapeListOfShape & MapWires);


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
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "* Returns tool for fixing wires.
	:rtype: opencascade::handle<ShapeFix_Wire>") FixWireTool;
		opencascade::handle<ShapeFix_Wire> FixWireTool ();

		/****************** FixWiresTwoCoincEdges ******************/
		%feature("compactdefaultargs") FixWiresTwoCoincEdges;
		%feature("autodoc", "* If wire contains two coincidence edges it must be removed Queries on status after Perform()
	:rtype: bool") FixWiresTwoCoincEdges;
		Standard_Boolean FixWiresTwoCoincEdges ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Loads a whole face already created, with its wires, sense and location
	:param face:
	:type face: TopoDS_Face &
	:rtype: None") Init;
		void Init (const TopoDS_Face & face);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Starts the creation of the face By default it will be FORWARD, or REVERSED if <fwd> is False
	:param surf:
	:type surf: opencascade::handle<Geom_Surface> &
	:param preci:
	:type preci: float
	:param fwd: default value is Standard_True
	:type fwd: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom_Surface> & surf,const Standard_Real preci,const Standard_Boolean fwd = Standard_True);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Starts the creation of the face By default it will be FORWARD, or REVERSED if <fwd> is False
	:param surf:
	:type surf: opencascade::handle<ShapeAnalysis_Surface> &
	:param preci:
	:type preci: float
	:param fwd: default value is Standard_True
	:type fwd: bool
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeAnalysis_Surface> & surf,const Standard_Real preci,const Standard_Boolean fwd = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs all the fixes, depending on modes Function Status returns the status of last call to Perform() ShapeExtend_OK : face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire
	:rtype: bool") Perform;
		Standard_Boolean Perform ();


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
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Returns resulting shape (Face or Shell if splitted) To be used instead of Face() if FixMissingSeam involved
	:rtype: TopoDS_Shape") Result;
		TopoDS_Shape Result ();

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal allowed tolerance (also to FixWireTool)
	:param maxtol:
	:type maxtol: float
	:rtype: void") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "* Sets minimal allowed tolerance (also to FixWireTool)
	:param mintol:
	:type mintol: float
	:rtype: void") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "* Sets message registrator
	:param msgreg:
	:type msgreg: opencascade::handle<ShapeExtend_BasicMsgRegistrator> &
	:rtype: void") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets basic precision value (also to FixWireTool)
	:param preci:
	:type preci: float
	:rtype: void") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);

		/****************** ShapeFix_Face ******************/
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "* Creates an empty tool
	:rtype: None") ShapeFix_Face;
		 ShapeFix_Face ();

		/****************** ShapeFix_Face ******************/
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "* Creates a tool and loads a face
	:param face:
	:type face: TopoDS_Face &
	:rtype: None") ShapeFix_Face;
		 ShapeFix_Face (const TopoDS_Face & face);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of last call to Perform() ShapeExtend_OK : face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_DONE8: face may be splited ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
%nodefaultctor ShapeFix_FixSmallFace;
class ShapeFix_FixSmallFace : public ShapeFix_Root {
	public:
		/****************** ComputeSharedEdgeForStripFace ******************/
		%feature("compactdefaultargs") ComputeSharedEdgeForStripFace;
		%feature("autodoc", "* Compute average edge for strip face
	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param tol:
	:type tol: float
	:rtype: TopoDS_Edge") ComputeSharedEdgeForStripFace;
		TopoDS_Edge ComputeSharedEdgeForStripFace (const TopoDS_Face & F,const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Face & F1,const Standard_Real tol);

		/****************** FixFace ******************/
		%feature("compactdefaultargs") FixFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face &
	:rtype: TopoDS_Face") FixFace;
		TopoDS_Face FixFace (const TopoDS_Face & F);

		/****************** FixPinFace ******************/
		%feature("compactdefaultargs") FixPinFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face &
	:rtype: bool") FixPinFace;
		Standard_Boolean FixPinFace (TopoDS_Face & F);

		/****************** FixShape ******************/
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") FixShape;
		TopoDS_Shape FixShape ();

		/****************** FixSplitFace ******************/
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape") FixSplitFace;
		TopoDS_Shape FixSplitFace (const TopoDS_Shape & S);

		/****************** FixSpotFace ******************/
		%feature("compactdefaultargs") FixSpotFace;
		%feature("autodoc", "* Fixing case of spot face, if tol = -1 used local tolerance.
	:rtype: TopoDS_Shape") FixSpotFace;
		TopoDS_Shape FixSpotFace ();

		/****************** FixStripFace ******************/
		%feature("compactdefaultargs") FixStripFace;
		%feature("autodoc", "* Fixing case of strip face, if tol = -1 used local tolerance
	:param wasdone: default value is Standard_False
	:type wasdone: bool
	:rtype: TopoDS_Shape") FixStripFace;
		TopoDS_Shape FixStripFace (const Standard_Boolean wasdone = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape &
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Fixing case of spot face
	:rtype: None") Perform;
		void Perform ();

		/****************** RemoveFacesInCaseOfSpot ******************/
		%feature("compactdefaultargs") RemoveFacesInCaseOfSpot;
		%feature("autodoc", "* Remove spot face from compound
	:param F:
	:type F: TopoDS_Face &
	:rtype: bool") RemoveFacesInCaseOfSpot;
		Standard_Boolean RemoveFacesInCaseOfSpot (const TopoDS_Face & F);

		/****************** RemoveFacesInCaseOfStrip ******************/
		%feature("compactdefaultargs") RemoveFacesInCaseOfStrip;
		%feature("autodoc", "* Remove strip face from compound.
	:param F:
	:type F: TopoDS_Face &
	:rtype: bool") RemoveFacesInCaseOfStrip;
		Standard_Boolean RemoveFacesInCaseOfStrip (const TopoDS_Face & F);

		/****************** ReplaceInCaseOfStrip ******************/
		%feature("compactdefaultargs") ReplaceInCaseOfStrip;
		%feature("autodoc", "* Replace veretces and edges.
	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param tol:
	:type tol: float
	:rtype: bool") ReplaceInCaseOfStrip;
		Standard_Boolean ReplaceInCaseOfStrip (TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol);

		/****************** ReplaceVerticesInCaseOfSpot ******************/
		%feature("compactdefaultargs") ReplaceVerticesInCaseOfSpot;
		%feature("autodoc", "* Compute average vertex and replacing vertices by new one.
	:param F:
	:type F: TopoDS_Face &
	:param tol:
	:type tol: float
	:rtype: bool") ReplaceVerticesInCaseOfSpot;
		Standard_Boolean ReplaceVerticesInCaseOfSpot (TopoDS_Face & F,const Standard_Real tol);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeFix_FixSmallFace ******************/
		%feature("compactdefaultargs") ShapeFix_FixSmallFace;
		%feature("autodoc", ":rtype: None") ShapeFix_FixSmallFace;
		 ShapeFix_FixSmallFace ();

		/****************** SplitOneFace ******************/
		%feature("compactdefaultargs") SplitOneFace;
		%feature("autodoc", "* Compute data for face splitting.
	:param F:
	:type F: TopoDS_Face &
	:param theSplittedFaces:
	:type theSplittedFaces: TopoDS_Compound &
	:rtype: bool") SplitOneFace;
		Standard_Boolean SplitOneFace (TopoDS_Face & F,TopoDS_Compound & theSplittedFaces);

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
%nodefaultctor ShapeFix_FixSmallSolid;
class ShapeFix_FixSmallSolid : public ShapeFix_Root {
	public:
		/****************** Merge ******************/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "* Merge small solids in the given shape to adjacent non-small ones
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theContext:
	:type theContext: opencascade::handle<ShapeBuild_ReShape> &
	:rtype: TopoDS_Shape") Merge;
		TopoDS_Shape Merge (const TopoDS_Shape & theShape,const opencascade::handle<ShapeBuild_ReShape> & theContext);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Remove small solids from the given shape
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theContext:
	:type theContext: opencascade::handle<ShapeBuild_ReShape> &
	:rtype: TopoDS_Shape") Remove;
		TopoDS_Shape Remove (const TopoDS_Shape & theShape,const opencascade::handle<ShapeBuild_ReShape> & theContext);

		/****************** SetFixMode ******************/
		%feature("compactdefaultargs") SetFixMode;
		%feature("autodoc", "* Set working mode for operator: - theMode = 0 use both WidthFactorThreshold and VolumeThreshold parameters - theMode = 1 use only WidthFactorThreshold parameter - theMode = 2 use only VolumeThreshold parameter
	:param theMode:
	:type theMode: int
	:rtype: None") SetFixMode;
		void SetFixMode (const Standard_Integer theMode);

		/****************** SetVolumeThreshold ******************/
		%feature("compactdefaultargs") SetVolumeThreshold;
		%feature("autodoc", "* Set or clear volume threshold for small solids
	:param theThreshold: default value is -1.0
	:type theThreshold: float
	:rtype: None") SetVolumeThreshold;
		void SetVolumeThreshold (const Standard_Real theThreshold = -1.0);

		/****************** SetWidthFactorThreshold ******************/
		%feature("compactdefaultargs") SetWidthFactorThreshold;
		%feature("autodoc", "* Set or clear width factor threshold for small solids
	:param theThreshold: default value is -1.0
	:type theThreshold: float
	:rtype: None") SetWidthFactorThreshold;
		void SetWidthFactorThreshold (const Standard_Real theThreshold = -1.0);

		/****************** ShapeFix_FixSmallSolid ******************/
		%feature("compactdefaultargs") ShapeFix_FixSmallSolid;
		%feature("autodoc", "* Construct
	:rtype: None") ShapeFix_FixSmallSolid;
		 ShapeFix_FixSmallSolid ();

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
%nodefaultctor ShapeFix_Shape;
class ShapeFix_Shape : public ShapeFix_Root {
	public:
		/****************** FixEdgeTool ******************/
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "* Returns tool for fixing edges.
	:rtype: opencascade::handle<ShapeFix_Edge>") FixEdgeTool;
		opencascade::handle<ShapeFix_Edge> FixEdgeTool ();

		/****************** FixFaceTool ******************/
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "* Returns tool for fixing faces.
	:rtype: opencascade::handle<ShapeFix_Face>") FixFaceTool;
		opencascade::handle<ShapeFix_Face> FixFaceTool ();


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
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "* Returns tool for fixing shells.
	:rtype: opencascade::handle<ShapeFix_Shell>") FixShellTool;
		opencascade::handle<ShapeFix_Shell> FixShellTool ();


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
		%feature("compactdefaultargs") FixSolidTool;
		%feature("autodoc", "* Returns tool for fixing solids.
	:rtype: opencascade::handle<ShapeFix_Solid>") FixSolidTool;
		opencascade::handle<ShapeFix_Solid> FixSolidTool ();


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
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "* Returns tool for fixing wires.
	:rtype: opencascade::handle<ShapeFix_Wire>") FixWireTool;
		opencascade::handle<ShapeFix_Wire> FixWireTool ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initislises by shape.
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None") Init;
		void Init (const TopoDS_Shape & shape);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Iterates on sub- shape and performs fixes
	:param theProgress: default value is 0
	:type theProgress: opencascade::handle<Message_ProgressIndicator> &
	:rtype: bool") Perform;
		Standard_Boolean Perform (const opencascade::handle<Message_ProgressIndicator> & theProgress = 0);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal allowed tolerance (also to FixSolidTool)
	:param maxtol:
	:type maxtol: float
	:rtype: void") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "* Sets minimal allowed tolerance (also to FixSolidTool)
	:param mintol:
	:type mintol: float
	:rtype: void") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "* Sets message registrator
	:param msgreg:
	:type msgreg: opencascade::handle<ShapeExtend_BasicMsgRegistrator> &
	:rtype: void") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets basic precision value (also to FixSolidTool)
	:param preci:
	:type preci: float
	:rtype: void") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns resulting shape
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeFix_Shape ******************/
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "* Empty Constructor
	:rtype: None") ShapeFix_Shape;
		 ShapeFix_Shape ();

		/****************** ShapeFix_Shape ******************/
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "* Initislises by shape.
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None") ShapeFix_Shape;
		 ShapeFix_Shape (const TopoDS_Shape & shape);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of the last Fix. This can be a combination of the following flags: ShapeExtend_DONE1: some free edges were fixed ShapeExtend_DONE2: some free wires were fixed ShapeExtend_DONE3: some free faces were fixed ShapeExtend_DONE4: some free shells were fixed ShapeExtend_DONE5: some free solids were fixed ShapeExtend_DONE6: shapes in compound(s) were fixed
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
%nodefaultctor ShapeFix_Shell;
class ShapeFix_Shell : public ShapeFix_Root {
	public:
		/****************** ErrorFaces ******************/
		%feature("compactdefaultargs") ErrorFaces;
		%feature("autodoc", "* Returns not oriented subset of faces.
	:rtype: TopoDS_Compound") ErrorFaces;
		TopoDS_Compound ErrorFaces ();


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
		%feature("compactdefaultargs") FixFaceOrientation;
		%feature("autodoc", "* Fixes orientation of faces in shell. Changes orientation of face in the shell, if it is oriented opposite to neigbouring faces. If it is not possible to orient all faces in the shell (like in case of mebious band), this method orients only subset of faces. Other faces are stored in Error compound. Modes : isAccountMultiConex - mode for account cases of multiconnexity. If this mode is equal to Standard_True, separate shells will be created in the cases of multiconnexity. If this mode is equal to Standard_False, one shell will be created without account of multiconnexity.By defautt - Standard_True; NonManifold - mode for creation of non-manifold shells. If this mode is equal to Standard_True one non-manifold will be created from shell contains multishared edges. Else if this mode is equal to Standard_False only manifold shells will be created. By default - Standard_False.
	:param shell:
	:type shell: TopoDS_Shell &
	:param isAccountMultiConex: default value is Standard_True
	:type isAccountMultiConex: bool
	:param NonManifold: default value is Standard_False
	:type NonManifold: bool
	:rtype: bool") FixFaceOrientation;
		Standard_Boolean FixFaceOrientation (const TopoDS_Shell & shell,const Standard_Boolean isAccountMultiConex = Standard_True,const Standard_Boolean NonManifold = Standard_False);

		/****************** FixFaceTool ******************/
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "* Returns tool for fixing faces.
	:rtype: opencascade::handle<ShapeFix_Face>") FixFaceTool;
		opencascade::handle<ShapeFix_Face> FixFaceTool ();


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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes by shell.
	:param shell:
	:type shell: TopoDS_Shell &
	:rtype: None") Init;
		void Init (const TopoDS_Shell & shell);

		/****************** NbShells ******************/
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", "* Returns Number of obtainrd shells;
	:rtype: int") NbShells;
		Standard_Integer NbShells ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Iterates on subshapes and performs fixes (for each face calls ShapeFix_Face::Perform and then calls FixFaceOrientation). The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.
	:param theProgress: default value is 0
	:type theProgress: opencascade::handle<Message_ProgressIndicator> &
	:rtype: bool") Perform;
		Standard_Boolean Perform (const opencascade::handle<Message_ProgressIndicator> & theProgress = 0);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal allowed tolerance (also to FixWireTool)
	:param maxtol:
	:type maxtol: float
	:rtype: void") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "* Sets minimal allowed tolerance (also to FixWireTool)
	:param mintol:
	:type mintol: float
	:rtype: void") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "* Sets message registrator
	:param msgreg:
	:type msgreg: opencascade::handle<ShapeExtend_BasicMsgRegistrator> &
	:rtype: void") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetNonManifoldFlag ******************/
		%feature("compactdefaultargs") SetNonManifoldFlag;
		%feature("autodoc", "* Sets NonManifold flag
	:param isNonManifold:
	:type isNonManifold: bool
	:rtype: void") SetNonManifoldFlag;
		virtual void SetNonManifoldFlag (const Standard_Boolean isNonManifold);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets basic precision value (also to FixWireTool)
	:param preci:
	:type preci: float
	:rtype: void") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* In case of multiconnexity returns compound of fixed shells else returns one shell..
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeFix_Shell ******************/
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeFix_Shell;
		 ShapeFix_Shell ();

		/****************** ShapeFix_Shell ******************/
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "* Initializes by shell.
	:param shape:
	:type shape: TopoDS_Shell &
	:rtype: None") ShapeFix_Shell;
		 ShapeFix_Shell (const TopoDS_Shell & shape);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "* Returns fixed shell (or subset of oriented faces).
	:rtype: TopoDS_Shell") Shell;
		TopoDS_Shell Shell ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of the last Fix.
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
%nodefaultctor ShapeFix_Solid;
class ShapeFix_Solid : public ShapeFix_Root {
	public:

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
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "* Returns tool for fixing shells.
	:rtype: opencascade::handle<ShapeFix_Shell>") FixShellTool;
		opencascade::handle<ShapeFix_Shell> FixShellTool ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes by solid .
	:param solid:
	:type solid: TopoDS_Solid &
	:rtype: void") Init;
		virtual void Init (const TopoDS_Solid & solid);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Iterates on shells and performs fixes (calls ShapeFix_Shell for each subshell). The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.
	:param theProgress: default value is 0
	:type theProgress: opencascade::handle<Message_ProgressIndicator> &
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform (const opencascade::handle<Message_ProgressIndicator> & theProgress = 0);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal allowed tolerance (also to FixShellTool)
	:param maxtol:
	:type maxtol: float
	:rtype: void") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "* Sets minimal allowed tolerance (also to FixShellTool)
	:param mintol:
	:type mintol: float
	:rtype: void") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "* Sets message registrator
	:param msgreg:
	:type msgreg: opencascade::handle<ShapeExtend_BasicMsgRegistrator> &
	:rtype: void") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets basic precision value (also to FixShellTool)
	:param preci:
	:type preci: float
	:rtype: void") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* In case of multiconnexity returns compound of fixed solids else returns one solid.
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeFix_Solid ******************/
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "* Empty constructor;
	:rtype: None") ShapeFix_Solid;
		 ShapeFix_Solid ();

		/****************** ShapeFix_Solid ******************/
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "* Initializes by solid.
	:param solid:
	:type solid: TopoDS_Solid &
	:rtype: None") ShapeFix_Solid;
		 ShapeFix_Solid (const TopoDS_Solid & solid);

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "* Returns resulting solid.
	:rtype: TopoDS_Shape") Solid;
		TopoDS_Shape Solid ();

		/****************** SolidFromShell ******************/
		%feature("compactdefaultargs") SolidFromShell;
		%feature("autodoc", "* Calls MakeSolid and orients the solid to be 'not infinite'
	:param shell:
	:type shell: TopoDS_Shell &
	:rtype: TopoDS_Solid") SolidFromShell;
		TopoDS_Solid SolidFromShell (const TopoDS_Shell & shell);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of the last Fix.
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
%nodefaultctor ShapeFix_SplitCommonVertex;
class ShapeFix_SplitCommonVertex : public ShapeFix_Root {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape &
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeFix_SplitCommonVertex ******************/
		%feature("compactdefaultargs") ShapeFix_SplitCommonVertex;
		%feature("autodoc", ":rtype: None") ShapeFix_SplitCommonVertex;
		 ShapeFix_SplitCommonVertex ();

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
%nodefaultctor ShapeFix_Wire;
class ShapeFix_Wire : public ShapeFix_Root {
	public:
		/****************** Analyzer ******************/
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "* returns field Analyzer (working tool)
	:rtype: opencascade::handle<ShapeAnalysis_Wire>") Analyzer;
		opencascade::handle<ShapeAnalysis_Wire> Analyzer ();

		/****************** ClearModes ******************/
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "* Sets all modes to default
	:rtype: None") ClearModes;
		void ClearModes ();

		/****************** ClearStatuses ******************/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "* Clears all statuses
	:rtype: None") ClearStatuses;
		void ClearStatuses ();


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
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* returns working face (Analyzer.Face())
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();


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
		%feature("compactdefaultargs") FixClosed;
		%feature("autodoc", "* Fixes a wire to be well closed It performs FixConnected, FixDegenerated and FixLacking between last and first edges (independingly on flag ClosedMode and modes for these fixings) If <prec> is -1 then MaxTolerance() is taken.
	:param prec: default value is -1.0
	:type prec: float
	:rtype: bool") FixClosed;
		Standard_Boolean FixClosed (const Standard_Real prec = -1.0);

		/****************** FixConnected ******************/
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "* Applies FixConnected(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True If <prec> is -1 then MaxTolerance() is taken.
	:param prec: default value is -1.0
	:type prec: float
	:rtype: bool") FixConnected;
		Standard_Boolean FixConnected (const Standard_Real prec = -1.0);

		/****************** FixConnected ******************/
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "* Fixes connected edges (preceeding and current) Forces Vertices (end of preceeding-begin of current) to be the same one Tests with starting preci or, if given greater, <prec> If <prec> is -1 then MaxTolerance() is taken.
	:param num:
	:type num: int
	:param prec:
	:type prec: float
	:rtype: bool") FixConnected;
		Standard_Boolean FixConnected (const Standard_Integer num,const Standard_Real prec);


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
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "* Applies FixDegenerated(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True
	:rtype: bool") FixDegenerated;
		Standard_Boolean FixDegenerated ();

		/****************** FixDegenerated ******************/
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "* Fixes Degenerated Edge Checks an <num-th> edge or a point between <num>th-1 and <num>th edges for a singularity on a supporting surface. If singularity is detected, either adds new degenerated edge (before <num>th), or makes <num>th edge to be degenerated.
	:param num:
	:type num: int
	:rtype: bool") FixDegenerated;
		Standard_Boolean FixDegenerated (const Standard_Integer num);


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
		%feature("compactdefaultargs") FixEdgeCurves;
		%feature("autodoc", "* Groups the fixes dealing with 3d and pcurves of the edges. The order of the fixes and the default behaviour are: ShapeFix_Edge::FixReversed2d ShapeFix_Edge::FixRemovePCurve (only if forced) ShapeFix_Edge::FixAddPCurve ShapeFix_Edge::FixRemoveCurve3d (only if forced) ShapeFix_Edge::FixAddCurve3d FixSeam, FixShifted, ShapeFix_Edge::FixSameParameter
	:rtype: bool") FixEdgeCurves;
		Standard_Boolean FixEdgeCurves ();


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
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "* Returns tool for fixing wires.
	:rtype: opencascade::handle<ShapeFix_Edge>") FixEdgeTool;
		opencascade::handle<ShapeFix_Edge> FixEdgeTool ();

		/****************** FixGap2d ******************/
		%feature("compactdefaultargs") FixGap2d;
		%feature("autodoc", "* Fixes gap between ends of pcurves on num-1 and num-th edges. myPrecision is used to detect the gap. If convert is True, converts pcurves to bsplines to bend.
	:param num:
	:type num: int
	:param convert: default value is Standard_False
	:type convert: bool
	:rtype: bool") FixGap2d;
		Standard_Boolean FixGap2d (const Standard_Integer num,const Standard_Boolean convert = Standard_False);

		/****************** FixGap3d ******************/
		%feature("compactdefaultargs") FixGap3d;
		%feature("autodoc", "* Fixes gap between ends of 3d curves on num-1 and num-th edges. myPrecision is used to detect the gap. If convert is True, converts curves to bsplines to bend.
	:param num:
	:type num: int
	:param convert: default value is Standard_False
	:type convert: bool
	:rtype: bool") FixGap3d;
		Standard_Boolean FixGap3d (const Standard_Integer num,const Standard_Boolean convert = Standard_False);

		/****************** FixGaps2d ******************/
		%feature("compactdefaultargs") FixGaps2d;
		%feature("autodoc", "* Fixes gaps between ends of pcurves on adjacent edges myPrecision is used to detect the gaps.
	:rtype: bool") FixGaps2d;
		Standard_Boolean FixGaps2d ();


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
		%feature("compactdefaultargs") FixGaps3d;
		%feature("autodoc", "* Fixes gaps between ends of 3d curves on adjacent edges myPrecision is used to detect the gaps.
	:rtype: bool") FixGaps3d;
		Standard_Boolean FixGaps3d ();


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
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "* Applies FixLacking(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True If <force> is False (default), test for connectness is done with precision of vertex between edges, else it is done with minimal value of vertex tolerance and Analyzer.Precision(). Hence, <force> will lead to inserting lacking edges in replacement of vertices which have big tolerances.
	:param force: default value is Standard_False
	:type force: bool
	:rtype: bool") FixLacking;
		Standard_Boolean FixLacking (const Standard_Boolean force = Standard_False);

		/****************** FixLacking ******************/
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "* Fixes Lacking Edge Test if two adjucent edges are disconnected in 2d (while connected in 3d), and in that case either increase tolerance of the vertex or add a new edge (straight in 2d space), in order to close wire in 2d. Returns True if edge was added or tolerance was increased.
	:param num:
	:type num: int
	:param force: default value is Standard_False
	:type force: bool
	:rtype: bool") FixLacking;
		Standard_Boolean FixLacking (const Standard_Integer num,const Standard_Boolean force = Standard_False);


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
		%feature("compactdefaultargs") FixNotchedEdges;
		%feature("autodoc", ":rtype: bool") FixNotchedEdges;
		Standard_Boolean FixNotchedEdges ();


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
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "* Performs an analysis and reorders edges in the wire using class WireOrder
	:rtype: bool") FixReorder;
		Standard_Boolean FixReorder ();

		/****************** FixReorder ******************/
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "* Reorder edges in the wire as determined by WireOrder that should be filled and computed before
	:param wi:
	:type wi: ShapeAnalysis_WireOrder &
	:rtype: bool") FixReorder;
		Standard_Boolean FixReorder (const ShapeAnalysis_WireOrder & wi);


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
		%feature("compactdefaultargs") FixSeam;
		%feature("autodoc", "* Fixes a seam edge A Seam edge has two pcurves, one for forward. one for reversed The forward pcurve must be set as first //! NOTE that correct order of pcurves in the seam edge depends on its orientation (i.e., on orientation of the wire, method of exploration of edges etc.). Since wire represented by the ShapeExtend_WireData is always forward (orientation is accounted by edges), it will work correct if: 1. Wire created from ShapeExtend_WireData with methods ShapeExtend_WireData::Wire..() is added into the FORWARD face (orientation can be applied later) 2. Wire is extracted from the face with orientation not composed with orientation of the face
	:param num:
	:type num: int
	:rtype: bool") FixSeam;
		Standard_Boolean FixSeam (const Standard_Integer num);


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
		%feature("compactdefaultargs") FixSelfIntersection;
		%feature("autodoc", "* Applies FixSelfIntersectingEdge(num) and FixIntersectingEdges(num) to all edges in the wire and FixIntersectingEdges(num1, num2) for all pairs num1 and num2 such that num2 >= num1 + 2 and removes wrong edges if any
	:rtype: bool") FixSelfIntersection;
		Standard_Boolean FixSelfIntersection ();


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
		%feature("compactdefaultargs") FixShifted;
		%feature("autodoc", "* Fixes edges which have pcurves shifted by whole parameter range on the closed surface (the case may occur if pcurve of edge was computed by projecting 3d curve, which goes along the seam). It compares each two consequent edges and tries to connect them if distance between ends is near to range of the surface. It also can detect and fix the case if all pcurves are connected, but lie out of parametric bounds of the surface. In addition to FixShifted from ShapeFix_Wire, more sophisticated check of degenerate points is performed, and special cases like sphere given by two meridians are treated.
	:rtype: bool") FixShifted;
		Standard_Boolean FixShifted ();


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
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "* Applies FixSmall(num) to all edges in the wire
	:param lockvtx:
	:type lockvtx: bool
	:param precsmall: default value is 0.0
	:type precsmall: float
	:rtype: int") FixSmall;
		Standard_Integer FixSmall (const Standard_Boolean lockvtx,const Standard_Real precsmall = 0.0);

		/****************** FixSmall ******************/
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "* Fixes Null Length Edge to be removed If an Edge has Null Length (regarding preci, or <precsmall> - what is smaller), it should be removed It can be with no problem if its two vertices are the same Else, if lockvtx is False, it is removed and its end vertex is put on the preceeding edge But if lockvtx is True, this edge must be kept ...
	:param num:
	:type num: int
	:param lockvtx:
	:type lockvtx: bool
	:param precsmall:
	:type precsmall: float
	:rtype: bool") FixSmall;
		Standard_Boolean FixSmall (const Standard_Integer num,const Standard_Boolean lockvtx,const Standard_Real precsmall);


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
		%feature("compactdefaultargs") FixTails;
		%feature("autodoc", ":rtype: bool") FixTails;
		Standard_Boolean FixTails ();


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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Load analyzer with all the data for the wire and face and drops all fixing statuses
	:param wire:
	:type wire: TopoDS_Wire &
	:param face:
	:type face: TopoDS_Face &
	:param prec:
	:type prec: float
	:rtype: None") Init;
		void Init (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real prec);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Load analyzer with all the data already prepared and drops all fixing statuses If analyzer contains face, there is no need to set it by SetFace or SetSurface
	:param saw:
	:type saw: opencascade::handle<ShapeAnalysis_Wire> &
	:rtype: None") Init;
		void Init (const opencascade::handle<ShapeAnalysis_Wire> & saw);

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "* Tells if the wire is loaded
	:rtype: bool") IsLoaded;
		Standard_Boolean IsLoaded ();

		/****************** IsReady ******************/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "* Tells if the wire and face are loaded
	:rtype: bool") IsReady;
		Standard_Boolean IsReady ();

		/****************** LastFixStatus ******************/
		%feature("compactdefaultargs") LastFixStatus;
		%feature("autodoc", "* Queries the status of last call to methods Fix... of advanced level For details see corresponding methods; universal statuses are: OK : problem not detected; nothing done DONE: problem was detected and successfully fixed FAIL: problem cannot be fixed
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") LastFixStatus;
		Standard_Boolean LastFixStatus (const ShapeExtend_Status status);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Load data for the wire, and drops all fixing statuses
	:param wire:
	:type wire: TopoDS_Wire &
	:rtype: None") Load;
		void Load (const TopoDS_Wire & wire);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Load data for the wire, and drops all fixing statuses
	:param sbwd:
	:type sbwd: opencascade::handle<ShapeExtend_WireData> &
	:rtype: None") Load;
		void Load (const opencascade::handle<ShapeExtend_WireData> & sbwd);


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
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* returns number of edges in the working wire
	:rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* This method performs all the available fixes. If some fix is turned on or off explicitly by the Fix..Mode() flag, this fix is either called or not depending on that flag. Else (i.e. if flag is default) fix is called depending on the situation: some fixes are not called or are limited if order of edges in the wire is not OK, or depending on modes //! The order of the fixes and default behaviour of Perform() are: FixReorder FixSmall (with lockvtx true if ! TopoMode or if wire is not ordered) FixConnected (if wire is ordered) FixEdgeCurves (without FixShifted if wire is not ordered) FixDegenerated (if wire is ordered) FixSelfIntersection (if wire is ordered and ClosedMode is True) FixLacking (if wire is ordered)
	:rtype: bool") Perform;
		Standard_Boolean Perform ();


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
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "* Set working face for the wire
	:param face:
	:type face: TopoDS_Face &
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & face);

		/****************** SetMaxTailAngle ******************/
		%feature("compactdefaultargs") SetMaxTailAngle;
		%feature("autodoc", "* Sets the maximal allowed angle of the tails in radians.
	:param theMaxTailAngle:
	:type theMaxTailAngle: float
	:rtype: None") SetMaxTailAngle;
		void SetMaxTailAngle (const Standard_Real theMaxTailAngle);

		/****************** SetMaxTailWidth ******************/
		%feature("compactdefaultargs") SetMaxTailWidth;
		%feature("autodoc", "* Sets the maximal allowed width of the tails.
	:param theMaxTailWidth:
	:type theMaxTailWidth: float
	:rtype: None") SetMaxTailWidth;
		void SetMaxTailWidth (const Standard_Real theMaxTailWidth);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Set working precision (to root and to analyzer)
	:param prec:
	:type prec: float
	:rtype: void") SetPrecision;
		virtual void SetPrecision (const Standard_Real prec);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Set surface for the wire
	:param surf:
	:type surf: opencascade::handle<Geom_Surface> &
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & surf);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Set surface for the wire
	:param surf:
	:type surf: opencascade::handle<Geom_Surface> &
	:param loc:
	:type loc: TopLoc_Location &
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & surf,const TopLoc_Location & loc);

		/****************** ShapeFix_Wire ******************/
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "* Empty Constructor, creates clear object with default flags
	:rtype: None") ShapeFix_Wire;
		 ShapeFix_Wire ();

		/****************** ShapeFix_Wire ******************/
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "* Create new object with default flags and prepare it for use (Loads analyzer with all the data for the wire and face)
	:param wire:
	:type wire: TopoDS_Wire &
	:param face:
	:type face: TopoDS_Face &
	:param prec:
	:type prec: float
	:rtype: None") ShapeFix_Wire;
		 ShapeFix_Wire (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real prec);

		/****************** StatusClosed ******************/
		%feature("compactdefaultargs") StatusClosed;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusClosed;
		Standard_Boolean StatusClosed (const ShapeExtend_Status status);

		/****************** StatusConnected ******************/
		%feature("compactdefaultargs") StatusConnected;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusConnected;
		Standard_Boolean StatusConnected (const ShapeExtend_Status status);

		/****************** StatusDegenerated ******************/
		%feature("compactdefaultargs") StatusDegenerated;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusDegenerated;
		Standard_Boolean StatusDegenerated (const ShapeExtend_Status status);

		/****************** StatusEdgeCurves ******************/
		%feature("compactdefaultargs") StatusEdgeCurves;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves (const ShapeExtend_Status status);

		/****************** StatusFixTails ******************/
		%feature("compactdefaultargs") StatusFixTails;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusFixTails;
		Standard_Boolean StatusFixTails (const ShapeExtend_Status status);

		/****************** StatusGaps2d ******************/
		%feature("compactdefaultargs") StatusGaps2d;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusGaps2d;
		Standard_Boolean StatusGaps2d (const ShapeExtend_Status status);

		/****************** StatusGaps3d ******************/
		%feature("compactdefaultargs") StatusGaps3d;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusGaps3d;
		Standard_Boolean StatusGaps3d (const ShapeExtend_Status status);

		/****************** StatusLacking ******************/
		%feature("compactdefaultargs") StatusLacking;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusLacking;
		Standard_Boolean StatusLacking (const ShapeExtend_Status status);

		/****************** StatusNotches ******************/
		%feature("compactdefaultargs") StatusNotches;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusNotches;
		Standard_Boolean StatusNotches (const ShapeExtend_Status status);

		/****************** StatusRemovedSegment ******************/
		%feature("compactdefaultargs") StatusRemovedSegment;
		%feature("autodoc", "* Querying the status of perfomed API fixing procedures Each Status..() methods gives information about the last call to the corresponding Fix..() method of API level: OK : no problems detected; nothing done DONE: some problem(s) was(were) detected and successfully fixed FAIL: some problem(s) cannot be fixed
	:rtype: bool") StatusRemovedSegment;
		Standard_Boolean StatusRemovedSegment ();

		/****************** StatusReorder ******************/
		%feature("compactdefaultargs") StatusReorder;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusReorder;
		Standard_Boolean StatusReorder (const ShapeExtend_Status status);

		/****************** StatusSelfIntersection ******************/
		%feature("compactdefaultargs") StatusSelfIntersection;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection (const ShapeExtend_Status status);

		/****************** StatusSmall ******************/
		%feature("compactdefaultargs") StatusSmall;
		%feature("autodoc", ":param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusSmall;
		Standard_Boolean StatusSmall (const ShapeExtend_Status status);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "* Makes the resulting Wire (by basic Brep_Builder)
	:rtype: TopoDS_Wire") Wire;
		TopoDS_Wire Wire ();

		/****************** WireAPIMake ******************/
		%feature("compactdefaultargs") WireAPIMake;
		%feature("autodoc", "* Makes the resulting Wire (by BRepAPI_MakeWire)
	:rtype: TopoDS_Wire") WireAPIMake;
		TopoDS_Wire WireAPIMake ();

		/****************** WireData ******************/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "* returns working wire
	:rtype: opencascade::handle<ShapeExtend_WireData>") WireData;
		const opencascade::handle<ShapeExtend_WireData> & WireData ();

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
%nodefaultctor ShapeFix_Wireframe;
class ShapeFix_Wireframe : public ShapeFix_Root {
	public:
		/****************** CheckSmallEdges ******************/
		%feature("compactdefaultargs") CheckSmallEdges;
		%feature("autodoc", "* Auxiliary tool for FixSmallEdges which checks for small edges and fills the maps. Returns True if at least one small edge has been found.
	:param theSmallEdges:
	:type theSmallEdges: TopTools_MapOfShape &
	:param theEdgeToFaces:
	:type theEdgeToFaces: TopTools_DataMapOfShapeListOfShape &
	:param theFaceWithSmall:
	:type theFaceWithSmall: TopTools_DataMapOfShapeListOfShape &
	:param theMultyEdges:
	:type theMultyEdges: TopTools_MapOfShape &
	:rtype: bool") CheckSmallEdges;
		Standard_Boolean CheckSmallEdges (TopTools_MapOfShape & theSmallEdges,TopTools_DataMapOfShapeListOfShape & theEdgeToFaces,TopTools_DataMapOfShapeListOfShape & theFaceWithSmall,TopTools_MapOfShape & theMultyEdges);

		/****************** ClearStatuses ******************/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "* Clears all statuses
	:rtype: void") ClearStatuses;
		virtual void ClearStatuses ();

		/****************** FixSmallEdges ******************/
		%feature("compactdefaultargs") FixSmallEdges;
		%feature("autodoc", "* Fixes small edges in shape by merging adjacent edges If precision is 0.0, uses Precision::Confusion().
	:rtype: bool") FixSmallEdges;
		Standard_Boolean FixSmallEdges ();

		/****************** FixWireGaps ******************/
		%feature("compactdefaultargs") FixWireGaps;
		%feature("autodoc", "* Fixes gaps between ends of curves of adjacent edges (both 3d and pcurves) in wires If precision is 0.0, uses Precision::Confusion().
	:rtype: bool") FixWireGaps;
		Standard_Boolean FixWireGaps ();

		/****************** LimitAngle ******************/
		%feature("compactdefaultargs") LimitAngle;
		%feature("autodoc", "* Get limit angle for merging edges.
	:rtype: float") LimitAngle;
		Standard_Real LimitAngle ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads a shape, resets statuses
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None") Load;
		void Load (const TopoDS_Shape & shape);

		/****************** MergeSmallEdges ******************/
		%feature("compactdefaultargs") MergeSmallEdges;
		%feature("autodoc", "* Auxiliary tool for FixSmallEdges which merges small edges. If theModeDrop is equal to Standard_True then small edges, which cannot be connected with adjacent edges are dropped. Otherwise they are kept. theLimitAngle specifies maximum allowed tangency discontinuity between adjacent edges. If theLimitAngle is equal to -1, this angle is not taken into account.
	:param theSmallEdges:
	:type theSmallEdges: TopTools_MapOfShape &
	:param theEdgeToFaces:
	:type theEdgeToFaces: TopTools_DataMapOfShapeListOfShape &
	:param theFaceWithSmall:
	:type theFaceWithSmall: TopTools_DataMapOfShapeListOfShape &
	:param theMultyEdges:
	:type theMultyEdges: TopTools_MapOfShape &
	:param theModeDrop: default value is Standard_False
	:type theModeDrop: bool
	:param theLimitAngle: default value is -1
	:type theLimitAngle: float
	:rtype: bool") MergeSmallEdges;
		Standard_Boolean MergeSmallEdges (TopTools_MapOfShape & theSmallEdges,TopTools_DataMapOfShapeListOfShape & theEdgeToFaces,TopTools_DataMapOfShapeListOfShape & theFaceWithSmall,TopTools_MapOfShape & theMultyEdges,const Standard_Boolean theModeDrop = Standard_False,const Standard_Real theLimitAngle = -1);


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
		%feature("compactdefaultargs") SetLimitAngle;
		%feature("autodoc", "* Set limit angle for merging edges.
	:param theLimitAngle:
	:type theLimitAngle: float
	:rtype: None") SetLimitAngle;
		void SetLimitAngle (const Standard_Real theLimitAngle);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeFix_Wireframe ******************/
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", ":rtype: None") ShapeFix_Wireframe;
		 ShapeFix_Wireframe ();

		/****************** ShapeFix_Wireframe ******************/
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", ":param shape:
	:type shape: TopoDS_Shape &
	:rtype: None") ShapeFix_Wireframe;
		 ShapeFix_Wireframe (const TopoDS_Shape & shape);

		/****************** StatusSmallEdges ******************/
		%feature("compactdefaultargs") StatusSmallEdges;
		%feature("autodoc", "* Decodes the status of the last FixSmallEdges. OK - No small edges were found DONE1 - Some small edges were fixed FAIL1 - Failed to fix some small edges
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusSmallEdges;
		Standard_Boolean StatusSmallEdges (const ShapeExtend_Status status);

		/****************** StatusWireGaps ******************/
		%feature("compactdefaultargs") StatusWireGaps;
		%feature("autodoc", "* Decodes the status of the last FixWireGaps. OK - No gaps were found DONE1 - Some gaps in 3D were fixed DONE2 - Some gaps in 2D were fixed FAIL1 - Failed to fix some gaps in 3D FAIL2 - Failed to fix some gaps in 2D
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") StatusWireGaps;
		Standard_Boolean StatusWireGaps (const ShapeExtend_Status status);

};


%make_alias(ShapeFix_Wireframe)

%extend ShapeFix_Wireframe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 class */
/* harray2 class */
/* harray2 class */
