/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tprsstd.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
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

/* python proxy classes for enums */
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
%ignore NCollection_DataMap<Standard_GUID,opencascade::handle<TPrsStd_Driver>>::Items;
%ignore NCollection_DataMap<Standard_GUID,opencascade::handle<TPrsStd_Driver>>::KeyValues;
%template(TPrsStd_DataMapOfGUIDDriver) NCollection_DataMap<Standard_GUID,opencascade::handle<TPrsStd_Driver>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TPrsStd_Driver>>::Iterator TPrsStd_DataMapIteratorOfDataMapOfGUIDDriver;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TPrsStd_Driver>> TPrsStd_DataMapOfGUIDDriver;
/* end typedefs declaration */

/********************************
* class TPrsStd_AISPresentation *
********************************/
class TPrsStd_AISPresentation : public TDF_Attribute {
	public:
		/****** TPrsStd_AISPresentation::TPrsStd_AISPresentation ******/
		/****** md5 signature: 93fb592aa0c9ed40e6b71eaeb27a8016 ******/
		%feature("compactdefaultargs") TPrsStd_AISPresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TPrsStd_AISPresentation;
		 TPrsStd_AISPresentation();

		/****** TPrsStd_AISPresentation::AddSelectionMode ******/
		/****** md5 signature: 93f8db4a16ce5f33ce56141d19c3a2c3 ******/
		%feature("compactdefaultargs") AddSelectionMode;
		%feature("autodoc", "
Parameters
----------
theSelectionMode: int
theTransaction: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") AddSelectionMode;
		void AddSelectionMode(const int theSelectionMode, const bool theTransaction = true);

		/****** TPrsStd_AISPresentation::AfterAddition ******/
		/****** md5 signature: 677f303b9af6a36d9152349a9ea5b00e ******/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AfterAddition;
		void AfterAddition();

		/****** TPrsStd_AISPresentation::AfterResume ******/
		/****** md5 signature: 725997b4942a96537f8067a0c4d51cec ******/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AfterResume;
		void AfterResume();

		/****** TPrsStd_AISPresentation::AfterUndo ******/
		/****** md5 signature: 1c658357444dc4e0bd0f4b66ab6d7e3c ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to false)

Return
-------
bool

Description
-----------
update AIS viewer according to delta.
") AfterUndo;
		bool AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const bool forceIt = false);

		/****** TPrsStd_AISPresentation::BackupCopy ******/
		/****** md5 signature: 37a7ca5257c3a9e95a9390edd8c74378 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TPrsStd_AISPresentation::BeforeForget ******/
		/****** md5 signature: 62cb9500c708360c96952b8784c42662 ******/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BeforeForget;
		void BeforeForget();

		/****** TPrsStd_AISPresentation::BeforeRemoval ******/
		/****** md5 signature: 0f64ecdecef86a02045a45cc05d670d1 ******/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BeforeRemoval;
		void BeforeRemoval();

		/****** TPrsStd_AISPresentation::BeforeUndo ******/
		/****** md5 signature: 4022cd53002aaa4282f3bc50d4d2b7c9 ******/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to false)

Return
-------
bool

Description
-----------
No available documentation.
") BeforeUndo;
		bool BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const bool forceIt = false);

		/****** TPrsStd_AISPresentation::Color ******/
		/****** md5 signature: 2e6350e3294b0d2b2e58bb8ded204984 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_NameOfColor

Description
-----------
No available documentation.
") Color;
		Quantity_NameOfColor Color();

		/****** TPrsStd_AISPresentation::Display ******/
		/****** md5 signature: 7ab074aaf348ba845b584c30bba39769 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
update: bool (optional, default to false)

Return
-------
None

Description
-----------
Display presentation of object in AIS viewer. If <update> = True then AISObject is recomputed and all the visualization settings are applied.
") Display;
		void Display(const bool update = false);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TPrsStd_AISPresentation::Erase ******/
		/****** md5 signature: be1428cabf5122d04914e98b64777464 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "
Parameters
----------
remove: bool (optional, default to false)

Return
-------
None

Description
-----------
Removes the presentation of this AIS presentation attribute from the TPrsStd_AISViewer. If remove is true, this AIS presentation attribute is removed from the interactive context.
") Erase;
		void Erase(const bool remove = false);

		/****** TPrsStd_AISPresentation::GetAIS ******/
		/****** md5 signature: 923710b2c231db1bed7611daa65c993d ******/
		%feature("compactdefaultargs") GetAIS;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Returns AIS_InteractiveObject stored in the presentation attribute.
") GetAIS;
		opencascade::handle<AIS_InteractiveObject> GetAIS();

		/****** TPrsStd_AISPresentation::GetDriverGUID ******/
		/****** md5 signature: 8cfb8f91ff622f4361276ad127a77d5c ******/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetDriverGUID;
		Standard_GUID GetDriverGUID();

		/****** TPrsStd_AISPresentation::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for TPrsStd_AISPresentation attributes.
") GetID;
		static const Standard_GUID & GetID();

		/****** TPrsStd_AISPresentation::GetNbSelectionModes ******/
		/****** md5 signature: 99a39738238e4e23ef3a12766ba03ee4 ******/
		%feature("compactdefaultargs") GetNbSelectionModes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns selection mode(s) of the attribute. It starts with 1 .. GetNbSelectionModes().
") GetNbSelectionModes;
		int GetNbSelectionModes();

		/****** TPrsStd_AISPresentation::HasOwnColor ******/
		/****** md5 signature: f303300f0264bf37055acb1e9fb7a2c2 ******/
		%feature("compactdefaultargs") HasOwnColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this presentation attribute already has a color setting.
