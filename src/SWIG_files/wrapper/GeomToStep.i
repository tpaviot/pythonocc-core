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
%define GEOMTOSTEPDOCSTRING
"GeomToStep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomtostep.html"
%enddef
%module (package="OCC.Core", docstring=GEOMTOSTEPDOCSTRING) GeomToStep


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
#include<GeomToStep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<StepGeom_module.hxx>
#include<TColgp_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<MoniTool_module.hxx>
#include<StepElement_module.hxx>
#include<Interface_module.hxx>
#include<StepData_module.hxx>
#include<StepShape_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom.i
%import Geom2d.i
%import StepGeom.i
%import TColgp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class GeomToStep_Root *
************************/
class GeomToStep_Root {
	public:
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

};


%extend GeomToStep_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeAxis1Placement *
**************************************/
class GeomToStep_MakeAxis1Placement : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeAxis1Placement ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", ":param A:
	:type A: gp_Ax1
	:rtype: None") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const gp_Ax1 & A);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const gp_Ax2d & A);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", ":param A:
	:type A: Geom_Axis1Placement
	:rtype: None") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const opencascade::handle<Geom_Axis1Placement> & A);

		/****************** GeomToStep_MakeAxis1Placement ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", ":param A:
	:type A: Geom2d_AxisPlacement
	:rtype: None") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const opencascade::handle<Geom2d_AxisPlacement> & A);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis1Placement>") Value;
		const opencascade::handle<StepGeom_Axis1Placement> & Value ();

};


%extend GeomToStep_MakeAxis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomToStep_MakeAxis2Placement2d *
****************************************/
class GeomToStep_MakeAxis2Placement2d : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeAxis2Placement2d ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2
	:rtype: None") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d (const gp_Ax2 & A);

		/****************** GeomToStep_MakeAxis2Placement2d ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", ":param A:
	:type A: gp_Ax22d
	:rtype: None") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d (const gp_Ax22d & A);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis2Placement2d>") Value;
		const opencascade::handle<StepGeom_Axis2Placement2d> & Value ();

};


%extend GeomToStep_MakeAxis2Placement2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomToStep_MakeAxis2Placement3d *
****************************************/
class GeomToStep_MakeAxis2Placement3d : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", ":rtype: None") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d ();

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2
	:rtype: None") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const gp_Ax2 & A);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", ":param A:
	:type A: gp_Ax3
	:rtype: None") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const gp_Ax3 & A);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const gp_Trsf & T);

		/****************** GeomToStep_MakeAxis2Placement3d ******************/
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", ":param A:
	:type A: Geom_Axis2Placement
	:rtype: None") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const opencascade::handle<Geom_Axis2Placement> & A);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Axis2Placement3d>") Value;
		const opencascade::handle<StepGeom_Axis2Placement3d> & Value ();

};


%extend GeomToStep_MakeAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class GeomToStep_MakeBSplineCurveWithKnots *
*********************************************/
class GeomToStep_MakeBSplineCurveWithKnots : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineCurveWithKnots ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", ":param Bsplin:
	:type Bsplin: Geom_BSplineCurve
	:rtype: None") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots (const opencascade::handle<Geom_BSplineCurve> & Bsplin);

		/****************** GeomToStep_MakeBSplineCurveWithKnots ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", ":param Bsplin:
	:type Bsplin: Geom2d_BSplineCurve
	:rtype: None") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots (const opencascade::handle<Geom2d_BSplineCurve> & Bsplin);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_BSplineCurveWithKnots>") Value;
		const opencascade::handle<StepGeom_BSplineCurveWithKnots> & Value ();

};


%extend GeomToStep_MakeBSplineCurveWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve *
********************************************************************/
class GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", ":param Bsplin:
	:type Bsplin: Geom_BSplineCurve
	:rtype: None") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve (const opencascade::handle<Geom_BSplineCurve> & Bsplin);

		/****************** GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", ":param Bsplin:
	:type Bsplin: Geom2d_BSplineCurve
	:rtype: None") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve (const opencascade::handle<Geom2d_BSplineCurve> & Bsplin);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve>") Value;
		const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & Value ();

};


%extend GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class GeomToStep_MakeBSplineSurfaceWithKnots *
***********************************************/
class GeomToStep_MakeBSplineSurfaceWithKnots : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineSurfaceWithKnots ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnots;
		%feature("autodoc", ":param Bsplin:
	:type Bsplin: Geom_BSplineSurface
	:rtype: None") GeomToStep_MakeBSplineSurfaceWithKnots;
		 GeomToStep_MakeBSplineSurfaceWithKnots (const opencascade::handle<Geom_BSplineSurface> & Bsplin);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_BSplineSurfaceWithKnots>") Value;
		const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & Value ();

};


