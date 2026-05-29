/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define SHAPECUSTOMDOCSTRING
"ShapeCustom module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_shapecustom.html"
%enddef
%module (package="OCC.Core", docstring=SHAPECUSTOMDOCSTRING) ShapeCustom


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
#include<ShapeCustom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<BRepTools_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<TopLoc_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<Bnd_module.hxx>
#include<TColGeom_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import GeomAbs.i
%import Geom.i
%import Geom2d.i
%import TColgp.i
%import BRepTools.i
%import ShapeExtend.i
%import Message.i
%import gp.i
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
%wrap_handle(ShapeCustom_Modification)
%wrap_handle(ShapeCustom_RestrictionParameters)
%wrap_handle(ShapeCustom_TrsfModification)
%wrap_handle(ShapeCustom_ConvertToBSpline)
%wrap_handle(ShapeCustom_DirectModification)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class ShapeCustom *
********************/
%rename(shapecustom) ShapeCustom;
class ShapeCustom {
	public:
		/****** ShapeCustom::BSplineRestriction ******/
		/****** md5 signature: f4c7409f830ce1518c25b30bafa952d6 ******/
		%feature("compactdefaultargs") BSplineRestriction;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tol3d: double
Tol2d: double
MaxDegree: int
MaxNbSegment: int
Continuity3d: GeomAbs_Shape
Continuity2d: GeomAbs_Shape
Degree: bool
Rational: bool
aParameters: ShapeCustom_RestrictionParameters

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape with all surfaces, curves and pcurves which type is BSpline/Bezier or based on them converted having Degree less than <MaxDegree> or number of spans less than <NbMaxSegment> in dependence on parameter priority <Degree>. <GmaxDegree> and <GMaxSegments> are maximum possible degree and number of spans correspondingly. These values will be used in those cases when approximation with specified parameters is impossible and one of GmaxDegree or GMaxSegments is selected in dependence on priority. Note that even if approximation is impossible with <GMaxDegree> then number of spans can exceed specified <GMaxSegment> <Rational> specifies if to convert Rational BSpline/Bezier into polynomial B-Spline. If flags ConvOffSurf,ConvOffCurve3d,ConvOffCurve2d are true there are means that Offset surfaces , Offset curves 3d and Offset curves 2d are converted to BSPline correspondingly.
") BSplineRestriction;
		static TopoDS_Shape BSplineRestriction(const TopoDS_Shape & S, const double Tol3d, const double Tol2d, const int MaxDegree, const int MaxNbSegment, const GeomAbs_Shape Continuity3d, const GeomAbs_Shape Continuity2d, const bool Degree, const bool Rational, const opencascade::handle<ShapeCustom_RestrictionParameters> & aParameters);

		/****** ShapeCustom::ConvertToBSpline ******/
		/****** md5 signature: b8dfc67d51d20885a71f65f01a2b7341 ******/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
extrMode: bool
revolMode: bool
offsetMode: bool
planeMode: bool (optional, default to false)

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape with all surfaces of linear extrusion, revolution, offset, and planar surfaces converted according to flags to Geom_BSplineSurface (with same parameterisation).
") ConvertToBSpline;
		static TopoDS_Shape ConvertToBSpline(const TopoDS_Shape & S, const bool extrMode, const bool revolMode, const bool offsetMode, const bool planeMode = false);

		/****** ShapeCustom::ConvertToRevolution ******/
		/****** md5 signature: 0be795010a96d7159af52a2f09c8ebfd ******/
		%feature("compactdefaultargs") ConvertToRevolution;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape with all elementary periodic surfaces converted to Geom_SurfaceOfRevolution.
") ConvertToRevolution;
		static TopoDS_Shape ConvertToRevolution(const TopoDS_Shape & S);

		/****** ShapeCustom::DirectFaces ******/
		/****** md5 signature: 27616d29c55c4d7c6aec89a5258015f4 ******/
		%feature("compactdefaultargs") DirectFaces;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape without indirect surfaces.
") DirectFaces;
		static TopoDS_Shape DirectFaces(const TopoDS_Shape & S);

		/****** ShapeCustom::ScaleShape ******/
		/****** md5 signature: 63b3c01a377a582c2baf89eb4eac2167 ******/
		%feature("compactdefaultargs") ScaleShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
scale: double

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape which is scaled original.
") ScaleShape;
		static TopoDS_Shape ScaleShape(const TopoDS_Shape & S, const double scale);

