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
%define SHAPEFIXDOCSTRING
"ShapeFix module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_shapefix.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<TopTools_module.hxx>
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
%ignore NCollection_DataMap<TopoDS_Shape,Bnd_Box2d,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,Bnd_Box2d,TopTools_ShapeMapHasher>::KeyValues;
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
		/****** ShapeFix::EncodeRegularity ******/
		/****** md5 signature: 4c142a557ac74671287c94780fcc45b7 ******/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tolang: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Runs EncodeRegularity from BRepLib taking into account shared components of assemblies, so that each component is processed only once.
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & shape, const double tolang = 1.0e-10);

		/****** ShapeFix::FixVertexPosition ******/
		/****** md5 signature: dfba54cc045dc813fc2ab591a7ad8001 ******/
		%feature("compactdefaultargs") FixVertexPosition;
		%feature("autodoc", "
Parameters
----------
theshape: TopoDS_Shape
theTolerance: double
thecontext: ShapeBuild_ReShape

Return
-------
bool

Description
-----------
Fix position of the vertices having tolerance more tnan specified one.;.
") FixVertexPosition;
		static bool FixVertexPosition(TopoDS_Shape & theshape, const double theTolerance, const opencascade::handle<ShapeBuild_ReShape> & thecontext);

		/****** ShapeFix::LeastEdgeSize ******/
		/****** md5 signature: 1bfdc00ab1ecfb017198bd3e1fcb4256 ******/
		%feature("compactdefaultargs") LeastEdgeSize;
		%feature("autodoc", "
Parameters
----------
theshape: TopoDS_Shape

Return
-------
double

Description
-----------
Calculate size of least edge;.
") LeastEdgeSize;
		static double LeastEdgeSize(TopoDS_Shape & theshape);

		/****** ShapeFix::RemoveSmallEdges ******/
		/****** md5 signature: 7931e22caca4cd7e06545d7160734d90 ******/
		%feature("compactdefaultargs") RemoveSmallEdges;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
Tolerance: double
context: ShapeBuild_ReShape

Return
-------
TopoDS_Shape

Description
-----------
Removes edges which are less than given tolerance from shape with help of ShapeFix_Wire::FixSmall().
") RemoveSmallEdges;
		static TopoDS_Shape RemoveSmallEdges(TopoDS_Shape & shape, const double Tolerance, opencascade::handle<ShapeBuild_ReShape> & context);

		/****** ShapeFix::SameParameter ******/
		/****** md5 signature: cc78110bdd800e9e6021b85252721380 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
enforce: bool
preci: double (optional, default to 0.0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())
theMsgReg: ShapeExtend_BasicMsgRegistrator (optional, default to nullptr)

Return
-------
bool

Description
-----------
Runs SameParameter from BRepLib with these adaptations: <enforce> forces computations, else they are made only on Edges with flag SameParameter false <preci>, if not precised, is taken for each EDge as its own Tolerance Returns True when done, False if an exception has been raised In case of exception anyway, as many edges as possible have been processed. The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.
") SameParameter;
		static bool SameParameter(const TopoDS_Shape & shape, const bool enforce, const double preci = 0.0, const Message_ProgressRange & theProgress = Message_ProgressRange(), const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & theMsgReg = nullptr);

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
		/****** ShapeFix_Edge::ShapeFix_Edge ******/
		/****** md5 signature: f63f1796cd112c36ec80b3d48f00b8b2 ******/
		%feature("compactdefaultargs") ShapeFix_Edge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeFix_Edge;
		 ShapeFix_Edge();

		/****** ShapeFix_Edge::FixAddCurve3d ******/
		/****** md5 signature: f54937dc42d40ee14187b79f2b8187fa ******/
		%feature("compactdefaultargs") FixAddCurve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
bool

Description
-----------
Tries to build 3d curve of the edge if missing Use: It is to be called after FixRemoveCurve3d (if removed) or in any case when edge can have no 3d curve Returns: True if 3d curve was added, else False Status: OK: 3d curve exists FAIL1: BRepLib::BuildCurve3d() has failed DONE1: 3d curve was added.
") FixAddCurve3d;
		bool FixAddCurve3d(const TopoDS_Edge & edge);

		/****** ShapeFix_Edge::FixAddPCurve ******/
		/****** md5 signature: e5ecaa0888fc1d990fe80d6859b69b9e ******/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
isSeam: bool
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
See method below for information.
") FixAddPCurve;
		bool FixAddPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, const bool isSeam, const double prec = 0.0);

		/****** ShapeFix_Edge::FixAddPCurve ******/
		/****** md5 signature: a95cc37157f3161dff1c003664b6404a ******/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
isSeam: bool
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
See method below for information.
") FixAddPCurve;
		bool FixAddPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const bool isSeam, const double prec = 0.0);

		/****** ShapeFix_Edge::FixAddPCurve ******/
		/****** md5 signature: d5472e3c445e9edd7a2f4727a0480083 ******/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
isSeam: bool
surfana: ShapeAnalysis_Surface
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
See method below for information.
") FixAddPCurve;
		bool FixAddPCurve(const TopoDS_Edge & edge, const TopoDS_Face & face, const bool isSeam, const opencascade::handle<ShapeAnalysis_Surface> & surfana, const double prec = 0.0);

		/****** ShapeFix_Edge::FixAddPCurve ******/
		/****** md5 signature: f2c0fa6b06069faccb902a3cc5b8f5f4 ******/
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surface: Geom_Surface
location: TopLoc_Location
isSeam: bool
surfana: ShapeAnalysis_Surface
prec: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Adds pcurve(s) of the edge if missing (by projecting 3d curve) Parameter isSeam indicates if the edge is a seam. The parameter <prec> defines the precision for calculations. If it is 0 (default), the tolerance of the edge is taken. Remark: This method is rather for internal use since it accepts parameter <surfana> for optimization of computations Use: It is to be called after FixRemovePCurve (if removed) or in any case when edge can have no pcurve Returns: True if pcurve was added, else False Status: OK: Pcurve exists FAIL1: No 3d curve FAIL2: fail during projecting DONE1: Pcurve was added DONE2: specific case of pcurve going through degenerated point on sphere encountered during projection (see class ShapeConstruct_ProjectCurveOnSurface for more info).
") FixAddPCurve;
		bool FixAddPCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location, const bool isSeam, const opencascade::handle<ShapeAnalysis_Surface> & surfana, const double prec = 0.0);

		/****** ShapeFix_Edge::FixRemoveCurve3d ******/
		/****** md5 signature: 109c54781700fe06f6a0f79ef040ad56 ******/
		%feature("compactdefaultargs") FixRemoveCurve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
bool

