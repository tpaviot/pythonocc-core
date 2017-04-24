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
%module (package="OCC") PPrsStd

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


%include PPrsStd_headers.i


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

%nodefaultctor PPrsStd_AISPresentation;
class PPrsStd_AISPresentation : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PPrsStd_AISPresentation;
		%feature("autodoc", "	:rtype: None
") PPrsStd_AISPresentation;
		 PPrsStd_AISPresentation ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SetDisplayed;
		void SetDisplayed (const Standard_Boolean B);
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "	:param guid:
	:type guid: Handle_PCollection_HExtendedString &
	:rtype: None
") SetDriverGUID;
		void SetDriverGUID (const Handle_PCollection_HExtendedString & guid);
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") GetDriverGUID;
		Handle_PCollection_HExtendedString GetDriverGUID ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:rtype: int
") Color;
		Standard_Integer Color ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param C:
	:type C: int
	:rtype: None
") SetColor;
		void SetColor (const Standard_Integer C);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	:rtype: float
") Transparency;
		Standard_Real Transparency ();
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	:param T:
	:type T: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real T);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	:rtype: int
") Material;
		Standard_Integer Material ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	:param M:
	:type M: int
	:rtype: None
") SetMaterial;
		void SetMaterial (const Standard_Integer M);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	:rtype: float
