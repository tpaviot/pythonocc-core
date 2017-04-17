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
%module (package="OCC") PDataXtd

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


%include PDataXtd_headers.i


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

%nodefaultctor PDataXtd_Axis;
class PDataXtd_Axis : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Axis;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Axis;
		 PDataXtd_Axis ();
		%feature("compactdefaultargs") PDataXtd_Axis;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Axis;
		 PDataXtd_Axis (const Storage_stCONSTclCOM & a);
};


%extend PDataXtd_Axis {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Axis(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Axis::Handle_PDataXtd_Axis %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Axis;
class Handle_PDataXtd_Axis : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Axis();
        Handle_PDataXtd_Axis(const Handle_PDataXtd_Axis &aHandle);
        Handle_PDataXtd_Axis(const PDataXtd_Axis *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Axis DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Axis {
    PDataXtd_Axis* _get_reference() {
    return (PDataXtd_Axis*)$self->Access();
    }
};

%extend Handle_PDataXtd_Axis {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Axis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_Constraint;
class PDataXtd_Constraint : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Constraint;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Constraint;
		 PDataXtd_Constraint ();
		%feature("compactdefaultargs") PDataXtd_Constraint;
		%feature("autodoc", "	:param Type:
	:type Type: int
	:param Geometries:
	:type Geometries: Handle_PDF_HAttributeArray1 &
	:param Value:
	:type Value: Handle_PDataStd_Real &
	:param Plane:
	:type Plane: Handle_PNaming_NamedShape &
	:rtype: None
") PDataXtd_Constraint;
		 PDataXtd_Constraint (const Standard_Integer Type,const Handle_PDF_HAttributeArray1 & Geometries,const Handle_PDataStd_Real & Value,const Handle_PNaming_NamedShape & Plane);
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Real
") GetValue;
		Handle_PDataStd_Real GetValue ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: int
") GetType;
		Standard_Integer GetType ();
		%feature("compactdefaultargs") GetGeometries;
		%feature("autodoc", "	:rtype: Handle_PDF_HAttributeArray1
") GetGeometries;
		Handle_PDF_HAttributeArray1 GetGeometries ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param V:
	:type V: Handle_PDataStd_Real &
	:rtype: None
") Set;
		void Set (const Handle_PDataStd_Real & V);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param Type:
	:type Type: int
	:rtype: None
") SetType;
		void SetType (const Standard_Integer Type);
		%feature("compactdefaultargs") SetGeometries;
		%feature("autodoc", "	:param Geometries:
	:type Geometries: Handle_PDF_HAttributeArray1 &
	:rtype: None
") SetGeometries;
		void SetGeometries (const Handle_PDF_HAttributeArray1 & Geometries);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	:param plane:
	:type plane: Handle_PNaming_NamedShape &
	:rtype: None
") SetPlane;
		void SetPlane (const Handle_PNaming_NamedShape & plane);
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") GetPlane;
		Handle_PNaming_NamedShape GetPlane ();
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "	:param status:
	:type status: bool
	:rtype: None
") Verified;
		void Verified (const Standard_Boolean status);
		%feature("compactdefaultargs") Verified;
		%feature("autodoc", "	:rtype: bool
") Verified;
		Standard_Boolean Verified ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	:param status:
	:type status: bool
	:rtype: None
") Inverted;
		void Inverted (const Standard_Boolean status);
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	:rtype: bool
") Inverted;
		Standard_Boolean Inverted ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	:param status:
	:type status: bool
	:rtype: None
") Reversed;
		void Reversed (const Standard_Boolean status);
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	:rtype: bool
") Reversed;
		Standard_Boolean Reversed ();
		%feature("compactdefaultargs") PDataXtd_Constraint;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Constraint;
		 PDataXtd_Constraint (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_ConstraintmyType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataXtd_ConstraintmyType;
		Standard_Integer _CSFDB_GetPDataXtd_ConstraintmyType ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_ConstraintmyType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataXtd_ConstraintmyType;
		void _CSFDB_SetPDataXtd_ConstraintmyType (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_ConstraintmyGeometries;
		%feature("autodoc", "	:rtype: Handle_PDF_HAttributeArray1
") _CSFDB_GetPDataXtd_ConstraintmyGeometries;
		Handle_PDF_HAttributeArray1 _CSFDB_GetPDataXtd_ConstraintmyGeometries ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_ConstraintmyGeometries;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDF_HAttributeArray1 &
	:rtype: None
") _CSFDB_SetPDataXtd_ConstraintmyGeometries;
		void _CSFDB_SetPDataXtd_ConstraintmyGeometries (const Handle_PDF_HAttributeArray1 & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_ConstraintmyValue;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Real
") _CSFDB_GetPDataXtd_ConstraintmyValue;
		Handle_PDataStd_Real _CSFDB_GetPDataXtd_ConstraintmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_ConstraintmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_Real &
	:rtype: None
") _CSFDB_SetPDataXtd_ConstraintmyValue;
		void _CSFDB_SetPDataXtd_ConstraintmyValue (const Handle_PDataStd_Real & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_ConstraintmyIsReversed;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataXtd_ConstraintmyIsReversed;
		Standard_Boolean _CSFDB_GetPDataXtd_ConstraintmyIsReversed ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_ConstraintmyIsReversed;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataXtd_ConstraintmyIsReversed;
		void _CSFDB_SetPDataXtd_ConstraintmyIsReversed (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_ConstraintmyIsInverted;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataXtd_ConstraintmyIsInverted;
		Standard_Boolean _CSFDB_GetPDataXtd_ConstraintmyIsInverted ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_ConstraintmyIsInverted;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataXtd_ConstraintmyIsInverted;
		void _CSFDB_SetPDataXtd_ConstraintmyIsInverted (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_ConstraintmyIsVerified;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataXtd_ConstraintmyIsVerified;
		Standard_Boolean _CSFDB_GetPDataXtd_ConstraintmyIsVerified ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_ConstraintmyIsVerified;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataXtd_ConstraintmyIsVerified;
		void _CSFDB_SetPDataXtd_ConstraintmyIsVerified (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_ConstraintmyPlane;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPDataXtd_ConstraintmyPlane;
		Handle_PNaming_NamedShape _CSFDB_GetPDataXtd_ConstraintmyPlane ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_ConstraintmyPlane;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPDataXtd_ConstraintmyPlane;
		void _CSFDB_SetPDataXtd_ConstraintmyPlane (const Handle_PNaming_NamedShape & p);
};


%extend PDataXtd_Constraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Constraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Constraint::Handle_PDataXtd_Constraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Constraint;
class Handle_PDataXtd_Constraint : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Constraint();
        Handle_PDataXtd_Constraint(const Handle_PDataXtd_Constraint &aHandle);
        Handle_PDataXtd_Constraint(const PDataXtd_Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Constraint DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Constraint {
    PDataXtd_Constraint* _get_reference() {
    return (PDataXtd_Constraint*)$self->Access();
    }
};

%extend Handle_PDataXtd_Constraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_Geometry;
class PDataXtd_Geometry : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Geometry;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Geometry;
		 PDataXtd_Geometry ();
		%feature("compactdefaultargs") PDataXtd_Geometry;
		%feature("autodoc", "	:param Type:
	:type Type: int
	:rtype: None
") PDataXtd_Geometry;
		 PDataXtd_Geometry (const Standard_Integer Type);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: int
") GetType;
		Standard_Integer GetType ();
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param Type:
	:type Type: int
	:rtype: None
") SetType;
		void SetType (const Standard_Integer Type);
		%feature("compactdefaultargs") PDataXtd_Geometry;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Geometry;
		 PDataXtd_Geometry (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_GeometrymyType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataXtd_GeometrymyType;
		Standard_Integer _CSFDB_GetPDataXtd_GeometrymyType ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_GeometrymyType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataXtd_GeometrymyType;
		void _CSFDB_SetPDataXtd_GeometrymyType (const Standard_Integer p);
};


%extend PDataXtd_Geometry {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Geometry(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Geometry::Handle_PDataXtd_Geometry %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Geometry;
class Handle_PDataXtd_Geometry : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Geometry();
        Handle_PDataXtd_Geometry(const Handle_PDataXtd_Geometry &aHandle);
        Handle_PDataXtd_Geometry(const PDataXtd_Geometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Geometry DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Geometry {
    PDataXtd_Geometry* _get_reference() {
    return (PDataXtd_Geometry*)$self->Access();
    }
};

%extend Handle_PDataXtd_Geometry {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_PatternStd;
class PDataXtd_PatternStd : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_PatternStd;
		%feature("autodoc", "	:rtype: None
") PDataXtd_PatternStd;
		 PDataXtd_PatternStd ();
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:param signature:
	:type signature: int
	:rtype: None
") Signature;
		void Signature (const Standard_Integer signature);
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "	:param Axis1Reversed:
	:type Axis1Reversed: bool
	:rtype: None
") Axis1Reversed;
		void Axis1Reversed (const Standard_Boolean Axis1Reversed);
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "	:param Axis2Reversed:
	:type Axis2Reversed: bool
	:rtype: None
") Axis2Reversed;
		void Axis2Reversed (const Standard_Boolean Axis2Reversed);
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "	:param Axis1:
	:type Axis1: Handle_PNaming_NamedShape &
	:rtype: None
") Axis1;
		void Axis1 (const Handle_PNaming_NamedShape & Axis1);
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "	:param Axis2:
	:type Axis2: Handle_PNaming_NamedShape &
	:rtype: None
") Axis2;
		void Axis2 (const Handle_PNaming_NamedShape & Axis2);
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "	:param Value1:
	:type Value1: Handle_PDataStd_Real &
	:rtype: None
") Value1;
		void Value1 (const Handle_PDataStd_Real & Value1);
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "	:param Value2:
	:type Value2: Handle_PDataStd_Real &
	:rtype: None
") Value2;
		void Value2 (const Handle_PDataStd_Real & Value2);
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "	:param NbInstances1:
	:type NbInstances1: Handle_PDataStd_Integer &
	:rtype: None
") NbInstances1;
		void NbInstances1 (const Handle_PDataStd_Integer & NbInstances1);
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "	:param NbInstances2:
	:type NbInstances2: Handle_PDataStd_Integer &
	:rtype: None
") NbInstances2;
		void NbInstances2 (const Handle_PDataStd_Integer & NbInstances2);
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:param plane:
	:type plane: Handle_PNaming_NamedShape &
	:rtype: None
") Mirror;
		void Mirror (const Handle_PNaming_NamedShape & plane);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	:rtype: int
") Signature;
		Standard_Integer Signature ();
		%feature("compactdefaultargs") Axis1Reversed;
		%feature("autodoc", "	:rtype: bool
") Axis1Reversed;
		Standard_Boolean Axis1Reversed ();
		%feature("compactdefaultargs") Axis2Reversed;
		%feature("autodoc", "	:rtype: bool
") Axis2Reversed;
		Standard_Boolean Axis2Reversed ();
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") Axis1;
		Handle_PNaming_NamedShape Axis1 ();
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") Axis2;
		Handle_PNaming_NamedShape Axis2 ();
		%feature("compactdefaultargs") Value1;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Real
") Value1;
		Handle_PDataStd_Real Value1 ();
		%feature("compactdefaultargs") Value2;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Real
") Value2;
		Handle_PDataStd_Real Value2 ();
		%feature("compactdefaultargs") NbInstances1;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Integer
") NbInstances1;
		Handle_PDataStd_Integer NbInstances1 ();
		%feature("compactdefaultargs") NbInstances2;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Integer
") NbInstances2;
		Handle_PDataStd_Integer NbInstances2 ();
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") Mirror;
		Handle_PNaming_NamedShape Mirror ();
		%feature("compactdefaultargs") PDataXtd_PatternStd;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_PatternStd;
		 PDataXtd_PatternStd (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmySignature;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataXtd_PatternStdmySignature;
		Standard_Integer _CSFDB_GetPDataXtd_PatternStdmySignature ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmySignature;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmySignature;
		void _CSFDB_SetPDataXtd_PatternStdmySignature (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyAxis1Reversed;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataXtd_PatternStdmyAxis1Reversed;
		Standard_Boolean _CSFDB_GetPDataXtd_PatternStdmyAxis1Reversed ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyAxis1Reversed;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyAxis1Reversed;
		void _CSFDB_SetPDataXtd_PatternStdmyAxis1Reversed (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyAxis2Reversed;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataXtd_PatternStdmyAxis2Reversed;
		Standard_Boolean _CSFDB_GetPDataXtd_PatternStdmyAxis2Reversed ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyAxis2Reversed;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyAxis2Reversed;
		void _CSFDB_SetPDataXtd_PatternStdmyAxis2Reversed (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyAxis1;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPDataXtd_PatternStdmyAxis1;
		Handle_PNaming_NamedShape _CSFDB_GetPDataXtd_PatternStdmyAxis1 ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyAxis1;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyAxis1;
		void _CSFDB_SetPDataXtd_PatternStdmyAxis1 (const Handle_PNaming_NamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyAxis2;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPDataXtd_PatternStdmyAxis2;
		Handle_PNaming_NamedShape _CSFDB_GetPDataXtd_PatternStdmyAxis2 ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyAxis2;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyAxis2;
		void _CSFDB_SetPDataXtd_PatternStdmyAxis2 (const Handle_PNaming_NamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyValue1;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Real
") _CSFDB_GetPDataXtd_PatternStdmyValue1;
		Handle_PDataStd_Real _CSFDB_GetPDataXtd_PatternStdmyValue1 ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyValue1;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_Real &
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyValue1;
		void _CSFDB_SetPDataXtd_PatternStdmyValue1 (const Handle_PDataStd_Real & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyValue2;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Real
") _CSFDB_GetPDataXtd_PatternStdmyValue2;
		Handle_PDataStd_Real _CSFDB_GetPDataXtd_PatternStdmyValue2 ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyValue2;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_Real &
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyValue2;
		void _CSFDB_SetPDataXtd_PatternStdmyValue2 (const Handle_PDataStd_Real & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyNb1;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Integer
") _CSFDB_GetPDataXtd_PatternStdmyNb1;
		Handle_PDataStd_Integer _CSFDB_GetPDataXtd_PatternStdmyNb1 ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyNb1;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_Integer &
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyNb1;
		void _CSFDB_SetPDataXtd_PatternStdmyNb1 (const Handle_PDataStd_Integer & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyNb2;
		%feature("autodoc", "	:rtype: Handle_PDataStd_Integer
") _CSFDB_GetPDataXtd_PatternStdmyNb2;
		Handle_PDataStd_Integer _CSFDB_GetPDataXtd_PatternStdmyNb2 ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyNb2;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_Integer &
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyNb2;
		void _CSFDB_SetPDataXtd_PatternStdmyNb2 (const Handle_PDataStd_Integer & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PatternStdmyMirror;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPDataXtd_PatternStdmyMirror;
		Handle_PNaming_NamedShape _CSFDB_GetPDataXtd_PatternStdmyMirror ();
		%feature("compactdefaultargs") _CSFDB_SetPDataXtd_PatternStdmyMirror;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPDataXtd_PatternStdmyMirror;
		void _CSFDB_SetPDataXtd_PatternStdmyMirror (const Handle_PNaming_NamedShape & p);
};


%extend PDataXtd_PatternStd {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_PatternStd(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_PatternStd::Handle_PDataXtd_PatternStd %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_PatternStd;
class Handle_PDataXtd_PatternStd : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_PatternStd();
        Handle_PDataXtd_PatternStd(const Handle_PDataXtd_PatternStd &aHandle);
        Handle_PDataXtd_PatternStd(const PDataXtd_PatternStd *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_PatternStd DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_PatternStd {
    PDataXtd_PatternStd* _get_reference() {
    return (PDataXtd_PatternStd*)$self->Access();
    }
};

%extend Handle_PDataXtd_PatternStd {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_PatternStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_Placement;
class PDataXtd_Placement : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Placement;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Placement;
		 PDataXtd_Placement ();
		%feature("compactdefaultargs") PDataXtd_Placement;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Placement;
		 PDataXtd_Placement (const Storage_stCONSTclCOM & a);
};


%extend PDataXtd_Placement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Placement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Placement::Handle_PDataXtd_Placement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Placement;
class Handle_PDataXtd_Placement : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Placement();
        Handle_PDataXtd_Placement(const Handle_PDataXtd_Placement &aHandle);
        Handle_PDataXtd_Placement(const PDataXtd_Placement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Placement DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Placement {
    PDataXtd_Placement* _get_reference() {
    return (PDataXtd_Placement*)$self->Access();
    }
};

%extend Handle_PDataXtd_Placement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_Plane;
class PDataXtd_Plane : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Plane;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Plane;
		 PDataXtd_Plane ();
		%feature("compactdefaultargs") PDataXtd_Plane;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Plane;
		 PDataXtd_Plane (const Storage_stCONSTclCOM & a);
};


%extend PDataXtd_Plane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Plane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Plane::Handle_PDataXtd_Plane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Plane;
class Handle_PDataXtd_Plane : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Plane();
        Handle_PDataXtd_Plane(const Handle_PDataXtd_Plane &aHandle);
        Handle_PDataXtd_Plane(const PDataXtd_Plane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Plane DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Plane {
    PDataXtd_Plane* _get_reference() {
    return (PDataXtd_Plane*)$self->Access();
    }
};

%extend Handle_PDataXtd_Plane {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_Point;
class PDataXtd_Point : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Point;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Point;
		 PDataXtd_Point ();
		%feature("compactdefaultargs") PDataXtd_Point;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Point;
		 PDataXtd_Point (const Storage_stCONSTclCOM & a);
};


%extend PDataXtd_Point {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Point(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Point::Handle_PDataXtd_Point %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Point;
class Handle_PDataXtd_Point : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Point();
        Handle_PDataXtd_Point(const Handle_PDataXtd_Point &aHandle);
        Handle_PDataXtd_Point(const PDataXtd_Point *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Point DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Point {
    PDataXtd_Point* _get_reference() {
    return (PDataXtd_Point*)$self->Access();
    }
};

%extend Handle_PDataXtd_Point {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_Position;
class PDataXtd_Position : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Position;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Position;
		 PDataXtd_Position ();
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPosition;
		gp_Pnt GetPosition ();
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: gp_Pnt
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Pnt & aPosition);
		%feature("compactdefaultargs") PDataXtd_Position;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Position;
		 PDataXtd_Position (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataXtd_PositionmyPosition;
		%feature("autodoc", "	:rtype: gp_Pnt
") _CSFDB_GetPDataXtd_PositionmyPosition;
		const gp_Pnt  _CSFDB_GetPDataXtd_PositionmyPosition ();
};


%extend PDataXtd_Position {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Position(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Position::Handle_PDataXtd_Position %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Position;
class Handle_PDataXtd_Position : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Position();
        Handle_PDataXtd_Position(const Handle_PDataXtd_Position &aHandle);
        Handle_PDataXtd_Position(const PDataXtd_Position *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Position DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Position {
    PDataXtd_Position* _get_reference() {
    return (PDataXtd_Position*)$self->Access();
    }
};

%extend Handle_PDataXtd_Position {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Position {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataXtd_Shape;
class PDataXtd_Shape : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataXtd_Shape;
		%feature("autodoc", "	:rtype: None
") PDataXtd_Shape;
		 PDataXtd_Shape ();
		%feature("compactdefaultargs") PDataXtd_Shape;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataXtd_Shape;
		 PDataXtd_Shape (const Storage_stCONSTclCOM & a);
};


%extend PDataXtd_Shape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDataXtd_Shape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDataXtd_Shape::Handle_PDataXtd_Shape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDataXtd_Shape;
class Handle_PDataXtd_Shape : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDataXtd_Shape();
        Handle_PDataXtd_Shape(const Handle_PDataXtd_Shape &aHandle);
        Handle_PDataXtd_Shape(const PDataXtd_Shape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDataXtd_Shape DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDataXtd_Shape {
    PDataXtd_Shape* _get_reference() {
    return (PDataXtd_Shape*)$self->Access();
    }
};

%extend Handle_PDataXtd_Shape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDataXtd_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
