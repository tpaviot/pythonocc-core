/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepap214.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Resource_module.hxx>
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

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(StepAP214_Array1OfApprovalItem) NCollection_Array1<StepAP214_ApprovalItem>;
Array1ExtendIter(StepAP214_ApprovalItem)

%template(StepAP214_Array1OfAutoDesignDateAndPersonItem) NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem>;
Array1ExtendIter(StepAP214_AutoDesignDateAndPersonItem)

%template(StepAP214_Array1OfAutoDesignDateAndTimeItem) NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem>;
Array1ExtendIter(StepAP214_AutoDesignDateAndTimeItem)

%template(StepAP214_Array1OfAutoDesignDatedItem) NCollection_Array1<StepAP214_AutoDesignDatedItem>;
Array1ExtendIter(StepAP214_AutoDesignDatedItem)

%template(StepAP214_Array1OfAutoDesignGeneralOrgItem) NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem>;
Array1ExtendIter(StepAP214_AutoDesignGeneralOrgItem)

%template(StepAP214_Array1OfAutoDesignGroupedItem) NCollection_Array1<StepAP214_AutoDesignGroupedItem>;
Array1ExtendIter(StepAP214_AutoDesignGroupedItem)

%template(StepAP214_Array1OfAutoDesignPresentedItemSelect) NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect>;
Array1ExtendIter(StepAP214_AutoDesignPresentedItemSelect)

%template(StepAP214_Array1OfAutoDesignReferencingItem) NCollection_Array1<StepAP214_AutoDesignReferencingItem>;
Array1ExtendIter(StepAP214_AutoDesignReferencingItem)

%template(StepAP214_Array1OfDateAndTimeItem) NCollection_Array1<StepAP214_DateAndTimeItem>;
Array1ExtendIter(StepAP214_DateAndTimeItem)

%template(StepAP214_Array1OfDateItem) NCollection_Array1<StepAP214_DateItem>;
Array1ExtendIter(StepAP214_DateItem)

%template(StepAP214_Array1OfDocumentReferenceItem) NCollection_Array1<StepAP214_DocumentReferenceItem>;
Array1ExtendIter(StepAP214_DocumentReferenceItem)

%template(StepAP214_Array1OfExternalIdentificationItem) NCollection_Array1<StepAP214_ExternalIdentificationItem>;
Array1ExtendIter(StepAP214_ExternalIdentificationItem)

%template(StepAP214_Array1OfGroupItem) NCollection_Array1<StepAP214_GroupItem>;
Array1ExtendIter(StepAP214_GroupItem)

%template(StepAP214_Array1OfOrganizationItem) NCollection_Array1<StepAP214_OrganizationItem>;
Array1ExtendIter(StepAP214_OrganizationItem)

%template(StepAP214_Array1OfPersonAndOrganizationItem) NCollection_Array1<StepAP214_PersonAndOrganizationItem>;
Array1ExtendIter(StepAP214_PersonAndOrganizationItem)

%template(StepAP214_Array1OfPresentedItemSelect) NCollection_Array1<StepAP214_PresentedItemSelect>;
Array1ExtendIter(StepAP214_PresentedItemSelect)

%template(StepAP214_Array1OfSecurityClassificationItem) NCollection_Array1<StepAP214_SecurityClassificationItem>;
Array1ExtendIter(StepAP214_SecurityClassificationItem)

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
typedef NCollection_HArray1<StepAP214_ApprovalItem> StepAP214_HArray1OfApprovalItem;
typedef NCollection_HArray1<StepAP214_AutoDesignDateAndPersonItem> StepAP214_HArray1OfAutoDesignDateAndPersonItem;
typedef NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem> StepAP214_HArray1OfAutoDesignDateAndTimeItem;
typedef NCollection_HArray1<StepAP214_AutoDesignDatedItem> StepAP214_HArray1OfAutoDesignDatedItem;
typedef NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem> StepAP214_HArray1OfAutoDesignGeneralOrgItem;
typedef NCollection_HArray1<StepAP214_AutoDesignGroupedItem> StepAP214_HArray1OfAutoDesignGroupedItem;
typedef NCollection_HArray1<StepAP214_AutoDesignPresentedItemSelect> StepAP214_HArray1OfAutoDesignPresentedItemSelect;
typedef NCollection_HArray1<StepAP214_AutoDesignReferencingItem> StepAP214_HArray1OfAutoDesignReferencingItem;
typedef NCollection_HArray1<StepAP214_DateAndTimeItem> StepAP214_HArray1OfDateAndTimeItem;
typedef NCollection_HArray1<StepAP214_DateItem> StepAP214_HArray1OfDateItem;
typedef NCollection_HArray1<StepAP214_DocumentReferenceItem> StepAP214_HArray1OfDocumentReferenceItem;
typedef NCollection_HArray1<StepAP214_ExternalIdentificationItem> StepAP214_HArray1OfExternalIdentificationItem;
typedef NCollection_HArray1<StepAP214_GroupItem> StepAP214_HArray1OfGroupItem;
typedef NCollection_HArray1<StepAP214_OrganizationItem> StepAP214_HArray1OfOrganizationItem;
typedef NCollection_HArray1<StepAP214_PersonAndOrganizationItem> StepAP214_HArray1OfPersonAndOrganizationItem;
typedef NCollection_HArray1<StepAP214_PresentedItemSelect> StepAP214_HArray1OfPresentedItemSelect;
typedef NCollection_HArray1<StepAP214_SecurityClassificationItem> StepAP214_HArray1OfSecurityClassificationItem;
/* end typedefs declaration */

/******************
* class StepAP214 *
******************/
%rename(stepap214) StepAP214;
class StepAP214 {
	public:
		/****** StepAP214::Protocol ******/
		/****** md5 signature: cb02aaf17fb7b280f1ecef6f4a97c6c6 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_Protocol>

Description
-----------
creates a Protocol.
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
		/****** StepAP214_AppliedApprovalAssignment::StepAP214_AppliedApprovalAssignment ******/
		/****** md5 signature: 387d08f97a7bca8e01a6f64d6950cd64 ******/
		%feature("compactdefaultargs") StepAP214_AppliedApprovalAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AppliedApprovalAssignment.
") StepAP214_AppliedApprovalAssignment;
		 StepAP214_AppliedApprovalAssignment();

		/****** StepAP214_AppliedApprovalAssignment::Init ******/
		/****** md5 signature: 3735dbce1a254d2224b2e65cbb4ae62a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedApproval: StepBasic_Approval
aItems: NCollection_HArray1<StepAP214_ApprovalItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Approval> & aAssignedApproval, const opencascade::handle<NCollection_HArray1<StepAP214_ApprovalItem> > & aItems);

		/****** StepAP214_AppliedApprovalAssignment::Items ******/
		/****** md5 signature: 8c78759f7b1da6d4705502770fc944c6 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_ApprovalItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_ApprovalItem>> Items();

		/****** StepAP214_AppliedApprovalAssignment::ItemsValue ******/
		/****** md5 signature: 46e052cbf1eefef5175579a07ae466e5 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_ApprovalItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_ApprovalItem ItemsValue(const int num);

		/****** StepAP214_AppliedApprovalAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedApprovalAssignment::SetItems ******/
		/****** md5 signature: 1fbe2df8994cd8e95d796cff57579340 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_ApprovalItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_ApprovalItem> > & aItems);

};


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
		/****** StepAP214_AppliedDateAndTimeAssignment::StepAP214_AppliedDateAndTimeAssignment ******/
		/****** md5 signature: 678ef72942a26f1ee72d1e7ff8b3d392 ******/
		%feature("compactdefaultargs") StepAP214_AppliedDateAndTimeAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AppliedDateAndTimeAssignment.
") StepAP214_AppliedDateAndTimeAssignment;
		 StepAP214_AppliedDateAndTimeAssignment();

		/****** StepAP214_AppliedDateAndTimeAssignment::Init ******/
		/****** md5 signature: 4cee5dee1c1f2f061ac2c97049ddbd0f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole
aItems: NCollection_HArray1<StepAP214_DateAndTimeItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_DateAndTimeItem> > & aItems);

		/****** StepAP214_AppliedDateAndTimeAssignment::Items ******/
		/****** md5 signature: f6d25b981de3bdb9f08ff961663dc21a ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_DateAndTimeItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_DateAndTimeItem>> Items();

		/****** StepAP214_AppliedDateAndTimeAssignment::ItemsValue ******/
		/****** md5 signature: 0cb815c73a2c50625f35bb3816ae6a07 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_DateAndTimeItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_DateAndTimeItem ItemsValue(const int num);

		/****** StepAP214_AppliedDateAndTimeAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedDateAndTimeAssignment::SetItems ******/
		/****** md5 signature: 0c7e380318b21aba6e22f8db69516d40 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_DateAndTimeItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_DateAndTimeItem> > & aItems);

};


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
		/****** StepAP214_AppliedDateAssignment::StepAP214_AppliedDateAssignment ******/
		/****** md5 signature: 0a525f7fb3135f93331afdf7d013fdb3 ******/
		%feature("compactdefaultargs") StepAP214_AppliedDateAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AppliedDateAssignment.
") StepAP214_AppliedDateAssignment;
		 StepAP214_AppliedDateAssignment();

		/****** StepAP214_AppliedDateAssignment::Init ******/
		/****** md5 signature: 92f547fcf27d8420de2a208b8955519e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole
aItems: NCollection_HArray1<StepAP214_DateItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_DateItem> > & aItems);

		/****** StepAP214_AppliedDateAssignment::Items ******/
		/****** md5 signature: dd33a64735265b822dc19119e358129e ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_DateItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_DateItem>> Items();

		/****** StepAP214_AppliedDateAssignment::ItemsValue ******/
		/****** md5 signature: e0d0bfbea7aedda049101e3820328c46 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_DateItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_DateItem ItemsValue(const int num);

		/****** StepAP214_AppliedDateAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedDateAssignment::SetItems ******/
		/****** md5 signature: 5d0d21b0625d37cdcc0e461dc2d4732b ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_DateItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_DateItem> > & aItems);

};


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
		/****** StepAP214_AppliedDocumentReference::StepAP214_AppliedDocumentReference ******/
		/****** md5 signature: 27e864797090c39fbdd2f1f5508e8c8c ******/
		%feature("compactdefaultargs") StepAP214_AppliedDocumentReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepAP214_AppliedDocumentReference;
		 StepAP214_AppliedDocumentReference();

		/****** StepAP214_AppliedDocumentReference::Init ******/
		/****** md5 signature: 96c1adbf0a25a75b91fab209a02b7dc8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDocument: StepBasic_Document
aSource: TCollection_HAsciiString
aItems: NCollection_HArray1<StepAP214_DocumentReferenceItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Document> & aAssignedDocument, const opencascade::handle<TCollection_HAsciiString> & aSource, const opencascade::handle<NCollection_HArray1<StepAP214_DocumentReferenceItem> > & aItems);

		/****** StepAP214_AppliedDocumentReference::Items ******/
		/****** md5 signature: 95562eb50278d366a8df9ee5ae96710f ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_DocumentReferenceItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_DocumentReferenceItem>> Items();

		/****** StepAP214_AppliedDocumentReference::ItemsValue ******/
		/****** md5 signature: 54cd255f02507b1d5f5e8893cfa3614f ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_DocumentReferenceItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_DocumentReferenceItem ItemsValue(const int num);

		/****** StepAP214_AppliedDocumentReference::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedDocumentReference::SetItems ******/
		/****** md5 signature: a8171fdf1c4aafedb871897ffebd329b ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_DocumentReferenceItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_DocumentReferenceItem> > & aItems);

};


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
		/****** StepAP214_AppliedExternalIdentificationAssignment::StepAP214_AppliedExternalIdentificationAssignment ******/
		/****** md5 signature: be0a389896f320f5630f0d4a82c60687 ******/
		%feature("compactdefaultargs") StepAP214_AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP214_AppliedExternalIdentificationAssignment;
		 StepAP214_AppliedExternalIdentificationAssignment();

		/****** StepAP214_AppliedExternalIdentificationAssignment::Init ******/
		/****** md5 signature: 48dec34ca03db27c3bebc3eee6a16469 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aIdentificationAssignment_AssignedId: TCollection_HAsciiString
aIdentificationAssignment_Role: StepBasic_IdentificationRole
aExternalIdentificationAssignment_Source: StepBasic_ExternalSource
aItems: NCollection_HArray1<StepAP214_ExternalIdentificationItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aIdentificationAssignment_AssignedId, const opencascade::handle<StepBasic_IdentificationRole> & aIdentificationAssignment_Role, const opencascade::handle<StepBasic_ExternalSource> & aExternalIdentificationAssignment_Source, const opencascade::handle<NCollection_HArray1<StepAP214_ExternalIdentificationItem> > & aItems);

		/****** StepAP214_AppliedExternalIdentificationAssignment::Items ******/
		/****** md5 signature: f608c370837ae7b2a6a951a7dd71e5b7 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_ExternalIdentificationItem>>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_ExternalIdentificationItem>> Items();

		/****** StepAP214_AppliedExternalIdentificationAssignment::SetItems ******/
		/****** md5 signature: a2da71501b58ab72313fb1643d964436 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: NCollection_HArray1<StepAP214_ExternalIdentificationItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_ExternalIdentificationItem> > & Items);

};


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
		/****** StepAP214_AppliedGroupAssignment::StepAP214_AppliedGroupAssignment ******/
		/****** md5 signature: 10ad6e7e7c90af9104e79de30abc4d40 ******/
		%feature("compactdefaultargs") StepAP214_AppliedGroupAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP214_AppliedGroupAssignment;
		 StepAP214_AppliedGroupAssignment();

