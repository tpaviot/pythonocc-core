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
%define TPRSSTDDOCSTRING
"TPrsStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tprsstd.html"
%enddef
%module (package="OCC.Core", docstring=TPRSSTDDOCSTRING) TPrsStd


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
#include<TPrsStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<Quantity_module.hxx>
#include<AIS_module.hxx>
#include<Graphic3d_module.hxx>
#include<V3d_module.hxx>
#include<TDataXtd_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TopTools_module.hxx>
#include<TCollection_module.hxx>
#include<Geom_module.hxx>
#include<TDataStd_module.hxx>
#include<Aspect_module.hxx>
#include<TNaming_module.hxx>
#include<Select3D_module.hxx>
#include<TColQuantity_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<Prs3d_module.hxx>
#include<Bnd_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<SelectBasics_module.hxx>
#include<TopoDS_module.hxx>
#include<SelectMgr_module.hxx>
#include<PrsMgr_module.hxx>
#include<V3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<StdSelect_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import Quantity.i
%import AIS.i
%import Graphic3d.i
%import V3d.i
%import TDataXtd.i
%import TCollection.i

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
%wrap_handle(TPrsStd_AISPresentation)
%wrap_handle(TPrsStd_AISViewer)
%wrap_handle(TPrsStd_Driver)
%wrap_handle(TPrsStd_DriverTable)
%wrap_handle(TPrsStd_AxisDriver)
%wrap_handle(TPrsStd_ConstraintDriver)
%wrap_handle(TPrsStd_GeometryDriver)
%wrap_handle(TPrsStd_NamedShapeDriver)
%wrap_handle(TPrsStd_PlaneDriver)
%wrap_handle(TPrsStd_PointDriver)
/* end handles declaration */

/* templates */
%template(TPrsStd_DataMapOfGUIDDriver) NCollection_DataMap<Standard_GUID,opencascade::handle<TPrsStd_Driver>,Standard_GUID>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TPrsStd_Driver>, Standard_GUID>::Iterator TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TPrsStd_Driver>, Standard_GUID> TPrsStd_DataMapOfGUIDDriver;
/* end typedefs declaration */

/********************************
* class TPrsStd_AISPresentation *
********************************/
class TPrsStd_AISPresentation : public TDF_Attribute {
	public:
		/****************** TPrsStd_AISPresentation ******************/
		%feature("compactdefaultargs") TPrsStd_AISPresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TPrsStd_AISPresentation;
		 TPrsStd_AISPresentation();

		/****************** AddSelectionMode ******************/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSelectionMode: int
theTransaction: bool,optional
	default value is Standard_True

Returns
-------
None
") AddSelectionMode;
		void AddSelectionMode(const Standard_Integer theSelectionMode, const Standard_Boolean theTransaction = Standard_True);

		/****************** AfterAddition ******************/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AfterAddition;
		virtual void AfterAddition();

		/****************** AfterResume ******************/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AfterResume;
		virtual void AfterResume();

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Update ais viewer according to delta.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BeforeForget;
		virtual void BeforeForget();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_NameOfColor
") Color;
		Quantity_NameOfColor Color();

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Display presentation of object in ais viewer. if <update> = true then aisobject is recomputed and all the visualization settings are applied.

Parameters
----------
update: bool,optional
	default value is Standard_False

Returns
-------
None
") Display;
		void Display(const Standard_Boolean update = Standard_False);

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Removes the presentation of this ais presentation attribute from the tprsstd_aisviewer. if remove is true, this ais presentation attribute is removed from the interactive context.

Parameters
----------
remove: bool,optional
	default value is Standard_False

Returns
-------
None
") Erase;
		void Erase(const Standard_Boolean remove = Standard_False);

