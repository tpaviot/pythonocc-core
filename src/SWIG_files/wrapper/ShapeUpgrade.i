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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", "* Unifies same domain faces and edges of specified shape
	:param BS:
	:type BS: Geom_BSplineCurve
	:param seqBS:
	:type seqBS: TColGeom_HSequenceOfBoundedCurve
	:rtype: bool") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve (const opencascade::handle<Geom_BSplineCurve> & BS,opencascade::handle<TColGeom_HSequenceOfBoundedCurve> & seqBS);

		/****************** C0BSplineToSequenceOfC1BSplineCurve ******************/
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "* Converts C0 B-Spline curve into sequence of C1 B-Spline curves. This method splits B-Spline at the knots with multiplicities equal to degree, i.e. unlike method GeomConvert::C0BSplineToArrayOfC1BSplineCurve this one does not use any tolerance and therefore does not change the geometry of B-Spline. Returns True if C0 B-Spline was successfully splitted, else returns False (if BS is C1 B-Spline).
	:param BS:
	:type BS: Geom2d_BSplineCurve
	:param seqBS:
	:type seqBS: TColGeom2d_HSequenceOfBoundedCurve
	:rtype: bool") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve (const opencascade::handle<Geom2d_BSplineCurve> & BS,opencascade::handle<TColGeom2d_HSequenceOfBoundedCurve> & seqBS);

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
		/****************** GetResult ******************/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "* Returns shape with removed locatins.
	:rtype: TopoDS_Shape") GetResult;
		TopoDS_Shape GetResult ();

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "* Returns modified shape obtained from initial shape.
	:param theInitShape:
	:type theInitShape: TopoDS_Shape
	:rtype: TopoDS_Shape") ModifiedShape;
		TopoDS_Shape ModifiedShape (const TopoDS_Shape & theInitShape);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes all location correspodingly to RemoveLevel.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & theShape);

		/****************** RemoveLevel ******************/
		%feature("compactdefaultargs") RemoveLevel;
		%feature("autodoc", "* sets level starting with that location will be removed.Value of level can be set to TopAbs_SHAPE,TopAbs_COMPOUND,TopAbs_SOLID,TopAbs_SHELL,TopAbs_FACE.By default TopAbs_SHAPE. In this case location will be removed for all shape types for exception of compound.
	:rtype: TopAbs_ShapeEnum") RemoveLevel;
		TopAbs_ShapeEnum RemoveLevel ();

		/****************** SetRemoveLevel ******************/
		%feature("compactdefaultargs") SetRemoveLevel;
		%feature("autodoc", "* sets level starting with that location will be removed, by default TopAbs_SHAPE. In this case locations will be kept for specified shape and if specified shape is TopAbs_COMPOUND for sub-shapes of first level.
	:param theLevel:
	:type theLevel: TopAbs_ShapeEnum
	:rtype: None") SetRemoveLevel;
		void SetRemoveLevel (const TopAbs_ShapeEnum theLevel);

		/****************** ShapeUpgrade_RemoveLocations ******************/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveLocations;
		%feature("autodoc", "* Empy constructor
	:rtype: None") ShapeUpgrade_RemoveLocations;
		 ShapeUpgrade_RemoveLocations ();

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
		/****************** GetContext ******************/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "* Returns context with all the modifications made during last call(s) to Perform() recorded
	:rtype: opencascade::handle<ShapeBuild_ReShape>") GetContext;
		opencascade::handle<ShapeBuild_ReShape> GetContext ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize by a Shape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** MsgRegistrator ******************/
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "* Returns message registrator
	:rtype: opencascade::handle<ShapeExtend_BasicMsgRegistrator>") MsgRegistrator;
		opencascade::handle<ShapeExtend_BasicMsgRegistrator> MsgRegistrator ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs splitting and computes the resulting shape If newContext is True (default), the internal context will be cleared at start, else previous substitutions will be acting.
	:param newContext: default value is Standard_True
	:type newContext: bool
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform (const Standard_Boolean newContext = Standard_True);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Gives the resulting Shape, or Null shape if not done.
	:rtype: TopoDS_Shape") Result;
		TopoDS_Shape Result ();

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "* Sends a message to be attached to the shape. Calls corresponding message of message registrator.
	:param shape:
	:type shape: TopoDS_Shape
	:param message:
	:type message: Message_Msg
	:param gravity: default value is Message_Info
	:type gravity: Message_Gravity
	:rtype: None") SendMsg;
		void SendMsg (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity = Message_Info);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets context with recorded modifications to be applied during next call(s) to Perform(shape,Standard_False)
	:param context:
	:type context: ShapeBuild_ReShape
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** SetEdgeMode ******************/
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "* Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.
	:param aEdgeMode:
	:type aEdgeMode: int
	:rtype: None") SetEdgeMode;
		void SetEdgeMode (const Standard_Integer aEdgeMode);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal allowed tolerance
	:param maxtol:
	:type maxtol: float
	:rtype: None") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "* Sets minimal allowed tolerance
	:param mintol:
	:type mintol: float
	:rtype: None") SetMinTolerance;
		void SetMinTolerance (const Standard_Real mintol);

		/****************** SetMsgRegistrator ******************/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "* Sets message registrator
	:param msgreg:
	:type msgreg: ShapeExtend_BasicMsgRegistrator
	:rtype: void") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Defines the spatial precision used for splitting
	:param Prec:
	:type Prec: float
	:rtype: None") SetPrecision;
		void SetPrecision (const Standard_Real Prec);

		/****************** SetSplitFaceTool ******************/
		%feature("compactdefaultargs") SetSplitFaceTool;
		%feature("autodoc", "* Sets the tool for splitting faces.
	:param splitFaceTool:
	:type splitFaceTool: ShapeUpgrade_FaceDivide
	:rtype: None") SetSplitFaceTool;
		void SetSplitFaceTool (const opencascade::handle<ShapeUpgrade_FaceDivide> & splitFaceTool);

		/****************** SetSurfaceSegmentMode ******************/
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "* Purpose sets mode for trimming (segment) surface by wire UV bounds.
	:param Segment:
	:type Segment: bool
	:rtype: None") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode (const Standard_Boolean Segment);

		/****************** ShapeUpgrade_ShapeDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", ":rtype: None") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide ();

		/****************** ShapeUpgrade_ShapeDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "* Initialize by a Shape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide (const TopoDS_Shape & S);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Queries the status of last call to Perform OK : no splitting was done (or no call to Perform) DONE1: some edges were splitted DONE2: surface was splitted FAIL1: some errors occured
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
		/****************** ApplySewing ******************/
		%feature("compactdefaultargs") ApplySewing;
		%feature("autodoc", "* Builds a new shape from a former one, by calling Sewing from BRepBuilderAPI. Rebuilt solids are oriented to be 'not infinite' //! If <tol> is not given (i.e. value 0. by default), it is computed as the mean tolerance recorded in <shape> //! If no shell has been sewed, this method returns the input shape
	:param shape:
	:type shape: TopoDS_Shape
	:param tol: default value is 0.0
	:type tol: float
	:rtype: TopoDS_Shape") ApplySewing;
		TopoDS_Shape ApplySewing (const TopoDS_Shape & shape,const Standard_Real tol = 0.0);

		/****************** ShapeUpgrade_ShellSewing ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShellSewing;
		%feature("autodoc", "* Creates a ShellSewing, empty
	:rtype: None") ShapeUpgrade_ShellSewing;
		 ShapeUpgrade_ShellSewing ();

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.
	:param Segment:
	:type Segment: bool
	:rtype: void") Build;
		virtual void Build (const Standard_Boolean Segment);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Calculates points for correction/splitting of the curve
	:rtype: void") Compute;
		virtual void Compute ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with curve first and last parameters.
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") Init;
		void Init (const Standard_Real First,const Standard_Real Last);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs correction/splitting of the curve. First defines splitting values by method Compute(), then calls method Build().
	:param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: None") Perform;
		void Perform (const Standard_Boolean Segment = Standard_True);

		/****************** SetSplitValues ******************/
		%feature("compactdefaultargs") SetSplitValues;
		%feature("autodoc", "* Sets the parameters where splitting has to be done.
	:param SplitValues:
	:type SplitValues: TColStd_HSequenceOfReal
	:rtype: None") SetSplitValues;
		void SetSplitValues (const opencascade::handle<TColStd_HSequenceOfReal> & SplitValues);

		/****************** ShapeUpgrade_SplitCurve ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitCurve;
		 ShapeUpgrade_SplitCurve ();

		/****************** SplitValues ******************/
		%feature("compactdefaultargs") SplitValues;
		%feature("autodoc", "* returns all the splitting values including the First and Last parameters of the input curve Merges input split values and new ones into myGlobalKnots
	:rtype: opencascade::handle<TColStd_HSequenceOfReal>") SplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & SplitValues ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one segment DONE2 - splitting is required, but gives only one segment (initial) DONE3 - geometric form of the curve or parametrisation is modified
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Performs splitting of the supporting surface. If resulting surface is B-Spline and Segment is True, the result is composed with segments of the surface bounded by the U and V SplitValues (method Geom_BSplineSurface::Segment is used). If Segment is False, the result is composed with Geom_RectangularTrimmedSurface all based on the same complete surface. Fields myNbResultingRow and myNbResultingCol must be set to specify the size of resulting grid of surfaces.
	:param Segment:
	:type Segment: bool
	:rtype: void") Build;
		virtual void Build (const Standard_Boolean Segment);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Calculates points for correction/splitting of the surface.
	:param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: void") Compute;
		virtual void Compute (const Standard_Boolean Segment = Standard_True);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with single supporting surface.
	:param S:
	:type S: Geom_Surface
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom_Surface> & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with single supporting surface with bounding parameters.
	:param S:
	:type S: Geom_Surface
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom_Surface> & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs correction/splitting of the surface. First defines splitting values by method Compute(), then calls method Build().
	:param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: None") Perform;
		void Perform (const Standard_Boolean Segment = Standard_True);

		/****************** ResSurfaces ******************/
		%feature("compactdefaultargs") ResSurfaces;
		%feature("autodoc", "* Returns obtained surfaces after splitting as CompositeSurface
	:rtype: opencascade::handle<ShapeExtend_CompositeSurface>") ResSurfaces;
		const opencascade::handle<ShapeExtend_CompositeSurface> & ResSurfaces ();

		/****************** SetUSplitValues ******************/
		%feature("compactdefaultargs") SetUSplitValues;
		%feature("autodoc", "* Sets U parameters where splitting has to be done
	:param UValues:
	:type UValues: TColStd_HSequenceOfReal
	:rtype: None") SetUSplitValues;
		void SetUSplitValues (const opencascade::handle<TColStd_HSequenceOfReal> & UValues);

		/****************** SetVSplitValues ******************/
		%feature("compactdefaultargs") SetVSplitValues;
		%feature("autodoc", "* Sets V parameters where splitting has to be done
	:param VValues:
	:type VValues: TColStd_HSequenceOfReal
	:rtype: None") SetVSplitValues;
		void SetVSplitValues (const opencascade::handle<TColStd_HSequenceOfReal> & VValues);

		/****************** ShapeUpgrade_SplitSurface ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurface;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitSurface;
		 ShapeUpgrade_SplitSurface ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one patch DONE2 - splitting is required, but gives only single patch (initial) DONE3 - geometric form of the surface or parametrisation is modified
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

		/****************** USplitValues ******************/
		%feature("compactdefaultargs") USplitValues;
		%feature("autodoc", "* returns all the U splitting values including the First and Last parameters of the input surface
	:rtype: opencascade::handle<TColStd_HSequenceOfReal>") USplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & USplitValues ();

		/****************** VSplitValues ******************/
		%feature("compactdefaultargs") VSplitValues;
		%feature("autodoc", "* returns all the splitting V values including the First and Last parameters of the input surface
	:rtype: opencascade::handle<TColStd_HSequenceOfReal>") VSplitValues;
		const opencascade::handle<TColStd_HSequenceOfReal> & VSplitValues ();

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

		/****************** Precision ******************/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "* Returns basic precision value
	:rtype: float") Precision;
		Standard_Real Precision ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Copy all fields from another Root object
	:param tool:
	:type tool: ShapeUpgrade_Tool
	:rtype: None") Set;
		void Set (const opencascade::handle<ShapeUpgrade_Tool> & tool);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets context
	:param context:
	:type context: ShapeBuild_ReShape
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<ShapeBuild_ReShape> & context);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "* Sets maximal allowed tolerance
	:param maxtol:
	:type maxtol: float
	:rtype: None") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "* Sets minimal allowed tolerance
	:param mintol:
	:type mintol: float
	:rtype: None") SetMinTolerance;
		void SetMinTolerance (const Standard_Real mintol);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets basic precision value
	:param preci:
	:type preci: float
	:rtype: None") SetPrecision;
		void SetPrecision (const Standard_Real preci);

		/****************** ShapeUpgrade_Tool ******************/
		%feature("compactdefaultargs") ShapeUpgrade_Tool;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeUpgrade_Tool;
		 ShapeUpgrade_Tool ();

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
		/****************** AllowInternalEdges ******************/
		%feature("compactdefaultargs") AllowInternalEdges;
		%feature("autodoc", "* Sets the flag defining whether it is allowed to create internal edges inside merged faces in the case of non-manifold topology. Without this flag merging through multi connected edge is forbidden. Default value is false.
	:param theValue:
	:type theValue: bool
	:rtype: None") AllowInternalEdges;
		void AllowInternalEdges (const Standard_Boolean theValue);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Performs unification and builds the resulting shape.
	:rtype: None") Build;
		void Build ();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "* Returns the history of the processed shapes.
	:rtype: opencascade::handle<BRepTools_History>") History;
		const opencascade::handle<BRepTools_History> & History ();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "* Returns the history of the processed shapes.
	:rtype: opencascade::handle<BRepTools_History>") History;
		opencascade::handle<BRepTools_History> & History ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes with a shape and necessary flags. It does not perform unification. If you intend to nullify the History place holder do it after initialization.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param UnifyEdges: default value is Standard_True
	:type UnifyEdges: bool
	:param UnifyFaces: default value is Standard_True
	:type UnifyFaces: bool
	:param ConcatBSplines: default value is Standard_False
	:type ConcatBSplines: bool
	:rtype: None") Initialize;
		void Initialize (const TopoDS_Shape & aShape,const Standard_Boolean UnifyEdges = Standard_True,const Standard_Boolean UnifyFaces = Standard_True,const Standard_Boolean ConcatBSplines = Standard_False);

		/****************** KeepShape ******************/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "* Sets the shape for avoid merging of the faces/edges. This shape can be vertex or edge. If the shape is a vertex it forbids merging of connected edges. If the shape is a edge it forbids merging of connected faces. This method can be called several times to keep several shapes.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") KeepShape;
		void KeepShape (const TopoDS_Shape & theShape);

		/****************** KeepShapes ******************/
		%feature("compactdefaultargs") KeepShapes;
		%feature("autodoc", "* Sets the map of shapes for avoid merging of the faces/edges. It allows passing a ready to use map instead of calling many times the method KeepShape.
	:param theShapes:
	:type theShapes: TopTools_MapOfShape
	:rtype: None") KeepShapes;
		void KeepShapes (const TopTools_MapOfShape & theShapes);

		/****************** SetAngularTolerance ******************/
		%feature("compactdefaultargs") SetAngularTolerance;
		%feature("autodoc", "* Sets the angular tolerance. If two shapes form a connection angle greater than this value they will not be merged. Default value is Precision::Angular().
	:param theValue:
	:type theValue: float
	:rtype: None") SetAngularTolerance;
		void SetAngularTolerance (const Standard_Real theValue);

		/****************** SetLinearTolerance ******************/
		%feature("compactdefaultargs") SetLinearTolerance;
		%feature("autodoc", "* Sets the linear tolerance. It plays the role of chord error when taking decision about merging of shapes. Default value is Precision::Confusion().
	:param theValue:
	:type theValue: float
	:rtype: None") SetLinearTolerance;
		void SetLinearTolerance (const Standard_Real theValue);

		/****************** SetSafeInputMode ******************/
		%feature("compactdefaultargs") SetSafeInputMode;
		%feature("autodoc", "* Sets the flag defining the behavior of the algorithm regarding modification of input shape. If this flag is equal to True then the input (original) shape can't be modified during modification process. Default value is true.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetSafeInputMode;
		void SetSafeInputMode (Standard_Boolean theValue);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Gives the resulting shape
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** ShapeUpgrade_UnifySameDomain ******************/
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain ();

		/****************** ShapeUpgrade_UnifySameDomain ******************/
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "* Constructor defining input shape and necessary flags. It does not perform unification.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param UnifyEdges: default value is Standard_True
	:type UnifyEdges: bool
	:param UnifyFaces: default value is Standard_True
	:type UnifyFaces: bool
	:param ConcatBSplines: default value is Standard_False
	:type ConcatBSplines: bool
	:rtype: None") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain (const TopoDS_Shape & aShape,const Standard_Boolean UnifyEdges = Standard_True,const Standard_Boolean UnifyFaces = Standard_True,const Standard_Boolean ConcatBSplines = Standard_False);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Splits a list of beziers computed by Compute method according the split values and splitting parameters.
	:param Segment:
	:type Segment: bool
	:rtype: void") Build;
		virtual void Build (const Standard_Boolean Segment);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Converts surface into a grid of bezier based surfaces, and stores this grid.
	:param Segment:
	:type Segment: bool
	:rtype: void") Compute;
		virtual void Compute (const Standard_Boolean Segment);

		/****************** GetBSplineMode ******************/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "* Returns the Geom_BSplineSurface conversion mode.
	:rtype: bool") GetBSplineMode;
		Standard_Boolean GetBSplineMode ();

		/****************** GetExtrusionMode ******************/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "* Returns the Geom_SurfaceOfLinearExtrusion conversion mode.
	:rtype: bool") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode ();

		/****************** GetPlaneMode ******************/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "* Returns the Geom_Pline conversion mode.
	:rtype: bool") GetPlaneMode;
		Standard_Boolean GetPlaneMode ();

		/****************** GetRevolutionMode ******************/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "* Returns the Geom_SurfaceOfRevolution conversion mode.
	:rtype: bool") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode ();

		/****************** Segments ******************/
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "* Returns the grid of bezier based surfaces correspondent to original surface.
	:rtype: opencascade::handle<ShapeExtend_CompositeSurface>") Segments;
		opencascade::handle<ShapeExtend_CompositeSurface> Segments ();

		/****************** SetBSplineMode ******************/
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "* Sets mode for conversion Geom_BSplineSurface to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetBSplineMode;
		void SetBSplineMode (const Standard_Boolean mode);

		/****************** SetExtrusionMode ******************/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "* Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean mode);

		/****************** SetPlaneMode ******************/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "* Sets mode for conversion Geom_Plane to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean mode);

		/****************** SetRevolutionMode ******************/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "* Sets mode for conversion Geom_SurfaceOfRevolution to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean mode);

		/****************** ShapeUpgrade_ConvertSurfaceToBezierBasis ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		 ShapeUpgrade_ConvertSurfaceToBezierBasis ();

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
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: bool") Compute;
		virtual Standard_Boolean Compute (const TopoDS_Edge & E);

		/****************** GetSplitCurve2dTool ******************/
		%feature("compactdefaultargs") GetSplitCurve2dTool;
		%feature("autodoc", "* Returns the tool for splitting pcurves.
	:rtype: opencascade::handle<ShapeUpgrade_SplitCurve2d>") GetSplitCurve2dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve2d> GetSplitCurve2dTool ();

		/****************** GetSplitCurve3dTool ******************/
		%feature("compactdefaultargs") GetSplitCurve3dTool;
		%feature("autodoc", "* Returns the tool for splitting 3D curves.
	:rtype: opencascade::handle<ShapeUpgrade_SplitCurve3d>") GetSplitCurve3dTool;
		virtual opencascade::handle<ShapeUpgrade_SplitCurve3d> GetSplitCurve3dTool ();

		/****************** HasCurve2d ******************/
		%feature("compactdefaultargs") HasCurve2d;
		%feature("autodoc", ":rtype: bool") HasCurve2d;
		Standard_Boolean HasCurve2d ();

		/****************** HasCurve3d ******************/
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", ":rtype: bool") HasCurve3d;
		Standard_Boolean HasCurve3d ();

		/****************** Knots2d ******************/
		%feature("compactdefaultargs") Knots2d;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HSequenceOfReal>") Knots2d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots2d ();

		/****************** Knots3d ******************/
		%feature("compactdefaultargs") Knots3d;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HSequenceOfReal>") Knots3d;
		opencascade::handle<TColStd_HSequenceOfReal> Knots3d ();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "* Sets supporting surface by face
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & F);

		/****************** SetSplitCurve2dTool ******************/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "* Sets the tool for splitting pcurves.
	:param splitCurve2dTool:
	:type splitCurve2dTool: ShapeUpgrade_SplitCurve2d
	:rtype: None") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****************** SetSplitCurve3dTool ******************/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "* Sets the tool for splitting 3D curves.
	:param splitCurve3dTool:
	:type splitCurve3dTool: ShapeUpgrade_SplitCurve3d
	:rtype: None") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

		/****************** ShapeUpgrade_EdgeDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_EdgeDivide;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeUpgrade_EdgeDivide;
		 ShapeUpgrade_EdgeDivide ();

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
		/****************** GetSplitSurfaceTool ******************/
		%feature("compactdefaultargs") GetSplitSurfaceTool;
		%feature("autodoc", "* Returns the tool for splitting surfaces. This tool must be already initialized.
	:rtype: opencascade::handle<ShapeUpgrade_SplitSurface>") GetSplitSurfaceTool;
		virtual opencascade::handle<ShapeUpgrade_SplitSurface> GetSplitSurfaceTool ();

		/****************** GetWireDivideTool ******************/
		%feature("compactdefaultargs") GetWireDivideTool;
		%feature("autodoc", "* Returns the tool for dividing edges on Face. This tool must be already initialized.
	:rtype: opencascade::handle<ShapeUpgrade_WireDivide>") GetWireDivideTool;
		virtual opencascade::handle<ShapeUpgrade_WireDivide> GetWireDivideTool ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize by a Face.
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Face & F);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs splitting and computes the resulting shell The context is used to keep track of former splittings in order to keep sharings. It is updated according to modifications made.
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Gives the resulting Shell, or Face, or Null shape if not done.
	:rtype: TopoDS_Shape") Result;
		TopoDS_Shape Result ();

		/****************** SetSplitSurfaceTool ******************/
		%feature("compactdefaultargs") SetSplitSurfaceTool;
		%feature("autodoc", "* Sets the tool for splitting surfaces.
	:param splitSurfaceTool:
	:type splitSurfaceTool: ShapeUpgrade_SplitSurface
	:rtype: None") SetSplitSurfaceTool;
		void SetSplitSurfaceTool (const opencascade::handle<ShapeUpgrade_SplitSurface> & splitSurfaceTool);

		/****************** SetSurfaceSegmentMode ******************/
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "* Purpose sets mode for trimming (segment) surface by wire UV bounds.
	:param Segment:
	:type Segment: bool
	:rtype: None") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode (const Standard_Boolean Segment);

		/****************** SetWireDivideTool ******************/
		%feature("compactdefaultargs") SetWireDivideTool;
		%feature("autodoc", "* Sets the tool for dividing edges on Face.
	:param wireDivideTool:
	:type wireDivideTool: ShapeUpgrade_WireDivide
	:rtype: None") SetWireDivideTool;
		void SetWireDivideTool (const opencascade::handle<ShapeUpgrade_WireDivide> & wireDivideTool);

		/****************** ShapeUpgrade_FaceDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "* Creates empty constructor.
	:rtype: None") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide ();

		/****************** ShapeUpgrade_FaceDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "* Initialize by a Face.
	:param F:
	:type F: TopoDS_Face
	:rtype: None") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide (const TopoDS_Face & F);

		/****************** SplitCurves ******************/
		%feature("compactdefaultargs") SplitCurves;
		%feature("autodoc", "* Performs splitting of curves of all the edges in the shape and divides these edges.
	:rtype: bool") SplitCurves;
		virtual Standard_Boolean SplitCurves ();

		/****************** SplitSurface ******************/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "* Performs splitting of surface and computes the shell from source face.
	:rtype: bool") SplitSurface;
		virtual Standard_Boolean SplitSurface ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Queries the status of last call to Perform OK : no splitting was done (or no call to Perform) DONE1: some edges were splitted DONE2: surface was splitted DONE3: surface was modified without splitting FAIL1: some fails encountered during splitting wires FAIL2: face cannot be splitted
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
		/****************** Approx ******************/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", ":param Curve3d:
	:type Curve3d: Geom_Curve
	:param Curve2d:
	:type Curve2d: Geom2d_Curve
	:param Curve2dR:
	:type Curve2dR: Geom2d_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: bool") Approx;
		virtual Standard_Boolean Approx (opencascade::handle<Geom_Curve> & Curve3d,opencascade::handle<Geom2d_Curve> & Curve2d,opencascade::handle<Geom2d_Curve> & Curve2dR,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);

		/****************** SetSplitCurve2dTool ******************/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "* Sets the tool for splitting pcurves.
	:param splitCurve2dTool:
	:type splitCurve2dTool: ShapeUpgrade_SplitCurve2d
	:rtype: None") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****************** SetSplitCurve3dTool ******************/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "* Sets the tool for splitting 3D curves.
	:param splitCurve3dTool:
	:type splitCurve3dTool: ShapeUpgrade_SplitCurve3d
	:rtype: None") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

		/****************** ShapeUpgrade_FixSmallCurves ******************/
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallCurves;
		%feature("autodoc", ":rtype: None") ShapeUpgrade_FixSmallCurves;
		 ShapeUpgrade_FixSmallCurves ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Queries the status of last call to Perform OK : DONE1: DONE2: FAIL1:
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

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
		/****************** GetResult ******************/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "* Get result shape
	:rtype: TopoDS_Shape") GetResult;
		TopoDS_Shape GetResult ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize by a Shape.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & theShape);


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
		%feature("autodoc", "* Removes all internal wires having area less than area specified as minimal allowed area
	:rtype: bool") Perform;
		Standard_Boolean Perform ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* If specified sequence of shape contains - 1.wires then these wires will be removed if they have area less than allowed min area. 2.faces than internal wires from these faces will be removed if they have area less than allowed min area.
	:param theSeqShapes:
	:type theSeqShapes: TopTools_SequenceOfShape
	:rtype: bool") Perform;
		Standard_Boolean Perform (const TopTools_SequenceOfShape & theSeqShapes);


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
		%feature("autodoc", "* Returns sequence of removed faces.
	:rtype: TopTools_SequenceOfShape") RemovedFaces;
		const TopTools_SequenceOfShape & RemovedFaces ();

		/****************** RemovedWires ******************/
		%feature("compactdefaultargs") RemovedWires;
		%feature("autodoc", "* Returns sequence of removed faces.
	:rtype: TopTools_SequenceOfShape") RemovedWires;
		const TopTools_SequenceOfShape & RemovedWires ();

		/****************** ShapeUpgrade_RemoveInternalWires ******************/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "* Creates empty constructor.
	:rtype: None") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires ();

		/****************** ShapeUpgrade_RemoveInternalWires ******************/
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", ":param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires (const TopoDS_Shape & theShape);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Queries status of last call to Perform() : OK - nothing was done :DONE1 - internal wires were removed :DONE2 - small faces were removed. :FAIL1 - initial shape is not specified :FAIL2 - specified sub-shape is not belonged to inotial shape.
	:param theStatus:
	:type theStatus: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status theStatus);

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
		/****************** Get2dConversion ******************/
		%feature("compactdefaultargs") Get2dConversion;
		%feature("autodoc", "* Returns the 2D conversion mode.
	:rtype: bool") Get2dConversion;
		Standard_Boolean Get2dConversion ();

		/****************** Get3dCircleConversion ******************/
		%feature("compactdefaultargs") Get3dCircleConversion;
		%feature("autodoc", "* Returns the Geom_Circle conversion mode.
	:rtype: bool") Get3dCircleConversion;
		Standard_Boolean Get3dCircleConversion ();

		/****************** Get3dConicConversion ******************/
		%feature("compactdefaultargs") Get3dConicConversion;
		%feature("autodoc", "* Returns the Geom_Conic conversion mode.
	:rtype: bool") Get3dConicConversion;
		Standard_Boolean Get3dConicConversion ();

		/****************** Get3dConversion ******************/
		%feature("compactdefaultargs") Get3dConversion;
		%feature("autodoc", "* Returns the 3D conversion mode.
	:rtype: bool") Get3dConversion;
		Standard_Boolean Get3dConversion ();

		/****************** Get3dLineConversion ******************/
		%feature("compactdefaultargs") Get3dLineConversion;
		%feature("autodoc", "* Returns the Geom_Line conversion mode.
	:rtype: bool") Get3dLineConversion;
		Standard_Boolean Get3dLineConversion ();

		/****************** GetBSplineMode ******************/
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "* Returns the Geom_BSplineSurface conversion mode.
	:rtype: bool") GetBSplineMode;
		Standard_Boolean GetBSplineMode ();

		/****************** GetExtrusionMode ******************/
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "* Returns the Geom_SurfaceOfLinearExtrusion conversion mode.
	:rtype: bool") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode ();

		/****************** GetPlaneMode ******************/
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "* Returns the Geom_Pline conversion mode.
	:rtype: bool") GetPlaneMode;
		Standard_Boolean GetPlaneMode ();

		/****************** GetRevolutionMode ******************/
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "* Returns the Geom_SurfaceOfRevolution conversion mode.
	:rtype: bool") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode ();

		/****************** GetSurfaceConversion ******************/
		%feature("compactdefaultargs") GetSurfaceConversion;
		%feature("autodoc", "* Returns the surface conversion mode.
	:rtype: bool") GetSurfaceConversion;
		Standard_Boolean GetSurfaceConversion ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs converting and computes the resulting shape
	:param newContext: default value is Standard_True
	:type newContext: bool
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform (const Standard_Boolean newContext = Standard_True);

		/****************** Set2dConversion ******************/
		%feature("compactdefaultargs") Set2dConversion;
		%feature("autodoc", "* Sets mode for conversion 2D curves to bezier.
	:param mode:
	:type mode: bool
	:rtype: None") Set2dConversion;
		void Set2dConversion (const Standard_Boolean mode);

		/****************** Set3dCircleConversion ******************/
		%feature("compactdefaultargs") Set3dCircleConversion;
		%feature("autodoc", "* Sets mode for conversion Geom_Circle to bezier.
	:param mode:
	:type mode: bool
	:rtype: None") Set3dCircleConversion;
		void Set3dCircleConversion (const Standard_Boolean mode);

		/****************** Set3dConicConversion ******************/
		%feature("compactdefaultargs") Set3dConicConversion;
		%feature("autodoc", "* Sets mode for conversion Geom_Conic to bezier.
	:param mode:
	:type mode: bool
	:rtype: None") Set3dConicConversion;
		void Set3dConicConversion (const Standard_Boolean mode);

		/****************** Set3dConversion ******************/
		%feature("compactdefaultargs") Set3dConversion;
		%feature("autodoc", "* Sets mode for conversion 3d curves to bezier.
	:param mode:
	:type mode: bool
	:rtype: None") Set3dConversion;
		void Set3dConversion (const Standard_Boolean mode);

		/****************** Set3dLineConversion ******************/
		%feature("compactdefaultargs") Set3dLineConversion;
		%feature("autodoc", "* Sets mode for conversion Geom_Line to bezier.
	:param mode:
	:type mode: bool
	:rtype: None") Set3dLineConversion;
		void Set3dLineConversion (const Standard_Boolean mode);

		/****************** SetBSplineMode ******************/
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "* Sets mode for conversion Geom_BSplineSurface to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetBSplineMode;
		void SetBSplineMode (const Standard_Boolean mode);

		/****************** SetExtrusionMode ******************/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "* Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean mode);

		/****************** SetPlaneMode ******************/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "* Sets mode for conversion Geom_Plane to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean mode);

		/****************** SetRevolutionMode ******************/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "* Sets mode for conversion Geom_SurfaceOfRevolution to Bezier
	:param mode:
	:type mode: bool
	:rtype: None") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean mode);

		/****************** SetSurfaceConversion ******************/
		%feature("compactdefaultargs") SetSurfaceConversion;
		%feature("autodoc", "* Sets mode for conversion surfaces curves to bezier basis.
	:param mode:
	:type mode: bool
	:rtype: None") SetSurfaceConversion;
		void SetSurfaceConversion (const Standard_Boolean mode);

		/****************** ShapeUpgrade_ShapeConvertToBezier ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier ();

		/****************** ShapeUpgrade_ShapeConvertToBezier ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "* Initialize by a Shape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier (const TopoDS_Shape & S);

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
		/****************** InitTool ******************/
		%feature("compactdefaultargs") InitTool;
		%feature("autodoc", "* Resets tool for splitting face with given angle
	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None") InitTool;
		void InitTool (const Standard_Real MaxAngle);

		/****************** MaxAngle ******************/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "* Returns maximal angle
	:rtype: float") MaxAngle;
		Standard_Real MaxAngle ();

		/****************** SetMaxAngle ******************/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "* Set maximal angle (calls InitTool)
	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None") SetMaxAngle;
		void SetMaxAngle (const Standard_Real MaxAngle);

		/****************** ShapeUpgrade_ShapeDivideAngle ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "* Empty constructor.
	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle (const Standard_Real MaxAngle);

		/****************** ShapeUpgrade_ShapeDivideAngle ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "* Initialize by a Shape.
	:param MaxAngle:
	:type MaxAngle: float
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle (const Standard_Real MaxAngle,const TopoDS_Shape & S);

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
		/****************** ShapeUpgrade_ShapeDivideArea ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", ":rtype: None") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea ();

		/****************** ShapeUpgrade_ShapeDivideArea ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "* Initialize by a Shape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea (const TopoDS_Shape & S);

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
		/****************** SetNbSplitPoints ******************/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "* Sets the number of cuts applied to divide closed faces. The number of resulting faces will be num+1.
	:param num:
	:type num: int
	:rtype: None") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);

		/****************** ShapeUpgrade_ShapeDivideClosed ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosed;
		%feature("autodoc", "* Initialises tool with shape and default parameter.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ShapeUpgrade_ShapeDivideClosed;
		 ShapeUpgrade_ShapeDivideClosed (const TopoDS_Shape & S);

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
		/****************** SetNbSplitPoints ******************/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "* Sets the number of cuts applied to divide closed edges. The number of resulting faces will be num+1.
	:param num:
	:type num: int
	:rtype: None") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);

		/****************** ShapeUpgrade_ShapeDivideClosedEdges ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosedEdges;
		%feature("autodoc", "* Initialises tool with shape and default parameter.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ShapeUpgrade_ShapeDivideClosedEdges;
		 ShapeUpgrade_ShapeDivideClosedEdges (const TopoDS_Shape & S);

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
		/****************** SetBoundaryCriterion ******************/
		%feature("compactdefaultargs") SetBoundaryCriterion;
		%feature("autodoc", "* Defines a criterion of continuity for the boundary (all the Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.
	:param Criterion: default value is GeomAbs_C1
	:type Criterion: GeomAbs_Shape
	:rtype: None") SetBoundaryCriterion;
		void SetBoundaryCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****************** SetPCurveCriterion ******************/
		%feature("compactdefaultargs") SetPCurveCriterion;
		%feature("autodoc", "* Defines a criterion of continuity for the boundary (all the pcurves of Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.
	:param Criterion: default value is GeomAbs_C1
	:type Criterion: GeomAbs_Shape
	:rtype: None") SetPCurveCriterion;
		void SetPCurveCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****************** SetSurfaceCriterion ******************/
		%feature("compactdefaultargs") SetSurfaceCriterion;
		%feature("autodoc", "* Defines a criterion of continuity for the boundary (all the Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.
	:param Criterion: default value is GeomAbs_C1
	:type Criterion: GeomAbs_Shape
	:rtype: None") SetSurfaceCriterion;
		void SetSurfaceCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets tolerance.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** SetTolerance2d ******************/
		%feature("compactdefaultargs") SetTolerance2d;
		%feature("autodoc", "* Sets tolerance.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance2d;
		void SetTolerance2d (const Standard_Real Tol);

		/****************** ShapeUpgrade_ShapeDivideContinuity ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", ":rtype: None") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity ();

		/****************** ShapeUpgrade_ShapeDivideContinuity ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "* Initialize by a Shape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity (const TopoDS_Shape & S);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.
	:param Segment:
	:type Segment: bool
	:rtype: void") Build;
		virtual void Build (const Standard_Boolean Segment);

		/****************** GetCurves ******************/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", ":rtype: opencascade::handle<TColGeom2d_HArray1OfCurve>") GetCurves;
		const opencascade::handle<TColGeom2d_HArray1OfCurve> & GetCurves ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with pcurve with its first and last parameters.
	:param C:
	:type C: Geom2d_Curve
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with pcurve with its parameters.
	:param C:
	:type C: Geom2d_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real First,const Standard_Real Last);

		/****************** ShapeUpgrade_SplitCurve2d ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2d;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitCurve2d;
		 ShapeUpgrade_SplitCurve2d ();

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.
	:param Segment:
	:type Segment: bool
	:rtype: void") Build;
		virtual void Build (const Standard_Boolean Segment);

		/****************** GetCurves ******************/
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", ":rtype: opencascade::handle<TColGeom_HArray1OfCurve>") GetCurves;
		const opencascade::handle<TColGeom_HArray1OfCurve> & GetCurves ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with curve with its first and last parameters.
	:param C:
	:type C: Geom_Curve
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom_Curve> & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes with curve with its parameters.
	:param C:
	:type C: Geom_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") Init;
		void Init (const opencascade::handle<Geom_Curve> & C,const Standard_Real First,const Standard_Real Last);

		/****************** ShapeUpgrade_SplitCurve3d ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3d;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitCurve3d;
		 ShapeUpgrade_SplitCurve3d ();

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
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Performs splitting of the supporting surface(s). First defines splitting values, then calls inherited method.
	:param Segment:
	:type Segment: bool
	:rtype: void") Compute;
		virtual void Compute (const Standard_Boolean Segment);

		/****************** MaxAngle ******************/
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "* Returns maximal angle
	:rtype: float") MaxAngle;
		Standard_Real MaxAngle ();

		/****************** SetMaxAngle ******************/
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "* Set maximal angle
	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None") SetMaxAngle;
		void SetMaxAngle (const Standard_Real MaxAngle);

		/****************** ShapeUpgrade_SplitSurfaceAngle ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceAngle;
		%feature("autodoc", "* Empty constructor.
	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None") ShapeUpgrade_SplitSurfaceAngle;
		 ShapeUpgrade_SplitSurfaceAngle (const Standard_Real MaxAngle);

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
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", ":param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: void") Compute;
		virtual void Compute (const Standard_Boolean Segment = Standard_True);


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
		/****************** ShapeUpgrade_SplitSurfaceArea ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceArea;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitSurfaceArea;
		 ShapeUpgrade_SplitSurfaceArea ();

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
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", ":param Segment:
	:type Segment: bool
	:rtype: void") Compute;
		virtual void Compute (const Standard_Boolean Segment);

		/****************** SetCriterion ******************/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "* Sets criterion for splitting.
	:param Criterion:
	:type Criterion: GeomAbs_Shape
	:rtype: None") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets tolerance.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** ShapeUpgrade_SplitSurfaceContinuity ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceContinuity;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitSurfaceContinuity;
		 ShapeUpgrade_SplitSurfaceContinuity ();

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
		/****************** GetEdgeDivideTool ******************/
		%feature("compactdefaultargs") GetEdgeDivideTool;
		%feature("autodoc", "* returns tool for splitting edges
	:rtype: opencascade::handle<ShapeUpgrade_EdgeDivide>") GetEdgeDivideTool;
		virtual opencascade::handle<ShapeUpgrade_EdgeDivide> GetEdgeDivideTool ();

		/****************** GetFixSmallCurveTool ******************/
		%feature("compactdefaultargs") GetFixSmallCurveTool;
		%feature("autodoc", "* Returns tool for fixing small curves
	:rtype: opencascade::handle<ShapeUpgrade_FixSmallCurves>") GetFixSmallCurveTool;
		opencascade::handle<ShapeUpgrade_FixSmallCurves> GetFixSmallCurveTool ();

		/****************** GetTransferParamTool ******************/
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "* Returns the tool for Transfer of parameters.
	:rtype: opencascade::handle<ShapeAnalysis_TransferParameters>") GetTransferParamTool;
		virtual opencascade::handle<ShapeAnalysis_TransferParameters> GetTransferParamTool ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes by wire and face
	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Wire & W,const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes by wire and surface
	:param W:
	:type W: TopoDS_Wire
	:param S:
	:type S: Geom_Surface
	:rtype: None") Init;
		void Init (const TopoDS_Wire & W,const opencascade::handle<Geom_Surface> & S);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads working wire
	:param W:
	:type W: TopoDS_Wire
	:rtype: None") Load;
		void Load (const TopoDS_Wire & W);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Creates wire of one edge and calls Load for wire
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Load;
		void Load (const TopoDS_Edge & E);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the resulting wire by splitting all the edges according to splitting criteria. All the modifications made are recorded in context (ShapeBuild_ReShape). This tool is applied to all edges before splitting them in order to keep sharings. If no supporting face or surface is defined, only 3d splitting criteria are used.
	:rtype: void") Perform;
		virtual void Perform ();

		/****************** SetEdgeDivideTool ******************/
		%feature("compactdefaultargs") SetEdgeDivideTool;
		%feature("autodoc", "* Sets tool for splitting edge
	:param edgeDivideTool:
	:type edgeDivideTool: ShapeUpgrade_EdgeDivide
	:rtype: None") SetEdgeDivideTool;
		void SetEdgeDivideTool (const opencascade::handle<ShapeUpgrade_EdgeDivide> & edgeDivideTool);

		/****************** SetEdgeMode ******************/
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "* Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.
	:param EdgeMode:
	:type EdgeMode: int
	:rtype: None") SetEdgeMode;
		void SetEdgeMode (const Standard_Integer EdgeMode);

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "* Sets supporting surface by face
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & F);

		/****************** SetFixSmallCurveTool ******************/
		%feature("compactdefaultargs") SetFixSmallCurveTool;
		%feature("autodoc", "* Sets tool for fixing small curves with specified min tolerance;
	:param FixSmallCurvesTool:
	:type FixSmallCurvesTool: ShapeUpgrade_FixSmallCurves
	:rtype: None") SetFixSmallCurveTool;
		void SetFixSmallCurveTool (const opencascade::handle<ShapeUpgrade_FixSmallCurves> & FixSmallCurvesTool);

		/****************** SetSplitCurve2dTool ******************/
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "* Sets the tool for splitting pcurves.
	:param splitCurve2dTool:
	:type splitCurve2dTool: ShapeUpgrade_SplitCurve2d
	:rtype: None") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const opencascade::handle<ShapeUpgrade_SplitCurve2d> & splitCurve2dTool);

		/****************** SetSplitCurve3dTool ******************/
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "* Sets the tool for splitting 3D curves.
	:param splitCurve3dTool:
	:type splitCurve3dTool: ShapeUpgrade_SplitCurve3d
	:rtype: None") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const opencascade::handle<ShapeUpgrade_SplitCurve3d> & splitCurve3dTool);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Sets supporting surface
	:param S:
	:type S: Geom_Surface
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & S);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Sets supporting surface with location
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** SetTransferParamTool ******************/
		%feature("compactdefaultargs") SetTransferParamTool;
		%feature("autodoc", "* Sets the tool for Transfer parameters between curves and pcurves.
	:param TransferParam:
	:type TransferParam: ShapeAnalysis_TransferParameters
	:rtype: None") SetTransferParamTool;
		void SetTransferParamTool (const opencascade::handle<ShapeAnalysis_TransferParameters> & TransferParam);

		/****************** ShapeUpgrade_WireDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_WireDivide;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeUpgrade_WireDivide;
		 ShapeUpgrade_WireDivide ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Queries status of last call to Perform() OK - no edges were splitted, wire left untouched DONE1 - some edges were splitted FAIL1 - some edges have no 3d curve (skipped) FAIL2 - some edges have no pcurve (skipped)
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "* Gives the resulting Wire (equal to initial one if not done or Null if not loaded)
	:rtype: TopoDS_Wire") Wire;
		const TopoDS_Wire  Wire ();

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
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", ":param anEdge:
	:type anEdge: TopoDS_Edge
	:rtype: bool") Compute;
		virtual Standard_Boolean Compute (const TopoDS_Edge & anEdge);

		/****************** ShapeUpgrade_ClosedEdgeDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedEdgeDivide;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_ClosedEdgeDivide;
		 ShapeUpgrade_ClosedEdgeDivide ();

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
		/****************** GetNbSplitPoints ******************/
		%feature("compactdefaultargs") GetNbSplitPoints;
		%feature("autodoc", "* Returns the number of splitting points
	:rtype: int") GetNbSplitPoints;
		Standard_Integer GetNbSplitPoints ();

		/****************** SetNbSplitPoints ******************/
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "* Sets the number of cutting lines by which closed face will be splitted. The resulting faces will be num+1.
	:param num:
	:type num: int
	:rtype: None") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);

		/****************** ShapeUpgrade_ClosedFaceDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "* Creates empty constructor.
	:rtype: None") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide ();

		/****************** ShapeUpgrade_ClosedFaceDivide ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "* Initialize by a Face.
	:param F:
	:type F: TopoDS_Face
	:rtype: None") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide (const TopoDS_Face & F);

		/****************** SplitSurface ******************/
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "* Performs splitting of surface and computes the shell from source face.
	:rtype: bool") SplitSurface;
		virtual Standard_Boolean SplitSurface ();

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Splits a list of beziers computed by Compute method according the split values and splitting parameters.
	:param Segment:
	:type Segment: bool
	:rtype: void") Build;
		virtual void Build (const Standard_Boolean Segment);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Converts curve into a list of beziers, and stores the splitting parameters on original curve.
	:rtype: void") Compute;
		virtual void Compute ();

		/****************** ShapeUpgrade_ConvertCurve2dToBezier ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve2dToBezier;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_ConvertCurve2dToBezier;
		 ShapeUpgrade_ConvertCurve2dToBezier ();

		/****************** SplitParams ******************/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "* Returns the list of splitted parameters in original curve parametrisation.
	:rtype: opencascade::handle<TColStd_HSequenceOfReal>") SplitParams;
		opencascade::handle<TColStd_HSequenceOfReal> SplitParams ();

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Splits a list of beziers computed by Compute method according the split values and splitting parameters.
	:param Segment:
	:type Segment: bool
	:rtype: void") Build;
		virtual void Build (const Standard_Boolean Segment);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Converts curve into a list of beziers, and stores the splitting parameters on original curve.
	:rtype: void") Compute;
		virtual void Compute ();

		/****************** GetCircleMode ******************/
		%feature("compactdefaultargs") GetCircleMode;
		%feature("autodoc", "* Returns the Geom_Circle conversion mode.
	:rtype: bool") GetCircleMode;
		Standard_Boolean GetCircleMode ();

		/****************** GetConicMode ******************/
		%feature("compactdefaultargs") GetConicMode;
		%feature("autodoc", "* Performs converting and computes the resulting shape.
	:rtype: bool") GetConicMode;
		Standard_Boolean GetConicMode ();

		/****************** GetLineMode ******************/
		%feature("compactdefaultargs") GetLineMode;
		%feature("autodoc", "* Returns the Geom_Line conversion mode.
	:rtype: bool") GetLineMode;
		Standard_Boolean GetLineMode ();

		/****************** SetCircleMode ******************/
		%feature("compactdefaultargs") SetCircleMode;
		%feature("autodoc", "* Sets mode for conversion Geom_Circle to bezier.
	:param mode:
	:type mode: bool
	:rtype: None") SetCircleMode;
		void SetCircleMode (const Standard_Boolean mode);

		/****************** SetConicMode ******************/
		%feature("compactdefaultargs") SetConicMode;
		%feature("autodoc", "* Returns the Geom_Conic conversion mode.
	:param mode:
	:type mode: bool
	:rtype: None") SetConicMode;
		void SetConicMode (const Standard_Boolean mode);

		/****************** SetLineMode ******************/
		%feature("compactdefaultargs") SetLineMode;
		%feature("autodoc", "* Sets mode for conversion Geom_Line to bezier.
	:param mode:
	:type mode: bool
	:rtype: None") SetLineMode;
		void SetLineMode (const Standard_Boolean mode);

		/****************** ShapeUpgrade_ConvertCurve3dToBezier ******************/
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve3dToBezier;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeUpgrade_ConvertCurve3dToBezier;
		 ShapeUpgrade_ConvertCurve3dToBezier ();

		/****************** SplitParams ******************/
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "* Returns the list of splitted parameters in original curve parametrisation.
	:rtype: opencascade::handle<TColStd_HSequenceOfReal>") SplitParams;
		opencascade::handle<TColStd_HSequenceOfReal> SplitParams ();

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
		%feature("autodoc", "* Performs splitting and computes the resulting shell The context is used to keep track of former splittings
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform ();

		/****************** ShapeUpgrade_FaceDivideArea ******************/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "* Creates empty constructor.
	:rtype: None") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea ();

		/****************** ShapeUpgrade_FaceDivideArea ******************/
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: None") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea (const TopoDS_Face & F);

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
		/****************** Approx ******************/
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", ":param Curve3d:
	:type Curve3d: Geom_Curve
	:param Curve2d:
	:type Curve2d: Geom2d_Curve
	:param Curve2dR:
	:type Curve2dR: Geom2d_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: bool") Approx;
		virtual Standard_Boolean Approx (opencascade::handle<Geom_Curve> & Curve3d,opencascade::handle<Geom2d_Curve> & Curve2d,opencascade::handle<Geom2d_Curve> & Curve2dR,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ShapeUpgrade_FixSmallBezierCurves ******************/
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallBezierCurves;
		%feature("autodoc", ":rtype: None") ShapeUpgrade_FixSmallBezierCurves;
		 ShapeUpgrade_FixSmallBezierCurves ();

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
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Calculates points for correction/splitting of the curve
	:rtype: void") Compute;
		virtual void Compute ();

		/****************** SetCriterion ******************/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "* Sets criterion for splitting.
	:param Criterion:
	:type Criterion: GeomAbs_Shape
	:rtype: None") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets tolerance.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** ShapeUpgrade_SplitCurve2dContinuity ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2dContinuity;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitCurve2dContinuity;
		 ShapeUpgrade_SplitCurve2dContinuity ();

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
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Calculates points for correction/splitting of the curve
	:rtype: void") Compute;
		virtual void Compute ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") GetCurve;
		const opencascade::handle<Geom_Curve> & GetCurve ();

		/****************** SetCriterion ******************/
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "* Sets criterion for splitting.
	:param Criterion:
	:type Criterion: GeomAbs_Shape
	:rtype: None") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets tolerance.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** ShapeUpgrade_SplitCurve3dContinuity ******************/
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3dContinuity;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeUpgrade_SplitCurve3dContinuity;
		 ShapeUpgrade_SplitCurve3dContinuity ();

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