") Width;
		Standard_Real Width ();
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real W);
		%feature("compactdefaultargs") PPrsStd_AISPresentation;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PPrsStd_AISPresentation;
		 PPrsStd_AISPresentation (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentationmyIsDisplayed;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPPrsStd_AISPresentationmyIsDisplayed;
		Standard_Boolean _CSFDB_GetPPrsStd_AISPresentationmyIsDisplayed ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentationmyIsDisplayed;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentationmyIsDisplayed;
		void _CSFDB_SetPPrsStd_AISPresentationmyIsDisplayed (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentationmyDriverGUID;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") _CSFDB_GetPPrsStd_AISPresentationmyDriverGUID;
		Handle_PCollection_HExtendedString _CSFDB_GetPPrsStd_AISPresentationmyDriverGUID ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentationmyDriverGUID;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HExtendedString &
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentationmyDriverGUID;
		void _CSFDB_SetPPrsStd_AISPresentationmyDriverGUID (const Handle_PCollection_HExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentationmyTransparency;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetPPrsStd_AISPresentationmyTransparency;
		Standard_Real _CSFDB_GetPPrsStd_AISPresentationmyTransparency ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentationmyTransparency;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentationmyTransparency;
		void _CSFDB_SetPPrsStd_AISPresentationmyTransparency (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentationmyColor;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPPrsStd_AISPresentationmyColor;
		Standard_Integer _CSFDB_GetPPrsStd_AISPresentationmyColor ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentationmyColor;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentationmyColor;
		void _CSFDB_SetPPrsStd_AISPresentationmyColor (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentationmyMaterial;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPPrsStd_AISPresentationmyMaterial;
		Standard_Integer _CSFDB_GetPPrsStd_AISPresentationmyMaterial ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentationmyMaterial;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentationmyMaterial;
		void _CSFDB_SetPPrsStd_AISPresentationmyMaterial (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentationmyWidth;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetPPrsStd_AISPresentationmyWidth;
		Standard_Real _CSFDB_GetPPrsStd_AISPresentationmyWidth ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentationmyWidth;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentationmyWidth;
		void _CSFDB_SetPPrsStd_AISPresentationmyWidth (const Standard_Real p);
};


%extend PPrsStd_AISPresentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PPrsStd_AISPresentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PPrsStd_AISPresentation::Handle_PPrsStd_AISPresentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PPrsStd_AISPresentation;
class Handle_PPrsStd_AISPresentation : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PPrsStd_AISPresentation();
        Handle_PPrsStd_AISPresentation(const Handle_PPrsStd_AISPresentation &aHandle);
        Handle_PPrsStd_AISPresentation(const PPrsStd_AISPresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PPrsStd_AISPresentation DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PPrsStd_AISPresentation {
    PPrsStd_AISPresentation* _get_reference() {
    return (PPrsStd_AISPresentation*)$self->Access();
    }
};

%extend Handle_PPrsStd_AISPresentation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PPrsStd_AISPresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PPrsStd_AISPresentation_1;
class PPrsStd_AISPresentation_1 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PPrsStd_AISPresentation_1;
		%feature("autodoc", "	:rtype: None
") PPrsStd_AISPresentation_1;
		 PPrsStd_AISPresentation_1 ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") SetDisplayed;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SetDisplayed;
		void SetDisplayed (const Standard_Boolean B);
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "	:param guid:
	:type guid: Handle_PCollection_HExtendedString &
	:rtype: None
") SetDriverGUID;
		void SetDriverGUID (const Handle_PCollection_HExtendedString & guid);
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") GetDriverGUID;
		Handle_PCollection_HExtendedString GetDriverGUID ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:rtype: int
") Color;
		Standard_Integer Color ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param C:
	:type C: int
	:rtype: None
") SetColor;
		void SetColor (const Standard_Integer C);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	:rtype: float
") Transparency;
		Standard_Real Transparency ();
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	:param T:
	:type T: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real T);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	:rtype: int
") Material;
		Standard_Integer Material ();
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	:param M:
	:type M: int
	:rtype: None
") SetMaterial;
		void SetMaterial (const Standard_Integer M);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	:rtype: float
") Width;
		Standard_Real Width ();
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real W);
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:rtype: int
") Mode;
		Standard_Integer Mode ();
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	:param M:
	:type M: int
	:rtype: None
") SetMode;
		void SetMode (const Standard_Integer M);
		%feature("compactdefaultargs") PPrsStd_AISPresentation_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PPrsStd_AISPresentation_1;
		 PPrsStd_AISPresentation_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentation_1myIsDisplayed;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPPrsStd_AISPresentation_1myIsDisplayed;
		Standard_Boolean _CSFDB_GetPPrsStd_AISPresentation_1myIsDisplayed ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentation_1myIsDisplayed;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentation_1myIsDisplayed;
		void _CSFDB_SetPPrsStd_AISPresentation_1myIsDisplayed (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentation_1myDriverGUID;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") _CSFDB_GetPPrsStd_AISPresentation_1myDriverGUID;
		Handle_PCollection_HExtendedString _CSFDB_GetPPrsStd_AISPresentation_1myDriverGUID ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentation_1myDriverGUID;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HExtendedString &
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentation_1myDriverGUID;
		void _CSFDB_SetPPrsStd_AISPresentation_1myDriverGUID (const Handle_PCollection_HExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentation_1myTransparency;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetPPrsStd_AISPresentation_1myTransparency;
		Standard_Real _CSFDB_GetPPrsStd_AISPresentation_1myTransparency ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentation_1myTransparency;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentation_1myTransparency;
		void _CSFDB_SetPPrsStd_AISPresentation_1myTransparency (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentation_1myColor;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPPrsStd_AISPresentation_1myColor;
		Standard_Integer _CSFDB_GetPPrsStd_AISPresentation_1myColor ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentation_1myColor;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentation_1myColor;
		void _CSFDB_SetPPrsStd_AISPresentation_1myColor (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentation_1myMaterial;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPPrsStd_AISPresentation_1myMaterial;
		Standard_Integer _CSFDB_GetPPrsStd_AISPresentation_1myMaterial ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentation_1myMaterial;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentation_1myMaterial;
		void _CSFDB_SetPPrsStd_AISPresentation_1myMaterial (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentation_1myWidth;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetPPrsStd_AISPresentation_1myWidth;
		Standard_Real _CSFDB_GetPPrsStd_AISPresentation_1myWidth ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentation_1myWidth;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentation_1myWidth;
		void _CSFDB_SetPPrsStd_AISPresentation_1myWidth (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetPPrsStd_AISPresentation_1myMode;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPPrsStd_AISPresentation_1myMode;
		Standard_Integer _CSFDB_GetPPrsStd_AISPresentation_1myMode ();
		%feature("compactdefaultargs") _CSFDB_SetPPrsStd_AISPresentation_1myMode;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPPrsStd_AISPresentation_1myMode;
		void _CSFDB_SetPPrsStd_AISPresentation_1myMode (const Standard_Integer p);
};


%extend PPrsStd_AISPresentation_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PPrsStd_AISPresentation_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PPrsStd_AISPresentation_1::Handle_PPrsStd_AISPresentation_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PPrsStd_AISPresentation_1;
class Handle_PPrsStd_AISPresentation_1 : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PPrsStd_AISPresentation_1();
        Handle_PPrsStd_AISPresentation_1(const Handle_PPrsStd_AISPresentation_1 &aHandle);
        Handle_PPrsStd_AISPresentation_1(const PPrsStd_AISPresentation_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PPrsStd_AISPresentation_1 DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PPrsStd_AISPresentation_1 {
    PPrsStd_AISPresentation_1* _get_reference() {
    return (PPrsStd_AISPresentation_1*)$self->Access();
    }
};

%extend Handle_PPrsStd_AISPresentation_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PPrsStd_AISPresentation_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
