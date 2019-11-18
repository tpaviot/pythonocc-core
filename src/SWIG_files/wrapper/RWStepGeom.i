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
%define RWSTEPGEOMDOCSTRING
"RWStepGeom module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepgeom.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPGEOMDOCSTRING) RWStepGeom


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
#include<RWStepGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<StepData_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepRepr_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import StepGeom.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%nodefaultctor RWStepGeom_RWAxis1Placement;
class RWStepGeom_RWAxis1Placement {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWAxis1Placement;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWAxis1Placement;
		 RWStepGeom_RWAxis1Placement ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis1Placement> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Axis1Placement> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis1Placement> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Axis1Placement> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis1Placement> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Axis1Placement> & ent);
};


%extend RWStepGeom_RWAxis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWAxis2Placement2d;
class RWStepGeom_RWAxis2Placement2d {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWAxis2Placement2d;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWAxis2Placement2d;
		 RWStepGeom_RWAxis2Placement2d ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis2Placement2d> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Axis2Placement2d> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis2Placement2d> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Axis2Placement2d> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis2Placement2d> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Axis2Placement2d> & ent);
};


%extend RWStepGeom_RWAxis2Placement2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWAxis2Placement3d;
class RWStepGeom_RWAxis2Placement3d {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWAxis2Placement3d;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWAxis2Placement3d;
		 RWStepGeom_RWAxis2Placement3d ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis2Placement3d> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Axis2Placement3d> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis2Placement3d> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Axis2Placement3d> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Axis2Placement3d> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Axis2Placement3d> & ent);
};


%extend RWStepGeom_RWAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBSplineCurve;
class RWStepGeom_RWBSplineCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBSplineCurve;
		 RWStepGeom_RWBSplineCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BSplineCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BSplineCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BSplineCurve> & ent);
};


%extend RWStepGeom_RWBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBSplineCurveWithKnots;
class RWStepGeom_RWBSplineCurveWithKnots {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnots> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurveWithKnots;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBSplineCurveWithKnots;
		 RWStepGeom_RWBSplineCurveWithKnots ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnots> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnots> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnots> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BSplineCurveWithKnots> & ent);
};


%extend RWStepGeom_RWBSplineCurveWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve;
class RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve;
		 RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve> & ent);
};


%extend RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBSplineSurface;
class RWStepGeom_RWBSplineSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBSplineSurface;
		 RWStepGeom_RWBSplineSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BSplineSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BSplineSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BSplineSurface> & ent);
};


%extend RWStepGeom_RWBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBSplineSurfaceWithKnots;
class RWStepGeom_RWBSplineSurfaceWithKnots {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnots> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurfaceWithKnots;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBSplineSurfaceWithKnots;
		 RWStepGeom_RWBSplineSurfaceWithKnots ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnots> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnots> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnots> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & ent);
};


%extend RWStepGeom_RWBSplineSurfaceWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface;
class RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface> & ent);
};


%extend RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBezierCurve;
class RWStepGeom_RWBezierCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBezierCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBezierCurve;
		 RWStepGeom_RWBezierCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BezierCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BezierCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BezierCurve> & ent);
};


%extend RWStepGeom_RWBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBezierCurveAndRationalBSplineCurve;
class RWStepGeom_RWBezierCurveAndRationalBSplineCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBezierCurveAndRationalBSplineCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBezierCurveAndRationalBSplineCurve;
		 RWStepGeom_RWBezierCurveAndRationalBSplineCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BezierCurveAndRationalBSplineCurve> & ent);
};


%extend RWStepGeom_RWBezierCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBezierSurface;
class RWStepGeom_RWBezierSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBezierSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBezierSurface;
		 RWStepGeom_RWBezierSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BezierSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BezierSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BezierSurface> & ent);
};


%extend RWStepGeom_RWBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface;
class RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BezierSurfaceAndRationalBSplineSurface> & ent);
};


%extend RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBoundaryCurve;
class RWStepGeom_RWBoundaryCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBoundaryCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBoundaryCurve;
		 RWStepGeom_RWBoundaryCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BoundaryCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BoundaryCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_BoundaryCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_BoundaryCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BoundaryCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BoundaryCurve> & ent);
};