Description
-----------
Removes 3d curve of the edge if it does not match the vertices Returns: True, if does not match, removed (status DONE) False, (status OK) if matches or (status FAIL) if no 3d curve, nothing done.
") FixRemoveCurve3d;
		bool FixRemoveCurve3d(const TopoDS_Edge & edge);

		/****** ShapeFix_Edge::FixRemovePCurve ******/
		/****** md5 signature: 3d8b82987dd97a94eaaeb26ed2cf16f7 ******/
		%feature("compactdefaultargs") FixRemovePCurve;
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
") FixRemovePCurve;
		bool FixRemovePCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeFix_Edge::FixRemovePCurve ******/
		/****** md5 signature: df92e950b4997005ed606df237e62330 ******/
		%feature("compactdefaultargs") FixRemovePCurve;
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
Removes the pcurve(s) of the edge if it does not match the vertices Check is done Use: It is to be called when pcurve of an edge can be wrong (e.g., after import from IGES) Returns: True, if does not match, removed (status DONE) False, (status OK) if matches or (status FAIL) if no pcurve, nothing done.
") FixRemovePCurve;
		bool FixRemovePCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeFix_Edge::FixReversed2d ******/
		/****** md5 signature: 13a2cc6d7192f341f57f1616f6becef5 ******/
		%feature("compactdefaultargs") FixReversed2d;
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
") FixReversed2d;
		bool FixReversed2d(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeFix_Edge::FixReversed2d ******/
		/****** md5 signature: 35e78f6ab2f004320b2d100f660449d8 ******/
		%feature("compactdefaultargs") FixReversed2d;
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
Fixes edge if pcurve is directed opposite to 3d curve Check is done by call to the function ShapeAnalysis_Edge::CheckCurve3dWithPCurve() Warning: For seam edge this method will check and fix the pcurve in only one direction. Hence, it should be called twice for seam edge: once with edge orientation FORWARD and once with REVERSED. Returns: False if nothing done, True if reversed (status DONE) Status: OK - pcurve OK, nothing done FAIL1 - no pcurve FAIL2 - no 3d curve DONE1 - pcurve was reversed.
") FixReversed2d;
		bool FixReversed2d(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surface, const TopLoc_Location & location);

		/****** ShapeFix_Edge::FixSameParameter ******/
		/****** md5 signature: 9859ef0595b6d60b520a897b21f79c93 ******/
		%feature("compactdefaultargs") FixSameParameter;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
tolerance: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Tries to make edge SameParameter and sets corresponding tolerance and SameParameter flag. First, it makes edge same range if SameRange flag is not set. //! If flag SameParameter is set, this method calls the function ShapeAnalysis_Edge::CheckSameParameter() that calculates the maximal deviation of pcurves of the edge from its 3d curve. If deviation > tolerance, the tolerance of edge is increased to a value of deviation. If deviation < tolerance nothing happens. //! If flag SameParameter is not set, this method chooses the best variant (one that has minimal tolerance), either a. only after computing deviation (as above) or b. after calling standard procedure BRepLib::SameParameter and computing deviation (as above). If <tolerance> > 0, it is used as parameter for BRepLib::SameParameter, otherwise, tolerance of the edge is used. //! Use: Is to be called after all pcurves and 3d curve of the edge are correctly computed Remark: SameParameter flag is always set to True after this method Returns: True, if something done, else False Status: OK - edge was initially SameParameter, nothing is done FAIL1 - computation of deviation of pcurves from 3d curve has failed FAIL2 - BRepLib::SameParameter() has failed DONE1 - tolerance of the edge was increased DONE2 - flag SameParameter was set to True (only if BRepLib::SameParameter() did not set it) DONE3 - edge was modified by BRepLib::SameParameter() to SameParameter DONE4 - not used anymore DONE5 - if the edge resulting from BRepLib has been chosen, i.e. variant b. above (only for edges with not set SameParameter).
") FixSameParameter;
		bool FixSameParameter(const TopoDS_Edge & edge, const double tolerance = 0.0);

		/****** ShapeFix_Edge::FixSameParameter ******/
		/****** md5 signature: 5b1a1e878dc5986e192af75ff32863a4 ******/
		%feature("compactdefaultargs") FixSameParameter;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face
tolerance: double (optional, default to 0.0)

Return
-------
bool

Description
-----------
Tries to make edge SameParameter and sets corresponding tolerance and SameParameter flag. First, it makes edge same range if SameRange flag is not set. //! If flag SameParameter is set, this method calls the function ShapeAnalysis_Edge::CheckSameParameter() that calculates the maximal deviation of pcurves of the edge from its 3d curve. If deviation > tolerance, the tolerance of edge is increased to a value of deviation. If deviation < tolerance nothing happens. //! If flag SameParameter is not set, this method chooses the best variant (one that has minimal tolerance), either a. only after computing deviation (as above) or b. after calling standard procedure BRepLib::SameParameter and computing deviation (as above). If <tolerance> > 0, it is used as parameter for BRepLib::SameParameter, otherwise, tolerance of the edge is used. //! Use: Is to be called after all pcurves and 3d curve of the edge are correctly computed Remark: SameParameter flag is always set to True after this method Returns: True, if something done, else False Status: OK - edge was initially SameParameter, nothing is done FAIL1 - computation of deviation of pcurves from 3d curve has failed FAIL2 - BRepLib::SameParameter() has failed DONE1 - tolerance of the edge was increased DONE2 - flag SameParameter was set to True (only if BRepLib::SameParameter() did not set it) DONE3 - edge was modified by BRepLib::SameParameter() to SameParameter DONE4 - not used anymore DONE5 - if the edge resulting from BRepLib has been chosen, i.e. variant b. above (only for edges with not set SameParameter).
") FixSameParameter;
		bool FixSameParameter(const TopoDS_Edge & edge, const TopoDS_Face & face, const double tolerance = 0.0);

		/****** ShapeFix_Edge::FixVertexTolerance ******/
		/****** md5 signature: 30a9c47d8a5d02bd6b9ceb52b8d13147 ******/
		%feature("compactdefaultargs") FixVertexTolerance;
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
") FixVertexTolerance;
		bool FixVertexTolerance(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeFix_Edge::FixVertexTolerance ******/
		/****** md5 signature: 9504952c9fc473f7c71e0e7545a2ce51 ******/
		%feature("compactdefaultargs") FixVertexTolerance;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
bool

Description
-----------
Increases the tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) Returns: True, if tolerances have been increased, otherwise False Status: OK: the original tolerances have not been changed DONE1: the tolerance of first vertex has been increased DONE2: the tolerance of last vertex has been increased.
") FixVertexTolerance;
		bool FixVertexTolerance(const TopoDS_Edge & edge);

		/****** ShapeFix_Edge::Projector ******/
		/****** md5 signature: d7c337fc8423602b26620c0c4a1ed24a ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeConstruct_ProjectCurveOnSurface>

Description
-----------
Returns the projector used for recomputing missing pcurves Can be used for adjusting parameters of projector.
") Projector;
		opencascade::handle<ShapeConstruct_ProjectCurveOnSurface> Projector();

		/****** ShapeFix_Edge::SetContext ******/
		/****** md5 signature: f37ffef0fea3299d082754a3f2f9af0c ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
context: ShapeBuild_ReShape

Return
-------
None

Description
-----------
Sets context.
") SetContext;
		void SetContext(const opencascade::handle<ShapeBuild_ReShape> & context);

		/****** ShapeFix_Edge::Status ******/
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
Returns the status (in the form of True/False) of last Fix.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** ShapeFix_EdgeConnect::ShapeFix_EdgeConnect ******/
		/****** md5 signature: bd6ce7a1d676000fe3ac9e759cfc5c57 ******/
		%feature("compactdefaultargs") ShapeFix_EdgeConnect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_EdgeConnect;
		 ShapeFix_EdgeConnect();

		/****** ShapeFix_EdgeConnect::Add ******/
		/****** md5 signature: f6e1fd05c99fbfc60ce15987a123628d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aFirst: TopoDS_Edge
aSecond: TopoDS_Edge

Return
-------
None

Description
-----------
Adds information on connectivity between start vertex of second edge and end vertex of first edge, taking edges orientation into account.
") Add;
		void Add(const TopoDS_Edge & aFirst, const TopoDS_Edge & aSecond);

		/****** ShapeFix_EdgeConnect::Add ******/
		/****** md5 signature: 1c2c17ad83f5b4f9122afbf2d2376f4f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
Adds connectivity information for the whole shape. Note: edges in wires must be well ordered Note: flag Closed should be set for closed wires.
") Add;
		void Add(const TopoDS_Shape & aShape);

		/****** ShapeFix_EdgeConnect::Build ******/
		/****** md5 signature: 634d88e5c99c5ce236c07b337243d591 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds shared vertices, updates their positions and tolerances.
") Build;
		void Build();

		/****** ShapeFix_EdgeConnect::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal data structure.
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
		/****** ShapeFix_EdgeProjAux::ShapeFix_EdgeProjAux ******/
		/****** md5 signature: 0e2ce94b0463e946ef6e4c5b51bb90ce ******/
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux();

		/****** ShapeFix_EdgeProjAux::ShapeFix_EdgeProjAux ******/
		/****** md5 signature: 5a22306eeac783995da6ee8c82b0ca85 ******/
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** ShapeFix_EdgeProjAux::Compute ******/
		/****** md5 signature: 173260076426e53d0dea8882bb6327ce ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
preci: double

Return
-------
None

Description
-----------
No available documentation.
") Compute;
		void Compute(const double preci);

		/****** ShapeFix_EdgeProjAux::FirstParam ******/
		/****** md5 signature: 1f3226b82eecd6b695724ad75500af6c ******/
		%feature("compactdefaultargs") FirstParam;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParam;
		double FirstParam();

		/****** ShapeFix_EdgeProjAux::Init ******/
		/****** md5 signature: 246a9432c543ceed9ba47bf37f1257dc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & F, const TopoDS_Edge & E);

		/****** ShapeFix_EdgeProjAux::IsFirstDone ******/
		/****** md5 signature: eb37410c836fc74477388c68512f13c8 ******/
		%feature("compactdefaultargs") IsFirstDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsFirstDone;
		bool IsFirstDone();

		/****** ShapeFix_EdgeProjAux::IsIso ******/
		/****** md5 signature: c79a2e3b53cfdc03102a09a9abdad8f9 ******/
		%feature("compactdefaultargs") IsIso;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsIso;
		bool IsIso(const opencascade::handle<Geom2d_Curve> & C);

		/****** ShapeFix_EdgeProjAux::IsLastDone ******/
		/****** md5 signature: 78dc6556bf56e8ee05244448da0a843a ******/
		%feature("compactdefaultargs") IsLastDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLastDone;
		bool IsLastDone();

		/****** ShapeFix_EdgeProjAux::LastParam ******/
		/****** md5 signature: 98ef689a504b7f4e51087a60f3ac7e17 ******/
		%feature("compactdefaultargs") LastParam;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParam;
		double LastParam();

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
		/****** ShapeFix_FaceConnect::ShapeFix_FaceConnect ******/
		/****** md5 signature: 28540f2b0d244af2f831a8a2d5855554 ******/
		%feature("compactdefaultargs") ShapeFix_FaceConnect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_FaceConnect;
		 ShapeFix_FaceConnect();

		/****** ShapeFix_FaceConnect::Add ******/
		/****** md5 signature: 90be4f03f2e00b043c4772f78b85f6fc ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aFirst: TopoDS_Face
aSecond: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") Add;
		bool Add(const TopoDS_Face & aFirst, const TopoDS_Face & aSecond);

		/****** ShapeFix_FaceConnect::Build ******/
		/****** md5 signature: 781d6916ee013e008e3013c45a2b2c88 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
shell: TopoDS_Shell
sewtoler: double
fixtoler: double

Return
-------
TopoDS_Shell

Description
-----------
No available documentation.
") Build;
		TopoDS_Shell Build(const TopoDS_Shell & shell, const double sewtoler, const double fixtoler);

		/****** ShapeFix_FaceConnect::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal data structure.
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
		/****** ShapeFix_FreeBounds::ShapeFix_FreeBounds ******/
		/****** md5 signature: 51221d26a9f2e1a24cfea213a36da9f8 ******/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds();

		/****** ShapeFix_FreeBounds::ShapeFix_FreeBounds ******/
		/****** md5 signature: 24573fa7c2607b024470e019c50c6415 ******/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
sewtoler: double
closetoler: double
splitclosed: bool
splitopen: bool

Return
-------
None

Description
-----------
Builds forecasting free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of faces. Tolerance <closetoler> should be greater than tolerance <sewtoler> used for initializing sewing analyzer, otherwise connection of open wires is not performed.
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds(const TopoDS_Shape & shape, const double sewtoler, const double closetoler, const bool splitclosed, const bool splitopen);

		/****** ShapeFix_FreeBounds::ShapeFix_FreeBounds ******/
		/****** md5 signature: 78a1cf1db71ff6faa7402cd2b55c46dc ******/
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
closetoler: double
splitclosed: bool
splitopen: bool

Return
-------
None

Description
-----------
Builds actual free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of shells.
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds(const TopoDS_Shape & shape, const double closetoler, const bool splitclosed, const bool splitopen);

		/****** ShapeFix_FreeBounds::GetClosedWires ******/
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

		/****** ShapeFix_FreeBounds::GetOpenWires ******/
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

		/****** ShapeFix_FreeBounds::GetShape ******/
		/****** md5 signature: 68adf76e3cbb4c2e8340f398e62eb4da ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns modified source shape.
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
		/****** ShapeFix_IntersectionTool::ShapeFix_IntersectionTool ******/
		/****** md5 signature: fc03f726a80f182a2210035d46c91117 ******/
		%feature("compactdefaultargs") ShapeFix_IntersectionTool;
		%feature("autodoc", "
Parameters
----------
context: ShapeBuild_ReShape
preci: double
maxtol: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Constructor.
") ShapeFix_IntersectionTool;
		 ShapeFix_IntersectionTool(const opencascade::handle<ShapeBuild_ReShape> & context, const double preci, const double maxtol = 1.0);

		/****** ShapeFix_IntersectionTool::Context ******/
		/****** md5 signature: 89f59aaf74eb4221c2a98a0e91f389d7 ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeBuild_ReShape>

Description
-----------
Returns context.
") Context;
		opencascade::handle<ShapeBuild_ReShape> Context();

		/****** ShapeFix_IntersectionTool::CutEdge ******/
		/****** md5 signature: 2b3a545c11487f69202fae0661f95772 ******/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
pend: double
cut: double
face: TopoDS_Face

Return
-------
iscutline: bool

Description
-----------
Cut edge by parameters pend and cut.
") CutEdge;
		bool CutEdge(const TopoDS_Edge & edge, const double pend, const double cut, const TopoDS_Face & face, Standard_Boolean &OutValue);

		/****** ShapeFix_IntersectionTool::FixIntersectingWires ******/
		/****** md5 signature: fba208cd6873e7212c36f5510651328f ******/
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") FixIntersectingWires;
		bool FixIntersectingWires(TopoDS_Face & face);

		/****** ShapeFix_IntersectionTool::FixSelfIntersectWire ******/
		/****** md5 signature: 2bf08cb0f41e67554cc2224fdff67360 ******/
		%feature("compactdefaultargs") FixSelfIntersectWire;
		%feature("autodoc", "
Parameters
----------
sewd: ShapeExtend_WireData
face: TopoDS_Face

Return
-------
NbSplit: int
NbCut: int
NbRemoved: int

Description
-----------
No available documentation.
") FixSelfIntersectWire;
		bool FixSelfIntersectWire(opencascade::handle<ShapeExtend_WireData> & sewd, const TopoDS_Face & face, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ShapeFix_IntersectionTool::SplitEdge ******/
		/****** md5 signature: e1ff142a316644de7a90d5c7d9a19338 ******/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
param: double
vert: TopoDS_Vertex
face: TopoDS_Face
newE1: TopoDS_Edge
newE2: TopoDS_Edge
preci: double

Return
-------
bool

Description
-----------
Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting The 'face' is necessary for pcurves and using TransferParameterProj.
") SplitEdge;
		bool SplitEdge(const TopoDS_Edge & edge, const double param, const TopoDS_Vertex & vert, const TopoDS_Face & face, TopoDS_Edge & newE1, TopoDS_Edge & newE2, const double preci);

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
		/****** ShapeFix_Root::ShapeFix_Root ******/
		/****** md5 signature: 0429589d904ddf3e40509ee1aba9824e ******/
		%feature("compactdefaultargs") ShapeFix_Root;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor (no context is created).
") ShapeFix_Root;
		 ShapeFix_Root();

		/****** ShapeFix_Root::Context ******/
		/****** md5 signature: 89f59aaf74eb4221c2a98a0e91f389d7 ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeBuild_ReShape>

Description
-----------
Returns context.
") Context;
		opencascade::handle<ShapeBuild_ReShape> Context();

		/****** ShapeFix_Root::LimitTolerance ******/
		/****** md5 signature: 7853e4a6f09988ff18c714ab2dd1c7c5 ******/
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "
Parameters
----------
toler: double

Return
-------
double

Description
-----------
Returns tolerance limited by [myMinTol,myMaxTol].
") LimitTolerance;
		double LimitTolerance(const double toler);

		/****** ShapeFix_Root::MaxTolerance ******/
		/****** md5 signature: 42b12d569fc6c97ab3b734f04b37ec44 ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximal allowed tolerance.
") MaxTolerance;
		double MaxTolerance();

		/****** ShapeFix_Root::MinTolerance ******/
		/****** md5 signature: df77f4a3b7576c4b27daf21be8de21c5 ******/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns minimal allowed tolerance.
") MinTolerance;
		double MinTolerance();

		/****** ShapeFix_Root::MsgRegistrator ******/
		/****** md5 signature: 75371a4ad2792d7881281f65d5c59c1b ******/
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_BasicMsgRegistrator>

Description
-----------
Returns message registrator.
") MsgRegistrator;
		opencascade::handle<ShapeExtend_BasicMsgRegistrator> MsgRegistrator();

		/****** ShapeFix_Root::Precision ******/
		/****** md5 signature: 619d4ae2a460550f8d9105bf9304b5d1 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns basic precision value.
") Precision;
		double Precision();

		/****** ShapeFix_Root::SendFail ******/
		/****** md5 signature: 8cfa9a9f964baf3ffe1f3268529e308a ******/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
message: Message_Msg

Return
-------
None

Description
-----------
Sends a fail to be attached to the shape. Calls SendMsg with gravity set to Message_Fail.
") SendFail;
		void SendFail(const TopoDS_Shape & shape, const Message_Msg & message);

		/****** ShapeFix_Root::SendFail ******/
		/****** md5 signature: bb5fe6cd5b2a82fbd6f821e6b716f469 ******/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "
Parameters
----------
message: Message_Msg

Return
-------
None

Description
-----------
Calls previous method for myShape.
") SendFail;
		void SendFail(const Message_Msg & message);

		/****** ShapeFix_Root::SendMsg ******/
		/****** md5 signature: 63af56acccb2dd5832d840956eefee1e ******/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
message: Message_Msg
gravity: Message_Gravity (optional, default to Message_Info)

Return
-------
None

Description
-----------
Sends a message to be attached to the shape. Calls corresponding message of message registrator.
") SendMsg;
		void SendMsg(const TopoDS_Shape & shape, const Message_Msg & message, const Message_Gravity gravity = Message_Info);

		/****** ShapeFix_Root::SendMsg ******/
		/****** md5 signature: 3926d6c44e447d96694bbec386b0ec60 ******/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "
Parameters
----------
message: Message_Msg
gravity: Message_Gravity (optional, default to Message_Info)

Return
-------
None

Description
-----------
Sends a message to be attached to myShape. Calls previous method.
") SendMsg;
		void SendMsg(const Message_Msg & message, const Message_Gravity gravity = Message_Info);

		/****** ShapeFix_Root::SendWarning ******/
		/****** md5 signature: f01bef9c0702b9d5edea1ef70e1d4137 ******/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
message: Message_Msg

Return
-------
None

Description
-----------
Sends a warning to be attached to the shape. Calls SendMsg with gravity set to Message_Warning.
") SendWarning;
		void SendWarning(const TopoDS_Shape & shape, const Message_Msg & message);

		/****** ShapeFix_Root::SendWarning ******/
		/****** md5 signature: fa5c8bdada69aee67e8a7f89bf881433 ******/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "
Parameters
----------
message: Message_Msg

Return
-------
None

Description
-----------
Calls previous method for myShape.
") SendWarning;
		void SendWarning(const Message_Msg & message);

		/****** ShapeFix_Root::Set ******/
		/****** md5 signature: 39aa8a21842f317d88d4b3daecb3a64c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Root: ShapeFix_Root

Return
-------
None

Description
-----------
Copy all fields from another Root object.
") Set;
		virtual void Set(const opencascade::handle<ShapeFix_Root> & Root);

		/****** ShapeFix_Root::SetContext ******/
		/****** md5 signature: 93cd3c1274c459de970a0dad7c4a45e1 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
context: ShapeBuild_ReShape

Return
-------
None

Description
-----------
Sets context.
") SetContext;
		virtual void SetContext(const opencascade::handle<ShapeBuild_ReShape> & context);

		/****** ShapeFix_Root::SetMaxTolerance ******/
		/****** md5 signature: 44e439556d89760be503c8d54f6d98b3 ******/
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
Sets maximal allowed tolerance.
") SetMaxTolerance;
		virtual void SetMaxTolerance(const double maxtol);

		/****** ShapeFix_Root::SetMinTolerance ******/
		/****** md5 signature: 8a049d3490100831762f3492c969144b ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
mintol: double

Return
-------
None

Description
-----------
Sets minimal allowed tolerance.
") SetMinTolerance;
		virtual void SetMinTolerance(const double mintol);

		/****** ShapeFix_Root::SetMsgRegistrator ******/
		/****** md5 signature: 684cc840be09df59bc67d102aa6274f1 ******/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "
Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Return
-------
None

Description
-----------
Sets message registrator.
") SetMsgRegistrator;
		virtual void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****** ShapeFix_Root::SetPrecision ******/
		/****** md5 signature: 48dd4c74011794903c817ad8c980202b ******/
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
Sets basic precision value.
") SetPrecision;
		virtual void SetPrecision(const double preci);

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
		/****** ShapeFix_ShapeTolerance::ShapeFix_ShapeTolerance ******/
		/****** md5 signature: f73d33ac6c9ace18d97fa9e0714ea572 ******/
		%feature("compactdefaultargs") ShapeFix_ShapeTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_ShapeTolerance;
		 ShapeFix_ShapeTolerance();

		/****** ShapeFix_ShapeTolerance::LimitTolerance ******/
		/****** md5 signature: 8dfcaa5bf760885de303f36cba05b635 ******/
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tmin: double
tmax: double (optional, default to 0.0)
styp: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
bool

Description
-----------
Limits tolerances in a shape as follows: tmin = tmax -> as SetTolerance (forces) tmin = 0 -> maximum tolerance will be <tmax> tmax = 0 or not given (more generally, tmax < tmin) -> <tmax> ignored, minimum will be <tmin> else, maximum will be <max> and minimum will be <min> styp = VERTEX: only vertices are set styp = EDGE: only edges are set styp = FACE: only faces are set styp = WIRE: to have edges and their vertices set styp = other value: all (vertices,edges,faces) are set Returns True if at least one tolerance of the sub-shape has been modified.
") LimitTolerance;
		bool LimitTolerance(const TopoDS_Shape & shape, const double tmin, const double tmax = 0.0, const TopAbs_ShapeEnum styp = TopAbs_SHAPE);

		/****** ShapeFix_ShapeTolerance::SetTolerance ******/
		/****** md5 signature: 412bd08a4e6a9baee85eee210781aa3c ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
preci: double
styp: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
Sets (enforces) tolerances in a shape to the given value styp = VERTEX: only vertices are set styp = EDGE: only edges are set styp = FACE: only faces are set styp = WIRE: to have edges and their vertices set styp = other value: all (vertices,edges,faces) are set.
") SetTolerance;
		void SetTolerance(const TopoDS_Shape & shape, const double preci, const TopAbs_ShapeEnum styp = TopAbs_SHAPE);

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
		/****** ShapeFix_SplitTool::ShapeFix_SplitTool ******/
		/****** md5 signature: f3038d3d62636e51849c2f5fefc09727 ******/
		%feature("compactdefaultargs") ShapeFix_SplitTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeFix_SplitTool;
		 ShapeFix_SplitTool();

		/****** ShapeFix_SplitTool::CutEdge ******/
		/****** md5 signature: 2b3a545c11487f69202fae0661f95772 ******/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
pend: double
cut: double
face: TopoDS_Face

Return
-------
iscutline: bool

Description
-----------
Cut edge by parameters pend and cut.
") CutEdge;
		bool CutEdge(const TopoDS_Edge & edge, const double pend, const double cut, const TopoDS_Face & face, Standard_Boolean &OutValue);

		/****** ShapeFix_SplitTool::SplitEdge ******/
		/****** md5 signature: c8acc4e51e44a3c800f1703891ed9eab ******/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
param: double
vert: TopoDS_Vertex
face: TopoDS_Face
newE1: TopoDS_Edge
newE2: TopoDS_Edge
tol3d: double
tol2d: double

Return
-------
bool

Description
-----------
Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting The 'face' is necessary for pcurves and using TransferParameterProj.
") SplitEdge;
		bool SplitEdge(const TopoDS_Edge & edge, const double param, const TopoDS_Vertex & vert, const TopoDS_Face & face, TopoDS_Edge & newE1, TopoDS_Edge & newE2, const double tol3d, const double tol2d);

		/****** ShapeFix_SplitTool::SplitEdge ******/
		/****** md5 signature: 209484c117f0835fa9d7e7d50c7d6072 ******/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
param1: double
param2: double
vert: TopoDS_Vertex
face: TopoDS_Face
newE1: TopoDS_Edge
newE2: TopoDS_Edge
tol3d: double
tol2d: double

Return
-------
bool

Description
-----------
Split edge on two new edges using new vertex 'vert' and 'param1' and 'param2' - parameter for splitting and cutting The 'face' is necessary for pcurves and using TransferParameterProj.
") SplitEdge;
		bool SplitEdge(const TopoDS_Edge & edge, const double param1, const double param2, const TopoDS_Vertex & vert, const TopoDS_Face & face, TopoDS_Edge & newE1, TopoDS_Edge & newE2, const double tol3d, const double tol2d);

		/****** ShapeFix_SplitTool::SplitEdge ******/
		/****** md5 signature: da25113ed335c095972cf839a0beed52 ******/
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
fp: double
V1: TopoDS_Vertex
lp: double
V2: TopoDS_Vertex
face: TopoDS_Face
SeqE: NCollection_Sequence<TopoDS_Shape>
context: ShapeBuild_ReShape
tol3d: double
tol2d: double

Return
-------
aNum: int

Description
-----------
Split edge on two new edges using two new vertex V1 and V2 and two parameters for splitting - fp and lp correspondingly The 'face' is necessary for pcurves and using TransferParameterProj aNum - number of edge in SeqE which corresponding to [fp,lp].
") SplitEdge;
		bool SplitEdge(const TopoDS_Edge & edge, const double fp, const TopoDS_Vertex & V1, const double lp, const TopoDS_Vertex & V2, const TopoDS_Face & face, NCollection_Sequence<TopoDS_Shape> & SeqE, Standard_Integer &OutValue, const opencascade::handle<ShapeBuild_ReShape> & context, const double tol3d, const double tol2d);

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
		/****** ShapeFix_WireVertex::ShapeFix_WireVertex ******/
		/****** md5 signature: 64943af3f3eb0afd1de7b3c12f34f047 ******/
		%feature("compactdefaultargs") ShapeFix_WireVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_WireVertex;
		 ShapeFix_WireVertex();

		/****** ShapeFix_WireVertex::Analyzer ******/
		/****** md5 signature: 5e1625a1025a731a5fee17af33e388ff ******/
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "Return
-------
ShapeAnalysis_WireVertex

Description
-----------
returns internal analyzer.
") Analyzer;
		const ShapeAnalysis_WireVertex & Analyzer();

		/****** ShapeFix_WireVertex::Fix ******/
		/****** md5 signature: 3eb4529017008d880a3fe303451d3949 ******/
		%feature("compactdefaultargs") Fix;
		%feature("autodoc", "Return
-------
int

Description
-----------
Fixes all statuses except 'Disjoined', i.e. the cases in which a common value has been set, with or without changing parameters Returns the count of fixed vertices, 0 if none.
") Fix;
		int Fix();

		/****** ShapeFix_WireVertex::FixSame ******/
		/****** md5 signature: 5ca58b73a2eb4c3a632942537998350c ******/
		%feature("compactdefaultargs") FixSame;
		%feature("autodoc", "Return
-------
int

Description
-----------
Fixes 'Same' or 'Close' status (same vertex may be set, without changing parameters) Returns the count of fixed vertices, 0 if none.
") FixSame;
		int FixSame();

		/****** ShapeFix_WireVertex::Init ******/
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
Loads the wire, ininializes internal analyzer (ShapeAnalysis_WireVertex) with the given precision, and performs analysis.
") Init;
		void Init(const TopoDS_Wire & wire, const double preci);

		/****** ShapeFix_WireVertex::Init ******/
		/****** md5 signature: a0c567e61049dd6e67302bf9323b083a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
sbwd: ShapeExtend_WireData
preci: double

Return
-------
None

Description
-----------
Loads the wire, ininializes internal analyzer (ShapeAnalysis_WireVertex) with the given precision, and performs analysis.
") Init;
		void Init(const opencascade::handle<ShapeExtend_WireData> & sbwd, const double preci);

		/****** ShapeFix_WireVertex::Init ******/
		/****** md5 signature: 7d4943cc88255526a194903195389755 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
sawv: ShapeAnalysis_WireVertex

Return
-------
None

Description
-----------
Loads all the data on wire, already analysed by ShapeAnalysis_WireVertex.
") Init;
		void Init(const ShapeAnalysis_WireVertex & sawv);

		/****** ShapeFix_WireVertex::Wire ******/
		/****** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
returns resulting wire (fixed).
") Wire;
		TopoDS_Wire Wire();

		/****** ShapeFix_WireVertex::WireData ******/
		/****** md5 signature: c8792f073dea4df1af697814fbf5f311 ******/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_WireData>

Description
-----------
returns data on wire (fixed).
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
		/****** ShapeFix_ComposeShell::ShapeFix_ComposeShell ******/
		/****** md5 signature: 23795f6942df730c844bd4a1f99bb726 ******/
		%feature("compactdefaultargs") ShapeFix_ComposeShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty tool.
") ShapeFix_ComposeShell;
		 ShapeFix_ComposeShell();

		/****** ShapeFix_ComposeShell::ClosedMode ******/
		/****** md5 signature: d525e4f64b788e5fe74c6317179120b0 ******/
		%feature("compactdefaultargs") ClosedMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) flag for special 'closed' mode which forces ComposeShell to consider all pcurves on closed surface as modulo period. This can reduce reliability, but allows to deal with wires closed in 3d but open in 2d (missing seam) Default is False.
") ClosedMode;
		bool & ClosedMode();

		/****** ShapeFix_ComposeShell::DispatchWires ******/
		/****** md5 signature: 112275afbe3444957fe41fcba2213ce5 ******/
		%feature("compactdefaultargs") DispatchWires;
		%feature("autodoc", "
Parameters
----------
faces: NCollection_Sequence<TopoDS_Shape>
wires: NCollection_Sequence<ShapeFix_WireSegment>

Return
-------
None

Description
-----------
Creates new faces from the set of (closed) wires. Each wire is put on corresponding patch in the composite surface, and all pcurves on the initial (pseudo)face are reassigned to that surface. If several wires are one inside another, single face is created.
") DispatchWires;
		void DispatchWires(NCollection_Sequence<TopoDS_Shape> & faces, NCollection_Sequence<ShapeFix_WireSegment> & wires);

		/****** ShapeFix_ComposeShell::GetTransferParamTool ******/
		/****** md5 signature: b9e239d6f4c9de02af2a5cc4956eff51 ******/
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeAnalysis_TransferParameters>

Description
-----------
Gets tool for transfer parameters from 3d to 2d and vice versa.
") GetTransferParamTool;
		opencascade::handle<ShapeAnalysis_TransferParameters> GetTransferParamTool();

		/****** ShapeFix_ComposeShell::Init ******/
		/****** md5 signature: faa987fea63423038dc4b98b4bdf49be ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Grid: ShapeExtend_CompositeSurface
L: TopLoc_Location
Face: TopoDS_Face
Prec: double

Return
-------
None

Description
-----------
Initializes with composite surface, face and precision. Here face defines both set of wires and way of getting pcurves. Precision is used (together with tolerance of edges) for handling subtle cases, such as tangential intersections.
") Init;
		void Init(const opencascade::handle<ShapeExtend_CompositeSurface> & Grid, const TopLoc_Location & L, const TopoDS_Face & Face, const double Prec);

		/****** ShapeFix_ComposeShell::Perform ******/
		/****** md5 signature: 107e59197b0bbca4b641ec7127b7b2cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs the work on already loaded data.
") Perform;
		virtual bool Perform();

		/****** ShapeFix_ComposeShell::Result ******/
		/****** md5 signature: 64e8e20a963b00a422945949bd4e1549 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns resulting shell or face (or Null shape if not done).
") Result;
		const TopoDS_Shape Result();

		/****** ShapeFix_ComposeShell::SetTransferParamTool ******/
		/****** md5 signature: 4188a11705a4f1a9d9396cc0ac077382 ******/
		%feature("compactdefaultargs") SetTransferParamTool;
		%feature("autodoc", "
Parameters
----------
TransferParam: ShapeAnalysis_TransferParameters

Return
-------
None

Description
-----------
Sets tool for transfer parameters from 3d to 2d and vice versa.
") SetTransferParamTool;
		void SetTransferParamTool(const opencascade::handle<ShapeAnalysis_TransferParameters> & TransferParam);

		/****** ShapeFix_ComposeShell::SplitEdges ******/
		/****** md5 signature: 331bb3c5f5af91cdf07f7ad382ac1f69 ******/
		%feature("compactdefaultargs") SplitEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
Splits edges in the original shape by grid. This is a part of Perform() which does not produce any resulting shape; the only result is filled context where splittings are recorded. //! NOTE: If edge is split, it is replaced by wire, and order of edges in the wire corresponds to FORWARD orientation of the edge.
") SplitEdges;
		void SplitEdges();

		/****** ShapeFix_ComposeShell::Status ******/
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
Queries status of last call to Perform() OK: nothing done (some kind of error) DONE1: splitting is done, at least one new face created DONE2: splitting is done, several new faces obtained FAIL1: misoriented wire encountered (handled) FAIL2: recoverable parity error FAIL3: edge with no pcurve on supporting face FAIL4: unrecoverable algorithm error (parity check).
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** ShapeFix_Face::ShapeFix_Face ******/
		/****** md5 signature: 8515b78e3eb57447eafabb2cc591abb5 ******/
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") ShapeFix_Face;
		 ShapeFix_Face();

		/****** ShapeFix_Face::ShapeFix_Face ******/
		/****** md5 signature: f2684f8c11ec497c2c9257db58a910c9 ******/
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face

Return
-------
None

Description
-----------
Creates a tool and loads a face.
") ShapeFix_Face;
		 ShapeFix_Face(const TopoDS_Face & face);

		/****** ShapeFix_Face::Add ******/
		/****** md5 signature: dfcb95b19b591e4ebe7ce59a61e5168c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire

Return
-------
None

Description
-----------
Add a wire to current face using BRep_Builder. Wire is added without taking into account orientation of face (as if face were FORWARD).
") Add;
		void Add(const TopoDS_Wire & wire);

		/****** ShapeFix_Face::AutoCorrectPrecisionMode ******/
		/****** md5 signature: 1fe157f35da28f3e624281a5fb9e781c ******/
		%feature("compactdefaultargs") AutoCorrectPrecisionMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the auto-correct precision mode by default False.
") AutoCorrectPrecisionMode;
		int & AutoCorrectPrecisionMode();

		/****** ShapeFix_Face::ClearModes ******/
		/****** md5 signature: dacb0a374c08161f5c8f0805fdf25f2f ******/
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets all modes to default.
") ClearModes;
		virtual void ClearModes();

		/****** ShapeFix_Face::Face ******/
		/****** md5 signature: 64c75db1e9c1285068e9dd474618f74f ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns a face which corresponds to the current state Warning: The finally produced face may be another one ... but with the same support.
") Face;
		TopoDS_Face Face();

		/****** ShapeFix_Face::FixAddNaturalBound ******/
		/****** md5 signature: 50cab794be7d8693beccee7aeafc3511 ******/
		%feature("compactdefaultargs") FixAddNaturalBound;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Adds natural boundary on face if it is missing. Two cases are supported: - face has no wires - face lies on geometrically double-closed surface (sphere or torus) and none of wires is left-oriented Returns True if natural boundary was added.
") FixAddNaturalBound;
		bool FixAddNaturalBound();

		/****** ShapeFix_Face::FixAddNaturalBoundMode ******/
		/****** md5 signature: 18e4fdf289f8d6879bd26524fe22eab7 ******/
		%feature("compactdefaultargs") FixAddNaturalBoundMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the add natural bound mode. If true, natural boundary is added on faces that miss them. Default is False for faces with single wire (they are handled by FixOrientation in that case) and True for others.
") FixAddNaturalBoundMode;
		int & FixAddNaturalBoundMode();

		/****** ShapeFix_Face::FixIntersectingWires ******/
		/****** md5 signature: bc7d8b5ef9bead12edf2636d3d9defb9 ******/
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Detects and fixes the special case when face has more than one wire and this wires have intersection point.
") FixIntersectingWires;
		bool FixIntersectingWires();

		/****** ShapeFix_Face::FixIntersectingWiresMode ******/
		/****** md5 signature: d389b52f049bfa93999b5ba2d0dc7447 ******/
		%feature("compactdefaultargs") FixIntersectingWiresMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the fix intersecting wires mode by default True.
") FixIntersectingWiresMode;
		int & FixIntersectingWiresMode();

		/****** ShapeFix_Face::FixLoopWire ******/
		/****** md5 signature: 94dc57602e335844e616d88dee53c7b7 ******/
		%feature("compactdefaultargs") FixLoopWire;
		%feature("autodoc", "
Parameters
----------
aResWires: NCollection_Sequence<TopoDS_Shape>

Return
-------
bool

Description
-----------
Detects if wire has a loop and fixes this situation by splitting on the few parts. if wire has a loops and it was split Status was set to value ShapeExtend_DONE6.
") FixLoopWire;
		bool FixLoopWire(NCollection_Sequence<TopoDS_Shape> & aResWires);

		/****** ShapeFix_Face::FixLoopWiresMode ******/
		/****** md5 signature: d11be41f7c99a6b35ab54206da2acb52 ******/
		%feature("compactdefaultargs") FixLoopWiresMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the fix loop wires mode by default True.
") FixLoopWiresMode;
		int & FixLoopWiresMode();

		/****** ShapeFix_Face::FixMissingSeam ******/
		/****** md5 signature: 4997fd6c4a01a7a4522cae16cb8bf494 ******/
		%feature("compactdefaultargs") FixMissingSeam;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Detects and fixes the special case when face on a closed surface is given by two wires closed in 3d but with gap in 2d. In that case it creates a new wire from the two, and adds a missing seam edge Returns True if missing seam was added.
") FixMissingSeam;
		bool FixMissingSeam();

		/****** ShapeFix_Face::FixMissingSeamMode ******/
		/****** md5 signature: 3b6bc424411872458690a4b9e860a857 ******/
		%feature("compactdefaultargs") FixMissingSeamMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the fix missing seam mode, by default True. If True, tries to insert seam is missed.
") FixMissingSeamMode;
		int & FixMissingSeamMode();

		/****** ShapeFix_Face::FixOrientation ******/
		/****** md5 signature: 5a2562894ad3e3ec9d63efc558bd04f2 ******/
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fixes orientation of wires on the face It tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. If face lying on sphere or torus has single wire and AddNaturalBoundMode is True, that wire is not reversed in any case (supposing that natural bound will be added). Returns True if wires were reversed.
") FixOrientation;
		bool FixOrientation();

		/****** ShapeFix_Face::FixOrientation ******/
		/****** md5 signature: 2f1c6c25366bd1669b64e8f35d842c26 ******/
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "
Parameters
----------
MapWires: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
bool

Description
-----------
Fixes orientation of wires on the face It tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. If face lying on sphere or torus has single wire and AddNaturalBoundMode is True, that wire is not reversed in any case (supposing that natural bound will be added). Returns True if wires were reversed OutWires return information about out wires + list of internal wires for each (for performing split face).
") FixOrientation;
		bool FixOrientation(NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & MapWires);

		/****** ShapeFix_Face::FixOrientationMode ******/
		/****** md5 signature: 86bf9e63ce82b69990ae12b2931e2d9a ******/
		%feature("compactdefaultargs") FixOrientationMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the fix orientation mode, by default True. If True, wires oriented to border limited square.
") FixOrientationMode;
		int & FixOrientationMode();

		/****** ShapeFix_Face::FixPeriodicDegenerated ******/
		/****** md5 signature: 3f8faf8699c47d9ff0399c14404e5174 ******/
		%feature("compactdefaultargs") FixPeriodicDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fixes topology for a specific case when face is composed by a single wire belting a periodic surface. In that case a degenerated edge is reconstructed in the degenerated pole of the surface. Initial wire gets consistent orientation. Must be used in couple and before FixMissingSeam routine.
") FixPeriodicDegenerated;
		bool FixPeriodicDegenerated();

		/****** ShapeFix_Face::FixPeriodicDegeneratedMode ******/
		/****** md5 signature: 6d9ad4eb1d8bcb78007f2e8c75fe22e8 ******/
		%feature("compactdefaultargs") FixPeriodicDegeneratedMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the activation flag for periodic degenerated fix. False by default.
") FixPeriodicDegeneratedMode;
		int & FixPeriodicDegeneratedMode();

		/****** ShapeFix_Face::FixSmallAreaWire ******/
		/****** md5 signature: 596c2e57935cb3778f06b60626f26680 ******/
		%feature("compactdefaultargs") FixSmallAreaWire;
		%feature("autodoc", "
Parameters
----------
theIsRemoveSmallFace: bool

Return
-------
bool

Description
-----------
Detects wires with small area (that is less than 100*Precision::PConfusion(). Removes these wires if they are internal. Returns: True if at least one small wire removed, False if does nothing.
") FixSmallAreaWire;
		bool FixSmallAreaWire(const bool theIsRemoveSmallFace);

		/****** ShapeFix_Face::FixSmallAreaWireMode ******/
		/****** md5 signature: 520880c4c1e7526f09effce8c327847b ******/
		%feature("compactdefaultargs") FixSmallAreaWireMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the fix small area wire mode, by default False. If True, drops small wires.
") FixSmallAreaWireMode;
		int & FixSmallAreaWireMode();

		/****** ShapeFix_Face::FixSplitFace ******/
		/****** md5 signature: d8a83d6645a5131c5dd035ea723dc472 ******/
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", "
Parameters
----------
MapWires: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
bool

Description
-----------
Split face if there are more than one out wire using inrormation after FixOrientation().
") FixSplitFace;
		bool FixSplitFace(const NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & MapWires);

		/****** ShapeFix_Face::FixSplitFaceMode ******/
		/****** md5 signature: b9d2c8d15e9707d9c5a843480ba14360 ******/
		%feature("compactdefaultargs") FixSplitFaceMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the fix split face mode by default True.
") FixSplitFaceMode;
		int & FixSplitFaceMode();

		/****** ShapeFix_Face::FixWireMode ******/
		/****** md5 signature: 8a52fdb546a19336edc81cfe263d6e08 ******/
		%feature("compactdefaultargs") FixWireMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying fixes of ShapeFix_Wire, by default True.
") FixWireMode;
		int & FixWireMode();

		/****** ShapeFix_Face::FixWireTool ******/
		/****** md5 signature: 0f06026c1e0aa8536ddc996f0ba4501a ******/
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Wire>

Description
-----------
Returns tool for fixing wires.
") FixWireTool;
		opencascade::handle<ShapeFix_Wire> FixWireTool();

		/****** ShapeFix_Face::FixWiresTwoCoincEdges ******/
		/****** md5 signature: 470f9346b1c5c438e852b46fd7499e87 ******/
		%feature("compactdefaultargs") FixWiresTwoCoincEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If wire contains two coincidence edges it must be removed Queries on status after Perform().
") FixWiresTwoCoincEdges;
		bool FixWiresTwoCoincEdges();

		/****** ShapeFix_Face::Init ******/
		/****** md5 signature: bf5e73c6f5e07feeee65de419942b9c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
face: TopoDS_Face

Return
-------
None

Description
-----------
Loads a whole face already created, with its wires, sense and location.
") Init;
		void Init(const TopoDS_Face & face);

		/****** ShapeFix_Face::Init ******/
		/****** md5 signature: fb71620f9785af97356bf1d354070e85 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
surf: Geom_Surface
preci: double
fwd: bool (optional, default to true)

Return
-------
None

Description
-----------
Starts the creation of the face By default it will be FORWARD, or REVERSED if <fwd> is False.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & surf, const double preci, const bool fwd = true);

		/****** ShapeFix_Face::Init ******/
		/****** md5 signature: 936671056fd650684d900e46a96cdb3a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
surf: ShapeAnalysis_Surface
preci: double
fwd: bool (optional, default to true)

Return
-------
None

Description
-----------
Starts the creation of the face By default it will be FORWARD, or REVERSED if <fwd> is False.
") Init;
		void Init(const opencascade::handle<ShapeAnalysis_Surface> & surf, const double preci, const bool fwd = true);

		/****** ShapeFix_Face::Perform ******/
		/****** md5 signature: 836e5d294e107797e3a08ad4bfbbad29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs all the fixes, depending on modes Function Status returns the status of last call to Perform() ShapeExtend_OK: face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire.
") Perform;
		bool Perform();

		/****** ShapeFix_Face::RemoveSmallAreaFaceMode ******/
		/****** md5 signature: 276f316c7981191452b80a9559f41692 ******/
		%feature("compactdefaultargs") RemoveSmallAreaFaceMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the remove face with small area, by default False. If True, drops faces with small outer wires.
") RemoveSmallAreaFaceMode;
		int & RemoveSmallAreaFaceMode();

		/****** ShapeFix_Face::Result ******/
		/****** md5 signature: e7d296a4a4a5995509cb67e3ee28f5dc ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns resulting shape (Face or Shell if split) To be used instead of Face() if FixMissingSeam involved.
") Result;
		TopoDS_Shape Result();

		/****** ShapeFix_Face::SetMaxTolerance ******/
		/****** md5 signature: d4049d4b0d6f1aac10769ba029a4e638 ******/
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
Sets maximal allowed tolerance (also to FixWireTool).
") SetMaxTolerance;
		void SetMaxTolerance(const double maxtol);

		/****** ShapeFix_Face::SetMinTolerance ******/
		/****** md5 signature: 8d93f49921a21f590a07a25b523da625 ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
mintol: double

Return
-------
None

Description
-----------
Sets minimal allowed tolerance (also to FixWireTool).
") SetMinTolerance;
		void SetMinTolerance(const double mintol);

		/****** ShapeFix_Face::SetMsgRegistrator ******/
		/****** md5 signature: f258f9218a75996548e4fc2aee290a82 ******/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "
Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Return
-------
None

Description
-----------
Sets message registrator.
") SetMsgRegistrator;
		void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****** ShapeFix_Face::SetPrecision ******/
		/****** md5 signature: abd140f84c70b8416a47ddf34a4af5f4 ******/
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
Sets basic precision value (also to FixWireTool).
") SetPrecision;
		void SetPrecision(const double preci);

		/****** ShapeFix_Face::Status ******/
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
Returns the status of last call to Perform() ShapeExtend_OK: face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_DONE8: face may be splited ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** ShapeFix_FixSmallFace::ShapeFix_FixSmallFace ******/
		/****** md5 signature: 6afb4049203da26745ef2bba554463fe ******/
		%feature("compactdefaultargs") ShapeFix_FixSmallFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_FixSmallFace;
		 ShapeFix_FixSmallFace();

		/****** ShapeFix_FixSmallFace::ComputeSharedEdgeForStripFace ******/
		/****** md5 signature: df6dea2388770543e1285b5381f48b01 ******/
		%feature("compactdefaultargs") ComputeSharedEdgeForStripFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
F1: TopoDS_Face
tol: double

Return
-------
TopoDS_Edge

Description
-----------
Compute average edge for strip face.
") ComputeSharedEdgeForStripFace;
		TopoDS_Edge ComputeSharedEdgeForStripFace(const TopoDS_Face & F, const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Face & F1, const double tol);

		/****** ShapeFix_FixSmallFace::FixFace ******/
		/****** md5 signature: 4b35b5a540a8001d3a226dac5e26a73f ******/
		%feature("compactdefaultargs") FixFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") FixFace;
		TopoDS_Face FixFace(const TopoDS_Face & F);

		/****** ShapeFix_FixSmallFace::FixPinFace ******/
		/****** md5 signature: 7945b098bf4331785d4984895747e3b0 ******/
		%feature("compactdefaultargs") FixPinFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") FixPinFace;
		bool FixPinFace(TopoDS_Face & F);

		/****** ShapeFix_FixSmallFace::FixShape ******/
		/****** md5 signature: 44130b08f788133d21d1c73f557d186b ******/
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FixShape;
		TopoDS_Shape FixShape();

		/****** ShapeFix_FixSmallFace::FixSplitFace ******/
		/****** md5 signature: 96aa25d52cdd075b2457c6a993bcd878 ******/
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FixSplitFace;
		TopoDS_Shape FixSplitFace(const TopoDS_Shape & S);

		/****** ShapeFix_FixSmallFace::FixSpotFace ******/
		/****** md5 signature: 92fdf1a27d257e6c8e16c7929e436cc0 ******/
		%feature("compactdefaultargs") FixSpotFace;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Fixing case of spot face, if tol = -1 used local tolerance.
") FixSpotFace;
		TopoDS_Shape FixSpotFace();

		/****** ShapeFix_FixSmallFace::FixStripFace ******/
		/****** md5 signature: 9b6a11bad1a9d0eb8b4015ad803fb6bf ******/
		%feature("compactdefaultargs") FixStripFace;
		%feature("autodoc", "
Parameters
----------
wasdone: bool (optional, default to false)

Return
-------
TopoDS_Shape

Description
-----------
Fixing case of strip face, if tol = -1 used local tolerance.
") FixStripFace;
		TopoDS_Shape FixStripFace(const bool wasdone = false);

		/****** ShapeFix_FixSmallFace::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** ShapeFix_FixSmallFace::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Fixing case of spot face.
") Perform;
		void Perform();

		/****** ShapeFix_FixSmallFace::RemoveFacesInCaseOfSpot ******/
		/****** md5 signature: 5007468dba4d85a610a9075176561110 ******/
		%feature("compactdefaultargs") RemoveFacesInCaseOfSpot;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Remove spot face from compound.
") RemoveFacesInCaseOfSpot;
		bool RemoveFacesInCaseOfSpot(const TopoDS_Face & F);

		/****** ShapeFix_FixSmallFace::RemoveFacesInCaseOfStrip ******/
		/****** md5 signature: 293d0dc271ee23fd4127dcfa6275ef2e ******/
		%feature("compactdefaultargs") RemoveFacesInCaseOfStrip;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Remove strip face from compound.
") RemoveFacesInCaseOfStrip;
		bool RemoveFacesInCaseOfStrip(const TopoDS_Face & F);

		/****** ShapeFix_FixSmallFace::ReplaceInCaseOfStrip ******/
		/****** md5 signature: d9acbbd3703242ce786c3377053ed3ae ******/
		%feature("compactdefaultargs") ReplaceInCaseOfStrip;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
tol: double

Return
-------
bool

Description
-----------
Replace veretces and edges.
") ReplaceInCaseOfStrip;
		bool ReplaceInCaseOfStrip(TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const double tol);

		/****** ShapeFix_FixSmallFace::ReplaceVerticesInCaseOfSpot ******/
		/****** md5 signature: 5db906f1f6d12ef6c10753221690c8f5 ******/
		%feature("compactdefaultargs") ReplaceVerticesInCaseOfSpot;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
tol: double

Return
-------
bool

Description
-----------
Compute average vertex and replacing vertices by new one.
") ReplaceVerticesInCaseOfSpot;
		bool ReplaceVerticesInCaseOfSpot(TopoDS_Face & F, const double tol);

		/****** ShapeFix_FixSmallFace::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		TopoDS_Shape Shape();

		/****** ShapeFix_FixSmallFace::SplitOneFace ******/
		/****** md5 signature: e434574f5c9230729900d62e97e9ade6 ******/
		%feature("compactdefaultargs") SplitOneFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
theSplittedFaces: TopoDS_Compound

Return
-------
bool

Description
-----------
Compute data for face splitting.
") SplitOneFace;
		bool SplitOneFace(TopoDS_Face & F, TopoDS_Compound & theSplittedFaces);

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
		/****** ShapeFix_FixSmallSolid::ShapeFix_FixSmallSolid ******/
		/****** md5 signature: 1215e01c3737a0a405527aec5fc9f652 ******/
		%feature("compactdefaultargs") ShapeFix_FixSmallSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Construct.
") ShapeFix_FixSmallSolid;
		 ShapeFix_FixSmallSolid();

		/****** ShapeFix_FixSmallSolid::Merge ******/
		/****** md5 signature: fd2b6b6a765ccb2d560139b9b98ea64d ******/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theContext: ShapeBuild_ReShape

Return
-------
TopoDS_Shape

Description
-----------
Merge small solids in the given shape to adjacent non-small ones.
") Merge;
		TopoDS_Shape Merge(const TopoDS_Shape & theShape, const opencascade::handle<ShapeBuild_ReShape> & theContext);

		/****** ShapeFix_FixSmallSolid::Remove ******/
		/****** md5 signature: 912ec5a31c96f024aa7849c61adc982d ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theContext: ShapeBuild_ReShape

Return
-------
TopoDS_Shape

Description
-----------
Remove small solids from the given shape.
") Remove;
		TopoDS_Shape Remove(const TopoDS_Shape & theShape, const opencascade::handle<ShapeBuild_ReShape> & theContext);

		/****** ShapeFix_FixSmallSolid::SetFixMode ******/
		/****** md5 signature: f540efd1025335d45e7007127160f26c ******/
		%feature("compactdefaultargs") SetFixMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Set working mode for operator: - theMode = 0 use both WidthFactorThreshold and VolumeThreshold parameters - theMode = 1 use only WidthFactorThreshold parameter - theMode = 2 use only VolumeThreshold parameter.
") SetFixMode;
		void SetFixMode(const int theMode);

		/****** ShapeFix_FixSmallSolid::SetVolumeThreshold ******/
		/****** md5 signature: df3c0f0ddde078e9ca4011248943c7e0 ******/
		%feature("compactdefaultargs") SetVolumeThreshold;
		%feature("autodoc", "
Parameters
----------
theThreshold: double (optional, default to -1.0)

Return
-------
None

Description
-----------
Set or clear volume threshold for small solids.
") SetVolumeThreshold;
		void SetVolumeThreshold(const double theThreshold = -1.0);

		/****** ShapeFix_FixSmallSolid::SetWidthFactorThreshold ******/
		/****** md5 signature: ac7c2a8f3536a3b81ccbd28f9c2e85f4 ******/
		%feature("compactdefaultargs") SetWidthFactorThreshold;
		%feature("autodoc", "
Parameters
----------
theThreshold: double (optional, default to -1.0)

Return
-------
None

Description
-----------
Set or clear width factor threshold for small solids.
") SetWidthFactorThreshold;
		void SetWidthFactorThreshold(const double theThreshold = -1.0);

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
		/****** ShapeFix_Shape::ShapeFix_Shape ******/
		/****** md5 signature: 418bd059aea173b18b96d71257c0aa80 ******/
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") ShapeFix_Shape;
		 ShapeFix_Shape();

		/****** ShapeFix_Shape::ShapeFix_Shape ******/
		/****** md5 signature: b98768b62b5b20307ae7e059e41d0723 ******/
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Initislises by shape.
") ShapeFix_Shape;
		 ShapeFix_Shape(const TopoDS_Shape & shape);

		/****** ShapeFix_Shape::FixEdgeTool ******/
		/****** md5 signature: 89a2d8636a7be4b25bc33761daf78b13 ******/
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Edge>

Description
-----------
Returns tool for fixing edges.
") FixEdgeTool;
		opencascade::handle<ShapeFix_Edge> FixEdgeTool();

		/****** ShapeFix_Shape::FixFaceTool ******/
		/****** md5 signature: 1c6766395d685063e9c5c3af8a0ff19d ******/
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Face>

Description
-----------
Returns tool for fixing faces.
") FixFaceTool;
		opencascade::handle<ShapeFix_Face> FixFaceTool();

		/****** ShapeFix_Shape::FixFreeFaceMode ******/
		/****** md5 signature: 4572b87bcd8501f5ac5f59570173132b ******/
		%feature("compactdefaultargs") FixFreeFaceMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying fixes of ShapeFix_Face, by default True.
") FixFreeFaceMode;
		int & FixFreeFaceMode();

		/****** ShapeFix_Shape::FixFreeShellMode ******/
		/****** md5 signature: 9f90bcfdc6d95e770d7c48ed552c3fb3 ******/
		%feature("compactdefaultargs") FixFreeShellMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying fixes of ShapeFix_Shell, by default True.
") FixFreeShellMode;
		int & FixFreeShellMode();

		/****** ShapeFix_Shape::FixFreeWireMode ******/
		/****** md5 signature: 37f16e0785b2a99c0db074ea323d2e03 ******/
		%feature("compactdefaultargs") FixFreeWireMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying fixes of ShapeFix_Wire, by default True.
") FixFreeWireMode;
		int & FixFreeWireMode();

		/****** ShapeFix_Shape::FixSameParameterMode ******/
		/****** md5 signature: 8967dbc7f7bdb1ed4cca3f7e9cad44b3 ******/
		%feature("compactdefaultargs") FixSameParameterMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying ShapeFix::SameParameter after all fixes, by default True.
") FixSameParameterMode;
		int & FixSameParameterMode();

		/****** ShapeFix_Shape::FixShellTool ******/
		/****** md5 signature: cacf7f3f630c3a1f123d40c2897e1f9d ******/
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Shell>

Description
-----------
Returns tool for fixing shells.
") FixShellTool;
		opencascade::handle<ShapeFix_Shell> FixShellTool();

		/****** ShapeFix_Shape::FixSolidMode ******/
		/****** md5 signature: e2953dfafb58b8df6c4f7c725b9227a2 ******/
		%feature("compactdefaultargs") FixSolidMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying fixes of ShapeFix_Solid, by default True.
") FixSolidMode;
		int & FixSolidMode();

		/****** ShapeFix_Shape::FixSolidTool ******/
		/****** md5 signature: e57644ad5d224591291ddd3c8a859f54 ******/
		%feature("compactdefaultargs") FixSolidTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Solid>

Description
-----------
Returns tool for fixing solids.
") FixSolidTool;
		opencascade::handle<ShapeFix_Solid> FixSolidTool();

		/****** ShapeFix_Shape::FixVertexPositionMode ******/
		/****** md5 signature: e57d9a62bbd2a7b642e3fd80767bab0f ******/
		%feature("compactdefaultargs") FixVertexPositionMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying ShapeFix::FixVertexPosition before all fixes, by default False.
") FixVertexPositionMode;
		int & FixVertexPositionMode();

		/****** ShapeFix_Shape::FixVertexTolMode ******/
		/****** md5 signature: d96cf375cfb71caf4edbc8d510c6a6a1 ******/
		%feature("compactdefaultargs") FixVertexTolMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for fixing tolerances of vertices on whole shape after performing all fixes.
") FixVertexTolMode;
		int & FixVertexTolMode();

		/****** ShapeFix_Shape::FixWireTool ******/
		/****** md5 signature: bef1b4e55d9ac1091d5ad9f06a3a442b ******/
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Wire>

Description
-----------
Returns tool for fixing wires.
") FixWireTool;
		opencascade::handle<ShapeFix_Wire> FixWireTool();

		/****** ShapeFix_Shape::Init ******/
		/****** md5 signature: f0a1ccc9828c6324cb0569f2b373e697 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Initislises by shape.
") Init;
		void Init(const TopoDS_Shape & shape);

		/****** ShapeFix_Shape::Perform ******/
		/****** md5 signature: c6a6bb9da370c0c5e2ed1ca653c517d8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Iterates on sub- shape and performs fixes.
") Perform;
		bool Perform(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** ShapeFix_Shape::SetMaxTolerance ******/
		/****** md5 signature: d4049d4b0d6f1aac10769ba029a4e638 ******/
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
Sets maximal allowed tolerance (also to FixSolidTool).
") SetMaxTolerance;
		void SetMaxTolerance(const double maxtol);

		/****** ShapeFix_Shape::SetMinTolerance ******/
		/****** md5 signature: 8d93f49921a21f590a07a25b523da625 ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
mintol: double

Return
-------
None

Description
-----------
Sets minimal allowed tolerance (also to FixSolidTool).
") SetMinTolerance;
		void SetMinTolerance(const double mintol);

		/****** ShapeFix_Shape::SetMsgRegistrator ******/
		/****** md5 signature: f258f9218a75996548e4fc2aee290a82 ******/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "
Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Return
-------
None

Description
-----------
Sets message registrator.
") SetMsgRegistrator;
		void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****** ShapeFix_Shape::SetPrecision ******/
		/****** md5 signature: abd140f84c70b8416a47ddf34a4af5f4 ******/
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
Sets basic precision value (also to FixSolidTool).
") SetPrecision;
		void SetPrecision(const double preci);

		/****** ShapeFix_Shape::Shape ******/
		/****** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns resulting shape.
") Shape;
		TopoDS_Shape Shape();

		/****** ShapeFix_Shape::Status ******/
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
Returns the status of the last Fix. This can be a combination of the following flags: ShapeExtend_DONE1: some free edges were fixed ShapeExtend_DONE2: some free wires were fixed ShapeExtend_DONE3: some free faces were fixed ShapeExtend_DONE4: some free shells were fixed ShapeExtend_DONE5: some free solids were fixed ShapeExtend_DONE6: shapes in compound(s) were fixed.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** ShapeFix_Shell::ShapeFix_Shell ******/
		/****** md5 signature: cbd04a992325d1f7eef085431d2d953b ******/
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeFix_Shell;
		 ShapeFix_Shell();

		/****** ShapeFix_Shell::ShapeFix_Shell ******/
		/****** md5 signature: 27bceb7ec31bb06a7692de93d94f0aa8 ******/
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shell

Return
-------
None

Description
-----------
Initializes by shell.
") ShapeFix_Shell;
		 ShapeFix_Shell(const TopoDS_Shell & shape);

		/****** ShapeFix_Shell::ErrorFaces ******/
		/****** md5 signature: 701e9a7b856fcfb35140db0e67024d33 ******/
		%feature("compactdefaultargs") ErrorFaces;
		%feature("autodoc", "Return
-------
TopoDS_Compound

Description
-----------
Returns not oriented subset of faces.
") ErrorFaces;
		TopoDS_Compound ErrorFaces();

		/****** ShapeFix_Shell::FixFaceMode ******/
		/****** md5 signature: f227085857f34ec5a80655f0e3b9d985 ******/
		%feature("compactdefaultargs") FixFaceMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying fixes of ShapeFix_Face, by default True.
") FixFaceMode;
		int & FixFaceMode();

		/****** ShapeFix_Shell::FixFaceOrientation ******/
		/****** md5 signature: 41d1812249ca6d381868875414d4aa18 ******/
		%feature("compactdefaultargs") FixFaceOrientation;
		%feature("autodoc", "
Parameters
----------
shell: TopoDS_Shell
isAccountMultiConex: bool (optional, default to true)
NonManifold: bool (optional, default to false)

Return
-------
bool

Description
-----------
Fixes orientation of faces in shell. Changes orientation of face in the shell, if it is oriented opposite to neighbouring faces. If it is not possible to orient all faces in the shell (like in case of mebious band), this method orients only subset of faces. Other faces are stored in Error compound. Modes: isAccountMultiConex - mode for account cases of multiconnexity. If this mode is equal to true, separate shells will be created in the cases of multiconnexity. If this mode is equal to false, one shell will be created without account of multiconnexity.By default - true; NonManifold - mode for creation of non-manifold shells. If this mode is equal to true one non-manifold will be created from shell contains multishared edges. Else if this mode is equal to false only manifold shells will be created. By default - false.
") FixFaceOrientation;
		bool FixFaceOrientation(const TopoDS_Shell & shell, const bool isAccountMultiConex = true, const bool NonManifold = false);

		/****** ShapeFix_Shell::FixFaceTool ******/
		/****** md5 signature: 428136b1e2cdf845f0e92b7dfc089c3d ******/
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Face>

Description
-----------
Returns tool for fixing faces.
") FixFaceTool;
		opencascade::handle<ShapeFix_Face> FixFaceTool();

		/****** ShapeFix_Shell::FixOrientationMode ******/
		/****** md5 signature: 86bf9e63ce82b69990ae12b2931e2d9a ******/
		%feature("compactdefaultargs") FixOrientationMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying FixFaceOrientation, by default True.
") FixOrientationMode;
		int & FixOrientationMode();

		/****** ShapeFix_Shell::Init ******/
		/****** md5 signature: 16f5a3fe30686a2f12aa382ba9bcb9bc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
shell: TopoDS_Shell

Return
-------
None

Description
-----------
Initializes by shell.
") Init;
		void Init(const TopoDS_Shell & shell);

		/****** ShapeFix_Shell::NbShells ******/
		/****** md5 signature: 92ae0feca66e23a7b27bf3659e892253 ******/
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Number of obtainrd shells;.
") NbShells;
		int NbShells();

		/****** ShapeFix_Shell::Perform ******/
		/****** md5 signature: c6a6bb9da370c0c5e2ed1ca653c517d8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Iterates on subshapes and performs fixes (for each face calls ShapeFix_Face::Perform and then calls FixFaceOrientation). The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.
") Perform;
		bool Perform(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** ShapeFix_Shell::SetMaxTolerance ******/
		/****** md5 signature: d4049d4b0d6f1aac10769ba029a4e638 ******/
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
Sets maximal allowed tolerance (also to FixWireTool).
") SetMaxTolerance;
		void SetMaxTolerance(const double maxtol);

		/****** ShapeFix_Shell::SetMinTolerance ******/
		/****** md5 signature: 8d93f49921a21f590a07a25b523da625 ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
mintol: double

Return
-------
None

Description
-----------
Sets minimal allowed tolerance (also to FixWireTool).
") SetMinTolerance;
		void SetMinTolerance(const double mintol);

		/****** ShapeFix_Shell::SetMsgRegistrator ******/
		/****** md5 signature: f258f9218a75996548e4fc2aee290a82 ******/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "
Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Return
-------
None

Description
-----------
Sets message registrator.
") SetMsgRegistrator;
		void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****** ShapeFix_Shell::SetNonManifoldFlag ******/
		/****** md5 signature: 120d26b19cdd78cd6ff20aafef4a10ba ******/
		%feature("compactdefaultargs") SetNonManifoldFlag;
		%feature("autodoc", "
Parameters
----------
isNonManifold: bool

Return
-------
None

Description
-----------
Sets NonManifold flag.
") SetNonManifoldFlag;
		virtual void SetNonManifoldFlag(const bool isNonManifold);

		/****** ShapeFix_Shell::SetPrecision ******/
		/****** md5 signature: abd140f84c70b8416a47ddf34a4af5f4 ******/
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
Sets basic precision value (also to FixWireTool).
") SetPrecision;
		void SetPrecision(const double preci);

		/****** ShapeFix_Shell::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
In case of multiconnexity returns compound of fixed shells else returns one shell..
") Shape;
		TopoDS_Shape Shape();

		/****** ShapeFix_Shell::Shell ******/
		/****** md5 signature: 609dd1b8e0ccc93c20eff2a9beafbd4b ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns fixed shell (or subset of oriented faces).
") Shell;
		TopoDS_Shell Shell();

		/****** ShapeFix_Shell::Status ******/
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
Returns the status of the last Fix.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** ShapeFix_Solid::ShapeFix_Solid ******/
		/****** md5 signature: 8d7a890a725929271f1fd5143550f352 ******/
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor;.
") ShapeFix_Solid;
		 ShapeFix_Solid();

		/****** ShapeFix_Solid::ShapeFix_Solid ******/
		/****** md5 signature: e294df30da3ff07d0ec478b1c219ec97 ******/
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "
Parameters
----------
solid: TopoDS_Solid

Return
-------
None

Description
-----------
Initializes by solid.
") ShapeFix_Solid;
		 ShapeFix_Solid(const TopoDS_Solid & solid);

		/****** ShapeFix_Solid::CreateOpenSolidMode ******/
		/****** md5 signature: 357b78fd119b2a17048ba5056d93659d ******/
		%feature("compactdefaultargs") CreateOpenSolidMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the mode for creation of solids. If mode myCreateOpenSolidMode is equal to true solids are created from open shells else solids are created from closed shells only. ShapeFix_Shell, by default False.
") CreateOpenSolidMode;
		bool & CreateOpenSolidMode();

		/****** ShapeFix_Solid::FixShellMode ******/
		/****** md5 signature: 860e14f49789b0b39558c4cf02688186 ******/
		%feature("compactdefaultargs") FixShellMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying fixes of ShapeFix_Shell, by default True.
") FixShellMode;
		int & FixShellMode();

		/****** ShapeFix_Solid::FixShellOrientationMode ******/
		/****** md5 signature: 8d0147bba6de9c8656f05a662f1d2f59 ******/
		%feature("compactdefaultargs") FixShellOrientationMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the mode for applying analysis and fixes of orientation of shells in the solid; by default True.
") FixShellOrientationMode;
		int & FixShellOrientationMode();

		/****** ShapeFix_Solid::FixShellTool ******/
		/****** md5 signature: 6ba0e8439a28f3eb9566dba885f1ccc8 ******/
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Shell>

Description
-----------
Returns tool for fixing shells.
") FixShellTool;
		opencascade::handle<ShapeFix_Shell> FixShellTool();

		/****** ShapeFix_Solid::Init ******/
		/****** md5 signature: f4cc4e066cfaa51a08d33cbbc31252d1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
solid: TopoDS_Solid

Return
-------
None

Description
-----------
Initializes by solid .
") Init;
		virtual void Init(const TopoDS_Solid & solid);

		/****** ShapeFix_Solid::Perform ******/
		/****** md5 signature: 86229bc8676ce94098c6f428ec42736e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Iterates on shells and performs fixes (calls ShapeFix_Shell for each subshell). The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.
") Perform;
		virtual bool Perform(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** ShapeFix_Solid::SetMaxTolerance ******/
		/****** md5 signature: d4049d4b0d6f1aac10769ba029a4e638 ******/
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
Sets maximal allowed tolerance (also to FixShellTool).
") SetMaxTolerance;
		void SetMaxTolerance(const double maxtol);

		/****** ShapeFix_Solid::SetMinTolerance ******/
		/****** md5 signature: 8d93f49921a21f590a07a25b523da625 ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
mintol: double

Return
-------
None

Description
-----------
Sets minimal allowed tolerance (also to FixShellTool).
") SetMinTolerance;
		void SetMinTolerance(const double mintol);

		/****** ShapeFix_Solid::SetMsgRegistrator ******/
		/****** md5 signature: f258f9218a75996548e4fc2aee290a82 ******/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "
Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Return
-------
None

Description
-----------
Sets message registrator.
") SetMsgRegistrator;
		void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****** ShapeFix_Solid::SetPrecision ******/
		/****** md5 signature: abd140f84c70b8416a47ddf34a4af5f4 ******/
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
Sets basic precision value (also to FixShellTool).
") SetPrecision;
		void SetPrecision(const double preci);

		/****** ShapeFix_Solid::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
In case of multiconnexity returns compound of fixed solids else returns one solid.
") Shape;
		TopoDS_Shape Shape();

		/****** ShapeFix_Solid::Solid ******/
		/****** md5 signature: c426390f4c3ad398e07f49b2a70eecdd ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns resulting solid.
") Solid;
		TopoDS_Shape Solid();

		/****** ShapeFix_Solid::SolidFromShell ******/
		/****** md5 signature: a30f21e58117c87b7d8d8a857b45a94a ******/
		%feature("compactdefaultargs") SolidFromShell;
		%feature("autodoc", "
Parameters
----------
shell: TopoDS_Shell

Return
-------
TopoDS_Solid

Description
-----------
Calls MakeSolid and orients the solid to be 'not infinite'.
") SolidFromShell;
		TopoDS_Solid SolidFromShell(const TopoDS_Shell & shell);

		/****** ShapeFix_Solid::Status ******/
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
Returns the status of the last Fix.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** ShapeFix_SplitCommonVertex::ShapeFix_SplitCommonVertex ******/
		/****** md5 signature: 81156f27849d973083b8d8d2bd53004b ******/
		%feature("compactdefaultargs") ShapeFix_SplitCommonVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_SplitCommonVertex;
		 ShapeFix_SplitCommonVertex();

		/****** ShapeFix_SplitCommonVertex::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** ShapeFix_SplitCommonVertex::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** ShapeFix_SplitCommonVertex::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/****** ShapeFix_Wire::ShapeFix_Wire ******/
		/****** md5 signature: 0077bd6b4ffeb01fde948bf7107a6e6d ******/
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor, creates clear object with default flags.
") ShapeFix_Wire;
		 ShapeFix_Wire();

		/****** ShapeFix_Wire::ShapeFix_Wire ******/
		/****** md5 signature: bc97c2e024d7bee1566566bfbb49b6fe ******/
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
prec: double

Return
-------
None

Description
-----------
Create new object with default flags and prepare it for use (Loads analyzer with all the data for the wire and face).
") ShapeFix_Wire;
		 ShapeFix_Wire(const TopoDS_Wire & wire, const TopoDS_Face & face, const double prec);

		/****** ShapeFix_Wire::Analyzer ******/
		/****** md5 signature: 8cf283646b5d59870660ef74b5c32df7 ******/
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeAnalysis_Wire>

Description
-----------
returns field Analyzer (working tool).
") Analyzer;
		opencascade::handle<ShapeAnalysis_Wire> Analyzer();

		/****** ShapeFix_Wire::ClearModes ******/
		/****** md5 signature: 542f30be660211907f6936f03139ba7f ******/
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets all modes to default.
") ClearModes;
		void ClearModes();

		/****** ShapeFix_Wire::ClearStatuses ******/
		/****** md5 signature: a36409698de6df03133c5f14bec35cf8 ******/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all statuses.
") ClearStatuses;
		void ClearStatuses();

		/****** ShapeFix_Wire::ClosedWireMode ******/
		/****** md5 signature: 6b82952699cc1a13e860e0608bf3e84f ******/
		%feature("compactdefaultargs") ClosedWireMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether the wire is to be closed (by calling methods like FixDegenerated() and FixConnected() for last and first edges).
") ClosedWireMode;
		bool & ClosedWireMode();

		/****** ShapeFix_Wire::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
returns working face (Analyzer.Face()).
") Face;
		const TopoDS_Face Face();

		/****** ShapeFix_Wire::FixAddCurve3dMode ******/
		/****** md5 signature: 1bef8f9d0f8995a218c02537c22faa5a ******/
		%feature("compactdefaultargs") FixAddCurve3dMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixAddCurve3dMode;
		int & FixAddCurve3dMode();

		/****** ShapeFix_Wire::FixAddPCurveMode ******/
		/****** md5 signature: e0fe132b0095b26cbeaf7a965cc6bce5 ******/
		%feature("compactdefaultargs") FixAddPCurveMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixAddPCurveMode;
		int & FixAddPCurveMode();

		/****** ShapeFix_Wire::FixClosed ******/
		/****** md5 signature: 4f21bff867c537edea096eb1542b6483 ******/
		%feature("compactdefaultargs") FixClosed;
		%feature("autodoc", "
Parameters
----------
prec: double (optional, default to -1.0)

Return
-------
bool

Description
-----------
Fixes a wire to be well closed It performs FixConnected, FixDegenerated and FixLacking between last and first edges (independingly on flag ClosedMode and modes for these fixings) If <prec> is -1 then MaxTolerance() is taken.
") FixClosed;
		bool FixClosed(const double prec = -1.0);

		/****** ShapeFix_Wire::FixConnected ******/
		/****** md5 signature: 792a6919f5f976ae560c8593975501c3 ******/
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "
Parameters
----------
prec: double (optional, default to -1.0)

Return
-------
bool

Description
-----------
Applies FixConnected(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True If <prec> is -1 then MaxTolerance() is taken.
") FixConnected;
		bool FixConnected(const double prec = -1.0);

		/****** ShapeFix_Wire::FixConnected ******/
		/****** md5 signature: 8e4f2beeb89834da3f3d645e2f499ef3 ******/
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "
Parameters
----------
num: int
prec: double

Return
-------
bool

Description
-----------
Fixes connected edges (preceding and current) Forces Vertices (end of preceding-begin of current) to be the same one Tests with starting preci or, if given greater, <prec> If <prec> is -1 then MaxTolerance() is taken.
") FixConnected;
		bool FixConnected(const int num, const double prec);

		/****** ShapeFix_Wire::FixConnectedMode ******/
		/****** md5 signature: 7d1b4f0193b21560e61c0d71cff62dcf ******/
		%feature("compactdefaultargs") FixConnectedMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixConnectedMode;
		int & FixConnectedMode();

		/****** ShapeFix_Wire::FixDegenerated ******/
		/****** md5 signature: 9bcffcdddcefb73be85adcf223704006 ******/
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Applies FixDegenerated(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True.
") FixDegenerated;
		bool FixDegenerated();

		/****** ShapeFix_Wire::FixDegenerated ******/
		/****** md5 signature: dba9d3d676f8e211fffce1af7b0fb9fc ******/
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Fixes Degenerated Edge Checks an <num-th> edge or a point between <num>th-1 and <num>th edges for a singularity on a supporting surface. If singularity is detected, either adds new degenerated edge (before <num>th), or makes <num>th edge to be degenerated.
") FixDegenerated;
		bool FixDegenerated(const int num);

		/****** ShapeFix_Wire::FixDegeneratedMode ******/
		/****** md5 signature: cffb25bc6b13a74d7f20263554899664 ******/
		%feature("compactdefaultargs") FixDegeneratedMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixDegeneratedMode;
		int & FixDegeneratedMode();

		/****** ShapeFix_Wire::FixEdgeCurves ******/
		/****** md5 signature: aa8a12085ed152e39f2e123ada52565f ******/
		%feature("compactdefaultargs") FixEdgeCurves;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Groups the fixes dealing with 3d and pcurves of the edges. The order of the fixes and the default behaviour are: ShapeFix_Edge::FixReversed2d ShapeFix_Edge::FixRemovePCurve (only if forced) ShapeFix_Edge::FixAddPCurve ShapeFix_Edge::FixRemoveCurve3d (only if forced) ShapeFix_Edge::FixAddCurve3d FixSeam, FixShifted, ShapeFix_Edge::FixSameParameter.
") FixEdgeCurves;
		bool FixEdgeCurves();

		/****** ShapeFix_Wire::FixEdgeCurvesMode ******/
		/****** md5 signature: 5a81e71accd6e332d1f11351c45320fc ******/
		%feature("compactdefaultargs") FixEdgeCurvesMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixEdgeCurvesMode;
		int & FixEdgeCurvesMode();

		/****** ShapeFix_Wire::FixEdgeTool ******/
		/****** md5 signature: 89a2d8636a7be4b25bc33761daf78b13 ******/
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeFix_Edge>

Description
-----------
Returns tool for fixing wires.
") FixEdgeTool;
		opencascade::handle<ShapeFix_Edge> FixEdgeTool();

		/****** ShapeFix_Wire::FixGap2d ******/
		/****** md5 signature: a761279c2d46196d60d7a6b8c759d031 ******/
		%feature("compactdefaultargs") FixGap2d;
		%feature("autodoc", "
Parameters
----------
num: int
convert: bool (optional, default to false)

Return
-------
bool

Description
-----------
Fixes gap between ends of pcurves on num-1 and num-th edges. myPrecision is used to detect the gap. If convert is True, converts pcurves to bsplines to bend.
") FixGap2d;
		bool FixGap2d(const int num, const bool convert = false);

		/****** ShapeFix_Wire::FixGap3d ******/
		/****** md5 signature: 225e7652a7eb268bffc4cd72aa866e2e ******/
		%feature("compactdefaultargs") FixGap3d;
		%feature("autodoc", "
Parameters
----------
num: int
convert: bool (optional, default to false)

Return
-------
bool

Description
-----------
Fixes gap between ends of 3d curves on num-1 and num-th edges. myPrecision is used to detect the gap. If convert is True, converts curves to bsplines to bend.
") FixGap3d;
		bool FixGap3d(const int num, const bool convert = false);

		/****** ShapeFix_Wire::FixGaps2d ******/
		/****** md5 signature: 4648c1a31ef5d1710e7257b0c8b40d06 ******/
		%feature("compactdefaultargs") FixGaps2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fixes gaps between ends of pcurves on adjacent edges myPrecision is used to detect the gaps.
") FixGaps2d;
		bool FixGaps2d();

		/****** ShapeFix_Wire::FixGaps2dMode ******/
		/****** md5 signature: f0e2db86f1b2b46d8fa0b2381bcb7779 ******/
		%feature("compactdefaultargs") FixGaps2dMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the flag for corresponding Fix..() method which defines whether this method will be called from the method APIFix(): -1 default 1 method will be called 0 method will not be called.
") FixGaps2dMode;
		int & FixGaps2dMode();

		/****** ShapeFix_Wire::FixGaps3d ******/
		/****** md5 signature: 7cd749f3d0c17a0b3dd78e26642923f4 ******/
		%feature("compactdefaultargs") FixGaps3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fixes gaps between ends of 3d curves on adjacent edges myPrecision is used to detect the gaps.
") FixGaps3d;
		bool FixGaps3d();

		/****** ShapeFix_Wire::FixGaps3dMode ******/
		/****** md5 signature: fc0ddac72b00ca52fa88a80be6b855ef ******/
		%feature("compactdefaultargs") FixGaps3dMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixGaps3dMode;
		int & FixGaps3dMode();

		/****** ShapeFix_Wire::FixGapsByRangesMode ******/
		/****** md5 signature: 4e6e760d67ebe5b501f4b5f1e5f58115 ******/
		%feature("compactdefaultargs") FixGapsByRangesMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether tool tries to fix gaps first by changing curves ranges (i.e. using intersection, extrema, projections) or not.
") FixGapsByRangesMode;
		bool & FixGapsByRangesMode();

		/****** ShapeFix_Wire::FixIntersectingEdgesMode ******/
		/****** md5 signature: 26390dd8bb776f3db1ae8c47db65973a ******/
		%feature("compactdefaultargs") FixIntersectingEdgesMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixIntersectingEdgesMode;
		int & FixIntersectingEdgesMode();

		/****** ShapeFix_Wire::FixLacking ******/
		/****** md5 signature: 04671f7e31b3c202f87afe26193ec291 ******/
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "
Parameters
----------
force: bool (optional, default to false)

Return
-------
bool

Description
-----------
Applies FixLacking(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True If <force> is False (default), test for connectness is done with precision of vertex between edges, else it is done with minimal value of vertex tolerance and Analyzer.Precision(). Hence, <force> will lead to inserting lacking edges in replacement of vertices which have big tolerances.
") FixLacking;
		bool FixLacking(const bool force = false);

		/****** ShapeFix_Wire::FixLacking ******/
		/****** md5 signature: 67f65916a962ce6af931356b62cd005c ******/
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "
Parameters
----------
num: int
force: bool (optional, default to false)

Return
-------
bool

Description
-----------
Fixes Lacking Edge Test if two adjucent edges are disconnected in 2d (while connected in 3d), and in that case either increase tolerance of the vertex or add a new edge (straight in 2d space), in order to close wire in 2d. Returns True if edge was added or tolerance was increased.
") FixLacking;
		bool FixLacking(const int num, const bool force = false);

		/****** ShapeFix_Wire::FixLackingMode ******/
		/****** md5 signature: 81029c09c5d9b9ad47e8ccd93d8ed998 ******/
		%feature("compactdefaultargs") FixLackingMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixLackingMode;
		int & FixLackingMode();

		/****** ShapeFix_Wire::FixNonAdjacentIntersectingEdgesMode ******/
		/****** md5 signature: 40c105e1455ab68b083eb8f65b92aafe ******/
		%feature("compactdefaultargs") FixNonAdjacentIntersectingEdgesMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the flag for corresponding Fix..() method which defines whether this method will be called from the corresponding Fix..() method of the public level: -1 default 1 method will be called 0 method will not be called.
") FixNonAdjacentIntersectingEdgesMode;
		int & FixNonAdjacentIntersectingEdgesMode();

		/****** ShapeFix_Wire::FixNotchedEdges ******/
		/****** md5 signature: f5328b7a3739116e53bccc96bc33c928 ******/
		%feature("compactdefaultargs") FixNotchedEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FixNotchedEdges;
		bool FixNotchedEdges();

		/****** ShapeFix_Wire::FixNotchedEdgesMode ******/
		/****** md5 signature: f569fc077080dcd706c425125a3281a9 ******/
		%feature("compactdefaultargs") FixNotchedEdgesMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixNotchedEdgesMode;
		int & FixNotchedEdgesMode();

		/****** ShapeFix_Wire::FixRemoveCurve3dMode ******/
		/****** md5 signature: 908ff62b336bb70f7b973d19d7d0a572 ******/
		%feature("compactdefaultargs") FixRemoveCurve3dMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixRemoveCurve3dMode;
		int & FixRemoveCurve3dMode();

		/****** ShapeFix_Wire::FixRemovePCurveMode ******/
		/****** md5 signature: 2b6e794cebe710bd431817e26f3dd244 ******/
		%feature("compactdefaultargs") FixRemovePCurveMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixRemovePCurveMode;
		int & FixRemovePCurveMode();

		/****** ShapeFix_Wire::FixReorder ******/
		/****** md5 signature: 15a9554766f776bd5257c3d9e93073b7 ******/
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "
Parameters
----------
theModeBoth: bool (optional, default to false)

Return
-------
bool

Description
-----------
Performs an analysis and reorders edges in the wire using class WireOrder. Flag <theModeBoth> determines the use of miscible mode if necessary.
") FixReorder;
		bool FixReorder(bool theModeBoth = false);

		/****** ShapeFix_Wire::FixReorder ******/
		/****** md5 signature: 13cadb9944c226ed3cf9a07cc4fd7ec7 ******/
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "
Parameters
----------
wi: ShapeAnalysis_WireOrder

Return
-------
bool

Description
-----------
Reorder edges in the wire as determined by WireOrder that should be filled and computed before.
") FixReorder;
		bool FixReorder(const ShapeAnalysis_WireOrder & wi);

		/****** ShapeFix_Wire::FixReorderMode ******/
		/****** md5 signature: 72f5b92e6534842a3b95e973702425c2 ******/
		%feature("compactdefaultargs") FixReorderMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixReorderMode;
		int & FixReorderMode();

		/****** ShapeFix_Wire::FixReversed2dMode ******/
		/****** md5 signature: 6ea1297ccfd4c2f069da99f0f8986bf5 ******/
		%feature("compactdefaultargs") FixReversed2dMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixReversed2dMode;
		int & FixReversed2dMode();

		/****** ShapeFix_Wire::FixSameParameterMode ******/
		/****** md5 signature: 8967dbc7f7bdb1ed4cca3f7e9cad44b3 ******/
		%feature("compactdefaultargs") FixSameParameterMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixSameParameterMode;
		int & FixSameParameterMode();

		/****** ShapeFix_Wire::FixSeam ******/
		/****** md5 signature: ae27db772ddc75bbae611022b7192488 ******/
		%feature("compactdefaultargs") FixSeam;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Fixes a seam edge A Seam edge has two pcurves, one for forward. one for reversed The forward pcurve must be set as first //! NOTE that correct order of pcurves in the seam edge depends on its orientation (i.e., on orientation of the wire, method of exploration of edges etc.). Since wire represented by the ShapeExtend_WireData is always forward (orientation is accounted by edges), it will work correct if: 1. Wire created from ShapeExtend_WireData with methods ShapeExtend_WireData::Wire..() is added into the FORWARD face (orientation can be applied later) 2. Wire is extracted from the face with orientation not composed with orientation of the face.
") FixSeam;
		bool FixSeam(const int num);

		/****** ShapeFix_Wire::FixSeamMode ******/
		/****** md5 signature: 2bd183b6828c023229487fd666adbf9b ******/
		%feature("compactdefaultargs") FixSeamMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixSeamMode;
		int & FixSeamMode();

		/****** ShapeFix_Wire::FixSelfIntersectingEdgeMode ******/
		/****** md5 signature: 80f987c8aa605e0ffb6c6964ced750e2 ******/
		%feature("compactdefaultargs") FixSelfIntersectingEdgeMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixSelfIntersectingEdgeMode;
		int & FixSelfIntersectingEdgeMode();

		/****** ShapeFix_Wire::FixSelfIntersection ******/
		/****** md5 signature: c5f36da27df4b982f9024a7c96e72c85 ******/
		%feature("compactdefaultargs") FixSelfIntersection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Applies FixSelfIntersectingEdge(num) and FixIntersectingEdges(num) to all edges in the wire and FixIntersectingEdges(num1, num2) for all pairs num1 and num2 such that num2 >= num1 + 2 and removes wrong edges if any.
") FixSelfIntersection;
		bool FixSelfIntersection();

		/****** ShapeFix_Wire::FixSelfIntersectionMode ******/
		/****** md5 signature: b8ce68270ececaeac0a7990cf6463dcf ******/
		%feature("compactdefaultargs") FixSelfIntersectionMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixSelfIntersectionMode;
		int & FixSelfIntersectionMode();

		/****** ShapeFix_Wire::FixShifted ******/
		/****** md5 signature: 8d9ff0c99d661619cee9547f4669f26c ******/
		%feature("compactdefaultargs") FixShifted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fixes edges which have pcurves shifted by whole parameter range on the closed surface (the case may occur if pcurve of edge was computed by projecting 3d curve, which goes along the seam). It compares each two consequent edges and tries to connect them if distance between ends is near to range of the surface. It also can detect and fix the case if all pcurves are connected, but lie out of parametric bounds of the surface. In addition to FixShifted from ShapeFix_Wire, more sophisticated check of degenerate points is performed, and special cases like sphere given by two meridians are treated.
") FixShifted;
		bool FixShifted();

		/****** ShapeFix_Wire::FixShiftedMode ******/
		/****** md5 signature: f474b5e54d65cad224d582360e112335 ******/
		%feature("compactdefaultargs") FixShiftedMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixShiftedMode;
		int & FixShiftedMode();

		/****** ShapeFix_Wire::FixSmall ******/
		/****** md5 signature: daf84810bf108bd0debdb941aa8b74c1 ******/
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "
Parameters
----------
lockvtx: bool
precsmall: double (optional, default to 0.0)

Return
-------
int

Description
-----------
Applies FixSmall(num) to all edges in the wire.
") FixSmall;
		int FixSmall(const bool lockvtx, const double precsmall = 0.0);

		/****** ShapeFix_Wire::FixSmall ******/
		/****** md5 signature: 6fe378a080fc80d0854b9b8e6908a70c ******/
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "
Parameters
----------
num: int
lockvtx: bool
precsmall: double

Return
-------
bool

Description
-----------
Fixes Null Length Edge to be removed If an Edge has Null Length (regarding preci, or <precsmall> - what is smaller), it should be removed It can be with no problem if its two vertices are the same Else, if lockvtx is False, it is removed and its end vertex is put on the preceding edge But if lockvtx is True, this edge must be kept ...
") FixSmall;
		bool FixSmall(const int num, const bool lockvtx, const double precsmall);

		/****** ShapeFix_Wire::FixSmallMode ******/
		/****** md5 signature: cd00e4a007154936fd10423b4e0b098f ******/
		%feature("compactdefaultargs") FixSmallMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixSmallMode;
		int & FixSmallMode();

		/****** ShapeFix_Wire::FixTailMode ******/
		/****** md5 signature: b06d4f1c4e7ab93278d94bcc6b68f6c5 ******/
		%feature("compactdefaultargs") FixTailMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixTailMode;
		int & FixTailMode();

		/****** ShapeFix_Wire::FixTails ******/
		/****** md5 signature: 5602fde73e11676ad89309753c7fc220 ******/
		%feature("compactdefaultargs") FixTails;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FixTails;
		bool FixTails();

		/****** ShapeFix_Wire::FixVertexToleranceMode ******/
		/****** md5 signature: 3d03c1e90d26e582242718d25c992b71 ******/
		%feature("compactdefaultargs") FixVertexToleranceMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FixVertexToleranceMode;
		int & FixVertexToleranceMode();

		/****** ShapeFix_Wire::Init ******/
		/****** md5 signature: ba52719c82cae7fafba5c7ab88e4a74a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
face: TopoDS_Face
prec: double

Return
-------
None

Description
-----------
Load analyzer with all the data for the wire and face and drops all fixing statuses.
") Init;
		void Init(const TopoDS_Wire & wire, const TopoDS_Face & face, const double prec);

		/****** ShapeFix_Wire::Init ******/
		/****** md5 signature: dcd292e408c7ae6f48c04414145d7558 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
saw: ShapeAnalysis_Wire

Return
-------
None

Description
-----------
Load analyzer with all the data already prepared and drops all fixing statuses If analyzer contains face, there is no need to set it by SetFace or SetSurface.
") Init;
		void Init(const opencascade::handle<ShapeAnalysis_Wire> & saw);

		/****** ShapeFix_Wire::IsLoaded ******/
		/****** md5 signature: fc2ce1bc5ddcb407c056c0f8bbdeface ******/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the wire is loaded.
") IsLoaded;
		bool IsLoaded();

		/****** ShapeFix_Wire::IsReady ******/
		/****** md5 signature: c55402f1e031fb2faa07c9375fee061b ******/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the wire and face are loaded.
") IsReady;
		bool IsReady();

		/****** ShapeFix_Wire::LastFixStatus ******/
		/****** md5 signature: 4812e3335e759dacba0f3b0926ce749a ******/
		%feature("compactdefaultargs") LastFixStatus;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Queries the status of last call to methods Fix... of advanced level For details see corresponding methods; universal statuses are: OK: problem not detected; nothing done DONE: problem was detected and successfully fixed FAIL: problem cannot be fixed.
") LastFixStatus;
		bool LastFixStatus(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::Load ******/
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
Load data for the wire, and drops all fixing statuses.
") Load;
		void Load(const TopoDS_Wire & wire);

		/****** ShapeFix_Wire::Load ******/
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
Load data for the wire, and drops all fixing statuses.
") Load;
		void Load(const opencascade::handle<ShapeExtend_WireData> & sbwd);

		/****** ShapeFix_Wire::ModifyGeometryMode ******/
		/****** md5 signature: 558958a2021c4ecae3d1c2025611ac49 ******/
		%feature("compactdefaultargs") ModifyGeometryMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether the Fix..() methods are allowed to modify geometry of the edges and vertices.
") ModifyGeometryMode;
		bool & ModifyGeometryMode();

		/****** ShapeFix_Wire::ModifyRemoveLoopMode ******/
		/****** md5 signature: c75f75e7ac00ec7177bc2b8410344e7c ******/
		%feature("compactdefaultargs") ModifyRemoveLoopMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the flag which defines whether the Fix..() methods are allowed to modify RemoveLoop of the edges.
") ModifyRemoveLoopMode;
		int & ModifyRemoveLoopMode();

		/****** ShapeFix_Wire::ModifyTopologyMode ******/
		/****** md5 signature: 8d1f6fa2d099341fac17a8080a04340f ******/
		%feature("compactdefaultargs") ModifyTopologyMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether it is allowed to modify topology of the wire during fixing (adding/removing edges etc.).
") ModifyTopologyMode;
		bool & ModifyTopologyMode();

		/****** ShapeFix_Wire::NbEdges ******/
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns number of edges in the working wire.
") NbEdges;
		int NbEdges();

		/****** ShapeFix_Wire::Perform ******/
		/****** md5 signature: 836e5d294e107797e3a08ad4bfbbad29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method performs all the available fixes. If some fix is turned on or off explicitly by the Fix..Mode() flag, this fix is either called or not depending on that flag. Else (i.e. if flag is default) fix is called depending on the situation: some fixes are not called or are limited if order of edges in the wire is not OK, or depending on modes //! The order of the fixes and default behaviour of Perform() are: FixReorder FixSmall (with lockvtx true if ! TopoMode or if wire is not ordered) FixConnected (if wire is ordered) FixEdgeCurves (without FixShifted if wire is not ordered) FixDegenerated (if wire is ordered) FixSelfIntersection (if wire is ordered and ClosedMode is True) FixLacking (if wire is ordered).
") Perform;
		bool Perform();

		/****** ShapeFix_Wire::PreferencePCurveMode ******/
		/****** md5 signature: 93057f8f14ac1ed03582c0a22b1a70c9 ******/
		%feature("compactdefaultargs") PreferencePCurveMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) the flag which defines whether the 2d (True) representation of the wire is preferable over 3d one (in the case of ambiguity in FixEdgeCurves).
") PreferencePCurveMode;
		bool & PreferencePCurveMode();

		/****** ShapeFix_Wire::SetFace ******/
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
Set working face for the wire.
") SetFace;
		void SetFace(const TopoDS_Face & face);

		/****** ShapeFix_Wire::SetFace ******/
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
Set working face for the wire and surface analysis object.
") SetFace;
		void SetFace(const TopoDS_Face & theFace, const opencascade::handle<ShapeAnalysis_Surface> & theSurfaceAnalysis);

		/****** ShapeFix_Wire::SetMaxTailAngle ******/
		/****** md5 signature: 92d3e63b87875322a79219b710709e93 ******/
		%feature("compactdefaultargs") SetMaxTailAngle;
		%feature("autodoc", "
Parameters
----------
theMaxTailAngle: double

Return
-------
None

Description
-----------
Sets the maximal allowed angle of the tails in radians.
") SetMaxTailAngle;
		void SetMaxTailAngle(const double theMaxTailAngle);

		/****** ShapeFix_Wire::SetMaxTailWidth ******/
		/****** md5 signature: 3468532afb476da8e313eff1b3a12618 ******/
		%feature("compactdefaultargs") SetMaxTailWidth;
		%feature("autodoc", "
Parameters
----------
theMaxTailWidth: double

Return
-------
None

Description
-----------
Sets the maximal allowed width of the tails.
") SetMaxTailWidth;
		void SetMaxTailWidth(const double theMaxTailWidth);

		/****** ShapeFix_Wire::SetPrecision ******/
		/****** md5 signature: de2479a9bd7c0016ebc1d0fbb938abf2 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
prec: double

Return
-------
None

Description
-----------
Set working precision (to root and to analyzer).
") SetPrecision;
		void SetPrecision(const double prec);

		/****** ShapeFix_Wire::SetSurface ******/
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
Set surface analysis for the wire.
") SetSurface;
		void SetSurface(const opencascade::handle<ShapeAnalysis_Surface> & theSurfaceAnalysis);

		/****** ShapeFix_Wire::SetSurface ******/
		/****** md5 signature: ef3c30882af3f3cdd5459f6b9a1a3525 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
surf: Geom_Surface

Return
-------
None

Description
-----------
Set surface for the wire.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surf);

		/****** ShapeFix_Wire::SetSurface ******/
		/****** md5 signature: b778304d2c3516cd661f9fd2b5dfeed7 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
surf: Geom_Surface
loc: TopLoc_Location

Return
-------
None

Description
-----------
Set surface for the wire.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surf, const TopLoc_Location & loc);

		/****** ShapeFix_Wire::StatusClosed ******/
		/****** md5 signature: 25bafa024af2fc11cb27a8ac610a19b8 ******/
		%feature("compactdefaultargs") StatusClosed;
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
") StatusClosed;
		bool StatusClosed(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusConnected ******/
		/****** md5 signature: c5ddd7de28534aec0c35ccd746c29747 ******/
		%feature("compactdefaultargs") StatusConnected;
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
") StatusConnected;
		bool StatusConnected(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusDegenerated ******/
		/****** md5 signature: 830f4427a84c562451f05c5d3c57d517 ******/
		%feature("compactdefaultargs") StatusDegenerated;
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
") StatusDegenerated;
		bool StatusDegenerated(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusEdgeCurves ******/
		/****** md5 signature: 5e3c87b202ce0097742113026303e254 ******/
		%feature("compactdefaultargs") StatusEdgeCurves;
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
") StatusEdgeCurves;
		bool StatusEdgeCurves(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusFixTails ******/
		/****** md5 signature: 9447734e7318d570d8a66449e0b097ae ******/
		%feature("compactdefaultargs") StatusFixTails;
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
") StatusFixTails;
		bool StatusFixTails(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusGaps2d ******/
		/****** md5 signature: 69c52c08e3bca0fbf68a1f155c236295 ******/
		%feature("compactdefaultargs") StatusGaps2d;
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
") StatusGaps2d;
		bool StatusGaps2d(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusGaps3d ******/
		/****** md5 signature: 51c67c005b614b43ae947faa11825ef8 ******/
		%feature("compactdefaultargs") StatusGaps3d;
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
") StatusGaps3d;
		bool StatusGaps3d(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusLacking ******/
		/****** md5 signature: c84868dcf3f6380c07cf572efe82cd2b ******/
		%feature("compactdefaultargs") StatusLacking;
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
") StatusLacking;
		bool StatusLacking(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusNotches ******/
		/****** md5 signature: 8bdaae911da2b6737814d0bdb768242c ******/
		%feature("compactdefaultargs") StatusNotches;
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
") StatusNotches;
		bool StatusNotches(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusRemovedSegment ******/
		/****** md5 signature: eb28ef7de9e5795fbc9e1b8231876c86 ******/
		%feature("compactdefaultargs") StatusRemovedSegment;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Querying the status of performed API fixing procedures Each Status..() methods gives information about the last call to the corresponding Fix..() method of API level: OK: no problems detected; nothing done DONE: some problem(s) was(were) detected and successfully fixed FAIL: some problem(s) cannot be fixed.
") StatusRemovedSegment;
		bool StatusRemovedSegment();

		/****** ShapeFix_Wire::StatusReorder ******/
		/****** md5 signature: 611643db6118be9e74411b054082c182 ******/
		%feature("compactdefaultargs") StatusReorder;
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
") StatusReorder;
		bool StatusReorder(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusSelfIntersection ******/
		/****** md5 signature: 524de3c8347db23980b2c217028e8006 ******/
		%feature("compactdefaultargs") StatusSelfIntersection;
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
") StatusSelfIntersection;
		bool StatusSelfIntersection(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::StatusSmall ******/
		/****** md5 signature: 39864f93f64adc8bb8a7fbbc7ce24c9a ******/
		%feature("compactdefaultargs") StatusSmall;
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
") StatusSmall;
		bool StatusSmall(const ShapeExtend_Status status);

		/****** ShapeFix_Wire::Wire ******/
		/****** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Makes the resulting Wire (by basic Brep_Builder).
") Wire;
		TopoDS_Wire Wire();

		/****** ShapeFix_Wire::WireAPIMake ******/
		/****** md5 signature: ee7817a9b0126700bae42396160d62de ******/
		%feature("compactdefaultargs") WireAPIMake;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Makes the resulting Wire (by BRepAPI_MakeWire).
") WireAPIMake;
		TopoDS_Wire WireAPIMake();

		/****** ShapeFix_Wire::WireData ******/
		/****** md5 signature: c8792f073dea4df1af697814fbf5f311 ******/
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_WireData>

Description
-----------
returns working wire.
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
		/****** ShapeFix_Wireframe::ShapeFix_Wireframe ******/
		/****** md5 signature: b9eeed4d99b50c144520663cc22c8fe2 ******/
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_Wireframe;
		 ShapeFix_Wireframe();

		/****** ShapeFix_Wireframe::ShapeFix_Wireframe ******/
		/****** md5 signature: 628dc98f08ade249b97eefc6cbfa57cc ******/
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") ShapeFix_Wireframe;
		 ShapeFix_Wireframe(const TopoDS_Shape & shape);

		/****** ShapeFix_Wireframe::CheckSmallEdges ******/
		/****** md5 signature: f2b11ca8af37d04c3830714ca4c3b230 ******/
		%feature("compactdefaultargs") CheckSmallEdges;
		%feature("autodoc", "
Parameters
----------
theSmallEdges: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>
theEdgeToFaces: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
theFaceWithSmall: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
theMultyEdges: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>

Return
-------
bool

Description
-----------
Auxiliary tool for FixSmallEdges which checks for small edges and fills the maps. Returns True if at least one small edge has been found.
") CheckSmallEdges;
		bool CheckSmallEdges(NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & theSmallEdges, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & theEdgeToFaces, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & theFaceWithSmall, NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & theMultyEdges);

		/****** ShapeFix_Wireframe::ClearStatuses ******/
		/****** md5 signature: 8279d01a949362ea8fada8f9fd40957d ******/
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all statuses.
") ClearStatuses;
		virtual void ClearStatuses();

		/****** ShapeFix_Wireframe::FixSmallEdges ******/
		/****** md5 signature: e40f092eb632f265d86a4b5bf82669d1 ******/
		%feature("compactdefaultargs") FixSmallEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fixes small edges in shape by merging adjacent edges If precision is 0.0, uses Precision::Confusion().
") FixSmallEdges;
		bool FixSmallEdges();

		/****** ShapeFix_Wireframe::FixWireGaps ******/
		/****** md5 signature: b52996f759138fe16a74da5acf04e20d ******/
		%feature("compactdefaultargs") FixWireGaps;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Fixes gaps between ends of curves of adjacent edges (both 3d and pcurves) in wires If precision is 0.0, uses Precision::Confusion().
") FixWireGaps;
		bool FixWireGaps();

		/****** ShapeFix_Wireframe::LimitAngle ******/
		/****** md5 signature: 43d77f50b23701a03345021190258f43 ******/
		%feature("compactdefaultargs") LimitAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get limit angle for merging edges.
") LimitAngle;
		double LimitAngle();

		/****** ShapeFix_Wireframe::Load ******/
		/****** md5 signature: 5e48307a99195c8c9f614df4cf55663d ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Loads a shape, resets statuses.
") Load;
		void Load(const TopoDS_Shape & shape);

		/****** ShapeFix_Wireframe::MergeSmallEdges ******/
		/****** md5 signature: 970777846ae81b544af53e58e961d906 ******/
		%feature("compactdefaultargs") MergeSmallEdges;
		%feature("autodoc", "
Parameters
----------
theSmallEdges: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>
theEdgeToFaces: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
theFaceWithSmall: NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>
theMultyEdges: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>
theModeDrop: bool (optional, default to false)
theLimitAngle: double (optional, default to -1)

Return
-------
bool

Description
-----------
Auxiliary tool for FixSmallEdges which merges small edges. If theModeDrop is equal to true then small edges, which cannot be connected with adjacent edges are dropped. Otherwise they are kept. theLimitAngle specifies maximum allowed tangency discontinuity between adjacent edges. If theLimitAngle is equal to -1, this angle is not taken into account.
") MergeSmallEdges;
		bool MergeSmallEdges(NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & theSmallEdges, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & theEdgeToFaces, NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & theFaceWithSmall, NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & theMultyEdges, const bool theModeDrop = false, const double theLimitAngle = -1);

		/****** ShapeFix_Wireframe::ModeDropSmallEdges ******/
		/****** md5 signature: 702387d14e9b5d0c815fcce2e6ddbf73 ******/
		%feature("compactdefaultargs") ModeDropSmallEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns mode managing removing small edges.
") ModeDropSmallEdges;
		bool & ModeDropSmallEdges();

		/****** ShapeFix_Wireframe::SetLimitAngle ******/
		/****** md5 signature: fac21b4ecb627542529e09ba7940a7a4 ******/
		%feature("compactdefaultargs") SetLimitAngle;
		%feature("autodoc", "
Parameters
----------
theLimitAngle: double

Return
-------
None

Description
-----------
Set limit angle for merging edges.
") SetLimitAngle;
		void SetLimitAngle(const double theLimitAngle);

		/****** ShapeFix_Wireframe::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		TopoDS_Shape Shape();

		/****** ShapeFix_Wireframe::StatusSmallEdges ******/
		/****** md5 signature: d13473cf0d5b328cacb2c7aff51a6f7d ******/
		%feature("compactdefaultargs") StatusSmallEdges;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Decodes the status of the last FixSmallEdges. OK - No small edges were found DONE1 - Some small edges were fixed FAIL1 - Failed to fix some small edges.
") StatusSmallEdges;
		bool StatusSmallEdges(const ShapeExtend_Status status);

		/****** ShapeFix_Wireframe::StatusWireGaps ******/
		/****** md5 signature: 73a9ed91e7b63d31eabcfaa1ff7e4e82 ******/
		%feature("compactdefaultargs") StatusWireGaps;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Decodes the status of the last FixWireGaps. OK - No gaps were found DONE1 - Some gaps in 3D were fixed DONE2 - Some gaps in 2D were fixed FAIL1 - Failed to fix some gaps in 3D FAIL2 - Failed to fix some gaps in 2D.
") StatusWireGaps;
		bool StatusWireGaps(const ShapeExtend_Status status);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def shapefix_EncodeRegularity(*args):
	return shapefix.EncodeRegularity(*args)

@deprecated
def shapefix_FixVertexPosition(*args):
	return shapefix.FixVertexPosition(*args)

@deprecated
def shapefix_LeastEdgeSize(*args):
	return shapefix.LeastEdgeSize(*args)

@deprecated
def shapefix_RemoveSmallEdges(*args):
	return shapefix.RemoveSmallEdges(*args)

@deprecated
def shapefix_SameParameter(*args):
	return shapefix.SameParameter(*args)

}
