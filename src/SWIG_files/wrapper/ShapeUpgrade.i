/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_shapeupgrade.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<ShapeUpgrade_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TColGeom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom2d_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<ShapeBuild_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<BRepTools_module.hxx>
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
%import TopTools.i
%import TopoDS.i
%import TopAbs.i
%import ShapeBuild.i
%import ShapeExtend.i
%import Message.i
%import TColStd.i
%import BRepTools.i
%import GeomAbs.i
%import ShapeAnalysis.i
%import TopLoc.i

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
		/****** ShapeUpgrade::C0BSplineToSequenceOfC1BSplineCurve ******/
		/****** md5 signature: 421f63f6ad773af9d12ede386977a2cf ******/
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
seqBS: TColGeom_HSequenceOfBoundedCurve

Return
-------
bool

Description
-----------
Unifies same domain faces and edges of specified shape.
") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HSequenceOfBoundedCurve> & seqBS);

		/****** ShapeUpgrade::C0BSplineToSequenceOfC1BSplineCurve ******/
		/****** md5 signature: b2f124ea9a65afe841263d044caf576a ******/
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
seqBS: TColGeom2d_HSequenceOfBoundedCurve

Return
-------
bool

Description
-----------
Converts C0 B-Spline curve into sequence of C1 B-Spline curves. This method splits B-Spline at the knots with multiplicities equal to degree, i.e. unlike method GeomConvert::C0BSplineToArrayOfC1BSplineCurve this one does not use any tolerance and therefore does not change the geometry of B-Spline. Returns True if C0 B-Spline was successfully split, else returns False (if BS is C1 B-Spline).
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
		/****** ShapeUpgrade_RemoveLocations::ShapeUpgrade_RemoveLocations ******/
		/****** md5 signature: 54dac0aa6aad1fe2656b7d5ae1b4515b ******/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveLocations;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_RemoveLocations;
		 ShapeUpgrade_RemoveLocations();

		/****** ShapeUpgrade_RemoveLocations::GetModifiedShapesMap ******/
		/****** md5 signature: 07c478fd6fe912829b8598bbec832ae9 ******/
		%feature("compactdefaultargs") GetModifiedShapesMap;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeShape

Description
-----------
Returns map of modified shapes.
") GetModifiedShapesMap;
		const TopTools_DataMapOfShapeShape & GetModifiedShapesMap();

		/****** ShapeUpgrade_RemoveLocations::GetResult ******/
		/****** md5 signature: 61ceaea87a267f8cb3587a019bfaa140 ******/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns shape with removed locations.
") GetResult;
		TopoDS_Shape GetResult();

		/****** ShapeUpgrade_RemoveLocations::ModifiedShape ******/
		/****** md5 signature: f801488c386de381875cd0fcc9cfc82f ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
theInitShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns modified shape obtained from initial shape.
") ModifiedShape;
		TopoDS_Shape ModifiedShape(const TopoDS_Shape & theInitShape);

		/****** ShapeUpgrade_RemoveLocations::Remove ******/
		/****** md5 signature: 6fd9ebf3d70b78220e210a8e91c47876 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Removes all location correspondingly to RemoveLevel.
") Remove;
		Standard_Boolean Remove(const TopoDS_Shape & theShape);

		/****** ShapeUpgrade_RemoveLocations::RemoveLevel ******/
		/****** md5 signature: 21ab2af202f5ca8d0968f7579fa3de76 ******/
		%feature("compactdefaultargs") RemoveLevel;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