%extend GeomToStep_MakeBSplineSurfaceWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface *
************************************************************************/
class GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", ":param Bsplin:
	:type Bsplin: Geom_BSplineSurface
	:rtype: None") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface (const opencascade::handle<Geom_BSplineSurface> & Bsplin);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface>") Value;
		const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & Value ();

};


%extend GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomToStep_MakeBoundedCurve *
************************************/
class GeomToStep_MakeBoundedCurve : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBoundedCurve ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", ":param C:
	:type C: Geom_BoundedCurve
	:rtype: None") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve (const opencascade::handle<Geom_BoundedCurve> & C);

		/****************** GeomToStep_MakeBoundedCurve ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", ":param C:
	:type C: Geom2d_BoundedCurve
	:rtype: None") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve (const opencascade::handle<Geom2d_BoundedCurve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_BoundedCurve>") Value;
		const opencascade::handle<StepGeom_BoundedCurve> & Value ();

};


%extend GeomToStep_MakeBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeBoundedSurface *
**************************************/
class GeomToStep_MakeBoundedSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeBoundedSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeBoundedSurface;
		%feature("autodoc", ":param C:
	:type C: Geom_BoundedSurface
	:rtype: None") GeomToStep_MakeBoundedSurface;
		 GeomToStep_MakeBoundedSurface (const opencascade::handle<Geom_BoundedSurface> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_BoundedSurface>") Value;
		const opencascade::handle<StepGeom_BoundedSurface> & Value ();

};


%extend GeomToStep_MakeBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeCartesianPoint *
**************************************/
class GeomToStep_MakeCartesianPoint : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCartesianPoint ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const gp_Pnt & P);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const gp_Pnt2d & P);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", ":param P:
	:type P: Geom_CartesianPoint
	:rtype: None") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const opencascade::handle<Geom_CartesianPoint> & P);

		/****************** GeomToStep_MakeCartesianPoint ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", ":param P:
	:type P: Geom2d_CartesianPoint
	:rtype: None") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const opencascade::handle<Geom2d_CartesianPoint> & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_CartesianPoint>") Value;
		const opencascade::handle<StepGeom_CartesianPoint> & Value ();

};


%extend GeomToStep_MakeCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomToStep_MakeCircle *
******************************/
class GeomToStep_MakeCircle : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCircle ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: None") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle (const gp_Circ & C);

		/****************** GeomToStep_MakeCircle ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", ":param C:
	:type C: Geom_Circle
	:rtype: None") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle (const opencascade::handle<Geom_Circle> & C);

		/****************** GeomToStep_MakeCircle ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Circle
	:rtype: None") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle (const opencascade::handle<Geom2d_Circle> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Circle>") Value;
		const opencascade::handle<StepGeom_Circle> & Value ();

};


%extend GeomToStep_MakeCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToStep_MakeConic *
*****************************/
class GeomToStep_MakeConic : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeConic ******************/
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", ":param C:
	:type C: Geom_Conic
	:rtype: None") GeomToStep_MakeConic;
		 GeomToStep_MakeConic (const opencascade::handle<Geom_Conic> & C);

		/****************** GeomToStep_MakeConic ******************/
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Conic
	:rtype: None") GeomToStep_MakeConic;
		 GeomToStep_MakeConic (const opencascade::handle<Geom2d_Conic> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Conic>") Value;
		const opencascade::handle<StepGeom_Conic> & Value ();

};


