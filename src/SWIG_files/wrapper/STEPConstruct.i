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
%module (package="OCC") STEPConstruct

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


%include STEPConstruct_headers.i


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

%rename(stepconstruct) STEPConstruct;
class STEPConstruct {
	public:
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "	* Returns STEP entity of the (sub)type of RepresentationItem which is a result of the tranalation of the Shape, or Null if no result is recorded

	:param FinderProcess:
	:type FinderProcess: Handle_Transfer_FinderProcess &
	:param Shape:
	:type Shape: TopoDS_Shape &
	:rtype: Handle_StepRepr_RepresentationItem
") FindEntity;
		static Handle_StepRepr_RepresentationItem FindEntity (const Handle_Transfer_FinderProcess & FinderProcess,const TopoDS_Shape & Shape);
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "	* The same as above, but in the case if item not found, repeats search on the same shape without location. The Loc corresponds to the location with which result is found (either location of the Shape, or Null)

	:param FinderProcess:
	:type FinderProcess: Handle_Transfer_FinderProcess &
	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Loc:
	:type Loc: TopLoc_Location &
	:rtype: Handle_StepRepr_RepresentationItem
") FindEntity;
		static Handle_StepRepr_RepresentationItem FindEntity (const Handle_Transfer_FinderProcess & FinderProcess,const TopoDS_Shape & Shape,TopLoc_Location & Loc);
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "	* Returns Shape resulting from given STEP entity (Null if not mapped)

