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
%define STEPAP214DOCSTRING
"StepAP214 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepap214.html"
%enddef
%module (package="OCC.Core", docstring=STEPAP214DOCSTRING) StepAP214


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
#include<StepAP214_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<TCollection_module.hxx>
#include<StepVisual_module.hxx>
#include<StepData_module.hxx>
#include<StepRepr_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<Interface_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepData_module.hxx>
#include<StepShape_module.hxx>
#include<StepRepr_module.hxx>
#include<StepGeom_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepBasic.i
%import TCollection.i
%import StepVisual.i
%import StepData.i
%import StepRepr.i
%import StepShape.i
%import StepGeom.i
%import Interface.i

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
%wrap_handle(StepAP214_HArray1OfDateItem)
%wrap_handle(StepAP214_HArray1OfSecurityClassificationItem)
%wrap_handle(StepAP214_HArray1OfExternalIdentificationItem)
%wrap_handle(StepAP214_HArray1OfAutoDesignDatedItem)
%wrap_handle(StepAP214_HArray1OfPersonAndOrganizationItem)
%wrap_handle(StepAP214_HArray1OfAutoDesignDateAndPersonItem)
%wrap_handle(StepAP214_HArray1OfAutoDesignGroupedItem)
%wrap_handle(StepAP214_HArray1OfPresentedItemSelect)
%wrap_handle(StepAP214_HArray1OfAutoDesignGeneralOrgItem)
%wrap_handle(StepAP214_HArray1OfAutoDesignDateAndTimeItem)
%wrap_handle(StepAP214_HArray1OfAutoDesignPresentedItemSelect)
%wrap_handle(StepAP214_HArray1OfAutoDesignReferencingItem)
%wrap_handle(StepAP214_HArray1OfDocumentReferenceItem)
%wrap_handle(StepAP214_HArray1OfOrganizationItem)
%wrap_handle(StepAP214_HArray1OfApprovalItem)
%wrap_handle(StepAP214_HArray1OfGroupItem)
%wrap_handle(StepAP214_HArray1OfDateAndTimeItem)
/* end handles declaration */

/* templates */
%template(StepAP214_Array1OfApprovalItem) NCollection_Array1<StepAP214_ApprovalItem>;

