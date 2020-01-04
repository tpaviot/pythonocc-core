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
%define RWSTEPFEADOCSTRING
"RWStepFEA module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepfea.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPFEADOCSTRING) RWStepFEA


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
#include<RWStepFEA_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepFEA_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<StepElement_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import StepFEA.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************************************************
* class RWStepFEA_RWAlignedCurve3dElementCoordinateSystem *
**********************************************************/
class RWStepFEA_RWAlignedCurve3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWAlignedCurve3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedCurve3dElementCoordinateSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads AlignedCurve3dElementCoordinateSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_AlignedCurve3dElementCoordinateSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_AlignedCurve3dElementCoordinateSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes AlignedCurve3dElementCoordinateSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_AlignedCurve3dElementCoordinateSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWAlignedCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepFEA_RWAlignedSurface3dElementCoordinateSystem *
************************************************************/
class RWStepFEA_RWAlignedSurface3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWAlignedSurface3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedSurface3dElementCoordinateSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads AlignedSurface3dElementCoordinateSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_AlignedSurface3dElementCoordinateSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_AlignedSurface3dElementCoordinateSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes AlignedSurface3dElementCoordinateSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_AlignedSurface3dElementCoordinateSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWAlignedSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem *
*************************************************************/
class RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
		 RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ArbitraryVolume3dElementCoordinateSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ArbitraryVolume3dElementCoordinateSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWConstantSurface3dElementCoordinateSystem *
*************************************************************/
class RWStepFEA_RWConstantSurface3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWConstantSurface3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
		 RWStepFEA_RWConstantSurface3dElementCoordinateSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ConstantSurface3dElementCoordinateSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ConstantSurface3dElementCoordinateSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ConstantSurface3dElementCoordinateSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ConstantSurface3dElementCoordinateSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ConstantSurface3dElementCoordinateSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWConstantSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepFEA_RWCurve3dElementProperty *