		/****** StepAP214_AppliedGroupAssignment::Init ******/
		/****** md5 signature: 23091f2a407b7dd35c5d0a63c08c1abf ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aGroupAssignment_AssignedGroup: StepBasic_Group
aItems: NCollection_HArray1<StepAP214_GroupItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Group> & aGroupAssignment_AssignedGroup, const opencascade::handle<NCollection_HArray1<StepAP214_GroupItem> > & aItems);

		/****** StepAP214_AppliedGroupAssignment::Items ******/
		/****** md5 signature: 44cc91f1aa41c135da0b45c8dc94f8da ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_GroupItem>>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_GroupItem>> Items();

		/****** StepAP214_AppliedGroupAssignment::SetItems ******/
		/****** md5 signature: 08356aa35e517423217d62fdd57e1fa7 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: NCollection_HArray1<StepAP214_GroupItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_GroupItem> > & Items);

};


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
		/****** StepAP214_AppliedOrganizationAssignment::StepAP214_AppliedOrganizationAssignment ******/
		/****** md5 signature: 3651e244824442328ae5941af66addc9 ******/
		%feature("compactdefaultargs") StepAP214_AppliedOrganizationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AppliedOrganizationAssignment.
") StepAP214_AppliedOrganizationAssignment;
		 StepAP214_AppliedOrganizationAssignment();

		/****** StepAP214_AppliedOrganizationAssignment::Init ******/
		/****** md5 signature: 2230e6cdc398c11edd3ae2968f9c7cce ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedOrganization: StepBasic_Organization
aRole: StepBasic_OrganizationRole
aItems: NCollection_HArray1<StepAP214_OrganizationItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization, const opencascade::handle<StepBasic_OrganizationRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_OrganizationItem> > & aItems);

		/****** StepAP214_AppliedOrganizationAssignment::Items ******/
		/****** md5 signature: d551f2dcb0b6740b786c720335c9d8ca ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_OrganizationItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_OrganizationItem>> Items();

		/****** StepAP214_AppliedOrganizationAssignment::ItemsValue ******/
		/****** md5 signature: 5446d8ce2781268c38343831487e85d6 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_OrganizationItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_OrganizationItem ItemsValue(const int num);

		/****** StepAP214_AppliedOrganizationAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedOrganizationAssignment::SetItems ******/
		/****** md5 signature: bb32ddabe6349cb07f1a9a3860035f6c ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_OrganizationItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_OrganizationItem> > & aItems);

};


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
		/****** StepAP214_AppliedPersonAndOrganizationAssignment::StepAP214_AppliedPersonAndOrganizationAssignment ******/
		/****** md5 signature: c6a0e8ff5a9f12a6706a00f471d2dacb ******/
		%feature("compactdefaultargs") StepAP214_AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignDateAndPersonAssignment.
") StepAP214_AppliedPersonAndOrganizationAssignment;
		 StepAP214_AppliedPersonAndOrganizationAssignment();

		/****** StepAP214_AppliedPersonAndOrganizationAssignment::Init ******/
		/****** md5 signature: a33d11a91d58323bfffa1ccb929ddfa4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole
aItems: NCollection_HArray1<StepAP214_PersonAndOrganizationItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_PersonAndOrganizationItem> > & aItems);

		/****** StepAP214_AppliedPersonAndOrganizationAssignment::Items ******/
		/****** md5 signature: e9045ae5604ec816540b6e959b064ae3 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_PersonAndOrganizationItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_PersonAndOrganizationItem>> Items();

		/****** StepAP214_AppliedPersonAndOrganizationAssignment::ItemsValue ******/
		/****** md5 signature: 0258b5f0c4c9d9d1ee186e57fb9d63ad ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_PersonAndOrganizationItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_PersonAndOrganizationItem ItemsValue(const int num);

		/****** StepAP214_AppliedPersonAndOrganizationAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedPersonAndOrganizationAssignment::SetItems ******/
		/****** md5 signature: 17825ccb27de98389f22146f9d029204 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_PersonAndOrganizationItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_PersonAndOrganizationItem> > & aItems);

};


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
		/****** StepAP214_AppliedPresentedItem::StepAP214_AppliedPresentedItem ******/
		/****** md5 signature: f8153fb852e21f683a8f18324fe4242e ******/
		%feature("compactdefaultargs") StepAP214_AppliedPresentedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignPresentedItem.
") StepAP214_AppliedPresentedItem;
		 StepAP214_AppliedPresentedItem();

		/****** StepAP214_AppliedPresentedItem::Init ******/
		/****** md5 signature: 49df6792d47b11947ab753c68cd34b37 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_PresentedItemSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<NCollection_HArray1<StepAP214_PresentedItemSelect> > & aItems);

		/****** StepAP214_AppliedPresentedItem::Items ******/
		/****** md5 signature: 1c214980aee476aa684daf252f952f21 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_PresentedItemSelect>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_PresentedItemSelect>> Items();

		/****** StepAP214_AppliedPresentedItem::ItemsValue ******/
		/****** md5 signature: a957b70479a57c592285aacd635e11c5 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_PresentedItemSelect

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_PresentedItemSelect ItemsValue(const int num);

		/****** StepAP214_AppliedPresentedItem::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedPresentedItem::SetItems ******/
		/****** md5 signature: cfc6f671c7a0c9cd675428c0765fd384 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_PresentedItemSelect

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_PresentedItemSelect> > & aItems);

};


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
		/****** StepAP214_AppliedSecurityClassificationAssignment::StepAP214_AppliedSecurityClassificationAssignment ******/
		/****** md5 signature: d96a4ccf82855776ce1db8f80bdccdf0 ******/
		%feature("compactdefaultargs") StepAP214_AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AppliedSecurityClassificationAssignment.
") StepAP214_AppliedSecurityClassificationAssignment;
		 StepAP214_AppliedSecurityClassificationAssignment();

		/****** StepAP214_AppliedSecurityClassificationAssignment::Init ******/
		/****** md5 signature: a3fef0616003519d9492e72ba368be39 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification
aItems: NCollection_HArray1<StepAP214_SecurityClassificationItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification, const opencascade::handle<NCollection_HArray1<StepAP214_SecurityClassificationItem> > & aItems);

		/****** StepAP214_AppliedSecurityClassificationAssignment::Items ******/
		/****** md5 signature: ea09725d8942a694d1407e989aef9567 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_SecurityClassificationItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_SecurityClassificationItem>> Items();

		/****** StepAP214_AppliedSecurityClassificationAssignment::ItemsValue ******/
		/****** md5 signature: 2608293d193da5a5163d34b04b63c3a2 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_SecurityClassificationItem

Description
-----------
No available documentation.
") ItemsValue;
		const StepAP214_SecurityClassificationItem & ItemsValue(const int num);

		/****** StepAP214_AppliedSecurityClassificationAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AppliedSecurityClassificationAssignment::SetItems ******/
		/****** md5 signature: 5a9acada2778a4a9fdef80201daf2271 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_SecurityClassificationItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_SecurityClassificationItem> > & aItems);

};


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
		/****** StepAP214_ApprovalItem::StepAP214_ApprovalItem ******/
		/****** md5 signature: 48bbf3c28b6a2e57759b28e4c404019b ******/
		%feature("compactdefaultargs") StepAP214_ApprovalItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApprovalItem SelectType.
") StepAP214_ApprovalItem;
		 StepAP214_ApprovalItem();

		/****** StepAP214_ApprovalItem::AssemblyComponentUsageSubstitute ******/
		/****** md5 signature: b91da6c8966920c354d789c8c32413b4 ******/
		%feature("compactdefaultargs") AssemblyComponentUsageSubstitute;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute>

Description
-----------
returns Value as a AssemblyComponentUsageSubstitute (Null if another type).
") AssemblyComponentUsageSubstitute;
		virtual opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> AssemblyComponentUsageSubstitute();

		/****** StepAP214_ApprovalItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a ApprovalItem Kind Entity that is: 1 -> AssemblyComponentUsageSubstitute 2 -> DocumentFile 3 -> MaterialDesignation 4 -> MechanicalDesignGeometricPresentationRepresentation 5 -> PresentationArea 6 -> Product 7 -> ProductDefinition 8 -> ProductDefinitionFormation 9 -> ProductDefinitionRelationship 10 -> PropertyDefinition 11 -> ShapeRepresentation 12 -> SecurityClassification 13 -> ConfigurationItem 14 -> Date 15 -> Document 16 -> Effectivity 17 -> Group 18 -> GroupRelationship 19 -> ProductDefinitionFormationRelationship 20 -> Representation 21 -> ShapeAspectRelationship 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_ApprovalItem::ConfigurationItem ******/
		/****** md5 signature: fb35f69c958d26e1d529f63318b20dca ******/
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationItem>

Description
-----------
returns Value as a ConfigurationItem (Null if another type).
") ConfigurationItem;
		virtual opencascade::handle<StepRepr_ConfigurationItem> ConfigurationItem();

		/****** StepAP214_ApprovalItem::Date ******/
		/****** md5 signature: 89ee3f386e812721943f0a13bd29296a ******/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Date>

Description
-----------
returns Value as a Date (Null if another type).
") Date;
		virtual opencascade::handle<StepBasic_Date> Date();

		/****** StepAP214_ApprovalItem::Document ******/
		/****** md5 signature: 80c66c540499ddaca711967e7b9a5473 ******/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
returns Value as a Document (Null if another type).
") Document;
		virtual opencascade::handle<StepBasic_Document> Document();

		/****** StepAP214_ApprovalItem::DocumentFile ******/
		/****** md5 signature: 87c956071ba81d24e588b8c45e2844da ******/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DocumentFile>

Description
-----------
returns Value as a DocumentFile (Null if another type).
") DocumentFile;
		virtual opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****** StepAP214_ApprovalItem::Effectivity ******/
		/****** md5 signature: d789edf656ded83e5a00f3b78fc65bb3 ******/
		%feature("compactdefaultargs") Effectivity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Effectivity>

Description
-----------
returns Value as a Effectivity (Null if another type).
") Effectivity;
		virtual opencascade::handle<StepBasic_Effectivity> Effectivity();

		/****** StepAP214_ApprovalItem::Group ******/
		/****** md5 signature: 450c647ed5ee945e509721f4cac7b4d4 ******/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Group>

Description
-----------
returns Value as a Group (Null if another type).
") Group;
		virtual opencascade::handle<StepBasic_Group> Group();

		/****** StepAP214_ApprovalItem::GroupRelationship ******/
		/****** md5 signature: e96924329e7182112336a8edc68173d8 ******/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GroupRelationship>

Description
-----------
returns Value as a GroupRelationship (Null if another type).
") GroupRelationship;
		virtual opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****** StepAP214_ApprovalItem::MaterialDesignation ******/
		/****** md5 signature: 6e30acaff4de27c4b231a9e5d646b478 ******/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MaterialDesignation>

Description
-----------
returns Value as a MaterialDesignation (Null if another type).
") MaterialDesignation;
		virtual opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****** StepAP214_ApprovalItem::MechanicalDesignGeometricPresentationRepresentation ******/
		/****** md5 signature: d3c9337b79febcc3a7f4653a7f372f73 ******/
		%feature("compactdefaultargs") MechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation>

Description
-----------
returns Value as a MechanicalDesignGeometricPresentationRepresentation (Null if another type).
") MechanicalDesignGeometricPresentationRepresentation;
		virtual opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> MechanicalDesignGeometricPresentationRepresentation();

		/****** StepAP214_ApprovalItem::PresentationArea ******/
		/****** md5 signature: 30b799f1543eef9325725dd5c80af64a ******/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationArea>

Description
-----------
returns Value as a PresentationArea (Null if another type).
") PresentationArea;
		virtual opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****** StepAP214_ApprovalItem::Product ******/
		/****** md5 signature: 1f27bc54cc353af90f03ae9eca5730be ******/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Product>

Description
-----------
returns Value as a Product (Null if another type).
") Product;
		virtual opencascade::handle<StepBasic_Product> Product();

		/****** StepAP214_ApprovalItem::ProductDefinition ******/
		/****** md5 signature: c87a2e2c18abbb8dba7578354cb60082 ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
returns Value as a ProductDefinition (Null if another type).
") ProductDefinition;
		virtual opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_ApprovalItem::ProductDefinitionFormation ******/
		/****** md5 signature: 507fa3da9e81b3c4e23dcc57a6272df1 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
returns Value as a ProductDefinitionFormation (Null if another type).
") ProductDefinitionFormation;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****** StepAP214_ApprovalItem::ProductDefinitionFormationRelationship ******/
		/****** md5 signature: 2597252cdc3a366a290516c767740bd1 ******/
		%feature("compactdefaultargs") ProductDefinitionFormationRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormationRelationship>

Description
-----------
returns Value as a ProductDefinitionFormationRelationship (Null if another type).
") ProductDefinitionFormationRelationship;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> ProductDefinitionFormationRelationship();

