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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define RWSTEPDIMTOLDOCSTRING
"RWStepDimTol module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_RWStepDimTol.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPDIMTOLDOCSTRING) RWStepDimTol

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include RWStepDimTol_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%nodefaultctor RWStepDimTol_RWAngularityTolerance;
class RWStepDimTol_RWAngularityTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWAngularityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWAngularityTolerance;
		 RWStepDimTol_RWAngularityTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AngularityTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_AngularityTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_AngularityTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_AngularityTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_AngularityTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AngularityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_AngularityTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_AngularityTolerance> & ent);
};


%extend RWStepDimTol_RWAngularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWCircularRunoutTolerance;
class RWStepDimTol_RWCircularRunoutTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWCircularRunoutTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWCircularRunoutTolerance;
		 RWStepDimTol_RWCircularRunoutTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CircularRunoutTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CircularRunoutTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_CircularRunoutTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CircularRunoutTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CircularRunoutTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CircularRunoutTolerance> & ent);
};


%extend RWStepDimTol_RWCircularRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWCoaxialityTolerance;
class RWStepDimTol_RWCoaxialityTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWCoaxialityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWCoaxialityTolerance;
		 RWStepDimTol_RWCoaxialityTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CoaxialityTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CoaxialityTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_CoaxialityTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CoaxialityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CoaxialityTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CoaxialityTolerance> & ent);
};


%extend RWStepDimTol_RWCoaxialityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWCommonDatum;
class RWStepDimTol_RWCommonDatum {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWCommonDatum;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWCommonDatum;
		 RWStepDimTol_RWCommonDatum ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CommonDatum

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CommonDatum> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CommonDatum> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_CommonDatum> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_CommonDatum> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CommonDatum

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CommonDatum> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CommonDatum> & ent);
};


%extend RWStepDimTol_RWCommonDatum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWConcentricityTolerance;
class RWStepDimTol_RWConcentricityTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWConcentricityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWConcentricityTolerance;
		 RWStepDimTol_RWConcentricityTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConcentricityTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ConcentricityTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_ConcentricityTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConcentricityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ConcentricityTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ConcentricityTolerance> & ent);
};


%extend RWStepDimTol_RWConcentricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWCylindricityTolerance;
class RWStepDimTol_RWCylindricityTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWCylindricityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWCylindricityTolerance;
		 RWStepDimTol_RWCylindricityTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CylindricityTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CylindricityTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_CylindricityTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_CylindricityTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_CylindricityTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CylindricityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_CylindricityTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_CylindricityTolerance> & ent);
};


%extend RWStepDimTol_RWCylindricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatum;
class RWStepDimTol_RWDatum {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatum;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatum;
		 RWStepDimTol_RWDatum ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Datum

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_Datum> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_Datum> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_Datum> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_Datum> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Datum

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_Datum> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_Datum> & ent);
};


%extend RWStepDimTol_RWDatum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatumFeature;
class RWStepDimTol_RWDatumFeature {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatumFeature;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatumFeature;
		 RWStepDimTol_RWDatumFeature ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DatumFeature

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumFeature> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumFeature> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumFeature> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_DatumFeature> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumFeature

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumFeature> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumFeature> & ent);
};


%extend RWStepDimTol_RWDatumFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatumReference;
class RWStepDimTol_RWDatumReference {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatumReference;
		 RWStepDimTol_RWDatumReference ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DatumReference

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReference> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReference> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReference> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_DatumReference> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumReference

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReference> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReference> & ent);
};


%extend RWStepDimTol_RWDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatumReferenceCompartment;
class RWStepDimTol_RWDatumReferenceCompartment {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceCompartment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatumReferenceCompartment;
		 RWStepDimTol_RWDatumReferenceCompartment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DatumReferenceElement

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceCompartment> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceCompartment> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumReferenceElement

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceCompartment> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReferenceCompartment> & ent);
};


%extend RWStepDimTol_RWDatumReferenceCompartment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatumReferenceElement;
class RWStepDimTol_RWDatumReferenceElement {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceElement;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatumReferenceElement;
		 RWStepDimTol_RWDatumReferenceElement ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DatumReferenceElement

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceElement> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReferenceElement> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceElement> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_DatumReferenceElement> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumReferenceElement

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceElement> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReferenceElement> & ent);
};


%extend RWStepDimTol_RWDatumReferenceElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatumReferenceModifierWithValue;
class RWStepDimTol_RWDatumReferenceModifierWithValue {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatumReferenceModifierWithValue;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatumReferenceModifierWithValue;
		 RWStepDimTol_RWDatumReferenceModifierWithValue ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DatumReferenceModifierWithValue

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumReferenceModifierWithValue

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> & ent);
};


