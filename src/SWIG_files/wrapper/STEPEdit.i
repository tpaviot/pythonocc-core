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
%define STEPEDITDOCSTRING
"STEPEdit module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepedit.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Returns a new empty stepmodel fit for step i.e. with its header determined from protocol.

Returns
-------
opencascade::handle<StepData_StepModel>
") NewModel;
		static opencascade::handle<StepData_StepModel> NewModel();

		/****************** NewSelectPlacedItem ******************/
		%feature("compactdefaultargs") NewSelectPlacedItem;
		%feature("autodoc", "Creates a selection for placed items, i.e. mappeditem or contextdependentshaperepresentation, which itself refers to a representationrelationship with possible subtypes (shape... and/or ...withtransformation) by default in the whole stepmodel.

Returns
-------
opencascade::handle<IFSelect_SelectSignature>
") NewSelectPlacedItem;
		static opencascade::handle<IFSelect_SelectSignature> NewSelectPlacedItem();

		/****************** NewSelectSDR ******************/
		%feature("compactdefaultargs") NewSelectSDR;
		%feature("autodoc", "Creates a selection for shapedefinitionrepresentation by default searches among root entities.

Returns
-------
opencascade::handle<IFSelect_SelectSignature>
") NewSelectSDR;
		static opencascade::handle<IFSelect_SelectSignature> NewSelectSDR();

		/****************** NewSelectShapeRepr ******************/
		%feature("compactdefaultargs") NewSelectShapeRepr;
		%feature("autodoc", "Creates a selection for shaperepresentation and its sub-types, plus contextdependentshaperepresentation (which is not a sub-type of shaperepresentation) by default in the whole stepmodel.

Returns
-------
opencascade::handle<IFSelect_SelectSignature>
") NewSelectShapeRepr;
		static opencascade::handle<IFSelect_SelectSignature> NewSelectShapeRepr();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns a protocol fit for step (creates the first time).

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		static opencascade::handle<Interface_Protocol> Protocol();

		/****************** SignType ******************/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "Returns a signtype fit for step (creates the first time).

Returns
-------
opencascade::handle<IFSelect_Signature>
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
		/****************** STEPEdit_EditContext ******************/
		%feature("compactdefaultargs") STEPEdit_EditContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPEdit_EditContext;
		 STEPEdit_EditContext();

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****************** StringValue ******************/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
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
		/****************** STEPEdit_EditSDR ******************/
		%feature("compactdefaultargs") STEPEdit_EditSDR;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPEdit_EditSDR;
		 STEPEdit_EditSDR();

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****************** StringValue ******************/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
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