		/****** StepAP214_ApprovalItem::ProductDefinitionRelationship ******/
		/****** md5 signature: 5291be95e802b30e3a6aeb2e7fc274af ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
returns Value as aProductDefinitionRelationship (Null if another type).
") ProductDefinitionRelationship;
		virtual opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepAP214_ApprovalItem::PropertyDefinition ******/
		/****** md5 signature: bf7258abc2cc1f5b1017e077e8f2e158 ******/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
returns Value as a PropertyDefinition (Null if another type).
") PropertyDefinition;
		virtual opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****** StepAP214_ApprovalItem::Representation ******/
		/****** md5 signature: 0e7149a093c46006c551ea78ef408983 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
") Representation;
		virtual opencascade::handle<StepRepr_Representation> Representation();

		/****** StepAP214_ApprovalItem::SecurityClassification ******/
		/****** md5 signature: 0ec28971d3039fc7d493d464f6029061 ******/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassification>

Description
-----------
returns Value as a SecurityClassification (Null if another type).
") SecurityClassification;
		virtual opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****** StepAP214_ApprovalItem::ShapeAspectRelationship ******/
		/****** md5 signature: 0856c8eef765cafdadc90beca549d0b3 ******/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>

Description
-----------
returns Value as a ShapeAspectRelationship (Null if another type).
") ShapeAspectRelationship;
		virtual opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****** StepAP214_ApprovalItem::ShapeRepresentation ******/
		/****** md5 signature: b24886d3686815afb32453db060ce3bf ******/
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
returns Value as a ShapeRepresentation (Null if another type).
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
		/****** StepAP214_AutoDesignActualDateAndTimeAssignment::StepAP214_AutoDesignActualDateAndTimeAssignment ******/
		/****** md5 signature: 705b3bf78fbbb68f0b14fd7d5dcc728e ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignActualDateAndTimeAssignment.
") StepAP214_AutoDesignActualDateAndTimeAssignment;
		 StepAP214_AutoDesignActualDateAndTimeAssignment();

		/****** StepAP214_AutoDesignActualDateAndTimeAssignment::Init ******/
		/****** md5 signature: b86319408d7bb256a23d3de9a4477a9a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole
aItems: NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem> > & aItems);

		/****** StepAP214_AutoDesignActualDateAndTimeAssignment::Items ******/
		/****** md5 signature: 7743d4ce96ea147d5892a8ee67c90375 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem>> Items();

		/****** StepAP214_AutoDesignActualDateAndTimeAssignment::ItemsValue ******/
		/****** md5 signature: dd7ff9b18ba05497bb42cef09ca91d9a ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignDateAndTimeItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignDateAndTimeItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignActualDateAndTimeAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignActualDateAndTimeAssignment::SetItems ******/
		/****** md5 signature: 9c045ad4ffccfda51f27559ad9b9c740 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignActualDateAssignment::StepAP214_AutoDesignActualDateAssignment ******/
		/****** md5 signature: 52ddb197076671c4e83861646d9b2683 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignActualDateAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignActualDateAssignment.
") StepAP214_AutoDesignActualDateAssignment;
		 StepAP214_AutoDesignActualDateAssignment();

		/****** StepAP214_AutoDesignActualDateAssignment::Init ******/
		/****** md5 signature: 18bdb862d27ea129bb1d06276e58772a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole
aItems: NCollection_HArray1<StepAP214_AutoDesignDatedItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem> > & aItems);

		/****** StepAP214_AutoDesignActualDateAssignment::Items ******/
		/****** md5 signature: f6f919a9dad8245c053b96d0d1b46790 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem>> Items();

		/****** StepAP214_AutoDesignActualDateAssignment::ItemsValue ******/
		/****** md5 signature: d84c0eb645ee2435b4c279a7401e3453 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignDatedItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignDatedItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignActualDateAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignActualDateAssignment::SetItems ******/
		/****** md5 signature: d1056d2e851522bffdb017e1b9e4903c ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignDatedItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignApprovalAssignment::StepAP214_AutoDesignApprovalAssignment ******/
		/****** md5 signature: 33a4611a35eabe258b916e0a58a57dcb ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignApprovalAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignApprovalAssignment.
") StepAP214_AutoDesignApprovalAssignment;
		 StepAP214_AutoDesignApprovalAssignment();

		/****** StepAP214_AutoDesignApprovalAssignment::Init ******/
		/****** md5 signature: d428946edb67a67b74d4c511796adcbd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedApproval: StepBasic_Approval
aItems: NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Approval> & aAssignedApproval, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem> > & aItems);

		/****** StepAP214_AutoDesignApprovalAssignment::Items ******/
		/****** md5 signature: 93ea833e1c506d3b2578e6656ccd719f ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem>> Items();

		/****** StepAP214_AutoDesignApprovalAssignment::ItemsValue ******/
		/****** md5 signature: 543656a213ea451fd2a23294ef2c93bd ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignGeneralOrgItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignApprovalAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignApprovalAssignment::SetItems ******/
		/****** md5 signature: 821e7b0e6ac9b948cc1c27d093a6f620 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignDateAndPersonAssignment::StepAP214_AutoDesignDateAndPersonAssignment ******/
		/****** md5 signature: cb865d9256597651dddee9bb17d790bc ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignDateAndPersonAssignment.
") StepAP214_AutoDesignDateAndPersonAssignment;
		 StepAP214_AutoDesignDateAndPersonAssignment();

		/****** StepAP214_AutoDesignDateAndPersonAssignment::Init ******/
		/****** md5 signature: da9460878a2409eb5e5ff3997f7e81ac ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole
aItems: NCollection_HArray1<StepAP214_AutoDesignDateAndPersonItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndPersonItem> > & aItems);

		/****** StepAP214_AutoDesignDateAndPersonAssignment::Items ******/
		/****** md5 signature: ffd2c29dc600b6ec76d02735b0b6c8f2 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndPersonItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndPersonItem>> Items();

		/****** StepAP214_AutoDesignDateAndPersonAssignment::ItemsValue ******/
		/****** md5 signature: 92a8c80f269f75f46b898e1ef7b8b1c9 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignDateAndPersonItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignDateAndPersonItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignDateAndPersonAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignDateAndPersonAssignment::SetItems ******/
		/****** md5 signature: c8cc132e8da7e29c798635fc76fa3e59 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignDateAndPersonItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndPersonItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignDateAndPersonItem::StepAP214_AutoDesignDateAndPersonItem ******/
		/****** md5 signature: 0a007aa2ed2c625baf51df4f38237fc3 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndPersonItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignDateAndPersonItem SelectType.
") StepAP214_AutoDesignDateAndPersonItem;
		 StepAP214_AutoDesignDateAndPersonItem();

		/****** StepAP214_AutoDesignDateAndPersonItem::AutoDesignDocumentReference ******/
		/****** md5 signature: af73bba2bf72bbf6213d0ecd6c9b22ad ******/
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AutoDesignDocumentReference>

Description
-----------
No available documentation.
") AutoDesignDocumentReference;
		opencascade::handle<StepAP214_AutoDesignDocumentReference> AutoDesignDocumentReference();

		/****** StepAP214_AutoDesignDateAndPersonItem::AutoDesignOrganizationAssignment ******/
		/****** md5 signature: 4ec7d06adb31aa4df0b32cd2cd099cbd ******/
		%feature("compactdefaultargs") AutoDesignOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AutoDesignOrganizationAssignment>

Description
-----------
No available documentation.
") AutoDesignOrganizationAssignment;
		opencascade::handle<StepAP214_AutoDesignOrganizationAssignment> AutoDesignOrganizationAssignment();

		/****** StepAP214_AutoDesignDateAndPersonItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AutoDesignDateAndPersonItem Kind Entity that is: 1 AutoDesignOrganizationAssignment from StepAP214, 2 Product from StepBasic, 3 ProductDefinition from StepBasic, 4 ProductDefinitionFormation from StepBasic, 5 Representation from StepRepr, 6 AutoDesignDocumentReference from StepAP214, 7 ExternallyDefinedRepresentation from StepRepr, 8 ProductDefinitionRelationship from StepBasic, 9 ProductDefinitionWithAssociatedDocuments from StepBasic 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignDateAndPersonItem::ExternallyDefinedRepresentation ******/
		/****** md5 signature: 1ab41939bb532a4d66438d45db18a668 ******/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>

Description
-----------
No available documentation.
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****** StepAP214_AutoDesignDateAndPersonItem::Product ******/
		/****** md5 signature: e8c7e89afa6b95e852c44498904e61e4 ******/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Product>

Description
-----------
No available documentation.
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****** StepAP214_AutoDesignDateAndPersonItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
No available documentation.
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_AutoDesignDateAndPersonItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
No available documentation.
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****** StepAP214_AutoDesignDateAndPersonItem::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
No available documentation.
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepAP214_AutoDesignDateAndPersonItem::ProductDefinitionWithAssociatedDocuments ******/
		/****** md5 signature: 71eccc7fba12ed1a0472e41be6b337f4 ******/
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments>

Description
-----------
No available documentation.
") ProductDefinitionWithAssociatedDocuments;
		opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> ProductDefinitionWithAssociatedDocuments();

		/****** StepAP214_AutoDesignDateAndPersonItem::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
No available documentation.
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
		/****** StepAP214_AutoDesignDateAndTimeItem::StepAP214_AutoDesignDateAndTimeItem ******/
		/****** md5 signature: 533c0543a89d7c681622120c5a47763f ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignDateAndTimeItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignDateAndTimeItem SelectType.
") StepAP214_AutoDesignDateAndTimeItem;
		 StepAP214_AutoDesignDateAndTimeItem();

		/****** StepAP214_AutoDesignDateAndTimeItem::ApprovalPersonOrganization ******/
		/****** md5 signature: af795dc9d70028f3b512bd493ca8a169 ******/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>

Description
-----------
returns Value as a ApprovalPersonOrganization (Null if another type).
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****** StepAP214_AutoDesignDateAndTimeItem::AutoDesignDateAndPersonAssignment ******/
		/****** md5 signature: e78caeb846efacf7799186adc28cedc2 ******/
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment>

Description
-----------
returns Value as a AutoDesignDateAndPersonAssignment (Null if another type).
") AutoDesignDateAndPersonAssignment;
		opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> AutoDesignDateAndPersonAssignment();

		/****** StepAP214_AutoDesignDateAndTimeItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AutoDesignDateAndTimeItem Kind Entity that is: 1 -> ApprovalPersonOrganization 2 -> AutoDesignDateAndPersonAssignment 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignDateAndTimeItem::ProductDefinitionEffectivity ******/
		/****** md5 signature: f7c75ca0cc1884f366a5ab6b27ed0916 ******/
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionEffectivity>

Description
-----------
No available documentation.
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
		/****** StepAP214_AutoDesignDatedItem::StepAP214_AutoDesignDatedItem ******/
		/****** md5 signature: 81b06cf503b69a90c19b50668649a7ab ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignDatedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignDatedItem SelectType.
") StepAP214_AutoDesignDatedItem;
		 StepAP214_AutoDesignDatedItem();

		/****** StepAP214_AutoDesignDatedItem::ApprovalPersonOrganization ******/
		/****** md5 signature: af795dc9d70028f3b512bd493ca8a169 ******/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>

Description
-----------
returns Value as a ApprovalPersonOrganization (Null if another type).
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****** StepAP214_AutoDesignDatedItem::AutoDesignDateAndPersonAssignment ******/
		/****** md5 signature: e78caeb846efacf7799186adc28cedc2 ******/
		%feature("compactdefaultargs") AutoDesignDateAndPersonAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment>

Description
-----------
returns Value as a AutoDesignDateAndPersonAssignment (Null if another type).
") AutoDesignDateAndPersonAssignment;
		opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> AutoDesignDateAndPersonAssignment();

		/****** StepAP214_AutoDesignDatedItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AutoDesignDatedItem Kind Entity that is: 1 -> ApprovalPersonOrganization 2 -> AutoDesignDateAndPersonAssignment 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignDatedItem::ProductDefinitionEffectivity ******/
		/****** md5 signature: f7c75ca0cc1884f366a5ab6b27ed0916 ******/
		%feature("compactdefaultargs") ProductDefinitionEffectivity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionEffectivity>

Description
-----------
returns Value as a ProductDefinitionEffectivity.
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
		/****** StepAP214_AutoDesignDocumentReference::StepAP214_AutoDesignDocumentReference ******/
		/****** md5 signature: 3d6020f3baee2f42c3bd05b6cd47c7ae ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignDocumentReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepAP214_AutoDesignDocumentReference;
		 StepAP214_AutoDesignDocumentReference();

		/****** StepAP214_AutoDesignDocumentReference::Init ******/
		/****** md5 signature: a6ac15fb04401127788e24399307fedd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDocument: StepBasic_Document
aSource: TCollection_HAsciiString
aItems: NCollection_HArray1<StepAP214_AutoDesignReferencingItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Document> & aAssignedDocument, const opencascade::handle<TCollection_HAsciiString> & aSource, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignReferencingItem> > & aItems);

		/****** StepAP214_AutoDesignDocumentReference::Items ******/
		/****** md5 signature: 21a08bc20b97820586d95d77073d3b94 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignReferencingItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignReferencingItem>> Items();

		/****** StepAP214_AutoDesignDocumentReference::ItemsValue ******/
		/****** md5 signature: 8ce83bac6ed1763509dc641116eb90a5 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignReferencingItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignReferencingItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignDocumentReference::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignDocumentReference::SetItems ******/
		/****** md5 signature: b58130ad473f66d51d324ea165688993 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignReferencingItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignReferencingItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignGeneralOrgItem::StepAP214_AutoDesignGeneralOrgItem ******/
		/****** md5 signature: 95eb7ebca7d2092830698a38ac57f893 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignGeneralOrgItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignGeneralOrgItem SelectType.
") StepAP214_AutoDesignGeneralOrgItem;
		 StepAP214_AutoDesignGeneralOrgItem();

		/****** StepAP214_AutoDesignGeneralOrgItem::AutoDesignDocumentReference ******/
		/****** md5 signature: af73bba2bf72bbf6213d0ecd6c9b22ad ******/
		%feature("compactdefaultargs") AutoDesignDocumentReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AutoDesignDocumentReference>

Description
-----------
No available documentation.
") AutoDesignDocumentReference;
		opencascade::handle<StepAP214_AutoDesignDocumentReference> AutoDesignDocumentReference();