") HasOwnColor;
		bool HasOwnColor();

		/****** TPrsStd_AISPresentation::HasOwnMaterial ******/
		/****** md5 signature: 8b5caa1f734d1508e3e2629c0a75f8d5 ******/
		%feature("compactdefaultargs") HasOwnMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this presentation attribute already has a material setting.
") HasOwnMaterial;
		bool HasOwnMaterial();

		/****** TPrsStd_AISPresentation::HasOwnMode ******/
		/****** md5 signature: 5fb7d03e8183a31fbf9e9f252e858666 ******/
		%feature("compactdefaultargs") HasOwnMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnMode;
		bool HasOwnMode();

		/****** TPrsStd_AISPresentation::HasOwnSelectionMode ******/
		/****** md5 signature: b7f3a7c9a0a1e03ab92ae4d194d7664e ******/
		%feature("compactdefaultargs") HasOwnSelectionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasOwnSelectionMode;
		bool HasOwnSelectionMode();

		/****** TPrsStd_AISPresentation::HasOwnTransparency ******/
		/****** md5 signature: ff6189613aa25f291c98038cd6d052ec ******/
		%feature("compactdefaultargs") HasOwnTransparency;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this presentation attribute already has a transparency setting.
") HasOwnTransparency;
		bool HasOwnTransparency();

		/****** TPrsStd_AISPresentation::HasOwnWidth ******/
		/****** md5 signature: 38ab6940dfd75ba85e859f8a625bdcbd ******/
		%feature("compactdefaultargs") HasOwnWidth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this presentation attribute already has a width setting.
") HasOwnWidth;
		bool HasOwnWidth();

		/****** TPrsStd_AISPresentation::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TPrsStd_AISPresentation::IsDisplayed ******/
		/****** md5 signature: e13849d6809fc79274538f37bcdcee34 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this AIS presentation attribute is displayed.
") IsDisplayed;
		bool IsDisplayed();

		/****** TPrsStd_AISPresentation::Material ******/
		/****** md5 signature: e50de5463c04095852f62d559d0d6104 ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfMaterial

Description
-----------
Returns the material setting for this presentation attribute.
") Material;
		Graphic3d_NameOfMaterial Material();

		/****** TPrsStd_AISPresentation::Mode ******/
		/****** md5 signature: d5d38b16c9c176c269e106cc4f03f640 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Mode;
		int Mode();

		/****** TPrsStd_AISPresentation::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TPrsStd_AISPresentation::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TPrsStd_AISPresentation::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TPrsStd_AISPresentation::SelectionMode ******/
		/****** md5 signature: cfd3bc9d26b1f29e3b6bd48ec0a922c4 ******/
		%feature("compactdefaultargs") SelectionMode;
		%feature("autodoc", "
Parameters
----------
index: int (optional, default to 1)

Return
-------
int

Description
-----------
No available documentation.
") SelectionMode;
		int SelectionMode(const int index = 1);

		/****** TPrsStd_AISPresentation::Set ******/
		/****** md5 signature: e5bd657a5fc71e829c278aed1e315025 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
driver: Standard_GUID

Return
-------
opencascade::handle<TPrsStd_AISPresentation>

Description
-----------
Creates or retrieves the presentation attribute on the label L, and sets the GUID driver.
") Set;
		static opencascade::handle<TPrsStd_AISPresentation> Set(const TDF_Label & L, const Standard_GUID & driver);

		/****** TPrsStd_AISPresentation::Set ******/
		/****** md5 signature: b6ee20bd7be385e90e698c9d8ad970f7 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
master: TDF_Attribute

Return
-------
opencascade::handle<TPrsStd_AISPresentation>

Description
-----------
Creates or retrieves the AISPresentation attribute attached to master. The GUID of the driver will be the GUID of master. master is the attribute you want to display.
") Set;
		static opencascade::handle<TPrsStd_AISPresentation> Set(const opencascade::handle<TDF_Attribute> & master);

		/****** TPrsStd_AISPresentation::SetColor ******/
		/****** md5 signature: c8455096abb52f0a92aeb6ff95572740 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_NameOfColor

Return
-------
None

Description
-----------
Sets the color aColor for this presentation attribute.
") SetColor;
		void SetColor(const Quantity_NameOfColor aColor);

		/****** TPrsStd_AISPresentation::SetDisplayed ******/
		/****** md5 signature: d95b07cf41e2cb0672270496d51bcd41 ******/
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayed;
		void SetDisplayed(const bool B);

		/****** TPrsStd_AISPresentation::SetDriverGUID ******/
		/****** md5 signature: 07186d86451e9b1ad5ad4848dd63f1dc ******/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
None

Description
-----------
No available documentation.
") SetDriverGUID;
		void SetDriverGUID(const Standard_GUID & guid);

		/****** TPrsStd_AISPresentation::SetMaterial ******/
		/****** md5 signature: 6bf2ae59a989b726bb703a8c21313103 ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
aName: Graphic3d_NameOfMaterial

Return
-------
None

Description
-----------
Sets the material aName for this presentation attribute.
") SetMaterial;
		void SetMaterial(const Graphic3d_NameOfMaterial aName);

		/****** TPrsStd_AISPresentation::SetMode ******/
		/****** md5 signature: c1ad76d6ebccc46b32426f09aefa3bcd ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") SetMode;
		void SetMode(const int theMode);

		/****** TPrsStd_AISPresentation::SetSelectionMode ******/
		/****** md5 signature: 6b9b56ded1508c59a43f641e25f62159 ******/
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "
Parameters
----------
theSelectionMode: int
theTransaction: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets selection mode. If 'theTransaction' flag is OFF, modification of the attribute doesn't influence the transaction mechanism (the attribute doesn't participate in undo/redo because of this modification). Certainly, if any other data of the attribute is modified (display mode, color, ...), the attribute will be included into undo/redo.
") SetSelectionMode;
		void SetSelectionMode(const int theSelectionMode, const bool theTransaction = true);

		/****** TPrsStd_AISPresentation::SetTransparency ******/
		/****** md5 signature: b254bc92199fcd55cf9c2daf96d3649e ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
aValue: double (optional, default to 0.6)

Return
-------
None

Description
-----------
Sets the transparency value aValue for this presentation attribute. This value is 0.6 by default.
") SetTransparency;
		void SetTransparency(const double aValue = 0.6);

		/****** TPrsStd_AISPresentation::SetWidth ******/
		/****** md5 signature: ee0607ebb5cc5d325397bde68a8580c0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aWidth: double

Return
-------
None

Description
-----------
Sets the width aWidth for this presentation attribute.
") SetWidth;
		void SetWidth(const double aWidth);

		/****** TPrsStd_AISPresentation::Transparency ******/
		/****** md5 signature: 080317bfb744c0d6d6d612bb6c05010b ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Transparency;
		double Transparency();

		/****** TPrsStd_AISPresentation::Unset ******/
		/****** md5 signature: 921291f6c49c0cffc7e0244b1e63638f ******/
		%feature("compactdefaultargs") Unset;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Delete (if exist) the presentation attribute associated to the label <L>.