		/****************** GetAIS ******************/
		%feature("compactdefaultargs") GetAIS;
		%feature("autodoc", "Returns ais_interactiveobject stored in the presentation attribute.

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") GetAIS;
		opencascade::handle<AIS_InteractiveObject> GetAIS();

		/****************** GetDriverGUID ******************/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetDriverGUID;
		Standard_GUID GetDriverGUID();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for tprsstd_aispresentation attributes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNbSelectionModes ******************/
		%feature("compactdefaultargs") GetNbSelectionModes;
		%feature("autodoc", "Returns selection mode(s) of the attribute. it starts with 1 .. getnbselectionmodes().

Returns
-------
int
") GetNbSelectionModes;
		Standard_Integer GetNbSelectionModes();

		/****************** HasOwnColor ******************/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "Returns true if this presentation attribute already has a color setting.

Returns
-------
bool
") HasOwnColor;
		Standard_Boolean HasOwnColor();

		/****************** HasOwnMaterial ******************/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "Returns true if this presentation attribute already has a material setting.

Returns
-------
bool
") HasOwnMaterial;
		Standard_Boolean HasOwnMaterial();

		/****************** HasOwnMode ******************/
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnMode;
		Standard_Boolean HasOwnMode();

		/****************** HasOwnSelectionMode ******************/
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnSelectionMode;
		Standard_Boolean HasOwnSelectionMode();

		/****************** HasOwnTransparency ******************/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "Returns true if this presentation attribute already has a transparency setting.

Returns
-------
bool
") HasOwnTransparency;
		Standard_Boolean HasOwnTransparency();

		/****************** HasOwnWidth ******************/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "Returns true if this presentation attribute already has a width setting.

Returns
-------
bool
") HasOwnWidth;
		Standard_Boolean HasOwnWidth();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Returns true if this ais presentation attribute is displayed.

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Returns the material setting for this presentation attribute.

Returns
-------
Graphic3d_NameOfMaterial
") Material;
		Graphic3d_NameOfMaterial Material();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Mode;
		Standard_Integer Mode();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** SelectionMode ******************/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
index: int,optional
	default value is 1

Returns
-------
int
") SelectionMode;
		Standard_Integer SelectionMode(const int index = 1);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates or retrieves the presentation attribute on the label l, and sets the guid driver.

Parameters
----------
L: TDF_Label
driver: Standard_GUID

Returns
-------
opencascade::handle<TPrsStd_AISPresentation>
") Set;
		static opencascade::handle<TPrsStd_AISPresentation> Set(const TDF_Label & L, const Standard_GUID & driver);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates or retrieves the aispresentation attribute attached to master. the guid of the driver will be the guid of master. master is the attribute you want to display.

Parameters
----------
master: TDF_Attribute

Returns
-------
opencascade::handle<TPrsStd_AISPresentation>
") Set;
		static opencascade::handle<TPrsStd_AISPresentation> Set(const opencascade::handle<TDF_Attribute> & master);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets the color acolor for this presentation attribute.

Parameters
----------
aColor: Quantity_NameOfColor

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_NameOfColor aColor);

		/****************** SetDisplayed ******************/
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") SetDisplayed;
		void SetDisplayed(const Standard_Boolean B);

		/****************** SetDriverGUID ******************/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
guid: Standard_GUID

Returns
-------
None
") SetDriverGUID;
		void SetDriverGUID(const Standard_GUID & guid);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets the material aname for this presentation attribute.

Parameters
----------
aName: Graphic3d_NameOfMaterial

Returns
-------
None
") SetMaterial;
		void SetMaterial(const Graphic3d_NameOfMaterial aName);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMode: int

Returns
-------
None
") SetMode;
		void SetMode(const Standard_Integer theMode);

		/****************** SetSelectionMode ******************/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "Sets selection mode. if 'thetransaction' flag is off, modification of the attribute doesn't influence the transaction mechanism (the attribute doesn't participate in undo/redo because of this modification). certainly, if any other data of the attribute is modified (display mode, color, ...), the attribute will be included into undo/redo.

Parameters
----------
theSelectionMode: int
theTransaction: bool,optional
	default value is Standard_True

Returns
-------
None
") SetSelectionMode;
		void SetSelectionMode(const Standard_Integer theSelectionMode, const Standard_Boolean theTransaction = Standard_True);

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Sets the transparency value avalue for this presentation attribute. this value is 0.6 by default.

Parameters
----------
aValue: float,optional
	default value is 0.6

Returns
-------
None
") SetTransparency;
		void SetTransparency(const Standard_Real aValue = 0.6);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Sets the width awidth for this presentation attribute.

Parameters
----------
aWidth: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real aWidth);

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Transparency;
		Standard_Real Transparency();

