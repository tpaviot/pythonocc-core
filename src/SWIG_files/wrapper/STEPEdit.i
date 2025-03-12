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
%define STEPEDITDOCSTRING
"STEPEdit module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepedit.html"
%enddef
%module (package="OCC.Core", docstring=STEPEDITDOCSTRING) STEPEdit


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
#include<STEPEdit_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<IFSelect_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepData_module.hxx>
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
%import StepData.i
%import IFSelect.i
%import Interface.i
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
%wrap_handle(STEPEdit_EditContext)
%wrap_handle(STEPEdit_EditSDR)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class STEPEdit *
*****************/
%rename(stepedit) STEPEdit;
class STEPEdit {
	public:
		/****** STEPEdit::NewModel ******/
		/****** md5 signature: 5d046f8a896b3925176ec22e8b9b5c68 ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_StepModel>

Description
-----------
Returns a new empty StepModel fit for STEP i.e. with its header determined from Protocol.
") NewModel;
		static opencascade::handle<StepData_StepModel> NewModel();

		/****** STEPEdit::NewSelectPlacedItem ******/
		/****** md5 signature: 2d905a578b7702668578d94356db642f ******/
		%feature("compactdefaultargs") NewSelectPlacedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SelectSignature>

Description
-----------
Creates a Selection for Placed Items, i.e. MappedItem or ContextDependentShapeRepresentation, which itself refers to a RepresentationRelationship with possible subtypes (Shape... and/or ...WithTransformation) By default in the whole StepModel.
") NewSelectPlacedItem;
		static opencascade::handle<IFSelect_SelectSignature> NewSelectPlacedItem();

		/****** STEPEdit::NewSelectSDR ******/
		/****** md5 signature: 37e258563c0ffa07a2c764f11d79dba9 ******/
		%feature("compactdefaultargs") NewSelectSDR;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SelectSignature>

Description
-----------
Creates a Selection for ShapeDefinitionRepresentation By default searches among root entities.
") NewSelectSDR;
		static opencascade::handle<IFSelect_SelectSignature> NewSelectSDR();

		/****** STEPEdit::NewSelectShapeRepr ******/
		/****** md5 signature: c0c5219f2d5d67e4325e19633e361b20 ******/
		%feature("compactdefaultargs") NewSelectShapeRepr;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_SelectSignature>

Description
-----------
Creates a Selection for ShapeRepresentation and its sub-types, plus ContextDependentShapeRepresentation (which is not a sub-type of ShapeRepresentation) By default in the whole StepModel.
") NewSelectShapeRepr;
		static opencascade::handle<IFSelect_SelectSignature> NewSelectShapeRepr();

		/****** STEPEdit::Protocol ******/
		/****** md5 signature: 31c7a149229dc468e03e81924e053035 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns a Protocol fit for STEP (creates the first time).
") Protocol;
		static opencascade::handle<Interface_Protocol> Protocol();

		/****** STEPEdit::SignType ******/
		/****** md5 signature: aad20d8fbf414a763e6c94610b3ba1c6 ******/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_Signature>

Description
-----------
Returns a SignType fit for STEP (creates the first time).
") SignType;
		static opencascade::handle<IFSelect_Signature> SignType();

};


%extend STEPEdit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class STEPEdit_EditContext *
*****************************/
class STEPEdit_EditContext : public IFSelect_Editor {
	public:
		/****** STEPEdit_EditContext::STEPEdit_EditContext ******/
		/****** md5 signature: 44343bfbe79ab3c4766525e283e3bbcb ******/
		%feature("compactdefaultargs") STEPEdit_EditContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPEdit_EditContext;
		 STEPEdit_EditContext();

		/****** STEPEdit_EditContext::Apply ******/
		/****** md5 signature: 7128480b7f4b1ff6fd959731640e27fc ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** STEPEdit_EditContext::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Label;
		TCollection_AsciiString Label();

		/****** STEPEdit_EditContext::Load ******/
		/****** md5 signature: fbb84192d1ec7737c4c84905239a2df8 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** STEPEdit_EditContext::Recognize ******/
		/****** md5 signature: 745b42e0c753cb6baed4d66bbf94e5b8 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****** STEPEdit_EditContext::StringValue ******/
		/****** md5 signature: 4371620dd4c31b906a08f6f8ee98f04a ******/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") StringValue;
		opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

};


%make_alias(STEPEdit_EditContext)

%extend STEPEdit_EditContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class STEPEdit_EditSDR *
*************************/
class STEPEdit_EditSDR : public IFSelect_Editor {
	public:
		/****** STEPEdit_EditSDR::STEPEdit_EditSDR ******/
		/****** md5 signature: 484d29719e65840d392397ba8b0fdc1e ******/
		%feature("compactdefaultargs") STEPEdit_EditSDR;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPEdit_EditSDR;
		 STEPEdit_EditSDR();

		/****** STEPEdit_EditSDR::Apply ******/
		/****** md5 signature: 7128480b7f4b1ff6fd959731640e27fc ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** STEPEdit_EditSDR::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Label;
		TCollection_AsciiString Label();

		/****** STEPEdit_EditSDR::Load ******/
		/****** md5 signature: fbb84192d1ec7737c4c84905239a2df8 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** STEPEdit_EditSDR::Recognize ******/
		/****** md5 signature: 745b42e0c753cb6baed4d66bbf94e5b8 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****** STEPEdit_EditSDR::StringValue ******/
		/****** md5 signature: 4371620dd4c31b906a08f6f8ee98f04a ******/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") StringValue;
		opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

};


%make_alias(STEPEdit_EditSDR)

%extend STEPEdit_EditSDR {
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
def stepedit_NewModel(*args):
	return stepedit.NewModel(*args)

@deprecated
def stepedit_NewSelectPlacedItem(*args):
	return stepedit.NewSelectPlacedItem(*args)

@deprecated
def stepedit_NewSelectSDR(*args):
	return stepedit.NewSelectSDR(*args)

@deprecated
def stepedit_NewSelectShapeRepr(*args):
	return stepedit.NewSelectShapeRepr(*args)

@deprecated
def stepedit_Protocol(*args):
	return stepedit.Protocol(*args)

@deprecated
def stepedit_SignType(*args):
	return stepedit.SignType(*args)

}
