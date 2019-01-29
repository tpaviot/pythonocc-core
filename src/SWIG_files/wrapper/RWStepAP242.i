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
%define RWSTEPAP242DOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=RWSTEPAP242DOCSTRING) RWStepAP242

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


%include RWStepAP242_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%nodefaultctor RWStepAP242_RWDraughtingModelItemAssociation;
class RWStepAP242_RWDraughtingModelItemAssociation {
	public:
		%feature("compactdefaultargs") RWStepAP242_RWDraughtingModelItemAssociation;
		%feature("autodoc", "	:rtype: None
") RWStepAP242_RWDraughtingModelItemAssociation;
		 RWStepAP242_RWDraughtingModelItemAssociation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP242_DraughtingModelItemAssociation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP242_DraughtingModelItemAssociation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP242_DraughtingModelItemAssociation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP242_DraughtingModelItemAssociation & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP242_DraughtingModelItemAssociation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP242_DraughtingModelItemAssociation & ent);
};


%extend RWStepAP242_RWDraughtingModelItemAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP242_RWGeometricItemSpecificUsage;
class RWStepAP242_RWGeometricItemSpecificUsage {
	public:
		%feature("compactdefaultargs") RWStepAP242_RWGeometricItemSpecificUsage;
		%feature("autodoc", "	:rtype: None
") RWStepAP242_RWGeometricItemSpecificUsage;
		 RWStepAP242_RWGeometricItemSpecificUsage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP242_GeometricItemSpecificUsage &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP242_GeometricItemSpecificUsage & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP242_GeometricItemSpecificUsage &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP242_GeometricItemSpecificUsage & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP242_GeometricItemSpecificUsage &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP242_GeometricItemSpecificUsage & ent);
};


%extend RWStepAP242_RWGeometricItemSpecificUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP242_RWIdAttribute;
class RWStepAP242_RWIdAttribute {
	public:
		%feature("compactdefaultargs") RWStepAP242_RWIdAttribute;
		%feature("autodoc", "	:rtype: None
") RWStepAP242_RWIdAttribute;
		 RWStepAP242_RWIdAttribute ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP242_IdAttribute &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP242_IdAttribute & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP242_IdAttribute &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP242_IdAttribute & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP242_IdAttribute &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP242_IdAttribute & ent);
};


%extend RWStepAP242_RWIdAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP242_RWItemIdentifiedRepresentationUsage;
class RWStepAP242_RWItemIdentifiedRepresentationUsage {
	public:
		%feature("compactdefaultargs") RWStepAP242_RWItemIdentifiedRepresentationUsage;
		%feature("autodoc", "	:rtype: None
") RWStepAP242_RWItemIdentifiedRepresentationUsage;
		 RWStepAP242_RWItemIdentifiedRepresentationUsage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP242_ItemIdentifiedRepresentationUsage &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP242_ItemIdentifiedRepresentationUsage & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP242_ItemIdentifiedRepresentationUsage &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP242_ItemIdentifiedRepresentationUsage & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP242_ItemIdentifiedRepresentationUsage &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP242_ItemIdentifiedRepresentationUsage & ent);
};


%extend RWStepAP242_RWItemIdentifiedRepresentationUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