		/****************** Unset ******************/
		%feature("compactdefaultargs") Unset;
		%feature("autodoc", "Delete (if exist) the presentation attribute associated to the label <l>.

Parameters
----------
L: TDF_Label

Returns
-------
None
") Unset;
		static void Unset(const TDF_Label & L);

		/****************** UnsetColor ******************/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes the color setting from this presentation attribute.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetMaterial ******************/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Removes the material setting from this presentation attribute.

Returns
-------
None
") UnsetMaterial;
		void UnsetMaterial();

		/****************** UnsetMode ******************/
		%feature("compactdefaultargs") UnsetMode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetMode;
		void UnsetMode();

		/****************** UnsetSelectionMode ******************/
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "Clears all selection modes of the attribute.

Returns
-------
None
") UnsetSelectionMode;
		void UnsetSelectionMode();

		/****************** UnsetTransparency ******************/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the transparency setting from this presentation attribute.

Returns
-------
None
") UnsetTransparency;
		void UnsetTransparency();

		/****************** UnsetWidth ******************/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Removes the width setting from this presentation attribute.

Returns
-------
None
") UnsetWidth;
		void UnsetWidth();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Recompute presentation of object and apply the visualization settings.

Returns
-------
None
") Update;
		void Update();

		/****************** Width ******************/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Width;
		Standard_Real Width();

};


%make_alias(TPrsStd_AISPresentation)

%extend TPrsStd_AISPresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TPrsStd_AISViewer *
**************************/
class TPrsStd_AISViewer : public TDF_Attribute {
	public:
		/****************** TPrsStd_AISViewer ******************/
		%feature("compactdefaultargs") TPrsStd_AISViewer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TPrsStd_AISViewer;
		 TPrsStd_AISViewer();

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Finds the viewer attribute at the label access, the root of the data framework. calling this function can be used to initialize an ais viewer.

Parameters
----------
acces: TDF_Label
A: TPrsStd_AISViewer

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & acces, opencascade::handle<TPrsStd_AISViewer> & A);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "No available documentation.

Parameters
----------
acces: TDF_Label
IC: AIS_InteractiveContext

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & acces, opencascade::handle<AIS_InteractiveContext> & IC);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "No available documentation.

