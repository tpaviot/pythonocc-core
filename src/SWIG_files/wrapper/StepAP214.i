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
%module (package="OCC") StepAP214

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


%include StepAP214_headers.i


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

%rename(stepap214) StepAP214;
class StepAP214 {
	public:
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* creates a Protocol

	:rtype: Handle_StepAP214_Protocol
") Protocol;
		static Handle_StepAP214_Protocol Protocol ();
};


%extend StepAP214 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedApprovalAssignment;
class StepAP214_AppliedApprovalAssignment : public StepBasic_ApprovalAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedApprovalAssignment;
		%feature("autodoc", "	* Returns a AppliedApprovalAssignment

	:rtype: None
") StepAP214_AppliedApprovalAssignment;
		 StepAP214_AppliedApprovalAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Approval & aAssignedApproval);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfApprovalItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Approval & aAssignedApproval,const Handle_StepAP214_HArray1OfApprovalItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfApprovalItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfApprovalItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfApprovalItem
") Items;
		Handle_StepAP214_HArray1OfApprovalItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_ApprovalItem
") ItemsValue;
		StepAP214_ApprovalItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedApprovalAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedApprovalAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedApprovalAssignment::Handle_StepAP214_AppliedApprovalAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedApprovalAssignment;
class Handle_StepAP214_AppliedApprovalAssignment : public Handle_StepBasic_ApprovalAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedApprovalAssignment();
        Handle_StepAP214_AppliedApprovalAssignment(const Handle_StepAP214_AppliedApprovalAssignment &aHandle);
        Handle_StepAP214_AppliedApprovalAssignment(const StepAP214_AppliedApprovalAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedApprovalAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedApprovalAssignment {
    StepAP214_AppliedApprovalAssignment* _get_reference() {
    return (StepAP214_AppliedApprovalAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedApprovalAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedDateAndTimeAssignment;
class StepAP214_AppliedDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedDateAndTimeAssignment;
		%feature("autodoc", "	* Returns a AppliedDateAndTimeAssignment

	:rtype: None
") StepAP214_AppliedDateAndTimeAssignment;
		 StepAP214_AppliedDateAndTimeAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateAndTimeItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole,const Handle_StepAP214_HArray1OfDateAndTimeItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateAndTimeItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfDateAndTimeItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfDateAndTimeItem
") Items;
		Handle_StepAP214_HArray1OfDateAndTimeItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_DateAndTimeItem
") ItemsValue;
		StepAP214_DateAndTimeItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedDateAndTimeAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedDateAndTimeAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedDateAndTimeAssignment::Handle_StepAP214_AppliedDateAndTimeAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedDateAndTimeAssignment;
class Handle_StepAP214_AppliedDateAndTimeAssignment : public Handle_StepBasic_DateAndTimeAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedDateAndTimeAssignment();
        Handle_StepAP214_AppliedDateAndTimeAssignment(const Handle_StepAP214_AppliedDateAndTimeAssignment &aHandle);
        Handle_StepAP214_AppliedDateAndTimeAssignment(const StepAP214_AppliedDateAndTimeAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedDateAndTimeAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedDateAndTimeAssignment {
    StepAP214_AppliedDateAndTimeAssignment* _get_reference() {
    return (StepAP214_AppliedDateAndTimeAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedDateAndTimeAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedDateAssignment;
class StepAP214_AppliedDateAssignment : public StepBasic_DateAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedDateAssignment;
		%feature("autodoc", "	* Returns a AppliedDateAssignment

	:rtype: None
") StepAP214_AppliedDateAssignment;
		 StepAP214_AppliedDateAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole,const Handle_StepAP214_HArray1OfDateItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfDateItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfDateItem
") Items;
		Handle_StepAP214_HArray1OfDateItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_DateItem
") ItemsValue;
		StepAP214_DateItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedDateAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedDateAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedDateAssignment::Handle_StepAP214_AppliedDateAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedDateAssignment;
class Handle_StepAP214_AppliedDateAssignment : public Handle_StepBasic_DateAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedDateAssignment();
        Handle_StepAP214_AppliedDateAssignment(const Handle_StepAP214_AppliedDateAssignment &aHandle);
        Handle_StepAP214_AppliedDateAssignment(const StepAP214_AppliedDateAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedDateAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedDateAssignment {
    StepAP214_AppliedDateAssignment* _get_reference() {
    return (StepAP214_AppliedDateAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedDateAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedDocumentReference;
class StepAP214_AppliedDocumentReference : public StepBasic_DocumentReference {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedDocumentReference;
		%feature("autodoc", "	:rtype: None
") StepAP214_AppliedDocumentReference;
		 StepAP214_AppliedDocumentReference ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDocument:
	:type aAssignedDocument: Handle_StepBasic_Document &
	:param aSource:
	:type aSource: Handle_TCollection_HAsciiString &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDocumentReferenceItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Document & aAssignedDocument,const Handle_TCollection_HAsciiString & aSource,const Handle_StepAP214_HArray1OfDocumentReferenceItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfDocumentReferenceItem
") Items;
		Handle_StepAP214_HArray1OfDocumentReferenceItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDocumentReferenceItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfDocumentReferenceItem & aItems);
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_DocumentReferenceItem
") ItemsValue;
		StepAP214_DocumentReferenceItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedDocumentReference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedDocumentReference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedDocumentReference::Handle_StepAP214_AppliedDocumentReference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedDocumentReference;
class Handle_StepAP214_AppliedDocumentReference : public Handle_StepBasic_DocumentReference {

    public:
        // constructors
        Handle_StepAP214_AppliedDocumentReference();
        Handle_StepAP214_AppliedDocumentReference(const Handle_StepAP214_AppliedDocumentReference &aHandle);
        Handle_StepAP214_AppliedDocumentReference(const StepAP214_AppliedDocumentReference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedDocumentReference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedDocumentReference {
    StepAP214_AppliedDocumentReference* _get_reference() {
    return (StepAP214_AppliedDocumentReference*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedDocumentReference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedExternalIdentificationAssignment;
class StepAP214_AppliedExternalIdentificationAssignment : public StepBasic_ExternalIdentificationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedExternalIdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_AppliedExternalIdentificationAssignment;
		 StepAP214_AppliedExternalIdentificationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aIdentificationAssignment_AssignedId:
	:type aIdentificationAssignment_AssignedId: Handle_TCollection_HAsciiString &
	:param aIdentificationAssignment_Role:
	:type aIdentificationAssignment_Role: Handle_StepBasic_IdentificationRole &
	:param aExternalIdentificationAssignment_Source:
	:type aExternalIdentificationAssignment_Source: Handle_StepBasic_ExternalSource &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfExternalIdentificationItem &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aIdentificationAssignment_AssignedId,const Handle_StepBasic_IdentificationRole & aIdentificationAssignment_Role,const Handle_StepBasic_ExternalSource & aExternalIdentificationAssignment_Source,const Handle_StepAP214_HArray1OfExternalIdentificationItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP214_HArray1OfExternalIdentificationItem
") Items;
		Handle_StepAP214_HArray1OfExternalIdentificationItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP214_HArray1OfExternalIdentificationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfExternalIdentificationItem & Items);
};


%extend StepAP214_AppliedExternalIdentificationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedExternalIdentificationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedExternalIdentificationAssignment::Handle_StepAP214_AppliedExternalIdentificationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedExternalIdentificationAssignment;
class Handle_StepAP214_AppliedExternalIdentificationAssignment : public Handle_StepBasic_ExternalIdentificationAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedExternalIdentificationAssignment();
        Handle_StepAP214_AppliedExternalIdentificationAssignment(const Handle_StepAP214_AppliedExternalIdentificationAssignment &aHandle);
        Handle_StepAP214_AppliedExternalIdentificationAssignment(const StepAP214_AppliedExternalIdentificationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedExternalIdentificationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedExternalIdentificationAssignment {
    StepAP214_AppliedExternalIdentificationAssignment* _get_reference() {
    return (StepAP214_AppliedExternalIdentificationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedExternalIdentificationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedGroupAssignment;
class StepAP214_AppliedGroupAssignment : public StepBasic_GroupAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedGroupAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_AppliedGroupAssignment;
		 StepAP214_AppliedGroupAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGroupAssignment_AssignedGroup:
	:type aGroupAssignment_AssignedGroup: Handle_StepBasic_Group &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfGroupItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Group & aGroupAssignment_AssignedGroup,const Handle_StepAP214_HArray1OfGroupItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP214_HArray1OfGroupItem
") Items;
		Handle_StepAP214_HArray1OfGroupItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP214_HArray1OfGroupItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfGroupItem & Items);
};


%extend StepAP214_AppliedGroupAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedGroupAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedGroupAssignment::Handle_StepAP214_AppliedGroupAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedGroupAssignment;
class Handle_StepAP214_AppliedGroupAssignment : public Handle_StepBasic_GroupAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedGroupAssignment();
        Handle_StepAP214_AppliedGroupAssignment(const Handle_StepAP214_AppliedGroupAssignment &aHandle);
        Handle_StepAP214_AppliedGroupAssignment(const StepAP214_AppliedGroupAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedGroupAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedGroupAssignment {
    StepAP214_AppliedGroupAssignment* _get_reference() {
    return (StepAP214_AppliedGroupAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedGroupAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedOrganizationAssignment;
class StepAP214_AppliedOrganizationAssignment : public StepBasic_OrganizationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedOrganizationAssignment;
		%feature("autodoc", "	* Returns a AppliedOrganizationAssignment

	:rtype: None
") StepAP214_AppliedOrganizationAssignment;
		 StepAP214_AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Organization & aAssignedOrganization,const Handle_StepBasic_OrganizationRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfOrganizationItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Organization & aAssignedOrganization,const Handle_StepBasic_OrganizationRole & aRole,const Handle_StepAP214_HArray1OfOrganizationItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfOrganizationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfOrganizationItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfOrganizationItem
") Items;
		Handle_StepAP214_HArray1OfOrganizationItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_OrganizationItem
") ItemsValue;
		StepAP214_OrganizationItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedOrganizationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedOrganizationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedOrganizationAssignment::Handle_StepAP214_AppliedOrganizationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedOrganizationAssignment;
class Handle_StepAP214_AppliedOrganizationAssignment : public Handle_StepBasic_OrganizationAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedOrganizationAssignment();
        Handle_StepAP214_AppliedOrganizationAssignment(const Handle_StepAP214_AppliedOrganizationAssignment &aHandle);
        Handle_StepAP214_AppliedOrganizationAssignment(const StepAP214_AppliedOrganizationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedOrganizationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedOrganizationAssignment {
    StepAP214_AppliedOrganizationAssignment* _get_reference() {
    return (StepAP214_AppliedOrganizationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedOrganizationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedPersonAndOrganizationAssignment;
class StepAP214_AppliedPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignDateAndPersonAssignment

	:rtype: None
") StepAP214_AppliedPersonAndOrganizationAssignment;
		 StepAP214_AppliedPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPersonAndOrganizationItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole,const Handle_StepAP214_HArray1OfPersonAndOrganizationItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPersonAndOrganizationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfPersonAndOrganizationItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfPersonAndOrganizationItem
") Items;
		Handle_StepAP214_HArray1OfPersonAndOrganizationItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_PersonAndOrganizationItem
") ItemsValue;
		StepAP214_PersonAndOrganizationItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedPersonAndOrganizationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedPersonAndOrganizationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedPersonAndOrganizationAssignment::Handle_StepAP214_AppliedPersonAndOrganizationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedPersonAndOrganizationAssignment;
class Handle_StepAP214_AppliedPersonAndOrganizationAssignment : public Handle_StepBasic_PersonAndOrganizationAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedPersonAndOrganizationAssignment();
        Handle_StepAP214_AppliedPersonAndOrganizationAssignment(const Handle_StepAP214_AppliedPersonAndOrganizationAssignment &aHandle);
        Handle_StepAP214_AppliedPersonAndOrganizationAssignment(const StepAP214_AppliedPersonAndOrganizationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedPersonAndOrganizationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedPersonAndOrganizationAssignment {
    StepAP214_AppliedPersonAndOrganizationAssignment* _get_reference() {
    return (StepAP214_AppliedPersonAndOrganizationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedPersonAndOrganizationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedPresentedItem;
class StepAP214_AppliedPresentedItem : public StepVisual_PresentedItem {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedPresentedItem;
		%feature("autodoc", "	* Returns a AutoDesignPresentedItem

	:rtype: None
") StepAP214_AppliedPresentedItem;
		 StepAP214_AppliedPresentedItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPresentedItemSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepAP214_HArray1OfPresentedItemSelect & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPresentedItemSelect &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfPresentedItemSelect & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfPresentedItemSelect
") Items;
		Handle_StepAP214_HArray1OfPresentedItemSelect Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_PresentedItemSelect
") ItemsValue;
		StepAP214_PresentedItemSelect ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedPresentedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedPresentedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedPresentedItem::Handle_StepAP214_AppliedPresentedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedPresentedItem;
class Handle_StepAP214_AppliedPresentedItem : public Handle_StepVisual_PresentedItem {

    public:
        // constructors
        Handle_StepAP214_AppliedPresentedItem();
        Handle_StepAP214_AppliedPresentedItem(const Handle_StepAP214_AppliedPresentedItem &aHandle);
        Handle_StepAP214_AppliedPresentedItem(const StepAP214_AppliedPresentedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedPresentedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedPresentedItem {
    StepAP214_AppliedPresentedItem* _get_reference() {
    return (StepAP214_AppliedPresentedItem*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedPresentedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedSecurityClassificationAssignment;
class StepAP214_AppliedSecurityClassificationAssignment : public StepBasic_SecurityClassificationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AppliedSecurityClassificationAssignment;
		%feature("autodoc", "	* Returns a AppliedSecurityClassificationAssignment

	:rtype: None
") StepAP214_AppliedSecurityClassificationAssignment;
		 StepAP214_AppliedSecurityClassificationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfSecurityClassificationItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification,const Handle_StepAP214_HArray1OfSecurityClassificationItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfSecurityClassificationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfSecurityClassificationItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfSecurityClassificationItem
") Items;
		Handle_StepAP214_HArray1OfSecurityClassificationItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_SecurityClassificationItem
") ItemsValue;
		const StepAP214_SecurityClassificationItem & ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AppliedSecurityClassificationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AppliedSecurityClassificationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AppliedSecurityClassificationAssignment::Handle_StepAP214_AppliedSecurityClassificationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AppliedSecurityClassificationAssignment;
class Handle_StepAP214_AppliedSecurityClassificationAssignment : public Handle_StepBasic_SecurityClassificationAssignment {

    public:
        // constructors
        Handle_StepAP214_AppliedSecurityClassificationAssignment();
        Handle_StepAP214_AppliedSecurityClassificationAssignment(const Handle_StepAP214_AppliedSecurityClassificationAssignment &aHandle);
        Handle_StepAP214_AppliedSecurityClassificationAssignment(const StepAP214_AppliedSecurityClassificationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AppliedSecurityClassificationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AppliedSecurityClassificationAssignment {
    StepAP214_AppliedSecurityClassificationAssignment* _get_reference() {
    return (StepAP214_AppliedSecurityClassificationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AppliedSecurityClassificationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AppliedSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ApprovalItem;
class StepAP214_ApprovalItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_ApprovalItem;
		%feature("autodoc", "	* Returns a ApprovalItem SelectType

	:rtype: None
") StepAP214_ApprovalItem;
		 StepAP214_ApprovalItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a ApprovalItem Kind Entity that is : 1 -> AssemblyComponentUsageSubstitute 2 -> DocumentFile 3 -> MaterialDesignation 4 -> MechanicalDesignGeometricPresentationRepresentation 5 -> PresentationArea 6 -> Product 7 -> ProductDefinition 8 -> ProductDefinitionFormation 9 -> ProductDefinitionRelationship 10 -> PropertyDefinition 11 -> ShapeRepresentation 12 -> SecurityClassification 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AssemblyComponentUsageSubstitute;
		%feature("autodoc", "	* returns Value as a AssemblyComponentUsageSubstitute (Null if another type)

	:rtype: Handle_StepRepr_AssemblyComponentUsageSubstitute
") AssemblyComponentUsageSubstitute;
		virtual Handle_StepRepr_AssemblyComponentUsageSubstitute AssemblyComponentUsageSubstitute ();
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "	* returns Value as a DocumentFile (Null if another type)

	:rtype: Handle_StepBasic_DocumentFile
") DocumentFile;
		virtual Handle_StepBasic_DocumentFile DocumentFile ();
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "	* returns Value as a MaterialDesignation (Null if another type)

	:rtype: Handle_StepRepr_MaterialDesignation
") MaterialDesignation;
		virtual Handle_StepRepr_MaterialDesignation MaterialDesignation ();
		%feature("compactdefaultargs") MechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "	* returns Value as a MechanicalDesignGeometricPresentationRepresentation (Null if another type)

	:rtype: Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation
") MechanicalDesignGeometricPresentationRepresentation;
		virtual Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation MechanicalDesignGeometricPresentationRepresentation ();
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "	* returns Value as a PresentationArea (Null if another type)

	:rtype: Handle_StepVisual_PresentationArea
") PresentationArea;
		virtual Handle_StepVisual_PresentationArea PresentationArea ();
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	* returns Value as a Product (Null if another type)

	:rtype: Handle_StepBasic_Product
") Product;
		virtual Handle_StepBasic_Product Product ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		virtual Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* returns Value as a ProductDefinitionFormation (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		virtual Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* returns Value as aProductDefinitionRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		virtual Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "	* returns Value as a PropertyDefinition (Null if another type)

	:rtype: Handle_StepRepr_PropertyDefinition
") PropertyDefinition;
		virtual Handle_StepRepr_PropertyDefinition PropertyDefinition ();
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "	* returns Value as a ShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_ShapeRepresentation
") ShapeRepresentation;
		virtual Handle_StepShape_ShapeRepresentation ShapeRepresentation ();
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "	* returns Value as a SecurityClassification (Null if another type)

	:rtype: Handle_StepBasic_SecurityClassification
") SecurityClassification;
		virtual Handle_StepBasic_SecurityClassification SecurityClassification ();
};


%extend StepAP214_ApprovalItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfApprovalItem;
class StepAP214_Array1OfApprovalItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfApprovalItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfApprovalItem;
		 StepAP214_Array1OfApprovalItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfApprovalItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_ApprovalItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfApprovalItem;
		 StepAP214_Array1OfApprovalItem (const StepAP214_ApprovalItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_ApprovalItem &
	:rtype: None
") Init;
		void Init (const StepAP214_ApprovalItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfApprovalItem &
	:rtype: StepAP214_Array1OfApprovalItem
") Assign;
		const StepAP214_Array1OfApprovalItem & Assign (const StepAP214_Array1OfApprovalItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfApprovalItem &
	:rtype: StepAP214_Array1OfApprovalItem
") operator =;
		const StepAP214_Array1OfApprovalItem & operator = (const StepAP214_Array1OfApprovalItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_ApprovalItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_ApprovalItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ApprovalItem
") Value;
		const StepAP214_ApprovalItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ApprovalItem
") ChangeValue;
		StepAP214_ApprovalItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfApprovalItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfAutoDesignDateAndPersonItem;
class StepAP214_Array1OfAutoDesignDateAndPersonItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignDateAndPersonItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignDateAndPersonItem;
		 StepAP214_Array1OfAutoDesignDateAndPersonItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignDateAndPersonItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_AutoDesignDateAndPersonItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignDateAndPersonItem;
		 StepAP214_Array1OfAutoDesignDateAndPersonItem (const StepAP214_AutoDesignDateAndPersonItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignDateAndPersonItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignDateAndPersonItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignDateAndPersonItem &
	:rtype: StepAP214_Array1OfAutoDesignDateAndPersonItem
") Assign;
		const StepAP214_Array1OfAutoDesignDateAndPersonItem & Assign (const StepAP214_Array1OfAutoDesignDateAndPersonItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignDateAndPersonItem &
	:rtype: StepAP214_Array1OfAutoDesignDateAndPersonItem
") operator =;
		const StepAP214_Array1OfAutoDesignDateAndPersonItem & operator = (const StepAP214_Array1OfAutoDesignDateAndPersonItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignDateAndPersonItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignDateAndPersonItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndPersonItem
") Value;
		const StepAP214_AutoDesignDateAndPersonItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndPersonItem
") ChangeValue;
		StepAP214_AutoDesignDateAndPersonItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfAutoDesignDateAndPersonItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfAutoDesignDateAndTimeItem;
class StepAP214_Array1OfAutoDesignDateAndTimeItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignDateAndTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignDateAndTimeItem;
		 StepAP214_Array1OfAutoDesignDateAndTimeItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignDateAndTimeItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_AutoDesignDateAndTimeItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignDateAndTimeItem;
		 StepAP214_Array1OfAutoDesignDateAndTimeItem (const StepAP214_AutoDesignDateAndTimeItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignDateAndTimeItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignDateAndTimeItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignDateAndTimeItem &
	:rtype: StepAP214_Array1OfAutoDesignDateAndTimeItem
") Assign;
		const StepAP214_Array1OfAutoDesignDateAndTimeItem & Assign (const StepAP214_Array1OfAutoDesignDateAndTimeItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignDateAndTimeItem &
	:rtype: StepAP214_Array1OfAutoDesignDateAndTimeItem
") operator =;
		const StepAP214_Array1OfAutoDesignDateAndTimeItem & operator = (const StepAP214_Array1OfAutoDesignDateAndTimeItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignDateAndTimeItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignDateAndTimeItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndTimeItem
") Value;
		const StepAP214_AutoDesignDateAndTimeItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndTimeItem
") ChangeValue;
		StepAP214_AutoDesignDateAndTimeItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfAutoDesignDateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfAutoDesignDatedItem;
class StepAP214_Array1OfAutoDesignDatedItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignDatedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignDatedItem;
		 StepAP214_Array1OfAutoDesignDatedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignDatedItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_AutoDesignDatedItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignDatedItem;
		 StepAP214_Array1OfAutoDesignDatedItem (const StepAP214_AutoDesignDatedItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignDatedItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignDatedItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignDatedItem &
	:rtype: StepAP214_Array1OfAutoDesignDatedItem
") Assign;
		const StepAP214_Array1OfAutoDesignDatedItem & Assign (const StepAP214_Array1OfAutoDesignDatedItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignDatedItem &
	:rtype: StepAP214_Array1OfAutoDesignDatedItem
") operator =;
		const StepAP214_Array1OfAutoDesignDatedItem & operator = (const StepAP214_Array1OfAutoDesignDatedItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignDatedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignDatedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDatedItem
") Value;
		const StepAP214_AutoDesignDatedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDatedItem
") ChangeValue;
		StepAP214_AutoDesignDatedItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfAutoDesignDatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfAutoDesignGeneralOrgItem;
class StepAP214_Array1OfAutoDesignGeneralOrgItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignGeneralOrgItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignGeneralOrgItem;
		 StepAP214_Array1OfAutoDesignGeneralOrgItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignGeneralOrgItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_AutoDesignGeneralOrgItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignGeneralOrgItem;
		 StepAP214_Array1OfAutoDesignGeneralOrgItem (const StepAP214_AutoDesignGeneralOrgItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignGeneralOrgItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignGeneralOrgItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignGeneralOrgItem &
	:rtype: StepAP214_Array1OfAutoDesignGeneralOrgItem
") Assign;
		const StepAP214_Array1OfAutoDesignGeneralOrgItem & Assign (const StepAP214_Array1OfAutoDesignGeneralOrgItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignGeneralOrgItem &
	:rtype: StepAP214_Array1OfAutoDesignGeneralOrgItem
") operator =;
		const StepAP214_Array1OfAutoDesignGeneralOrgItem & operator = (const StepAP214_Array1OfAutoDesignGeneralOrgItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignGeneralOrgItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignGeneralOrgItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGeneralOrgItem
") Value;
		const StepAP214_AutoDesignGeneralOrgItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGeneralOrgItem
") ChangeValue;
		StepAP214_AutoDesignGeneralOrgItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfAutoDesignGeneralOrgItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfAutoDesignGroupedItem;
class StepAP214_Array1OfAutoDesignGroupedItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignGroupedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignGroupedItem;
		 StepAP214_Array1OfAutoDesignGroupedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignGroupedItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_AutoDesignGroupedItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignGroupedItem;
		 StepAP214_Array1OfAutoDesignGroupedItem (const StepAP214_AutoDesignGroupedItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignGroupedItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignGroupedItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignGroupedItem &
	:rtype: StepAP214_Array1OfAutoDesignGroupedItem
") Assign;
		const StepAP214_Array1OfAutoDesignGroupedItem & Assign (const StepAP214_Array1OfAutoDesignGroupedItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignGroupedItem &
	:rtype: StepAP214_Array1OfAutoDesignGroupedItem
") operator =;
		const StepAP214_Array1OfAutoDesignGroupedItem & operator = (const StepAP214_Array1OfAutoDesignGroupedItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignGroupedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignGroupedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGroupedItem
") Value;
		const StepAP214_AutoDesignGroupedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGroupedItem
") ChangeValue;
		StepAP214_AutoDesignGroupedItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfAutoDesignGroupedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfAutoDesignPresentedItemSelect;
class StepAP214_Array1OfAutoDesignPresentedItemSelect {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignPresentedItemSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignPresentedItemSelect;
		 StepAP214_Array1OfAutoDesignPresentedItemSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignPresentedItemSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_AutoDesignPresentedItemSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignPresentedItemSelect;
		 StepAP214_Array1OfAutoDesignPresentedItemSelect (const StepAP214_AutoDesignPresentedItemSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignPresentedItemSelect &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignPresentedItemSelect & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignPresentedItemSelect &
	:rtype: StepAP214_Array1OfAutoDesignPresentedItemSelect
") Assign;
		const StepAP214_Array1OfAutoDesignPresentedItemSelect & Assign (const StepAP214_Array1OfAutoDesignPresentedItemSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignPresentedItemSelect &
	:rtype: StepAP214_Array1OfAutoDesignPresentedItemSelect
") operator =;
		const StepAP214_Array1OfAutoDesignPresentedItemSelect & operator = (const StepAP214_Array1OfAutoDesignPresentedItemSelect & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignPresentedItemSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignPresentedItemSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignPresentedItemSelect
") Value;
		const StepAP214_AutoDesignPresentedItemSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignPresentedItemSelect
") ChangeValue;
		StepAP214_AutoDesignPresentedItemSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfAutoDesignPresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfAutoDesignReferencingItem;
class StepAP214_Array1OfAutoDesignReferencingItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignReferencingItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignReferencingItem;
		 StepAP214_Array1OfAutoDesignReferencingItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfAutoDesignReferencingItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_AutoDesignReferencingItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfAutoDesignReferencingItem;
		 StepAP214_Array1OfAutoDesignReferencingItem (const StepAP214_AutoDesignReferencingItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignReferencingItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignReferencingItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignReferencingItem &
	:rtype: StepAP214_Array1OfAutoDesignReferencingItem
") Assign;
		const StepAP214_Array1OfAutoDesignReferencingItem & Assign (const StepAP214_Array1OfAutoDesignReferencingItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfAutoDesignReferencingItem &
	:rtype: StepAP214_Array1OfAutoDesignReferencingItem
") operator =;
		const StepAP214_Array1OfAutoDesignReferencingItem & operator = (const StepAP214_Array1OfAutoDesignReferencingItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignReferencingItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignReferencingItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignReferencingItem
") Value;
		const StepAP214_AutoDesignReferencingItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignReferencingItem
") ChangeValue;
		StepAP214_AutoDesignReferencingItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfAutoDesignReferencingItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfDateAndTimeItem;
class StepAP214_Array1OfDateAndTimeItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfDateAndTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfDateAndTimeItem;
		 StepAP214_Array1OfDateAndTimeItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfDateAndTimeItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_DateAndTimeItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfDateAndTimeItem;
		 StepAP214_Array1OfDateAndTimeItem (const StepAP214_DateAndTimeItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_DateAndTimeItem &
	:rtype: None
") Init;
		void Init (const StepAP214_DateAndTimeItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfDateAndTimeItem &
	:rtype: StepAP214_Array1OfDateAndTimeItem
") Assign;
		const StepAP214_Array1OfDateAndTimeItem & Assign (const StepAP214_Array1OfDateAndTimeItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfDateAndTimeItem &
	:rtype: StepAP214_Array1OfDateAndTimeItem
") operator =;
		const StepAP214_Array1OfDateAndTimeItem & operator = (const StepAP214_Array1OfDateAndTimeItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_DateAndTimeItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_DateAndTimeItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateAndTimeItem
") Value;
		const StepAP214_DateAndTimeItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateAndTimeItem
") ChangeValue;
		StepAP214_DateAndTimeItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfDateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfDateItem;
class StepAP214_Array1OfDateItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfDateItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfDateItem;
		 StepAP214_Array1OfDateItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfDateItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_DateItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfDateItem;
		 StepAP214_Array1OfDateItem (const StepAP214_DateItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_DateItem &
	:rtype: None
") Init;
		void Init (const StepAP214_DateItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfDateItem &
	:rtype: StepAP214_Array1OfDateItem
") Assign;
		const StepAP214_Array1OfDateItem & Assign (const StepAP214_Array1OfDateItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfDateItem &
	:rtype: StepAP214_Array1OfDateItem
") operator =;
		const StepAP214_Array1OfDateItem & operator = (const StepAP214_Array1OfDateItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_DateItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_DateItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateItem
") Value;
		const StepAP214_DateItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateItem
") ChangeValue;
		StepAP214_DateItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfDateItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfDocumentReferenceItem;
class StepAP214_Array1OfDocumentReferenceItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfDocumentReferenceItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfDocumentReferenceItem;
		 StepAP214_Array1OfDocumentReferenceItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfDocumentReferenceItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_DocumentReferenceItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfDocumentReferenceItem;
		 StepAP214_Array1OfDocumentReferenceItem (const StepAP214_DocumentReferenceItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_DocumentReferenceItem &
	:rtype: None
") Init;
		void Init (const StepAP214_DocumentReferenceItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfDocumentReferenceItem &
	:rtype: StepAP214_Array1OfDocumentReferenceItem
") Assign;
		const StepAP214_Array1OfDocumentReferenceItem & Assign (const StepAP214_Array1OfDocumentReferenceItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfDocumentReferenceItem &
	:rtype: StepAP214_Array1OfDocumentReferenceItem
") operator =;
		const StepAP214_Array1OfDocumentReferenceItem & operator = (const StepAP214_Array1OfDocumentReferenceItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_DocumentReferenceItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_DocumentReferenceItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DocumentReferenceItem
") Value;
		const StepAP214_DocumentReferenceItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DocumentReferenceItem
") ChangeValue;
		StepAP214_DocumentReferenceItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfDocumentReferenceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfExternalIdentificationItem;
class StepAP214_Array1OfExternalIdentificationItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfExternalIdentificationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfExternalIdentificationItem;
		 StepAP214_Array1OfExternalIdentificationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfExternalIdentificationItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_ExternalIdentificationItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfExternalIdentificationItem;
		 StepAP214_Array1OfExternalIdentificationItem (const StepAP214_ExternalIdentificationItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_ExternalIdentificationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_ExternalIdentificationItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfExternalIdentificationItem &
	:rtype: StepAP214_Array1OfExternalIdentificationItem
") Assign;
		const StepAP214_Array1OfExternalIdentificationItem & Assign (const StepAP214_Array1OfExternalIdentificationItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfExternalIdentificationItem &
	:rtype: StepAP214_Array1OfExternalIdentificationItem
") operator =;
		const StepAP214_Array1OfExternalIdentificationItem & operator = (const StepAP214_Array1OfExternalIdentificationItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_ExternalIdentificationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_ExternalIdentificationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ExternalIdentificationItem
") Value;
		const StepAP214_ExternalIdentificationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ExternalIdentificationItem
") ChangeValue;
		StepAP214_ExternalIdentificationItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfExternalIdentificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfGroupItem;
class StepAP214_Array1OfGroupItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfGroupItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfGroupItem;
		 StepAP214_Array1OfGroupItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfGroupItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_GroupItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfGroupItem;
		 StepAP214_Array1OfGroupItem (const StepAP214_GroupItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_GroupItem &
	:rtype: None
") Init;
		void Init (const StepAP214_GroupItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfGroupItem &
	:rtype: StepAP214_Array1OfGroupItem
") Assign;
		const StepAP214_Array1OfGroupItem & Assign (const StepAP214_Array1OfGroupItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfGroupItem &
	:rtype: StepAP214_Array1OfGroupItem
") operator =;
		const StepAP214_Array1OfGroupItem & operator = (const StepAP214_Array1OfGroupItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_GroupItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_GroupItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_GroupItem
") Value;
		const StepAP214_GroupItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_GroupItem
") ChangeValue;
		StepAP214_GroupItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfGroupItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfOrganizationItem;
class StepAP214_Array1OfOrganizationItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfOrganizationItem;
		 StepAP214_Array1OfOrganizationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfOrganizationItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_OrganizationItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfOrganizationItem;
		 StepAP214_Array1OfOrganizationItem (const StepAP214_OrganizationItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_OrganizationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_OrganizationItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfOrganizationItem &
	:rtype: StepAP214_Array1OfOrganizationItem
") Assign;
		const StepAP214_Array1OfOrganizationItem & Assign (const StepAP214_Array1OfOrganizationItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfOrganizationItem &
	:rtype: StepAP214_Array1OfOrganizationItem
") operator =;
		const StepAP214_Array1OfOrganizationItem & operator = (const StepAP214_Array1OfOrganizationItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_OrganizationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_OrganizationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_OrganizationItem
") Value;
		const StepAP214_OrganizationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_OrganizationItem
") ChangeValue;
		StepAP214_OrganizationItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfPersonAndOrganizationItem;
class StepAP214_Array1OfPersonAndOrganizationItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfPersonAndOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfPersonAndOrganizationItem;
		 StepAP214_Array1OfPersonAndOrganizationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfPersonAndOrganizationItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_PersonAndOrganizationItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfPersonAndOrganizationItem;
		 StepAP214_Array1OfPersonAndOrganizationItem (const StepAP214_PersonAndOrganizationItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_PersonAndOrganizationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_PersonAndOrganizationItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfPersonAndOrganizationItem &
	:rtype: StepAP214_Array1OfPersonAndOrganizationItem
") Assign;
		const StepAP214_Array1OfPersonAndOrganizationItem & Assign (const StepAP214_Array1OfPersonAndOrganizationItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfPersonAndOrganizationItem &
	:rtype: StepAP214_Array1OfPersonAndOrganizationItem
") operator =;
		const StepAP214_Array1OfPersonAndOrganizationItem & operator = (const StepAP214_Array1OfPersonAndOrganizationItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_PersonAndOrganizationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_PersonAndOrganizationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PersonAndOrganizationItem
") Value;
		const StepAP214_PersonAndOrganizationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PersonAndOrganizationItem
") ChangeValue;
		StepAP214_PersonAndOrganizationItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfPersonAndOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfPresentedItemSelect;
class StepAP214_Array1OfPresentedItemSelect {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfPresentedItemSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfPresentedItemSelect;
		 StepAP214_Array1OfPresentedItemSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfPresentedItemSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_PresentedItemSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfPresentedItemSelect;
		 StepAP214_Array1OfPresentedItemSelect (const StepAP214_PresentedItemSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_PresentedItemSelect &
	:rtype: None
") Init;
		void Init (const StepAP214_PresentedItemSelect & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfPresentedItemSelect &
	:rtype: StepAP214_Array1OfPresentedItemSelect
") Assign;
		const StepAP214_Array1OfPresentedItemSelect & Assign (const StepAP214_Array1OfPresentedItemSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfPresentedItemSelect &
	:rtype: StepAP214_Array1OfPresentedItemSelect
") operator =;
		const StepAP214_Array1OfPresentedItemSelect & operator = (const StepAP214_Array1OfPresentedItemSelect & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_PresentedItemSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_PresentedItemSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PresentedItemSelect
") Value;
		const StepAP214_PresentedItemSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PresentedItemSelect
") ChangeValue;
		StepAP214_PresentedItemSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfPresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Array1OfSecurityClassificationItem;
class StepAP214_Array1OfSecurityClassificationItem {
	public:
		%feature("compactdefaultargs") StepAP214_Array1OfSecurityClassificationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfSecurityClassificationItem;
		 StepAP214_Array1OfSecurityClassificationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_Array1OfSecurityClassificationItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP214_SecurityClassificationItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_Array1OfSecurityClassificationItem;
		 StepAP214_Array1OfSecurityClassificationItem (const StepAP214_SecurityClassificationItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_SecurityClassificationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_SecurityClassificationItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfSecurityClassificationItem &
	:rtype: StepAP214_Array1OfSecurityClassificationItem
") Assign;
		const StepAP214_Array1OfSecurityClassificationItem & Assign (const StepAP214_Array1OfSecurityClassificationItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP214_Array1OfSecurityClassificationItem &
	:rtype: StepAP214_Array1OfSecurityClassificationItem
") operator =;
		const StepAP214_Array1OfSecurityClassificationItem & operator = (const StepAP214_Array1OfSecurityClassificationItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_SecurityClassificationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_SecurityClassificationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_SecurityClassificationItem
") Value;
		const StepAP214_SecurityClassificationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_SecurityClassificationItem
") ChangeValue;
		StepAP214_SecurityClassificationItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP214_Array1OfSecurityClassificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignActualDateAndTimeAssignment;
class StepAP214_AutoDesignActualDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "	* Returns a AutoDesignActualDateAndTimeAssignment

	:rtype: None
") StepAP214_AutoDesignActualDateAndTimeAssignment;
		 StepAP214_AutoDesignActualDateAndTimeAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignDateAndTimeItem
") ItemsValue;
		StepAP214_AutoDesignDateAndTimeItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignActualDateAndTimeAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignActualDateAndTimeAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignActualDateAndTimeAssignment::Handle_StepAP214_AutoDesignActualDateAndTimeAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignActualDateAndTimeAssignment;
class Handle_StepAP214_AutoDesignActualDateAndTimeAssignment : public Handle_StepBasic_DateAndTimeAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignActualDateAndTimeAssignment();
        Handle_StepAP214_AutoDesignActualDateAndTimeAssignment(const Handle_StepAP214_AutoDesignActualDateAndTimeAssignment &aHandle);
        Handle_StepAP214_AutoDesignActualDateAndTimeAssignment(const StepAP214_AutoDesignActualDateAndTimeAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignActualDateAndTimeAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignActualDateAndTimeAssignment {
    StepAP214_AutoDesignActualDateAndTimeAssignment* _get_reference() {
    return (StepAP214_AutoDesignActualDateAndTimeAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignActualDateAndTimeAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignActualDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignActualDateAssignment;
class StepAP214_AutoDesignActualDateAssignment : public StepBasic_DateAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAssignment;
		%feature("autodoc", "	* Returns a AutoDesignActualDateAssignment

	:rtype: None
") StepAP214_AutoDesignActualDateAssignment;
		 StepAP214_AutoDesignActualDateAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignDatedItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignDatedItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignDatedItem
") ItemsValue;
		StepAP214_AutoDesignDatedItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignActualDateAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignActualDateAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignActualDateAssignment::Handle_StepAP214_AutoDesignActualDateAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignActualDateAssignment;
class Handle_StepAP214_AutoDesignActualDateAssignment : public Handle_StepBasic_DateAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignActualDateAssignment();
        Handle_StepAP214_AutoDesignActualDateAssignment(const Handle_StepAP214_AutoDesignActualDateAssignment &aHandle);
        Handle_StepAP214_AutoDesignActualDateAssignment(const StepAP214_AutoDesignActualDateAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignActualDateAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignActualDateAssignment {
    StepAP214_AutoDesignActualDateAssignment* _get_reference() {
    return (StepAP214_AutoDesignActualDateAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignActualDateAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignActualDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignApprovalAssignment;
class StepAP214_AutoDesignApprovalAssignment : public StepBasic_ApprovalAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignApprovalAssignment;
		%feature("autodoc", "	* Returns a AutoDesignApprovalAssignment

	:rtype: None
") StepAP214_AutoDesignApprovalAssignment;
		 StepAP214_AutoDesignApprovalAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Approval & aAssignedApproval);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Approval & aAssignedApproval,const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignGeneralOrgItem
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignApprovalAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignApprovalAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignApprovalAssignment::Handle_StepAP214_AutoDesignApprovalAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignApprovalAssignment;
class Handle_StepAP214_AutoDesignApprovalAssignment : public Handle_StepBasic_ApprovalAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignApprovalAssignment();
        Handle_StepAP214_AutoDesignApprovalAssignment(const Handle_StepAP214_AutoDesignApprovalAssignment &aHandle);
        Handle_StepAP214_AutoDesignApprovalAssignment(const StepAP214_AutoDesignApprovalAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignApprovalAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignApprovalAssignment {
    StepAP214_AutoDesignApprovalAssignment* _get_reference() {
    return (StepAP214_AutoDesignApprovalAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignApprovalAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDateAndPersonAssignment;
class StepAP214_AutoDesignDateAndPersonAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "	* Returns a AutoDesignDateAndPersonAssignment

	:rtype: None
") StepAP214_AutoDesignDateAndPersonAssignment;
		 StepAP214_AutoDesignDateAndPersonAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignDateAndPersonItem
") ItemsValue;
		StepAP214_AutoDesignDateAndPersonItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignDateAndPersonAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignDateAndPersonAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignDateAndPersonAssignment::Handle_StepAP214_AutoDesignDateAndPersonAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignDateAndPersonAssignment;
class Handle_StepAP214_AutoDesignDateAndPersonAssignment : public Handle_StepBasic_PersonAndOrganizationAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignDateAndPersonAssignment();
        Handle_StepAP214_AutoDesignDateAndPersonAssignment(const Handle_StepAP214_AutoDesignDateAndPersonAssignment &aHandle);
        Handle_StepAP214_AutoDesignDateAndPersonAssignment(const StepAP214_AutoDesignDateAndPersonAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignDateAndPersonAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignDateAndPersonAssignment {
    StepAP214_AutoDesignDateAndPersonAssignment* _get_reference() {
    return (StepAP214_AutoDesignDateAndPersonAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignDateAndPersonAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignDateAndPersonAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDateAndPersonItem;
class StepAP214_AutoDesignDateAndPersonItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonItem;
		%feature("autodoc", "	* Returns a AutoDesignDateAndPersonItem SelectType

	:rtype: None
") StepAP214_AutoDesignDateAndPersonItem;
		 StepAP214_AutoDesignDateAndPersonItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignDateAndPersonItem Kind Entity that is : 1 AutoDesignOrganizationAssignment from StepAP214, 2 Product from StepBasic, 3 ProductDefinition from StepBasic, 4 ProductDefinitionFormation from StepBasic, 5 Representation from StepRepr, 6 AutoDesignDocumentReference from StepAP214, 7 ExternallyDefinedRepresentation from StepRepr, 8 ProductDefinitionRelationship from StepBasic, 9 ProductDefinitionWithAssociatedDocuments from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AutoDesignOrganizationAssignment;
		%feature("autodoc", "	:rtype: Handle_StepAP214_AutoDesignOrganizationAssignment
") AutoDesignOrganizationAssignment;
		Handle_StepAP214_AutoDesignOrganizationAssignment AutoDesignOrganizationAssignment ();
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Product
") Product;
		Handle_StepBasic_Product Product ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_Representation
") Representation;
		Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "	:rtype: Handle_StepAP214_AutoDesignDocumentReference
") AutoDesignDocumentReference;
		Handle_StepAP214_AutoDesignDocumentReference AutoDesignDocumentReference ();
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ExternallyDefinedRepresentation
") ExternallyDefinedRepresentation;
		Handle_StepRepr_ExternallyDefinedRepresentation ExternallyDefinedRepresentation ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionWithAssociatedDocuments
") ProductDefinitionWithAssociatedDocuments;
		Handle_StepBasic_ProductDefinitionWithAssociatedDocuments ProductDefinitionWithAssociatedDocuments ();
};


%extend StepAP214_AutoDesignDateAndPersonItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDateAndTimeItem;
class StepAP214_AutoDesignDateAndTimeItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndTimeItem;
		%feature("autodoc", "	* Returns a AutoDesignDateAndTimeItem SelectType

	:rtype: None
") StepAP214_AutoDesignDateAndTimeItem;
		 StepAP214_AutoDesignDateAndTimeItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignDateAndTimeItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AutoDesignDateAndPersonAssignment 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "	* returns Value as a ApprovalPersonOrganization (Null if another type)

	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") ApprovalPersonOrganization;
		Handle_StepBasic_ApprovalPersonOrganization ApprovalPersonOrganization ();
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "	* returns Value as a AutoDesignDateAndPersonAssignment (Null if another type)

	:rtype: Handle_StepAP214_AutoDesignDateAndPersonAssignment
") AutoDesignDateAndPersonAssignment;
		Handle_StepAP214_AutoDesignDateAndPersonAssignment AutoDesignDateAndPersonAssignment ();
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionEffectivity
") ProductDefinitionEffectivity;
		Handle_StepBasic_ProductDefinitionEffectivity ProductDefinitionEffectivity ();
};


%extend StepAP214_AutoDesignDateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDatedItem;
class StepAP214_AutoDesignDatedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignDatedItem;
		%feature("autodoc", "	* Returns a AutoDesignDatedItem SelectType

	:rtype: None
") StepAP214_AutoDesignDatedItem;
		 StepAP214_AutoDesignDatedItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignDatedItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AutoDesignDateAndPersonAssignment 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "	* returns Value as a ApprovalPersonOrganization (Null if another type)

	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") ApprovalPersonOrganization;
		Handle_StepBasic_ApprovalPersonOrganization ApprovalPersonOrganization ();
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "	* returns Value as a AutoDesignDateAndPersonAssignment (Null if another type)

	:rtype: Handle_StepAP214_AutoDesignDateAndPersonAssignment
") AutoDesignDateAndPersonAssignment;
		Handle_StepAP214_AutoDesignDateAndPersonAssignment AutoDesignDateAndPersonAssignment ();
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "	* returns Value as a ProductDefinitionEffectivity

	:rtype: Handle_StepBasic_ProductDefinitionEffectivity
") ProductDefinitionEffectivity;
		Handle_StepBasic_ProductDefinitionEffectivity ProductDefinitionEffectivity ();
};


%extend StepAP214_AutoDesignDatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDocumentReference;
class StepAP214_AutoDesignDocumentReference : public StepBasic_DocumentReference {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignDocumentReference;
		%feature("autodoc", "	:rtype: None
") StepAP214_AutoDesignDocumentReference;
		 StepAP214_AutoDesignDocumentReference ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDocument:
	:type aAssignedDocument: Handle_StepBasic_Document &
	:param aSource:
	:type aSource: Handle_TCollection_HAsciiString &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignReferencingItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Document & aAssignedDocument,const Handle_TCollection_HAsciiString & aSource,const Handle_StepAP214_HArray1OfAutoDesignReferencingItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignReferencingItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignReferencingItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignReferencingItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignReferencingItem & aItems);
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignReferencingItem
") ItemsValue;
		StepAP214_AutoDesignReferencingItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignDocumentReference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignDocumentReference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignDocumentReference::Handle_StepAP214_AutoDesignDocumentReference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignDocumentReference;
class Handle_StepAP214_AutoDesignDocumentReference : public Handle_StepBasic_DocumentReference {

    public:
        // constructors
        Handle_StepAP214_AutoDesignDocumentReference();
        Handle_StepAP214_AutoDesignDocumentReference(const Handle_StepAP214_AutoDesignDocumentReference &aHandle);
        Handle_StepAP214_AutoDesignDocumentReference(const StepAP214_AutoDesignDocumentReference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignDocumentReference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignDocumentReference {
    StepAP214_AutoDesignDocumentReference* _get_reference() {
    return (StepAP214_AutoDesignDocumentReference*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignDocumentReference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignGeneralOrgItem;
class StepAP214_AutoDesignGeneralOrgItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignGeneralOrgItem;
		%feature("autodoc", "	* Returns a AutoDesignGeneralOrgItem SelectType

	:rtype: None
") StepAP214_AutoDesignGeneralOrgItem;
		 StepAP214_AutoDesignGeneralOrgItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignGeneralOrgItem Kind Entity that is : 1 Product from StepBasic, 2 ProductDefinition from StepBasic, 3 ProductDefinitionFormation from StepBasic, 4 ProductDefinitionRelationship from StepBasic, 5 ProductDefinitionWithAssociatedDocuments from StepBasic, 6 Representation from StepRepr 7 ExternallyDefinedRepresentation from StepRepr, 8 AutoDesignDocumentReference from StepAP214, 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	* returns Value as a Product (Null if another type)

	:rtype: Handle_StepBasic_Product
") Product;
		Handle_StepBasic_Product Product ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* returns Value as a ProductDefinitionFormation (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* returns Value as a ProductDefinitionRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "	* returns Value as a ProductDefinitionWithAssociatedDocuments (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionWithAssociatedDocuments
") ProductDefinitionWithAssociatedDocuments;
		Handle_StepBasic_ProductDefinitionWithAssociatedDocuments ProductDefinitionWithAssociatedDocuments ();
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_Representation
") Representation;
		Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_ExternallyDefinedRepresentation
") ExternallyDefinedRepresentation;
		Handle_StepRepr_ExternallyDefinedRepresentation ExternallyDefinedRepresentation ();
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "	:rtype: Handle_StepAP214_AutoDesignDocumentReference
") AutoDesignDocumentReference;
		Handle_StepAP214_AutoDesignDocumentReference AutoDesignDocumentReference ();
};


%extend StepAP214_AutoDesignGeneralOrgItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignGroupAssignment;
class StepAP214_AutoDesignGroupAssignment : public StepBasic_GroupAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupAssignment;
		%feature("autodoc", "	* Returns a AutoDesignGroupAssignment

	:rtype: None
") StepAP214_AutoDesignGroupAssignment;
		 StepAP214_AutoDesignGroupAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedGroup:
	:type aAssignedGroup: Handle_StepBasic_Group &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGroupedItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Group & aAssignedGroup,const Handle_StepAP214_HArray1OfAutoDesignGroupedItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGroupedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGroupedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignGroupedItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignGroupedItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignGroupedItem
") ItemsValue;
		StepAP214_AutoDesignGroupedItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignGroupAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignGroupAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignGroupAssignment::Handle_StepAP214_AutoDesignGroupAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignGroupAssignment;
class Handle_StepAP214_AutoDesignGroupAssignment : public Handle_StepBasic_GroupAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignGroupAssignment();
        Handle_StepAP214_AutoDesignGroupAssignment(const Handle_StepAP214_AutoDesignGroupAssignment &aHandle);
        Handle_StepAP214_AutoDesignGroupAssignment(const StepAP214_AutoDesignGroupAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignGroupAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignGroupAssignment {
    StepAP214_AutoDesignGroupAssignment* _get_reference() {
    return (StepAP214_AutoDesignGroupAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignGroupAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignGroupedItem;
class StepAP214_AutoDesignGroupedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupedItem;
		%feature("autodoc", "	* Returns a AutoDesignGroupedItem SelectType

	:rtype: None
") StepAP214_AutoDesignGroupedItem;
		 StepAP214_AutoDesignGroupedItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignGroupedItem Kind Entity that is : 1 -> AdvancedBrepShapeRepresentation 2 -> CsgShapeRepresentation 3 -> FacetedBrepShapeRepresentation 4 -> GeometricallyBoundedSurfaceShapeRepresentation 5 -> GeometricallyBoundedWireframeShapeRepresentation 6 -> ManifoldSurfaceShapeRepresentation 7 -> Representation 8 -> RepresentationItem 9 -> ShapeAspect 10 -> ShapeRepresentation 11 -> TemplateInstance 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AdvancedBrepShapeRepresentation;
		%feature("autodoc", "	* returns Value as a AdvancedBrepShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_AdvancedBrepShapeRepresentation
") AdvancedBrepShapeRepresentation;
		Handle_StepShape_AdvancedBrepShapeRepresentation AdvancedBrepShapeRepresentation ();
		%feature("compactdefaultargs") CsgShapeRepresentation;
		%feature("autodoc", "	* returns Value as a CsgShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_CsgShapeRepresentation
") CsgShapeRepresentation;
		Handle_StepShape_CsgShapeRepresentation CsgShapeRepresentation ();
		%feature("compactdefaultargs") FacetedBrepShapeRepresentation;
		%feature("autodoc", "	* returns Value as a FacetedBrepShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_FacetedBrepShapeRepresentation
") FacetedBrepShapeRepresentation;
		Handle_StepShape_FacetedBrepShapeRepresentation FacetedBrepShapeRepresentation ();
		%feature("compactdefaultargs") GeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "	* returns Value as a GeometricallyBoundedSurfaceShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation
") GeometricallyBoundedSurfaceShapeRepresentation;
		Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation GeometricallyBoundedSurfaceShapeRepresentation ();
		%feature("compactdefaultargs") GeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "	* returns Value as a GeometricallyBoundedWireframeShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation
") GeometricallyBoundedWireframeShapeRepresentation;
		Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation GeometricallyBoundedWireframeShapeRepresentation ();
		%feature("compactdefaultargs") ManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "	* returns Value as a ManifoldSurfaceShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_ManifoldSurfaceShapeRepresentation
") ManifoldSurfaceShapeRepresentation;
		Handle_StepShape_ManifoldSurfaceShapeRepresentation ManifoldSurfaceShapeRepresentation ();
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_Representation
") Representation;
		Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "	* returns Value as a RepresentationItem (Null if another type)

	:rtype: Handle_StepRepr_RepresentationItem
") RepresentationItem;
		Handle_StepRepr_RepresentationItem RepresentationItem ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* returns Value as a ShapeAspect (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "	* returns Value as a ShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_ShapeRepresentation
") ShapeRepresentation;
		Handle_StepShape_ShapeRepresentation ShapeRepresentation ();
		%feature("compactdefaultargs") TemplateInstance;
		%feature("autodoc", "	* returns Value as a TemplateInstance (Null if another type)

	:rtype: Handle_StepVisual_TemplateInstance
") TemplateInstance;
		Handle_StepVisual_TemplateInstance TemplateInstance ();
};


%extend StepAP214_AutoDesignGroupedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignNominalDateAndTimeAssignment;
class StepAP214_AutoDesignNominalDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "	* Returns a AutoDesignNominalDateAndTimeAssignment

	:rtype: None
") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		 StepAP214_AutoDesignNominalDateAndTimeAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignDateAndTimeItem
") ItemsValue;
		StepAP214_AutoDesignDateAndTimeItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignNominalDateAndTimeAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment::Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment;
class Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment : public Handle_StepBasic_DateAndTimeAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment();
        Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment(const Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment &aHandle);
        Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment(const StepAP214_AutoDesignNominalDateAndTimeAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment {
    StepAP214_AutoDesignNominalDateAndTimeAssignment* _get_reference() {
    return (StepAP214_AutoDesignNominalDateAndTimeAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignNominalDateAndTimeAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignNominalDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignNominalDateAssignment;
class StepAP214_AutoDesignNominalDateAssignment : public StepBasic_DateAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAssignment;
		%feature("autodoc", "	* Returns a AutoDesignNominalDateAssignment

	:rtype: None
") StepAP214_AutoDesignNominalDateAssignment;
		 StepAP214_AutoDesignNominalDateAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignDatedItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignDatedItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignDatedItem
") ItemsValue;
		StepAP214_AutoDesignDatedItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignNominalDateAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignNominalDateAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignNominalDateAssignment::Handle_StepAP214_AutoDesignNominalDateAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignNominalDateAssignment;
class Handle_StepAP214_AutoDesignNominalDateAssignment : public Handle_StepBasic_DateAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignNominalDateAssignment();
        Handle_StepAP214_AutoDesignNominalDateAssignment(const Handle_StepAP214_AutoDesignNominalDateAssignment &aHandle);
        Handle_StepAP214_AutoDesignNominalDateAssignment(const StepAP214_AutoDesignNominalDateAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignNominalDateAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignNominalDateAssignment {
    StepAP214_AutoDesignNominalDateAssignment* _get_reference() {
    return (StepAP214_AutoDesignNominalDateAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignNominalDateAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignNominalDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignOrganizationAssignment;
class StepAP214_AutoDesignOrganizationAssignment : public StepBasic_OrganizationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignOrganizationAssignment

	:rtype: None
") StepAP214_AutoDesignOrganizationAssignment;
		 StepAP214_AutoDesignOrganizationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Organization & aAssignedOrganization,const Handle_StepBasic_OrganizationRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_Organization & aAssignedOrganization,const Handle_StepBasic_OrganizationRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignGeneralOrgItem
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignOrganizationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignOrganizationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignOrganizationAssignment::Handle_StepAP214_AutoDesignOrganizationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignOrganizationAssignment;
class Handle_StepAP214_AutoDesignOrganizationAssignment : public Handle_StepBasic_OrganizationAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignOrganizationAssignment();
        Handle_StepAP214_AutoDesignOrganizationAssignment(const Handle_StepAP214_AutoDesignOrganizationAssignment &aHandle);
        Handle_StepAP214_AutoDesignOrganizationAssignment(const StepAP214_AutoDesignOrganizationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignOrganizationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignOrganizationAssignment {
    StepAP214_AutoDesignOrganizationAssignment* _get_reference() {
    return (StepAP214_AutoDesignOrganizationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignOrganizationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignPersonAndOrganizationAssignment;
class StepAP214_AutoDesignPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignPersonAndOrganizationAssignment

	:rtype: None
") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		 StepAP214_AutoDesignPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem
") Items;
		Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignGeneralOrgItem
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignPersonAndOrganizationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment::Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment;
class Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment : public Handle_StepBasic_PersonAndOrganizationAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment();
        Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment(const Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment &aHandle);
        Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment(const StepAP214_AutoDesignPersonAndOrganizationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment {
    StepAP214_AutoDesignPersonAndOrganizationAssignment* _get_reference() {
    return (StepAP214_AutoDesignPersonAndOrganizationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignPersonAndOrganizationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignPresentedItem;
class StepAP214_AutoDesignPresentedItem : public StepVisual_PresentedItem {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItem;
		%feature("autodoc", "	* Returns a AutoDesignPresentedItem

	:rtype: None
") StepAP214_AutoDesignPresentedItem;
		 StepAP214_AutoDesignPresentedItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect
") Items;
		Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepAP214_AutoDesignPresentedItemSelect
") ItemsValue;
		StepAP214_AutoDesignPresentedItemSelect ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignPresentedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignPresentedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignPresentedItem::Handle_StepAP214_AutoDesignPresentedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignPresentedItem;
class Handle_StepAP214_AutoDesignPresentedItem : public Handle_StepVisual_PresentedItem {

    public:
        // constructors
        Handle_StepAP214_AutoDesignPresentedItem();
        Handle_StepAP214_AutoDesignPresentedItem(const Handle_StepAP214_AutoDesignPresentedItem &aHandle);
        Handle_StepAP214_AutoDesignPresentedItem(const StepAP214_AutoDesignPresentedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignPresentedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignPresentedItem {
    StepAP214_AutoDesignPresentedItem* _get_reference() {
    return (StepAP214_AutoDesignPresentedItem*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignPresentedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignPresentedItemSelect;
class StepAP214_AutoDesignPresentedItemSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItemSelect;
		%feature("autodoc", "	* Returns a AutoDesignPresentedItemSelect SelectType

	:rtype: None
") StepAP214_AutoDesignPresentedItemSelect;
		 StepAP214_AutoDesignPresentedItemSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignPresentedItemSelect Kind Entity that is : 1 -> ProductDefinition, 2 -> ProductDefinitionRelationship, 3 -> ProductDefinitionShape 4 -> RepresentationRelationship 5 -> ShapeAspect 6 -> DocumentRelationship, 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* returns Value as a ProductDefinitionRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "	* returns Value as a ProductDefinitionShape (Null if another type)

	:rtype: Handle_StepRepr_ProductDefinitionShape
") ProductDefinitionShape;
		Handle_StepRepr_ProductDefinitionShape ProductDefinitionShape ();
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "	* returns Value as a RepresentationRelationship (Null if another type)

	:rtype: Handle_StepRepr_RepresentationRelationship
") RepresentationRelationship;
		Handle_StepRepr_RepresentationRelationship RepresentationRelationship ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* returns Value as a ShapeAspect (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "	* returns Value as a DocumentRelationship (Null if another type)

	:rtype: Handle_StepBasic_DocumentRelationship
") DocumentRelationship;
		Handle_StepBasic_DocumentRelationship DocumentRelationship ();
};


%extend StepAP214_AutoDesignPresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignReferencingItem;
class StepAP214_AutoDesignReferencingItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignReferencingItem;
		%feature("autodoc", "	* Returns a AutoDesignReferencingItem SelectType

	:rtype: None
") StepAP214_AutoDesignReferencingItem;
		 StepAP214_AutoDesignReferencingItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignReferencingItem Kind Entity that is : 1 Approval from StepBasic, 2 DocumentRelationship from StepBasic, 3 ExternallyDefinedRepresentation from StepRepr, 4 MappedItem from StepRepr, 5 MaterialDesignation from StepRepr, 6 PresentationArea from StepVisual, 7 PresentationView from StepVisual, 8 ProductCategory from StepBasic, 9 ProductDefinition from StepBasic, 10 ProductDefinitionRelationship from StepBasic, 11 PropertyDefinition from StepBasic, 12 Representation from StepRepr, 13 RepresentationRelationship from StepRepr, 14 ShapeAspect from StepRepr 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DocumentRelationship
") DocumentRelationship;
		Handle_StepBasic_DocumentRelationship DocumentRelationship ();
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ExternallyDefinedRepresentation
") ExternallyDefinedRepresentation;
		Handle_StepRepr_ExternallyDefinedRepresentation ExternallyDefinedRepresentation ();
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "	:rtype: Handle_StepRepr_MappedItem
") MappedItem;
		Handle_StepRepr_MappedItem MappedItem ();
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_MaterialDesignation
") MaterialDesignation;
		Handle_StepRepr_MaterialDesignation MaterialDesignation ();
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PresentationArea
") PresentationArea;
		Handle_StepVisual_PresentationArea PresentationArea ();
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "	:rtype: Handle_StepVisual_PresentationView
") PresentationView;
		Handle_StepVisual_PresentationView PresentationView ();
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductCategory
") ProductCategory;
		Handle_StepBasic_ProductCategory ProductCategory ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "	:rtype: Handle_StepRepr_PropertyDefinition
") PropertyDefinition;
		Handle_StepRepr_PropertyDefinition PropertyDefinition ();
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_Representation
") Representation;
		Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationRelationship
") RepresentationRelationship;
		Handle_StepRepr_RepresentationRelationship RepresentationRelationship ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
};


%extend StepAP214_AutoDesignReferencingItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignSecurityClassificationAssignment;
class StepAP214_AutoDesignSecurityClassificationAssignment : public StepBasic_SecurityClassificationAssignment {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignSecurityClassificationAssignment

	:rtype: None
") StepAP214_AutoDesignSecurityClassificationAssignment;
		 StepAP214_AutoDesignSecurityClassificationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:param aItems:
	:type aItems: Handle_StepBasic_HArray1OfApproval &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification,const Handle_StepBasic_HArray1OfApproval & aItems);
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepBasic_HArray1OfApproval &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepBasic_HArray1OfApproval & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfApproval
") Items;
		Handle_StepBasic_HArray1OfApproval Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_Approval
") ItemsValue;
		Handle_StepBasic_Approval ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
};


%extend StepAP214_AutoDesignSecurityClassificationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_AutoDesignSecurityClassificationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_AutoDesignSecurityClassificationAssignment::Handle_StepAP214_AutoDesignSecurityClassificationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_AutoDesignSecurityClassificationAssignment;
class Handle_StepAP214_AutoDesignSecurityClassificationAssignment : public Handle_StepBasic_SecurityClassificationAssignment {

    public:
        // constructors
        Handle_StepAP214_AutoDesignSecurityClassificationAssignment();
        Handle_StepAP214_AutoDesignSecurityClassificationAssignment(const Handle_StepAP214_AutoDesignSecurityClassificationAssignment &aHandle);
        Handle_StepAP214_AutoDesignSecurityClassificationAssignment(const StepAP214_AutoDesignSecurityClassificationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_AutoDesignSecurityClassificationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_AutoDesignSecurityClassificationAssignment {
    StepAP214_AutoDesignSecurityClassificationAssignment* _get_reference() {
    return (StepAP214_AutoDesignSecurityClassificationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP214_AutoDesignSecurityClassificationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_AutoDesignSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Class;
class StepAP214_Class : public StepBasic_Group {
	public:
		%feature("compactdefaultargs") StepAP214_Class;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_Class;
		 StepAP214_Class ();
};


%extend StepAP214_Class {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_Class(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_Class::Handle_StepAP214_Class %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_Class;
class Handle_StepAP214_Class : public Handle_StepBasic_Group {

    public:
        // constructors
        Handle_StepAP214_Class();
        Handle_StepAP214_Class(const Handle_StepAP214_Class &aHandle);
        Handle_StepAP214_Class(const StepAP214_Class *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_Class DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_Class {
    StepAP214_Class* _get_reference() {
    return (StepAP214_Class*)$self->Access();
    }
};

%extend Handle_StepAP214_Class {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_Class {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_DocumentReferenceItem;
class StepAP214_DocumentReferenceItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_DocumentReferenceItem;
		%feature("autodoc", "	* Returns a DocumentReferenceItem SelectType

	:rtype: None
") StepAP214_DocumentReferenceItem;
		 StepAP214_DocumentReferenceItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DocumentReferenceItem Kind Entity that is :

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	* returns Value as a Approval (Null if another type)

	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "	* returns Value as a (Null if another type)

	:rtype: Handle_StepRepr_DescriptiveRepresentationItem
") DescriptiveRepresentationItem;
		Handle_StepRepr_DescriptiveRepresentationItem DescriptiveRepresentationItem ();
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "	* returns Value as a MaterialDesignation (Null if another type)

	:rtype: Handle_StepRepr_MaterialDesignation
") MaterialDesignation;
		Handle_StepRepr_MaterialDesignation MaterialDesignation ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* returns Value as aProductDefinitionRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "	* returns Value as a PropertyDefinition (Null if another type)

	:rtype: Handle_StepRepr_PropertyDefinition
") PropertyDefinition;
		Handle_StepRepr_PropertyDefinition PropertyDefinition ();
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_Representation
") Representation;
		Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* returns Value as a ShapeAspect (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "	* returns Value as a ShapeAspectRelationship (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspectRelationship
") ShapeAspectRelationship;
		Handle_StepRepr_ShapeAspectRelationship ShapeAspectRelationship ();
};


%extend StepAP214_DocumentReferenceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ExternalIdentificationItem;
class StepAP214_ExternalIdentificationItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_ExternalIdentificationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_ExternalIdentificationItem;
		 StepAP214_ExternalIdentificationItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ExternalIdentificationItem select type 1 -> DocumentFile from StepBasic 2 -> ExternallyDefinedClass from StepAP214 3 -> ExternallyDefinedGeneralProperty from StepAP214 4 -> ProductDefinition from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "	* Returns Value as DocumentFile (or Null if another type)

	:rtype: Handle_StepBasic_DocumentFile
") DocumentFile;
		Handle_StepBasic_DocumentFile DocumentFile ();
		%feature("compactdefaultargs") ExternallyDefinedClass;
		%feature("autodoc", "	* Returns Value as ExternallyDefinedClass (or Null if another type)

	:rtype: Handle_StepAP214_ExternallyDefinedClass
") ExternallyDefinedClass;
		Handle_StepAP214_ExternallyDefinedClass ExternallyDefinedClass ();
		%feature("compactdefaultargs") ExternallyDefinedGeneralProperty;
		%feature("autodoc", "	* Returns Value as ExternallyDefinedGeneralProperty (or Null if another type)

	:rtype: Handle_StepAP214_ExternallyDefinedGeneralProperty
") ExternallyDefinedGeneralProperty;
		Handle_StepAP214_ExternallyDefinedGeneralProperty ExternallyDefinedGeneralProperty ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
};


%extend StepAP214_ExternalIdentificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ExternallyDefinedGeneralProperty;
class StepAP214_ExternallyDefinedGeneralProperty : public StepBasic_GeneralProperty {
	public:
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedGeneralProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_ExternallyDefinedGeneralProperty;
		 StepAP214_ExternallyDefinedGeneralProperty ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGeneralProperty_Id:
	:type aGeneralProperty_Id: Handle_TCollection_HAsciiString &
	:param aGeneralProperty_Name:
	:type aGeneralProperty_Name: Handle_TCollection_HAsciiString &
	:param hasGeneralProperty_Description:
	:type hasGeneralProperty_Description: bool
	:param aGeneralProperty_Description:
	:type aGeneralProperty_Description: Handle_TCollection_HAsciiString &
	:param aExternallyDefinedItem_ItemId:
	:type aExternallyDefinedItem_ItemId: StepBasic_SourceItem &
	:param aExternallyDefinedItem_Source:
	:type aExternallyDefinedItem_Source: Handle_StepBasic_ExternalSource &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGeneralProperty_Id,const Handle_TCollection_HAsciiString & aGeneralProperty_Name,const Standard_Boolean hasGeneralProperty_Description,const Handle_TCollection_HAsciiString & aGeneralProperty_Description,const StepBasic_SourceItem & aExternallyDefinedItem_ItemId,const Handle_StepBasic_ExternalSource & aExternallyDefinedItem_Source);
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "	* Returns data for supertype ExternallyDefinedItem

	:rtype: Handle_StepBasic_ExternallyDefinedItem
") ExternallyDefinedItem;
		Handle_StepBasic_ExternallyDefinedItem ExternallyDefinedItem ();
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "	* Set data for supertype ExternallyDefinedItem

	:param ExternallyDefinedItem:
	:type ExternallyDefinedItem: Handle_StepBasic_ExternallyDefinedItem &
	:rtype: None
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem (const Handle_StepBasic_ExternallyDefinedItem & ExternallyDefinedItem);
};


%extend StepAP214_ExternallyDefinedGeneralProperty {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_ExternallyDefinedGeneralProperty(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_ExternallyDefinedGeneralProperty::Handle_StepAP214_ExternallyDefinedGeneralProperty %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_ExternallyDefinedGeneralProperty;
class Handle_StepAP214_ExternallyDefinedGeneralProperty : public Handle_StepBasic_GeneralProperty {

    public:
        // constructors
        Handle_StepAP214_ExternallyDefinedGeneralProperty();
        Handle_StepAP214_ExternallyDefinedGeneralProperty(const Handle_StepAP214_ExternallyDefinedGeneralProperty &aHandle);
        Handle_StepAP214_ExternallyDefinedGeneralProperty(const StepAP214_ExternallyDefinedGeneralProperty *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_ExternallyDefinedGeneralProperty DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_ExternallyDefinedGeneralProperty {
    StepAP214_ExternallyDefinedGeneralProperty* _get_reference() {
    return (StepAP214_ExternallyDefinedGeneralProperty*)$self->Access();
    }
};

%extend Handle_StepAP214_ExternallyDefinedGeneralProperty {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_ExternallyDefinedGeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_GroupItem;
class StepAP214_GroupItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_GroupItem;
		%feature("autodoc", "	* Returns a GroupItem SelectType

	:rtype: None
") StepAP214_GroupItem;
		 StepAP214_GroupItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a GroupItem Kind Entity that is : 1 -> GeometricRepresentationItem 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") GeometricRepresentationItem;
		%feature("autodoc", "	* returns Value as a GeometricRepresentationItem (Null if another type)

	:rtype: Handle_StepGeom_GeometricRepresentationItem
") GeometricRepresentationItem;
		virtual Handle_StepGeom_GeometricRepresentationItem GeometricRepresentationItem ();
};


%extend StepAP214_GroupItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfApprovalItem;
class StepAP214_HArray1OfApprovalItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfApprovalItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfApprovalItem;
		 StepAP214_HArray1OfApprovalItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfApprovalItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_ApprovalItem &
	:rtype: None
") StepAP214_HArray1OfApprovalItem;
		 StepAP214_HArray1OfApprovalItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_ApprovalItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_ApprovalItem &
	:rtype: None
") Init;
		void Init (const StepAP214_ApprovalItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_ApprovalItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_ApprovalItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ApprovalItem
") Value;
		const StepAP214_ApprovalItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ApprovalItem
") ChangeValue;
		StepAP214_ApprovalItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfApprovalItem
") Array1;
		const StepAP214_Array1OfApprovalItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfApprovalItem
") ChangeArray1;
		StepAP214_Array1OfApprovalItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfApprovalItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfApprovalItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfApprovalItem::Handle_StepAP214_HArray1OfApprovalItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfApprovalItem;
class Handle_StepAP214_HArray1OfApprovalItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfApprovalItem();
        Handle_StepAP214_HArray1OfApprovalItem(const Handle_StepAP214_HArray1OfApprovalItem &aHandle);
        Handle_StepAP214_HArray1OfApprovalItem(const StepAP214_HArray1OfApprovalItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfApprovalItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfApprovalItem {
    StepAP214_HArray1OfApprovalItem* _get_reference() {
    return (StepAP214_HArray1OfApprovalItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfApprovalItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfApprovalItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfAutoDesignDateAndPersonItem;
class StepAP214_HArray1OfAutoDesignDateAndPersonItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignDateAndPersonItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfAutoDesignDateAndPersonItem;
		 StepAP214_HArray1OfAutoDesignDateAndPersonItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignDateAndPersonItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_AutoDesignDateAndPersonItem &
	:rtype: None
") StepAP214_HArray1OfAutoDesignDateAndPersonItem;
		 StepAP214_HArray1OfAutoDesignDateAndPersonItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_AutoDesignDateAndPersonItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignDateAndPersonItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignDateAndPersonItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignDateAndPersonItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignDateAndPersonItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndPersonItem
") Value;
		const StepAP214_AutoDesignDateAndPersonItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndPersonItem
") ChangeValue;
		StepAP214_AutoDesignDateAndPersonItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignDateAndPersonItem
") Array1;
		const StepAP214_Array1OfAutoDesignDateAndPersonItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignDateAndPersonItem
") ChangeArray1;
		StepAP214_Array1OfAutoDesignDateAndPersonItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfAutoDesignDateAndPersonItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem::Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem;
class Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem();
        Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem &aHandle);
        Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem(const StepAP214_HArray1OfAutoDesignDateAndPersonItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem {
    StepAP214_HArray1OfAutoDesignDateAndPersonItem* _get_reference() {
    return (StepAP214_HArray1OfAutoDesignDateAndPersonItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfAutoDesignDateAndPersonItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfAutoDesignDateAndTimeItem;
class StepAP214_HArray1OfAutoDesignDateAndTimeItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignDateAndTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfAutoDesignDateAndTimeItem;
		 StepAP214_HArray1OfAutoDesignDateAndTimeItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignDateAndTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_AutoDesignDateAndTimeItem &
	:rtype: None
") StepAP214_HArray1OfAutoDesignDateAndTimeItem;
		 StepAP214_HArray1OfAutoDesignDateAndTimeItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_AutoDesignDateAndTimeItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignDateAndTimeItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignDateAndTimeItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignDateAndTimeItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignDateAndTimeItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndTimeItem
") Value;
		const StepAP214_AutoDesignDateAndTimeItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDateAndTimeItem
") ChangeValue;
		StepAP214_AutoDesignDateAndTimeItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignDateAndTimeItem
") Array1;
		const StepAP214_Array1OfAutoDesignDateAndTimeItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignDateAndTimeItem
") ChangeArray1;
		StepAP214_Array1OfAutoDesignDateAndTimeItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfAutoDesignDateAndTimeItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem::Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem;
class Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem();
        Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &aHandle);
        Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem(const StepAP214_HArray1OfAutoDesignDateAndTimeItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem {
    StepAP214_HArray1OfAutoDesignDateAndTimeItem* _get_reference() {
    return (StepAP214_HArray1OfAutoDesignDateAndTimeItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfAutoDesignDateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfAutoDesignDatedItem;
class StepAP214_HArray1OfAutoDesignDatedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignDatedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfAutoDesignDatedItem;
		 StepAP214_HArray1OfAutoDesignDatedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignDatedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_AutoDesignDatedItem &
	:rtype: None
") StepAP214_HArray1OfAutoDesignDatedItem;
		 StepAP214_HArray1OfAutoDesignDatedItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_AutoDesignDatedItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignDatedItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignDatedItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignDatedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignDatedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDatedItem
") Value;
		const StepAP214_AutoDesignDatedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignDatedItem
") ChangeValue;
		StepAP214_AutoDesignDatedItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignDatedItem
") Array1;
		const StepAP214_Array1OfAutoDesignDatedItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignDatedItem
") ChangeArray1;
		StepAP214_Array1OfAutoDesignDatedItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfAutoDesignDatedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfAutoDesignDatedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfAutoDesignDatedItem::Handle_StepAP214_HArray1OfAutoDesignDatedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfAutoDesignDatedItem;
class Handle_StepAP214_HArray1OfAutoDesignDatedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfAutoDesignDatedItem();
        Handle_StepAP214_HArray1OfAutoDesignDatedItem(const Handle_StepAP214_HArray1OfAutoDesignDatedItem &aHandle);
        Handle_StepAP214_HArray1OfAutoDesignDatedItem(const StepAP214_HArray1OfAutoDesignDatedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfAutoDesignDatedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfAutoDesignDatedItem {
    StepAP214_HArray1OfAutoDesignDatedItem* _get_reference() {
    return (StepAP214_HArray1OfAutoDesignDatedItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfAutoDesignDatedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfAutoDesignDatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfAutoDesignGeneralOrgItem;
class StepAP214_HArray1OfAutoDesignGeneralOrgItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignGeneralOrgItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfAutoDesignGeneralOrgItem;
		 StepAP214_HArray1OfAutoDesignGeneralOrgItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignGeneralOrgItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_AutoDesignGeneralOrgItem &
	:rtype: None
") StepAP214_HArray1OfAutoDesignGeneralOrgItem;
		 StepAP214_HArray1OfAutoDesignGeneralOrgItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_AutoDesignGeneralOrgItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignGeneralOrgItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignGeneralOrgItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignGeneralOrgItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignGeneralOrgItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGeneralOrgItem
") Value;
		const StepAP214_AutoDesignGeneralOrgItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGeneralOrgItem
") ChangeValue;
		StepAP214_AutoDesignGeneralOrgItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignGeneralOrgItem
") Array1;
		const StepAP214_Array1OfAutoDesignGeneralOrgItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignGeneralOrgItem
") ChangeArray1;
		StepAP214_Array1OfAutoDesignGeneralOrgItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfAutoDesignGeneralOrgItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem::Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem;
class Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem();
        Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &aHandle);
        Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem(const StepAP214_HArray1OfAutoDesignGeneralOrgItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem {
    StepAP214_HArray1OfAutoDesignGeneralOrgItem* _get_reference() {
    return (StepAP214_HArray1OfAutoDesignGeneralOrgItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfAutoDesignGeneralOrgItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfAutoDesignGroupedItem;
class StepAP214_HArray1OfAutoDesignGroupedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignGroupedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfAutoDesignGroupedItem;
		 StepAP214_HArray1OfAutoDesignGroupedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignGroupedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_AutoDesignGroupedItem &
	:rtype: None
") StepAP214_HArray1OfAutoDesignGroupedItem;
		 StepAP214_HArray1OfAutoDesignGroupedItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_AutoDesignGroupedItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignGroupedItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignGroupedItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignGroupedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignGroupedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGroupedItem
") Value;
		const StepAP214_AutoDesignGroupedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignGroupedItem
") ChangeValue;
		StepAP214_AutoDesignGroupedItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignGroupedItem
") Array1;
		const StepAP214_Array1OfAutoDesignGroupedItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignGroupedItem
") ChangeArray1;
		StepAP214_Array1OfAutoDesignGroupedItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfAutoDesignGroupedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfAutoDesignGroupedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfAutoDesignGroupedItem::Handle_StepAP214_HArray1OfAutoDesignGroupedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfAutoDesignGroupedItem;
class Handle_StepAP214_HArray1OfAutoDesignGroupedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfAutoDesignGroupedItem();
        Handle_StepAP214_HArray1OfAutoDesignGroupedItem(const Handle_StepAP214_HArray1OfAutoDesignGroupedItem &aHandle);
        Handle_StepAP214_HArray1OfAutoDesignGroupedItem(const StepAP214_HArray1OfAutoDesignGroupedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfAutoDesignGroupedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfAutoDesignGroupedItem {
    StepAP214_HArray1OfAutoDesignGroupedItem* _get_reference() {
    return (StepAP214_HArray1OfAutoDesignGroupedItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfAutoDesignGroupedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfAutoDesignGroupedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfAutoDesignPresentedItemSelect;
class StepAP214_HArray1OfAutoDesignPresentedItemSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignPresentedItemSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfAutoDesignPresentedItemSelect;
		 StepAP214_HArray1OfAutoDesignPresentedItemSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignPresentedItemSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_AutoDesignPresentedItemSelect &
	:rtype: None
") StepAP214_HArray1OfAutoDesignPresentedItemSelect;
		 StepAP214_HArray1OfAutoDesignPresentedItemSelect (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_AutoDesignPresentedItemSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignPresentedItemSelect &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignPresentedItemSelect & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignPresentedItemSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignPresentedItemSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignPresentedItemSelect
") Value;
		const StepAP214_AutoDesignPresentedItemSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignPresentedItemSelect
") ChangeValue;
		StepAP214_AutoDesignPresentedItemSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignPresentedItemSelect
") Array1;
		const StepAP214_Array1OfAutoDesignPresentedItemSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignPresentedItemSelect
") ChangeArray1;
		StepAP214_Array1OfAutoDesignPresentedItemSelect & ChangeArray1 ();
};


%extend StepAP214_HArray1OfAutoDesignPresentedItemSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect::Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect;
class Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect();
        Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect &aHandle);
        Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect(const StepAP214_HArray1OfAutoDesignPresentedItemSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect {
    StepAP214_HArray1OfAutoDesignPresentedItemSelect* _get_reference() {
    return (StepAP214_HArray1OfAutoDesignPresentedItemSelect*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfAutoDesignPresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfAutoDesignReferencingItem;
class StepAP214_HArray1OfAutoDesignReferencingItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignReferencingItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfAutoDesignReferencingItem;
		 StepAP214_HArray1OfAutoDesignReferencingItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfAutoDesignReferencingItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_AutoDesignReferencingItem &
	:rtype: None
") StepAP214_HArray1OfAutoDesignReferencingItem;
		 StepAP214_HArray1OfAutoDesignReferencingItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_AutoDesignReferencingItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_AutoDesignReferencingItem &
	:rtype: None
") Init;
		void Init (const StepAP214_AutoDesignReferencingItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_AutoDesignReferencingItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_AutoDesignReferencingItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignReferencingItem
") Value;
		const StepAP214_AutoDesignReferencingItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_AutoDesignReferencingItem
") ChangeValue;
		StepAP214_AutoDesignReferencingItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignReferencingItem
") Array1;
		const StepAP214_Array1OfAutoDesignReferencingItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfAutoDesignReferencingItem
") ChangeArray1;
		StepAP214_Array1OfAutoDesignReferencingItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfAutoDesignReferencingItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfAutoDesignReferencingItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfAutoDesignReferencingItem::Handle_StepAP214_HArray1OfAutoDesignReferencingItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfAutoDesignReferencingItem;
class Handle_StepAP214_HArray1OfAutoDesignReferencingItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfAutoDesignReferencingItem();
        Handle_StepAP214_HArray1OfAutoDesignReferencingItem(const Handle_StepAP214_HArray1OfAutoDesignReferencingItem &aHandle);
        Handle_StepAP214_HArray1OfAutoDesignReferencingItem(const StepAP214_HArray1OfAutoDesignReferencingItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfAutoDesignReferencingItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfAutoDesignReferencingItem {
    StepAP214_HArray1OfAutoDesignReferencingItem* _get_reference() {
    return (StepAP214_HArray1OfAutoDesignReferencingItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfAutoDesignReferencingItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfAutoDesignReferencingItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfDateAndTimeItem;
class StepAP214_HArray1OfDateAndTimeItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfDateAndTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfDateAndTimeItem;
		 StepAP214_HArray1OfDateAndTimeItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfDateAndTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_DateAndTimeItem &
	:rtype: None
") StepAP214_HArray1OfDateAndTimeItem;
		 StepAP214_HArray1OfDateAndTimeItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_DateAndTimeItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_DateAndTimeItem &
	:rtype: None
") Init;
		void Init (const StepAP214_DateAndTimeItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_DateAndTimeItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_DateAndTimeItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateAndTimeItem
") Value;
		const StepAP214_DateAndTimeItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateAndTimeItem
") ChangeValue;
		StepAP214_DateAndTimeItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfDateAndTimeItem
") Array1;
		const StepAP214_Array1OfDateAndTimeItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfDateAndTimeItem
") ChangeArray1;
		StepAP214_Array1OfDateAndTimeItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfDateAndTimeItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfDateAndTimeItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfDateAndTimeItem::Handle_StepAP214_HArray1OfDateAndTimeItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfDateAndTimeItem;
class Handle_StepAP214_HArray1OfDateAndTimeItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfDateAndTimeItem();
        Handle_StepAP214_HArray1OfDateAndTimeItem(const Handle_StepAP214_HArray1OfDateAndTimeItem &aHandle);
        Handle_StepAP214_HArray1OfDateAndTimeItem(const StepAP214_HArray1OfDateAndTimeItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfDateAndTimeItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfDateAndTimeItem {
    StepAP214_HArray1OfDateAndTimeItem* _get_reference() {
    return (StepAP214_HArray1OfDateAndTimeItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfDateAndTimeItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfDateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfDateItem;
class StepAP214_HArray1OfDateItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfDateItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfDateItem;
		 StepAP214_HArray1OfDateItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfDateItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_DateItem &
	:rtype: None
") StepAP214_HArray1OfDateItem;
		 StepAP214_HArray1OfDateItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_DateItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_DateItem &
	:rtype: None
") Init;
		void Init (const StepAP214_DateItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_DateItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_DateItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateItem
") Value;
		const StepAP214_DateItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DateItem
") ChangeValue;
		StepAP214_DateItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfDateItem
") Array1;
		const StepAP214_Array1OfDateItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfDateItem
") ChangeArray1;
		StepAP214_Array1OfDateItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfDateItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfDateItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfDateItem::Handle_StepAP214_HArray1OfDateItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfDateItem;
class Handle_StepAP214_HArray1OfDateItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfDateItem();
        Handle_StepAP214_HArray1OfDateItem(const Handle_StepAP214_HArray1OfDateItem &aHandle);
        Handle_StepAP214_HArray1OfDateItem(const StepAP214_HArray1OfDateItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfDateItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfDateItem {
    StepAP214_HArray1OfDateItem* _get_reference() {
    return (StepAP214_HArray1OfDateItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfDateItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfDateItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfDocumentReferenceItem;
class StepAP214_HArray1OfDocumentReferenceItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfDocumentReferenceItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfDocumentReferenceItem;
		 StepAP214_HArray1OfDocumentReferenceItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfDocumentReferenceItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_DocumentReferenceItem &
	:rtype: None
") StepAP214_HArray1OfDocumentReferenceItem;
		 StepAP214_HArray1OfDocumentReferenceItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_DocumentReferenceItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_DocumentReferenceItem &
	:rtype: None
") Init;
		void Init (const StepAP214_DocumentReferenceItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_DocumentReferenceItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_DocumentReferenceItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DocumentReferenceItem
") Value;
		const StepAP214_DocumentReferenceItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_DocumentReferenceItem
") ChangeValue;
		StepAP214_DocumentReferenceItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfDocumentReferenceItem
") Array1;
		const StepAP214_Array1OfDocumentReferenceItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfDocumentReferenceItem
") ChangeArray1;
		StepAP214_Array1OfDocumentReferenceItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfDocumentReferenceItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfDocumentReferenceItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfDocumentReferenceItem::Handle_StepAP214_HArray1OfDocumentReferenceItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfDocumentReferenceItem;
class Handle_StepAP214_HArray1OfDocumentReferenceItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfDocumentReferenceItem();
        Handle_StepAP214_HArray1OfDocumentReferenceItem(const Handle_StepAP214_HArray1OfDocumentReferenceItem &aHandle);
        Handle_StepAP214_HArray1OfDocumentReferenceItem(const StepAP214_HArray1OfDocumentReferenceItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfDocumentReferenceItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfDocumentReferenceItem {
    StepAP214_HArray1OfDocumentReferenceItem* _get_reference() {
    return (StepAP214_HArray1OfDocumentReferenceItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfDocumentReferenceItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfDocumentReferenceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfExternalIdentificationItem;
class StepAP214_HArray1OfExternalIdentificationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfExternalIdentificationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfExternalIdentificationItem;
		 StepAP214_HArray1OfExternalIdentificationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfExternalIdentificationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_ExternalIdentificationItem &
	:rtype: None
") StepAP214_HArray1OfExternalIdentificationItem;
		 StepAP214_HArray1OfExternalIdentificationItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_ExternalIdentificationItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_ExternalIdentificationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_ExternalIdentificationItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_ExternalIdentificationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_ExternalIdentificationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ExternalIdentificationItem
") Value;
		const StepAP214_ExternalIdentificationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_ExternalIdentificationItem
") ChangeValue;
		StepAP214_ExternalIdentificationItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfExternalIdentificationItem
") Array1;
		const StepAP214_Array1OfExternalIdentificationItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfExternalIdentificationItem
") ChangeArray1;
		StepAP214_Array1OfExternalIdentificationItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfExternalIdentificationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfExternalIdentificationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfExternalIdentificationItem::Handle_StepAP214_HArray1OfExternalIdentificationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfExternalIdentificationItem;
class Handle_StepAP214_HArray1OfExternalIdentificationItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfExternalIdentificationItem();
        Handle_StepAP214_HArray1OfExternalIdentificationItem(const Handle_StepAP214_HArray1OfExternalIdentificationItem &aHandle);
        Handle_StepAP214_HArray1OfExternalIdentificationItem(const StepAP214_HArray1OfExternalIdentificationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfExternalIdentificationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfExternalIdentificationItem {
    StepAP214_HArray1OfExternalIdentificationItem* _get_reference() {
    return (StepAP214_HArray1OfExternalIdentificationItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfExternalIdentificationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfExternalIdentificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfGroupItem;
class StepAP214_HArray1OfGroupItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfGroupItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfGroupItem;
		 StepAP214_HArray1OfGroupItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfGroupItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_GroupItem &
	:rtype: None
") StepAP214_HArray1OfGroupItem;
		 StepAP214_HArray1OfGroupItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_GroupItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_GroupItem &
	:rtype: None
") Init;
		void Init (const StepAP214_GroupItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_GroupItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_GroupItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_GroupItem
") Value;
		const StepAP214_GroupItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_GroupItem
") ChangeValue;
		StepAP214_GroupItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfGroupItem
") Array1;
		const StepAP214_Array1OfGroupItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfGroupItem
") ChangeArray1;
		StepAP214_Array1OfGroupItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfGroupItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfGroupItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfGroupItem::Handle_StepAP214_HArray1OfGroupItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfGroupItem;
class Handle_StepAP214_HArray1OfGroupItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfGroupItem();
        Handle_StepAP214_HArray1OfGroupItem(const Handle_StepAP214_HArray1OfGroupItem &aHandle);
        Handle_StepAP214_HArray1OfGroupItem(const StepAP214_HArray1OfGroupItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfGroupItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfGroupItem {
    StepAP214_HArray1OfGroupItem* _get_reference() {
    return (StepAP214_HArray1OfGroupItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfGroupItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfGroupItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfOrganizationItem;
class StepAP214_HArray1OfOrganizationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfOrganizationItem;
		 StepAP214_HArray1OfOrganizationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_OrganizationItem &
	:rtype: None
") StepAP214_HArray1OfOrganizationItem;
		 StepAP214_HArray1OfOrganizationItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_OrganizationItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_OrganizationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_OrganizationItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_OrganizationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_OrganizationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_OrganizationItem
") Value;
		const StepAP214_OrganizationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_OrganizationItem
") ChangeValue;
		StepAP214_OrganizationItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfOrganizationItem
") Array1;
		const StepAP214_Array1OfOrganizationItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfOrganizationItem
") ChangeArray1;
		StepAP214_Array1OfOrganizationItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfOrganizationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfOrganizationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfOrganizationItem::Handle_StepAP214_HArray1OfOrganizationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfOrganizationItem;
class Handle_StepAP214_HArray1OfOrganizationItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfOrganizationItem();
        Handle_StepAP214_HArray1OfOrganizationItem(const Handle_StepAP214_HArray1OfOrganizationItem &aHandle);
        Handle_StepAP214_HArray1OfOrganizationItem(const StepAP214_HArray1OfOrganizationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfOrganizationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfOrganizationItem {
    StepAP214_HArray1OfOrganizationItem* _get_reference() {
    return (StepAP214_HArray1OfOrganizationItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfOrganizationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfPersonAndOrganizationItem;
class StepAP214_HArray1OfPersonAndOrganizationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfPersonAndOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfPersonAndOrganizationItem;
		 StepAP214_HArray1OfPersonAndOrganizationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfPersonAndOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_PersonAndOrganizationItem &
	:rtype: None
") StepAP214_HArray1OfPersonAndOrganizationItem;
		 StepAP214_HArray1OfPersonAndOrganizationItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_PersonAndOrganizationItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_PersonAndOrganizationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_PersonAndOrganizationItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_PersonAndOrganizationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_PersonAndOrganizationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PersonAndOrganizationItem
") Value;
		const StepAP214_PersonAndOrganizationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PersonAndOrganizationItem
") ChangeValue;
		StepAP214_PersonAndOrganizationItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfPersonAndOrganizationItem
") Array1;
		const StepAP214_Array1OfPersonAndOrganizationItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfPersonAndOrganizationItem
") ChangeArray1;
		StepAP214_Array1OfPersonAndOrganizationItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfPersonAndOrganizationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfPersonAndOrganizationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfPersonAndOrganizationItem::Handle_StepAP214_HArray1OfPersonAndOrganizationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfPersonAndOrganizationItem;
class Handle_StepAP214_HArray1OfPersonAndOrganizationItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfPersonAndOrganizationItem();
        Handle_StepAP214_HArray1OfPersonAndOrganizationItem(const Handle_StepAP214_HArray1OfPersonAndOrganizationItem &aHandle);
        Handle_StepAP214_HArray1OfPersonAndOrganizationItem(const StepAP214_HArray1OfPersonAndOrganizationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfPersonAndOrganizationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfPersonAndOrganizationItem {
    StepAP214_HArray1OfPersonAndOrganizationItem* _get_reference() {
    return (StepAP214_HArray1OfPersonAndOrganizationItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfPersonAndOrganizationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfPersonAndOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfPresentedItemSelect;
class StepAP214_HArray1OfPresentedItemSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfPresentedItemSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfPresentedItemSelect;
		 StepAP214_HArray1OfPresentedItemSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfPresentedItemSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_PresentedItemSelect &
	:rtype: None
") StepAP214_HArray1OfPresentedItemSelect;
		 StepAP214_HArray1OfPresentedItemSelect (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_PresentedItemSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_PresentedItemSelect &
	:rtype: None
") Init;
		void Init (const StepAP214_PresentedItemSelect & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_PresentedItemSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_PresentedItemSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PresentedItemSelect
") Value;
		const StepAP214_PresentedItemSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_PresentedItemSelect
") ChangeValue;
		StepAP214_PresentedItemSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfPresentedItemSelect
") Array1;
		const StepAP214_Array1OfPresentedItemSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfPresentedItemSelect
") ChangeArray1;
		StepAP214_Array1OfPresentedItemSelect & ChangeArray1 ();
};


%extend StepAP214_HArray1OfPresentedItemSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfPresentedItemSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfPresentedItemSelect::Handle_StepAP214_HArray1OfPresentedItemSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfPresentedItemSelect;
class Handle_StepAP214_HArray1OfPresentedItemSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfPresentedItemSelect();
        Handle_StepAP214_HArray1OfPresentedItemSelect(const Handle_StepAP214_HArray1OfPresentedItemSelect &aHandle);
        Handle_StepAP214_HArray1OfPresentedItemSelect(const StepAP214_HArray1OfPresentedItemSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfPresentedItemSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfPresentedItemSelect {
    StepAP214_HArray1OfPresentedItemSelect* _get_reference() {
    return (StepAP214_HArray1OfPresentedItemSelect*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfPresentedItemSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfPresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_HArray1OfSecurityClassificationItem;
class StepAP214_HArray1OfSecurityClassificationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP214_HArray1OfSecurityClassificationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP214_HArray1OfSecurityClassificationItem;
		 StepAP214_HArray1OfSecurityClassificationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP214_HArray1OfSecurityClassificationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP214_SecurityClassificationItem &
	:rtype: None
") StepAP214_HArray1OfSecurityClassificationItem;
		 StepAP214_HArray1OfSecurityClassificationItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP214_SecurityClassificationItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP214_SecurityClassificationItem &
	:rtype: None
") Init;
		void Init (const StepAP214_SecurityClassificationItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP214_SecurityClassificationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP214_SecurityClassificationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_SecurityClassificationItem
") Value;
		const StepAP214_SecurityClassificationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP214_SecurityClassificationItem
") ChangeValue;
		StepAP214_SecurityClassificationItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfSecurityClassificationItem
") Array1;
		const StepAP214_Array1OfSecurityClassificationItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP214_Array1OfSecurityClassificationItem
") ChangeArray1;
		StepAP214_Array1OfSecurityClassificationItem & ChangeArray1 ();
};


%extend StepAP214_HArray1OfSecurityClassificationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_HArray1OfSecurityClassificationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_HArray1OfSecurityClassificationItem::Handle_StepAP214_HArray1OfSecurityClassificationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_HArray1OfSecurityClassificationItem;
class Handle_StepAP214_HArray1OfSecurityClassificationItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP214_HArray1OfSecurityClassificationItem();
        Handle_StepAP214_HArray1OfSecurityClassificationItem(const Handle_StepAP214_HArray1OfSecurityClassificationItem &aHandle);
        Handle_StepAP214_HArray1OfSecurityClassificationItem(const StepAP214_HArray1OfSecurityClassificationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_HArray1OfSecurityClassificationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_HArray1OfSecurityClassificationItem {
    StepAP214_HArray1OfSecurityClassificationItem* _get_reference() {
    return (StepAP214_HArray1OfSecurityClassificationItem*)$self->Access();
    }
};

%extend Handle_StepAP214_HArray1OfSecurityClassificationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_HArray1OfSecurityClassificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_PresentedItemSelect;
class StepAP214_PresentedItemSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP214_PresentedItemSelect;
		%feature("autodoc", "	* Returns a PresentedItemSelect SelectType

	:rtype: None
") StepAP214_PresentedItemSelect;
		 StepAP214_PresentedItemSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PresentedItemSelect Kind Entity that is : 1 -> ProductDefinition, 2 -> ProductDefinitionRelationship, 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* returns Value as a ProductDefinitionRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
};


%extend StepAP214_PresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Protocol;
class StepAP214_Protocol : public StepData_Protocol {
	public:
		%feature("compactdefaultargs") StepAP214_Protocol;
		%feature("autodoc", "	:rtype: None
") StepAP214_Protocol;
		 StepAP214_Protocol ();
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "	* Returns a Case Number for each of the StepAP214 Entities

	:param atype:
	:type atype: Handle_Standard_Type &
	:rtype: int
") TypeNumber;
		virtual Standard_Integer TypeNumber (const Handle_Standard_Type & atype);
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: char *
") SchemaName;
		virtual const char * SchemaName ();
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "	* Returns count of Protocol used as Resources (level one)

	:rtype: int
") NbResources;
		virtual Standard_Integer NbResources ();
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "	* Returns a Resource, given its rank (between 1 and NbResources)

	:param num:
	:type num: int
	:rtype: Handle_Interface_Protocol
") Resource;
		virtual Handle_Interface_Protocol Resource (const Standard_Integer num);
};


%extend StepAP214_Protocol {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_Protocol(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_Protocol::Handle_StepAP214_Protocol %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_Protocol;
class Handle_StepAP214_Protocol : public Handle_StepData_Protocol {

    public:
        // constructors
        Handle_StepAP214_Protocol();
        Handle_StepAP214_Protocol(const Handle_StepAP214_Protocol &aHandle);
        Handle_StepAP214_Protocol(const StepAP214_Protocol *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_Protocol DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_Protocol {
    StepAP214_Protocol* _get_reference() {
    return (StepAP214_Protocol*)$self->Access();
    }
};

%extend Handle_StepAP214_Protocol {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_RepItemGroup;
class StepAP214_RepItemGroup : public StepBasic_Group {
	public:
		%feature("compactdefaultargs") StepAP214_RepItemGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_RepItemGroup;
		 StepAP214_RepItemGroup ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGroup_Name:
	:type aGroup_Name: Handle_TCollection_HAsciiString &
	:param hasGroup_Description:
	:type hasGroup_Description: bool
	:param aGroup_Description:
	:type aGroup_Description: Handle_TCollection_HAsciiString &
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGroup_Name,const Standard_Boolean hasGroup_Description,const Handle_TCollection_HAsciiString & aGroup_Description,const Handle_TCollection_HAsciiString & aRepresentationItem_Name);
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "	* Returns data for supertype RepresentationItem

	:rtype: Handle_StepRepr_RepresentationItem
") RepresentationItem;
		Handle_StepRepr_RepresentationItem RepresentationItem ();
		%feature("compactdefaultargs") SetRepresentationItem;
		%feature("autodoc", "	* Set data for supertype RepresentationItem

	:param RepresentationItem:
	:type RepresentationItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetRepresentationItem;
		void SetRepresentationItem (const Handle_StepRepr_RepresentationItem & RepresentationItem);
};


%extend StepAP214_RepItemGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_RepItemGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_RepItemGroup::Handle_StepAP214_RepItemGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_RepItemGroup;
class Handle_StepAP214_RepItemGroup : public Handle_StepBasic_Group {

    public:
        // constructors
        Handle_StepAP214_RepItemGroup();
        Handle_StepAP214_RepItemGroup(const Handle_StepAP214_RepItemGroup &aHandle);
        Handle_StepAP214_RepItemGroup(const StepAP214_RepItemGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_RepItemGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_RepItemGroup {
    StepAP214_RepItemGroup* _get_reference() {
    return (StepAP214_RepItemGroup*)$self->Access();
    }
};

%extend Handle_StepAP214_RepItemGroup {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_RepItemGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignOrganizationItem;
class StepAP214_AutoDesignOrganizationItem : public StepAP214_AutoDesignGeneralOrgItem {
	public:
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationItem;
		%feature("autodoc", "	:rtype: None
") StepAP214_AutoDesignOrganizationItem;
		 StepAP214_AutoDesignOrganizationItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Document
") Document;
		Handle_StepBasic_Document Document ();
		%feature("compactdefaultargs") PhysicallyModeledProductDefinition;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PhysicallyModeledProductDefinition
") PhysicallyModeledProductDefinition;
		Handle_StepBasic_PhysicallyModeledProductDefinition PhysicallyModeledProductDefinition ();
};


%extend StepAP214_AutoDesignOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_DateAndTimeItem;
class StepAP214_DateAndTimeItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") StepAP214_DateAndTimeItem;
		%feature("autodoc", "	* Returns a DateAndTimeItem SelectType

	:rtype: None
") StepAP214_DateAndTimeItem;
		 StepAP214_DateAndTimeItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DateAndTimeItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AppliedDateAndPersonAssignment 3 -> AppliedOrganizationAssignment 4 -> AssemblyComponentUsageSubstitute 5 -> DocumentFile 6 -> Effectivity 7 -> MaterialDesignation 8 -> MechanicalDesignGeometricPresentationRepresentation 9 -> PresentationArea 10 -> Product 11 -> ProductDefinition 12 -> ProductDefinitionFormation 13 -> ProductDefinitionRelationship 14 -> PropertyDefinition 15 -> ShapeRepresentation 16 -> SecurityClassification 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "	* returns Value as a ApprovalPersonOrganization (Null if another type)

	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") ApprovalPersonOrganization;
		Handle_StepBasic_ApprovalPersonOrganization ApprovalPersonOrganization ();
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedDateAndPersonAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedPersonAndOrganizationAssignment
") AppliedPersonAndOrganizationAssignment;
		Handle_StepAP214_AppliedPersonAndOrganizationAssignment AppliedPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") Effectivity;
		%feature("autodoc", "	* returns Value as a Effectivity (Null if another type)

	:rtype: Handle_StepBasic_Effectivity
") Effectivity;
		Handle_StepBasic_Effectivity Effectivity ();
};


%extend StepAP214_DateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_DateItem;
class StepAP214_DateItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") StepAP214_DateItem;
		%feature("autodoc", "	* Returns a DateItem SelectType

	:rtype: None
") StepAP214_DateItem;
		 StepAP214_DateItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DateItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AppliedDateAndPersonAssignment 3 -> AppliedOrganizationAssignment 4 -> AssemblyComponentUsageSubstitute 5 -> DocumentFile 6 -> Effectivity 7 -> MaterialDesignation 8 -> MechanicalDesignGeometricPresentationRepresentation 9 -> PresentationArea 10 -> Product 11 -> ProductDefinition 12 -> ProductDefinitionFormation 13 -> ProductDefinitionRelationship 14 -> PropertyDefinition 15 -> ShapeRepresentation 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "	* returns Value as a ApprovalPersonOrganization (Null if another type)

	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") ApprovalPersonOrganization;
		Handle_StepBasic_ApprovalPersonOrganization ApprovalPersonOrganization ();
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedDateAndPersonAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedPersonAndOrganizationAssignment
") AppliedPersonAndOrganizationAssignment;
		Handle_StepAP214_AppliedPersonAndOrganizationAssignment AppliedPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") Effectivity;
		%feature("autodoc", "	* returns Value as a Effectivity (Null if another type)

	:rtype: Handle_StepBasic_Effectivity
") Effectivity;
		Handle_StepBasic_Effectivity Effectivity ();
};


%extend StepAP214_DateItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ExternallyDefinedClass;
class StepAP214_ExternallyDefinedClass : public StepAP214_Class {
	public:
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedClass;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_ExternallyDefinedClass;
		 StepAP214_ExternallyDefinedClass ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aGroup_Name:
	:type aGroup_Name: Handle_TCollection_HAsciiString &
	:param hasGroup_Description:
	:type hasGroup_Description: bool
	:param aGroup_Description:
	:type aGroup_Description: Handle_TCollection_HAsciiString &
	:param aExternallyDefinedItem_ItemId:
	:type aExternallyDefinedItem_ItemId: StepBasic_SourceItem &
	:param aExternallyDefinedItem_Source:
	:type aExternallyDefinedItem_Source: Handle_StepBasic_ExternalSource &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aGroup_Name,const Standard_Boolean hasGroup_Description,const Handle_TCollection_HAsciiString & aGroup_Description,const StepBasic_SourceItem & aExternallyDefinedItem_ItemId,const Handle_StepBasic_ExternalSource & aExternallyDefinedItem_Source);
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "	* Returns data for supertype ExternallyDefinedItem

	:rtype: Handle_StepBasic_ExternallyDefinedItem
") ExternallyDefinedItem;
		Handle_StepBasic_ExternallyDefinedItem ExternallyDefinedItem ();
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "	* Set data for supertype ExternallyDefinedItem

	:param ExternallyDefinedItem:
	:type ExternallyDefinedItem: Handle_StepBasic_ExternallyDefinedItem &
	:rtype: None
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem (const Handle_StepBasic_ExternallyDefinedItem & ExternallyDefinedItem);
};


%extend StepAP214_ExternallyDefinedClass {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP214_ExternallyDefinedClass(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP214_ExternallyDefinedClass::Handle_StepAP214_ExternallyDefinedClass %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP214_ExternallyDefinedClass;
class Handle_StepAP214_ExternallyDefinedClass : public Handle_StepAP214_Class {

    public:
        // constructors
        Handle_StepAP214_ExternallyDefinedClass();
        Handle_StepAP214_ExternallyDefinedClass(const Handle_StepAP214_ExternallyDefinedClass &aHandle);
        Handle_StepAP214_ExternallyDefinedClass(const StepAP214_ExternallyDefinedClass *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP214_ExternallyDefinedClass DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP214_ExternallyDefinedClass {
    StepAP214_ExternallyDefinedClass* _get_reference() {
    return (StepAP214_ExternallyDefinedClass*)$self->Access();
    }
};

%extend Handle_StepAP214_ExternallyDefinedClass {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP214_ExternallyDefinedClass {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_OrganizationItem;
class StepAP214_OrganizationItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") StepAP214_OrganizationItem;
		%feature("autodoc", "	* Returns a OrganizationItem SelectType

	:rtype: None
") StepAP214_OrganizationItem;
		 StepAP214_OrganizationItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a OrganizationItem Kind Entity that is :

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	* returns Value as a Approval (Null if another type)

	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
};


%extend StepAP214_OrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_PersonAndOrganizationItem;
class StepAP214_PersonAndOrganizationItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") StepAP214_PersonAndOrganizationItem;
		%feature("autodoc", "	* Returns a PersonAndOrganizationItem SelectType

	:rtype: None
") StepAP214_PersonAndOrganizationItem;
		 StepAP214_PersonAndOrganizationItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a APersonAndOrganizationItem Kind Entity that is : 1 -> AppliedOrganizationAssignment 2 -> AssemblyComponentUsageSubstitute 3 -> DocumentFile 4 -> MaterialDesignation 5 -> MechanicalDesignGeometricPresentationRepresentation 6 -> PresentationArea 7 -> Product 8 -> ProductDefinition 9 -> ProductDefinitionFormation 10 -> ProductDefinitionRelationship 11 -> PropertyDefinition 12 -> ShapeRepresentation 13 -> SecurityClassification 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
};


%extend StepAP214_PersonAndOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_SecurityClassificationItem;
class StepAP214_SecurityClassificationItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") StepAP214_SecurityClassificationItem;
		%feature("autodoc", "	* Returns a SecurityClassificationItem SelectType

	:rtype: None
") StepAP214_SecurityClassificationItem;
		 StepAP214_SecurityClassificationItem ();
};


%extend StepAP214_SecurityClassificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