%extend RWStepGeom_RWBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBoundedCurve;
class RWStepGeom_RWBoundedCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBoundedCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBoundedCurve;
		 RWStepGeom_RWBoundedCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BoundedCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BoundedCurve> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BoundedCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BoundedCurve> & ent);
};


%extend RWStepGeom_RWBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWBoundedSurface;
class RWStepGeom_RWBoundedSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWBoundedSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWBoundedSurface;
		 RWStepGeom_RWBoundedSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BoundedSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_BoundedSurface> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_BoundedSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_BoundedSurface> & ent);
};


%extend RWStepGeom_RWBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCartesianPoint;
class RWStepGeom_RWCartesianPoint {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCartesianPoint;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCartesianPoint;
		 RWStepGeom_RWCartesianPoint ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianPoint> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CartesianPoint> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianPoint> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CartesianPoint> & ent);
};


%extend RWStepGeom_RWCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCartesianTransformationOperator;
class RWStepGeom_RWCartesianTransformationOperator {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCartesianTransformationOperator;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCartesianTransformationOperator;
		 RWStepGeom_RWCartesianTransformationOperator ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianTransformationOperator> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CartesianTransformationOperator> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianTransformationOperator> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CartesianTransformationOperator> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianTransformationOperator> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CartesianTransformationOperator> & ent);
};


%extend RWStepGeom_RWCartesianTransformationOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCartesianTransformationOperator3d;
class RWStepGeom_RWCartesianTransformationOperator3d {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCartesianTransformationOperator3d;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCartesianTransformationOperator3d;
		 RWStepGeom_RWCartesianTransformationOperator3d ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianTransformationOperator3d> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianTransformationOperator3d> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CartesianTransformationOperator3d> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & ent);
};


%extend RWStepGeom_RWCartesianTransformationOperator3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCircle;
class RWStepGeom_RWCircle {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCircle;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCircle;
		 RWStepGeom_RWCircle ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Circle> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Circle> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Circle> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Circle> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Circle> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Circle> & ent);
};


%extend RWStepGeom_RWCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCompositeCurve;
class RWStepGeom_RWCompositeCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCompositeCurve;
		 RWStepGeom_RWCompositeCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CompositeCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CompositeCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CompositeCurve> & ent);
};


%extend RWStepGeom_RWCompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCompositeCurveOnSurface;
class RWStepGeom_RWCompositeCurveOnSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurveOnSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCompositeCurveOnSurface;
		 RWStepGeom_RWCompositeCurveOnSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurveOnSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CompositeCurveOnSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurveOnSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CompositeCurveOnSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurveOnSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CompositeCurveOnSurface> & ent);
};


%extend RWStepGeom_RWCompositeCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCompositeCurveSegment;
class RWStepGeom_RWCompositeCurveSegment {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCompositeCurveSegment;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCompositeCurveSegment;
		 RWStepGeom_RWCompositeCurveSegment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurveSegment> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CompositeCurveSegment> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurveSegment> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CompositeCurveSegment> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CompositeCurveSegment> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CompositeCurveSegment> & ent);
};


%extend RWStepGeom_RWCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWConic;
class RWStepGeom_RWConic {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWConic;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWConic;
		 RWStepGeom_RWConic ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Conic> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Conic> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Conic> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Conic> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Conic> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Conic> & ent);
};


%extend RWStepGeom_RWConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWConicalSurface;
class RWStepGeom_RWConicalSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWConicalSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWConicalSurface;
		 RWStepGeom_RWConicalSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ConicalSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_ConicalSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_ConicalSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_ConicalSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ConicalSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_ConicalSurface> & ent);
};


%extend RWStepGeom_RWConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCurve;
class RWStepGeom_RWCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCurve;
		 RWStepGeom_RWCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Curve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Curve> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Curve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Curve> & ent);
};


%extend RWStepGeom_RWCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCurveBoundedSurface;
class RWStepGeom_RWCurveBoundedSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCurveBoundedSurface;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepGeom_RWCurveBoundedSurface;
		 RWStepGeom_RWCurveBoundedSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveBoundedSurface

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CurveBoundedSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CurveBoundedSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepGeom_CurveBoundedSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CurveBoundedSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveBoundedSurface

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CurveBoundedSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CurveBoundedSurface> & ent);
};