Parameters
----------
acces: TDF_Label
V: V3d_Viewer

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & acces, opencascade::handle<V3d_Viewer> & V);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetInteractiveContext ******************/
		%feature("compactdefaultargs") GetInteractiveContext;
		%feature("autodoc", "Returns the interactive context in this attribute.

Returns
-------
opencascade::handle<AIS_InteractiveContext>
") GetInteractiveContext;
		opencascade::handle<AIS_InteractiveContext> GetInteractiveContext();

		/****************** Has ******************/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "Returns true if there is an aisviewer attribute in <acces> data framework.

Parameters
----------
acces: TDF_Label

Returns
-------
bool
") Has;
		static Standard_Boolean Has(const TDF_Label & acces);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** New ******************/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "Create and set an aisviewer at. raise an exception if has.

Parameters
----------
access: TDF_Label
selector: AIS_InteractiveContext

Returns
-------
opencascade::handle<TPrsStd_AISViewer>
") New;
		static opencascade::handle<TPrsStd_AISViewer> New(const TDF_Label & access, const opencascade::handle<AIS_InteractiveContext> & selector);

		/****************** New ******************/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "Create and set an aisattribute at root label. the interactive context is build. raise an exception if has.

Parameters
----------
acces: TDF_Label
viewer: V3d_Viewer

Returns
-------
opencascade::handle<TPrsStd_AISViewer>
") New;
		static opencascade::handle<TPrsStd_AISViewer> New(const TDF_Label & acces, const opencascade::handle<V3d_Viewer> & viewer);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** SetInteractiveContext ******************/
		%feature("compactdefaultargs") SetInteractiveContext;
		%feature("autodoc", "Sets the interactive context ctx for this attribute.

Parameters
----------
ctx: AIS_InteractiveContext

Returns
-------
None
") SetInteractiveContext;
		void SetInteractiveContext(const opencascade::handle<AIS_InteractiveContext> & ctx);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Aisviewer methods =================.

Parameters
----------
acces: TDF_Label

Returns
-------
None
") Update;
		static void Update(const TDF_Label & acces);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates the viewer at the label access. access is the root of the data framework.

Returns
-------
None
") Update;
		void Update();

};


%make_alias(TPrsStd_AISViewer)

%extend TPrsStd_AISViewer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TPrsStd_ConstraintTools *
********************************/
class TPrsStd_ConstraintTools {
	public:
		/****************** ComputeAngle ******************/
		%feature("compactdefaultargs") ComputeAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeAngle;
		static void ComputeAngle(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeAngleForOneFace ******************/
		%feature("compactdefaultargs") ComputeAngleForOneFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeAngleForOneFace;
		static void ComputeAngleForOneFace(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeCoincident ******************/
		%feature("compactdefaultargs") ComputeCoincident;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeCoincident;
		static void ComputeCoincident(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeConcentric ******************/
		%feature("compactdefaultargs") ComputeConcentric;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeConcentric;
		static void ComputeConcentric(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeDiameter ******************/
		%feature("compactdefaultargs") ComputeDiameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeDiameter;
		static void ComputeDiameter(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeDistance ******************/
		%feature("compactdefaultargs") ComputeDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeDistance;
		static void ComputeDistance(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeEqualDistance ******************/
		%feature("compactdefaultargs") ComputeEqualDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeEqualDistance;
		static void ComputeEqualDistance(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeEqualRadius ******************/
		%feature("compactdefaultargs") ComputeEqualRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeEqualRadius;
		static void ComputeEqualRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeFix ******************/
		%feature("compactdefaultargs") ComputeFix;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeFix;
		static void ComputeFix(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeMaxRadius ******************/
		%feature("compactdefaultargs") ComputeMaxRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeMaxRadius;
		static void ComputeMaxRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeMidPoint ******************/
		%feature("compactdefaultargs") ComputeMidPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeMidPoint;
		static void ComputeMidPoint(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeMinRadius ******************/
		%feature("compactdefaultargs") ComputeMinRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeMinRadius;
		static void ComputeMinRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeOffset ******************/
		%feature("compactdefaultargs") ComputeOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeOffset;
		static void ComputeOffset(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeOthers ******************/
		%feature("compactdefaultargs") ComputeOthers;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeOthers;
		static void ComputeOthers(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeParallel ******************/
		%feature("compactdefaultargs") ComputeParallel;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeParallel;
		static void ComputeParallel(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputePerpendicular ******************/
		%feature("compactdefaultargs") ComputePerpendicular;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputePerpendicular;
		static void ComputePerpendicular(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputePlacement ******************/
		%feature("compactdefaultargs") ComputePlacement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputePlacement;
		static void ComputePlacement(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeRadius ******************/
		%feature("compactdefaultargs") ComputeRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeRadius;
		static void ComputeRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeRound ******************/
		%feature("compactdefaultargs") ComputeRound;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeRound;
		static void ComputeRound(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeSymmetry ******************/
		%feature("compactdefaultargs") ComputeSymmetry;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeSymmetry;
		static void ComputeSymmetry(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeTangent ******************/
		%feature("compactdefaultargs") ComputeTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") ComputeTangent;
		static void ComputeTangent(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****************** ComputeTextAndValue ******************/
		%feature("compactdefaultargs") ComputeTextAndValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
aText: TCollection_ExtendedString
anIsAngle: bool

Returns
-------
aValue: float
") ComputeTextAndValue;
		static void ComputeTextAndValue(const opencascade::handle<TDataXtd_Constraint> & aConst, Standard_Real &OutValue, TCollection_ExtendedString & aText, const Standard_Boolean anIsAngle);

		/****************** UpdateOnlyValue ******************/
		%feature("compactdefaultargs") UpdateOnlyValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Returns
-------
None
") UpdateOnlyValue;
		static void UpdateOnlyValue(const opencascade::handle<TDataXtd_Constraint> & aConst, const opencascade::handle<AIS_InteractiveObject> & anAIS);

};


%extend TPrsStd_ConstraintTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TPrsStd_Driver *
***********************/
%nodefaultctor TPrsStd_Driver;
class TPrsStd_Driver : public Standard_Transient {
	public:
		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates the interactive object ais with information found on the attributes associated with the label l.

Parameters
----------
L: TDF_Label
ais: AIS_InteractiveObject

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const TDF_Label & L, opencascade::handle<AIS_InteractiveObject> & ais);

};


%make_alias(TPrsStd_Driver)

%extend TPrsStd_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TPrsStd_DriverTable *
****************************/
class TPrsStd_DriverTable : public Standard_Transient {
	public:
		/****************** TPrsStd_DriverTable ******************/
		%feature("compactdefaultargs") TPrsStd_DriverTable;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") TPrsStd_DriverTable;
		 TPrsStd_DriverTable();

		/****************** AddDriver ******************/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "Returns true if the driver has been added successfully to the driver table.

Parameters
----------
guid: Standard_GUID
driver: TPrsStd_Driver

Returns
-------
bool
") AddDriver;
		Standard_Boolean AddDriver(const Standard_GUID & guid, const opencascade::handle<TPrsStd_Driver> & driver);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all drivers. returns true if the driver has been removed successfully. if this method is used, the initstandarddrivers method should be called to fill the table with standard drivers.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FindDriver ******************/
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "Returns true if the driver was found.

Parameters
----------
guid: Standard_GUID
driver: TPrsStd_Driver

Returns
-------
bool
") FindDriver;
		Standard_Boolean FindDriver(const Standard_GUID & guid, opencascade::handle<TPrsStd_Driver> & driver);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the static table. if it does not exist, creates it and fills it with standard drivers.

Returns
-------
opencascade::handle<TPrsStd_DriverTable>
") Get;
		static opencascade::handle<TPrsStd_DriverTable> Get();

		/****************** InitStandardDrivers ******************/
		%feature("compactdefaultargs") InitStandardDrivers;
		%feature("autodoc", "Fills the table with standard drivers.

Returns
-------
None
") InitStandardDrivers;
		void InitStandardDrivers();

		/****************** RemoveDriver ******************/
		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "Removes a driver with the given guid. returns true if the driver has been removed successfully.

Parameters
----------
guid: Standard_GUID

Returns
-------
bool
") RemoveDriver;
		Standard_Boolean RemoveDriver(const Standard_GUID & guid);

};


%make_alias(TPrsStd_DriverTable)

%extend TPrsStd_DriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TPrsStd_AxisDriver *
***************************/
class TPrsStd_AxisDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_AxisDriver ******************/
		%feature("compactdefaultargs") TPrsStd_AxisDriver;
		%feature("autodoc", "Constructs an empty axis driver.

Returns
-------
None
") TPrsStd_AxisDriver;
		 TPrsStd_AxisDriver();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Build the aisobject (if null) or update it. no compute is done. returns <true> if informations was found and aisobject updated.

Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_AxisDriver)

%extend TPrsStd_AxisDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TPrsStd_ConstraintDriver *
*********************************/
class TPrsStd_ConstraintDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_ConstraintDriver ******************/
		%feature("compactdefaultargs") TPrsStd_ConstraintDriver;
		%feature("autodoc", "Constructs an empty constraint driver.

Returns
-------
None
") TPrsStd_ConstraintDriver;
		 TPrsStd_ConstraintDriver();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Build the aisobject (if null) or update it. no compute is done. returns <true> if informations was found and aisobject updated.

Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_ConstraintDriver)

%extend TPrsStd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TPrsStd_GeometryDriver *
*******************************/
class TPrsStd_GeometryDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_GeometryDriver ******************/
		%feature("compactdefaultargs") TPrsStd_GeometryDriver;
		%feature("autodoc", "Constructs an empty geometry driver.

Returns
-------
None
") TPrsStd_GeometryDriver;
		 TPrsStd_GeometryDriver();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Build the aisobject (if null) or update it. no compute is done. returns <true> if informations was found and aisobject updated.

Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_GeometryDriver)

%extend TPrsStd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TPrsStd_NamedShapeDriver *
*********************************/
class TPrsStd_NamedShapeDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_NamedShapeDriver ******************/
		%feature("compactdefaultargs") TPrsStd_NamedShapeDriver;
		%feature("autodoc", "Constructs an empty named shape driver.

Returns
-------
None
") TPrsStd_NamedShapeDriver;
		 TPrsStd_NamedShapeDriver();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Build the aisobject (if null) or update it. no compute is done. returns <true> if informations was found and aisobject updated.

Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_NamedShapeDriver)

%extend TPrsStd_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TPrsStd_PlaneDriver *
****************************/
class TPrsStd_PlaneDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_PlaneDriver ******************/
		%feature("compactdefaultargs") TPrsStd_PlaneDriver;
		%feature("autodoc", "Constructs an empty plane driver.

Returns
-------
None
") TPrsStd_PlaneDriver;
		 TPrsStd_PlaneDriver();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Build the aisobject (if null) or update it. no compute is done. returns <true> if informations was found and aisobject updated.

Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_PlaneDriver)

%extend TPrsStd_PlaneDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TPrsStd_PointDriver *
****************************/
class TPrsStd_PointDriver : public TPrsStd_Driver {
	public:
		/****************** TPrsStd_PointDriver ******************/
		%feature("compactdefaultargs") TPrsStd_PointDriver;
		%feature("autodoc", "Constructs an empty point driver.

Returns
-------
None
") TPrsStd_PointDriver;
		 TPrsStd_PointDriver();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Build the aisobject (if null) or update it. no compute is done. returns <true> if informations was found and aisobject updated.

Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

};


%make_alias(TPrsStd_PointDriver)

%extend TPrsStd_PointDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