sets level starting with that location will be removed.Value of level can be set to TopAbs_SHAPE,TopAbs_COMPOUND,TopAbs_SOLID,TopAbs_SHELL,TopAbs_FACE.By default TopAbs_SHAPE. In this case location will be removed for all shape types for exception of compound.
") RemoveLevel;
		TopAbs_ShapeEnum RemoveLevel();

		/****** ShapeUpgrade_RemoveLocations::SetRemoveLevel ******/
		/****** md5 signature: 724f177912bb1bb4d04944330d639c1c ******/
		%feature("compactdefaultargs") SetRemoveLevel;
		%feature("autodoc", "
Parameters
----------
theLevel: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
sets level starting with that location will be removed, by default TopAbs_SHAPE. In this case locations will be kept for specified shape and if specified shape is TopAbs_COMPOUND for sub-shapes of first level.
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
		/****** ShapeUpgrade_ShapeDivide::ShapeUpgrade_ShapeDivide ******/
		/****** md5 signature: bd27fba8574674d5e8741eefa1b0802f ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide();

		/****** ShapeUpgrade_ShapeDivide::ShapeUpgrade_ShapeDivide ******/
		/****** md5 signature: 4a9a7ed0c24c3e2fd95bbda534a4972c ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize by a Shape.
") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide(const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeDivide::GetContext ******/
		/****** md5 signature: 34ef34a13716453967a813542b41296d ******/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeBuild_ReShape>

Description
-----------
Returns context with all the modifications made during last call(s) to Perform() recorded.
") GetContext;
		opencascade::handle<ShapeBuild_ReShape> GetContext();

		/****** ShapeUpgrade_ShapeDivide::Init ******/
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
Initialize by a Shape.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeDivide::MsgRegistrator ******/
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

		/****** ShapeUpgrade_ShapeDivide::Perform ******/
		/****** md5 signature: 18b7b1e421cfaf7d27fabf76c888c2c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
newContext: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Performs splitting and computes the resulting shape If newContext is True (default), the internal context will be cleared at start, else previous substitutions will be acting.
") Perform;
		virtual Standard_Boolean Perform(const Standard_Boolean newContext = Standard_True);

		/****** ShapeUpgrade_ShapeDivide::Result ******/
		/****** md5 signature: e7d296a4a4a5995509cb67e3ee28f5dc ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Gives the resulting Shape, or Null shape if not done.
") Result;
		TopoDS_Shape Result();

		/****** ShapeUpgrade_ShapeDivide::SendMsg ******/
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

		/****** ShapeUpgrade_ShapeDivide::SetContext ******/
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
Sets context with recorded modifications to be applied during next call(s) to Perform(shape,Standard_False).
") SetContext;
		void SetContext(const opencascade::handle<ShapeBuild_ReShape> & context);

		/****** ShapeUpgrade_ShapeDivide::SetEdgeMode ******/
		/****** md5 signature: 18c0b0d2d7ab990e98ccbb784724e0a7 ******/
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "
Parameters
----------
aEdgeMode: int

Return
-------
None

Description
-----------
Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.
") SetEdgeMode;
		void SetEdgeMode(const Standard_Integer aEdgeMode);

		/****** ShapeUpgrade_ShapeDivide::SetMaxTolerance ******/
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
Sets maximal allowed tolerance.
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real maxtol);

		/****** ShapeUpgrade_ShapeDivide::SetMinTolerance ******/
		/****** md5 signature: cc2021943713342170d3a4430319bb02 ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
mintol: float

Return
-------
None

Description
-----------
Sets minimal allowed tolerance.
") SetMinTolerance;
		void SetMinTolerance(const Standard_Real mintol);

		/****** ShapeUpgrade_ShapeDivide::SetMsgRegistrator ******/
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

		/****** ShapeUpgrade_ShapeDivide::SetPrecision ******/
		/****** md5 signature: 683e72fa620702e8c921bb4783d3d0b5 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
Prec: float

Return
-------
None

Description
-----------
Defines the spatial precision used for splitting.
") SetPrecision;
		void SetPrecision(const Standard_Real Prec);

		/****** ShapeUpgrade_ShapeDivide::SetSplitFaceTool ******/
		/****** md5 signature: 6333125ac2fed1a2119271cedc5cf06b ******/
		%feature("compactdefaultargs") SetSplitFaceTool;
		%feature("autodoc", "
Parameters
----------
splitFaceTool: ShapeUpgrade_FaceDivide

Return
-------
None

Description
-----------
Sets the tool for splitting faces.
") SetSplitFaceTool;
		void SetSplitFaceTool(const opencascade::handle<ShapeUpgrade_FaceDivide> & splitFaceTool);

		/****** ShapeUpgrade_ShapeDivide::SetSurfaceSegmentMode ******/
		/****** md5 signature: be112b9c06ada1bc38a6ffc5ac01085f ******/
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Purpose sets mode for trimming (segment) surface by wire UV bounds.
") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode(const Standard_Boolean Segment);

		/****** ShapeUpgrade_ShapeDivide::Status ******/
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
Queries the status of last call to Perform OK: no splitting was done (or no call to Perform) DONE1: some edges were split DONE2: surface was split FAIL1: some errors occurred.
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
		/****** ShapeUpgrade_ShellSewing::ShapeUpgrade_ShellSewing ******/
		/****** md5 signature: d0c74974bdf880214ca4059ee43e46e2 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShellSewing;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a ShellSewing, empty.
") ShapeUpgrade_ShellSewing;
		 ShapeUpgrade_ShellSewing();

		/****** ShapeUpgrade_ShellSewing::ApplySewing ******/
		/****** md5 signature: b4bb58c970656c83c667c95aa27582a2 ******/
		%feature("compactdefaultargs") ApplySewing;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tol: float (optional, default to 0.0)

Return
-------
TopoDS_Shape

Description
-----------
Builds a new shape from a former one, by calling Sewing from BRepBuilderAPI. Rebuilt solids are oriented to be 'not infinite' //! If <tol> is not given (i.e. value 0. by default), it is computed as the mean tolerance recorded in <shape> //! If no shell has been sewed, this method returns the input shape.
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
		/****** ShapeUpgrade_SplitCurve::ShapeUpgrade_SplitCurve ******/
		/****** md5 signature: 7f33bcf8441351dd31bf6b0859a9ba3d ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitCurve;
		 ShapeUpgrade_SplitCurve();

		/****** ShapeUpgrade_SplitCurve::Build ******/
		/****** md5 signature: 2c9f0d7f3c99a11dca5832cdace7f27b ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****** ShapeUpgrade_SplitCurve::Compute ******/
		/****** md5 signature: 68eced81da9e27c35540afe112634b9d ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Calculates points for correction/splitting of the curve.
") Compute;
		virtual void Compute();

		/****** ShapeUpgrade_SplitCurve::Init ******/
		/****** md5 signature: e3c9adc1741e8b6d11ad7c0a92336e38 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Initializes with curve first and last parameters.
") Init;
		void Init(const Standard_Real First, const Standard_Real Last);

		/****** ShapeUpgrade_SplitCurve::Perform ******/
		/****** md5 signature: f19fe529840a01c5a1a2d89aafc1a081 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs correction/splitting of the curve. First defines splitting values by method Compute(), then calls method Build().
") Perform;
		void Perform(const Standard_Boolean Segment = Standard_True);

		/****** ShapeUpgrade_SplitCurve::SetSplitValues ******/
		/****** md5 signature: 28831bdcff62a4474f36a23c7bad5d57 ******/
		%feature("compactdefaultargs") SetSplitValues;
		%feature("autodoc", "
Parameters
----------
SplitValues: TColStd_HSequenceOfReal

Return
-------
None

Description
-----------
Sets the parameters where splitting has to be done.
") SetSplitValues;
		void SetSplitValues(const opencascade::handle<TColStd_HSequenceOfReal> & SplitValues);

		/****** ShapeUpgrade_SplitCurve::SplitValues ******/
		/****** md5 signature: 74e88be29642adc22987688fe2ab7f12 ******/
		%feature("compactdefaultargs") SplitValues;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
returns all the splitting values including the First and Last parameters of the input curve Merges input split values and new ones into myGlobalKnots.
") SplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & SplitValues();

		/****** ShapeUpgrade_SplitCurve::Status ******/
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
Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one segment DONE2 - splitting is required, but gives only one segment (initial) DONE3 - geometric form of the curve or parametrisation is modified.
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
		/****** ShapeUpgrade_SplitSurface::ShapeUpgrade_SplitSurface ******/
		/****** md5 signature: ddc778ab8c3ac73203d158d54c7f7a65 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitSurface;
		 ShapeUpgrade_SplitSurface();

		/****** ShapeUpgrade_SplitSurface::Build ******/
		/****** md5 signature: 2c9f0d7f3c99a11dca5832cdace7f27b ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Performs splitting of the supporting surface. If resulting surface is B-Spline and Segment is True, the result is composed with segments of the surface bounded by the U and V SplitValues (method Geom_BSplineSurface::Segment is used). If Segment is False, the result is composed with Geom_RectangularTrimmedSurface all based on the same complete surface. Fields myNbResultingRow and myNbResultingCol must be set to specify the size of resulting grid of surfaces.
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****** ShapeUpgrade_SplitSurface::Compute ******/
		/****** md5 signature: f801f72d3fe83b2b6e0adfadc49f30a0 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Calculates points for correction/splitting of the surface.
") Compute;
		virtual void Compute(const Standard_Boolean Segment = Standard_True);

		/****** ShapeUpgrade_SplitSurface::Init ******/
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
Initializes with single supporting surface.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S);

		/****** ShapeUpgrade_SplitSurface::Init ******/
		/****** md5 signature: c7d10a11179e927adbd9f6f482589311 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UFirst: float
ULast: float
VFirst: float
VLast: float
theArea: float (optional, default to 0)

Return
-------
None

Description
-----------
Initializes with single supporting surface with bounding parameters.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast, const Standard_Real theArea = 0);

		/****** ShapeUpgrade_SplitSurface::Perform ******/
		/****** md5 signature: f19fe529840a01c5a1a2d89aafc1a081 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs correction/splitting of the surface. First defines splitting values by method Compute(), then calls method Build().
") Perform;
		void Perform(const Standard_Boolean Segment = Standard_True);

		/****** ShapeUpgrade_SplitSurface::ResSurfaces ******/
		/****** md5 signature: b6252c047eef94757daa2ce878b28d4a ******/
		%feature("compactdefaultargs") ResSurfaces;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_CompositeSurface>

Description
-----------
Returns obtained surfaces after splitting as CompositeSurface.
") ResSurfaces;
		const opencascade::handle<ShapeExtend_CompositeSurface> & ResSurfaces();

		/****** ShapeUpgrade_SplitSurface::SetUSplitValues ******/
		/****** md5 signature: c4d4444c48da4618785e670668259df5 ******/
		%feature("compactdefaultargs") SetUSplitValues;
		%feature("autodoc", "
Parameters
----------
UValues: TColStd_HSequenceOfReal

Return
-------
None

Description
-----------
Sets U parameters where splitting has to be done.
") SetUSplitValues;
		void SetUSplitValues(const opencascade::handle<TColStd_HSequenceOfReal> & UValues);

		/****** ShapeUpgrade_SplitSurface::SetVSplitValues ******/
		/****** md5 signature: e6570307ebb97aaab26d75d78a70cabd ******/
		%feature("compactdefaultargs") SetVSplitValues;
		%feature("autodoc", "
Parameters
----------
VValues: TColStd_HSequenceOfReal

Return
-------
None

Description
-----------
Sets V parameters where splitting has to be done.
") SetVSplitValues;
		void SetVSplitValues(const opencascade::handle<TColStd_HSequenceOfReal> & VValues);

		/****** ShapeUpgrade_SplitSurface::Status ******/
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
Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one patch DONE2 - splitting is required, but gives only single patch (initial) DONE3 - geometric form of the surface or parametrisation is modified.
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

		/****** ShapeUpgrade_SplitSurface::USplitValues ******/
		/****** md5 signature: 901ea5ae80d1329033183e4cdace8f3f ******/
		%feature("compactdefaultargs") USplitValues;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
returns all the U splitting values including the First and Last parameters of the input surface.
") USplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & USplitValues();

		/****** ShapeUpgrade_SplitSurface::VSplitValues ******/
		/****** md5 signature: 38dafe2dc9fe8e8f5b3d6c5b856c8404 ******/
		%feature("compactdefaultargs") VSplitValues;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
returns all the splitting V values including the First and Last parameters of the input surface.
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
		/****** ShapeUpgrade_Tool::ShapeUpgrade_Tool ******/
		/****** md5 signature: bd5d2c4dde0b6cf950a3c8fe6d29d419 ******/
		%feature("compactdefaultargs") ShapeUpgrade_Tool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_Tool;
		 ShapeUpgrade_Tool();

		/****** ShapeUpgrade_Tool::Context ******/
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

		/****** ShapeUpgrade_Tool::LimitTolerance ******/
		/****** md5 signature: 1120a13b64b8d00fb9f9fc07e07ffa98 ******/
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "
Parameters
----------
toler: float

Return
-------
float

Description
-----------
Returns tolerance limited by [myMinTol,myMaxTol].
") LimitTolerance;
		Standard_Real LimitTolerance(const Standard_Real toler);

		/****** ShapeUpgrade_Tool::MaxTolerance ******/
		/****** md5 signature: b0c09a40965fea8fc4d63c52a795d7fd ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximal allowed tolerance.
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****** ShapeUpgrade_Tool::MinTolerance ******/
		/****** md5 signature: 2629547ec2afd3a7a2edaa268cbc0366 ******/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns minimal allowed tolerance.
") MinTolerance;
		Standard_Real MinTolerance();

		/****** ShapeUpgrade_Tool::Precision ******/
		/****** md5 signature: 34c7e39bd57a685873eea74fa4629747 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns basic precision value.
") Precision;
		Standard_Real Precision();

		/****** ShapeUpgrade_Tool::Set ******/
		/****** md5 signature: 1bd0f96c6565d39989ff1ad7d130d45b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
tool: ShapeUpgrade_Tool

Return
-------
None

Description
-----------
Copy all fields from another Root object.
") Set;
		void Set(const opencascade::handle<ShapeUpgrade_Tool> & tool);

		/****** ShapeUpgrade_Tool::SetContext ******/
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

		/****** ShapeUpgrade_Tool::SetMaxTolerance ******/
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
Sets maximal allowed tolerance.
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real maxtol);

		/****** ShapeUpgrade_Tool::SetMinTolerance ******/
		/****** md5 signature: cc2021943713342170d3a4430319bb02 ******/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "
Parameters
----------
mintol: float

Return
-------
None

Description
-----------
Sets minimal allowed tolerance.
") SetMinTolerance;
		void SetMinTolerance(const Standard_Real mintol);

		/****** ShapeUpgrade_Tool::SetPrecision ******/
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
Sets basic precision value.
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
typedef NCollection_DataMap<TopoDS_Shape , opencascade ::handle<Geom_Plane>, TopTools_ShapeMapHasher> DataMapOfFacePlane;
typedef NCollection_DataMap<TopoDS_Shape , TopTools_MapOfShape , TopTools_ShapeMapHasher> DataMapOfShapeMapOfShape;
		/****** ShapeUpgrade_UnifySameDomain::ShapeUpgrade_UnifySameDomain ******/
		/****** md5 signature: 81e68dd91fd764ff95aa62b12dc88ed6 ******/
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain();

		/****** ShapeUpgrade_UnifySameDomain::ShapeUpgrade_UnifySameDomain ******/
		/****** md5 signature: 47e47dc0915dcf3836cb412ba192ed88 ******/
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
UnifyEdges: bool (optional, default to Standard_True)
UnifyFaces: bool (optional, default to Standard_True)
ConcatBSplines: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor defining input shape and necessary flags. It does not perform unification.
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain(const TopoDS_Shape & aShape, const Standard_Boolean UnifyEdges = Standard_True, const Standard_Boolean UnifyFaces = Standard_True, const Standard_Boolean ConcatBSplines = Standard_False);

		/****** ShapeUpgrade_UnifySameDomain::AllowInternalEdges ******/
		/****** md5 signature: 48eef653fce504dcef3e2dd3fce379c6 ******/
		%feature("compactdefaultargs") AllowInternalEdges;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Sets the flag defining whether it is allowed to create internal edges inside merged faces in the case of non-manifold topology. Without this flag merging through multi connected edge is forbidden. Default value is false.
") AllowInternalEdges;
		void AllowInternalEdges(const Standard_Boolean theValue);

		/****** ShapeUpgrade_UnifySameDomain::Build ******/
		/****** md5 signature: 634d88e5c99c5ce236c07b337243d591 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs unification and builds the resulting shape.
") Build;
		void Build();

		/****** ShapeUpgrade_UnifySameDomain::History ******/
		/****** md5 signature: 773151b712351341bc4cedd074c69f00 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
Returns the history of the processed shapes.
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****** ShapeUpgrade_UnifySameDomain::History ******/
		/****** md5 signature: b3d09b3939dabb299071c126a304f297 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
Returns the history of the processed shapes.
") History;
		opencascade::handle<BRepTools_History> & History();

		/****** ShapeUpgrade_UnifySameDomain::Initialize ******/
		/****** md5 signature: 212ee766e2186df224e0192db6daa5bc ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
UnifyEdges: bool (optional, default to Standard_True)
UnifyFaces: bool (optional, default to Standard_True)
ConcatBSplines: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes with a shape and necessary flags. It does not perform unification. If you intend to nullify the History place holder do it after initialization.
") Initialize;
		void Initialize(const TopoDS_Shape & aShape, const Standard_Boolean UnifyEdges = Standard_True, const Standard_Boolean UnifyFaces = Standard_True, const Standard_Boolean ConcatBSplines = Standard_False);

		/****** ShapeUpgrade_UnifySameDomain::KeepShape ******/
		/****** md5 signature: 25c6ac25e90f7bad683e9591e58de819 ******/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets the shape for avoid merging of the faces/edges. This shape can be vertex or edge. If the shape is a vertex it forbids merging of connected edges. If the shape is a edge it forbids merging of connected faces. This method can be called several times to keep several shapes.
") KeepShape;
		void KeepShape(const TopoDS_Shape & theShape);

		/****** ShapeUpgrade_UnifySameDomain::KeepShapes ******/
		/****** md5 signature: b7be57d8907fbbdf23c6f96f55b6b901 ******/
		%feature("compactdefaultargs") KeepShapes;
		%feature("autodoc", "
Parameters
----------
theShapes: TopTools_MapOfShape

Return
-------
None

Description
-----------
Sets the map of shapes for avoid merging of the faces/edges. It allows passing a ready to use map instead of calling many times the method KeepShape.
") KeepShapes;
		void KeepShapes(const TopTools_MapOfShape & theShapes);

		/****** ShapeUpgrade_UnifySameDomain::SetAngularTolerance ******/
		/****** md5 signature: 9c2325568a0877a199b1e66bd573a14d ******/
		%feature("compactdefaultargs") SetAngularTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets the angular tolerance. If two shapes form a connection angle greater than this value they will not be merged. Default value is Precision::Angular().
") SetAngularTolerance;
		void SetAngularTolerance(const Standard_Real theValue);

		/****** ShapeUpgrade_UnifySameDomain::SetLinearTolerance ******/
		/****** md5 signature: 7c895313a7bdad4782180ded2f81563b ******/
		%feature("compactdefaultargs") SetLinearTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets the linear tolerance. It plays the role of chord error when taking decision about merging of shapes. Default value is Precision::Confusion().
") SetLinearTolerance;
		void SetLinearTolerance(const Standard_Real theValue);

		/****** ShapeUpgrade_UnifySameDomain::SetSafeInputMode ******/
		/****** md5 signature: e99a88b05b298e17df231dade6d3a8d0 ******/
		%feature("compactdefaultargs") SetSafeInputMode;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Sets the flag defining the behavior of the algorithm regarding modification of input shape. If this flag is equal to True then the input (original) shape can't be modified during modification process. Default value is true.
") SetSafeInputMode;
		void SetSafeInputMode(Standard_Boolean theValue);

		/****** ShapeUpgrade_UnifySameDomain::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Gives the resulting shape.
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
		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::ShapeUpgrade_ConvertSurfaceToBezierBasis ******/
		/****** md5 signature: 89256eef14a97f2812246a267270979a ******/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		 ShapeUpgrade_ConvertSurfaceToBezierBasis();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::Build ******/
		/****** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Splits a list of beziers computed by Compute method according the split values and splitting parameters.
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::Compute ******/
		/****** md5 signature: 3918f6756d95dedfd02ea39677789c2b ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Converts surface into a grid of bezier based surfaces, and stores this grid.
") Compute;
		virtual void Compute(const Standard_Boolean Segment);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetBSplineMode ******/
		/****** md5 signature: 52b8a0ea6784022c49c6df9e2a2479da ******/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_BSplineSurface conversion mode.
") GetBSplineMode;
		Standard_Boolean GetBSplineMode();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetExtrusionMode ******/
		/****** md5 signature: c1328d84d0f225ce0ca19830df42bf2d ******/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfLinearExtrusion conversion mode.
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetPlaneMode ******/
		/****** md5 signature: e002328dc75c818cc5f5fc644f99eb71 ******/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Pline conversion mode.
") GetPlaneMode;
		Standard_Boolean GetPlaneMode();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetRevolutionMode ******/
		/****** md5 signature: b5b2a1b09458b832cb591000bb1895f8 ******/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfRevolution conversion mode.
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::Segments ******/
		/****** md5 signature: 7c26832c8c33dc497a694e7c7481b36c ******/
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_CompositeSurface>

Description
-----------
Returns the grid of bezier based surfaces correspondent to original surface.
") Segments;
		opencascade::handle<ShapeExtend_CompositeSurface> Segments();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::SetBSplineMode ******/
		/****** md5 signature: 8915ede96f2f2df819bbfc5341c182e5 ******/
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_BSplineSurface to Bezier.
") SetBSplineMode;
		void SetBSplineMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::SetExtrusionMode ******/
		/****** md5 signature: 30317d64af4395d2fcfa76f1103b77b8 ******/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier.
") SetExtrusionMode;
		void SetExtrusionMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::SetPlaneMode ******/
		/****** md5 signature: 67bd74db69c3b2f3667d4e2bd7dac007 ******/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_Plane to Bezier.
") SetPlaneMode;
		void SetPlaneMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::SetRevolutionMode ******/
		/****** md5 signature: e7b14ba5099107b1926f3e2ddecfeda9 ******/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_SurfaceOfRevolution to Bezier.
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
		/****** ShapeUpgrade_EdgeDivide::ShapeUpgrade_EdgeDivide ******/
		/****** md5 signature: 370defacf8a08de04a3731d7ba57588d ******/
		%feature("compactdefaultargs") ShapeUpgrade_EdgeDivide;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_EdgeDivide;
		 ShapeUpgrade_EdgeDivide();

		/****** ShapeUpgrade_EdgeDivide::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** ShapeUpgrade_EdgeDivide::Compute ******/
		/****** md5 signature: 2595759290528a7a0fb9cd0a02a963bf ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") Compute;
		virtual Standard_Boolean Compute(const TopoDS_Edge & E);

		/****** ShapeUpgrade_EdgeDivide::GetSplitCurve2dTool ******/
		/****** md5 signature: df0872a46f4699f5bf3622b3f0426064 ******/
		%feature("compactdefaultargs") GetSplitCurve2dTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeUpgrade_SplitCurve2d>

Description
-----------
Returns the tool for splitting pcurves.
") GetSplitCurve2dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve2d> GetSplitCurve2dTool();

		/****** ShapeUpgrade_EdgeDivide::GetSplitCurve3dTool ******/
		/****** md5 signature: 30be0b6a31691d72b7dc05f5b9ea7be0 ******/
		%feature("compactdefaultargs") GetSplitCurve3dTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeUpgrade_SplitCurve3d>

Description
-----------
Returns the tool for splitting 3D curves.
") GetSplitCurve3dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve3d> GetSplitCurve3dTool();

		/****** ShapeUpgrade_EdgeDivide::HasCurve2d ******/
		/****** md5 signature: f46dd56e8163b51a179a6d6774d666ad ******/
		%feature("compactdefaultargs") HasCurve2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCurve2d;
		Standard_Boolean HasCurve2d();

		/****** ShapeUpgrade_EdgeDivide::HasCurve3d ******/
		/****** md5 signature: 7871add59a094621a2b45104c6c268e3 ******/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCurve3d;
		Standard_Boolean HasCurve3d();

		/****** ShapeUpgrade_EdgeDivide::Knots2d ******/
		/****** md5 signature: 70eb823785694d446339c5bce500639c ******/
		%feature("compactdefaultargs") Knots2d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
No available documentation.
") Knots2d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots2d();

		/****** ShapeUpgrade_EdgeDivide::Knots3d ******/
		/****** md5 signature: d2e8da421ccd373f00c73c642799bd62 ******/
		%feature("compactdefaultargs") Knots3d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
No available documentation.
") Knots3d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots3d();

		/****** ShapeUpgrade_EdgeDivide::SetFace ******/
		/****** md5 signature: 9e665fdaf60532a860d6b82abd61fc4e ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Sets supporting surface by face.
") SetFace;
		void SetFace(const TopoDS_Face & F);

		/****** ShapeUpgrade_EdgeDivide::SetSplitCurve2dTool ******/
		/****** md5 signature: 8f6bf6a03e56e8bc811bdc68e54c6f79 ******/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "
Parameters
----------
splitCurve2dTool: ShapeUpgrade_SplitCurve2d

Return
-------
None

Description
-----------
Sets the tool for splitting pcurves.
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool(const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****** ShapeUpgrade_EdgeDivide::SetSplitCurve3dTool ******/
		/****** md5 signature: 2d65ac01bdaf3c19b194d8c2bb72886e ******/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "
Parameters
----------
splitCurve3dTool: ShapeUpgrade_SplitCurve3d

Return
-------
None

Description
-----------
Sets the tool for splitting 3D curves.
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
		/****** ShapeUpgrade_FaceDivide::ShapeUpgrade_FaceDivide ******/
		/****** md5 signature: a393c4c3674eb9de8f46104a68948938 ******/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty constructor.
") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide();

		/****** ShapeUpgrade_FaceDivide::ShapeUpgrade_FaceDivide ******/
		/****** md5 signature: e2ccefafbe32bb2c28143352941317ab ******/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Initialize by a Face.
") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide(const TopoDS_Face & F);

		/****** ShapeUpgrade_FaceDivide::GetSplitSurfaceTool ******/
		/****** md5 signature: e7f3dec4631c7d86e3221c737aa25255 ******/
		%feature("compactdefaultargs") GetSplitSurfaceTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeUpgrade_SplitSurface>

Description
-----------
Returns the tool for splitting surfaces. This tool must be already initialized.
") GetSplitSurfaceTool;
		virtual opencascade::handle<ShapeUpgrade_SplitSurface> GetSplitSurfaceTool();

		/****** ShapeUpgrade_FaceDivide::GetWireDivideTool ******/
		/****** md5 signature: a74317ad05feae63b240493021e60284 ******/
		%feature("compactdefaultargs") GetWireDivideTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeUpgrade_WireDivide>

Description
-----------
Returns the tool for dividing edges on Face. This tool must be already initialized.
") GetWireDivideTool;
		virtual opencascade::handle<ShapeUpgrade_WireDivide> GetWireDivideTool();

		/****** ShapeUpgrade_FaceDivide::Init ******/
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
Initialize by a Face.
") Init;
		void Init(const TopoDS_Face & F);

		/****** ShapeUpgrade_FaceDivide::Perform ******/
		/****** md5 signature: 20d0b6fc51636d29419d616b6aa42e30 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theArea: float (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting and computes the resulting shell The context is used to keep track of former splittings in order to keep sharings. It is updated according to modifications made. The optional argument <theArea> is used to initialize the tool for splitting surface in the case of splitting into N parts where N is user-defined.
") Perform;
		virtual Standard_Boolean Perform(const Standard_Real theArea = 0);

		/****** ShapeUpgrade_FaceDivide::Result ******/
		/****** md5 signature: e7d296a4a4a5995509cb67e3ee28f5dc ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Gives the resulting Shell, or Face, or Null shape if not done.
") Result;
		TopoDS_Shape Result();

		/****** ShapeUpgrade_FaceDivide::SetSplitSurfaceTool ******/
		/****** md5 signature: 77c5a6387b861ee468a81e6c7142ac37 ******/
		%feature("compactdefaultargs") SetSplitSurfaceTool;
		%feature("autodoc", "
Parameters
----------
splitSurfaceTool: ShapeUpgrade_SplitSurface

Return
-------
None

Description
-----------
Sets the tool for splitting surfaces.
") SetSplitSurfaceTool;
		void SetSplitSurfaceTool(const opencascade::handle<ShapeUpgrade_SplitSurface> & splitSurfaceTool);

		/****** ShapeUpgrade_FaceDivide::SetSurfaceSegmentMode ******/
		/****** md5 signature: be112b9c06ada1bc38a6ffc5ac01085f ******/
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Purpose sets mode for trimming (segment) surface by wire UV bounds.
") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode(const Standard_Boolean Segment);

		/****** ShapeUpgrade_FaceDivide::SetWireDivideTool ******/
		/****** md5 signature: 978296ebc7c16202dd743b8678d22a22 ******/
		%feature("compactdefaultargs") SetWireDivideTool;
		%feature("autodoc", "
Parameters
----------
wireDivideTool: ShapeUpgrade_WireDivide

Return
-------
None

Description
-----------
Sets the tool for dividing edges on Face.
") SetWireDivideTool;
		void SetWireDivideTool(const opencascade::handle<ShapeUpgrade_WireDivide> & wireDivideTool);

		/****** ShapeUpgrade_FaceDivide::SplitCurves ******/
		/****** md5 signature: 7aeae68c1730c10bd50d435f214ed2bf ******/
		%feature("compactdefaultargs") SplitCurves;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs splitting of curves of all the edges in the shape and divides these edges.
") SplitCurves;
		virtual Standard_Boolean SplitCurves();

		/****** ShapeUpgrade_FaceDivide::SplitSurface ******/
		/****** md5 signature: 7d0e8fbace163592ba259546db534b47 ******/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "
Parameters
----------
theArea: float (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting of surface and computes the shell from source face. The optional argument <theArea> is used to initialize the tool for splitting surface in the case of splitting into N parts where N is user-defined.
") SplitSurface;
		virtual Standard_Boolean SplitSurface(const Standard_Real theArea = 0);

		/****** ShapeUpgrade_FaceDivide::Status ******/
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
Queries the status of last call to Perform OK: no splitting was done (or no call to Perform) DONE1: some edges were split DONE2: surface was split DONE3: surface was modified without splitting FAIL1: some fails encountered during splitting wires FAIL2: face cannot be split.
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
		/****** ShapeUpgrade_FixSmallCurves::ShapeUpgrade_FixSmallCurves ******/
		/****** md5 signature: f027d095d97e3d679ca416ca3ee144ae ******/
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallCurves;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeUpgrade_FixSmallCurves;
		 ShapeUpgrade_FixSmallCurves();

		/****** ShapeUpgrade_FixSmallCurves::Approx ******/
		/****** md5 signature: 6ca477a7dfb5cb93f2142dff1a7d5a1e ******/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "
Parameters
----------
Curve3d: Geom_Curve
Curve2d: Geom2d_Curve
Curve2dR: Geom2d_Curve

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
") Approx;
		virtual Standard_Boolean Approx(opencascade::handle<Geom_Curve> & Curve3d, opencascade::handle<Geom2d_Curve> & Curve2d, opencascade::handle<Geom2d_Curve> & Curve2dR, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeUpgrade_FixSmallCurves::Init ******/
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
No available documentation.
") Init;
		void Init(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****** ShapeUpgrade_FixSmallCurves::SetSplitCurve2dTool ******/
		/****** md5 signature: 8f6bf6a03e56e8bc811bdc68e54c6f79 ******/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "
Parameters
----------
splitCurve2dTool: ShapeUpgrade_SplitCurve2d

Return
-------
None

Description
-----------
Sets the tool for splitting pcurves.
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool(const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****** ShapeUpgrade_FixSmallCurves::SetSplitCurve3dTool ******/
		/****** md5 signature: 2d65ac01bdaf3c19b194d8c2bb72886e ******/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "
Parameters
----------
splitCurve3dTool: ShapeUpgrade_SplitCurve3d

Return
-------
None

Description
-----------
Sets the tool for splitting 3D curves.
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool(const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

		/****** ShapeUpgrade_FixSmallCurves::Status ******/
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
Queries the status of last call to Perform OK: DONE1: DONE2: FAIL1:.
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
		/****** ShapeUpgrade_RemoveInternalWires::ShapeUpgrade_RemoveInternalWires ******/
		/****** md5 signature: 56a50fd4c05ce21a5f5eb1a1f27109ff ******/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty constructor.
") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires();

		/****** ShapeUpgrade_RemoveInternalWires::ShapeUpgrade_RemoveInternalWires ******/
		/****** md5 signature: 428b745c998026f40e2552d362444006 ******/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires(const TopoDS_Shape & theShape);

		/****** ShapeUpgrade_RemoveInternalWires::GetResult ******/
		/****** md5 signature: 61ceaea87a267f8cb3587a019bfaa140 ******/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Get result shape.
") GetResult;
		TopoDS_Shape GetResult();

		/****** ShapeUpgrade_RemoveInternalWires::Init ******/
		/****** md5 signature: e8c5d8680206212eeeecebd0f84dc5c5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize by a Shape.
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
		/****** ShapeUpgrade_RemoveInternalWires::Perform ******/
		/****** md5 signature: dc83e5133003c9f9c7b166df8b5a4192 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Removes all internal wires having area less than area specified as minimal allowed area.
") Perform;
		Standard_Boolean Perform();

		/****** ShapeUpgrade_RemoveInternalWires::Perform ******/
		/****** md5 signature: 020458eedd8e53259923eec2d81c85d6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSeqShapes: TopTools_SequenceOfShape

Return
-------
bool

Description
-----------
If specified sequence of shape contains - 1.wires then these wires will be removed if they have area less than allowed min area. 2.faces than internal wires from these faces will be removed if they have area less than allowed min area.
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
		/****** ShapeUpgrade_RemoveInternalWires::RemovedFaces ******/
		/****** md5 signature: 2c2419e60e332577e6df8a01d0e64e14 ******/
		%feature("compactdefaultargs") RemovedFaces;
		%feature("autodoc", "Return
-------
TopTools_SequenceOfShape

Description
-----------
Returns sequence of removed faces.
") RemovedFaces;
		const TopTools_SequenceOfShape & RemovedFaces();

		/****** ShapeUpgrade_RemoveInternalWires::RemovedWires ******/
		/****** md5 signature: 65e88289157ef6ea29e2b3bd3efeb167 ******/
		%feature("compactdefaultargs") RemovedWires;
		%feature("autodoc", "Return
-------
TopTools_SequenceOfShape

Description
-----------
Returns sequence of removed faces.
") RemovedWires;
		const TopTools_SequenceOfShape & RemovedWires();

		/****** ShapeUpgrade_RemoveInternalWires::Status ******/
		/****** md5 signature: 03f2df8a606eef2de1cd56a4ae73f0f0 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
theStatus: ShapeExtend_Status

Return
-------
bool

Description
-----------
Queries status of last call to Perform(): OK - nothing was done :DONE1 - internal wires were removed :DONE2 - small faces were removed. :FAIL1 - initial shape is not specified :FAIL2 - specified sub-shape is not belonged to inotial shape.
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
		/****** ShapeUpgrade_ShapeConvertToBezier::ShapeUpgrade_ShapeConvertToBezier ******/
		/****** md5 signature: b11bf2d7c94fb84f1dc103e0e52b4b22 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier();

		/****** ShapeUpgrade_ShapeConvertToBezier::ShapeUpgrade_ShapeConvertToBezier ******/
		/****** md5 signature: 73f7fb1d4639d2d06d1493801ec32cfe ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize by a Shape.
") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier(const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeConvertToBezier::Get2dConversion ******/
		/****** md5 signature: 05e2dd3472e127850bf6a476e6469006 ******/
		%feature("compactdefaultargs") Get2dConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the 2D conversion mode.
") Get2dConversion;
		Standard_Boolean Get2dConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dCircleConversion ******/
		/****** md5 signature: 96650b18077eecf40992cc068903686f ******/
		%feature("compactdefaultargs") Get3dCircleConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Circle conversion mode.
") Get3dCircleConversion;
		Standard_Boolean Get3dCircleConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dConicConversion ******/
		/****** md5 signature: 805214e0015ef5271c2361ab5e3a3cd0 ******/
		%feature("compactdefaultargs") Get3dConicConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Conic conversion mode.
") Get3dConicConversion;
		Standard_Boolean Get3dConicConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dConversion ******/
		/****** md5 signature: 6601741030673e2c076e41107cdaf690 ******/
		%feature("compactdefaultargs") Get3dConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the 3D conversion mode.
") Get3dConversion;
		Standard_Boolean Get3dConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dLineConversion ******/
		/****** md5 signature: 19085c56c495be78de0ba85d219dec99 ******/
		%feature("compactdefaultargs") Get3dLineConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Line conversion mode.
") Get3dLineConversion;
		Standard_Boolean Get3dLineConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetBSplineMode ******/
		/****** md5 signature: 52b8a0ea6784022c49c6df9e2a2479da ******/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_BSplineSurface conversion mode.
") GetBSplineMode;
		Standard_Boolean GetBSplineMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetExtrusionMode ******/
		/****** md5 signature: c1328d84d0f225ce0ca19830df42bf2d ******/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfLinearExtrusion conversion mode.
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetPlaneMode ******/
		/****** md5 signature: e002328dc75c818cc5f5fc644f99eb71 ******/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Pline conversion mode.
") GetPlaneMode;
		Standard_Boolean GetPlaneMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetRevolutionMode ******/
		/****** md5 signature: b5b2a1b09458b832cb591000bb1895f8 ******/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfRevolution conversion mode.
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetSurfaceConversion ******/
		/****** md5 signature: b0670da3a6155b94cd41ef520e9d4331 ******/
		%feature("compactdefaultargs") GetSurfaceConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the surface conversion mode.
") GetSurfaceConversion;
		Standard_Boolean GetSurfaceConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Perform ******/
		/****** md5 signature: a4edc0e6e110667a5f0645f0a0f665a9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
newContext: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Performs converting and computes the resulting shape.
") Perform;
		virtual Standard_Boolean Perform(const Standard_Boolean newContext = Standard_True);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set2dConversion ******/
		/****** md5 signature: 003a26e33f9361a63757234bc52f94b4 ******/
		%feature("compactdefaultargs") Set2dConversion;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion 2D curves to bezier.
") Set2dConversion;
		void Set2dConversion(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dCircleConversion ******/
		/****** md5 signature: c2c710de294b8d1abf61e596fde2ee7d ******/
		%feature("compactdefaultargs") Set3dCircleConversion;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_Circle to bezier.
") Set3dCircleConversion;
		void Set3dCircleConversion(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dConicConversion ******/
		/****** md5 signature: 36a02bcac20a4c3a38a2ca293f06f23c ******/
		%feature("compactdefaultargs") Set3dConicConversion;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_Conic to bezier.
") Set3dConicConversion;
		void Set3dConicConversion(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dConversion ******/
		/****** md5 signature: d188d5f844c7c5df4472a4e341585490 ******/
		%feature("compactdefaultargs") Set3dConversion;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion 3d curves to bezier.
") Set3dConversion;
		void Set3dConversion(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dLineConversion ******/
		/****** md5 signature: 72178b277b8a1f16a93bfb54c3b8cb2c ******/
		%feature("compactdefaultargs") Set3dLineConversion;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_Line to bezier.
") Set3dLineConversion;
		void Set3dLineConversion(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetBSplineMode ******/
		/****** md5 signature: 8915ede96f2f2df819bbfc5341c182e5 ******/
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_BSplineSurface to Bezier.
") SetBSplineMode;
		void SetBSplineMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetExtrusionMode ******/
		/****** md5 signature: 30317d64af4395d2fcfa76f1103b77b8 ******/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier.
") SetExtrusionMode;
		void SetExtrusionMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetPlaneMode ******/
		/****** md5 signature: 67bd74db69c3b2f3667d4e2bd7dac007 ******/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_Plane to Bezier.
") SetPlaneMode;
		void SetPlaneMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetRevolutionMode ******/
		/****** md5 signature: e7b14ba5099107b1926f3e2ddecfeda9 ******/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_SurfaceOfRevolution to Bezier.
") SetRevolutionMode;
		void SetRevolutionMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetSurfaceConversion ******/
		/****** md5 signature: 4e94944ff24b4cc747b5235c4dff3260 ******/
		%feature("compactdefaultargs") SetSurfaceConversion;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion surfaces curves to bezier basis.
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
		/****** ShapeUpgrade_ShapeDivideAngle::ShapeUpgrade_ShapeDivideAngle ******/
		/****** md5 signature: d08dc61e020b08076ffaee4a978d1436 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: float

Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle(const Standard_Real MaxAngle);

		/****** ShapeUpgrade_ShapeDivideAngle::ShapeUpgrade_ShapeDivideAngle ******/
		/****** md5 signature: e5b04d02e90700d989c84eb2d9fcfaa8 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: float
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize by a Shape.
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle(const Standard_Real MaxAngle, const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeDivideAngle::InitTool ******/
		/****** md5 signature: d9bcda32e897ff2650837d1e3131fc27 ******/
		%feature("compactdefaultargs") InitTool;
		%feature("autodoc", "
Parameters
----------
MaxAngle: float

Return
-------
None

Description
-----------
Resets tool for splitting face with given angle.
") InitTool;
		void InitTool(const Standard_Real MaxAngle);

		/****** ShapeUpgrade_ShapeDivideAngle::MaxAngle ******/
		/****** md5 signature: a2c1fbc84fc589001fe7837db122f5de ******/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximal angle.
") MaxAngle;
		Standard_Real MaxAngle();

		/****** ShapeUpgrade_ShapeDivideAngle::SetMaxAngle ******/
		/****** md5 signature: 8758061d3d5ae96de58a6bc62c2e2fa5 ******/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: float

Return
-------
None

Description
-----------
Set maximal angle (calls InitTool).
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
		/****** ShapeUpgrade_ShapeDivideArea::ShapeUpgrade_ShapeDivideArea ******/
		/****** md5 signature: 7b5a16e533c471d174f015d97213170c ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea();

		/****** ShapeUpgrade_ShapeDivideArea::ShapeUpgrade_ShapeDivideArea ******/
		/****** md5 signature: 1003f08ce6a555e638085c517a5cbf2e ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize by a Shape.
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
		/****** ShapeUpgrade_ShapeDivideArea::SetNumbersUVSplits ******/
		/****** md5 signature: 5588ef3b7b0b00baa41cae130044c379 ******/
		%feature("compactdefaultargs") SetNumbersUVSplits;
		%feature("autodoc", "
Parameters
----------
theNbUsplits: int
theNbVsplits: int

Return
-------
None

Description
-----------
Set fixed numbers of splits in U and V directions. Only for 'Splitting By Numbers' mode.
") SetNumbersUVSplits;
		void SetNumbersUVSplits(const Standard_Integer theNbUsplits, const Standard_Integer theNbVsplits);

		/****** ShapeUpgrade_ShapeDivideArea::SetSplittingByNumber ******/
		/****** md5 signature: a51e94810d1031ba91234e4f5dfceec6 ******/
		%feature("compactdefaultargs") SetSplittingByNumber;
		%feature("autodoc", "
Parameters
----------
theIsSplittingByNumber: bool

Return
-------
None

Description
-----------
Set splitting mode If the mode is 'splitting by number', the face is splitted approximately into <myNbParts> parts, the parts are similar to squares in 2D.
") SetSplittingByNumber;
		void SetSplittingByNumber(const Standard_Boolean theIsSplittingByNumber);

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
		/****** ShapeUpgrade_ShapeDivideClosed::ShapeUpgrade_ShapeDivideClosed ******/
		/****** md5 signature: 65bc77efa0a6ec7b2da4650e86eee12b ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosed;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialises tool with shape and default parameter.
") ShapeUpgrade_ShapeDivideClosed;
		 ShapeUpgrade_ShapeDivideClosed(const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeDivideClosed::SetNbSplitPoints ******/
		/****** md5 signature: 03dde7b4fa7d112ab39d0955ccf1da2e ******/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Sets the number of cuts applied to divide closed faces. The number of resulting faces will be num+1.
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
		/****** ShapeUpgrade_ShapeDivideClosedEdges::ShapeUpgrade_ShapeDivideClosedEdges ******/
		/****** md5 signature: c2ed8c7e5f53d0df58327b0158cbb0c4 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosedEdges;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialises tool with shape and default parameter.
") ShapeUpgrade_ShapeDivideClosedEdges;
		 ShapeUpgrade_ShapeDivideClosedEdges(const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeDivideClosedEdges::SetNbSplitPoints ******/
		/****** md5 signature: 03dde7b4fa7d112ab39d0955ccf1da2e ******/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Sets the number of cuts applied to divide closed edges. The number of resulting faces will be num+1.
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
		/****** ShapeUpgrade_ShapeDivideContinuity::ShapeUpgrade_ShapeDivideContinuity ******/
		/****** md5 signature: 08ddb15c9d82837221db35403deea0cd ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity();

		/****** ShapeUpgrade_ShapeDivideContinuity::ShapeUpgrade_ShapeDivideContinuity ******/
		/****** md5 signature: 3c125de026c1e4d4bfd2f1aa2b5c6cd8 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize by a Shape.
") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity(const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeDivideContinuity::SetBoundaryCriterion ******/
		/****** md5 signature: 9ae39322ca6fa758f49a9a290009bd52 ******/
		%feature("compactdefaultargs") SetBoundaryCriterion;
		%feature("autodoc", "
Parameters
----------
Criterion: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Defines a criterion of continuity for the boundary (all the Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.
") SetBoundaryCriterion;
		void SetBoundaryCriterion(const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****** ShapeUpgrade_ShapeDivideContinuity::SetPCurveCriterion ******/
		/****** md5 signature: 741c67f5496057e29416966005934577 ******/
		%feature("compactdefaultargs") SetPCurveCriterion;
		%feature("autodoc", "
Parameters
----------
Criterion: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Defines a criterion of continuity for the boundary (all the pcurves of Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.
") SetPCurveCriterion;
		void SetPCurveCriterion(const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****** ShapeUpgrade_ShapeDivideContinuity::SetSurfaceCriterion ******/
		/****** md5 signature: ebd5d41bc518b6c920be93b4baf5062d ******/
		%feature("compactdefaultargs") SetSurfaceCriterion;
		%feature("autodoc", "
Parameters
----------
Criterion: GeomAbs_Shape (optional, default to GeomAbs_C1)

Return
-------
None

Description
-----------
Defines a criterion of continuity for the boundary (all the Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.
") SetSurfaceCriterion;
		void SetSurfaceCriterion(const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****** ShapeUpgrade_ShapeDivideContinuity::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Sets tolerance.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** ShapeUpgrade_ShapeDivideContinuity::SetTolerance2d ******/
		/****** md5 signature: e950d764ef6a026f6b973bbf740c2a3f ******/
		%feature("compactdefaultargs") SetTolerance2d;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Sets tolerance.
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
		/****** ShapeUpgrade_SplitCurve2d::ShapeUpgrade_SplitCurve2d ******/
		/****** md5 signature: 39ab9b1567a65239877e53d779d76975 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitCurve2d;
		 ShapeUpgrade_SplitCurve2d();

		/****** ShapeUpgrade_SplitCurve2d::Build ******/
		/****** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****** ShapeUpgrade_SplitCurve2d::GetCurves ******/
		/****** md5 signature: bbbc93557970e913adfc9168bd6266b1 ******/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "Return
-------
opencascade::handle<TColGeom2d_HArray1OfCurve>

Description
-----------
No available documentation.
") GetCurves;
		const opencascade::handle<TColGeom2d_HArray1OfCurve> & GetCurves();

		/****** ShapeUpgrade_SplitCurve2d::Init ******/
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
Initializes with pcurve with its first and last parameters.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C);

		/****** ShapeUpgrade_SplitCurve2d::Init ******/
		/****** md5 signature: 25f45d28d7963e02635c2894e4863933 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
First: float
Last: float

Return
-------
None

Description
-----------
Initializes with pcurve with its parameters.
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
		/****** ShapeUpgrade_SplitCurve3d::ShapeUpgrade_SplitCurve3d ******/
		/****** md5 signature: 619744f60921a9db66a32f0d6d78ab69 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitCurve3d;
		 ShapeUpgrade_SplitCurve3d();

		/****** ShapeUpgrade_SplitCurve3d::Build ******/
		/****** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****** ShapeUpgrade_SplitCurve3d::GetCurves ******/
		/****** md5 signature: a7b709be865cf9fcf7f7424d9de8925d ******/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "Return
-------
opencascade::handle<TColGeom_HArray1OfCurve>

Description
-----------
No available documentation.
") GetCurves;
		const opencascade::handle<TColGeom_HArray1OfCurve> & GetCurves();

		/****** ShapeUpgrade_SplitCurve3d::Init ******/
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
Initializes with curve with its first and last parameters.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

		/****** ShapeUpgrade_SplitCurve3d::Init ******/
		/****** md5 signature: a188de541f89919f3c9b90804c9dcf2e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: float
Last: float

Return
-------
None

Description
-----------
Initializes with curve with its parameters.
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
		/****** ShapeUpgrade_SplitSurfaceAngle::ShapeUpgrade_SplitSurfaceAngle ******/
		/****** md5 signature: 9b9ea20fc44cadf061c63b407651674c ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: float

Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitSurfaceAngle;
		 ShapeUpgrade_SplitSurfaceAngle(const Standard_Real MaxAngle);

		/****** ShapeUpgrade_SplitSurfaceAngle::Compute ******/
		/****** md5 signature: 3918f6756d95dedfd02ea39677789c2b ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Performs splitting of the supporting surface(s). First defines splitting values, then calls inherited method.
") Compute;
		virtual void Compute(const Standard_Boolean Segment);

		/****** ShapeUpgrade_SplitSurfaceAngle::MaxAngle ******/
		/****** md5 signature: a2c1fbc84fc589001fe7837db122f5de ******/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximal angle.
") MaxAngle;
		Standard_Real MaxAngle();

		/****** ShapeUpgrade_SplitSurfaceAngle::SetMaxAngle ******/
		/****** md5 signature: 8758061d3d5ae96de58a6bc62c2e2fa5 ******/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: float

Return
-------
None

Description
-----------
Set maximal angle.
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
		/****** ShapeUpgrade_SplitSurfaceArea::ShapeUpgrade_SplitSurfaceArea ******/
		/****** md5 signature: d1dadf925266eef209c31de7e2e26ae2 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitSurfaceArea;
		 ShapeUpgrade_SplitSurfaceArea();

		/****** ShapeUpgrade_SplitSurfaceArea::Compute ******/
		/****** md5 signature: 99ac1864b005af9f09212a6eded7a0fa ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
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
		/****** ShapeUpgrade_SplitSurfaceArea::SetNumbersUVSplits ******/
		/****** md5 signature: 5588ef3b7b0b00baa41cae130044c379 ******/
		%feature("compactdefaultargs") SetNumbersUVSplits;
		%feature("autodoc", "
Parameters
----------
theNbUsplits: int
theNbVsplits: int

Return
-------
None

Description
-----------
Set fixed numbers of splits in U and V directions. Only for 'Splitting Into Squares' mode.
") SetNumbersUVSplits;
		void SetNumbersUVSplits(const Standard_Integer theNbUsplits, const Standard_Integer theNbVsplits);

		/****** ShapeUpgrade_SplitSurfaceArea::SetSplittingIntoSquares ******/
		/****** md5 signature: c65f0f832a81aa16e23b9c29751ca885 ******/
		%feature("compactdefaultargs") SetSplittingIntoSquares;
		%feature("autodoc", "
Parameters
----------
theIsSplittingIntoSquares: bool

Return
-------
None

Description
-----------
Set splitting mode If the mode is 'splitting into squares', the face is splitted approximately into <myNbParts> parts, the parts are similar to squares in 2D.
") SetSplittingIntoSquares;
		void SetSplittingIntoSquares(const Standard_Boolean theIsSplittingIntoSquares);

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
		/****** ShapeUpgrade_SplitSurfaceContinuity::ShapeUpgrade_SplitSurfaceContinuity ******/
		/****** md5 signature: 945a3c9711d7deca3a068d394a155d75 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceContinuity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitSurfaceContinuity;
		 ShapeUpgrade_SplitSurfaceContinuity();

		/****** ShapeUpgrade_SplitSurfaceContinuity::Compute ******/
		/****** md5 signature: 3918f6756d95dedfd02ea39677789c2b ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
No available documentation.
") Compute;
		virtual void Compute(const Standard_Boolean Segment);

		/****** ShapeUpgrade_SplitSurfaceContinuity::SetCriterion ******/
		/****** md5 signature: 8d6387c402a873b2b21a29ea9b405c1c ******/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "
Parameters
----------
Criterion: GeomAbs_Shape

Return
-------
None

Description
-----------
Sets criterion for splitting.
") SetCriterion;
		void SetCriterion(const GeomAbs_Shape Criterion);

		/****** ShapeUpgrade_SplitSurfaceContinuity::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Sets tolerance.
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
		/****** ShapeUpgrade_WireDivide::ShapeUpgrade_WireDivide ******/
		/****** md5 signature: 20387bb48045e55d192e5bdf11de6122 ******/
		%feature("compactdefaultargs") ShapeUpgrade_WireDivide;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_WireDivide;
		 ShapeUpgrade_WireDivide();

		/****** ShapeUpgrade_WireDivide::GetEdgeDivideTool ******/
		/****** md5 signature: 47dd07c74bf4b364483d33f354a07b70 ******/
		%feature("compactdefaultargs") GetEdgeDivideTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeUpgrade_EdgeDivide>

Description
-----------
returns tool for splitting edges.
") GetEdgeDivideTool;
		virtual opencascade::handle<ShapeUpgrade_EdgeDivide> GetEdgeDivideTool();

		/****** ShapeUpgrade_WireDivide::GetFixSmallCurveTool ******/
		/****** md5 signature: 43d095e25676507a00cbdd031d972242 ******/
		%feature("compactdefaultargs") GetFixSmallCurveTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeUpgrade_FixSmallCurves>

Description
-----------
Returns tool for fixing small curves.
") GetFixSmallCurveTool;
		opencascade::handle<ShapeUpgrade_FixSmallCurves> GetFixSmallCurveTool();

		/****** ShapeUpgrade_WireDivide::GetTransferParamTool ******/
		/****** md5 signature: 6b06e0a59571a21a6a6dee9d6cbc87ff ******/
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeAnalysis_TransferParameters>

Description
-----------
Returns the tool for Transfer of parameters.
") GetTransferParamTool;
		virtual opencascade::handle<ShapeAnalysis_TransferParameters> GetTransferParamTool();

		/****** ShapeUpgrade_WireDivide::Init ******/
		/****** md5 signature: 3e8360537c94fa55830ac518b5a25259 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Return
-------
None

Description
-----------
Initializes by wire and face.
") Init;
		void Init(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****** ShapeUpgrade_WireDivide::Init ******/
		/****** md5 signature: c01ad054e187e9e097d0bc9994daa66f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
S: Geom_Surface

Return
-------
None

Description
-----------
Initializes by wire and surface.
") Init;
		void Init(const TopoDS_Wire & W, const opencascade::handle<Geom_Surface> & S);

		/****** ShapeUpgrade_WireDivide::Load ******/
		/****** md5 signature: ef390e322ab6c30371f944ea1dca0e4b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Loads working wire.
") Load;
		void Load(const TopoDS_Wire & W);

		/****** ShapeUpgrade_WireDivide::Load ******/
		/****** md5 signature: e6c74e6e79d395ebe7e5d7202cdafe61 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Creates wire of one edge and calls Load for wire.
") Load;
		void Load(const TopoDS_Edge & E);

		/****** ShapeUpgrade_WireDivide::Perform ******/
		/****** md5 signature: 3e9d1e255907ed0a16757a409d9ccd90 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the resulting wire by splitting all the edges according to splitting criteria. All the modifications made are recorded in context (ShapeBuild_ReShape). This tool is applied to all edges before splitting them in order to keep sharings. If no supporting face or surface is defined, only 3d splitting criteria are used.
") Perform;
		virtual void Perform();

		/****** ShapeUpgrade_WireDivide::SetEdgeDivideTool ******/
		/****** md5 signature: 7144aac7c683d8959e3be15ffa45566f ******/
		%feature("compactdefaultargs") SetEdgeDivideTool;
		%feature("autodoc", "
Parameters
----------
edgeDivideTool: ShapeUpgrade_EdgeDivide

Return
-------
None

Description
-----------
Sets tool for splitting edge.
") SetEdgeDivideTool;
		void SetEdgeDivideTool(const opencascade::handle<ShapeUpgrade_EdgeDivide> & edgeDivideTool);

		/****** ShapeUpgrade_WireDivide::SetEdgeMode ******/
		/****** md5 signature: 6d0ad7c5ec6e3bc5cca86ed357f7cf97 ******/
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "
Parameters
----------
EdgeMode: int

Return
-------
None

Description
-----------
Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.
") SetEdgeMode;
		void SetEdgeMode(const Standard_Integer EdgeMode);

		/****** ShapeUpgrade_WireDivide::SetFace ******/
		/****** md5 signature: 9e665fdaf60532a860d6b82abd61fc4e ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Sets supporting surface by face.
") SetFace;
		void SetFace(const TopoDS_Face & F);

		/****** ShapeUpgrade_WireDivide::SetFixSmallCurveTool ******/
		/****** md5 signature: 02ecf2cd678a03cfaeace554bfa972cc ******/
		%feature("compactdefaultargs") SetFixSmallCurveTool;
		%feature("autodoc", "
Parameters
----------
FixSmallCurvesTool: ShapeUpgrade_FixSmallCurves

Return
-------
None

Description
-----------
Sets tool for fixing small curves with specified min tolerance;.
") SetFixSmallCurveTool;
		void SetFixSmallCurveTool(const opencascade::handle<ShapeUpgrade_FixSmallCurves> & FixSmallCurvesTool);

		/****** ShapeUpgrade_WireDivide::SetSplitCurve2dTool ******/
		/****** md5 signature: 8f6bf6a03e56e8bc811bdc68e54c6f79 ******/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "
Parameters
----------
splitCurve2dTool: ShapeUpgrade_SplitCurve2d

Return
-------
None

Description
-----------
Sets the tool for splitting pcurves.
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool(const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****** ShapeUpgrade_WireDivide::SetSplitCurve3dTool ******/
		/****** md5 signature: 2d65ac01bdaf3c19b194d8c2bb72886e ******/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "
Parameters
----------
splitCurve3dTool: ShapeUpgrade_SplitCurve3d

Return
-------
None

Description
-----------
Sets the tool for splitting 3D curves.
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool(const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

		/****** ShapeUpgrade_WireDivide::SetSurface ******/
		/****** md5 signature: 04c71d5ed70fe6360be3e4fadc33ab5a ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
Sets supporting surface.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & S);

		/****** ShapeUpgrade_WireDivide::SetSurface ******/
		/****** md5 signature: 7ac84a11845a7e31afa033ef84e1f916 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
Sets supporting surface with location.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** ShapeUpgrade_WireDivide::SetTransferParamTool ******/
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
Sets the tool for Transfer parameters between curves and pcurves.
") SetTransferParamTool;
		void SetTransferParamTool(const opencascade::handle<ShapeAnalysis_TransferParameters> & TransferParam);

		/****** ShapeUpgrade_WireDivide::Status ******/
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
Queries status of last call to Perform() OK - no edges were split, wire left untouched DONE1 - some edges were split FAIL1 - some edges have no 3d curve (skipped) FAIL2 - some edges have no pcurve (skipped).
") Status;
		Standard_Boolean Status(const ShapeExtend_Status status);

		/****** ShapeUpgrade_WireDivide::Wire ******/
		/****** md5 signature: 066765b94f5225dad05ab95ae3f8b503 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Gives the resulting Wire (equal to initial one if not done or Null if not loaded).
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
		/****** ShapeUpgrade_ClosedEdgeDivide::ShapeUpgrade_ClosedEdgeDivide ******/
		/****** md5 signature: 76755dc240fbd68e702906bff6f34624 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedEdgeDivide;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_ClosedEdgeDivide;
		 ShapeUpgrade_ClosedEdgeDivide();

		/****** ShapeUpgrade_ClosedEdgeDivide::Compute ******/
		/****** md5 signature: fb32bf54b41a87d285c77f723fb06d83 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** ShapeUpgrade_ClosedFaceDivide::ShapeUpgrade_ClosedFaceDivide ******/
		/****** md5 signature: 71cdb83594ee3b6c26510dccce7134b8 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty constructor.
") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide();

		/****** ShapeUpgrade_ClosedFaceDivide::ShapeUpgrade_ClosedFaceDivide ******/
		/****** md5 signature: 6985b1129175464efa199513bf45d5ac ******/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Initialize by a Face.
") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide(const TopoDS_Face & F);

		/****** ShapeUpgrade_ClosedFaceDivide::GetNbSplitPoints ******/
		/****** md5 signature: a5d0bebd381ae2ac98e31f1aff9e382b ******/
		%feature("compactdefaultargs") GetNbSplitPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of splitting points.
") GetNbSplitPoints;
		Standard_Integer GetNbSplitPoints();

		/****** ShapeUpgrade_ClosedFaceDivide::SetNbSplitPoints ******/
		/****** md5 signature: 03dde7b4fa7d112ab39d0955ccf1da2e ******/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Sets the number of cutting lines by which closed face will be split. The resulting faces will be num+1.
") SetNbSplitPoints;
		void SetNbSplitPoints(const Standard_Integer num);

		/****** ShapeUpgrade_ClosedFaceDivide::SplitSurface ******/
		/****** md5 signature: 61ae21075e41f26658581719bb3a1c27 ******/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "
Parameters
----------
theArea: float (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting of surface and computes the shell from source face.
") SplitSurface;
		virtual Standard_Boolean SplitSurface(const Standard_Real theArea = 0);

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
		/****** ShapeUpgrade_ConvertCurve2dToBezier::ShapeUpgrade_ConvertCurve2dToBezier ******/
		/****** md5 signature: d0d7efd7d9dd00fc89dfe4e9f399b0ca ******/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve2dToBezier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_ConvertCurve2dToBezier;
		 ShapeUpgrade_ConvertCurve2dToBezier();

		/****** ShapeUpgrade_ConvertCurve2dToBezier::Build ******/
		/****** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Splits a list of beziers computed by Compute method according the split values and splitting parameters.
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****** ShapeUpgrade_ConvertCurve2dToBezier::Compute ******/
		/****** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts curve into a list of beziers, and stores the splitting parameters on original curve.
") Compute;
		virtual void Compute();

		/****** ShapeUpgrade_ConvertCurve2dToBezier::SplitParams ******/
		/****** md5 signature: 58b035673d8a2196e251a31275012623 ******/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
Returns the list of split parameters in original curve parametrisation.
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
		/****** ShapeUpgrade_ConvertCurve3dToBezier::ShapeUpgrade_ConvertCurve3dToBezier ******/
		/****** md5 signature: 8facb418261c4e623b88f372ee72d20e ******/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve3dToBezier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_ConvertCurve3dToBezier;
		 ShapeUpgrade_ConvertCurve3dToBezier();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::Build ******/
		/****** md5 signature: 711e3eb54e55e074aaa7b888776cf6b5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Segment: bool

Return
-------
None

Description
-----------
Splits a list of beziers computed by Compute method according the split values and splitting parameters.
") Build;
		virtual void Build(const Standard_Boolean Segment);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::Compute ******/
		/****** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts curve into a list of beziers, and stores the splitting parameters on original curve.
") Compute;
		virtual void Compute();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::GetCircleMode ******/
		/****** md5 signature: a6dda23bdfcc3da06a63ac22a2fe0f76 ******/
		%feature("compactdefaultargs") GetCircleMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Circle conversion mode.
") GetCircleMode;
		Standard_Boolean GetCircleMode();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::GetConicMode ******/
		/****** md5 signature: 63c38d8b2dfa3d1fc7b425c9f5f8b4d5 ******/
		%feature("compactdefaultargs") GetConicMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs converting and computes the resulting shape.
") GetConicMode;
		Standard_Boolean GetConicMode();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::GetLineMode ******/
		/****** md5 signature: 5ffcd5fe6aa5e839161f8f71b2913dc0 ******/
		%feature("compactdefaultargs") GetLineMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Line conversion mode.
") GetLineMode;
		Standard_Boolean GetLineMode();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SetCircleMode ******/
		/****** md5 signature: 1e5889b43d0e8219c5878ecbd6e098b1 ******/
		%feature("compactdefaultargs") SetCircleMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_Circle to bezier.
") SetCircleMode;
		void SetCircleMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SetConicMode ******/
		/****** md5 signature: 61d8d14ad1836318f287930873b26300 ******/
		%feature("compactdefaultargs") SetConicMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Returns the Geom_Conic conversion mode.
") SetConicMode;
		void SetConicMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SetLineMode ******/
		/****** md5 signature: 29d1d64e92a62cccfa7059b01427f10c ******/
		%feature("compactdefaultargs") SetLineMode;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets mode for conversion Geom_Line to bezier.
") SetLineMode;
		void SetLineMode(const Standard_Boolean mode);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SplitParams ******/
		/****** md5 signature: 58b035673d8a2196e251a31275012623 ******/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfReal>

Description
-----------
Returns the list of split parameters in original curve parametrisation.
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
		/****** ShapeUpgrade_FaceDivideArea::ShapeUpgrade_FaceDivideArea ******/
		/****** md5 signature: 4c4c484f7d0531e23bbe96393c090751 ******/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty constructor.
") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea();

		/****** ShapeUpgrade_FaceDivideArea::ShapeUpgrade_FaceDivideArea ******/
		/****** md5 signature: b030e94bc7a6d17fdc9eda7c43a6325e ******/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
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
		/****** ShapeUpgrade_FaceDivideArea::Perform ******/
		/****** md5 signature: 0a9ce5707853083f8879f76d7deee39d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theArea: float (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting and computes the resulting shell The context is used to keep track of former splittings.
") Perform;
		virtual Standard_Boolean Perform(const Standard_Real theArea = 0);

		/****** ShapeUpgrade_FaceDivideArea::SetNumbersUVSplits ******/
		/****** md5 signature: 5588ef3b7b0b00baa41cae130044c379 ******/
		%feature("compactdefaultargs") SetNumbersUVSplits;
		%feature("autodoc", "
Parameters
----------
theNbUsplits: int
theNbVsplits: int

Return
-------
None

Description
-----------
Set fixed numbers of splits in U and V directions. Only for 'Splitting By Numbers' mode.
") SetNumbersUVSplits;
		void SetNumbersUVSplits(const Standard_Integer theNbUsplits, const Standard_Integer theNbVsplits);

		/****** ShapeUpgrade_FaceDivideArea::SetSplittingByNumber ******/
		/****** md5 signature: a51e94810d1031ba91234e4f5dfceec6 ******/
		%feature("compactdefaultargs") SetSplittingByNumber;
		%feature("autodoc", "
Parameters
----------
theIsSplittingByNumber: bool

Return
-------
None

Description
-----------
Set splitting mode If the mode is 'splitting by number', the face is splitted approximately into <myNbParts> parts, the parts are similar to squares in 2D.
") SetSplittingByNumber;
		void SetSplittingByNumber(const Standard_Boolean theIsSplittingByNumber);

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
		/****** ShapeUpgrade_FixSmallBezierCurves::ShapeUpgrade_FixSmallBezierCurves ******/
		/****** md5 signature: 85b3ddde1185dccaaf99ab9f941729ef ******/
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallBezierCurves;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeUpgrade_FixSmallBezierCurves;
		 ShapeUpgrade_FixSmallBezierCurves();

		/****** ShapeUpgrade_FixSmallBezierCurves::Approx ******/
		/****** md5 signature: f8c48097c289ca08fe208ce8d9dbf385 ******/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "
Parameters
----------
Curve3d: Geom_Curve
Curve2d: Geom2d_Curve
Curve2dR: Geom2d_Curve

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
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
		/****** ShapeUpgrade_SplitCurve2dContinuity::ShapeUpgrade_SplitCurve2dContinuity ******/
		/****** md5 signature: 4c0a60d6abc147c8369a123be1d03918 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2dContinuity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitCurve2dContinuity;
		 ShapeUpgrade_SplitCurve2dContinuity();

		/****** ShapeUpgrade_SplitCurve2dContinuity::Compute ******/
		/****** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Calculates points for correction/splitting of the curve.
") Compute;
		virtual void Compute();

		/****** ShapeUpgrade_SplitCurve2dContinuity::SetCriterion ******/
		/****** md5 signature: 8d6387c402a873b2b21a29ea9b405c1c ******/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "
Parameters
----------
Criterion: GeomAbs_Shape

Return
-------
None

Description
-----------
Sets criterion for splitting.
") SetCriterion;
		void SetCriterion(const GeomAbs_Shape Criterion);

		/****** ShapeUpgrade_SplitCurve2dContinuity::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Sets tolerance.
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
		/****** ShapeUpgrade_SplitCurve3dContinuity::ShapeUpgrade_SplitCurve3dContinuity ******/
		/****** md5 signature: a9fc0fb900121ca76d8e827196223d16 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3dContinuity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitCurve3dContinuity;
		 ShapeUpgrade_SplitCurve3dContinuity();

		/****** ShapeUpgrade_SplitCurve3dContinuity::Compute ******/
		/****** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Calculates points for correction/splitting of the curve.
") Compute;
		virtual void Compute();

		/****** ShapeUpgrade_SplitCurve3dContinuity::GetCurve ******/
		/****** md5 signature: 47233261d5237642cfead20b7519a635 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Geom_Curve> & GetCurve();

		/****** ShapeUpgrade_SplitCurve3dContinuity::SetCriterion ******/
		/****** md5 signature: 8d6387c402a873b2b21a29ea9b405c1c ******/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "
Parameters
----------
Criterion: GeomAbs_Shape

Return
-------
None

Description
-----------
Sets criterion for splitting.
") SetCriterion;
		void SetCriterion(const GeomAbs_Shape Criterion);

		/****** ShapeUpgrade_SplitCurve3dContinuity::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Sets tolerance.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def shapeupgrade_C0BSplineToSequenceOfC1BSplineCurve(*args):
	return shapeupgrade.C0BSplineToSequenceOfC1BSplineCurve(*args)

@deprecated
def shapeupgrade_C0BSplineToSequenceOfC1BSplineCurve(*args):
	return shapeupgrade.C0BSplineToSequenceOfC1BSplineCurve(*args)

}
