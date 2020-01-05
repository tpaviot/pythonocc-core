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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWAngularityTolerance;
		 RWStepDimTol_RWAngularityTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads AngularityTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_AngularityTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_AngularityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_AngularityTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_AngularityTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes AngularityTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_AngularityTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_AngularityTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWCircularRunoutTolerance;
		 RWStepDimTol_RWCircularRunoutTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CircularRunoutTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_CircularRunoutTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_CircularRunoutTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CircularRunoutTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_CircularRunoutTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWCoaxialityTolerance;
		 RWStepDimTol_RWCoaxialityTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CoaxialityTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_CoaxialityTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_CoaxialityTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CoaxialityTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_CoaxialityTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWCommonDatum;
		 RWStepDimTol_RWCommonDatum ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CommonDatum
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_CommonDatum
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CommonDatum> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_CommonDatum
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_CommonDatum> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CommonDatum
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_CommonDatum
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CommonDatum> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWConcentricityTolerance;
		 RWStepDimTol_RWConcentricityTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ConcentricityTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_ConcentricityTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_ConcentricityTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ConcentricityTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_ConcentricityTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWCylindricityTolerance;
		 RWStepDimTol_RWCylindricityTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CylindricityTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_CylindricityTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CylindricityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_CylindricityTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_CylindricityTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CylindricityTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_CylindricityTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CylindricityTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatum;
		 RWStepDimTol_RWDatum ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Datum
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_Datum
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_Datum> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_Datum
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_Datum> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Datum
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_Datum
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_Datum> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatumFeature;
		 RWStepDimTol_RWDatumFeature ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DatumFeature
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_DatumFeature
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumFeature> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_DatumFeature
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_DatumFeature> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DatumFeature
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_DatumFeature
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumFeature> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatumReference;
		 RWStepDimTol_RWDatumReference ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DatumReference
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_DatumReference
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_DatumReference
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_DatumReference> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DatumReference
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_DatumReference
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReference> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatumReferenceCompartment;
		 RWStepDimTol_RWDatumReferenceCompartment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DatumReferenceElement
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_DatumReferenceCompartment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_DatumReferenceCompartment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DatumReferenceElement
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_DatumReferenceCompartment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatumReferenceElement;
		 RWStepDimTol_RWDatumReferenceElement ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DatumReferenceElement
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_DatumReferenceElement
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReferenceElement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_DatumReferenceElement
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_DatumReferenceElement> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DatumReferenceElement
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_DatumReferenceElement
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReferenceElement> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatumReferenceModifierWithValue;
		 RWStepDimTol_RWDatumReferenceModifierWithValue ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DatumReferenceModifierWithValue
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_DatumReferenceModifierWithValue
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DatumReferenceModifierWithValue
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_DatumReferenceModifierWithValue
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatumSystem;
		 RWStepDimTol_RWDatumSystem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DatumSystem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_DatumSystem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumSystem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_DatumSystem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_DatumSystem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DatumSystem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_DatumSystem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumSystem> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWDatumTarget;
		 RWStepDimTol_RWDatumTarget ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DatumTarget
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_DatumTarget
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumTarget> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_DatumTarget
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_DatumTarget> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DatumTarget
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_DatumTarget
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumTarget> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWFlatnessTolerance;
		 RWStepDimTol_RWFlatnessTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads FlatnessTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_FlatnessTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_FlatnessTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_FlatnessTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_FlatnessTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes FlatnessTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_FlatnessTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_FlatnessTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeneralDatumReference;
		 RWStepDimTol_RWGeneralDatumReference ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeneralDatumReference
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeneralDatumReference
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeneralDatumReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeneralDatumReference
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeneralDatumReference> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeneralDatumReference
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeneralDatumReference
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeneralDatumReference> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRef ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRef
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRef
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRef
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthMaxTol
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthMaxTol
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthMaxTol
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepDimTol_RWGeoTolAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMod ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthMod
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthMod
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeoTolAndGeoTolWthMod
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeometricTolerance;
		 RWStepDimTol_RWGeometricTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeometricTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeometricTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeometricTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeometricToleranceRelationship;
		 RWStepDimTol_RWGeometricToleranceRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricToleranceRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeometricToleranceRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeometricToleranceRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricToleranceRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeometricToleranceRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeometricToleranceWithDatumReference;
		 RWStepDimTol_RWGeometricToleranceWithDatumReference ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricToleranceWithDatumReference
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDatumReference
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDatumReference
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricToleranceWithDatumReference
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDatumReference
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricToleranceWithDefinedAreaUnit
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDefinedAreaUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDefinedAreaUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricToleranceWithDefinedAreaUnit
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDefinedAreaUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricToleranceWithDefinedUnit
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDefinedUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDefinedUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricToleranceWithDefinedUnit
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithDefinedUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
		 RWStepDimTol_RWGeometricToleranceWithMaximumTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricToleranceWithMaximumTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithMaximumTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithMaximumTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricToleranceWithMaximumTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithMaximumTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWGeometricToleranceWithModifiers;
		 RWStepDimTol_RWGeometricToleranceWithModifiers ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeometricToleranceWithModifiers
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithModifiers
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithModifiers
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeometricToleranceWithModifiers
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_GeometricToleranceWithModifiers
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWLineProfileTolerance;
		 RWStepDimTol_RWLineProfileTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads LineProfileTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_LineProfileTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_LineProfileTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_LineProfileTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_LineProfileTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes LineProfileTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_LineProfileTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_LineProfileTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWModifiedGeometricTolerance;
		 RWStepDimTol_RWModifiedGeometricTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ModifiedGeometricTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_ModifiedGeometricTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_ModifiedGeometricTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ModifiedGeometricTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_ModifiedGeometricTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWNonUniformZoneDefinition;
		 RWStepDimTol_RWNonUniformZoneDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NonUniformZoneDefinition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_NonUniformZoneDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_NonUniformZoneDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NonUniformZoneDefinition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_NonUniformZoneDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWParallelismTolerance;
		 RWStepDimTol_RWParallelismTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ParallelismTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_ParallelismTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ParallelismTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_ParallelismTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_ParallelismTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ParallelismTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_ParallelismTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ParallelismTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWPerpendicularityTolerance;
		 RWStepDimTol_RWPerpendicularityTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads PerpendicularityTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_PerpendicularityTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_PerpendicularityTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes PerpendicularityTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_PerpendicularityTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWPlacedDatumTargetFeature;
		 RWStepDimTol_RWPlacedDatumTargetFeature ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads PlacedDatumTargetFeature
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_PlacedDatumTargetFeature
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_PlacedDatumTargetFeature
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes PlacedDatumTargetFeature
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_PlacedDatumTargetFeature
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWPositionTolerance;
		 RWStepDimTol_RWPositionTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads PositionTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_PositionTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_PositionTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_PositionTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_PositionTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes PositionTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_PositionTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_PositionTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWProjectedZoneDefinition;
		 RWStepDimTol_RWProjectedZoneDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ProjectedZoneDefinition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_ProjectedZoneDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_ProjectedZoneDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ProjectedZoneDefinition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_ProjectedZoneDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWRoundnessTolerance;
		 RWStepDimTol_RWRoundnessTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads RoundnessTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_RoundnessTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_RoundnessTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_RoundnessTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_RoundnessTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes RoundnessTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_RoundnessTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_RoundnessTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWRunoutZoneDefinition;
		 RWStepDimTol_RWRunoutZoneDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads RunoutZoneDefinition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_RunoutZoneDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_RunoutZoneDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes RunoutZoneDefinition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_RunoutZoneDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWRunoutZoneOrientation;
		 RWStepDimTol_RWRunoutZoneOrientation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads RunoutZoneOrientation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_RunoutZoneOrientation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_RunoutZoneOrientation> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes RunoutZoneOrientation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_RunoutZoneOrientation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_RunoutZoneOrientation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWStraightnessTolerance;
		 RWStepDimTol_RWStraightnessTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads StraightnessTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_StraightnessTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_StraightnessTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_StraightnessTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_StraightnessTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes StraightnessTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_StraightnessTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_StraightnessTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWSurfaceProfileTolerance;
		 RWStepDimTol_RWSurfaceProfileTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads SurfaceProfileTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_SurfaceProfileTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_SurfaceProfileTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes SurfaceProfileTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_SurfaceProfileTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWSymmetryTolerance;
		 RWStepDimTol_RWSymmetryTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads SymmetryTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_SymmetryTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_SymmetryTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_SymmetryTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_SymmetryTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes SymmetryTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_SymmetryTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_SymmetryTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWToleranceZone;
		 RWStepDimTol_RWToleranceZone ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ToleranceZone
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_ToleranceZone
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ToleranceZone> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_ToleranceZone
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_ToleranceZone> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ToleranceZone
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_ToleranceZone
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ToleranceZone> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWToleranceZoneDefinition;
		 RWStepDimTol_RWToleranceZoneDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ToleranceZoneDefinition
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_ToleranceZoneDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_ToleranceZoneDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ToleranceZoneDefinition
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_ToleranceZoneDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWToleranceZoneForm;
		 RWStepDimTol_RWToleranceZoneForm ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ToleranceZoneForm
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_ToleranceZoneForm
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ToleranceZoneForm> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ToleranceZoneForm
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_ToleranceZoneForm
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ToleranceZoneForm> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWTotalRunoutTolerance;
		 RWStepDimTol_RWTotalRunoutTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads TotalRunoutTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_TotalRunoutTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_TotalRunoutTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes TotalRunoutTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_TotalRunoutTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
		 RWStepDimTol_RWUnequallyDisposedGeometricTolerance ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads UnequallyDisposedGeometricTolerance
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepDimTol_UnequallyDisposedGeometricTolerance
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepDimTol_UnequallyDisposedGeometricTolerance
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes UnequallyDisposedGeometricTolerance
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepDimTol_UnequallyDisposedGeometricTolerance
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent);

};


%extend RWStepDimTol_RWUnequallyDisposedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