%extend RWStepGeom_RWCurveBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCurveReplica;
class RWStepGeom_RWCurveReplica {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCurveReplica;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCurveReplica;
		 RWStepGeom_RWCurveReplica ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CurveReplica> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CurveReplica> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_CurveReplica> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CurveReplica> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CurveReplica> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CurveReplica> & ent);
};


%extend RWStepGeom_RWCurveReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWCylindricalSurface;
class RWStepGeom_RWCylindricalSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWCylindricalSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWCylindricalSurface;
		 RWStepGeom_RWCylindricalSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CylindricalSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_CylindricalSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_CylindricalSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_CylindricalSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_CylindricalSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_CylindricalSurface> & ent);
};


%extend RWStepGeom_RWCylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWDegeneratePcurve;
class RWStepGeom_RWDegeneratePcurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWDegeneratePcurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWDegeneratePcurve;
		 RWStepGeom_RWDegeneratePcurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_DegeneratePcurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_DegeneratePcurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_DegeneratePcurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_DegeneratePcurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_DegeneratePcurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_DegeneratePcurve> & ent);
};


%extend RWStepGeom_RWDegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWDegenerateToroidalSurface;
class RWStepGeom_RWDegenerateToroidalSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWDegenerateToroidalSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWDegenerateToroidalSurface;
		 RWStepGeom_RWDegenerateToroidalSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_DegenerateToroidalSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_DegenerateToroidalSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_DegenerateToroidalSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_DegenerateToroidalSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_DegenerateToroidalSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_DegenerateToroidalSurface> & ent);
};


%extend RWStepGeom_RWDegenerateToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWDirection;
class RWStepGeom_RWDirection {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Direction> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_Direction> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWDirection;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWDirection;
		 RWStepGeom_RWDirection ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Direction> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Direction> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Direction> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Direction> & ent);
};


%extend RWStepGeom_RWDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWElementarySurface;
class RWStepGeom_RWElementarySurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWElementarySurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWElementarySurface;
		 RWStepGeom_RWElementarySurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ElementarySurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_ElementarySurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_ElementarySurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_ElementarySurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ElementarySurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_ElementarySurface> & ent);
};


%extend RWStepGeom_RWElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWEllipse;
class RWStepGeom_RWEllipse {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Ellipse> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_Ellipse> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWEllipse;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWEllipse;
		 RWStepGeom_RWEllipse ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Ellipse> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Ellipse> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Ellipse> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Ellipse> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Ellipse> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Ellipse> & ent);
};


%extend RWStepGeom_RWEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWEvaluatedDegeneratePcurve;
class RWStepGeom_RWEvaluatedDegeneratePcurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWEvaluatedDegeneratePcurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWEvaluatedDegeneratePcurve;
		 RWStepGeom_RWEvaluatedDegeneratePcurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_EvaluatedDegeneratePcurve> & ent);
};


%extend RWStepGeom_RWEvaluatedDegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
class RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		 RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> & ent);
};


%extend RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWGeometricRepresentationContext;
class RWStepGeom_RWGeometricRepresentationContext {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContext;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWGeometricRepresentationContext;
		 RWStepGeom_RWGeometricRepresentationContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContext> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_GeometricRepresentationContext> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContext> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_GeometricRepresentationContext> & ent);
};


%extend RWStepGeom_RWGeometricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext;
class RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext;
		 RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext> & ent);
};


%extend RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext;
class RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext;
		 RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext> & ent);
};


%extend RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWGeometricRepresentationItem;
class RWStepGeom_RWGeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWGeometricRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWGeometricRepresentationItem;
		 RWStepGeom_RWGeometricRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationItem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_GeometricRepresentationItem> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_GeometricRepresentationItem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_GeometricRepresentationItem> & ent);
};


%extend RWStepGeom_RWGeometricRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWHyperbola;
class RWStepGeom_RWHyperbola {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWHyperbola;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWHyperbola;
		 RWStepGeom_RWHyperbola ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Hyperbola> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Hyperbola> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Hyperbola> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Hyperbola> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Hyperbola> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Hyperbola> & ent);
};


%extend RWStepGeom_RWHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWIntersectionCurve;
class RWStepGeom_RWIntersectionCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWIntersectionCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWIntersectionCurve;
		 RWStepGeom_RWIntersectionCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_IntersectionCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_IntersectionCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_IntersectionCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_IntersectionCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_IntersectionCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_IntersectionCurve> & ent);
};