		/****** ShapeCustom::SweptToElementary ******/
		/****** md5 signature: c4291da18c66402c3080df4840126b40 ******/
		%feature("compactdefaultargs") SweptToElementary;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape with all surfaces of revolution and linear extrusion convert to elementary periodic surfaces.
") SweptToElementary;
		static TopoDS_Shape SweptToElementary(const TopoDS_Shape & S);

};


%extend ShapeCustom {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ApplyModifier(self):
		pass
	}
};

/**************************
* class ShapeCustom_Curve *
**************************/
class ShapeCustom_Curve {
	public:
		/****** ShapeCustom_Curve::ShapeCustom_Curve ******/
		/****** md5 signature: a3441ab910bd667288a6237276f3fd9c ******/
		%feature("compactdefaultargs") ShapeCustom_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeCustom_Curve;
		 ShapeCustom_Curve();

		/****** ShapeCustom_Curve::ShapeCustom_Curve ******/
		/****** md5 signature: e2cdb4d3492fed5a1a5e975c5506e655 ******/
		%feature("compactdefaultargs") ShapeCustom_Curve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") ShapeCustom_Curve;
		 ShapeCustom_Curve(const opencascade::handle<Geom_Curve> & C);

		/****** ShapeCustom_Curve::ConvertToPeriodic ******/
		/****** md5 signature: f8ae9a223c76d3ff57c4cfc2659f6ad3 ******/
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "
Parameters
----------
substitute: bool
preci: double (optional, default to -1)

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Tries to convert the Curve to the Periodic form Returns the resulting curve Works only if the Curve is BSpline and is closed with Precision::Confusion() Else, or in case of failure, returns a Null Handle.
") ConvertToPeriodic;
		opencascade::handle<Geom_Curve> ConvertToPeriodic(const bool substitute, const double preci = -1);

		/****** ShapeCustom_Curve::Init ******/
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
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

};


