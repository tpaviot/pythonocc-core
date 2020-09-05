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
		/**** md5 signature: 96a003377252f096f3015f439b90e202 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWAngularityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWAngularityTolerance;
		 RWStepDimTol_RWAngularityTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: dceb35d09c920c80a7530480602e0878 ****/
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
		/**** md5 signature: 45670c8948afaf9da265b005aecc2780 ****/
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
		/**** md5 signature: b22fdb214daa154d1202485c1192a668 ****/
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
		/**** md5 signature: e239e7b6341b8519f575ec00fd583e58 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWCircularRunoutTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCircularRunoutTolerance;
		 RWStepDimTol_RWCircularRunoutTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 6e93ee244f5555ae5d81a646a27bc128 ****/
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
		/**** md5 signature: 5d0a1f204c7f515f7299340bcf13d6b1 ****/
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
		/**** md5 signature: 77e81c08737a4bc64c2ad4d3e95eb4ae ****/
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
		/**** md5 signature: 5d6f94574429ff50ce6ea02baff791d5 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWCoaxialityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCoaxialityTolerance;
		 RWStepDimTol_RWCoaxialityTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: b93ba43f9c07d5354ce9652d08e00e96 ****/
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
		/**** md5 signature: 1ca18f7b670c6ad94ed05fefb57c545f ****/
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
		/**** md5 signature: 12c463b004f34caa24ef8005850a8151 ****/
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
		/**** md5 signature: 89ad8d587c4445148ffeaae09b595cad ****/
		%feature("compactdefaultargs") RWStepDimTol_RWCommonDatum;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCommonDatum;
		 RWStepDimTol_RWCommonDatum();

		/****************** ReadStep ******************/
		/**** md5 signature: 254cfd5d43bb82dd66bcae9ef50bb1df ****/
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
		/**** md5 signature: 0f4d8871ec716b0212faeb97ca90b62d ****/
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
		/**** md5 signature: 02837f869c43f00059a7ffd131a34e24 ****/
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
		/**** md5 signature: 5c84414419cbdbc1061e918a2fab8e9d ****/
		%feature("compactdefaultargs") RWStepDimTol_RWConcentricityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWConcentricityTolerance;
		 RWStepDimTol_RWConcentricityTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 8986ff715f7abfada1b8b52752e51b62 ****/
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
		/**** md5 signature: ffac2ea3b6e6f5364e715a8cf737d8b8 ****/
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
		/**** md5 signature: 5d0c9ff618cbc3d6333222c94669f67f ****/
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
		/**** md5 signature: de6394e820bdff11c70b6ace4f71a582 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWCylindricityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWCylindricityTolerance;
		 RWStepDimTol_RWCylindricityTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 3bab201a92af87aa06de879f3a6b5275 ****/
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
		/**** md5 signature: db25bb64f950226a7767a56748b271e5 ****/
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
		/**** md5 signature: 9b589f7ce6d3aba8af4e94b933819c1e ****/
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
		/**** md5 signature: 92891d2f0ec3c7296160e1c68fe6a240 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatum;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatum;
		 RWStepDimTol_RWDatum();

		/****************** ReadStep ******************/
		/**** md5 signature: 76ba15194771c097898d32ecfcafce4b ****/
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
		/**** md5 signature: 1fea3991cb389dd89e5611489640f676 ****/
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
		/**** md5 signature: d2be15b38128b3546f96b31139f95793 ****/
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
		/**** md5 signature: f1c06babc4be03dfdf50574c83fe556e ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumFeature;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumFeature;
		 RWStepDimTol_RWDatumFeature();

		/****************** ReadStep ******************/
		/**** md5 signature: edd23d5dffbd3808276540be55e35263 ****/
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
		/**** md5 signature: 6593c0b16197d3133d9564bda76711ad ****/
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
		/**** md5 signature: 0848aca49b3c0e5a68e772220ce34dd8 ****/
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
		/**** md5 signature: 3568297b06f0a62bf0f1b67936935589 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReference;
		 RWStepDimTol_RWDatumReference();

		/****************** ReadStep ******************/
		/**** md5 signature: 8d576139ec4238c184c444d0fc45f95f ****/
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
		/**** md5 signature: 9e1d7abe0871cd26330847fe018089f6 ****/
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
		/**** md5 signature: 5f3e39757d4cf4f79058114db0adf14e ****/
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
		/**** md5 signature: 664b69b82e0d2fcf73556470307e0521 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceCompartment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReferenceCompartment;
		 RWStepDimTol_RWDatumReferenceCompartment();

		/****************** ReadStep ******************/
		/**** md5 signature: 5b9c6d484d8c0dcbd8777b9afeef19ec ****/
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
		/**** md5 signature: 60bb89c33101a71ab85b5c44c39ca06a ****/
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
		/**** md5 signature: cdeadba4ae195b9aae957efbd13bda25 ****/
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
		/**** md5 signature: c850fca37bd12c8f86985dd309d55bd3 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceElement;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReferenceElement;
		 RWStepDimTol_RWDatumReferenceElement();

		/****************** ReadStep ******************/
		/**** md5 signature: bc944673e0a2ad844ccd15d849dea340 ****/
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
		/**** md5 signature: bb4e3a6323e91b2fb4233134b544641a ****/
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
		/**** md5 signature: a3792c7eee9fb861593de531915fe01e ****/
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
		/**** md5 signature: c1619171cf286310559fac7d7cf6b555 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceModifierWithValue;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumReferenceModifierWithValue;
		 RWStepDimTol_RWDatumReferenceModifierWithValue();

		/****************** ReadStep ******************/
		/**** md5 signature: 7d245ecdcc7de9b2a2570fe847633ef5 ****/
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
		/**** md5 signature: 3f82ea8930a3921a277b3b8376b11569 ****/
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
		/**** md5 signature: fbf8d0541ec9b69f7ee22d73a5c5495b ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumSystem;
		 RWStepDimTol_RWDatumSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: 592710cac044c5827253e6a1bcf727e4 ****/
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
		/**** md5 signature: f0fedbd383038b39fdcc9692628a577c ****/
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
		/**** md5 signature: 7f97c2f32e01dc079645beeecc37a91a ****/
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
		/**** md5 signature: 81c126438ccab6d1cd7f02ad07f258b6 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWDatumTarget;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWDatumTarget;
		 RWStepDimTol_RWDatumTarget();

		/****************** ReadStep ******************/
		/**** md5 signature: 4508bdcfb61c755a32c30f2929974bd6 ****/
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
		/**** md5 signature: 0b067d58ffaa21147f0450723d66f329 ****/
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
		/**** md5 signature: efa5610cfd3e3473406616386ef24691 ****/
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
		/**** md5 signature: 49322e5862ef8e038401e08d06e6537b ****/
		%feature("compactdefaultargs") RWStepDimTol_RWFlatnessTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWFlatnessTolerance;
		 RWStepDimTol_RWFlatnessTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: b305074623b1108e5b40674c190b925b ****/
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
		/**** md5 signature: 3901ed544429d5bfc7be59251190f384 ****/
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
		/**** md5 signature: dc143bfedfbc1cd16364c471ca2b7cd8 ****/
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
		/**** md5 signature: 5358a019c9a4b0955d129d06d7ece42c ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeneralDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeneralDatumReference;
		 RWStepDimTol_RWGeneralDatumReference();

		/****************** ReadStep ******************/
		/**** md5 signature: 0241e3051e215d5f6874a5edc2ceafbc ****/
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
		/**** md5 signature: e9ddc749e621b8c07210dec12adcfff6 ****/
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
		/**** md5 signature: aa157c657a3f762f1035f0549dd47931 ****/
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
		/**** md5 signature: 8221d12e2751c5113de219871d1713e9 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRef();

		/****************** ReadStep ******************/
		/**** md5 signature: 0f940c84297b23eca07fd15646de1ca2 ****/
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
		/**** md5 signature: b6bc3e92536a78dd423a2bd88ad18185 ****/
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
		/**** md5 signature: ab4aa098d2413ab626609b7219a91a4a ****/
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
		/**** md5 signature: abd0b0db6f7d28d1af192456fe2fb5d4 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol();

		/****************** ReadStep ******************/
		/**** md5 signature: 189b432970643457a8827ebf346488b6 ****/
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
		/**** md5 signature: ca92bff5e682aa53277eeef962cf35be ****/
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
		/**** md5 signature: 88140b3735a4b8e62d08cd9cf7219fa1 ****/
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
		/**** md5 signature: 302b306db3f29d7e6b9519bb664b85d7 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod();

		/****************** ReadStep ******************/
		/**** md5 signature: 8132432ce5927f3a47d7baf8ae64b101 ****/
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
		/**** md5 signature: a74cd91a09d292a2ab1b7115ecdc3f10 ****/
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
		/**** md5 signature: b4e05a06b598395016efdbe83344f491 ****/
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
		/**** md5 signature: 9d80871f533c78eac445ede05369ed9c ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol();

		/****************** ReadStep ******************/
		/**** md5 signature: a7dd2dcb883be087430491699ec3a4d5 ****/
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
		/**** md5 signature: 8dcdcd969faf28387c6cf5ad33a338a8 ****/
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
		/**** md5 signature: 1e38303a4cc27393c05fa37d2902361e ****/
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
		/**** md5 signature: 4b8c31b9c90747c4fb2ab957bf3cab7e ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol();

		/****************** ReadStep ******************/
		/**** md5 signature: 2881e0eafc83299caf927ba795baa718 ****/
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
		/**** md5 signature: 90dbb237878ee2b7429fa64dc2203143 ****/
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
		/**** md5 signature: e85055c62d2db534015bfa2bbe041eb9 ****/
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
		/**** md5 signature: df4dba67dd3e01fad3bbb1a3ce807d6a ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol();

		/****************** ReadStep ******************/
		/**** md5 signature: e65952dd291fbf46afb7f4be810185ef ****/
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
		/**** md5 signature: 4eb38af8c2a550c8ae717a824838b3e0 ****/
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
		/**** md5 signature: 9db2e0864fbeb574b64e92c228c155d8 ****/
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
		/**** md5 signature: 56c9d67539699b8d5dcfda65457e0af6 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthMod;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepDimTol_RWGeoTolAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMod();

		/****************** ReadStep ******************/
		/**** md5 signature: 9d548de11fac699577ec04f215ddcf1c ****/
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
		/**** md5 signature: 28b917c7b76fe9c3ef8a03c3be45f8f5 ****/
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
		/**** md5 signature: 9c40170463583bd8ba2b7b8cc6308fa5 ****/
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
		/**** md5 signature: cd75bb042279131109e28fc09b627f47 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricTolerance;
		 RWStepDimTol_RWGeometricTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: c6e450eb819d3ce26d3faf0e95116238 ****/
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
		/**** md5 signature: 93c6a7523fdc0074fc2aa1c5cd27e22d ****/
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
		/**** md5 signature: 5948295dff1af3c5a5a9e711408ea404 ****/
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
		/**** md5 signature: a0719e621491ac92daa9fc17c6f38fa4 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceRelationship;
		 RWStepDimTol_RWGeometricToleranceRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: e58a5ea0d40376895741eef8978eaf5b ****/
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
		/**** md5 signature: 8946a4847d40cb1be2dec102bd379cfe ****/
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
		/**** md5 signature: fcc217b90c766da94aae2c2433b4beaf ****/
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
		/**** md5 signature: 130c7cc84619e498478de1fd2c5ce753 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithDatumReference;
		 RWStepDimTol_RWGeometricToleranceWithDatumReference();

		/****************** ReadStep ******************/
		/**** md5 signature: 92fab26aa6c70c0a87fb3d7ebebc86f6 ****/
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
		/**** md5 signature: f130465b4d6ddf7dc1ddfdbdf9a147c6 ****/
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
		/**** md5 signature: 982ccff1ea8d56224e1ec215d96e09f6 ****/
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
		/**** md5 signature: 8e1b7ef55e4259ac10a1a24fc8814c13 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 53c4c924b009e909a0406de4a105e5a1 ****/
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
		/**** md5 signature: 3d0e01d67b104aa7f90ef55827b59c04 ****/
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
		/**** md5 signature: 93bc755f1c095bdfe431e5ad2ae27b8c ****/
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
		/**** md5 signature: 54f7f9f0fae7cd8a3c73ca3b1798407d ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 6ce19e7542ac65760cdd672de5215224 ****/
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
		/**** md5 signature: d9ef84accec6f0b6c10ee233db8e731e ****/
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
		/**** md5 signature: f5dfd34182edf152f52c6c25dfcaf164 ****/
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
		/**** md5 signature: 28175b9ac06fc113b8544df74775a541 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
		 RWStepDimTol_RWGeometricToleranceWithMaximumTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 65238cacc2255587fe4dcae29d7f8d3b ****/
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
		/**** md5 signature: 1bb719aa2de7afcfb3998077a8d938d2 ****/
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
		/**** md5 signature: f7b77bac0823830afc8fd398a412d64f ****/
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
		/**** md5 signature: c6f198c66990dfd270e546e6baeaef11 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithModifiers;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWGeometricToleranceWithModifiers;
		 RWStepDimTol_RWGeometricToleranceWithModifiers();

		/****************** ReadStep ******************/
		/**** md5 signature: 1f3a6b10a6e9b3e80dd5e45373c95c11 ****/
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
		/**** md5 signature: 8d31f363ba5e00c017c227e0e2089d73 ****/
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
		/**** md5 signature: 6d5da3466f989d7e81ef0f6313c0964c ****/
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
		/**** md5 signature: ffac931cf91eb401bdaebc12ca1664a9 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWLineProfileTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWLineProfileTolerance;
		 RWStepDimTol_RWLineProfileTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 999e6e986fdaa2726b48e38c0f22addf ****/
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
		/**** md5 signature: 9bc8db57ed6c8d08a511017f33128ad4 ****/
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
		/**** md5 signature: ea96c48c6a3934057407fbb41c0becca ****/
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
		/**** md5 signature: 746f0cbbad6b0d6586538229cbeb6e10 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWModifiedGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWModifiedGeometricTolerance;
		 RWStepDimTol_RWModifiedGeometricTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: c6e73868aba153ab06f8c6e6702073a9 ****/
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
		/**** md5 signature: ca75ddaecbe1134c470075c8a0a807e4 ****/
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
		/**** md5 signature: 91b1ddba6e382075c58ad960a1e7a4f8 ****/
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
		/**** md5 signature: 9498f7e2066d69419d187712c1070259 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWNonUniformZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWNonUniformZoneDefinition;
		 RWStepDimTol_RWNonUniformZoneDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: 9a913cc6876e91e74dee7d57d8b76088 ****/
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
		/**** md5 signature: e9c1818604d9f07816e5effde41e799a ****/
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
		/**** md5 signature: 7659a4902bafd98ec6ce2bfc611ae8dd ****/
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
		/**** md5 signature: 7bb899e76eb57ae8cd1ee9837c8b4d8b ****/
		%feature("compactdefaultargs") RWStepDimTol_RWParallelismTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWParallelismTolerance;
		 RWStepDimTol_RWParallelismTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: fe1a02d899d7ef375c4ba77522c35ae5 ****/
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
		/**** md5 signature: c7c98f88e3b8394b095b56c9286fbb65 ****/
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
		/**** md5 signature: 849197b857a7021da4df7633440d2319 ****/
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
		/**** md5 signature: 9c3f266efa87696ed3599d04b4d1e951 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWPerpendicularityTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWPerpendicularityTolerance;
		 RWStepDimTol_RWPerpendicularityTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 03b613494e2188ca99665e7029ed1bb1 ****/
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
		/**** md5 signature: db7cc9e0159c4c33a884a6067db844af ****/
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
		/**** md5 signature: a0ac23386af76081d4141b875de50211 ****/
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
		/**** md5 signature: 904d074ca280de86414a3dafb490f8b0 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWPlacedDatumTargetFeature;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWPlacedDatumTargetFeature;
		 RWStepDimTol_RWPlacedDatumTargetFeature();

		/****************** ReadStep ******************/
		/**** md5 signature: 5bd9df46c95996c536dd502a21d73c35 ****/
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
		/**** md5 signature: f823de8b0432ae217f273c84ceb25ec4 ****/
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
		/**** md5 signature: 9d750a46dd416ae5d73bf36c943151b3 ****/
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
		/**** md5 signature: d331a3ae62be4c279626a1144d9bb13e ****/
		%feature("compactdefaultargs") RWStepDimTol_RWPositionTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWPositionTolerance;
		 RWStepDimTol_RWPositionTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 12a25fa640c51b5c72da86b801a8e007 ****/
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
		/**** md5 signature: 56fe2e9934d451b52e9cea02d5c2e1f6 ****/
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
		/**** md5 signature: 45c20e0f01ff3ac18d1fd5549fc3c60a ****/
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
		/**** md5 signature: ebf0ae4c334da96d7ba2c103d532ca1f ****/
		%feature("compactdefaultargs") RWStepDimTol_RWProjectedZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWProjectedZoneDefinition;
		 RWStepDimTol_RWProjectedZoneDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: b559351884ce9d94659f9e4cedcad7db ****/
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
		/**** md5 signature: 9f035de90bcf9206ea3be8ec41d2bece ****/
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
		/**** md5 signature: 3ca733d7fc2f140d856ec539e84c82bb ****/
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
		/**** md5 signature: e0fa201e101b37c92753b4bcc7d85405 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWRoundnessTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWRoundnessTolerance;
		 RWStepDimTol_RWRoundnessTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: dfd7790a2e01cee76908be9f8ae3d876 ****/
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
		/**** md5 signature: 8713ad2dff3c0c72d0b50d51249c48e3 ****/
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
		/**** md5 signature: f0d6e3cfc3680580a4ec22311f763900 ****/
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
		/**** md5 signature: a8772b4e7a979a76edfb6f4caf2f8e55 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWRunoutZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWRunoutZoneDefinition;
		 RWStepDimTol_RWRunoutZoneDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: 3d526f117efac475cbeadd3458859cea ****/
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
		/**** md5 signature: 6336fe6cab3ced9a2ae5ee3f5d1b959b ****/
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
		/**** md5 signature: dbc8d5c0aa72ceba4f34efee88479b53 ****/
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
		/**** md5 signature: a5256af15d76eea78a07b51d93ddcca9 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWRunoutZoneOrientation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWRunoutZoneOrientation;
		 RWStepDimTol_RWRunoutZoneOrientation();

		/****************** ReadStep ******************/
		/**** md5 signature: da3ad3b9b19fb3fb494cdfc08f0ce883 ****/
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
		/**** md5 signature: 903e861cbe79b5bbd25bbfffa1d83703 ****/
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
		/**** md5 signature: f12aaf83849e22dda1d4c5dfe5c4bbc5 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWStraightnessTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWStraightnessTolerance;
		 RWStepDimTol_RWStraightnessTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: dbe56e13e071402ca52feba99c0f406e ****/
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
		/**** md5 signature: 3306741a16b239f3990854e1e388ea84 ****/
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
		/**** md5 signature: 4f67005183912e261e3477af7df87796 ****/
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
		/**** md5 signature: 1ab9b3f35c10bc29cf078548b3bc1f28 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWSurfaceProfileTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWSurfaceProfileTolerance;
		 RWStepDimTol_RWSurfaceProfileTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: d722e6e2d07fc4e4bc6b15e526059c13 ****/
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
		/**** md5 signature: a020e354c909b14f1523c08f8a6dc987 ****/
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
		/**** md5 signature: 86ed3275a1fd19a3d6541328896df4c1 ****/
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
		/**** md5 signature: 62351b53428bb9d04fcc6b50917409be ****/
		%feature("compactdefaultargs") RWStepDimTol_RWSymmetryTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWSymmetryTolerance;
		 RWStepDimTol_RWSymmetryTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 2a72179b7920667ee9cf7d9858480ebe ****/
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
		/**** md5 signature: 92ecc7cb897f782867d06e3d8db9c585 ****/
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
		/**** md5 signature: 11d6df529a538a76b68ef5300f7facee ****/
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
		/**** md5 signature: 5f272fda484775ee24f46177686c7147 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZone;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWToleranceZone;
		 RWStepDimTol_RWToleranceZone();

		/****************** ReadStep ******************/
		/**** md5 signature: 3dddb4ba322036e058a558ff01a79c5c ****/
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
		/**** md5 signature: a1638c92a4f5870c3e5d55710054f2c5 ****/
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
		/**** md5 signature: e3407a4290606edb61a6fc7b16fac10b ****/
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
		/**** md5 signature: 495df9f43e529a9c6d096c033d4652f1 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWToleranceZoneDefinition;
		 RWStepDimTol_RWToleranceZoneDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: db18072a3de349376ef5e205eb8dd5b0 ****/
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
		/**** md5 signature: 6c59074b00230819ee9a9548c6ee66cf ****/
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
		/**** md5 signature: 2e738315d74d17c5937a6151e54e9dc0 ****/
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
		/**** md5 signature: cc8c4180320b0a66c4d7096b8face151 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZoneForm;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWToleranceZoneForm;
		 RWStepDimTol_RWToleranceZoneForm();

		/****************** ReadStep ******************/
		/**** md5 signature: bfef62ebca5e6971eb1eca466311668c ****/
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
		/**** md5 signature: a99d2f22a2143847ec4eb49a9feee759 ****/
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
		/**** md5 signature: 52268b1a567e1357df04f32aac853615 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWTotalRunoutTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWTotalRunoutTolerance;
		 RWStepDimTol_RWTotalRunoutTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 29fece1c911293ff1dd2b17ba616940c ****/
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
		/**** md5 signature: 5cf3da651b4ac74af4fc3fa3e0af4c64 ****/
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
		/**** md5 signature: 864d4ff226f8042fc046c7aa7bf868b0 ****/
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
		/**** md5 signature: 17a4ede2c79d161edad9022f608387a4 ****/
		%feature("compactdefaultargs") RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
		 RWStepDimTol_RWUnequallyDisposedGeometricTolerance();

		/****************** ReadStep ******************/
		/**** md5 signature: 7a041bde31bd2953772a9d920a91bfbd ****/
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
		/**** md5 signature: 672a3720b2f802b3676875dc4b4a3153 ****/
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
		/**** md5 signature: 05f2e0627aa4eba6feddc894f84eb7ba ****/
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