		/****** StepAP214_AutoDesignGeneralOrgItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AutoDesignGeneralOrgItem Kind Entity that is: 1 Product from StepBasic, 2 ProductDefinition from StepBasic, 3 ProductDefinitionFormation from StepBasic, 4 ProductDefinitionRelationship from StepBasic, 5 ProductDefinitionWithAssociatedDocuments from StepBasic, 6 Representation from StepRepr 7 ExternallyDefinedRepresentation from StepRepr, 8 AutoDesignDocumentReference from StepAP214, 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignGeneralOrgItem::ExternallyDefinedRepresentation ******/
		/****** md5 signature: 1ab41939bb532a4d66438d45db18a668 ******/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>

Description
-----------
returns Value as a Representation (Null if another type).
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****** StepAP214_AutoDesignGeneralOrgItem::Product ******/
		/****** md5 signature: e8c7e89afa6b95e852c44498904e61e4 ******/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Product>

Description
-----------
returns Value as a Product (Null if another type).
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****** StepAP214_AutoDesignGeneralOrgItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
returns Value as a ProductDefinition (Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_AutoDesignGeneralOrgItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
returns Value as a ProductDefinitionFormation (Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****** StepAP214_AutoDesignGeneralOrgItem::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
returns Value as a ProductDefinitionRelationship (Null if another type).
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepAP214_AutoDesignGeneralOrgItem::ProductDefinitionWithAssociatedDocuments ******/
		/****** md5 signature: 71eccc7fba12ed1a0472e41be6b337f4 ******/
		%feature("compactdefaultargs") ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments>

Description
-----------
returns Value as a ProductDefinitionWithAssociatedDocuments (Null if another type).
") ProductDefinitionWithAssociatedDocuments;
		opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> ProductDefinitionWithAssociatedDocuments();

		/****** StepAP214_AutoDesignGeneralOrgItem::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
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
		/****** StepAP214_AutoDesignGroupAssignment::StepAP214_AutoDesignGroupAssignment ******/
		/****** md5 signature: 6319f23b6bfffc8912c7b0ae95d32fa4 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignGroupAssignment.
") StepAP214_AutoDesignGroupAssignment;
		 StepAP214_AutoDesignGroupAssignment();

		/****** StepAP214_AutoDesignGroupAssignment::Init ******/
		/****** md5 signature: 8f623501a3c18e075045a7b3f4aa5de8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedGroup: StepBasic_Group
aItems: NCollection_HArray1<StepAP214_AutoDesignGroupedItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Group> & aAssignedGroup, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGroupedItem> > & aItems);

		/****** StepAP214_AutoDesignGroupAssignment::Items ******/
		/****** md5 signature: 0062c194106be9560af4b65f3d09a72e ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGroupedItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGroupedItem>> Items();

		/****** StepAP214_AutoDesignGroupAssignment::ItemsValue ******/
		/****** md5 signature: 68e2d08202bb298ac155824fd1a89811 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignGroupedItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignGroupedItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignGroupAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignGroupAssignment::SetItems ******/
		/****** md5 signature: a6263b089355f6efb01d95e19df4864f ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignGroupedItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGroupedItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignGroupedItem::StepAP214_AutoDesignGroupedItem ******/
		/****** md5 signature: 50fc634f5b630d30a28397d05f5d9c8f ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignGroupedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignGroupedItem SelectType.
") StepAP214_AutoDesignGroupedItem;
		 StepAP214_AutoDesignGroupedItem();

		/****** StepAP214_AutoDesignGroupedItem::AdvancedBrepShapeRepresentation ******/
		/****** md5 signature: 1550c73ebd1493869c30f677488c3bce ******/
		%feature("compactdefaultargs") AdvancedBrepShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_AdvancedBrepShapeRepresentation>

Description
-----------
returns Value as a AdvancedBrepShapeRepresentation (Null if another type).
") AdvancedBrepShapeRepresentation;
		opencascade::handle<StepShape_AdvancedBrepShapeRepresentation> AdvancedBrepShapeRepresentation();

		/****** StepAP214_AutoDesignGroupedItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AutoDesignGroupedItem Kind Entity that is: 1 -> AdvancedBrepShapeRepresentation 2 -> CsgShapeRepresentation 3 -> FacetedBrepShapeRepresentation 4 -> GeometricallyBoundedSurfaceShapeRepresentation 5 -> GeometricallyBoundedWireframeShapeRepresentation 6 -> ManifoldSurfaceShapeRepresentation 7 -> Representation 8 -> RepresentationItem 9 -> ShapeAspect 10 -> ShapeRepresentation 11 -> TemplateInstance 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignGroupedItem::CsgShapeRepresentation ******/
		/****** md5 signature: 4df917463134e0edfeebc58674424cbd ******/
		%feature("compactdefaultargs") CsgShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_CsgShapeRepresentation>

Description
-----------
returns Value as a CsgShapeRepresentation (Null if another type).
") CsgShapeRepresentation;
		opencascade::handle<StepShape_CsgShapeRepresentation> CsgShapeRepresentation();

		/****** StepAP214_AutoDesignGroupedItem::FacetedBrepShapeRepresentation ******/
		/****** md5 signature: 7d9e29fd7e11f01c8b5c95011f9525c2 ******/
		%feature("compactdefaultargs") FacetedBrepShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_FacetedBrepShapeRepresentation>

Description
-----------
returns Value as a FacetedBrepShapeRepresentation (Null if another type).
") FacetedBrepShapeRepresentation;
		opencascade::handle<StepShape_FacetedBrepShapeRepresentation> FacetedBrepShapeRepresentation();

		/****** StepAP214_AutoDesignGroupedItem::GeometricallyBoundedSurfaceShapeRepresentation ******/
		/****** md5 signature: be6bce576e35d304e94a40d8fbb82473 ******/
		%feature("compactdefaultargs") GeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation>

Description
-----------
returns Value as a GeometricallyBoundedSurfaceShapeRepresentation (Null if another type).
") GeometricallyBoundedSurfaceShapeRepresentation;
		opencascade::handle<StepShape_GeometricallyBoundedSurfaceShapeRepresentation> GeometricallyBoundedSurfaceShapeRepresentation();

		/****** StepAP214_AutoDesignGroupedItem::GeometricallyBoundedWireframeShapeRepresentation ******/
		/****** md5 signature: 7cfc6e8297615e8d757e2d58f0245a2e ******/
		%feature("compactdefaultargs") GeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation>

Description
-----------
returns Value as a GeometricallyBoundedWireframeShapeRepresentation (Null if another type).
") GeometricallyBoundedWireframeShapeRepresentation;
		opencascade::handle<StepShape_GeometricallyBoundedWireframeShapeRepresentation> GeometricallyBoundedWireframeShapeRepresentation();

		/****** StepAP214_AutoDesignGroupedItem::ManifoldSurfaceShapeRepresentation ******/
		/****** md5 signature: b93674233c25de505912e059eb3dec2c ******/
		%feature("compactdefaultargs") ManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation>

Description
-----------
returns Value as a ManifoldSurfaceShapeRepresentation (Null if another type).
") ManifoldSurfaceShapeRepresentation;
		opencascade::handle<StepShape_ManifoldSurfaceShapeRepresentation> ManifoldSurfaceShapeRepresentation();

		/****** StepAP214_AutoDesignGroupedItem::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****** StepAP214_AutoDesignGroupedItem::RepresentationItem ******/
		/****** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ******/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
returns Value as a RepresentationItem (Null if another type).
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****** StepAP214_AutoDesignGroupedItem::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
returns Value as a ShapeAspect (Null if another type).
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****** StepAP214_AutoDesignGroupedItem::ShapeRepresentation ******/
		/****** md5 signature: d74800c9b299687bb55ce91ee61f68d3 ******/
		%feature("compactdefaultargs") ShapeRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
returns Value as a ShapeRepresentation (Null if another type).
") ShapeRepresentation;
		opencascade::handle<StepShape_ShapeRepresentation> ShapeRepresentation();

		/****** StepAP214_AutoDesignGroupedItem::TemplateInstance ******/
		/****** md5 signature: 04841b185558e0fa5261f466fe4819b3 ******/
		%feature("compactdefaultargs") TemplateInstance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TemplateInstance>

Description
-----------
returns Value as a TemplateInstance (Null if another type).
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
		/****** StepAP214_AutoDesignNominalDateAndTimeAssignment::StepAP214_AutoDesignNominalDateAndTimeAssignment ******/
		/****** md5 signature: ddb1268b1dc1a652a5bc76a9cd56c266 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignNominalDateAndTimeAssignment.
") StepAP214_AutoDesignNominalDateAndTimeAssignment;
		 StepAP214_AutoDesignNominalDateAndTimeAssignment();

		/****** StepAP214_AutoDesignNominalDateAndTimeAssignment::Init ******/
		/****** md5 signature: b86319408d7bb256a23d3de9a4477a9a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole
aItems: NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem> > & aItems);

		/****** StepAP214_AutoDesignNominalDateAndTimeAssignment::Items ******/
		/****** md5 signature: 7743d4ce96ea147d5892a8ee67c90375 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem>> Items();

		/****** StepAP214_AutoDesignNominalDateAndTimeAssignment::ItemsValue ******/
		/****** md5 signature: dd7ff9b18ba05497bb42cef09ca91d9a ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignDateAndTimeItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignDateAndTimeItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignNominalDateAndTimeAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignNominalDateAndTimeAssignment::SetItems ******/
		/****** md5 signature: 9c045ad4ffccfda51f27559ad9b9c740 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDateAndTimeItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignNominalDateAssignment::StepAP214_AutoDesignNominalDateAssignment ******/
		/****** md5 signature: c9b91b61d7b60272c7adb4f6fe78cd7c ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignNominalDateAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignNominalDateAssignment.
") StepAP214_AutoDesignNominalDateAssignment;
		 StepAP214_AutoDesignNominalDateAssignment();

		/****** StepAP214_AutoDesignNominalDateAssignment::Init ******/
		/****** md5 signature: 18bdb862d27ea129bb1d06276e58772a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole
aItems: NCollection_HArray1<StepAP214_AutoDesignDatedItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem> > & aItems);

		/****** StepAP214_AutoDesignNominalDateAssignment::Items ******/
		/****** md5 signature: f6f919a9dad8245c053b96d0d1b46790 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem>> Items();

		/****** StepAP214_AutoDesignNominalDateAssignment::ItemsValue ******/
		/****** md5 signature: d84c0eb645ee2435b4c279a7401e3453 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignDatedItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignDatedItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignNominalDateAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignNominalDateAssignment::SetItems ******/
		/****** md5 signature: d1056d2e851522bffdb017e1b9e4903c ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignDatedItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignDatedItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignOrganizationAssignment::StepAP214_AutoDesignOrganizationAssignment ******/
		/****** md5 signature: 0b4d7b3043d844736d21ca73af68e28f ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignOrganizationAssignment.
") StepAP214_AutoDesignOrganizationAssignment;
		 StepAP214_AutoDesignOrganizationAssignment();

		/****** StepAP214_AutoDesignOrganizationAssignment::Init ******/
		/****** md5 signature: 8f0f26d1cb065ee8926d78a34c9f867c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedOrganization: StepBasic_Organization
aRole: StepBasic_OrganizationRole
aItems: NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization, const opencascade::handle<StepBasic_OrganizationRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem> > & aItems);

		/****** StepAP214_AutoDesignOrganizationAssignment::Items ******/
		/****** md5 signature: 93ea833e1c506d3b2578e6656ccd719f ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem>> Items();

		/****** StepAP214_AutoDesignOrganizationAssignment::ItemsValue ******/
		/****** md5 signature: 543656a213ea451fd2a23294ef2c93bd ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignGeneralOrgItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignOrganizationAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignOrganizationAssignment::SetItems ******/
		/****** md5 signature: 821e7b0e6ac9b948cc1c27d093a6f620 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignPersonAndOrganizationAssignment::StepAP214_AutoDesignPersonAndOrganizationAssignment ******/
		/****** md5 signature: 3904a138fea359aae8c0d8cb88d1cf58 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignPersonAndOrganizationAssignment.
") StepAP214_AutoDesignPersonAndOrganizationAssignment;
		 StepAP214_AutoDesignPersonAndOrganizationAssignment();

		/****** StepAP214_AutoDesignPersonAndOrganizationAssignment::Init ******/
		/****** md5 signature: dc175c76668386afda1c5a210a44482b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole
aItems: NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole, const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem> > & aItems);

		/****** StepAP214_AutoDesignPersonAndOrganizationAssignment::Items ******/
		/****** md5 signature: 93ea833e1c506d3b2578e6656ccd719f ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem>> Items();

		/****** StepAP214_AutoDesignPersonAndOrganizationAssignment::ItemsValue ******/
		/****** md5 signature: 543656a213ea451fd2a23294ef2c93bd ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignGeneralOrgItem

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignGeneralOrgItem ItemsValue(const int num);

		/****** StepAP214_AutoDesignPersonAndOrganizationAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignPersonAndOrganizationAssignment::SetItems ******/
		/****** md5 signature: 821e7b0e6ac9b948cc1c27d093a6f620 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignGeneralOrgItem> > & aItems);

};


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
		/****** StepAP214_AutoDesignPresentedItem::StepAP214_AutoDesignPresentedItem ******/
		/****** md5 signature: bf01c683dbdc335da39f6702580976c7 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignPresentedItem.
") StepAP214_AutoDesignPresentedItem;
		 StepAP214_AutoDesignPresentedItem();

		/****** StepAP214_AutoDesignPresentedItem::Init ******/
		/****** md5 signature: 6f206f22e4e5d94d071b08f0c49da07a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignPresentedItemSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignPresentedItemSelect> > & aItems);

		/****** StepAP214_AutoDesignPresentedItem::Items ******/
		/****** md5 signature: af7f9932e709eba62b51eb4891861468 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignPresentedItemSelect>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignPresentedItemSelect>> Items();

		/****** StepAP214_AutoDesignPresentedItem::ItemsValue ******/
		/****** md5 signature: 23e9eaf83a9d05cccaec5f64dcb9ef4f ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepAP214_AutoDesignPresentedItemSelect

Description
-----------
No available documentation.
") ItemsValue;
		StepAP214_AutoDesignPresentedItemSelect ItemsValue(const int num);

		/****** StepAP214_AutoDesignPresentedItem::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignPresentedItem::SetItems ******/
		/****** md5 signature: 32630859b41d67b044ed0418ea87aadd ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<StepAP214_AutoDesignPresentedItemSelect

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepAP214_AutoDesignPresentedItemSelect> > & aItems);

};


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
		/****** StepAP214_AutoDesignPresentedItemSelect::StepAP214_AutoDesignPresentedItemSelect ******/
		/****** md5 signature: 157a3d50cc35c7ad7781f9444d6318e5 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignPresentedItemSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignPresentedItemSelect SelectType.
") StepAP214_AutoDesignPresentedItemSelect;
		 StepAP214_AutoDesignPresentedItemSelect();

		/****** StepAP214_AutoDesignPresentedItemSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AutoDesignPresentedItemSelect Kind Entity that is: 1 -> ProductDefinition, 2 -> ProductDefinitionRelationship, 3 -> ProductDefinitionShape 4 -> RepresentationRelationship 5 -> ShapeAspect 6 -> DocumentRelationship, 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignPresentedItemSelect::DocumentRelationship ******/
		/****** md5 signature: 7ddc0051aa86705aadf8e9b2bf6e535b ******/
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DocumentRelationship>

Description
-----------
returns Value as a DocumentRelationship (Null if another type).
") DocumentRelationship;
		opencascade::handle<StepBasic_DocumentRelationship> DocumentRelationship();

		/****** StepAP214_AutoDesignPresentedItemSelect::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
returns Value as a ProductDefinition (Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_AutoDesignPresentedItemSelect::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
returns Value as a ProductDefinitionRelationship (Null if another type).
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepAP214_AutoDesignPresentedItemSelect::ProductDefinitionShape ******/
		/****** md5 signature: b30663c40bd2822cf899d97bff9d9f32 ******/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductDefinitionShape>

Description
-----------
returns Value as a ProductDefinitionShape (Null if another type).
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****** StepAP214_AutoDesignPresentedItemSelect::RepresentationRelationship ******/
		/****** md5 signature: a447bbc2838d5d40e28b326c82d9c285 ******/
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationRelationship>

Description
-----------
returns Value as a RepresentationRelationship (Null if another type).
") RepresentationRelationship;
		opencascade::handle<StepRepr_RepresentationRelationship> RepresentationRelationship();

		/****** StepAP214_AutoDesignPresentedItemSelect::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
returns Value as a ShapeAspect (Null if another type).
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
		/****** StepAP214_AutoDesignReferencingItem::StepAP214_AutoDesignReferencingItem ******/
		/****** md5 signature: 115ae6c02bbc330331697b6ae885d7bd ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignReferencingItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignReferencingItem SelectType.
") StepAP214_AutoDesignReferencingItem;
		 StepAP214_AutoDesignReferencingItem();

		/****** StepAP214_AutoDesignReferencingItem::Approval ******/
		/****** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ******/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
No available documentation.
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****** StepAP214_AutoDesignReferencingItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AutoDesignReferencingItem Kind Entity that is: 1 Approval from StepBasic, 2 DocumentRelationship from StepBasic, 3 ExternallyDefinedRepresentation from StepRepr, 4 MappedItem from StepRepr, 5 MaterialDesignation from StepRepr, 6 PresentationArea from StepVisual, 7 PresentationView from StepVisual, 8 ProductCategory from StepBasic, 9 ProductDefinition from StepBasic, 10 ProductDefinitionRelationship from StepBasic, 11 PropertyDefinition from StepBasic, 12 Representation from StepRepr, 13 RepresentationRelationship from StepRepr, 14 ShapeAspect from StepRepr 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignReferencingItem::DocumentRelationship ******/
		/****** md5 signature: 7ddc0051aa86705aadf8e9b2bf6e535b ******/
		%feature("compactdefaultargs") DocumentRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DocumentRelationship>

Description
-----------
No available documentation.
") DocumentRelationship;
		opencascade::handle<StepBasic_DocumentRelationship> DocumentRelationship();

		/****** StepAP214_AutoDesignReferencingItem::ExternallyDefinedRepresentation ******/
		/****** md5 signature: 1ab41939bb532a4d66438d45db18a668 ******/
		%feature("compactdefaultargs") ExternallyDefinedRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ExternallyDefinedRepresentation>

Description
-----------
No available documentation.
") ExternallyDefinedRepresentation;
		opencascade::handle<StepRepr_ExternallyDefinedRepresentation> ExternallyDefinedRepresentation();

		/****** StepAP214_AutoDesignReferencingItem::MappedItem ******/
		/****** md5 signature: 7d3cb5566b070a8a554b734d0e71c9a2 ******/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MappedItem>

Description
-----------
No available documentation.
") MappedItem;
		opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****** StepAP214_AutoDesignReferencingItem::MaterialDesignation ******/
		/****** md5 signature: 1af09264d96d4472c50c4a267a065d8a ******/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MaterialDesignation>

Description
-----------
No available documentation.
") MaterialDesignation;
		opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****** StepAP214_AutoDesignReferencingItem::PresentationArea ******/
		/****** md5 signature: 6adf2ef7fa0a7b503035224ca0f9247c ******/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationArea>

Description
-----------
No available documentation.
") PresentationArea;
		opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****** StepAP214_AutoDesignReferencingItem::PresentationView ******/
		/****** md5 signature: f42d5482c64642bbea3f6f415c07a2aa ******/
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationView>

Description
-----------
No available documentation.
") PresentationView;
		opencascade::handle<StepVisual_PresentationView> PresentationView();

		/****** StepAP214_AutoDesignReferencingItem::ProductCategory ******/
		/****** md5 signature: c68a3acfc5b2c48065c10648b3c34e4b ******/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductCategory>

Description
-----------
No available documentation.
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****** StepAP214_AutoDesignReferencingItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
No available documentation.
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_AutoDesignReferencingItem::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
No available documentation.
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepAP214_AutoDesignReferencingItem::PropertyDefinition ******/
		/****** md5 signature: 4b7b4910929a0e1832918f8266d39349 ******/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
No available documentation.
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****** StepAP214_AutoDesignReferencingItem::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
No available documentation.
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****** StepAP214_AutoDesignReferencingItem::RepresentationRelationship ******/
		/****** md5 signature: a447bbc2838d5d40e28b326c82d9c285 ******/
		%feature("compactdefaultargs") RepresentationRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationRelationship>

Description
-----------
No available documentation.
") RepresentationRelationship;
		opencascade::handle<StepRepr_RepresentationRelationship> RepresentationRelationship();

		/****** StepAP214_AutoDesignReferencingItem::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
No available documentation.
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
		/****** StepAP214_AutoDesignSecurityClassificationAssignment::StepAP214_AutoDesignSecurityClassificationAssignment ******/
		/****** md5 signature: bca19617be72a5cea03aebe3c1dd6579 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AutoDesignSecurityClassificationAssignment.
") StepAP214_AutoDesignSecurityClassificationAssignment;
		 StepAP214_AutoDesignSecurityClassificationAssignment();

		/****** StepAP214_AutoDesignSecurityClassificationAssignment::Init ******/
		/****** md5 signature: 9d5872892ba100ab8766bca2d8941df2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification
aItems: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_Approval> > > & aItems);

		/****** StepAP214_AutoDesignSecurityClassificationAssignment::Items ******/
		/****** md5 signature: 8c6fdb2735c0914e1c3f277a06002835 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_Approval>>>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_Approval>>> Items();

		/****** StepAP214_AutoDesignSecurityClassificationAssignment::ItemsValue ******/
		/****** md5 signature: 891a026280b067d8a1207a6aa683a07a ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
No available documentation.
") ItemsValue;
		opencascade::handle<StepBasic_Approval> ItemsValue(const int num);

		/****** StepAP214_AutoDesignSecurityClassificationAssignment::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		int NbItems();

		/****** StepAP214_AutoDesignSecurityClassificationAssignment::SetItems ******/
		/****** md5 signature: 58dab358f48188f1ccbc214136b87491 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_Approval> > > & aItems);

};


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
		/****** StepAP214_Class::StepAP214_Class ******/
		/****** md5 signature: 617249d7d67baa7cd5d38d2c54c88b81 ******/
		%feature("compactdefaultargs") StepAP214_Class;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP214_Class;
		 StepAP214_Class();

};


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
		/****** StepAP214_DocumentReferenceItem::StepAP214_DocumentReferenceItem ******/
		/****** md5 signature: f2ff3959433e771bbbd46f9d50171407 ******/
		%feature("compactdefaultargs") StepAP214_DocumentReferenceItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DocumentReferenceItem SelectType.
") StepAP214_DocumentReferenceItem;
		 StepAP214_DocumentReferenceItem();

		/****** StepAP214_DocumentReferenceItem::AppliedExternalIdentificationAssignment ******/
		/****** md5 signature: c1e1ee7fb84978d2ab998a39c57f9501 ******/
		%feature("compactdefaultargs") AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment>

Description
-----------
returns Value as a AppliedExternalIdentificationAssignment (Null if another type).
") AppliedExternalIdentificationAssignment;
		opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> AppliedExternalIdentificationAssignment();

		/****** StepAP214_DocumentReferenceItem::Approval ******/
		/****** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ******/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
returns Value as a Approval (Null if another type).
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****** StepAP214_DocumentReferenceItem::AssemblyComponentUsage ******/
		/****** md5 signature: 9bdb67c5d71ecf8f82c68cc59b16ef47 ******/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>

Description
-----------
returns Value as a AssemblyComponentUsage (Null if another type).
") AssemblyComponentUsage;
		opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage();

		/****** StepAP214_DocumentReferenceItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a DocumentReferenceItem Kind Entity that is :.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_DocumentReferenceItem::CharacterizedObject ******/
		/****** md5 signature: e518475515030a2f9db7a2227e2fe8f9 ******/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_CharacterizedObject>

Description
-----------
returns Value as a CharacterizedObject (Null if another type).
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****** StepAP214_DocumentReferenceItem::DescriptiveRepresentationItem ******/
		/****** md5 signature: 4b416f021b07f6695ff165a1f2e8b731 ******/
		%feature("compactdefaultargs") DescriptiveRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_DescriptiveRepresentationItem>

Description
-----------
returns Value as a (Null if another type).
") DescriptiveRepresentationItem;
		opencascade::handle<StepRepr_DescriptiveRepresentationItem> DescriptiveRepresentationItem();

		/****** StepAP214_DocumentReferenceItem::DimensionalSize ******/
		/****** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ******/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_DimensionalSize>

Description
-----------
returns Value as a DimensionalSize (Null if another type).
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****** StepAP214_DocumentReferenceItem::ExternallyDefinedItem ******/
		/****** md5 signature: 99145de38951f9b9e301478cf44f094a ******/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>

Description
-----------
returns Value as a ExternallyDefinedItem (Null if another type).
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****** StepAP214_DocumentReferenceItem::Group ******/
		/****** md5 signature: 58a65f6494d2bc516fda4ce1650fbefd ******/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Group>

Description
-----------
returns Value as a Group (Null if another type).
") Group;
		opencascade::handle<StepBasic_Group> Group();

		/****** StepAP214_DocumentReferenceItem::GroupRelationship ******/
		/****** md5 signature: dbc6e67af278d1cc4875fb414ca2ed75 ******/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GroupRelationship>

Description
-----------
returns Value as a GroupRelationship (Null if another type).
") GroupRelationship;
		opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****** StepAP214_DocumentReferenceItem::MaterialDesignation ******/
		/****** md5 signature: 1af09264d96d4472c50c4a267a065d8a ******/
		%feature("compactdefaultargs") MaterialDesignation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MaterialDesignation>

Description
-----------
returns Value as a MaterialDesignation (Null if another type).
") MaterialDesignation;
		opencascade::handle<StepRepr_MaterialDesignation> MaterialDesignation();

		/****** StepAP214_DocumentReferenceItem::MeasureRepresentationItem ******/
		/****** md5 signature: 935340871b120d19ae40bf488305af88 ******/
		%feature("compactdefaultargs") MeasureRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MeasureRepresentationItem>

Description
-----------
returns Value as a MeasureRepresentationItem (Null if another type).
") MeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> MeasureRepresentationItem();

		/****** StepAP214_DocumentReferenceItem::ProductCategory ******/
		/****** md5 signature: c68a3acfc5b2c48065c10648b3c34e4b ******/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductCategory>

Description
-----------
returns Value as a ProductCategory (Null if another type).
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****** StepAP214_DocumentReferenceItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
returns Value as a ProductDefinition (Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_DocumentReferenceItem::ProductDefinitionContext ******/
		/****** md5 signature: bac3c5d5988cf625670a11dcc71c6a27 ******/
		%feature("compactdefaultargs") ProductDefinitionContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionContext>

Description
-----------
returns Value as a ProductDefinitionContext (Null if another type).
") ProductDefinitionContext;
		opencascade::handle<StepBasic_ProductDefinitionContext> ProductDefinitionContext();

		/****** StepAP214_DocumentReferenceItem::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
returns Value as aProductDefinitionRelationship (Null if another type).
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepAP214_DocumentReferenceItem::PropertyDefinition ******/
		/****** md5 signature: 4b7b4910929a0e1832918f8266d39349 ******/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
returns Value as a PropertyDefinition (Null if another type).
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****** StepAP214_DocumentReferenceItem::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****** StepAP214_DocumentReferenceItem::RepresentationItem ******/
		/****** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ******/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
returns Value as a RepresentationItem (Null if another type).
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****** StepAP214_DocumentReferenceItem::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
returns Value as a ShapeAspect (Null if another type).
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****** StepAP214_DocumentReferenceItem::ShapeAspectRelationship ******/
		/****** md5 signature: 35bed4b7262e5cb161ba72768027d32c ******/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>

Description
-----------
returns Value as a ShapeAspectRelationship (Null if another type).
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
		/****** StepAP214_ExternalIdentificationItem::StepAP214_ExternalIdentificationItem ******/
		/****** md5 signature: 48154afee632f67b3037e1e9c786ec60 ******/
		%feature("compactdefaultargs") StepAP214_ExternalIdentificationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP214_ExternalIdentificationItem;
		 StepAP214_ExternalIdentificationItem();

		/****** StepAP214_ExternalIdentificationItem::AppliedOrganizationAssignment ******/
		/****** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ******/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>

Description
-----------
Returns Value as AppliedOrganizationAssignment (or Null if another type).
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****** StepAP214_ExternalIdentificationItem::AppliedPersonAndOrganizationAssignment ******/
		/****** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ******/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>

Description
-----------
Returns Value as AppliedPersonAndOrganizationAssignment (or Null if another type).
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****** StepAP214_ExternalIdentificationItem::Approval ******/
		/****** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ******/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
Returns Value as Approval (or Null if another type).
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****** StepAP214_ExternalIdentificationItem::ApprovalStatus ******/
		/****** md5 signature: c9de9a40d619ec96562f8dda0f0fd363 ******/
		%feature("compactdefaultargs") ApprovalStatus;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalStatus>

Description
-----------
Returns Value as ApprovalStatus (or Null if another type).
") ApprovalStatus;
		opencascade::handle<StepBasic_ApprovalStatus> ApprovalStatus();

		/****** StepAP214_ExternalIdentificationItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of ExternalIdentificationItem select type 1 -> DocumentFile from StepBasic 2 -> ExternallyDefinedClass from StepAP214 3 -> ExternallyDefinedGeneralProperty from StepAP214 4 -> ProductDefinition from StepBasic 5 -> AppliedOrganizationAssignment from AP214 6 -> AppliedPersonAndOrganizationAssignment from AP214 7 -> Approval from StepBasic 8 -> ApprovalStatus from StepBasic 9 -> ExternalSource from StepBasic 10 -> OrganizationalAddress from StepBasic 11 -> SecurityClassification from StepBasic 12 -> TrimmedCurve from StepGeom 13 -> VersionedActionRequest from StepBasic 14 -> DateAndTimeAssignment from StepBasic 15 -> DateAssignment from StepBasic 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_ExternalIdentificationItem::DateAndTimeAssignment ******/
		/****** md5 signature: d8649d2faa6844e0e520dcb63fafd706 ******/
		%feature("compactdefaultargs") DateAndTimeAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateAndTimeAssignment>

Description
-----------
Returns Value as DateAndTimeAssignment (or Null if another type).
") DateAndTimeAssignment;
		opencascade::handle<StepBasic_DateAndTimeAssignment> DateAndTimeAssignment();

		/****** StepAP214_ExternalIdentificationItem::DateAssignment ******/
		/****** md5 signature: 72439af527fd547213434de4879a3712 ******/
		%feature("compactdefaultargs") DateAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateAssignment>

Description
-----------
Returns Value as DateAssignment (or Null if another type).
") DateAssignment;
		opencascade::handle<StepBasic_DateAssignment> DateAssignment();

		/****** StepAP214_ExternalIdentificationItem::DocumentFile ******/
		/****** md5 signature: bcd917452eb81042c78b397f1e6fd78b ******/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DocumentFile>

Description
-----------
Returns Value as DocumentFile (or Null if another type).
") DocumentFile;
		opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****** StepAP214_ExternalIdentificationItem::ExternalSource ******/
		/****** md5 signature: cee20c433c0258dd79dc65e91e8e3bcb ******/
		%feature("compactdefaultargs") ExternalSource;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternalSource>

Description
-----------
Returns Value as ExternalSource (or Null if another type).
") ExternalSource;
		opencascade::handle<StepBasic_ExternalSource> ExternalSource();

		/****** StepAP214_ExternalIdentificationItem::ExternallyDefinedClass ******/
		/****** md5 signature: b21aa642191707ab3d72a978d0c1c007 ******/
		%feature("compactdefaultargs") ExternallyDefinedClass;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_ExternallyDefinedClass>

Description
-----------
Returns Value as ExternallyDefinedClass (or Null if another type).
") ExternallyDefinedClass;
		opencascade::handle<StepAP214_ExternallyDefinedClass> ExternallyDefinedClass();

		/****** StepAP214_ExternalIdentificationItem::ExternallyDefinedGeneralProperty ******/
		/****** md5 signature: e58aed6b556e17d44ed0bbcee768cfb9 ******/
		%feature("compactdefaultargs") ExternallyDefinedGeneralProperty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty>

Description
-----------
Returns Value as ExternallyDefinedGeneralProperty (or Null if another type).
") ExternallyDefinedGeneralProperty;
		opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty> ExternallyDefinedGeneralProperty();

		/****** StepAP214_ExternalIdentificationItem::OrganizationalAddress ******/
		/****** md5 signature: 8e7a6f7600f4d5f59788fac6ed18b2bf ******/
		%feature("compactdefaultargs") OrganizationalAddress;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_OrganizationalAddress>

Description
-----------
Returns Value as OrganizationalAddress (or Null if another type).
") OrganizationalAddress;
		opencascade::handle<StepBasic_OrganizationalAddress> OrganizationalAddress();

		/****** StepAP214_ExternalIdentificationItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns Value as ProductDefinition (or Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_ExternalIdentificationItem::SecurityClassification ******/
		/****** md5 signature: 5a1ef075f0f272079bd532895ecc4299 ******/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassification>

Description
-----------
Returns Value as SecurityClassification (or Null if another type).
") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****** StepAP214_ExternalIdentificationItem::TrimmedCurve ******/
		/****** md5 signature: 9b9238907b0e1a3c16314fe3c0123825 ******/
		%feature("compactdefaultargs") TrimmedCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_TrimmedCurve>

Description
-----------
Returns Value as TrimmedCurve (or Null if another type).
") TrimmedCurve;
		opencascade::handle<StepGeom_TrimmedCurve> TrimmedCurve();

		/****** StepAP214_ExternalIdentificationItem::VersionedActionRequest ******/
		/****** md5 signature: eb68cd791736346256b603640d0e00b7 ******/
		%feature("compactdefaultargs") VersionedActionRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_VersionedActionRequest>

Description
-----------
Returns Value as VersionedActionRequest (or Null if another type).
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
		/****** StepAP214_ExternallyDefinedGeneralProperty::StepAP214_ExternallyDefinedGeneralProperty ******/
		/****** md5 signature: 8428f277be4306356e4d3176fe185bba ******/
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedGeneralProperty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP214_ExternallyDefinedGeneralProperty;
		 StepAP214_ExternallyDefinedGeneralProperty();

		/****** StepAP214_ExternallyDefinedGeneralProperty::ExternallyDefinedItem ******/
		/****** md5 signature: 99145de38951f9b9e301478cf44f094a ******/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>

Description
-----------
Returns data for supertype ExternallyDefinedItem.
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****** StepAP214_ExternallyDefinedGeneralProperty::Init ******/
		/****** md5 signature: 00b32e5c5313c39f3bbbaf3c98d71cb4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aGeneralProperty_Id: TCollection_HAsciiString
aGeneralProperty_Name: TCollection_HAsciiString
hasGeneralProperty_Description: bool
aGeneralProperty_Description: TCollection_HAsciiString
aExternallyDefinedItem_ItemId: StepBasic_SourceItem
aExternallyDefinedItem_Source: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGeneralProperty_Id, const opencascade::handle<TCollection_HAsciiString> & aGeneralProperty_Name, const bool hasGeneralProperty_Description, const opencascade::handle<TCollection_HAsciiString> & aGeneralProperty_Description, const StepBasic_SourceItem & aExternallyDefinedItem_ItemId, const opencascade::handle<StepBasic_ExternalSource> & aExternallyDefinedItem_Source);

		/****** StepAP214_ExternallyDefinedGeneralProperty::SetExternallyDefinedItem ******/
		/****** md5 signature: cb03be29921f3258b30b96567c768692 ******/
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "
Parameters
----------
ExternallyDefinedItem: StepBasic_ExternallyDefinedItem

Return
-------
None

Description
-----------
Set data for supertype ExternallyDefinedItem.
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem(const opencascade::handle<StepBasic_ExternallyDefinedItem> & ExternallyDefinedItem);

};


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
		/****** StepAP214_GroupItem::StepAP214_GroupItem ******/
		/****** md5 signature: c7ec4f9a5ee1269b8ff3d95dff43cd87 ******/
		%feature("compactdefaultargs") StepAP214_GroupItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a GroupItem SelectType.
") StepAP214_GroupItem;
		 StepAP214_GroupItem();

		/****** StepAP214_GroupItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a GroupItem Kind Entity that is: 1 -> GeometricRepresentationItem 2 -> GroupRelationship 3 -> MappedItem 4 -> ProductDefinition 5 -> ProductDefinitionFormation 6 -> PropertyDefinitionRepresentation 7 -> Representation 8 -> RepresentationItem 9 -> RepresentationRelationshipWithTransformation 10 -> ShapeAspect 11 -> ShapeAspectRelationship 12 -> ShapeRepresentationRelationship 13 -> StyledItem 14 -> TopologicalRepresentationItem 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_GroupItem::GeometricRepresentationItem ******/
		/****** md5 signature: 19337bf8b91e6fdb784c9372c3a2503d ******/
		%feature("compactdefaultargs") GeometricRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_GeometricRepresentationItem>

Description
-----------
returns Value as a GeometricRepresentationItem (Null if another type).
") GeometricRepresentationItem;
		virtual opencascade::handle<StepGeom_GeometricRepresentationItem> GeometricRepresentationItem();

		/****** StepAP214_GroupItem::GroupRelationship ******/
		/****** md5 signature: e96924329e7182112336a8edc68173d8 ******/
		%feature("compactdefaultargs") GroupRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GroupRelationship>

Description
-----------
returns Value as a GroupRelationship (Null if another type).
") GroupRelationship;
		virtual opencascade::handle<StepBasic_GroupRelationship> GroupRelationship();

		/****** StepAP214_GroupItem::MappedItem ******/
		/****** md5 signature: a84bcaf518cab916fa453d0b4bfed2d6 ******/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MappedItem>

Description
-----------
returns Value as a MappedItem (Null if another type).
") MappedItem;
		virtual opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****** StepAP214_GroupItem::ProductDefinition ******/
		/****** md5 signature: c87a2e2c18abbb8dba7578354cb60082 ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
returns Value as a ProductDefinition (Null if another type).
") ProductDefinition;
		virtual opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_GroupItem::ProductDefinitionFormation ******/
		/****** md5 signature: 507fa3da9e81b3c4e23dcc57a6272df1 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
returns Value as a ProductDefinitionFormation (Null if another type).
") ProductDefinitionFormation;
		virtual opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****** StepAP214_GroupItem::PropertyDefinitionRepresentation ******/
		/****** md5 signature: 15516a89777304fed6268c18b3417ae7 ******/
		%feature("compactdefaultargs") PropertyDefinitionRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinitionRepresentation>

Description
-----------
returns Value as a PropertyDefinitionRepresentation (Null if another type).
") PropertyDefinitionRepresentation;
		virtual opencascade::handle<StepRepr_PropertyDefinitionRepresentation> PropertyDefinitionRepresentation();

		/****** StepAP214_GroupItem::Representation ******/
		/****** md5 signature: 0e7149a093c46006c551ea78ef408983 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
") Representation;
		virtual opencascade::handle<StepRepr_Representation> Representation();

		/****** StepAP214_GroupItem::RepresentationItem ******/
		/****** md5 signature: 891f7511cd1c3bd60530164f2263a93b ******/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
returns Value as a RepresentationItem (Null if another type).
") RepresentationItem;
		virtual opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****** StepAP214_GroupItem::RepresentationRelationshipWithTransformation ******/
		/****** md5 signature: a6dfff1f1069c389f1a9972f5abc8237 ******/
		%feature("compactdefaultargs") RepresentationRelationshipWithTransformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation>

Description
-----------
returns Value as a RepresentationRelationshipWithTransformation (Null if another type).
") RepresentationRelationshipWithTransformation;
		virtual opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> RepresentationRelationshipWithTransformation();

		/****** StepAP214_GroupItem::ShapeAspect ******/
		/****** md5 signature: 7166c8a321ddb0da72235604702dc5c2 ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
returns Value as a ShapeAspect (Null if another type).
") ShapeAspect;
		virtual opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****** StepAP214_GroupItem::ShapeAspectRelationship ******/
		/****** md5 signature: 0856c8eef765cafdadc90beca549d0b3 ******/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>

Description
-----------
returns Value as a ShapeAspectRelationship (Null if another type).
") ShapeAspectRelationship;
		virtual opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****** StepAP214_GroupItem::ShapeRepresentationRelationship ******/
		/****** md5 signature: c0de6c2968734ed77b425351c1c9ec13 ******/
		%feature("compactdefaultargs") ShapeRepresentationRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeRepresentationRelationship>

Description
-----------
returns Value as a ShapeRepresentationRelationship (Null if another type).
") ShapeRepresentationRelationship;
		virtual opencascade::handle<StepRepr_ShapeRepresentationRelationship> ShapeRepresentationRelationship();

		/****** StepAP214_GroupItem::StyledItem ******/
		/****** md5 signature: 17351058c5e2e8666276ba91cd395c20 ******/
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
returns Value as a StyledItem (Null if another type).
") StyledItem;
		virtual opencascade::handle<StepVisual_StyledItem> StyledItem();

		/****** StepAP214_GroupItem::TopologicalRepresentationItem ******/
		/****** md5 signature: b0daadcd0bd7ad716605d04da68356df ******/
		%feature("compactdefaultargs") TopologicalRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
returns Value as a TopologicalRepresentationItem (Null if another type).
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
		/****** StepAP214_PresentedItemSelect::StepAP214_PresentedItemSelect ******/
		/****** md5 signature: 1ab0cf619cd8a2e4a40232e1b0fa0aa3 ******/
		%feature("compactdefaultargs") StepAP214_PresentedItemSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentedItemSelect SelectType.
") StepAP214_PresentedItemSelect;
		 StepAP214_PresentedItemSelect();

		/****** StepAP214_PresentedItemSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a PresentedItemSelect Kind Entity that is: 1 -> ProductDefinition, 2 -> ProductDefinitionRelationship, 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_PresentedItemSelect::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
returns Value as a ProductDefinition (Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP214_PresentedItemSelect::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
returns Value as a ProductDefinitionRelationship (Null if another type).
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
		/****** StepAP214_Protocol::StepAP214_Protocol ******/
		/****** md5 signature: 3d8e6919cc9e7dcbdb90cb31d9fb36f4 ******/
		%feature("compactdefaultargs") StepAP214_Protocol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepAP214_Protocol;
		 StepAP214_Protocol();

		/****** StepAP214_Protocol::NbResources ******/
		/****** md5 signature: 3c8410815357f0a892211359291d8070 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of Protocol used as Resources (level one).
") NbResources;
		int NbResources();

		/****** StepAP214_Protocol::Resource ******/
		/****** md5 signature: 3c19c2497364406e7d4e9d2a0f8d51c0 ******/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns a Resource, given its rank (between 1 and NbResources).
") Resource;
		opencascade::handle<Interface_Protocol> Resource(const int num);

		/****** StepAP214_Protocol::SchemaName ******/
		/****** md5 signature: f5e5aca7e98ca49f6dd2c4128c7187e6 ******/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
char *

Description
-----------
No available documentation.
") SchemaName;
		const char * SchemaName(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** StepAP214_Protocol::TypeNumber ******/
		/****** md5 signature: bbae632533589e3c2443854ef12e6cb8 ******/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
Returns a Case Number for each of the StepAP214 Entities.
") TypeNumber;
		int TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


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
		/****** StepAP214_RepItemGroup::StepAP214_RepItemGroup ******/
		/****** md5 signature: 4d65b9d6c1a89e6fdb0b55afcf91ce12 ******/
		%feature("compactdefaultargs") StepAP214_RepItemGroup;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP214_RepItemGroup;
		 StepAP214_RepItemGroup();

		/****** StepAP214_RepItemGroup::Init ******/
		/****** md5 signature: a26c286a728544e489256f1d5d757975 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aGroup_Name: TCollection_HAsciiString
hasGroup_Description: bool
aGroup_Description: TCollection_HAsciiString
aRepresentationItem_Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGroup_Name, const bool hasGroup_Description, const opencascade::handle<TCollection_HAsciiString> & aGroup_Description, const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name);

		/****** StepAP214_RepItemGroup::RepresentationItem ******/
		/****** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ******/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
Returns data for supertype RepresentationItem.
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

		/****** StepAP214_RepItemGroup::SetRepresentationItem ******/
		/****** md5 signature: 88416c585a2b3cb9cb84e9e665263fad ******/
		%feature("compactdefaultargs") SetRepresentationItem;
		%feature("autodoc", "
Parameters
----------
RepresentationItem: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
Set data for supertype RepresentationItem.
") SetRepresentationItem;
		void SetRepresentationItem(const opencascade::handle<StepRepr_RepresentationItem> & RepresentationItem);

};


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
		/****** StepAP214_AutoDesignOrganizationItem::StepAP214_AutoDesignOrganizationItem ******/
		/****** md5 signature: 8984fe5021e1226189d2cee91cce2bc5 ******/
		%feature("compactdefaultargs") StepAP214_AutoDesignOrganizationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepAP214_AutoDesignOrganizationItem;
		 StepAP214_AutoDesignOrganizationItem();

		/****** StepAP214_AutoDesignOrganizationItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
No available documentation.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_AutoDesignOrganizationItem::Document ******/
		/****** md5 signature: a302006fc6da6b6c11cd2cb18a0d18d6 ******/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
No available documentation.
") Document;
		opencascade::handle<StepBasic_Document> Document();

		/****** StepAP214_AutoDesignOrganizationItem::PhysicallyModeledProductDefinition ******/
		/****** md5 signature: 3425e1fe5db4c82dc6868dafa4cb1437 ******/
		%feature("compactdefaultargs") PhysicallyModeledProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PhysicallyModeledProductDefinition>

Description
-----------
No available documentation.
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
		/****** StepAP214_DateAndTimeItem::StepAP214_DateAndTimeItem ******/
		/****** md5 signature: 9c8a5fb11e899ee1a676366f50214dea ******/
		%feature("compactdefaultargs") StepAP214_DateAndTimeItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DateAndTimeItem SelectType.
") StepAP214_DateAndTimeItem;
		 StepAP214_DateAndTimeItem();

		/****** StepAP214_DateAndTimeItem::AppliedOrganizationAssignment ******/
		/****** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ******/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>

Description
-----------
returns Value as a AppliedOrganizationAssignment (Null if another type).
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****** StepAP214_DateAndTimeItem::AppliedPersonAndOrganizationAssignment ******/
		/****** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ******/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>

Description
-----------
returns Value as a AppliedDateAndPersonAssignment (Null if another type).
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****** StepAP214_DateAndTimeItem::ApprovalPersonOrganization ******/
		/****** md5 signature: af795dc9d70028f3b512bd493ca8a169 ******/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>

Description
-----------
returns Value as a ApprovalPersonOrganization (Null if another type).
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****** StepAP214_DateAndTimeItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a DateAndTimeItem Kind Entity that is: 1 -> ApprovalPersonOrganization 2 -> AppliedDateAndPersonAssignment 3 -> AppliedOrganizationAssignment 4 -> AssemblyComponentUsageSubstitute 5 -> DocumentFile 6 -> Effectivity 7 -> MaterialDesignation 8 -> MechanicalDesignGeometricPresentationRepresentation 9 -> PresentationArea 10 -> Product 11 -> ProductDefinition 12 -> ProductDefinitionFormation 13 -> ProductDefinitionRelationship 14 -> PropertyDefinition 15 -> ShapeRepresentation 16 -> SecurityClassification 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** StepAP214_DateItem::StepAP214_DateItem ******/
		/****** md5 signature: 4c6b16cb0f239579874636037b511e9d ******/
		%feature("compactdefaultargs") StepAP214_DateItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DateItem SelectType.
") StepAP214_DateItem;
		 StepAP214_DateItem();

		/****** StepAP214_DateItem::AppliedOrganizationAssignment ******/
		/****** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ******/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>

Description
-----------
returns Value as a AppliedOrganizationAssignment (Null if another type).
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****** StepAP214_DateItem::AppliedPersonAndOrganizationAssignment ******/
		/****** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ******/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>

Description
-----------
returns Value as a AppliedDateAndPersonAssignment (Null if another type).
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****** StepAP214_DateItem::AppliedSecurityClassificationAssignment ******/
		/****** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ******/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>

Description
-----------
returns Value as a AppliedSecurityClassificationAssignment (Null if another type).
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****** StepAP214_DateItem::ApprovalPersonOrganization ******/
		/****** md5 signature: af795dc9d70028f3b512bd493ca8a169 ******/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>

Description
-----------
returns Value as a ApprovalPersonOrganization (Null if another type).
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****** StepAP214_DateItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a DateItem Kind Entity that is: 1 -> ApprovalPersonOrganization 2 -> AppliedDateAndPersonAssignment 3 -> AppliedOrganizationAssignment 4 -> AssemblyComponentUsageSubstitute 5 -> DocumentFile 6 -> Effectivity 7 -> MaterialDesignation 8 -> MechanicalDesignGeometricPresentationRepresentation 9 -> PresentationArea 10 -> Product 11 -> ProductDefinition 12 -> ProductDefinitionFormation 13 -> ProductDefinitionRelationship 14 -> PropertyDefinition 15 -> ShapeRepresentation 16 -> AppliedSecurityClassificationAssignment 17 -> Document 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** StepAP214_ExternallyDefinedClass::StepAP214_ExternallyDefinedClass ******/
		/****** md5 signature: 0600303b9e0ad2121b0502b5786ef40c ******/
		%feature("compactdefaultargs") StepAP214_ExternallyDefinedClass;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP214_ExternallyDefinedClass;
		 StepAP214_ExternallyDefinedClass();

		/****** StepAP214_ExternallyDefinedClass::ExternallyDefinedItem ******/
		/****** md5 signature: 99145de38951f9b9e301478cf44f094a ******/
		%feature("compactdefaultargs") ExternallyDefinedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternallyDefinedItem>

Description
-----------
Returns data for supertype ExternallyDefinedItem.
") ExternallyDefinedItem;
		opencascade::handle<StepBasic_ExternallyDefinedItem> ExternallyDefinedItem();

		/****** StepAP214_ExternallyDefinedClass::Init ******/
		/****** md5 signature: 86f6464fd5c491ebbd478cfdb893175b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aGroup_Name: TCollection_HAsciiString
hasGroup_Description: bool
aGroup_Description: TCollection_HAsciiString
aExternallyDefinedItem_ItemId: StepBasic_SourceItem
aExternallyDefinedItem_Source: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGroup_Name, const bool hasGroup_Description, const opencascade::handle<TCollection_HAsciiString> & aGroup_Description, const StepBasic_SourceItem & aExternallyDefinedItem_ItemId, const opencascade::handle<StepBasic_ExternalSource> & aExternallyDefinedItem_Source);

		/****** StepAP214_ExternallyDefinedClass::SetExternallyDefinedItem ******/
		/****** md5 signature: cb03be29921f3258b30b96567c768692 ******/
		%feature("compactdefaultargs") SetExternallyDefinedItem;
		%feature("autodoc", "
Parameters
----------
ExternallyDefinedItem: StepBasic_ExternallyDefinedItem

Return
-------
None

Description
-----------
Set data for supertype ExternallyDefinedItem.
") SetExternallyDefinedItem;
		void SetExternallyDefinedItem(const opencascade::handle<StepBasic_ExternallyDefinedItem> & ExternallyDefinedItem);

};


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
		/****** StepAP214_OrganizationItem::StepAP214_OrganizationItem ******/
		/****** md5 signature: 11a02f6669929e72c1db28c5a8a13f6c ******/
		%feature("compactdefaultargs") StepAP214_OrganizationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OrganizationItem SelectType.
") StepAP214_OrganizationItem;
		 StepAP214_OrganizationItem();

		/****** StepAP214_OrganizationItem::AppliedOrganizationAssignment ******/
		/****** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ******/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>

Description
-----------
returns Value as a AppliedOrganizationAssignment (Null if another type).
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****** StepAP214_OrganizationItem::AppliedSecurityClassificationAssignment ******/
		/****** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ******/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>

Description
-----------
returns Value as a AppliedSecurityClassificationAssignment (Null if another type).
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****** StepAP214_OrganizationItem::Approval ******/
		/****** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ******/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
returns Value as a Approval (Null if another type).
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****** StepAP214_OrganizationItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a OrganizationItem Kind Entity that is :.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** StepAP214_PersonAndOrganizationItem::StepAP214_PersonAndOrganizationItem ******/
		/****** md5 signature: e4db6ace47d2c777bc4718b6bfa890ba ******/
		%feature("compactdefaultargs") StepAP214_PersonAndOrganizationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PersonAndOrganizationItem SelectType.
") StepAP214_PersonAndOrganizationItem;
		 StepAP214_PersonAndOrganizationItem();

		/****** StepAP214_PersonAndOrganizationItem::AppliedOrganizationAssignment ******/
		/****** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ******/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>

Description
-----------
returns Value as a AppliedOrganizationAssignment (Null if another type).
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****** StepAP214_PersonAndOrganizationItem::AppliedSecurityClassificationAssignment ******/
		/****** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ******/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>

Description
-----------
returns Value as a AppliedSecurityClassificationAssignment (Null if another type).
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****** StepAP214_PersonAndOrganizationItem::Approval ******/
		/****** md5 signature: 013ad3b6060ca76dd5ff8fea82f1dd52 ******/
		%feature("compactdefaultargs") Approval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
returns Value as a Approval (Null if another type).
") Approval;
		opencascade::handle<StepBasic_Approval> Approval();

		/****** StepAP214_PersonAndOrganizationItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a APersonAndOrganizationItem Kind Entity that is: 1 -> AppliedOrganizationAssignment 2 -> AssemblyComponentUsageSubstitute 3 -> DocumentFile 4 -> MaterialDesignation 5 -> MechanicalDesignGeometricPresentationRepresentation 6 -> PresentationArea 7 -> Product 8 -> ProductDefinition 9 -> ProductDefinitionFormation 10 -> ProductDefinitionRelationship 11 -> PropertyDefinition 12 -> ShapeRepresentation 13 -> SecurityClassification 14 -> AppliedSecurityClassificationAssignment 15 -> Approval 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** StepAP214_SecurityClassificationItem::StepAP214_SecurityClassificationItem ******/
		/****** md5 signature: 5cf35b4a1ab83e22092420587e59e1ba ******/
		%feature("compactdefaultargs") StepAP214_SecurityClassificationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SecurityClassificationItem SelectType.
") StepAP214_SecurityClassificationItem;
		 StepAP214_SecurityClassificationItem();

		/****** StepAP214_SecurityClassificationItem::Action ******/
		/****** md5 signature: d78be0cc67ab61a633e5943a92bf24dc ******/
		%feature("compactdefaultargs") Action;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Action>

Description
-----------
returns Value as a Action (Null if another type).
") Action;
		virtual opencascade::handle<StepBasic_Action> Action();

		/****** StepAP214_SecurityClassificationItem::AssemblyComponentUsage ******/
		/****** md5 signature: e97304587751f930a448a5a30fc01025 ******/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>

Description
-----------
returns Value as a AssemblyComponentUsage (Null if another type).
") AssemblyComponentUsage;
		virtual opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage();

		/****** StepAP214_SecurityClassificationItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a SecurityClassificationItem Kind Entity that is: 1 -> Action 2 -> AssemblyComponentUsage 3 -> AssemblyComponentUsageSubstitute 4 -> ConfigurationDesign 5 -> ConfigurationEffectivity 6 -> Document 7 -> DocumentFile 8 -> DraughtingModel 9 -> GeneralProperty 10 -> MakeFromUsageOption 11 -> MaterialDesignation 12 -> MechanicalDesignGeometricPresentationRepresentation 13 -> PresentationArea 14 -> Product 15 -> ProductConcept 16 -> ProductDefinition 17 -> ProductDefinitionFormation 18 -> ProductDefinitionRelationship 19 -> ProductDefinitionUsage 20 -> PropertyDefinition 21 -> ShapeRepresentation 22 -> VersionedActionRequest 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP214_SecurityClassificationItem::ConfigurationDesign ******/
		/****** md5 signature: 010b6e51854a031d1c0e4c1efdaed13e ******/
		%feature("compactdefaultargs") ConfigurationDesign;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationDesign>

Description
-----------
returns Value as a ConfigurationDesign (Null if another type).
") ConfigurationDesign;
		virtual opencascade::handle<StepRepr_ConfigurationDesign> ConfigurationDesign();

		/****** StepAP214_SecurityClassificationItem::ConfigurationEffectivity ******/
		/****** md5 signature: b80c79ba89316d4f5731586aca4be7d5 ******/
		%feature("compactdefaultargs") ConfigurationEffectivity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationEffectivity>

Description
-----------
returns Value as a ConfigurationEffectivity (Null if another type).
") ConfigurationEffectivity;
		virtual opencascade::handle<StepRepr_ConfigurationEffectivity> ConfigurationEffectivity();

		/****** StepAP214_SecurityClassificationItem::DraughtingModel ******/
		/****** md5 signature: b62aebe5ded344c4fd8cbb0a8277058b ******/
		%feature("compactdefaultargs") DraughtingModel;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_DraughtingModel>

Description
-----------
returns Value as a DraughtingModel (Null if another type).
") DraughtingModel;
		virtual opencascade::handle<StepVisual_DraughtingModel> DraughtingModel();

		/****** StepAP214_SecurityClassificationItem::GeneralProperty ******/
		/****** md5 signature: e8a23447f91a20426739b05fd01129ef ******/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GeneralProperty>

Description
-----------
returns Value as a GeneralProperty (Null if another type).
") GeneralProperty;
		virtual opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****** StepAP214_SecurityClassificationItem::MakeFromUsageOption ******/
		/****** md5 signature: 3e9483ba1a3e0cbde008e2c79eeae389 ******/
		%feature("compactdefaultargs") MakeFromUsageOption;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MakeFromUsageOption>

Description
-----------
returns Value as a MakeFromUsageOption (Null if another type).
") MakeFromUsageOption;
		virtual opencascade::handle<StepRepr_MakeFromUsageOption> MakeFromUsageOption();

		/****** StepAP214_SecurityClassificationItem::ProductConcept ******/
		/****** md5 signature: 804dada10f5a04737b5d5baae55f58a2 ******/
		%feature("compactdefaultargs") ProductConcept;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductConcept>

Description
-----------
returns Value as a ProductConcept (Null if another type).
") ProductConcept;
		virtual opencascade::handle<StepRepr_ProductConcept> ProductConcept();

		/****** StepAP214_SecurityClassificationItem::ProductDefinitionUsage ******/
		/****** md5 signature: e2f37121b68615ea2d30e17499139aa9 ******/
		%feature("compactdefaultargs") ProductDefinitionUsage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductDefinitionUsage>

Description
-----------
returns Value as a ProductDefinitionUsage (Null if another type).
") ProductDefinitionUsage;
		virtual opencascade::handle<StepRepr_ProductDefinitionUsage> ProductDefinitionUsage();

		/****** StepAP214_SecurityClassificationItem::VersionedActionRequest ******/
		/****** md5 signature: 75f2874746b7634c201d37df06d21e6c ******/
		%feature("compactdefaultargs") VersionedActionRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_VersionedActionRequest>

Description
-----------
returns Value as a VersionedActionRequest (Null if another type).
") VersionedActionRequest;
		virtual opencascade::handle<StepBasic_VersionedActionRequest> VersionedActionRequest();

};


%extend StepAP214_SecurityClassificationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class StepAP214_HArray1OfApprovalItem : public NCollection_Array1<StepAP214_ApprovalItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfApprovalItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_ApprovalItem>::value_type& theValue);
    StepAP214_HArray1OfApprovalItem(const NCollection_Array1<StepAP214_ApprovalItem>& theOther);
    const NCollection_Array1<StepAP214_ApprovalItem>& Array1();
    NCollection_Array1<StepAP214_ApprovalItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfApprovalItem)