%extend RWStepGeom_RWIntersectionCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWLine;
class RWStepGeom_RWLine {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWLine;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWLine;
		 RWStepGeom_RWLine ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Line> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Line> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Line> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Line> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Line> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Line> & ent);
};


%extend RWStepGeom_RWLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWOffsetCurve3d;
class RWStepGeom_RWOffsetCurve3d {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWOffsetCurve3d;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWOffsetCurve3d;
		 RWStepGeom_RWOffsetCurve3d ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OffsetCurve3d> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_OffsetCurve3d> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_OffsetCurve3d> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_OffsetCurve3d> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OffsetCurve3d> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_OffsetCurve3d> & ent);
};


%extend RWStepGeom_RWOffsetCurve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWOffsetSurface;
class RWStepGeom_RWOffsetSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWOffsetSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWOffsetSurface;
		 RWStepGeom_RWOffsetSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OffsetSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_OffsetSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_OffsetSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_OffsetSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OffsetSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_OffsetSurface> & ent);
};


%extend RWStepGeom_RWOffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWOrientedSurface;
class RWStepGeom_RWOrientedSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWOrientedSurface;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepGeom_RWOrientedSurface;
		 RWStepGeom_RWOrientedSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads OrientedSurface

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OrientedSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_OrientedSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepGeom_OrientedSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_OrientedSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes OrientedSurface

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OrientedSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_OrientedSurface> & ent);
};


%extend RWStepGeom_RWOrientedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWOuterBoundaryCurve;
class RWStepGeom_RWOuterBoundaryCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWOuterBoundaryCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWOuterBoundaryCurve;
		 RWStepGeom_RWOuterBoundaryCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OuterBoundaryCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_OuterBoundaryCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_OuterBoundaryCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_OuterBoundaryCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_OuterBoundaryCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_OuterBoundaryCurve> & ent);
};


%extend RWStepGeom_RWOuterBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWParabola;
class RWStepGeom_RWParabola {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWParabola;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWParabola;
		 RWStepGeom_RWParabola ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Parabola> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Parabola> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Parabola> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Parabola> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Parabola> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Parabola> & ent);
};


%extend RWStepGeom_RWParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPcurve;
class RWStepGeom_RWPcurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPcurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPcurve;
		 RWStepGeom_RWPcurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Pcurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Pcurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Pcurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Pcurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Pcurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Pcurve> & ent);
};


%extend RWStepGeom_RWPcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPlacement;
class RWStepGeom_RWPlacement {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPlacement;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPlacement;
		 RWStepGeom_RWPlacement ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Placement> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Placement> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Placement> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Placement> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Placement> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Placement> & ent);
};


%extend RWStepGeom_RWPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPlane;
class RWStepGeom_RWPlane {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPlane;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPlane;
		 RWStepGeom_RWPlane ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Plane> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Plane> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Plane> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Plane> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Plane> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Plane> & ent);
};


%extend RWStepGeom_RWPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPoint;
class RWStepGeom_RWPoint {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPoint;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPoint;
		 RWStepGeom_RWPoint ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Point> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Point> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Point> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Point> & ent);
};


%extend RWStepGeom_RWPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPointOnCurve;
class RWStepGeom_RWPointOnCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPointOnCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPointOnCurve;
		 RWStepGeom_RWPointOnCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_PointOnCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_PointOnCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_PointOnCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_PointOnCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_PointOnCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_PointOnCurve> & ent);
};


%extend RWStepGeom_RWPointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPointOnSurface;
class RWStepGeom_RWPointOnSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPointOnSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPointOnSurface;
		 RWStepGeom_RWPointOnSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_PointOnSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_PointOnSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_PointOnSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_PointOnSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_PointOnSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_PointOnSurface> & ent);
};


%extend RWStepGeom_RWPointOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPointReplica;
class RWStepGeom_RWPointReplica {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPointReplica;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPointReplica;
		 RWStepGeom_RWPointReplica ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_PointReplica> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_PointReplica> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_PointReplica> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_PointReplica> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_PointReplica> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_PointReplica> & ent);
};


%extend RWStepGeom_RWPointReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWPolyline;
class RWStepGeom_RWPolyline {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWPolyline;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWPolyline;
		 RWStepGeom_RWPolyline ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Polyline> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Polyline> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Polyline> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Polyline> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Polyline> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Polyline> & ent);
};