%extend ShapeCustom_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeCustom_Curve2d *
****************************/
class ShapeCustom_Curve2d {
	public:
		/****** ShapeCustom_Curve2d::ConvertToLine2d ******/
		/****** md5 signature: 4931444fa886e8448305e6832c9d5668 ******/
		%feature("compactdefaultargs") ConvertToLine2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve
theFirstIn: double
theLastIn: double
theTolerance: double

Return
-------
theNewFirst: double
theNewLast: double
theDeviation: double

Description
-----------
Try to convert BSpline2d or Bezier2d to line 2d only if it is linear. Recalculate first and last parameters. Returns line2d or null curve2d.
") ConvertToLine2d;
		static opencascade::handle<Geom2d_Line> ConvertToLine2d(const opencascade::handle<Geom2d_Curve> & theCurve, const double theFirstIn, const double theLastIn, const double theTolerance, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_Curve2d::IsLinear ******/
		/****** md5 signature: a5b30efba8094c7d6ba53d3d88f30067 ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt2d
theTolerance: double

Return
-------
theDeviation: double

Description
-----------
Check if poleses is in the plane with given precision Returns false if no.
") IsLinear;
		static bool IsLinear(const TColgp_Array1OfPnt2d & thePoles, const double theTolerance, Standard_Real &OutValue);

		/****** ShapeCustom_Curve2d::SimplifyBSpline2d ******/
		/****** md5 signature: 4eb64c8cbcdbddf4ff36e3e5992d3aa9 ******/
		%feature("compactdefaultargs") SimplifyBSpline2d;
		%feature("autodoc", "
Parameters
----------
theBSpline2d: Geom2d_BSplineCurve
theTolerance: double

Return
-------
bool

Description
-----------
Try to remove knots from bspline where local derivatives are the same. Remove knots with given precision. Returns false if Bsplien was not modified.
") SimplifyBSpline2d;
		static bool SimplifyBSpline2d(opencascade::handle<Geom2d_BSplineCurve> & theBSpline2d, const double theTolerance);

};


%extend ShapeCustom_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeCustom_Modification *
*********************************/
%nodefaultctor ShapeCustom_Modification;
class ShapeCustom_Modification : public BRepTools_Modification {
	public:
		/****** ShapeCustom_Modification::MsgRegistrator ******/
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

		/****** ShapeCustom_Modification::SendMsg ******/
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

		/****** ShapeCustom_Modification::SetMsgRegistrator ******/
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

};


%make_alias(ShapeCustom_Modification)

%extend ShapeCustom_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class ShapeCustom_RestrictionParameters *
******************************************/
class ShapeCustom_RestrictionParameters : public Standard_Transient {
	public:
		/****** ShapeCustom_RestrictionParameters::ShapeCustom_RestrictionParameters ******/
		/****** md5 signature: 81d84290b002a3665137693606aebe82 ******/
		%feature("compactdefaultargs") ShapeCustom_RestrictionParameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default parameters.
") ShapeCustom_RestrictionParameters;
		 ShapeCustom_RestrictionParameters();

		/****** ShapeCustom_RestrictionParameters::ConvertBezierSurf ******/
		/****** md5 signature: 36242c98bfe39583d9852079aa23c947 ******/
		%feature("compactdefaultargs") ConvertBezierSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if Bezier surface converted to BSpline surface.
") ConvertBezierSurf;
		bool & ConvertBezierSurf();

		/****** ShapeCustom_RestrictionParameters::ConvertConicalSurf ******/
		/****** md5 signature: 3219bbf237ebded6ac0f9fcd435dd319 ******/
		%feature("compactdefaultargs") ConvertConicalSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if conical surface converted to BSpline surface.
") ConvertConicalSurf;
		bool & ConvertConicalSurf();

		/****** ShapeCustom_RestrictionParameters::ConvertCurve2d ******/
		/****** md5 signature: 45996f8406d2474c782a5c97e0ea659b ******/
		%feature("compactdefaultargs") ConvertCurve2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) flag for define if 2d curve converted to BSpline curve.
") ConvertCurve2d;
		bool & ConvertCurve2d();

		/****** ShapeCustom_RestrictionParameters::ConvertCurve3d ******/
		/****** md5 signature: 83806b47cdc77570a07bb1c3d4345325 ******/
		%feature("compactdefaultargs") ConvertCurve3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if 3d curve converted to BSpline curve.
") ConvertCurve3d;
		bool & ConvertCurve3d();

		/****** ShapeCustom_RestrictionParameters::ConvertCylindricalSurf ******/
		/****** md5 signature: 6b842b587a073e3f1f9f61667b12bd90 ******/
		%feature("compactdefaultargs") ConvertCylindricalSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if cylindrical surface converted to BSpline surface.
") ConvertCylindricalSurf;
		bool & ConvertCylindricalSurf();

		/****** ShapeCustom_RestrictionParameters::ConvertExtrusionSurf ******/
		/****** md5 signature: b1a40cd41dc699d877c830c8cacbd349 ******/
		%feature("compactdefaultargs") ConvertExtrusionSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if surface of LinearExtrusion converted to BSpline surface.
") ConvertExtrusionSurf;
		bool & ConvertExtrusionSurf();

		/****** ShapeCustom_RestrictionParameters::ConvertOffsetCurv2d ******/
		/****** md5 signature: 6c1088bf457a3858e32ea5ab57ed848e ******/
		%feature("compactdefaultargs") ConvertOffsetCurv2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) flag for define if Offset curve2d converted to BSpline surface.
") ConvertOffsetCurv2d;
		bool & ConvertOffsetCurv2d();

		/****** ShapeCustom_RestrictionParameters::ConvertOffsetCurv3d ******/
		/****** md5 signature: 816ba77b091974bf958ceacc06fd5f02 ******/
		%feature("compactdefaultargs") ConvertOffsetCurv3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if Offset curve3d converted to BSpline surface.
") ConvertOffsetCurv3d;
		bool & ConvertOffsetCurv3d();

		/****** ShapeCustom_RestrictionParameters::ConvertOffsetSurf ******/
		/****** md5 signature: 9cc1574bb8ef673620cf9d5c24200d38 ******/
		%feature("compactdefaultargs") ConvertOffsetSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if Offset surface converted to BSpline surface.
") ConvertOffsetSurf;
		bool & ConvertOffsetSurf();

