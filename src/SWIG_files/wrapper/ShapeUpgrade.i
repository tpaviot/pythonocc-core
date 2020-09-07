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
%define SHAPEUPGRADEDOCSTRING
"ShapeUpgrade module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapeupgrade.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEUPGRADEDOCSTRING) ShapeUpgrade


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
#include<Precision.hxx>
#include<ShapeUpgrade_UnifySameDomain.hxx>
#include<ShapeUpgrade_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TColGeom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom2d_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<ShapeBuild_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<BRepTools_module.hxx>
#include<TopTools_module.hxx>
#include<GeomAbs_module.hxx>
#include<ShapeAnalysis_module.hxx>
#include<TopLoc_module.hxx>
#include<BRep_module.hxx>
#include<Bnd_module.hxx>
#include<TShort_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<BRepTools_module.hxx>
#include<IntRes2d_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Precision_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import TColGeom.i
%import Geom2d.i
%import TColGeom2d.i
%import TopoDS.i
%import TopAbs.i
%import ShapeBuild.i
%import ShapeExtend.i
%import Message.i
%import TColStd.i
%import BRepTools.i
%import TopTools.i
%import GeomAbs.i
%import ShapeAnalysis.i
%import TopLoc.i

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
%wrap_handle(ShapeUpgrade_RemoveLocations)
%wrap_handle(ShapeUpgrade_SplitCurve)
%wrap_handle(ShapeUpgrade_SplitSurface)
%wrap_handle(ShapeUpgrade_Tool)
%wrap_handle(ShapeUpgrade_UnifySameDomain)
%wrap_handle(ShapeUpgrade_ConvertSurfaceToBezierBasis)
%wrap_handle(ShapeUpgrade_EdgeDivide)
%wrap_handle(ShapeUpgrade_FaceDivide)
%wrap_handle(ShapeUpgrade_FixSmallCurves)
%wrap_handle(ShapeUpgrade_RemoveInternalWires)
%wrap_handle(ShapeUpgrade_SplitCurve2d)
%wrap_handle(ShapeUpgrade_SplitCurve3d)
%wrap_handle(ShapeUpgrade_SplitSurfaceAngle)
%wrap_handle(ShapeUpgrade_SplitSurfaceArea)
%wrap_handle(ShapeUpgrade_SplitSurfaceContinuity)
%wrap_handle(ShapeUpgrade_WireDivide)
%wrap_handle(ShapeUpgrade_ClosedEdgeDivide)
%wrap_handle(ShapeUpgrade_ClosedFaceDivide)
%wrap_handle(ShapeUpgrade_ConvertCurve2dToBezier)
%wrap_handle(ShapeUpgrade_ConvertCurve3dToBezier)
%wrap_handle(ShapeUpgrade_FaceDivideArea)
%wrap_handle(ShapeUpgrade_FixSmallBezierCurves)
%wrap_handle(ShapeUpgrade_SplitCurve2dContinuity)
%wrap_handle(ShapeUpgrade_SplitCurve3dContinuity)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class ShapeUpgrade *
*********************/
%rename(shapeupgrade) ShapeUpgrade;
class ShapeUpgrade {
	public:
		/****************** C0BSplineToSequenceOfC1BSplineCurve ******************/
		/**** md5 signature: 421f63f6ad773af9d12ede386977a2cf ****/
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "Unifies same domain faces and edges of specified shape.

Parameters
----------
BS: Geom_BSplineCurve
seqBS: TColGeom_HSequenceOfBoundedCurve

Returns
-------
bool
") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HSequenceOfBoundedCurve> & seqBS);

		/****************** C0BSplineToSequenceOfC1BSplineCurve ******************/
		/**** md5 signature: b2f124ea9a65afe841263d044caf576a ****/
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "Converts c0 b-spline curve into sequence of c1 b-spline curves. this method splits b-spline at the knots with multiplicities equal to degree, i.e. unlike method geomconvert::c0bsplinetoarrayofc1bsplinecurve this one does not use any tolerance and therefore does not change the geometry of b-spline. returns true if c0 b-spline was successfully splitted, else returns false (if bs is c1 b-spline).

Parameters
----------
BS: Geom2d_BSplineCurve
seqBS: TColGeom2d_HSequenceOfBoundedCurve

Returns
-------
bool
") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<TColGeom2d_HSequenceOfBoundedCurve> & seqBS);

};


