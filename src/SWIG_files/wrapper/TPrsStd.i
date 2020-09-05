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
		/**** md5 signature: 93fb592aa0c9ed40e6b71eaeb27a8016 ****/
		%feature("compactdefaultargs") TPrsStd_AISPresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TPrsStd_AISPresentation;
		 TPrsStd_AISPresentation();

		/****************** AddSelectionMode ******************/
		/**** md5 signature: 2f3915cde2340bc54ca93c55af007d81 ****/
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
		/**** md5 signature: b31825498767e26fb4d69f77ab94108b ****/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AfterAddition;
		virtual void AfterAddition();

		/****************** AfterResume ******************/
		/**** md5 signature: 1d4195e9b512e0fcd0e4fad379210118 ****/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") AfterResume;
		virtual void AfterResume();

		/****************** AfterUndo ******************/
		/**** md5 signature: 6a782c706f1e9291f121f77d889ed576 ****/
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
		/**** md5 signature: c0c9b77233d223451ec9a7e1bc2427c7 ****/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeForget ******************/
		/**** md5 signature: e5a78fffddf9fa82f6f158acce858991 ****/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BeforeForget;
		virtual void BeforeForget();

		/****************** BeforeRemoval ******************/
		/**** md5 signature: fb87f8354fd142d1ab3d9cd55ada4556 ****/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** BeforeUndo ******************/
		/**** md5 signature: d409c3f1c759e5fb3727056dd12910e7 ****/
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
		/**** md5 signature: 2e6350e3294b0d2b2e58bb8ded204984 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_NameOfColor
") Color;
		Quantity_NameOfColor Color();

		/****************** Display ******************/
		/**** md5 signature: 6d06b4a5445d280b65ed6ad92eb536f5 ****/
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
		/**** md5 signature: 78dc6861a924b64ddfaf44a115f8387a ****/
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
		/**** md5 signature: 923710b2c231db1bed7611daa65c993d ****/
		%feature("compactdefaultargs") GetAIS;
		%feature("autodoc", "Returns ais_interactiveobject stored in the presentation attribute.

Returns
-------
opencascade::handle<AIS_InteractiveObject>
") GetAIS;
		opencascade::handle<AIS_InteractiveObject> GetAIS();

		/****************** GetDriverGUID ******************/
		/**** md5 signature: 8cfb8f91ff622f4361276ad127a77d5c ****/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") GetDriverGUID;
		Standard_GUID GetDriverGUID();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for tprsstd_aispresentation attributes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNbSelectionModes ******************/
		/**** md5 signature: eb4c6588e6d12a452658a67633c2de5c ****/
		%feature("compactdefaultargs") GetNbSelectionModes;
		%feature("autodoc", "Returns selection mode(s) of the attribute. it starts with 1 .. getnbselectionmodes().

Returns
-------
int
") GetNbSelectionModes;
		Standard_Integer GetNbSelectionModes();

		/****************** HasOwnColor ******************/
		/**** md5 signature: 85391f94ad8ed41de9ce9852009b8711 ****/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "Returns true if this presentation attribute already has a color setting.

Returns
-------
bool
") HasOwnColor;
		Standard_Boolean HasOwnColor();

		/****************** HasOwnMaterial ******************/
		/**** md5 signature: 8effeb2715386f4facabb7e016d6f914 ****/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "Returns true if this presentation attribute already has a material setting.

Returns
-------
bool
") HasOwnMaterial;
		Standard_Boolean HasOwnMaterial();

		/****************** HasOwnMode ******************/
		/**** md5 signature: db54ff723646ecb3cccdfb673c54283e ****/
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnMode;
		Standard_Boolean HasOwnMode();

		/****************** HasOwnSelectionMode ******************/
		/**** md5 signature: ca04b4e9e4c94e4c0b6ce42053c9e30a ****/
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasOwnSelectionMode;
		Standard_Boolean HasOwnSelectionMode();

		/****************** HasOwnTransparency ******************/
		/**** md5 signature: 518151389a72b3ced0d8dc79dc662dca ****/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "Returns true if this presentation attribute already has a transparency setting.

Returns
-------
bool
") HasOwnTransparency;
		Standard_Boolean HasOwnTransparency();

		/****************** HasOwnWidth ******************/
		/**** md5 signature: 76ebaa4394d15efba17d3ac7ce584080 ****/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "Returns true if this presentation attribute already has a width setting.

Returns
-------
bool
") HasOwnWidth;
		Standard_Boolean HasOwnWidth();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsDisplayed ******************/
		/**** md5 signature: 04882eded547dac4e4f59f67e903fed8 ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Returns true if this ais presentation attribute is displayed.

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****************** Material ******************/
		/**** md5 signature: e50de5463c04095852f62d559d0d6104 ****/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Returns the material setting for this presentation attribute.

Returns
-------
Graphic3d_NameOfMaterial
") Material;
		Graphic3d_NameOfMaterial Material();

		/****************** Mode ******************/
		/**** md5 signature: d1320a8f2b0a14003883efd9407c24ac ****/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Mode;
		Standard_Integer Mode();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: eaeec5c5007ba0b6cda5dcd31d7352bb ****/
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
		/**** md5 signature: e5bd657a5fc71e829c278aed1e315025 ****/
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
		/**** md5 signature: b6ee20bd7be385e90e698c9d8ad970f7 ****/
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
		/**** md5 signature: c8455096abb52f0a92aeb6ff95572740 ****/
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
		/**** md5 signature: ed9aca4e9e7635ee7c2d8ea755cda117 ****/
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
		/**** md5 signature: 07186d86451e9b1ad5ad4848dd63f1dc ****/
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
		/**** md5 signature: 6bf2ae59a989b726bb703a8c21313103 ****/
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
		/**** md5 signature: fca52190dcdc18b7bad2a81829b4e979 ****/
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
		/**** md5 signature: 96f14deb237436f152baf69a8590e0a7 ****/
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
		/**** md5 signature: 60afac74b4b44a393595c4974eed3bd5 ****/
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
		/**** md5 signature: 241a01ddb40e85ceaaa56807348390c6 ****/
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
		/**** md5 signature: 395111f5ce5a38f6b8d6009c7b6b1222 ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Transparency;
		Standard_Real Transparency();

		/****************** Unset ******************/
		/**** md5 signature: 921291f6c49c0cffc7e0244b1e63638f ****/
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
		/**** md5 signature: 188f0bfeebabf5f6612a608155ee828e ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes the color setting from this presentation attribute.

Returns
-------
None
") UnsetColor;
		void UnsetColor();

		/****************** UnsetMaterial ******************/
		/**** md5 signature: c0ec6ffc2a0f74e3dfd084bbc939e3b7 ****/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Removes the material setting from this presentation attribute.

Returns
-------
None
") UnsetMaterial;
		void UnsetMaterial();

		/****************** UnsetMode ******************/
		/**** md5 signature: 1969d25bd6e2040bca56b4e996ca574d ****/
		%feature("compactdefaultargs") UnsetMode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetMode;
		void UnsetMode();

		/****************** UnsetSelectionMode ******************/
		/**** md5 signature: 89ddc27e00f0154704c54c8a8362ad8a ****/
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "Clears all selection modes of the attribute.

Returns
-------
None
") UnsetSelectionMode;
		void UnsetSelectionMode();

		/****************** UnsetTransparency ******************/
		/**** md5 signature: c02684ffb7b785f45f8ce50a07ea682d ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the transparency setting from this presentation attribute.

Returns
-------
None
") UnsetTransparency;
		void UnsetTransparency();

		/****************** UnsetWidth ******************/
		/**** md5 signature: 18cdd810cf848c52cf981cc677405046 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Removes the width setting from this presentation attribute.

Returns
-------
None
") UnsetWidth;
		void UnsetWidth();

		/****************** Update ******************/
		/**** md5 signature: 997c8dd85f474bf26af99d1a07d6fa3f ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Recompute presentation of object and apply the visualization settings.

Returns
-------
None
") Update;
		void Update();

		/****************** Width ******************/
		/**** md5 signature: e40fe8cb5cdcf41ad2ab06ede13e859b ****/
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
		/**** md5 signature: 622dfcd5672f8193825d9489427e3449 ****/
		%feature("compactdefaultargs") TPrsStd_AISViewer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TPrsStd_AISViewer;
		 TPrsStd_AISViewer();

		/****************** Find ******************/
		/**** md5 signature: 2c8b00fbc5f1685461f851faec89f5be ****/
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
		/**** md5 signature: b4a13f9a06a9968425273402b35608c8 ****/
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
		/**** md5 signature: 5e4585e095e2394e16d994227041d449 ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetInteractiveContext ******************/
		/**** md5 signature: f0d7133a119239e0651dcb473dcb735f ****/
		%feature("compactdefaultargs") GetInteractiveContext;
		%feature("autodoc", "Returns the interactive context in this attribute.

Returns
-------
opencascade::handle<AIS_InteractiveContext>
") GetInteractiveContext;
		opencascade::handle<AIS_InteractiveContext> GetInteractiveContext();

		/****************** Has ******************/
		/**** md5 signature: 50ae6e2d0e5e7cf8d8a39bf93358e95e ****/
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
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** New ******************/
		/**** md5 signature: 3cbb6f9af027bcb064aa04d3fb4f68e2 ****/
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
		/**** md5 signature: 7db7888e7f7c1e9f4b4a18f5a252607a ****/
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
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 4ee7baab1894ad287f737f59fa1e1ff0 ****/
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
		/**** md5 signature: ec3b815c5fcb0a79e19689fe393b75ad ****/
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
		/**** md5 signature: 254d448d1012d4fa968771bf451e27dd ****/
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
		/**** md5 signature: 78aa13c1ad8a8486e8b2a370e6c361a6 ****/
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
		/**** md5 signature: 389c39ec61b9f39e4b98ad323e439f43 ****/
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
		/**** md5 signature: e7e3c79d03c694ce175db3acd71aa4fd ****/
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
		/**** md5 signature: 50ac981b69ba6d86c79188283640c178 ****/
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
		/**** md5 signature: 2c7ef4df9648dc8d053e147dc96684d6 ****/
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
		/**** md5 signature: ad6ab79cfaf180785a401e5b8ba6f9aa ****/
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
		/**** md5 signature: 27f1689ae9f7240dbb9a8211335f5bc3 ****/
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
		/**** md5 signature: a7fd75d4ab37c60f45d84f86a985d82e ****/
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
		/**** md5 signature: 26f9484851b8d8c2852b2b0eaa269448 ****/
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
		/**** md5 signature: 374a09a359d2e5e8cb7398cd28b64b67 ****/
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
		/**** md5 signature: abb98b5c86c5028b6388964c0184d631 ****/
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
		/**** md5 signature: fbc35f7cd6283b42623340183d2b8fdc ****/
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
		/**** md5 signature: d3432bd11953785874a0d8b8e3ad3090 ****/
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
		/**** md5 signature: 58eb8518a5df09ad2da6c523694b61a3 ****/
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
		/**** md5 signature: c3a1d78b8cce5f8e1b511c89b7026256 ****/
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
		/**** md5 signature: 172b7582be96e38ec6b71661768da3e9 ****/
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
		/**** md5 signature: 0f15d1dc460b4835f9c7df007df876c7 ****/
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
		/**** md5 signature: 5ca94076ee1f7b8028195830daa24fbb ****/
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
		/**** md5 signature: 71bc32e420d344172b15e2c0ec9329ed ****/
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
		/**** md5 signature: 42eaef94a5b35e9daccb9965e0426d1d ****/
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
		/**** md5 signature: 21be43c81a841be3bb1136b94f215e70 ****/
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
		/**** md5 signature: 0c43116aea6ab0f468267e73e2e15e52 ****/
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
		/**** md5 signature: 441dd794ab0d41cca58389eb5551e4e1 ****/
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
		/**** md5 signature: 720e2b3214e2c09b74b7b798929d7b2d ****/
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
		/**** md5 signature: 3ebe7db3fa1ad888ffe271920d1938fb ****/
		%feature("compactdefaultargs") TPrsStd_DriverTable;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") TPrsStd_DriverTable;
		 TPrsStd_DriverTable();

		/****************** AddDriver ******************/
		/**** md5 signature: 57e848877c1d0ed6597591e008e61fa4 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all drivers. returns true if the driver has been removed successfully. if this method is used, the initstandarddrivers method should be called to fill the table with standard drivers.

Returns
-------
None
") Clear;
		void Clear();

		/****************** FindDriver ******************/
		/**** md5 signature: 4e7ae7b98710978e1e2171f74063de42 ****/
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
		/**** md5 signature: 4be723023d932da875065f65ed8d27cd ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the static table. if it does not exist, creates it and fills it with standard drivers.

Returns
-------
opencascade::handle<TPrsStd_DriverTable>
") Get;
		static opencascade::handle<TPrsStd_DriverTable> Get();

		/****************** InitStandardDrivers ******************/
		/**** md5 signature: fcc90cf06ee01f205e71005bb85cf675 ****/
		%feature("compactdefaultargs") InitStandardDrivers;
		%feature("autodoc", "Fills the table with standard drivers.

Returns
-------
None
") InitStandardDrivers;
		void InitStandardDrivers();

		/****************** RemoveDriver ******************/
		/**** md5 signature: 8877282d0bd047f322a30e981554f7e7 ****/
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
		/**** md5 signature: a5f749eb673eff93f64f241388b9a559 ****/
		%feature("compactdefaultargs") TPrsStd_AxisDriver;
		%feature("autodoc", "Constructs an empty axis driver.

Returns
-------
None
") TPrsStd_AxisDriver;
		 TPrsStd_AxisDriver();

		/****************** Update ******************/
		/**** md5 signature: a11e01f0b3cebd7e8f78a1af4a13714a ****/
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
		/**** md5 signature: e268323361cbef3a9f69acdb26a55e3e ****/
		%feature("compactdefaultargs") TPrsStd_ConstraintDriver;
		%feature("autodoc", "Constructs an empty constraint driver.

Returns
-------
None
") TPrsStd_ConstraintDriver;
		 TPrsStd_ConstraintDriver();

		/****************** Update ******************/
		/**** md5 signature: a11e01f0b3cebd7e8f78a1af4a13714a ****/
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
		/**** md5 signature: ab6433686ca9eede593934bec752124e ****/
		%feature("compactdefaultargs") TPrsStd_GeometryDriver;
		%feature("autodoc", "Constructs an empty geometry driver.

Returns
-------
None
") TPrsStd_GeometryDriver;
		 TPrsStd_GeometryDriver();

		/****************** Update ******************/
		/**** md5 signature: a11e01f0b3cebd7e8f78a1af4a13714a ****/
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
		/**** md5 signature: f88d8946107bec86bc893f188876b17b ****/
		%feature("compactdefaultargs") TPrsStd_NamedShapeDriver;
		%feature("autodoc", "Constructs an empty named shape driver.

Returns
-------
None
") TPrsStd_NamedShapeDriver;
		 TPrsStd_NamedShapeDriver();

		/****************** Update ******************/
		/**** md5 signature: a11e01f0b3cebd7e8f78a1af4a13714a ****/
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
		/**** md5 signature: 1d86bc4c182574e07d108120bb285688 ****/
		%feature("compactdefaultargs") TPrsStd_PlaneDriver;
		%feature("autodoc", "Constructs an empty plane driver.

Returns
-------
None
") TPrsStd_PlaneDriver;
		 TPrsStd_PlaneDriver();

		/****************** Update ******************/
		/**** md5 signature: a11e01f0b3cebd7e8f78a1af4a13714a ****/
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
		/**** md5 signature: 3ee5015eb1d3ee269f675a6ee33caa5a ****/
		%feature("compactdefaultargs") TPrsStd_PointDriver;
		%feature("autodoc", "Constructs an empty point driver.

Returns
-------
None
") TPrsStd_PointDriver;
		 TPrsStd_PointDriver();

		/****************** Update ******************/
		/**** md5 signature: a11e01f0b3cebd7e8f78a1af4a13714a ****/
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