		/****** ShapeCustom_RestrictionParameters::ConvertPlane ******/
		/****** md5 signature: 36370d3bba06b163d74b9f458f2c68a6 ******/
		%feature("compactdefaultargs") ConvertPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if Plane converted to BSpline surface.
") ConvertPlane;
		bool & ConvertPlane();

		/****** ShapeCustom_RestrictionParameters::ConvertRevolutionSurf ******/
		/****** md5 signature: 1aed51fbf08ed364c0cdb80ea2440b9e ******/
		%feature("compactdefaultargs") ConvertRevolutionSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if surface of Revolution converted to BSpline surface.
") ConvertRevolutionSurf;
		bool & ConvertRevolutionSurf();

		/****** ShapeCustom_RestrictionParameters::ConvertSphericalSurf ******/
		/****** md5 signature: b2b8f824e0a319832afd2dbbed95c340 ******/
		%feature("compactdefaultargs") ConvertSphericalSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if spherical surface converted to BSpline surface.
") ConvertSphericalSurf;
		bool & ConvertSphericalSurf();

		/****** ShapeCustom_RestrictionParameters::ConvertToroidalSurf ******/
		/****** md5 signature: 29aaa57b45437c80ea3c64d84096dfea ******/
		%feature("compactdefaultargs") ConvertToroidalSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets flag for define if toroidal surface converted to BSpline surface.
") ConvertToroidalSurf;
		bool & ConvertToroidalSurf();

		/****** ShapeCustom_RestrictionParameters::GMaxDegree ******/
		/****** md5 signature: f24fd4e767aabdd35a99bed8bdc9bef3 ******/
		%feature("compactdefaultargs") GMaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) maximal degree of approximation.
") GMaxDegree;
		int & GMaxDegree();

		/****** ShapeCustom_RestrictionParameters::GMaxSeg ******/
		/****** md5 signature: 04c7d7dfb9634f306567f9ec94705ee5 ******/
		%feature("compactdefaultargs") GMaxSeg;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) maximal number of spans of approximation.
") GMaxSeg;
		int & GMaxSeg();

		/****** ShapeCustom_RestrictionParameters::SegmentSurfaceMode ******/
		/****** md5 signature: 6ff8bc084358bc417ee7f7ad5191243c ******/
		%feature("compactdefaultargs") SegmentSurfaceMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Sets Segment mode for surface. If Segment is True surface is approximated in the bondaries of face lying on this surface.
") SegmentSurfaceMode;
		bool & SegmentSurfaceMode();

		%extend{
			int GetGMaxDegree() { return self->GMaxDegree(); }
			void SetGMaxDegree(int value) { self->GMaxDegree() = value; }
		};
		%extend{
			int GetGMaxSeg() { return self->GMaxSeg(); }
			void SetGMaxSeg(int value) { self->GMaxSeg() = value; }
		};
		%extend{
			bool GetConvertPlane() { return self->ConvertPlane(); }
			void SetConvertPlane(bool value) { self->ConvertPlane() = value; }
		};
		%extend{
			bool GetConvertBezierSurf() { return self->ConvertBezierSurf(); }
			void SetConvertBezierSurf(bool value) { self->ConvertBezierSurf() = value; }
		};
		%extend{
			bool GetConvertRevolutionSurf() { return self->ConvertRevolutionSurf(); }
			void SetConvertRevolutionSurf(bool value) { self->ConvertRevolutionSurf() = value; }
		};
		%extend{
			bool GetConvertExtrusionSurf() { return self->ConvertExtrusionSurf(); }
			void SetConvertExtrusionSurf(bool value) { self->ConvertExtrusionSurf() = value; }
		};
		%extend{
			bool GetConvertOffsetSurf() { return self->ConvertOffsetSurf(); }
			void SetConvertOffsetSurf(bool value) { self->ConvertOffsetSurf() = value; }
		};
		%extend{
			bool GetConvertCylindricalSurf() { return self->ConvertCylindricalSurf(); }
			void SetConvertCylindricalSurf(bool value) { self->ConvertCylindricalSurf() = value; }
		};
		%extend{
			bool GetConvertConicalSurf() { return self->ConvertConicalSurf(); }
			void SetConvertConicalSurf(bool value) { self->ConvertConicalSurf() = value; }
		};
		%extend{
			bool GetConvertToroidalSurf() { return self->ConvertToroidalSurf(); }
			void SetConvertToroidalSurf(bool value) { self->ConvertToroidalSurf() = value; }
		};
		%extend{
			bool GetConvertSphericalSurf() { return self->ConvertSphericalSurf(); }
			void SetConvertSphericalSurf(bool value) { self->ConvertSphericalSurf() = value; }
		};
		%extend{
			bool GetSegmentSurfaceMode() { return self->SegmentSurfaceMode(); }
			void SetSegmentSurfaceMode(bool value) { self->SegmentSurfaceMode() = value; }
		};
		%extend{
			bool GetConvertCurve3d() { return self->ConvertCurve3d(); }
			void SetConvertCurve3d(bool value) { self->ConvertCurve3d() = value; }
		};
		%extend{
			bool GetConvertOffsetCurv3d() { return self->ConvertOffsetCurv3d(); }
			void SetConvertOffsetCurv3d(bool value) { self->ConvertOffsetCurv3d() = value; }
		};
		%extend{
			bool GetConvertCurve2d() { return self->ConvertCurve2d(); }
			void SetConvertCurve2d(bool value) { self->ConvertCurve2d() = value; }
		};
		%extend{
			bool GetConvertOffsetCurv2d() { return self->ConvertOffsetCurv2d(); }
			void SetConvertOffsetCurv2d(bool value) { self->ConvertOffsetCurv2d() = value; }
		};
};


