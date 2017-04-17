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
%module (package="OCC") RWStepAP214

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


%include RWStepAP214_headers.i


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

%rename(rwstepap214) RWStepAP214;
class RWStepAP214 {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* enforced the initialisation of the libraries

	:rtype: void
") Init;
		static void Init ();
};


%extend RWStepAP214 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_GeneralModule;
class RWStepAP214_GeneralModule : public StepData_GeneralModule {
	public:
		%feature("compactdefaultargs") RWStepAP214_GeneralModule;
		%feature("autodoc", "	* Creates a GeneralModule

	:rtype: None
") RWStepAP214_GeneralModule;
		 RWStepAP214_GeneralModule ();
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "	* Specific filling of the list of Entities shared by an Entity <ent>, according to a Case Number <CN> (provided by StepAP214 Protocol).

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") FillSharedCase;
		void FillSharedCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "	* Specific Checking of an Entity <ent>

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: None
") CheckCase;
		void CheckCase (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares,Handle_Interface_Check & ach);
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "	* Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. Use method Transferred from CopyTool to work

	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: None
") CopyCase;
		void CopyCase (const Standard_Integer CN,const Handle_Standard_Transient & entfrom,const Handle_Standard_Transient & entto,Interface_CopyTool & TC);
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") NewVoid;
		Standard_Boolean NewVoid (const Standard_Integer CN,Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shares:
	:type shares: Interface_ShareTool &
	:rtype: int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of a STEP Entity according to its type

	:param CN:
	:type CN: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param shares:
	:type shares: Interface_ShareTool &
	:rtype: Handle_TCollection_HAsciiString
") Name;
		virtual Handle_TCollection_HAsciiString Name (const Standard_Integer CN,const Handle_Standard_Transient & ent,const Interface_ShareTool & shares);
};


%extend RWStepAP214_GeneralModule {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_RWStepAP214_GeneralModule(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_RWStepAP214_GeneralModule::Handle_RWStepAP214_GeneralModule %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_RWStepAP214_GeneralModule;
class Handle_RWStepAP214_GeneralModule : public Handle_StepData_GeneralModule {

    public:
        // constructors
        Handle_RWStepAP214_GeneralModule();
        Handle_RWStepAP214_GeneralModule(const Handle_RWStepAP214_GeneralModule &aHandle);
        Handle_RWStepAP214_GeneralModule(const RWStepAP214_GeneralModule *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_RWStepAP214_GeneralModule DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_RWStepAP214_GeneralModule {
    RWStepAP214_GeneralModule* _get_reference() {
    return (RWStepAP214_GeneralModule*)$self->Access();
    }
};

%extend Handle_RWStepAP214_GeneralModule {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend RWStepAP214_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedApprovalAssignment;
class RWStepAP214_RWAppliedApprovalAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedApprovalAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedApprovalAssignment;
		 RWStepAP214_RWAppliedApprovalAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedApprovalAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedApprovalAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedApprovalAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedApprovalAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedApprovalAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedApprovalAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedDateAndTimeAssignment;
class RWStepAP214_RWAppliedDateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDateAndTimeAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedDateAndTimeAssignment;
		 RWStepAP214_RWAppliedDateAndTimeAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedDateAndTimeAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedDateAndTimeAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedDateAndTimeAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedDateAndTimeAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedDateAssignment;
class RWStepAP214_RWAppliedDateAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDateAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedDateAssignment;
		 RWStepAP214_RWAppliedDateAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedDateAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedDateAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedDateAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedDateAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedDateAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedDateAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedDocumentReference;
class RWStepAP214_RWAppliedDocumentReference {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDocumentReference;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedDocumentReference;
		 RWStepAP214_RWAppliedDocumentReference ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedDocumentReference &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedDocumentReference & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedDocumentReference &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedDocumentReference & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedDocumentReference &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedDocumentReference & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedExternalIdentificationAssignment;
class RWStepAP214_RWAppliedExternalIdentificationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedExternalIdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP214_RWAppliedExternalIdentificationAssignment;
		 RWStepAP214_RWAppliedExternalIdentificationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AppliedExternalIdentificationAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedExternalIdentificationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedExternalIdentificationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AppliedExternalIdentificationAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedExternalIdentificationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedExternalIdentificationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP214_AppliedExternalIdentificationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedExternalIdentificationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedGroupAssignment;
class RWStepAP214_RWAppliedGroupAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedGroupAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP214_RWAppliedGroupAssignment;
		 RWStepAP214_RWAppliedGroupAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AppliedGroupAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedGroupAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedGroupAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AppliedGroupAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedGroupAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedGroupAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP214_AppliedGroupAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedGroupAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedOrganizationAssignment;
class RWStepAP214_RWAppliedOrganizationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedOrganizationAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedOrganizationAssignment;
		 RWStepAP214_RWAppliedOrganizationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedOrganizationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedOrganizationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedOrganizationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedOrganizationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedOrganizationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedOrganizationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedPersonAndOrganizationAssignment;
class RWStepAP214_RWAppliedPersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedPersonAndOrganizationAssignment;
		 RWStepAP214_RWAppliedPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedPersonAndOrganizationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedPersonAndOrganizationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedPersonAndOrganizationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedPersonAndOrganizationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedPersonAndOrganizationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedPersonAndOrganizationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedPresentedItem;
class RWStepAP214_RWAppliedPresentedItem {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedPresentedItem;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedPresentedItem;
		 RWStepAP214_RWAppliedPresentedItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedPresentedItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedPresentedItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedPresentedItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedPresentedItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedPresentedItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedPresentedItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAppliedSecurityClassificationAssignment;
class RWStepAP214_RWAppliedSecurityClassificationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAppliedSecurityClassificationAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAppliedSecurityClassificationAssignment;
		 RWStepAP214_RWAppliedSecurityClassificationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AppliedSecurityClassificationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AppliedSecurityClassificationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AppliedSecurityClassificationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AppliedSecurityClassificationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AppliedSecurityClassificationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AppliedSecurityClassificationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAppliedSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignActualDateAndTimeAssignment;
class RWStepAP214_RWAutoDesignActualDateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignActualDateAndTimeAssignment;
		 RWStepAP214_RWAutoDesignActualDateAndTimeAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignActualDateAndTimeAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignActualDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignActualDateAndTimeAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignActualDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignActualDateAndTimeAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignActualDateAndTimeAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignActualDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignActualDateAssignment;
class RWStepAP214_RWAutoDesignActualDateAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignActualDateAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignActualDateAssignment;
		 RWStepAP214_RWAutoDesignActualDateAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignActualDateAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignActualDateAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignActualDateAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignActualDateAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignActualDateAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignActualDateAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignActualDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignApprovalAssignment;
class RWStepAP214_RWAutoDesignApprovalAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignApprovalAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignApprovalAssignment;
		 RWStepAP214_RWAutoDesignApprovalAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignApprovalAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignApprovalAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignApprovalAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignApprovalAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignApprovalAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignApprovalAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignDateAndPersonAssignment;
class RWStepAP214_RWAutoDesignDateAndPersonAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignDateAndPersonAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignDateAndPersonAssignment;
		 RWStepAP214_RWAutoDesignDateAndPersonAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignDateAndPersonAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignDateAndPersonAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignDateAndPersonAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignDateAndPersonAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignDateAndPersonAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignDateAndPersonAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignDateAndPersonAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignDocumentReference;
class RWStepAP214_RWAutoDesignDocumentReference {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignDocumentReference;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignDocumentReference;
		 RWStepAP214_RWAutoDesignDocumentReference ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignDocumentReference &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignDocumentReference & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignDocumentReference &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignDocumentReference & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignDocumentReference &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignDocumentReference & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignGroupAssignment;
class RWStepAP214_RWAutoDesignGroupAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignGroupAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignGroupAssignment;
		 RWStepAP214_RWAutoDesignGroupAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignGroupAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignGroupAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignGroupAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignGroupAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignGroupAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignGroupAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment;
class RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment;
		 RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignNominalDateAssignment;
class RWStepAP214_RWAutoDesignNominalDateAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignNominalDateAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignNominalDateAssignment;
		 RWStepAP214_RWAutoDesignNominalDateAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignNominalDateAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignNominalDateAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignNominalDateAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignNominalDateAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignNominalDateAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignNominalDateAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignNominalDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignOrganizationAssignment;
class RWStepAP214_RWAutoDesignOrganizationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignOrganizationAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignOrganizationAssignment;
		 RWStepAP214_RWAutoDesignOrganizationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignOrganizationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignOrganizationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignOrganizationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignOrganizationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignOrganizationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignOrganizationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment;
class RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment;
		 RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignPresentedItem;
class RWStepAP214_RWAutoDesignPresentedItem {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignPresentedItem;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignPresentedItem;
		 RWStepAP214_RWAutoDesignPresentedItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignPresentedItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignPresentedItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignPresentedItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignPresentedItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignPresentedItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignPresentedItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWAutoDesignSecurityClassificationAssignment;
class RWStepAP214_RWAutoDesignSecurityClassificationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_RWAutoDesignSecurityClassificationAssignment;
		 RWStepAP214_RWAutoDesignSecurityClassificationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignSecurityClassificationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_AutoDesignSecurityClassificationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_AutoDesignSecurityClassificationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_AutoDesignSecurityClassificationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepAP214_AutoDesignSecurityClassificationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_AutoDesignSecurityClassificationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWAutoDesignSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWClass;
class RWStepAP214_RWClass {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWClass;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP214_RWClass;
		 RWStepAP214_RWClass ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Class

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_Class &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_Class & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Class

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_Class &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_Class & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP214_Class &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_Class & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWClass {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWExternallyDefinedClass;
class RWStepAP214_RWExternallyDefinedClass {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWExternallyDefinedClass;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP214_RWExternallyDefinedClass;
		 RWStepAP214_RWExternallyDefinedClass ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ExternallyDefinedClass

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_ExternallyDefinedClass &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_ExternallyDefinedClass & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ExternallyDefinedClass

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_ExternallyDefinedClass &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_ExternallyDefinedClass & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP214_ExternallyDefinedClass &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_ExternallyDefinedClass & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWExternallyDefinedClass {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWExternallyDefinedGeneralProperty;
class RWStepAP214_RWExternallyDefinedGeneralProperty {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWExternallyDefinedGeneralProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP214_RWExternallyDefinedGeneralProperty;
		 RWStepAP214_RWExternallyDefinedGeneralProperty ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ExternallyDefinedGeneralProperty

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_ExternallyDefinedGeneralProperty &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_ExternallyDefinedGeneralProperty & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ExternallyDefinedGeneralProperty

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_ExternallyDefinedGeneralProperty &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_ExternallyDefinedGeneralProperty & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP214_ExternallyDefinedGeneralProperty &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_ExternallyDefinedGeneralProperty & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWExternallyDefinedGeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_RWRepItemGroup;
class RWStepAP214_RWRepItemGroup {
	public:
		%feature("compactdefaultargs") RWStepAP214_RWRepItemGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP214_RWRepItemGroup;
		 RWStepAP214_RWRepItemGroup ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads RepItemGroup

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP214_RepItemGroup &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP214_RepItemGroup & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes RepItemGroup

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP214_RepItemGroup &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP214_RepItemGroup & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP214_RepItemGroup &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP214_RepItemGroup & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP214_RWRepItemGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP214_ReadWriteModule;
class RWStepAP214_ReadWriteModule : public StepData_ReadWriteModule {
	public:
		%feature("compactdefaultargs") RWStepAP214_ReadWriteModule;
		%feature("autodoc", "	:rtype: None
") RWStepAP214_ReadWriteModule;
		 RWStepAP214_ReadWriteModule ();
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "	* associates a positive Case Number to each type of StepAP214 entity, given as a String defined in the EXPRESS form

	:param atype:
	:type atype: TCollection_AsciiString &
	:rtype: int
") CaseStep;
		Standard_Integer CaseStep (const TCollection_AsciiString & atype);
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "	* associates a positive Case Number to each type of StepAP214 Complex entity, given as a String defined in the EXPRESS form

	:param types:
	:type types: TColStd_SequenceOfAsciiString &
	:rtype: int
") CaseStep;
		virtual Standard_Integer CaseStep (const TColStd_SequenceOfAsciiString & types);
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "	* returns True if the Case Number corresponds to a Complex Type

	:param CN:
	:type CN: int
	:rtype: bool
") IsComplex;
		virtual Standard_Boolean IsComplex (const Standard_Integer CN);
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "	* returns a StepType (defined in EXPRESS form which belongs to a Type of Entity, identified by its CaseNumber determined by Protocol

	:param CN:
	:type CN: int
	:rtype: TCollection_AsciiString
") StepType;
		const TCollection_AsciiString & StepType (const Standard_Integer CN);
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "	:param CN:
	:type CN: int
	:param types:
	:type types: TColStd_SequenceOfAsciiString &
	:rtype: bool
") ComplexType;
		virtual Standard_Boolean ComplexType (const Standard_Integer CN,TColStd_SequenceOfAsciiString & types);
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param CN:
	:type CN: int
	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") ReadStep;
		void ReadStep (const Standard_Integer CN,const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param CN:
	:type CN: int
	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") WriteStep;
		void WriteStep (const Standard_Integer CN,StepData_StepWriter & SW,const Handle_Standard_Transient & ent);
};


%extend RWStepAP214_ReadWriteModule {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_RWStepAP214_ReadWriteModule(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_RWStepAP214_ReadWriteModule::Handle_RWStepAP214_ReadWriteModule %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_RWStepAP214_ReadWriteModule;
class Handle_RWStepAP214_ReadWriteModule : public Handle_StepData_ReadWriteModule {

    public:
        // constructors
        Handle_RWStepAP214_ReadWriteModule();
        Handle_RWStepAP214_ReadWriteModule(const Handle_RWStepAP214_ReadWriteModule &aHandle);
        Handle_RWStepAP214_ReadWriteModule(const RWStepAP214_ReadWriteModule *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_RWStepAP214_ReadWriteModule DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_RWStepAP214_ReadWriteModule {
    RWStepAP214_ReadWriteModule* _get_reference() {
    return (RWStepAP214_ReadWriteModule*)$self->Access();
    }
};

%extend Handle_RWStepAP214_ReadWriteModule {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend RWStepAP214_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
