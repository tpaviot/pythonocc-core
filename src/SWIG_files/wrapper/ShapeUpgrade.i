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
%define SHAPEUPGRADEDOCSTRING
"ShapeUpgrade module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_shapeupgrade.html"
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
#include<Geom2d_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<ShapeBuild_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Message_module.hxx>
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
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Geom2d.i
%import TopoDS.i
%import TopAbs.i
%import ShapeBuild.i
%import ShapeExtend.i
%import Message.i
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
		/****** md5 signature: aba0b26913e22d4e1167dfc53beed791 ******/
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom_BSplineCurve
seqBS: NCollection_HSequence<

Return
-------
bool

Description
-----------
Unifies same domain faces and edges of specified shape.
") C0BSplineToSequenceOfC1BSplineCurve;
		static bool C0BSplineToSequenceOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<NCollection_HSequence<opencascade::handle<Geom_BoundedCurve> > > & seqBS);

		/****** ShapeUpgrade::C0BSplineToSequenceOfC1BSplineCurve ******/
		/****** md5 signature: 6bfb9b9d3a89361e0687d37304f13e14 ******/
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "
Parameters
----------
BS: Geom2d_BSplineCurve
seqBS: NCollection_HSequence<

Return
-------
bool

Description
-----------
Converts C0 B-Spline curve into sequence of C1 B-Spline curves. This method splits B-Spline at the knots with multiplicities equal to degree, i.e. unlike method GeomConvert::C0BSplineToArrayOfC1BSplineCurve this one does not use any tolerance and therefore does not change the geometry of B-Spline. Returns True if C0 B-Spline was successfully split, else returns False (if BS is C1 B-Spline).
") C0BSplineToSequenceOfC1BSplineCurve;
		static bool C0BSplineToSequenceOfC1BSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & BS, opencascade::handle<NCollection_HSequence<opencascade::handle<Geom2d_BoundedCurve> > > & seqBS);

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
		/****** md5 signature: 496329fe3b13180d82d92739572c8840 ******/
		%feature("compactdefaultargs") GetModifiedShapesMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher>

Description
-----------
Returns map of modified shapes.
") GetModifiedShapesMap;
		const NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher> GetModifiedShapesMap();

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
		/****** md5 signature: 35c23a2673bf1176799e61ead5a16897 ******/
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
		bool Remove(const TopoDS_Shape & theShape);

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
		/****** md5 signature: adbcbe3c6738769427e4aef2cb0411b4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
newContext: bool (optional, default to true)

Return
-------
bool

Description
-----------
Performs splitting and computes the resulting shape If newContext is True (default), the internal context will be cleared at start, else previous substitutions will be acting.
") Perform;
		virtual bool Perform(const bool newContext = true);

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
Sets context with recorded modifications to be applied during next call(s) to Perform(shape,false).
") SetContext;
		void SetContext(const opencascade::handle<ShapeBuild_ReShape> & context);

		/****** ShapeUpgrade_ShapeDivide::SetEdgeMode ******/
		/****** md5 signature: 31c2dceac9265d661ebb7b6a6274a7b5 ******/
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
		void SetEdgeMode(const int aEdgeMode);

		/****** ShapeUpgrade_ShapeDivide::SetMaxTolerance ******/
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
Sets maximal allowed tolerance.
") SetMaxTolerance;
		void SetMaxTolerance(const double maxtol);

		/****** ShapeUpgrade_ShapeDivide::SetMinTolerance ******/
		/****** md5 signature: 33804631779269d0d8a6051263cb6c12 ******/
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
		void SetMinTolerance(const double mintol);

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
		/****** md5 signature: f9c41d0388ab8dedd7f97163565c355a ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
Prec: double

Return
-------
None

Description
-----------
Defines the spatial precision used for splitting.
") SetPrecision;
		void SetPrecision(const double Prec);

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
		/****** md5 signature: 97f5793106195949d6ea9b23bb7fd025 ******/
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
		void SetSurfaceSegmentMode(const bool Segment);

		/****** ShapeUpgrade_ShapeDivide::Status ******/
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
Queries the status of last call to Perform OK: no splitting was done (or no call to Perform) DONE1: some edges were split DONE2: surface was split FAIL1: some errors occurred.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** md5 signature: 52d1e0c7759e57d8efa209db2661951e ******/
		%feature("compactdefaultargs") ApplySewing;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
tol: double (optional, default to 0.0)

Return
-------
TopoDS_Shape