%extend RWStepDimTol_RWDatumReferenceModifierWithValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatumSystem;
class RWStepDimTol_RWDatumSystem {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatumSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatumSystem;
		 RWStepDimTol_RWDatumSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DatumSystem

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumSystem> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumSystem> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumSystem> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_DatumSystem> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumSystem> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumSystem> & ent);
};


%extend RWStepDimTol_RWDatumSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWDatumTarget;
class RWStepDimTol_RWDatumTarget {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWDatumTarget;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWDatumTarget;
		 RWStepDimTol_RWDatumTarget ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DatumTarget

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumTarget> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_DatumTarget> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumTarget> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_DatumTarget> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumTarget

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_DatumTarget> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_DatumTarget> & ent);
};


%extend RWStepDimTol_RWDatumTarget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWFlatnessTolerance;
class RWStepDimTol_RWFlatnessTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWFlatnessTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWFlatnessTolerance;
		 RWStepDimTol_RWFlatnessTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FlatnessTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_FlatnessTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_FlatnessTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_FlatnessTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_FlatnessTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FlatnessTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_FlatnessTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_FlatnessTolerance> & ent);
};


%extend RWStepDimTol_RWFlatnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeneralDatumReference;
class RWStepDimTol_RWGeneralDatumReference {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeneralDatumReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeneralDatumReference;
		 RWStepDimTol_RWGeneralDatumReference ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeneralDatumReference

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeneralDatumReference> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeneralDatumReference> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeneralDatumReference> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeneralDatumReference> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeneralDatumReference

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeneralDatumReference> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeneralDatumReference> & ent);
};


%extend RWStepDimTol_RWGeneralDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRef {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
		%feature("autodoc", "	:rtype: None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRef;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRef ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRef> & ent);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		%feature("autodoc", "	:rtype: None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol> & ent);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		%feature("autodoc", "	:rtype: None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod> & ent);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndGeoTolWthMod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		%feature("autodoc", "	:rtype: None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol> & ent);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
class RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		%feature("autodoc", "	:rtype: None
") RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol> & ent);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndUneqDisGeoTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
class RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
		%feature("autodoc", "	:rtype: None
") RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMaxTol> & ent);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthMaxTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeoTolAndGeoTolWthMod;
class RWStepDimTol_RWGeoTolAndGeoTolWthMod {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeoTolAndGeoTolWthMod;
		%feature("autodoc", "	:rtype: None
") RWStepDimTol_RWGeoTolAndGeoTolWthMod;
		 RWStepDimTol_RWGeoTolAndGeoTolWthMod ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeoTolAndGeoTolWthMod> & ent);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthMod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeometricTolerance;
class RWStepDimTol_RWGeometricTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeometricTolerance;
		 RWStepDimTol_RWGeometricTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricTolerance> & ent);
};


%extend RWStepDimTol_RWGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeometricToleranceRelationship;
class RWStepDimTol_RWGeometricToleranceRelationship {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeometricToleranceRelationship;
		 RWStepDimTol_RWGeometricToleranceRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricToleranceRelationship

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceRelationship> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceRelationship> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceRelationship> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceRelationship> & ent);
};


%extend RWStepDimTol_RWGeometricToleranceRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeometricToleranceWithDatumReference;
class RWStepDimTol_RWGeometricToleranceWithDatumReference {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDatumReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeometricToleranceWithDatumReference;
		 RWStepDimTol_RWGeometricToleranceWithDatumReference ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricToleranceWithDatumReference

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceWithDatumReference

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & ent);
};


%extend RWStepDimTol_RWGeometricToleranceWithDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
class RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricToleranceWithDefinedAreaUnit

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceWithDefinedAreaUnit

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedAreaUnit> & ent);
};


%extend RWStepDimTol_RWGeometricToleranceWithDefinedAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
class RWStepDimTol_RWGeometricToleranceWithDefinedUnit {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeometricToleranceWithDefinedUnit;
		 RWStepDimTol_RWGeometricToleranceWithDefinedUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricToleranceWithDefinedUnit

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceWithDefinedUnit

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithDefinedUnit> & ent);
};


%extend RWStepDimTol_RWGeometricToleranceWithDefinedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
class RWStepDimTol_RWGeometricToleranceWithMaximumTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeometricToleranceWithMaximumTolerance;
		 RWStepDimTol_RWGeometricToleranceWithMaximumTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricToleranceWithMaximumTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceWithMaximumTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithMaximumTolerance> & ent);
};


