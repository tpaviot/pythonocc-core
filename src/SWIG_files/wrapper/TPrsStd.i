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
%define TPRSSTDDOCSTRING
"The visualization attribute implements the
Application Interactive Services in the context
of Open CASCADE Application Framework.


-Category: GUID
04fb4d05-5690-11d1-8940-080009dc3333  TPrsStd_AISViewer
04fb4d00-5690-11d1-8940-080009dc3333	TPrsStd_AISPresentation
"
%enddef
%module (package="OCC.Core", docstring=TPRSSTDDOCSTRING) TPrsStd

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
%include ../common/OccHandle.i


%include TPrsStd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(TPrsStd_AISPresentation)
%wrap_handle(TPrsStd_AISViewer)
%wrap_handle(TPrsStd_DataMapNodeOfDataMapOfGUIDDriver)
%wrap_handle(TPrsStd_Driver)
%wrap_handle(TPrsStd_DriverTable)
%wrap_handle(TPrsStd_AxisDriver)
%wrap_handle(TPrsStd_ConstraintDriver)
%wrap_handle(TPrsStd_GeometryDriver)
%wrap_handle(TPrsStd_NamedShapeDriver)
%wrap_handle(TPrsStd_PlaneDriver)
%wrap_handle(TPrsStd_PointDriver)

%nodefaultctor TPrsStd_AISPresentation;
class TPrsStd_AISPresentation : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for TPrsStd_AISPresentation attributes.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates or retrieves the presentation attribute on the label L, and sets the GUID driver.

	:param L:
	:type L: TDF_Label &
	:param driver:
	:type driver: Standard_GUID &
	:rtype: Handle_TPrsStd_AISPresentation
