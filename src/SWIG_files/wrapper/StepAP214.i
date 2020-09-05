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
		/**** md5 signature: cb02aaf17fb7b280f1ecef6f4a97c6c6 ****/
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
		/**** md5 signature: 387d08f97a7bca8e01a6f64d6950cd64 ****/
		%feature("compactdefaultargs") StepAP214_AppliedApprovalAssignment;
		%feature("autodoc", "Returns a appliedapprovalassignment.

Returns
-------
None
") StepAP214_AppliedApprovalAssignment;
		 StepAP214_AppliedApprovalAssignment();

		/****************** Init ******************/
		/**** md5 signature: 88597915fbf1a1fa55bbb448e25e09e8 ****/
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
		/**** md5 signature: d340c04581b9c2d3ecc9018ca866fb93 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfApprovalItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfApprovalItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 06ae2896a63a9278a56296bacfa4d14c ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 1d57362149cb7b5bfc34f3cf653daf01 ****/
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
		/**** md5 signature: 678ef72942a26f1ee72d1e7ff8b3d392 ****/
		%feature("compactdefaultargs") StepAP214_AppliedDateAndTimeAssignment;
		%feature("autodoc", "Returns a applieddateandtimeassignment.

Returns
-------
None
") StepAP214_AppliedDateAndTimeAssignment;
		 StepAP214_AppliedDateAndTimeAssignment();

		/****************** Init ******************/
		/**** md5 signature: 55046e67dc0cdc8b0f9a39c265a1df1c ****/
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
		/**** md5 signature: 006618cfe11bdf9541f35a09af7bf73e ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfDateAndTimeItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfDateAndTimeItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 3828d42d7449cc0dc56d8ba2b81b0adc ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 3c3cfe28e7724935d6c495ecc6f9ddbd ****/
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
		/**** md5 signature: 0a525f7fb3135f93331afdf7d013fdb3 ****/
		%feature("compactdefaultargs") StepAP214_AppliedDateAssignment;
		%feature("autodoc", "Returns a applieddateassignment.

Returns
-------
None
") StepAP214_AppliedDateAssignment;
		 StepAP214_AppliedDateAssignment();

		/****************** Init ******************/
		/**** md5 signature: 1d00b99db152f8211b9244184b744781 ****/
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
		/**** md5 signature: d13246e1fa22d89ed8709ddbf2bdb068 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfDateItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfDateItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: f009df5fca2680a41c8d1bef007daae9 ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: d2523e396e30209431bd9d024e99e1b5 ****/
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
		/**** md5 signature: 27e864797090c39fbdd2f1f5508e8c8c ****/
		%feature("compactdefaultargs") StepAP214_AppliedDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_AppliedDocumentReference;
		 StepAP214_AppliedDocumentReference();

		/****************** Init ******************/
		/**** md5 signature: a690d3bd255fc495fc2263a2e0f73f4c ****/
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
		/**** md5 signature: e0c22bead730ffd60cf3e0ae592bb266 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfDocumentReferenceItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfDocumentReferenceItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: f279a131c962bba912698bbade21a58e ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 4c13b191337b01ed0709dae76266c2aa ****/
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
		/**** md5 signature: be0a389896f320f5630f0d4a82c60687 ****/
		%feature("compactdefaultargs") StepAP214_AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_AppliedExternalIdentificationAssignment;
		 StepAP214_AppliedExternalIdentificationAssignment();

		/****************** Init ******************/
		/**** md5 signature: edc26d4f1806c5d6188cdc1b4e8498b2 ****/
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
		/**** md5 signature: ad51ba008f4d0eff77f584168f7e368f ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns field items.

Returns
-------
opencascade::handle<StepAP214_HArray1OfExternalIdentificationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfExternalIdentificationItem> Items();

		/****************** SetItems ******************/
		/**** md5 signature: 004ba9cd965705af3031288f4cbb4642 ****/
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
		/**** md5 signature: 10ad6e7e7c90af9104e79de30abc4d40 ****/
		%feature("compactdefaultargs") StepAP214_AppliedGroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_AppliedGroupAssignment;
		 StepAP214_AppliedGroupAssignment();

		/****************** Init ******************/
		/**** md5 signature: c7c95e685db5c073564d39c774c52b21 ****/
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
		/**** md5 signature: 67259af8ec60367ec9c32900f996e92c ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns field items.

Returns
-------
opencascade::handle<StepAP214_HArray1OfGroupItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfGroupItem> Items();

		/****************** SetItems ******************/
		/**** md5 signature: d3c92fc4bde800f68b7a3815cbeaf210 ****/
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
		/**** md5 signature: 3651e244824442328ae5941af66addc9 ****/
		%feature("compactdefaultargs") StepAP214_AppliedOrganizationAssignment;
		%feature("autodoc", "Returns a appliedorganizationassignment.

Returns
-------
None
") StepAP214_AppliedOrganizationAssignment;
		 StepAP214_AppliedOrganizationAssignment();

		/****************** Init ******************/
		/**** md5 signature: c71d26c55cdfb4f017316203b85e0ec1 ****/
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
		/**** md5 signature: 672d9470864139dd2365151b8f099b8a ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfOrganizationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfOrganizationItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: c133fa3c7e9ec70c774fb8fca86826e9 ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 5229559edc52dfda69b27e73226fb5ef ****/
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
		/**** md5 signature: c6a0e8ff5a9f12a6706a00f471d2dacb ****/
		%feature("compactdefaultargs") StepAP214_AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns a autodesigndateandpersonassignment.

Returns
-------
None
") StepAP214_AppliedPersonAndOrganizationAssignment;
		 StepAP214_AppliedPersonAndOrganizationAssignment();

		/****************** Init ******************/
		/**** md5 signature: 909f4604ad841bc1acad83aed112eb7e ****/
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
		/**** md5 signature: 77699fca03376f08762146e3f67a7885 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfPersonAndOrganizationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfPersonAndOrganizationItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 3afa622df05b4fbe301c85b87e0ea8fd ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 46c0fced27b98e30028d5da250a95522 ****/
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
		/**** md5 signature: f8153fb852e21f683a8f18324fe4242e ****/
		%feature("compactdefaultargs") StepAP214_AppliedPresentedItem;
		%feature("autodoc", "Returns a autodesignpresenteditem.

Returns
-------
None
") StepAP214_AppliedPresentedItem;
		 StepAP214_AppliedPresentedItem();

		/****************** Init ******************/
		/**** md5 signature: 4738e0ecbdf1ef67641a79e8cc3d330b ****/
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
		/**** md5 signature: 921ae318f0398e4346d01968539614fc ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfPresentedItemSelect>
") Items;
		opencascade::handle<StepAP214_HArray1OfPresentedItemSelect> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 804f715a81f300952530f71514b0d1e0 ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 62e579143b3351f1d97f33911e06fa99 ****/
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
		/**** md5 signature: d96a4ccf82855776ce1db8f80bdccdf0 ****/
		%feature("compactdefaultargs") StepAP214_AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns a appliedsecurityclassificationassignment.

Returns
-------
None
") StepAP214_AppliedSecurityClassificationAssignment;
		 StepAP214_AppliedSecurityClassificationAssignment();

		/****************** Init ******************/
		/**** md5 signature: 96a556bfde340eba5faae2fb64e4320b ****/
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
		/**** md5 signature: ff7a7603b64370be6476d50afedc3b4f ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfSecurityClassificationItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfSecurityClassificationItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 2527bebbc7644972e50c4be5a5bb75d4 ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 37828de9e6c82a96ef952d785e5071d9 ****/
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
		/**** md5 signature: 48bbf3c28b6a2e57759b28e4c404019b ****/
		%feature("compactdefaultargs") StepAP214_ApprovalItem;
		%feature("autodoc", "Returns a approvalitem selecttype.

Returns
-------
None
") StepAP214_ApprovalItem;
		 StepAP214_ApprovalItem();

		/****************** AssemblyComponentUsageSubstitute ******************/
		/**** md5 signature: b91da6c8966920c354d789c8c32413b4 ****/
		%feature("compactdefaultargs") AssemblyComponentUsageSubstitute;
		%feature("autodoc", "Returns value as a assemblycomponentusagesubstitute (null if another type).

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute>
") AssemblyComponentUsageSubstitute;
		virtual opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> AssemblyComponentUsageSubstitute();

		/****************** CaseNum ******************/
		/**** md5 signature: 50869928f151d2c924215b1661d4fc92 ****/
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
		/**** md5 signature: fb35f69c958d26e1d529f63318b20dca ****/
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "Returns value as a configurationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_ConfigurationItem>
") ConfigurationItem;
		virtual opencascade::handle<StepRepr_ConfigurationItem> ConfigurationItem();

		/****************** Date ******************/
		/**** md5 signature: 89ee3f386e812721943f0a13bd29296a ****/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Returns value as a date (null if another type).

Returns
-------
opencascade::handle<StepBasic_Date>
") Date;
		virtual opencascade::handle<StepBasic_Date> Date();

		/****************** Document ******************/
		/**** md5 signature: 80c66c540499ddaca711967e7b9a5473 ****/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Returns value as a document (null if another type).

Returns
-------
opencascade::handle<StepBasic_Document>
") Document;
		virtual opencascade::handle<StepBasic_Document> Document();

		/****************** DocumentFile ******************/
		/**** md5 signature: 87c956071ba81d24e588b8c45e2844da ****/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Returns value as a documentfile (null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentFile>
") DocumentFile;
		virtual opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****************** Effectivity ******************/
		/**** md5 signature: d789edf656ded83e5a00f3b78fc65bb3 ****/
		%feature("compactdefaultargs") Effectivity;
		%feature("autodoc", "Returns value as a effectivity (null if another type).

Returns
-------
opencascade::handle<StepBasic_Effectivity>
") Effectivity;
		virtual opencascade::handle<StepBasic_Effectivity> Effectivity();

		/****************** Group ******************/
		/**** md5 signature: 450c647ed5ee945e509721f4cac7b4d4 ****/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Returns value as a group (null if another type).

Returns
-------
opencascade::handle<StepBasic_Group>
") Group;
		virtual opencascade::handle<StepBasic_Group> Group();

		/****************** GroupRelationship ******************/
		/**** md5 signature: e96924329e7182112336a8edc68173d8 ****/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Returns value as a grouprelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupRelationship>
") GroupRelationship;
		virtual opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****************** MaterialDesignation ******************/
		/**** md5 signature: 6e30acaff4de27c4b231a9e5d646b478 ****/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "Returns value as a materialdesignation (null if another type).

Returns
-------
opencascade::handle<StepRepr_MaterialDesignation>
") MaterialDesignation;
		virtual opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****************** MechanicalDesignGeometricPresentationRepresentation ******************/
		/**** md5 signature: d3c9337b79febcc3a7f4653a7f372f73 ****/
		%feature("compactdefaultargs") MechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "Returns value as a mechanicaldesigngeometricpresentationrepresentation (null if another type).

Returns
-------
opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation>
") MechanicalDesignGeometricPresentationRepresentation;
		virtual opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> MechanicalDesignGeometricPresentationRepresentation();

		/****************** PresentationArea ******************/
		/**** md5 signature: 30b799f1543eef9325725dd5c80af64a ****/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Returns value as a presentationarea (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationArea>
") PresentationArea;
		virtual opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****************** Product ******************/
		/**** md5 signature: 1f27bc54cc353af90f03ae9eca5730be ****/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Returns value as a product (null if another type).

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		virtual opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		/**** md5 signature: c87a2e2c18abbb8dba7578354cb60082 ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		virtual opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		/**** md5 signature: 507fa3da9e81b3c4e23dcc57a6272df1 ****/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as a productdefinitionformation (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** ProductDefinitionFormationRelationship ******************/
		/**** md5 signature: 2597252cdc3a366a290516c767740bd1 ****/
		%feature("compactdefaultargs") ProductDefinitionFormationRelationship;
		%feature("autodoc", "Returns value as a productdefinitionformationrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormationRelationship>
") ProductDefinitionFormationRelationship;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> ProductDefinitionFormationRelationship();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 5291be95e802b30e3a6aeb2e7fc274af ****/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as aproductdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		virtual opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		/**** md5 signature: bf7258abc2cc1f5b1017e077e8f2e158 ****/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		virtual opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		/**** md5 signature: 0e7149a093c46006c551ea78ef408983 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		virtual opencascade::handle<StepRepr_Representation> Representation();

		/****************** SecurityClassification ******************/
		/**** md5 signature: 0ec28971d3039fc7d493d464f6029061 ****/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Returns value as a securityclassification (null if another type).

Returns
-------
opencascade::handle<StepBasic_SecurityClassification>
") SecurityClassification;
		virtual opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****************** ShapeAspectRelationship ******************/
		/**** md5 signature: 0856c8eef765cafdadc90beca549d0b3 ****/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
") ShapeAspectRelationship;
		virtual opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****************** ShapeRepresentation ******************/
		/**** md5 signature: b24886d3686815afb32453db060ce3bf ****/
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
		/**** md5 signature: 705b3bf78fbbb68f0b14fd7d5dcc728e ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "Returns a autodesignactualdateandtimeassignment.

Returns
-------
None
") StepAP214_AutoDesignActualDateAndTimeAssignment;
		 StepAP214_AutoDesignActualDateAndTimeAssignment();

		/****************** Init ******************/
		/**** md5 signature: c9219995f41330b21a404f293fbb0386 ****/
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
		/**** md5 signature: 9c8bed3ae8f82620b21bfc347e80f9e7 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: f4ad99809296f52a6d83c77617ee99dc ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 47f812cdb000ba0d5a8e2b4c573490c6 ****/
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
		/**** md5 signature: 52ddb197076671c4e83861646d9b2683 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAssignment;
		%feature("autodoc", "Returns a autodesignactualdateassignment.

Returns
-------
None
") StepAP214_AutoDesignActualDateAssignment;
		 StepAP214_AutoDesignActualDateAssignment();

		/****************** Init ******************/
		/**** md5 signature: dadfc4994fca45189bdb41ba40331693 ****/
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
		/**** md5 signature: eaec1ea87631e0cf462295053260933c ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: e9a3428ef97e2e1f1f810cc66f1f80fe ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: ab0089f1307e27b4665cd4070a1e5339 ****/
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
		/**** md5 signature: 33a4611a35eabe258b916e0a58a57dcb ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignApprovalAssignment;
		%feature("autodoc", "Returns a autodesignapprovalassignment.

Returns
-------
None
") StepAP214_AutoDesignApprovalAssignment;
		 StepAP214_AutoDesignApprovalAssignment();

		/****************** Init ******************/
		/**** md5 signature: 80cb344bc02c43490094ca14e4fe6ec8 ****/
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
		/**** md5 signature: aecfa0a2fd06e21514370c83d493b21d ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 2485886287b289109abca2e3522f58be ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 3632c10b0fa034af97afcf20ab179385 ****/
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
		/**** md5 signature: cb865d9256597651dddee9bb17d790bc ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Returns a autodesigndateandpersonassignment.

Returns
-------
None
") StepAP214_AutoDesignDateAndPersonAssignment;
		 StepAP214_AutoDesignDateAndPersonAssignment();

		/****************** Init ******************/
		/**** md5 signature: d403e1842dc93b0219a3b048343bc6d3 ****/
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
		/**** md5 signature: 0b44268e55a8f4f0d0e71e2eb342992a ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndPersonItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndPersonItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: f415890f382869d14c84a9fbf0f3273a ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 390f542fd9e88a17329b4445fc0c5100 ****/
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
		/**** md5 signature: 0a007aa2ed2c625baf51df4f38237fc3 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonItem;
		%feature("autodoc", "Returns a autodesigndateandpersonitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignDateAndPersonItem;
		 StepAP214_AutoDesignDateAndPersonItem();

		/****************** AutoDesignDocumentReference ******************/
		/**** md5 signature: af73bba2bf72bbf6213d0ecd6c9b22ad ****/
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_AutoDesignDocumentReference>
") AutoDesignDocumentReference;
		opencascade::handle<StepAP214_AutoDesignDocumentReference> AutoDesignDocumentReference();

		/****************** AutoDesignOrganizationAssignment ******************/
		/**** md5 signature: 4ec7d06adb31aa4df0b32cd2cd099cbd ****/
		%feature("compactdefaultargs") AutoDesignOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_AutoDesignOrganizationAssignment>
") AutoDesignOrganizationAssignment;
		opencascade::handle<StepAP214_AutoDesignOrganizationAssignment> AutoDesignOrganizationAssignment();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 1ab41939bb532a4d66438d45db18a668 ****/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****************** Product ******************/
		/**** md5 signature: e8c7e89afa6b95e852c44498904e61e4 ****/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		/**** md5 signature: 549b153d5236bb5dda717eed81e28565 ****/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 8884670d0de6dcec838b821592ead2d2 ****/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** ProductDefinitionWithAssociatedDocuments ******************/
		/**** md5 signature: 71eccc7fba12ed1a0472e41be6b337f4 ****/
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments>
") ProductDefinitionWithAssociatedDocuments;
		opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> ProductDefinitionWithAssociatedDocuments();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
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
		/**** md5 signature: 533c0543a89d7c681622120c5a47763f ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndTimeItem;
		%feature("autodoc", "Returns a autodesigndateandtimeitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignDateAndTimeItem;
		 StepAP214_AutoDesignDateAndTimeItem();

		/****************** ApprovalPersonOrganization ******************/
		/**** md5 signature: af795dc9d70028f3b512bd493ca8a169 ****/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** AutoDesignDateAndPersonAssignment ******************/
		/**** md5 signature: e78caeb846efacf7799186adc28cedc2 ****/
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Returns value as a autodesigndateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment>
") AutoDesignDateAndPersonAssignment;
		opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> AutoDesignDateAndPersonAssignment();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: f7c75ca0cc1884f366a5ab6b27ed0916 ****/
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
		/**** md5 signature: 81b06cf503b69a90c19b50668649a7ab ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignDatedItem;
		%feature("autodoc", "Returns a autodesigndateditem selecttype.

Returns
-------
None
") StepAP214_AutoDesignDatedItem;
		 StepAP214_AutoDesignDatedItem();

		/****************** ApprovalPersonOrganization ******************/
		/**** md5 signature: af795dc9d70028f3b512bd493ca8a169 ****/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** AutoDesignDateAndPersonAssignment ******************/
		/**** md5 signature: e78caeb846efacf7799186adc28cedc2 ****/
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Returns value as a autodesigndateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment>
") AutoDesignDateAndPersonAssignment;
		opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> AutoDesignDateAndPersonAssignment();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: f7c75ca0cc1884f366a5ab6b27ed0916 ****/
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
		/**** md5 signature: 3d6020f3baee2f42c3bd05b6cd47c7ae ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_AutoDesignDocumentReference;
		 StepAP214_AutoDesignDocumentReference();

		/****************** Init ******************/
		/**** md5 signature: 8b74b3a99fab3a4fd61b1ddfdee46410 ****/
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
		/**** md5 signature: 4a5ef2d4632b9b2b6060d021d866f573 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignReferencingItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignReferencingItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: a77baca990c5c66bc3f1c1caddbb5b85 ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 183c3a7a362b62218d774cc2f985225a ****/
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
		/**** md5 signature: 95eb7ebca7d2092830698a38ac57f893 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignGeneralOrgItem;
		%feature("autodoc", "Returns a autodesigngeneralorgitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignGeneralOrgItem;
		 StepAP214_AutoDesignGeneralOrgItem();

		/****************** AutoDesignDocumentReference ******************/
		/**** md5 signature: af73bba2bf72bbf6213d0ecd6c9b22ad ****/
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_AutoDesignDocumentReference>
") AutoDesignDocumentReference;
		opencascade::handle<StepAP214_AutoDesignDocumentReference> AutoDesignDocumentReference();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 1ab41939bb532a4d66438d45db18a668 ****/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****************** Product ******************/
		/**** md5 signature: e8c7e89afa6b95e852c44498904e61e4 ****/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Returns value as a product (null if another type).

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		/**** md5 signature: 549b153d5236bb5dda717eed81e28565 ****/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as a productdefinitionformation (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 8884670d0de6dcec838b821592ead2d2 ****/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as a productdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** ProductDefinitionWithAssociatedDocuments ******************/
		/**** md5 signature: 71eccc7fba12ed1a0472e41be6b337f4 ****/
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "Returns value as a productdefinitionwithassociateddocuments (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments>
") ProductDefinitionWithAssociatedDocuments;
		opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> ProductDefinitionWithAssociatedDocuments();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
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
		/**** md5 signature: 6319f23b6bfffc8912c7b0ae95d32fa4 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupAssignment;
		%feature("autodoc", "Returns a autodesigngroupassignment.

Returns
-------
None
") StepAP214_AutoDesignGroupAssignment;
		 StepAP214_AutoDesignGroupAssignment();

		/****************** Init ******************/
		/**** md5 signature: 435f9a66a5b9c680453c4eaeadf97ff6 ****/
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
		/**** md5 signature: c4d94e578c06be266932809c7c6bc9e4 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGroupedItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGroupedItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: e08a0a8efc6ec38948c7868055657afe ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: b2bea7d4889b43b636dde7f3e356f1c8 ****/
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
		/**** md5 signature: 50fc634f5b630d30a28397d05f5d9c8f ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupedItem;
		%feature("autodoc", "Returns a autodesigngroupeditem selecttype.

Returns
-------
None
") StepAP214_AutoDesignGroupedItem;
		 StepAP214_AutoDesignGroupedItem();

		/****************** AdvancedBrepShapeRepresentation ******************/
		/**** md5 signature: 1550c73ebd1493869c30f677488c3bce ****/
		%feature("compactdefaultargs") AdvancedBrepShapeRepresentation;
		%feature("autodoc", "Returns value as a advancedbrepshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_AdvancedBrepShapeRepresentation>
") AdvancedBrepShapeRepresentation;
		opencascade::handle<StepShape_AdvancedBrepShapeRepresentation> AdvancedBrepShapeRepresentation();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 4df917463134e0edfeebc58674424cbd ****/
		%feature("compactdefaultargs") CsgShapeRepresentation;
		%feature("autodoc", "Returns value as a csgshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_CsgShapeRepresentation>
") CsgShapeRepresentation;
		opencascade::handle<StepShape_CsgShapeRepresentation> CsgShapeRepresentation();

		/****************** FacetedBrepShapeRepresentation ******************/
		/**** md5 signature: 7d9e29fd7e11f01c8b5c95011f9525c2 ****/
		%feature("compactdefaultargs") FacetedBrepShapeRepresentation;
		%feature("autodoc", "Returns value as a facetedbrepshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_FacetedBrepShapeRepresentation>
") FacetedBrepShapeRepresentation;
		opencascade::handle<StepShape_FacetedBrepShapeRepresentation> FacetedBrepShapeRepresentation();

		/****************** GeometricallyBoundedSurfaceShapeRepresentation ******************/
		/**** md5 signature: be6bce576e35d304e94a40d8fbb82473 ****/
		%feature("compactdefaultargs") GeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "Returns value as a geometricallyboundedsurfaceshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation>
") GeometricallyBoundedSurfaceShapeRepresentation;
		opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation> GeometricallyBoundedSurfaceShapeRepresentation();

		/****************** GeometricallyBoundedWireframeShapeRepresentation ******************/
		/**** md5 signature: 7cfc6e8297615e8d757e2d58f0245a2e ****/
		%feature("compactdefaultargs") GeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "Returns value as a geometricallyboundedwireframeshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation>
") GeometricallyBoundedWireframeShapeRepresentation;
		opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation> GeometricallyBoundedWireframeShapeRepresentation();

		/****************** ManifoldSurfaceShapeRepresentation ******************/
		/**** md5 signature: b93674233c25de505912e059eb3dec2c ****/
		%feature("compactdefaultargs") ManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "Returns value as a manifoldsurfaceshaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation>
") ManifoldSurfaceShapeRepresentation;
		opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation> ManifoldSurfaceShapeRepresentation();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationItem ******************/
		/**** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ****/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** ShapeAspect ******************/
		/**** md5 signature: 6c476d31e71221a87c411540ef5855cb ****/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeRepresentation ******************/
		/**** md5 signature: d74800c9b299687bb55ce91ee61f68d3 ****/
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "Returns value as a shaperepresentation (null if another type).

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") ShapeRepresentation;
		opencascade::handle<StepShape_ShapeRepresentation> ShapeRepresentation();

		/****************** TemplateInstance ******************/
		/**** md5 signature: 04841b185558e0fa5261f466fe4819b3 ****/
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
		/**** md5 signature: ddb1268b1dc1a652a5bc76a9cd56c266 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "Returns a autodesignnominaldateandtimeassignment.

Returns
-------
None
") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		 StepAP214_AutoDesignNominalDateAndTimeAssignment();

		/****************** Init ******************/
		/**** md5 signature: c9219995f41330b21a404f293fbb0386 ****/
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
		/**** md5 signature: 9c8bed3ae8f82620b21bfc347e80f9e7 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDateAndTimeItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: f4ad99809296f52a6d83c77617ee99dc ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 47f812cdb000ba0d5a8e2b4c573490c6 ****/
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
		/**** md5 signature: c9b91b61d7b60272c7adb4f6fe78cd7c ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAssignment;
		%feature("autodoc", "Returns a autodesignnominaldateassignment.

Returns
-------
None
") StepAP214_AutoDesignNominalDateAssignment;
		 StepAP214_AutoDesignNominalDateAssignment();

		/****************** Init ******************/
		/**** md5 signature: dadfc4994fca45189bdb41ba40331693 ****/
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
		/**** md5 signature: eaec1ea87631e0cf462295053260933c ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignDatedItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: e9a3428ef97e2e1f1f810cc66f1f80fe ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: ab0089f1307e27b4665cd4070a1e5339 ****/
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
		/**** md5 signature: 0b4d7b3043d844736d21ca73af68e28f ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationAssignment;
		%feature("autodoc", "Returns a autodesignorganizationassignment.

Returns
-------
None
") StepAP214_AutoDesignOrganizationAssignment;
		 StepAP214_AutoDesignOrganizationAssignment();

		/****************** Init ******************/
		/**** md5 signature: 89ab9ba917d153e4c63d97bf69395dee ****/
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
		/**** md5 signature: aecfa0a2fd06e21514370c83d493b21d ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 2485886287b289109abca2e3522f58be ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 3632c10b0fa034af97afcf20ab179385 ****/
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
		/**** md5 signature: 3904a138fea359aae8c0d8cb88d1cf58 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns a autodesignpersonandorganizationassignment.

Returns
-------
None
") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		 StepAP214_AutoDesignPersonAndOrganizationAssignment();

		/****************** Init ******************/
		/**** md5 signature: f2a01d1c6044fb18c9c7810f2e97d5da ****/
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
		/**** md5 signature: aecfa0a2fd06e21514370c83d493b21d ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignGeneralOrgItem> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 2485886287b289109abca2e3522f58be ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 3632c10b0fa034af97afcf20ab179385 ****/
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
		/**** md5 signature: bf01c683dbdc335da39f6702580976c7 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItem;
		%feature("autodoc", "Returns a autodesignpresenteditem.

Returns
-------
None
") StepAP214_AutoDesignPresentedItem;
		 StepAP214_AutoDesignPresentedItem();

		/****************** Init ******************/
		/**** md5 signature: 68ae36752af92ed3d7356850fa712f93 ****/
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
		/**** md5 signature: bf09761d313c1cd7da9140dfe27b7ce1 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP214_HArray1OfAutoDesignPresentedItemSelect>
") Items;
		opencascade::handle<StepAP214_HArray1OfAutoDesignPresentedItemSelect> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 4b35ddc9d4f0e5fc43ee879b32945eec ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 5464a136a0962a491d8bb271134b4dce ****/
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
		/**** md5 signature: 157a3d50cc35c7ad7781f9444d6318e5 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItemSelect;
		%feature("autodoc", "Returns a autodesignpresenteditemselect selecttype.

Returns
-------
None
") StepAP214_AutoDesignPresentedItemSelect;
		 StepAP214_AutoDesignPresentedItemSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 7ddc0051aa86705aadf8e9b2bf6e535b ****/
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "Returns value as a documentrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentRelationship>
") DocumentRelationship;
		opencascade::handle<StepBasic_DocumentRelationship> DocumentRelationship();

		/****************** ProductDefinition ******************/
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 8884670d0de6dcec838b821592ead2d2 ****/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as a productdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** ProductDefinitionShape ******************/
		/**** md5 signature: b30663c40bd2822cf899d97bff9d9f32 ****/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Returns value as a productdefinitionshape (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****************** RepresentationRelationship ******************/
		/**** md5 signature: a447bbc2838d5d40e28b326c82d9c285 ****/
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "Returns value as a representationrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationRelationship>
") RepresentationRelationship;
		opencascade::handle<StepRepr_RepresentationRelationship> RepresentationRelationship();

		/****************** ShapeAspect ******************/
		/**** md5 signature: 6c476d31e71221a87c411540ef5855cb ****/
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
		/**** md5 signature: 115ae6c02bbc330331697b6ae885d7bd ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignReferencingItem;
		%feature("autodoc", "Returns a autodesignreferencingitem selecttype.

Returns
-------
None
") StepAP214_AutoDesignReferencingItem;
		 StepAP214_AutoDesignReferencingItem();

		/****************** Approval ******************/
		/**** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ****/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 7ddc0051aa86705aadf8e9b2bf6e535b ****/
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DocumentRelationship>
") DocumentRelationship;
		opencascade::handle<StepBasic_DocumentRelationship> DocumentRelationship();

		/****************** ExternallyDefinedRepresentation ******************/
		/**** md5 signature: 1ab41939bb532a4d66438d45db18a668 ****/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****************** MappedItem ******************/
		/**** md5 signature: 7d3cb5566b070a8a554b734d0e71c9a2 ****/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_MappedItem>
") MappedItem;
		opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****************** MaterialDesignation ******************/
		/**** md5 signature: 1af09264d96d4472c50c4a267a065d8a ****/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_MaterialDesignation>
") MaterialDesignation;
		opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****************** PresentationArea ******************/
		/**** md5 signature: 6adf2ef7fa0a7b503035224ca0f9247c ****/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationArea>
") PresentationArea;
		opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****************** PresentationView ******************/
		/**** md5 signature: f42d5482c64642bbea3f6f415c07a2aa ****/
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationView>
") PresentationView;
		opencascade::handle<StepVisual_PresentationView> PresentationView();

		/****************** ProductCategory ******************/
		/**** md5 signature: c68a3acfc5b2c48065c10648b3c34e4b ****/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****************** ProductDefinition ******************/
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 8884670d0de6dcec838b821592ead2d2 ****/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		/**** md5 signature: 4b7b4910929a0e1832918f8266d39349 ****/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationRelationship ******************/
		/**** md5 signature: a447bbc2838d5d40e28b326c82d9c285 ****/
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationRelationship>
") RepresentationRelationship;
		opencascade::handle<StepRepr_RepresentationRelationship> RepresentationRelationship();

		/****************** ShapeAspect ******************/
		/**** md5 signature: 6c476d31e71221a87c411540ef5855cb ****/
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
		/**** md5 signature: bca19617be72a5cea03aebe3c1dd6579 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "Returns a autodesignsecurityclassificationassignment.

Returns
-------
None
") StepAP214_AutoDesignSecurityClassificationAssignment;
		 StepAP214_AutoDesignSecurityClassificationAssignment();

		/****************** Init ******************/
		/**** md5 signature: ed7c00d2e54be3709ce83a93f8f51651 ****/
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
		/**** md5 signature: a59997f7dd24465ed4f74bee6422c248 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfApproval>
") Items;
		opencascade::handle<StepBasic_HArray1OfApproval> Items();

		/****************** ItemsValue ******************/
		/**** md5 signature: 7b8b8700850545d9efcf703263616265 ****/
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
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetItems ******************/
		/**** md5 signature: 88a872c084ef9516b679737a842c2f31 ****/
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
		/**** md5 signature: 617249d7d67baa7cd5d38d2c54c88b81 ****/
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
		/**** md5 signature: f2ff3959433e771bbbd46f9d50171407 ****/
		%feature("compactdefaultargs") StepAP214_DocumentReferenceItem;
		%feature("autodoc", "Returns a documentreferenceitem selecttype.

Returns
-------
None
") StepAP214_DocumentReferenceItem;
		 StepAP214_DocumentReferenceItem();

		/****************** AppliedExternalIdentificationAssignment ******************/
		/**** md5 signature: c1e1ee7fb84978d2ab998a39c57f9501 ****/
		%feature("compactdefaultargs") AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Returns value as a appliedexternalidentificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment>
") AppliedExternalIdentificationAssignment;
		opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> AppliedExternalIdentificationAssignment();

		/****************** Approval ******************/
		/**** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ****/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as a approval (null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** AssemblyComponentUsage ******************/
		/**** md5 signature: 9bdb67c5d71ecf8f82c68cc59b16ef47 ****/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "Returns value as a assemblycomponentusage (null if another type).

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>
") AssemblyComponentUsage;
		opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: e518475515030a2f9db7a2227e2fe8f9 ****/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Returns value as a characterizedobject (null if another type).

Returns
-------
opencascade::handle<StepBasic_CharacterizedObject>
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****************** DescriptiveRepresentationItem ******************/
		/**** md5 signature: 4b416f021b07f6695ff165a1f2e8b731 ****/
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "Returns value as a (null if another type).

Returns
-------
opencascade::handle<StepRepr_DescriptiveRepresentationItem>
") DescriptiveRepresentationItem;
		opencascade::handle<StepRepr_DescriptiveRepresentationItem> DescriptiveRepresentationItem();

		/****************** DimensionalSize ******************/
		/**** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ****/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** ExternallyDefinedItem ******************/
		/**** md5 signature: 99145de38951f9b9e301478cf44f094a ****/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Returns value as a externallydefineditem (null if another type).

Returns
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****************** Group ******************/
		/**** md5 signature: 58a65f6494d2bc516fda4ce1650fbefd ****/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Returns value as a group (null if another type).

Returns
-------
opencascade::handle<StepBasic_Group>
") Group;
		opencascade::handle<StepBasic_Group> Group();

		/****************** GroupRelationship ******************/
		/**** md5 signature: dbc6e67af278d1cc4875fb414ca2ed75 ****/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Returns value as a grouprelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupRelationship>
") GroupRelationship;
		opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****************** MaterialDesignation ******************/
		/**** md5 signature: 1af09264d96d4472c50c4a267a065d8a ****/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "Returns value as a materialdesignation (null if another type).

Returns
-------
opencascade::handle<StepRepr_MaterialDesignation>
") MaterialDesignation;
		opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****************** MeasureRepresentationItem ******************/
		/**** md5 signature: 935340871b120d19ae40bf488305af88 ****/
		%feature("compactdefaultargs") MeasureRepresentationItem;
		%feature("autodoc", "Returns value as a measurerepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_MeasureRepresentationItem>
") MeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> MeasureRepresentationItem();

		/****************** ProductCategory ******************/
		/**** md5 signature: c68a3acfc5b2c48065c10648b3c34e4b ****/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "Returns value as a productcategory (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****************** ProductDefinition ******************/
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionContext ******************/
		/**** md5 signature: bac3c5d5988cf625670a11dcc71c6a27 ****/
		%feature("compactdefaultargs") ProductDefinitionContext;
		%feature("autodoc", "Returns value as a productdefinitioncontext (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionContext>
") ProductDefinitionContext;
		opencascade::handle<StepBasic_ProductDefinitionContext> ProductDefinitionContext();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 8884670d0de6dcec838b821592ead2d2 ****/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as aproductdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		/**** md5 signature: 4b7b4910929a0e1832918f8266d39349 ****/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationItem ******************/
		/**** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ****/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** ShapeAspect ******************/
		/**** md5 signature: 6c476d31e71221a87c411540ef5855cb ****/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		/**** md5 signature: 35bed4b7262e5cb161ba72768027d32c ****/
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
		/**** md5 signature: 48154afee632f67b3037e1e9c786ec60 ****/
		%feature("compactdefaultargs") StepAP214_ExternalIdentificationItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_ExternalIdentificationItem;
		 StepAP214_ExternalIdentificationItem();

		/****************** AppliedOrganizationAssignment ******************/
		/**** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ****/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as appliedorganizationassignment (or null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		/**** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ****/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as appliedpersonandorganizationassignment (or null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** Approval ******************/
		/**** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ****/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as approval (or null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** ApprovalStatus ******************/
		/**** md5 signature: c9de9a40d619ec96562f8dda0f0fd363 ****/
		%feature("compactdefaultargs") ApprovalStatus;
		%feature("autodoc", "Returns value as approvalstatus (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalStatus>
") ApprovalStatus;
		opencascade::handle<StepBasic_ApprovalStatus> ApprovalStatus();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: d8649d2faa6844e0e520dcb63fafd706 ****/
		%feature("compactdefaultargs") DateAndTimeAssignment;
		%feature("autodoc", "Returns value as dateandtimeassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DateAndTimeAssignment>
") DateAndTimeAssignment;
		opencascade::handle<StepBasic_DateAndTimeAssignment> DateAndTimeAssignment();

		/****************** DateAssignment ******************/
		/**** md5 signature: 72439af527fd547213434de4879a3712 ****/
		%feature("compactdefaultargs") DateAssignment;
		%feature("autodoc", "Returns value as dateassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DateAssignment>
") DateAssignment;
		opencascade::handle<StepBasic_DateAssignment> DateAssignment();

		/****************** DocumentFile ******************/
		/**** md5 signature: bcd917452eb81042c78b397f1e6fd78b ****/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Returns value as documentfile (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentFile>
") DocumentFile;
		opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****************** ExternalSource ******************/
		/**** md5 signature: cee20c433c0258dd79dc65e91e8e3bcb ****/
		%feature("compactdefaultargs") ExternalSource;
		%feature("autodoc", "Returns value as externalsource (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ExternalSource>
") ExternalSource;
		opencascade::handle<StepBasic_ExternalSource> ExternalSource();

		/****************** ExternallyDefinedClass ******************/
		/**** md5 signature: b21aa642191707ab3d72a978d0c1c007 ****/
		%feature("compactdefaultargs") ExternallyDefinedClass;
		%feature("autodoc", "Returns value as externallydefinedclass (or null if another type).

Returns
-------
opencascade::handle<StepAP214_ExternallyDefinedClass>
") ExternallyDefinedClass;
		opencascade::handle<StepAP214_ExternallyDefinedClass> ExternallyDefinedClass();

		/****************** ExternallyDefinedGeneralProperty ******************/
		/**** md5 signature: e58aed6b556e17d44ed0bbcee768cfb9 ****/
		%feature("compactdefaultargs") ExternallyDefinedGeneralProperty;
		%feature("autodoc", "Returns value as externallydefinedgeneralproperty (or null if another type).

Returns
-------
opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty>
") ExternallyDefinedGeneralProperty;
		opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty> ExternallyDefinedGeneralProperty();

		/****************** OrganizationalAddress ******************/
		/**** md5 signature: 8e7a6f7600f4d5f59788fac6ed18b2bf ****/
		%feature("compactdefaultargs") OrganizationalAddress;
		%feature("autodoc", "Returns value as organizationaladdress (or null if another type).

Returns
-------
opencascade::handle<StepBasic_OrganizationalAddress>
") OrganizationalAddress;
		opencascade::handle<StepBasic_OrganizationalAddress> OrganizationalAddress();

		/****************** ProductDefinition ******************/
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as productdefinition (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** SecurityClassification ******************/
		/**** md5 signature: 5a1ef075f0f272079bd532895ecc4299 ****/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Returns value as securityclassification (or null if another type).

Returns
-------
opencascade::handle<StepBasic_SecurityClassification>
") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****************** TrimmedCurve ******************/
		/**** md5 signature: 9b9238907b0e1a3c16314fe3c0123825 ****/
		%feature("compactdefaultargs") TrimmedCurve;
		%feature("autodoc", "Returns value as trimmedcurve (or null if another type).

Returns
-------
opencascade::handle<StepGeom_TrimmedCurve>
") TrimmedCurve;
		opencascade::handle<StepGeom_TrimmedCurve> TrimmedCurve();

		/****************** VersionedActionRequest ******************/
		/**** md5 signature: eb68cd791736346256b603640d0e00b7 ****/
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
		/**** md5 signature: 8428f277be4306356e4d3176fe185bba ****/
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedGeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_ExternallyDefinedGeneralProperty;
		 StepAP214_ExternallyDefinedGeneralProperty();

		/****************** ExternallyDefinedItem ******************/
		/**** md5 signature: 99145de38951f9b9e301478cf44f094a ****/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Returns data for supertype externallydefineditem.

Returns
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****************** Init ******************/
		/**** md5 signature: 4ccb5c0ef5e03ccab24dd3c593e59cfe ****/
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
		/**** md5 signature: cb03be29921f3258b30b96567c768692 ****/
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
		/**** md5 signature: c7ec4f9a5ee1269b8ff3d95dff43cd87 ****/
		%feature("compactdefaultargs") StepAP214_GroupItem;
		%feature("autodoc", "Returns a groupitem selecttype.

Returns
-------
None
") StepAP214_GroupItem;
		 StepAP214_GroupItem();

		/****************** CaseNum ******************/
		/**** md5 signature: 50869928f151d2c924215b1661d4fc92 ****/
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
		/**** md5 signature: 19337bf8b91e6fdb784c9372c3a2503d ****/
		%feature("compactdefaultargs") GeometricRepresentationItem;
		%feature("autodoc", "Returns value as a geometricrepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepGeom_GeometricRepresentationItem>
") GeometricRepresentationItem;
		virtual opencascade::handle<StepGeom_GeometricRepresentationItem> GeometricRepresentationItem();

		/****************** GroupRelationship ******************/
		/**** md5 signature: e96924329e7182112336a8edc68173d8 ****/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Returns value as a grouprelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupRelationship>
") GroupRelationship;
		virtual opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****************** MappedItem ******************/
		/**** md5 signature: a84bcaf518cab916fa453d0b4bfed2d6 ****/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "Returns value as a mappeditem (null if another type).

Returns
-------
opencascade::handle<StepRepr_MappedItem>
") MappedItem;
		virtual opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****************** ProductDefinition ******************/
		/**** md5 signature: c87a2e2c18abbb8dba7578354cb60082 ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		virtual opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		/**** md5 signature: 507fa3da9e81b3c4e23dcc57a6272df1 ****/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as a productdefinitionformation (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****************** PropertyDefinitionRepresentation ******************/
		/**** md5 signature: 15516a89777304fed6268c18b3417ae7 ****/
		%feature("compactdefaultargs") PropertyDefinitionRepresentation;
		%feature("autodoc", "Returns value as a propertydefinitionrepresentation (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinitionRepresentation>
") PropertyDefinitionRepresentation;
		virtual opencascade::handle<StepRepr_PropertyDefinitionRepresentation> PropertyDefinitionRepresentation();

		/****************** Representation ******************/
		/**** md5 signature: 0e7149a093c46006c551ea78ef408983 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		virtual opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationItem ******************/
		/**** md5 signature: 891f7511cd1c3bd60530164f2263a93b ****/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		virtual opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** RepresentationRelationshipWithTransformation ******************/
		/**** md5 signature: a6dfff1f1069c389f1a9972f5abc8237 ****/
		%feature("compactdefaultargs") RepresentationRelationshipWithTransformation;
		%feature("autodoc", "Returns value as a representationrelationshipwithtransformation (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation>
") RepresentationRelationshipWithTransformation;
		virtual opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> RepresentationRelationshipWithTransformation();

		/****************** ShapeAspect ******************/
		/**** md5 signature: 7166c8a321ddb0da72235604702dc5c2 ****/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		virtual opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		/**** md5 signature: 0856c8eef765cafdadc90beca549d0b3 ****/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
") ShapeAspectRelationship;
		virtual opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****************** ShapeRepresentationRelationship ******************/
		/**** md5 signature: c0de6c2968734ed77b425351c1c9ec13 ****/
		%feature("compactdefaultargs") ShapeRepresentationRelationship;
		%feature("autodoc", "Returns value as a shaperepresentationrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeRepresentationRelationship>
") ShapeRepresentationRelationship;
		virtual opencascade::handle<StepRepr_ShapeRepresentationRelationship> ShapeRepresentationRelationship();

		/****************** StyledItem ******************/
		/**** md5 signature: 17351058c5e2e8666276ba91cd395c20 ****/
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "Returns value as a styleditem (null if another type).

Returns
-------
opencascade::handle<StepVisual_StyledItem>
") StyledItem;
		virtual opencascade::handle<StepVisual_StyledItem> StyledItem();

		/****************** TopologicalRepresentationItem ******************/
		/**** md5 signature: b0daadcd0bd7ad716605d04da68356df ****/
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
		/**** md5 signature: 1ab0cf619cd8a2e4a40232e1b0fa0aa3 ****/
		%feature("compactdefaultargs") StepAP214_PresentedItemSelect;
		%feature("autodoc", "Returns a presenteditemselect selecttype.

Returns
-------
None
") StepAP214_PresentedItemSelect;
		 StepAP214_PresentedItemSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 8884670d0de6dcec838b821592ead2d2 ****/
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
		/**** md5 signature: 3d8e6919cc9e7dcbdb90cb31d9fb36f4 ****/
		%feature("compactdefaultargs") StepAP214_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_Protocol;
		 StepAP214_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Returns count of protocol used as resources (level one).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		/**** md5 signature: 26597e9d8db9fc70530508f766cf0d70 ****/
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
		/**** md5 signature: 27a898737676170f03381527c0752a7e ****/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") SchemaName;
		virtual const char * SchemaName();

		/****************** TypeNumber ******************/
		/**** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ****/
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
		/**** md5 signature: 4d65b9d6c1a89e6fdb0b55afcf91ce12 ****/
		%feature("compactdefaultargs") StepAP214_RepItemGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_RepItemGroup;
		 StepAP214_RepItemGroup();

		/****************** Init ******************/
		/**** md5 signature: 0d2f2631381340e71a864debc992361a ****/
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
		/**** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ****/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns data for supertype representationitem.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****************** SetRepresentationItem ******************/
		/**** md5 signature: 88416c585a2b3cb9cb84e9e665263fad ****/
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
		/**** md5 signature: 8984fe5021e1226189d2cee91cce2bc5 ****/
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepAP214_AutoDesignOrganizationItem;
		 StepAP214_AutoDesignOrganizationItem();

		/****************** CaseNum ******************/
		/**** md5 signature: 3f910cb88b6a917596129adeef48ddc4 ****/
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
		/**** md5 signature: a302006fc6da6b6c11cd2cb18a0d18d6 ****/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") Document;
		opencascade::handle<StepBasic_Document> Document();

		/****************** PhysicallyModeledProductDefinition ******************/
		/**** md5 signature: 3425e1fe5db4c82dc6868dafa4cb1437 ****/
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
		/**** md5 signature: 9c8a5fb11e899ee1a676366f50214dea ****/
		%feature("compactdefaultargs") StepAP214_DateAndTimeItem;
		%feature("autodoc", "Returns a dateandtimeitem selecttype.

Returns
-------
None
") StepAP214_DateAndTimeItem;
		 StepAP214_DateAndTimeItem();

		/****************** AppliedOrganizationAssignment ******************/
		/**** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ****/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		/**** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ****/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as a applieddateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** ApprovalPersonOrganization ******************/
		/**** md5 signature: af795dc9d70028f3b512bd493ca8a169 ****/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** CaseNum ******************/
		/**** md5 signature: 3f910cb88b6a917596129adeef48ddc4 ****/
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
		/**** md5 signature: 4c6b16cb0f239579874636037b511e9d ****/
		%feature("compactdefaultargs") StepAP214_DateItem;
		%feature("autodoc", "Returns a dateitem selecttype.

Returns
-------
None
") StepAP214_DateItem;
		 StepAP214_DateItem();

		/****************** AppliedOrganizationAssignment ******************/
		/**** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ****/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		/**** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ****/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as a applieddateandpersonassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		/**** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ****/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** ApprovalPersonOrganization ******************/
		/**** md5 signature: af795dc9d70028f3b512bd493ca8a169 ****/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Returns value as a approvalpersonorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****************** CaseNum ******************/
		/**** md5 signature: 3f910cb88b6a917596129adeef48ddc4 ****/
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
		/**** md5 signature: 0600303b9e0ad2121b0502b5786ef40c ****/
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedClass;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepAP214_ExternallyDefinedClass;
		 StepAP214_ExternallyDefinedClass();

		/****************** ExternallyDefinedItem ******************/
		/**** md5 signature: 99145de38951f9b9e301478cf44f094a ****/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Returns data for supertype externallydefineditem.

Returns
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****************** Init ******************/
		/**** md5 signature: 6feea0240c15044a2daf8ec78fc033da ****/
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
		/**** md5 signature: cb03be29921f3258b30b96567c768692 ****/
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
		/**** md5 signature: 11a02f6669929e72c1db28c5a8a13f6c ****/
		%feature("compactdefaultargs") StepAP214_OrganizationItem;
		%feature("autodoc", "Returns a organizationitem selecttype.

Returns
-------
None
") StepAP214_OrganizationItem;
		 StepAP214_OrganizationItem();

		/****************** AppliedOrganizationAssignment ******************/
		/**** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ****/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		/**** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ****/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** Approval ******************/
		/**** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ****/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as a approval (null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** CaseNum ******************/
		/**** md5 signature: 3f910cb88b6a917596129adeef48ddc4 ****/
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
		/**** md5 signature: e4db6ace47d2c777bc4718b6bfa890ba ****/
		%feature("compactdefaultargs") StepAP214_PersonAndOrganizationItem;
		%feature("autodoc", "Returns a personandorganizationitem selecttype.

Returns
-------
None
") StepAP214_PersonAndOrganizationItem;
		 StepAP214_PersonAndOrganizationItem();

		/****************** AppliedOrganizationAssignment ******************/
		/**** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ****/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		/**** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ****/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** Approval ******************/
		/**** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ****/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Returns value as a approval (null if another type).

Returns
-------
opencascade::handle<StepBasic_Approval>
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****************** CaseNum ******************/
		/**** md5 signature: 3f910cb88b6a917596129adeef48ddc4 ****/
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
		/**** md5 signature: 5cf35b4a1ab83e22092420587e59e1ba ****/
		%feature("compactdefaultargs") StepAP214_SecurityClassificationItem;
		%feature("autodoc", "Returns a securityclassificationitem selecttype.

Returns
-------
None
") StepAP214_SecurityClassificationItem;
		 StepAP214_SecurityClassificationItem();

		/****************** Action ******************/
		/**** md5 signature: d78be0cc67ab61a633e5943a92bf24dc ****/
		%feature("compactdefaultargs") Action;
		%feature("autodoc", "Returns value as a action (null if another type).

Returns
-------
opencascade::handle<StepBasic_Action>
") Action;
		virtual opencascade::handle<StepBasic_Action> Action();

		/****************** AssemblyComponentUsage ******************/
		/**** md5 signature: e97304587751f930a448a5a30fc01025 ****/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "Returns value as a assemblycomponentusage (null if another type).

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>
") AssemblyComponentUsage;
		virtual opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage();

		/****************** CaseNum ******************/
		/**** md5 signature: 50869928f151d2c924215b1661d4fc92 ****/
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
		/**** md5 signature: 010b6e51854a031d1c0e4c1efdaed13e ****/
		%feature("compactdefaultargs") ConfigurationDesign;
		%feature("autodoc", "Returns value as a configurationdesign (null if another type).

Returns
-------
opencascade::handle<StepRepr_ConfigurationDesign>
") ConfigurationDesign;
		virtual opencascade::handle<StepRepr_ConfigurationDesign> ConfigurationDesign();

		/****************** ConfigurationEffectivity ******************/
		/**** md5 signature: b80c79ba89316d4f5731586aca4be7d5 ****/
		%feature("compactdefaultargs") ConfigurationEffectivity;
		%feature("autodoc", "Returns value as a configurationeffectivity (null if another type).

Returns
-------
opencascade::handle<StepRepr_ConfigurationEffectivity>
") ConfigurationEffectivity;
		virtual opencascade::handle<StepRepr_ConfigurationEffectivity> ConfigurationEffectivity();

		/****************** DraughtingModel ******************/
		/**** md5 signature: b62aebe5ded344c4fd8cbb0a8277058b ****/
		%feature("compactdefaultargs") DraughtingModel;
		%feature("autodoc", "Returns value as a draughtingmodel (null if another type).

Returns
-------
opencascade::handle<StepVisual_DraughtingModel>
") DraughtingModel;
		virtual opencascade::handle<StepVisual_DraughtingModel> DraughtingModel();

		/****************** GeneralProperty ******************/
		/**** md5 signature: e8a23447f91a20426739b05fd01129ef ****/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Returns value as a generalproperty (null if another type).

Returns
-------
opencascade::handle<StepBasic_GeneralProperty>
") GeneralProperty;
		virtual opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****************** MakeFromUsageOption ******************/
		/**** md5 signature: 3e9483ba1a3e0cbde008e2c79eeae389 ****/
		%feature("compactdefaultargs") MakeFromUsageOption;
		%feature("autodoc", "Returns value as a makefromusageoption (null if another type).

Returns
-------
opencascade::handle<StepRepr_MakeFromUsageOption>
") MakeFromUsageOption;
		virtual opencascade::handle<StepRepr_MakeFromUsageOption> MakeFromUsageOption();

		/****************** ProductConcept ******************/
		/**** md5 signature: 804dada10f5a04737b5d5baae55f58a2 ****/
		%feature("compactdefaultargs") ProductConcept;
		%feature("autodoc", "Returns value as a productconcept (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductConcept>
") ProductConcept;
		virtual opencascade::handle<StepRepr_ProductConcept> ProductConcept();

		/****************** ProductDefinitionUsage ******************/
		/**** md5 signature: e2f37121b68615ea2d30e17499139aa9 ****/
		%feature("compactdefaultargs") ProductDefinitionUsage;
		%feature("autodoc", "Returns value as a productdefinitionusage (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionUsage>
") ProductDefinitionUsage;
		virtual opencascade::handle<StepRepr_ProductDefinitionUsage> ProductDefinitionUsage();

		/****************** VersionedActionRequest ******************/
		/**** md5 signature: 75f2874746b7634c201d37df06d21e6c ****/
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

class StepAP214_HArray1OfDateItem : public StepAP214_Array1OfDateItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfDateItem::value_type& theValue);
    StepAP214_HArray1OfDateItem(const StepAP214_Array1OfDateItem& theOther);
    const StepAP214_Array1OfDateItem& Array1();
    StepAP214_Array1OfDateItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateItem)


class StepAP214_HArray1OfSecurityClassificationItem : public StepAP214_Array1OfSecurityClassificationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfSecurityClassificationItem::value_type& theValue);
    StepAP214_HArray1OfSecurityClassificationItem(const StepAP214_Array1OfSecurityClassificationItem& theOther);
    const StepAP214_Array1OfSecurityClassificationItem& Array1();
    StepAP214_Array1OfSecurityClassificationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfSecurityClassificationItem)


class StepAP214_HArray1OfExternalIdentificationItem : public StepAP214_Array1OfExternalIdentificationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfExternalIdentificationItem::value_type& theValue);
    StepAP214_HArray1OfExternalIdentificationItem(const StepAP214_Array1OfExternalIdentificationItem& theOther);
    const StepAP214_Array1OfExternalIdentificationItem& Array1();
    StepAP214_Array1OfExternalIdentificationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfExternalIdentificationItem)


class StepAP214_HArray1OfAutoDesignDatedItem : public StepAP214_Array1OfAutoDesignDatedItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfAutoDesignDatedItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDatedItem(const StepAP214_Array1OfAutoDesignDatedItem& theOther);
    const StepAP214_Array1OfAutoDesignDatedItem& Array1();
    StepAP214_Array1OfAutoDesignDatedItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDatedItem)


class StepAP214_HArray1OfPersonAndOrganizationItem : public StepAP214_Array1OfPersonAndOrganizationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfPersonAndOrganizationItem::value_type& theValue);
    StepAP214_HArray1OfPersonAndOrganizationItem(const StepAP214_Array1OfPersonAndOrganizationItem& theOther);
    const StepAP214_Array1OfPersonAndOrganizationItem& Array1();
    StepAP214_Array1OfPersonAndOrganizationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPersonAndOrganizationItem)


class StepAP214_HArray1OfAutoDesignDateAndPersonItem : public StepAP214_Array1OfAutoDesignDateAndPersonItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfAutoDesignDateAndPersonItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const StepAP214_Array1OfAutoDesignDateAndPersonItem& theOther);
    const StepAP214_Array1OfAutoDesignDateAndPersonItem& Array1();
    StepAP214_Array1OfAutoDesignDateAndPersonItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndPersonItem)


class StepAP214_HArray1OfAutoDesignGroupedItem : public StepAP214_Array1OfAutoDesignGroupedItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfAutoDesignGroupedItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGroupedItem(const StepAP214_Array1OfAutoDesignGroupedItem& theOther);
    const StepAP214_Array1OfAutoDesignGroupedItem& Array1();
    StepAP214_Array1OfAutoDesignGroupedItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGroupedItem)


class StepAP214_HArray1OfPresentedItemSelect : public StepAP214_Array1OfPresentedItemSelect, public Standard_Transient {
  public:
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfPresentedItemSelect::value_type& theValue);
    StepAP214_HArray1OfPresentedItemSelect(const StepAP214_Array1OfPresentedItemSelect& theOther);
    const StepAP214_Array1OfPresentedItemSelect& Array1();
    StepAP214_Array1OfPresentedItemSelect& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPresentedItemSelect)


class StepAP214_HArray1OfAutoDesignGeneralOrgItem : public StepAP214_Array1OfAutoDesignGeneralOrgItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfAutoDesignGeneralOrgItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const StepAP214_Array1OfAutoDesignGeneralOrgItem& theOther);
    const StepAP214_Array1OfAutoDesignGeneralOrgItem& Array1();
    StepAP214_Array1OfAutoDesignGeneralOrgItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGeneralOrgItem)


class StepAP214_HArray1OfAutoDesignDateAndTimeItem : public StepAP214_Array1OfAutoDesignDateAndTimeItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfAutoDesignDateAndTimeItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const StepAP214_Array1OfAutoDesignDateAndTimeItem& theOther);
    const StepAP214_Array1OfAutoDesignDateAndTimeItem& Array1();
    StepAP214_Array1OfAutoDesignDateAndTimeItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndTimeItem)


class StepAP214_HArray1OfAutoDesignPresentedItemSelect : public StepAP214_Array1OfAutoDesignPresentedItemSelect, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfAutoDesignPresentedItemSelect::value_type& theValue);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const StepAP214_Array1OfAutoDesignPresentedItemSelect& theOther);
    const StepAP214_Array1OfAutoDesignPresentedItemSelect& Array1();
    StepAP214_Array1OfAutoDesignPresentedItemSelect& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignPresentedItemSelect)


class StepAP214_HArray1OfAutoDesignReferencingItem : public StepAP214_Array1OfAutoDesignReferencingItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfAutoDesignReferencingItem::value_type& theValue);
    StepAP214_HArray1OfAutoDesignReferencingItem(const StepAP214_Array1OfAutoDesignReferencingItem& theOther);
    const StepAP214_Array1OfAutoDesignReferencingItem& Array1();
    StepAP214_Array1OfAutoDesignReferencingItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignReferencingItem)


class StepAP214_HArray1OfDocumentReferenceItem : public StepAP214_Array1OfDocumentReferenceItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfDocumentReferenceItem::value_type& theValue);
    StepAP214_HArray1OfDocumentReferenceItem(const StepAP214_Array1OfDocumentReferenceItem& theOther);
    const StepAP214_Array1OfDocumentReferenceItem& Array1();
    StepAP214_Array1OfDocumentReferenceItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDocumentReferenceItem)


class StepAP214_HArray1OfOrganizationItem : public StepAP214_Array1OfOrganizationItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfOrganizationItem::value_type& theValue);
    StepAP214_HArray1OfOrganizationItem(const StepAP214_Array1OfOrganizationItem& theOther);
    const StepAP214_Array1OfOrganizationItem& Array1();
    StepAP214_Array1OfOrganizationItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfOrganizationItem)


class StepAP214_HArray1OfApprovalItem : public StepAP214_Array1OfApprovalItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfApprovalItem::value_type& theValue);
    StepAP214_HArray1OfApprovalItem(const StepAP214_Array1OfApprovalItem& theOther);
    const StepAP214_Array1OfApprovalItem& Array1();
    StepAP214_Array1OfApprovalItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfApprovalItem)


class StepAP214_HArray1OfGroupItem : public StepAP214_Array1OfGroupItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfGroupItem::value_type& theValue);
    StepAP214_HArray1OfGroupItem(const StepAP214_Array1OfGroupItem& theOther);
    const StepAP214_Array1OfGroupItem& Array1();
    StepAP214_Array1OfGroupItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfGroupItem)


class StepAP214_HArray1OfDateAndTimeItem : public StepAP214_Array1OfDateAndTimeItem, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP214_Array1OfDateAndTimeItem::value_type& theValue);
    StepAP214_HArray1OfDateAndTimeItem(const StepAP214_Array1OfDateAndTimeItem& theOther);
    const StepAP214_Array1OfDateAndTimeItem& Array1();
    StepAP214_Array1OfDateAndTimeItem& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateAndTimeItem)

/* harray2 classes */
/* hsequence classes */