%extend ShapeUpgrade {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeUpgrade_RemoveLocations *
*************************************/
class ShapeUpgrade_RemoveLocations : public Standard_Transient {
	public:
		/****************** ShapeUpgrade_RemoveLocations ******************/
		/**** md5 signature: 54dac0aa6aad1fe2656b7d5ae1b4515b ****/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveLocations;
		%feature("autodoc", "Empy constructor.

Returns
-------
None
") ShapeUpgrade_RemoveLocations;
		 ShapeUpgrade_RemoveLocations();

		/****************** GetResult ******************/
		/**** md5 signature: 61ceaea87a267f8cb3587a019bfaa140 ****/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Returns shape with removed locatins.

Returns
-------
TopoDS_Shape
") GetResult;
		TopoDS_Shape GetResult();

		/****************** ModifiedShape ******************/
		/**** md5 signature: f801488c386de381875cd0fcc9cfc82f ****/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns modified shape obtained from initial shape.

Parameters
----------
theInitShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		TopoDS_Shape ModifiedShape(const TopoDS_Shape & theInitShape);

		/****************** Remove ******************/
		/**** md5 signature: 6fd9ebf3d70b78220e210a8e91c47876 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes all location correspodingly to removelevel.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const TopoDS_Shape & theShape);

		/****************** RemoveLevel ******************/
		/**** md5 signature: 21ab2af202f5ca8d0968f7579fa3de76 ****/
		%feature("compactdefaultargs") RemoveLevel;
		%feature("autodoc", "Sets level starting with that location will be removed.value of level can be set to topabs_shape,topabs_compound,topabs_solid,topabs_shell,topabs_face.by default topabs_shape. in this case location will be removed for all shape types for exception of compound.

Returns
-------
TopAbs_ShapeEnum
") RemoveLevel;
		TopAbs_ShapeEnum RemoveLevel();

		/****************** SetRemoveLevel ******************/
		/**** md5 signature: 724f177912bb1bb4d04944330d639c1c ****/
		%feature("compactdefaultargs") SetRemoveLevel;
		%feature("autodoc", "Sets level starting with that location will be removed, by default topabs_shape. in this case locations will be kept for specified shape and if specified shape is topabs_compound for sub-shapes of first level.

Parameters
----------
theLevel: TopAbs_ShapeEnum

Returns
-------
None
") SetRemoveLevel;
		void SetRemoveLevel(const TopAbs_ShapeEnum theLevel);

};


%make_alias(ShapeUpgrade_RemoveLocations)

%extend ShapeUpgrade_RemoveLocations {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeUpgrade_ShapeDivide *
*********************************/
class ShapeUpgrade_ShapeDivide {
	public:
		/****************** ShapeUpgrade_ShapeDivide ******************/
		/**** md5 signature: bd27fba8574674d5e8741eefa1b0802f ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide();

		/****************** ShapeUpgrade_ShapeDivide ******************/
		/**** md5 signature: 4a9a7ed0c24c3e2fd95bbda534a4972c ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "Initialize by a shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide(const TopoDS_Shape & S);

		/****************** GetContext ******************/
		/**** md5 signature: 34ef34a13716453967a813542b41296d ****/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Returns context with all the modifications made during last call(s) to perform() recorded.

Returns
-------
opencascade::handle<ShapeBuild_ReShape>
") GetContext;
		opencascade::handle<ShapeBuild_ReShape> GetContext();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize by a shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** MsgRegistrator ******************/
		/**** md5 signature: 75371a4ad2792d7881281f65d5c59c1b ****/
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "Returns message registrator.

Returns
-------
opencascade::handle<ShapeExtend_BasicMsgRegistrator>
") MsgRegistrator;
		opencascade::handle<ShapeExtend_BasicMsgRegistrator> MsgRegistrator();

		/****************** Perform ******************/
		/**** md5 signature: 18b7b1e421cfaf7d27fabf76c888c2c3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs splitting and computes the resulting shape if newcontext is true (default), the internal context will be cleared at start, else previous substitutions will be acting.

Parameters
----------
newContext: bool,optional
	default value is Standard_True

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform(const Standard_Boolean newContext = Standard_True);

		/****************** Result ******************/
		/**** md5 signature: e7d296a4a4a5995509cb67e3ee28f5dc ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Gives the resulting shape, or null shape if not done.

Returns
-------
TopoDS_Shape
") Result;
		TopoDS_Shape Result();

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

		/****************** SetContext ******************/
		/**** md5 signature: f37ffef0fea3299d082754a3f2f9af0c ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets context with recorded modifications to be applied during next call(s) to perform(shape,standard_false).

Parameters
----------
context: ShapeBuild_ReShape

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** SetEdgeMode ******************/
		/**** md5 signature: 18c0b0d2d7ab990e98ccbb784724e0a7 ****/
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.

Parameters
----------
aEdgeMode: int

Returns
-------
None
") SetEdgeMode;
		void SetEdgeMode(const Standard_Integer aEdgeMode);

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: ab801fe49011ef1da17c304e1a6984da ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal allowed tolerance.

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: cc2021943713342170d3a4430319bb02 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets minimal allowed tolerance.

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTolerance;
		void SetMinTolerance(const Standard_Real mintol);

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
		/**** md5 signature: 683e72fa620702e8c921bb4783d3d0b5 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Defines the spatial precision used for splitting.

Parameters
----------
Prec: float

Returns
-------
None
") SetPrecision;
		void SetPrecision(const Standard_Real Prec);

		/****************** SetSplitFaceTool ******************/
		/**** md5 signature: 6333125ac2fed1a2119271cedc5cf06b ****/
		%feature("compactdefaultargs") SetSplitFaceTool;
		%feature("autodoc", "Sets the tool for splitting faces.

Parameters
----------
splitFaceTool: ShapeUpgrade_FaceDivide

Returns
-------
None
") SetSplitFaceTool;
		void SetSplitFaceTool(const opencascade::handle<ShapeUpgrade_FaceDivide> & splitFaceTool);

		/****************** SetSurfaceSegmentMode ******************/
		/**** md5 signature: be112b9c06ada1bc38a6ffc5ac01085f ****/
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "Purpose sets mode for trimming (segment) surface by wire uv bounds.

Parameters
----------
Segment: bool

Returns
-------
None
") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode(const Standard_Boolean Segment);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Queries the status of last call to perform ok : no splitting was done (or no call to perform) done1: some edges were splitted done2: surface was splitted fail1: some errors occured.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%extend ShapeUpgrade_ShapeDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeUpgrade_ShellSewing *
*********************************/
class ShapeUpgrade_ShellSewing {
	public:
		/****************** ShapeUpgrade_ShellSewing ******************/
		/**** md5 signature: d0c74974bdf880214ca4059ee43e46e2 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShellSewing;
		%feature("autodoc", "Creates a shellsewing, empty.

Returns
-------
None
") ShapeUpgrade_ShellSewing;
		 ShapeUpgrade_ShellSewing();

		/****************** ApplySewing ******************/
		/**** md5 signature: b4bb58c970656c83c667c95aa27582a2 ****/
		%feature("compactdefaultargs") ApplySewing;
		%feature("autodoc", "Builds a new shape from a former one, by calling sewing from brepbuilderapi. rebuilt solids are oriented to be 'not infinite' //! if <tol> is not given (i.e. value 0. by default), it is computed as the mean tolerance recorded in <shape> //! if no shell has been sewed, this method returns the input shape.

Parameters
----------
shape: TopoDS_Shape
tol: float,optional
	default value is 0.0

Returns
-------
TopoDS_Shape
") ApplySewing;
		TopoDS_Shape ApplySewing(const TopoDS_Shape & shape, const Standard_Real tol = 0.0);

};


%extend ShapeUpgrade_ShellSewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ShapeUpgrade_SplitCurve *
********************************/
class ShapeUpgrade_SplitCurve : public Standard_Transient {
	public:
		/****************** ShapeUpgrade_SplitCurve ******************/
		/**** md5 signature: 7f33bcf8441351dd31bf6b0859a9ba3d ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve;
		 ShapeUpgrade_SplitCurve();

		/****************** Build ******************/
		/**** md5 signature: 2c9f0d7f3c99a11dca5832cdace7f27b ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "If segment is true, the result is composed with segments of the curve bounded by the splitvalues. if segment is false, the result is composed with trimmed curves all based on the same complete curve.

Parameters
----------
Segment: bool

Returns
-------
None
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****************** Compute ******************/
		/**** md5 signature: 68eced81da9e27c35540afe112634b9d ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Calculates points for correction/splitting of the curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** Init ******************/
		/**** md5 signature: e3c9adc1741e8b6d11ad7c0a92336e38 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with curve first and last parameters.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Init;
		void Init(const Standard_Real First, const Standard_Real Last);

		/****************** Perform ******************/
		/**** md5 signature: f19fe529840a01c5a1a2d89aafc1a081 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs correction/splitting of the curve. first defines splitting values by method compute(), then calls method build().

Parameters
----------
Segment: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean Segment = Standard_True);

		/****************** SetSplitValues ******************/
		/**** md5 signature: 28831bdcff62a4474f36a23c7bad5d57 ****/
		%feature("compactdefaultargs") SetSplitValues;
		%feature("autodoc", "Sets the parameters where splitting has to be done.

Parameters
----------
SplitValues: TColStd_HSequenceOfReal

Returns
-------
None
") SetSplitValues;
		void SetSplitValues(const opencascade::handle<TColStd_HSequenceOfReal> & SplitValues);

		/****************** SplitValues ******************/
		/**** md5 signature: 74e88be29642adc22987688fe2ab7f12 ****/
		%feature("compactdefaultargs") SplitValues;
		%feature("autodoc", "Returns all the splitting values including the first and last parameters of the input curve merges input split values and new ones into myglobalknots.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") SplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & SplitValues();

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status ok - no splitting is needed done1 - splitting required and gives more than one segment done2 - splitting is required, but gives only one segment (initial) done3 - geometric form of the curve or parametrisation is modified.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeUpgrade_SplitCurve)

%extend ShapeUpgrade_SplitCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class ShapeUpgrade_SplitSurface *
**********************************/
class ShapeUpgrade_SplitSurface : public Standard_Transient {
	public:
		/****************** ShapeUpgrade_SplitSurface ******************/
		/**** md5 signature: ddc778ab8c3ac73203d158d54c7f7a65 ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitSurface;
		 ShapeUpgrade_SplitSurface();

		/****************** Build ******************/
		/**** md5 signature: 2c9f0d7f3c99a11dca5832cdace7f27b ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs splitting of the supporting surface. if resulting surface is b-spline and segment is true, the result is composed with segments of the surface bounded by the u and v splitvalues (method geom_bsplinesurface::segment is used). if segment is false, the result is composed with geom_rectangulartrimmedsurface all based on the same complete surface. fields mynbresultingrow and mynbresultingcol must be set to specify the size of resulting grid of surfaces.

Parameters
----------
Segment: bool

Returns
-------
None
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****************** Compute ******************/
		/**** md5 signature: f801f72d3fe83b2b6e0adfadc49f30a0 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Calculates points for correction/splitting of the surface.

Parameters
----------
Segment: bool,optional
	default value is Standard_True

Returns
-------
None
") Compute;
		virtual void Compute(const Standard_Boolean Segment = Standard_True);

		/****************** Init ******************/
		/**** md5 signature: ae778074c5c355f705c26cfe08f002f6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with single supporting surface.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S);

		/****************** Init ******************/
		/**** md5 signature: edb18f6e2126a06701cf4c021085828a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with single supporting surface with bounding parameters.

Parameters
----------
S: Geom_Surface
UFirst: float
ULast: float
VFirst: float
VLast: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast);

		/****************** Perform ******************/
		/**** md5 signature: f19fe529840a01c5a1a2d89aafc1a081 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs correction/splitting of the surface. first defines splitting values by method compute(), then calls method build().

Parameters
----------
Segment: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean Segment = Standard_True);

		/****************** ResSurfaces ******************/
		/**** md5 signature: b6252c047eef94757daa2ce878b28d4a ****/
		%feature("compactdefaultargs") ResSurfaces;
		%feature("autodoc", "Returns obtained surfaces after splitting as compositesurface.

Returns
-------
opencascade::handle<ShapeExtend_CompositeSurface>
") ResSurfaces;
		const opencascade::handle<ShapeExtend_CompositeSurface> & ResSurfaces();

		/****************** SetUSplitValues ******************/
		/**** md5 signature: c4d4444c48da4618785e670668259df5 ****/
		%feature("compactdefaultargs") SetUSplitValues;
		%feature("autodoc", "Sets u parameters where splitting has to be done.

Parameters
----------
UValues: TColStd_HSequenceOfReal

Returns
-------
None
") SetUSplitValues;
		void SetUSplitValues(const opencascade::handle<TColStd_HSequenceOfReal> & UValues);

		/****************** SetVSplitValues ******************/
		/**** md5 signature: e6570307ebb97aaab26d75d78a70cabd ****/
		%feature("compactdefaultargs") SetVSplitValues;
		%feature("autodoc", "Sets v parameters where splitting has to be done.

Parameters
----------
VValues: TColStd_HSequenceOfReal

Returns
-------
None
") SetVSplitValues;
		void SetVSplitValues(const opencascade::handle<TColStd_HSequenceOfReal> & VValues);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status ok - no splitting is needed done1 - splitting required and gives more than one patch done2 - splitting is required, but gives only single patch (initial) done3 - geometric form of the surface or parametrisation is modified.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

		/****************** USplitValues ******************/
		/**** md5 signature: 901ea5ae80d1329033183e4cdace8f3f ****/
		%feature("compactdefaultargs") USplitValues;
		%feature("autodoc", "Returns all the u splitting values including the first and last parameters of the input surface.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") USplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & USplitValues();

		/****************** VSplitValues ******************/
		/**** md5 signature: 38dafe2dc9fe8e8f5b3d6c5b856c8404 ****/
		%feature("compactdefaultargs") VSplitValues;
		%feature("autodoc", "Returns all the splitting v values including the first and last parameters of the input surface.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") VSplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & VSplitValues();

};


%make_alias(ShapeUpgrade_SplitSurface)

%extend ShapeUpgrade_SplitSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ShapeUpgrade_Tool *
**************************/
class ShapeUpgrade_Tool : public Standard_Transient {
	public:
		/****************** ShapeUpgrade_Tool ******************/
		/**** md5 signature: bd5d2c4dde0b6cf950a3c8fe6d29d419 ****/
		%feature("compactdefaultargs") ShapeUpgrade_Tool;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_Tool;
		 ShapeUpgrade_Tool();

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

		/****************** Precision ******************/
		/**** md5 signature: 34c7e39bd57a685873eea74fa4629747 ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns basic precision value.

Returns
-------
float
") Precision;
		Standard_Real Precision();

		/****************** Set ******************/
		/**** md5 signature: 1bd0f96c6565d39989ff1ad7d130d45b ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Copy all fields from another root object.

Parameters
----------
tool: ShapeUpgrade_Tool

Returns
-------
None
") Set;
		void Set(const opencascade::handle<ShapeUpgrade_Tool> & tool);

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

		/****************** SetMaxTolerance ******************/
		/**** md5 signature: ab801fe49011ef1da17c304e1a6984da ****/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets maximal allowed tolerance.

Parameters
----------
maxtol: float

Returns
-------
None
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		/**** md5 signature: cc2021943713342170d3a4430319bb02 ****/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets minimal allowed tolerance.

Parameters
----------
mintol: float

Returns
-------
None
") SetMinTolerance;
		void SetMinTolerance(const Standard_Real mintol);

		/****************** SetPrecision ******************/
		/**** md5 signature: a601cf881702916ad1a5bcd1fec314c4 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets basic precision value.

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		void SetPrecision(const Standard_Real preci);

};


%make_alias(ShapeUpgrade_Tool)

%extend ShapeUpgrade_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeUpgrade_UnifySameDomain *
*************************************/
class ShapeUpgrade_UnifySameDomain : public Standard_Transient {
	public:
		/****************** ShapeUpgrade_UnifySameDomain ******************/
		/**** md5 signature: 81e68dd91fd764ff95aa62b12dc88ed6 ****/
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain();

		/****************** ShapeUpgrade_UnifySameDomain ******************/
		/**** md5 signature: 47e47dc0915dcf3836cb412ba192ed88 ****/
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "Constructor defining input shape and necessary flags. it does not perform unification.

Parameters
----------
aShape: TopoDS_Shape
UnifyEdges: bool,optional
	default value is Standard_True
UnifyFaces: bool,optional
	default value is Standard_True
ConcatBSplines: bool,optional
	default value is Standard_False

Returns
-------
None
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain(const TopoDS_Shape & aShape, const Standard_Boolean UnifyEdges = Standard_True, const Standard_Boolean UnifyFaces = Standard_True, const Standard_Boolean ConcatBSplines = Standard_False);

		/****************** AllowInternalEdges ******************/
		/**** md5 signature: 48eef653fce504dcef3e2dd3fce379c6 ****/
		%feature("compactdefaultargs") AllowInternalEdges;
		%feature("autodoc", "Sets the flag defining whether it is allowed to create internal edges inside merged faces in the case of non-manifold topology. without this flag merging through multi connected edge is forbidden. default value is false.

Parameters
----------
theValue: bool

Returns
-------
None
") AllowInternalEdges;
		void AllowInternalEdges(const Standard_Boolean theValue);

		/****************** Build ******************/
		/**** md5 signature: 634d88e5c99c5ce236c07b337243d591 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs unification and builds the resulting shape.

Returns
-------
None
") Build;
		void Build();

		/****************** History ******************/
		/**** md5 signature: 773151b712351341bc4cedd074c69f00 ****/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of the processed shapes.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****************** History ******************/
		/**** md5 signature: b3d09b3939dabb299071c126a304f297 ****/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of the processed shapes.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> & History();

		/****************** Initialize ******************/
		/**** md5 signature: 212ee766e2186df224e0192db6daa5bc ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes with a shape and necessary flags. it does not perform unification. if you intend to nullify the history place holder do it after initialization.

Parameters
----------
aShape: TopoDS_Shape
UnifyEdges: bool,optional
	default value is Standard_True
UnifyFaces: bool,optional
	default value is Standard_True
ConcatBSplines: bool,optional
	default value is Standard_False

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Shape & aShape, const Standard_Boolean UnifyEdges = Standard_True, const Standard_Boolean UnifyFaces = Standard_True, const Standard_Boolean ConcatBSplines = Standard_False);

		/****************** KeepShape ******************/
		/**** md5 signature: 25c6ac25e90f7bad683e9591e58de819 ****/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "Sets the shape for avoid merging of the faces/edges. this shape can be vertex or edge. if the shape is a vertex it forbids merging of connected edges. if the shape is a edge it forbids merging of connected faces. this method can be called several times to keep several shapes.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") KeepShape;
		void KeepShape(const TopoDS_Shape & theShape);

		/****************** KeepShapes ******************/
		/**** md5 signature: b7be57d8907fbbdf23c6f96f55b6b901 ****/
		%feature("compactdefaultargs") KeepShapes;
		%feature("autodoc", "Sets the map of shapes for avoid merging of the faces/edges. it allows passing a ready to use map instead of calling many times the method keepshape.

Parameters
----------
theShapes: TopTools_MapOfShape

Returns
-------
None
") KeepShapes;
		void KeepShapes(const TopTools_MapOfShape & theShapes);

		/****************** SetAngularTolerance ******************/
		/**** md5 signature: 9c2325568a0877a199b1e66bd573a14d ****/
		%feature("compactdefaultargs") SetAngularTolerance;
		%feature("autodoc", "Sets the angular tolerance. if two shapes form a connection angle greater than this value they will not be merged. default value is precision::angular().

Parameters
----------
theValue: float

Returns
-------
None
") SetAngularTolerance;
		void SetAngularTolerance(const Standard_Real theValue);

		/****************** SetLinearTolerance ******************/
		/**** md5 signature: 7c895313a7bdad4782180ded2f81563b ****/
		%feature("compactdefaultargs") SetLinearTolerance;
		%feature("autodoc", "Sets the linear tolerance. it plays the role of chord error when taking decision about merging of shapes. default value is precision::confusion().

Parameters
----------
theValue: float

Returns
-------
None
") SetLinearTolerance;
		void SetLinearTolerance(const Standard_Real theValue);

		/****************** SetSafeInputMode ******************/
		/**** md5 signature: e99a88b05b298e17df231dade6d3a8d0 ****/
		%feature("compactdefaultargs") SetSafeInputMode;
		%feature("autodoc", "Sets the flag defining the behavior of the algorithm regarding modification of input shape. if this flag is equal to true then the input (original) shape can't be modified during modification process. default value is true.

Parameters
----------
theValue: bool

Returns
-------
None
") SetSafeInputMode;
		void SetSafeInputMode(Standard_Boolean theValue);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Gives the resulting shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(ShapeUpgrade_UnifySameDomain)

%extend ShapeUpgrade_UnifySameDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class ShapeUpgrade_ConvertSurfaceToBezierBasis *
*************************************************/
class ShapeUpgrade_ConvertSurfaceToBezierBasis : public ShapeUpgrade_SplitSurface {
	public:
		/****************** ShapeUpgrade_ConvertSurfaceToBezierBasis ******************/
		/**** md5 signature: 89256eef14a97f2812246a267270979a ****/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		 ShapeUpgrade_ConvertSurfaceToBezierBasis();

		/****************** Build ******************/
		/**** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Splits a list of beziers computed by compute method according the split values and splitting parameters.

Parameters
----------
Segment: bool

Returns
-------
None
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****************** Compute ******************/
		/**** md5 signature: 3918f6756d95dedfd02ea39677789c2b ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Converts surface into a grid of bezier based surfaces, and stores this grid.

Parameters
----------
Segment: bool

Returns
-------
None
") Compute;
		virtual void Compute(const Standard_Boolean Segment);

		/****************** GetBSplineMode ******************/
		/**** md5 signature: 52b8a0ea6784022c49c6df9e2a2479da ****/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Returns the geom_bsplinesurface conversion mode.

Returns
-------
bool
") GetBSplineMode;
		Standard_Boolean GetBSplineMode();

		/****************** GetExtrusionMode ******************/
		/**** md5 signature: c1328d84d0f225ce0ca19830df42bf2d ****/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Returns the geom_surfaceoflinearextrusion conversion mode.

Returns
-------
bool
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode();

		/****************** GetPlaneMode ******************/
		/**** md5 signature: e002328dc75c818cc5f5fc644f99eb71 ****/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Returns the geom_pline conversion mode.

Returns
-------
bool
") GetPlaneMode;
		Standard_Boolean GetPlaneMode();

		/****************** GetRevolutionMode ******************/
		/**** md5 signature: b5b2a1b09458b832cb591000bb1895f8 ****/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Returns the geom_surfaceofrevolution conversion mode.

Returns
-------
bool
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode();

		/****************** Segments ******************/
		/**** md5 signature: 7c26832c8c33dc497a694e7c7481b36c ****/
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "Returns the grid of bezier based surfaces correspondent to original surface.

Returns
-------
opencascade::handle<ShapeExtend_CompositeSurface>
") Segments;
		opencascade::handle<ShapeExtend_CompositeSurface> Segments();

		/****************** SetBSplineMode ******************/
		/**** md5 signature: 8915ede96f2f2df819bbfc5341c182e5 ****/
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "Sets mode for conversion geom_bsplinesurface to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetBSplineMode;
		void SetBSplineMode(const Standard_Boolean mode);

		/****************** SetExtrusionMode ******************/
		/**** md5 signature: 30317d64af4395d2fcfa76f1103b77b8 ****/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "Sets mode for conversion geom_surfaceoflinearextrusion to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetExtrusionMode;
		void SetExtrusionMode(const Standard_Boolean mode);

		/****************** SetPlaneMode ******************/
		/**** md5 signature: 67bd74db69c3b2f3667d4e2bd7dac007 ****/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "Sets mode for conversion geom_plane to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetPlaneMode;
		void SetPlaneMode(const Standard_Boolean mode);

		/****************** SetRevolutionMode ******************/
		/**** md5 signature: e7b14ba5099107b1926f3e2ddecfeda9 ****/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "Sets mode for conversion geom_surfaceofrevolution to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetRevolutionMode;
		void SetRevolutionMode(const Standard_Boolean mode);

};


%make_alias(ShapeUpgrade_ConvertSurfaceToBezierBasis)

%extend ShapeUpgrade_ConvertSurfaceToBezierBasis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ShapeUpgrade_EdgeDivide *
********************************/
class ShapeUpgrade_EdgeDivide : public ShapeUpgrade_Tool {
	public:
		/****************** ShapeUpgrade_EdgeDivide ******************/
		/**** md5 signature: 370defacf8a08de04a3731d7ba57588d ****/
		%feature("compactdefaultargs") ShapeUpgrade_EdgeDivide;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_EdgeDivide;
		 ShapeUpgrade_EdgeDivide();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Compute ******************/
		/**** md5 signature: 2595759290528a7a0fb9cd0a02a963bf ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") Compute;
		virtual Standard_Boolean Compute(const TopoDS_Edge & E);

		/****************** GetSplitCurve2dTool ******************/
		/**** md5 signature: df0872a46f4699f5bf3622b3f0426064 ****/
		%feature("compactdefaultargs") GetSplitCurve2dTool;
		%feature("autodoc", "Returns the tool for splitting pcurves.

Returns
-------
opencascade::handle<ShapeUpgrade_SplitCurve2d>
") GetSplitCurve2dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve2d> GetSplitCurve2dTool();

		/****************** GetSplitCurve3dTool ******************/
		/**** md5 signature: 30be0b6a31691d72b7dc05f5b9ea7be0 ****/
		%feature("compactdefaultargs") GetSplitCurve3dTool;
		%feature("autodoc", "Returns the tool for splitting 3d curves.

Returns
-------
opencascade::handle<ShapeUpgrade_SplitCurve3d>
") GetSplitCurve3dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve3d> GetSplitCurve3dTool();

		/****************** HasCurve2d ******************/
		/**** md5 signature: f46dd56e8163b51a179a6d6774d666ad ****/
		%feature("compactdefaultargs") HasCurve2d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCurve2d;
		Standard_Boolean HasCurve2d();

		/****************** HasCurve3d ******************/
		/**** md5 signature: 7871add59a094621a2b45104c6c268e3 ****/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCurve3d;
		Standard_Boolean HasCurve3d();

		/****************** Knots2d ******************/
		/**** md5 signature: 70eb823785694d446339c5bce500639c ****/
		%feature("compactdefaultargs") Knots2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") Knots2d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots2d();

		/****************** Knots3d ******************/
		/**** md5 signature: d2e8da421ccd373f00c73c642799bd62 ****/
		%feature("compactdefaultargs") Knots3d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") Knots3d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots3d();

		/****************** SetFace ******************/
		/**** md5 signature: 9e665fdaf60532a860d6b82abd61fc4e ****/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Sets supporting surface by face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & F);

		/****************** SetSplitCurve2dTool ******************/
		/**** md5 signature: 8f6bf6a03e56e8bc811bdc68e54c6f79 ****/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "Sets the tool for splitting pcurves.

Parameters
----------
splitCurve2dTool: ShapeUpgrade_SplitCurve2d

Returns
-------
None
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool(const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****************** SetSplitCurve3dTool ******************/
		/**** md5 signature: 2d65ac01bdaf3c19b194d8c2bb72886e ****/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "Sets the tool for splitting 3d curves.

Parameters
----------
splitCurve3dTool: ShapeUpgrade_SplitCurve3d

Returns
-------
None
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool(const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

};


%make_alias(ShapeUpgrade_EdgeDivide)

%extend ShapeUpgrade_EdgeDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ShapeUpgrade_FaceDivide *
********************************/
class ShapeUpgrade_FaceDivide : public ShapeUpgrade_Tool {
	public:
		/****************** ShapeUpgrade_FaceDivide ******************/
		/**** md5 signature: a393c4c3674eb9de8f46104a68948938 ****/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide();

		/****************** ShapeUpgrade_FaceDivide ******************/
		/**** md5 signature: e2ccefafbe32bb2c28143352941317ab ****/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "Initialize by a face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide(const TopoDS_Face & F);

		/****************** GetSplitSurfaceTool ******************/
		/**** md5 signature: e7f3dec4631c7d86e3221c737aa25255 ****/
		%feature("compactdefaultargs") GetSplitSurfaceTool;
		%feature("autodoc", "Returns the tool for splitting surfaces. this tool must be already initialized.

Returns
-------
opencascade::handle<ShapeUpgrade_SplitSurface>
") GetSplitSurfaceTool;
		virtual opencascade::handle<ShapeUpgrade_SplitSurface> GetSplitSurfaceTool();

		/****************** GetWireDivideTool ******************/
		/**** md5 signature: a74317ad05feae63b240493021e60284 ****/
		%feature("compactdefaultargs") GetWireDivideTool;
		%feature("autodoc", "Returns the tool for dividing edges on face. this tool must be already initialized.

Returns
-------
opencascade::handle<ShapeUpgrade_WireDivide>
") GetWireDivideTool;
		virtual opencascade::handle<ShapeUpgrade_WireDivide> GetWireDivideTool();

		/****************** Init ******************/
		/**** md5 signature: a8dfaa68079e743e08190fe58d950a9a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize by a face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** Perform ******************/
		/**** md5 signature: 13c494512ebd157b19de66d8b841f157 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs splitting and computes the resulting shell the context is used to keep track of former splittings in order to keep sharings. it is updated according to modifications made.

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform();

		/****************** Result ******************/
		/**** md5 signature: e7d296a4a4a5995509cb67e3ee28f5dc ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Gives the resulting shell, or face, or null shape if not done.

Returns
-------
TopoDS_Shape
") Result;
		TopoDS_Shape Result();

		/****************** SetSplitSurfaceTool ******************/
		/**** md5 signature: 77c5a6387b861ee468a81e6c7142ac37 ****/
		%feature("compactdefaultargs") SetSplitSurfaceTool;
		%feature("autodoc", "Sets the tool for splitting surfaces.

Parameters
----------
splitSurfaceTool: ShapeUpgrade_SplitSurface

Returns
-------
None
") SetSplitSurfaceTool;
		void SetSplitSurfaceTool(const opencascade::handle<ShapeUpgrade_SplitSurface> & splitSurfaceTool);

		/****************** SetSurfaceSegmentMode ******************/
		/**** md5 signature: be112b9c06ada1bc38a6ffc5ac01085f ****/
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "Purpose sets mode for trimming (segment) surface by wire uv bounds.

Parameters
----------
Segment: bool

Returns
-------
None
") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode(const Standard_Boolean Segment);

		/****************** SetWireDivideTool ******************/
		/**** md5 signature: 978296ebc7c16202dd743b8678d22a22 ****/
		%feature("compactdefaultargs") SetWireDivideTool;
		%feature("autodoc", "Sets the tool for dividing edges on face.

Parameters
----------
wireDivideTool: ShapeUpgrade_WireDivide

Returns
-------
None
") SetWireDivideTool;
		void SetWireDivideTool(const opencascade::handle<ShapeUpgrade_WireDivide> & wireDivideTool);

		/****************** SplitCurves ******************/
		/**** md5 signature: 7aeae68c1730c10bd50d435f214ed2bf ****/
		%feature("compactdefaultargs") SplitCurves;
		%feature("autodoc", "Performs splitting of curves of all the edges in the shape and divides these edges.

Returns
-------
bool
") SplitCurves;
		virtual Standard_Boolean SplitCurves();

		/****************** SplitSurface ******************/
		/**** md5 signature: 28c891993b1287fcaeee3ee89ec6fb14 ****/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "Performs splitting of surface and computes the shell from source face.

Returns
-------
bool
") SplitSurface;
		virtual Standard_Boolean SplitSurface();

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Queries the status of last call to perform ok : no splitting was done (or no call to perform) done1: some edges were splitted done2: surface was splitted done3: surface was modified without splitting fail1: some fails encountered during splitting wires fail2: face cannot be splitted.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeUpgrade_FaceDivide)

%extend ShapeUpgrade_FaceDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ShapeUpgrade_FixSmallCurves *
************************************/
class ShapeUpgrade_FixSmallCurves : public ShapeUpgrade_Tool {
	public:
		/****************** ShapeUpgrade_FixSmallCurves ******************/
		/**** md5 signature: f027d095d97e3d679ca416ca3ee144ae ****/
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_FixSmallCurves;
		 ShapeUpgrade_FixSmallCurves();

		/****************** Approx ******************/
		/**** md5 signature: 6ca477a7dfb5cb93f2142dff1a7d5a1e ****/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve3d: Geom_Curve
Curve2d: Geom2d_Curve
Curve2dR: Geom2d_Curve

Returns
-------
First: float
Last: float
") Approx;
		virtual Standard_Boolean Approx(opencascade::handle<Geom_Curve> & Curve3d, opencascade::handle<Geom2d_Curve> & Curve2d, opencascade::handle<Geom2d_Curve> & Curve2dR, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 2a831d636c2c924d38adfdfa075e8336 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****************** SetSplitCurve2dTool ******************/
		/**** md5 signature: 8f6bf6a03e56e8bc811bdc68e54c6f79 ****/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "Sets the tool for splitting pcurves.

Parameters
----------
splitCurve2dTool: ShapeUpgrade_SplitCurve2d

Returns
-------
None
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool(const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****************** SetSplitCurve3dTool ******************/
		/**** md5 signature: 2d65ac01bdaf3c19b194d8c2bb72886e ****/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "Sets the tool for splitting 3d curves.

Parameters
----------
splitCurve3dTool: ShapeUpgrade_SplitCurve3d

Returns
-------
None
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool(const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Queries the status of last call to perform ok : done1: done2: fail1:.

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeUpgrade_FixSmallCurves)

%extend ShapeUpgrade_FixSmallCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class ShapeUpgrade_RemoveInternalWires *
*****************************************/
class ShapeUpgrade_RemoveInternalWires : public ShapeUpgrade_Tool {
	public:
		/****************** ShapeUpgrade_RemoveInternalWires ******************/
		/**** md5 signature: 56a50fd4c05ce21a5f5eb1a1f27109ff ****/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires();

		/****************** ShapeUpgrade_RemoveInternalWires ******************/
		/**** md5 signature: 428b745c998026f40e2552d362444006 ****/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires(const TopoDS_Shape & theShape);

		/****************** GetResult ******************/
		/**** md5 signature: 61ceaea87a267f8cb3587a019bfaa140 ****/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Get result shape.

Returns
-------
TopoDS_Shape
") GetResult;
		TopoDS_Shape GetResult();

		/****************** Init ******************/
		/**** md5 signature: e8c5d8680206212eeeecebd0f84dc5c5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize by a shape.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & theShape);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetMinArea() {
            return (Standard_Real) $self->MinArea();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMinArea(Standard_Real value) {
            $self->MinArea()=value;
            }
        };
		/****************** Perform ******************/
		/**** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Removes all internal wires having area less than area specified as minimal allowed area.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

		/****************** Perform ******************/
		/**** md5 signature: 020458eedd8e53259923eec2d81c85d6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "If specified sequence of shape contains - 1.wires then these wires will be removed if they have area less than allowed min area. 2.faces than internal wires from these faces will be removed if they have area less than allowed min area.

Parameters
----------
theSeqShapes: TopTools_SequenceOfShape

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const TopTools_SequenceOfShape & theSeqShapes);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetRemoveFaceMode() {
            return (Standard_Boolean) $self->RemoveFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetRemoveFaceMode(Standard_Boolean value) {
            $self->RemoveFaceMode()=value;
            }
        };
		/****************** RemovedFaces ******************/
		/**** md5 signature: 2c2419e60e332577e6df8a01d0e64e14 ****/
		%feature("compactdefaultargs") RemovedFaces;
		%feature("autodoc", "Returns sequence of removed faces.

Returns
-------
TopTools_SequenceOfShape
") RemovedFaces;
		const TopTools_SequenceOfShape & RemovedFaces();

		/****************** RemovedWires ******************/
		/**** md5 signature: 65e88289157ef6ea29e2b3bd3efeb167 ****/
		%feature("compactdefaultargs") RemovedWires;
		%feature("autodoc", "Returns sequence of removed faces.

Returns
-------
TopTools_SequenceOfShape
") RemovedWires;
		const TopTools_SequenceOfShape & RemovedWires();

		/****************** Status ******************/
		/**** md5 signature: 03f2df8a606eef2de1cd56a4ae73f0f0 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Queries status of last call to perform() : ok - nothing was done :done1 - internal wires were removed :done2 - small faces were removed. :fail1 - initial shape is not specified :fail2 - specified sub-shape is not belonged to inotial shape.

Parameters
----------
theStatus: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status theStatus);

};


%make_alias(ShapeUpgrade_RemoveInternalWires)

%extend ShapeUpgrade_RemoveInternalWires {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class ShapeUpgrade_ShapeConvertToBezier *
******************************************/
class ShapeUpgrade_ShapeConvertToBezier : public ShapeUpgrade_ShapeDivide {
	public:
		/****************** ShapeUpgrade_ShapeConvertToBezier ******************/
		/**** md5 signature: b11bf2d7c94fb84f1dc103e0e52b4b22 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier();

		/****************** ShapeUpgrade_ShapeConvertToBezier ******************/
		/**** md5 signature: 73f7fb1d4639d2d06d1493801ec32cfe ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "Initialize by a shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier(const TopoDS_Shape & S);

		/****************** Get2dConversion ******************/
		/**** md5 signature: 05e2dd3472e127850bf6a476e6469006 ****/
		%feature("compactdefaultargs") Get2dConversion;
		%feature("autodoc", "Returns the 2d conversion mode.

Returns
-------
bool
") Get2dConversion;
		Standard_Boolean Get2dConversion();

		/****************** Get3dCircleConversion ******************/
		/**** md5 signature: 96650b18077eecf40992cc068903686f ****/
		%feature("compactdefaultargs") Get3dCircleConversion;
		%feature("autodoc", "Returns the geom_circle conversion mode.

Returns
-------
bool
") Get3dCircleConversion;
		Standard_Boolean Get3dCircleConversion();

		/****************** Get3dConicConversion ******************/
		/**** md5 signature: 805214e0015ef5271c2361ab5e3a3cd0 ****/
		%feature("compactdefaultargs") Get3dConicConversion;
		%feature("autodoc", "Returns the geom_conic conversion mode.

Returns
-------
bool
") Get3dConicConversion;
		Standard_Boolean Get3dConicConversion();

		/****************** Get3dConversion ******************/
		/**** md5 signature: 6601741030673e2c076e41107cdaf690 ****/
		%feature("compactdefaultargs") Get3dConversion;
		%feature("autodoc", "Returns the 3d conversion mode.

Returns
-------
bool
") Get3dConversion;
		Standard_Boolean Get3dConversion();

		/****************** Get3dLineConversion ******************/
		/**** md5 signature: 19085c56c495be78de0ba85d219dec99 ****/
		%feature("compactdefaultargs") Get3dLineConversion;
		%feature("autodoc", "Returns the geom_line conversion mode.

Returns
-------
bool
") Get3dLineConversion;
		Standard_Boolean Get3dLineConversion();

		/****************** GetBSplineMode ******************/
		/**** md5 signature: 52b8a0ea6784022c49c6df9e2a2479da ****/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Returns the geom_bsplinesurface conversion mode.

Returns
-------
bool
") GetBSplineMode;
		Standard_Boolean GetBSplineMode();

		/****************** GetExtrusionMode ******************/
		/**** md5 signature: c1328d84d0f225ce0ca19830df42bf2d ****/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Returns the geom_surfaceoflinearextrusion conversion mode.

Returns
-------
bool
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode();

		/****************** GetPlaneMode ******************/
		/**** md5 signature: e002328dc75c818cc5f5fc644f99eb71 ****/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Returns the geom_pline conversion mode.

Returns
-------
bool
") GetPlaneMode;
		Standard_Boolean GetPlaneMode();

		/****************** GetRevolutionMode ******************/
		/**** md5 signature: b5b2a1b09458b832cb591000bb1895f8 ****/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Returns the geom_surfaceofrevolution conversion mode.

Returns
-------
bool
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode();

		/****************** GetSurfaceConversion ******************/
		/**** md5 signature: b0670da3a6155b94cd41ef520e9d4331 ****/
		%feature("compactdefaultargs") GetSurfaceConversion;
		%feature("autodoc", "Returns the surface conversion mode.

Returns
-------
bool
") GetSurfaceConversion;
		Standard_Boolean GetSurfaceConversion();

		/****************** Perform ******************/
		/**** md5 signature: a4edc0e6e110667a5f0645f0a0f665a9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs converting and computes the resulting shape.

Parameters
----------
newContext: bool,optional
	default value is Standard_True

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform(const Standard_Boolean newContext = Standard_True);

		/****************** Set2dConversion ******************/
		/**** md5 signature: 003a26e33f9361a63757234bc52f94b4 ****/
		%feature("compactdefaultargs") Set2dConversion;
		%feature("autodoc", "Sets mode for conversion 2d curves to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") Set2dConversion;
		void Set2dConversion(const Standard_Boolean mode);

		/****************** Set3dCircleConversion ******************/
		/**** md5 signature: c2c710de294b8d1abf61e596fde2ee7d ****/
		%feature("compactdefaultargs") Set3dCircleConversion;
		%feature("autodoc", "Sets mode for conversion geom_circle to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") Set3dCircleConversion;
		void Set3dCircleConversion(const Standard_Boolean mode);

		/****************** Set3dConicConversion ******************/
		/**** md5 signature: 36a02bcac20a4c3a38a2ca293f06f23c ****/
		%feature("compactdefaultargs") Set3dConicConversion;
		%feature("autodoc", "Sets mode for conversion geom_conic to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") Set3dConicConversion;
		void Set3dConicConversion(const Standard_Boolean mode);

		/****************** Set3dConversion ******************/
		/**** md5 signature: d188d5f844c7c5df4472a4e341585490 ****/
		%feature("compactdefaultargs") Set3dConversion;
		%feature("autodoc", "Sets mode for conversion 3d curves to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") Set3dConversion;
		void Set3dConversion(const Standard_Boolean mode);

		/****************** Set3dLineConversion ******************/
		/**** md5 signature: 72178b277b8a1f16a93bfb54c3b8cb2c ****/
		%feature("compactdefaultargs") Set3dLineConversion;
		%feature("autodoc", "Sets mode for conversion geom_line to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") Set3dLineConversion;
		void Set3dLineConversion(const Standard_Boolean mode);

		/****************** SetBSplineMode ******************/
		/**** md5 signature: 8915ede96f2f2df819bbfc5341c182e5 ****/
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "Sets mode for conversion geom_bsplinesurface to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetBSplineMode;
		void SetBSplineMode(const Standard_Boolean mode);

		/****************** SetExtrusionMode ******************/
		/**** md5 signature: 30317d64af4395d2fcfa76f1103b77b8 ****/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "Sets mode for conversion geom_surfaceoflinearextrusion to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetExtrusionMode;
		void SetExtrusionMode(const Standard_Boolean mode);

		/****************** SetPlaneMode ******************/
		/**** md5 signature: 67bd74db69c3b2f3667d4e2bd7dac007 ****/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "Sets mode for conversion geom_plane to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetPlaneMode;
		void SetPlaneMode(const Standard_Boolean mode);

		/****************** SetRevolutionMode ******************/
		/**** md5 signature: e7b14ba5099107b1926f3e2ddecfeda9 ****/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "Sets mode for conversion geom_surfaceofrevolution to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetRevolutionMode;
		void SetRevolutionMode(const Standard_Boolean mode);

		/****************** SetSurfaceConversion ******************/
		/**** md5 signature: 4e94944ff24b4cc747b5235c4dff3260 ****/
		%feature("compactdefaultargs") SetSurfaceConversion;
		%feature("autodoc", "Sets mode for conversion surfaces curves to bezier basis.

Parameters
----------
mode: bool

Returns
-------
None
") SetSurfaceConversion;
		void SetSurfaceConversion(const Standard_Boolean mode);

};


%extend ShapeUpgrade_ShapeConvertToBezier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class ShapeUpgrade_ShapeDivideAngle *
**************************************/
class ShapeUpgrade_ShapeDivideAngle : public ShapeUpgrade_ShapeDivide {
	public:
		/****************** ShapeUpgrade_ShapeDivideAngle ******************/
		/**** md5 signature: d08dc61e020b08076ffaee4a978d1436 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "Empty constructor.

Parameters
----------
MaxAngle: float

Returns
-------
None
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle(const Standard_Real MaxAngle);

		/****************** ShapeUpgrade_ShapeDivideAngle ******************/
		/**** md5 signature: e5b04d02e90700d989c84eb2d9fcfaa8 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "Initialize by a shape.

Parameters
----------
MaxAngle: float
S: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle(const Standard_Real MaxAngle, const TopoDS_Shape & S);

		/****************** InitTool ******************/
		/**** md5 signature: d9bcda32e897ff2650837d1e3131fc27 ****/
		%feature("compactdefaultargs") InitTool;
		%feature("autodoc", "Resets tool for splitting face with given angle.

Parameters
----------
MaxAngle: float

Returns
-------
None
") InitTool;
		void InitTool(const Standard_Real MaxAngle);

		/****************** MaxAngle ******************/
		/**** md5 signature: a2c1fbc84fc589001fe7837db122f5de ****/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Returns maximal angle.

Returns
-------
float
") MaxAngle;
		Standard_Real MaxAngle();

		/****************** SetMaxAngle ******************/
		/**** md5 signature: 8758061d3d5ae96de58a6bc62c2e2fa5 ****/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "Set maximal angle (calls inittool).

Parameters
----------
MaxAngle: float

Returns
-------
None
") SetMaxAngle;
		void SetMaxAngle(const Standard_Real MaxAngle);

};


%extend ShapeUpgrade_ShapeDivideAngle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeUpgrade_ShapeDivideArea *
*************************************/
class ShapeUpgrade_ShapeDivideArea : public ShapeUpgrade_ShapeDivide {
	public:
		/****************** ShapeUpgrade_ShapeDivideArea ******************/
		/**** md5 signature: 7b5a16e533c471d174f015d97213170c ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea();

		/****************** ShapeUpgrade_ShapeDivideArea ******************/
		/**** md5 signature: 1003f08ce6a555e638085c517a5cbf2e ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "Initialize by a shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea(const TopoDS_Shape & S);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetMaxArea() {
            return (Standard_Real) $self->MaxArea();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMaxArea(Standard_Real value) {
            $self->MaxArea()=value;
            }
        };
};


%extend ShapeUpgrade_ShapeDivideArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class ShapeUpgrade_ShapeDivideClosed *
***************************************/
class ShapeUpgrade_ShapeDivideClosed : public ShapeUpgrade_ShapeDivide {
	public:
		/****************** ShapeUpgrade_ShapeDivideClosed ******************/
		/**** md5 signature: 65bc77efa0a6ec7b2da4650e86eee12b ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosed;
		%feature("autodoc", "Initialises tool with shape and default parameter.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_ShapeDivideClosed;
		 ShapeUpgrade_ShapeDivideClosed(const TopoDS_Shape & S);

		/****************** SetNbSplitPoints ******************/
		/**** md5 signature: 03dde7b4fa7d112ab39d0955ccf1da2e ****/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "Sets the number of cuts applied to divide closed faces. the number of resulting faces will be num+1.

Parameters
----------
num: int

Returns
-------
None
") SetNbSplitPoints;
		void SetNbSplitPoints(const Standard_Integer num);

};


%extend ShapeUpgrade_ShapeDivideClosed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ShapeUpgrade_ShapeDivideClosedEdges *
********************************************/
class ShapeUpgrade_ShapeDivideClosedEdges : public ShapeUpgrade_ShapeDivide {
	public:
		/****************** ShapeUpgrade_ShapeDivideClosedEdges ******************/
		/**** md5 signature: c2ed8c7e5f53d0df58327b0158cbb0c4 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosedEdges;
		%feature("autodoc", "Initialises tool with shape and default parameter.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_ShapeDivideClosedEdges;
		 ShapeUpgrade_ShapeDivideClosedEdges(const TopoDS_Shape & S);

		/****************** SetNbSplitPoints ******************/
		/**** md5 signature: 03dde7b4fa7d112ab39d0955ccf1da2e ****/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "Sets the number of cuts applied to divide closed edges. the number of resulting faces will be num+1.

Parameters
----------
num: int

Returns
-------
None
") SetNbSplitPoints;
		void SetNbSplitPoints(const Standard_Integer num);

};


%extend ShapeUpgrade_ShapeDivideClosedEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class ShapeUpgrade_ShapeDivideContinuity *
*******************************************/
class ShapeUpgrade_ShapeDivideContinuity : public ShapeUpgrade_ShapeDivide {
	public:
		/****************** ShapeUpgrade_ShapeDivideContinuity ******************/
		/**** md5 signature: 08ddb15c9d82837221db35403deea0cd ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity();

		/****************** ShapeUpgrade_ShapeDivideContinuity ******************/
		/**** md5 signature: 3c125de026c1e4d4bfd2f1aa2b5c6cd8 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "Initialize by a shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity(const TopoDS_Shape & S);

		/****************** SetBoundaryCriterion ******************/
		/**** md5 signature: 9ae39322ca6fa758f49a9a290009bd52 ****/
		%feature("compactdefaultargs") SetBoundaryCriterion;
		%feature("autodoc", "Defines a criterion of continuity for the boundary (all the wires) //! the possible values are c0, g1, c1, g2, c2, c3, cn the default is c1 to respect the cas.cade shape validity. g1 and g2 are not authorized.

Parameters
----------
Criterion: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") SetBoundaryCriterion;
		void SetBoundaryCriterion(const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****************** SetPCurveCriterion ******************/
		/**** md5 signature: 741c67f5496057e29416966005934577 ****/
		%feature("compactdefaultargs") SetPCurveCriterion;
		%feature("autodoc", "Defines a criterion of continuity for the boundary (all the pcurves of wires) //! the possible values are c0, g1, c1, g2, c2, c3, cn the default is c1 to respect the cas.cade shape validity. g1 and g2 are not authorized.

Parameters
----------
Criterion: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") SetPCurveCriterion;
		void SetPCurveCriterion(const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****************** SetSurfaceCriterion ******************/
		/**** md5 signature: ebd5d41bc518b6c920be93b4baf5062d ****/
		%feature("compactdefaultargs") SetSurfaceCriterion;
		%feature("autodoc", "Defines a criterion of continuity for the boundary (all the wires) //! the possible values are c0, g1, c1, g2, c2, c3, cn the default is c1 to respect the cas.cade shape validity. g1 and g2 are not authorized.

Parameters
----------
Criterion: GeomAbs_Shape,optional
	default value is GeomAbs_C1

Returns
-------
None
") SetSurfaceCriterion;
		void SetSurfaceCriterion(const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SetTolerance2d ******************/
		/**** md5 signature: e950d764ef6a026f6b973bbf740c2a3f ****/
		%feature("compactdefaultargs") SetTolerance2d;
		%feature("autodoc", "Sets tolerance.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance2d;
		void SetTolerance2d(const Standard_Real Tol);

};


%extend ShapeUpgrade_ShapeDivideContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class ShapeUpgrade_SplitCurve2d *
**********************************/
class ShapeUpgrade_SplitCurve2d : public ShapeUpgrade_SplitCurve {
	public:
		/****************** ShapeUpgrade_SplitCurve2d ******************/
		/**** md5 signature: 39ab9b1567a65239877e53d779d76975 ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve2d;
		 ShapeUpgrade_SplitCurve2d();

		/****************** Build ******************/
		/**** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "If segment is true, the result is composed with segments of the curve bounded by the splitvalues. if segment is false, the result is composed with trimmed curves all based on the same complete curve.

Parameters
----------
Segment: bool

Returns
-------
None
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****************** GetCurves ******************/
		/**** md5 signature: bbbc93557970e913adfc9168bd6266b1 ****/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColGeom2d_HArray1OfCurve>
") GetCurves;
		const opencascade::handle<TColGeom2d_HArray1OfCurve> & GetCurves();

		/****************** Init ******************/
		/**** md5 signature: 9265e5f0d4ffc1952c67390e1e4fa21c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with pcurve with its first and last parameters.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Init ******************/
		/**** md5 signature: 25f45d28d7963e02635c2894e4863933 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with pcurve with its parameters.

Parameters
----------
C: Geom2d_Curve
First: float
Last: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real First, const Standard_Real Last);

};


%make_alias(ShapeUpgrade_SplitCurve2d)

%extend ShapeUpgrade_SplitCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class ShapeUpgrade_SplitCurve3d *
**********************************/
class ShapeUpgrade_SplitCurve3d : public ShapeUpgrade_SplitCurve {
	public:
		/****************** ShapeUpgrade_SplitCurve3d ******************/
		/**** md5 signature: 619744f60921a9db66a32f0d6d78ab69 ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve3d;
		 ShapeUpgrade_SplitCurve3d();

		/****************** Build ******************/
		/**** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "If segment is true, the result is composed with segments of the curve bounded by the splitvalues. if segment is false, the result is composed with trimmed curves all based on the same complete curve.

Parameters
----------
Segment: bool

Returns
-------
None
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****************** GetCurves ******************/
		/**** md5 signature: a7b709be865cf9fcf7f7424d9de8925d ****/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColGeom_HArray1OfCurve>
") GetCurves;
		const opencascade::handle<TColGeom_HArray1OfCurve> & GetCurves();

		/****************** Init ******************/
		/**** md5 signature: 3a7fb0adde1a97c68f435539513bba2c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with curve with its first and last parameters.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

		/****************** Init ******************/
		/**** md5 signature: a188de541f89919f3c9b90804c9dcf2e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes with curve with its parameters.

Parameters
----------
C: Geom_Curve
First: float
Last: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const Standard_Real First, const Standard_Real Last);

};


%make_alias(ShapeUpgrade_SplitCurve3d)

%extend ShapeUpgrade_SplitCurve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class ShapeUpgrade_SplitSurfaceAngle *
***************************************/
class ShapeUpgrade_SplitSurfaceAngle : public ShapeUpgrade_SplitSurface {
	public:
		/****************** ShapeUpgrade_SplitSurfaceAngle ******************/
		/**** md5 signature: 9b9ea20fc44cadf061c63b407651674c ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceAngle;
		%feature("autodoc", "Empty constructor.

Parameters
----------
MaxAngle: float

Returns
-------
None
") ShapeUpgrade_SplitSurfaceAngle;
		 ShapeUpgrade_SplitSurfaceAngle(const Standard_Real MaxAngle);

		/****************** Compute ******************/
		/**** md5 signature: 3918f6756d95dedfd02ea39677789c2b ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Performs splitting of the supporting surface(s). first defines splitting values, then calls inherited method.

Parameters
----------
Segment: bool

Returns
-------
None
") Compute;
		virtual void Compute(const Standard_Boolean Segment);

		/****************** MaxAngle ******************/
		/**** md5 signature: a2c1fbc84fc589001fe7837db122f5de ****/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Returns maximal angle.

Returns
-------
float
") MaxAngle;
		Standard_Real MaxAngle();

		/****************** SetMaxAngle ******************/
		/**** md5 signature: 8758061d3d5ae96de58a6bc62c2e2fa5 ****/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "Set maximal angle.

Parameters
----------
MaxAngle: float

Returns
-------
None
") SetMaxAngle;
		void SetMaxAngle(const Standard_Real MaxAngle);

};


%make_alias(ShapeUpgrade_SplitSurfaceAngle)

%extend ShapeUpgrade_SplitSurfaceAngle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class ShapeUpgrade_SplitSurfaceArea *
**************************************/
class ShapeUpgrade_SplitSurfaceArea : public ShapeUpgrade_SplitSurface {
	public:
		/****************** ShapeUpgrade_SplitSurfaceArea ******************/
		/**** md5 signature: d1dadf925266eef209c31de7e2e26ae2 ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceArea;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitSurfaceArea;
		 ShapeUpgrade_SplitSurfaceArea();

		/****************** Compute ******************/
		/**** md5 signature: 99ac1864b005af9f09212a6eded7a0fa ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Parameters
----------
Segment: bool,optional
	default value is Standard_True

Returns
-------
None
") Compute;
		virtual void Compute(const Standard_Boolean Segment = Standard_True);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetNbParts() {
            return (Standard_Integer) $self->NbParts();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetNbParts(Standard_Integer value) {
            $self->NbParts()=value;
            }
        };
};


%make_alias(ShapeUpgrade_SplitSurfaceArea)

%extend ShapeUpgrade_SplitSurfaceArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ShapeUpgrade_SplitSurfaceContinuity *
********************************************/
class ShapeUpgrade_SplitSurfaceContinuity : public ShapeUpgrade_SplitSurface {
	public:
		/****************** ShapeUpgrade_SplitSurfaceContinuity ******************/
		/**** md5 signature: 945a3c9711d7deca3a068d394a155d75 ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceContinuity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitSurfaceContinuity;
		 ShapeUpgrade_SplitSurfaceContinuity();

		/****************** Compute ******************/
		/**** md5 signature: 3918f6756d95dedfd02ea39677789c2b ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Parameters
----------
Segment: bool

Returns
-------
None
") Compute;
		virtual void Compute(const Standard_Boolean Segment);

		/****************** SetCriterion ******************/
		/**** md5 signature: 8d6387c402a873b2b21a29ea9b405c1c ****/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "Sets criterion for splitting.

Parameters
----------
Criterion: GeomAbs_Shape

Returns
-------
None
") SetCriterion;
		void SetCriterion(const GeomAbs_Shape Criterion);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

};


%make_alias(ShapeUpgrade_SplitSurfaceContinuity)

%extend ShapeUpgrade_SplitSurfaceContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ShapeUpgrade_WireDivide *
********************************/
class ShapeUpgrade_WireDivide : public ShapeUpgrade_Tool {
	public:
		/****************** ShapeUpgrade_WireDivide ******************/
		/**** md5 signature: 20387bb48045e55d192e5bdf11de6122 ****/
		%feature("compactdefaultargs") ShapeUpgrade_WireDivide;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_WireDivide;
		 ShapeUpgrade_WireDivide();

		/****************** GetEdgeDivideTool ******************/
		/**** md5 signature: 47dd07c74bf4b364483d33f354a07b70 ****/
		%feature("compactdefaultargs") GetEdgeDivideTool;
		%feature("autodoc", "Returns tool for splitting edges.

Returns
-------
opencascade::handle<ShapeUpgrade_EdgeDivide>
") GetEdgeDivideTool;
		virtual opencascade::handle<ShapeUpgrade_EdgeDivide> GetEdgeDivideTool();

		/****************** GetFixSmallCurveTool ******************/
		/**** md5 signature: 43d095e25676507a00cbdd031d972242 ****/
		%feature("compactdefaultargs") GetFixSmallCurveTool;
		%feature("autodoc", "Returns tool for fixing small curves.

Returns
-------
opencascade::handle<ShapeUpgrade_FixSmallCurves>
") GetFixSmallCurveTool;
		opencascade::handle<ShapeUpgrade_FixSmallCurves> GetFixSmallCurveTool();

		/****************** GetTransferParamTool ******************/
		/**** md5 signature: 6b06e0a59571a21a6a6dee9d6cbc87ff ****/
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "Returns the tool for transfer of parameters.

Returns
-------
opencascade::handle<ShapeAnalysis_TransferParameters>
") GetTransferParamTool;
		virtual opencascade::handle<ShapeAnalysis_TransferParameters> GetTransferParamTool();

		/****************** Init ******************/
		/**** md5 signature: 3e8360537c94fa55830ac518b5a25259 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes by wire and face.

Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Init ******************/
		/**** md5 signature: c01ad054e187e9e097d0bc9994daa66f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes by wire and surface.

Parameters
----------
W: TopoDS_Wire
S: Geom_Surface

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & W, const opencascade::handle<Geom_Surface> & S);

		/****************** Load ******************/
		/**** md5 signature: ef390e322ab6c30371f944ea1dca0e4b ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads working wire.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") Load;
		void Load(const TopoDS_Wire & W);

		/****************** Load ******************/
		/**** md5 signature: e6c74e6e79d395ebe7e5d7202cdafe61 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Creates wire of one edge and calls load for wire.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Load;
		void Load(const TopoDS_Edge & E);

		/****************** Perform ******************/
		/**** md5 signature: 3e9d1e255907ed0a16757a409d9ccd90 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the resulting wire by splitting all the edges according to splitting criteria. all the modifications made are recorded in context (shapebuild_reshape). this tool is applied to all edges before splitting them in order to keep sharings. if no supporting face or surface is defined, only 3d splitting criteria are used.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetEdgeDivideTool ******************/
		/**** md5 signature: 7144aac7c683d8959e3be15ffa45566f ****/
		%feature("compactdefaultargs") SetEdgeDivideTool;
		%feature("autodoc", "Sets tool for splitting edge.

Parameters
----------
edgeDivideTool: ShapeUpgrade_EdgeDivide

Returns
-------
None
") SetEdgeDivideTool;
		void SetEdgeDivideTool(const opencascade::handle<ShapeUpgrade_EdgeDivide> & edgeDivideTool);

		/****************** SetEdgeMode ******************/
		/**** md5 signature: 6d0ad7c5ec6e3bc5cca86ed357f7cf97 ****/
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.

Parameters
----------
EdgeMode: int

Returns
-------
None
") SetEdgeMode;
		void SetEdgeMode(const Standard_Integer EdgeMode);

		/****************** SetFace ******************/
		/**** md5 signature: 9e665fdaf60532a860d6b82abd61fc4e ****/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Sets supporting surface by face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & F);

		/****************** SetFixSmallCurveTool ******************/
		/**** md5 signature: 02ecf2cd678a03cfaeace554bfa972cc ****/
		%feature("compactdefaultargs") SetFixSmallCurveTool;
		%feature("autodoc", "Sets tool for fixing small curves with specified min tolerance;.

Parameters
----------
FixSmallCurvesTool: ShapeUpgrade_FixSmallCurves

Returns
-------
None
") SetFixSmallCurveTool;
		void SetFixSmallCurveTool(const opencascade::handle<ShapeUpgrade_FixSmallCurves> & FixSmallCurvesTool);

		/****************** SetSplitCurve2dTool ******************/
		/**** md5 signature: 8f6bf6a03e56e8bc811bdc68e54c6f79 ****/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "Sets the tool for splitting pcurves.

Parameters
----------
splitCurve2dTool: ShapeUpgrade_SplitCurve2d

Returns
-------
None
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool(const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****************** SetSplitCurve3dTool ******************/
		/**** md5 signature: 2d65ac01bdaf3c19b194d8c2bb72886e ****/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "Sets the tool for splitting 3d curves.

Parameters
----------
splitCurve3dTool: ShapeUpgrade_SplitCurve3d

Returns
-------
None
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool(const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

		/****************** SetSurface ******************/
		/**** md5 signature: 04c71d5ed70fe6360be3e4fadc33ab5a ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Sets supporting surface.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & S);

		/****************** SetSurface ******************/
		/**** md5 signature: 7ac84a11845a7e31afa033ef84e1f916 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Sets supporting surface with location.

Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** SetTransferParamTool ******************/
		/**** md5 signature: 4188a11705a4f1a9d9396cc0ac077382 ****/
		%feature("compactdefaultargs") SetTransferParamTool;
		%feature("autodoc", "Sets the tool for transfer parameters between curves and pcurves.

Parameters
----------
TransferParam: ShapeAnalysis_TransferParameters

Returns
-------
None
") SetTransferParamTool;
		void SetTransferParamTool(const opencascade::handle<ShapeAnalysis_TransferParameters> & TransferParam);

		/****************** Status ******************/
		/**** md5 signature: 1d6b7ae9195134a3f7a36f14c85fbd58 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Queries status of last call to perform() ok - no edges were splitted, wire left untouched done1 - some edges were splitted fail1 - some edges have no 3d curve (skipped) fail2 - some edges have no pcurve (skipped).

Parameters
----------
status: ShapeExtend_Status

Returns
-------
bool
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

		/****************** Wire ******************/
		/**** md5 signature: 066765b94f5225dad05ab95ae3f8b503 ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Gives the resulting wire (equal to initial one if not done or null if not loaded).

Returns
-------
TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


%make_alias(ShapeUpgrade_WireDivide)

%extend ShapeUpgrade_WireDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class ShapeUpgrade_ClosedEdgeDivide *
**************************************/
class ShapeUpgrade_ClosedEdgeDivide : public ShapeUpgrade_EdgeDivide {
	public:
		/****************** ShapeUpgrade_ClosedEdgeDivide ******************/
		/**** md5 signature: 76755dc240fbd68e702906bff6f34624 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedEdgeDivide;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ClosedEdgeDivide;
		 ShapeUpgrade_ClosedEdgeDivide();

		/****************** Compute ******************/
		/**** md5 signature: fb32bf54b41a87d285c77f723fb06d83 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Parameters
----------
anEdge: TopoDS_Edge

Returns
-------
bool
") Compute;
		virtual Standard_Boolean Compute(const TopoDS_Edge & anEdge);

};


%make_alias(ShapeUpgrade_ClosedEdgeDivide)

%extend ShapeUpgrade_ClosedEdgeDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class ShapeUpgrade_ClosedFaceDivide *
**************************************/
class ShapeUpgrade_ClosedFaceDivide : public ShapeUpgrade_FaceDivide {
	public:
		/****************** ShapeUpgrade_ClosedFaceDivide ******************/
		/**** md5 signature: 71cdb83594ee3b6c26510dccce7134b8 ****/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide();

		/****************** ShapeUpgrade_ClosedFaceDivide ******************/
		/**** md5 signature: 6985b1129175464efa199513bf45d5ac ****/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "Initialize by a face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide(const TopoDS_Face & F);

		/****************** GetNbSplitPoints ******************/
		/**** md5 signature: a5d0bebd381ae2ac98e31f1aff9e382b ****/
		%feature("compactdefaultargs") GetNbSplitPoints;
		%feature("autodoc", "Returns the number of splitting points.

Returns
-------
int
") GetNbSplitPoints;
		Standard_Integer GetNbSplitPoints();

		/****************** SetNbSplitPoints ******************/
		/**** md5 signature: 03dde7b4fa7d112ab39d0955ccf1da2e ****/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "Sets the number of cutting lines by which closed face will be splitted. the resulting faces will be num+1.

Parameters
----------
num: int

Returns
-------
None
") SetNbSplitPoints;
		void SetNbSplitPoints(const Standard_Integer num);

		/****************** SplitSurface ******************/
		/**** md5 signature: 04584f41cf6dae4ce77bea5c376454c0 ****/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "Performs splitting of surface and computes the shell from source face.

Returns
-------
bool
") SplitSurface;
		virtual Standard_Boolean SplitSurface();

};


%make_alias(ShapeUpgrade_ClosedFaceDivide)

%extend ShapeUpgrade_ClosedFaceDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ShapeUpgrade_ConvertCurve2dToBezier *
********************************************/
class ShapeUpgrade_ConvertCurve2dToBezier : public ShapeUpgrade_SplitCurve2d {
	public:
		/****************** ShapeUpgrade_ConvertCurve2dToBezier ******************/
		/**** md5 signature: d0d7efd7d9dd00fc89dfe4e9f399b0ca ****/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve2dToBezier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ConvertCurve2dToBezier;
		 ShapeUpgrade_ConvertCurve2dToBezier();

		/****************** Build ******************/
		/**** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Splits a list of beziers computed by compute method according the split values and splitting parameters.

Parameters
----------
Segment: bool

Returns
-------
None
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****************** Compute ******************/
		/**** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Converts curve into a list of beziers, and stores the splitting parameters on original curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** SplitParams ******************/
		/**** md5 signature: 58b035673d8a2196e251a31275012623 ****/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "Returns the list of splitted parameters in original curve parametrisation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") SplitParams;
		opencascade::handle<TColStd_HSequenceOfReal> SplitParams();

};


%make_alias(ShapeUpgrade_ConvertCurve2dToBezier)

%extend ShapeUpgrade_ConvertCurve2dToBezier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ShapeUpgrade_ConvertCurve3dToBezier *
********************************************/
class ShapeUpgrade_ConvertCurve3dToBezier : public ShapeUpgrade_SplitCurve3d {
	public:
		/****************** ShapeUpgrade_ConvertCurve3dToBezier ******************/
		/**** md5 signature: 8facb418261c4e623b88f372ee72d20e ****/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve3dToBezier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ConvertCurve3dToBezier;
		 ShapeUpgrade_ConvertCurve3dToBezier();

		/****************** Build ******************/
		/**** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Splits a list of beziers computed by compute method according the split values and splitting parameters.

Parameters
----------
Segment: bool

Returns
-------
None
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****************** Compute ******************/
		/**** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Converts curve into a list of beziers, and stores the splitting parameters on original curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** GetCircleMode ******************/
		/**** md5 signature: a6dda23bdfcc3da06a63ac22a2fe0f76 ****/
		%feature("compactdefaultargs") GetCircleMode;
		%feature("autodoc", "Returns the geom_circle conversion mode.

Returns
-------
bool
") GetCircleMode;
		Standard_Boolean GetCircleMode();

		/****************** GetConicMode ******************/
		/**** md5 signature: 63c38d8b2dfa3d1fc7b425c9f5f8b4d5 ****/
		%feature("compactdefaultargs") GetConicMode;
		%feature("autodoc", "Performs converting and computes the resulting shape.

Returns
-------
bool
") GetConicMode;
		Standard_Boolean GetConicMode();

		/****************** GetLineMode ******************/
		/**** md5 signature: 5ffcd5fe6aa5e839161f8f71b2913dc0 ****/
		%feature("compactdefaultargs") GetLineMode;
		%feature("autodoc", "Returns the geom_line conversion mode.

Returns
-------
bool
") GetLineMode;
		Standard_Boolean GetLineMode();

		/****************** SetCircleMode ******************/
		/**** md5 signature: 1e5889b43d0e8219c5878ecbd6e098b1 ****/
		%feature("compactdefaultargs") SetCircleMode;
		%feature("autodoc", "Sets mode for conversion geom_circle to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetCircleMode;
		void SetCircleMode(const Standard_Boolean mode);

		/****************** SetConicMode ******************/
		/**** md5 signature: 61d8d14ad1836318f287930873b26300 ****/
		%feature("compactdefaultargs") SetConicMode;
		%feature("autodoc", "Returns the geom_conic conversion mode.

Parameters
----------
mode: bool

Returns
-------
None
") SetConicMode;
		void SetConicMode(const Standard_Boolean mode);

		/****************** SetLineMode ******************/
		/**** md5 signature: 29d1d64e92a62cccfa7059b01427f10c ****/
		%feature("compactdefaultargs") SetLineMode;
		%feature("autodoc", "Sets mode for conversion geom_line to bezier.

Parameters
----------
mode: bool

Returns
-------
None
") SetLineMode;
		void SetLineMode(const Standard_Boolean mode);

		/****************** SplitParams ******************/
		/**** md5 signature: 58b035673d8a2196e251a31275012623 ****/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "Returns the list of splitted parameters in original curve parametrisation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") SplitParams;
		opencascade::handle<TColStd_HSequenceOfReal> SplitParams();

};


%make_alias(ShapeUpgrade_ConvertCurve3dToBezier)

%extend ShapeUpgrade_ConvertCurve3dToBezier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ShapeUpgrade_FaceDivideArea *
************************************/
class ShapeUpgrade_FaceDivideArea : public ShapeUpgrade_FaceDivide {
	public:
		/****************** ShapeUpgrade_FaceDivideArea ******************/
		/**** md5 signature: 4c4c484f7d0531e23bbe96393c090751 ****/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea();

		/****************** ShapeUpgrade_FaceDivideArea ******************/
		/**** md5 signature: b030e94bc7a6d17fdc9eda7c43a6325e ****/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea(const TopoDS_Face & F);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetMaxArea() {
            return (Standard_Real) $self->MaxArea();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMaxArea(Standard_Real value) {
            $self->MaxArea()=value;
            }
        };
		/****************** Perform ******************/
		/**** md5 signature: c99899e52bd81d0144a4ee32ac4f2356 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs splitting and computes the resulting shell the context is used to keep track of former splittings.

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform();

};


%make_alias(ShapeUpgrade_FaceDivideArea)

%extend ShapeUpgrade_FaceDivideArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class ShapeUpgrade_FixSmallBezierCurves *
******************************************/
class ShapeUpgrade_FixSmallBezierCurves : public ShapeUpgrade_FixSmallCurves {
	public:
		/****************** ShapeUpgrade_FixSmallBezierCurves ******************/
		/**** md5 signature: 85b3ddde1185dccaaf99ab9f941729ef ****/
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallBezierCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_FixSmallBezierCurves;
		 ShapeUpgrade_FixSmallBezierCurves();

		/****************** Approx ******************/
		/**** md5 signature: f8c48097c289ca08fe208ce8d9dbf385 ****/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve3d: Geom_Curve
Curve2d: Geom2d_Curve
Curve2dR: Geom2d_Curve

Returns
-------
First: float
Last: float
") Approx;
		virtual Standard_Boolean Approx(opencascade::handle<Geom_Curve> & Curve3d, opencascade::handle<Geom2d_Curve> & Curve2d, opencascade::handle<Geom2d_Curve> & Curve2dR, Standard_Real &OutValue, Standard_Real &OutValue);

};


%make_alias(ShapeUpgrade_FixSmallBezierCurves)

%extend ShapeUpgrade_FixSmallBezierCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ShapeUpgrade_SplitCurve2dContinuity *
********************************************/
class ShapeUpgrade_SplitCurve2dContinuity : public ShapeUpgrade_SplitCurve2d {
	public:
		/****************** ShapeUpgrade_SplitCurve2dContinuity ******************/
		/**** md5 signature: 4c0a60d6abc147c8369a123be1d03918 ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2dContinuity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve2dContinuity;
		 ShapeUpgrade_SplitCurve2dContinuity();

		/****************** Compute ******************/
		/**** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Calculates points for correction/splitting of the curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** SetCriterion ******************/
		/**** md5 signature: 8d6387c402a873b2b21a29ea9b405c1c ****/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "Sets criterion for splitting.

Parameters
----------
Criterion: GeomAbs_Shape

Returns
-------
None
") SetCriterion;
		void SetCriterion(const GeomAbs_Shape Criterion);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

};


%make_alias(ShapeUpgrade_SplitCurve2dContinuity)

%extend ShapeUpgrade_SplitCurve2dContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ShapeUpgrade_SplitCurve3dContinuity *
********************************************/
class ShapeUpgrade_SplitCurve3dContinuity : public ShapeUpgrade_SplitCurve3d {
	public:
		/****************** ShapeUpgrade_SplitCurve3dContinuity ******************/
		/**** md5 signature: a9fc0fb900121ca76d8e827196223d16 ****/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3dContinuity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve3dContinuity;
		 ShapeUpgrade_SplitCurve3dContinuity();

		/****************** Compute ******************/
		/**** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Calculates points for correction/splitting of the curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** GetCurve ******************/
		/**** md5 signature: 47233261d5237642cfead20b7519a635 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") GetCurve;
		const opencascade::handle<Geom_Curve> & GetCurve();

		/****************** SetCriterion ******************/
		/**** md5 signature: 8d6387c402a873b2b21a29ea9b405c1c ****/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "Sets criterion for splitting.

Parameters
----------
Criterion: GeomAbs_Shape

Returns
-------
None
") SetCriterion;
		void SetCriterion(const GeomAbs_Shape Criterion);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

};


%make_alias(ShapeUpgrade_SplitCurve3dContinuity)

%extend ShapeUpgrade_SplitCurve3dContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
