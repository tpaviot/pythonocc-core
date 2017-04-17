/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") RWStepDimTol

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include RWStepDimTol_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_AngularityTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_AngularityTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AngularityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_AngularityTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_AngularityTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_AngularityTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_AngularityTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_CircularRunoutTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_CircularRunoutTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CircularRunoutTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_CircularRunoutTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_CircularRunoutTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_CircularRunoutTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_CircularRunoutTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_CoaxialityTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_CoaxialityTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CoaxialityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_CoaxialityTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_CoaxialityTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_CoaxialityTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_CoaxialityTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_CommonDatum &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_CommonDatum & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CommonDatum

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_CommonDatum &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_CommonDatum & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_CommonDatum &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_CommonDatum & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_ConcentricityTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_ConcentricityTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConcentricityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_ConcentricityTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_ConcentricityTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_ConcentricityTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_ConcentricityTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_CylindricityTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_CylindricityTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CylindricityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_CylindricityTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_CylindricityTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_CylindricityTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_CylindricityTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_Datum &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_Datum & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Datum

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_Datum &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_Datum & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_Datum &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_Datum & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_DatumFeature &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_DatumFeature & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumFeature

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_DatumFeature &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_DatumFeature & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_DatumFeature &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_DatumFeature & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_DatumReference &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_DatumReference & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumReference

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_DatumReference &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_DatumReference & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_DatumReference &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_DatumReference & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWDatumReference {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_DatumTarget &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_DatumTarget & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DatumTarget

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_DatumTarget &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_DatumTarget & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_DatumTarget &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_DatumTarget & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_FlatnessTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_FlatnessTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FlatnessTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_FlatnessTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_FlatnessTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_FlatnessTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_FlatnessTolerance & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWFlatnessTolerance {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWGeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_GeometricTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_GeometricTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_GeometricTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_GeometricTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_GeometricTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_GeometricTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_GeometricToleranceRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_GeometricToleranceRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_GeometricToleranceRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_GeometricToleranceRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_GeometricToleranceRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_GeometricToleranceRelationship & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_GeometricToleranceWithDatumReference &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_GeometricToleranceWithDatumReference & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricToleranceWithDatumReference

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_GeometricToleranceWithDatumReference &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_GeometricToleranceWithDatumReference & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_GeometricToleranceWithDatumReference &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_GeometricToleranceWithDatumReference & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWGeometricToleranceWithDatumReference {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_LineProfileTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_LineProfileTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes LineProfileTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_LineProfileTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_LineProfileTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_LineProfileTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_LineProfileTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_ModifiedGeometricTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_ModifiedGeometricTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ModifiedGeometricTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_ModifiedGeometricTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_ModifiedGeometricTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_ModifiedGeometricTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_ModifiedGeometricTolerance & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWModifiedGeometricTolerance {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_ParallelismTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_ParallelismTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ParallelismTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_ParallelismTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_ParallelismTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_ParallelismTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_ParallelismTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_PerpendicularityTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_PerpendicularityTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PerpendicularityTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_PerpendicularityTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_PerpendicularityTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_PerpendicularityTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_PerpendicularityTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_PlacedDatumTargetFeature &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_PlacedDatumTargetFeature & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PlacedDatumTargetFeature

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_PlacedDatumTargetFeature &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_PlacedDatumTargetFeature & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_PlacedDatumTargetFeature &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_PlacedDatumTargetFeature & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_PositionTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_PositionTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PositionTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_PositionTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_PositionTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_PositionTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_PositionTolerance & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWPositionTolerance {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_RoundnessTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_RoundnessTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes RoundnessTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_RoundnessTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_RoundnessTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_RoundnessTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_RoundnessTolerance & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWRoundnessTolerance {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_StraightnessTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_StraightnessTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes StraightnessTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_StraightnessTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_StraightnessTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_StraightnessTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_StraightnessTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_SurfaceProfileTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_SurfaceProfileTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SurfaceProfileTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_SurfaceProfileTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_SurfaceProfileTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_SurfaceProfileTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_SurfaceProfileTolerance & ent,Interface_EntityIterator & iter);
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_SymmetryTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_SymmetryTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SymmetryTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_SymmetryTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_SymmetryTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_SymmetryTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_SymmetryTolerance & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWSymmetryTolerance {
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
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepDimTol_TotalRunoutTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepDimTol_TotalRunoutTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes TotalRunoutTolerance

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepDimTol_TotalRunoutTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepDimTol_TotalRunoutTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepDimTol_TotalRunoutTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepDimTol_TotalRunoutTolerance & ent,Interface_EntityIterator & iter);
};


%extend RWStepDimTol_RWTotalRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