class StepAP214_HArray1OfAutoDesignDateAndPersonItem : public NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem>::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndPersonItem(const NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem>& theOther);
    const NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem>& Array1();
    NCollection_Array1<StepAP214_AutoDesignDateAndPersonItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndPersonItem)


class StepAP214_HArray1OfAutoDesignDateAndTimeItem : public NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem>::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDateAndTimeItem(const NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem>& theOther);
    const NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem>& Array1();
    NCollection_Array1<StepAP214_AutoDesignDateAndTimeItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDateAndTimeItem)


class StepAP214_HArray1OfAutoDesignDatedItem : public NCollection_Array1<StepAP214_AutoDesignDatedItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignDatedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_AutoDesignDatedItem>::value_type& theValue);
    StepAP214_HArray1OfAutoDesignDatedItem(const NCollection_Array1<StepAP214_AutoDesignDatedItem>& theOther);
    const NCollection_Array1<StepAP214_AutoDesignDatedItem>& Array1();
    NCollection_Array1<StepAP214_AutoDesignDatedItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignDatedItem)


class StepAP214_HArray1OfAutoDesignGeneralOrgItem : public NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem>::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGeneralOrgItem(const NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem>& theOther);
    const NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem>& Array1();
    NCollection_Array1<StepAP214_AutoDesignGeneralOrgItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGeneralOrgItem)


