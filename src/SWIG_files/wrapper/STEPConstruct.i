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
%define STEPCONSTRUCTDOCSTRING
"STEPConstruct module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepconstruct.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
#include<gp_module.hxx>
#include<XSControl_module.hxx>
#include<StepVisual_module.hxx>
#include<Quantity_module.hxx>
#include<TopTools_module.hxx>
#include<IFSelect_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<StepData_module.hxx>
#include<StepShape_module.hxx>
#include<MoniTool_module.hxx>
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
%import gp.i
%import XSControl.i
%import StepVisual.i
%import Quantity.i

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
/* end handles declaration */

/* templates */
%template(STEPConstruct_DataMapOfAsciiStringTransient) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<Standard_Transient>,TCollection_AsciiString>;
%template(STEPConstruct_DataMapOfPointTransient) NCollection_DataMap<gp_Pnt,opencascade::handle<Standard_Transient>,STEPConstruct_PointHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>, TCollection_AsciiString>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
typedef NCollection_DataMap<gp_Pnt, opencascade::handle<Standard_Transient>, STEPConstruct_PointHasher>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>, TCollection_AsciiString> STEPConstruct_DataMapOfAsciiStringTransient;
typedef NCollection_DataMap<gp_Pnt, opencascade::handle<Standard_Transient>, STEPConstruct_PointHasher> STEPConstruct_DataMapOfPointTransient;
/* end typedefs declaration */