%extend RWStepDimTol_RWGeometricToleranceWithMaximumTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWGeometricToleranceWithModifiers;
class RWStepDimTol_RWGeometricToleranceWithModifiers {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWGeometricToleranceWithModifiers;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWGeometricToleranceWithModifiers;
		 RWStepDimTol_RWGeometricToleranceWithModifiers ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricToleranceWithModifiers

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceWithModifiers

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & ent);
};


%extend RWStepDimTol_RWGeometricToleranceWithModifiers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWLineProfileTolerance;
class RWStepDimTol_RWLineProfileTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWLineProfileTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWLineProfileTolerance;
		 RWStepDimTol_RWLineProfileTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads LineProfileTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_LineProfileTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_LineProfileTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_LineProfileTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_LineProfileTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes LineProfileTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_LineProfileTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_LineProfileTolerance> & ent);
};


%extend RWStepDimTol_RWLineProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWModifiedGeometricTolerance;
class RWStepDimTol_RWModifiedGeometricTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWModifiedGeometricTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWModifiedGeometricTolerance;
		 RWStepDimTol_RWModifiedGeometricTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ModifiedGeometricTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ModifiedGeometricTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_ModifiedGeometricTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ModifiedGeometricTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ModifiedGeometricTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & ent);
};


%extend RWStepDimTol_RWModifiedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWNonUniformZoneDefinition;
class RWStepDimTol_RWNonUniformZoneDefinition {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWNonUniformZoneDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWNonUniformZoneDefinition;
		 RWStepDimTol_RWNonUniformZoneDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NonUniformZoneDefinition

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_NonUniformZoneDefinition> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_NonUniformZoneDefinition> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NonUniformZoneDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_NonUniformZoneDefinition> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_NonUniformZoneDefinition> & ent);
};


%extend RWStepDimTol_RWNonUniformZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWParallelismTolerance;
class RWStepDimTol_RWParallelismTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWParallelismTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWParallelismTolerance;
		 RWStepDimTol_RWParallelismTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ParallelismTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ParallelismTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ParallelismTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_ParallelismTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_ParallelismTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ParallelismTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ParallelismTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ParallelismTolerance> & ent);
};


%extend RWStepDimTol_RWParallelismTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWPerpendicularityTolerance;
class RWStepDimTol_RWPerpendicularityTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWPerpendicularityTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWPerpendicularityTolerance;
		 RWStepDimTol_RWPerpendicularityTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PerpendicularityTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_PerpendicularityTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_PerpendicularityTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PerpendicularityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_PerpendicularityTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_PerpendicularityTolerance> & ent);
};


%extend RWStepDimTol_RWPerpendicularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWPlacedDatumTargetFeature;
class RWStepDimTol_RWPlacedDatumTargetFeature {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWPlacedDatumTargetFeature;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWPlacedDatumTargetFeature;
		 RWStepDimTol_RWPlacedDatumTargetFeature ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PlacedDatumTargetFeature

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_PlacedDatumTargetFeature> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_PlacedDatumTargetFeature> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PlacedDatumTargetFeature

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_PlacedDatumTargetFeature> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_PlacedDatumTargetFeature> & ent);
};


%extend RWStepDimTol_RWPlacedDatumTargetFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWPositionTolerance;
class RWStepDimTol_RWPositionTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWPositionTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWPositionTolerance;
		 RWStepDimTol_RWPositionTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PositionTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_PositionTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_PositionTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_PositionTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_PositionTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PositionTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_PositionTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_PositionTolerance> & ent);
};


%extend RWStepDimTol_RWPositionTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWProjectedZoneDefinition;
class RWStepDimTol_RWProjectedZoneDefinition {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWProjectedZoneDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWProjectedZoneDefinition;
		 RWStepDimTol_RWProjectedZoneDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ProjectedZoneDefinition

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ProjectedZoneDefinition> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_ProjectedZoneDefinition> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ProjectedZoneDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ProjectedZoneDefinition> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ProjectedZoneDefinition> & ent);
};


%extend RWStepDimTol_RWProjectedZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWRoundnessTolerance;
class RWStepDimTol_RWRoundnessTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWRoundnessTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWRoundnessTolerance;
		 RWStepDimTol_RWRoundnessTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads RoundnessTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_RoundnessTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_RoundnessTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_RoundnessTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_RoundnessTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes RoundnessTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_RoundnessTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_RoundnessTolerance> & ent);
};


