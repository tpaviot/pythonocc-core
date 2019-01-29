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
%define STEPAP214DOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=STEPAP214DOCSTRING) StepAP214

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


%include StepAP214_headers.i

/* templates */
%template(StepAP214_Array1OfOrganizationItem) NCollection_Array1 <StepAP214_OrganizationItem>;

%extend NCollection_Array1 <StepAP214_OrganizationItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfDateAndTimeItem) NCollection_Array1 <StepAP214_DateAndTimeItem>;

%extend NCollection_Array1 <StepAP214_DateAndTimeItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfDateItem) NCollection_Array1 <StepAP214_DateItem>;

%extend NCollection_Array1 <StepAP214_DateItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfPresentedItemSelect) NCollection_Array1 <StepAP214_PresentedItemSelect>;

%extend NCollection_Array1 <StepAP214_PresentedItemSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfDocumentReferenceItem) NCollection_Array1 <StepAP214_DocumentReferenceItem>;

%extend NCollection_Array1 <StepAP214_DocumentReferenceItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfSecurityClassificationItem) NCollection_Array1 <StepAP214_SecurityClassificationItem>;

%extend NCollection_Array1 <StepAP214_SecurityClassificationItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfPersonAndOrganizationItem) NCollection_Array1 <StepAP214_PersonAndOrganizationItem>;

%extend NCollection_Array1 <StepAP214_PersonAndOrganizationItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfAutoDesignGeneralOrgItem) NCollection_Array1 <StepAP214_AutoDesignGeneralOrgItem>;

%extend NCollection_Array1 <StepAP214_AutoDesignGeneralOrgItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfGroupItem) NCollection_Array1 <StepAP214_GroupItem>;

%extend NCollection_Array1 <StepAP214_GroupItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfApprovalItem) NCollection_Array1 <StepAP214_ApprovalItem>;

%extend NCollection_Array1 <StepAP214_ApprovalItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfAutoDesignReferencingItem) NCollection_Array1 <StepAP214_AutoDesignReferencingItem>;

%extend NCollection_Array1 <StepAP214_AutoDesignReferencingItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfAutoDesignDatedItem) NCollection_Array1 <StepAP214_AutoDesignDatedItem>;

%extend NCollection_Array1 <StepAP214_AutoDesignDatedItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfExternalIdentificationItem) NCollection_Array1 <StepAP214_ExternalIdentificationItem>;

%extend NCollection_Array1 <StepAP214_ExternalIdentificationItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfAutoDesignGroupedItem) NCollection_Array1 <StepAP214_AutoDesignGroupedItem>;

%extend NCollection_Array1 <StepAP214_AutoDesignGroupedItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfAutoDesignPresentedItemSelect) NCollection_Array1 <StepAP214_AutoDesignPresentedItemSelect>;

%extend NCollection_Array1 <StepAP214_AutoDesignPresentedItemSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfAutoDesignDateAndTimeItem) NCollection_Array1 <StepAP214_AutoDesignDateAndTimeItem>;

%extend NCollection_Array1 <StepAP214_AutoDesignDateAndTimeItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP214_Array1OfAutoDesignDateAndPersonItem) NCollection_Array1 <StepAP214_AutoDesignDateAndPersonItem>;

%extend NCollection_Array1 <StepAP214_AutoDesignDateAndPersonItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */


/* typedefs */
typedef NCollection_Array1 <StepAP214_OrganizationItem> StepAP214_Array1OfOrganizationItem;
typedef NCollection_Array1 <StepAP214_DateAndTimeItem> StepAP214_Array1OfDateAndTimeItem;
typedef NCollection_Array1 <StepAP214_DateItem> StepAP214_Array1OfDateItem;
typedef NCollection_Array1 <StepAP214_PresentedItemSelect> StepAP214_Array1OfPresentedItemSelect;
typedef NCollection_Array1 <StepAP214_DocumentReferenceItem> StepAP214_Array1OfDocumentReferenceItem;
typedef NCollection_Array1 <StepAP214_SecurityClassificationItem> StepAP214_Array1OfSecurityClassificationItem;
typedef NCollection_Array1 <StepAP214_PersonAndOrganizationItem> StepAP214_Array1OfPersonAndOrganizationItem;
typedef NCollection_Array1 <StepAP214_AutoDesignGeneralOrgItem> StepAP214_Array1OfAutoDesignGeneralOrgItem;
typedef NCollection_Array1 <StepAP214_GroupItem> StepAP214_Array1OfGroupItem;
typedef NCollection_Array1 <StepAP214_ApprovalItem> StepAP214_Array1OfApprovalItem;
typedef NCollection_Array1 <StepAP214_AutoDesignReferencingItem> StepAP214_Array1OfAutoDesignReferencingItem;
typedef NCollection_Array1 <StepAP214_AutoDesignDatedItem> StepAP214_Array1OfAutoDesignDatedItem;
typedef NCollection_Array1 <StepAP214_ExternalIdentificationItem> StepAP214_Array1OfExternalIdentificationItem;
typedef NCollection_Array1 <StepAP214_AutoDesignGroupedItem> StepAP214_Array1OfAutoDesignGroupedItem;
typedef NCollection_Array1 <StepAP214_AutoDesignPresentedItemSelect> StepAP214_Array1OfAutoDesignPresentedItemSelect;
typedef NCollection_Array1 <StepAP214_AutoDesignDateAndTimeItem> StepAP214_Array1OfAutoDesignDateAndTimeItem;
typedef NCollection_Array1 <StepAP214_AutoDesignDateAndPersonItem> StepAP214_Array1OfAutoDesignDateAndPersonItem;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(StepAP214_AppliedApprovalAssignment)
%wrap_handle(StepAP214_AppliedDateAndTimeAssignment)
%wrap_handle(StepAP214_AppliedDateAssignment)
%wrap_handle(StepAP214_AppliedDocumentReference)
%wrap_handle(StepAP214_AppliedExternalIdentificationAssignment)
%wrap_handle(StepAP214_AppliedGroupAssignment)
%wrap_handle(StepAP214_AppliedOrganizationAssignment)
%wrap_handle(StepAP214_AppliedPersonAndOrganizationAssignment)
%wrap_handle(StepAP214_AppliedPresentedItem)
%wrap_handle(StepAP214_AppliedSecurityClassificationAssignment)
%wrap_handle(StepAP214_AutoDesignActualDateAndTimeAssignment)
%wrap_handle(StepAP214_AutoDesignActualDateAssignment)
%wrap_handle(StepAP214_AutoDesignApprovalAssignment)
%wrap_handle(StepAP214_AutoDesignDateAndPersonAssignment)
%wrap_handle(StepAP214_AutoDesignDocumentReference)
%wrap_handle(StepAP214_AutoDesignGroupAssignment)
%wrap_handle(StepAP214_AutoDesignNominalDateAndTimeAssignment)
%wrap_handle(StepAP214_AutoDesignNominalDateAssignment)
%wrap_handle(StepAP214_AutoDesignOrganizationAssignment)
%wrap_handle(StepAP214_AutoDesignPersonAndOrganizationAssignment)
%wrap_handle(StepAP214_AutoDesignPresentedItem)
%wrap_handle(StepAP214_AutoDesignSecurityClassificationAssignment)
%wrap_handle(StepAP214_Class)
%wrap_handle(StepAP214_ExternallyDefinedGeneralProperty)
%wrap_handle(StepAP214_Protocol)
%wrap_handle(StepAP214_RepItemGroup)
%wrap_handle(StepAP214_ExternallyDefinedClass)

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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfApprovalItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Approval & aAssignedApproval,const Handle_StepAP214_HArray1OfApprovalItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfApprovalItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfApprovalItem & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedApprovalAssignment;
		%feature("autodoc", "	* Returns a AppliedApprovalAssignment

	:rtype: None
") StepAP214_AppliedApprovalAssignment;
		 StepAP214_AppliedApprovalAssignment ();
};


%make_alias(StepAP214_AppliedApprovalAssignment)