") Unset;
		static void Unset(const TDF_Label & L);

		/****** TPrsStd_AISPresentation::UnsetColor ******/
		/****** md5 signature: 188f0bfeebabf5f6612a608155ee828e ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the color setting from this presentation attribute.
") UnsetColor;
		void UnsetColor();

		/****** TPrsStd_AISPresentation::UnsetMaterial ******/
		/****** md5 signature: c0ec6ffc2a0f74e3dfd084bbc939e3b7 ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the material setting from this presentation attribute.
") UnsetMaterial;
		void UnsetMaterial();

		/****** TPrsStd_AISPresentation::UnsetMode ******/
		/****** md5 signature: 1969d25bd6e2040bca56b4e996ca574d ******/
		%feature("compactdefaultargs") UnsetMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetMode;
		void UnsetMode();

		/****** TPrsStd_AISPresentation::UnsetSelectionMode ******/
		/****** md5 signature: 89ddc27e00f0154704c54c8a8362ad8a ******/
		%feature("compactdefaultargs") UnsetSelectionMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all selection modes of the attribute.
") UnsetSelectionMode;
		void UnsetSelectionMode();

		/****** TPrsStd_AISPresentation::UnsetTransparency ******/
		/****** md5 signature: c02684ffb7b785f45f8ce50a07ea682d ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the transparency setting from this presentation attribute.
") UnsetTransparency;
		void UnsetTransparency();

		/****** TPrsStd_AISPresentation::UnsetWidth ******/
		/****** md5 signature: 18cdd810cf848c52cf981cc677405046 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the width setting from this presentation attribute.
") UnsetWidth;
		void UnsetWidth();

		/****** TPrsStd_AISPresentation::Update ******/
		/****** md5 signature: 997c8dd85f474bf26af99d1a07d6fa3f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recompute presentation of object and apply the visualization settings.
") Update;
		void Update();

		/****** TPrsStd_AISPresentation::Width ******/
		/****** md5 signature: 1fd4c6d3d33fbd8b282f769785a59bae ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Width;
		double Width();

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
		/****** TPrsStd_AISViewer::TPrsStd_AISViewer ******/
		/****** md5 signature: 622dfcd5672f8193825d9489427e3449 ******/
		%feature("compactdefaultargs") TPrsStd_AISViewer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TPrsStd_AISViewer;
		 TPrsStd_AISViewer();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TPrsStd_AISViewer::Find ******/
		/****** md5 signature: c2267931947f7bf8c8e35ae801ee14f1 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label
A: TPrsStd_AISViewer

Return
-------
bool

Description
-----------
Finds the viewer attribute at the label access, the root of the data framework. Calling this function can be used to initialize an AIS viewer.
") Find;
		static bool Find(const TDF_Label & acces, opencascade::handle<TPrsStd_AISViewer> & A);

		/****** TPrsStd_AISViewer::Find ******/
		/****** md5 signature: 56bc6185c30180200687dad393afe9d5 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label
IC: AIS_InteractiveContext

Return
-------
bool

Description
-----------
No available documentation.
") Find;
		static bool Find(const TDF_Label & acces, opencascade::handle<AIS_InteractiveContext> & IC);

		/****** TPrsStd_AISViewer::Find ******/
		/****** md5 signature: acd6dd81050ec23bc951a44ab0d626ee ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label
V: V3d_Viewer

Return
-------
bool

Description
-----------
No available documentation.
") Find;
		static bool Find(const TDF_Label & acces, opencascade::handle<V3d_Viewer> & V);

		/****** TPrsStd_AISViewer::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TPrsStd_AISViewer::GetInteractiveContext ******/
		/****** md5 signature: f0d7133a119239e0651dcb473dcb735f ******/
		%feature("compactdefaultargs") GetInteractiveContext;
		%feature("autodoc", "Return
-------
opencascade::handle<AIS_InteractiveContext>

Description
-----------
Returns the interactive context in this attribute.
") GetInteractiveContext;
		opencascade::handle<AIS_InteractiveContext> GetInteractiveContext();

		/****** TPrsStd_AISViewer::Has ******/
		/****** md5 signature: 4be26c703c22566df918a80d7bc3bd8a ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
bool

Description
-----------
returns True if there is an AISViewer attribute in <acces> Data Framework.
") Has;
		static bool Has(const TDF_Label & acces);

		/****** TPrsStd_AISViewer::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TPrsStd_AISViewer::New ******/
		/****** md5 signature: 3cbb6f9af027bcb064aa04d3fb4f68e2 ******/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
selector: AIS_InteractiveContext

Return
-------
opencascade::handle<TPrsStd_AISViewer>

Description
-----------
create and set an AISViewer at. Raise an exception if Has.
") New;
		static opencascade::handle<TPrsStd_AISViewer> New(const TDF_Label & access, const opencascade::handle<AIS_InteractiveContext> & selector);

		/****** TPrsStd_AISViewer::New ******/
		/****** md5 signature: 7db7888e7f7c1e9f4b4a18f5a252607a ******/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label
viewer: V3d_Viewer

Return
-------
opencascade::handle<TPrsStd_AISViewer>

Description
-----------
create and set an AISAttribute at root label. The interactive context is build. Raise an exception if Has.
") New;
		static opencascade::handle<TPrsStd_AISViewer> New(const TDF_Label & acces, const opencascade::handle<V3d_Viewer> & viewer);

		/****** TPrsStd_AISViewer::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TPrsStd_AISViewer::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TPrsStd_AISViewer::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TPrsStd_AISViewer::SetInteractiveContext ******/
		/****** md5 signature: 4ee7baab1894ad287f737f59fa1e1ff0 ******/
		%feature("compactdefaultargs") SetInteractiveContext;
		%feature("autodoc", "
Parameters
----------
ctx: AIS_InteractiveContext

Return
-------
None

Description
-----------
Sets the interactive context ctx for this attribute.
") SetInteractiveContext;
		void SetInteractiveContext(const opencascade::handle<AIS_InteractiveContext> & ctx);

		/****** TPrsStd_AISViewer::Update ******/
		/****** md5 signature: ec3b815c5fcb0a79e19689fe393b75ad ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
None

Description
-----------
AISViewer methods =================.
") Update;
		static void Update(const TDF_Label & acces);

		/****** TPrsStd_AISViewer::Update ******/
		/****** md5 signature: 254d448d1012d4fa968771bf451e27dd ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the viewer at the label access. access is the root of the data framework.
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
		/****** TPrsStd_ConstraintTools::ComputeAngle ******/
		/****** md5 signature: 2772720771c6260493a91325cb3502a9 ******/
		%feature("compactdefaultargs") ComputeAngle;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes an angle dimension presentation for the given constraint. 
Input parameter: aConst the angle constraint 
Return: interactive object representing the angle, or null handle on failure.
") ComputeAngle;
		static opencascade::handle<AIS_InteractiveObject> ComputeAngle(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeAngle ******/
		/****** md5 signature: 78aa13c1ad8a8486e8b2a370e6c361a6 ******/
		%feature("compactdefaultargs") ComputeAngle;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeAngle;
		static void ComputeAngle(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeAngleForOneFace ******/
		/****** md5 signature: 71e96f26b9b2d53ff1f0609040cc7682 ******/
		%feature("compactdefaultargs") ComputeAngleForOneFace;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes an angle dimension presentation for a single-face constraint. 
Input parameter: aConst the angle constraint on one face 
Return: interactive object representing the angle, or null handle on failure.
") ComputeAngleForOneFace;
		static opencascade::handle<AIS_InteractiveObject> ComputeAngleForOneFace(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeAngleForOneFace ******/
		/****** md5 signature: 389c39ec61b9f39e4b98ad323e439f43 ******/
		%feature("compactdefaultargs") ComputeAngleForOneFace;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeAngleForOneFace;
		static void ComputeAngleForOneFace(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeCoincident ******/
		/****** md5 signature: 8c5d46537b367afc0a7ca87935a30f28 ******/
		%feature("compactdefaultargs") ComputeCoincident;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a coincident relation presentation for the given constraint. 
Input parameter: aConst the coincident constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeCoincident;
		static opencascade::handle<AIS_InteractiveObject> ComputeCoincident(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeCoincident ******/
		/****** md5 signature: e7e3c79d03c694ce175db3acd71aa4fd ******/
		%feature("compactdefaultargs") ComputeCoincident;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeCoincident;
		static void ComputeCoincident(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeConcentric ******/
		/****** md5 signature: f4cc71d0af8156d02b2c60cdb178127d ******/
		%feature("compactdefaultargs") ComputeConcentric;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a concentric relation presentation for the given constraint. 
Input parameter: aConst the concentric constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeConcentric;
		static opencascade::handle<AIS_InteractiveObject> ComputeConcentric(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeConcentric ******/
		/****** md5 signature: 50ac981b69ba6d86c79188283640c178 ******/
		%feature("compactdefaultargs") ComputeConcentric;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeConcentric;
		static void ComputeConcentric(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeDiameter ******/
		/****** md5 signature: 428071178686d78be8fce086df27f1f9 ******/
		%feature("compactdefaultargs") ComputeDiameter;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a diameter dimension presentation for the given constraint. 
Input parameter: aConst the diameter constraint 
Return: interactive object representing the diameter, or null handle on failure.
") ComputeDiameter;
		static opencascade::handle<AIS_InteractiveObject> ComputeDiameter(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeDiameter ******/
		/****** md5 signature: 2c7ef4df9648dc8d053e147dc96684d6 ******/
		%feature("compactdefaultargs") ComputeDiameter;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeDiameter;
		static void ComputeDiameter(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeDistance ******/
		/****** md5 signature: 25975f75c8a22b7dc9f22c5ab2687fa7 ******/
		%feature("compactdefaultargs") ComputeDistance;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a distance dimension presentation for the given constraint. 
Input parameter: aConst the distance constraint 
Return: interactive object representing the distance, or null handle on failure.
") ComputeDistance;
		static opencascade::handle<AIS_InteractiveObject> ComputeDistance(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeDistance ******/
		/****** md5 signature: ad6ab79cfaf180785a401e5b8ba6f9aa ******/
		%feature("compactdefaultargs") ComputeDistance;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeDistance;
		static void ComputeDistance(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeEqualDistance ******/
		/****** md5 signature: 147757d0fc2baa31a61f824ff09cc237 ******/
		%feature("compactdefaultargs") ComputeEqualDistance;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes an equal distance relation presentation for the given constraint. 
Input parameter: aConst the equal distance constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeEqualDistance;
		static opencascade::handle<AIS_InteractiveObject> ComputeEqualDistance(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeEqualDistance ******/
		/****** md5 signature: 27f1689ae9f7240dbb9a8211335f5bc3 ******/
		%feature("compactdefaultargs") ComputeEqualDistance;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeEqualDistance;
		static void ComputeEqualDistance(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeEqualRadius ******/
		/****** md5 signature: bd8853f11b14edce0cf9428db08b578e ******/
		%feature("compactdefaultargs") ComputeEqualRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes an equal radius relation presentation for the given constraint. 
Input parameter: aConst the equal radius constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeEqualRadius;
		static opencascade::handle<AIS_InteractiveObject> ComputeEqualRadius(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeEqualRadius ******/
		/****** md5 signature: a7fd75d4ab37c60f45d84f86a985d82e ******/
		%feature("compactdefaultargs") ComputeEqualRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeEqualRadius;
		static void ComputeEqualRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeFix ******/
		/****** md5 signature: 8a93ef15bbd9655820238e00b4ab6521 ******/
		%feature("compactdefaultargs") ComputeFix;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a fix constraint presentation for the given constraint. 
Input parameter: aConst the fix constraint 
Return: interactive object representing the constraint, or null handle on failure.
") ComputeFix;
		static opencascade::handle<AIS_InteractiveObject> ComputeFix(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeFix ******/
		/****** md5 signature: 26f9484851b8d8c2852b2b0eaa269448 ******/
		%feature("compactdefaultargs") ComputeFix;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeFix;
		static void ComputeFix(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeMaxRadius ******/
		/****** md5 signature: 7ad7378af661b64d01c118b73740f060 ******/
		%feature("compactdefaultargs") ComputeMaxRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a major radius dimension presentation for the given constraint. 
Input parameter: aConst the major radius constraint 
Return: interactive object representing the major radius, or null handle on failure.
") ComputeMaxRadius;
		static opencascade::handle<AIS_InteractiveObject> ComputeMaxRadius(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeMaxRadius ******/
		/****** md5 signature: 374a09a359d2e5e8cb7398cd28b64b67 ******/
		%feature("compactdefaultargs") ComputeMaxRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeMaxRadius;
		static void ComputeMaxRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeMidPoint ******/
		/****** md5 signature: 6013440c857b26c3343a1d4f09233d13 ******/
		%feature("compactdefaultargs") ComputeMidPoint;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a midpoint relation presentation for the given constraint. 
Input parameter: aConst the midpoint constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeMidPoint;
		static opencascade::handle<AIS_InteractiveObject> ComputeMidPoint(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeMidPoint ******/
		/****** md5 signature: abb98b5c86c5028b6388964c0184d631 ******/
		%feature("compactdefaultargs") ComputeMidPoint;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeMidPoint;
		static void ComputeMidPoint(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeMinRadius ******/
		/****** md5 signature: 2dacc1bf99ef621f48d5f640163eeb4e ******/
		%feature("compactdefaultargs") ComputeMinRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a minor radius dimension presentation for the given constraint. 
Input parameter: aConst the minor radius constraint 
Return: interactive object representing the minor radius, or null handle on failure.
") ComputeMinRadius;
		static opencascade::handle<AIS_InteractiveObject> ComputeMinRadius(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeMinRadius ******/
		/****** md5 signature: fbc35f7cd6283b42623340183d2b8fdc ******/
		%feature("compactdefaultargs") ComputeMinRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeMinRadius;
		static void ComputeMinRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeOffset ******/
		/****** md5 signature: da9a1abac1b6490ddff74908ef83932d ******/
		%feature("compactdefaultargs") ComputeOffset;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes an offset relation presentation for the given constraint. 
Input parameter: aConst the offset constraint 
Return: interactive object representing the offset, or null handle on failure.
") ComputeOffset;
		static opencascade::handle<AIS_InteractiveObject> ComputeOffset(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeOffset ******/
		/****** md5 signature: d3432bd11953785874a0d8b8e3ad3090 ******/
		%feature("compactdefaultargs") ComputeOffset;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeOffset;
		static void ComputeOffset(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeOthers ******/
		/****** md5 signature: a44465cc3afc65abca94ee1305d7717c ******/
		%feature("compactdefaultargs") ComputeOthers;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a presentation for constraint types not handled by specific methods. 
Input parameter: aConst the constraint 
Return: interactive object representing the constraint, or null handle on failure.
") ComputeOthers;
		static opencascade::handle<AIS_InteractiveObject> ComputeOthers(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeOthers ******/
		/****** md5 signature: 58eb8518a5df09ad2da6c523694b61a3 ******/
		%feature("compactdefaultargs") ComputeOthers;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeOthers;
		static void ComputeOthers(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeParallel ******/
		/****** md5 signature: 53259d71b56800b580b2d61edad92c24 ******/
		%feature("compactdefaultargs") ComputeParallel;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a parallel relation presentation for the given constraint. 
Input parameter: aConst the parallel constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeParallel;
		static opencascade::handle<AIS_InteractiveObject> ComputeParallel(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeParallel ******/
		/****** md5 signature: c3a1d78b8cce5f8e1b511c89b7026256 ******/
		%feature("compactdefaultargs") ComputeParallel;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeParallel;
		static void ComputeParallel(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputePerpendicular ******/
		/****** md5 signature: 0f815bbdde5df4bf4e8846e7d90768e1 ******/
		%feature("compactdefaultargs") ComputePerpendicular;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a perpendicular relation presentation for the given constraint. 
Input parameter: aConst the perpendicular constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputePerpendicular;
		static opencascade::handle<AIS_InteractiveObject> ComputePerpendicular(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputePerpendicular ******/
		/****** md5 signature: 172b7582be96e38ec6b71661768da3e9 ******/
		%feature("compactdefaultargs") ComputePerpendicular;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputePerpendicular;
		static void ComputePerpendicular(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputePlacement ******/
		/****** md5 signature: c1be8354247bc9ea283e76869ac654a5 ******/
		%feature("compactdefaultargs") ComputePlacement;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a placement relation presentation for the given constraint. 
Input parameter: aConst the placement constraint 
Return: interactive object representing the placement, or null handle on failure.
") ComputePlacement;
		static opencascade::handle<AIS_InteractiveObject> ComputePlacement(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputePlacement ******/
		/****** md5 signature: 0f15d1dc460b4835f9c7df007df876c7 ******/
		%feature("compactdefaultargs") ComputePlacement;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputePlacement;
		static void ComputePlacement(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeRadius ******/
		/****** md5 signature: f065b89cfc33a0143fda9b712f00d6f4 ******/
		%feature("compactdefaultargs") ComputeRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a radius dimension presentation for the given constraint. 
Input parameter: aConst the radius constraint 
Return: interactive object representing the radius, or null handle on failure.
") ComputeRadius;
		static opencascade::handle<AIS_InteractiveObject> ComputeRadius(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeRadius ******/
		/****** md5 signature: 5ca94076ee1f7b8028195830daa24fbb ******/
		%feature("compactdefaultargs") ComputeRadius;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeRadius;
		static void ComputeRadius(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeRound ******/
		/****** md5 signature: df92446c557f85a82bd449e341b27a50 ******/
		%feature("compactdefaultargs") ComputeRound;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a round (fillet) relation presentation for the given constraint. 
Input parameter: aConst the round constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeRound;
		static opencascade::handle<AIS_InteractiveObject> ComputeRound(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeRound ******/
		/****** md5 signature: 71bc32e420d344172b15e2c0ec9329ed ******/
		%feature("compactdefaultargs") ComputeRound;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeRound;
		static void ComputeRound(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeSymmetry ******/
		/****** md5 signature: 47547c35ecda3aee7bbc88849d7f280d ******/
		%feature("compactdefaultargs") ComputeSymmetry;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a symmetry relation presentation for the given constraint. 
Input parameter: aConst the symmetry constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeSymmetry;
		static opencascade::handle<AIS_InteractiveObject> ComputeSymmetry(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeSymmetry ******/
		/****** md5 signature: 42eaef94a5b35e9daccb9965e0426d1d ******/
		%feature("compactdefaultargs") ComputeSymmetry;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeSymmetry;
		static void ComputeSymmetry(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeTangent ******/
		/****** md5 signature: 08d75ecaa3d8b0183d4f886fe128c709 ******/
		%feature("compactdefaultargs") ComputeTangent;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint

Return
-------
opencascade::handle<AIS_InteractiveObject>

Description
-----------
Computes a tangent relation presentation for the given constraint. 
Input parameter: aConst the tangent constraint 
Return: interactive object representing the relation, or null handle on failure.
") ComputeTangent;
		static opencascade::handle<AIS_InteractiveObject> ComputeTangent(const opencascade::handle<TDataXtd_Constraint> & aConst);

		/****** TPrsStd_ConstraintTools::ComputeTangent ******/
		/****** md5 signature: 21be43c81a841be3bb1136b94f215e70 ******/
		%feature("compactdefaultargs") ComputeTangent;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
") ComputeTangent;
		static void ComputeTangent(const opencascade::handle<TDataXtd_Constraint> & aConst, opencascade::handle<AIS_InteractiveObject> & anAIS);

		/****** TPrsStd_ConstraintTools::ComputeTextAndValue ******/
		/****** md5 signature: e0c6d2fde9d3c5132f71fdea94c628de ******/
		%feature("compactdefaultargs") ComputeTextAndValue;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
aText: str
anIsAngle: bool

Return
-------
aValue: double

Description
-----------
No available documentation.
") ComputeTextAndValue;
		static void ComputeTextAndValue(const opencascade::handle<TDataXtd_Constraint> & aConst, Standard_Real &OutValue, TCollection_ExtendedString & aText, const bool anIsAngle);

		/****** TPrsStd_ConstraintTools::UpdateOnlyValue ******/
		/****** md5 signature: 441dd794ab0d41cca58389eb5551e4e1 ******/
		%feature("compactdefaultargs") UpdateOnlyValue;
		%feature("autodoc", "
Parameters
----------
aConst: TDataXtd_Constraint
anAIS: AIS_InteractiveObject

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TPrsStd_Driver::Update ******/
		/****** md5 signature: 7868e5011b04f0342d55b95768c059c9 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
ais: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Updates the interactive object ais with information found on the attributes associated with the label L.
") Update;
		virtual bool Update(const TDF_Label & L, opencascade::handle<AIS_InteractiveObject> & ais);

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
		/****** TPrsStd_DriverTable::TPrsStd_DriverTable ******/
		/****** md5 signature: 3ebe7db3fa1ad888ffe271920d1938fb ******/
		%feature("compactdefaultargs") TPrsStd_DriverTable;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") TPrsStd_DriverTable;
		 TPrsStd_DriverTable();

		/****** TPrsStd_DriverTable::AddDriver ******/
		/****** md5 signature: 2ab53bd13aa4d824cb9b06ddaec85847 ******/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID
driver: TPrsStd_Driver

Return
-------
bool

Description
-----------
Returns true if the driver has been added successfully to the driver table.
") AddDriver;
		bool AddDriver(const Standard_GUID & guid, const opencascade::handle<TPrsStd_Driver> & driver);

		/****** TPrsStd_DriverTable::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all drivers. Returns true if the driver has been removed successfully. If this method is used, the InitStandardDrivers method should be called to fill the table with standard drivers.
") Clear;
		void Clear();

		/****** TPrsStd_DriverTable::FindDriver ******/
		/****** md5 signature: 51f236f3a7a28b12736ba95d630e2aca ******/
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID
driver: TPrsStd_Driver

Return
-------
bool

Description
-----------
Returns true if the driver was found.
") FindDriver;
		bool FindDriver(const Standard_GUID & guid, opencascade::handle<TPrsStd_Driver> & driver);

		/****** TPrsStd_DriverTable::Get ******/
		/****** md5 signature: 4be723023d932da875065f65ed8d27cd ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
opencascade::handle<TPrsStd_DriverTable>

Description
-----------
Returns the static table. If it does not exist, creates it and fills it with standard drivers.
") Get;
		static opencascade::handle<TPrsStd_DriverTable> Get();

		/****** TPrsStd_DriverTable::InitStandardDrivers ******/
		/****** md5 signature: fcc90cf06ee01f205e71005bb85cf675 ******/
		%feature("compactdefaultargs") InitStandardDrivers;
		%feature("autodoc", "Return
-------
None

Description
-----------
Fills the table with standard drivers.
") InitStandardDrivers;
		void InitStandardDrivers();

		/****** TPrsStd_DriverTable::RemoveDriver ******/
		/****** md5 signature: d834e0a7bc48bfc7a501e2250cf58956 ******/
		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
bool

Description
-----------
Removes a driver with the given GUID. Returns true if the driver has been removed successfully.
") RemoveDriver;
		bool RemoveDriver(const Standard_GUID & guid);

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
		/****** TPrsStd_AxisDriver::TPrsStd_AxisDriver ******/
		/****** md5 signature: a5f749eb673eff93f64f241388b9a559 ******/
		%feature("compactdefaultargs") TPrsStd_AxisDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty axis driver.
") TPrsStd_AxisDriver;
		 TPrsStd_AxisDriver();

		/****** TPrsStd_AxisDriver::Update ******/
		/****** md5 signature: f21a406cfed5e6efa9471b32889e0a50 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Build the AISObject (if null) or update it. No compute is done. Returns <True> if information was found and AISObject updated.
") Update;
		bool Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

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
		/****** TPrsStd_ConstraintDriver::TPrsStd_ConstraintDriver ******/
		/****** md5 signature: e268323361cbef3a9f69acdb26a55e3e ******/
		%feature("compactdefaultargs") TPrsStd_ConstraintDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty constraint driver.
") TPrsStd_ConstraintDriver;
		 TPrsStd_ConstraintDriver();

		/****** TPrsStd_ConstraintDriver::Update ******/
		/****** md5 signature: f21a406cfed5e6efa9471b32889e0a50 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Build the AISObject (if null) or update it. No compute is done. Returns <True> if information was found and AISObject updated.
") Update;
		bool Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

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
		/****** TPrsStd_GeometryDriver::TPrsStd_GeometryDriver ******/
		/****** md5 signature: ab6433686ca9eede593934bec752124e ******/
		%feature("compactdefaultargs") TPrsStd_GeometryDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty geometry driver.
") TPrsStd_GeometryDriver;
		 TPrsStd_GeometryDriver();

		/****** TPrsStd_GeometryDriver::Update ******/
		/****** md5 signature: f21a406cfed5e6efa9471b32889e0a50 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Build the AISObject (if null) or update it. No compute is done. Returns <True> if information was found and AISObject updated.
") Update;
		bool Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

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
		/****** TPrsStd_NamedShapeDriver::TPrsStd_NamedShapeDriver ******/
		/****** md5 signature: f88d8946107bec86bc893f188876b17b ******/
		%feature("compactdefaultargs") TPrsStd_NamedShapeDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty named shape driver.
") TPrsStd_NamedShapeDriver;
		 TPrsStd_NamedShapeDriver();

		/****** TPrsStd_NamedShapeDriver::Update ******/
		/****** md5 signature: f21a406cfed5e6efa9471b32889e0a50 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Build the AISObject (if null) or update it. No compute is done. Returns <True> if information was found and AISObject updated.
") Update;
		bool Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

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
		/****** TPrsStd_PlaneDriver::TPrsStd_PlaneDriver ******/
		/****** md5 signature: 1d86bc4c182574e07d108120bb285688 ******/
		%feature("compactdefaultargs") TPrsStd_PlaneDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty plane driver.
") TPrsStd_PlaneDriver;
		 TPrsStd_PlaneDriver();

		/****** TPrsStd_PlaneDriver::Update ******/
		/****** md5 signature: f21a406cfed5e6efa9471b32889e0a50 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Build the AISObject (if null) or update it. No compute is done. Returns <True> if information was found and AISObject updated.
") Update;
		bool Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

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
		/****** TPrsStd_PointDriver::TPrsStd_PointDriver ******/
		/****** md5 signature: 3ee5015eb1d3ee269f675a6ee33caa5a ******/
		%feature("compactdefaultargs") TPrsStd_PointDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty point driver.
") TPrsStd_PointDriver;
		 TPrsStd_PointDriver();

		/****** TPrsStd_PointDriver::Update ******/
		/****** md5 signature: f21a406cfed5e6efa9471b32889e0a50 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anAISObject: AIS_InteractiveObject

Return
-------
bool

Description
-----------
Build the AISObject (if null) or update it. No compute is done. Returns <True> if information was found and AISObject updated.
") Update;
		bool Update(const TDF_Label & aLabel, opencascade::handle<AIS_InteractiveObject> & anAISObject);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def TPrsStd_AISPresentation_GetID(*args):
	return TPrsStd_AISPresentation.GetID(*args)

@deprecated
def TPrsStd_AISPresentation_Set(*args):
	return TPrsStd_AISPresentation.Set(*args)

@deprecated
def TPrsStd_AISPresentation_Set(*args):
	return TPrsStd_AISPresentation.Set(*args)

@deprecated
def TPrsStd_AISPresentation_Unset(*args):
	return TPrsStd_AISPresentation.Unset(*args)

@deprecated
def TPrsStd_AISViewer_Find(*args):
	return TPrsStd_AISViewer.Find(*args)

@deprecated
def TPrsStd_AISViewer_Find(*args):
	return TPrsStd_AISViewer.Find(*args)

@deprecated
def TPrsStd_AISViewer_Find(*args):
	return TPrsStd_AISViewer.Find(*args)

@deprecated
def TPrsStd_AISViewer_GetID(*args):
	return TPrsStd_AISViewer.GetID(*args)

@deprecated
def TPrsStd_AISViewer_Has(*args):
	return TPrsStd_AISViewer.Has(*args)

@deprecated
def TPrsStd_AISViewer_New(*args):
	return TPrsStd_AISViewer.New(*args)

@deprecated
def TPrsStd_AISViewer_New(*args):
	return TPrsStd_AISViewer.New(*args)

@deprecated
def TPrsStd_AISViewer_Update(*args):
	return TPrsStd_AISViewer.Update(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeAngle(*args):
	return TPrsStd_ConstraintTools.ComputeAngle(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeAngle(*args):
	return TPrsStd_ConstraintTools.ComputeAngle(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeAngleForOneFace(*args):
	return TPrsStd_ConstraintTools.ComputeAngleForOneFace(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeAngleForOneFace(*args):
	return TPrsStd_ConstraintTools.ComputeAngleForOneFace(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeCoincident(*args):
	return TPrsStd_ConstraintTools.ComputeCoincident(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeCoincident(*args):
	return TPrsStd_ConstraintTools.ComputeCoincident(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeConcentric(*args):
	return TPrsStd_ConstraintTools.ComputeConcentric(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeConcentric(*args):
	return TPrsStd_ConstraintTools.ComputeConcentric(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeDiameter(*args):
	return TPrsStd_ConstraintTools.ComputeDiameter(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeDiameter(*args):
	return TPrsStd_ConstraintTools.ComputeDiameter(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeDistance(*args):
	return TPrsStd_ConstraintTools.ComputeDistance(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeDistance(*args):
	return TPrsStd_ConstraintTools.ComputeDistance(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeEqualDistance(*args):
	return TPrsStd_ConstraintTools.ComputeEqualDistance(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeEqualDistance(*args):
	return TPrsStd_ConstraintTools.ComputeEqualDistance(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeEqualRadius(*args):
	return TPrsStd_ConstraintTools.ComputeEqualRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeEqualRadius(*args):
	return TPrsStd_ConstraintTools.ComputeEqualRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeFix(*args):
	return TPrsStd_ConstraintTools.ComputeFix(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeFix(*args):
	return TPrsStd_ConstraintTools.ComputeFix(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeMaxRadius(*args):
	return TPrsStd_ConstraintTools.ComputeMaxRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeMaxRadius(*args):
	return TPrsStd_ConstraintTools.ComputeMaxRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeMidPoint(*args):
	return TPrsStd_ConstraintTools.ComputeMidPoint(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeMidPoint(*args):
	return TPrsStd_ConstraintTools.ComputeMidPoint(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeMinRadius(*args):
	return TPrsStd_ConstraintTools.ComputeMinRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeMinRadius(*args):
	return TPrsStd_ConstraintTools.ComputeMinRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeOffset(*args):
	return TPrsStd_ConstraintTools.ComputeOffset(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeOffset(*args):
	return TPrsStd_ConstraintTools.ComputeOffset(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeOthers(*args):
	return TPrsStd_ConstraintTools.ComputeOthers(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeOthers(*args):
	return TPrsStd_ConstraintTools.ComputeOthers(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeParallel(*args):
	return TPrsStd_ConstraintTools.ComputeParallel(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeParallel(*args):
	return TPrsStd_ConstraintTools.ComputeParallel(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputePerpendicular(*args):
	return TPrsStd_ConstraintTools.ComputePerpendicular(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputePerpendicular(*args):
	return TPrsStd_ConstraintTools.ComputePerpendicular(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputePlacement(*args):
	return TPrsStd_ConstraintTools.ComputePlacement(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputePlacement(*args):
	return TPrsStd_ConstraintTools.ComputePlacement(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeRadius(*args):
	return TPrsStd_ConstraintTools.ComputeRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeRadius(*args):
	return TPrsStd_ConstraintTools.ComputeRadius(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeRound(*args):
	return TPrsStd_ConstraintTools.ComputeRound(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeRound(*args):
	return TPrsStd_ConstraintTools.ComputeRound(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeSymmetry(*args):
	return TPrsStd_ConstraintTools.ComputeSymmetry(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeSymmetry(*args):
	return TPrsStd_ConstraintTools.ComputeSymmetry(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeTangent(*args):
	return TPrsStd_ConstraintTools.ComputeTangent(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeTangent(*args):
	return TPrsStd_ConstraintTools.ComputeTangent(*args)

@deprecated
def TPrsStd_ConstraintTools_ComputeTextAndValue(*args):
	return TPrsStd_ConstraintTools.ComputeTextAndValue(*args)

@deprecated
def TPrsStd_ConstraintTools_UpdateOnlyValue(*args):
	return TPrsStd_ConstraintTools.UpdateOnlyValue(*args)

@deprecated
def TPrsStd_DriverTable_Get(*args):
	return TPrsStd_DriverTable.Get(*args)

}
