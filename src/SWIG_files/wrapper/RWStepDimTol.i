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
%define RWSTEPDIMTOLDOCSTRING
"RWStepDimTol module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepdimtol.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPDIMTOLDOCSTRING) RWStepDimTol


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
#include<RWStepDimTol_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepDimTol_module.hxx>
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
%import StepDimTol.i

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

/*******************************************
* class RWStepDimTol_RWAngularityTolerance *
*******************************************/
class RWStepDimTol_RWAngularityTolerance {
	public:
		/****************** RWStepDimTol_RWAngularityTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWAngularityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWAngularityTolerance;
		 RWStepDimTol_RWAngularityTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads angularitytolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_AngularityTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_AngularityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_AngularityTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_AngularityTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes angularitytolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_AngularityTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_AngularityTolerance> & ent);

};


%extend RWStepDimTol_RWAngularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepDimTol_RWCircularRunoutTolerance *
***********************************************/
class RWStepDimTol_RWCircularRunoutTolerance {
	public:
		/****************** RWStepDimTol_RWCircularRunoutTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWCircularRunoutTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCircularRunoutTolerance;
		 RWStepDimTol_RWCircularRunoutTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads circularrunouttolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_CircularRunoutTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_CircularRunoutTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes circularrunouttolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_CircularRunoutTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent);

};


%extend RWStepDimTol_RWCircularRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepDimTol_RWCoaxialityTolerance *
*******************************************/
class RWStepDimTol_RWCoaxialityTolerance {
	public:
		/****************** RWStepDimTol_RWCoaxialityTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWCoaxialityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCoaxialityTolerance;
		 RWStepDimTol_RWCoaxialityTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads coaxialitytolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_CoaxialityTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_CoaxialityTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes coaxialitytolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_CoaxialityTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent);

};


%extend RWStepDimTol_RWCoaxialityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepDimTol_RWCommonDatum *
***********************************/
class RWStepDimTol_RWCommonDatum {
	public:
		/****************** RWStepDimTol_RWCommonDatum ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWCommonDatum;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCommonDatum;
		 RWStepDimTol_RWCommonDatum();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads commondatum.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_CommonDatum

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_CommonDatum> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_CommonDatum
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_CommonDatum> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes commondatum.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_CommonDatum

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_CommonDatum> & ent);

};


%extend RWStepDimTol_RWCommonDatum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepDimTol_RWConcentricityTolerance *
**********************************************/
class RWStepDimTol_RWConcentricityTolerance {
	public:
		/****************** RWStepDimTol_RWConcentricityTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWConcentricityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWConcentricityTolerance;
		 RWStepDimTol_RWConcentricityTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads concentricitytolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_ConcentricityTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_ConcentricityTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes concentricitytolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_ConcentricityTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent);

};


%extend RWStepDimTol_RWConcentricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepDimTol_RWCylindricityTolerance *
*********************************************/
class RWStepDimTol_RWCylindricityTolerance {
	public:
		/****************** RWStepDimTol_RWCylindricityTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWCylindricityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCylindricityTolerance;
		 RWStepDimTol_RWCylindricityTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads cylindricitytolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_CylindricityTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_CylindricityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_CylindricityTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_CylindricityTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes cylindricitytolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_CylindricityTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_CylindricityTolerance> & ent);

};


%extend RWStepDimTol_RWCylindricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepDimTol_RWDatum *
*****************************/
class RWStepDimTol_RWDatum {
	public:
		/****************** RWStepDimTol_RWDatum ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatum;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatum;
		 RWStepDimTol_RWDatum();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datum.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_Datum

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_Datum> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_Datum
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_Datum> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datum.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_Datum

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_Datum> & ent);

};


%extend RWStepDimTol_RWDatum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepDimTol_RWDatumFeature *
************************************/
class RWStepDimTol_RWDatumFeature {
	public:
		/****************** RWStepDimTol_RWDatumFeature ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumFeature;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumFeature;
		 RWStepDimTol_RWDatumFeature();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datumfeature.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_DatumFeature

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_DatumFeature> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_DatumFeature
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_DatumFeature> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datumfeature.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_DatumFeature

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_DatumFeature> & ent);

};


%extend RWStepDimTol_RWDatumFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepDimTol_RWDatumReference *
**************************************/
class RWStepDimTol_RWDatumReference {
	public:
		/****************** RWStepDimTol_RWDatumReference ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReference;
		 RWStepDimTol_RWDatumReference();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datumreference.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_DatumReference

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_DatumReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_DatumReference
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_DatumReference> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datumreference.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_DatumReference

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_DatumReference> & ent);

};


%extend RWStepDimTol_RWDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepDimTol_RWDatumReferenceCompartment *
*************************************************/
class RWStepDimTol_RWDatumReferenceCompartment {
	public:
		/****************** RWStepDimTol_RWDatumReferenceCompartment ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceCompartment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReferenceCompartment;
		 RWStepDimTol_RWDatumReferenceCompartment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datumreferenceelement.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_DatumReferenceCompartment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_DatumReferenceCompartment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datumreferenceelement.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_DatumReferenceCompartment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent);

};


%extend RWStepDimTol_RWDatumReferenceCompartment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepDimTol_RWDatumReferenceElement *
*********************************************/
class RWStepDimTol_RWDatumReferenceElement {
	public:
		/****************** RWStepDimTol_RWDatumReferenceElement ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceElement;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReferenceElement;
		 RWStepDimTol_RWDatumReferenceElement();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datumreferenceelement.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_DatumReferenceElement

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_DatumReferenceElement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_DatumReferenceElement
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_DatumReferenceElement> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datumreferenceelement.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_DatumReferenceElement

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_DatumReferenceElement> & ent);

};


%extend RWStepDimTol_RWDatumReferenceElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepDimTol_RWDatumReferenceModifierWithValue *
*******************************************************/
class RWStepDimTol_RWDatumReferenceModifierWithValue {
	public:
		/****************** RWStepDimTol_RWDatumReferenceModifierWithValue ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceModifierWithValue;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReferenceModifierWithValue;
		 RWStepDimTol_RWDatumReferenceModifierWithValue();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datumreferencemodifierwithvalue.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_DatumReferenceModifierWithValue

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datumreferencemodifierwithvalue.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_DatumReferenceModifierWithValue

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> & ent);

};


%extend RWStepDimTol_RWDatumReferenceModifierWithValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepDimTol_RWDatumSystem *
***********************************/
class RWStepDimTol_RWDatumSystem {
	public:
		/****************** RWStepDimTol_RWDatumSystem ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumSystem;
		 RWStepDimTol_RWDatumSystem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datumsystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_DatumSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_DatumSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_DatumSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_DatumSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datumsystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_DatumSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_DatumSystem> & ent);

};


%extend RWStepDimTol_RWDatumSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepDimTol_RWDatumTarget *
***********************************/
class RWStepDimTol_RWDatumTarget {
	public:
		/****************** RWStepDimTol_RWDatumTarget ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumTarget;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumTarget;
		 RWStepDimTol_RWDatumTarget();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads datumtarget.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_DatumTarget

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_DatumTarget> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_DatumTarget
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_DatumTarget> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes datumtarget.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_DatumTarget

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_DatumTarget> & ent);

};


%extend RWStepDimTol_RWDatumTarget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepDimTol_RWFlatnessTolerance *
*****************************************/
class RWStepDimTol_RWFlatnessTolerance {
	public:
		/****************** RWStepDimTol_RWFlatnessTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWFlatnessTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWFlatnessTolerance;
		 RWStepDimTol_RWFlatnessTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads flatnesstolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_FlatnessTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_FlatnessTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_FlatnessTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_FlatnessTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes flatnesstolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_FlatnessTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_FlatnessTolerance> & ent);

};


%extend RWStepDimTol_RWFlatnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepDimTol_RWGeneralDatumReference *
*********************************************/
class RWStepDimTol_RWGeneralDatumReference {
	public:
		/****************** RWStepDimTol_RWGeneralDatumReference ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeneralDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeneralDatumReference;
		 RWStepDimTol_RWGeneralDatumReference();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads generaldatumreference.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeneralDatumReference

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeneralDatumReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeneralDatumReference
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeneralDatumReference> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes generaldatumreference.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeneralDatumReference

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeneralDatumReference> & ent);

};


%extend RWStepDimTol_RWGeneralDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepDimTol_RWGeoTolAndGeoTolWthDatRef *
************************************************/
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRef {
	public:
		/****************** RWStepDimTol_RWGeoTolAndGeoTolWthDatRef ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRef();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeoTolAndGeoTolWthDatRef

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepDimTol_GeoTolAndGeoTolWthDatRef
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeoTolAndGeoTolWthDatRef

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent);

};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol *
******************************************************************/
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol {
	public:
		/****************** RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent);

};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************
* class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod *
***************************************************************/
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod {
	public:
		/****************** RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent);

};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************************
* class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol *
*********************************************************************/
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
	public:
		/****************** RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent);

};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol *
****************************************************************/
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol {
	public:
		/****************** RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent);

};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol *
************************************************/
class RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol {
	public:
		/****************** RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeoTolAndGeoTolWthMaxTol

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepDimTol_GeoTolAndGeoTolWthMaxTol
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeoTolAndGeoTolWthMaxTol

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent);

};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepDimTol_RWGeoTolAndGeoTolWthMod *
*********************************************/
class RWStepDimTol_RWGeoTolAndGeoTolWthMod {
	public:
		/****************** RWStepDimTol_RWGeoTolAndGeoTolWthMod ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthMod;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMod();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeoTolAndGeoTolWthMod

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepDimTol_GeoTolAndGeoTolWthMod
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeoTolAndGeoTolWthMod

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent);

};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthMod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepDimTol_RWGeometricTolerance *
******************************************/
class RWStepDimTol_RWGeometricTolerance {
	public:
		/****************** RWStepDimTol_RWGeometricTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricTolerance;
		 RWStepDimTol_RWGeometricTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometrictolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeometricTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeometricTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeometricTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeometricTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometrictolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeometricTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeometricTolerance> & ent);

};


%extend RWStepDimTol_RWGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepDimTol_RWGeometricToleranceRelationship *
******************************************************/
class RWStepDimTol_RWGeometricToleranceRelationship {
	public:
		/****************** RWStepDimTol_RWGeometricToleranceRelationship ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceRelationship;
		 RWStepDimTol_RWGeometricToleranceRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometrictolerancerelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeometricToleranceRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeometricToleranceRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometrictolerancerelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeometricToleranceRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent);

};


%extend RWStepDimTol_RWGeometricToleranceRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepDimTol_RWGeometricToleranceWithDatumReference *
************************************************************/
class RWStepDimTol_RWGeometricToleranceWithDatumReference {
	public:
		/****************** RWStepDimTol_RWGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithDatumReference;
		 RWStepDimTol_RWGeometricToleranceWithDatumReference();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometrictolerancewithdatumreference.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeometricToleranceWithDatumReference

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeometricToleranceWithDatumReference
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometrictolerancewithdatumreference.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeometricToleranceWithDatumReference

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent);

};


%extend RWStepDimTol_RWGeometricToleranceWithDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit *
*************************************************************/
class RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit {
	public:
		/****************** RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometrictolerancewithdefinedareaunit.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeometricToleranceWithDefinedAreaUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeometricToleranceWithDefinedAreaUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometrictolerancewithdefinedareaunit.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeometricToleranceWithDefinedAreaUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent);

};


%extend RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class RWStepDimTol_RWGeometricToleranceWithDefinedUnit *
*********************************************************/
class RWStepDimTol_RWGeometricToleranceWithDefinedUnit {
	public:
		/****************** RWStepDimTol_RWGeometricToleranceWithDefinedUnit ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometrictolerancewithdefinedunit.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeometricToleranceWithDefinedUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeometricToleranceWithDefinedUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometrictolerancewithdefinedunit.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeometricToleranceWithDefinedUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent);

};


%extend RWStepDimTol_RWGeometricToleranceWithDefinedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepDimTol_RWGeometricToleranceWithMaximumTolerance *
**************************************************************/
class RWStepDimTol_RWGeometricToleranceWithMaximumTolerance {
	public:
		/****************** RWStepDimTol_RWGeometricToleranceWithMaximumTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
		 RWStepDimTol_RWGeometricToleranceWithMaximumTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometrictolerancewithmaximumtolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeometricToleranceWithMaximumTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeometricToleranceWithMaximumTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometrictolerancewithmaximumtolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeometricToleranceWithMaximumTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent);

};


%extend RWStepDimTol_RWGeometricToleranceWithMaximumTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepDimTol_RWGeometricToleranceWithModifiers *
*******************************************************/
class RWStepDimTol_RWGeometricToleranceWithModifiers {
	public:
		/****************** RWStepDimTol_RWGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithModifiers;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithModifiers;
		 RWStepDimTol_RWGeometricToleranceWithModifiers();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometrictolerancewithmodifiers.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_GeometricToleranceWithModifiers

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_GeometricToleranceWithModifiers
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometrictolerancewithmodifiers.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_GeometricToleranceWithModifiers

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent);

};


%extend RWStepDimTol_RWGeometricToleranceWithModifiers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepDimTol_RWLineProfileTolerance *
********************************************/
class RWStepDimTol_RWLineProfileTolerance {
	public:
		/****************** RWStepDimTol_RWLineProfileTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWLineProfileTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWLineProfileTolerance;
		 RWStepDimTol_RWLineProfileTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads lineprofiletolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_LineProfileTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_LineProfileTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_LineProfileTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_LineProfileTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes lineprofiletolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_LineProfileTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_LineProfileTolerance> & ent);

};


%extend RWStepDimTol_RWLineProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepDimTol_RWModifiedGeometricTolerance *
**************************************************/
class RWStepDimTol_RWModifiedGeometricTolerance {
	public:
		/****************** RWStepDimTol_RWModifiedGeometricTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWModifiedGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWModifiedGeometricTolerance;
		 RWStepDimTol_RWModifiedGeometricTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads modifiedgeometrictolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_ModifiedGeometricTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_ModifiedGeometricTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes modifiedgeometrictolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_ModifiedGeometricTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent);

};


%extend RWStepDimTol_RWModifiedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepDimTol_RWNonUniformZoneDefinition *
************************************************/
class RWStepDimTol_RWNonUniformZoneDefinition {
	public:
		/****************** RWStepDimTol_RWNonUniformZoneDefinition ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWNonUniformZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWNonUniformZoneDefinition;
		 RWStepDimTol_RWNonUniformZoneDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nonuniformzonedefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_NonUniformZoneDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_NonUniformZoneDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nonuniformzonedefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_NonUniformZoneDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent);

};


%extend RWStepDimTol_RWNonUniformZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepDimTol_RWParallelismTolerance *
********************************************/
class RWStepDimTol_RWParallelismTolerance {
	public:
		/****************** RWStepDimTol_RWParallelismTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWParallelismTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWParallelismTolerance;
		 RWStepDimTol_RWParallelismTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads parallelismtolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_ParallelismTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_ParallelismTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_ParallelismTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_ParallelismTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes parallelismtolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_ParallelismTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_ParallelismTolerance> & ent);

};


%extend RWStepDimTol_RWParallelismTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepDimTol_RWPerpendicularityTolerance *
*************************************************/
class RWStepDimTol_RWPerpendicularityTolerance {
	public:
		/****************** RWStepDimTol_RWPerpendicularityTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWPerpendicularityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWPerpendicularityTolerance;
		 RWStepDimTol_RWPerpendicularityTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads perpendicularitytolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_PerpendicularityTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_PerpendicularityTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes perpendicularitytolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_PerpendicularityTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent);

};


%extend RWStepDimTol_RWPerpendicularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepDimTol_RWPlacedDatumTargetFeature *
************************************************/
class RWStepDimTol_RWPlacedDatumTargetFeature {
	public:
		/****************** RWStepDimTol_RWPlacedDatumTargetFeature ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWPlacedDatumTargetFeature;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWPlacedDatumTargetFeature;
		 RWStepDimTol_RWPlacedDatumTargetFeature();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads placeddatumtargetfeature.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_PlacedDatumTargetFeature

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_PlacedDatumTargetFeature
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes placeddatumtargetfeature.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_PlacedDatumTargetFeature

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent);

};


%extend RWStepDimTol_RWPlacedDatumTargetFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepDimTol_RWPositionTolerance *
*****************************************/
class RWStepDimTol_RWPositionTolerance {
	public:
		/****************** RWStepDimTol_RWPositionTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWPositionTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWPositionTolerance;
		 RWStepDimTol_RWPositionTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads positiontolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_PositionTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_PositionTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_PositionTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_PositionTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes positiontolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_PositionTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_PositionTolerance> & ent);

};


%extend RWStepDimTol_RWPositionTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepDimTol_RWProjectedZoneDefinition *
***********************************************/
class RWStepDimTol_RWProjectedZoneDefinition {
	public:
		/****************** RWStepDimTol_RWProjectedZoneDefinition ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWProjectedZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWProjectedZoneDefinition;
		 RWStepDimTol_RWProjectedZoneDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads projectedzonedefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_ProjectedZoneDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_ProjectedZoneDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes projectedzonedefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_ProjectedZoneDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent);

};


%extend RWStepDimTol_RWProjectedZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepDimTol_RWRoundnessTolerance *
******************************************/
class RWStepDimTol_RWRoundnessTolerance {
	public:
		/****************** RWStepDimTol_RWRoundnessTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWRoundnessTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWRoundnessTolerance;
		 RWStepDimTol_RWRoundnessTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads roundnesstolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_RoundnessTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_RoundnessTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_RoundnessTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_RoundnessTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes roundnesstolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_RoundnessTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_RoundnessTolerance> & ent);

};


%extend RWStepDimTol_RWRoundnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepDimTol_RWRunoutZoneDefinition *
********************************************/
class RWStepDimTol_RWRunoutZoneDefinition {
	public:
		/****************** RWStepDimTol_RWRunoutZoneDefinition ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWRunoutZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWRunoutZoneDefinition;
		 RWStepDimTol_RWRunoutZoneDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads runoutzonedefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_RunoutZoneDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_RunoutZoneDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes runoutzonedefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_RunoutZoneDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent);

};


%extend RWStepDimTol_RWRunoutZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepDimTol_RWRunoutZoneOrientation *
*********************************************/
class RWStepDimTol_RWRunoutZoneOrientation {
	public:
		/****************** RWStepDimTol_RWRunoutZoneOrientation ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWRunoutZoneOrientation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWRunoutZoneOrientation;
		 RWStepDimTol_RWRunoutZoneOrientation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads runoutzoneorientation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_RunoutZoneOrientation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_RunoutZoneOrientation> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes runoutzoneorientation.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_RunoutZoneOrientation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_RunoutZoneOrientation> & ent);

};


%extend RWStepDimTol_RWRunoutZoneOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepDimTol_RWStraightnessTolerance *
*********************************************/
class RWStepDimTol_RWStraightnessTolerance {
	public:
		/****************** RWStepDimTol_RWStraightnessTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWStraightnessTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWStraightnessTolerance;
		 RWStepDimTol_RWStraightnessTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads straightnesstolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_StraightnessTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_StraightnessTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_StraightnessTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_StraightnessTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes straightnesstolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_StraightnessTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_StraightnessTolerance> & ent);

};


%extend RWStepDimTol_RWStraightnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepDimTol_RWSurfaceProfileTolerance *
***********************************************/
class RWStepDimTol_RWSurfaceProfileTolerance {
	public:
		/****************** RWStepDimTol_RWSurfaceProfileTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWSurfaceProfileTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWSurfaceProfileTolerance;
		 RWStepDimTol_RWSurfaceProfileTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surfaceprofiletolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_SurfaceProfileTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_SurfaceProfileTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surfaceprofiletolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_SurfaceProfileTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent);

};


%extend RWStepDimTol_RWSurfaceProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepDimTol_RWSymmetryTolerance *
*****************************************/
class RWStepDimTol_RWSymmetryTolerance {
	public:
		/****************** RWStepDimTol_RWSymmetryTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWSymmetryTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWSymmetryTolerance;
		 RWStepDimTol_RWSymmetryTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads symmetrytolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_SymmetryTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_SymmetryTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_SymmetryTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_SymmetryTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes symmetrytolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_SymmetryTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_SymmetryTolerance> & ent);

};


%extend RWStepDimTol_RWSymmetryTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepDimTol_RWToleranceZone *
*************************************/
class RWStepDimTol_RWToleranceZone {
	public:
		/****************** RWStepDimTol_RWToleranceZone ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZone;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWToleranceZone;
		 RWStepDimTol_RWToleranceZone();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads tolerancezone.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_ToleranceZone

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_ToleranceZone> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_ToleranceZone
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_ToleranceZone> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes tolerancezone.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_ToleranceZone

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_ToleranceZone> & ent);

};


%extend RWStepDimTol_RWToleranceZone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepDimTol_RWToleranceZoneDefinition *
***********************************************/
class RWStepDimTol_RWToleranceZoneDefinition {
	public:
		/****************** RWStepDimTol_RWToleranceZoneDefinition ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWToleranceZoneDefinition;
		 RWStepDimTol_RWToleranceZoneDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads tolerancezonedefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_ToleranceZoneDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_ToleranceZoneDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes tolerancezonedefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_ToleranceZoneDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent);

};


%extend RWStepDimTol_RWToleranceZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepDimTol_RWToleranceZoneForm *
*****************************************/
class RWStepDimTol_RWToleranceZoneForm {
	public:
		/****************** RWStepDimTol_RWToleranceZoneForm ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZoneForm;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWToleranceZoneForm;
		 RWStepDimTol_RWToleranceZoneForm();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads tolerancezoneform.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_ToleranceZoneForm

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_ToleranceZoneForm> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes tolerancezoneform.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_ToleranceZoneForm

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_ToleranceZoneForm> & ent);

};


%extend RWStepDimTol_RWToleranceZoneForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepDimTol_RWTotalRunoutTolerance *
********************************************/
class RWStepDimTol_RWTotalRunoutTolerance {
	public:
		/****************** RWStepDimTol_RWTotalRunoutTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWTotalRunoutTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWTotalRunoutTolerance;
		 RWStepDimTol_RWTotalRunoutTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads totalrunouttolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_TotalRunoutTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_TotalRunoutTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes totalrunouttolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_TotalRunoutTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent);

};


%extend RWStepDimTol_RWTotalRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class RWStepDimTol_RWUnequallyDisposedGeometricTolerance *
***********************************************************/
class RWStepDimTol_RWUnequallyDisposedGeometricTolerance {
	public:
		/****************** RWStepDimTol_RWUnequallyDisposedGeometricTolerance ******************/
		%feature("compactdefaultargs") RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
		 RWStepDimTol_RWUnequallyDisposedGeometricTolerance();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads unequallydisposedgeometrictolerance.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepDimTol_UnequallyDisposedGeometricTolerance

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepDimTol_UnequallyDisposedGeometricTolerance
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes unequallydisposedgeometrictolerance.

Parameters
----------
SW: StepData_StepWriter
ent: StepDimTol_UnequallyDisposedGeometricTolerance

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent);

};


%extend RWStepDimTol_RWUnequallyDisposedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
