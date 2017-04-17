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
%module (package="OCC") STEPEdit

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


%include STEPEdit_headers.i


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


%extend STEPEdit_EditContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPEdit_EditContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPEdit_EditContext::Handle_STEPEdit_EditContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPEdit_EditContext;
class Handle_STEPEdit_EditContext : public Handle_IFSelect_Editor {

    public:
        // constructors
        Handle_STEPEdit_EditContext();
        Handle_STEPEdit_EditContext(const Handle_STEPEdit_EditContext &aHandle);
        Handle_STEPEdit_EditContext(const STEPEdit_EditContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPEdit_EditContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPEdit_EditContext {
    STEPEdit_EditContext* _get_reference() {
    return (STEPEdit_EditContext*)$self->Access();
    }
};

%extend Handle_STEPEdit_EditContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend STEPEdit_EditSDR {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPEdit_EditSDR(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPEdit_EditSDR::Handle_STEPEdit_EditSDR %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPEdit_EditSDR;
class Handle_STEPEdit_EditSDR : public Handle_IFSelect_Editor {

    public:
        // constructors
        Handle_STEPEdit_EditSDR();
        Handle_STEPEdit_EditSDR(const Handle_STEPEdit_EditSDR &aHandle);
        Handle_STEPEdit_EditSDR(const STEPEdit_EditSDR *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPEdit_EditSDR DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPEdit_EditSDR {
    STEPEdit_EditSDR* _get_reference() {
    return (STEPEdit_EditSDR*)$self->Access();
    }
};

%extend Handle_STEPEdit_EditSDR {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPEdit_EditSDR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