%make_alias(ShapeCustom_RestrictionParameters)

%extend ShapeCustom_RestrictionParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeCustom_Surface *
****************************/
class ShapeCustom_Surface {
	public:
		/****** ShapeCustom_Surface::ShapeCustom_Surface ******/
		/****** md5 signature: cafa05881635f8c20f8b8c619476b912 ******/
		%feature("compactdefaultargs") ShapeCustom_Surface;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeCustom_Surface;
		 ShapeCustom_Surface();

		/****** ShapeCustom_Surface::ShapeCustom_Surface ******/
		/****** md5 signature: da0b965e05134f06574b36da9d88c364 ******/
		%feature("compactdefaultargs") ShapeCustom_Surface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") ShapeCustom_Surface;
		 ShapeCustom_Surface(const opencascade::handle<Geom_Surface> & S);

		/****** ShapeCustom_Surface::ConvertToAnalytical ******/
		/****** md5 signature: 4e900654b6b79f0586e5e44875ef3a40 ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
tol: double
substitute: bool

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Tries to convert the Surface to an Analytic form Returns the result Works only if the Surface is BSpline or Bezier. Else, or in case of failure, returns a Null Handle //! If <substitute> is True, the new surface replaces the actual one in <self> //! It works by analysing the case which can apply, creating the corresponding analytic surface, then checking coincidence Warning: Parameter laws are not kept, hence PCurves should be redone.
") ConvertToAnalytical;
		opencascade::handle<Geom_Surface> ConvertToAnalytical(const double tol, const bool substitute);

		/****** ShapeCustom_Surface::ConvertToPeriodic ******/
		/****** md5 signature: 43e5167db419b6415e595fe5e7533469 ******/
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "
Parameters
----------
substitute: bool
preci: double (optional, default to -1)

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Tries to convert the Surface to the Periodic form Returns the resulting surface Works only if the Surface is BSpline and is closed with Precision::Confusion() Else, or in case of failure, returns a Null Handle.
") ConvertToPeriodic;
		opencascade::handle<Geom_Surface> ConvertToPeriodic(const bool substitute, const double preci = -1);

		/****** ShapeCustom_Surface::Gap ******/
		/****** md5 signature: 440448988cf9c1f10c0497f08aa39855 ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximal deviation of converted surface from the original one computed by last call to ConvertToAnalytical.
") Gap;
		double Gap();

		/****** ShapeCustom_Surface::Init ******/
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
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S);

};


%extend ShapeCustom_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeCustom_TrsfModification *
*************************************/
class ShapeCustom_TrsfModification : public BRepTools_TrsfModification {
	public:
		/****** ShapeCustom_TrsfModification::ShapeCustom_TrsfModification ******/
		/****** md5 signature: 8435dc7227a8890d6a14633721586b34 ******/
		%feature("compactdefaultargs") ShapeCustom_TrsfModification;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Empty constructor.
") ShapeCustom_TrsfModification;
		 ShapeCustom_TrsfModification(const gp_Trsf & T);