") Set;
		static Handle_TPrsStd_AISPresentation Set (const TDF_Label & L,const Standard_GUID & driver);
		%feature("compactdefaultargs") Unset;
		%feature("autodoc", "	* Delete (if exist) the presentation attribute associated to the label <L>.

	:param L:
	:type L: TDF_Label &
	:rtype: void
") Unset;
		static void Unset (const TDF_Label & L);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates or retrieves the AISPresentation attribute attached to master. The GUID of the driver will be the GUID of master. master is the attribute you want to display.

	:param master:
	:type master: Handle_TDF_Attribute &
	:rtype: Handle_TPrsStd_AISPresentation
") Set;
		static Handle_TPrsStd_AISPresentation Set (const Handle_TDF_Attribute & master);
		%feature("compactdefaultargs") TPrsStd_AISPresentation;
		%feature("autodoc", "	:rtype: None
") TPrsStd_AISPresentation;
		 TPrsStd_AISPresentation ();
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SetDisplayed;
		void SetDisplayed (const Standard_Boolean B);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display presentation of object in AIS viewer. If <update> = True then AISObject is recomputed and all the visualization settings are applied

	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") Display;
		void Display (const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Removes the presentation of this AIS presentation attribute from the TPrsStd_AISViewer. If remove is true, this AIS presentation attribute is removed from the interactive context.

	:param remove: default value is Standard_False
	:type remove: bool
	:rtype: None
") Erase;
		void Erase (const Standard_Boolean remove = Standard_False);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Recompute presentation of object and apply the visualization settings

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetDriverGUID;
		Standard_GUID GetDriverGUID ();
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "	:param guid:
	:type guid: Standard_GUID &
	:rtype: None
") SetDriverGUID;
		void SetDriverGUID (const Standard_GUID & guid);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns true if this AIS presentation attribute is displayed.

	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") GetAIS;
		%feature("autodoc", "	* Returns AIS_InteractiveObject stored in the presentation attribute

	:rtype: Handle_AIS_InteractiveObject
") GetAIS;
		Handle_AIS_InteractiveObject GetAIS ();
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Returns the material setting for this presentation attribute.

	:rtype: Graphic3d_NameOfMaterial
") Material;
		Graphic3d_NameOfMaterial Material ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	* Sets the material aName for this presentation attribute.

	:param aName:
	:type aName: Graphic3d_NameOfMaterial
	:rtype: None
") SetMaterial;
		void SetMaterial (const Graphic3d_NameOfMaterial aName);
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "	* Returns true if this presentation attribute already has a material setting.

	:rtype: bool
") HasOwnMaterial;
		Standard_Boolean HasOwnMaterial ();
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "	* Removes the material setting from this presentation attribute.

	:rtype: None
") UnsetMaterial;
		void UnsetMaterial ();
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Sets the transparency value aValue for this presentation attribute. This value is 0.6 by default.

	:param aValue: default value is 0.6
	:type aValue: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real aValue = 0.6);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	:rtype: float
") Transparency;
		Standard_Real Transparency ();
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "	* Returns true if this presentation attribute already has a transparency setting.

	:rtype: bool
") HasOwnTransparency;
		Standard_Boolean HasOwnTransparency ();
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* Removes the transparency setting from this presentation attribute.

	:rtype: None
") UnsetTransparency;
		void UnsetTransparency ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:rtype: Quantity_NameOfColor
") Color;
		Quantity_NameOfColor Color ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets the color aColor for this presentation attribute.

	:param aColor:
	:type aColor: Quantity_NameOfColor
	:rtype: None
") SetColor;
		void SetColor (const Quantity_NameOfColor aColor);
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "	* Returns true if this presentation attribute already has a color setting.

	:rtype: bool
") HasOwnColor;
		Standard_Boolean HasOwnColor ();
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "	* Removes the color setting from this presentation attribute.

	:rtype: None
") UnsetColor;
		void UnsetColor ();
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	:rtype: float
") Width;
		Standard_Real Width ();
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Sets the width aWidth for this presentation attribute.

	:param aWidth:
	:type aWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "	* Returns true if this presentation attribute already has a width setting.

	:rtype: bool
") HasOwnWidth;
		Standard_Boolean HasOwnWidth ();
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "	* Removes the width setting from this presentation attribute.

	:rtype: None
") UnsetWidth;
		void UnsetWidth ();
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:rtype: int
") Mode;
		Standard_Integer Mode ();
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	:param theMode:
	:type theMode: int
	:rtype: None
") SetMode;
		void SetMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", "	:rtype: bool
") HasOwnMode;
		Standard_Boolean HasOwnMode ();
		%feature("compactdefaultargs") UnsetMode;
		%feature("autodoc", "	:rtype: None
") UnsetMode;
		void UnsetMode ();
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "	:rtype: int
") SelectionMode;
		Standard_Integer SelectionMode ();
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	:param theSelectionMode:
	:type theSelectionMode: int
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (const Standard_Integer theSelectionMode);
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", "	:rtype: bool
") HasOwnSelectionMode;
		Standard_Boolean HasOwnSelectionMode ();
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "	:rtype: None
") UnsetSelectionMode;
		void UnsetSelectionMode ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") BackupCopy;
		virtual Handle_TDF_Attribute BackupCopy ();
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "	:rtype: void
") AfterAddition;
		virtual void AfterAddition ();
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "	:rtype: void
") BeforeRemoval;
		virtual void BeforeRemoval ();
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	:rtype: void
") BeforeForget;
		virtual void BeforeForget ();
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "	:rtype: void
") AfterResume;
		virtual void AfterResume ();
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* update AIS viewer according to delta

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
};


%make_alias(TPrsStd_AISPresentation)

%extend TPrsStd_AISPresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_AISViewer;
class TPrsStd_AISViewer : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "	* returns True if there is an AISViewer attribute in <acces> Data Framework.

	:param acces:
	:type acces: TDF_Label &
	:rtype: bool
") Has;
		static Standard_Boolean Has (const TDF_Label & acces);
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	* create and set an AISViewer at. Raise an exception if Has.

	:param access:
	:type access: TDF_Label &
	:param selector:
	:type selector: Handle_AIS_InteractiveContext &
	:rtype: Handle_TPrsStd_AISViewer
") New;
		static Handle_TPrsStd_AISViewer New (const TDF_Label & access,const Handle_AIS_InteractiveContext & selector);
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	* create and set an AISAttribute at root label. The interactive context is build. Raise an exception if Has.

	:param acces:
	:type acces: TDF_Label &
	:param viewer:
	:type viewer: Handle_V3d_Viewer &
	:rtype: Handle_TPrsStd_AISViewer
") New;
		static Handle_TPrsStd_AISViewer New (const TDF_Label & acces,const Handle_V3d_Viewer & viewer);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* Finds the viewer attribute at the label access, the root of the data framework. Calling this function can be used to initialize an AIS viewer

	:param acces:
	:type acces: TDF_Label &
	:param A:
	:type A: Handle_TPrsStd_AISViewer &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & acces,Handle_TPrsStd_AISViewer & A);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param acces:
	:type acces: TDF_Label &
	:param IC:
	:type IC: Handle_AIS_InteractiveContext &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & acces,Handle_AIS_InteractiveContext & IC);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param acces:
	:type acces: TDF_Label &
	:param V:
	:type V: Handle_V3d_Viewer &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & acces,Handle_V3d_Viewer & V);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* AISViewer methods =================

	:param acces:
	:type acces: TDF_Label &
	:rtype: void