%extend GeomToStep_MakeConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomToStep_MakeConicalSurface *
**************************************/
class GeomToStep_MakeConicalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeConicalSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeConicalSurface;
		%feature("autodoc", ":param CSurf:
	:type CSurf: Geom_ConicalSurface
	:rtype: None") GeomToStep_MakeConicalSurface;
		 GeomToStep_MakeConicalSurface (const opencascade::handle<Geom_ConicalSurface> & CSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_ConicalSurface>") Value;
		const opencascade::handle<StepGeom_ConicalSurface> & Value ();

};


%extend GeomToStep_MakeConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToStep_MakeCurve *
*****************************/
class GeomToStep_MakeCurve : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCurve ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: None") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve (const opencascade::handle<Geom_Curve> & C);

		/****************** GeomToStep_MakeCurve ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: None") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Curve>") Value;
		const opencascade::handle<StepGeom_Curve> & Value ();

};


%extend GeomToStep_MakeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class GeomToStep_MakeCylindricalSurface *
******************************************/
class GeomToStep_MakeCylindricalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeCylindricalSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeCylindricalSurface;
		%feature("autodoc", ":param CSurf:
	:type CSurf: Geom_CylindricalSurface
	:rtype: None") GeomToStep_MakeCylindricalSurface;
		 GeomToStep_MakeCylindricalSurface (const opencascade::handle<Geom_CylindricalSurface> & CSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_CylindricalSurface>") Value;
		const opencascade::handle<StepGeom_CylindricalSurface> & Value ();

};


%extend GeomToStep_MakeCylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomToStep_MakeDirection *
*********************************/
class GeomToStep_MakeDirection : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeDirection ******************/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", ":param D:
	:type D: gp_Dir
	:rtype: None") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const gp_Dir & D);

		/****************** GeomToStep_MakeDirection ******************/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", ":param D:
	:type D: gp_Dir2d
	:rtype: None") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const gp_Dir2d & D);

		/****************** GeomToStep_MakeDirection ******************/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", ":param D:
	:type D: Geom_Direction
	:rtype: None") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const opencascade::handle<Geom_Direction> & D);

		/****************** GeomToStep_MakeDirection ******************/
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", ":param D:
	:type D: Geom2d_Direction
	:rtype: None") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const opencascade::handle<Geom2d_Direction> & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Direction>") Value;
		const opencascade::handle<StepGeom_Direction> & Value ();

};


%extend GeomToStep_MakeDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomToStep_MakeElementarySurface *
*****************************************/
class GeomToStep_MakeElementarySurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeElementarySurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeElementarySurface;
		%feature("autodoc", ":param S:
	:type S: Geom_ElementarySurface
	:rtype: None") GeomToStep_MakeElementarySurface;
		 GeomToStep_MakeElementarySurface (const opencascade::handle<Geom_ElementarySurface> & S);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_ElementarySurface>") Value;
		const opencascade::handle<StepGeom_ElementarySurface> & Value ();

};


%extend GeomToStep_MakeElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomToStep_MakeEllipse *
*******************************/
class GeomToStep_MakeEllipse : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeEllipse ******************/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", ":param C:
	:type C: gp_Elips
	:rtype: None") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse (const gp_Elips & C);

		/****************** GeomToStep_MakeEllipse ******************/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", ":param C:
	:type C: Geom_Ellipse
	:rtype: None") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse (const opencascade::handle<Geom_Ellipse> & C);

		/****************** GeomToStep_MakeEllipse ******************/
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Ellipse
	:rtype: None") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse (const opencascade::handle<Geom2d_Ellipse> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Ellipse>") Value;
		const opencascade::handle<StepGeom_Ellipse> & Value ();

};