		/****** ShapeCustom_TrsfModification::NewCurve ******/
		/****** md5 signature: 039bf25957d908407657950d3c1e5d6a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: double

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <E> multiplied with scale factor.
") NewCurve;
		bool NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewCurve2d ******/
		/****** md5 signature: 19d697fda46737877bc989a89ef46152 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: double

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <E> multiplied with scale factor.
") NewCurve2d;
		bool NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewParameter ******/
		/****** md5 signature: 01206a81b5ddd931da808c7838d65daf ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: double
Tol: double

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <V> multiplied with scale factor.
") NewParameter;
		bool NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewPoint ******/
		/****** md5 signature: a79eefd1fe066754dc9fbd2d3a2530a1 ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: double

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <V> multiplied with scale factor.
") NewPoint;
		bool NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewSurface ******/
		/****** md5 signature: 05cac4f6dafa97d6624303004e85d749 ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: double
RevWires: bool
RevFace: bool

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <F> multiplied with scale factor.
") NewSurface;
		bool NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

};


%make_alias(ShapeCustom_TrsfModification)

%extend ShapeCustom_TrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class ShapeCustom_BSplineRestriction *
***************************************/
/*************************************
* class ShapeCustom_ConvertToBSpline *
*************************************/
class ShapeCustom_ConvertToBSpline : public ShapeCustom_Modification {
	public:
		/****** ShapeCustom_ConvertToBSpline::ShapeCustom_ConvertToBSpline ******/
		/****** md5 signature: fdc8bdf94d0e8e7c62b646bf97cc5032 ******/
		%feature("compactdefaultargs") ShapeCustom_ConvertToBSpline;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeCustom_ConvertToBSpline;
		 ShapeCustom_ConvertToBSpline();

		/****** ShapeCustom_ConvertToBSpline::Continuity ******/
		/****** md5 signature: d1e0a7e2e1d461e6b97ab64ce63033de ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****** ShapeCustom_ConvertToBSpline::NewCurve ******/
		/****** md5 signature: 039bf25957d908407657950d3c1e5d6a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: double

Description
-----------
Returns true if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns false, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		bool NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewCurve2d ******/
		/****** md5 signature: 19d697fda46737877bc989a89ef46152 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: double

Description
-----------
Returns true if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns false, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be useful.
") NewCurve2d;
		bool NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewParameter ******/
		/****** md5 signature: 01206a81b5ddd931da808c7838d65daf ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: double
Tol: double

Description
-----------
Returns true if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns false, and <P>, <Tol> are not significant.
") NewParameter;
		bool NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewPoint ******/
		/****** md5 signature: a79eefd1fe066754dc9fbd2d3a2530a1 ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: double

Description
-----------
Returns true if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns false, and <P>, <Tol> are not significant.
") NewPoint;
		bool NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewSurface ******/
		/****** md5 signature: 05cac4f6dafa97d6624303004e85d749 ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: double
RevWires: bool
RevFace: bool

Description
-----------
Returns true if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location, <Tol> the new tolerance. Otherwise, returns false, and <S>, <L>, <Tol> are not significant.
") NewSurface;
		bool NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** ShapeCustom_ConvertToBSpline::SetExtrusionMode ******/
		/****** md5 signature: 1311c3ecc9ea945eaa70a7b0002deff7 ******/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "
Parameters
----------
extrMode: bool

Return
-------
None

Description
-----------
Sets mode for conversion of Surfaces of Linear extrusion.
") SetExtrusionMode;
		void SetExtrusionMode(const bool extrMode);