%extend StepAP214_AppliedApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedDateAndTimeAssignment;
class StepAP214_AppliedDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateAndTimeItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole,const Handle_StepAP214_HArray1OfDateAndTimeItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateAndTimeItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfDateAndTimeItem & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedDateAndTimeAssignment;
		%feature("autodoc", "	* Returns a AppliedDateAndTimeAssignment

	:rtype: None
") StepAP214_AppliedDateAndTimeAssignment;
		 StepAP214_AppliedDateAndTimeAssignment ();
};


%make_alias(StepAP214_AppliedDateAndTimeAssignment)

%extend StepAP214_AppliedDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedDateAssignment;
class StepAP214_AppliedDateAssignment : public StepBasic_DateAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole,const Handle_StepAP214_HArray1OfDateItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDateItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfDateItem & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedDateAssignment;
		%feature("autodoc", "	* Returns a AppliedDateAssignment

	:rtype: None
") StepAP214_AppliedDateAssignment;
		 StepAP214_AppliedDateAssignment ();
};


%make_alias(StepAP214_AppliedDateAssignment)

%extend StepAP214_AppliedDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedDocumentReference;
class StepAP214_AppliedDocumentReference : public StepBasic_DocumentReference {
	public:
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfDocumentReferenceItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfDocumentReferenceItem & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedDocumentReference;
		%feature("autodoc", "	:rtype: None
") StepAP214_AppliedDocumentReference;
		 StepAP214_AppliedDocumentReference ();
};


%make_alias(StepAP214_AppliedDocumentReference)

%extend StepAP214_AppliedDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedExternalIdentificationAssignment;
class StepAP214_AppliedExternalIdentificationAssignment : public StepBasic_ExternalIdentificationAssignment {
	public:
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
		%feature("compactdefaultargs") StepAP214_AppliedExternalIdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_AppliedExternalIdentificationAssignment;
		 StepAP214_AppliedExternalIdentificationAssignment ();
};


%make_alias(StepAP214_AppliedExternalIdentificationAssignment)

%extend StepAP214_AppliedExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedGroupAssignment;
class StepAP214_AppliedGroupAssignment : public StepBasic_GroupAssignment {
	public:
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
		%feature("compactdefaultargs") StepAP214_AppliedGroupAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_AppliedGroupAssignment;
		 StepAP214_AppliedGroupAssignment ();
};


%make_alias(StepAP214_AppliedGroupAssignment)

%extend StepAP214_AppliedGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedOrganizationAssignment;
class StepAP214_AppliedOrganizationAssignment : public StepBasic_OrganizationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfOrganizationItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Organization & aAssignedOrganization,const Handle_StepBasic_OrganizationRole & aRole,const Handle_StepAP214_HArray1OfOrganizationItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfOrganizationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfOrganizationItem & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedOrganizationAssignment;
		%feature("autodoc", "	* Returns a AppliedOrganizationAssignment

	:rtype: None
") StepAP214_AppliedOrganizationAssignment;
		 StepAP214_AppliedOrganizationAssignment ();
};


%make_alias(StepAP214_AppliedOrganizationAssignment)

%extend StepAP214_AppliedOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedPersonAndOrganizationAssignment;
class StepAP214_AppliedPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPersonAndOrganizationItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole,const Handle_StepAP214_HArray1OfPersonAndOrganizationItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPersonAndOrganizationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfPersonAndOrganizationItem & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignDateAndPersonAssignment

	:rtype: None
") StepAP214_AppliedPersonAndOrganizationAssignment;
		 StepAP214_AppliedPersonAndOrganizationAssignment ();
};


%make_alias(StepAP214_AppliedPersonAndOrganizationAssignment)

