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
#include<TopoDS_module.hxx>
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

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedCurve3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads alignedcurve3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_AlignedCurve3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_AlignedCurve3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes alignedcurve3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_AlignedCurve3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedSurface3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads alignedsurface3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_AlignedSurface3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_AlignedSurface3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes alignedsurface3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_AlignedSurface3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
		 RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads arbitraryvolume3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes arbitraryvolume3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
		 RWStepFEA_RWConstantSurface3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads constantsurface3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ConstantSurface3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ConstantSurface3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes constantsurface3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ConstantSurface3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurve3dElementProperty;
		 RWStepFEA_RWCurve3dElementProperty();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curve3delementproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Curve3dElementProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Curve3dElementProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Curve3dElementProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Curve3dElementProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curve3delementproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Curve3dElementProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Curve3dElementProperty> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurve3dElementRepresentation;
		 RWStepFEA_RWCurve3dElementRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curve3delementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Curve3dElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Curve3dElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curve3delementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Curve3dElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementEndOffset;
		 RWStepFEA_RWCurveElementEndOffset();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementendoffset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementEndOffset

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementEndOffset> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementEndOffset
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementEndOffset> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementendoffset.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementEndOffset

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementEndOffset> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementEndRelease;
		 RWStepFEA_RWCurveElementEndRelease();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementendrelease.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementEndRelease

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementEndRelease> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementEndRelease
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementEndRelease> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementendrelease.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementEndRelease

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementEndRelease> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementInterval;
		 RWStepFEA_RWCurveElementInterval();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementinterval.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementInterval

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementInterval> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementInterval
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementInterval> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementinterval.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementInterval

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementInterval> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementIntervalConstant;
		 RWStepFEA_RWCurveElementIntervalConstant();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementintervalconstant.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementIntervalConstant

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementIntervalConstant
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementintervalconstant.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementIntervalConstant

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementIntervalLinearlyVarying;
		 RWStepFEA_RWCurveElementIntervalLinearlyVarying();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementintervallinearlyvarying.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementIntervalLinearlyVarying

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementIntervalLinearlyVarying
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementintervallinearlyvarying.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementIntervalLinearlyVarying

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementLocation;
		 RWStepFEA_RWCurveElementLocation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementlocation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementLocation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementLocation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementLocation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementLocation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementlocation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementLocation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementLocation> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWDummyNode;
		 RWStepFEA_RWDummyNode();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dummynode.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_DummyNode

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_DummyNode> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_DummyNode
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_DummyNode> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dummynode.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_DummyNode

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_DummyNode> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWElementGeometricRelationship;
		 RWStepFEA_RWElementGeometricRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementgeometricrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ElementGeometricRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ElementGeometricRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementgeometricrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ElementGeometricRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWElementGroup;
		 RWStepFEA_RWElementGroup();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementgroup.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ElementGroup

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ElementGroup> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ElementGroup
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ElementGroup> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementgroup.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ElementGroup

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ElementGroup> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWElementRepresentation;
		 RWStepFEA_RWElementRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ElementRepresentation> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaAreaDensity;
		 RWStepFEA_RWFeaAreaDensity();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feaareadensity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaAreaDensity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaAreaDensity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaAreaDensity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaAreaDensity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feaareadensity.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaAreaDensity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaAreaDensity> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaAxis2Placement3d;
		 RWStepFEA_RWFeaAxis2Placement3d();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feaaxis2placement3d.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaAxis2Placement3d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaAxis2Placement3d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feaaxis2placement3d.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaAxis2Placement3d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaCurveSectionGeometricRelationship;
		 RWStepFEA_RWFeaCurveSectionGeometricRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feacurvesectiongeometricrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaCurveSectionGeometricRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaCurveSectionGeometricRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feacurvesectiongeometricrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaCurveSectionGeometricRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaGroup;
		 RWStepFEA_RWFeaGroup();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feagroup.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaGroup

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaGroup> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaGroup
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaGroup> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feagroup.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaGroup

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaGroup> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaLinearElasticity;
		 RWStepFEA_RWFeaLinearElasticity();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads fealinearelasticity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaLinearElasticity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaLinearElasticity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaLinearElasticity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaLinearElasticity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes fealinearelasticity.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaLinearElasticity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaLinearElasticity> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMassDensity;
		 RWStepFEA_RWFeaMassDensity();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamassdensity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMassDensity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMassDensity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMassDensity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMassDensity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamassdensity.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMassDensity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMassDensity> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMaterialPropertyRepresentation;
		 RWStepFEA_RWFeaMaterialPropertyRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamaterialpropertyrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMaterialPropertyRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMaterialPropertyRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamaterialpropertyrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMaterialPropertyRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
		 RWStepFEA_RWFeaMaterialPropertyRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamaterialpropertyrepresentationitem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMaterialPropertyRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMaterialPropertyRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamaterialpropertyrepresentationitem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMaterialPropertyRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaModel;
		 RWStepFEA_RWFeaModel();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamodel.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaModel> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaModel
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaModel> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamodel.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaModel> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaModel3d;
		 RWStepFEA_RWFeaModel3d();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamodel3d.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaModel3d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaModel3d> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaModel3d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaModel3d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamodel3d.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaModel3d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaModel3d> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaModelDefinition;
		 RWStepFEA_RWFeaModelDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamodeldefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaModelDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaModelDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaModelDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaModelDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamodeldefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaModelDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaModelDefinition> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMoistureAbsorption;
		 RWStepFEA_RWFeaMoistureAbsorption();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamoistureabsorption.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMoistureAbsorption

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMoistureAbsorption
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamoistureabsorption.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMoistureAbsorption

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaParametricPoint;
		 RWStepFEA_RWFeaParametricPoint();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feaparametricpoint.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaParametricPoint

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaParametricPoint> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaParametricPoint
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaParametricPoint> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feaparametricpoint.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaParametricPoint

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaParametricPoint> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaRepresentationItem;
		 RWStepFEA_RWFeaRepresentationItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads fearepresentationitem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaRepresentationItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes fearepresentationitem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaRepresentationItem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feasecantcoefficientoflinearthermalexpansion.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feasecantcoefficientoflinearthermalexpansion.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellBendingStiffness;
		 RWStepFEA_RWFeaShellBendingStiffness();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellbendingstiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellBendingStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellBendingStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellbendingstiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellBendingStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
		 RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellmembranebendingcouplingstiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellMembraneBendingCouplingStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellMembraneBendingCouplingStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellmembranebendingcouplingstiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellMembraneBendingCouplingStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellMembraneStiffness;
		 RWStepFEA_RWFeaShellMembraneStiffness();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellmembranestiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellMembraneStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellMembraneStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellmembranestiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellMembraneStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellShearStiffness;
		 RWStepFEA_RWFeaShellShearStiffness();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellshearstiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellShearStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellShearStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellshearstiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellShearStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
		 RWStepFEA_RWFeaSurfaceSectionGeometricRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feasurfacesectiongeometricrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaSurfaceSectionGeometricRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaSurfaceSectionGeometricRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feasurfacesectiongeometricrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaSurfaceSectionGeometricRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads featangentialcoefficientoflinearthermalexpansion.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes featangentialcoefficientoflinearthermalexpansion.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFreedomAndCoefficient;
		 RWStepFEA_RWFreedomAndCoefficient();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads freedomandcoefficient.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FreedomAndCoefficient

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FreedomAndCoefficient
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes freedomandcoefficient.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FreedomAndCoefficient

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFreedomsList;
		 RWStepFEA_RWFreedomsList();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads freedomslist.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FreedomsList

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FreedomsList> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FreedomsList
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FreedomsList> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes freedomslist.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FreedomsList

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FreedomsList> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWGeometricNode;
		 RWStepFEA_RWGeometricNode();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometricnode.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_GeometricNode

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_GeometricNode> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_GeometricNode
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_GeometricNode> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometricnode.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_GeometricNode

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_GeometricNode> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNode;
		 RWStepFEA_RWNode();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads node.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Node

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Node> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Node
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Node> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes node.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Node

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Node> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeDefinition;
		 RWStepFEA_RWNodeDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodedefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodedefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeDefinition> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeGroup;
		 RWStepFEA_RWNodeGroup();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodegroup.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeGroup

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeGroup> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeGroup
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeGroup> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodegroup.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeGroup

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeGroup> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeRepresentation;
		 RWStepFEA_RWNodeRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads noderepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes noderepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeRepresentation> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeSet;
		 RWStepFEA_RWNodeSet();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodeset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeSet> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodeset.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeSet> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeWithSolutionCoordinateSystem;
		 RWStepFEA_RWNodeWithSolutionCoordinateSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodewithsolutioncoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeWithSolutionCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeWithSolutionCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodewithsolutioncoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeWithSolutionCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeWithVector;
		 RWStepFEA_RWNodeWithVector();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodewithvector.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeWithVector

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeWithVector> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeWithVector
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeWithVector> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodewithvector.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeWithVector

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeWithVector> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
		 RWStepFEA_RWParametricCurve3dElementCoordinateDirection();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads parametriccurve3delementcoordinatedirection.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ParametricCurve3dElementCoordinateDirection

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ParametricCurve3dElementCoordinateDirection
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes parametriccurve3delementcoordinatedirection.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ParametricCurve3dElementCoordinateDirection

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
		 RWStepFEA_RWParametricCurve3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads parametriccurve3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ParametricCurve3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ParametricCurve3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes parametriccurve3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ParametricCurve3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
		 RWStepFEA_RWParametricSurface3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads parametricsurface3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ParametricSurface3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ParametricSurface3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes parametricsurface3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ParametricSurface3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWSurface3dElementRepresentation;
		 RWStepFEA_RWSurface3dElementRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surface3delementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Surface3dElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Surface3dElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surface3delementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Surface3dElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWVolume3dElementRepresentation;
		 RWStepFEA_RWVolume3dElementRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads volume3delementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Volume3dElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Volume3dElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes volume3delementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Volume3dElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent);

};


%extend RWStepFEA_RWVolume3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