		/****** ShapeCustom_ConvertToBSpline::SetOffsetMode ******/
		/****** md5 signature: 0511e45ec4611d60639ed5ff8598f953 ******/
		%feature("compactdefaultargs") SetOffsetMode;
		%feature("autodoc", "
Parameters
----------
offsetMode: bool

Return
-------
None

Description
-----------
Sets mode for conversion of Offset surfaces.
") SetOffsetMode;
		void SetOffsetMode(const bool offsetMode);

		/****** ShapeCustom_ConvertToBSpline::SetPlaneMode ******/
		/****** md5 signature: e7b82266926858353ee4f180be1223fc ******/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "
Parameters
----------
planeMode: bool

Return
-------
None

Description
-----------
Sets mode for conversion of Plane surfaces.
") SetPlaneMode;
		void SetPlaneMode(const bool planeMode);

		/****** ShapeCustom_ConvertToBSpline::SetRevolutionMode ******/
		/****** md5 signature: c88efdd20bbd630eecbebd8d8450a4ad ******/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "
Parameters
----------
revolMode: bool

Return
-------
None

Description
-----------
Sets mode for conversion of Surfaces of Revolution.
") SetRevolutionMode;
		void SetRevolutionMode(const bool revolMode);

};


%make_alias(ShapeCustom_ConvertToBSpline)

%extend ShapeCustom_ConvertToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class ShapeCustom_ConvertToRevolution *
****************************************/
/***************************************
* class ShapeCustom_DirectModification *
***************************************/
class ShapeCustom_DirectModification : public ShapeCustom_Modification {
	public:
		/****** ShapeCustom_DirectModification::ShapeCustom_DirectModification ******/
		/****** md5 signature: de7b24d906fcb0bd12bed4874b392c8a ******/
		%feature("compactdefaultargs") ShapeCustom_DirectModification;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ShapeCustom_DirectModification;
		 ShapeCustom_DirectModification();

		/****** ShapeCustom_DirectModification::Continuity ******/
		/****** md5 signature: d1e0a7e2e1d461e6b97ab64ce63033de ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****** ShapeCustom_DirectModification::NewCurve ******/
		/****** md5 signature: 039bf25957d908407657950d3c1e5d6a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: double

Description
-----------
Returns true if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns false, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		bool NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewCurve2d ******/
		/****** md5 signature: 19d697fda46737877bc989a89ef46152 ******/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve

Return
-------
Tol: double

Description
-----------
Returns true if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns false, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be useful.
") NewCurve2d;
		bool NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewParameter ******/
		/****** md5 signature: 01206a81b5ddd931da808c7838d65daf ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: double
Tol: double

Description
-----------
Returns true if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns false, and <P>, <Tol> are not significant.
") NewParameter;
		bool NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewPoint ******/
		/****** md5 signature: a79eefd1fe066754dc9fbd2d3a2530a1 ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: double

Description
-----------
Returns true if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns false, and <P>, <Tol> are not significant.
") NewPoint;
		bool NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewSurface ******/
		/****** md5 signature: 05cac4f6dafa97d6624303004e85d749 ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: double
RevWires: bool
RevFace: bool

Description
-----------
Returns true if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location, <Tol> the new tolerance. Otherwise, returns false, and <S>, <L>, <Tol> are not significant.
") NewSurface;
		bool NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

};


%make_alias(ShapeCustom_DirectModification)

%extend ShapeCustom_DirectModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class ShapeCustom_SweptToElementary *
**************************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class ShapeCustom_BSplineRestriction:
	pass

@classnotwrapped
class ShapeCustom_SweptToElementary:
	pass

@classnotwrapped
class ShapeCustom_ConvertToRevolution:
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
def shapecustom_BSplineRestriction(*args):
	return shapecustom.BSplineRestriction(*args)

@deprecated
def shapecustom_ConvertToBSpline(*args):
	return shapecustom.ConvertToBSpline(*args)

@deprecated
def shapecustom_ConvertToRevolution(*args):
	return shapecustom.ConvertToRevolution(*args)

@deprecated
def shapecustom_DirectFaces(*args):
	return shapecustom.DirectFaces(*args)

@deprecated
def shapecustom_ScaleShape(*args):
	return shapecustom.ScaleShape(*args)

@deprecated
def shapecustom_SweptToElementary(*args):
	return shapecustom.SweptToElementary(*args)

@deprecated
def ShapeCustom_Curve2d_ConvertToLine2d(*args):
	return ShapeCustom_Curve2d.ConvertToLine2d(*args)

@deprecated
def ShapeCustom_Curve2d_IsLinear(*args):
	return ShapeCustom_Curve2d.IsLinear(*args)

@deprecated
def ShapeCustom_Curve2d_SimplifyBSpline2d(*args):
	return ShapeCustom_Curve2d.SimplifyBSpline2d(*args)

}
