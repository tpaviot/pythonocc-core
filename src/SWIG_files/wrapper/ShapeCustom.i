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
%define SHAPECUSTOMDOCSTRING
"ShapeCustom module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_shapecustom.html"
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
		/****** md5 signature: aebcbbeca6c85938d31274f99d5fa8df ******/
		%feature("compactdefaultargs") BSplineRestriction;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Tol3d: float
Tol2d: float
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
Returns a new shape with all surfaces, curves and pcurves which type is BSpline/Bezier or based on them converted having Degree less than <MaxDegree> or number of spans less than <NbMaxSegment> in dependence on parameter priority <Degree>. <GmaxDegree> and <GMaxSegments> are maximum possible degree and number of spans correspondingly. These values will be used in those cases when approximation with specified parameters is impossible and one of GmaxDegree or GMaxSegments is selected in dependence on priority. Note that even if approximation is impossible with <GMaxDegree> then number of spans can exceed specified <GMaxSegment> <Rational> specifies if to convert Rational BSpline/Bezier into polynomial B-Spline. If flags ConvOffSurf,ConvOffCurve3d,ConvOffCurve2d are Standard_True there are means that Offset surfaces , Offset curves 3d and Offset curves 2d are converted to BSPline correspondingly.
") BSplineRestriction;
		static TopoDS_Shape BSplineRestriction(const TopoDS_Shape & S, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer MaxDegree, const Standard_Integer MaxNbSegment, const GeomAbs_Shape Continuity3d, const GeomAbs_Shape Continuity2d, const Standard_Boolean Degree, const Standard_Boolean Rational, const opencascade::handle<ShapeCustom_RestrictionParameters> & aParameters);

		/****** ShapeCustom::ConvertToBSpline ******/
		/****** md5 signature: 6c100eef1dffb18f0599f9fc958a3ea5 ******/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
extrMode: bool
revolMode: bool
offsetMode: bool
planeMode: bool (optional, default to Standard_False)

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape with all surfaces of linear extrusion, revolution, offset, and planar surfaces converted according to flags to Geom_BSplineSurface (with same parameterisation).
") ConvertToBSpline;
		static TopoDS_Shape ConvertToBSpline(const TopoDS_Shape & S, const Standard_Boolean extrMode, const Standard_Boolean revolMode, const Standard_Boolean offsetMode, const Standard_Boolean planeMode = Standard_False);

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
		/****** md5 signature: 9a3be75955799568ca36cbebad18a34e ******/
		%feature("compactdefaultargs") ScaleShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
scale: float

Return
-------
TopoDS_Shape

Description
-----------
Returns a new shape which is scaled original.
") ScaleShape;
		static TopoDS_Shape ScaleShape(const TopoDS_Shape & S, const Standard_Real scale);

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
		/****** md5 signature: c8da636eaa8b626715587b76ad0488c8 ******/
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "
Parameters
----------
substitute: bool
preci: float (optional, default to -1)

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Tries to convert the Curve to the Periodic form Returns the resulting curve Works only if the Curve is BSpline and is closed with Precision::Confusion() Else, or in case of failure, returns a Null Handle.
") ConvertToPeriodic;
		opencascade::handle<Geom_Curve> ConvertToPeriodic(const Standard_Boolean substitute, const Standard_Real preci = -1);

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
		/****** md5 signature: 6c7bb1bfbf35f5a8ac7c87b422872ec8 ******/
		%feature("compactdefaultargs") ConvertToLine2d;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve
theFirstIn: float
theLastIn: float
theTolerance: float

Return
-------
theNewFirst: float
theNewLast: float
theDeviation: float

