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
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<StepData_module.hxx>
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
%import TCollection.i
%import TColStd.i
%import StepData.i
%import gp.i
%import XSControl.i
%import StepVisual.i
%import Quantity.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(STEPConstruct_DataMapOfAsciiStringTransient) NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Standard_Transient>, TCollection_AsciiString>;
%template(STEPConstruct_DataMapOfPointTransient) NCollection_DataMap <gp_Pnt , opencascade::handle <Standard_Transient>, STEPConstruct_PointHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Standard_Transient>, TCollection_AsciiString> STEPConstruct_DataMapOfAsciiStringTransient;
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Standard_Transient>, TCollection_AsciiString>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
typedef NCollection_DataMap <gp_Pnt , opencascade::handle <Standard_Transient>, STEPConstruct_PointHasher> STEPConstruct_DataMapOfPointTransient;
typedef NCollection_DataMap <gp_Pnt , opencascade::handle <Standard_Transient>, STEPConstruct_PointHasher>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
/* end typedefs declaration */

%rename(stepconstruct) STEPConstruct;
class STEPConstruct {
	public:
		%feature("compactdefaultargs") FindCDSR;
		%feature("autodoc", "	* Find CDSR correcponding to the component in the specified assembly

	:param ComponentBinder:
	:type ComponentBinder: opencascade::handle<Transfer_Binder> &
	:param AssemblySDR:
	:type AssemblySDR: opencascade::handle<StepShape_ShapeDefinitionRepresentation> &
	:param ComponentCDSR:
	:type ComponentCDSR: opencascade::handle<StepShape_ContextDependentShapeRepresentation> &
	:rtype: bool
") FindCDSR;
		static Standard_Boolean FindCDSR (const opencascade::handle<Transfer_Binder> & ComponentBinder,const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & AssemblySDR,opencascade::handle<StepShape_ContextDependentShapeRepresentation> & ComponentCDSR);
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "	* Returns STEP entity of the (sub)type of RepresentationItem which is a result of the tranalation of the Shape, or Null if no result is recorded

	:param FinderProcess:
	:type FinderProcess: opencascade::handle<Transfer_FinderProcess> &
	:param Shape:
	:type Shape: TopoDS_Shape &
	:rtype: opencascade::handle<StepRepr_RepresentationItem>
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity (const opencascade::handle<Transfer_FinderProcess> & FinderProcess,const TopoDS_Shape & Shape);
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "	* The same as above, but in the case if item not found, repeats search on the same shape without location. The Loc corresponds to the location with which result is found (either location of the Shape, or Null)

	:param FinderProcess:
	:type FinderProcess: opencascade::handle<Transfer_FinderProcess> &
	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Loc:
	:type Loc: TopLoc_Location &
	:rtype: opencascade::handle<StepRepr_RepresentationItem>
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity (const opencascade::handle<Transfer_FinderProcess> & FinderProcess,const TopoDS_Shape & Shape,TopLoc_Location & Loc);
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "	* Returns Shape resulting from given STEP entity (Null if not mapped)

	:param TransientProcess:
	:type TransientProcess: opencascade::handle<Transfer_TransientProcess> &
	:param item:
	:type item: opencascade::handle<StepRepr_RepresentationItem> &
	:rtype: TopoDS_Shape
") FindShape;
		static TopoDS_Shape FindShape (const opencascade::handle<Transfer_TransientProcess> & TransientProcess,const opencascade::handle<StepRepr_RepresentationItem> & item);
};


%extend STEPConstruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_AP203Context;
class STEPConstruct_AP203Context {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears all fields describing entities specific to each part

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") DefaultApproval;
		%feature("autodoc", "	* Returns default approval entity which is used when no other data are available

	:rtype: opencascade::handle<StepBasic_Approval>
") DefaultApproval;
		opencascade::handle<StepBasic_Approval> DefaultApproval ();
		%feature("compactdefaultargs") DefaultDateAndTime;
		%feature("autodoc", "	* Returns default date_and_time entity which is used when no other data are available

	:rtype: opencascade::handle<StepBasic_DateAndTime>
") DefaultDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DefaultDateAndTime ();
		%feature("compactdefaultargs") DefaultPersonAndOrganization;
		%feature("autodoc", "	* Returns default person_and_organization entity which is used when no other data are available

	:rtype: opencascade::handle<StepBasic_PersonAndOrganization>
") DefaultPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> DefaultPersonAndOrganization ();
		%feature("compactdefaultargs") DefaultSecurityClassificationLevel;
		%feature("autodoc", "	* Returns default security_classification_level entity which is used when no other data are available

	:rtype: opencascade::handle<StepBasic_SecurityClassificationLevel>
") DefaultSecurityClassificationLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> DefaultSecurityClassificationLevel ();
		%feature("compactdefaultargs") GetApproval;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignApproval>
") GetApproval;
		opencascade::handle<StepAP203_CcDesignApproval> GetApproval ();
		%feature("compactdefaultargs") GetApprovalDateTime;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApprovalDateTime>
") GetApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> GetApprovalDateTime ();
		%feature("compactdefaultargs") GetApprover;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApprovalPersonOrganization>
") GetApprover;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> GetApprover ();
		%feature("compactdefaultargs") GetClassificationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>
") GetClassificationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetClassificationDate ();
		%feature("compactdefaultargs") GetClassificationOfficer;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetClassificationOfficer;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetClassificationOfficer ();
		%feature("compactdefaultargs") GetCreationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>
") GetCreationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetCreationDate ();
		%feature("compactdefaultargs") GetCreator;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetCreator;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetCreator ();
		%feature("compactdefaultargs") GetDesignOwner;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetDesignOwner;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignOwner ();
		%feature("compactdefaultargs") GetDesignSupplier;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetDesignSupplier;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignSupplier ();
		%feature("compactdefaultargs") GetProductCategoryRelationship;
		%feature("autodoc", "	* Return entities (roots) instantiated for the part by method Init

	:rtype: opencascade::handle<StepBasic_ProductCategoryRelationship>
") GetProductCategoryRelationship;
		opencascade::handle<StepBasic_ProductCategoryRelationship> GetProductCategoryRelationship ();
		%feature("compactdefaultargs") GetSecurity;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignSecurityClassification>
") GetSecurity;
		opencascade::handle<StepAP203_CcDesignSecurityClassification> GetSecurity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Takes SDR (part) which brings all standard data around part (common for AP203 and AP214) and creates all the additional entities required for AP203

	:param sdr:
	:type sdr: opencascade::handle<StepShape_ShapeDefinitionRepresentation> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Takes tool which describes standard data around part (common for AP203 and AP214) and creates all the additional entities required for AP203 //! The created entities can be obtained by calls to methods GetCreator(), GetDesignOwner(), GetDesignSupplier(), GetClassificationOfficer(), GetSecurity(), GetCreationDate(), GetClassificationDate(), GetApproval(), GetApprover(), GetApprovalDateTime(), GetProductCategoryRelationship()

	:param SDRTool:
	:type SDRTool: STEPConstruct_Part &
	:rtype: None
") Init;
		void Init (const STEPConstruct_Part & SDRTool);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Takes NAUO which describes assembly link to component and creates the security_classification entity associated to it as required by the AP203 //! Instantiated (or existing previously) entities concerned can be obtained by calls to methods GetClassificationOfficer(), GetSecurity(), GetClassificationDate(), GetApproval(), GetApprover(), GetApprovalDateTime() Takes tool which describes standard data around part (common for AP203 and AP214) and takes from model (or creates if missing) all the additional entities required by AP203

	:param nauo:
	:type nauo: opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);
		%feature("compactdefaultargs") InitApprovalRequisites;
		%feature("autodoc", "	* Initializes Approver and ApprovalDateTime entities according to Approval entity

	:rtype: None
") InitApprovalRequisites;
		void InitApprovalRequisites ();
		%feature("compactdefaultargs") InitAssembly;
		%feature("autodoc", "	* Initializes all missing data which are required for assembly

	:param nauo:
	:type nauo: opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> &
	:rtype: None
") InitAssembly;
		void InitAssembly (const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);
		%feature("compactdefaultargs") InitRoles;
		%feature("autodoc", "	* Initializes constant fields (shared entities)

	:rtype: None
") InitRoles;
		void InitRoles ();
		%feature("compactdefaultargs") InitSecurityRequisites;
		%feature("autodoc", "	* Initializes ClassificationOfficer and ClassificationDate entities according to Security entity

	:rtype: None
") InitSecurityRequisites;
		void InitSecurityRequisites ();
		%feature("compactdefaultargs") RoleApprover;
		%feature("autodoc", "	* Return predefined PersonAndOrganizationRole and DateTimeRole entities named 'creator', 'design owner', 'design supplier', 'classification officer', 'creation date', 'classification date', 'approver'

	:rtype: opencascade::handle<StepBasic_ApprovalRole>
") RoleApprover;
		opencascade::handle<StepBasic_ApprovalRole> RoleApprover ();
		%feature("compactdefaultargs") RoleClassificationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DateTimeRole>
") RoleClassificationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleClassificationDate ();
		%feature("compactdefaultargs") RoleClassificationOfficer;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleClassificationOfficer;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleClassificationOfficer ();
		%feature("compactdefaultargs") RoleCreationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DateTimeRole>
") RoleCreationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleCreationDate ();
		%feature("compactdefaultargs") RoleCreator;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleCreator;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleCreator ();
		%feature("compactdefaultargs") RoleDesignOwner;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleDesignOwner;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignOwner ();
		%feature("compactdefaultargs") RoleDesignSupplier;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleDesignSupplier;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignSupplier ();
		%feature("compactdefaultargs") STEPConstruct_AP203Context;
		%feature("autodoc", "	* Creates tool and fills constant fields

	:rtype: None
") STEPConstruct_AP203Context;
		 STEPConstruct_AP203Context ();
		%feature("compactdefaultargs") SetDefaultApproval;
		%feature("autodoc", "	* Sets default approval

	:param app:
	:type app: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") SetDefaultApproval;
		void SetDefaultApproval (const opencascade::handle<StepBasic_Approval> & app);
		%feature("compactdefaultargs") SetDefaultDateAndTime;
		%feature("autodoc", "	* Sets default date_and_time entity

	:param dt:
	:type dt: opencascade::handle<StepBasic_DateAndTime> &
	:rtype: None
") SetDefaultDateAndTime;
		void SetDefaultDateAndTime (const opencascade::handle<StepBasic_DateAndTime> & dt);
		%feature("compactdefaultargs") SetDefaultPersonAndOrganization;
		%feature("autodoc", "	* Sets default person_and_organization entity

	:param po:
	:type po: opencascade::handle<StepBasic_PersonAndOrganization> &
	:rtype: None
") SetDefaultPersonAndOrganization;
		void SetDefaultPersonAndOrganization (const opencascade::handle<StepBasic_PersonAndOrganization> & po);
		%feature("compactdefaultargs") SetDefaultSecurityClassificationLevel;
		%feature("autodoc", "	* Sets default security_classification_level

	:param sc:
	:type sc: opencascade::handle<StepBasic_SecurityClassificationLevel> &
	:rtype: None
") SetDefaultSecurityClassificationLevel;
		void SetDefaultSecurityClassificationLevel (const opencascade::handle<StepBasic_SecurityClassificationLevel> & sc);
};


%extend STEPConstruct_AP203Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_Assembly;
class STEPConstruct_Assembly {
	public:
		%feature("compactdefaultargs") CheckSRRReversesNAUO;
		%feature("autodoc", "	* Checks whether SRR's definition of assembly and component contradicts with NAUO definition or not, according to model schema (AP214 or AP203)

	:param theGraph:
	:type theGraph: Interface_Graph &
	:param CDSR:
	:type CDSR: opencascade::handle<StepShape_ContextDependentShapeRepresentation> &
	:rtype: bool
") CheckSRRReversesNAUO;
		static Standard_Boolean CheckSRRReversesNAUO (const Interface_Graph & theGraph,const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR);
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "	* Returns NAUO object describing the assembly link

	:rtype: opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") GetNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetNAUO ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialises with starting values Ax0 : origin axis (typically, standard XYZ) Loc : location to which place the item Makes a MappedItem Resulting Value is returned by ItemValue

	:param aSR:
	:type aSR: opencascade::handle<StepShape_ShapeDefinitionRepresentation> &
	:param SDR0:
	:type SDR0: opencascade::handle<StepShape_ShapeDefinitionRepresentation> &
	:param Ax0:
	:type Ax0: opencascade::handle<StepGeom_Axis2Placement3d> &
	:param Loc:
	:type Loc: opencascade::handle<StepGeom_Axis2Placement3d> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aSR,const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR0,const opencascade::handle<StepGeom_Axis2Placement3d> & Ax0,const opencascade::handle<StepGeom_Axis2Placement3d> & Loc);
		%feature("compactdefaultargs") ItemLocation;
		%feature("autodoc", "	* Returns the location of the item, computed from starting aLoc

	:rtype: opencascade::handle<StepGeom_Axis2Placement3d>
") ItemLocation;
		opencascade::handle<StepGeom_Axis2Placement3d> ItemLocation ();
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "	* Returns the Value If no Make... has been called, returns the starting SR

	:rtype: opencascade::handle<Standard_Transient>
") ItemValue;
		opencascade::handle<Standard_Transient> ItemValue ();
		%feature("compactdefaultargs") MakeRelationship;
		%feature("autodoc", "	* Make a (ShapeRepresentationRelationship,...WithTransformation) Resulting Value is returned by ItemValue

	:rtype: None
") MakeRelationship;
		void MakeRelationship ();
		%feature("compactdefaultargs") STEPConstruct_Assembly;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_Assembly;
		 STEPConstruct_Assembly ();
};


%extend STEPConstruct_Assembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_ContextTool;
class STEPConstruct_ContextTool {
	public:
		%feature("compactdefaultargs") AP203Context;
		%feature("autodoc", "	* Returns tool which maintains context specific for AP203

	:rtype: STEPConstruct_AP203Context
") AP203Context;
		STEPConstruct_AP203Context & AP203Context ();
		%feature("compactdefaultargs") AddAPD;
		%feature("autodoc", "	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: None
") AddAPD;
		void AddAPD (const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") GetACname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetACname;
		opencascade::handle<TCollection_HAsciiString> GetACname ();
		%feature("compactdefaultargs") GetACschemaName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetACschemaName;
		opencascade::handle<TCollection_HAsciiString> GetACschemaName ();
		%feature("compactdefaultargs") GetACstatus;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetACstatus;
		opencascade::handle<TCollection_HAsciiString> GetACstatus ();
		%feature("compactdefaultargs") GetACyear;
		%feature("autodoc", "	:rtype: int
") GetACyear;
		Standard_Integer GetACyear ();
		%feature("compactdefaultargs") GetAPD;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApplicationProtocolDefinition>
") GetAPD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAPD ();
		%feature("compactdefaultargs") GetDefaultAxis;
		%feature("autodoc", "	* Returns a default axis placement

	:rtype: opencascade::handle<StepGeom_Axis2Placement3d>
") GetDefaultAxis;
		opencascade::handle<StepGeom_Axis2Placement3d> GetDefaultAxis ();
		%feature("compactdefaultargs") GetProductName;
		%feature("autodoc", "	* Generates a product name basing on write.step.product.name parameter and current position in the assembly structure

	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetProductName;
		opencascade::handle<TCollection_HAsciiString> GetProductName ();
		%feature("compactdefaultargs") GetRootsForAssemblyLink;
		%feature("autodoc", "	* Produces and returns a full list of root entities required for assembly link identified by assembly (including NAUO and CDSR)

	:param assembly:
	:type assembly: STEPConstruct_Assembly &
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") GetRootsForAssemblyLink;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForAssemblyLink (const STEPConstruct_Assembly & assembly);
		%feature("compactdefaultargs") GetRootsForPart;
		%feature("autodoc", "	* Produces and returns a full list of root entities required for part identified by SDRTool (including SDR itself)

	:param SDRTool:
	:type SDRTool: STEPConstruct_Part &
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") GetRootsForPart;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForPart (const STEPConstruct_Part & SDRTool);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns current index of assembly component on current level

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") IsAP203;
		%feature("autodoc", "	* Returns True if APD.schema_name is config_control_design

	:rtype: bool
") IsAP203;
		Standard_Boolean IsAP203 ();
		%feature("compactdefaultargs") IsAP214;
		%feature("autodoc", "	* Returns True if APD.schema_name is automotive_design

	:rtype: bool
") IsAP214;
		Standard_Boolean IsAP214 ();
		%feature("compactdefaultargs") IsAP242;
		%feature("autodoc", "	* Returns True if APD.schema_name is ap242_managed_model_based_3d_engineering

	:rtype: bool
") IsAP242;
		Standard_Boolean IsAP242 ();
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "	* Returns current assembly level

	:rtype: int
") Level;
		Standard_Integer Level ();
		%feature("compactdefaultargs") NextIndex;
		%feature("autodoc", "	:rtype: None
") NextIndex;
		void NextIndex ();
		%feature("compactdefaultargs") NextLevel;
		%feature("autodoc", "	:rtype: None
") NextLevel;
		void NextLevel ();
		%feature("compactdefaultargs") PrevIndex;
		%feature("autodoc", "	:rtype: None
") PrevIndex;
		void PrevIndex ();
		%feature("compactdefaultargs") PrevLevel;
		%feature("autodoc", "	:rtype: None
") PrevLevel;
		void PrevLevel ();
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool ();
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "	:param aStepModel:
	:type aStepModel: opencascade::handle<StepData_StepModel> &
	:rtype: None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool (const opencascade::handle<StepData_StepModel> & aStepModel);
		%feature("compactdefaultargs") SetACname;
		%feature("autodoc", "	:param name:
	:type name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetACname;
		void SetACname (const opencascade::handle<TCollection_HAsciiString> & name);
		%feature("compactdefaultargs") SetACschemaName;
		%feature("autodoc", "	:param schemaName:
	:type schemaName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetACschemaName;
		void SetACschemaName (const opencascade::handle<TCollection_HAsciiString> & schemaName);
		%feature("compactdefaultargs") SetACstatus;
		%feature("autodoc", "	:param status:
	:type status: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetACstatus;
		void SetACstatus (const opencascade::handle<TCollection_HAsciiString> & status);
		%feature("compactdefaultargs") SetACyear;
		%feature("autodoc", "	:param year:
	:type year: int
	:rtype: None
") SetACyear;
		void SetACyear (const Standard_Integer year);
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Changes current index of assembly component on current level

	:param ind:
	:type ind: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer ind);
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "	* Changes current assembly level

	:param lev:
	:type lev: int
	:rtype: None
") SetLevel;
		void SetLevel (const Standard_Integer lev);
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Initialize ApplicationProtocolDefinition by the first entity of that type found in the model

	:param aStepModel:
	:type aStepModel: opencascade::handle<StepData_StepModel> &
	:rtype: None
") SetModel;
		void SetModel (const opencascade::handle<StepData_StepModel> & aStepModel);
};


%extend STEPConstruct_ContextTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_Part;
class STEPConstruct_Part {
	public:
		%feature("compactdefaultargs") AC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApplicationContext>
") AC;
		opencascade::handle<StepBasic_ApplicationContext> AC ();
		%feature("compactdefaultargs") ACapplication;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") ACapplication;
		opencascade::handle<TCollection_HAsciiString> ACapplication ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") MakeSDR;
		%feature("autodoc", "	:param aShape:
	:type aShape: opencascade::handle<StepShape_ShapeRepresentation> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param AC:
	:type AC: opencascade::handle<StepBasic_ApplicationContext> &
	:rtype: None
") MakeSDR;
		void MakeSDR (const opencascade::handle<StepShape_ShapeRepresentation> & aShape,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_ApplicationContext> & AC);
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductContext>
") PC;
		opencascade::handle<StepBasic_ProductContext> PC ();
		%feature("compactdefaultargs") PCdisciplineType;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PCdisciplineType;
		opencascade::handle<TCollection_HAsciiString> PCdisciplineType ();
		%feature("compactdefaultargs") PCname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PCname;
		opencascade::handle<TCollection_HAsciiString> PCname ();
		%feature("compactdefaultargs") PD;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") PD;
		opencascade::handle<StepBasic_ProductDefinition> PD ();
		%feature("compactdefaultargs") PDC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinitionContext>
") PDC;
		opencascade::handle<StepBasic_ProductDefinitionContext> PDC ();
		%feature("compactdefaultargs") PDCname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDCname;
		opencascade::handle<TCollection_HAsciiString> PDCname ();
		%feature("compactdefaultargs") PDCstage;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDCstage;
		opencascade::handle<TCollection_HAsciiString> PDCstage ();
		%feature("compactdefaultargs") PDF;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>
") PDF;
		opencascade::handle<StepBasic_ProductDefinitionFormation> PDF ();
		%feature("compactdefaultargs") PDFdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDFdescription;
		opencascade::handle<TCollection_HAsciiString> PDFdescription ();
		%feature("compactdefaultargs") PDFid;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDFid;
		opencascade::handle<TCollection_HAsciiString> PDFid ();
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "	:rtype: opencascade::handle<StepRepr_ProductDefinitionShape>
") PDS;
		opencascade::handle<StepRepr_ProductDefinitionShape> PDS ();
		%feature("compactdefaultargs") PDSdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDSdescription;
		opencascade::handle<TCollection_HAsciiString> PDSdescription ();
		%feature("compactdefaultargs") PDSname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDSname;
		opencascade::handle<TCollection_HAsciiString> PDSname ();
		%feature("compactdefaultargs") PDdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDdescription;
		opencascade::handle<TCollection_HAsciiString> PDdescription ();
		%feature("compactdefaultargs") PRPC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductRelatedProductCategory>
") PRPC;
		opencascade::handle<StepBasic_ProductRelatedProductCategory> PRPC ();
		%feature("compactdefaultargs") PRPCdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PRPCdescription;
		opencascade::handle<TCollection_HAsciiString> PRPCdescription ();
		%feature("compactdefaultargs") PRPCname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PRPCname;
		opencascade::handle<TCollection_HAsciiString> PRPCname ();
		%feature("compactdefaultargs") Pdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Pdescription;
		opencascade::handle<TCollection_HAsciiString> Pdescription ();
		%feature("compactdefaultargs") Pid;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Pid;
		opencascade::handle<TCollection_HAsciiString> Pid ();
		%feature("compactdefaultargs") Pname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Pname;
		opencascade::handle<TCollection_HAsciiString> Pname ();
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product ();
		%feature("compactdefaultargs") ReadSDR;
		%feature("autodoc", "	:param aShape:
	:type aShape: opencascade::handle<StepShape_ShapeDefinitionRepresentation> &
	:rtype: None
") ReadSDR;
		void ReadSDR (const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aShape);
		%feature("compactdefaultargs") SDRValue;
		%feature("autodoc", "	* Returns SDR or Null if not done

	:rtype: opencascade::handle<StepShape_ShapeDefinitionRepresentation>
") SDRValue;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> SDRValue ();
		%feature("compactdefaultargs") SRValue;
		%feature("autodoc", "	* Returns SDR->UsedRepresentation() or Null if not done

	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") SRValue;
		opencascade::handle<StepShape_ShapeRepresentation> SRValue ();
		%feature("compactdefaultargs") STEPConstruct_Part;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_Part;
		 STEPConstruct_Part ();
		%feature("compactdefaultargs") SetACapplication;
		%feature("autodoc", "	:param text:
	:type text: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetACapplication;
		void SetACapplication (const opencascade::handle<TCollection_HAsciiString> & text);
		%feature("compactdefaultargs") SetPCdisciplineType;
		%feature("autodoc", "	:param label:
	:type label: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPCdisciplineType;
		void SetPCdisciplineType (const opencascade::handle<TCollection_HAsciiString> & label);
		%feature("compactdefaultargs") SetPCname;
		%feature("autodoc", "	:param name:
	:type name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPCname;
		void SetPCname (const opencascade::handle<TCollection_HAsciiString> & name);
		%feature("compactdefaultargs") SetPDCname;
		%feature("autodoc", "	:param label:
	:type label: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPDCname;
		void SetPDCname (const opencascade::handle<TCollection_HAsciiString> & label);
		%feature("compactdefaultargs") SetPDCstage;
		%feature("autodoc", "	:param label:
	:type label: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPDCstage;
		void SetPDCstage (const opencascade::handle<TCollection_HAsciiString> & label);
		%feature("compactdefaultargs") SetPDFdescription;
		%feature("autodoc", "	:param text:
	:type text: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPDFdescription;
		void SetPDFdescription (const opencascade::handle<TCollection_HAsciiString> & text);
		%feature("compactdefaultargs") SetPDFid;
		%feature("autodoc", "	:param id:
	:type id: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPDFid;
		void SetPDFid (const opencascade::handle<TCollection_HAsciiString> & id);
		%feature("compactdefaultargs") SetPDSdescription;
		%feature("autodoc", "	:param text:
	:type text: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPDSdescription;
		void SetPDSdescription (const opencascade::handle<TCollection_HAsciiString> & text);
		%feature("compactdefaultargs") SetPDSname;
		%feature("autodoc", "	:param label:
	:type label: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPDSname;
		void SetPDSname (const opencascade::handle<TCollection_HAsciiString> & label);
		%feature("compactdefaultargs") SetPDdescription;
		%feature("autodoc", "	:param text:
	:type text: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPDdescription;
		void SetPDdescription (const opencascade::handle<TCollection_HAsciiString> & text);
		%feature("compactdefaultargs") SetPRPCdescription;
		%feature("autodoc", "	:param text:
	:type text: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPRPCdescription;
		void SetPRPCdescription (const opencascade::handle<TCollection_HAsciiString> & text);
		%feature("compactdefaultargs") SetPRPCname;
		%feature("autodoc", "	:param label:
	:type label: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPRPCname;
		void SetPRPCname (const opencascade::handle<TCollection_HAsciiString> & label);
		%feature("compactdefaultargs") SetPdescription;
		%feature("autodoc", "	:param text:
	:type text: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPdescription;
		void SetPdescription (const opencascade::handle<TCollection_HAsciiString> & text);
		%feature("compactdefaultargs") SetPid;
		%feature("autodoc", "	:param id:
	:type id: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPid;
		void SetPid (const opencascade::handle<TCollection_HAsciiString> & id);
		%feature("compactdefaultargs") SetPname;
		%feature("autodoc", "	:param label:
	:type label: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPname;
		void SetPname (const opencascade::handle<TCollection_HAsciiString> & label);
};


%extend STEPConstruct_Part {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class STEPConstruct_PointHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Computes a hash code for the point, in the range [1, theUpperBound] @param thePoint the point which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]

	:param thePoint:
	:type thePoint: gp_Pnt
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const gp_Pnt & thePoint,const Standard_Integer theUpperBound);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.

	:param Point1:
	:type Point1: gp_Pnt
	:param Point2:
	:type Point2: gp_Pnt
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const gp_Pnt & Point1,const gp_Pnt & Point2);
};


%extend STEPConstruct_PointHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_Tool;
class STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "	* Returns FinderProcess (writing; Null if not loaded)

	:rtype: opencascade::handle<Transfer_FinderProcess>
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	* Returns current graph (recomputing if necessary)

	:param recompute: default value is Standard_False
	:type recompute: bool
	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph (const Standard_Boolean recompute = Standard_False);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns current model (Null if not loaded)

	:rtype: opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_Tool;
		 STEPConstruct_Tool ();
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "	* Creates a tool and loads it with worksession

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: None
") STEPConstruct_Tool;
		 STEPConstruct_Tool (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	* Returns TransientProcess (reading; Null if not loaded)

	:rtype: opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess ();
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "	* Returns currently loaded WorkSession

	:rtype: opencascade::handle<XSControl_WorkSession>
") WS;
		const opencascade::handle<XSControl_WorkSession> & WS ();
};


%extend STEPConstruct_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_UnitContext;
class STEPConstruct_UnitContext {
	public:
		%feature("compactdefaultargs") AreaDone;
		%feature("autodoc", "	* Returns true if areaFactor is computed

	:rtype: bool
") AreaDone;
		Standard_Boolean AreaDone ();
		%feature("compactdefaultargs") AreaFactor;
		%feature("autodoc", "	* Returns the areaFactor

	:rtype: float
") AreaFactor;
		Standard_Real AreaFactor ();
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "	* Computes the length, plane angle and solid angle conversion factor . Returns a status, 0 if OK

	:param aContext:
	:type aContext: opencascade::handle<StepRepr_GlobalUnitAssignedContext> &
	:rtype: int
") ComputeFactors;
		Standard_Integer ComputeFactors (const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aContext);
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: opencascade::handle<StepBasic_NamedUnit> &
	:rtype: int
") ComputeFactors;
		Standard_Integer ComputeFactors (const opencascade::handle<StepBasic_NamedUnit> & aUnit);
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "	* Computes the uncertainty value (for length)

	:param aContext:
	:type aContext: opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> &
	:rtype: int
") ComputeTolerance;
		Standard_Integer ComputeTolerance (const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & aContext);
		%feature("compactdefaultargs") ConvertSiPrefix;
		%feature("autodoc", "	* Convert SI prefix defined by enumertaion to corresponding real factor (e.g. 1e6 for mega)

	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:rtype: float
") ConvertSiPrefix;
		static Standard_Real ConvertSiPrefix (const StepBasic_SiPrefix aPrefix);
		%feature("compactdefaultargs") HasUncertainty;
		%feature("autodoc", "	* Tells if a Uncertainty (for length) is recorded

	:rtype: bool
") HasUncertainty;
		Standard_Boolean HasUncertainty ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Creates new context (units are MM and radians, uncertainty equal to Tol3d)

	:param Tol3d:
	:type Tol3d: float
	:rtype: None
") Init;
		void Init (const Standard_Real Tol3d);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if Init was called successfully

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") LengthDone;
		%feature("autodoc", "	* Returns true if ComputeFactors has calculated a LengthFactor

	:rtype: bool
") LengthDone;
		Standard_Boolean LengthDone ();
		%feature("compactdefaultargs") LengthFactor;
		%feature("autodoc", "	* Returns the lengthFactor

	:rtype: float
") LengthFactor;
		Standard_Real LengthFactor ();
		%feature("compactdefaultargs") PlaneAngleDone;
		%feature("autodoc", "	* Returns true if ComputeFactors has calculated a PlaneAngleFactor

	:rtype: bool
") PlaneAngleDone;
		Standard_Boolean PlaneAngleDone ();
		%feature("compactdefaultargs") PlaneAngleFactor;
		%feature("autodoc", "	* Returns the planeAngleFactor

	:rtype: float
") PlaneAngleFactor;
		Standard_Real PlaneAngleFactor ();
		%feature("compactdefaultargs") STEPConstruct_UnitContext;
		%feature("autodoc", "	* Creates empty tool

	:rtype: None
") STEPConstruct_UnitContext;
		 STEPConstruct_UnitContext ();
		%feature("compactdefaultargs") SolidAngleDone;
		%feature("autodoc", "	* Returns true if ComputeFactors has calculated a SolidAngleFactor

	:rtype: bool
") SolidAngleDone;
		Standard_Boolean SolidAngleDone ();
		%feature("compactdefaultargs") SolidAngleFactor;
		%feature("autodoc", "	* Returns the solidAngleFactor

	:rtype: float
") SolidAngleFactor;
		Standard_Real SolidAngleFactor ();
		%feature("compactdefaultargs") StatusMessage;
		%feature("autodoc", "	* Returns a message for a given status (0 - empty) This message can then be added as warning for transfer

	:param status:
	:type status: int
	:rtype: char *
") StatusMessage;
		const char * StatusMessage (const Standard_Integer status);
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "	* Returns the Uncertainty value (for length) It has been converted with LengthFactor

	:rtype: float
") Uncertainty;
		Standard_Real Uncertainty ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns context (or Null if not done)

	:rtype: opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx>
") Value;
		opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> Value ();
		%feature("compactdefaultargs") VolumeDone;
		%feature("autodoc", "	* Returns true if volumeFactor is computed

	:rtype: bool
") VolumeDone;
		Standard_Boolean VolumeDone ();
		%feature("compactdefaultargs") VolumeFactor;
		%feature("autodoc", "	* Returns the volumeFactor

	:rtype: float
") VolumeFactor;
		Standard_Real VolumeFactor ();
};


%extend STEPConstruct_UnitContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_ExternRefs;
class STEPConstruct_ExternRefs : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") AddExternRef;
		%feature("autodoc", "	* Create a new external reference with specified attributes attached to a given SDR <format> can be Null string, in that case this information is not written. Else, it can be 'STEP AP214' or 'STEP AP203' Returns index of a new extern ref

	:param filename:
	:type filename: char *
	:param PD:
	:type PD: opencascade::handle<StepBasic_ProductDefinition> &
	:param format:
	:type format: char *
	:rtype: int
") AddExternRef;
		Standard_Integer AddExternRef (const char * filename,const opencascade::handle<StepBasic_ProductDefinition> & PD,const char * format);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears internal fields (list of defined extern refs)

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns filename for numth extern reference Returns Null if FileName is not defined or bad

	:param num:
	:type num: int
	:rtype: char *
") FileName;
		const char * FileName (const Standard_Integer num);
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "	* Returns format identification string for the extern document Returns Null handle if format is not defined

	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>
") Format;
		opencascade::handle<TCollection_HAsciiString> Format (const Standard_Integer num);
		%feature("compactdefaultargs") GetAP214APD;
		%feature("autodoc", "	* Returns the ApplicationProtocolDefinition of the PDM schema NOTE: if not defined then create new APD with new Application Context

	:rtype: opencascade::handle<StepBasic_ApplicationProtocolDefinition>
") GetAP214APD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAP214APD ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes tool; returns True if succeeded

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: bool
") Init;
		Standard_Boolean Init (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") LoadExternRefs;
		%feature("autodoc", "	* Searches current STEP model for external references and loads them to the internal data structures NOTE: does not clear data structures before loading

	:rtype: bool
") LoadExternRefs;
		Standard_Boolean LoadExternRefs ();
		%feature("compactdefaultargs") NbExternRefs;
		%feature("autodoc", "	* Returns number of defined extern references

	:rtype: int
") NbExternRefs;
		Standard_Integer NbExternRefs ();
		%feature("compactdefaultargs") ProdDef;
		%feature("autodoc", "	* Returns ProductDefinition to which numth extern reference is associated. Returns Null if cannot be detected or if extern reference is not associated to SDR in a proper way.

	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") ProdDef;
		opencascade::handle<StepBasic_ProductDefinition> ProdDef (const Standard_Integer num);
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs ();
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "	* Creates a tool and initializes it

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") SetAP214APD;
		%feature("autodoc", "	* Set the ApplicationProtocolDefinition of the PDM schema

	:param APD:
	:type APD: opencascade::handle<StepBasic_ApplicationProtocolDefinition> &
	:rtype: None
") SetAP214APD;
		void SetAP214APD (const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & APD);
		%feature("compactdefaultargs") WriteExternRefs;
		%feature("autodoc", "	* Adds all the currently defined external refs to the model Returns number of written extern refs

	:param num:
	:type num: int
	:rtype: int
") WriteExternRefs;
		Standard_Integer WriteExternRefs (const Standard_Integer num);
		%feature("compactdefaultargs") checkAP214Shared;
		%feature("autodoc", "	* Check (create if it is null) all shared entities for the model

	:rtype: None
") checkAP214Shared;
		void checkAP214Shared ();
};


%extend STEPConstruct_ExternRefs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_Styles;
class STEPConstruct_Styles : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "	* Adds a style to a sequence

	:param style:
	:type style: opencascade::handle<StepVisual_StyledItem> &
	:rtype: None
") AddStyle;
		void AddStyle (const opencascade::handle<StepVisual_StyledItem> & style);
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "	* Create a style linking giving PSA to the item, and add it to the sequence of stored styles. If Override is not Null, then the resulting style will be of the subtype OverridingStyledItem.

	:param item:
	:type item: opencascade::handle<StepRepr_RepresentationItem> &
	:param PSA:
	:type PSA: opencascade::handle<StepVisual_PresentationStyleAssignment> &
	:param Override:
	:type Override: opencascade::handle<StepVisual_StyledItem> &
	:rtype: opencascade::handle<StepVisual_StyledItem>
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle (const opencascade::handle<StepRepr_RepresentationItem> & item,const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA,const opencascade::handle<StepVisual_StyledItem> & Override);
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "	* Create a style linking giving PSA to the Shape, and add it to the sequence of stored styles. If Override is not Null, then the resulting style will be of the subtype OverridingStyledItem. The Sape is used to find corresponding STEP entity by call to STEPConstruct::FindEntity(), then previous method is called.

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param PSA:
	:type PSA: opencascade::handle<StepVisual_PresentationStyleAssignment> &
	:param Override:
	:type Override: opencascade::handle<StepVisual_StyledItem> &
	:rtype: opencascade::handle<StepVisual_StyledItem>
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle (const TopoDS_Shape & Shape,const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA,const opencascade::handle<StepVisual_StyledItem> & Override);
		%feature("compactdefaultargs") ClearStyles;
		%feature("autodoc", "	* Clears all defined styles and PSA sequence

	:rtype: None
") ClearStyles;
		void ClearStyles ();
		%feature("compactdefaultargs") CreateMDGPR;
		%feature("autodoc", "	* Create MDGPR, fill it with all the styles previously defined, and add it to the model

	:param Context:
	:type Context: opencascade::handle<StepRepr_RepresentationContext> &
	:param MDGPR:
	:type MDGPR: opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> &
	:rtype: bool
") CreateMDGPR;
		Standard_Boolean CreateMDGPR (const opencascade::handle<StepRepr_RepresentationContext> & Context,opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> & MDGPR);
		%feature("compactdefaultargs") CreateNAUOSRD;
		%feature("autodoc", "	* Create MDGPR, fill it with all the styles previously defined, and add it to the model IMPORTANT: <initPDS> must be null when use for NAUO colors <initPDS> initialised only for SHUO case.

	:param Context:
	:type Context: opencascade::handle<StepRepr_RepresentationContext> &
	:param CDSR:
	:type CDSR: opencascade::handle<StepShape_ContextDependentShapeRepresentation> &
	:param initPDS:
	:type initPDS: opencascade::handle<StepRepr_ProductDefinitionShape> &
	:rtype: bool
") CreateNAUOSRD;
		Standard_Boolean CreateNAUOSRD (const opencascade::handle<StepRepr_RepresentationContext> & Context,const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR,const opencascade::handle<StepRepr_ProductDefinitionShape> & initPDS);
		%feature("compactdefaultargs") DecodeColor;
		%feature("autodoc", "	* Decodes STEP color and fills the Quantity_Color. Returns True if OK or False if color is not recognized

	:param Colour:
	:type Colour: opencascade::handle<StepVisual_Colour> &
	:param Col:
	:type Col: Quantity_Color &
	:rtype: bool
") DecodeColor;
		static Standard_Boolean DecodeColor (const opencascade::handle<StepVisual_Colour> & Colour,Quantity_Color & Col);
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "	* Create STEP color entity by given Quantity_Color The analysis is performed for whether the color corresponds to one of standard colors predefined in STEP. In that case, PredefinedColour entity is created instead of RGBColour

	:param Col:
	:type Col: Quantity_Color &
	:rtype: opencascade::handle<StepVisual_Colour>
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor (const Quantity_Color & Col);
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "	* Create STEP color entity by given Quantity_Color The analysis is performed for whether the color corresponds to one of standard colors predefined in STEP. In that case, PredefinedColour entity is created instead of RGBColour

	:param Col:
	:type Col: Quantity_Color &
	:param DPDCs:
	:type DPDCs: STEPConstruct_DataMapOfAsciiStringTransient &
	:param ColRGBs:
	:type ColRGBs: STEPConstruct_DataMapOfPointTransient &
	:rtype: opencascade::handle<StepVisual_Colour>
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor (const Quantity_Color & Col,STEPConstruct_DataMapOfAsciiStringTransient & DPDCs,STEPConstruct_DataMapOfPointTransient & ColRGBs);
		%feature("compactdefaultargs") FindContext;
		%feature("autodoc", "	* Searches the STEP model for the RepresentationContext in which given shape is defined. This context (if found) can be used then in call to CreateMDGPR()

	:param Shape:
	:type Shape: TopoDS_Shape &
	:rtype: opencascade::handle<StepRepr_RepresentationContext>
") FindContext;
		opencascade::handle<StepRepr_RepresentationContext> FindContext (const TopoDS_Shape & Shape);
		%feature("compactdefaultargs") GetColorPSA;
		%feature("autodoc", "	* Returns a PresentationStyleAssignment entity which defines surface and curve colors as Col. This PSA is either created or taken from internal map where all PSAs created by this method are remembered.

	:param item:
	:type item: opencascade::handle<StepRepr_RepresentationItem> &
	:param Col:
	:type Col: opencascade::handle<StepVisual_Colour> &
	:rtype: opencascade::handle<StepVisual_PresentationStyleAssignment>
") GetColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> GetColorPSA (const opencascade::handle<StepRepr_RepresentationItem> & item,const opencascade::handle<StepVisual_Colour> & Col);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Extract color definitions from the style entity For each type of color supported, result can be either NULL if it is not defined by that style, or last definition (if they are 1 or more)

	:param style:
	:type style: opencascade::handle<StepVisual_StyledItem> &
	:param SurfCol:
	:type SurfCol: opencascade::handle<StepVisual_Colour> &
	:param BoundCol:
	:type BoundCol: opencascade::handle<StepVisual_Colour> &
	:param CurveCol:
	:type CurveCol: opencascade::handle<StepVisual_Colour> &
	:param IsComponent:
	:type IsComponent: bool
	:rtype: bool
") GetColors;
		Standard_Boolean GetColors (const opencascade::handle<StepVisual_StyledItem> & style,opencascade::handle<StepVisual_Colour> & SurfCol,opencascade::handle<StepVisual_Colour> & BoundCol,opencascade::handle<StepVisual_Colour> & CurveCol,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes tool; returns True if succeeded

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: bool
") Init;
		Standard_Boolean Init (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") LoadInvisStyles;
		%feature("autodoc", "	* Searches the STEP model for the INISIBILITY enteties (which bring styles) and fills out sequence of styles

	:param InvSyles:
	:type InvSyles: opencascade::handle<TColStd_HSequenceOfTransient> &
	:rtype: bool
") LoadInvisStyles;
		Standard_Boolean LoadInvisStyles (opencascade::handle<TColStd_HSequenceOfTransient> & InvSyles);
		%feature("compactdefaultargs") LoadStyles;
		%feature("autodoc", "	* Searches the STEP model for the MDGPR or DM entities (which bring styles) and fills sequence of styles

	:rtype: bool
") LoadStyles;
		Standard_Boolean LoadStyles ();
		%feature("compactdefaultargs") MakeColorPSA;
		%feature("autodoc", "	* Create a PresentationStyleAssignment entity which defines two colors (for filling surfaces and curves) if isForNAUO true then returns PresentationStyleByContext

	:param item:
	:type item: opencascade::handle<StepRepr_RepresentationItem> &
	:param SurfCol:
	:type SurfCol: opencascade::handle<StepVisual_Colour> &
	:param CurveCol:
	:type CurveCol: opencascade::handle<StepVisual_Colour> &
	:param isForNAUO: default value is Standard_False
	:type isForNAUO: bool
	:rtype: opencascade::handle<StepVisual_PresentationStyleAssignment>
") MakeColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> MakeColorPSA (const opencascade::handle<StepRepr_RepresentationItem> & item,const opencascade::handle<StepVisual_Colour> & SurfCol,const opencascade::handle<StepVisual_Colour> & CurveCol,const Standard_Boolean isForNAUO = Standard_False);
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "	* Returns number of defined styles

	:rtype: int
") NbStyles;
		Standard_Integer NbStyles ();
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_Styles;
		 STEPConstruct_Styles ();
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "	* Creates a tool and initializes it

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: None
") STEPConstruct_Styles;
		 STEPConstruct_Styles (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "	* Returns style with given index

	:param i:
	:type i: int
	:rtype: opencascade::handle<StepVisual_StyledItem>
") Style;
		opencascade::handle<StepVisual_StyledItem> Style (const Standard_Integer i);
};


%extend STEPConstruct_Styles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_ValidationProps;
class STEPConstruct_ValidationProps : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") AddArea;
		%feature("autodoc", "	* Adds surface area property for given shape (already mapped). Returns True if success, False in case of fail

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Area:
	:type Area: float
	:rtype: bool
") AddArea;
		Standard_Boolean AddArea (const TopoDS_Shape & Shape,const Standard_Real Area);
		%feature("compactdefaultargs") AddCentroid;
		%feature("autodoc", "	* Adds centroid property for given shape (already mapped). Returns True if success, False in case of fail If instance is True, then centroid is assigned to an instance of component in assembly

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Pnt:
	:type Pnt: gp_Pnt
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") AddCentroid;
		Standard_Boolean AddCentroid (const TopoDS_Shape & Shape,const gp_Pnt & Pnt,const Standard_Boolean instance = Standard_False);
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "	* General method for adding (writing) a validation property for shape which should be already mapped on writing itself. It uses FindTarget() to find target STEP entity resulting from given shape, and associated context Returns True if success, False in case of fail

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Prop:
	:type Prop: opencascade::handle<StepRepr_RepresentationItem> &
	:param Descr:
	:type Descr: char *
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") AddProp;
		Standard_Boolean AddProp (const TopoDS_Shape & Shape,const opencascade::handle<StepRepr_RepresentationItem> & Prop,const char * Descr,const Standard_Boolean instance = Standard_False);
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "	* General method for adding (writing) a validation property for shape which should be already mapped on writing itself. It takes target and Context entities which correspond to shape Returns True if success, False in case of fail

	:param target:
	:type target: StepRepr_CharacterizedDefinition &
	:param Context:
	:type Context: opencascade::handle<StepRepr_RepresentationContext> &
	:param Prop:
	:type Prop: opencascade::handle<StepRepr_RepresentationItem> &
	:param Descr:
	:type Descr: char *
	:rtype: bool
") AddProp;
		Standard_Boolean AddProp (const StepRepr_CharacterizedDefinition & target,const opencascade::handle<StepRepr_RepresentationContext> & Context,const opencascade::handle<StepRepr_RepresentationItem> & Prop,const char * Descr);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	* Adds volume property for given shape (already mapped). Returns True if success, False in case of fail

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Vol:
	:type Vol: float
	:rtype: bool
") AddVolume;
		Standard_Boolean AddVolume (const TopoDS_Shape & Shape,const Standard_Real Vol);
		%feature("compactdefaultargs") FindTarget;
		%feature("autodoc", "	* Finds target STEP entity to which validation props should be assigned, and corresponding context, starting from shape Returns True if success, False in case of fail

	:param S:
	:type S: TopoDS_Shape &
	:param target:
	:type target: StepRepr_CharacterizedDefinition &
	:param Context:
	:type Context: opencascade::handle<StepRepr_RepresentationContext> &
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") FindTarget;
		Standard_Boolean FindTarget (const TopoDS_Shape & S,StepRepr_CharacterizedDefinition & target,opencascade::handle<StepRepr_RepresentationContext> & Context,const Standard_Boolean instance = Standard_False);
		%feature("compactdefaultargs") GetPropNAUO;
		%feature("autodoc", "	* Returns CDSR associated with given PpD or NULL if not found (when, try GetPropSDR)

	:param PD:
	:type PD: opencascade::handle<StepRepr_PropertyDefinition> &
	:rtype: opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") GetPropNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetPropNAUO (const opencascade::handle<StepRepr_PropertyDefinition> & PD);
		%feature("compactdefaultargs") GetPropPD;
		%feature("autodoc", "	* Returns SDR associated with given PpD or NULL if not found (when, try GetPropCDSR)

	:param PD:
	:type PD: opencascade::handle<StepRepr_PropertyDefinition> &
	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") GetPropPD;
		opencascade::handle<StepBasic_ProductDefinition> GetPropPD (const opencascade::handle<StepRepr_PropertyDefinition> & PD);
		%feature("compactdefaultargs") GetPropPnt;
		%feature("autodoc", "	* Returns value of Centriod property (or False if it is not)

	:param item:
	:type item: opencascade::handle<StepRepr_RepresentationItem> &
	:param Context:
	:type Context: opencascade::handle<StepRepr_RepresentationContext> &
	:param Pnt:
	:type Pnt: gp_Pnt
	:rtype: bool
") GetPropPnt;
		Standard_Boolean GetPropPnt (const opencascade::handle<StepRepr_RepresentationItem> & item,const opencascade::handle<StepRepr_RepresentationContext> & Context,gp_Pnt & Pnt);
		%feature("compactdefaultargs") GetPropReal;
		%feature("autodoc", "	* Returns value of Real-Valued property (Area or Volume) If Property is neither Area nor Volume, returns False Else returns True and isArea indicates whether property is area or volume

	:param item:
	:type item: opencascade::handle<StepRepr_RepresentationItem> &
	:param Val:
	:type Val: float &
	:param isArea:
	:type isArea: bool
	:rtype: bool
") GetPropReal;
		Standard_Boolean GetPropReal (const opencascade::handle<StepRepr_RepresentationItem> & item,Standard_Real &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "	* Returns Shape associated with given SDR or Null Shape if not found

	:param ProdDef:
	:type ProdDef: opencascade::handle<StepBasic_ProductDefinition> &
	:rtype: TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape (const opencascade::handle<StepBasic_ProductDefinition> & ProdDef);
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "	* Returns Shape associated with given PpD or Null Shape if not found

	:param PD:
	:type PD: opencascade::handle<StepRepr_PropertyDefinition> &
	:rtype: TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape (const opencascade::handle<StepRepr_PropertyDefinition> & PD);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Load worksession; returns True if succeeded

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: bool
") Init;
		Standard_Boolean Init (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") LoadProps;
		%feature("autodoc", "	* Searches for entities of the type PropertyDefinitionRepresentation in the model and fills the sequence by them

	:param seq:
	:type seq: TColStd_SequenceOfTransient &
	:rtype: bool
") LoadProps;
		Standard_Boolean LoadProps (TColStd_SequenceOfTransient & seq);
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps ();
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "	* Creates a tool and loads it with worksession

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") SetAssemblyShape;
		%feature("autodoc", "	* Sets current assembly shape SDR (for FindCDSR calls)

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") SetAssemblyShape;
		void SetAssemblyShape (const TopoDS_Shape & shape);
};


%extend STEPConstruct_ValidationProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
