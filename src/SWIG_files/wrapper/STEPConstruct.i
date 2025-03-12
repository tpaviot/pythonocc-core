/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPCONSTRUCTDOCSTRING
"STEPConstruct module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepconstruct.html"
%enddef
%module (package="OCC.Core", docstring=STEPCONSTRUCTDOCSTRING) STEPConstruct


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
#include<STEPConstruct_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<StepShape_module.hxx>
#include<TopoDS_module.hxx>
#include<StepRepr_module.hxx>
#include<TopLoc_module.hxx>
#include<StepBasic_module.hxx>
#include<StepAP203_module.hxx>
#include<Interface_module.hxx>
#include<StepGeom_module.hxx>
#include<StepData_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<XSControl_module.hxx>
#include<StepVisual_module.hxx>
#include<Quantity_module.hxx>
#include<gp_module.hxx>
#include<TopTools_module.hxx>
#include<IFSelect_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<StepData_module.hxx>
#include<StepShape_module.hxx>
#include<MoniTool_module.hxx>
#include<Resource_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<DE_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Transfer.i
%import StepShape.i
%import TopoDS.i
%import StepRepr.i
%import TopLoc.i
%import StepBasic.i
%import StepAP203.i
%import Interface.i
%import StepGeom.i
%import StepData.i
%import TCollection.i
%import TColStd.i
%import XSControl.i
%import StepVisual.i
%import Quantity.i
%import gp.i

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
%template(STEPConstruct_DataMapOfAsciiStringTransient) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<Standard_Transient>>;
%template(STEPConstruct_DataMapOfPointTransient) NCollection_DataMap<gp_Pnt,opencascade::handle<Standard_Transient>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
typedef NCollection_DataMap<gp_Pnt, opencascade::handle<Standard_Transient>>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> STEPConstruct_DataMapOfAsciiStringTransient;
typedef NCollection_DataMap<gp_Pnt, opencascade::handle<Standard_Transient>> STEPConstruct_DataMapOfPointTransient;
/* end typedefs declaration */

/**********************
* class STEPConstruct *
**********************/
%rename(stepconstruct) STEPConstruct;
class STEPConstruct {
	public:
		/****** STEPConstruct::FindCDSR ******/
		/****** md5 signature: df4f736080c1405cd8149af6842045a9 ******/
		%feature("compactdefaultargs") FindCDSR;
		%feature("autodoc", "
Parameters
----------
ComponentBinder: Transfer_Binder
AssemblySDR: StepShape_ShapeDefinitionRepresentation
ComponentCDSR: StepShape_ContextDependentShapeRepresentation

Return
-------
bool

Description
-----------
Find CDSR corresponding to the component in the specified assembly.
") FindCDSR;
		static Standard_Boolean FindCDSR(const opencascade::handle<Transfer_Binder> & ComponentBinder, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & AssemblySDR, opencascade::handle<StepShape_ContextDependentShapeRepresentation> & ComponentCDSR);

		/****** STEPConstruct::FindEntity ******/
		/****** md5 signature: 864ce9b9c1ae0edf6f28a0c1b2e077f8 ******/
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "
Parameters
----------
FinderProcess: Transfer_FinderProcess
Shape: TopoDS_Shape

Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
Returns STEP entity of the (sub)type of RepresentationItem which is a result of the translation of the Shape, or Null if no result is recorded.
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity(const opencascade::handle<Transfer_FinderProcess> & FinderProcess, const TopoDS_Shape & Shape);

		/****** STEPConstruct::FindEntity ******/
		/****** md5 signature: 2815856fafe557828959cf63bf1e6789 ******/
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "
Parameters
----------
FinderProcess: Transfer_FinderProcess
Shape: TopoDS_Shape
Loc: TopLoc_Location

Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
The same as above, but in the case if item not found, repeats search on the same shape without location. The Loc corresponds to the location with which result is found (either location of the Shape, or Null).
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity(const opencascade::handle<Transfer_FinderProcess> & FinderProcess, const TopoDS_Shape & Shape, TopLoc_Location & Loc);

		/****** STEPConstruct::FindShape ******/
		/****** md5 signature: f9f36639a3db0f96fa7c9e9eb6ad6b79 ******/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "
Parameters
----------
TransientProcess: Transfer_TransientProcess
item: StepRepr_RepresentationItem

Return
-------
TopoDS_Shape

Description
-----------
Returns Shape resulting from given STEP entity (Null if not mapped).
") FindShape;
		static TopoDS_Shape FindShape(const opencascade::handle<Transfer_TransientProcess> & TransientProcess, const opencascade::handle<StepRepr_RepresentationItem> & item);

};


%extend STEPConstruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class STEPConstruct_AP203Context *
***********************************/
class STEPConstruct_AP203Context {
	public:
		/****** STEPConstruct_AP203Context::STEPConstruct_AP203Context ******/
		/****** md5 signature: 6b44e89ed3cd244f3f883840ebc180c0 ******/
		%feature("compactdefaultargs") STEPConstruct_AP203Context;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates tool and fills constant fields.
") STEPConstruct_AP203Context;
		 STEPConstruct_AP203Context();

		/****** STEPConstruct_AP203Context::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all fields describing entities specific to each part.
") Clear;
		void Clear();

		/****** STEPConstruct_AP203Context::DefaultApproval ******/
		/****** md5 signature: dcf5c7f323ee82aaa2b53b8a4b8a65cf ******/
		%feature("compactdefaultargs") DefaultApproval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
Returns default approval entity which is used when no other data are available.
") DefaultApproval;
		opencascade::handle<StepBasic_Approval> DefaultApproval();

		/****** STEPConstruct_AP203Context::DefaultDateAndTime ******/
		/****** md5 signature: edec67445004cddf0e29a6fa243f1887 ******/
		%feature("compactdefaultargs") DefaultDateAndTime;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateAndTime>

Description
-----------
Returns default date_and_time entity which is used when no other data are available.
") DefaultDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DefaultDateAndTime();

		/****** STEPConstruct_AP203Context::DefaultPersonAndOrganization ******/
		/****** md5 signature: 1ddec0576a13d24833625c2ff1173714 ******/
		%feature("compactdefaultargs") DefaultPersonAndOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganization>

Description
-----------
Returns default person_and_organization entity which is used when no other data are available.
") DefaultPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> DefaultPersonAndOrganization();

		/****** STEPConstruct_AP203Context::DefaultSecurityClassificationLevel ******/
		/****** md5 signature: 1d1d9f341469e697d5ae8049dad6de4f ******/
		%feature("compactdefaultargs") DefaultSecurityClassificationLevel;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassificationLevel>

Description
-----------
Returns default security_classification_level entity which is used when no other data are available.
") DefaultSecurityClassificationLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> DefaultSecurityClassificationLevel();

		/****** STEPConstruct_AP203Context::GetApproval ******/
		/****** md5 signature: 8d2a93436691446d11a077f2bfba441d ******/
		%feature("compactdefaultargs") GetApproval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignApproval>

Description
-----------
No available documentation.
") GetApproval;
		opencascade::handle<StepAP203_CcDesignApproval> GetApproval();

		/****** STEPConstruct_AP203Context::GetApprovalDateTime ******/
		/****** md5 signature: af18723c7036e5ff5ec57cf963eddc28 ******/
		%feature("compactdefaultargs") GetApprovalDateTime;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalDateTime>

Description
-----------
No available documentation.
") GetApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> GetApprovalDateTime();

		/****** STEPConstruct_AP203Context::GetApprover ******/
		/****** md5 signature: 20fde7251eba76868b9bf63c6ec45804 ******/
		%feature("compactdefaultargs") GetApprover;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>

Description
-----------
No available documentation.
") GetApprover;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> GetApprover();

		/****** STEPConstruct_AP203Context::GetClassificationDate ******/
		/****** md5 signature: 78da7d2f26c374e722ab265bd6d918e2 ******/
		%feature("compactdefaultargs") GetClassificationDate;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>

Description
-----------
No available documentation.
") GetClassificationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetClassificationDate();

		/****** STEPConstruct_AP203Context::GetClassificationOfficer ******/
		/****** md5 signature: f0e7eb259738f93fd883c5bbafa5ef2b ******/
		%feature("compactdefaultargs") GetClassificationOfficer;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>

Description
-----------
No available documentation.
") GetClassificationOfficer;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetClassificationOfficer();

		/****** STEPConstruct_AP203Context::GetCreationDate ******/
		/****** md5 signature: 661094f0ad1769d3ad950de486214637 ******/
		%feature("compactdefaultargs") GetCreationDate;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>

Description
-----------
No available documentation.
") GetCreationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetCreationDate();

		/****** STEPConstruct_AP203Context::GetCreator ******/
		/****** md5 signature: e4a2e9c980d0c88f6791cc5f4b2554e4 ******/
		%feature("compactdefaultargs") GetCreator;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>

Description
-----------
No available documentation.
") GetCreator;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetCreator();

		/****** STEPConstruct_AP203Context::GetDesignOwner ******/
		/****** md5 signature: 3588dad07f763af1fb1f9ce81e159a0b ******/
		%feature("compactdefaultargs") GetDesignOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>

Description
-----------
No available documentation.
") GetDesignOwner;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignOwner();

		/****** STEPConstruct_AP203Context::GetDesignSupplier ******/
		/****** md5 signature: c0eb175847b7241cabb8b06c9cb6c1f5 ******/
		%feature("compactdefaultargs") GetDesignSupplier;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>

Description
-----------
No available documentation.
") GetDesignSupplier;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignSupplier();

		/****** STEPConstruct_AP203Context::GetProductCategoryRelationship ******/
		/****** md5 signature: dd0a5eeedcc91fb6d8b15190c590b378 ******/
		%feature("compactdefaultargs") GetProductCategoryRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductCategoryRelationship>

Description
-----------
Return entities (roots) instantiated for the part by method Init.
") GetProductCategoryRelationship;
		opencascade::handle<StepBasic_ProductCategoryRelationship> GetProductCategoryRelationship();