%extend RWStepGeom_RWPolyline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWQuasiUniformCurve;
class RWStepGeom_RWQuasiUniformCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWQuasiUniformCurve;
		 RWStepGeom_RWQuasiUniformCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_QuasiUniformCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_QuasiUniformCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_QuasiUniformCurve> & ent);
};


%extend RWStepGeom_RWQuasiUniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve;
class RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve;
		 RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_QuasiUniformCurveAndRationalBSplineCurve> & ent);
};


%extend RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWQuasiUniformSurface;
class RWStepGeom_RWQuasiUniformSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWQuasiUniformSurface;
		 RWStepGeom_RWQuasiUniformSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_QuasiUniformSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_QuasiUniformSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_QuasiUniformSurface> & ent);
};


%extend RWStepGeom_RWQuasiUniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface;
class RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface> & ent);
};


%extend RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWRationalBSplineCurve;
class RWStepGeom_RWRationalBSplineCurve {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineCurve> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_RationalBSplineCurve> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWRationalBSplineCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWRationalBSplineCurve;
		 RWStepGeom_RWRationalBSplineCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_RationalBSplineCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_RationalBSplineCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_RationalBSplineCurve> & ent);
};


%extend RWStepGeom_RWRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWRationalBSplineSurface;
class RWStepGeom_RWRationalBSplineSurface {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineSurface> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_RationalBSplineSurface> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWRationalBSplineSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWRationalBSplineSurface;
		 RWStepGeom_RWRationalBSplineSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_RationalBSplineSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_RationalBSplineSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RationalBSplineSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_RationalBSplineSurface> & ent);
};


%extend RWStepGeom_RWRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWRectangularCompositeSurface;
class RWStepGeom_RWRectangularCompositeSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWRectangularCompositeSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWRectangularCompositeSurface;
		 RWStepGeom_RWRectangularCompositeSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RectangularCompositeSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_RectangularCompositeSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_RectangularCompositeSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_RectangularCompositeSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RectangularCompositeSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_RectangularCompositeSurface> & ent);
};


%extend RWStepGeom_RWRectangularCompositeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWRectangularTrimmedSurface;
class RWStepGeom_RWRectangularTrimmedSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWRectangularTrimmedSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWRectangularTrimmedSurface;
		 RWStepGeom_RWRectangularTrimmedSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RectangularTrimmedSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_RectangularTrimmedSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_RectangularTrimmedSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_RectangularTrimmedSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_RectangularTrimmedSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_RectangularTrimmedSurface> & ent);
};


%extend RWStepGeom_RWRectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWReparametrisedCompositeCurveSegment;
class RWStepGeom_RWReparametrisedCompositeCurveSegment {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWReparametrisedCompositeCurveSegment;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWReparametrisedCompositeCurveSegment;
		 RWStepGeom_RWReparametrisedCompositeCurveSegment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_ReparametrisedCompositeCurveSegment> & ent);
};


%extend RWStepGeom_RWReparametrisedCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSeamCurve;
class RWStepGeom_RWSeamCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSeamCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSeamCurve;
		 RWStepGeom_RWSeamCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SeamCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SeamCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SeamCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SeamCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SeamCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SeamCurve> & ent);
};


%extend RWStepGeom_RWSeamCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSphericalSurface;
class RWStepGeom_RWSphericalSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSphericalSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSphericalSurface;
		 RWStepGeom_RWSphericalSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SphericalSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SphericalSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SphericalSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SphericalSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SphericalSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SphericalSurface> & ent);
};


%extend RWStepGeom_RWSphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSurface;
class RWStepGeom_RWSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSurface;
		 RWStepGeom_RWSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Surface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Surface> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Surface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Surface> & ent);
};


%extend RWStepGeom_RWSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSurfaceCurve;
class RWStepGeom_RWSurfaceCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSurfaceCurve;
		 RWStepGeom_RWSurfaceCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SurfaceCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SurfaceCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SurfaceCurve> & ent);
};


%extend RWStepGeom_RWSurfaceCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSurfaceCurveAndBoundedCurve;
class RWStepGeom_RWSurfaceCurveAndBoundedCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceCurveAndBoundedCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSurfaceCurveAndBoundedCurve;
		 RWStepGeom_RWSurfaceCurveAndBoundedCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SurfaceCurveAndBoundedCurve> & ent);
};