*******************************************/
class RWStepFEA_RWCurve3dElementProperty {
	public:
		/****************** RWStepFEA_RWCurve3dElementProperty ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurve3dElementProperty;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurve3dElementProperty;
		 RWStepFEA_RWCurve3dElementProperty ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Curve3dElementProperty
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_Curve3dElementProperty
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_Curve3dElementProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_Curve3dElementProperty
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_Curve3dElementProperty> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Curve3dElementProperty
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_Curve3dElementProperty
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_Curve3dElementProperty> & ent);

};


%extend RWStepFEA_RWCurve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepFEA_RWCurve3dElementRepresentation *
*************************************************/
class RWStepFEA_RWCurve3dElementRepresentation {
	public:
		/****************** RWStepFEA_RWCurve3dElementRepresentation ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurve3dElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurve3dElementRepresentation;
		 RWStepFEA_RWCurve3dElementRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Curve3dElementRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_Curve3dElementRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_Curve3dElementRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Curve3dElementRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_Curve3dElementRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent);

};


%extend RWStepFEA_RWCurve3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWCurveElementEndOffset *
******************************************/
class RWStepFEA_RWCurveElementEndOffset {
	public:
		/****************** RWStepFEA_RWCurveElementEndOffset ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementEndOffset;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurveElementEndOffset;
		 RWStepFEA_RWCurveElementEndOffset ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CurveElementEndOffset
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_CurveElementEndOffset
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_CurveElementEndOffset> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_CurveElementEndOffset
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_CurveElementEndOffset> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CurveElementEndOffset
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_CurveElementEndOffset
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_CurveElementEndOffset> & ent);

};


%extend RWStepFEA_RWCurveElementEndOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepFEA_RWCurveElementEndRelease *
*******************************************/
class RWStepFEA_RWCurveElementEndRelease {
	public:
		/****************** RWStepFEA_RWCurveElementEndRelease ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementEndRelease;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurveElementEndRelease;
		 RWStepFEA_RWCurveElementEndRelease ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CurveElementEndRelease
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_CurveElementEndRelease
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_CurveElementEndRelease> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_CurveElementEndRelease
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_CurveElementEndRelease> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CurveElementEndRelease
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_CurveElementEndRelease
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_CurveElementEndRelease> & ent);

};


%extend RWStepFEA_RWCurveElementEndRelease {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepFEA_RWCurveElementInterval *
*****************************************/
class RWStepFEA_RWCurveElementInterval {
	public:
		/****************** RWStepFEA_RWCurveElementInterval ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementInterval;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurveElementInterval;
		 RWStepFEA_RWCurveElementInterval ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CurveElementInterval
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_CurveElementInterval
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_CurveElementInterval> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_CurveElementInterval
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_CurveElementInterval> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CurveElementInterval
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_CurveElementInterval
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_CurveElementInterval> & ent);

};


%extend RWStepFEA_RWCurveElementInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepFEA_RWCurveElementIntervalConstant *
*************************************************/
class RWStepFEA_RWCurveElementIntervalConstant {
	public:
		/****************** RWStepFEA_RWCurveElementIntervalConstant ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementIntervalConstant;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurveElementIntervalConstant;
		 RWStepFEA_RWCurveElementIntervalConstant ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CurveElementIntervalConstant
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_CurveElementIntervalConstant
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_CurveElementIntervalConstant
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CurveElementIntervalConstant
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_CurveElementIntervalConstant
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent);

};


%extend RWStepFEA_RWCurveElementIntervalConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepFEA_RWCurveElementIntervalLinearlyVarying *
********************************************************/
class RWStepFEA_RWCurveElementIntervalLinearlyVarying {
	public:
		/****************** RWStepFEA_RWCurveElementIntervalLinearlyVarying ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementIntervalLinearlyVarying;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurveElementIntervalLinearlyVarying;
		 RWStepFEA_RWCurveElementIntervalLinearlyVarying ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CurveElementIntervalLinearlyVarying
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_CurveElementIntervalLinearlyVarying
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_CurveElementIntervalLinearlyVarying
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CurveElementIntervalLinearlyVarying
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_CurveElementIntervalLinearlyVarying
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent);

};


%extend RWStepFEA_RWCurveElementIntervalLinearlyVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepFEA_RWCurveElementLocation *
*****************************************/
class RWStepFEA_RWCurveElementLocation {
	public:
		/****************** RWStepFEA_RWCurveElementLocation ******************/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementLocation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWCurveElementLocation;
		 RWStepFEA_RWCurveElementLocation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CurveElementLocation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_CurveElementLocation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_CurveElementLocation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_CurveElementLocation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_CurveElementLocation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CurveElementLocation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_CurveElementLocation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_CurveElementLocation> & ent);

};


%extend RWStepFEA_RWCurveElementLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepFEA_RWDummyNode *
******************************/
class RWStepFEA_RWDummyNode {
	public:
		/****************** RWStepFEA_RWDummyNode ******************/
		%feature("compactdefaultargs") RWStepFEA_RWDummyNode;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWDummyNode;
		 RWStepFEA_RWDummyNode ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DummyNode
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_DummyNode
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_DummyNode> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_DummyNode
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_DummyNode> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DummyNode
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_DummyNode
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_DummyNode> & ent);

};


%extend RWStepFEA_RWDummyNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepFEA_RWElementGeometricRelationship *
*************************************************/
class RWStepFEA_RWElementGeometricRelationship {
	public:
		/****************** RWStepFEA_RWElementGeometricRelationship ******************/
		%feature("compactdefaultargs") RWStepFEA_RWElementGeometricRelationship;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWElementGeometricRelationship;
		 RWStepFEA_RWElementGeometricRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ElementGeometricRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ElementGeometricRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ElementGeometricRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ElementGeometricRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ElementGeometricRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent);

};


%extend RWStepFEA_RWElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepFEA_RWElementGroup *
*********************************/
class RWStepFEA_RWElementGroup {
	public:
		/****************** RWStepFEA_RWElementGroup ******************/
		%feature("compactdefaultargs") RWStepFEA_RWElementGroup;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWElementGroup;
		 RWStepFEA_RWElementGroup ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ElementGroup
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ElementGroup
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ElementGroup> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ElementGroup
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ElementGroup> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ElementGroup
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ElementGroup
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ElementGroup> & ent);

};


%extend RWStepFEA_RWElementGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWElementRepresentation *
******************************************/
class RWStepFEA_RWElementRepresentation {
	public:
		/****************** RWStepFEA_RWElementRepresentation ******************/
		%feature("compactdefaultargs") RWStepFEA_RWElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWElementRepresentation;
		 RWStepFEA_RWElementRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ElementRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ElementRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ElementRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ElementRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ElementRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ElementRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ElementRepresentation> & ent);

};


%extend RWStepFEA_RWElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWFeaAreaDensity *
***********************************/
class RWStepFEA_RWFeaAreaDensity {
	public:
		/****************** RWStepFEA_RWFeaAreaDensity ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaAreaDensity;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaAreaDensity;
		 RWStepFEA_RWFeaAreaDensity ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaAreaDensity
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaAreaDensity
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaAreaDensity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaAreaDensity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaAreaDensity> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaAreaDensity
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaAreaDensity
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaAreaDensity> & ent);

};


%extend RWStepFEA_RWFeaAreaDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepFEA_RWFeaAxis2Placement3d *
****************************************/
class RWStepFEA_RWFeaAxis2Placement3d {
	public:
		/****************** RWStepFEA_RWFeaAxis2Placement3d ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaAxis2Placement3d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaAxis2Placement3d;
		 RWStepFEA_RWFeaAxis2Placement3d ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaAxis2Placement3d
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaAxis2Placement3d
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaAxis2Placement3d
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaAxis2Placement3d
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaAxis2Placement3d
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent);

};


%extend RWStepFEA_RWFeaAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class RWStepFEA_RWFeaCurveSectionGeometricRelationship *
*********************************************************/
class RWStepFEA_RWFeaCurveSectionGeometricRelationship {
	public:
		/****************** RWStepFEA_RWFeaCurveSectionGeometricRelationship ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaCurveSectionGeometricRelationship;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaCurveSectionGeometricRelationship;
		 RWStepFEA_RWFeaCurveSectionGeometricRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaCurveSectionGeometricRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaCurveSectionGeometricRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaCurveSectionGeometricRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaCurveSectionGeometricRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaCurveSectionGeometricRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent);

};


%extend RWStepFEA_RWFeaCurveSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepFEA_RWFeaGroup *
*****************************/
class RWStepFEA_RWFeaGroup {
	public:
		/****************** RWStepFEA_RWFeaGroup ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaGroup;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaGroup;
		 RWStepFEA_RWFeaGroup ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaGroup
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaGroup
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaGroup> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaGroup
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaGroup> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaGroup
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaGroup
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaGroup> & ent);

};


%extend RWStepFEA_RWFeaGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepFEA_RWFeaLinearElasticity *
****************************************/
class RWStepFEA_RWFeaLinearElasticity {
	public:
		/****************** RWStepFEA_RWFeaLinearElasticity ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaLinearElasticity;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaLinearElasticity;
		 RWStepFEA_RWFeaLinearElasticity ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaLinearElasticity
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaLinearElasticity
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaLinearElasticity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaLinearElasticity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaLinearElasticity> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaLinearElasticity
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaLinearElasticity
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaLinearElasticity> & ent);

};


%extend RWStepFEA_RWFeaLinearElasticity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWFeaMassDensity *
***********************************/
class RWStepFEA_RWFeaMassDensity {
	public:
		/****************** RWStepFEA_RWFeaMassDensity ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMassDensity;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaMassDensity;
		 RWStepFEA_RWFeaMassDensity ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaMassDensity
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaMassDensity
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaMassDensity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaMassDensity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaMassDensity> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaMassDensity
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaMassDensity
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaMassDensity> & ent);

};


%extend RWStepFEA_RWFeaMassDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepFEA_RWFeaMaterialPropertyRepresentation *
******************************************************/
class RWStepFEA_RWFeaMaterialPropertyRepresentation {
	public:
		/****************** RWStepFEA_RWFeaMaterialPropertyRepresentation ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMaterialPropertyRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaMaterialPropertyRepresentation;
		 RWStepFEA_RWFeaMaterialPropertyRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaMaterialPropertyRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaMaterialPropertyRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaMaterialPropertyRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaMaterialPropertyRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaMaterialPropertyRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent);

};


%extend RWStepFEA_RWFeaMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class RWStepFEA_RWFeaMaterialPropertyRepresentationItem *
**********************************************************/
class RWStepFEA_RWFeaMaterialPropertyRepresentationItem {
	public:
		/****************** RWStepFEA_RWFeaMaterialPropertyRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
		 RWStepFEA_RWFeaMaterialPropertyRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaMaterialPropertyRepresentationItem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaMaterialPropertyRepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaMaterialPropertyRepresentationItem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaMaterialPropertyRepresentationItem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaMaterialPropertyRepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent);

};


%extend RWStepFEA_RWFeaMaterialPropertyRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepFEA_RWFeaModel *
*****************************/
class RWStepFEA_RWFeaModel {
	public:
		/****************** RWStepFEA_RWFeaModel ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaModel;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaModel;
		 RWStepFEA_RWFeaModel ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaModel
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaModel
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaModel> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaModel
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaModel> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaModel
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaModel
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaModel> & ent);

};


%extend RWStepFEA_RWFeaModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepFEA_RWFeaModel3d *
*******************************/
class RWStepFEA_RWFeaModel3d {
	public:
		/****************** RWStepFEA_RWFeaModel3d ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaModel3d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaModel3d;
		 RWStepFEA_RWFeaModel3d ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaModel3d
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaModel3d
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaModel3d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaModel3d
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaModel3d> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaModel3d
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaModel3d
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaModel3d> & ent);

};


%extend RWStepFEA_RWFeaModel3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepFEA_RWFeaModelDefinition *
***************************************/
class RWStepFEA_RWFeaModelDefinition {
	public:
		/****************** RWStepFEA_RWFeaModelDefinition ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaModelDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaModelDefinition;
		 RWStepFEA_RWFeaModelDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaModelDefinition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaModelDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaModelDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaModelDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaModelDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaModelDefinition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaModelDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaModelDefinition> & ent);

};


%extend RWStepFEA_RWFeaModelDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWFeaMoistureAbsorption *
******************************************/
class RWStepFEA_RWFeaMoistureAbsorption {
	public:
		/****************** RWStepFEA_RWFeaMoistureAbsorption ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMoistureAbsorption;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaMoistureAbsorption;
		 RWStepFEA_RWFeaMoistureAbsorption ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaMoistureAbsorption
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaMoistureAbsorption
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaMoistureAbsorption
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaMoistureAbsorption
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaMoistureAbsorption
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent);

};


%extend RWStepFEA_RWFeaMoistureAbsorption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepFEA_RWFeaParametricPoint *
***************************************/
class RWStepFEA_RWFeaParametricPoint {
	public:
		/****************** RWStepFEA_RWFeaParametricPoint ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaParametricPoint;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaParametricPoint;
		 RWStepFEA_RWFeaParametricPoint ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaParametricPoint
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaParametricPoint
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaParametricPoint> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaParametricPoint
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaParametricPoint> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaParametricPoint
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaParametricPoint
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaParametricPoint> & ent);

};


%extend RWStepFEA_RWFeaParametricPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWFeaRepresentationItem *
******************************************/
class RWStepFEA_RWFeaRepresentationItem {
	public:
		/****************** RWStepFEA_RWFeaRepresentationItem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaRepresentationItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaRepresentationItem;
		 RWStepFEA_RWFeaRepresentationItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaRepresentationItem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaRepresentationItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaRepresentationItem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaRepresentationItem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaRepresentationItem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaRepresentationItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaRepresentationItem> & ent);

};


%extend RWStepFEA_RWFeaRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion *
*****************************************************************/
class RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion {
	public:
		/****************** RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaSecantCoefficientOfLinearThermalExpansion
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaSecantCoefficientOfLinearThermalExpansion
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent);

};


%extend RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepFEA_RWFeaShellBendingStiffness *
*********************************************/
class RWStepFEA_RWFeaShellBendingStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellBendingStiffness ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellBendingStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaShellBendingStiffness;
		 RWStepFEA_RWFeaShellBendingStiffness ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaShellBendingStiffness
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaShellBendingStiffness
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaShellBendingStiffness
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaShellBendingStiffness
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaShellBendingStiffness
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellBendingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness *
*************************************************************/
class RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
		 RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaShellMembraneBendingCouplingStiffness
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaShellMembraneBendingCouplingStiffness
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaShellMembraneBendingCouplingStiffness
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaShellMembraneBendingCouplingStiffness
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaShellMembraneBendingCouplingStiffness
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepFEA_RWFeaShellMembraneStiffness *
**********************************************/
class RWStepFEA_RWFeaShellMembraneStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellMembraneStiffness ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellMembraneStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaShellMembraneStiffness;
		 RWStepFEA_RWFeaShellMembraneStiffness ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaShellMembraneStiffness
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaShellMembraneStiffness
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaShellMembraneStiffness
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaShellMembraneStiffness
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaShellMembraneStiffness
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellMembraneStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepFEA_RWFeaShellShearStiffness *
*******************************************/
class RWStepFEA_RWFeaShellShearStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellShearStiffness ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellShearStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaShellShearStiffness;
		 RWStepFEA_RWFeaShellShearStiffness ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaShellShearStiffness
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaShellShearStiffness
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaShellShearStiffness
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaShellShearStiffness
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaShellShearStiffness
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellShearStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class RWStepFEA_RWFeaSurfaceSectionGeometricRelationship *
***********************************************************/
class RWStepFEA_RWFeaSurfaceSectionGeometricRelationship {
	public:
		/****************** RWStepFEA_RWFeaSurfaceSectionGeometricRelationship ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
		 RWStepFEA_RWFeaSurfaceSectionGeometricRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaSurfaceSectionGeometricRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaSurfaceSectionGeometricRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaSurfaceSectionGeometricRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaSurfaceSectionGeometricRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaSurfaceSectionGeometricRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent);

};


%extend RWStepFEA_RWFeaSurfaceSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************************
* class RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion *
*********************************************************************/
class RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion {
	public:
		/****************** RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FeaTangentialCoefficientOfLinearThermalExpansion
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FeaTangentialCoefficientOfLinearThermalExpansion
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent);

};


%extend RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWFreedomAndCoefficient *
******************************************/
class RWStepFEA_RWFreedomAndCoefficient {
	public:
		/****************** RWStepFEA_RWFreedomAndCoefficient ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFreedomAndCoefficient;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFreedomAndCoefficient;
		 RWStepFEA_RWFreedomAndCoefficient ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FreedomAndCoefficient
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FreedomAndCoefficient
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FreedomAndCoefficient
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FreedomAndCoefficient
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FreedomAndCoefficient
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent);

};


%extend RWStepFEA_RWFreedomAndCoefficient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepFEA_RWFreedomsList *
*********************************/
class RWStepFEA_RWFreedomsList {
	public:
		/****************** RWStepFEA_RWFreedomsList ******************/
		%feature("compactdefaultargs") RWStepFEA_RWFreedomsList;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWFreedomsList;
		 RWStepFEA_RWFreedomsList ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FreedomsList
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_FreedomsList
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_FreedomsList> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_FreedomsList
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_FreedomsList> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FreedomsList
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_FreedomsList
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_FreedomsList> & ent);

};


%extend RWStepFEA_RWFreedomsList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepFEA_RWGeometricNode *
**********************************/
class RWStepFEA_RWGeometricNode {
	public:
		/****************** RWStepFEA_RWGeometricNode ******************/
		%feature("compactdefaultargs") RWStepFEA_RWGeometricNode;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWGeometricNode;
		 RWStepFEA_RWGeometricNode ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricNode
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_GeometricNode
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_GeometricNode> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_GeometricNode
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_GeometricNode> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricNode
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_GeometricNode
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_GeometricNode> & ent);

};


%extend RWStepFEA_RWGeometricNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class RWStepFEA_RWNode *
*************************/
class RWStepFEA_RWNode {
	public:
		/****************** RWStepFEA_RWNode ******************/
		%feature("compactdefaultargs") RWStepFEA_RWNode;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWNode;
		 RWStepFEA_RWNode ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Node
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_Node
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_Node> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_Node
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_Node> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Node
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_Node
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_Node> & ent);

};


%extend RWStepFEA_RWNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWNodeDefinition *
***********************************/
class RWStepFEA_RWNodeDefinition {
	public:
		/****************** RWStepFEA_RWNodeDefinition ******************/
		%feature("compactdefaultargs") RWStepFEA_RWNodeDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWNodeDefinition;
		 RWStepFEA_RWNodeDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NodeDefinition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_NodeDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_NodeDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_NodeDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_NodeDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NodeDefinition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_NodeDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_NodeDefinition> & ent);

};


%extend RWStepFEA_RWNodeDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepFEA_RWNodeGroup *
******************************/
class RWStepFEA_RWNodeGroup {
	public:
		/****************** RWStepFEA_RWNodeGroup ******************/
		%feature("compactdefaultargs") RWStepFEA_RWNodeGroup;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWNodeGroup;
		 RWStepFEA_RWNodeGroup ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NodeGroup
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_NodeGroup
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_NodeGroup> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_NodeGroup
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_NodeGroup> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NodeGroup
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_NodeGroup
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_NodeGroup> & ent);

};


%extend RWStepFEA_RWNodeGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepFEA_RWNodeRepresentation *
***************************************/
class RWStepFEA_RWNodeRepresentation {
	public:
		/****************** RWStepFEA_RWNodeRepresentation ******************/
		%feature("compactdefaultargs") RWStepFEA_RWNodeRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWNodeRepresentation;
		 RWStepFEA_RWNodeRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NodeRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_NodeRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_NodeRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_NodeRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_NodeRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NodeRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_NodeRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_NodeRepresentation> & ent);

};


%extend RWStepFEA_RWNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepFEA_RWNodeSet *
****************************/
class RWStepFEA_RWNodeSet {
	public:
		/****************** RWStepFEA_RWNodeSet ******************/
		%feature("compactdefaultargs") RWStepFEA_RWNodeSet;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWNodeSet;
		 RWStepFEA_RWNodeSet ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NodeSet
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_NodeSet
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_NodeSet> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_NodeSet
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_NodeSet> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NodeSet
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_NodeSet
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_NodeSet> & ent);

};


%extend RWStepFEA_RWNodeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepFEA_RWNodeWithSolutionCoordinateSystem *
*****************************************************/
class RWStepFEA_RWNodeWithSolutionCoordinateSystem {
	public:
		/****************** RWStepFEA_RWNodeWithSolutionCoordinateSystem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWNodeWithSolutionCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWNodeWithSolutionCoordinateSystem;
		 RWStepFEA_RWNodeWithSolutionCoordinateSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NodeWithSolutionCoordinateSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_NodeWithSolutionCoordinateSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_NodeWithSolutionCoordinateSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NodeWithSolutionCoordinateSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_NodeWithSolutionCoordinateSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent);

};


%extend RWStepFEA_RWNodeWithSolutionCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWNodeWithVector *
***********************************/
class RWStepFEA_RWNodeWithVector {
	public:
		/****************** RWStepFEA_RWNodeWithVector ******************/
		%feature("compactdefaultargs") RWStepFEA_RWNodeWithVector;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWNodeWithVector;
		 RWStepFEA_RWNodeWithVector ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NodeWithVector
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_NodeWithVector
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_NodeWithVector> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_NodeWithVector
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_NodeWithVector> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NodeWithVector
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_NodeWithVector
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_NodeWithVector> & ent);

};


%extend RWStepFEA_RWNodeWithVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class RWStepFEA_RWParametricCurve3dElementCoordinateDirection *
****************************************************************/
class RWStepFEA_RWParametricCurve3dElementCoordinateDirection {
	public:
		/****************** RWStepFEA_RWParametricCurve3dElementCoordinateDirection ******************/
		%feature("compactdefaultargs") RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
		 RWStepFEA_RWParametricCurve3dElementCoordinateDirection ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ParametricCurve3dElementCoordinateDirection
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ParametricCurve3dElementCoordinateDirection
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ParametricCurve3dElementCoordinateDirection
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ParametricCurve3dElementCoordinateDirection
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ParametricCurve3dElementCoordinateDirection
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent);

};


%extend RWStepFEA_RWParametricCurve3dElementCoordinateDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWParametricCurve3dElementCoordinateSystem *
*************************************************************/
class RWStepFEA_RWParametricCurve3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWParametricCurve3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
		 RWStepFEA_RWParametricCurve3dElementCoordinateSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ParametricCurve3dElementCoordinateSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ParametricCurve3dElementCoordinateSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ParametricCurve3dElementCoordinateSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ParametricCurve3dElementCoordinateSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ParametricCurve3dElementCoordinateSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWParametricCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************
* class RWStepFEA_RWParametricSurface3dElementCoordinateSystem *
***************************************************************/
class RWStepFEA_RWParametricSurface3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWParametricSurface3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
		 RWStepFEA_RWParametricSurface3dElementCoordinateSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ParametricSurface3dElementCoordinateSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_ParametricSurface3dElementCoordinateSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_ParametricSurface3dElementCoordinateSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ParametricSurface3dElementCoordinateSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_ParametricSurface3dElementCoordinateSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWParametricSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepFEA_RWSurface3dElementRepresentation *
***************************************************/
class RWStepFEA_RWSurface3dElementRepresentation {
	public:
		/****************** RWStepFEA_RWSurface3dElementRepresentation ******************/
		%feature("compactdefaultargs") RWStepFEA_RWSurface3dElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWSurface3dElementRepresentation;
		 RWStepFEA_RWSurface3dElementRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Surface3dElementRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_Surface3dElementRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_Surface3dElementRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Surface3dElementRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_Surface3dElementRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent);

};


%extend RWStepFEA_RWSurface3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepFEA_RWVolume3dElementRepresentation *
**************************************************/
class RWStepFEA_RWVolume3dElementRepresentation {
	public:
		/****************** RWStepFEA_RWVolume3dElementRepresentation ******************/
		%feature("compactdefaultargs") RWStepFEA_RWVolume3dElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepFEA_RWVolume3dElementRepresentation;
		 RWStepFEA_RWVolume3dElementRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Volume3dElementRepresentation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepFEA_Volume3dElementRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepFEA_Volume3dElementRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Volume3dElementRepresentation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepFEA_Volume3dElementRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent);

};


%extend RWStepFEA_RWVolume3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