		/****** STEPConstruct_AP203Context::GetSecurity ******/
		/****** md5 signature: 76b292f42cd555b6a837e4952cf7a978 ******/
		%feature("compactdefaultargs") GetSecurity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_CcDesignSecurityClassification>

Description
-----------
No available documentation.
") GetSecurity;
		opencascade::handle<StepAP203_CcDesignSecurityClassification> GetSecurity();

		/****** STEPConstruct_AP203Context::Init ******/
		/****** md5 signature: e24798a585b02010807ba9a6dfead7a8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
sdr: StepShape_ShapeDefinitionRepresentation

Return
-------
None

Description
-----------
Takes SDR (part) which brings all standard data around part (common for AP203 and AP214) and creates all the additional entities required for AP203.
") Init;
		void Init(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr);

		/****** STEPConstruct_AP203Context::Init ******/
		/****** md5 signature: cb0f48b1c2c648fc61e08c1e6619fb7a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
SDRTool: STEPConstruct_Part

Return
-------
None

Description
-----------
Takes tool which describes standard data around part (common for AP203 and AP214) and creates all the additional entities required for AP203 //! The created entities can be obtained by calls to methods GetCreator(), GetDesignOwner(), GetDesignSupplier(), GetClassificationOfficer(), GetSecurity(), GetCreationDate(), GetClassificationDate(), GetApproval(), GetApprover(), GetApprovalDateTime(), GetProductCategoryRelationship().
") Init;
		void Init(const STEPConstruct_Part & SDRTool);

		/****** STEPConstruct_AP203Context::Init ******/
		/****** md5 signature: 8ced79fee45044397884daaf69c00780 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Return
-------
None

Description
-----------
Takes NAUO which describes assembly link to component and creates the security_classification entity associated to it as required by the AP203 //! Instantiated (or existing previously) entities concerned can be obtained by calls to methods GetClassificationOfficer(), GetSecurity(), GetClassificationDate(), GetApproval(), GetApprover(), GetApprovalDateTime() Takes tool which describes standard data around part (common for AP203 and AP214) and takes from model (or creates if missing) all the additional entities required by AP203.
") Init;
		void Init(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****** STEPConstruct_AP203Context::InitApprovalRequisites ******/
		/****** md5 signature: 5301e4276f4c8f2c52467c20e81c2c76 ******/
		%feature("compactdefaultargs") InitApprovalRequisites;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes Approver and ApprovalDateTime entities according to Approval entity.
") InitApprovalRequisites;
		void InitApprovalRequisites();