%extend NCollection_Array1<StepAP214_ApprovalItem> {
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
%template(StepAP214_Array1OfAutoDesignDateAndPersonItem) NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem>;

%extend NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem> {
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
%template(StepAP214_Array1OfAutoDesignDateAndTimeItem) NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem>;

%extend NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem> {
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
%template(StepAP214_Array1OfAutoDesignDatedItem) NCollection_Array1<StepAP214_AutoDesignDatedItem>;

%extend NCollection_Array1<StepAP214_AutoDesignDatedItem> {
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
%template(StepAP214_Array1OfAutoDesignGeneralOrgItem) NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem>;

%extend NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem> {
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
%template(StepAP214_Array1OfAutoDesignGroupedItem) NCollection_Array1<StepAP214_AutoDesignGroupedItem>;

%extend NCollection_Array1<StepAP214_AutoDesignGroupedItem> {
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
%template(StepAP214_Array1OfAutoDesignPresentedItemSelect) NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect>;

%extend NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect> {
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
%template(StepAP214_Array1OfAutoDesignReferencingItem) NCollection_Array1<StepAP214_AutoDesignReferencingItem>;

%extend NCollection_Array1<StepAP214_AutoDesignReferencingItem> {
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
%template(StepAP214_Array1OfDateAndTimeItem) NCollection_Array1<StepAP214_DateAndTimeItem>;

%extend NCollection_Array1<StepAP214_DateAndTimeItem> {
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
%template(StepAP214_Array1OfDateItem) NCollection_Array1<StepAP214_DateItem>;

%extend NCollection_Array1<StepAP214_DateItem> {
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
%template(StepAP214_Array1OfDocumentReferenceItem) NCollection_Array1<StepAP214_DocumentReferenceItem>;

%extend NCollection_Array1<StepAP214_DocumentReferenceItem> {
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
%template(StepAP214_Array1OfExternalIdentificationItem) NCollection_Array1<StepAP214_ExternalIdentificationItem>;

%extend NCollection_Array1<StepAP214_ExternalIdentificationItem> {
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
%template(StepAP214_Array1OfGroupItem) NCollection_Array1<StepAP214_GroupItem>;

%extend NCollection_Array1<StepAP214_GroupItem> {
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
%template(StepAP214_Array1OfOrganizationItem) NCollection_Array1<StepAP214_OrganizationItem>;

%extend NCollection_Array1<StepAP214_OrganizationItem> {
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
%template(StepAP214_Array1OfPersonAndOrganizationItem) NCollection_Array1<StepAP214_PersonAndOrganizationItem>;

%extend NCollection_Array1<StepAP214_PersonAndOrganizationItem> {
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
%template(StepAP214_Array1OfPresentedItemSelect) NCollection_Array1<StepAP214_PresentedItemSelect>;

%extend NCollection_Array1<StepAP214_PresentedItemSelect> {
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
%template(StepAP214_Array1OfSecurityClassificationItem) NCollection_Array1<StepAP214_SecurityClassificationItem>;

%extend NCollection_Array1<StepAP214_SecurityClassificationItem> {
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
typedef NCollection_Array1<StepAP214_ApprovalItem> StepAP214_Array1OfApprovalItem;
typedef NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem> StepAP214_Array1OfAutoDesignDateAndPersonItem;
typedef NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem> StepAP214_Array1OfAutoDesignDateAndTimeItem;
typedef NCollection_Array1<StepAP214_AutoDesignDatedItem> StepAP214_Array1OfAutoDesignDatedItem;
typedef NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem> StepAP214_Array1OfAutoDesignGeneralOrgItem;
typedef NCollection_Array1<StepAP214_AutoDesignGroupedItem> StepAP214_Array1OfAutoDesignGroupedItem;
typedef NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect> StepAP214_Array1OfAutoDesignPresentedItemSelect;
typedef NCollection_Array1<StepAP214_AutoDesignReferencingItem> StepAP214_Array1OfAutoDesignReferencingItem;
typedef NCollection_Array1<StepAP214_DateAndTimeItem> StepAP214_Array1OfDateAndTimeItem;
typedef NCollection_Array1<StepAP214_DateItem> StepAP214_Array1OfDateItem;
typedef NCollection_Array1<StepAP214_DocumentReferenceItem> StepAP214_Array1OfDocumentReferenceItem;
typedef NCollection_Array1<StepAP214_ExternalIdentificationItem> StepAP214_Array1OfExternalIdentificationItem;
typedef NCollection_Array1<StepAP214_GroupItem> StepAP214_Array1OfGroupItem;
typedef NCollection_Array1<StepAP214_OrganizationItem> StepAP214_Array1OfOrganizationItem;
typedef NCollection_Array1<StepAP214_PersonAndOrganizationItem> StepAP214_Array1OfPersonAndOrganizationItem;
typedef NCollection_Array1<StepAP214_PresentedItemSelect> StepAP214_Array1OfPresentedItemSelect;
typedef NCollection_Array1<StepAP214_SecurityClassificationItem> StepAP214_Array1OfSecurityClassificationItem;
/* end typedefs declaration */

/******************
* class StepAP214 *
******************/
%rename(stepap214) StepAP214;
class StepAP214 {
	public:
		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Creates a protocol.

Returns
-------
opencascade::handle<StepAP214_Protocol>
") Protocol;
		static opencascade::handle<StepAP214_Protocol> Protocol();

};


%extend StepAP214 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepAP214_AppliedApprovalAssignment *
********************************************/
class StepAP214_AppliedApprovalAssignment : public StepBasic_ApprovalAssignment {
	public:
		/****************** StepAP214_AppliedApprovalAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedApprovalAssignment;
		%feature("autodoc", "Returns a appliedapprovalassignment.

Returns
-------
None
") StepAP214_AppliedApprovalAssignment;
		 StepAP214_AppliedApprovalAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedApproval: StepBasic_Approval
aItems: StepAP214_HArray1OfApprovalItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Approval> & aAssignedApproval, const opencascade::handle<StepAP214_HArray1OfApprovalItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfApprovalItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfApprovalItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_ApprovalItem
") ItemsValue;
		StepAP214_ApprovalItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfApprovalItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfApprovalItem> & aItems);

};


%make_alias(StepAP214_AppliedApprovalAssignment)

%extend StepAP214_AppliedApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepAP214_AppliedDateAndTimeAssignment *
***********************************************/
class StepAP214_AppliedDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		/****************** StepAP214_AppliedDateAndTimeAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedDateAndTimeAssignment;
		%feature("autodoc", "Returns a applieddateandtimeassignment.

Returns
-------
None
") StepAP214_AppliedDateAndTimeAssignment;
		 StepAP214_AppliedDateAndTimeAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole
aItems: StepAP214_HArray1OfDateAndTimeItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole, const opencascade::handle<StepAP214_HArray1OfDateAndTimeItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfDateAndTimeItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfDateAndTimeItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_DateAndTimeItem
") ItemsValue;
		StepAP214_DateAndTimeItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfDateAndTimeItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfDateAndTimeItem> & aItems);

};


%make_alias(StepAP214_AppliedDateAndTimeAssignment)

%extend StepAP214_AppliedDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepAP214_AppliedDateAssignment *
****************************************/
class StepAP214_AppliedDateAssignment : public StepBasic_DateAssignment {
	public:
		/****************** StepAP214_AppliedDateAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedDateAssignment;
		%feature("autodoc", "Returns a applieddateassignment.

Returns
-------
None
") StepAP214_AppliedDateAssignment;
		 StepAP214_AppliedDateAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole
aItems: StepAP214_HArray1OfDateItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole, const opencascade::handle<StepAP214_HArray1OfDateItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfDateItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfDateItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_DateItem
") ItemsValue;
		StepAP214_DateItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfDateItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfDateItem> & aItems);

};


%make_alias(StepAP214_AppliedDateAssignment)

%extend StepAP214_AppliedDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepAP214_AppliedDocumentReference *
*******************************************/
class StepAP214_AppliedDocumentReference : public StepBasic_DocumentReference {
	public:
		/****************** StepAP214_AppliedDocumentReference ******************/
		%feature("compactdefaultargs") StepAP214_AppliedDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_AppliedDocumentReference;
		 StepAP214_AppliedDocumentReference();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDocument: StepBasic_Document
aSource: TCollection_HAsciiString
aItems: StepAP214_HArray1OfDocumentReferenceItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Document> & aAssignedDocument, const opencascade::handle<TCollection_HAsciiString> & aSource, const opencascade::handle<StepAP214_HArray1OfDocumentReferenceItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfDocumentReferenceItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfDocumentReferenceItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_DocumentReferenceItem
") ItemsValue;
		StepAP214_DocumentReferenceItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfDocumentReferenceItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfDocumentReferenceItem> & aItems);

};


%make_alias(StepAP214_AppliedDocumentReference)

%extend StepAP214_AppliedDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepAP214_AppliedExternalIdentificationAssignment *
**********************************************************/
class StepAP214_AppliedExternalIdentificationAssignment : public StepBasic_ExternalIdentificationAssignment {
	public:
		/****************** StepAP214_AppliedExternalIdentificationAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_AppliedExternalIdentificationAssignment;
		 StepAP214_AppliedExternalIdentificationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aIdentificationAssignment_AssignedId: TCollection_HAsciiString
aIdentificationAssignment_Role: StepBasic_IdentificationRole
aExternalIdentificationAssignment_Source: StepBasic_ExternalSource
aItems: StepAP214_HArray1OfExternalIdentificationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aIdentificationAssignment_AssignedId, const opencascade::handle<StepBasic_IdentificationRole> & aIdentificationAssignment_Role, const opencascade::handle<StepBasic_ExternalSource> & aExternalIdentificationAssignment_Source, const opencascade::handle<StepAP214_HArray1OfExternalIdentificationItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns field items.

Returns
-------
opencascade::handle<StepAP214_HArray1OfExternalIdentificationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfExternalIdentificationItem> Items();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "Set field items.

Parameters
----------
Items: StepAP214_HArray1OfExternalIdentificationItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfExternalIdentificationItem> & Items);

};


%make_alias(StepAP214_AppliedExternalIdentificationAssignment)

%extend StepAP214_AppliedExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepAP214_AppliedGroupAssignment *
*****************************************/
class StepAP214_AppliedGroupAssignment : public StepBasic_GroupAssignment {
	public:
		/****************** StepAP214_AppliedGroupAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedGroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_AppliedGroupAssignment;
		 StepAP214_AppliedGroupAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aGroupAssignment_AssignedGroup: StepBasic_Group
aItems: StepAP214_HArray1OfGroupItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Group> & aGroupAssignment_AssignedGroup, const opencascade::handle<StepAP214_HArray1OfGroupItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns field items.

Returns
-------
opencascade::handle<StepAP214_HArray1OfGroupItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfGroupItem> Items();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "Set field items.

Parameters
----------
Items: StepAP214_HArray1OfGroupItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfGroupItem> & Items);

};


%make_alias(StepAP214_AppliedGroupAssignment)

%extend StepAP214_AppliedGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepAP214_AppliedOrganizationAssignment *
************************************************/
class StepAP214_AppliedOrganizationAssignment : public StepBasic_OrganizationAssignment {
	public:
		/****************** StepAP214_AppliedOrganizationAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedOrganizationAssignment;
		%feature("autodoc", "Returns a appliedorganizationassignment.

Returns
-------
None
") StepAP214_AppliedOrganizationAssignment;
		 StepAP214_AppliedOrganizationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedOrganization: StepBasic_Organization
aRole: StepBasic_OrganizationRole
aItems: StepAP214_HArray1OfOrganizationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization, const opencascade::handle<StepBasic_OrganizationRole> & aRole, const opencascade::handle<StepAP214_HArray1OfOrganizationItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfOrganizationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfOrganizationItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_OrganizationItem
") ItemsValue;
		StepAP214_OrganizationItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfOrganizationItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfOrganizationItem> & aItems);

};


%make_alias(StepAP214_AppliedOrganizationAssignment)

%extend StepAP214_AppliedOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepAP214_AppliedPersonAndOrganizationAssignment *
*********************************************************/
class StepAP214_AppliedPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		/****************** StepAP214_AppliedPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns a autodesigndateandpersonassignment.

Returns
-------
None
") StepAP214_AppliedPersonAndOrganizationAssignment;
		 StepAP214_AppliedPersonAndOrganizationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole
aItems: StepAP214_HArray1OfPersonAndOrganizationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole, const opencascade::handle<StepAP214_HArray1OfPersonAndOrganizationItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfPersonAndOrganizationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfPersonAndOrganizationItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_PersonAndOrganizationItem
") ItemsValue;
		StepAP214_PersonAndOrganizationItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfPersonAndOrganizationItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfPersonAndOrganizationItem> & aItems);

};


%make_alias(StepAP214_AppliedPersonAndOrganizationAssignment)

%extend StepAP214_AppliedPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepAP214_AppliedPresentedItem *
***************************************/
class StepAP214_AppliedPresentedItem : public StepVisual_PresentedItem {
	public:
		/****************** StepAP214_AppliedPresentedItem ******************/
		%feature("compactdefaultargs") StepAP214_AppliedPresentedItem;
		%feature("autodoc", "Returns a autodesignpresenteditem.

Returns
-------
None
") StepAP214_AppliedPresentedItem;
		 StepAP214_AppliedPresentedItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfPresentedItemSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepAP214_HArray1OfPresentedItemSelect> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfPresentedItemSelect>
") Items;
		opencascade::handle<StepAP214_HArray1OfPresentedItemSelect> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_PresentedItemSelect
") ItemsValue;
		StepAP214_PresentedItemSelect ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfPresentedItemSelect

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfPresentedItemSelect> & aItems);

};


%make_alias(StepAP214_AppliedPresentedItem)

%extend StepAP214_AppliedPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepAP214_AppliedSecurityClassificationAssignment *
**********************************************************/
class StepAP214_AppliedSecurityClassificationAssignment : public StepBasic_SecurityClassificationAssignment {
	public:
		/****************** StepAP214_AppliedSecurityClassificationAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns a appliedsecurityclassificationassignment.

Returns
-------
None
") StepAP214_AppliedSecurityClassificationAssignment;
		 StepAP214_AppliedSecurityClassificationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification
aItems: StepAP214_HArray1OfSecurityClassificationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification, const opencascade::handle<StepAP214_HArray1OfSecurityClassificationItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfSecurityClassificationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfSecurityClassificationItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_SecurityClassificationItem
") ItemsValue;
		const StepAP214_SecurityClassificationItem & ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfSecurityClassificationItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfSecurityClassificationItem> & aItems);

};


%make_alias(StepAP214_AppliedSecurityClassificationAssignment)

%extend StepAP214_AppliedSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepAP214_ApprovalItem *
*******************************/
class StepAP214_ApprovalItem : public StepData_SelectType {
	public:
		/****************** StepAP214_ApprovalItem ******************/
		%feature("compactdefaultargs") StepAP214_ApprovalItem;
		%feature("autodoc", "Returns a approvalitem selecttype.

Returns
-------
None
") StepAP214_ApprovalItem;
		 StepAP214_ApprovalItem();

		/****************** AssemblyComponentUsageSubstitute ******************/
		%feature("compactdefaultargs") AssemblyComponentUsageSubstitute;
		%feature("autodoc", "Returns value as a assemblycomponentusagesubstitute (null if another type).

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute>
") AssemblyComponentUsageSubstitute;
		virtual opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> AssemblyComponentUsageSubstitute();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a approvalitem kind entity that is : 1 -> assemblycomponentusagesubstitute 2 -> documentfile 3 -> materialdesignation 4 -> mechanicaldesigngeometricpresentationrepresentation 5 -> presentationarea 6 -> product 7 -> productdefinition 8 -> productdefinitionformation 9 -> productdefinitionrelationship 10 -> propertydefinition 11 -> shaperepresentation 12 -> securityclassification 13 -> configurationitem 14 -> date 15 -> document 16 -> effectivity 17 -> group 18 -> grouprelationship 19 -> productdefinitionformationrelationship 20 -> representation 21 -> shapeaspectrelationship 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ConfigurationItem ******************/
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "Returns value as a configurationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_ConfigurationItem>
") ConfigurationItem;
		virtual opencascade::handle<StepRepr_ConfigurationItem> ConfigurationItem();

		/****************** Date ******************/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Returns value as a date (null if another type).

Returns
-------
opencascade::handle<StepBasic_Date>
") Date;
		virtual opencascade::handle<StepBasic_Date> Date();

		/****************** Document ******************/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Returns value as a document (null if another type).

Returns
-------
opencascade::handle<StepBasic_Document>
") Document;
		virtual opencascade::handle<StepBasic_Document> Document();

		/****************** DocumentFile ******************/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Returns value as a documentfile (null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentFile>
") DocumentFile;
		virtual opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****************** Effectivity ******************/
		%feature("compactdefaultargs") Effectivity;
		%feature("autodoc", "Returns value as a effectivity (null if another type).

Returns
-------
opencascade::handle<StepBasic_Effectivity>
") Effectivity;
		virtual opencascade::handle<StepBasic_Effectivity> Effectivity();

		/****************** Group ******************/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Returns value as a group (null if another type).

Returns
-------
opencascade::handle<StepBasic_Group>
") Group;
		virtual opencascade::handle<StepBasic_Group> Group();

		/****************** GroupRelationship ******************/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Returns value as a grouprelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupRelationship>
") GroupRelationship;
		virtual opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****************** MaterialDesignation ******************/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "Returns value as a materialdesignation (null if another type).

Returns
-------
opencascade::handle<StepRepr_MaterialDesignation>
") MaterialDesignation;
		virtual opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****************** MechanicalDesignGeometricPresentationRepresentation ******************/
		%feature("compactdefaultargs") MechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "Returns value as a mechanicaldesigngeometricpresentationrepresentation (null if another type).

Returns
-------
opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation>
") MechanicalDesignGeometricPresentationRepresentation;
		virtual opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> MechanicalDesignGeometricPresentationRepresentation();

		/****************** PresentationArea ******************/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Returns value as a presentationarea (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationArea>
") PresentationArea;
		virtual opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****************** Product ******************/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Returns value as a product (null if another type).

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		virtual opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		virtual opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as a productdefinitionformation (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** ProductDefinitionFormationRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionFormationRelationship;
		%feature("autodoc", "Returns value as a productdefinitionformationrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormationRelationship>
") ProductDefinitionFormationRelationship;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> ProductDefinitionFormationRelationship();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as aproductdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		virtual opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		virtual opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		virtual opencascade::handle<StepRepr_Representation> Representation();

		/****************** SecurityClassification ******************/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Returns value as a securityclassification (null if another type).

Returns
-------
opencascade::handle<StepBasic_SecurityClassification>
") SecurityClassification;
		virtual opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
") ShapeAspectRelationship;
		virtual opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****************** ShapeRepresentation ******************/
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "Returns value as a shaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") ShapeRepresentation;
		virtual opencascade::handle<StepShape_ShapeRepresentation> ShapeRepresentation();

};


%extend StepAP214_ApprovalItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepAP214_AutoDesignActualDateAndTimeAssignment *
********************************************************/
class StepAP214_AutoDesignActualDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		/****************** StepAP214_AutoDesignActualDateAndTimeAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "Returns a autodesignactualdateandtimeassignment.

Returns
-------
None
") StepAP214_AutoDesignActualDateAndTimeAssignment;
		 StepAP214_AutoDesignActualDateAndTimeAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole
aItems: StepAP214_HArray1OfAutoDesignDateAndTimeItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole, const opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignDateAndTimeItem
") ItemsValue;
		StepAP214_AutoDesignDateAndTimeItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignDateAndTimeItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> & aItems);

};


%make_alias(StepAP214_AutoDesignActualDateAndTimeAssignment)

%extend StepAP214_AutoDesignActualDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepAP214_AutoDesignActualDateAssignment *
*************************************************/
class StepAP214_AutoDesignActualDateAssignment : public StepBasic_DateAssignment {
	public:
		/****************** StepAP214_AutoDesignActualDateAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAssignment;
		%feature("autodoc", "Returns a autodesignactualdateassignment.

Returns
-------
None
") StepAP214_AutoDesignActualDateAssignment;
		 StepAP214_AutoDesignActualDateAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole
aItems: StepAP214_HArray1OfAutoDesignDatedItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole, const opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignDatedItem
") ItemsValue;
		StepAP214_AutoDesignDatedItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignDatedItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> & aItems);

};


%make_alias(StepAP214_AutoDesignActualDateAssignment)

%extend StepAP214_AutoDesignActualDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepAP214_AutoDesignApprovalAssignment *
***********************************************/
class StepAP214_AutoDesignApprovalAssignment : public StepBasic_ApprovalAssignment {
	public:
		/****************** StepAP214_AutoDesignApprovalAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignApprovalAssignment;
		%feature("autodoc", "Returns a autodesignapprovalassignment.

Returns
-------
None
") StepAP214_AutoDesignApprovalAssignment;
		 StepAP214_AutoDesignApprovalAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedApproval: StepBasic_Approval
aItems: StepAP214_HArray1OfAutoDesignGeneralOrgItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Approval> & aAssignedApproval, const opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignGeneralOrgItem
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignGeneralOrgItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> & aItems);

};


%make_alias(StepAP214_AutoDesignApprovalAssignment)

%extend StepAP214_AutoDesignApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepAP214_AutoDesignDateAndPersonAssignment *
****************************************************/
class StepAP214_AutoDesignDateAndPersonAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		/****************** StepAP214_AutoDesignDateAndPersonAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Returns a autodesigndateandpersonassignment.

Returns
-------
None
") StepAP214_AutoDesignDateAndPersonAssignment;
		 StepAP214_AutoDesignDateAndPersonAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole
aItems: StepAP214_HArray1OfAutoDesignDateAndPersonItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole, const opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndPersonItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndPersonItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndPersonItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignDateAndPersonItem
") ItemsValue;
		StepAP214_AutoDesignDateAndPersonItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignDateAndPersonItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndPersonItem> & aItems);

};


%make_alias(StepAP214_AutoDesignDateAndPersonAssignment)

%extend StepAP214_AutoDesignDateAndPersonAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepAP214_AutoDesignDateAndPersonItem *
**********************************************/
class StepAP214_AutoDesignDateAndPersonItem : public StepData_SelectType {
	public:
		/****************** StepAP214_AutoDesignDateAndPersonItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonItem;
		%feature("autodoc", "Returns a autodesigndateandpersonitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignDateAndPersonItem;
		 StepAP214_AutoDesignDateAndPersonItem();

		/****************** AutoDesignDocumentReference ******************/
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_AutoDesignDocumentReference>
") AutoDesignDocumentReference;
		opencascade::handle<StepAP214_AutoDesignDocumentReference> AutoDesignDocumentReference();

		/****************** AutoDesignOrganizationAssignment ******************/
		%feature("compactdefaultargs") AutoDesignOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_AutoDesignOrganizationAssignment>
") AutoDesignOrganizationAssignment;
		opencascade::handle<StepAP214_AutoDesignOrganizationAssignment> AutoDesignOrganizationAssignment();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a autodesigndateandpersonitem kind entity that is : 1 autodesignorganizationassignment from stepap214, 2 product from stepbasic, 3 productdefinition from stepbasic, 4 productdefinitionformation from stepbasic, 5 representation from steprepr, 6 autodesigndocumentreference from stepap214, 7 externallydefinedrepresentation from steprepr, 8 productdefinitionrelationship from stepbasic, 9 productdefinitionwithassociateddocuments from stepbasic 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ExternallyDefinedRepresentation ******************/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****************** Product ******************/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** ProductDefinitionWithAssociatedDocuments ******************/
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments>
") ProductDefinitionWithAssociatedDocuments;
		opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> ProductDefinitionWithAssociatedDocuments();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

};


%extend StepAP214_AutoDesignDateAndPersonItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepAP214_AutoDesignDateAndTimeItem *
********************************************/
class StepAP214_AutoDesignDateAndTimeItem : public StepData_SelectType {
	public:
		/****************** StepAP214_AutoDesignDateAndTimeItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndTimeItem;
		%feature("autodoc", "Returns a autodesigndateandtimeitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignDateAndTimeItem;
		 StepAP214_AutoDesignDateAndTimeItem();

		/****************** ApprovalPersonOrganization ******************/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** AutoDesignDateAndPersonAssignment ******************/
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Returns value as a autodesigndateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment>
") AutoDesignDateAndPersonAssignment;
		opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> AutoDesignDateAndPersonAssignment();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a autodesigndateandtimeitem kind entity that is : 1 -> approvalpersonorganization 2 -> autodesigndateandpersonassignment 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionEffectivity ******************/
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionEffectivity>
") ProductDefinitionEffectivity;
		opencascade::handle<StepBasic_ProductDefinitionEffectivity> ProductDefinitionEffectivity();

};


%extend StepAP214_AutoDesignDateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepAP214_AutoDesignDatedItem *
**************************************/
class StepAP214_AutoDesignDatedItem : public StepData_SelectType {
	public:
		/****************** StepAP214_AutoDesignDatedItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignDatedItem;
		%feature("autodoc", "Returns a autodesigndateditem selecttype.

Returns
-------
None
") StepAP214_AutoDesignDatedItem;
		 StepAP214_AutoDesignDatedItem();

		/****************** ApprovalPersonOrganization ******************/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** AutoDesignDateAndPersonAssignment ******************/
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Returns value as a autodesigndateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment>
") AutoDesignDateAndPersonAssignment;
		opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> AutoDesignDateAndPersonAssignment();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a autodesigndateditem kind entity that is : 1 -> approvalpersonorganization 2 -> autodesigndateandpersonassignment 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionEffectivity ******************/
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "Returns value as a productdefinitioneffectivity.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionEffectivity>
") ProductDefinitionEffectivity;
		opencascade::handle<StepBasic_ProductDefinitionEffectivity> ProductDefinitionEffectivity();

};


%extend StepAP214_AutoDesignDatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepAP214_AutoDesignDocumentReference *
**********************************************/
class StepAP214_AutoDesignDocumentReference : public StepBasic_DocumentReference {
	public:
		/****************** StepAP214_AutoDesignDocumentReference ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_AutoDesignDocumentReference;
		 StepAP214_AutoDesignDocumentReference();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDocument: StepBasic_Document
aSource: TCollection_HAsciiString
aItems: StepAP214_HArray1OfAutoDesignReferencingItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Document> & aAssignedDocument, const opencascade::handle<TCollection_HAsciiString> & aSource, const opencascade::handle<StepAP214_HArray1OfAutoDesignReferencingItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignReferencingItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignReferencingItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignReferencingItem
") ItemsValue;
		StepAP214_AutoDesignReferencingItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignReferencingItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignReferencingItem> & aItems);

};


%make_alias(StepAP214_AutoDesignDocumentReference)

%extend StepAP214_AutoDesignDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepAP214_AutoDesignGeneralOrgItem *
*******************************************/
class StepAP214_AutoDesignGeneralOrgItem : public StepData_SelectType {
	public:
		/****************** StepAP214_AutoDesignGeneralOrgItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignGeneralOrgItem;
		%feature("autodoc", "Returns a autodesigngeneralorgitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignGeneralOrgItem;
		 StepAP214_AutoDesignGeneralOrgItem();

		/****************** AutoDesignDocumentReference ******************/
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_AutoDesignDocumentReference>
") AutoDesignDocumentReference;
		opencascade::handle<StepAP214_AutoDesignDocumentReference> AutoDesignDocumentReference();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a autodesigngeneralorgitem kind entity that is : 1 product from stepbasic, 2 productdefinition from stepbasic, 3 productdefinitionformation from stepbasic, 4 productdefinitionrelationship from stepbasic, 5 productdefinitionwithassociateddocuments from stepbasic, 6 representation from steprepr 7 externallydefinedrepresentation from steprepr, 8 autodesigndocumentreference from stepap214, 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ExternallyDefinedRepresentation ******************/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****************** Product ******************/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Returns value as a product (null if another type).

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as a productdefinitionformation (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as a productdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** ProductDefinitionWithAssociatedDocuments ******************/
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "Returns value as a productdefinitionwithassociateddocuments (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments>
") ProductDefinitionWithAssociatedDocuments;
		opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> ProductDefinitionWithAssociatedDocuments();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

};


%extend StepAP214_AutoDesignGeneralOrgItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepAP214_AutoDesignGroupAssignment *
********************************************/
class StepAP214_AutoDesignGroupAssignment : public StepBasic_GroupAssignment {
	public:
		/****************** StepAP214_AutoDesignGroupAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupAssignment;
		%feature("autodoc", "Returns a autodesigngroupassignment.

Returns
-------
None
") StepAP214_AutoDesignGroupAssignment;
		 StepAP214_AutoDesignGroupAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedGroup: StepBasic_Group
aItems: StepAP214_HArray1OfAutoDesignGroupedItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Group> & aAssignedGroup, const opencascade::handle<StepAP214_HArray1OfAutoDesignGroupedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGroupedItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGroupedItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignGroupedItem
") ItemsValue;
		StepAP214_AutoDesignGroupedItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignGroupedItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignGroupedItem> & aItems);

};


%make_alias(StepAP214_AutoDesignGroupAssignment)

%extend StepAP214_AutoDesignGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepAP214_AutoDesignGroupedItem *
****************************************/
class StepAP214_AutoDesignGroupedItem : public StepData_SelectType {
	public:
		/****************** StepAP214_AutoDesignGroupedItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupedItem;
		%feature("autodoc", "Returns a autodesigngroupeditem selecttype.

Returns
-------
None
") StepAP214_AutoDesignGroupedItem;
		 StepAP214_AutoDesignGroupedItem();

		/****************** AdvancedBrepShapeRepresentation ******************/
		%feature("compactdefaultargs") AdvancedBrepShapeRepresentation;
		%feature("autodoc", "Returns value as a advancedbrepshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_AdvancedBrepShapeRepresentation>
") AdvancedBrepShapeRepresentation;
		opencascade::handle<StepShape_AdvancedBrepShapeRepresentation> AdvancedBrepShapeRepresentation();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a autodesigngroupeditem kind entity that is : 1 -> advancedbrepshaperepresentation 2 -> csgshaperepresentation 3 -> facetedbrepshaperepresentation 4 -> geometricallyboundedsurfaceshaperepresentation 5 -> geometricallyboundedwireframeshaperepresentation 6 -> manifoldsurfaceshaperepresentation 7 -> representation 8 -> representationitem 9 -> shapeaspect 10 -> shaperepresentation 11 -> templateinstance 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CsgShapeRepresentation ******************/
		%feature("compactdefaultargs") CsgShapeRepresentation;
		%feature("autodoc", "Returns value as a csgshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_CsgShapeRepresentation>
") CsgShapeRepresentation;
		opencascade::handle<StepShape_CsgShapeRepresentation> CsgShapeRepresentation();

		/****************** FacetedBrepShapeRepresentation ******************/
		%feature("compactdefaultargs") FacetedBrepShapeRepresentation;
		%feature("autodoc", "Returns value as a facetedbrepshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_FacetedBrepShapeRepresentation>
") FacetedBrepShapeRepresentation;
		opencascade::handle<StepShape_FacetedBrepShapeRepresentation> FacetedBrepShapeRepresentation();

		/****************** GeometricallyBoundedSurfaceShapeRepresentation ******************/
		%feature("compactdefaultargs") GeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "Returns value as a geometricallyboundedsurfaceshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation>
") GeometricallyBoundedSurfaceShapeRepresentation;
		opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation> GeometricallyBoundedSurfaceShapeRepresentation();

		/****************** GeometricallyBoundedWireframeShapeRepresentation ******************/
		%feature("compactdefaultargs") GeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "Returns value as a geometricallyboundedwireframeshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation>
") GeometricallyBoundedWireframeShapeRepresentation;
		opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation> GeometricallyBoundedWireframeShapeRepresentation();

		/****************** ManifoldSurfaceShapeRepresentation ******************/
		%feature("compactdefaultargs") ManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "Returns value as a manifoldsurfaceshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation>
") ManifoldSurfaceShapeRepresentation;
		opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation> ManifoldSurfaceShapeRepresentation();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationItem ******************/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeRepresentation ******************/
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "Returns value as a shaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") ShapeRepresentation;
		opencascade::handle<StepShape_ShapeRepresentation> ShapeRepresentation();

		/****************** TemplateInstance ******************/
		%feature("compactdefaultargs") TemplateInstance;
		%feature("autodoc", "Returns value as a templateinstance (null if another type).

Returns
-------
opencascade::handle<StepVisual_TemplateInstance>
") TemplateInstance;
		opencascade::handle<StepVisual_TemplateInstance> TemplateInstance();

};


%extend StepAP214_AutoDesignGroupedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepAP214_AutoDesignNominalDateAndTimeAssignment *
*********************************************************/
class StepAP214_AutoDesignNominalDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		/****************** StepAP214_AutoDesignNominalDateAndTimeAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "Returns a autodesignnominaldateandtimeassignment.

Returns
-------
None
") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		 StepAP214_AutoDesignNominalDateAndTimeAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole
aItems: StepAP214_HArray1OfAutoDesignDateAndTimeItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole, const opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignDateAndTimeItem
") ItemsValue;
		StepAP214_AutoDesignDateAndTimeItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignDateAndTimeItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> & aItems);

};


%make_alias(StepAP214_AutoDesignNominalDateAndTimeAssignment)

%extend StepAP214_AutoDesignNominalDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepAP214_AutoDesignNominalDateAssignment *
**************************************************/
class StepAP214_AutoDesignNominalDateAssignment : public StepBasic_DateAssignment {
	public:
		/****************** StepAP214_AutoDesignNominalDateAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAssignment;
		%feature("autodoc", "Returns a autodesignnominaldateassignment.

Returns
-------
None
") StepAP214_AutoDesignNominalDateAssignment;
		 StepAP214_AutoDesignNominalDateAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole
aItems: StepAP214_HArray1OfAutoDesignDatedItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole, const opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignDatedItem
") ItemsValue;
		StepAP214_AutoDesignDatedItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignDatedItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> & aItems);

};


%make_alias(StepAP214_AutoDesignNominalDateAssignment)

%extend StepAP214_AutoDesignNominalDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepAP214_AutoDesignOrganizationAssignment *
***************************************************/
class StepAP214_AutoDesignOrganizationAssignment : public StepBasic_OrganizationAssignment {
	public:
		/****************** StepAP214_AutoDesignOrganizationAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationAssignment;
		%feature("autodoc", "Returns a autodesignorganizationassignment.

Returns
-------
None
") StepAP214_AutoDesignOrganizationAssignment;
		 StepAP214_AutoDesignOrganizationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedOrganization: StepBasic_Organization
aRole: StepBasic_OrganizationRole
aItems: StepAP214_HArray1OfAutoDesignGeneralOrgItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization, const opencascade::handle<StepBasic_OrganizationRole> & aRole, const opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignGeneralOrgItem
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignGeneralOrgItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> & aItems);

};


%make_alias(StepAP214_AutoDesignOrganizationAssignment)

%extend StepAP214_AutoDesignOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class StepAP214_AutoDesignPersonAndOrganizationAssignment *
************************************************************/
class StepAP214_AutoDesignPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		/****************** StepAP214_AutoDesignPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns a autodesignpersonandorganizationassignment.

Returns
-------
None
") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		 StepAP214_AutoDesignPersonAndOrganizationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole
aItems: StepAP214_HArray1OfAutoDesignGeneralOrgItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole, const opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignGeneralOrgItem
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignGeneralOrgItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> & aItems);

};


%make_alias(StepAP214_AutoDesignPersonAndOrganizationAssignment)

%extend StepAP214_AutoDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepAP214_AutoDesignPresentedItem *
******************************************/
class StepAP214_AutoDesignPresentedItem : public StepVisual_PresentedItem {
	public:
		/****************** StepAP214_AutoDesignPresentedItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItem;
		%feature("autodoc", "Returns a autodesignpresenteditem.

Returns
-------
None
") StepAP214_AutoDesignPresentedItem;
		 StepAP214_AutoDesignPresentedItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignPresentedItemSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepAP214_HArray1OfAutoDesignPresentedItemSelect> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignPresentedItemSelect>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignPresentedItemSelect> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepAP214_AutoDesignPresentedItemSelect
") ItemsValue;
		StepAP214_AutoDesignPresentedItemSelect ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepAP214_HArray1OfAutoDesignPresentedItemSelect

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepAP214_HArray1OfAutoDesignPresentedItemSelect> & aItems);

};


%make_alias(StepAP214_AutoDesignPresentedItem)

%extend StepAP214_AutoDesignPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepAP214_AutoDesignPresentedItemSelect *
************************************************/
class StepAP214_AutoDesignPresentedItemSelect : public StepData_SelectType {
	public:
		/****************** StepAP214_AutoDesignPresentedItemSelect ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItemSelect;
		%feature("autodoc", "Returns a autodesignpresenteditemselect selecttype.

Returns
-------
None
") StepAP214_AutoDesignPresentedItemSelect;
		 StepAP214_AutoDesignPresentedItemSelect();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a autodesignpresenteditemselect kind entity that is : 1 -> productdefinition, 2 -> productdefinitionrelationship, 3 -> productdefinitionshape 4 -> representationrelationship 5 -> shapeaspect 6 -> documentrelationship, 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DocumentRelationship ******************/
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "Returns value as a documentrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentRelationship>
") DocumentRelationship;
		opencascade::handle<StepBasic_DocumentRelationship> DocumentRelationship();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as a productdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** ProductDefinitionShape ******************/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Returns value as a productdefinitionshape (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****************** RepresentationRelationship ******************/
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "Returns value as a representationrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationRelationship>
") RepresentationRelationship;
		opencascade::handle<StepRepr_RepresentationRelationship> RepresentationRelationship();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

};


%extend StepAP214_AutoDesignPresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepAP214_AutoDesignReferencingItem *
********************************************/
class StepAP214_AutoDesignReferencingItem : public StepData_SelectType {
	public:
		/****************** StepAP214_AutoDesignReferencingItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignReferencingItem;
		%feature("autodoc", "Returns a autodesignreferencingitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignReferencingItem;
		 StepAP214_AutoDesignReferencingItem();

		/****************** Approval ******************/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a autodesignreferencingitem kind entity that is : 1 approval from stepbasic, 2 documentrelationship from stepbasic, 3 externallydefinedrepresentation from steprepr, 4 mappeditem from steprepr, 5 materialdesignation from steprepr, 6 presentationarea from stepvisual, 7 presentationview from stepvisual, 8 productcategory from stepbasic, 9 productdefinition from stepbasic, 10 productdefinitionrelationship from stepbasic, 11 propertydefinition from stepbasic, 12 representation from steprepr, 13 representationrelationship from steprepr, 14 shapeaspect from steprepr 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DocumentRelationship ******************/
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DocumentRelationship>
") DocumentRelationship;
		opencascade::handle<StepBasic_DocumentRelationship> DocumentRelationship();

		/****************** ExternallyDefinedRepresentation ******************/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****************** MappedItem ******************/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_MappedItem>
") MappedItem;
		opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****************** MaterialDesignation ******************/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_MaterialDesignation>
") MaterialDesignation;
		opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****************** PresentationArea ******************/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationArea>
") PresentationArea;
		opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****************** PresentationView ******************/
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationView>
") PresentationView;
		opencascade::handle<StepVisual_PresentationView> PresentationView();

		/****************** ProductCategory ******************/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationRelationship ******************/
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationRelationship>
") RepresentationRelationship;
		opencascade::handle<StepRepr_RepresentationRelationship> RepresentationRelationship();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

};


%extend StepAP214_AutoDesignReferencingItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class StepAP214_AutoDesignSecurityClassificationAssignment *
*************************************************************/
class StepAP214_AutoDesignSecurityClassificationAssignment : public StepBasic_SecurityClassificationAssignment {
	public:
		/****************** StepAP214_AutoDesignSecurityClassificationAssignment ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "Returns a autodesignsecurityclassificationassignment.

Returns
-------
None
") StepAP214_AutoDesignSecurityClassificationAssignment;
		 StepAP214_AutoDesignSecurityClassificationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification
aItems: StepBasic_HArray1OfApproval

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification, const opencascade::handle<StepBasic_HArray1OfApproval> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfApproval>
") Items;
		opencascade::handle<StepBasic_HArray1OfApproval> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_Approval>
") ItemsValue;
		opencascade::handle<StepBasic_Approval> ItemsValue(const Standard_Integer num);

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepBasic_HArray1OfApproval

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepBasic_HArray1OfApproval> & aItems);

};


%make_alias(StepAP214_AutoDesignSecurityClassificationAssignment)

%extend StepAP214_AutoDesignSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepAP214_Class *
************************/
class StepAP214_Class : public StepBasic_Group {
	public:
		/****************** StepAP214_Class ******************/
		%feature("compactdefaultargs") StepAP214_Class;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_Class;
		 StepAP214_Class();

};


%make_alias(StepAP214_Class)

%extend StepAP214_Class {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepAP214_DocumentReferenceItem *
****************************************/
class StepAP214_DocumentReferenceItem : public StepData_SelectType {
	public:
		/****************** StepAP214_DocumentReferenceItem ******************/
		%feature("compactdefaultargs") StepAP214_DocumentReferenceItem;
		%feature("autodoc", "Returns a documentreferenceitem selecttype.

Returns
-------
None
") StepAP214_DocumentReferenceItem;
		 StepAP214_DocumentReferenceItem();

		/****************** AppliedExternalIdentificationAssignment ******************/
		%feature("compactdefaultargs") AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Returns value as a appliedexternalidentificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment>
") AppliedExternalIdentificationAssignment;
		opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> AppliedExternalIdentificationAssignment();

		/****************** Approval ******************/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as a approval (null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** AssemblyComponentUsage ******************/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "Returns value as a assemblycomponentusage (null if another type).

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>
") AssemblyComponentUsage;
		opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a documentreferenceitem kind entity that is :.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CharacterizedObject ******************/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Returns value as a characterizedobject (null if another type).

Returns
-------
opencascade::handle<StepBasic_CharacterizedObject>
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****************** DescriptiveRepresentationItem ******************/
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "Returns value as a (null if another type).

Returns
-------
opencascade::handle<StepRepr_DescriptiveRepresentationItem>
") DescriptiveRepresentationItem;
		opencascade::handle<StepRepr_DescriptiveRepresentationItem> DescriptiveRepresentationItem();

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** ExternallyDefinedItem ******************/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Returns value as a externallydefineditem (null if another type).

Returns
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****************** Group ******************/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Returns value as a group (null if another type).

Returns
-------
opencascade::handle<StepBasic_Group>
") Group;
		opencascade::handle<StepBasic_Group> Group();

		/****************** GroupRelationship ******************/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Returns value as a grouprelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupRelationship>
") GroupRelationship;
		opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****************** MaterialDesignation ******************/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "Returns value as a materialdesignation (null if another type).

Returns
-------
opencascade::handle<StepRepr_MaterialDesignation>
") MaterialDesignation;
		opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****************** MeasureRepresentationItem ******************/
		%feature("compactdefaultargs") MeasureRepresentationItem;
		%feature("autodoc", "Returns value as a measurerepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_MeasureRepresentationItem>
") MeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> MeasureRepresentationItem();

		/****************** ProductCategory ******************/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "Returns value as a productcategory (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionContext ******************/
		%feature("compactdefaultargs") ProductDefinitionContext;
		%feature("autodoc", "Returns value as a productdefinitioncontext (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionContext>
") ProductDefinitionContext;
		opencascade::handle<StepBasic_ProductDefinitionContext> ProductDefinitionContext();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as aproductdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationItem ******************/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
") ShapeAspectRelationship;
		opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

};


%extend StepAP214_DocumentReferenceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepAP214_ExternalIdentificationItem *
*********************************************/
class StepAP214_ExternalIdentificationItem : public StepData_SelectType {
	public:
		/****************** StepAP214_ExternalIdentificationItem ******************/
		%feature("compactdefaultargs") StepAP214_ExternalIdentificationItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_ExternalIdentificationItem;
		 StepAP214_ExternalIdentificationItem();

		/****************** AppliedOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as appliedorganizationassignment (or null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as appliedpersonandorganizationassignment (or null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** Approval ******************/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as approval (or null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** ApprovalStatus ******************/
		%feature("compactdefaultargs") ApprovalStatus;
		%feature("autodoc", "Returns value as approvalstatus (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalStatus>
") ApprovalStatus;
		opencascade::handle<StepBasic_ApprovalStatus> ApprovalStatus();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of externalidentificationitem select type 1 -> documentfile from stepbasic 2 -> externallydefinedclass from stepap214 3 -> externallydefinedgeneralproperty from stepap214 4 -> productdefinition from stepbasic 5 -> appliedorganizationassignment from ap214 6 -> appliedpersonandorganizationassignment from ap214 7 -> approval from stepbasic 8 -> approvalstatus from stepbasic 9 -> externalsource from stepbasic 10 -> organizationaladdress from stepbasic 11 -> securityclassification from stepbasic 12 -> trimmedcurve from stepgeom 13 -> versionedactionrequest from stepbasic 14 -> dateandtimeassignment from stepbasic 15 -> dateassignment from stepbasic 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DateAndTimeAssignment ******************/
		%feature("compactdefaultargs") DateAndTimeAssignment;
		%feature("autodoc", "Returns value as dateandtimeassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DateAndTimeAssignment>
") DateAndTimeAssignment;
		opencascade::handle<StepBasic_DateAndTimeAssignment> DateAndTimeAssignment();

		/****************** DateAssignment ******************/
		%feature("compactdefaultargs") DateAssignment;
		%feature("autodoc", "Returns value as dateassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DateAssignment>
") DateAssignment;
		opencascade::handle<StepBasic_DateAssignment> DateAssignment();

		/****************** DocumentFile ******************/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Returns value as documentfile (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentFile>
") DocumentFile;
		opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****************** ExternalSource ******************/
		%feature("compactdefaultargs") ExternalSource;
		%feature("autodoc", "Returns value as externalsource (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ExternalSource>
") ExternalSource;
		opencascade::handle<StepBasic_ExternalSource> ExternalSource();

		/****************** ExternallyDefinedClass ******************/
		%feature("compactdefaultargs") ExternallyDefinedClass;
		%feature("autodoc", "Returns value as externallydefinedclass (or null if another type).

Returns
-------
opencascade::handle<StepAP214_ExternallyDefinedClass>
") ExternallyDefinedClass;
		opencascade::handle<StepAP214_ExternallyDefinedClass> ExternallyDefinedClass();

		/****************** ExternallyDefinedGeneralProperty ******************/
		%feature("compactdefaultargs") ExternallyDefinedGeneralProperty;
		%feature("autodoc", "Returns value as externallydefinedgeneralproperty (or null if another type).

Returns
-------
opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty>
") ExternallyDefinedGeneralProperty;
		opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty> ExternallyDefinedGeneralProperty();

		/****************** OrganizationalAddress ******************/
		%feature("compactdefaultargs") OrganizationalAddress;
		%feature("autodoc", "Returns value as organizationaladdress (or null if another type).

Returns
-------
opencascade::handle<StepBasic_OrganizationalAddress>
") OrganizationalAddress;
		opencascade::handle<StepBasic_OrganizationalAddress> OrganizationalAddress();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as productdefinition (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** SecurityClassification ******************/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Returns value as securityclassification (or null if another type).

Returns
-------
opencascade::handle<StepBasic_SecurityClassification>
") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****************** TrimmedCurve ******************/
		%feature("compactdefaultargs") TrimmedCurve;
		%feature("autodoc", "Returns value as trimmedcurve (or null if another type).

Returns
-------
opencascade::handle<StepGeom_TrimmedCurve>
") TrimmedCurve;
		opencascade::handle<StepGeom_TrimmedCurve> TrimmedCurve();

		/****************** VersionedActionRequest ******************/
		%feature("compactdefaultargs") VersionedActionRequest;
		%feature("autodoc", "Returns value as versionedactionrequest (or null if another type).

Returns
-------
opencascade::handle<StepBasic_VersionedActionRequest>
") VersionedActionRequest;
		opencascade::handle<StepBasic_VersionedActionRequest> VersionedActionRequest();

};


%extend StepAP214_ExternalIdentificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepAP214_ExternallyDefinedGeneralProperty *
***************************************************/
class StepAP214_ExternallyDefinedGeneralProperty : public StepBasic_GeneralProperty {
	public:
		/****************** StepAP214_ExternallyDefinedGeneralProperty ******************/
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedGeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_ExternallyDefinedGeneralProperty;
		 StepAP214_ExternallyDefinedGeneralProperty();

		/****************** ExternallyDefinedItem ******************/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Returns data for supertype externallydefineditem.

Returns
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aGeneralProperty_Id: TCollection_HAsciiString
aGeneralProperty_Name: TCollection_HAsciiString
hasGeneralProperty_Description: bool
aGeneralProperty_Description: TCollection_HAsciiString
aExternallyDefinedItem_ItemId: StepBasic_SourceItem
aExternallyDefinedItem_Source: StepBasic_ExternalSource

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGeneralProperty_Id, const opencascade::handle<TCollection_HAsciiString> & aGeneralProperty_Name, const Standard_Boolean hasGeneralProperty_Description, const opencascade::handle<TCollection_HAsciiString> & aGeneralProperty_Description, const StepBasic_SourceItem & aExternallyDefinedItem_ItemId, const opencascade::handle<StepBasic_ExternalSource> & aExternallyDefinedItem_Source);

		/****************** SetExternallyDefinedItem ******************/
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "Set data for supertype externallydefineditem.

Parameters
----------
ExternallyDefinedItem: StepBasic_ExternallyDefinedItem

Returns
-------
None
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem(const opencascade::handle<StepBasic_ExternallyDefinedItem> & ExternallyDefinedItem);

};


%make_alias(StepAP214_ExternallyDefinedGeneralProperty)

%extend StepAP214_ExternallyDefinedGeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepAP214_GroupItem *
****************************/
class StepAP214_GroupItem : public StepData_SelectType {
	public:
		/****************** StepAP214_GroupItem ******************/
		%feature("compactdefaultargs") StepAP214_GroupItem;
		%feature("autodoc", "Returns a groupitem selecttype.

Returns
-------
None
") StepAP214_GroupItem;
		 StepAP214_GroupItem();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a groupitem kind entity that is : 1 -> geometricrepresentationitem 2 -> grouprelationship 3 -> mappeditem 4 -> productdefinition 5 -> productdefinitionformation 6 -> propertydefinitionrepresentation 7 -> representation 8 -> representationitem 9 -> representationrelationshipwithtransformation 10 -> shapeaspect 11 -> shapeaspectrelationship 12 -> shaperepresentationrelationship 13 -> styleditem 14 -> topologicalrepresentationitem 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** GeometricRepresentationItem ******************/
		%feature("compactdefaultargs") GeometricRepresentationItem;
		%feature("autodoc", "Returns value as a geometricrepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepGeom_GeometricRepresentationItem>
") GeometricRepresentationItem;
		virtual opencascade::handle<StepGeom_GeometricRepresentationItem> GeometricRepresentationItem();

		/****************** GroupRelationship ******************/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Returns value as a grouprelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupRelationship>
") GroupRelationship;
		virtual opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****************** MappedItem ******************/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "Returns value as a mappeditem (null if another type).

Returns
-------
opencascade::handle<StepRepr_MappedItem>
") MappedItem;
		virtual opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		virtual opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as a productdefinitionformation (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** PropertyDefinitionRepresentation ******************/
		%feature("compactdefaultargs") PropertyDefinitionRepresentation;
		%feature("autodoc", "Returns value as a propertydefinitionrepresentation (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinitionRepresentation>
") PropertyDefinitionRepresentation;
		virtual opencascade::handle<StepRepr_PropertyDefinitionRepresentation> PropertyDefinitionRepresentation();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		virtual opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationItem ******************/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		virtual opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** RepresentationRelationshipWithTransformation ******************/
		%feature("compactdefaultargs") RepresentationRelationshipWithTransformation;
		%feature("autodoc", "Returns value as a representationrelationshipwithtransformation (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation>
") RepresentationRelationshipWithTransformation;
		virtual opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> RepresentationRelationshipWithTransformation();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		virtual opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
") ShapeAspectRelationship;
		virtual opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****************** ShapeRepresentationRelationship ******************/
		%feature("compactdefaultargs") ShapeRepresentationRelationship;
		%feature("autodoc", "Returns value as a shaperepresentationrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeRepresentationRelationship>
") ShapeRepresentationRelationship;
		virtual opencascade::handle<StepRepr_ShapeRepresentationRelationship> ShapeRepresentationRelationship();

		/****************** StyledItem ******************/
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "Returns value as a styleditem (null if another type).

Returns
-------
opencascade::handle<StepVisual_StyledItem>
") StyledItem;
		virtual opencascade::handle<StepVisual_StyledItem> StyledItem();

		/****************** TopologicalRepresentationItem ******************/
		%feature("compactdefaultargs") TopologicalRepresentationItem;
		%feature("autodoc", "Returns value as a topologicalrepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
") TopologicalRepresentationItem;
		virtual opencascade::handle<StepShape_TopologicalRepresentationItem> TopologicalRepresentationItem();

};


%extend StepAP214_GroupItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepAP214_PresentedItemSelect *
**************************************/
class StepAP214_PresentedItemSelect : public StepData_SelectType {
	public:
		/****************** StepAP214_PresentedItemSelect ******************/
		%feature("compactdefaultargs") StepAP214_PresentedItemSelect;
		%feature("autodoc", "Returns a presenteditemselect selecttype.

Returns
-------
None
") StepAP214_PresentedItemSelect;
		 StepAP214_PresentedItemSelect();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a presenteditemselect kind entity that is : 1 -> productdefinition, 2 -> productdefinitionrelationship, 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as a productdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

};


%extend StepAP214_PresentedItemSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepAP214_Protocol *
***************************/
class StepAP214_Protocol : public StepData_Protocol {
	public:
		/****************** StepAP214_Protocol ******************/
		%feature("compactdefaultargs") StepAP214_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_Protocol;
		 StepAP214_Protocol();

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Returns count of protocol used as resources (level one).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given its rank (between 1 and nbresources).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** SchemaName ******************/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") SchemaName;
		virtual const char * SchemaName();

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number for each of the stepap214 entities.

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


%make_alias(StepAP214_Protocol)

%extend StepAP214_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepAP214_RepItemGroup *
*******************************/
class StepAP214_RepItemGroup : public StepBasic_Group {
	public:
		/****************** StepAP214_RepItemGroup ******************/
		%feature("compactdefaultargs") StepAP214_RepItemGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_RepItemGroup;
		 StepAP214_RepItemGroup();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aGroup_Name: TCollection_HAsciiString
hasGroup_Description: bool
aGroup_Description: TCollection_HAsciiString
aRepresentationItem_Name: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGroup_Name, const Standard_Boolean hasGroup_Description, const opencascade::handle<TCollection_HAsciiString> & aGroup_Description, const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name);

		/****************** RepresentationItem ******************/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns data for supertype representationitem.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** SetRepresentationItem ******************/
		%feature("compactdefaultargs") SetRepresentationItem;
		%feature("autodoc", "Set data for supertype representationitem.

Parameters
----------
RepresentationItem: StepRepr_RepresentationItem

Returns
-------
None
") SetRepresentationItem;
		void SetRepresentationItem(const opencascade::handle<StepRepr_RepresentationItem> & RepresentationItem);

};


%make_alias(StepAP214_RepItemGroup)

%extend StepAP214_RepItemGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepAP214_AutoDesignOrganizationItem *
*********************************************/
class StepAP214_AutoDesignOrganizationItem : public StepAP214_AutoDesignGeneralOrgItem {
	public:
		/****************** StepAP214_AutoDesignOrganizationItem ******************/
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_AutoDesignOrganizationItem;
		 StepAP214_AutoDesignOrganizationItem();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Document ******************/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") Document;
		opencascade::handle<StepBasic_Document> Document();

		/****************** PhysicallyModeledProductDefinition ******************/
		%feature("compactdefaultargs") PhysicallyModeledProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PhysicallyModeledProductDefinition>
") PhysicallyModeledProductDefinition;
		opencascade::handle<StepBasic_PhysicallyModeledProductDefinition> PhysicallyModeledProductDefinition();

};


%extend StepAP214_AutoDesignOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepAP214_DateAndTimeItem *
**********************************/
class StepAP214_DateAndTimeItem : public StepAP214_ApprovalItem {
	public:
		/****************** StepAP214_DateAndTimeItem ******************/
		%feature("compactdefaultargs") StepAP214_DateAndTimeItem;
		%feature("autodoc", "Returns a dateandtimeitem selecttype.

Returns
-------
None
") StepAP214_DateAndTimeItem;
		 StepAP214_DateAndTimeItem();

		/****************** AppliedOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as a applieddateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** ApprovalPersonOrganization ******************/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a dateandtimeitem kind entity that is : 1 -> approvalpersonorganization 2 -> applieddateandpersonassignment 3 -> appliedorganizationassignment 4 -> assemblycomponentusagesubstitute 5 -> documentfile 6 -> effectivity 7 -> materialdesignation 8 -> mechanicaldesigngeometricpresentationrepresentation 9 -> presentationarea 10 -> product 11 -> productdefinition 12 -> productdefinitionformation 13 -> productdefinitionrelationship 14 -> propertydefinition 15 -> shaperepresentation 16 -> securityclassification 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

};


%extend StepAP214_DateAndTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepAP214_DateItem *
***************************/
class StepAP214_DateItem : public StepAP214_ApprovalItem {
	public:
		/****************** StepAP214_DateItem ******************/
		%feature("compactdefaultargs") StepAP214_DateItem;
		%feature("autodoc", "Returns a dateitem selecttype.

Returns
-------
None
") StepAP214_DateItem;
		 StepAP214_DateItem();

		/****************** AppliedOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as a applieddateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** ApprovalPersonOrganization ******************/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a dateitem kind entity that is : 1 -> approvalpersonorganization 2 -> applieddateandpersonassignment 3 -> appliedorganizationassignment 4 -> assemblycomponentusagesubstitute 5 -> documentfile 6 -> effectivity 7 -> materialdesignation 8 -> mechanicaldesigngeometricpresentationrepresentation 9 -> presentationarea 10 -> product 11 -> productdefinition 12 -> productdefinitionformation 13 -> productdefinitionrelationship 14 -> propertydefinition 15 -> shaperepresentation 16 -> appliedsecurityclassificationassignment 17 -> document 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

};


%extend StepAP214_DateItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepAP214_ExternallyDefinedClass *
*****************************************/
class StepAP214_ExternallyDefinedClass : public StepAP214_Class {
	public:
		/****************** StepAP214_ExternallyDefinedClass ******************/
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedClass;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_ExternallyDefinedClass;
		 StepAP214_ExternallyDefinedClass();

		/****************** ExternallyDefinedItem ******************/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Returns data for supertype externallydefineditem.

Returns
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aGroup_Name: TCollection_HAsciiString
hasGroup_Description: bool
aGroup_Description: TCollection_HAsciiString
aExternallyDefinedItem_ItemId: StepBasic_SourceItem
aExternallyDefinedItem_Source: StepBasic_ExternalSource

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGroup_Name, const Standard_Boolean hasGroup_Description, const opencascade::handle<TCollection_HAsciiString> & aGroup_Description, const StepBasic_SourceItem & aExternallyDefinedItem_ItemId, const opencascade::handle<StepBasic_ExternalSource> & aExternallyDefinedItem_Source);

		/****************** SetExternallyDefinedItem ******************/
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "Set data for supertype externallydefineditem.

Parameters
----------
ExternallyDefinedItem: StepBasic_ExternallyDefinedItem

Returns
-------
None
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem(const opencascade::handle<StepBasic_ExternallyDefinedItem> & ExternallyDefinedItem);

};


%make_alias(StepAP214_ExternallyDefinedClass)

%extend StepAP214_ExternallyDefinedClass {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepAP214_OrganizationItem *
***********************************/
class StepAP214_OrganizationItem : public StepAP214_ApprovalItem {
	public:
		/****************** StepAP214_OrganizationItem ******************/
		%feature("compactdefaultargs") StepAP214_OrganizationItem;
		%feature("autodoc", "Returns a organizationitem selecttype.

Returns
-------
None
") StepAP214_OrganizationItem;
		 StepAP214_OrganizationItem();

		/****************** AppliedOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** Approval ******************/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as a approval (null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a organizationitem kind entity that is :.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

};


%extend StepAP214_OrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepAP214_PersonAndOrganizationItem *
********************************************/
class StepAP214_PersonAndOrganizationItem : public StepAP214_ApprovalItem {
	public:
		/****************** StepAP214_PersonAndOrganizationItem ******************/
		%feature("compactdefaultargs") StepAP214_PersonAndOrganizationItem;
		%feature("autodoc", "Returns a personandorganizationitem selecttype.

Returns
-------
None
") StepAP214_PersonAndOrganizationItem;
		 StepAP214_PersonAndOrganizationItem();

		/****************** AppliedOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** Approval ******************/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as a approval (null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a apersonandorganizationitem kind entity that is : 1 -> appliedorganizationassignment 2 -> assemblycomponentusagesubstitute 3 -> documentfile 4 -> materialdesignation 5 -> mechanicaldesigngeometricpresentationrepresentation 6 -> presentationarea 7 -> product 8 -> productdefinition 9 -> productdefinitionformation 10 -> productdefinitionrelationship 11 -> propertydefinition 12 -> shaperepresentation 13 -> securityclassification 14 -> appliedsecurityclassificationassignment 15 -> approval 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

};


%extend StepAP214_PersonAndOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepAP214_SecurityClassificationItem *
*********************************************/
class StepAP214_SecurityClassificationItem : public StepAP214_ApprovalItem {
	public:
		/****************** StepAP214_SecurityClassificationItem ******************/
		%feature("compactdefaultargs") StepAP214_SecurityClassificationItem;
		%feature("autodoc", "Returns a securityclassificationitem selecttype.

Returns
-------
None
") StepAP214_SecurityClassificationItem;
		 StepAP214_SecurityClassificationItem();

		/****************** Action ******************/
		%feature("compactdefaultargs") Action;
		%feature("autodoc", "Returns value as a action (null if another type).

Returns
-------
opencascade::handle<StepBasic_Action>
") Action;
		virtual opencascade::handle<StepBasic_Action> Action();

		/****************** AssemblyComponentUsage ******************/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "Returns value as a assemblycomponentusage (null if another type).

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>
") AssemblyComponentUsage;
		virtual opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a securityclassificationitem kind entity that is : 1 -> action 2 -> assemblycomponentusage 3 -> assemblycomponentusagesubstitute 4 -> configurationdesign 5 -> configurationeffectivity 6 -> document 7 -> documentfile 8 -> draughtingmodel 9 -> generalproperty 10 -> makefromusageoption 11 -> materialdesignation 12 -> mechanicaldesigngeometricpresentationrepresentation 13 -> presentationarea 14 -> product 15 -> productconcept 16 -> productdefinition 17 -> productdefinitionformation 18 -> productdefinitionrelationship 19 -> productdefinitionusage 20 -> propertydefinition 21 -> shaperepresentation 22 -> versionedactionrequest 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ConfigurationDesign ******************/
		%feature("compactdefaultargs") ConfigurationDesign;
		%feature("autodoc", "Returns value as a configurationdesign (null if another type).

Returns
-------
opencascade::handle<StepRepr_ConfigurationDesign>
") ConfigurationDesign;
		virtual opencascade::handle<StepRepr_ConfigurationDesign> ConfigurationDesign();

		/****************** ConfigurationEffectivity ******************/
		%feature("compactdefaultargs") ConfigurationEffectivity;
		%feature("autodoc", "Returns value as a configurationeffectivity (null if another type).

Returns
-------
opencascade::handle<StepRepr_ConfigurationEffectivity>
") ConfigurationEffectivity;
		virtual opencascade::handle<StepRepr_ConfigurationEffectivity> ConfigurationEffectivity();

		/****************** DraughtingModel ******************/
		%feature("compactdefaultargs") DraughtingModel;
		%feature("autodoc", "Returns value as a draughtingmodel (null if another type).

Returns
-------
opencascade::handle<StepVisual_DraughtingModel>
") DraughtingModel;
		virtual opencascade::handle<StepVisual_DraughtingModel> DraughtingModel();

		/****************** GeneralProperty ******************/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Returns value as a generalproperty (null if another type).

Returns
-------
opencascade::handle<StepBasic_GeneralProperty>
") GeneralProperty;
		virtual opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****************** MakeFromUsageOption ******************/
		%feature("compactdefaultargs") MakeFromUsageOption;
		%feature("autodoc", "Returns value as a makefromusageoption (null if another type).

Returns
-------
opencascade::handle<StepRepr_MakeFromUsageOption>
") MakeFromUsageOption;
		virtual opencascade::handle<StepRepr_MakeFromUsageOption> MakeFromUsageOption();

		/****************** ProductConcept ******************/
		%feature("compactdefaultargs") ProductConcept;
		%feature("autodoc", "Returns value as a productconcept (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductConcept>
") ProductConcept;
		virtual opencascade::handle<StepRepr_ProductConcept> ProductConcept();

		/****************** ProductDefinitionUsage ******************/
		%feature("compactdefaultargs") ProductDefinitionUsage;
		%feature("autodoc", "Returns value as a productdefinitionusage (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionUsage>
") ProductDefinitionUsage;
		virtual opencascade::handle<StepRepr_ProductDefinitionUsage> ProductDefinitionUsage();

		/****************** VersionedActionRequest ******************/
		%feature("compactdefaultargs") VersionedActionRequest;
		%feature("autodoc", "Returns value as a versionedactionrequest (null if another type).

Returns
-------
opencascade::handle<StepBasic_VersionedActionRequest>
") VersionedActionRequest;
		virtual opencascade::handle<StepBasic_VersionedActionRequest> VersionedActionRequest();

};


%extend StepAP214_SecurityClassificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class StepAP214_HArray1OfDateItem : public  StepAP214_Array1OfDateItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfDateItem::value_type& theValue);
    StepAP214_HArray1OfDateItem(const  StepAP214_Array1OfDateItem& theOther);
    const  StepAP214_Array1OfDateItem& Array1();
     StepAP214_Array1OfDateItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateItem)


class StepAP214_HArray1OfSecurityClassificationItem : public  StepAP214_Array1OfSecurityClassificationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfSecurityClassificationItem::value_type& theValue);
    StepAP214_HArray1OfSecurityClassificationItem(const  StepAP214_Array1OfSecurityClassificationItem& theOther);
    const  StepAP214_Array1OfSecurityClassificationItem& Array1();
     StepAP214_Array1OfSecurityClassificationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfSecurityClassificationItem)


class StepAP214_HArray1OfExternalIdentificationItem : public  StepAP214_Array1OfExternalIdentificationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfExternalIdentificationItem::value_type& theValue);
    StepAP214_HArray1OfExternalIdentificationItem(const  StepAP214_Array1OfExternalIdentificationItem& theOther);
    const  StepAP214_Array1OfExternalIdentificationItem& Array1();
     StepAP214_Array1OfExternalIdentificationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfExternalIdentificationItem)


class StepAP214_HArray1OfAutoDesignDatedItem : public  StepAP214_Array1OfAutoDesignDatedItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignDatedItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDatedItem(const  StepAP214_Array1OfAutoDesignDatedItem& theOther);
    const  StepAP214_Array1OfAutoDesignDatedItem& Array1();
     StepAP214_Array1OfAutoDesignDatedItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDatedItem)


class StepAP214_HArray1OfPersonAndOrganizationItem : public  StepAP214_Array1OfPersonAndOrganizationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfPersonAndOrganizationItem::value_type& theValue);
    StepAP214_HArray1OfPersonAndOrganizationItem(const  StepAP214_Array1OfPersonAndOrganizationItem& theOther);
    const  StepAP214_Array1OfPersonAndOrganizationItem& Array1();
     StepAP214_Array1OfPersonAndOrganizationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPersonAndOrganizationItem)


class StepAP214_HArray1OfAutoDesignDateAndPersonItem : public  StepAP214_Array1OfAutoDesignDateAndPersonItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignDateAndPersonItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const  StepAP214_Array1OfAutoDesignDateAndPersonItem& theOther);
    const  StepAP214_Array1OfAutoDesignDateAndPersonItem& Array1();
     StepAP214_Array1OfAutoDesignDateAndPersonItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndPersonItem)


class StepAP214_HArray1OfAutoDesignGroupedItem : public  StepAP214_Array1OfAutoDesignGroupedItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignGroupedItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGroupedItem(const  StepAP214_Array1OfAutoDesignGroupedItem& theOther);
    const  StepAP214_Array1OfAutoDesignGroupedItem& Array1();
     StepAP214_Array1OfAutoDesignGroupedItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGroupedItem)


class StepAP214_HArray1OfPresentedItemSelect : public  StepAP214_Array1OfPresentedItemSelect, public Standard_Transient {
  public:
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfPresentedItemSelect::value_type& theValue);
    StepAP214_HArray1OfPresentedItemSelect(const  StepAP214_Array1OfPresentedItemSelect& theOther);
    const  StepAP214_Array1OfPresentedItemSelect& Array1();
     StepAP214_Array1OfPresentedItemSelect& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPresentedItemSelect)


class StepAP214_HArray1OfAutoDesignGeneralOrgItem : public  StepAP214_Array1OfAutoDesignGeneralOrgItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignGeneralOrgItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const  StepAP214_Array1OfAutoDesignGeneralOrgItem& theOther);
    const  StepAP214_Array1OfAutoDesignGeneralOrgItem& Array1();
     StepAP214_Array1OfAutoDesignGeneralOrgItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGeneralOrgItem)


class StepAP214_HArray1OfAutoDesignDateAndTimeItem : public  StepAP214_Array1OfAutoDesignDateAndTimeItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignDateAndTimeItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const  StepAP214_Array1OfAutoDesignDateAndTimeItem& theOther);
    const  StepAP214_Array1OfAutoDesignDateAndTimeItem& Array1();
     StepAP214_Array1OfAutoDesignDateAndTimeItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndTimeItem)


class StepAP214_HArray1OfAutoDesignPresentedItemSelect : public  StepAP214_Array1OfAutoDesignPresentedItemSelect, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignPresentedItemSelect::value_type& theValue);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const  StepAP214_Array1OfAutoDesignPresentedItemSelect& theOther);
    const  StepAP214_Array1OfAutoDesignPresentedItemSelect& Array1();
     StepAP214_Array1OfAutoDesignPresentedItemSelect& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignPresentedItemSelect)


class StepAP214_HArray1OfAutoDesignReferencingItem : public  StepAP214_Array1OfAutoDesignReferencingItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfAutoDesignReferencingItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignReferencingItem(const  StepAP214_Array1OfAutoDesignReferencingItem& theOther);
    const  StepAP214_Array1OfAutoDesignReferencingItem& Array1();
     StepAP214_Array1OfAutoDesignReferencingItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignReferencingItem)


class StepAP214_HArray1OfDocumentReferenceItem : public  StepAP214_Array1OfDocumentReferenceItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfDocumentReferenceItem::value_type& theValue);
    StepAP214_HArray1OfDocumentReferenceItem(const  StepAP214_Array1OfDocumentReferenceItem& theOther);
    const  StepAP214_Array1OfDocumentReferenceItem& Array1();
     StepAP214_Array1OfDocumentReferenceItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDocumentReferenceItem)


class StepAP214_HArray1OfOrganizationItem : public  StepAP214_Array1OfOrganizationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfOrganizationItem::value_type& theValue);
    StepAP214_HArray1OfOrganizationItem(const  StepAP214_Array1OfOrganizationItem& theOther);
    const  StepAP214_Array1OfOrganizationItem& Array1();
     StepAP214_Array1OfOrganizationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfOrganizationItem)


class StepAP214_HArray1OfApprovalItem : public  StepAP214_Array1OfApprovalItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfApprovalItem::value_type& theValue);
    StepAP214_HArray1OfApprovalItem(const  StepAP214_Array1OfApprovalItem& theOther);
    const  StepAP214_Array1OfApprovalItem& Array1();
     StepAP214_Array1OfApprovalItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfApprovalItem)


class StepAP214_HArray1OfGroupItem : public  StepAP214_Array1OfGroupItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfGroupItem::value_type& theValue);
    StepAP214_HArray1OfGroupItem(const  StepAP214_Array1OfGroupItem& theOther);
    const  StepAP214_Array1OfGroupItem& Array1();
     StepAP214_Array1OfGroupItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfGroupItem)


class StepAP214_HArray1OfDateAndTimeItem : public  StepAP214_Array1OfDateAndTimeItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP214_Array1OfDateAndTimeItem::value_type& theValue);
    StepAP214_HArray1OfDateAndTimeItem(const  StepAP214_Array1OfDateAndTimeItem& theOther);
    const  StepAP214_Array1OfDateAndTimeItem& Array1();
     StepAP214_Array1OfDateAndTimeItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateAndTimeItem)


/* harray2 classes */
/* hsequence classes */