%extend GeomToStep_MakeEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomToStep_MakeHyperbola *
*********************************/
class GeomToStep_MakeHyperbola : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeHyperbola ******************/
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Hyperbola
	:rtype: None") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola (const opencascade::handle<Geom2d_Hyperbola> & C);

		/****************** GeomToStep_MakeHyperbola ******************/
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", ":param C:
	:type C: Geom_Hyperbola
	:rtype: None") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola (const opencascade::handle<Geom_Hyperbola> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Hyperbola>") Value;
		const opencascade::handle<StepGeom_Hyperbola> & Value ();

};


%extend GeomToStep_MakeHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomToStep_MakeLine *
****************************/
class GeomToStep_MakeLine : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeLine ******************/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: None") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const gp_Lin & L);

		/****************** GeomToStep_MakeLine ******************/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", ":param L:
	:type L: gp_Lin2d
	:rtype: None") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const gp_Lin2d & L);

		/****************** GeomToStep_MakeLine ******************/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", ":param C:
	:type C: Geom_Line
	:rtype: None") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const opencascade::handle<Geom_Line> & C);

		/****************** GeomToStep_MakeLine ******************/
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Line
	:rtype: None") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const opencascade::handle<Geom2d_Line> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Line>") Value;
		const opencascade::handle<StepGeom_Line> & Value ();

};


%extend GeomToStep_MakeLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomToStep_MakeParabola *
********************************/
class GeomToStep_MakeParabola : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeParabola ******************/
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Parabola
	:rtype: None") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola (const opencascade::handle<Geom2d_Parabola> & C);

		/****************** GeomToStep_MakeParabola ******************/
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", ":param C:
	:type C: Geom_Parabola
	:rtype: None") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola (const opencascade::handle<Geom_Parabola> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Parabola>") Value;
		const opencascade::handle<StepGeom_Parabola> & Value ();

};


%extend GeomToStep_MakeParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomToStep_MakePlane *
*****************************/
class GeomToStep_MakePlane : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakePlane ******************/
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", ":param P:
	:type P: gp_Pln
	:rtype: None") GeomToStep_MakePlane;
		 GeomToStep_MakePlane (const gp_Pln & P);

		/****************** GeomToStep_MakePlane ******************/
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", ":param P:
	:type P: Geom_Plane
	:rtype: None") GeomToStep_MakePlane;
		 GeomToStep_MakePlane (const opencascade::handle<Geom_Plane> & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Plane>") Value;
		const opencascade::handle<StepGeom_Plane> & Value ();

};


%extend GeomToStep_MakePlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomToStep_MakePolyline *
********************************/
class GeomToStep_MakePolyline : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakePolyline ******************/
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", ":param P:
	:type P: TColgp_Array1OfPnt
	:rtype: None") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline (const TColgp_Array1OfPnt & P);

		/****************** GeomToStep_MakePolyline ******************/
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", ":param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: None") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline (const TColgp_Array1OfPnt2d & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Polyline>") Value;
		const opencascade::handle<StepGeom_Polyline> & Value ();

};