class StepAP214_HArray1OfAutoDesignGroupedItem : public NCollection_Array1<StepAP214_AutoDesignGroupedItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignGroupedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_AutoDesignGroupedItem>::value_type& theValue);
    StepAP214_HArray1OfAutoDesignGroupedItem(const NCollection_Array1<StepAP214_AutoDesignGroupedItem>& theOther);
    const NCollection_Array1<StepAP214_AutoDesignGroupedItem>& Array1();
    NCollection_Array1<StepAP214_AutoDesignGroupedItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignGroupedItem)


class StepAP214_HArray1OfAutoDesignPresentedItemSelect : public NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect>, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect>::value_type& theValue);
    StepAP214_HArray1OfAutoDesignPresentedItemSelect(const NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect>& theOther);
    const NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect>& Array1();
    NCollection_Array1<StepAP214_AutoDesignPresentedItemSelect>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignPresentedItemSelect)


class StepAP214_HArray1OfAutoDesignReferencingItem : public NCollection_Array1<StepAP214_AutoDesignReferencingItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfAutoDesignReferencingItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_AutoDesignReferencingItem>::value_type& theValue);
    StepAP214_HArray1OfAutoDesignReferencingItem(const NCollection_Array1<StepAP214_AutoDesignReferencingItem>& theOther);
    const NCollection_Array1<StepAP214_AutoDesignReferencingItem>& Array1();
    NCollection_Array1<StepAP214_AutoDesignReferencingItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfAutoDesignReferencingItem)


class StepAP214_HArray1OfDateAndTimeItem : public NCollection_Array1<StepAP214_DateAndTimeItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateAndTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_DateAndTimeItem>::value_type& theValue);
    StepAP214_HArray1OfDateAndTimeItem(const NCollection_Array1<StepAP214_DateAndTimeItem>& theOther);
    const NCollection_Array1<StepAP214_DateAndTimeItem>& Array1();
    NCollection_Array1<StepAP214_DateAndTimeItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateAndTimeItem)


class StepAP214_HArray1OfDateItem : public NCollection_Array1<StepAP214_DateItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDateItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_DateItem>::value_type& theValue);
    StepAP214_HArray1OfDateItem(const NCollection_Array1<StepAP214_DateItem>& theOther);
    const NCollection_Array1<StepAP214_DateItem>& Array1();
    NCollection_Array1<StepAP214_DateItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDateItem)


class StepAP214_HArray1OfDocumentReferenceItem : public NCollection_Array1<StepAP214_DocumentReferenceItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfDocumentReferenceItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_DocumentReferenceItem>::value_type& theValue);
    StepAP214_HArray1OfDocumentReferenceItem(const NCollection_Array1<StepAP214_DocumentReferenceItem>& theOther);
    const NCollection_Array1<StepAP214_DocumentReferenceItem>& Array1();
    NCollection_Array1<StepAP214_DocumentReferenceItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfDocumentReferenceItem)