	:param TransientProcess:
	:type TransientProcess: Handle_Transfer_TransientProcess &
	:param item:
	:type item: Handle_StepRepr_RepresentationItem &
	:rtype: TopoDS_Shape
") FindShape;
		static TopoDS_Shape FindShape (const Handle_Transfer_TransientProcess & TransientProcess,const Handle_StepRepr_RepresentationItem & item);
		%feature("compactdefaultargs") FindCDSR;
		%feature("autodoc", "	* Find CDSR correcponding to the component in the specified assembly

	:param ComponentBinder:
	:type ComponentBinder: Handle_Transfer_Binder &
	:param AssemblySDR:
	:type AssemblySDR: Handle_StepShape_ShapeDefinitionRepresentation &
	:param ComponentCDSR:
	:type ComponentCDSR: Handle_StepShape_ContextDependentShapeRepresentation &
	:rtype: bool
") FindCDSR;
		static Standard_Boolean FindCDSR (const Handle_Transfer_Binder & ComponentBinder,const Handle_StepShape_ShapeDefinitionRepresentation & AssemblySDR,Handle_StepShape_ContextDependentShapeRepresentation & ComponentCDSR);
};


%extend STEPConstruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_AP203Context;
class STEPConstruct_AP203Context {
	public:
		%feature("compactdefaultargs") STEPConstruct_AP203Context;
		%feature("autodoc", "	* Creates tool and fills constant fields

	:rtype: None
") STEPConstruct_AP203Context;
		 STEPConstruct_AP203Context ();
		%feature("compactdefaultargs") DefaultApproval;
		%feature("autodoc", "	* Returns default approval entity which is used when no other data are available

	:rtype: Handle_StepBasic_Approval
") DefaultApproval;
		Handle_StepBasic_Approval DefaultApproval ();
		%feature("compactdefaultargs") SetDefaultApproval;
		%feature("autodoc", "	* Sets default approval

	:param app:
	:type app: Handle_StepBasic_Approval &
	:rtype: None
") SetDefaultApproval;
		void SetDefaultApproval (const Handle_StepBasic_Approval & app);
		%feature("compactdefaultargs") DefaultDateAndTime;
		%feature("autodoc", "	* Returns default date_and_time entity which is used when no other data are available

	:rtype: Handle_StepBasic_DateAndTime
") DefaultDateAndTime;
		Handle_StepBasic_DateAndTime DefaultDateAndTime ();
		%feature("compactdefaultargs") SetDefaultDateAndTime;
		%feature("autodoc", "	* Sets default date_and_time entity

	:param dt:
	:type dt: Handle_StepBasic_DateAndTime &
	:rtype: None
") SetDefaultDateAndTime;
		void SetDefaultDateAndTime (const Handle_StepBasic_DateAndTime & dt);
		%feature("compactdefaultargs") DefaultPersonAndOrganization;
		%feature("autodoc", "	* Returns default person_and_organization entity which is used when no other data are available

	:rtype: Handle_StepBasic_PersonAndOrganization
") DefaultPersonAndOrganization;
		Handle_StepBasic_PersonAndOrganization DefaultPersonAndOrganization ();
		%feature("compactdefaultargs") SetDefaultPersonAndOrganization;
		%feature("autodoc", "	* Sets default person_and_organization entity

	:param po:
	:type po: Handle_StepBasic_PersonAndOrganization &
	:rtype: None
") SetDefaultPersonAndOrganization;
		void SetDefaultPersonAndOrganization (const Handle_StepBasic_PersonAndOrganization & po);
		%feature("compactdefaultargs") DefaultSecurityClassificationLevel;
		%feature("autodoc", "	* Returns default security_classification_level entity which is used when no other data are available

	:rtype: Handle_StepBasic_SecurityClassificationLevel
") DefaultSecurityClassificationLevel;
		Handle_StepBasic_SecurityClassificationLevel DefaultSecurityClassificationLevel ();
		%feature("compactdefaultargs") SetDefaultSecurityClassificationLevel;
		%feature("autodoc", "	* Sets default security_classification_level

	:param sc:
	:type sc: Handle_StepBasic_SecurityClassificationLevel &
	:rtype: None
") SetDefaultSecurityClassificationLevel;
		void SetDefaultSecurityClassificationLevel (const Handle_StepBasic_SecurityClassificationLevel & sc);
		%feature("compactdefaultargs") RoleCreator;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PersonAndOrganizationRole
") RoleCreator;
		Handle_StepBasic_PersonAndOrganizationRole RoleCreator ();
		%feature("compactdefaultargs") RoleDesignOwner;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PersonAndOrganizationRole
") RoleDesignOwner;
		Handle_StepBasic_PersonAndOrganizationRole RoleDesignOwner ();
		%feature("compactdefaultargs") RoleDesignSupplier;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PersonAndOrganizationRole
") RoleDesignSupplier;
		Handle_StepBasic_PersonAndOrganizationRole RoleDesignSupplier ();
		%feature("compactdefaultargs") RoleClassificationOfficer;
		%feature("autodoc", "	:rtype: Handle_StepBasic_PersonAndOrganizationRole
") RoleClassificationOfficer;
		Handle_StepBasic_PersonAndOrganizationRole RoleClassificationOfficer ();
		%feature("compactdefaultargs") RoleCreationDate;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DateTimeRole
") RoleCreationDate;
		Handle_StepBasic_DateTimeRole RoleCreationDate ();
		%feature("compactdefaultargs") RoleClassificationDate;
		%feature("autodoc", "	:rtype: Handle_StepBasic_DateTimeRole
") RoleClassificationDate;
		Handle_StepBasic_DateTimeRole RoleClassificationDate ();
		%feature("compactdefaultargs") RoleApprover;
		%feature("autodoc", "	* Return predefined PersonAndOrganizationRole and DateTimeRole entities named 'creator', 'design owner', 'design supplier', 'classification officer', 'creation date', 'classification date', 'approver'

	:rtype: Handle_StepBasic_ApprovalRole
") RoleApprover;
		Handle_StepBasic_ApprovalRole RoleApprover ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Takes SDR (part) which brings all standard data around part (common for AP203 and AP214) and creates all the additional entities required for AP203

	:param sdr:
	:type sdr: Handle_StepShape_ShapeDefinitionRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_ShapeDefinitionRepresentation & sdr);
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
	:type nauo: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_NextAssemblyUsageOccurrence & nauo);
		%feature("compactdefaultargs") GetCreator;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignPersonAndOrganizationAssignment
") GetCreator;
		Handle_StepAP203_CcDesignPersonAndOrganizationAssignment GetCreator ();
		%feature("compactdefaultargs") GetDesignOwner;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignPersonAndOrganizationAssignment
") GetDesignOwner;
		Handle_StepAP203_CcDesignPersonAndOrganizationAssignment GetDesignOwner ();
		%feature("compactdefaultargs") GetDesignSupplier;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignPersonAndOrganizationAssignment
") GetDesignSupplier;
		Handle_StepAP203_CcDesignPersonAndOrganizationAssignment GetDesignSupplier ();
		%feature("compactdefaultargs") GetClassificationOfficer;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignPersonAndOrganizationAssignment
") GetClassificationOfficer;
		Handle_StepAP203_CcDesignPersonAndOrganizationAssignment GetClassificationOfficer ();
		%feature("compactdefaultargs") GetSecurity;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignSecurityClassification
") GetSecurity;
		Handle_StepAP203_CcDesignSecurityClassification GetSecurity ();
		%feature("compactdefaultargs") GetCreationDate;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignDateAndTimeAssignment
") GetCreationDate;
		Handle_StepAP203_CcDesignDateAndTimeAssignment GetCreationDate ();
		%feature("compactdefaultargs") GetClassificationDate;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignDateAndTimeAssignment
") GetClassificationDate;
		Handle_StepAP203_CcDesignDateAndTimeAssignment GetClassificationDate ();
		%feature("compactdefaultargs") GetApproval;
		%feature("autodoc", "	:rtype: Handle_StepAP203_CcDesignApproval
") GetApproval;
		Handle_StepAP203_CcDesignApproval GetApproval ();
		%feature("compactdefaultargs") GetApprover;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") GetApprover;
		Handle_StepBasic_ApprovalPersonOrganization GetApprover ();
		%feature("compactdefaultargs") GetApprovalDateTime;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApprovalDateTime
") GetApprovalDateTime;
		Handle_StepBasic_ApprovalDateTime GetApprovalDateTime ();
		%feature("compactdefaultargs") GetProductCategoryRelationship;
		%feature("autodoc", "	* Return entities (roots) instantiated for the part by method Init

	:rtype: Handle_StepBasic_ProductCategoryRelationship
") GetProductCategoryRelationship;
		Handle_StepBasic_ProductCategoryRelationship GetProductCategoryRelationship ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears all fields describing entities specific to each part

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") InitRoles;
		%feature("autodoc", "	* Initializes constant fields (shared entities)

	:rtype: None
") InitRoles;
		void InitRoles ();
		%feature("compactdefaultargs") InitAssembly;
		%feature("autodoc", "	* Initializes all missing data which are required for assembly

	:param nauo:
	:type nauo: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:rtype: None
") InitAssembly;
		void InitAssembly (const Handle_StepRepr_NextAssemblyUsageOccurrence & nauo);
		%feature("compactdefaultargs") InitSecurityRequisites;
		%feature("autodoc", "	* Initializes ClassificationOfficer and ClassificationDate entities according to Security entity

	:rtype: None
") InitSecurityRequisites;
		void InitSecurityRequisites ();
		%feature("compactdefaultargs") InitApprovalRequisites;
		%feature("autodoc", "	* Initializes Approver and ApprovalDateTime entities according to Approval entity

	:rtype: None
") InitApprovalRequisites;
		void InitApprovalRequisites ();
};


%extend STEPConstruct_AP203Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_Assembly;
class STEPConstruct_Assembly {
	public:
		%feature("compactdefaultargs") STEPConstruct_Assembly;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_Assembly;
		 STEPConstruct_Assembly ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialises with starting values Ax0 : origin axis (typically, standard XYZ) Loc : location to which place the item Makes a MappedItem Resulting Value is returned by ItemValue

	:param aSR:
	:type aSR: Handle_StepShape_ShapeDefinitionRepresentation &
	:param SDR0:
	:type SDR0: Handle_StepShape_ShapeDefinitionRepresentation &
	:param Ax0:
	:type Ax0: Handle_StepGeom_Axis2Placement3d &
	:param Loc:
	:type Loc: Handle_StepGeom_Axis2Placement3d &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_ShapeDefinitionRepresentation & aSR,const Handle_StepShape_ShapeDefinitionRepresentation & SDR0,const Handle_StepGeom_Axis2Placement3d & Ax0,const Handle_StepGeom_Axis2Placement3d & Loc);
		%feature("compactdefaultargs") MakeRelationship;
		%feature("autodoc", "	* Make a (ShapeRepresentationRelationship,...WithTransformation) Resulting Value is returned by ItemValue

	:rtype: None
") MakeRelationship;
		void MakeRelationship ();
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "	* Returns the Value If no Make... has been called, returns the starting SR

	:rtype: Handle_Standard_Transient
") ItemValue;
		Handle_Standard_Transient ItemValue ();
		%feature("compactdefaultargs") ItemLocation;
		%feature("autodoc", "	* Returns the location of the item, computed from starting aLoc

	:rtype: Handle_StepGeom_Axis2Placement3d
") ItemLocation;
		Handle_StepGeom_Axis2Placement3d ItemLocation ();
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "	* Returns NAUO object describing the assembly link

	:rtype: Handle_StepRepr_NextAssemblyUsageOccurrence
") GetNAUO;
		Handle_StepRepr_NextAssemblyUsageOccurrence GetNAUO ();
		%feature("compactdefaultargs") CheckSRRReversesNAUO;
		%feature("autodoc", "	* Checks whether SRR's definition of assembly and component contradicts with NAUO definition or not, according to model schema (AP214 or AP203)

	:param Model:
	:type Model: Handle_Interface_InterfaceModel &
	:param CDSR:
	:type CDSR: Handle_StepShape_ContextDependentShapeRepresentation &
	:rtype: bool
") CheckSRRReversesNAUO;
		static Standard_Boolean CheckSRRReversesNAUO (const Handle_Interface_InterfaceModel & Model,const Handle_StepShape_ContextDependentShapeRepresentation & CDSR);
};


%extend STEPConstruct_Assembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_ContextTool;
class STEPConstruct_ContextTool {
	public:
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool ();
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "	:param aStepModel:
	:type aStepModel: Handle_StepData_StepModel &
	:rtype: None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool (const Handle_StepData_StepModel & aStepModel);
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Initialize ApplicationProtocolDefinition by the first entity of that type found in the model

	:param aStepModel:
	:type aStepModel: Handle_StepData_StepModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_StepData_StepModel & aStepModel);
		%feature("compactdefaultargs") GetAPD;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApplicationProtocolDefinition
") GetAPD;
		Handle_StepBasic_ApplicationProtocolDefinition GetAPD ();
		%feature("compactdefaultargs") AddAPD;
		%feature("autodoc", "	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: None
") AddAPD;
		void AddAPD (const Standard_Boolean enforce = Standard_False);
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
		%feature("compactdefaultargs") GetACstatus;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetACstatus;
		Handle_TCollection_HAsciiString GetACstatus ();
		%feature("compactdefaultargs") GetACschemaName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetACschemaName;
		Handle_TCollection_HAsciiString GetACschemaName ();
		%feature("compactdefaultargs") GetACyear;
		%feature("autodoc", "	:rtype: int
") GetACyear;
		Standard_Integer GetACyear ();
		%feature("compactdefaultargs") GetACname;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetACname;
		Handle_TCollection_HAsciiString GetACname ();
		%feature("compactdefaultargs") SetACstatus;
		%feature("autodoc", "	:param status:
	:type status: Handle_TCollection_HAsciiString &
	:rtype: None
") SetACstatus;
		void SetACstatus (const Handle_TCollection_HAsciiString & status);
		%feature("compactdefaultargs") SetACschemaName;
		%feature("autodoc", "	:param schemaName:
	:type schemaName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetACschemaName;
		void SetACschemaName (const Handle_TCollection_HAsciiString & schemaName);
		%feature("compactdefaultargs") SetACyear;
		%feature("autodoc", "	:param year:
	:type year: int
	:rtype: None
") SetACyear;
		void SetACyear (const Standard_Integer year);
		%feature("compactdefaultargs") SetACname;
		%feature("autodoc", "	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetACname;
		void SetACname (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") GetDefaultAxis;
		%feature("autodoc", "	* Returns a default axis placement

	:rtype: Handle_StepGeom_Axis2Placement3d
") GetDefaultAxis;
		Handle_StepGeom_Axis2Placement3d GetDefaultAxis ();
		%feature("compactdefaultargs") AP203Context;
		%feature("autodoc", "	* Returns tool which maintains context specific for AP203

	:rtype: STEPConstruct_AP203Context
") AP203Context;
		STEPConstruct_AP203Context & AP203Context ();
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "	* Returns current assembly level

	:rtype: int
") Level;
		Standard_Integer Level ();
		%feature("compactdefaultargs") NextLevel;
		%feature("autodoc", "	:rtype: None
") NextLevel;
		void NextLevel ();
		%feature("compactdefaultargs") PrevLevel;
		%feature("autodoc", "	:rtype: None
") PrevLevel;
		void PrevLevel ();
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "	* Changes current assembly level

	:param lev:
	:type lev: int
	:rtype: None
") SetLevel;
		void SetLevel (const Standard_Integer lev);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns current index of assembly component on current level

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") NextIndex;
		%feature("autodoc", "	:rtype: None
") NextIndex;
		void NextIndex ();
		%feature("compactdefaultargs") PrevIndex;
		%feature("autodoc", "	:rtype: None
") PrevIndex;
		void PrevIndex ();
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Changes current index of assembly component on current level

	:param ind:
	:type ind: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer ind);
		%feature("compactdefaultargs") GetProductName;
		%feature("autodoc", "	* Generates a product name basing on write.step.product.name parameter and current position in the assembly structure

	:rtype: Handle_TCollection_HAsciiString
") GetProductName;
		Handle_TCollection_HAsciiString GetProductName ();
		%feature("compactdefaultargs") GetRootsForPart;
		%feature("autodoc", "	* Produces and returns a full list of root entities required for part identified by SDRTool (including SDR itself)

	:param SDRTool:
	:type SDRTool: STEPConstruct_Part &
	:rtype: Handle_TColStd_HSequenceOfTransient
") GetRootsForPart;
		Handle_TColStd_HSequenceOfTransient GetRootsForPart (const STEPConstruct_Part & SDRTool);
		%feature("compactdefaultargs") GetRootsForAssemblyLink;
		%feature("autodoc", "	* Produces and returns a full list of root entities required for assembly link identified by assembly (including NAUO and CDSR)

	:param assembly:
	:type assembly: STEPConstruct_Assembly &
	:rtype: Handle_TColStd_HSequenceOfTransient
") GetRootsForAssemblyLink;
		Handle_TColStd_HSequenceOfTransient GetRootsForAssemblyLink (const STEPConstruct_Assembly & assembly);
};


%extend STEPConstruct_ContextTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
class STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
		 STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient ();
		%feature("compactdefaultargs") STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
		%feature("autodoc", "	:param aMap:
	:type aMap: STEPConstruct_DataMapOfAsciiStringTransient &
	:rtype: None
") STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
		 STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient (const STEPConstruct_DataMapOfAsciiStringTransient & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: STEPConstruct_DataMapOfAsciiStringTransient &
	:rtype: None
") Initialize;
		void Initialize (const STEPConstruct_DataMapOfAsciiStringTransient & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
class STEPConstruct_DataMapIteratorOfDataMapOfPointTransient : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
		 STEPConstruct_DataMapIteratorOfDataMapOfPointTransient ();
		%feature("compactdefaultargs") STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
		%feature("autodoc", "	:param aMap:
	:type aMap: STEPConstruct_DataMapOfPointTransient &
	:rtype: None
") STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
		 STEPConstruct_DataMapIteratorOfDataMapOfPointTransient (const STEPConstruct_DataMapOfPointTransient & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: STEPConstruct_DataMapOfPointTransient &
	:rtype: None
") Initialize;
		void Initialize (const STEPConstruct_DataMapOfPointTransient & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: gp_Pnt
") Key;
		const gp_Pnt  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend STEPConstruct_DataMapIteratorOfDataMapOfPointTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient;
class STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient;
		 STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient (const TCollection_AsciiString & K,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient::Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient;
class Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient();
        Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient(const Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient &aHandle);
        Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient(const STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient {
    STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient* _get_reference() {
    return (STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient*)$self->Access();
    }
};

%extend Handle_STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPConstruct_DataMapNodeOfDataMapOfAsciiStringTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_DataMapNodeOfDataMapOfPointTransient;
class STEPConstruct_DataMapNodeOfDataMapOfPointTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") STEPConstruct_DataMapNodeOfDataMapOfPointTransient;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:param I:
	:type I: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") STEPConstruct_DataMapNodeOfDataMapOfPointTransient;
		 STEPConstruct_DataMapNodeOfDataMapOfPointTransient (const gp_Pnt & K,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: gp_Pnt
") Key;
		gp_Pnt  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend STEPConstruct_DataMapNodeOfDataMapOfPointTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient::Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient;
class Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient();
        Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient(const Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient &aHandle);
        Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient(const STEPConstruct_DataMapNodeOfDataMapOfPointTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient {
    STEPConstruct_DataMapNodeOfDataMapOfPointTransient* _get_reference() {
    return (STEPConstruct_DataMapNodeOfDataMapOfPointTransient*)$self->Access();
    }
};

%extend Handle_STEPConstruct_DataMapNodeOfDataMapOfPointTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPConstruct_DataMapNodeOfDataMapOfPointTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_DataMapOfAsciiStringTransient;
class STEPConstruct_DataMapOfAsciiStringTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") STEPConstruct_DataMapOfAsciiStringTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") STEPConstruct_DataMapOfAsciiStringTransient;
		 STEPConstruct_DataMapOfAsciiStringTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: STEPConstruct_DataMapOfAsciiStringTransient &
	:rtype: STEPConstruct_DataMapOfAsciiStringTransient
") Assign;
		STEPConstruct_DataMapOfAsciiStringTransient & Assign (const STEPConstruct_DataMapOfAsciiStringTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: STEPConstruct_DataMapOfAsciiStringTransient &
	:rtype: STEPConstruct_DataMapOfAsciiStringTransient
") operator =;
		STEPConstruct_DataMapOfAsciiStringTransient & operator = (const STEPConstruct_DataMapOfAsciiStringTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_Standard_Transient
") Find;
		Handle_Standard_Transient Find (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_Standard_Transient
") ChangeFind;
		Handle_Standard_Transient ChangeFind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%extend STEPConstruct_DataMapOfAsciiStringTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_DataMapOfPointTransient;
class STEPConstruct_DataMapOfPointTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") STEPConstruct_DataMapOfPointTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") STEPConstruct_DataMapOfPointTransient;
		 STEPConstruct_DataMapOfPointTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: STEPConstruct_DataMapOfPointTransient &
	:rtype: STEPConstruct_DataMapOfPointTransient
") Assign;
		STEPConstruct_DataMapOfPointTransient & Assign (const STEPConstruct_DataMapOfPointTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: STEPConstruct_DataMapOfPointTransient &
	:rtype: STEPConstruct_DataMapOfPointTransient
") operator =;
		STEPConstruct_DataMapOfPointTransient & operator = (const STEPConstruct_DataMapOfPointTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const gp_Pnt & K,const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const gp_Pnt & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const gp_Pnt & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:rtype: Handle_Standard_Transient
") Find;
		Handle_Standard_Transient Find (const gp_Pnt & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:rtype: Handle_Standard_Transient
") ChangeFind;
		Handle_Standard_Transient ChangeFind (const gp_Pnt & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const gp_Pnt & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: gp_Pnt
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const gp_Pnt & K);
};


%extend STEPConstruct_DataMapOfPointTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_Part;
class STEPConstruct_Part {
	public:
		%feature("compactdefaultargs") STEPConstruct_Part;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_Part;
		 STEPConstruct_Part ();
		%feature("compactdefaultargs") MakeSDR;
		%feature("autodoc", "	:param aShape:
	:type aShape: Handle_StepShape_ShapeRepresentation &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param AC:
	:type AC: Handle_StepBasic_ApplicationContext &
	:rtype: None
") MakeSDR;
		void MakeSDR (const Handle_StepShape_ShapeRepresentation & aShape,const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_ApplicationContext & AC);
		%feature("compactdefaultargs") ReadSDR;
		%feature("autodoc", "	:param aShape:
	:type aShape: Handle_StepShape_ShapeDefinitionRepresentation &
	:rtype: None
") ReadSDR;
		void ReadSDR (const Handle_StepShape_ShapeDefinitionRepresentation & aShape);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SDRValue;
		%feature("autodoc", "	* Returns SDR or Null if not done

	:rtype: Handle_StepShape_ShapeDefinitionRepresentation
") SDRValue;
		Handle_StepShape_ShapeDefinitionRepresentation SDRValue ();
		%feature("compactdefaultargs") SRValue;
		%feature("autodoc", "	* Returns SDR->UsedRepresentation() or Null if not done

	:rtype: Handle_StepShape_ShapeRepresentation
") SRValue;
		Handle_StepShape_ShapeRepresentation SRValue ();
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductContext
") PC;
		Handle_StepBasic_ProductContext PC ();
		%feature("compactdefaultargs") PCname;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PCname;
		Handle_TCollection_HAsciiString PCname ();
		%feature("compactdefaultargs") PCdisciplineType;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PCdisciplineType;
		Handle_TCollection_HAsciiString PCdisciplineType ();
		%feature("compactdefaultargs") SetPCname;
		%feature("autodoc", "	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPCname;
		void SetPCname (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") SetPCdisciplineType;
		%feature("autodoc", "	:param label:
	:type label: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPCdisciplineType;
		void SetPCdisciplineType (const Handle_TCollection_HAsciiString & label);
		%feature("compactdefaultargs") AC;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ApplicationContext
") AC;
		Handle_StepBasic_ApplicationContext AC ();
		%feature("compactdefaultargs") ACapplication;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ACapplication;
		Handle_TCollection_HAsciiString ACapplication ();
		%feature("compactdefaultargs") SetACapplication;
		%feature("autodoc", "	:param text:
	:type text: Handle_TCollection_HAsciiString &
	:rtype: None
") SetACapplication;
		void SetACapplication (const Handle_TCollection_HAsciiString & text);
		%feature("compactdefaultargs") PDC;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionContext
") PDC;
		Handle_StepBasic_ProductDefinitionContext PDC ();
		%feature("compactdefaultargs") PDCname;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PDCname;
		Handle_TCollection_HAsciiString PDCname ();
		%feature("compactdefaultargs") PDCstage;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PDCstage;
		Handle_TCollection_HAsciiString PDCstage ();
		%feature("compactdefaultargs") SetPDCname;
		%feature("autodoc", "	:param label:
	:type label: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPDCname;
		void SetPDCname (const Handle_TCollection_HAsciiString & label);
		%feature("compactdefaultargs") SetPDCstage;
		%feature("autodoc", "	:param label:
	:type label: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPDCstage;
		void SetPDCstage (const Handle_TCollection_HAsciiString & label);
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	:rtype: Handle_StepBasic_Product
") Product;
		Handle_StepBasic_Product Product ();
		%feature("compactdefaultargs") Pid;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Pid;
		Handle_TCollection_HAsciiString Pid ();
		%feature("compactdefaultargs") Pname;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Pname;
		Handle_TCollection_HAsciiString Pname ();
		%feature("compactdefaultargs") Pdescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Pdescription;
		Handle_TCollection_HAsciiString Pdescription ();
		%feature("compactdefaultargs") SetPid;
		%feature("autodoc", "	:param id:
	:type id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPid;
		void SetPid (const Handle_TCollection_HAsciiString & id);
		%feature("compactdefaultargs") SetPname;
		%feature("autodoc", "	:param label:
	:type label: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPname;
		void SetPname (const Handle_TCollection_HAsciiString & label);
		%feature("compactdefaultargs") SetPdescription;
		%feature("autodoc", "	:param text:
	:type text: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPdescription;
		void SetPdescription (const Handle_TCollection_HAsciiString & text);
		%feature("compactdefaultargs") PDF;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinitionFormation
") PDF;
		Handle_StepBasic_ProductDefinitionFormation PDF ();
		%feature("compactdefaultargs") PDFid;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PDFid;
		Handle_TCollection_HAsciiString PDFid ();
		%feature("compactdefaultargs") PDFdescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PDFdescription;
		Handle_TCollection_HAsciiString PDFdescription ();
		%feature("compactdefaultargs") SetPDFid;
		%feature("autodoc", "	:param id:
	:type id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPDFid;
		void SetPDFid (const Handle_TCollection_HAsciiString & id);
		%feature("compactdefaultargs") SetPDFdescription;
		%feature("autodoc", "	:param text:
	:type text: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPDFdescription;
		void SetPDFdescription (const Handle_TCollection_HAsciiString & text);
		%feature("compactdefaultargs") PD;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductDefinition
") PD;
		Handle_StepBasic_ProductDefinition PD ();
		%feature("compactdefaultargs") PDdescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PDdescription;
		Handle_TCollection_HAsciiString PDdescription ();
		%feature("compactdefaultargs") SetPDdescription;
		%feature("autodoc", "	:param text:
	:type text: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPDdescription;
		void SetPDdescription (const Handle_TCollection_HAsciiString & text);
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ProductDefinitionShape
") PDS;
		Handle_StepRepr_ProductDefinitionShape PDS ();
		%feature("compactdefaultargs") PDSname;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PDSname;
		Handle_TCollection_HAsciiString PDSname ();
		%feature("compactdefaultargs") PDSdescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PDSdescription;
		Handle_TCollection_HAsciiString PDSdescription ();
		%feature("compactdefaultargs") SetPDSname;
		%feature("autodoc", "	:param label:
	:type label: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPDSname;
		void SetPDSname (const Handle_TCollection_HAsciiString & label);
		%feature("compactdefaultargs") SetPDSdescription;
		%feature("autodoc", "	:param text:
	:type text: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPDSdescription;
		void SetPDSdescription (const Handle_TCollection_HAsciiString & text);
		%feature("compactdefaultargs") PRPC;
		%feature("autodoc", "	:rtype: Handle_StepBasic_ProductRelatedProductCategory
") PRPC;
		Handle_StepBasic_ProductRelatedProductCategory PRPC ();
		%feature("compactdefaultargs") PRPCname;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PRPCname;
		Handle_TCollection_HAsciiString PRPCname ();
		%feature("compactdefaultargs") PRPCdescription;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") PRPCdescription;
		Handle_TCollection_HAsciiString PRPCdescription ();
		%feature("compactdefaultargs") SetPRPCname;
		%feature("autodoc", "	:param label:
	:type label: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPRPCname;
		void SetPRPCname (const Handle_TCollection_HAsciiString & label);
		%feature("compactdefaultargs") SetPRPCdescription;
		%feature("autodoc", "	:param text:
	:type text: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPRPCdescription;
		void SetPRPCdescription (const Handle_TCollection_HAsciiString & text);
};


%extend STEPConstruct_Part {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class STEPConstruct_PointHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param Point:
	:type Point: gp_Pnt
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const gp_Pnt & Point,const Standard_Integer Upper);
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
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_Tool;
		 STEPConstruct_Tool ();
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "	* Creates a tool and loads it with worksession

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: None
") STEPConstruct_Tool;
		 STEPConstruct_Tool (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "	* Returns currently loaded WorkSession

	:rtype: Handle_XSControl_WorkSession
") WS;
		Handle_XSControl_WorkSession WS ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns current model (Null if not loaded)

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	* Returns current graph (recomputing if necessary)

	:param recompute: default value is Standard_False
	:type recompute: bool
	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph (const Standard_Boolean recompute = Standard_False);
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	* Returns TransientProcess (reading; Null if not loaded)

	:rtype: Handle_Transfer_TransientProcess
") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "	* Returns FinderProcess (writing; Null if not loaded)

	:rtype: Handle_Transfer_FinderProcess
") FinderProcess;
		Handle_Transfer_FinderProcess FinderProcess ();
};


%extend STEPConstruct_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_UnitContext;
class STEPConstruct_UnitContext {
	public:
		%feature("compactdefaultargs") STEPConstruct_UnitContext;
		%feature("autodoc", "	* Creates empty tool

	:rtype: None
") STEPConstruct_UnitContext;
		 STEPConstruct_UnitContext ();
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns context (or Null if not done)

	:rtype: Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx
") Value;
		Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx Value ();
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "	* Computes the length, plane angle and solid angle conversion factor . Returns a status, 0 if OK

	:param aContext:
	:type aContext: Handle_StepRepr_GlobalUnitAssignedContext &
	:rtype: int
") ComputeFactors;
		Standard_Integer ComputeFactors (const Handle_StepRepr_GlobalUnitAssignedContext & aContext);
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: Handle_StepBasic_NamedUnit &
	:rtype: int
") ComputeFactors;
		Standard_Integer ComputeFactors (const Handle_StepBasic_NamedUnit & aUnit);
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "	* Computes the uncertainty value (for length)

	:param aContext:
	:type aContext: Handle_StepRepr_GlobalUncertaintyAssignedContext &
	:rtype: int
") ComputeTolerance;
		Standard_Integer ComputeTolerance (const Handle_StepRepr_GlobalUncertaintyAssignedContext & aContext);
		%feature("compactdefaultargs") LengthFactor;
		%feature("autodoc", "	* Returns the lengthFactor

	:rtype: float
") LengthFactor;
		Standard_Real LengthFactor ();
		%feature("compactdefaultargs") PlaneAngleFactor;
		%feature("autodoc", "	* Returns the planeAngleFactor

	:rtype: float
") PlaneAngleFactor;
		Standard_Real PlaneAngleFactor ();
		%feature("compactdefaultargs") SolidAngleFactor;
		%feature("autodoc", "	* Returns the solidAngleFactor

	:rtype: float
") SolidAngleFactor;
		Standard_Real SolidAngleFactor ();
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "	* Returns the Uncertainty value (for length) It has been converted with LengthFactor

	:rtype: float
") Uncertainty;
		Standard_Real Uncertainty ();
		%feature("compactdefaultargs") AreaFactor;
		%feature("autodoc", "	* Returns the areaFactor

	:rtype: float
") AreaFactor;
		Standard_Real AreaFactor ();
		%feature("compactdefaultargs") VolumeFactor;
		%feature("autodoc", "	* Returns the volumeFactor

	:rtype: float
") VolumeFactor;
		Standard_Real VolumeFactor ();
		%feature("compactdefaultargs") HasUncertainty;
		%feature("autodoc", "	* Tells if a Uncertainty (for length) is recorded

	:rtype: bool
") HasUncertainty;
		Standard_Boolean HasUncertainty ();
		%feature("compactdefaultargs") LengthDone;
		%feature("autodoc", "	* Returns true if ComputeFactors has calculated a LengthFactor

	:rtype: bool
") LengthDone;
		Standard_Boolean LengthDone ();
		%feature("compactdefaultargs") PlaneAngleDone;
		%feature("autodoc", "	* Returns true if ComputeFactors has calculated a PlaneAngleFactor

	:rtype: bool
") PlaneAngleDone;
		Standard_Boolean PlaneAngleDone ();
		%feature("compactdefaultargs") SolidAngleDone;
		%feature("autodoc", "	* Returns true if ComputeFactors has calculated a SolidAngleFactor

	:rtype: bool
") SolidAngleDone;
		Standard_Boolean SolidAngleDone ();
		%feature("compactdefaultargs") AreaDone;
		%feature("autodoc", "	* Returns true if areaFactor is computed

	:rtype: bool
") AreaDone;
		Standard_Boolean AreaDone ();
		%feature("compactdefaultargs") VolumeDone;
		%feature("autodoc", "	* Returns true if volumeFactor is computed

	:rtype: bool
") VolumeDone;
		Standard_Boolean VolumeDone ();
		%feature("compactdefaultargs") StatusMessage;
		%feature("autodoc", "	* Returns a message for a given status (0 - empty) This message can then be added as warning for transfer

	:param status:
	:type status: int
	:rtype: char *
") StatusMessage;
		const char * StatusMessage (const Standard_Integer status);
		%feature("compactdefaultargs") ConvertSiPrefix;
		%feature("autodoc", "	* Convert SI prefix defined by enumertaion to corresponding real factor (e.g. 1e6 for mega)

	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:rtype: float
") ConvertSiPrefix;
		static Standard_Real ConvertSiPrefix (const StepBasic_SiPrefix aPrefix);
};


%extend STEPConstruct_UnitContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_ExternRefs;
class STEPConstruct_ExternRefs : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs ();
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "	* Creates a tool and initializes it

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes tool; returns True if succeeded

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears internal fields (list of defined extern refs)

	:rtype: None
") Clear;
		void Clear ();
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
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns filename for numth extern reference Returns Null if FileName is not defined or bad

	:param num:
	:type num: int
	:rtype: char *
") FileName;
		const char * FileName (const Standard_Integer num);
		%feature("compactdefaultargs") ProdDef;
		%feature("autodoc", "	* Returns ProductDefinition to which numth extern reference is associated. Returns Null if cannot be detected or if extern reference is not associated to SDR in a proper way.

	:param num:
	:type num: int
	:rtype: Handle_StepBasic_ProductDefinition
") ProdDef;
		Handle_StepBasic_ProductDefinition ProdDef (const Standard_Integer num);
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "	* Returns format identification string for the extern document Returns Null handle if format is not defined

	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") Format;
		Handle_TCollection_HAsciiString Format (const Standard_Integer num);
		%feature("compactdefaultargs") AddExternRef;
		%feature("autodoc", "	* Create a new external reference with specified attributes attached to a given SDR <format> can be Null string, in that case this information is not written. Else, it can be 'STEP AP214' or 'STEP AP203' Returns index of a new extern ref

	:param filename:
	:type filename: char *
	:param PD:
	:type PD: Handle_StepBasic_ProductDefinition &
	:param format:
	:type format: char *
	:rtype: int
") AddExternRef;
		Standard_Integer AddExternRef (const char * filename,const Handle_StepBasic_ProductDefinition & PD,const char * format);
		%feature("compactdefaultargs") checkAP214Shared;
		%feature("autodoc", "	* Check (create if it is null) all shared entities for the model

	:rtype: None
") checkAP214Shared;
		void checkAP214Shared ();
		%feature("compactdefaultargs") WriteExternRefs;
		%feature("autodoc", "	* Adds all the currently defined external refs to the model Returns number of written extern refs

	:param num:
	:type num: int
	:rtype: int
") WriteExternRefs;
		Standard_Integer WriteExternRefs (const Standard_Integer num);
		%feature("compactdefaultargs") SetAP214APD;
		%feature("autodoc", "	* Set the ApplicationProtocolDefinition of the PDM schema

	:param APD:
	:type APD: Handle_StepBasic_ApplicationProtocolDefinition &
	:rtype: None
") SetAP214APD;
		void SetAP214APD (const Handle_StepBasic_ApplicationProtocolDefinition & APD);
		%feature("compactdefaultargs") GetAP214APD;
		%feature("autodoc", "	* Returns the ApplicationProtocolDefinition of the PDM schema NOTE: if not defined then create new APD with new Application Context

	:rtype: Handle_StepBasic_ApplicationProtocolDefinition
") GetAP214APD;
		Handle_StepBasic_ApplicationProtocolDefinition GetAP214APD ();
};


%extend STEPConstruct_ExternRefs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_Styles;
class STEPConstruct_Styles : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_Styles;
		 STEPConstruct_Styles ();
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "	* Creates a tool and initializes it

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: None
") STEPConstruct_Styles;
		 STEPConstruct_Styles (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes tool; returns True if succeeded

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "	* Returns number of defined styles

	:rtype: int
") NbStyles;
		Standard_Integer NbStyles ();
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "	* Returns style with given index

	:param i:
	:type i: int
	:rtype: Handle_StepVisual_StyledItem
") Style;
		Handle_StepVisual_StyledItem Style (const Standard_Integer i);
		%feature("compactdefaultargs") ClearStyles;
		%feature("autodoc", "	* Clears all defined styles and PSA sequence

	:rtype: None
") ClearStyles;
		void ClearStyles ();
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "	* Adds a style to a sequence

	:param style:
	:type style: Handle_StepVisual_StyledItem &
	:rtype: None
") AddStyle;
		void AddStyle (const Handle_StepVisual_StyledItem & style);
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "	* Create a style linking giving PSA to the item, and add it to the sequence of stored styles. If Override is not Null, then the resulting style will be of the subtype OverridingStyledItem.

	:param item:
	:type item: Handle_StepRepr_RepresentationItem &
	:param PSA:
	:type PSA: Handle_StepVisual_PresentationStyleAssignment &
	:param Override:
	:type Override: Handle_StepVisual_StyledItem &
	:rtype: Handle_StepVisual_StyledItem
") AddStyle;
		Handle_StepVisual_StyledItem AddStyle (const Handle_StepRepr_RepresentationItem & item,const Handle_StepVisual_PresentationStyleAssignment & PSA,const Handle_StepVisual_StyledItem & Override);
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "	* Create a style linking giving PSA to the Shape, and add it to the sequence of stored styles. If Override is not Null, then the resulting style will be of the subtype OverridingStyledItem. The Sape is used to find corresponding STEP entity by call to STEPConstruct::FindEntity(), then previous method is called.

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param PSA:
	:type PSA: Handle_StepVisual_PresentationStyleAssignment &
	:param Override:
	:type Override: Handle_StepVisual_StyledItem &
	:rtype: Handle_StepVisual_StyledItem
") AddStyle;
		Handle_StepVisual_StyledItem AddStyle (const TopoDS_Shape & Shape,const Handle_StepVisual_PresentationStyleAssignment & PSA,const Handle_StepVisual_StyledItem & Override);
		%feature("compactdefaultargs") CreateMDGPR;
		%feature("autodoc", "	* Create MDGPR, fill it with all the styles previously defined, and add it to the model

	:param Context:
	:type Context: Handle_StepRepr_RepresentationContext &
	:param MDGPR:
	:type MDGPR: Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation &
	:rtype: bool
") CreateMDGPR;
		Standard_Boolean CreateMDGPR (const Handle_StepRepr_RepresentationContext & Context,Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation & MDGPR);
		%feature("compactdefaultargs") CreateNAUOSRD;
		%feature("autodoc", "	* Create MDGPR, fill it with all the styles previously defined, and add it to the model IMPORTANT: <initPDS> must be null when use for NAUO colors <initPDS> initialised only for SHUO case.

	:param Context:
	:type Context: Handle_StepRepr_RepresentationContext &
	:param CDSR:
	:type CDSR: Handle_StepShape_ContextDependentShapeRepresentation &
	:param initPDS:
	:type initPDS: Handle_StepRepr_ProductDefinitionShape &
	:rtype: bool
") CreateNAUOSRD;
		Standard_Boolean CreateNAUOSRD (const Handle_StepRepr_RepresentationContext & Context,const Handle_StepShape_ContextDependentShapeRepresentation & CDSR,const Handle_StepRepr_ProductDefinitionShape & initPDS);
		%feature("compactdefaultargs") FindContext;
		%feature("autodoc", "	* Searches the STEP model for the RepresentationContext in which given shape is defined. This context (if found) can be used then in call to CreateMDGPR()

	:param Shape:
	:type Shape: TopoDS_Shape &
	:rtype: Handle_StepRepr_RepresentationContext
") FindContext;
		Handle_StepRepr_RepresentationContext FindContext (const TopoDS_Shape & Shape);
		%feature("compactdefaultargs") LoadStyles;
		%feature("autodoc", "	* Searches the STEP model for the MDGPR or DM entities (which bring styles) and fills sequence of styles

	:rtype: bool
") LoadStyles;
		Standard_Boolean LoadStyles ();
		%feature("compactdefaultargs") LoadInvisStyles;
		%feature("autodoc", "	* Searches the STEP model for the INISIBILITY enteties (which bring styles) and fills out sequence of styles

	:param InvSyles:
	:type InvSyles: Handle_TColStd_HSequenceOfTransient &
	:rtype: bool
") LoadInvisStyles;
		Standard_Boolean LoadInvisStyles (Handle_TColStd_HSequenceOfTransient & InvSyles);
		%feature("compactdefaultargs") MakeColorPSA;
		%feature("autodoc", "	* Create a PresentationStyleAssignment entity which defines two colors (for filling surfaces and curves) if isForNAUO true then returns PresentationStyleByContext

	:param item:
	:type item: Handle_StepRepr_RepresentationItem &
	:param SurfCol:
	:type SurfCol: Handle_StepVisual_Colour &
	:param CurveCol:
	:type CurveCol: Handle_StepVisual_Colour &
	:param isForNAUO: default value is Standard_False
	:type isForNAUO: bool
	:rtype: Handle_StepVisual_PresentationStyleAssignment
") MakeColorPSA;
		Handle_StepVisual_PresentationStyleAssignment MakeColorPSA (const Handle_StepRepr_RepresentationItem & item,const Handle_StepVisual_Colour & SurfCol,const Handle_StepVisual_Colour & CurveCol,const Standard_Boolean isForNAUO = Standard_False);
		%feature("compactdefaultargs") GetColorPSA;
		%feature("autodoc", "	* Returns a PresentationStyleAssignment entity which defines surface and curve colors as Col. This PSA is either created or taken from internal map where all PSAs created by this method are remembered.

	:param item:
	:type item: Handle_StepRepr_RepresentationItem &
	:param Col:
	:type Col: Handle_StepVisual_Colour &
	:rtype: Handle_StepVisual_PresentationStyleAssignment
") GetColorPSA;
		Handle_StepVisual_PresentationStyleAssignment GetColorPSA (const Handle_StepRepr_RepresentationItem & item,const Handle_StepVisual_Colour & Col);
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "	* Extract color definitions from the style entity For each type of color supported, result can be either NULL if it is not defined by that style, or last definition (if they are 1 or more)

	:param style:
	:type style: Handle_StepVisual_StyledItem &
	:param SurfCol:
	:type SurfCol: Handle_StepVisual_Colour &
	:param BoundCol:
	:type BoundCol: Handle_StepVisual_Colour &
	:param CurveCol:
	:type CurveCol: Handle_StepVisual_Colour &
	:param IsComponent:
	:type IsComponent: bool
	:rtype: bool
") GetColors;
		Standard_Boolean GetColors (const Handle_StepVisual_StyledItem & style,Handle_StepVisual_Colour & SurfCol,Handle_StepVisual_Colour & BoundCol,Handle_StepVisual_Colour & CurveCol,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "	* Create STEP color entity by given Quantity_Color The analysis is performed for whether the color corresponds to one of standard colors predefined in STEP. In that case, PredefinedColour entity is created instead of RGBColour

	:param Col:
	:type Col: Quantity_Color &
	:rtype: Handle_StepVisual_Colour
") EncodeColor;
		static Handle_StepVisual_Colour EncodeColor (const Quantity_Color & Col);
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "	* Create STEP color entity by given Quantity_Color The analysis is performed for whether the color corresponds to one of standard colors predefined in STEP. In that case, PredefinedColour entity is created instead of RGBColour

	:param Col:
	:type Col: Quantity_Color &
	:param DPDCs:
	:type DPDCs: STEPConstruct_DataMapOfAsciiStringTransient &
	:param ColRGBs:
	:type ColRGBs: STEPConstruct_DataMapOfPointTransient &
	:rtype: Handle_StepVisual_Colour
") EncodeColor;
		static Handle_StepVisual_Colour EncodeColor (const Quantity_Color & Col,STEPConstruct_DataMapOfAsciiStringTransient & DPDCs,STEPConstruct_DataMapOfPointTransient & ColRGBs);
		%feature("compactdefaultargs") DecodeColor;
		%feature("autodoc", "	* Decodes STEP color and fills the Quantity_Color. Returns True if OK or False if color is not recognized

	:param Colour:
	:type Colour: Handle_StepVisual_Colour &
	:param Col:
	:type Col: Quantity_Color &
	:rtype: bool
") DecodeColor;
		static Standard_Boolean DecodeColor (const Handle_StepVisual_Colour & Colour,Quantity_Color & Col);
};


%extend STEPConstruct_Styles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPConstruct_ValidationProps;
class STEPConstruct_ValidationProps : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps ();
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "	* Creates a tool and loads it with worksession

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Load worksession; returns True if succeeded

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "	* General method for adding (writing) a validation property for shape which should be already mapped on writing itself. It uses FindTarget() to find target STEP entity resulting from given shape, and associated context Returns True if success, False in case of fail

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Prop:
	:type Prop: Handle_StepRepr_RepresentationItem &
	:param Descr:
	:type Descr: char *
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") AddProp;
		Standard_Boolean AddProp (const TopoDS_Shape & Shape,const Handle_StepRepr_RepresentationItem & Prop,const char * Descr,const Standard_Boolean instance = Standard_False);
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "	* General method for adding (writing) a validation property for shape which should be already mapped on writing itself. It takes target and Context entities which correspond to shape Returns True if success, False in case of fail

	:param target:
	:type target: StepRepr_CharacterizedDefinition &
	:param Context:
	:type Context: Handle_StepRepr_RepresentationContext &
	:param Prop:
	:type Prop: Handle_StepRepr_RepresentationItem &
	:param Descr:
	:type Descr: char *
	:rtype: bool
") AddProp;
		Standard_Boolean AddProp (const StepRepr_CharacterizedDefinition & target,const Handle_StepRepr_RepresentationContext & Context,const Handle_StepRepr_RepresentationItem & Prop,const char * Descr);
		%feature("compactdefaultargs") AddArea;
		%feature("autodoc", "	* Adds surface area property for given shape (already mapped). Returns True if success, False in case of fail

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Area:
	:type Area: float
	:rtype: bool
") AddArea;
		Standard_Boolean AddArea (const TopoDS_Shape & Shape,const Standard_Real Area);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	* Adds volume property for given shape (already mapped). Returns True if success, False in case of fail

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Vol:
	:type Vol: float
	:rtype: bool
") AddVolume;
		Standard_Boolean AddVolume (const TopoDS_Shape & Shape,const Standard_Real Vol);
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
		%feature("compactdefaultargs") FindTarget;
		%feature("autodoc", "	* Finds target STEP entity to which validation props should be assigned, and corresponding context, starting from shape Returns True if success, False in case of fail

	:param S:
	:type S: TopoDS_Shape &
	:param target:
	:type target: StepRepr_CharacterizedDefinition &
	:param Context:
	:type Context: Handle_StepRepr_RepresentationContext &
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") FindTarget;
		Standard_Boolean FindTarget (const TopoDS_Shape & S,StepRepr_CharacterizedDefinition & target,Handle_StepRepr_RepresentationContext & Context,const Standard_Boolean instance = Standard_False);
		%feature("compactdefaultargs") LoadProps;
		%feature("autodoc", "	* Searches for entities of the type PropertyDefinitionRepresentation in the model and fills the sequence by them

	:param seq:
	:type seq: TColStd_SequenceOfTransient &
	:rtype: bool
") LoadProps;
		Standard_Boolean LoadProps (TColStd_SequenceOfTransient & seq);
		%feature("compactdefaultargs") GetPropNAUO;
		%feature("autodoc", "	* Returns CDSR associated with given PpD or NULL if not found (when, try GetPropSDR)

	:param PD:
	:type PD: Handle_StepRepr_PropertyDefinition &
	:rtype: Handle_StepRepr_NextAssemblyUsageOccurrence
") GetPropNAUO;
		Handle_StepRepr_NextAssemblyUsageOccurrence GetPropNAUO (const Handle_StepRepr_PropertyDefinition & PD);
		%feature("compactdefaultargs") GetPropPD;
		%feature("autodoc", "	* Returns SDR associated with given PpD or NULL if not found (when, try GetPropCDSR)

	:param PD:
	:type PD: Handle_StepRepr_PropertyDefinition &
	:rtype: Handle_StepBasic_ProductDefinition
") GetPropPD;
		Handle_StepBasic_ProductDefinition GetPropPD (const Handle_StepRepr_PropertyDefinition & PD);
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "	* Returns Shape associated with given SDR or Null Shape if not found

	:param ProdDef:
	:type ProdDef: Handle_StepBasic_ProductDefinition &
	:rtype: TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape (const Handle_StepBasic_ProductDefinition & ProdDef);
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "	* Returns Shape associated with given PpD or Null Shape if not found

	:param PD:
	:type PD: Handle_StepRepr_PropertyDefinition &
	:rtype: TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape (const Handle_StepRepr_PropertyDefinition & PD);
		%feature("compactdefaultargs") GetPropReal;
		%feature("autodoc", "	* Returns value of Real-Valued property (Area or Volume) If Property is neither Area nor Volume, returns False Else returns True and isArea indicates whether property is area or volume

	:param item:
	:type item: Handle_StepRepr_RepresentationItem &
	:param Val:
	:type Val: float &
	:param isArea:
	:type isArea: bool
	:rtype: bool
") GetPropReal;
		Standard_Boolean GetPropReal (const Handle_StepRepr_RepresentationItem & item,Standard_Real &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") GetPropPnt;
		%feature("autodoc", "	* Returns value of Centriod property (or False if it is not)

	:param item:
	:type item: Handle_StepRepr_RepresentationItem &
	:param Context:
	:type Context: Handle_StepRepr_RepresentationContext &
	:param Pnt:
	:type Pnt: gp_Pnt
	:rtype: bool
") GetPropPnt;
		Standard_Boolean GetPropPnt (const Handle_StepRepr_RepresentationItem & item,const Handle_StepRepr_RepresentationContext & Context,gp_Pnt & Pnt);
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
