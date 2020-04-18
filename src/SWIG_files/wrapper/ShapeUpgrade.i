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
		%feature("compactdefaultargs") ShapeUpgrade_RemoveLocations;
		%feature("autodoc", "Empy constructor.

Returns
-------
None
") ShapeUpgrade_RemoveLocations;
		 ShapeUpgrade_RemoveLocations();

		/****************** GetResult ******************/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Returns shape with removed locatins.

Returns
-------
TopoDS_Shape
") GetResult;
		TopoDS_Shape GetResult();

		/****************** ModifiedShape ******************/
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
		%feature("compactdefaultargs") RemoveLevel;
		%feature("autodoc", "Sets level starting with that location will be removed.value of level can be set to topabs_shape,topabs_compound,topabs_solid,topabs_shell,topabs_face.by default topabs_shape. in this case location will be removed for all shape types for exception of compound.

Returns
-------
TopAbs_ShapeEnum
") RemoveLevel;
		TopAbs_ShapeEnum RemoveLevel();

		/****************** SetRemoveLevel ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide();

		/****************** ShapeUpgrade_ShapeDivide ******************/
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
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Returns context with all the modifications made during last call(s) to perform() recorded.

Returns
-------
opencascade::handle<ShapeBuild_ReShape>
") GetContext;
		opencascade::handle<ShapeBuild_ReShape> GetContext();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "Returns message registrator.

Returns
-------
opencascade::handle<ShapeExtend_BasicMsgRegistrator>
") MsgRegistrator;
		opencascade::handle<ShapeExtend_BasicMsgRegistrator> MsgRegistrator();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Gives the resulting shape, or null shape if not done.

Returns
-------
TopoDS_Shape
") Result;
		TopoDS_Shape Result();

		/****************** SendMsg ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ShellSewing;
		%feature("autodoc", "Creates a shellsewing, empty.

Returns
-------
None
") ShapeUpgrade_ShellSewing;
		 ShapeUpgrade_ShellSewing();

		/****************** ApplySewing ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve;
		 ShapeUpgrade_SplitCurve();

		/****************** Build ******************/
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
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Calculates points for correction/splitting of the curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") SplitValues;
		%feature("autodoc", "Returns all the splitting values including the first and last parameters of the input curve merges input split values and new ones into myglobalknots.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") SplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & SplitValues();

		/****************** Status ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurface;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitSurface;
		 ShapeUpgrade_SplitSurface();

		/****************** Build ******************/
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
		%feature("compactdefaultargs") ResSurfaces;
		%feature("autodoc", "Returns obtained surfaces after splitting as compositesurface.

Returns
-------
opencascade::handle<ShapeExtend_CompositeSurface>
") ResSurfaces;
		const opencascade::handle<ShapeExtend_CompositeSurface> & ResSurfaces();

		/****************** SetUSplitValues ******************/
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
		%feature("compactdefaultargs") USplitValues;
		%feature("autodoc", "Returns all the u splitting values including the first and last parameters of the input surface.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") USplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & USplitValues();

		/****************** VSplitValues ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_Tool;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_Tool;
		 ShapeUpgrade_Tool();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns context.

Returns
-------
opencascade::handle<ShapeBuild_ReShape>
") Context;
		opencascade::handle<ShapeBuild_ReShape> Context();

		/****************** LimitTolerance ******************/
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
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Returns maximal allowed tolerance.

Returns
-------
float
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****************** MinTolerance ******************/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "Returns minimal allowed tolerance.

Returns
-------
float
") MinTolerance;
		Standard_Real MinTolerance();

		/****************** Precision ******************/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns basic precision value.

Returns
-------
float
") Precision;
		Standard_Real Precision();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain();

		/****************** ShapeUpgrade_UnifySameDomain ******************/
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
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs unification and builds the resulting shape.

Returns
-------
None
") Build;
		void Build();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of the processed shapes.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of the processed shapes.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> & History();

		/****************** Initialize ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		 ShapeUpgrade_ConvertSurfaceToBezierBasis();

		/****************** Build ******************/
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
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Returns the geom_bsplinesurface conversion mode.

Returns
-------
bool
") GetBSplineMode;
		Standard_Boolean GetBSplineMode();

		/****************** GetExtrusionMode ******************/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Returns the geom_surfaceoflinearextrusion conversion mode.

Returns
-------
bool
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode();

		/****************** GetPlaneMode ******************/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Returns the geom_pline conversion mode.

Returns
-------
bool
") GetPlaneMode;
		Standard_Boolean GetPlaneMode();

		/****************** GetRevolutionMode ******************/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Returns the geom_surfaceofrevolution conversion mode.

Returns
-------
bool
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode();

		/****************** Segments ******************/
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "Returns the grid of bezier based surfaces correspondent to original surface.

Returns
-------
opencascade::handle<ShapeExtend_CompositeSurface>
") Segments;
		opencascade::handle<ShapeExtend_CompositeSurface> Segments();

		/****************** SetBSplineMode ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_EdgeDivide;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_EdgeDivide;
		 ShapeUpgrade_EdgeDivide();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Compute ******************/
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
		%feature("compactdefaultargs") GetSplitCurve2dTool;
		%feature("autodoc", "Returns the tool for splitting pcurves.

Returns
-------
opencascade::handle<ShapeUpgrade_SplitCurve2d>
") GetSplitCurve2dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve2d> GetSplitCurve2dTool();

		/****************** GetSplitCurve3dTool ******************/
		%feature("compactdefaultargs") GetSplitCurve3dTool;
		%feature("autodoc", "Returns the tool for splitting 3d curves.

Returns
-------
opencascade::handle<ShapeUpgrade_SplitCurve3d>
") GetSplitCurve3dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve3d> GetSplitCurve3dTool();

		/****************** HasCurve2d ******************/
		%feature("compactdefaultargs") HasCurve2d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCurve2d;
		Standard_Boolean HasCurve2d();

		/****************** HasCurve3d ******************/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCurve3d;
		Standard_Boolean HasCurve3d();

		/****************** Knots2d ******************/
		%feature("compactdefaultargs") Knots2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") Knots2d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots2d();

		/****************** Knots3d ******************/
		%feature("compactdefaultargs") Knots3d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfReal>
") Knots3d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots3d();

		/****************** SetFace ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide();

		/****************** ShapeUpgrade_FaceDivide ******************/
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
		%feature("compactdefaultargs") GetSplitSurfaceTool;
		%feature("autodoc", "Returns the tool for splitting surfaces. this tool must be already initialized.

Returns
-------
opencascade::handle<ShapeUpgrade_SplitSurface>
") GetSplitSurfaceTool;
		virtual opencascade::handle<ShapeUpgrade_SplitSurface> GetSplitSurfaceTool();

		/****************** GetWireDivideTool ******************/
		%feature("compactdefaultargs") GetWireDivideTool;
		%feature("autodoc", "Returns the tool for dividing edges on face. this tool must be already initialized.

Returns
-------
opencascade::handle<ShapeUpgrade_WireDivide>
") GetWireDivideTool;
		virtual opencascade::handle<ShapeUpgrade_WireDivide> GetWireDivideTool();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs splitting and computes the resulting shell the context is used to keep track of former splittings in order to keep sharings. it is updated according to modifications made.

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Gives the resulting shell, or face, or null shape if not done.

Returns
-------
TopoDS_Shape
") Result;
		TopoDS_Shape Result();

		/****************** SetSplitSurfaceTool ******************/
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
		%feature("compactdefaultargs") SplitCurves;
		%feature("autodoc", "Performs splitting of curves of all the edges in the shape and divides these edges.

Returns
-------
bool
") SplitCurves;
		virtual Standard_Boolean SplitCurves();

		/****************** SplitSurface ******************/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "Performs splitting of surface and computes the shell from source face.

Returns
-------
bool
") SplitSurface;
		virtual Standard_Boolean SplitSurface();

		/****************** Status ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_FixSmallCurves;
		 ShapeUpgrade_FixSmallCurves();

		/****************** Approx ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires();

		/****************** ShapeUpgrade_RemoveInternalWires ******************/
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
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Get result shape.

Returns
-------
TopoDS_Shape
") GetResult;
		TopoDS_Shape GetResult();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Removes all internal wires having area less than area specified as minimal allowed area.

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") RemovedFaces;
		%feature("autodoc", "Returns sequence of removed faces.

Returns
-------
TopTools_SequenceOfShape
") RemovedFaces;
		const TopTools_SequenceOfShape & RemovedFaces();

		/****************** RemovedWires ******************/
		%feature("compactdefaultargs") RemovedWires;
		%feature("autodoc", "Returns sequence of removed faces.

Returns
-------
TopTools_SequenceOfShape
") RemovedWires;
		const TopTools_SequenceOfShape & RemovedWires();

		/****************** Status ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier();

		/****************** ShapeUpgrade_ShapeConvertToBezier ******************/
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
		%feature("compactdefaultargs") Get2dConversion;
		%feature("autodoc", "Returns the 2d conversion mode.

Returns
-------
bool
") Get2dConversion;
		Standard_Boolean Get2dConversion();

		/****************** Get3dCircleConversion ******************/
		%feature("compactdefaultargs") Get3dCircleConversion;
		%feature("autodoc", "Returns the geom_circle conversion mode.

Returns
-------
bool
") Get3dCircleConversion;
		Standard_Boolean Get3dCircleConversion();

		/****************** Get3dConicConversion ******************/
		%feature("compactdefaultargs") Get3dConicConversion;
		%feature("autodoc", "Returns the geom_conic conversion mode.

Returns
-------
bool
") Get3dConicConversion;
		Standard_Boolean Get3dConicConversion();

		/****************** Get3dConversion ******************/
		%feature("compactdefaultargs") Get3dConversion;
		%feature("autodoc", "Returns the 3d conversion mode.

Returns
-------
bool
") Get3dConversion;
		Standard_Boolean Get3dConversion();

		/****************** Get3dLineConversion ******************/
		%feature("compactdefaultargs") Get3dLineConversion;
		%feature("autodoc", "Returns the geom_line conversion mode.

Returns
-------
bool
") Get3dLineConversion;
		Standard_Boolean Get3dLineConversion();

		/****************** GetBSplineMode ******************/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "Returns the geom_bsplinesurface conversion mode.

Returns
-------
bool
") GetBSplineMode;
		Standard_Boolean GetBSplineMode();

		/****************** GetExtrusionMode ******************/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "Returns the geom_surfaceoflinearextrusion conversion mode.

Returns
-------
bool
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode();

		/****************** GetPlaneMode ******************/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "Returns the geom_pline conversion mode.

Returns
-------
bool
") GetPlaneMode;
		Standard_Boolean GetPlaneMode();

		/****************** GetRevolutionMode ******************/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "Returns the geom_surfaceofrevolution conversion mode.

Returns
-------
bool
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode();

		/****************** GetSurfaceConversion ******************/
		%feature("compactdefaultargs") GetSurfaceConversion;
		%feature("autodoc", "Returns the surface conversion mode.

Returns
-------
bool
") GetSurfaceConversion;
		Standard_Boolean GetSurfaceConversion();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Returns maximal angle.

Returns
-------
float
") MaxAngle;
		Standard_Real MaxAngle();

		/****************** SetMaxAngle ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea();

		/****************** ShapeUpgrade_ShapeDivideArea ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity();

		/****************** ShapeUpgrade_ShapeDivideContinuity ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve2d;
		 ShapeUpgrade_SplitCurve2d();

		/****************** Build ******************/
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
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColGeom2d_HArray1OfCurve>
") GetCurves;
		const opencascade::handle<TColGeom2d_HArray1OfCurve> & GetCurves();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve3d;
		 ShapeUpgrade_SplitCurve3d();

		/****************** Build ******************/
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
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColGeom_HArray1OfCurve>
") GetCurves;
		const opencascade::handle<TColGeom_HArray1OfCurve> & GetCurves();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "Returns maximal angle.

Returns
-------
float
") MaxAngle;
		Standard_Real MaxAngle();

		/****************** SetMaxAngle ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceArea;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitSurfaceArea;
		 ShapeUpgrade_SplitSurfaceArea();

		/****************** Compute ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceContinuity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitSurfaceContinuity;
		 ShapeUpgrade_SplitSurfaceContinuity();

		/****************** Compute ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_WireDivide;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_WireDivide;
		 ShapeUpgrade_WireDivide();

		/****************** GetEdgeDivideTool ******************/
		%feature("compactdefaultargs") GetEdgeDivideTool;
		%feature("autodoc", "Returns tool for splitting edges.

Returns
-------
opencascade::handle<ShapeUpgrade_EdgeDivide>
") GetEdgeDivideTool;
		virtual opencascade::handle<ShapeUpgrade_EdgeDivide> GetEdgeDivideTool();

		/****************** GetFixSmallCurveTool ******************/
		%feature("compactdefaultargs") GetFixSmallCurveTool;
		%feature("autodoc", "Returns tool for fixing small curves.

Returns
-------
opencascade::handle<ShapeUpgrade_FixSmallCurves>
") GetFixSmallCurveTool;
		opencascade::handle<ShapeUpgrade_FixSmallCurves> GetFixSmallCurveTool();

		/****************** GetTransferParamTool ******************/
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "Returns the tool for transfer of parameters.

Returns
-------
opencascade::handle<ShapeAnalysis_TransferParameters>
") GetTransferParamTool;
		virtual opencascade::handle<ShapeAnalysis_TransferParameters> GetTransferParamTool();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the resulting wire by splitting all the edges according to splitting criteria. all the modifications made are recorded in context (shapebuild_reshape). this tool is applied to all edges before splitting them in order to keep sharings. if no supporting face or surface is defined, only 3d splitting criteria are used.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetEdgeDivideTool ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ClosedEdgeDivide;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ClosedEdgeDivide;
		 ShapeUpgrade_ClosedEdgeDivide();

		/****************** Compute ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide();

		/****************** ShapeUpgrade_ClosedFaceDivide ******************/
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
		%feature("compactdefaultargs") GetNbSplitPoints;
		%feature("autodoc", "Returns the number of splitting points.

Returns
-------
int
") GetNbSplitPoints;
		Standard_Integer GetNbSplitPoints();

		/****************** SetNbSplitPoints ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve2dToBezier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ConvertCurve2dToBezier;
		 ShapeUpgrade_ConvertCurve2dToBezier();

		/****************** Build ******************/
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
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Converts curve into a list of beziers, and stores the splitting parameters on original curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** SplitParams ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve3dToBezier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_ConvertCurve3dToBezier;
		 ShapeUpgrade_ConvertCurve3dToBezier();

		/****************** Build ******************/
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
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Converts curve into a list of beziers, and stores the splitting parameters on original curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** GetCircleMode ******************/
		%feature("compactdefaultargs") GetCircleMode;
		%feature("autodoc", "Returns the geom_circle conversion mode.

Returns
-------
bool
") GetCircleMode;
		Standard_Boolean GetCircleMode();

		/****************** GetConicMode ******************/
		%feature("compactdefaultargs") GetConicMode;
		%feature("autodoc", "Performs converting and computes the resulting shape.

Returns
-------
bool
") GetConicMode;
		Standard_Boolean GetConicMode();

		/****************** GetLineMode ******************/
		%feature("compactdefaultargs") GetLineMode;
		%feature("autodoc", "Returns the geom_line conversion mode.

Returns
-------
bool
") GetLineMode;
		Standard_Boolean GetLineMode();

		/****************** SetCircleMode ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "Creates empty constructor.

Returns
-------
None
") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea();

		/****************** ShapeUpgrade_FaceDivideArea ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallBezierCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeUpgrade_FixSmallBezierCurves;
		 ShapeUpgrade_FixSmallBezierCurves();

		/****************** Approx ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2dContinuity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve2dContinuity;
		 ShapeUpgrade_SplitCurve2dContinuity();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Calculates points for correction/splitting of the curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** SetCriterion ******************/
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
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3dContinuity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeUpgrade_SplitCurve3dContinuity;
		 ShapeUpgrade_SplitCurve3dContinuity();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Calculates points for correction/splitting of the curve.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") GetCurve;
		const opencascade::handle<Geom_Curve> & GetCurve();

		/****************** SetCriterion ******************/
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