%extend GeomToStep_MakePolyline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class GeomToStep_MakeRectangularTrimmedSurface *
*************************************************/
class GeomToStep_MakeRectangularTrimmedSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeRectangularTrimmedSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeRectangularTrimmedSurface;
		%feature("autodoc", ":param RTSurf:
	:type RTSurf: Geom_RectangularTrimmedSurface
	:rtype: None") GeomToStep_MakeRectangularTrimmedSurface;
		 GeomToStep_MakeRectangularTrimmedSurface (const opencascade::handle<Geom_RectangularTrimmedSurface> & RTSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_RectangularTrimmedSurface>") Value;
		const opencascade::handle<StepGeom_RectangularTrimmedSurface> & Value ();

};


%extend GeomToStep_MakeRectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomToStep_MakeSphericalSurface *
****************************************/
class GeomToStep_MakeSphericalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSphericalSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeSphericalSurface;
		%feature("autodoc", ":param CSurf:
	:type CSurf: Geom_SphericalSurface
	:rtype: None") GeomToStep_MakeSphericalSurface;
		 GeomToStep_MakeSphericalSurface (const opencascade::handle<Geom_SphericalSurface> & CSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_SphericalSurface>") Value;
		const opencascade::handle<StepGeom_SphericalSurface> & Value ();

};


%extend GeomToStep_MakeSphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomToStep_MakeSurface *
*******************************/
class GeomToStep_MakeSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeSurface;
		%feature("autodoc", ":param C:
	:type C: Geom_Surface
	:rtype: None") GeomToStep_MakeSurface;
		 GeomToStep_MakeSurface (const opencascade::handle<Geom_Surface> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Surface>") Value;
		const opencascade::handle<StepGeom_Surface> & Value ();

};


%extend GeomToStep_MakeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class GeomToStep_MakeSurfaceOfLinearExtrusion *
************************************************/
class GeomToStep_MakeSurfaceOfLinearExtrusion : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", ":param CSurf:
	:type CSurf: Geom_SurfaceOfLinearExtrusion
	:rtype: None") GeomToStep_MakeSurfaceOfLinearExtrusion;
		 GeomToStep_MakeSurfaceOfLinearExtrusion (const opencascade::handle<Geom_SurfaceOfLinearExtrusion> & CSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_SurfaceOfLinearExtrusion>") Value;
		const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & Value ();

};


%extend GeomToStep_MakeSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class GeomToStep_MakeSurfaceOfRevolution *
*******************************************/
class GeomToStep_MakeSurfaceOfRevolution : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSurfaceOfRevolution ******************/
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfRevolution;
		%feature("autodoc", ":param RevSurf:
	:type RevSurf: Geom_SurfaceOfRevolution
	:rtype: None") GeomToStep_MakeSurfaceOfRevolution;
		 GeomToStep_MakeSurfaceOfRevolution (const opencascade::handle<Geom_SurfaceOfRevolution> & RevSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_SurfaceOfRevolution>") Value;
		const opencascade::handle<StepGeom_SurfaceOfRevolution> & Value ();

};


%extend GeomToStep_MakeSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomToStep_MakeSweptSurface *
************************************/
class GeomToStep_MakeSweptSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeSweptSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeSweptSurface;
		%feature("autodoc", ":param S:
	:type S: Geom_SweptSurface
	:rtype: None") GeomToStep_MakeSweptSurface;
		 GeomToStep_MakeSweptSurface (const opencascade::handle<Geom_SweptSurface> & S);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_SweptSurface>") Value;
		const opencascade::handle<StepGeom_SweptSurface> & Value ();

};


%extend GeomToStep_MakeSweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomToStep_MakeToroidalSurface *
***************************************/
class GeomToStep_MakeToroidalSurface : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeToroidalSurface ******************/
		%feature("compactdefaultargs") GeomToStep_MakeToroidalSurface;
		%feature("autodoc", ":param TorSurf:
	:type TorSurf: Geom_ToroidalSurface
	:rtype: None") GeomToStep_MakeToroidalSurface;
		 GeomToStep_MakeToroidalSurface (const opencascade::handle<Geom_ToroidalSurface> & TorSurf);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_ToroidalSurface>") Value;
		const opencascade::handle<StepGeom_ToroidalSurface> & Value ();

};


%extend GeomToStep_MakeToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomToStep_MakeVector *
******************************/
class GeomToStep_MakeVector : public GeomToStep_Root {
	public:
		/****************** GeomToStep_MakeVector ******************/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const gp_Vec & V);

		/****************** GeomToStep_MakeVector ******************/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const gp_Vec2d & V);

		/****************** GeomToStep_MakeVector ******************/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", ":param V:
	:type V: Geom_Vector
	:rtype: None") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const opencascade::handle<Geom_Vector> & V);

		/****************** GeomToStep_MakeVector ******************/
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", ":param V:
	:type V: Geom2d_Vector
	:rtype: None") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const opencascade::handle<Geom2d_Vector> & V);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<StepGeom_Vector>") Value;
		const opencascade::handle<StepGeom_Vector> & Value ();

};


%extend GeomToStep_MakeVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