%extend RWStepGeom_RWSurfaceCurveAndBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSurfaceOfLinearExtrusion;
class RWStepGeom_RWSurfaceOfLinearExtrusion {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceOfLinearExtrusion;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSurfaceOfLinearExtrusion;
		 RWStepGeom_RWSurfaceOfLinearExtrusion ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & ent);
};


%extend RWStepGeom_RWSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSurfaceOfRevolution;
class RWStepGeom_RWSurfaceOfRevolution {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceOfRevolution;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSurfaceOfRevolution;
		 RWStepGeom_RWSurfaceOfRevolution ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceOfRevolution> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SurfaceOfRevolution> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceOfRevolution> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SurfaceOfRevolution> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceOfRevolution> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SurfaceOfRevolution> & ent);
};


%extend RWStepGeom_RWSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSurfacePatch;
class RWStepGeom_RWSurfacePatch {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSurfacePatch;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSurfacePatch;
		 RWStepGeom_RWSurfacePatch ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfacePatch> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SurfacePatch> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfacePatch> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SurfacePatch> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfacePatch> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SurfacePatch> & ent);
};


%extend RWStepGeom_RWSurfacePatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSurfaceReplica;
class RWStepGeom_RWSurfaceReplica {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSurfaceReplica;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSurfaceReplica;
		 RWStepGeom_RWSurfaceReplica ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceReplica> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SurfaceReplica> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceReplica> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SurfaceReplica> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SurfaceReplica> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SurfaceReplica> & ent);
};


%extend RWStepGeom_RWSurfaceReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWSweptSurface;
class RWStepGeom_RWSweptSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWSweptSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWSweptSurface;
		 RWStepGeom_RWSweptSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SweptSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_SweptSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_SweptSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_SweptSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_SweptSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_SweptSurface> & ent);
};


%extend RWStepGeom_RWSweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWToroidalSurface;
class RWStepGeom_RWToroidalSurface {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_ToroidalSurface> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_ToroidalSurface> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWToroidalSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWToroidalSurface;
		 RWStepGeom_RWToroidalSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ToroidalSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_ToroidalSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_ToroidalSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_ToroidalSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_ToroidalSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_ToroidalSurface> & ent);
};


%extend RWStepGeom_RWToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWTrimmedCurve;
class RWStepGeom_RWTrimmedCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWTrimmedCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWTrimmedCurve;
		 RWStepGeom_RWTrimmedCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_TrimmedCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_TrimmedCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_TrimmedCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_TrimmedCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_TrimmedCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_TrimmedCurve> & ent);
};


%extend RWStepGeom_RWTrimmedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWUniformCurve;
class RWStepGeom_RWUniformCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWUniformCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWUniformCurve;
		 RWStepGeom_RWUniformCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_UniformCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_UniformCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_UniformCurve> & ent);
};


%extend RWStepGeom_RWUniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWUniformCurveAndRationalBSplineCurve;
class RWStepGeom_RWUniformCurveAndRationalBSplineCurve {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWUniformCurveAndRationalBSplineCurve;
		 RWStepGeom_RWUniformCurveAndRationalBSplineCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_UniformCurveAndRationalBSplineCurve> & ent);
};


%extend RWStepGeom_RWUniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWUniformSurface;
class RWStepGeom_RWUniformSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWUniformSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWUniformSurface;
		 RWStepGeom_RWUniformSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_UniformSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_UniformSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_UniformSurface> & ent);
};


%extend RWStepGeom_RWUniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface;
class RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface {
	public:
		%feature("compactdefaultargs") RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface;
		 RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_UniformSurfaceAndRationalBSplineSurface> & ent);
};


%extend RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepGeom_RWVector;
class RWStepGeom_RWVector {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Vector> &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:rtype: None
") Check;
		void Check (const opencascade::handle<StepGeom_Vector> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);
		%feature("compactdefaultargs") RWStepGeom_RWVector;
		%feature("autodoc", "	:rtype: None
") RWStepGeom_RWVector;
		 RWStepGeom_RWVector ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Vector> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepGeom_Vector> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepGeom_Vector> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepGeom_Vector> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepGeom_Vector> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepGeom_Vector> & ent);
};


%extend RWStepGeom_RWVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