		/****** STEPConstruct_AP203Context::InitAssembly ******/
		/****** md5 signature: 60851fb7589ab6f80c656afcabc1e98a ******/
		%feature("compactdefaultargs") InitAssembly;
		%feature("autodoc", "
Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Return
-------
None

Description
-----------
Initializes all missing data which are required for assembly.
") InitAssembly;
		void InitAssembly(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****** STEPConstruct_AP203Context::InitRoles ******/
		/****** md5 signature: 17e9d4bbde7b2ddd05e8cdf36675b98c ******/
		%feature("compactdefaultargs") InitRoles;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes constant fields (shared entities).
") InitRoles;
		void InitRoles();

		/****** STEPConstruct_AP203Context::InitSecurityRequisites ******/
		/****** md5 signature: 5a311cda040c42091a1a38442b9e2a15 ******/
		%feature("compactdefaultargs") InitSecurityRequisites;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes ClassificationOfficer and ClassificationDate entities according to Security entity.
") InitSecurityRequisites;
		void InitSecurityRequisites();

		/****** STEPConstruct_AP203Context::RoleApprover ******/
		/****** md5 signature: ee24a8f71964782e2165422f6f940d67 ******/
		%feature("compactdefaultargs") RoleApprover;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalRole>

Description
-----------
Return predefined PersonAndOrganizationRole and DateTimeRole entities named 'creator', 'design owner', 'design supplier', 'classification officer', 'creation date', 'classification date', 'approver'.
") RoleApprover;
		opencascade::handle<StepBasic_ApprovalRole> RoleApprover();

		/****** STEPConstruct_AP203Context::RoleClassificationDate ******/
		/****** md5 signature: 951a829280d7e85e12cf1204b7f07fbc ******/
		%feature("compactdefaultargs") RoleClassificationDate;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateTimeRole>

Description
-----------
No available documentation.
") RoleClassificationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleClassificationDate();

		/****** STEPConstruct_AP203Context::RoleClassificationOfficer ******/
		/****** md5 signature: 680994e9eb9b242cac9d48544673932b ******/
		%feature("compactdefaultargs") RoleClassificationOfficer;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>

Description
-----------
No available documentation.
") RoleClassificationOfficer;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleClassificationOfficer();

		/****** STEPConstruct_AP203Context::RoleCreationDate ******/
		/****** md5 signature: 94ffd366c27173e3037eaf4fe368d902 ******/
		%feature("compactdefaultargs") RoleCreationDate;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateTimeRole>

Description
-----------
No available documentation.
") RoleCreationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleCreationDate();

		/****** STEPConstruct_AP203Context::RoleCreator ******/
		/****** md5 signature: 00b033f9998e9266368f0e71378c4b91 ******/
		%feature("compactdefaultargs") RoleCreator;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>

Description
-----------
No available documentation.
") RoleCreator;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleCreator();

		/****** STEPConstruct_AP203Context::RoleDesignOwner ******/
		/****** md5 signature: 7076b73b9e1bcd40826ee698f4fc815e ******/
		%feature("compactdefaultargs") RoleDesignOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>

Description
-----------
No available documentation.
") RoleDesignOwner;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignOwner();

		/****** STEPConstruct_AP203Context::RoleDesignSupplier ******/
		/****** md5 signature: 3582f09a86bb2746bec49cb503f79a59 ******/
		%feature("compactdefaultargs") RoleDesignSupplier;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>

Description
-----------
No available documentation.
") RoleDesignSupplier;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignSupplier();

		/****** STEPConstruct_AP203Context::SetDefaultApproval ******/
		/****** md5 signature: d84eff519036b537038259693f6fb935 ******/
		%feature("compactdefaultargs") SetDefaultApproval;
		%feature("autodoc", "
Parameters
----------
app: StepBasic_Approval

Return
-------
None

Description
-----------
Sets default approval.
") SetDefaultApproval;
		void SetDefaultApproval(const opencascade::handle<StepBasic_Approval> & app);

		/****** STEPConstruct_AP203Context::SetDefaultDateAndTime ******/
		/****** md5 signature: b41371ade9b7684e015d98d00a060963 ******/
		%feature("compactdefaultargs") SetDefaultDateAndTime;
		%feature("autodoc", "
Parameters
----------
dt: StepBasic_DateAndTime

Return
-------
None

Description
-----------
Sets default date_and_time entity.
") SetDefaultDateAndTime;
		void SetDefaultDateAndTime(const opencascade::handle<StepBasic_DateAndTime> & dt);

		/****** STEPConstruct_AP203Context::SetDefaultPersonAndOrganization ******/
		/****** md5 signature: 8da1183cd93e230b79ba8ab0f12cc09d ******/
		%feature("compactdefaultargs") SetDefaultPersonAndOrganization;
		%feature("autodoc", "
Parameters
----------
po: StepBasic_PersonAndOrganization

Return
-------
None

Description
-----------
Sets default person_and_organization entity.
") SetDefaultPersonAndOrganization;
		void SetDefaultPersonAndOrganization(const opencascade::handle<StepBasic_PersonAndOrganization> & po);

		/****** STEPConstruct_AP203Context::SetDefaultSecurityClassificationLevel ******/
		/****** md5 signature: 5968f482432e0bdbfc3bb12066866eca ******/
		%feature("compactdefaultargs") SetDefaultSecurityClassificationLevel;
		%feature("autodoc", "
Parameters
----------
sc: StepBasic_SecurityClassificationLevel

Return
-------
None

Description
-----------
Sets default security_classification_level.
") SetDefaultSecurityClassificationLevel;
		void SetDefaultSecurityClassificationLevel(const opencascade::handle<StepBasic_SecurityClassificationLevel> & sc);

};


%extend STEPConstruct_AP203Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class STEPConstruct_Assembly *
*******************************/
class STEPConstruct_Assembly {
	public:
		/****** STEPConstruct_Assembly::STEPConstruct_Assembly ******/
		/****** md5 signature: 752dfcbbf37eed18e9c0c4b246a3c357 ******/
		%feature("compactdefaultargs") STEPConstruct_Assembly;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPConstruct_Assembly;
		 STEPConstruct_Assembly();

		/****** STEPConstruct_Assembly::CheckSRRReversesNAUO ******/
		/****** md5 signature: b0fa18785618f63fd8c99ab9527bdb0c ******/
		%feature("compactdefaultargs") CheckSRRReversesNAUO;
		%feature("autodoc", "
Parameters
----------
theGraph: Interface_Graph
CDSR: StepShape_ContextDependentShapeRepresentation

Return
-------
bool

Description
-----------
Checks whether SRR's definition of assembly and component contradicts with NAUO definition or not, according to model schema (AP214 or AP203).
") CheckSRRReversesNAUO;
		static Standard_Boolean CheckSRRReversesNAUO(const Interface_Graph & theGraph, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR);

		/****** STEPConstruct_Assembly::GetNAUO ******/
		/****** md5 signature: 7b90e221fdc0670e5cb2da71fe791c94 ******/
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>

Description
-----------
Returns NAUO object describing the assembly link.
") GetNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetNAUO();

		/****** STEPConstruct_Assembly::Init ******/
		/****** md5 signature: 680eea5c5f086771c9a8f0380c783f24 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSR: StepShape_ShapeDefinitionRepresentation
SDR0: StepShape_ShapeDefinitionRepresentation
Ax0: StepGeom_Axis2Placement3d
Loc: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Initialises with starting values Ax0: origin axis (typically, standard XYZ) Loc: location to which place the item Makes a MappedItem Resulting Value is returned by ItemValue.
") Init;
		void Init(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aSR, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR0, const opencascade::handle<StepGeom_Axis2Placement3d> & Ax0, const opencascade::handle<StepGeom_Axis2Placement3d> & Loc);

		/****** STEPConstruct_Assembly::ItemLocation ******/
		/****** md5 signature: 0632f06033b119941c450baebc8f4ad0 ******/
		%feature("compactdefaultargs") ItemLocation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
Returns the location of the item, computed from starting aLoc.
") ItemLocation;
		opencascade::handle<StepGeom_Axis2Placement3d> ItemLocation();

		/****** STEPConstruct_Assembly::ItemValue ******/
		/****** md5 signature: d2ed61c8667ff822d613c1acb961afad ******/
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Value If no Make... has been called, returns the starting SR.
") ItemValue;
		opencascade::handle<Standard_Transient> ItemValue();

		/****** STEPConstruct_Assembly::MakeRelationship ******/
		/****** md5 signature: b815ac8d8592b7db4c6994286256fc74 ******/
		%feature("compactdefaultargs") MakeRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Make a (ShapeRepresentationRelationship,...WithTransformation) Resulting Value is returned by ItemValue.
") MakeRelationship;
		void MakeRelationship();

};


%extend STEPConstruct_Assembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPConstruct_ContextTool *
**********************************/
class STEPConstruct_ContextTool {
	public:
		/****** STEPConstruct_ContextTool::STEPConstruct_ContextTool ******/
		/****** md5 signature: df4dcab3f691efa754f6537b14d77482 ******/
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool();

		/****** STEPConstruct_ContextTool::STEPConstruct_ContextTool ******/
		/****** md5 signature: 531e2d4c4ce04702879d6fb5c472dc0b ******/
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "
Parameters
----------
aStepModel: StepData_StepModel

Return
-------
None

Description
-----------
No available documentation.
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool(const opencascade::handle<StepData_StepModel> & aStepModel);

		/****** STEPConstruct_ContextTool::AP203Context ******/
		/****** md5 signature: 8779001f2e80b0238c76a70e8433d9cb ******/
		%feature("compactdefaultargs") AP203Context;
		%feature("autodoc", "Return
-------
STEPConstruct_AP203Context

Description
-----------
Returns tool which maintains context specific for AP203.
") AP203Context;
		STEPConstruct_AP203Context & AP203Context();

		/****** STEPConstruct_ContextTool::AddAPD ******/
		/****** md5 signature: a67d05ca4ebe6d997b4368deaa146c7d ******/
		%feature("compactdefaultargs") AddAPD;
		%feature("autodoc", "
Parameters
----------
enforce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") AddAPD;
		void AddAPD(const Standard_Boolean enforce = Standard_False);

		/****** STEPConstruct_ContextTool::GetACname ******/
		/****** md5 signature: fa0e502f0d137b171700e26d62429bdd ******/
		%feature("compactdefaultargs") GetACname;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetACname;
		opencascade::handle<TCollection_HAsciiString> GetACname();

		/****** STEPConstruct_ContextTool::GetACschemaName ******/
		/****** md5 signature: 7eeab692f3fcbd2eebdf0c5c9866890b ******/
		%feature("compactdefaultargs") GetACschemaName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetACschemaName;
		opencascade::handle<TCollection_HAsciiString> GetACschemaName();

		/****** STEPConstruct_ContextTool::GetACstatus ******/
		/****** md5 signature: f580580d937083f5019ffc50ffc89355 ******/
		%feature("compactdefaultargs") GetACstatus;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetACstatus;
		opencascade::handle<TCollection_HAsciiString> GetACstatus();

		/****** STEPConstruct_ContextTool::GetACyear ******/
		/****** md5 signature: ffee3c003a0384e8ceac68cc91004ce2 ******/
		%feature("compactdefaultargs") GetACyear;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetACyear;
		Standard_Integer GetACyear();

		/****** STEPConstruct_ContextTool::GetAPD ******/
		/****** md5 signature: 95e9054d44407daae5eff76f05165a8c ******/
		%feature("compactdefaultargs") GetAPD;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApplicationProtocolDefinition>

Description
-----------
No available documentation.
") GetAPD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAPD();

		/****** STEPConstruct_ContextTool::GetDefaultAxis ******/
		/****** md5 signature: 828743366f59e86971c182fcfea0c5f5 ******/
		%feature("compactdefaultargs") GetDefaultAxis;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
Returns a default axis placement.
") GetDefaultAxis;
		opencascade::handle<StepGeom_Axis2Placement3d> GetDefaultAxis();

		/****** STEPConstruct_ContextTool::GetProductName ******/
		/****** md5 signature: 74b571b7b7d9ddf447f491b1759f4261 ******/
		%feature("compactdefaultargs") GetProductName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Generates a product name basing on write.step.product.name parameter and current position in the assembly structure.
") GetProductName;
		opencascade::handle<TCollection_HAsciiString> GetProductName();

		/****** STEPConstruct_ContextTool::GetRootsForAssemblyLink ******/
		/****** md5 signature: 6b7fbd9fa49372633d76e2cb9ba9f545 ******/
		%feature("compactdefaultargs") GetRootsForAssemblyLink;
		%feature("autodoc", "
Parameters
----------
assembly: STEPConstruct_Assembly

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Produces and returns a full list of root entities required for assembly link identified by assembly (including NAUO and CDSR).
") GetRootsForAssemblyLink;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForAssemblyLink(const STEPConstruct_Assembly & assembly);

		/****** STEPConstruct_ContextTool::GetRootsForPart ******/
		/****** md5 signature: 26375ec7e779b7f7b5512d7dbb0e5893 ******/
		%feature("compactdefaultargs") GetRootsForPart;
		%feature("autodoc", "
Parameters
----------
SDRTool: STEPConstruct_Part

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Produces and returns a full list of root entities required for part identified by SDRTool (including SDR itself).
") GetRootsForPart;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForPart(const STEPConstruct_Part & SDRTool);

		/****** STEPConstruct_ContextTool::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns current index of assembly component on current level.
") Index;
		Standard_Integer Index();

		/****** STEPConstruct_ContextTool::IsAP203 ******/
		/****** md5 signature: 8b315db44337734a8f0f9efec9410761 ******/
		%feature("compactdefaultargs") IsAP203;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if APD.schema_name is config_control_design.
") IsAP203;
		Standard_Boolean IsAP203();

		/****** STEPConstruct_ContextTool::IsAP214 ******/
		/****** md5 signature: 8d1b3925d3ac81f151facb84057cda3b ******/
		%feature("compactdefaultargs") IsAP214;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if APD.schema_name is automotive_design.
") IsAP214;
		Standard_Boolean IsAP214();

		/****** STEPConstruct_ContextTool::IsAP242 ******/
		/****** md5 signature: 9bed2fca5abf26681a7b41957da9e535 ******/
		%feature("compactdefaultargs") IsAP242;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if APD.schema_name is ap242_managed_model_based_3d_engineering.
") IsAP242;
		Standard_Boolean IsAP242();

		/****** STEPConstruct_ContextTool::Level ******/
		/****** md5 signature: 06f7279e938b54c0bc4a49915192a536 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns current assembly level.
") Level;
		Standard_Integer Level();

		/****** STEPConstruct_ContextTool::NextIndex ******/
		/****** md5 signature: 37c249b2de63c7f1238e07e1f651137d ******/
		%feature("compactdefaultargs") NextIndex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextIndex;
		void NextIndex();

		/****** STEPConstruct_ContextTool::NextLevel ******/
		/****** md5 signature: c3b32cda79bd8630c760718ea9799f59 ******/
		%feature("compactdefaultargs") NextLevel;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextLevel;
		void NextLevel();

		/****** STEPConstruct_ContextTool::PrevIndex ******/
		/****** md5 signature: 1f4a694628bbe12a0e9d0f4da497d800 ******/
		%feature("compactdefaultargs") PrevIndex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") PrevIndex;
		void PrevIndex();

		/****** STEPConstruct_ContextTool::PrevLevel ******/
		/****** md5 signature: 194d4378c86427b12a84ce495456c4c0 ******/
		%feature("compactdefaultargs") PrevLevel;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") PrevLevel;
		void PrevLevel();

		/****** STEPConstruct_ContextTool::SetACname ******/
		/****** md5 signature: 01f37dfae813e172538d09a06fde9232 ******/
		%feature("compactdefaultargs") SetACname;
		%feature("autodoc", "
Parameters
----------
name: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetACname;
		void SetACname(const opencascade::handle<TCollection_HAsciiString> & name);

		/****** STEPConstruct_ContextTool::SetACschemaName ******/
		/****** md5 signature: 06f814773a65420d2443f7209974c2e2 ******/
		%feature("compactdefaultargs") SetACschemaName;
		%feature("autodoc", "
Parameters
----------
schemaName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetACschemaName;
		void SetACschemaName(const opencascade::handle<TCollection_HAsciiString> & schemaName);

		/****** STEPConstruct_ContextTool::SetACstatus ******/
		/****** md5 signature: fde42f248b2272452c753c542a1dd428 ******/
		%feature("compactdefaultargs") SetACstatus;
		%feature("autodoc", "
Parameters
----------
status: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetACstatus;
		void SetACstatus(const opencascade::handle<TCollection_HAsciiString> & status);

		/****** STEPConstruct_ContextTool::SetACyear ******/
		/****** md5 signature: f858031d9c4d5fded97eaf943e734a0b ******/
		%feature("compactdefaultargs") SetACyear;
		%feature("autodoc", "
Parameters
----------
year: int

Return
-------
None

Description
-----------
No available documentation.
") SetACyear;
		void SetACyear(const Standard_Integer year);

		/****** STEPConstruct_ContextTool::SetGlobalFactor ******/
		/****** md5 signature: 5028f8e2221225ecea3206930d81e67f ******/
		%feature("compactdefaultargs") SetGlobalFactor;
		%feature("autodoc", "
Parameters
----------
theGlobalFactor: StepData_Factors

Return
-------
None

Description
-----------
No available documentation.
") SetGlobalFactor;
		void SetGlobalFactor(const StepData_Factors & theGlobalFactor);

		/****** STEPConstruct_ContextTool::SetIndex ******/
		/****** md5 signature: e532bcf6ded7ea35dd810f127d134732 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
ind: int

Return
-------
None

Description
-----------
Changes current index of assembly component on current level.
") SetIndex;
		void SetIndex(const Standard_Integer ind);

		/****** STEPConstruct_ContextTool::SetLevel ******/
		/****** md5 signature: 96086cf4262787a9b0e671fa4e9ed87d ******/
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "
Parameters
----------
lev: int

Return
-------
None

Description
-----------
Changes current assembly level.
") SetLevel;
		void SetLevel(const Standard_Integer lev);

		/****** STEPConstruct_ContextTool::SetModel ******/
		/****** md5 signature: 3e50615c9ad790486b5ae0c21bfe2648 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
aStepModel: StepData_StepModel

Return
-------
None

Description
-----------
Initialize ApplicationProtocolDefinition by the first entity of that type found in the model.
") SetModel;
		void SetModel(const opencascade::handle<StepData_StepModel> & aStepModel);

};


%extend STEPConstruct_ContextTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPConstruct_Part *
***************************/
class STEPConstruct_Part {
	public:
		/****** STEPConstruct_Part::STEPConstruct_Part ******/
		/****** md5 signature: 06fcc64940ad56d3efafd95327b26fd5 ******/
		%feature("compactdefaultargs") STEPConstruct_Part;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPConstruct_Part;
		 STEPConstruct_Part();

		/****** STEPConstruct_Part::AC ******/
		/****** md5 signature: 09a13308a9df5c06b5ae4947a9dc5ab2 ******/
		%feature("compactdefaultargs") AC;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApplicationContext>

Description
-----------
No available documentation.
") AC;
		opencascade::handle<StepBasic_ApplicationContext> AC();

		/****** STEPConstruct_Part::ACapplication ******/
		/****** md5 signature: 74b70621399ad45b29b124738d428694 ******/
		%feature("compactdefaultargs") ACapplication;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ACapplication;
		opencascade::handle<TCollection_HAsciiString> ACapplication();

		/****** STEPConstruct_Part::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** STEPConstruct_Part::MakeSDR ******/
		/****** md5 signature: 97781b0e3545c0a0c5fda0a3f0af72a3 ******/
		%feature("compactdefaultargs") MakeSDR;
		%feature("autodoc", "
Parameters
----------
aShape: StepShape_ShapeRepresentation
aName: TCollection_HAsciiString
AC: StepBasic_ApplicationContext
theStepModel: StepData_StepModel

Return
-------
None

Description
-----------
No available documentation.
") MakeSDR;
		void MakeSDR(const opencascade::handle<StepShape_ShapeRepresentation> & aShape, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & AC, opencascade::handle<StepData_StepModel> & theStepModel);

		/****** STEPConstruct_Part::PC ******/
		/****** md5 signature: 4b00ee1014f481885d4ebd1bc2d9b97f ******/
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductContext>

Description
-----------
No available documentation.
") PC;
		opencascade::handle<StepBasic_ProductContext> PC();

		/****** STEPConstruct_Part::PCdisciplineType ******/
		/****** md5 signature: 71049c12e6d1d54bd339e1c3a8290cd0 ******/
		%feature("compactdefaultargs") PCdisciplineType;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PCdisciplineType;
		opencascade::handle<TCollection_HAsciiString> PCdisciplineType();

		/****** STEPConstruct_Part::PCname ******/
		/****** md5 signature: 6f0205a6e207cf60dbb324a551b60389 ******/
		%feature("compactdefaultargs") PCname;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PCname;
		opencascade::handle<TCollection_HAsciiString> PCname();

		/****** STEPConstruct_Part::PD ******/
		/****** md5 signature: c9a9608f7981f80b3a7f9616e62e0cdf ******/
		%feature("compactdefaultargs") PD;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
No available documentation.
") PD;
		opencascade::handle<StepBasic_ProductDefinition> PD();

		/****** STEPConstruct_Part::PDC ******/
		/****** md5 signature: 27d66a3a38107c53c110eaa91290fa39 ******/
		%feature("compactdefaultargs") PDC;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionContext>

Description
-----------
No available documentation.
") PDC;
		opencascade::handle<StepBasic_ProductDefinitionContext> PDC();

		/****** STEPConstruct_Part::PDCname ******/
		/****** md5 signature: c7aa518220bba4b33ae69180b66fab03 ******/
		%feature("compactdefaultargs") PDCname;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PDCname;
		opencascade::handle<TCollection_HAsciiString> PDCname();

		/****** STEPConstruct_Part::PDCstage ******/
		/****** md5 signature: 475d98c78b6dc97cd57e747c6fc430eb ******/
		%feature("compactdefaultargs") PDCstage;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PDCstage;
		opencascade::handle<TCollection_HAsciiString> PDCstage();

		/****** STEPConstruct_Part::PDF ******/
		/****** md5 signature: b3db07e24e18d94b92ca8f0a9faf2dac ******/
		%feature("compactdefaultargs") PDF;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
No available documentation.
") PDF;
		opencascade::handle<StepBasic_ProductDefinitionFormation> PDF();

		/****** STEPConstruct_Part::PDFdescription ******/
		/****** md5 signature: 9aa2d77a10bc06ed52fe47afae2409ad ******/
		%feature("compactdefaultargs") PDFdescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PDFdescription;
		opencascade::handle<TCollection_HAsciiString> PDFdescription();

		/****** STEPConstruct_Part::PDFid ******/
		/****** md5 signature: c0206c4237219f9afbb46e8328aa0bd3 ******/
		%feature("compactdefaultargs") PDFid;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PDFid;
		opencascade::handle<TCollection_HAsciiString> PDFid();

		/****** STEPConstruct_Part::PDS ******/
		/****** md5 signature: e5fed0abd655308090586299f85ecca9 ******/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductDefinitionShape>

Description
-----------
No available documentation.
") PDS;
		opencascade::handle<StepRepr_ProductDefinitionShape> PDS();

		/****** STEPConstruct_Part::PDSdescription ******/
		/****** md5 signature: 2b13743df4a43771390282aaaa49e20b ******/
		%feature("compactdefaultargs") PDSdescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PDSdescription;
		opencascade::handle<TCollection_HAsciiString> PDSdescription();

		/****** STEPConstruct_Part::PDSname ******/
		/****** md5 signature: d7e08e2e2ba3c65a25a51aace1e57873 ******/
		%feature("compactdefaultargs") PDSname;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PDSname;
		opencascade::handle<TCollection_HAsciiString> PDSname();

		/****** STEPConstruct_Part::PDdescription ******/
		/****** md5 signature: 477e776b757faaa200f0d62aa299a9ea ******/
		%feature("compactdefaultargs") PDdescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PDdescription;
		opencascade::handle<TCollection_HAsciiString> PDdescription();

		/****** STEPConstruct_Part::PRPC ******/
		/****** md5 signature: 98d0cb48e88118f75266361a14a0794e ******/
		%feature("compactdefaultargs") PRPC;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductRelatedProductCategory>

Description
-----------
No available documentation.
") PRPC;
		opencascade::handle<StepBasic_ProductRelatedProductCategory> PRPC();

		/****** STEPConstruct_Part::PRPCdescription ******/
		/****** md5 signature: f09e3bbe526b6ced24296e007c4e4e0b ******/
		%feature("compactdefaultargs") PRPCdescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PRPCdescription;
		opencascade::handle<TCollection_HAsciiString> PRPCdescription();

		/****** STEPConstruct_Part::PRPCname ******/
		/****** md5 signature: 2a4f7cf7db7a8f831df67e187775ac8c ******/
		%feature("compactdefaultargs") PRPCname;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PRPCname;
		opencascade::handle<TCollection_HAsciiString> PRPCname();

		/****** STEPConstruct_Part::Pdescription ******/
		/****** md5 signature: 4245f3a287ededc7d66d0fb742f4c3cd ******/
		%feature("compactdefaultargs") Pdescription;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Pdescription;
		opencascade::handle<TCollection_HAsciiString> Pdescription();

		/****** STEPConstruct_Part::Pid ******/
		/****** md5 signature: 4d74772b7871aa2be03e96b344804007 ******/
		%feature("compactdefaultargs") Pid;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Pid;
		opencascade::handle<TCollection_HAsciiString> Pid();

		/****** STEPConstruct_Part::Pname ******/
		/****** md5 signature: 437a1146d907bc8ea6fe90a22c711fa8 ******/
		%feature("compactdefaultargs") Pname;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Pname;
		opencascade::handle<TCollection_HAsciiString> Pname();

		/****** STEPConstruct_Part::Product ******/
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

		/****** STEPConstruct_Part::ReadSDR ******/
		/****** md5 signature: 35fbf89041c7d6c96c5e49a4aa5a344e ******/
		%feature("compactdefaultargs") ReadSDR;
		%feature("autodoc", "
Parameters
----------
aShape: StepShape_ShapeDefinitionRepresentation

Return
-------
None

Description
-----------
No available documentation.
") ReadSDR;
		void ReadSDR(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aShape);

		/****** STEPConstruct_Part::SDRValue ******/
		/****** md5 signature: 130fbe83fda99eb7fbd54f4f09c2dd2a ******/
		%feature("compactdefaultargs") SDRValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ShapeDefinitionRepresentation>

Description
-----------
Returns SDR or Null if not done.
") SDRValue;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> SDRValue();

		/****** STEPConstruct_Part::SRValue ******/
		/****** md5 signature: 6847c48c4f9b4d60b3efca15118db72f ******/
		%feature("compactdefaultargs") SRValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
Returns SDR->UsedRepresentation() or Null if not done.
") SRValue;
		opencascade::handle<StepShape_ShapeRepresentation> SRValue();

		/****** STEPConstruct_Part::SetACapplication ******/
		/****** md5 signature: fba1ce8cf54ca97ba8684fcb77347420 ******/
		%feature("compactdefaultargs") SetACapplication;
		%feature("autodoc", "
Parameters
----------
text: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetACapplication;
		void SetACapplication(const opencascade::handle<TCollection_HAsciiString> & text);

		/****** STEPConstruct_Part::SetPCdisciplineType ******/
		/****** md5 signature: 3a37375b7820dde3568f2010d68d696d ******/
		%feature("compactdefaultargs") SetPCdisciplineType;
		%feature("autodoc", "
Parameters
----------
label: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPCdisciplineType;
		void SetPCdisciplineType(const opencascade::handle<TCollection_HAsciiString> & label);

		/****** STEPConstruct_Part::SetPCname ******/
		/****** md5 signature: 3013a13e8ce7658533f997a640420f90 ******/
		%feature("compactdefaultargs") SetPCname;
		%feature("autodoc", "
Parameters
----------
name: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPCname;
		void SetPCname(const opencascade::handle<TCollection_HAsciiString> & name);

		/****** STEPConstruct_Part::SetPDCname ******/
		/****** md5 signature: 84b14f08bcd05ff81bb10e3d30c31607 ******/
		%feature("compactdefaultargs") SetPDCname;
		%feature("autodoc", "
Parameters
----------
label: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPDCname;
		void SetPDCname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****** STEPConstruct_Part::SetPDCstage ******/
		/****** md5 signature: ead120e5cf433abce41f602b8b0bbe5a ******/
		%feature("compactdefaultargs") SetPDCstage;
		%feature("autodoc", "
Parameters
----------
label: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPDCstage;
		void SetPDCstage(const opencascade::handle<TCollection_HAsciiString> & label);

		/****** STEPConstruct_Part::SetPDFdescription ******/
		/****** md5 signature: 5cb4baf329a67e7e2f4419233c731967 ******/
		%feature("compactdefaultargs") SetPDFdescription;
		%feature("autodoc", "
Parameters
----------
text: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPDFdescription;
		void SetPDFdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****** STEPConstruct_Part::SetPDFid ******/
		/****** md5 signature: 70319223b8bc580a5dcfd07417507ec8 ******/
		%feature("compactdefaultargs") SetPDFid;
		%feature("autodoc", "
Parameters
----------
id: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPDFid;
		void SetPDFid(const opencascade::handle<TCollection_HAsciiString> & id);

		/****** STEPConstruct_Part::SetPDSdescription ******/
		/****** md5 signature: 04db2c7487813db9853718536d12c0a8 ******/
		%feature("compactdefaultargs") SetPDSdescription;
		%feature("autodoc", "
Parameters
----------
text: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPDSdescription;
		void SetPDSdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****** STEPConstruct_Part::SetPDSname ******/
		/****** md5 signature: ef1239e0adbe927026cd9179d4590338 ******/
		%feature("compactdefaultargs") SetPDSname;
		%feature("autodoc", "
Parameters
----------
label: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPDSname;
		void SetPDSname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****** STEPConstruct_Part::SetPDdescription ******/
		/****** md5 signature: e4fd1d26cc6cb8ff290c435e1e7fe03e ******/
		%feature("compactdefaultargs") SetPDdescription;
		%feature("autodoc", "
Parameters
----------
text: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPDdescription;
		void SetPDdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****** STEPConstruct_Part::SetPRPCdescription ******/
		/****** md5 signature: fe1d626801fa995ec037f5618f96cfe2 ******/
		%feature("compactdefaultargs") SetPRPCdescription;
		%feature("autodoc", "
Parameters
----------
text: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPRPCdescription;
		void SetPRPCdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****** STEPConstruct_Part::SetPRPCname ******/
		/****** md5 signature: 5f301c3cf57e61743344dd60c6b9d664 ******/
		%feature("compactdefaultargs") SetPRPCname;
		%feature("autodoc", "
Parameters
----------
label: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPRPCname;
		void SetPRPCname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****** STEPConstruct_Part::SetPdescription ******/
		/****** md5 signature: 10c65cad5221288b6f5c7b17024d35d0 ******/
		%feature("compactdefaultargs") SetPdescription;
		%feature("autodoc", "
Parameters
----------
text: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPdescription;
		void SetPdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****** STEPConstruct_Part::SetPid ******/
		/****** md5 signature: 0d7bc629eba6c31b540fff9c460f0e6e ******/
		%feature("compactdefaultargs") SetPid;
		%feature("autodoc", "
Parameters
----------
id: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPid;
		void SetPid(const opencascade::handle<TCollection_HAsciiString> & id);

		/****** STEPConstruct_Part::SetPname ******/
		/****** md5 signature: 62a9f79d5cc908ae9e75242fd96b1e0b ******/
		%feature("compactdefaultargs") SetPname;
		%feature("autodoc", "
Parameters
----------
label: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPname;
		void SetPname(const opencascade::handle<TCollection_HAsciiString> & label);

};


%extend STEPConstruct_Part {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPConstruct_Tool *
***************************/
class STEPConstruct_Tool {
	public:
		/****** STEPConstruct_Tool::STEPConstruct_Tool ******/
		/****** md5 signature: efcaf1a60d6ac4497f2828455d46647b ******/
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") STEPConstruct_Tool;
		 STEPConstruct_Tool();

		/****** STEPConstruct_Tool::STEPConstruct_Tool ******/
		/****** md5 signature: 85c33272fb015f3f0363768e09687c4f ******/
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
Creates a tool and loads it with worksession.
") STEPConstruct_Tool;
		 STEPConstruct_Tool(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPConstruct_Tool::FinderProcess ******/
		/****** md5 signature: f8dfec4fe475dca1c15ced299bbfcbf0 ******/
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_FinderProcess>

Description
-----------
Returns FinderProcess (writing; Null if not loaded).
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess();

		/****** STEPConstruct_Tool::Graph ******/
		/****** md5 signature: 602c8343faeb8d6533fd8cb29044d22d ******/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "
Parameters
----------
recompute: bool (optional, default to Standard_False)

Return
-------
Interface_Graph

Description
-----------
Returns current graph (recomputing if necessary).
") Graph;
		const Interface_Graph & Graph(const Standard_Boolean recompute = Standard_False);

		/****** STEPConstruct_Tool::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns current model (Null if not loaded).
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** STEPConstruct_Tool::TransientProcess ******/
		/****** md5 signature: 0d1e45ead605e0700d65c1f7838e32c2 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns TransientProcess (reading; Null if not loaded).
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

		/****** STEPConstruct_Tool::WS ******/
		/****** md5 signature: 7abc09281c8fab10273013886821795a ******/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_WorkSession>

Description
-----------
Returns currently loaded WorkSession.
") WS;
		const opencascade::handle<XSControl_WorkSession> & WS();

};


%extend STEPConstruct_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPConstruct_UnitContext *
**********************************/
class STEPConstruct_UnitContext {
	public:
		/****** STEPConstruct_UnitContext::STEPConstruct_UnitContext ******/
		/****** md5 signature: 1d15166a4cdfb67887e03bffe127aa69 ******/
		%feature("compactdefaultargs") STEPConstruct_UnitContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty tool.
") STEPConstruct_UnitContext;
		 STEPConstruct_UnitContext();

		/****** STEPConstruct_UnitContext::AreaDone ******/
		/****** md5 signature: 7da71b8eaa4403795bb4b5f632d8e5dd ******/
		%feature("compactdefaultargs") AreaDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if areaFactor is computed.
") AreaDone;
		Standard_Boolean AreaDone();

		/****** STEPConstruct_UnitContext::AreaFactor ******/
		/****** md5 signature: 4c7b44bc49bb7530d8f62e93a85647f8 ******/
		%feature("compactdefaultargs") AreaFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the areaFactor.
") AreaFactor;
		Standard_Real AreaFactor();

		/****** STEPConstruct_UnitContext::ComputeFactors ******/
		/****** md5 signature: e3de9d0095f3a8e6e5926812aa2b9b21 ******/
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "
Parameters
----------
aContext: StepRepr_GlobalUnitAssignedContext
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
int

Description
-----------
Computes the length, plane angle and solid angle conversion factor . Returns a status, 0 if OK.
") ComputeFactors;
		Standard_Integer ComputeFactors(const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aContext, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** STEPConstruct_UnitContext::ComputeFactors ******/
		/****** md5 signature: c0f59aa5ac3bd1efefcff27304b254d4 ******/
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "
Parameters
----------
aUnit: StepBasic_NamedUnit
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
int

Description
-----------
No available documentation.
") ComputeFactors;
		Standard_Integer ComputeFactors(const opencascade::handle<StepBasic_NamedUnit> & aUnit, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** STEPConstruct_UnitContext::ComputeTolerance ******/
		/****** md5 signature: 9a5806980a9e9e53879adea3026bf9a2 ******/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "
Parameters
----------
aContext: StepRepr_GlobalUncertaintyAssignedContext

Return
-------
int

Description
-----------
Computes the uncertainty value (for length).
") ComputeTolerance;
		Standard_Integer ComputeTolerance(const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & aContext);

		/****** STEPConstruct_UnitContext::ConvertSiPrefix ******/
		/****** md5 signature: da1d7efb2a96f1799098b82e4aa16394 ******/
		%feature("compactdefaultargs") ConvertSiPrefix;
		%feature("autodoc", "
Parameters
----------
aPrefix: StepBasic_SiPrefix

Return
-------
float

Description
-----------
Convert SI prefix defined by enumeration to corresponding real factor (e.g. 1e6 for mega).
") ConvertSiPrefix;
		static Standard_Real ConvertSiPrefix(const StepBasic_SiPrefix aPrefix);

		/****** STEPConstruct_UnitContext::HasUncertainty ******/
		/****** md5 signature: bca0444c506978be32efc6fd9ed4818f ******/
		%feature("compactdefaultargs") HasUncertainty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a Uncertainty (for length) is recorded.
") HasUncertainty;
		Standard_Boolean HasUncertainty();

		/****** STEPConstruct_UnitContext::Init ******/
		/****** md5 signature: f77ccd8d8fd20c20822bd5b2de1d4f8e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
theModel: StepData_StepModel
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
Creates new context (units are MM and radians, uncertainty equal to Tol3d).
") Init;
		void Init(const Standard_Real Tol3d, const opencascade::handle<StepData_StepModel> & theModel, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** STEPConstruct_UnitContext::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Init was called successfully.
") IsDone;
		Standard_Boolean IsDone();

		/****** STEPConstruct_UnitContext::LengthDone ******/
		/****** md5 signature: 78dd228dbf5e3c84550b1acffff7bd32 ******/
		%feature("compactdefaultargs") LengthDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if ComputeFactors has calculated a LengthFactor.
") LengthDone;
		Standard_Boolean LengthDone();

		/****** STEPConstruct_UnitContext::LengthFactor ******/
		/****** md5 signature: 15771254030d5d42fe1035afb35f49f8 ******/
		%feature("compactdefaultargs") LengthFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the lengthFactor.
") LengthFactor;
		Standard_Real LengthFactor();

		/****** STEPConstruct_UnitContext::PlaneAngleDone ******/
		/****** md5 signature: 45cb64bc9ea96042977f266a79a43cf7 ******/
		%feature("compactdefaultargs") PlaneAngleDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if ComputeFactors has calculated a PlaneAngleFactor.
") PlaneAngleDone;
		Standard_Boolean PlaneAngleDone();

		/****** STEPConstruct_UnitContext::PlaneAngleFactor ******/
		/****** md5 signature: 24a746fdf36cb34234bfa6984c9c2721 ******/
		%feature("compactdefaultargs") PlaneAngleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the planeAngleFactor.
") PlaneAngleFactor;
		Standard_Real PlaneAngleFactor();

		/****** STEPConstruct_UnitContext::SolidAngleDone ******/
		/****** md5 signature: 713d553b89570e13b2907e214c3badb5 ******/
		%feature("compactdefaultargs") SolidAngleDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if ComputeFactors has calculated a SolidAngleFactor.
") SolidAngleDone;
		Standard_Boolean SolidAngleDone();

		/****** STEPConstruct_UnitContext::SolidAngleFactor ******/
		/****** md5 signature: 5c610c278e1133bf63025e97445bcd03 ******/
		%feature("compactdefaultargs") SolidAngleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the solidAngleFactor.
") SolidAngleFactor;
		Standard_Real SolidAngleFactor();

		/****** STEPConstruct_UnitContext::StatusMessage ******/
		/****** md5 signature: 33ed50ac872bb5339679b3dae94aff9a ******/
		%feature("compactdefaultargs") StatusMessage;
		%feature("autodoc", "
Parameters
----------
status: int

Return
-------
str

Description
-----------
Returns a message for a given status (0 - empty) This message can then be added as warning for transfer.
") StatusMessage;
		Standard_CString StatusMessage(const Standard_Integer status);

		/****** STEPConstruct_UnitContext::Uncertainty ******/
		/****** md5 signature: d91d2a9d8a7c9b921d9f843bf59b3624 ******/
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Uncertainty value (for length) It has been converted with LengthFactor.
") Uncertainty;
		Standard_Real Uncertainty();

		/****** STEPConstruct_UnitContext::Value ******/
		/****** md5 signature: 9b258d5466cd03ee82c1554d4030973a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx>

Description
-----------
Returns context (or Null if not done).
") Value;
		opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> Value();

		/****** STEPConstruct_UnitContext::VolumeDone ******/
		/****** md5 signature: ed45f6bddcef6d7ac1a1f6940fc9c76d ******/
		%feature("compactdefaultargs") VolumeDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if volumeFactor is computed.
") VolumeDone;
		Standard_Boolean VolumeDone();

		/****** STEPConstruct_UnitContext::VolumeFactor ******/
		/****** md5 signature: 27268b8792818ce4ca912befcd45a905 ******/
		%feature("compactdefaultargs") VolumeFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the volumeFactor.
") VolumeFactor;
		Standard_Real VolumeFactor();

};


%extend STEPConstruct_UnitContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class STEPConstruct_ExternRefs *
*********************************/
class STEPConstruct_ExternRefs : public STEPConstruct_Tool {
	public:
		/****** STEPConstruct_ExternRefs::STEPConstruct_ExternRefs ******/
		/****** md5 signature: 1f8efbe1d156fc01e6c952af939d2b6b ******/
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs();

		/****** STEPConstruct_ExternRefs::STEPConstruct_ExternRefs ******/
		/****** md5 signature: 20e929397af75f5ed5cd0aa8f135102b ******/
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
Creates a tool and initializes it.
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPConstruct_ExternRefs::AddExternRef ******/
		/****** md5 signature: 4daa7d7a9c20a39da66c9c4347c646c2 ******/
		%feature("compactdefaultargs") AddExternRef;
		%feature("autodoc", "
Parameters
----------
filename: str
PD: StepBasic_ProductDefinition
format: str

Return
-------
int

Description
-----------
Create a new external reference with specified attributes attached to a given SDR <format> can be Null string, in that case this information is not written. Else, it can be 'STEP AP214' or 'STEP AP203' Returns index of a new extern ref.
") AddExternRef;
		Standard_Integer AddExternRef(Standard_CString filename, const opencascade::handle<StepBasic_ProductDefinition> & PD, Standard_CString format);

		/****** STEPConstruct_ExternRefs::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal fields (list of defined extern refs).
") Clear;
		void Clear();

		/****** STEPConstruct_ExternRefs::DocFile ******/
		/****** md5 signature: 4e5532dc567edd6c5cf39a25cda27d46 ******/
		%feature("compactdefaultargs") DocFile;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_DocumentFile>

Description
-----------
Returns DocumentFile to which numth extern reference is associated. Returns Null if cannot be detected.
") DocFile;
		opencascade::handle<StepBasic_DocumentFile> DocFile(const Standard_Integer num);

		/****** STEPConstruct_ExternRefs::FileName ******/
		/****** md5 signature: 43c1d3f377c3a1849b8dd53db818414e ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
Returns filename for numth extern reference Returns Null if FileName is not defined or bad.
") FileName;
		Standard_CString FileName(const Standard_Integer num);

		/****** STEPConstruct_ExternRefs::Format ******/
		/****** md5 signature: 600d3fed43f6e174acc9f0aff53e1d79 ******/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns format identification string for the extern document Returns Null handle if format is not defined.
") Format;
		opencascade::handle<TCollection_HAsciiString> Format(const Standard_Integer num);

		/****** STEPConstruct_ExternRefs::GetAP214APD ******/
		/****** md5 signature: e5d5c23db97ab47e38bfdbb1e8f208df ******/
		%feature("compactdefaultargs") GetAP214APD;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApplicationProtocolDefinition>

Description
-----------
Returns the ApplicationProtocolDefinition of the PDM schema NOTE: if not defined then create new APD with new Application Context.
") GetAP214APD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAP214APD();

		/****** STEPConstruct_ExternRefs::Init ******/
		/****** md5 signature: a41268d32348bb8b355efce3731d2872 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
bool

Description
-----------
Initializes tool; returns True if succeeded.
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPConstruct_ExternRefs::LoadExternRefs ******/
		/****** md5 signature: f4a2bfe61b7f4e24004a6d6eb81cd42f ******/
		%feature("compactdefaultargs") LoadExternRefs;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Searches current STEP model for external references and loads them to the internal data structures NOTE: does not clear data structures before loading.
") LoadExternRefs;
		Standard_Boolean LoadExternRefs();

		/****** STEPConstruct_ExternRefs::NbExternRefs ******/
		/****** md5 signature: 4d108b9b54670b0a78dd4f28fa20e284 ******/
		%feature("compactdefaultargs") NbExternRefs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of defined extern references.
") NbExternRefs;
		Standard_Integer NbExternRefs();

		/****** STEPConstruct_ExternRefs::ProdDef ******/
		/****** md5 signature: 6a8634b4bdac2f4a979a94ebdda69231 ******/
		%feature("compactdefaultargs") ProdDef;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns ProductDefinition to which numth extern reference is associated. Returns Null if cannot be detected or if extern reference is not associated to SDR in a proper way.
") ProdDef;
		opencascade::handle<StepBasic_ProductDefinition> ProdDef(const Standard_Integer num);

		/****** STEPConstruct_ExternRefs::SetAP214APD ******/
		/****** md5 signature: 1abd220d7483a71b39192e4aa4fb285f ******/
		%feature("compactdefaultargs") SetAP214APD;
		%feature("autodoc", "
Parameters
----------
APD: StepBasic_ApplicationProtocolDefinition

Return
-------
None

Description
-----------
Set the ApplicationProtocolDefinition of the PDM schema.
") SetAP214APD;
		void SetAP214APD(const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & APD);

		/****** STEPConstruct_ExternRefs::WriteExternRefs ******/
		/****** md5 signature: d195629663bea3383eec4f63ca9e8938 ******/
		%feature("compactdefaultargs") WriteExternRefs;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Adds all the currently defined external refs to the model Returns number of written extern refs.
") WriteExternRefs;
		Standard_Integer WriteExternRefs(const Standard_Integer num);

		/****** STEPConstruct_ExternRefs::checkAP214Shared ******/
		/****** md5 signature: 786641e067c12f9f54e3c4ebf017e83e ******/
		%feature("compactdefaultargs") checkAP214Shared;
		%feature("autodoc", "Return
-------
None

Description
-----------
Check (create if it is null) all shared entities for the model.
") checkAP214Shared;
		void checkAP214Shared();

};


%extend STEPConstruct_ExternRefs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class STEPConstruct_Styles *
*****************************/
class STEPConstruct_Styles : public STEPConstruct_Tool {
	public:
		/****** STEPConstruct_Styles::STEPConstruct_Styles ******/
		/****** md5 signature: c46fb2487a4b9243951920825709bd09 ******/
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") STEPConstruct_Styles;
		 STEPConstruct_Styles();

		/****** STEPConstruct_Styles::STEPConstruct_Styles ******/
		/****** md5 signature: 4e51d7d1a74288cbec2280e80809efed ******/
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
Creates a tool and initializes it.
") STEPConstruct_Styles;
		 STEPConstruct_Styles(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPConstruct_Styles::AddStyle ******/
		/****** md5 signature: 3df98c40338185f9e45452d43ef23ab0 ******/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "
Parameters
----------
style: StepVisual_StyledItem

Return
-------
None

Description
-----------
Adds a style to a sequence.
") AddStyle;
		void AddStyle(const opencascade::handle<StepVisual_StyledItem> & style);

		/****** STEPConstruct_Styles::AddStyle ******/
		/****** md5 signature: 2367472aaf1ebcbd470196984908b656 ******/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "
Parameters
----------
item: StepRepr_RepresentationItem
PSA: StepVisual_PresentationStyleAssignment
Override: StepVisual_StyledItem

Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
Create a style linking giving PSA to the item, and add it to the sequence of stored styles. If Override is not Null, then the resulting style will be of the subtype OverridingStyledItem.
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA, const opencascade::handle<StepVisual_StyledItem> & Override);

		/****** STEPConstruct_Styles::AddStyle ******/
		/****** md5 signature: a3e24f459631405f8d6ee2f0b78f80d2 ******/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
PSA: StepVisual_PresentationStyleAssignment
Override: StepVisual_StyledItem

Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
Create a style linking giving PSA to the Shape, and add it to the sequence of stored styles. If Override is not Null, then the resulting style will be of the subtype OverridingStyledItem. The Sape is used to find corresponding STEP entity by call to STEPConstruct::FindEntity(), then previous method is called.
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle(const TopoDS_Shape & Shape, const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA, const opencascade::handle<StepVisual_StyledItem> & Override);

		/****** STEPConstruct_Styles::ClearStyles ******/
		/****** md5 signature: 3c055a351c50dc937879dd8ee1f35179 ******/
		%feature("compactdefaultargs") ClearStyles;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all defined styles and PSA sequence.
") ClearStyles;
		void ClearStyles();

		/****** STEPConstruct_Styles::CreateMDGPR ******/
		/****** md5 signature: e7a829061e38a38ebfd438078ef6d466 ******/
		%feature("compactdefaultargs") CreateMDGPR;
		%feature("autodoc", "
Parameters
----------
Context: StepRepr_RepresentationContext
MDGPR: StepVisual_MechanicalDesignGeometricPresentationRepresentation
theStepModel: StepData_StepModel

Return
-------
bool

Description
-----------
Create MDGPR, fill it with all the styles previously defined, and add it to the model.
") CreateMDGPR;
		Standard_Boolean CreateMDGPR(const opencascade::handle<StepRepr_RepresentationContext> & Context, opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> & MDGPR, opencascade::handle<StepData_StepModel> & theStepModel);

		/****** STEPConstruct_Styles::CreateNAUOSRD ******/
		/****** md5 signature: 2dc1e1e3a3196d80506df8dd27ab2f97 ******/
		%feature("compactdefaultargs") CreateNAUOSRD;
		%feature("autodoc", "
Parameters
----------
Context: StepRepr_RepresentationContext
CDSR: StepShape_ContextDependentShapeRepresentation
initPDS: StepRepr_ProductDefinitionShape

Return
-------
bool

Description
-----------
Create MDGPR, fill it with all the styles previously defined, and add it to the model IMPORTANT: <initPDS> must be null when use for NAUO colors <initPDS> initialised only for SHUO case.
") CreateNAUOSRD;
		Standard_Boolean CreateNAUOSRD(const opencascade::handle<StepRepr_RepresentationContext> & Context, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR, const opencascade::handle<StepRepr_ProductDefinitionShape> & initPDS);

		/****** STEPConstruct_Styles::DecodeColor ******/
		/****** md5 signature: e6ca5c55fd8058d3e8c5437c3a9c90c5 ******/
		%feature("compactdefaultargs") DecodeColor;
		%feature("autodoc", "
Parameters
----------
Colour: StepVisual_Colour
Col: Quantity_Color

Return
-------
bool

Description
-----------
Decodes STEP color and fills the Quantity_Color. Returns True if OK or False if color is not recognized.
") DecodeColor;
		static Standard_Boolean DecodeColor(const opencascade::handle<StepVisual_Colour> & Colour, Quantity_Color & Col);

		/****** STEPConstruct_Styles::EncodeColor ******/
		/****** md5 signature: b8f7fe0b0b026d21e660b266032b3b13 ******/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "
Parameters
----------
Col: Quantity_Color

Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
Create STEP color entity by given Quantity_Color The analysis is performed for whether the color corresponds to one of standard colors predefined in STEP. In that case, PredefinedColour entity is created instead of RGBColour.
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor(const Quantity_Color & Col);

		/****** STEPConstruct_Styles::EncodeColor ******/
		/****** md5 signature: 5512546316147cd700d4eaee0951e2e8 ******/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "
Parameters
----------
Col: Quantity_Color
DPDCs: STEPConstruct_DataMapOfAsciiStringTransient
ColRGBs: STEPConstruct_DataMapOfPointTransient

Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
Create STEP color entity by given Quantity_Color The analysis is performed for whether the color corresponds to one of standard colors predefined in STEP. In that case, PredefinedColour entity is created instead of RGBColour.
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor(const Quantity_Color & Col, STEPConstruct_DataMapOfAsciiStringTransient & DPDCs, STEPConstruct_DataMapOfPointTransient & ColRGBs);

		/****** STEPConstruct_Styles::FindContext ******/
		/****** md5 signature: 686534002fbf51b23e0002361011ca16 ******/
		%feature("compactdefaultargs") FindContext;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape

Return
-------
opencascade::handle<StepRepr_RepresentationContext>

Description
-----------
Searches the STEP model for the RepresentationContext in which given shape is defined. This context (if found) can be used then in call to CreateMDGPR().
") FindContext;
		opencascade::handle<StepRepr_RepresentationContext> FindContext(const TopoDS_Shape & Shape);

		/****** STEPConstruct_Styles::GetColorPSA ******/
		/****** md5 signature: ec1cda08b766f766a74737a5399f5ef9 ******/
		%feature("compactdefaultargs") GetColorPSA;
		%feature("autodoc", "
Parameters
----------
item: StepRepr_RepresentationItem
Col: StepVisual_Colour

Return
-------
opencascade::handle<StepVisual_PresentationStyleAssignment>

Description
-----------
Returns a PresentationStyleAssignment entity which defines surface and curve colors as Col. This PSA is either created or taken from internal map where all PSAs created by this method are remembered.
") GetColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> GetColorPSA(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_Colour> & Col);

		/****** STEPConstruct_Styles::GetColors ******/
		/****** md5 signature: 1f0929b2e170b83d93ab61387da54beb ******/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "
Parameters
----------
theStyle: StepVisual_StyledItem
theSurfaceColour: StepVisual_Colour
theBoundaryColour: StepVisual_Colour
theCurveColour: StepVisual_Colour
theRenderColour: StepVisual_Colour

Return
-------
theRenderTransparency: float
theIsComponent: bool

Description
-----------
Extract color definitions from the style entity For each type of color supported, result can be either NULL if it is not defined by that style, or last definition (if they are 1 or more).
") GetColors;
		Standard_Boolean GetColors(const opencascade::handle<StepVisual_StyledItem> & theStyle, opencascade::handle<StepVisual_Colour> & theSurfaceColour, opencascade::handle<StepVisual_Colour> & theBoundaryColour, opencascade::handle<StepVisual_Colour> & theCurveColour, opencascade::handle<StepVisual_Colour> & theRenderColour, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****** STEPConstruct_Styles::Init ******/
		/****** md5 signature: a41268d32348bb8b355efce3731d2872 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
bool

Description
-----------
Initializes tool; returns True if succeeded.
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPConstruct_Styles::LoadInvisStyles ******/
		/****** md5 signature: 0e85b82c907be2deec7d1178e9b59af4 ******/
		%feature("compactdefaultargs") LoadInvisStyles;
		%feature("autodoc", "
Parameters
----------
InvSyles: TColStd_HSequenceOfTransient

Return
-------
bool

Description
-----------
Searches the STEP model for the INISIBILITY entities (which bring styles) and fills out sequence of styles.
") LoadInvisStyles;
		Standard_Boolean LoadInvisStyles(opencascade::handle<TColStd_HSequenceOfTransient> & InvSyles);

		/****** STEPConstruct_Styles::LoadStyles ******/
		/****** md5 signature: 7a3a805ebf468c04036b606dec93b856 ******/
		%feature("compactdefaultargs") LoadStyles;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Searches the STEP model for the MDGPR or DM entities (which bring styles) and fills sequence of styles.
") LoadStyles;
		Standard_Boolean LoadStyles();

		/****** STEPConstruct_Styles::MakeColorPSA ******/
		/****** md5 signature: 5617667584c537d5ebe338c07636b9e9 ******/
		%feature("compactdefaultargs") MakeColorPSA;
		%feature("autodoc", "
Parameters
----------
item: StepRepr_RepresentationItem
SurfCol: StepVisual_Colour
CurveCol: StepVisual_Colour
RenderCol: StepVisual_Colour
RenderTransp: float
isForNAUO: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<StepVisual_PresentationStyleAssignment>

Description
-----------
Create a PresentationStyleAssignment entity which defines two colors (for filling surfaces and curves) if isForNAUO true then returns PresentationStyleByContext.
") MakeColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> MakeColorPSA(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_Colour> & SurfCol, const opencascade::handle<StepVisual_Colour> & CurveCol, const opencascade::handle<StepVisual_Colour> & RenderCol, const Standard_Real RenderTransp, const Standard_Boolean isForNAUO = Standard_False);

		/****** STEPConstruct_Styles::NbRootStyles ******/
		/****** md5 signature: 4bb6a5a6f49e5abb7085f5ef57337a5a ******/
		%feature("compactdefaultargs") NbRootStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of override styles.
") NbRootStyles;
		Standard_Integer NbRootStyles();

		/****** STEPConstruct_Styles::NbStyles ******/
		/****** md5 signature: 9f5fbd515247307ce70e63c6f585ddb7 ******/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of defined styles.
") NbStyles;
		Standard_Integer NbStyles();

		/****** STEPConstruct_Styles::RootStyle ******/
		/****** md5 signature: 97e67ad6592e4e36a6444e18652921fc ******/
		%feature("compactdefaultargs") RootStyle;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
Returns override style with given index.
") RootStyle;
		opencascade::handle<StepVisual_StyledItem> RootStyle(const Standard_Integer i);

		/****** STEPConstruct_Styles::Style ******/
		/****** md5 signature: e152f39ac13e328dca6d350a6f881da8 ******/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
Returns style with given index.
") Style;
		opencascade::handle<StepVisual_StyledItem> Style(const Standard_Integer i);

};


%extend STEPConstruct_Styles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class STEPConstruct_ValidationProps *
**************************************/
class STEPConstruct_ValidationProps : public STEPConstruct_Tool {
	public:
		/****** STEPConstruct_ValidationProps::STEPConstruct_ValidationProps ******/
		/****** md5 signature: a7b156b3c80f215cfe9d049ad9ec7693 ******/
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps();

		/****** STEPConstruct_ValidationProps::STEPConstruct_ValidationProps ******/
		/****** md5 signature: 8cba10d799d94f804ca763dfc047a298 ******/
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
Creates a tool and loads it with worksession.
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPConstruct_ValidationProps::AddArea ******/
		/****** md5 signature: e2877fb15a0d3a6867b2e499eea4fb20 ******/
		%feature("compactdefaultargs") AddArea;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
Area: float

Return
-------
bool

Description
-----------
Adds surface area property for given shape (already mapped). Returns True if success, False in case of fail.
") AddArea;
		Standard_Boolean AddArea(const TopoDS_Shape & Shape, const Standard_Real Area);

		/****** STEPConstruct_ValidationProps::AddCentroid ******/
		/****** md5 signature: 4119e375beefd95b330a2b11126ae0fa ******/
		%feature("compactdefaultargs") AddCentroid;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
Pnt: gp_Pnt
instance: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Adds centroid property for given shape (already mapped). Returns True if success, False in case of fail If instance is True, then centroid is assigned to an instance of component in assembly.
") AddCentroid;
		Standard_Boolean AddCentroid(const TopoDS_Shape & Shape, const gp_Pnt & Pnt, const Standard_Boolean instance = Standard_False);

		/****** STEPConstruct_ValidationProps::AddProp ******/
		/****** md5 signature: 5b991713bf2f3c13e85d72348d22e507 ******/
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
Prop: StepRepr_RepresentationItem
Descr: str
instance: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
General method for adding (writing) a validation property for shape which should be already mapped on writing itself. It uses FindTarget() to find target STEP entity resulting from given shape, and associated context Returns True if success, False in case of fail.
") AddProp;
		Standard_Boolean AddProp(const TopoDS_Shape & Shape, const opencascade::handle<StepRepr_RepresentationItem> & Prop, Standard_CString Descr, const Standard_Boolean instance = Standard_False);

		/****** STEPConstruct_ValidationProps::AddProp ******/
		/****** md5 signature: f72fb71cc97ec8abf9b1b1524386d515 ******/
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "
Parameters
----------
target: StepRepr_CharacterizedDefinition
Context: StepRepr_RepresentationContext
Prop: StepRepr_RepresentationItem
Descr: str

Return
-------
bool

Description
-----------
General method for adding (writing) a validation property for shape which should be already mapped on writing itself. It takes target and Context entities which correspond to shape Returns True if success, False in case of fail.
") AddProp;
		Standard_Boolean AddProp(const StepRepr_CharacterizedDefinition & target, const opencascade::handle<StepRepr_RepresentationContext> & Context, const opencascade::handle<StepRepr_RepresentationItem> & Prop, Standard_CString Descr);

		/****** STEPConstruct_ValidationProps::AddVolume ******/
		/****** md5 signature: ce494cdd22f4586fedbbc19b590238d1 ******/
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
Vol: float

Return
-------
bool

Description
-----------
Adds volume property for given shape (already mapped). Returns True if success, False in case of fail.
") AddVolume;
		Standard_Boolean AddVolume(const TopoDS_Shape & Shape, const Standard_Real Vol);

		/****** STEPConstruct_ValidationProps::FindTarget ******/
		/****** md5 signature: 7d2e21f11abb38ad6cd418c4b0404080 ******/
		%feature("compactdefaultargs") FindTarget;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
target: StepRepr_CharacterizedDefinition
Context: StepRepr_RepresentationContext
instance: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Finds target STEP entity to which validation props should be assigned, and corresponding context, starting from shape Returns True if success, False in case of fail.
") FindTarget;
		Standard_Boolean FindTarget(const TopoDS_Shape & S, StepRepr_CharacterizedDefinition & target, opencascade::handle<StepRepr_RepresentationContext> & Context, const Standard_Boolean instance = Standard_False);

		/****** STEPConstruct_ValidationProps::GetPropNAUO ******/
		/****** md5 signature: 00f2ec9fa6dbab21c65468db734371e7 ******/
		%feature("compactdefaultargs") GetPropNAUO;
		%feature("autodoc", "
Parameters
----------
PD: StepRepr_PropertyDefinition

Return
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>

Description
-----------
Returns CDSR associated with given PpD or NULL if not found (when, try GetPropSDR).
") GetPropNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetPropNAUO(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****** STEPConstruct_ValidationProps::GetPropPD ******/
		/****** md5 signature: cd8dd7115dc2e81d9eef3cc12ac48f56 ******/
		%feature("compactdefaultargs") GetPropPD;
		%feature("autodoc", "
Parameters
----------
PD: StepRepr_PropertyDefinition

Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns SDR associated with given PpD or NULL if not found (when, try GetPropCDSR).
") GetPropPD;
		opencascade::handle<StepBasic_ProductDefinition> GetPropPD(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****** STEPConstruct_ValidationProps::GetPropPnt ******/
		/****** md5 signature: 2c0297d70aecdf76b1dde1e052f18407 ******/
		%feature("compactdefaultargs") GetPropPnt;
		%feature("autodoc", "
Parameters
----------
item: StepRepr_RepresentationItem
Context: StepRepr_RepresentationContext
Pnt: gp_Pnt
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Returns value of Centroid property (or False if it is not).
") GetPropPnt;
		Standard_Boolean GetPropPnt(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepRepr_RepresentationContext> & Context, gp_Pnt & Pnt, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** STEPConstruct_ValidationProps::GetPropReal ******/
		/****** md5 signature: ceacc2ead40bd4542466c7f10e78e8fd ******/
		%feature("compactdefaultargs") GetPropReal;
		%feature("autodoc", "
Parameters
----------
item: StepRepr_RepresentationItem
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
Val: float
isArea: bool

Description
-----------
Returns value of Real-Valued property (Area or Volume) If Property is neither Area nor Volume, returns False Else returns True and isArea indicates whether property is area or volume.
") GetPropReal;
		Standard_Boolean GetPropReal(const opencascade::handle<StepRepr_RepresentationItem> & item, Standard_Real &OutValue, Standard_Boolean &OutValue, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** STEPConstruct_ValidationProps::GetPropShape ******/
		/****** md5 signature: 16026c6cc5e907b0af72d056c5f3be1c ******/
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "
Parameters
----------
ProdDef: StepBasic_ProductDefinition

Return
-------
TopoDS_Shape

Description
-----------
Returns Shape associated with given SDR or Null Shape if not found.
") GetPropShape;
		TopoDS_Shape GetPropShape(const opencascade::handle<StepBasic_ProductDefinition> & ProdDef);

		/****** STEPConstruct_ValidationProps::GetPropShape ******/
		/****** md5 signature: c1acb50ef0bbfb37d2ffd763fd5d70e6 ******/
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "
Parameters
----------
PD: StepRepr_PropertyDefinition

Return
-------
TopoDS_Shape

Description
-----------
Returns Shape associated with given PpD or Null Shape if not found.
") GetPropShape;
		TopoDS_Shape GetPropShape(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****** STEPConstruct_ValidationProps::Init ******/
		/****** md5 signature: a41268d32348bb8b355efce3731d2872 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
bool

Description
-----------
Load worksession; returns True if succeeded.
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPConstruct_ValidationProps::LoadProps ******/
		/****** md5 signature: e20b1850e2c4978e8838902ce428c954 ******/
		%feature("compactdefaultargs") LoadProps;
		%feature("autodoc", "
Parameters
----------
seq: TColStd_SequenceOfTransient

Return
-------
bool

Description
-----------
Searches for entities of the type PropertyDefinitionRepresentation in the model and fills the sequence by them.
") LoadProps;
		Standard_Boolean LoadProps(TColStd_SequenceOfTransient & seq);

		/****** STEPConstruct_ValidationProps::SetAssemblyShape ******/
		/****** md5 signature: 2bea02eb53d21b8bd84a59fa21801c31 ******/
		%feature("compactdefaultargs") SetAssemblyShape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets current assembly shape SDR (for FindCDSR calls).
") SetAssemblyShape;
		void SetAssemblyShape(const TopoDS_Shape & shape);

};


%extend STEPConstruct_ValidationProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def stepconstruct_FindCDSR(*args):
	return stepconstruct.FindCDSR(*args)

@deprecated
def stepconstruct_FindEntity(*args):
	return stepconstruct.FindEntity(*args)

@deprecated
def stepconstruct_FindEntity(*args):
	return stepconstruct.FindEntity(*args)

@deprecated
def stepconstruct_FindShape(*args):
	return stepconstruct.FindShape(*args)

@deprecated
def STEPConstruct_Assembly_CheckSRRReversesNAUO(*args):
	return STEPConstruct_Assembly.CheckSRRReversesNAUO(*args)

@deprecated
def STEPConstruct_UnitContext_ConvertSiPrefix(*args):
	return STEPConstruct_UnitContext.ConvertSiPrefix(*args)

@deprecated
def STEPConstruct_Styles_DecodeColor(*args):
	return STEPConstruct_Styles.DecodeColor(*args)

@deprecated
def STEPConstruct_Styles_EncodeColor(*args):
	return STEPConstruct_Styles.EncodeColor(*args)

@deprecated
def STEPConstruct_Styles_EncodeColor(*args):
	return STEPConstruct_Styles.EncodeColor(*args)

}