Description
-----------
Builds a new shape from a former one, by calling Sewing from BRepBuilderAPI. Rebuilt solids are oriented to be 'not infinite' //! If <tol> is not given (i.e. value 0. by default), it is computed as the mean tolerance recorded in <shape> //! If no shell has been sewed, this method returns the input shape.
") ApplySewing;
		TopoDS_Shape ApplySewing(const TopoDS_Shape & shape, const double tol = 0.0);

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
		/****** md5 signature: b681ceda349cf0ec307efcf6341adc0d ******/
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
		virtual void Build(const bool Segment);

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
		/****** md5 signature: 6d4d9b5ce5591f97039d1c3755e4ad20 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Initializes with curve first and last parameters.
") Init;
		void Init(const double First, const double Last);

		/****** ShapeUpgrade_SplitCurve::Perform ******/
		/****** md5 signature: 136ab4c37562512fa63ccf67b5bf0b93 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs correction/splitting of the curve. First defines splitting values by method Compute(), then calls method Build().
") Perform;
		void Perform(const bool Segment = true);

		/****** ShapeUpgrade_SplitCurve::SetSplitValues ******/
		/****** md5 signature: 8e738bd2d4c4909adddd0d4c5414ffcd ******/
		%feature("compactdefaultargs") SetSplitValues;
		%feature("autodoc", "
Parameters
----------
SplitValues: NCollection_HSequence<double

Return
-------
None

Description
-----------
Sets the parameters where splitting has to be done.
") SetSplitValues;
		void SetSplitValues(const opencascade::handle<NCollection_HSequence<double> > & SplitValues);

		/****** ShapeUpgrade_SplitCurve::SplitValues ******/
		/****** md5 signature: 4f80ad4ab1c3944f47be6b2230b596a4 ******/
		%feature("compactdefaultargs") SplitValues;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<double>>

Description
-----------
returns all the splitting values including the First and Last parameters of the input curve Merges input split values and new ones into myGlobalKnots.
") SplitValues;
		const opencascade::handle<NCollection_HSequence<double>> & SplitValues();

		/****** ShapeUpgrade_SplitCurve::Status ******/
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
Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one segment DONE2 - splitting is required, but gives only one segment (initial) DONE3 - geometric form of the curve or parametrisation is modified.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** md5 signature: b681ceda349cf0ec307efcf6341adc0d ******/
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
		virtual void Build(const bool Segment);

		/****** ShapeUpgrade_SplitSurface::Compute ******/
		/****** md5 signature: 4ad4406fa9bbbfc0a49e49c6b0f50d51 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to true)

Return
-------
None

Description
-----------
Calculates points for correction/splitting of the surface.
") Compute;
		virtual void Compute(const bool Segment = true);

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
		/****** md5 signature: 390cac988355beb6ec6991a27b1028a6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
UFirst: double
ULast: double
VFirst: double
VLast: double
theArea: double (optional, default to 0)

Return
-------
None

Description
-----------
Initializes with single supporting surface with bounding parameters.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const double UFirst, const double ULast, const double VFirst, const double VLast, const double theArea = 0);

		/****** ShapeUpgrade_SplitSurface::Perform ******/
		/****** md5 signature: 136ab4c37562512fa63ccf67b5bf0b93 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs correction/splitting of the surface. First defines splitting values by method Compute(), then calls method Build().
") Perform;
		void Perform(const bool Segment = true);

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
		/****** md5 signature: 0b9fe9a815997f957794dc2b342b9499 ******/
		%feature("compactdefaultargs") SetUSplitValues;
		%feature("autodoc", "
Parameters
----------
UValues: NCollection_HSequence<double

Return
-------
None

Description
-----------
Sets U parameters where splitting has to be done.
") SetUSplitValues;
		void SetUSplitValues(const opencascade::handle<NCollection_HSequence<double> > & UValues);

		/****** ShapeUpgrade_SplitSurface::SetVSplitValues ******/
		/****** md5 signature: 4ae528987506f72f2e98d3b2667b4139 ******/
		%feature("compactdefaultargs") SetVSplitValues;
		%feature("autodoc", "
Parameters
----------
VValues: NCollection_HSequence<double

Return
-------
None

Description
-----------
Sets V parameters where splitting has to be done.
") SetVSplitValues;
		void SetVSplitValues(const opencascade::handle<NCollection_HSequence<double> > & VValues);

		/****** ShapeUpgrade_SplitSurface::Status ******/
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
Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one patch DONE2 - splitting is required, but gives only single patch (initial) DONE3 - geometric form of the surface or parametrisation is modified.
") Status;
		bool Status(const ShapeExtend_Status status);

		/****** ShapeUpgrade_SplitSurface::USplitValues ******/
		/****** md5 signature: 56271d304c57aa6bc41593b449c751f9 ******/
		%feature("compactdefaultargs") USplitValues;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<double>>

Description
-----------
returns all the U splitting values including the First and Last parameters of the input surface.
") USplitValues;
		const opencascade::handle<NCollection_HSequence<double>> & USplitValues();

		/****** ShapeUpgrade_SplitSurface::VSplitValues ******/
		/****** md5 signature: 19a6193e3cd6bc63a83e5d642a864a72 ******/
		%feature("compactdefaultargs") VSplitValues;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<double>>

Description
-----------
returns all the splitting V values including the First and Last parameters of the input surface.
") VSplitValues;
		const opencascade::handle<NCollection_HSequence<double>> & VSplitValues();

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

		/****** ShapeUpgrade_Tool::MaxTolerance ******/
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

		/****** ShapeUpgrade_Tool::MinTolerance ******/
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

		/****** ShapeUpgrade_Tool::Precision ******/
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
Sets maximal allowed tolerance.
") SetMaxTolerance;
		void SetMaxTolerance(const double maxtol);

		/****** ShapeUpgrade_Tool::SetMinTolerance ******/
		/****** md5 signature: 33804631779269d0d8a6051263cb6c12 ******/
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
		void SetMinTolerance(const double mintol);

		/****** ShapeUpgrade_Tool::SetPrecision ******/
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
Sets basic precision value.
") SetPrecision;
		void SetPrecision(const double preci);

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
typedef NCollection_DataMap<TopoDS_Shape , NCollection_Map<TopoDS_Shape , TopTools_ShapeMapHasher>, TopTools_ShapeMapHasher> DataMapOfShapeMapOfShape;
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
		/****** md5 signature: aeea28809159f08b2b650b7df8b66f89 ******/
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
UnifyEdges: bool (optional, default to true)
UnifyFaces: bool (optional, default to true)
ConcatBSplines: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructor defining input shape and necessary flags. It does not perform unification.
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain(const TopoDS_Shape & aShape, const bool UnifyEdges = true, const bool UnifyFaces = true, const bool ConcatBSplines = false);

		/****** ShapeUpgrade_UnifySameDomain::AllowInternalEdges ******/
		/****** md5 signature: 549209f0c2352345b285a74a3c9af077 ******/
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
		void AllowInternalEdges(const bool theValue);

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
		/****** md5 signature: 793ca5b204ff05e9c87ae640f1c5f1dd ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
UnifyEdges: bool (optional, default to true)
UnifyFaces: bool (optional, default to true)
ConcatBSplines: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes with a shape and necessary flags. It does not perform unification. If you intend to nullify the History place holder do it after initialization.
") Initialize;
		void Initialize(const TopoDS_Shape & aShape, const bool UnifyEdges = true, const bool UnifyFaces = true, const bool ConcatBSplines = false);

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
		/****** md5 signature: 6e3460ec6151f8c3433fb26b6b71b9bb ******/
		%feature("compactdefaultargs") KeepShapes;
		%feature("autodoc", "
Parameters
----------
theShapes: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
Sets the map of shapes for avoid merging of the faces/edges. It allows passing a ready to use map instead of calling many times the method KeepShape.
") KeepShapes;
		void KeepShapes(const NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & theShapes);

		/****** ShapeUpgrade_UnifySameDomain::SetAngularTolerance ******/
		/****** md5 signature: b948a93ae53a8dea244687f51587d407 ******/
		%feature("compactdefaultargs") SetAngularTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets the angular tolerance. If two shapes form a connection angle greater than this value they will not be merged. Default value is Precision::Angular().
") SetAngularTolerance;
		void SetAngularTolerance(const double theValue);

		/****** ShapeUpgrade_UnifySameDomain::SetLinearTolerance ******/
		/****** md5 signature: 6c2a8589e6c08af3685623246837aca8 ******/
		%feature("compactdefaultargs") SetLinearTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets the linear tolerance. It plays the role of chord error when taking decision about merging of shapes. Default value is Precision::Confusion().
") SetLinearTolerance;
		void SetLinearTolerance(const double theValue);

		/****** ShapeUpgrade_UnifySameDomain::SetSafeInputMode ******/
		/****** md5 signature: 9ae95c5a6666cc9807848d10ba862576 ******/
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
		void SetSafeInputMode(bool theValue);

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
		/****** md5 signature: 3f9df2556981aed4effef4769b3af71e ******/
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
		void Build(const bool Segment);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::Compute ******/
		/****** md5 signature: ac8eaf8d85b089f794dc508b4acb3645 ******/
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
		void Compute(const bool Segment);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetBSplineMode ******/
		/****** md5 signature: b2a124222d5fa04479fb1ae7ae326e74 ******/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_BSplineSurface conversion mode.
") GetBSplineMode;
		bool GetBSplineMode();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetExtrusionMode ******/
		/****** md5 signature: 94ae4dc431cc1a431662501603f531a2 ******/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfLinearExtrusion conversion mode.
") GetExtrusionMode;
		bool GetExtrusionMode();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetPlaneMode ******/
		/****** md5 signature: 8264445075738f80b3780bf5e3e0e6a8 ******/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Pline conversion mode.
") GetPlaneMode;
		bool GetPlaneMode();

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::GetRevolutionMode ******/
		/****** md5 signature: b22e47ec2273bda9a4a867786134a33e ******/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfRevolution conversion mode.
") GetRevolutionMode;
		bool GetRevolutionMode();

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
		/****** md5 signature: 4c6c3552a4be98a640e978723086532c ******/
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
		void SetBSplineMode(const bool mode);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::SetExtrusionMode ******/
		/****** md5 signature: ecc813f3d08d3ec4e5329e21a138390a ******/
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
		void SetExtrusionMode(const bool mode);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::SetPlaneMode ******/
		/****** md5 signature: 8dac37368585af47dc97948752ee7e48 ******/
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
		void SetPlaneMode(const bool mode);

		/****** ShapeUpgrade_ConvertSurfaceToBezierBasis::SetRevolutionMode ******/
		/****** md5 signature: 98f31edf581262e4e10e93788776bc69 ******/
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
		void SetRevolutionMode(const bool mode);

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
		/****** md5 signature: d0fc3cc9f04379e0ae750a89baa2a9c6 ******/
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
		virtual bool Compute(const TopoDS_Edge & E);

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
		/****** md5 signature: 6c8dc7397f39563d17aba0dade9b8f90 ******/
		%feature("compactdefaultargs") HasCurve2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCurve2d;
		bool HasCurve2d();

		/****** ShapeUpgrade_EdgeDivide::HasCurve3d ******/
		/****** md5 signature: 9593a15ff567041be0fecdbeeaf5f4a1 ******/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCurve3d;
		bool HasCurve3d();

		/****** ShapeUpgrade_EdgeDivide::Knots2d ******/
		/****** md5 signature: e22d90a0716e00ec28075620fbc70c0c ******/
		%feature("compactdefaultargs") Knots2d;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<double>>

Description
-----------
No available documentation.
") Knots2d;
		opencascade::handle<NCollection_HSequence<double>> Knots2d();

		/****** ShapeUpgrade_EdgeDivide::Knots3d ******/
		/****** md5 signature: 906a3f46092f5bb3c53f6db47626e0b4 ******/
		%feature("compactdefaultargs") Knots3d;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<double>>

Description
-----------
No available documentation.
") Knots3d;
		opencascade::handle<NCollection_HSequence<double>> Knots3d();

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
		/****** md5 signature: 299f517018f3ec0253609c1ba5a6ac5c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theArea: double (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting and computes the resulting shell The context is used to keep track of former splittings in order to keep sharings. It is updated according to modifications made. The optional argument <theArea> is used to initialize the tool for splitting surface in the case of splitting into N parts where N is user-defined.
") Perform;
		virtual bool Perform(const double theArea = 0);

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
		/****** md5 signature: 97f5793106195949d6ea9b23bb7fd025 ******/
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
		void SetSurfaceSegmentMode(const bool Segment);

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
		/****** md5 signature: 96ab6d6e89d2306f7c9d5a5abd20f64c ******/
		%feature("compactdefaultargs") SplitCurves;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs splitting of curves of all the edges in the shape and divides these edges.
") SplitCurves;
		virtual bool SplitCurves();

		/****** ShapeUpgrade_FaceDivide::SplitSurface ******/
		/****** md5 signature: 5fc45aabdd2964a1e765137f537d404b ******/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "
Parameters
----------
theArea: double (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting of surface and computes the shell from source face. The optional argument <theArea> is used to initialize the tool for splitting surface in the case of splitting into N parts where N is user-defined.
") SplitSurface;
		virtual bool SplitSurface(const double theArea = 0);

		/****** ShapeUpgrade_FaceDivide::Status ******/
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
Queries the status of last call to Perform OK: no splitting was done (or no call to Perform) DONE1: some edges were split DONE2: surface was split DONE3: surface was modified without splitting FAIL1: some fails encountered during splitting wires FAIL2: face cannot be split.
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** md5 signature: 6359139b072d0c3c8a325b7c68888c7c ******/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "
Parameters
----------
Curve3d: Geom_Curve
Curve2d: Geom2d_Curve
Curve2dR: Geom2d_Curve

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Approx;
		virtual bool Approx(opencascade::handle<Geom_Curve> & Curve3d, opencascade::handle<Geom2d_Curve> & Curve2d, opencascade::handle<Geom2d_Curve> & Curve2dR, Standard_Real &OutValue, Standard_Real &OutValue);

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
Queries the status of last call to Perform OK: DONE1: DONE2: FAIL1:.
") Status;
		bool Status(const ShapeExtend_Status status);

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

		/****** ShapeUpgrade_RemoveInternalWires::MinArea ******/
		/****** md5 signature: a5bc313c7d754a096e9a16ac291563bc ******/
		%feature("compactdefaultargs") MinArea;
		%feature("autodoc", "Return
-------
double

Description
-----------
Set min area allowed for holes( all holes having area less than mi area will be removed).
") MinArea;
		double & MinArea();

		/****** ShapeUpgrade_RemoveInternalWires::Perform ******/
		/****** md5 signature: 836e5d294e107797e3a08ad4bfbbad29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Removes all internal wires having area less than area specified as minimal allowed area.
") Perform;
		bool Perform();

		/****** ShapeUpgrade_RemoveInternalWires::Perform ******/
		/****** md5 signature: 530d0780cf67ddda3ec6baab155719b9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSeqShapes: NCollection_Sequence<TopoDS_Shape>

Return
-------
bool

Description
-----------
If specified sequence of shape contains - 1.wires then these wires will be removed if they have area less than allowed min area. 2.faces than internal wires from these faces will be removed if they have area less than allowed min area.
") Perform;
		bool Perform(const NCollection_Sequence<TopoDS_Shape> & theSeqShapes);

		/****** ShapeUpgrade_RemoveInternalWires::RemoveFaceMode ******/
		/****** md5 signature: 25ae853bd11a468340feb0db72b8bd18 ******/
		%feature("compactdefaultargs") RemoveFaceMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Set mode which manage removing faces which have outer wires consisting only from edges belonginig to removed internal wires. By default it is equal to true.
") RemoveFaceMode;
		bool & RemoveFaceMode();

		/****** ShapeUpgrade_RemoveInternalWires::RemovedFaces ******/
		/****** md5 signature: 8bf84d8c87723b62ffd16dc8b601cdc9 ******/
		%feature("compactdefaultargs") RemovedFaces;
		%feature("autodoc", "Return
-------
NCollection_Sequence<TopoDS_Shape>

Description
-----------
Returns sequence of removed faces.
") RemovedFaces;
		const NCollection_Sequence<TopoDS_Shape> RemovedFaces();

		/****** ShapeUpgrade_RemoveInternalWires::RemovedWires ******/
		/****** md5 signature: d9aaef20d2cfc684289bb98006c82520 ******/
		%feature("compactdefaultargs") RemovedWires;
		%feature("autodoc", "Return
-------
NCollection_Sequence<TopoDS_Shape>

Description
-----------
Returns sequence of removed faces.
") RemovedWires;
		const NCollection_Sequence<TopoDS_Shape> RemovedWires();

		/****** ShapeUpgrade_RemoveInternalWires::Status ******/
		/****** md5 signature: d63ad8907bf1b94ad0798cc51997fd9f ******/
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
		bool Status(const ShapeExtend_Status theStatus);

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
		/****** md5 signature: 985c496f45efe3218eee1ab5e7761d84 ******/
		%feature("compactdefaultargs") Get2dConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the 2D conversion mode.
") Get2dConversion;
		bool Get2dConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dCircleConversion ******/
		/****** md5 signature: c0d1eae54fe7eba0535798b58f990cde ******/
		%feature("compactdefaultargs") Get3dCircleConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Circle conversion mode.
") Get3dCircleConversion;
		bool Get3dCircleConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dConicConversion ******/
		/****** md5 signature: b3249a19f163191924865c56bfb35dc6 ******/
		%feature("compactdefaultargs") Get3dConicConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Conic conversion mode.
") Get3dConicConversion;
		bool Get3dConicConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dConversion ******/
		/****** md5 signature: 703f4e9a66b85036dfdc9c453f804fad ******/
		%feature("compactdefaultargs") Get3dConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the 3D conversion mode.
") Get3dConversion;
		bool Get3dConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Get3dLineConversion ******/
		/****** md5 signature: a52b71a08f907960a104033a4e19c43e ******/
		%feature("compactdefaultargs") Get3dLineConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Line conversion mode.
") Get3dLineConversion;
		bool Get3dLineConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetBSplineMode ******/
		/****** md5 signature: b2a124222d5fa04479fb1ae7ae326e74 ******/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_BSplineSurface conversion mode.
") GetBSplineMode;
		bool GetBSplineMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetExtrusionMode ******/
		/****** md5 signature: 94ae4dc431cc1a431662501603f531a2 ******/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfLinearExtrusion conversion mode.
") GetExtrusionMode;
		bool GetExtrusionMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetPlaneMode ******/
		/****** md5 signature: 8264445075738f80b3780bf5e3e0e6a8 ******/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Pline conversion mode.
") GetPlaneMode;
		bool GetPlaneMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetRevolutionMode ******/
		/****** md5 signature: b22e47ec2273bda9a4a867786134a33e ******/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_SurfaceOfRevolution conversion mode.
") GetRevolutionMode;
		bool GetRevolutionMode();

		/****** ShapeUpgrade_ShapeConvertToBezier::GetSurfaceConversion ******/
		/****** md5 signature: 3f013ac06f34a462f8cfccfc3d4f2252 ******/
		%feature("compactdefaultargs") GetSurfaceConversion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the surface conversion mode.
") GetSurfaceConversion;
		bool GetSurfaceConversion();

		/****** ShapeUpgrade_ShapeConvertToBezier::Perform ******/
		/****** md5 signature: 5c61d991d265f0abbe9da42b65cf8218 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
newContext: bool (optional, default to true)

Return
-------
bool

Description
-----------
Performs converting and computes the resulting shape.
") Perform;
		bool Perform(const bool newContext = true);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set2dConversion ******/
		/****** md5 signature: a28d2629e1b81552e60330a6cb2e385d ******/
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
		void Set2dConversion(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dCircleConversion ******/
		/****** md5 signature: 66b64f3c5344a2153257111e76648927 ******/
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
		void Set3dCircleConversion(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dConicConversion ******/
		/****** md5 signature: 5046d495bf2b1398be8e2f6a97d47343 ******/
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
		void Set3dConicConversion(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dConversion ******/
		/****** md5 signature: e70fe3db20b06ae4c70457e18fe04f4a ******/
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
		void Set3dConversion(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::Set3dLineConversion ******/
		/****** md5 signature: 832bceec1ae8667d6185f4c6cbd4640a ******/
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
		void Set3dLineConversion(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetBSplineMode ******/
		/****** md5 signature: 4c6c3552a4be98a640e978723086532c ******/
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
		void SetBSplineMode(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetExtrusionMode ******/
		/****** md5 signature: ecc813f3d08d3ec4e5329e21a138390a ******/
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
		void SetExtrusionMode(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetPlaneMode ******/
		/****** md5 signature: 8dac37368585af47dc97948752ee7e48 ******/
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
		void SetPlaneMode(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetRevolutionMode ******/
		/****** md5 signature: 98f31edf581262e4e10e93788776bc69 ******/
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
		void SetRevolutionMode(const bool mode);

		/****** ShapeUpgrade_ShapeConvertToBezier::SetSurfaceConversion ******/
		/****** md5 signature: c257556759ca7a5a943d6b81792b31d3 ******/
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
		void SetSurfaceConversion(const bool mode);

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
		/****** md5 signature: 312908d08a5bb380780473f196f9fc29 ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: double

Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle(const double MaxAngle);

		/****** ShapeUpgrade_ShapeDivideAngle::ShapeUpgrade_ShapeDivideAngle ******/
		/****** md5 signature: 782d0450f14bbfb6c4fddf71bbf28cef ******/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: double
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize by a Shape.
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle(const double MaxAngle, const TopoDS_Shape & S);

		/****** ShapeUpgrade_ShapeDivideAngle::InitTool ******/
		/****** md5 signature: c9aa0d4ddfe1c317c452cf273790bce4 ******/
		%feature("compactdefaultargs") InitTool;
		%feature("autodoc", "
Parameters
----------
MaxAngle: double

Return
-------
None

Description
-----------
Resets tool for splitting face with given angle.
") InitTool;
		void InitTool(const double MaxAngle);

		/****** ShapeUpgrade_ShapeDivideAngle::MaxAngle ******/
		/****** md5 signature: 34dc9498dc7b4df9232ab08839cc9a3b ******/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximal angle.
") MaxAngle;
		double MaxAngle();

		/****** ShapeUpgrade_ShapeDivideAngle::SetMaxAngle ******/
		/****** md5 signature: 4ed2ecae8e6bcf3e07e42dbeabdcbe1a ******/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: double

Return
-------
None

Description
-----------
Set maximal angle (calls InitTool).
") SetMaxAngle;
		void SetMaxAngle(const double MaxAngle);

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

		/****** ShapeUpgrade_ShapeDivideArea::MaxArea ******/
		/****** md5 signature: e21f11e6ebd97eacac4da57267700800 ******/
		%feature("compactdefaultargs") MaxArea;
		%feature("autodoc", "Return
-------
double

Description
-----------
Set max area allowed for faces.
") MaxArea;
		double & MaxArea();

		/****** ShapeUpgrade_ShapeDivideArea::NbParts ******/
		/****** md5 signature: a551c387f586155ac0b1bb86064b958e ******/
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Set number of parts expected for the case of splitting by number.
") NbParts;
		int & NbParts();

		/****** ShapeUpgrade_ShapeDivideArea::SetNumbersUVSplits ******/
		/****** md5 signature: 08f9e64820ad6d1a70ffbeb9464b5475 ******/
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
		void SetNumbersUVSplits(const int theNbUsplits, const int theNbVsplits);

		/****** ShapeUpgrade_ShapeDivideArea::SetSplittingByNumber ******/
		/****** md5 signature: bbe85d132bbae7329605bed84abe92ea ******/
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
		void SetSplittingByNumber(const bool theIsSplittingByNumber);

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
		/****** md5 signature: 3f2b558b39da1c0dd08961119f102a35 ******/
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
		void SetNbSplitPoints(const int num);

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
		/****** md5 signature: 3f2b558b39da1c0dd08961119f102a35 ******/
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
		void SetNbSplitPoints(const int num);

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
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Sets tolerance.
") SetTolerance;
		void SetTolerance(const double Tol);

		/****** ShapeUpgrade_ShapeDivideContinuity::SetTolerance2d ******/
		/****** md5 signature: 946de5ad5723f02ab6eb4e6b6adbf9e3 ******/
		%feature("compactdefaultargs") SetTolerance2d;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Sets tolerance.
") SetTolerance2d;
		void SetTolerance2d(const double Tol);

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
		/****** md5 signature: 3f9df2556981aed4effef4769b3af71e ******/
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
		void Build(const bool Segment);

		/****** ShapeUpgrade_SplitCurve2d::GetCurves ******/
		/****** md5 signature: bc0597f0422fbf18e9e9fecac470edfe ******/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<Geom2d_Curve>>>

Description
-----------
No available documentation.
") GetCurves;
		const opencascade::handle<NCollection_HArray1<opencascade::handle<Geom2d_Curve>>> & GetCurves();

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
		/****** md5 signature: 53b166333221b4dab54e7b950ffc6438 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
First: double
Last: double

Return
-------
None

Description
-----------
Initializes with pcurve with its parameters.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const double First, const double Last);

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
		/****** md5 signature: 3f9df2556981aed4effef4769b3af71e ******/
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
		void Build(const bool Segment);

		/****** ShapeUpgrade_SplitCurve3d::GetCurves ******/
		/****** md5 signature: 8cac97146cc0327dd39ff4e9583b2766 ******/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<Geom_Curve>>>

Description
-----------
No available documentation.
") GetCurves;
		const opencascade::handle<NCollection_HArray1<opencascade::handle<Geom_Curve>>> & GetCurves();

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
		/****** md5 signature: 998d30dfdefe6d206575b437b25c41af ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
First: double
Last: double

Return
-------
None

Description
-----------
Initializes with curve with its parameters.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const double First, const double Last);

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
		/****** md5 signature: 834c64eb6de8345c00f49225e8495962 ******/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: double

Return
-------
None

Description
-----------
Empty constructor.
") ShapeUpgrade_SplitSurfaceAngle;
		 ShapeUpgrade_SplitSurfaceAngle(const double MaxAngle);

		/****** ShapeUpgrade_SplitSurfaceAngle::Compute ******/
		/****** md5 signature: ac8eaf8d85b089f794dc508b4acb3645 ******/
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
		void Compute(const bool Segment);

		/****** ShapeUpgrade_SplitSurfaceAngle::MaxAngle ******/
		/****** md5 signature: 34dc9498dc7b4df9232ab08839cc9a3b ******/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximal angle.
") MaxAngle;
		double MaxAngle();

		/****** ShapeUpgrade_SplitSurfaceAngle::SetMaxAngle ******/
		/****** md5 signature: 4ed2ecae8e6bcf3e07e42dbeabdcbe1a ******/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "
Parameters
----------
MaxAngle: double

Return
-------
None

Description
-----------
Set maximal angle.
") SetMaxAngle;
		void SetMaxAngle(const double MaxAngle);

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
		/****** md5 signature: 480aab96385d174643ab94f4cb9715f8 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Segment: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Compute;
		void Compute(const bool Segment = true);

		/****** ShapeUpgrade_SplitSurfaceArea::NbParts ******/
		/****** md5 signature: a551c387f586155ac0b1bb86064b958e ******/
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Set number of split for surfaces.
") NbParts;
		int & NbParts();

		/****** ShapeUpgrade_SplitSurfaceArea::SetNumbersUVSplits ******/
		/****** md5 signature: 08f9e64820ad6d1a70ffbeb9464b5475 ******/
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
		void SetNumbersUVSplits(const int theNbUsplits, const int theNbVsplits);

		/****** ShapeUpgrade_SplitSurfaceArea::SetSplittingIntoSquares ******/
		/****** md5 signature: add9b1761cac3ceca2f2930e84590803 ******/
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
		void SetSplittingIntoSquares(const bool theIsSplittingIntoSquares);

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
		/****** md5 signature: ac8eaf8d85b089f794dc508b4acb3645 ******/
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
		void Compute(const bool Segment);

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
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Sets tolerance.
") SetTolerance;
		void SetTolerance(const double Tol);

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
		/****** md5 signature: eeaaf3737748da8df631237c2a89fe46 ******/
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
		void SetEdgeMode(const int EdgeMode);

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
Queries status of last call to Perform() OK - no edges were split, wire left untouched DONE1 - some edges were split FAIL1 - some edges have no 3d curve (skipped) FAIL2 - some edges have no pcurve (skipped).
") Status;
		bool Status(const ShapeExtend_Status status);

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
		/****** md5 signature: 388a943d30de65a8d96332b7229363d9 ******/
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
		bool Compute(const TopoDS_Edge & anEdge);

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
		/****** md5 signature: 48b4501662be1661c3c6e6cee2d86ad0 ******/
		%feature("compactdefaultargs") GetNbSplitPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of splitting points.
") GetNbSplitPoints;
		int GetNbSplitPoints();

		/****** ShapeUpgrade_ClosedFaceDivide::SetNbSplitPoints ******/
		/****** md5 signature: 3f2b558b39da1c0dd08961119f102a35 ******/
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
		void SetNbSplitPoints(const int num);

		/****** ShapeUpgrade_ClosedFaceDivide::SplitSurface ******/
		/****** md5 signature: 5bf371176e18a89738b509ae5b18d7a6 ******/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "
Parameters
----------
theArea: double (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting of surface and computes the shell from source face.
") SplitSurface;
		bool SplitSurface(const double theArea = 0);

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
		/****** md5 signature: 3f9df2556981aed4effef4769b3af71e ******/
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
		void Build(const bool Segment);

		/****** ShapeUpgrade_ConvertCurve2dToBezier::Compute ******/
		/****** md5 signature: 99c9e5bb8deeeb0450679c724c8f0175 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts curve into a list of beziers, and stores the splitting parameters on original curve.
") Compute;
		void Compute();

		/****** ShapeUpgrade_ConvertCurve2dToBezier::SplitParams ******/
		/****** md5 signature: e912cfda5308fddafec462af6799ce9a ******/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<double>>

Description
-----------
Returns the list of split parameters in original curve parametrisation.
") SplitParams;
		opencascade::handle<NCollection_HSequence<double>> SplitParams();

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
		/****** md5 signature: 3f9df2556981aed4effef4769b3af71e ******/
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
		void Build(const bool Segment);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::Compute ******/
		/****** md5 signature: 99c9e5bb8deeeb0450679c724c8f0175 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Converts curve into a list of beziers, and stores the splitting parameters on original curve.
") Compute;
		void Compute();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::GetCircleMode ******/
		/****** md5 signature: 6b3c5951c4c693831934f2cbe24de026 ******/
		%feature("compactdefaultargs") GetCircleMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Circle conversion mode.
") GetCircleMode;
		bool GetCircleMode();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::GetConicMode ******/
		/****** md5 signature: 54f1eef343079e2c80e6c125a675c34a ******/
		%feature("compactdefaultargs") GetConicMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs converting and computes the resulting shape.
") GetConicMode;
		bool GetConicMode();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::GetLineMode ******/
		/****** md5 signature: 288eec26e01be7114d4fe0f305f53e6e ******/
		%feature("compactdefaultargs") GetLineMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Geom_Line conversion mode.
") GetLineMode;
		bool GetLineMode();

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SetCircleMode ******/
		/****** md5 signature: 8d034c7f754bf4874c64e25fad8ace76 ******/
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
		void SetCircleMode(const bool mode);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SetConicMode ******/
		/****** md5 signature: 7d26ba700ab222620c7c3c35601b4d08 ******/
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
		void SetConicMode(const bool mode);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SetLineMode ******/
		/****** md5 signature: 9149dcecc3162c407de8abed62c432f0 ******/
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
		void SetLineMode(const bool mode);

		/****** ShapeUpgrade_ConvertCurve3dToBezier::SplitParams ******/
		/****** md5 signature: e912cfda5308fddafec462af6799ce9a ******/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<double>>

Description
-----------
Returns the list of split parameters in original curve parametrisation.
") SplitParams;
		opencascade::handle<NCollection_HSequence<double>> SplitParams();

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

		/****** ShapeUpgrade_FaceDivideArea::MaxArea ******/
		/****** md5 signature: e21f11e6ebd97eacac4da57267700800 ******/
		%feature("compactdefaultargs") MaxArea;
		%feature("autodoc", "Return
-------
double

Description
-----------
Set max area allowed for faces.
") MaxArea;
		double & MaxArea();

		/****** ShapeUpgrade_FaceDivideArea::NbParts ******/
		/****** md5 signature: a551c387f586155ac0b1bb86064b958e ******/
		%feature("compactdefaultargs") NbParts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Set number of parts expected.
") NbParts;
		int & NbParts();

		/****** ShapeUpgrade_FaceDivideArea::Perform ******/
		/****** md5 signature: a39fc7ea3c1e96b690af6461cbdd0725 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theArea: double (optional, default to 0)

Return
-------
bool

Description
-----------
Performs splitting and computes the resulting shell The context is used to keep track of former splittings.
") Perform;
		bool Perform(const double theArea = 0);

		/****** ShapeUpgrade_FaceDivideArea::SetNumbersUVSplits ******/
		/****** md5 signature: 08f9e64820ad6d1a70ffbeb9464b5475 ******/
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
		void SetNumbersUVSplits(const int theNbUsplits, const int theNbVsplits);

		/****** ShapeUpgrade_FaceDivideArea::SetSplittingByNumber ******/
		/****** md5 signature: bbe85d132bbae7329605bed84abe92ea ******/
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
		void SetSplittingByNumber(const bool theIsSplittingByNumber);

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
		/****** md5 signature: 990797ae2221563a4a46182f4a51dda8 ******/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "
Parameters
----------
Curve3d: Geom_Curve
Curve2d: Geom2d_Curve
Curve2dR: Geom2d_Curve

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Approx;
		bool Approx(opencascade::handle<Geom_Curve> & Curve3d, opencascade::handle<Geom2d_Curve> & Curve2d, opencascade::handle<Geom2d_Curve> & Curve2dR, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 99c9e5bb8deeeb0450679c724c8f0175 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Calculates points for correction/splitting of the curve.
") Compute;
		void Compute();

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
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Sets tolerance.
") SetTolerance;
		void SetTolerance(const double Tol);

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
		/****** md5 signature: 99c9e5bb8deeeb0450679c724c8f0175 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Calculates points for correction/splitting of the curve.
") Compute;
		void Compute();

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
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Sets tolerance.
") SetTolerance;
		void SetTolerance(const double Tol);

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