%extend StepAP214_AppliedPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedPresentedItem;
class StepAP214_AppliedPresentedItem : public StepVisual_PresentedItem {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPresentedItemSelect &
	:rtype: None
") Init;
		void Init (const Handle_StepAP214_HArray1OfPresentedItemSelect & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfPresentedItemSelect &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfPresentedItemSelect & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedPresentedItem;
		%feature("autodoc", "	* Returns a AutoDesignPresentedItem

	:rtype: None
") StepAP214_AppliedPresentedItem;
		 StepAP214_AppliedPresentedItem ();
};


%make_alias(StepAP214_AppliedPresentedItem)

%extend StepAP214_AppliedPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AppliedSecurityClassificationAssignment;
class StepAP214_AppliedSecurityClassificationAssignment : public StepBasic_SecurityClassificationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfSecurityClassificationItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification,const Handle_StepAP214_HArray1OfSecurityClassificationItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfSecurityClassificationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfSecurityClassificationItem & aItems);
		%feature("compactdefaultargs") StepAP214_AppliedSecurityClassificationAssignment;
		%feature("autodoc", "	* Returns a AppliedSecurityClassificationAssignment

	:rtype: None
") StepAP214_AppliedSecurityClassificationAssignment;
		 StepAP214_AppliedSecurityClassificationAssignment ();
};


%make_alias(StepAP214_AppliedSecurityClassificationAssignment)

%extend StepAP214_AppliedSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ApprovalItem;
class StepAP214_ApprovalItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") AssemblyComponentUsageSubstitute;
		%feature("autodoc", "	* returns Value as a AssemblyComponentUsageSubstitute (Null if another type)

	:rtype: Handle_StepRepr_AssemblyComponentUsageSubstitute
") AssemblyComponentUsageSubstitute;
		virtual Handle_StepRepr_AssemblyComponentUsageSubstitute AssemblyComponentUsageSubstitute ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a ApprovalItem Kind Entity that is : 1 -> AssemblyComponentUsageSubstitute 2 -> DocumentFile 3 -> MaterialDesignation 4 -> MechanicalDesignGeometricPresentationRepresentation 5 -> PresentationArea 6 -> Product 7 -> ProductDefinition 8 -> ProductDefinitionFormation 9 -> ProductDefinitionRelationship 10 -> PropertyDefinition 11 -> ShapeRepresentation 12 -> SecurityClassification 13 -> ConfigurationItem 14 -> Date 15 -> Document 16 -> Effectivity 17 -> Group 18 -> GroupRelationship 19 -> ProductDefinitionFormationRelationship 20 -> Representation 21 -> ShapeAspectRelationship 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "	* returns Value as a ConfigurationItem (Null if another type)

	:rtype: Handle_StepRepr_ConfigurationItem
") ConfigurationItem;
		virtual Handle_StepRepr_ConfigurationItem ConfigurationItem ();
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "	* returns Value as a Date (Null if another type)

	:rtype: Handle_StepBasic_Date
") Date;
		virtual Handle_StepBasic_Date Date ();
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "	* returns Value as a Document (Null if another type)

	:rtype: Handle_StepBasic_Document
") Document;
		virtual Handle_StepBasic_Document Document ();
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "	* returns Value as a DocumentFile (Null if another type)

	:rtype: Handle_StepBasic_DocumentFile
") DocumentFile;
		virtual Handle_StepBasic_DocumentFile DocumentFile ();
		%feature("compactdefaultargs") Effectivity;
		%feature("autodoc", "	* returns Value as a Effectivity (Null if another type)

	:rtype: Handle_StepBasic_Effectivity
") Effectivity;
		virtual Handle_StepBasic_Effectivity Effectivity ();
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "	* returns Value as a Group (Null if another type)

	:rtype: Handle_StepBasic_Group
") Group;
		virtual Handle_StepBasic_Group Group ();
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "	* returns Value as a GroupRelationship (Null if another type)

	:rtype: Handle_StepBasic_GroupRelationship
") GroupRelationship;
		virtual Handle_StepBasic_GroupRelationship GroupRelationship ();
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
		%feature("compactdefaultargs") ProductDefinitionFormationRelationship;
		%feature("autodoc", "	* returns Value as a ProductDefinitionFormationRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormationRelationship
") ProductDefinitionFormationRelationship;
		virtual Handle_StepBasic_ProductDefinitionFormationRelationship ProductDefinitionFormationRelationship ();
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
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_Representation
") Representation;
		virtual Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "	* returns Value as a SecurityClassification (Null if another type)

	:rtype: Handle_StepBasic_SecurityClassification
") SecurityClassification;
		virtual Handle_StepBasic_SecurityClassification SecurityClassification ();
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "	* returns Value as a ShapeAspectRelationship (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspectRelationship
") ShapeAspectRelationship;
		virtual Handle_StepRepr_ShapeAspectRelationship ShapeAspectRelationship ();
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "	* returns Value as a ShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_ShapeRepresentation
") ShapeRepresentation;
		virtual Handle_StepShape_ShapeRepresentation ShapeRepresentation ();
		%feature("compactdefaultargs") StepAP214_ApprovalItem;
		%feature("autodoc", "	* Returns a ApprovalItem SelectType

	:rtype: None
") StepAP214_ApprovalItem;
		 StepAP214_ApprovalItem ();
};


%extend StepAP214_ApprovalItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignActualDateAndTimeAssignment;
class StepAP214_AutoDesignActualDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "	* Returns a AutoDesignActualDateAndTimeAssignment

	:rtype: None
") StepAP214_AutoDesignActualDateAndTimeAssignment;
		 StepAP214_AutoDesignActualDateAndTimeAssignment ();
};


%make_alias(StepAP214_AutoDesignActualDateAndTimeAssignment)

%extend StepAP214_AutoDesignActualDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignActualDateAssignment;
class StepAP214_AutoDesignActualDateAssignment : public StepBasic_DateAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAssignment;
		%feature("autodoc", "	* Returns a AutoDesignActualDateAssignment

	:rtype: None
") StepAP214_AutoDesignActualDateAssignment;
		 StepAP214_AutoDesignActualDateAssignment ();
};


%make_alias(StepAP214_AutoDesignActualDateAssignment)

%extend StepAP214_AutoDesignActualDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignApprovalAssignment;
class StepAP214_AutoDesignApprovalAssignment : public StepBasic_ApprovalAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: Handle_StepBasic_Approval &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Approval & aAssignedApproval,const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignApprovalAssignment;
		%feature("autodoc", "	* Returns a AutoDesignApprovalAssignment

	:rtype: None
") StepAP214_AutoDesignApprovalAssignment;
		 StepAP214_AutoDesignApprovalAssignment ();
};


%make_alias(StepAP214_AutoDesignApprovalAssignment)

%extend StepAP214_AutoDesignApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDateAndPersonAssignment;
class StepAP214_AutoDesignDateAndPersonAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDateAndPersonItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "	* Returns a AutoDesignDateAndPersonAssignment

	:rtype: None
") StepAP214_AutoDesignDateAndPersonAssignment;
		 StepAP214_AutoDesignDateAndPersonAssignment ();
};


%make_alias(StepAP214_AutoDesignDateAndPersonAssignment)

%extend StepAP214_AutoDesignDateAndPersonAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDateAndPersonItem;
class StepAP214_AutoDesignDateAndPersonItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "	:rtype: Handle_StepAP214_AutoDesignDocumentReference
") AutoDesignDocumentReference;
		Handle_StepAP214_AutoDesignDocumentReference AutoDesignDocumentReference ();
		%feature("compactdefaultargs") AutoDesignOrganizationAssignment;
		%feature("autodoc", "	:rtype: Handle_StepAP214_AutoDesignOrganizationAssignment
") AutoDesignOrganizationAssignment;
		Handle_StepAP214_AutoDesignOrganizationAssignment AutoDesignOrganizationAssignment ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignDateAndPersonItem Kind Entity that is : 1 AutoDesignOrganizationAssignment from StepAP214, 2 Product from StepBasic, 3 ProductDefinition from StepBasic, 4 ProductDefinitionFormation from StepBasic, 5 Representation from StepRepr, 6 AutoDesignDocumentReference from StepAP214, 7 ExternallyDefinedRepresentation from StepRepr, 8 ProductDefinitionRelationship from StepBasic, 9 ProductDefinitionWithAssociatedDocuments from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ExternallyDefinedRepresentation
") ExternallyDefinedRepresentation;
		Handle_StepRepr_ExternallyDefinedRepresentation ExternallyDefinedRepresentation ();
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
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionWithAssociatedDocuments
") ProductDefinitionWithAssociatedDocuments;
		Handle_StepBasic_ProductDefinitionWithAssociatedDocuments ProductDefinitionWithAssociatedDocuments ();
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_Representation
") Representation;
		Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonItem;
		%feature("autodoc", "	* Returns a AutoDesignDateAndPersonItem SelectType

	:rtype: None
") StepAP214_AutoDesignDateAndPersonItem;
		 StepAP214_AutoDesignDateAndPersonItem ();
};


%extend StepAP214_AutoDesignDateAndPersonItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDateAndTimeItem;
class StepAP214_AutoDesignDateAndTimeItem : public StepData_SelectType {
	public:
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
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignDateAndTimeItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AutoDesignDateAndPersonAssignment 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionEffectivity
") ProductDefinitionEffectivity;
		Handle_StepBasic_ProductDefinitionEffectivity ProductDefinitionEffectivity ();
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndTimeItem;
		%feature("autodoc", "	* Returns a AutoDesignDateAndTimeItem SelectType

	:rtype: None
") StepAP214_AutoDesignDateAndTimeItem;
		 StepAP214_AutoDesignDateAndTimeItem ();
};


%extend StepAP214_AutoDesignDateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDatedItem;
class StepAP214_AutoDesignDatedItem : public StepData_SelectType {
	public:
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
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignDatedItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AutoDesignDateAndPersonAssignment 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "	* returns Value as a ProductDefinitionEffectivity

	:rtype: Handle_StepBasic_ProductDefinitionEffectivity
") ProductDefinitionEffectivity;
		Handle_StepBasic_ProductDefinitionEffectivity ProductDefinitionEffectivity ();
		%feature("compactdefaultargs") StepAP214_AutoDesignDatedItem;
		%feature("autodoc", "	* Returns a AutoDesignDatedItem SelectType

	:rtype: None
") StepAP214_AutoDesignDatedItem;
		 StepAP214_AutoDesignDatedItem ();
};


%extend StepAP214_AutoDesignDatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignDocumentReference;
class StepAP214_AutoDesignDocumentReference : public StepBasic_DocumentReference {
	public:
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignReferencingItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignReferencingItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignDocumentReference;
		%feature("autodoc", "	:rtype: None
") StepAP214_AutoDesignDocumentReference;
		 StepAP214_AutoDesignDocumentReference ();
};


%make_alias(StepAP214_AutoDesignDocumentReference)

%extend StepAP214_AutoDesignDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignGeneralOrgItem;
class StepAP214_AutoDesignGeneralOrgItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "	:rtype: Handle_StepAP214_AutoDesignDocumentReference
") AutoDesignDocumentReference;
		Handle_StepAP214_AutoDesignDocumentReference AutoDesignDocumentReference ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignGeneralOrgItem Kind Entity that is : 1 Product from StepBasic, 2 ProductDefinition from StepBasic, 3 ProductDefinitionFormation from StepBasic, 4 ProductDefinitionRelationship from StepBasic, 5 ProductDefinitionWithAssociatedDocuments from StepBasic, 6 Representation from StepRepr 7 ExternallyDefinedRepresentation from StepRepr, 8 AutoDesignDocumentReference from StepAP214, 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_ExternallyDefinedRepresentation
") ExternallyDefinedRepresentation;
		Handle_StepRepr_ExternallyDefinedRepresentation ExternallyDefinedRepresentation ();
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
		%feature("compactdefaultargs") StepAP214_AutoDesignGeneralOrgItem;
		%feature("autodoc", "	* Returns a AutoDesignGeneralOrgItem SelectType

	:rtype: None
") StepAP214_AutoDesignGeneralOrgItem;
		 StepAP214_AutoDesignGeneralOrgItem ();
};


%extend StepAP214_AutoDesignGeneralOrgItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignGroupAssignment;
class StepAP214_AutoDesignGroupAssignment : public StepBasic_GroupAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedGroup:
	:type aAssignedGroup: Handle_StepBasic_Group &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGroupedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Group & aAssignedGroup,const Handle_StepAP214_HArray1OfAutoDesignGroupedItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGroupedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGroupedItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupAssignment;
		%feature("autodoc", "	* Returns a AutoDesignGroupAssignment

	:rtype: None
") StepAP214_AutoDesignGroupAssignment;
		 StepAP214_AutoDesignGroupAssignment ();
};


%make_alias(StepAP214_AutoDesignGroupAssignment)

%extend StepAP214_AutoDesignGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignGroupedItem;
class StepAP214_AutoDesignGroupedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") AdvancedBrepShapeRepresentation;
		%feature("autodoc", "	* returns Value as a AdvancedBrepShapeRepresentation (Null if another type)

	:rtype: Handle_StepShape_AdvancedBrepShapeRepresentation
") AdvancedBrepShapeRepresentation;
		Handle_StepShape_AdvancedBrepShapeRepresentation AdvancedBrepShapeRepresentation ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignGroupedItem Kind Entity that is : 1 -> AdvancedBrepShapeRepresentation 2 -> CsgShapeRepresentation 3 -> FacetedBrepShapeRepresentation 4 -> GeometricallyBoundedSurfaceShapeRepresentation 5 -> GeometricallyBoundedWireframeShapeRepresentation 6 -> ManifoldSurfaceShapeRepresentation 7 -> Representation 8 -> RepresentationItem 9 -> ShapeAspect 10 -> ShapeRepresentation 11 -> TemplateInstance 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
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
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupedItem;
		%feature("autodoc", "	* Returns a AutoDesignGroupedItem SelectType

	:rtype: None
") StepAP214_AutoDesignGroupedItem;
		 StepAP214_AutoDesignGroupedItem ();
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aRole:
	:type aRole: Handle_StepBasic_DateTimeRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_DateAndTime & aAssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDateAndTimeItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "	* Returns a AutoDesignNominalDateAndTimeAssignment

	:rtype: None
") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		 StepAP214_AutoDesignNominalDateAndTimeAssignment ();
};


%make_alias(StepAP214_AutoDesignNominalDateAndTimeAssignment)

%extend StepAP214_AutoDesignNominalDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignNominalDateAssignment;
class StepAP214_AutoDesignNominalDateAssignment : public StepBasic_DateAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: Handle_StepBasic_Date &
	:param aRole:
	:type aRole: Handle_StepBasic_DateRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Date & aAssignedDate,const Handle_StepBasic_DateRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignDatedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignDatedItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAssignment;
		%feature("autodoc", "	* Returns a AutoDesignNominalDateAssignment

	:rtype: None
") StepAP214_AutoDesignNominalDateAssignment;
		 StepAP214_AutoDesignNominalDateAssignment ();
};


%make_alias(StepAP214_AutoDesignNominalDateAssignment)

%extend StepAP214_AutoDesignNominalDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignOrganizationAssignment;
class StepAP214_AutoDesignOrganizationAssignment : public StepBasic_OrganizationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: Handle_StepBasic_Organization &
	:param aRole:
	:type aRole: Handle_StepBasic_OrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Organization & aAssignedOrganization,const Handle_StepBasic_OrganizationRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignOrganizationAssignment

	:rtype: None
") StepAP214_AutoDesignOrganizationAssignment;
		 StepAP214_AutoDesignOrganizationAssignment ();
};


%make_alias(StepAP214_AutoDesignOrganizationAssignment)

%extend StepAP214_AutoDesignOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignPersonAndOrganizationAssignment;
class StepAP214_AutoDesignPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aRole:
	:type aRole: Handle_StepBasic_PersonAndOrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_PersonAndOrganization & aAssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aRole,const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignGeneralOrgItem & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignPersonAndOrganizationAssignment

	:rtype: None
") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		 StepAP214_AutoDesignPersonAndOrganizationAssignment ();
};


%make_alias(StepAP214_AutoDesignPersonAndOrganizationAssignment)

%extend StepAP214_AutoDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignPresentedItem;
class StepAP214_AutoDesignPresentedItem : public StepVisual_PresentedItem {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect &
	:rtype: None
") Init;
		void Init (const Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP214_HArray1OfAutoDesignPresentedItemSelect & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItem;
		%feature("autodoc", "	* Returns a AutoDesignPresentedItem

	:rtype: None
") StepAP214_AutoDesignPresentedItem;
		 StepAP214_AutoDesignPresentedItem ();
};


%make_alias(StepAP214_AutoDesignPresentedItem)

%extend StepAP214_AutoDesignPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignPresentedItemSelect;
class StepAP214_AutoDesignPresentedItemSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignPresentedItemSelect Kind Entity that is : 1 -> ProductDefinition, 2 -> ProductDefinitionRelationship, 3 -> ProductDefinitionShape 4 -> RepresentationRelationship 5 -> ShapeAspect 6 -> DocumentRelationship, 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "	* returns Value as a DocumentRelationship (Null if another type)

	:rtype: Handle_StepBasic_DocumentRelationship
") DocumentRelationship;
		Handle_StepBasic_DocumentRelationship DocumentRelationship ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* returns Value as a ProductDefinitionRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
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
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItemSelect;
		%feature("autodoc", "	* Returns a AutoDesignPresentedItemSelect SelectType

	:rtype: None
") StepAP214_AutoDesignPresentedItemSelect;
		 StepAP214_AutoDesignPresentedItemSelect ();
};


%extend StepAP214_AutoDesignPresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignReferencingItem;
class StepAP214_AutoDesignReferencingItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a AutoDesignReferencingItem Kind Entity that is : 1 Approval from StepBasic, 2 DocumentRelationship from StepBasic, 3 ExternallyDefinedRepresentation from StepRepr, 4 MappedItem from StepRepr, 5 MaterialDesignation from StepRepr, 6 PresentationArea from StepVisual, 7 PresentationView from StepVisual, 8 ProductCategory from StepBasic, 9 ProductDefinition from StepBasic, 10 ProductDefinitionRelationship from StepBasic, 11 PropertyDefinition from StepBasic, 12 Representation from StepRepr, 13 RepresentationRelationship from StepRepr, 14 ShapeAspect from StepRepr 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
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
		%feature("compactdefaultargs") StepAP214_AutoDesignReferencingItem;
		%feature("autodoc", "	* Returns a AutoDesignReferencingItem SelectType

	:rtype: None
") StepAP214_AutoDesignReferencingItem;
		 StepAP214_AutoDesignReferencingItem ();
};


%extend StepAP214_AutoDesignReferencingItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignSecurityClassificationAssignment;
class StepAP214_AutoDesignSecurityClassificationAssignment : public StepBasic_SecurityClassificationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:param aItems:
	:type aItems: Handle_StepBasic_HArray1OfApproval &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_SecurityClassification & aAssignedSecurityClassification,const Handle_StepBasic_HArray1OfApproval & aItems);
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
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepBasic_HArray1OfApproval &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepBasic_HArray1OfApproval & aItems);
		%feature("compactdefaultargs") StepAP214_AutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "	* Returns a AutoDesignSecurityClassificationAssignment

	:rtype: None
") StepAP214_AutoDesignSecurityClassificationAssignment;
		 StepAP214_AutoDesignSecurityClassificationAssignment ();
};


%make_alias(StepAP214_AutoDesignSecurityClassificationAssignment)

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


%make_alias(StepAP214_Class)

%extend StepAP214_Class {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_DocumentReferenceItem;
class StepAP214_DocumentReferenceItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") AppliedExternalIdentificationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedExternalIdentificationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedExternalIdentificationAssignment
") AppliedExternalIdentificationAssignment;
		Handle_StepAP214_AppliedExternalIdentificationAssignment AppliedExternalIdentificationAssignment ();
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	* returns Value as a Approval (Null if another type)

	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "	* returns Value as a AssemblyComponentUsage (Null if another type)

	:rtype: Handle_StepRepr_AssemblyComponentUsage
") AssemblyComponentUsage;
		Handle_StepRepr_AssemblyComponentUsage AssemblyComponentUsage ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DocumentReferenceItem Kind Entity that is :

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "	* returns Value as a CharacterizedObject (Null if another type)

	:rtype: Handle_StepBasic_CharacterizedObject
") CharacterizedObject;
		Handle_StepBasic_CharacterizedObject CharacterizedObject ();
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "	* returns Value as a (Null if another type)

	:rtype: Handle_StepRepr_DescriptiveRepresentationItem
") DescriptiveRepresentationItem;
		Handle_StepRepr_DescriptiveRepresentationItem DescriptiveRepresentationItem ();
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "	* returns Value as a DimensionalSize (Null if another type)

	:rtype: Handle_StepShape_DimensionalSize
") DimensionalSize;
		Handle_StepShape_DimensionalSize DimensionalSize ();
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "	* returns Value as a ExternallyDefinedItem (Null if another type)

	:rtype: Handle_StepBasic_ExternallyDefinedItem
") ExternallyDefinedItem;
		Handle_StepBasic_ExternallyDefinedItem ExternallyDefinedItem ();
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "	* returns Value as a Group (Null if another type)

	:rtype: Handle_StepBasic_Group
") Group;
		Handle_StepBasic_Group Group ();
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "	* returns Value as a GroupRelationship (Null if another type)

	:rtype: Handle_StepBasic_GroupRelationship
") GroupRelationship;
		Handle_StepBasic_GroupRelationship GroupRelationship ();
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "	* returns Value as a MaterialDesignation (Null if another type)

	:rtype: Handle_StepRepr_MaterialDesignation
") MaterialDesignation;
		Handle_StepRepr_MaterialDesignation MaterialDesignation ();
		%feature("compactdefaultargs") MeasureRepresentationItem;
		%feature("autodoc", "	* returns Value as a MeasureRepresentationItem (Null if another type)

	:rtype: Handle_StepRepr_MeasureRepresentationItem
") MeasureRepresentationItem;
		Handle_StepRepr_MeasureRepresentationItem MeasureRepresentationItem ();
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "	* returns Value as a ProductCategory (Null if another type)

	:rtype: Handle_StepBasic_ProductCategory
") ProductCategory;
		Handle_StepBasic_ProductCategory ProductCategory ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionContext;
		%feature("autodoc", "	* returns Value as a ProductDefinitionContext (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionContext
") ProductDefinitionContext;
		Handle_StepBasic_ProductDefinitionContext ProductDefinitionContext ();
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
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "	* returns Value as a ShapeAspectRelationship (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspectRelationship
") ShapeAspectRelationship;
		Handle_StepRepr_ShapeAspectRelationship ShapeAspectRelationship ();
		%feature("compactdefaultargs") StepAP214_DocumentReferenceItem;
		%feature("autodoc", "	* Returns a DocumentReferenceItem SelectType

	:rtype: None
") StepAP214_DocumentReferenceItem;
		 StepAP214_DocumentReferenceItem ();
};


%extend StepAP214_DocumentReferenceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ExternalIdentificationItem;
class StepAP214_ExternalIdentificationItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* Returns Value as AppliedOrganizationAssignment (or Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	* Returns Value as AppliedPersonAndOrganizationAssignment (or Null if another type)

	:rtype: Handle_StepAP214_AppliedPersonAndOrganizationAssignment
") AppliedPersonAndOrganizationAssignment;
		Handle_StepAP214_AppliedPersonAndOrganizationAssignment AppliedPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	* Returns Value as Approval (or Null if another type)

	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
		%feature("compactdefaultargs") ApprovalStatus;
		%feature("autodoc", "	* Returns Value as ApprovalStatus (or Null if another type)

	:rtype: Handle_StepBasic_ApprovalStatus
") ApprovalStatus;
		Handle_StepBasic_ApprovalStatus ApprovalStatus ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ExternalIdentificationItem select type 1 -> DocumentFile from StepBasic 2 -> ExternallyDefinedClass from StepAP214 3 -> ExternallyDefinedGeneralProperty from StepAP214 4 -> ProductDefinition from StepBasic 5 -> AppliedOrganizationAssignment from AP214 6 -> AppliedPersonAndOrganizationAssignment from AP214 7 -> Approval from StepBasic 8 -> ApprovalStatus from StepBasic 9 -> ExternalSource from StepBasic 10 -> OrganizationalAddress from StepBasic 11 -> SecurityClassification from StepBasic 12 -> TrimmedCurve from StepGeom 13 -> VersionedActionRequest from StepBasic 14 -> DateAndTimeAssignment from StepBasic 15 -> DateAssignment from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") DateAndTimeAssignment;
		%feature("autodoc", "	* Returns Value as DateAndTimeAssignment (or Null if another type)

	:rtype: Handle_StepBasic_DateAndTimeAssignment
") DateAndTimeAssignment;
		Handle_StepBasic_DateAndTimeAssignment DateAndTimeAssignment ();
		%feature("compactdefaultargs") DateAssignment;
		%feature("autodoc", "	* Returns Value as DateAssignment (or Null if another type)

	:rtype: Handle_StepBasic_DateAssignment
") DateAssignment;
		Handle_StepBasic_DateAssignment DateAssignment ();
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "	* Returns Value as DocumentFile (or Null if another type)

	:rtype: Handle_StepBasic_DocumentFile
") DocumentFile;
		Handle_StepBasic_DocumentFile DocumentFile ();
		%feature("compactdefaultargs") ExternalSource;
		%feature("autodoc", "	* Returns Value as ExternalSource (or Null if another type)

	:rtype: Handle_StepBasic_ExternalSource
") ExternalSource;
		Handle_StepBasic_ExternalSource ExternalSource ();
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
		%feature("compactdefaultargs") OrganizationalAddress;
		%feature("autodoc", "	* Returns Value as OrganizationalAddress (or Null if another type)

	:rtype: Handle_StepBasic_OrganizationalAddress
") OrganizationalAddress;
		Handle_StepBasic_OrganizationalAddress OrganizationalAddress ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "	* Returns Value as SecurityClassification (or Null if another type)

	:rtype: Handle_StepBasic_SecurityClassification
") SecurityClassification;
		Handle_StepBasic_SecurityClassification SecurityClassification ();
		%feature("compactdefaultargs") StepAP214_ExternalIdentificationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_ExternalIdentificationItem;
		 StepAP214_ExternalIdentificationItem ();
		%feature("compactdefaultargs") TrimmedCurve;
		%feature("autodoc", "	* Returns Value as TrimmedCurve (or Null if another type)

	:rtype: Handle_StepGeom_TrimmedCurve
") TrimmedCurve;
		Handle_StepGeom_TrimmedCurve TrimmedCurve ();
		%feature("compactdefaultargs") VersionedActionRequest;
		%feature("autodoc", "	* Returns Value as VersionedActionRequest (or Null if another type)

	:rtype: Handle_StepBasic_VersionedActionRequest
") VersionedActionRequest;
		Handle_StepBasic_VersionedActionRequest VersionedActionRequest ();
};


%extend StepAP214_ExternalIdentificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ExternallyDefinedGeneralProperty;
class StepAP214_ExternallyDefinedGeneralProperty : public StepBasic_GeneralProperty {
	public:
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "	* Returns data for supertype ExternallyDefinedItem

	:rtype: Handle_StepBasic_ExternallyDefinedItem
") ExternallyDefinedItem;
		Handle_StepBasic_ExternallyDefinedItem ExternallyDefinedItem ();
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
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "	* Set data for supertype ExternallyDefinedItem

	:param ExternallyDefinedItem:
	:type ExternallyDefinedItem: Handle_StepBasic_ExternallyDefinedItem &
	:rtype: None
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem (const Handle_StepBasic_ExternallyDefinedItem & ExternallyDefinedItem);
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedGeneralProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_ExternallyDefinedGeneralProperty;
		 StepAP214_ExternallyDefinedGeneralProperty ();
};


%make_alias(StepAP214_ExternallyDefinedGeneralProperty)

%extend StepAP214_ExternallyDefinedGeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_GroupItem;
class StepAP214_GroupItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a GroupItem Kind Entity that is : 1 -> GeometricRepresentationItem 2 -> GroupRelationship 3 -> MappedItem 4 -> ProductDefinition 5 -> ProductDefinitionFormation 6 -> PropertyDefinitionRepresentation 7 -> Representation 8 -> RepresentationItem 9 -> RepresentationRelationshipWithTransformation 10 -> ShapeAspect 11 -> ShapeAspectRelationship 12 -> ShapeRepresentationRelationship 13 -> StyledItem 14 -> TopologicalRepresentationItem 0 else

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
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "	* returns Value as a GroupRelationship (Null if another type)

	:rtype: Handle_StepBasic_GroupRelationship
") GroupRelationship;
		virtual Handle_StepBasic_GroupRelationship GroupRelationship ();
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "	* returns Value as a MappedItem (Null if another type)

	:rtype: Handle_StepRepr_MappedItem
") MappedItem;
		virtual Handle_StepRepr_MappedItem MappedItem ();
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
		%feature("compactdefaultargs") PropertyDefinitionRepresentation;
		%feature("autodoc", "	* returns Value as a PropertyDefinitionRepresentation (Null if another type)

	:rtype: Handle_StepRepr_PropertyDefinitionRepresentation
") PropertyDefinitionRepresentation;
		virtual Handle_StepRepr_PropertyDefinitionRepresentation PropertyDefinitionRepresentation ();
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "	* returns Value as a Representation (Null if another type)

	:rtype: Handle_StepRepr_Representation
") Representation;
		virtual Handle_StepRepr_Representation Representation ();
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "	* returns Value as a RepresentationItem (Null if another type)

	:rtype: Handle_StepRepr_RepresentationItem
") RepresentationItem;
		virtual Handle_StepRepr_RepresentationItem RepresentationItem ();
		%feature("compactdefaultargs") RepresentationRelationshipWithTransformation;
		%feature("autodoc", "	* returns Value as a RepresentationRelationshipWithTransformation (Null if another type)

	:rtype: Handle_StepRepr_RepresentationRelationshipWithTransformation
") RepresentationRelationshipWithTransformation;
		virtual Handle_StepRepr_RepresentationRelationshipWithTransformation RepresentationRelationshipWithTransformation ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* returns Value as a ShapeAspect (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		virtual Handle_StepRepr_ShapeAspect ShapeAspect ();
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "	* returns Value as a ShapeAspectRelationship (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspectRelationship
") ShapeAspectRelationship;
		virtual Handle_StepRepr_ShapeAspectRelationship ShapeAspectRelationship ();
		%feature("compactdefaultargs") ShapeRepresentationRelationship;
		%feature("autodoc", "	* returns Value as a ShapeRepresentationRelationship (Null if another type)

	:rtype: Handle_StepRepr_ShapeRepresentationRelationship
") ShapeRepresentationRelationship;
		virtual Handle_StepRepr_ShapeRepresentationRelationship ShapeRepresentationRelationship ();
		%feature("compactdefaultargs") StepAP214_GroupItem;
		%feature("autodoc", "	* Returns a GroupItem SelectType

	:rtype: None
") StepAP214_GroupItem;
		 StepAP214_GroupItem ();
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "	* returns Value as a StyledItem (Null if another type)

	:rtype: Handle_StepVisual_StyledItem
") StyledItem;
		virtual Handle_StepVisual_StyledItem StyledItem ();
		%feature("compactdefaultargs") TopologicalRepresentationItem;
		%feature("autodoc", "	* returns Value as a TopologicalRepresentationItem (Null if another type)

	:rtype: Handle_StepShape_TopologicalRepresentationItem
") TopologicalRepresentationItem;
		virtual Handle_StepShape_TopologicalRepresentationItem TopologicalRepresentationItem ();
};


%extend StepAP214_GroupItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_PresentedItemSelect;
class StepAP214_PresentedItemSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PresentedItemSelect Kind Entity that is : 1 -> ProductDefinition, 2 -> ProductDefinitionRelationship, 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* returns Value as a ProductDefinitionRelationship (Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") StepAP214_PresentedItemSelect;
		%feature("autodoc", "	* Returns a PresentedItemSelect SelectType

	:rtype: None
") StepAP214_PresentedItemSelect;
		 StepAP214_PresentedItemSelect ();
};


%extend StepAP214_PresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_Protocol;
class StepAP214_Protocol : public StepData_Protocol {
	public:
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
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: char *
") SchemaName;
		virtual const char * SchemaName ();
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
};


%make_alias(StepAP214_Protocol)

%extend StepAP214_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_RepItemGroup;
class StepAP214_RepItemGroup : public StepBasic_Group {
	public:
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
		%feature("compactdefaultargs") StepAP214_RepItemGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_RepItemGroup;
		 StepAP214_RepItemGroup ();
};


%make_alias(StepAP214_RepItemGroup)

%extend StepAP214_RepItemGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_AutoDesignOrganizationItem;
class StepAP214_AutoDesignOrganizationItem : public StepAP214_AutoDesignGeneralOrgItem {
	public:
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
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationItem;
		%feature("autodoc", "	:rtype: None
") StepAP214_AutoDesignOrganizationItem;
		 StepAP214_AutoDesignOrganizationItem ();
};


%extend StepAP214_AutoDesignOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_DateAndTimeItem;
class StepAP214_DateAndTimeItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedDateAndPersonAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedPersonAndOrganizationAssignment
") AppliedPersonAndOrganizationAssignment;
		Handle_StepAP214_AppliedPersonAndOrganizationAssignment AppliedPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "	* returns Value as a ApprovalPersonOrganization (Null if another type)

	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") ApprovalPersonOrganization;
		Handle_StepBasic_ApprovalPersonOrganization ApprovalPersonOrganization ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DateAndTimeItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AppliedDateAndPersonAssignment 3 -> AppliedOrganizationAssignment 4 -> AssemblyComponentUsageSubstitute 5 -> DocumentFile 6 -> Effectivity 7 -> MaterialDesignation 8 -> MechanicalDesignGeometricPresentationRepresentation 9 -> PresentationArea 10 -> Product 11 -> ProductDefinition 12 -> ProductDefinitionFormation 13 -> ProductDefinitionRelationship 14 -> PropertyDefinition 15 -> ShapeRepresentation 16 -> SecurityClassification 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") StepAP214_DateAndTimeItem;
		%feature("autodoc", "	* Returns a DateAndTimeItem SelectType

	:rtype: None
") StepAP214_DateAndTimeItem;
		 StepAP214_DateAndTimeItem ();
};


%extend StepAP214_DateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_DateItem;
class StepAP214_DateItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedDateAndPersonAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedPersonAndOrganizationAssignment
") AppliedPersonAndOrganizationAssignment;
		Handle_StepAP214_AppliedPersonAndOrganizationAssignment AppliedPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedSecurityClassificationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedSecurityClassificationAssignment
") AppliedSecurityClassificationAssignment;
		Handle_StepAP214_AppliedSecurityClassificationAssignment AppliedSecurityClassificationAssignment ();
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "	* returns Value as a ApprovalPersonOrganization (Null if another type)

	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") ApprovalPersonOrganization;
		Handle_StepBasic_ApprovalPersonOrganization ApprovalPersonOrganization ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DateItem Kind Entity that is : 1 -> ApprovalPersonOrganization 2 -> AppliedDateAndPersonAssignment 3 -> AppliedOrganizationAssignment 4 -> AssemblyComponentUsageSubstitute 5 -> DocumentFile 6 -> Effectivity 7 -> MaterialDesignation 8 -> MechanicalDesignGeometricPresentationRepresentation 9 -> PresentationArea 10 -> Product 11 -> ProductDefinition 12 -> ProductDefinitionFormation 13 -> ProductDefinitionRelationship 14 -> PropertyDefinition 15 -> ShapeRepresentation 16 -> AppliedSecurityClassificationAssignment 17 -> Document 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") StepAP214_DateItem;
		%feature("autodoc", "	* Returns a DateItem SelectType

	:rtype: None
") StepAP214_DateItem;
		 StepAP214_DateItem ();
};


%extend StepAP214_DateItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_ExternallyDefinedClass;
class StepAP214_ExternallyDefinedClass : public StepAP214_Class {
	public:
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "	* Returns data for supertype ExternallyDefinedItem

	:rtype: Handle_StepBasic_ExternallyDefinedItem
") ExternallyDefinedItem;
		Handle_StepBasic_ExternallyDefinedItem ExternallyDefinedItem ();
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
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "	* Set data for supertype ExternallyDefinedItem

	:param ExternallyDefinedItem:
	:type ExternallyDefinedItem: Handle_StepBasic_ExternallyDefinedItem &
	:rtype: None
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem (const Handle_StepBasic_ExternallyDefinedItem & ExternallyDefinedItem);
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedClass;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP214_ExternallyDefinedClass;
		 StepAP214_ExternallyDefinedClass ();
};


%make_alias(StepAP214_ExternallyDefinedClass)

%extend StepAP214_ExternallyDefinedClass {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_OrganizationItem;
class StepAP214_OrganizationItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedSecurityClassificationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedSecurityClassificationAssignment
") AppliedSecurityClassificationAssignment;
		Handle_StepAP214_AppliedSecurityClassificationAssignment AppliedSecurityClassificationAssignment ();
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	* returns Value as a Approval (Null if another type)

	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a OrganizationItem Kind Entity that is :

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") StepAP214_OrganizationItem;
		%feature("autodoc", "	* Returns a OrganizationItem SelectType

	:rtype: None
") StepAP214_OrganizationItem;
		 StepAP214_OrganizationItem ();
};


%extend StepAP214_OrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_PersonAndOrganizationItem;
class StepAP214_PersonAndOrganizationItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedOrganizationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedOrganizationAssignment
") AppliedOrganizationAssignment;
		Handle_StepAP214_AppliedOrganizationAssignment AppliedOrganizationAssignment ();
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "	* returns Value as a AppliedSecurityClassificationAssignment (Null if another type)

	:rtype: Handle_StepAP214_AppliedSecurityClassificationAssignment
") AppliedSecurityClassificationAssignment;
		Handle_StepAP214_AppliedSecurityClassificationAssignment AppliedSecurityClassificationAssignment ();
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "	* returns Value as a Approval (Null if another type)

	:rtype: Handle_StepBasic_Approval
") Approval;
		Handle_StepBasic_Approval Approval ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a APersonAndOrganizationItem Kind Entity that is : 1 -> AppliedOrganizationAssignment 2 -> AssemblyComponentUsageSubstitute 3 -> DocumentFile 4 -> MaterialDesignation 5 -> MechanicalDesignGeometricPresentationRepresentation 6 -> PresentationArea 7 -> Product 8 -> ProductDefinition 9 -> ProductDefinitionFormation 10 -> ProductDefinitionRelationship 11 -> PropertyDefinition 12 -> ShapeRepresentation 13 -> SecurityClassification 14 -> AppliedSecurityClassificationAssignment 15 -> Approval 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") StepAP214_PersonAndOrganizationItem;
		%feature("autodoc", "	* Returns a PersonAndOrganizationItem SelectType

	:rtype: None
") StepAP214_PersonAndOrganizationItem;
		 StepAP214_PersonAndOrganizationItem ();
};


%extend StepAP214_PersonAndOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP214_SecurityClassificationItem;
class StepAP214_SecurityClassificationItem : public StepAP214_ApprovalItem {
	public:
		%feature("compactdefaultargs") Action;
		%feature("autodoc", "	* returns Value as a Action (Null if another type)

	:rtype: Handle_StepBasic_Action
") Action;
		virtual Handle_StepBasic_Action Action ();
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "	* returns Value as a AssemblyComponentUsage (Null if another type)

	:rtype: Handle_StepRepr_AssemblyComponentUsage
") AssemblyComponentUsage;
		virtual Handle_StepRepr_AssemblyComponentUsage AssemblyComponentUsage ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a SecurityClassificationItem Kind Entity that is : 1 -> Action 2 -> AssemblyComponentUsage 3 -> AssemblyComponentUsageSubstitute 4 -> ConfigurationDesign 5 -> ConfigurationEffectivity 6 -> Document 7 -> DocumentFile 8 -> DraughtingModel 9 -> GeneralProperty 10 -> MakeFromUsageOption 11 -> MaterialDesignation 12 -> MechanicalDesignGeometricPresentationRepresentation 13 -> PresentationArea 14 -> Product 15 -> ProductConcept 16 -> ProductDefinition 17 -> ProductDefinitionFormation 18 -> ProductDefinitionRelationship 19 -> ProductDefinitionUsage 20 -> PropertyDefinition 21 -> ShapeRepresentation 22 -> VersionedActionRequest 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		virtual Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ConfigurationDesign;
		%feature("autodoc", "	* returns Value as a ConfigurationDesign (Null if another type)

	:rtype: Handle_StepRepr_ConfigurationDesign
") ConfigurationDesign;
		virtual Handle_StepRepr_ConfigurationDesign ConfigurationDesign ();
		%feature("compactdefaultargs") ConfigurationEffectivity;
		%feature("autodoc", "	* returns Value as a ConfigurationEffectivity (Null if another type)

	:rtype: Handle_StepRepr_ConfigurationEffectivity
") ConfigurationEffectivity;
		virtual Handle_StepRepr_ConfigurationEffectivity ConfigurationEffectivity ();
		%feature("compactdefaultargs") DraughtingModel;
		%feature("autodoc", "	* returns Value as a DraughtingModel (Null if another type)

	:rtype: Handle_StepVisual_DraughtingModel
") DraughtingModel;
		virtual Handle_StepVisual_DraughtingModel DraughtingModel ();
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "	* returns Value as a GeneralProperty (Null if another type)

	:rtype: Handle_StepBasic_GeneralProperty
") GeneralProperty;
		virtual Handle_StepBasic_GeneralProperty GeneralProperty ();
		%feature("compactdefaultargs") MakeFromUsageOption;
		%feature("autodoc", "	* returns Value as a MakeFromUsageOption (Null if another type)

	:rtype: Handle_StepRepr_MakeFromUsageOption
") MakeFromUsageOption;
		virtual Handle_StepRepr_MakeFromUsageOption MakeFromUsageOption ();
		%feature("compactdefaultargs") ProductConcept;
		%feature("autodoc", "	* returns Value as a ProductConcept (Null if another type)

	:rtype: Handle_StepRepr_ProductConcept
") ProductConcept;
		virtual Handle_StepRepr_ProductConcept ProductConcept ();
		%feature("compactdefaultargs") ProductDefinitionUsage;
		%feature("autodoc", "	* returns Value as a ProductDefinitionUsage (Null if another type)

	:rtype: Handle_StepRepr_ProductDefinitionUsage
") ProductDefinitionUsage;
		virtual Handle_StepRepr_ProductDefinitionUsage ProductDefinitionUsage ();
		%feature("compactdefaultargs") StepAP214_SecurityClassificationItem;
		%feature("autodoc", "	* Returns a SecurityClassificationItem SelectType

	:rtype: None
") StepAP214_SecurityClassificationItem;
		 StepAP214_SecurityClassificationItem ();
		%feature("compactdefaultargs") VersionedActionRequest;
		%feature("autodoc", "	* returns Value as a VersionedActionRequest (Null if another type)

	:rtype: Handle_StepBasic_VersionedActionRequest
") VersionedActionRequest;
		virtual Handle_StepBasic_VersionedActionRequest VersionedActionRequest ();
};


%extend StepAP214_SecurityClassificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
%wrap_handle(StepAP214_HArray1OfDateItem)
class StepAP214_HArray1OfDateItem : public  StepAP214_Array1OfDateItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfDateItem::value_type& theValue);
    StepAP214_HArray1OfDateItem(const  StepAP214_Array1OfDateItem& theOther);
    const  StepAP214_Array1OfDateItem& Array1();
     StepAP214_Array1OfDateItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateItem)


%wrap_handle(StepAP214_HArray1OfSecurityClassificationItem)
class StepAP214_HArray1OfSecurityClassificationItem : public  StepAP214_Array1OfSecurityClassificationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfSecurityClassificationItem::value_type& theValue);
    StepAP214_HArray1OfSecurityClassificationItem(const  StepAP214_Array1OfSecurityClassificationItem& theOther);
    const  StepAP214_Array1OfSecurityClassificationItem& Array1();
     StepAP214_Array1OfSecurityClassificationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfSecurityClassificationItem)


%wrap_handle(StepAP214_HArray1OfExternalIdentificationItem)
class StepAP214_HArray1OfExternalIdentificationItem : public  StepAP214_Array1OfExternalIdentificationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfExternalIdentificationItem::value_type& theValue);
    StepAP214_HArray1OfExternalIdentificationItem(const  StepAP214_Array1OfExternalIdentificationItem& theOther);
    const  StepAP214_Array1OfExternalIdentificationItem& Array1();
     StepAP214_Array1OfExternalIdentificationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfExternalIdentificationItem)


%wrap_handle(StepAP214_HArray1OfAutoDesignDatedItem)
class StepAP214_HArray1OfAutoDesignDatedItem : public  StepAP214_Array1OfAutoDesignDatedItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignDatedItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDatedItem(const  StepAP214_Array1OfAutoDesignDatedItem& theOther);
    const  StepAP214_Array1OfAutoDesignDatedItem& Array1();
     StepAP214_Array1OfAutoDesignDatedItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDatedItem)


%wrap_handle(StepAP214_HArray1OfPersonAndOrganizationItem)
class StepAP214_HArray1OfPersonAndOrganizationItem : public  StepAP214_Array1OfPersonAndOrganizationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfPersonAndOrganizationItem::value_type& theValue);
    StepAP214_HArray1OfPersonAndOrganizationItem(const  StepAP214_Array1OfPersonAndOrganizationItem& theOther);
    const  StepAP214_Array1OfPersonAndOrganizationItem& Array1();
     StepAP214_Array1OfPersonAndOrganizationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPersonAndOrganizationItem)


%wrap_handle(StepAP214_HArray1OfAutoDesignDateAndPersonItem)
class StepAP214_HArray1OfAutoDesignDateAndPersonItem : public  StepAP214_Array1OfAutoDesignDateAndPersonItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignDateAndPersonItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const  StepAP214_Array1OfAutoDesignDateAndPersonItem& theOther);
    const  StepAP214_Array1OfAutoDesignDateAndPersonItem& Array1();
     StepAP214_Array1OfAutoDesignDateAndPersonItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndPersonItem)


%wrap_handle(StepAP214_HArray1OfAutoDesignGroupedItem)
class StepAP214_HArray1OfAutoDesignGroupedItem : public  StepAP214_Array1OfAutoDesignGroupedItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignGroupedItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGroupedItem(const  StepAP214_Array1OfAutoDesignGroupedItem& theOther);
    const  StepAP214_Array1OfAutoDesignGroupedItem& Array1();
     StepAP214_Array1OfAutoDesignGroupedItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGroupedItem)


%wrap_handle(StepAP214_HArray1OfPresentedItemSelect)
class StepAP214_HArray1OfPresentedItemSelect : public  StepAP214_Array1OfPresentedItemSelect, public Standard_Transient {
  public:
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfPresentedItemSelect::value_type& theValue);
    StepAP214_HArray1OfPresentedItemSelect(const  StepAP214_Array1OfPresentedItemSelect& theOther);
    const  StepAP214_Array1OfPresentedItemSelect& Array1();
     StepAP214_Array1OfPresentedItemSelect& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPresentedItemSelect)


%wrap_handle(StepAP214_HArray1OfAutoDesignGeneralOrgItem)
class StepAP214_HArray1OfAutoDesignGeneralOrgItem : public  StepAP214_Array1OfAutoDesignGeneralOrgItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignGeneralOrgItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const  StepAP214_Array1OfAutoDesignGeneralOrgItem& theOther);
    const  StepAP214_Array1OfAutoDesignGeneralOrgItem& Array1();
     StepAP214_Array1OfAutoDesignGeneralOrgItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGeneralOrgItem)


%wrap_handle(StepAP214_HArray1OfAutoDesignDateAndTimeItem)
class StepAP214_HArray1OfAutoDesignDateAndTimeItem : public  StepAP214_Array1OfAutoDesignDateAndTimeItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignDateAndTimeItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const  StepAP214_Array1OfAutoDesignDateAndTimeItem& theOther);
    const  StepAP214_Array1OfAutoDesignDateAndTimeItem& Array1();
     StepAP214_Array1OfAutoDesignDateAndTimeItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndTimeItem)


%wrap_handle(StepAP214_HArray1OfAutoDesignPresentedItemSelect)
class StepAP214_HArray1OfAutoDesignPresentedItemSelect : public  StepAP214_Array1OfAutoDesignPresentedItemSelect, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignPresentedItemSelect::value_type& theValue);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const  StepAP214_Array1OfAutoDesignPresentedItemSelect& theOther);
    const  StepAP214_Array1OfAutoDesignPresentedItemSelect& Array1();
     StepAP214_Array1OfAutoDesignPresentedItemSelect& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignPresentedItemSelect)


%wrap_handle(StepAP214_HArray1OfAutoDesignReferencingItem)
class StepAP214_HArray1OfAutoDesignReferencingItem : public  StepAP214_Array1OfAutoDesignReferencingItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignReferencingItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignReferencingItem(const  StepAP214_Array1OfAutoDesignReferencingItem& theOther);
    const  StepAP214_Array1OfAutoDesignReferencingItem& Array1();
     StepAP214_Array1OfAutoDesignReferencingItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignReferencingItem)


%wrap_handle(StepAP214_HArray1OfDocumentReferenceItem)
class StepAP214_HArray1OfDocumentReferenceItem : public  StepAP214_Array1OfDocumentReferenceItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfDocumentReferenceItem::value_type& theValue);
    StepAP214_HArray1OfDocumentReferenceItem(const  StepAP214_Array1OfDocumentReferenceItem& theOther);
    const  StepAP214_Array1OfDocumentReferenceItem& Array1();
     StepAP214_Array1OfDocumentReferenceItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDocumentReferenceItem)


%wrap_handle(StepAP214_HArray1OfOrganizationItem)
class StepAP214_HArray1OfOrganizationItem : public  StepAP214_Array1OfOrganizationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfOrganizationItem::value_type& theValue);
    StepAP214_HArray1OfOrganizationItem(const  StepAP214_Array1OfOrganizationItem& theOther);
    const  StepAP214_Array1OfOrganizationItem& Array1();
     StepAP214_Array1OfOrganizationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfOrganizationItem)


%wrap_handle(StepAP214_HArray1OfApprovalItem)
class StepAP214_HArray1OfApprovalItem : public  StepAP214_Array1OfApprovalItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfApprovalItem::value_type& theValue);
    StepAP214_HArray1OfApprovalItem(const  StepAP214_Array1OfApprovalItem& theOther);
    const  StepAP214_Array1OfApprovalItem& Array1();
     StepAP214_Array1OfApprovalItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfApprovalItem)


%wrap_handle(StepAP214_HArray1OfGroupItem)
class StepAP214_HArray1OfGroupItem : public  StepAP214_Array1OfGroupItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfGroupItem::value_type& theValue);
    StepAP214_HArray1OfGroupItem(const  StepAP214_Array1OfGroupItem& theOther);
    const  StepAP214_Array1OfGroupItem& Array1();
     StepAP214_Array1OfGroupItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfGroupItem)


%wrap_handle(StepAP214_HArray1OfDateAndTimeItem)
class StepAP214_HArray1OfDateAndTimeItem : public  StepAP214_Array1OfDateAndTimeItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfDateAndTimeItem::value_type& theValue);
    StepAP214_HArray1OfDateAndTimeItem(const  StepAP214_Array1OfDateAndTimeItem& theOther);
    const  StepAP214_Array1OfDateAndTimeItem& Array1();
     StepAP214_Array1OfDateAndTimeItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateAndTimeItem)


/* harray2 class */
/* harray2 class */