class StepAP214_HArray1OfExternalIdentificationItem : public NCollection_Array1<StepAP214_ExternalIdentificationItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfExternalIdentificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_ExternalIdentificationItem>::value_type& theValue);
    StepAP214_HArray1OfExternalIdentificationItem(const NCollection_Array1<StepAP214_ExternalIdentificationItem>& theOther);
    const NCollection_Array1<StepAP214_ExternalIdentificationItem>& Array1();
    NCollection_Array1<StepAP214_ExternalIdentificationItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfExternalIdentificationItem)


class StepAP214_HArray1OfGroupItem : public NCollection_Array1<StepAP214_GroupItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfGroupItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_GroupItem>::value_type& theValue);
    StepAP214_HArray1OfGroupItem(const NCollection_Array1<StepAP214_GroupItem>& theOther);
    const NCollection_Array1<StepAP214_GroupItem>& Array1();
    NCollection_Array1<StepAP214_GroupItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfGroupItem)


class StepAP214_HArray1OfOrganizationItem : public NCollection_Array1<StepAP214_OrganizationItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_OrganizationItem>::value_type& theValue);
    StepAP214_HArray1OfOrganizationItem(const NCollection_Array1<StepAP214_OrganizationItem>& theOther);
    const NCollection_Array1<StepAP214_OrganizationItem>& Array1();
    NCollection_Array1<StepAP214_OrganizationItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfOrganizationItem)


class StepAP214_HArray1OfPersonAndOrganizationItem : public NCollection_Array1<StepAP214_PersonAndOrganizationItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPersonAndOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_PersonAndOrganizationItem>::value_type& theValue);
    StepAP214_HArray1OfPersonAndOrganizationItem(const NCollection_Array1<StepAP214_PersonAndOrganizationItem>& theOther);
    const NCollection_Array1<StepAP214_PersonAndOrganizationItem>& Array1();
    NCollection_Array1<StepAP214_PersonAndOrganizationItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPersonAndOrganizationItem)


class StepAP214_HArray1OfPresentedItemSelect : public NCollection_Array1<StepAP214_PresentedItemSelect>, public Standard_Transient {
  public:
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfPresentedItemSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_PresentedItemSelect>::value_type& theValue);
    StepAP214_HArray1OfPresentedItemSelect(const NCollection_Array1<StepAP214_PresentedItemSelect>& theOther);
    const NCollection_Array1<StepAP214_PresentedItemSelect>& Array1();
    NCollection_Array1<StepAP214_PresentedItemSelect>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfPresentedItemSelect)


class StepAP214_HArray1OfSecurityClassificationItem : public NCollection_Array1<StepAP214_SecurityClassificationItem>, public Standard_Transient {
  public:
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP214_HArray1OfSecurityClassificationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepAP214_SecurityClassificationItem>::value_type& theValue);
    StepAP214_HArray1OfSecurityClassificationItem(const NCollection_Array1<StepAP214_SecurityClassificationItem>& theOther);
    const NCollection_Array1<StepAP214_SecurityClassificationItem>& Array1();
    NCollection_Array1<StepAP214_SecurityClassificationItem>& ChangeArray1();
};
%make_alias(StepAP214_HArray1OfSecurityClassificationItem)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def stepap214_Protocol(*args):
	return stepap214.Protocol(*args)

}