%extend RWStepDimTol_RWRoundnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWRunoutZoneDefinition;
class RWStepDimTol_RWRunoutZoneDefinition {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWRunoutZoneDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWRunoutZoneDefinition;
		 RWStepDimTol_RWRunoutZoneDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads RunoutZoneDefinition

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_RunoutZoneDefinition> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_RunoutZoneDefinition> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes RunoutZoneDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_RunoutZoneDefinition> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_RunoutZoneDefinition> & ent);
};


%extend RWStepDimTol_RWRunoutZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWRunoutZoneOrientation;
class RWStepDimTol_RWRunoutZoneOrientation {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWRunoutZoneOrientation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWRunoutZoneOrientation;
		 RWStepDimTol_RWRunoutZoneOrientation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads RunoutZoneOrientation

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_RunoutZoneOrientation> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_RunoutZoneOrientation> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes RunoutZoneOrientation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_RunoutZoneOrientation> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_RunoutZoneOrientation> & ent);
};


%extend RWStepDimTol_RWRunoutZoneOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWStraightnessTolerance;
class RWStepDimTol_RWStraightnessTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWStraightnessTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWStraightnessTolerance;
		 RWStepDimTol_RWStraightnessTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads StraightnessTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_StraightnessTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_StraightnessTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_StraightnessTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_StraightnessTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes StraightnessTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_StraightnessTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_StraightnessTolerance> & ent);
};


%extend RWStepDimTol_RWStraightnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWSurfaceProfileTolerance;
class RWStepDimTol_RWSurfaceProfileTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWSurfaceProfileTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWSurfaceProfileTolerance;
		 RWStepDimTol_RWSurfaceProfileTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SurfaceProfileTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_SurfaceProfileTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_SurfaceProfileTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SurfaceProfileTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_SurfaceProfileTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_SurfaceProfileTolerance> & ent);
};


%extend RWStepDimTol_RWSurfaceProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWSymmetryTolerance;
class RWStepDimTol_RWSymmetryTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWSymmetryTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWSymmetryTolerance;
		 RWStepDimTol_RWSymmetryTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SymmetryTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_SymmetryTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_SymmetryTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_SymmetryTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_SymmetryTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SymmetryTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_SymmetryTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_SymmetryTolerance> & ent);
};


%extend RWStepDimTol_RWSymmetryTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWToleranceZone;
class RWStepDimTol_RWToleranceZone {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZone;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWToleranceZone;
		 RWStepDimTol_RWToleranceZone ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ToleranceZone

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZone> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ToleranceZone> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZone> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_ToleranceZone> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ToleranceZone

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZone> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ToleranceZone> & ent);
};


%extend RWStepDimTol_RWToleranceZone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWToleranceZoneDefinition;
class RWStepDimTol_RWToleranceZoneDefinition {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZoneDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWToleranceZoneDefinition;
		 RWStepDimTol_RWToleranceZoneDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ToleranceZoneDefinition

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZoneDefinition> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZoneDefinition> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ToleranceZoneDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZoneDefinition> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ToleranceZoneDefinition> & ent);
};


%extend RWStepDimTol_RWToleranceZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWToleranceZoneForm;
class RWStepDimTol_RWToleranceZoneForm {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWToleranceZoneForm;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWToleranceZoneForm;
		 RWStepDimTol_RWToleranceZoneForm ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ToleranceZoneForm

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZoneForm> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_ToleranceZoneForm> & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ToleranceZoneForm

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_ToleranceZoneForm> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_ToleranceZoneForm> & ent);
};


%extend RWStepDimTol_RWToleranceZoneForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWTotalRunoutTolerance;
class RWStepDimTol_RWTotalRunoutTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWTotalRunoutTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWTotalRunoutTolerance;
		 RWStepDimTol_RWTotalRunoutTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads TotalRunoutTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_TotalRunoutTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_TotalRunoutTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes TotalRunoutTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_TotalRunoutTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_TotalRunoutTolerance> & ent);
};


%extend RWStepDimTol_RWTotalRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
class RWStepDimTol_RWUnequallyDisposedGeometricTolerance {
	public:
		%feature("compactdefaultargs") RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepDimTol_RWUnequallyDisposedGeometricTolerance;
		 RWStepDimTol_RWUnequallyDisposedGeometricTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads UnequallyDisposedGeometricTolerance

	:param data:
	:type data: opencascade::handle<StepData_StepReaderData> &
	:param num:
	:type num: int
	:param ach:
	:type ach: opencascade::handle<Interface_Check> &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> &
	:rtype: None
") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes UnequallyDisposedGeometricTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & ent);
};


%extend RWStepDimTol_RWUnequallyDisposedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