Description
-----------
Try to convert BSpline2d or Bezier2d to line 2d only if it is linear. Recalculate first and last parameters. Returns line2d or null curve2d.
") ConvertToLine2d;
		static opencascade::handle<Geom2d_Line> ConvertToLine2d(const opencascade::handle<Geom2d_Curve> & theCurve, const Standard_Real theFirstIn, const Standard_Real theLastIn, const Standard_Real theTolerance, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_Curve2d::IsLinear ******/
		/****** md5 signature: efb90e3e50d224abe7af366edfbccbdb ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "
Parameters
----------
thePoles: TColgp_Array1OfPnt2d
theTolerance: float

Return
-------
theDeviation: float

Description
-----------
Check if poleses is in the plane with given precision Returns false if no.
") IsLinear;
		static Standard_Boolean IsLinear(const TColgp_Array1OfPnt2d & thePoles, const Standard_Real theTolerance, Standard_Real &OutValue);

		/****** ShapeCustom_Curve2d::SimplifyBSpline2d ******/
		/****** md5 signature: 8e3e06d332f62a75557b4ed009c5d49c ******/
		%feature("compactdefaultargs") SimplifyBSpline2d;
		%feature("autodoc", "
Parameters
----------
theBSpline2d: Geom2d_BSplineCurve
theTolerance: float

Return
-------
bool

Description
-----------
Try to remove knots from bspline where local derivatives are the same. Remove knots with given precision. Returns false if Bsplien was not modified.
") SimplifyBSpline2d;
		static Standard_Boolean SimplifyBSpline2d(opencascade::handle<Geom2d_BSplineCurve> & theBSpline2d, const Standard_Real theTolerance);

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


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertBezierSurf() {
            return (Standard_Boolean) $self->ConvertBezierSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertBezierSurf(Standard_Boolean value) {
            $self->ConvertBezierSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertConicalSurf() {
            return (Standard_Boolean) $self->ConvertConicalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertConicalSurf(Standard_Boolean value) {
            $self->ConvertConicalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertCurve2d() {
            return (Standard_Boolean) $self->ConvertCurve2d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertCurve2d(Standard_Boolean value) {
            $self->ConvertCurve2d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertCurve3d() {
            return (Standard_Boolean) $self->ConvertCurve3d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertCurve3d(Standard_Boolean value) {
            $self->ConvertCurve3d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertCylindricalSurf() {
            return (Standard_Boolean) $self->ConvertCylindricalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertCylindricalSurf(Standard_Boolean value) {
            $self->ConvertCylindricalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertExtrusionSurf() {
            return (Standard_Boolean) $self->ConvertExtrusionSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertExtrusionSurf(Standard_Boolean value) {
            $self->ConvertExtrusionSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertOffsetCurv2d() {
            return (Standard_Boolean) $self->ConvertOffsetCurv2d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertOffsetCurv2d(Standard_Boolean value) {
            $self->ConvertOffsetCurv2d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertOffsetCurv3d() {
            return (Standard_Boolean) $self->ConvertOffsetCurv3d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertOffsetCurv3d(Standard_Boolean value) {
            $self->ConvertOffsetCurv3d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertOffsetSurf() {
            return (Standard_Boolean) $self->ConvertOffsetSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertOffsetSurf(Standard_Boolean value) {
            $self->ConvertOffsetSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertPlane() {
            return (Standard_Boolean) $self->ConvertPlane();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertPlane(Standard_Boolean value) {
            $self->ConvertPlane()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertRevolutionSurf() {
            return (Standard_Boolean) $self->ConvertRevolutionSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertRevolutionSurf(Standard_Boolean value) {
            $self->ConvertRevolutionSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertSphericalSurf() {
            return (Standard_Boolean) $self->ConvertSphericalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertSphericalSurf(Standard_Boolean value) {
            $self->ConvertSphericalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertToroidalSurf() {
            return (Standard_Boolean) $self->ConvertToroidalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertToroidalSurf(Standard_Boolean value) {
            $self->ConvertToroidalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetGMaxDegree() {
            return (Standard_Integer) $self->GMaxDegree();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetGMaxDegree(Standard_Integer value) {
            $self->GMaxDegree()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetGMaxSeg() {
            return (Standard_Integer) $self->GMaxSeg();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetGMaxSeg(Standard_Integer value) {
            $self->GMaxSeg()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSegmentSurfaceMode() {
            return (Standard_Boolean) $self->SegmentSurfaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSegmentSurfaceMode(Standard_Boolean value) {
            $self->SegmentSurfaceMode()=value;
            }
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
		/****** md5 signature: 4785add508ea07ea86d027be413480ad ******/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "
Parameters
----------
tol: float
substitute: bool

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Tries to convert the Surface to an Analytic form Returns the result Works only if the Surface is BSpline or Bezier. Else, or in case of failure, returns a Null Handle //! If <substitute> is True, the new surface replaces the actual one in <self> //! It works by analysing the case which can apply, creating the corresponding analytic surface, then checking coincidence Warning: Parameter laws are not kept, hence PCurves should be redone.
") ConvertToAnalytical;
		opencascade::handle<Geom_Surface> ConvertToAnalytical(const Standard_Real tol, const Standard_Boolean substitute);

		/****** ShapeCustom_Surface::ConvertToPeriodic ******/
		/****** md5 signature: ba4913a093868274014a528fd5ec61a7 ******/
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "
Parameters
----------
substitute: bool
preci: float (optional, default to -1)

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Tries to convert the Surface to the Periodic form Returns the resulting surface Works only if the Surface is BSpline and is closed with Precision::Confusion() Else, or in case of failure, returns a Null Handle.
") ConvertToPeriodic;
		opencascade::handle<Geom_Surface> ConvertToPeriodic(const Standard_Boolean substitute, const Standard_Real preci = -1);

		/****** ShapeCustom_Surface::Gap ******/
		/****** md5 signature: 57884ecbe8d7b5b092e706848a3678db ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximal deviation of converted surface from the original one computed by last call to ConvertToAnalytical.
") Gap;
		Standard_Real Gap();

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
		/****** md5 signature: fae0c201ae8f07a170a1eb576572768a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <E> multiplied with scale factor.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewCurve2d ******/
		/****** md5 signature: ea858177828b71b789a2564d89f64210 ******/
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
Tol: float

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <E> multiplied with scale factor.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewParameter ******/
		/****** md5 signature: e14926b54c8548936ba9a49d140b8da3 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <V> multiplied with scale factor.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewPoint ******/
		/****** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <V> multiplied with scale factor.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** ShapeCustom_TrsfModification::NewSurface ******/
		/****** md5 signature: 001097e1d949f85581f605ce49276ada ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Calls inherited method. Sets <Tol> as actual tolerance of <F> multiplied with scale factor.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

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
		/****** md5 signature: a3c3d5a955b90f2e1cefb3c12dc67277 ******/
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
		/****** md5 signature: fae0c201ae8f07a170a1eb576572768a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewCurve2d ******/
		/****** md5 signature: ea858177828b71b789a2564d89f64210 ******/
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
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be useful.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewParameter ******/
		/****** md5 signature: e14926b54c8548936ba9a49d140b8da3 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewPoint ******/
		/****** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** ShapeCustom_ConvertToBSpline::NewSurface ******/
		/****** md5 signature: 001097e1d949f85581f605ce49276ada ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <S>, <L>, <Tol> are not significant.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** ShapeCustom_ConvertToBSpline::SetExtrusionMode ******/
		/****** md5 signature: 169e481cbec21216a690aea07c39e8bf ******/
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
		void SetExtrusionMode(const Standard_Boolean extrMode);

		/****** ShapeCustom_ConvertToBSpline::SetOffsetMode ******/
		/****** md5 signature: 95ca203f203423b410d33a2b819a45cb ******/
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
		void SetOffsetMode(const Standard_Boolean offsetMode);

		/****** ShapeCustom_ConvertToBSpline::SetPlaneMode ******/
		/****** md5 signature: 76c90747b069acf4539a86c302869898 ******/
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
		void SetPlaneMode(const Standard_Boolean planeMode);

		/****** ShapeCustom_ConvertToBSpline::SetRevolutionMode ******/
		/****** md5 signature: e7948e94ae621e0951e54d40c4147525 ******/
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
		void SetRevolutionMode(const Standard_Boolean revolMode);

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
		/****** md5 signature: a3c3d5a955b90f2e1cefb3c12dc67277 ******/
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
		/****** md5 signature: fae0c201ae8f07a170a1eb576572768a ******/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewCurve2d ******/
		/****** md5 signature: ea858177828b71b789a2564d89f64210 ******/
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
Tol: float

Description
-----------
Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be useful.
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewParameter ******/
		/****** md5 signature: e14926b54c8548936ba9a49d140b8da3 ******/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float
Tol: float

Description
-----------
Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewPoint ******/
		/****** md5 signature: 936cfe13f9c774f9038d7f0e2f3e521b ******/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
Tol: float

Description
-----------
Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****** ShapeCustom_DirectModification::NewSurface ******/
		/****** md5 signature: 001097e1d949f85581f605ce49276ada ******/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location

Return
-------
Tol: float
RevWires: bool
RevFace: bool

Description
-----------
Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <S>, <L>, <Tol> are not significant.
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

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