") Update;
		static void Update (const TDF_Label & acces);
		%feature("compactdefaultargs") TPrsStd_AISViewer;
		%feature("autodoc", "	:rtype: None
") TPrsStd_AISViewer;
		 TPrsStd_AISViewer ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates the viewer at the label access. access is the root of the data framework.

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") SetInteractiveContext;
		%feature("autodoc", "	* Sets the interactive context ctx for this attribute.

	:param ctx:
	:type ctx: Handle_AIS_InteractiveContext &
	:rtype: None
") SetInteractiveContext;
		void SetInteractiveContext (const Handle_AIS_InteractiveContext & ctx);
		%feature("compactdefaultargs") GetInteractiveContext;
		%feature("autodoc", "	* Returns the interactive context in this attribute.

	:rtype: Handle_AIS_InteractiveContext
") GetInteractiveContext;
		Handle_AIS_InteractiveContext GetInteractiveContext ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
};


%make_alias(TPrsStd_AISViewer)

%extend TPrsStd_AISViewer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TPrsStd_ConstraintTools {
	public:
		%feature("compactdefaultargs") UpdateOnlyValue;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") UpdateOnlyValue;
		static void UpdateOnlyValue (const Handle_TDataXtd_Constraint & aConst,const Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeDistance;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeDistance;
		static void ComputeDistance (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeParallel;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeParallel;
		static void ComputeParallel (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeTangent;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeTangent;
		static void ComputeTangent (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputePerpendicular;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputePerpendicular;
		static void ComputePerpendicular (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeConcentric;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeConcentric;
		static void ComputeConcentric (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeSymmetry;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeSymmetry;
		static void ComputeSymmetry (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeMidPoint;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeMidPoint;
		static void ComputeMidPoint (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeAngle;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeAngle;
		static void ComputeAngle (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeRadius;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeRadius;
		static void ComputeRadius (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeMinRadius;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeMinRadius;
		static void ComputeMinRadius (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeMaxRadius;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeMaxRadius;
		static void ComputeMaxRadius (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeEqualDistance;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeEqualDistance;
		static void ComputeEqualDistance (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeEqualRadius;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeEqualRadius;
		static void ComputeEqualRadius (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeFix;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeFix;
		static void ComputeFix (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeDiameter;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeDiameter;
		static void ComputeDiameter (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeOffset;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeOffset;
		static void ComputeOffset (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputePlacement;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputePlacement;
		static void ComputePlacement (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeCoincident;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeCoincident;
		static void ComputeCoincident (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeRound;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeRound;
		static void ComputeRound (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeOthers;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeOthers;
		static void ComputeOthers (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
		%feature("compactdefaultargs") ComputeTextAndValue;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param aValue:
	:type aValue: float &
	:param aText:
	:type aText: TCollection_ExtendedString &
	:param anIsAngle:
	:type anIsAngle: bool
	:rtype: void
") ComputeTextAndValue;
		static void ComputeTextAndValue (const Handle_TDataXtd_Constraint & aConst,Standard_Real &OutValue,TCollection_ExtendedString & aText,const Standard_Boolean anIsAngle);
		%feature("compactdefaultargs") ComputeAngleForOneFace;
		%feature("autodoc", "	:param aConst:
	:type aConst: Handle_TDataXtd_Constraint &
	:param anAIS:
	:type anAIS: Handle_AIS_InteractiveObject &
	:rtype: void
") ComputeAngleForOneFace;
		static void ComputeAngleForOneFace (const Handle_TDataXtd_Constraint & aConst,Handle_AIS_InteractiveObject & anAIS);
};


%extend TPrsStd_ConstraintTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
class TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
		%feature("autodoc", "	:rtype: None
") TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
		 TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver ();
		%feature("compactdefaultargs") TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param aMap:
	:type aMap: TPrsStd_DataMapOfGUIDDriver &
	:rtype: None
") TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
		 TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver (const TPrsStd_DataMapOfGUIDDriver & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TPrsStd_DataMapOfGUIDDriver &
	:rtype: None
") Initialize;
		void Initialize (const TPrsStd_DataMapOfGUIDDriver & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key;
		const Standard_GUID & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TPrsStd_Driver
") Value;
		Handle_TPrsStd_Driver Value ();
};


%extend TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_DataMapNodeOfDataMapOfGUIDDriver;
class TPrsStd_DataMapNodeOfDataMapOfGUIDDriver : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TPrsStd_DataMapNodeOfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:param I:
	:type I: Handle_TPrsStd_Driver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TPrsStd_DataMapNodeOfDataMapOfGUIDDriver;
		 TPrsStd_DataMapNodeOfDataMapOfGUIDDriver (const Standard_GUID & K,const Handle_TPrsStd_Driver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key;
		Standard_GUID & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TPrsStd_Driver
") Value;
		Handle_TPrsStd_Driver Value ();
};


%make_alias(TPrsStd_DataMapNodeOfDataMapOfGUIDDriver)

%extend TPrsStd_DataMapNodeOfDataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_DataMapOfGUIDDriver;
class TPrsStd_DataMapOfGUIDDriver : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TPrsStd_DataMapOfGUIDDriver;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TPrsStd_DataMapOfGUIDDriver;
		 TPrsStd_DataMapOfGUIDDriver (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TPrsStd_DataMapOfGUIDDriver &
	:rtype: TPrsStd_DataMapOfGUIDDriver
") Assign;
		TPrsStd_DataMapOfGUIDDriver & Assign (const TPrsStd_DataMapOfGUIDDriver & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TPrsStd_DataMapOfGUIDDriver &
	:rtype: TPrsStd_DataMapOfGUIDDriver
") operator =;
		TPrsStd_DataMapOfGUIDDriver & operator = (const TPrsStd_DataMapOfGUIDDriver & Other);
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
	:type K: Standard_GUID &
	:param I:
	:type I: Handle_TPrsStd_Driver &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_GUID & K,const Handle_TPrsStd_Driver & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_GUID & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_GUID & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Handle_TPrsStd_Driver
") Find;
		Handle_TPrsStd_Driver Find (const Standard_GUID & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Handle_TPrsStd_Driver
") ChangeFind;
		Handle_TPrsStd_Driver ChangeFind (const Standard_GUID & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_GUID & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_GUID & K);
};


%extend TPrsStd_DataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_Driver;
class TPrsStd_Driver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates the interactive object ais with information found on the attributes associated with the label L.

	:param L:
	:type L: TDF_Label &
	:param ais:
	:type ais: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & L,Handle_AIS_InteractiveObject & ais);
};


%make_alias(TPrsStd_Driver)

%extend TPrsStd_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_DriverTable;
class TPrsStd_DriverTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the static table. If it does not exist, creates it and fills it with standard drivers.

	:rtype: Handle_TPrsStd_DriverTable
") Get;
		static Handle_TPrsStd_DriverTable Get ();
		%feature("compactdefaultargs") TPrsStd_DriverTable;
		%feature("autodoc", "	* Default constructor

	:rtype: None
") TPrsStd_DriverTable;
		 TPrsStd_DriverTable ();
		%feature("compactdefaultargs") InitStandardDrivers;
		%feature("autodoc", "	* Fills the table with standard drivers

	:rtype: None
") InitStandardDrivers;
		void InitStandardDrivers ();
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "	* Returns true if the driver has been added successfully to the driver table.

	:param guid:
	:type guid: Standard_GUID &
	:param driver:
	:type driver: Handle_TPrsStd_Driver &
	:rtype: bool
") AddDriver;
		Standard_Boolean AddDriver (const Standard_GUID & guid,const Handle_TPrsStd_Driver & driver);
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "	* Returns true if the driver was found.

	:param guid:
	:type guid: Standard_GUID &
	:param driver:
	:type driver: Handle_TPrsStd_Driver &
	:rtype: bool
") FindDriver;
		Standard_Boolean FindDriver (const Standard_GUID & guid,Handle_TPrsStd_Driver & driver);
		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "	* Removes a driver with the given GUID. Returns true if the driver has been removed successfully.

	:param guid:
	:type guid: Standard_GUID &
	:rtype: bool
") RemoveDriver;
		Standard_Boolean RemoveDriver (const Standard_GUID & guid);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all drivers. Returns true if the driver has been removed successfully. If this method is used, the InitStandardDrivers method should be called to fill the table with standard drivers.

	:rtype: None
") Clear;
		void Clear ();
};


%make_alias(TPrsStd_DriverTable)

%extend TPrsStd_DriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_AxisDriver;
class TPrsStd_AxisDriver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") TPrsStd_AxisDriver;
		%feature("autodoc", "	* Constructs an empty axis driver.

	:rtype: None
") TPrsStd_AxisDriver;
		 TPrsStd_AxisDriver ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anAISObject:
	:type anAISObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,Handle_AIS_InteractiveObject & anAISObject);
};


%make_alias(TPrsStd_AxisDriver)

%extend TPrsStd_AxisDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_ConstraintDriver;
class TPrsStd_ConstraintDriver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") TPrsStd_ConstraintDriver;
		%feature("autodoc", "	* Constructs an empty constraint driver.

	:rtype: None
") TPrsStd_ConstraintDriver;
		 TPrsStd_ConstraintDriver ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anAISObject:
	:type anAISObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,Handle_AIS_InteractiveObject & anAISObject);
};


%make_alias(TPrsStd_ConstraintDriver)

%extend TPrsStd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_GeometryDriver;
class TPrsStd_GeometryDriver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") TPrsStd_GeometryDriver;
		%feature("autodoc", "	* Constructs an empty geometry driver.

	:rtype: None
") TPrsStd_GeometryDriver;
		 TPrsStd_GeometryDriver ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anAISObject:
	:type anAISObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,Handle_AIS_InteractiveObject & anAISObject);
};


%make_alias(TPrsStd_GeometryDriver)

%extend TPrsStd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_NamedShapeDriver;
class TPrsStd_NamedShapeDriver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") TPrsStd_NamedShapeDriver;
		%feature("autodoc", "	* Constructs an empty named shape driver.

	:rtype: None
") TPrsStd_NamedShapeDriver;
		 TPrsStd_NamedShapeDriver ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anAISObject:
	:type anAISObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,Handle_AIS_InteractiveObject & anAISObject);
};


%make_alias(TPrsStd_NamedShapeDriver)

%extend TPrsStd_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_PlaneDriver;
class TPrsStd_PlaneDriver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") TPrsStd_PlaneDriver;
		%feature("autodoc", "	* Constructs an empty plane driver.

	:rtype: None
") TPrsStd_PlaneDriver;
		 TPrsStd_PlaneDriver ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anAISObject:
	:type anAISObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,Handle_AIS_InteractiveObject & anAISObject);
};


%make_alias(TPrsStd_PlaneDriver)

%extend TPrsStd_PlaneDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TPrsStd_PointDriver;
class TPrsStd_PointDriver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") TPrsStd_PointDriver;
		%feature("autodoc", "	* Constructs an empty point driver.

	:rtype: None
") TPrsStd_PointDriver;
		 TPrsStd_PointDriver ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Build the AISObject (if null) or update it. No compute is done. Returns <True> if informations was found and AISObject updated.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anAISObject:
	:type anAISObject: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & aLabel,Handle_AIS_InteractiveObject & anAISObject);
};


%make_alias(TPrsStd_PointDriver)

%extend TPrsStd_PointDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
