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
%define STEPEDITDOCSTRING
"-Purpose : Provides tools to exploit and edit a set of STEP data :
editors, selections ..
"
%enddef
%module (package="OCC.Core", docstring=STEPEDITDOCSTRING) STEPEdit

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


%include STEPEdit_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(STEPEdit_EditContext)
%wrap_handle(STEPEdit_EditSDR)

%rename(stepedit) STEPEdit;
class STEPEdit {
	public:
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns a Protocol fit for STEP (creates the first time)

	:rtype: Handle_Interface_Protocol
") Protocol;
		static Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "	* Returns a new empty StepModel fit for STEP i.e. with its header determined from Protocol

	:rtype: Handle_StepData_StepModel
") NewModel;
		static Handle_StepData_StepModel NewModel ();
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "	* Returns a SignType fit for STEP (creates the first time)

	:rtype: Handle_IFSelect_Signature
") SignType;
		static Handle_IFSelect_Signature SignType ();
		%feature("compactdefaultargs") NewSelectSDR;
		%feature("autodoc", "	* Creates a Selection for ShapeDefinitionRepresentation By default searches among root entities

	:rtype: Handle_IFSelect_SelectSignature
") NewSelectSDR;
		static Handle_IFSelect_SelectSignature NewSelectSDR ();
		%feature("compactdefaultargs") NewSelectPlacedItem;
		%feature("autodoc", "	* Creates a Selection for Placed Items, i.e. MappedItem or ContextDependentShapeRepresentation, which itself refers to a RepresentationRelationship with possible subtypes (Shape... and/or ...WithTransformation) By default in the whole StepModel

	:rtype: Handle_IFSelect_SelectSignature
") NewSelectPlacedItem;
		static Handle_IFSelect_SelectSignature NewSelectPlacedItem ();
		%feature("compactdefaultargs") NewSelectShapeRepr;
		%feature("autodoc", "	* Creates a Selection for ShapeRepresentation and its sub-types, plus ContextDependentShapeRepresentation (which is not a sub-type of ShapeRepresentation) By default in the whole StepModel

	:rtype: Handle_IFSelect_SelectSignature
") NewSelectShapeRepr;
		static Handle_IFSelect_SelectSignature NewSelectShapeRepr ();
};


%extend STEPEdit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPEdit_EditContext;
class STEPEdit_EditContext : public IFSelect_Editor {
	public:
		%feature("compactdefaultargs") STEPEdit_EditContext;
		%feature("autodoc", "	:rtype: None
") STEPEdit_EditContext;
		 STEPEdit_EditContext ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:rtype: bool
") Recognize;
		Standard_Boolean Recognize (const Handle_IFSelect_EditForm & form);
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") StringValue;
		Handle_TCollection_HAsciiString StringValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Apply;
		Standard_Boolean Apply (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Load;
		Standard_Boolean Load (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%make_alias(STEPEdit_EditContext)

%extend STEPEdit_EditContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPEdit_EditSDR;
class STEPEdit_EditSDR : public IFSelect_Editor {
	public:
		%feature("compactdefaultargs") STEPEdit_EditSDR;
		%feature("autodoc", "	:rtype: None
") STEPEdit_EditSDR;
		 STEPEdit_EditSDR ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:rtype: bool
") Recognize;
		Standard_Boolean Recognize (const Handle_IFSelect_EditForm & form);
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") StringValue;
		Handle_TCollection_HAsciiString StringValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Apply;
		Standard_Boolean Apply (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Load;
		Standard_Boolean Load (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%make_alias(STEPEdit_EditSDR)

%extend STEPEdit_EditSDR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