/**********************
* class STEPConstruct *
**********************/
%rename(stepconstruct) STEPConstruct;
class STEPConstruct {
	public:
		/****************** FindCDSR ******************/
		/**** md5 signature: df4f736080c1405cd8149af6842045a9 ****/
		%feature("compactdefaultargs") FindCDSR;
		%feature("autodoc", "Find cdsr correcponding to the component in the specified assembly.

Parameters
----------
ComponentBinder: Transfer_Binder
AssemblySDR: StepShape_ShapeDefinitionRepresentation
ComponentCDSR: StepShape_ContextDependentShapeRepresentation

Returns
-------
bool
") FindCDSR;
		static Standard_Boolean FindCDSR(const opencascade::handle<Transfer_Binder> & ComponentBinder, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & AssemblySDR, opencascade::handle<StepShape_ContextDependentShapeRepresentation> & ComponentCDSR);

		/****************** FindEntity ******************/
		/**** md5 signature: 864ce9b9c1ae0edf6f28a0c1b2e077f8 ****/
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "Returns step entity of the (sub)type of representationitem which is a result of the tranalation of the shape, or null if no result is recorded.

Parameters
----------
FinderProcess: Transfer_FinderProcess
Shape: TopoDS_Shape

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity(const opencascade::handle<Transfer_FinderProcess> & FinderProcess, const TopoDS_Shape & Shape);

		/****************** FindEntity ******************/
		/**** md5 signature: 2815856fafe557828959cf63bf1e6789 ****/
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "The same as above, but in the case if item not found, repeats search on the same shape without location. the loc corresponds to the location with which result is found (either location of the shape, or null).

Parameters
----------
FinderProcess: Transfer_FinderProcess
Shape: TopoDS_Shape
Loc: TopLoc_Location

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity(const opencascade::handle<Transfer_FinderProcess> & FinderProcess, const TopoDS_Shape & Shape, TopLoc_Location & Loc);

		/****************** FindShape ******************/
		/**** md5 signature: f9f36639a3db0f96fa7c9e9eb6ad6b79 ****/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "Returns shape resulting from given step entity (null if not mapped).

Parameters
----------
TransientProcess: Transfer_TransientProcess
item: StepRepr_RepresentationItem

Returns
-------
TopoDS_Shape
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
		/****************** STEPConstruct_AP203Context ******************/
		/**** md5 signature: 6b44e89ed3cd244f3f883840ebc180c0 ****/
		%feature("compactdefaultargs") STEPConstruct_AP203Context;
		%feature("autodoc", "Creates tool and fills constant fields.

Returns
-------
None
") STEPConstruct_AP203Context;
		 STEPConstruct_AP203Context();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all fields describing entities specific to each part.

Returns
-------
None
") Clear;
		void Clear();

		/****************** DefaultApproval ******************/
		/**** md5 signature: dcf5c7f323ee82aaa2b53b8a4b8a65cf ****/
		%feature("compactdefaultargs") DefaultApproval;
		%feature("autodoc", "Returns default approval entity which is used when no other data are available.

Returns
-------
opencascade::handle<StepBasic_Approval>
") DefaultApproval;
		opencascade::handle<StepBasic_Approval> DefaultApproval();

		/****************** DefaultDateAndTime ******************/
		/**** md5 signature: edec67445004cddf0e29a6fa243f1887 ****/
		%feature("compactdefaultargs") DefaultDateAndTime;
		%feature("autodoc", "Returns default date_and_time entity which is used when no other data are available.

Returns
-------
opencascade::handle<StepBasic_DateAndTime>
") DefaultDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DefaultDateAndTime();

		/****************** DefaultPersonAndOrganization ******************/
		/**** md5 signature: 1ddec0576a13d24833625c2ff1173714 ****/
		%feature("compactdefaultargs") DefaultPersonAndOrganization;
		%feature("autodoc", "Returns default person_and_organization entity which is used when no other data are available.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganization>
") DefaultPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> DefaultPersonAndOrganization();

		/****************** DefaultSecurityClassificationLevel ******************/
		/**** md5 signature: 1d1d9f341469e697d5ae8049dad6de4f ****/
		%feature("compactdefaultargs") DefaultSecurityClassificationLevel;
		%feature("autodoc", "Returns default security_classification_level entity which is used when no other data are available.

Returns
-------
opencascade::handle<StepBasic_SecurityClassificationLevel>
") DefaultSecurityClassificationLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> DefaultSecurityClassificationLevel();

		/****************** GetApproval ******************/
		/**** md5 signature: 8d2a93436691446d11a077f2bfba441d ****/
		%feature("compactdefaultargs") GetApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignApproval>
") GetApproval;
		opencascade::handle<StepAP203_CcDesignApproval> GetApproval();

		/****************** GetApprovalDateTime ******************/
		/**** md5 signature: af18723c7036e5ff5ec57cf963eddc28 ****/
		%feature("compactdefaultargs") GetApprovalDateTime;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApprovalDateTime>
") GetApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> GetApprovalDateTime();

		/****************** GetApprover ******************/
		/**** md5 signature: 20fde7251eba76868b9bf63c6ec45804 ****/
		%feature("compactdefaultargs") GetApprover;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>
") GetApprover;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> GetApprover();

		/****************** GetClassificationDate ******************/
		/**** md5 signature: 78da7d2f26c374e722ab265bd6d918e2 ****/
		%feature("compactdefaultargs") GetClassificationDate;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>
") GetClassificationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetClassificationDate();

		/****************** GetClassificationOfficer ******************/
		/**** md5 signature: f0e7eb259738f93fd883c5bbafa5ef2b ****/
		%feature("compactdefaultargs") GetClassificationOfficer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetClassificationOfficer;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetClassificationOfficer();

		/****************** GetCreationDate ******************/
		/**** md5 signature: 661094f0ad1769d3ad950de486214637 ****/
		%feature("compactdefaultargs") GetCreationDate;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>
") GetCreationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetCreationDate();

		/****************** GetCreator ******************/
		/**** md5 signature: e4a2e9c980d0c88f6791cc5f4b2554e4 ****/
		%feature("compactdefaultargs") GetCreator;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetCreator;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetCreator();

		/****************** GetDesignOwner ******************/
		/**** md5 signature: 3588dad07f763af1fb1f9ce81e159a0b ****/
		%feature("compactdefaultargs") GetDesignOwner;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetDesignOwner;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignOwner();

		/****************** GetDesignSupplier ******************/
		/**** md5 signature: c0eb175847b7241cabb8b06c9cb6c1f5 ****/
		%feature("compactdefaultargs") GetDesignSupplier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetDesignSupplier;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignSupplier();

		/****************** GetProductCategoryRelationship ******************/
		/**** md5 signature: dd0a5eeedcc91fb6d8b15190c590b378 ****/
		%feature("compactdefaultargs") GetProductCategoryRelationship;
		%feature("autodoc", "Return entities (roots) instantiated for the part by method init.

Returns
-------
opencascade::handle<StepBasic_ProductCategoryRelationship>
") GetProductCategoryRelationship;
		opencascade::handle<StepBasic_ProductCategoryRelationship> GetProductCategoryRelationship();

		/****************** GetSecurity ******************/
		/**** md5 signature: 76b292f42cd555b6a837e4952cf7a978 ****/
		%feature("compactdefaultargs") GetSecurity;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepAP203_CcDesignSecurityClassification>
") GetSecurity;
		opencascade::handle<StepAP203_CcDesignSecurityClassification> GetSecurity();

		/****************** Init ******************/
		/**** md5 signature: e24798a585b02010807ba9a6dfead7a8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Takes sdr (part) which brings all standard data around part (common for ap203 and ap214) and creates all the additional entities required for ap203.

Parameters
----------
sdr: StepShape_ShapeDefinitionRepresentation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr);

		/****************** Init ******************/
		/**** md5 signature: cb0f48b1c2c648fc61e08c1e6619fb7a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Takes tool which describes standard data around part (common for ap203 and ap214) and creates all the additional entities required for ap203 //! the created entities can be obtained by calls to methods getcreator(), getdesignowner(), getdesignsupplier(), getclassificationofficer(), getsecurity(), getcreationdate(), getclassificationdate(), getapproval(), getapprover(), getapprovaldatetime(), getproductcategoryrelationship().

Parameters
----------
SDRTool: STEPConstruct_Part

Returns
-------
None
") Init;
		void Init(const STEPConstruct_Part & SDRTool);

		/****************** Init ******************/
		/**** md5 signature: 8ced79fee45044397884daaf69c00780 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Takes nauo which describes assembly link to component and creates the security_classification entity associated to it as required by the ap203 //! instantiated (or existing previously) entities concerned can be obtained by calls to methods getclassificationofficer(), getsecurity(), getclassificationdate(), getapproval(), getapprover(), getapprovaldatetime() takes tool which describes standard data around part (common for ap203 and ap214) and takes from model (or creates if missing) all the additional entities required by ap203.

Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****************** InitApprovalRequisites ******************/
		/**** md5 signature: 5301e4276f4c8f2c52467c20e81c2c76 ****/
		%feature("compactdefaultargs") InitApprovalRequisites;
		%feature("autodoc", "Initializes approver and approvaldatetime entities according to approval entity.

Returns
-------
None
") InitApprovalRequisites;
		void InitApprovalRequisites();

		/****************** InitAssembly ******************/
		/**** md5 signature: 60851fb7589ab6f80c656afcabc1e98a ****/
		%feature("compactdefaultargs") InitAssembly;
		%feature("autodoc", "Initializes all missing data which are required for assembly.

Parameters
----------
nauo: StepRepr_NextAssemblyUsageOccurrence

Returns
-------
None
") InitAssembly;
		void InitAssembly(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****************** InitRoles ******************/
		/**** md5 signature: 17e9d4bbde7b2ddd05e8cdf36675b98c ****/
		%feature("compactdefaultargs") InitRoles;
		%feature("autodoc", "Initializes constant fields (shared entities).

Returns
-------
None
") InitRoles;
		void InitRoles();

		/****************** InitSecurityRequisites ******************/
		/**** md5 signature: 5a311cda040c42091a1a38442b9e2a15 ****/
		%feature("compactdefaultargs") InitSecurityRequisites;
		%feature("autodoc", "Initializes classificationofficer and classificationdate entities according to security entity.

Returns
-------
None
") InitSecurityRequisites;
		void InitSecurityRequisites();

		/****************** RoleApprover ******************/
		/**** md5 signature: ee24a8f71964782e2165422f6f940d67 ****/
		%feature("compactdefaultargs") RoleApprover;
		%feature("autodoc", "Return predefined personandorganizationrole and datetimerole entities named 'creator', 'design owner', 'design supplier', 'classification officer', 'creation date', 'classification date', 'approver'.

Returns
-------
opencascade::handle<StepBasic_ApprovalRole>
") RoleApprover;
		opencascade::handle<StepBasic_ApprovalRole> RoleApprover();

		/****************** RoleClassificationDate ******************/
		/**** md5 signature: 951a829280d7e85e12cf1204b7f07fbc ****/
		%feature("compactdefaultargs") RoleClassificationDate;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateTimeRole>
") RoleClassificationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleClassificationDate();

		/****************** RoleClassificationOfficer ******************/
		/**** md5 signature: 680994e9eb9b242cac9d48544673932b ****/
		%feature("compactdefaultargs") RoleClassificationOfficer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleClassificationOfficer;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleClassificationOfficer();

		/****************** RoleCreationDate ******************/
		/**** md5 signature: 94ffd366c27173e3037eaf4fe368d902 ****/
		%feature("compactdefaultargs") RoleCreationDate;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateTimeRole>
") RoleCreationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleCreationDate();

		/****************** RoleCreator ******************/
		/**** md5 signature: 00b033f9998e9266368f0e71378c4b91 ****/
		%feature("compactdefaultargs") RoleCreator;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleCreator;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleCreator();

		/****************** RoleDesignOwner ******************/
		/**** md5 signature: 7076b73b9e1bcd40826ee698f4fc815e ****/
		%feature("compactdefaultargs") RoleDesignOwner;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleDesignOwner;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignOwner();

		/****************** RoleDesignSupplier ******************/
		/**** md5 signature: 3582f09a86bb2746bec49cb503f79a59 ****/
		%feature("compactdefaultargs") RoleDesignSupplier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleDesignSupplier;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignSupplier();

		/****************** SetDefaultApproval ******************/
		/**** md5 signature: d84eff519036b537038259693f6fb935 ****/
		%feature("compactdefaultargs") SetDefaultApproval;
		%feature("autodoc", "Sets default approval.

Parameters
----------
app: StepBasic_Approval

Returns
-------
None
") SetDefaultApproval;
		void SetDefaultApproval(const opencascade::handle<StepBasic_Approval> & app);

		/****************** SetDefaultDateAndTime ******************/
		/**** md5 signature: b41371ade9b7684e015d98d00a060963 ****/
		%feature("compactdefaultargs") SetDefaultDateAndTime;
		%feature("autodoc", "Sets default date_and_time entity.

Parameters
----------
dt: StepBasic_DateAndTime

Returns
-------
None
") SetDefaultDateAndTime;
		void SetDefaultDateAndTime(const opencascade::handle<StepBasic_DateAndTime> & dt);

		/****************** SetDefaultPersonAndOrganization ******************/
		/**** md5 signature: 8da1183cd93e230b79ba8ab0f12cc09d ****/
		%feature("compactdefaultargs") SetDefaultPersonAndOrganization;
		%feature("autodoc", "Sets default person_and_organization entity.

Parameters
----------
po: StepBasic_PersonAndOrganization

Returns
-------
None
") SetDefaultPersonAndOrganization;
		void SetDefaultPersonAndOrganization(const opencascade::handle<StepBasic_PersonAndOrganization> & po);

		/****************** SetDefaultSecurityClassificationLevel ******************/
		/**** md5 signature: 5968f482432e0bdbfc3bb12066866eca ****/
		%feature("compactdefaultargs") SetDefaultSecurityClassificationLevel;
		%feature("autodoc", "Sets default security_classification_level.

Parameters
----------
sc: StepBasic_SecurityClassificationLevel

Returns
-------
None
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
		/****************** STEPConstruct_Assembly ******************/
		/**** md5 signature: 752dfcbbf37eed18e9c0c4b246a3c357 ****/
		%feature("compactdefaultargs") STEPConstruct_Assembly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPConstruct_Assembly;
		 STEPConstruct_Assembly();

		/****************** CheckSRRReversesNAUO ******************/
		/**** md5 signature: b0fa18785618f63fd8c99ab9527bdb0c ****/
		%feature("compactdefaultargs") CheckSRRReversesNAUO;
		%feature("autodoc", "Checks whether srr's definition of assembly and component contradicts with nauo definition or not, according to model schema (ap214 or ap203).

Parameters
----------
theGraph: Interface_Graph
CDSR: StepShape_ContextDependentShapeRepresentation

Returns
-------
bool
") CheckSRRReversesNAUO;
		static Standard_Boolean CheckSRRReversesNAUO(const Interface_Graph & theGraph, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR);

		/****************** GetNAUO ******************/
		/**** md5 signature: 7b90e221fdc0670e5cb2da71fe791c94 ****/
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "Returns nauo object describing the assembly link.

Returns
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") GetNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetNAUO();

		/****************** Init ******************/
		/**** md5 signature: 680eea5c5f086771c9a8f0380c783f24 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialises with starting values ax0 : origin axis (typically, standard xyz) loc : location to which place the item makes a mappeditem resulting value is returned by itemvalue.

Parameters
----------
aSR: StepShape_ShapeDefinitionRepresentation
SDR0: StepShape_ShapeDefinitionRepresentation
Ax0: StepGeom_Axis2Placement3d
Loc: StepGeom_Axis2Placement3d

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aSR, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR0, const opencascade::handle<StepGeom_Axis2Placement3d> & Ax0, const opencascade::handle<StepGeom_Axis2Placement3d> & Loc);

		/****************** ItemLocation ******************/
		/**** md5 signature: 0632f06033b119941c450baebc8f4ad0 ****/
		%feature("compactdefaultargs") ItemLocation;
		%feature("autodoc", "Returns the location of the item, computed from starting aloc.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") ItemLocation;
		opencascade::handle<StepGeom_Axis2Placement3d> ItemLocation();

		/****************** ItemValue ******************/
		/**** md5 signature: d2ed61c8667ff822d613c1acb961afad ****/
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "Returns the value if no make... has been called, returns the starting sr.

Returns
-------
opencascade::handle<Standard_Transient>
") ItemValue;
		opencascade::handle<Standard_Transient> ItemValue();

		/****************** MakeRelationship ******************/
		/**** md5 signature: b815ac8d8592b7db4c6994286256fc74 ****/
		%feature("compactdefaultargs") MakeRelationship;
		%feature("autodoc", "Make a (shaperepresentationrelationship,...withtransformation) resulting value is returned by itemvalue.

Returns
-------
None
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
		/****************** STEPConstruct_ContextTool ******************/
		/**** md5 signature: df4dcab3f691efa754f6537b14d77482 ****/
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool();

		/****************** STEPConstruct_ContextTool ******************/
		/**** md5 signature: 531e2d4c4ce04702879d6fb5c472dc0b ****/
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStepModel: StepData_StepModel

Returns
-------
None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool(const opencascade::handle<StepData_StepModel> & aStepModel);

		/****************** AP203Context ******************/
		/**** md5 signature: 8779001f2e80b0238c76a70e8433d9cb ****/
		%feature("compactdefaultargs") AP203Context;
		%feature("autodoc", "Returns tool which maintains context specific for ap203.

Returns
-------
STEPConstruct_AP203Context
") AP203Context;
		STEPConstruct_AP203Context & AP203Context();

		/****************** AddAPD ******************/
		/**** md5 signature: a67d05ca4ebe6d997b4368deaa146c7d ****/
		%feature("compactdefaultargs") AddAPD;
		%feature("autodoc", "No available documentation.

Parameters
----------
enforce: bool,optional
	default value is Standard_False

Returns
-------
None
") AddAPD;
		void AddAPD(const Standard_Boolean enforce = Standard_False);

		/****************** GetACname ******************/
		/**** md5 signature: fa0e502f0d137b171700e26d62429bdd ****/
		%feature("compactdefaultargs") GetACname;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetACname;
		opencascade::handle<TCollection_HAsciiString> GetACname();

		/****************** GetACschemaName ******************/
		/**** md5 signature: 7eeab692f3fcbd2eebdf0c5c9866890b ****/
		%feature("compactdefaultargs") GetACschemaName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetACschemaName;
		opencascade::handle<TCollection_HAsciiString> GetACschemaName();

		/****************** GetACstatus ******************/
		/**** md5 signature: f580580d937083f5019ffc50ffc89355 ****/
		%feature("compactdefaultargs") GetACstatus;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetACstatus;
		opencascade::handle<TCollection_HAsciiString> GetACstatus();

		/****************** GetACyear ******************/
		/**** md5 signature: ffee3c003a0384e8ceac68cc91004ce2 ****/
		%feature("compactdefaultargs") GetACyear;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetACyear;
		Standard_Integer GetACyear();

		/****************** GetAPD ******************/
		/**** md5 signature: 95e9054d44407daae5eff76f05165a8c ****/
		%feature("compactdefaultargs") GetAPD;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApplicationProtocolDefinition>
") GetAPD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAPD();

		/****************** GetDefaultAxis ******************/
		/**** md5 signature: 828743366f59e86971c182fcfea0c5f5 ****/
		%feature("compactdefaultargs") GetDefaultAxis;
		%feature("autodoc", "Returns a default axis placement.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") GetDefaultAxis;
		opencascade::handle<StepGeom_Axis2Placement3d> GetDefaultAxis();

		/****************** GetProductName ******************/
		/**** md5 signature: 74b571b7b7d9ddf447f491b1759f4261 ****/
		%feature("compactdefaultargs") GetProductName;
		%feature("autodoc", "Generates a product name basing on write.step.product.name parameter and current position in the assembly structure.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetProductName;
		opencascade::handle<TCollection_HAsciiString> GetProductName();

		/****************** GetRootsForAssemblyLink ******************/
		/**** md5 signature: 6b7fbd9fa49372633d76e2cb9ba9f545 ****/
		%feature("compactdefaultargs") GetRootsForAssemblyLink;
		%feature("autodoc", "Produces and returns a full list of root entities required for assembly link identified by assembly (including nauo and cdsr).

Parameters
----------
assembly: STEPConstruct_Assembly

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GetRootsForAssemblyLink;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForAssemblyLink(const STEPConstruct_Assembly & assembly);

		/****************** GetRootsForPart ******************/
		/**** md5 signature: 26375ec7e779b7f7b5512d7dbb0e5893 ****/
		%feature("compactdefaultargs") GetRootsForPart;
		%feature("autodoc", "Produces and returns a full list of root entities required for part identified by sdrtool (including sdr itself).

Parameters
----------
SDRTool: STEPConstruct_Part

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GetRootsForPart;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForPart(const STEPConstruct_Part & SDRTool);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns current index of assembly component on current level.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsAP203 ******************/
		/**** md5 signature: 8b315db44337734a8f0f9efec9410761 ****/
		%feature("compactdefaultargs") IsAP203;
		%feature("autodoc", "Returns true if apd.schema_name is config_control_design.

Returns
-------
bool
") IsAP203;
		Standard_Boolean IsAP203();

		/****************** IsAP214 ******************/
		/**** md5 signature: 8d1b3925d3ac81f151facb84057cda3b ****/
		%feature("compactdefaultargs") IsAP214;
		%feature("autodoc", "Returns true if apd.schema_name is automotive_design.

Returns
-------
bool
") IsAP214;
		Standard_Boolean IsAP214();

		/****************** IsAP242 ******************/
		/**** md5 signature: 9bed2fca5abf26681a7b41957da9e535 ****/
		%feature("compactdefaultargs") IsAP242;
		%feature("autodoc", "Returns true if apd.schema_name is ap242_managed_model_based_3d_engineering.

Returns
-------
bool
") IsAP242;
		Standard_Boolean IsAP242();

		/****************** Level ******************/
		/**** md5 signature: 06f7279e938b54c0bc4a49915192a536 ****/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Returns current assembly level.

Returns
-------
int
") Level;
		Standard_Integer Level();

		/****************** NextIndex ******************/
		/**** md5 signature: 37c249b2de63c7f1238e07e1f651137d ****/
		%feature("compactdefaultargs") NextIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextIndex;
		void NextIndex();

		/****************** NextLevel ******************/
		/**** md5 signature: c3b32cda79bd8630c760718ea9799f59 ****/
		%feature("compactdefaultargs") NextLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextLevel;
		void NextLevel();

		/****************** PrevIndex ******************/
		/**** md5 signature: 1f4a694628bbe12a0e9d0f4da497d800 ****/
		%feature("compactdefaultargs") PrevIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PrevIndex;
		void PrevIndex();

		/****************** PrevLevel ******************/
		/**** md5 signature: 194d4378c86427b12a84ce495456c4c0 ****/
		%feature("compactdefaultargs") PrevLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PrevLevel;
		void PrevLevel();

		/****************** SetACname ******************/
		/**** md5 signature: 01f37dfae813e172538d09a06fde9232 ****/
		%feature("compactdefaultargs") SetACname;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") SetACname;
		void SetACname(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetACschemaName ******************/
		/**** md5 signature: 06f814773a65420d2443f7209974c2e2 ****/
		%feature("compactdefaultargs") SetACschemaName;
		%feature("autodoc", "No available documentation.

Parameters
----------
schemaName: TCollection_HAsciiString

Returns
-------
None
") SetACschemaName;
		void SetACschemaName(const opencascade::handle<TCollection_HAsciiString> & schemaName);

		/****************** SetACstatus ******************/
		/**** md5 signature: fde42f248b2272452c753c542a1dd428 ****/
		%feature("compactdefaultargs") SetACstatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: TCollection_HAsciiString

Returns
-------
None
") SetACstatus;
		void SetACstatus(const opencascade::handle<TCollection_HAsciiString> & status);

		/****************** SetACyear ******************/
		/**** md5 signature: f858031d9c4d5fded97eaf943e734a0b ****/
		%feature("compactdefaultargs") SetACyear;
		%feature("autodoc", "No available documentation.

Parameters
----------
year: int

Returns
-------
None
") SetACyear;
		void SetACyear(const Standard_Integer year);

		/****************** SetIndex ******************/
		/**** md5 signature: e532bcf6ded7ea35dd810f127d134732 ****/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Changes current index of assembly component on current level.

Parameters
----------
ind: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer ind);

		/****************** SetLevel ******************/
		/**** md5 signature: 96086cf4262787a9b0e671fa4e9ed87d ****/
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "Changes current assembly level.

Parameters
----------
lev: int

Returns
-------
None
") SetLevel;
		void SetLevel(const Standard_Integer lev);

		/****************** SetModel ******************/
		/**** md5 signature: 3e50615c9ad790486b5ae0c21bfe2648 ****/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Initialize applicationprotocoldefinition by the first entity of that type found in the model.

Parameters
----------
aStepModel: StepData_StepModel

Returns
-------
None
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
		/****************** STEPConstruct_Part ******************/
		/**** md5 signature: 06fcc64940ad56d3efafd95327b26fd5 ****/
		%feature("compactdefaultargs") STEPConstruct_Part;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPConstruct_Part;
		 STEPConstruct_Part();

		/****************** AC ******************/
		/**** md5 signature: 09a13308a9df5c06b5ae4947a9dc5ab2 ****/
		%feature("compactdefaultargs") AC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApplicationContext>
") AC;
		opencascade::handle<StepBasic_ApplicationContext> AC();

		/****************** ACapplication ******************/
		/**** md5 signature: 74b70621399ad45b29b124738d428694 ****/
		%feature("compactdefaultargs") ACapplication;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ACapplication;
		opencascade::handle<TCollection_HAsciiString> ACapplication();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MakeSDR ******************/
		/**** md5 signature: 9b8ea74a1baa05413a9ef01e3514bfe7 ****/
		%feature("compactdefaultargs") MakeSDR;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: StepShape_ShapeRepresentation
aName: TCollection_HAsciiString
AC: StepBasic_ApplicationContext

Returns
-------
None
") MakeSDR;
		void MakeSDR(const opencascade::handle<StepShape_ShapeRepresentation> & aShape, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & AC);

		/****************** PC ******************/
		/**** md5 signature: 4b00ee1014f481885d4ebd1bc2d9b97f ****/
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductContext>
") PC;
		opencascade::handle<StepBasic_ProductContext> PC();

		/****************** PCdisciplineType ******************/
		/**** md5 signature: 71049c12e6d1d54bd339e1c3a8290cd0 ****/
		%feature("compactdefaultargs") PCdisciplineType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PCdisciplineType;
		opencascade::handle<TCollection_HAsciiString> PCdisciplineType();

		/****************** PCname ******************/
		/**** md5 signature: 6f0205a6e207cf60dbb324a551b60389 ****/
		%feature("compactdefaultargs") PCname;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PCname;
		opencascade::handle<TCollection_HAsciiString> PCname();

		/****************** PD ******************/
		/**** md5 signature: c9a9608f7981f80b3a7f9616e62e0cdf ****/
		%feature("compactdefaultargs") PD;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") PD;
		opencascade::handle<StepBasic_ProductDefinition> PD();

		/****************** PDC ******************/
		/**** md5 signature: 27d66a3a38107c53c110eaa91290fa39 ****/
		%feature("compactdefaultargs") PDC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionContext>
") PDC;
		opencascade::handle<StepBasic_ProductDefinitionContext> PDC();

		/****************** PDCname ******************/
		/**** md5 signature: c7aa518220bba4b33ae69180b66fab03 ****/
		%feature("compactdefaultargs") PDCname;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PDCname;
		opencascade::handle<TCollection_HAsciiString> PDCname();

		/****************** PDCstage ******************/
		/**** md5 signature: 475d98c78b6dc97cd57e747c6fc430eb ****/
		%feature("compactdefaultargs") PDCstage;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PDCstage;
		opencascade::handle<TCollection_HAsciiString> PDCstage();

		/****************** PDF ******************/
		/**** md5 signature: b3db07e24e18d94b92ca8f0a9faf2dac ****/
		%feature("compactdefaultargs") PDF;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") PDF;
		opencascade::handle<StepBasic_ProductDefinitionFormation> PDF();

		/****************** PDFdescription ******************/
		/**** md5 signature: 9aa2d77a10bc06ed52fe47afae2409ad ****/
		%feature("compactdefaultargs") PDFdescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PDFdescription;
		opencascade::handle<TCollection_HAsciiString> PDFdescription();

		/****************** PDFid ******************/
		/**** md5 signature: c0206c4237219f9afbb46e8328aa0bd3 ****/
		%feature("compactdefaultargs") PDFid;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PDFid;
		opencascade::handle<TCollection_HAsciiString> PDFid();

		/****************** PDS ******************/
		/**** md5 signature: e5fed0abd655308090586299f85ecca9 ****/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") PDS;
		opencascade::handle<StepRepr_ProductDefinitionShape> PDS();

		/****************** PDSdescription ******************/
		/**** md5 signature: 2b13743df4a43771390282aaaa49e20b ****/
		%feature("compactdefaultargs") PDSdescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PDSdescription;
		opencascade::handle<TCollection_HAsciiString> PDSdescription();

		/****************** PDSname ******************/
		/**** md5 signature: d7e08e2e2ba3c65a25a51aace1e57873 ****/
		%feature("compactdefaultargs") PDSname;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PDSname;
		opencascade::handle<TCollection_HAsciiString> PDSname();

		/****************** PDdescription ******************/
		/**** md5 signature: 477e776b757faaa200f0d62aa299a9ea ****/
		%feature("compactdefaultargs") PDdescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PDdescription;
		opencascade::handle<TCollection_HAsciiString> PDdescription();

		/****************** PRPC ******************/
		/**** md5 signature: 98d0cb48e88118f75266361a14a0794e ****/
		%feature("compactdefaultargs") PRPC;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductRelatedProductCategory>
") PRPC;
		opencascade::handle<StepBasic_ProductRelatedProductCategory> PRPC();

		/****************** PRPCdescription ******************/
		/**** md5 signature: f09e3bbe526b6ced24296e007c4e4e0b ****/
		%feature("compactdefaultargs") PRPCdescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PRPCdescription;
		opencascade::handle<TCollection_HAsciiString> PRPCdescription();

		/****************** PRPCname ******************/
		/**** md5 signature: 2a4f7cf7db7a8f831df67e187775ac8c ****/
		%feature("compactdefaultargs") PRPCname;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PRPCname;
		opencascade::handle<TCollection_HAsciiString> PRPCname();

		/****************** Pdescription ******************/
		/**** md5 signature: 4245f3a287ededc7d66d0fb742f4c3cd ****/
		%feature("compactdefaultargs") Pdescription;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Pdescription;
		opencascade::handle<TCollection_HAsciiString> Pdescription();

		/****************** Pid ******************/
		/**** md5 signature: 4d74772b7871aa2be03e96b344804007 ****/
		%feature("compactdefaultargs") Pid;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Pid;
		opencascade::handle<TCollection_HAsciiString> Pid();

		/****************** Pname ******************/
		/**** md5 signature: 437a1146d907bc8ea6fe90a22c711fa8 ****/
		%feature("compactdefaultargs") Pname;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Pname;
		opencascade::handle<TCollection_HAsciiString> Pname();

		/****************** Product ******************/
		/**** md5 signature: e8c7e89afa6b95e852c44498904e61e4 ****/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ReadSDR ******************/
		/**** md5 signature: 35fbf89041c7d6c96c5e49a4aa5a344e ****/
		%feature("compactdefaultargs") ReadSDR;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: StepShape_ShapeDefinitionRepresentation

Returns
-------
None
") ReadSDR;
		void ReadSDR(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aShape);

		/****************** SDRValue ******************/
		/**** md5 signature: 130fbe83fda99eb7fbd54f4f09c2dd2a ****/
		%feature("compactdefaultargs") SDRValue;
		%feature("autodoc", "Returns sdr or null if not done.

Returns
-------
opencascade::handle<StepShape_ShapeDefinitionRepresentation>
") SDRValue;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> SDRValue();

		/****************** SRValue ******************/
		/**** md5 signature: 6847c48c4f9b4d60b3efca15118db72f ****/
		%feature("compactdefaultargs") SRValue;
		%feature("autodoc", "Returns sdr->usedrepresentation() or null if not done.

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") SRValue;
		opencascade::handle<StepShape_ShapeRepresentation> SRValue();

		/****************** SetACapplication ******************/
		/**** md5 signature: fba1ce8cf54ca97ba8684fcb77347420 ****/
		%feature("compactdefaultargs") SetACapplication;
		%feature("autodoc", "No available documentation.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SetACapplication;
		void SetACapplication(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPCdisciplineType ******************/
		/**** md5 signature: 3a37375b7820dde3568f2010d68d696d ****/
		%feature("compactdefaultargs") SetPCdisciplineType;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TCollection_HAsciiString

Returns
-------
None
") SetPCdisciplineType;
		void SetPCdisciplineType(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPCname ******************/
		/**** md5 signature: 3013a13e8ce7658533f997a640420f90 ****/
		%feature("compactdefaultargs") SetPCname;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") SetPCname;
		void SetPCname(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetPDCname ******************/
		/**** md5 signature: 84b14f08bcd05ff81bb10e3d30c31607 ****/
		%feature("compactdefaultargs") SetPDCname;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TCollection_HAsciiString

Returns
-------
None
") SetPDCname;
		void SetPDCname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPDCstage ******************/
		/**** md5 signature: ead120e5cf433abce41f602b8b0bbe5a ****/
		%feature("compactdefaultargs") SetPDCstage;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TCollection_HAsciiString

Returns
-------
None
") SetPDCstage;
		void SetPDCstage(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPDFdescription ******************/
		/**** md5 signature: 5cb4baf329a67e7e2f4419233c731967 ****/
		%feature("compactdefaultargs") SetPDFdescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SetPDFdescription;
		void SetPDFdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPDFid ******************/
		/**** md5 signature: 70319223b8bc580a5dcfd07417507ec8 ****/
		%feature("compactdefaultargs") SetPDFid;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: TCollection_HAsciiString

Returns
-------
None
") SetPDFid;
		void SetPDFid(const opencascade::handle<TCollection_HAsciiString> & id);

		/****************** SetPDSdescription ******************/
		/**** md5 signature: 04db2c7487813db9853718536d12c0a8 ****/
		%feature("compactdefaultargs") SetPDSdescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SetPDSdescription;
		void SetPDSdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPDSname ******************/
		/**** md5 signature: ef1239e0adbe927026cd9179d4590338 ****/
		%feature("compactdefaultargs") SetPDSname;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TCollection_HAsciiString

Returns
-------
None
") SetPDSname;
		void SetPDSname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPDdescription ******************/
		/**** md5 signature: e4fd1d26cc6cb8ff290c435e1e7fe03e ****/
		%feature("compactdefaultargs") SetPDdescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SetPDdescription;
		void SetPDdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPRPCdescription ******************/
		/**** md5 signature: fe1d626801fa995ec037f5618f96cfe2 ****/
		%feature("compactdefaultargs") SetPRPCdescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SetPRPCdescription;
		void SetPRPCdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPRPCname ******************/
		/**** md5 signature: 5f301c3cf57e61743344dd60c6b9d664 ****/
		%feature("compactdefaultargs") SetPRPCname;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TCollection_HAsciiString

Returns
-------
None
") SetPRPCname;
		void SetPRPCname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPdescription ******************/
		/**** md5 signature: 10c65cad5221288b6f5c7b17024d35d0 ****/
		%feature("compactdefaultargs") SetPdescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SetPdescription;
		void SetPdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPid ******************/
		/**** md5 signature: 0d7bc629eba6c31b540fff9c460f0e6e ****/
		%feature("compactdefaultargs") SetPid;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: TCollection_HAsciiString

Returns
-------
None
") SetPid;
		void SetPid(const opencascade::handle<TCollection_HAsciiString> & id);

		/****************** SetPname ******************/
		/**** md5 signature: 62a9f79d5cc908ae9e75242fd96b1e0b ****/
		%feature("compactdefaultargs") SetPname;
		%feature("autodoc", "No available documentation.

Parameters
----------
label: TCollection_HAsciiString

Returns
-------
None
") SetPname;
		void SetPname(const opencascade::handle<TCollection_HAsciiString> & label);

};


%extend STEPConstruct_Part {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPConstruct_PointHasher *
**********************************/
class STEPConstruct_PointHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 884d62c38cbd2664bf75c1613ed6418f ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the point, in the range [1, theupperbound] @param thepoint the point which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
thePoint: gp_Pnt
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const gp_Pnt & thePoint, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 348dee123ab0451d70df039c91381cb7 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same. two same keys must have the same hashcode, the contrary is not necessary.

Parameters
----------
Point1: gp_Pnt
Point2: gp_Pnt

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const gp_Pnt & Point1, const gp_Pnt & Point2);

};


%extend STEPConstruct_PointHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPConstruct_Tool *
***************************/
class STEPConstruct_Tool {
	public:
		/****************** STEPConstruct_Tool ******************/
		/**** md5 signature: efcaf1a60d6ac4497f2828455d46647b ****/
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") STEPConstruct_Tool;
		 STEPConstruct_Tool();

		/****************** STEPConstruct_Tool ******************/
		/**** md5 signature: 85c33272fb015f3f0363768e09687c4f ****/
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "Creates a tool and loads it with worksession.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") STEPConstruct_Tool;
		 STEPConstruct_Tool(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** FinderProcess ******************/
		/**** md5 signature: f8dfec4fe475dca1c15ced299bbfcbf0 ****/
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "Returns finderprocess (writing; null if not loaded).

Returns
-------
opencascade::handle<Transfer_FinderProcess>
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess();

		/****************** Graph ******************/
		/**** md5 signature: 602c8343faeb8d6533fd8cb29044d22d ****/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns current graph (recomputing if necessary).

Parameters
----------
recompute: bool,optional
	default value is Standard_False

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph(const Standard_Boolean recompute = Standard_False);

		/****************** Model ******************/
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns current model (null if not loaded).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** TransientProcess ******************/
		/**** md5 signature: 0d1e45ead605e0700d65c1f7838e32c2 ****/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns transientprocess (reading; null if not loaded).

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

		/****************** WS ******************/
		/**** md5 signature: 7abc09281c8fab10273013886821795a ****/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns currently loaded worksession.

Returns
-------
opencascade::handle<XSControl_WorkSession>
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
		/****************** STEPConstruct_UnitContext ******************/
		/**** md5 signature: 1d15166a4cdfb67887e03bffe127aa69 ****/
		%feature("compactdefaultargs") STEPConstruct_UnitContext;
		%feature("autodoc", "Creates empty tool.

Returns
-------
None
") STEPConstruct_UnitContext;
		 STEPConstruct_UnitContext();

		/****************** AreaDone ******************/
		/**** md5 signature: 7da71b8eaa4403795bb4b5f632d8e5dd ****/
		%feature("compactdefaultargs") AreaDone;
		%feature("autodoc", "Returns true if areafactor is computed.

Returns
-------
bool
") AreaDone;
		Standard_Boolean AreaDone();

		/****************** AreaFactor ******************/
		/**** md5 signature: 4c7b44bc49bb7530d8f62e93a85647f8 ****/
		%feature("compactdefaultargs") AreaFactor;
		%feature("autodoc", "Returns the areafactor.

Returns
-------
float
") AreaFactor;
		Standard_Real AreaFactor();

		/****************** ComputeFactors ******************/
		/**** md5 signature: 1cd2099da645efb869040f3450e85399 ****/
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "Computes the length, plane angle and solid angle conversion factor . returns a status, 0 if ok.

Parameters
----------
aContext: StepRepr_GlobalUnitAssignedContext

Returns
-------
int
") ComputeFactors;
		Standard_Integer ComputeFactors(const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aContext);

		/****************** ComputeFactors ******************/
		/**** md5 signature: 0ed4ffd250ec4e5abaee054ded1f1b0d ****/
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUnit: StepBasic_NamedUnit

Returns
-------
int
") ComputeFactors;
		Standard_Integer ComputeFactors(const opencascade::handle<StepBasic_NamedUnit> & aUnit);

		/****************** ComputeTolerance ******************/
		/**** md5 signature: 9a5806980a9e9e53879adea3026bf9a2 ****/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "Computes the uncertainty value (for length).

Parameters
----------
aContext: StepRepr_GlobalUncertaintyAssignedContext

Returns
-------
int
") ComputeTolerance;
		Standard_Integer ComputeTolerance(const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & aContext);

		/****************** ConvertSiPrefix ******************/
		/**** md5 signature: da1d7efb2a96f1799098b82e4aa16394 ****/
		%feature("compactdefaultargs") ConvertSiPrefix;
		%feature("autodoc", "Convert si prefix defined by enumertaion to corresponding real factor (e.g. 1e6 for mega).

Parameters
----------
aPrefix: StepBasic_SiPrefix

Returns
-------
float
") ConvertSiPrefix;
		static Standard_Real ConvertSiPrefix(const StepBasic_SiPrefix aPrefix);

		/****************** HasUncertainty ******************/
		/**** md5 signature: bca0444c506978be32efc6fd9ed4818f ****/
		%feature("compactdefaultargs") HasUncertainty;
		%feature("autodoc", "Tells if a uncertainty (for length) is recorded.

Returns
-------
bool
") HasUncertainty;
		Standard_Boolean HasUncertainty();

		/****************** Init ******************/
		/**** md5 signature: f5a5725cc2022d6209fecd6301561bac ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates new context (units are mm and radians, uncertainty equal to tol3d).

Parameters
----------
Tol3d: float

Returns
-------
None
") Init;
		void Init(const Standard_Real Tol3d);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if init was called successfully.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LengthDone ******************/
		/**** md5 signature: 78dd228dbf5e3c84550b1acffff7bd32 ****/
		%feature("compactdefaultargs") LengthDone;
		%feature("autodoc", "Returns true if computefactors has calculated a lengthfactor.

Returns
-------
bool
") LengthDone;
		Standard_Boolean LengthDone();

		/****************** LengthFactor ******************/
		/**** md5 signature: 15771254030d5d42fe1035afb35f49f8 ****/
		%feature("compactdefaultargs") LengthFactor;
		%feature("autodoc", "Returns the lengthfactor.

Returns
-------
float
") LengthFactor;
		Standard_Real LengthFactor();

		/****************** PlaneAngleDone ******************/
		/**** md5 signature: 45cb64bc9ea96042977f266a79a43cf7 ****/
		%feature("compactdefaultargs") PlaneAngleDone;
		%feature("autodoc", "Returns true if computefactors has calculated a planeanglefactor.

Returns
-------
bool
") PlaneAngleDone;
		Standard_Boolean PlaneAngleDone();

		/****************** PlaneAngleFactor ******************/
		/**** md5 signature: 24a746fdf36cb34234bfa6984c9c2721 ****/
		%feature("compactdefaultargs") PlaneAngleFactor;
		%feature("autodoc", "Returns the planeanglefactor.

Returns
-------
float
") PlaneAngleFactor;
		Standard_Real PlaneAngleFactor();

		/****************** SolidAngleDone ******************/
		/**** md5 signature: 713d553b89570e13b2907e214c3badb5 ****/
		%feature("compactdefaultargs") SolidAngleDone;
		%feature("autodoc", "Returns true if computefactors has calculated a solidanglefactor.

Returns
-------
bool
") SolidAngleDone;
		Standard_Boolean SolidAngleDone();

		/****************** SolidAngleFactor ******************/
		/**** md5 signature: 5c610c278e1133bf63025e97445bcd03 ****/
		%feature("compactdefaultargs") SolidAngleFactor;
		%feature("autodoc", "Returns the solidanglefactor.

Returns
-------
float
") SolidAngleFactor;
		Standard_Real SolidAngleFactor();

		/****************** StatusMessage ******************/
		/**** md5 signature: 33ed50ac872bb5339679b3dae94aff9a ****/
		%feature("compactdefaultargs") StatusMessage;
		%feature("autodoc", "Returns a message for a given status (0 - empty) this message can then be added as warning for transfer.

Parameters
----------
status: int

Returns
-------
char *
") StatusMessage;
		const char * StatusMessage(const Standard_Integer status);

		/****************** Uncertainty ******************/
		/**** md5 signature: d91d2a9d8a7c9b921d9f843bf59b3624 ****/
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "Returns the uncertainty value (for length) it has been converted with lengthfactor.

Returns
-------
float
") Uncertainty;
		Standard_Real Uncertainty();

		/****************** Value ******************/
		/**** md5 signature: 9b258d5466cd03ee82c1554d4030973a ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns context (or null if not done).

Returns
-------
opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx>
") Value;
		opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> Value();

		/****************** VolumeDone ******************/
		/**** md5 signature: ed45f6bddcef6d7ac1a1f6940fc9c76d ****/
		%feature("compactdefaultargs") VolumeDone;
		%feature("autodoc", "Returns true if volumefactor is computed.

Returns
-------
bool
") VolumeDone;
		Standard_Boolean VolumeDone();

		/****************** VolumeFactor ******************/
		/**** md5 signature: 27268b8792818ce4ca912befcd45a905 ****/
		%feature("compactdefaultargs") VolumeFactor;
		%feature("autodoc", "Returns the volumefactor.

Returns
-------
float
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
		/****************** STEPConstruct_ExternRefs ******************/
		/**** md5 signature: 1f8efbe1d156fc01e6c952af939d2b6b ****/
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs();

		/****************** STEPConstruct_ExternRefs ******************/
		/**** md5 signature: 20e929397af75f5ed5cd0aa8f135102b ****/
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "Creates a tool and initializes it.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** AddExternRef ******************/
		/**** md5 signature: 4daa7d7a9c20a39da66c9c4347c646c2 ****/
		%feature("compactdefaultargs") AddExternRef;
		%feature("autodoc", "Create a new external reference with specified attributes attached to a given sdr <format> can be null string, in that case this information is not written. else, it can be 'step ap214' or 'step ap203' returns index of a new extern ref.

Parameters
----------
filename: char *
PD: StepBasic_ProductDefinition
format: char *

Returns
-------
int
") AddExternRef;
		Standard_Integer AddExternRef(const char * filename, const opencascade::handle<StepBasic_ProductDefinition> & PD, const char * format);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields (list of defined extern refs).

Returns
-------
None
") Clear;
		void Clear();

		/****************** FileName ******************/
		/**** md5 signature: 43c1d3f377c3a1849b8dd53db818414e ****/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns filename for numth extern reference returns null if filename is not defined or bad.

Parameters
----------
num: int

Returns
-------
char *
") FileName;
		const char * FileName(const Standard_Integer num);

		/****************** Format ******************/
		/**** md5 signature: 600d3fed43f6e174acc9f0aff53e1d79 ****/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Returns format identification string for the extern document returns null handle if format is not defined.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Format;
		opencascade::handle<TCollection_HAsciiString> Format(const Standard_Integer num);

		/****************** GetAP214APD ******************/
		/**** md5 signature: e5d5c23db97ab47e38bfdbb1e8f208df ****/
		%feature("compactdefaultargs") GetAP214APD;
		%feature("autodoc", "Returns the applicationprotocoldefinition of the pdm schema note: if not defined then create new apd with new application context.

Returns
-------
opencascade::handle<StepBasic_ApplicationProtocolDefinition>
") GetAP214APD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAP214APD();

		/****************** Init ******************/
		/**** md5 signature: a41268d32348bb8b355efce3731d2872 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes tool; returns true if succeeded.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** LoadExternRefs ******************/
		/**** md5 signature: f4a2bfe61b7f4e24004a6d6eb81cd42f ****/
		%feature("compactdefaultargs") LoadExternRefs;
		%feature("autodoc", "Searches current step model for external references and loads them to the internal data structures note: does not clear data structures before loading.

Returns
-------
bool
") LoadExternRefs;
		Standard_Boolean LoadExternRefs();

		/****************** NbExternRefs ******************/
		/**** md5 signature: 4d108b9b54670b0a78dd4f28fa20e284 ****/
		%feature("compactdefaultargs") NbExternRefs;
		%feature("autodoc", "Returns number of defined extern references.

Returns
-------
int
") NbExternRefs;
		Standard_Integer NbExternRefs();

		/****************** ProdDef ******************/
		/**** md5 signature: 6a8634b4bdac2f4a979a94ebdda69231 ****/
		%feature("compactdefaultargs") ProdDef;
		%feature("autodoc", "Returns productdefinition to which numth extern reference is associated. returns null if cannot be detected or if extern reference is not associated to sdr in a proper way.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProdDef;
		opencascade::handle<StepBasic_ProductDefinition> ProdDef(const Standard_Integer num);

		/****************** SetAP214APD ******************/
		/**** md5 signature: 1abd220d7483a71b39192e4aa4fb285f ****/
		%feature("compactdefaultargs") SetAP214APD;
		%feature("autodoc", "Set the applicationprotocoldefinition of the pdm schema.

Parameters
----------
APD: StepBasic_ApplicationProtocolDefinition

Returns
-------
None
") SetAP214APD;
		void SetAP214APD(const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & APD);

		/****************** WriteExternRefs ******************/
		/**** md5 signature: d195629663bea3383eec4f63ca9e8938 ****/
		%feature("compactdefaultargs") WriteExternRefs;
		%feature("autodoc", "Adds all the currently defined external refs to the model returns number of written extern refs.

Parameters
----------
num: int

Returns
-------
int
") WriteExternRefs;
		Standard_Integer WriteExternRefs(const Standard_Integer num);

		/****************** checkAP214Shared ******************/
		/**** md5 signature: 786641e067c12f9f54e3c4ebf017e83e ****/
		%feature("compactdefaultargs") checkAP214Shared;
		%feature("autodoc", "Check (create if it is null) all shared entities for the model.

Returns
-------
None
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
		/****************** STEPConstruct_Styles ******************/
		/**** md5 signature: c46fb2487a4b9243951920825709bd09 ****/
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") STEPConstruct_Styles;
		 STEPConstruct_Styles();

		/****************** STEPConstruct_Styles ******************/
		/**** md5 signature: 4e51d7d1a74288cbec2280e80809efed ****/
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "Creates a tool and initializes it.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") STEPConstruct_Styles;
		 STEPConstruct_Styles(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** AddStyle ******************/
		/**** md5 signature: 3df98c40338185f9e45452d43ef23ab0 ****/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "Adds a style to a sequence.

Parameters
----------
style: StepVisual_StyledItem

Returns
-------
None
") AddStyle;
		void AddStyle(const opencascade::handle<StepVisual_StyledItem> & style);

		/****************** AddStyle ******************/
		/**** md5 signature: 2367472aaf1ebcbd470196984908b656 ****/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "Create a style linking giving psa to the item, and add it to the sequence of stored styles. if override is not null, then the resulting style will be of the subtype overridingstyleditem.

Parameters
----------
item: StepRepr_RepresentationItem
PSA: StepVisual_PresentationStyleAssignment
Override: StepVisual_StyledItem

Returns
-------
opencascade::handle<StepVisual_StyledItem>
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA, const opencascade::handle<StepVisual_StyledItem> & Override);

		/****************** AddStyle ******************/
		/**** md5 signature: a3e24f459631405f8d6ee2f0b78f80d2 ****/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "Create a style linking giving psa to the shape, and add it to the sequence of stored styles. if override is not null, then the resulting style will be of the subtype overridingstyleditem. the sape is used to find corresponding step entity by call to stepconstruct::findentity(), then previous method is called.

Parameters
----------
Shape: TopoDS_Shape
PSA: StepVisual_PresentationStyleAssignment
Override: StepVisual_StyledItem

Returns
-------
opencascade::handle<StepVisual_StyledItem>
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle(const TopoDS_Shape & Shape, const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA, const opencascade::handle<StepVisual_StyledItem> & Override);

		/****************** ClearStyles ******************/
		/**** md5 signature: 3c055a351c50dc937879dd8ee1f35179 ****/
		%feature("compactdefaultargs") ClearStyles;
		%feature("autodoc", "Clears all defined styles and psa sequence.

Returns
-------
None
") ClearStyles;
		void ClearStyles();

		/****************** CreateMDGPR ******************/
		/**** md5 signature: 8485de9c2c2de832f4f067ff0e6544ad ****/
		%feature("compactdefaultargs") CreateMDGPR;
		%feature("autodoc", "Create mdgpr, fill it with all the styles previously defined, and add it to the model.

Parameters
----------
Context: StepRepr_RepresentationContext
MDGPR: StepVisual_MechanicalDesignGeometricPresentationRepresentation

Returns
-------
bool
") CreateMDGPR;
		Standard_Boolean CreateMDGPR(const opencascade::handle<StepRepr_RepresentationContext> & Context, opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> & MDGPR);

		/****************** CreateNAUOSRD ******************/
		/**** md5 signature: 2dc1e1e3a3196d80506df8dd27ab2f97 ****/
		%feature("compactdefaultargs") CreateNAUOSRD;
		%feature("autodoc", "Create mdgpr, fill it with all the styles previously defined, and add it to the model important: <initpds> must be null when use for nauo colors <initpds> initialised only for shuo case.

Parameters
----------
Context: StepRepr_RepresentationContext
CDSR: StepShape_ContextDependentShapeRepresentation
initPDS: StepRepr_ProductDefinitionShape

Returns
-------
bool
") CreateNAUOSRD;
		Standard_Boolean CreateNAUOSRD(const opencascade::handle<StepRepr_RepresentationContext> & Context, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR, const opencascade::handle<StepRepr_ProductDefinitionShape> & initPDS);

		/****************** DecodeColor ******************/
		/**** md5 signature: e6ca5c55fd8058d3e8c5437c3a9c90c5 ****/
		%feature("compactdefaultargs") DecodeColor;
		%feature("autodoc", "Decodes step color and fills the quantity_color. returns true if ok or false if color is not recognized.

Parameters
----------
Colour: StepVisual_Colour
Col: Quantity_Color

Returns
-------
bool
") DecodeColor;
		static Standard_Boolean DecodeColor(const opencascade::handle<StepVisual_Colour> & Colour, Quantity_Color & Col);

		/****************** EncodeColor ******************/
		/**** md5 signature: b8f7fe0b0b026d21e660b266032b3b13 ****/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "Create step color entity by given quantity_color the analysis is performed for whether the color corresponds to one of standard colors predefined in step. in that case, predefinedcolour entity is created instead of rgbcolour.

Parameters
----------
Col: Quantity_Color

Returns
-------
opencascade::handle<StepVisual_Colour>
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor(const Quantity_Color & Col);

		/****************** EncodeColor ******************/
		/**** md5 signature: 5512546316147cd700d4eaee0951e2e8 ****/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "Create step color entity by given quantity_color the analysis is performed for whether the color corresponds to one of standard colors predefined in step. in that case, predefinedcolour entity is created instead of rgbcolour.

Parameters
----------
Col: Quantity_Color
DPDCs: STEPConstruct_DataMapOfAsciiStringTransient
ColRGBs: STEPConstruct_DataMapOfPointTransient

Returns
-------
opencascade::handle<StepVisual_Colour>
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor(const Quantity_Color & Col, STEPConstruct_DataMapOfAsciiStringTransient & DPDCs, STEPConstruct_DataMapOfPointTransient & ColRGBs);

		/****************** FindContext ******************/
		/**** md5 signature: 686534002fbf51b23e0002361011ca16 ****/
		%feature("compactdefaultargs") FindContext;
		%feature("autodoc", "Searches the step model for the representationcontext in which given shape is defined. this context (if found) can be used then in call to createmdgpr().

Parameters
----------
Shape: TopoDS_Shape

Returns
-------
opencascade::handle<StepRepr_RepresentationContext>
") FindContext;
		opencascade::handle<StepRepr_RepresentationContext> FindContext(const TopoDS_Shape & Shape);

		/****************** GetColorPSA ******************/
		/**** md5 signature: ec1cda08b766f766a74737a5399f5ef9 ****/
		%feature("compactdefaultargs") GetColorPSA;
		%feature("autodoc", "Returns a presentationstyleassignment entity which defines surface and curve colors as col. this psa is either created or taken from internal map where all psas created by this method are remembered.

Parameters
----------
item: StepRepr_RepresentationItem
Col: StepVisual_Colour

Returns
-------
opencascade::handle<StepVisual_PresentationStyleAssignment>
") GetColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> GetColorPSA(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_Colour> & Col);

		/****************** GetColors ******************/
		/**** md5 signature: f73a2d38bae33411a706e14054746a5e ****/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Extract color definitions from the style entity for each type of color supported, result can be either null if it is not defined by that style, or last definition (if they are 1 or more).

Parameters
----------
style: StepVisual_StyledItem
SurfCol: StepVisual_Colour
BoundCol: StepVisual_Colour
CurveCol: StepVisual_Colour

Returns
-------
IsComponent: bool
") GetColors;
		Standard_Boolean GetColors(const opencascade::handle<StepVisual_StyledItem> & style, opencascade::handle<StepVisual_Colour> & SurfCol, opencascade::handle<StepVisual_Colour> & BoundCol, opencascade::handle<StepVisual_Colour> & CurveCol, Standard_Boolean &OutValue);

		/****************** Init ******************/
		/**** md5 signature: a41268d32348bb8b355efce3731d2872 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes tool; returns true if succeeded.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** LoadInvisStyles ******************/
		/**** md5 signature: 0e85b82c907be2deec7d1178e9b59af4 ****/
		%feature("compactdefaultargs") LoadInvisStyles;
		%feature("autodoc", "Searches the step model for the inisibility enteties (which bring styles) and fills out sequence of styles.

Parameters
----------
InvSyles: TColStd_HSequenceOfTransient

Returns
-------
bool
") LoadInvisStyles;
		Standard_Boolean LoadInvisStyles(opencascade::handle<TColStd_HSequenceOfTransient> & InvSyles);

		/****************** LoadStyles ******************/
		/**** md5 signature: 7a3a805ebf468c04036b606dec93b856 ****/
		%feature("compactdefaultargs") LoadStyles;
		%feature("autodoc", "Searches the step model for the mdgpr or dm entities (which bring styles) and fills sequence of styles.

Returns
-------
bool
") LoadStyles;
		Standard_Boolean LoadStyles();

		/****************** MakeColorPSA ******************/
		/**** md5 signature: b69db16ea2b6ecdb428e57932349e005 ****/
		%feature("compactdefaultargs") MakeColorPSA;
		%feature("autodoc", "Create a presentationstyleassignment entity which defines two colors (for filling surfaces and curves) if isfornauo true then returns presentationstylebycontext.

Parameters
----------
item: StepRepr_RepresentationItem
SurfCol: StepVisual_Colour
CurveCol: StepVisual_Colour
isForNAUO: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<StepVisual_PresentationStyleAssignment>
") MakeColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> MakeColorPSA(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_Colour> & SurfCol, const opencascade::handle<StepVisual_Colour> & CurveCol, const Standard_Boolean isForNAUO = Standard_False);

		/****************** NbStyles ******************/
		/**** md5 signature: 9f5fbd515247307ce70e63c6f585ddb7 ****/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Returns number of defined styles.

Returns
-------
int
") NbStyles;
		Standard_Integer NbStyles();

		/****************** Style ******************/
		/**** md5 signature: e152f39ac13e328dca6d350a6f881da8 ****/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "Returns style with given index.

Parameters
----------
i: int

Returns
-------
opencascade::handle<StepVisual_StyledItem>
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
		/****************** STEPConstruct_ValidationProps ******************/
		/**** md5 signature: a7b156b3c80f215cfe9d049ad9ec7693 ****/
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps();

		/****************** STEPConstruct_ValidationProps ******************/
		/**** md5 signature: 8cba10d799d94f804ca763dfc047a298 ****/
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "Creates a tool and loads it with worksession.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** AddArea ******************/
		/**** md5 signature: e2877fb15a0d3a6867b2e499eea4fb20 ****/
		%feature("compactdefaultargs") AddArea;
		%feature("autodoc", "Adds surface area property for given shape (already mapped). returns true if success, false in case of fail.

Parameters
----------
Shape: TopoDS_Shape
Area: float

Returns
-------
bool
") AddArea;
		Standard_Boolean AddArea(const TopoDS_Shape & Shape, const Standard_Real Area);

		/****************** AddCentroid ******************/
		/**** md5 signature: 4119e375beefd95b330a2b11126ae0fa ****/
		%feature("compactdefaultargs") AddCentroid;
		%feature("autodoc", "Adds centroid property for given shape (already mapped). returns true if success, false in case of fail if instance is true, then centroid is assigned to an instance of component in assembly.

Parameters
----------
Shape: TopoDS_Shape
Pnt: gp_Pnt
instance: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddCentroid;
		Standard_Boolean AddCentroid(const TopoDS_Shape & Shape, const gp_Pnt & Pnt, const Standard_Boolean instance = Standard_False);

		/****************** AddProp ******************/
		/**** md5 signature: 5b991713bf2f3c13e85d72348d22e507 ****/
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "General method for adding (writing) a validation property for shape which should be already mapped on writing itself. it uses findtarget() to find target step entity resulting from given shape, and associated context returns true if success, false in case of fail.

Parameters
----------
Shape: TopoDS_Shape
Prop: StepRepr_RepresentationItem
Descr: char *
instance: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddProp;
		Standard_Boolean AddProp(const TopoDS_Shape & Shape, const opencascade::handle<StepRepr_RepresentationItem> & Prop, const char * Descr, const Standard_Boolean instance = Standard_False);

		/****************** AddProp ******************/
		/**** md5 signature: f72fb71cc97ec8abf9b1b1524386d515 ****/
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "General method for adding (writing) a validation property for shape which should be already mapped on writing itself. it takes target and context entities which correspond to shape returns true if success, false in case of fail.

Parameters
----------
target: StepRepr_CharacterizedDefinition
Context: StepRepr_RepresentationContext
Prop: StepRepr_RepresentationItem
Descr: char *

Returns
-------
bool
") AddProp;
		Standard_Boolean AddProp(const StepRepr_CharacterizedDefinition & target, const opencascade::handle<StepRepr_RepresentationContext> & Context, const opencascade::handle<StepRepr_RepresentationItem> & Prop, const char * Descr);

		/****************** AddVolume ******************/
		/**** md5 signature: ce494cdd22f4586fedbbc19b590238d1 ****/
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "Adds volume property for given shape (already mapped). returns true if success, false in case of fail.

Parameters
----------
Shape: TopoDS_Shape
Vol: float

Returns
-------
bool
") AddVolume;
		Standard_Boolean AddVolume(const TopoDS_Shape & Shape, const Standard_Real Vol);

		/****************** FindTarget ******************/
		/**** md5 signature: 7d2e21f11abb38ad6cd418c4b0404080 ****/
		%feature("compactdefaultargs") FindTarget;
		%feature("autodoc", "Finds target step entity to which validation props should be assigned, and corresponding context, starting from shape returns true if success, false in case of fail.

Parameters
----------
S: TopoDS_Shape
target: StepRepr_CharacterizedDefinition
Context: StepRepr_RepresentationContext
instance: bool,optional
	default value is Standard_False

Returns
-------
bool
") FindTarget;
		Standard_Boolean FindTarget(const TopoDS_Shape & S, StepRepr_CharacterizedDefinition & target, opencascade::handle<StepRepr_RepresentationContext> & Context, const Standard_Boolean instance = Standard_False);

		/****************** GetPropNAUO ******************/
		/**** md5 signature: 00f2ec9fa6dbab21c65468db734371e7 ****/
		%feature("compactdefaultargs") GetPropNAUO;
		%feature("autodoc", "Returns cdsr associated with given ppd or null if not found (when, try getpropsdr).

Parameters
----------
PD: StepRepr_PropertyDefinition

Returns
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") GetPropNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetPropNAUO(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****************** GetPropPD ******************/
		/**** md5 signature: cd8dd7115dc2e81d9eef3cc12ac48f56 ****/
		%feature("compactdefaultargs") GetPropPD;
		%feature("autodoc", "Returns sdr associated with given ppd or null if not found (when, try getpropcdsr).

Parameters
----------
PD: StepRepr_PropertyDefinition

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") GetPropPD;
		opencascade::handle<StepBasic_ProductDefinition> GetPropPD(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****************** GetPropPnt ******************/
		/**** md5 signature: 039be3ee6ea8f00d4012c24fe1b03dd9 ****/
		%feature("compactdefaultargs") GetPropPnt;
		%feature("autodoc", "Returns value of centriod property (or false if it is not).

Parameters
----------
item: StepRepr_RepresentationItem
Context: StepRepr_RepresentationContext
Pnt: gp_Pnt

Returns
-------
bool
") GetPropPnt;
		Standard_Boolean GetPropPnt(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepRepr_RepresentationContext> & Context, gp_Pnt & Pnt);

		/****************** GetPropReal ******************/
		/**** md5 signature: 24654874ae79115566db0c15d04ac24a ****/
		%feature("compactdefaultargs") GetPropReal;
		%feature("autodoc", "Returns value of real-valued property (area or volume) if property is neither area nor volume, returns false else returns true and isarea indicates whether property is area or volume.

Parameters
----------
item: StepRepr_RepresentationItem

Returns
-------
Val: float
isArea: bool
") GetPropReal;
		Standard_Boolean GetPropReal(const opencascade::handle<StepRepr_RepresentationItem> & item, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****************** GetPropShape ******************/
		/**** md5 signature: 16026c6cc5e907b0af72d056c5f3be1c ****/
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "Returns shape associated with given sdr or null shape if not found.

Parameters
----------
ProdDef: StepBasic_ProductDefinition

Returns
-------
TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape(const opencascade::handle<StepBasic_ProductDefinition> & ProdDef);

		/****************** GetPropShape ******************/
		/**** md5 signature: c1acb50ef0bbfb37d2ffd763fd5d70e6 ****/
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "Returns shape associated with given ppd or null shape if not found.

Parameters
----------
PD: StepRepr_PropertyDefinition

Returns
-------
TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****************** Init ******************/
		/**** md5 signature: a41268d32348bb8b355efce3731d2872 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Load worksession; returns true if succeeded.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** LoadProps ******************/
		/**** md5 signature: e20b1850e2c4978e8838902ce428c954 ****/
		%feature("compactdefaultargs") LoadProps;
		%feature("autodoc", "Searches for entities of the type propertydefinitionrepresentation in the model and fills the sequence by them.

Parameters
----------
seq: TColStd_SequenceOfTransient

Returns
-------
bool
") LoadProps;
		Standard_Boolean LoadProps(TColStd_SequenceOfTransient & seq);

		/****************** SetAssemblyShape ******************/
		/**** md5 signature: 2bea02eb53d21b8bd84a59fa21801c31 ****/
		%feature("compactdefaultargs") SetAssemblyShape;
		%feature("autodoc", "Sets current assembly shape sdr (for findcdsr calls).

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
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
