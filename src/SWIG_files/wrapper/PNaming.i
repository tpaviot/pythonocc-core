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
%module (package="OCC") PNaming

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


%include PNaming_headers.i


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

%nodefaultctor PNaming_FieldOfHArray1OfNamedShape;
class PNaming_FieldOfHArray1OfNamedShape : public DBC_BaseArray {
	public:
		%feature("compactdefaultargs") PNaming_FieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:rtype: None
") PNaming_FieldOfHArray1OfNamedShape;
		 PNaming_FieldOfHArray1OfNamedShape ();
		%feature("compactdefaultargs") PNaming_FieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") PNaming_FieldOfHArray1OfNamedShape;
		 PNaming_FieldOfHArray1OfNamedShape (const Standard_Integer Size);
		%feature("compactdefaultargs") PNaming_FieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:param Varray:
	:type Varray: PNaming_FieldOfHArray1OfNamedShape &
	:rtype: None
") PNaming_FieldOfHArray1OfNamedShape;
		 PNaming_FieldOfHArray1OfNamedShape (const PNaming_FieldOfHArray1OfNamedShape & Varray);
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer Size);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PNaming_FieldOfHArray1OfNamedShape &
	:rtype: None
") Assign;
		void Assign (const PNaming_FieldOfHArray1OfNamedShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PNaming_FieldOfHArray1OfNamedShape &
	:rtype: None
") operator =;
		void operator = (const PNaming_FieldOfHArray1OfNamedShape & Other);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PNaming_NamedShape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PNaming_NamedShape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PNaming_NamedShape
") Value;
		Handle_PNaming_NamedShape Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%extend PNaming_FieldOfHArray1OfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_HArray1OfNamedShape;
class PNaming_HArray1OfNamedShape : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PNaming_HArray1OfNamedShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") PNaming_HArray1OfNamedShape;
		 PNaming_HArray1OfNamedShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") PNaming_HArray1OfNamedShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_PNaming_NamedShape &
	:rtype: None
") PNaming_HArray1OfNamedShape;
		 PNaming_HArray1OfNamedShape (const Standard_Integer Low,const Standard_Integer Up,const Handle_PNaming_NamedShape & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PNaming_NamedShape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PNaming_NamedShape & Value);
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PNaming_NamedShape
") Value;
		Handle_PNaming_NamedShape Value (const Standard_Integer Index);
		%feature("compactdefaultargs") PNaming_HArray1OfNamedShape;
		%feature("autodoc", "	:rtype: None
") PNaming_HArray1OfNamedShape;
		 PNaming_HArray1OfNamedShape ();
		%feature("compactdefaultargs") PNaming_HArray1OfNamedShape;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_HArray1OfNamedShape;
		 PNaming_HArray1OfNamedShape (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_HArray1OfNamedShapeLowerBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_HArray1OfNamedShapeLowerBound;
		Standard_Integer _CSFDB_GetPNaming_HArray1OfNamedShapeLowerBound ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_HArray1OfNamedShapeLowerBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_HArray1OfNamedShapeLowerBound;
		void _CSFDB_SetPNaming_HArray1OfNamedShapeLowerBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_HArray1OfNamedShapeUpperBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_HArray1OfNamedShapeUpperBound;
		Standard_Integer _CSFDB_GetPNaming_HArray1OfNamedShapeUpperBound ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_HArray1OfNamedShapeUpperBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_HArray1OfNamedShapeUpperBound;
		void _CSFDB_SetPNaming_HArray1OfNamedShapeUpperBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_HArray1OfNamedShapeData;
		%feature("autodoc", "	:rtype: PNaming_FieldOfHArray1OfNamedShape
") _CSFDB_GetPNaming_HArray1OfNamedShapeData;
		const PNaming_FieldOfHArray1OfNamedShape & _CSFDB_GetPNaming_HArray1OfNamedShapeData ();
};


%extend PNaming_HArray1OfNamedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_HArray1OfNamedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_HArray1OfNamedShape::Handle_PNaming_HArray1OfNamedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_HArray1OfNamedShape;
class Handle_PNaming_HArray1OfNamedShape : public Handle_Standard_Persistent {

    public:
        // constructors
        Handle_PNaming_HArray1OfNamedShape();
        Handle_PNaming_HArray1OfNamedShape(const Handle_PNaming_HArray1OfNamedShape &aHandle);
        Handle_PNaming_HArray1OfNamedShape(const PNaming_HArray1OfNamedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_HArray1OfNamedShape DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_HArray1OfNamedShape {
    PNaming_HArray1OfNamedShape* _get_reference() {
    return (PNaming_HArray1OfNamedShape*)$self->Access();
    }
};

%extend Handle_PNaming_HArray1OfNamedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_HArray1OfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_Name;
class PNaming_Name : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PNaming_Name;
		%feature("autodoc", "	:rtype: None
") PNaming_Name;
		 PNaming_Name ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param T:
	:type T: int
	:rtype: None
") Type;
		void Type (const Standard_Integer T);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:param T:
	:type T: int
	:rtype: None
") ShapeType;
		void ShapeType (const Standard_Integer T);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:param Args:
	:type Args: Handle_PNaming_HArray1OfNamedShape &
	:rtype: None
") Arguments;
		void Arguments (const Handle_PNaming_HArray1OfNamedShape & Args);
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:param arg:
	:type arg: Handle_PNaming_NamedShape &
	:rtype: None
") StopNamedShape;
		void StopNamedShape (const Handle_PNaming_NamedShape & arg);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: int
") Type;
		Standard_Integer Type ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:rtype: int
") ShapeType;
		Standard_Integer ShapeType ();
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:rtype: Handle_PNaming_HArray1OfNamedShape
") Arguments;
		Handle_PNaming_HArray1OfNamedShape Arguments ();
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") StopNamedShape;
		Handle_PNaming_NamedShape StopNamedShape ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") Index;
		void Index (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") PNaming_Name;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_Name;
		 PNaming_Name (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamemyType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_NamemyType;
		Standard_Integer _CSFDB_GetPNaming_NamemyType ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamemyType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_NamemyType;
		void _CSFDB_SetPNaming_NamemyType (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamemyShapeType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_NamemyShapeType;
		Standard_Integer _CSFDB_GetPNaming_NamemyShapeType ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamemyShapeType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_NamemyShapeType;
		void _CSFDB_SetPNaming_NamemyShapeType (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamemyArgs;
		%feature("autodoc", "	:rtype: Handle_PNaming_HArray1OfNamedShape
") _CSFDB_GetPNaming_NamemyArgs;
		Handle_PNaming_HArray1OfNamedShape _CSFDB_GetPNaming_NamemyArgs ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamemyArgs;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_HArray1OfNamedShape &
	:rtype: None
") _CSFDB_SetPNaming_NamemyArgs;
		void _CSFDB_SetPNaming_NamemyArgs (const Handle_PNaming_HArray1OfNamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamemyStop;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPNaming_NamemyStop;
		Handle_PNaming_NamedShape _CSFDB_GetPNaming_NamemyStop ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamemyStop;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPNaming_NamemyStop;
		void _CSFDB_SetPNaming_NamemyStop (const Handle_PNaming_NamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamemyIndex;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_NamemyIndex;
		Standard_Integer _CSFDB_GetPNaming_NamemyIndex ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamemyIndex;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_NamemyIndex;
		void _CSFDB_SetPNaming_NamemyIndex (const Standard_Integer p);
};


%extend PNaming_Name {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_Name(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_Name::Handle_PNaming_Name %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_Name;
class Handle_PNaming_Name : public Handle_Standard_Persistent {

    public:
        // constructors
        Handle_PNaming_Name();
        Handle_PNaming_Name(const Handle_PNaming_Name &aHandle);
        Handle_PNaming_Name(const PNaming_Name *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_Name DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_Name {
    PNaming_Name* _get_reference() {
    return (PNaming_Name*)$self->Access();
    }
};

%extend Handle_PNaming_Name {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_Name_1;
class PNaming_Name_1 : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PNaming_Name_1;
		%feature("autodoc", "	:rtype: None
") PNaming_Name_1;
		 PNaming_Name_1 ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param T:
	:type T: int
	:rtype: None
") Type;
		void Type (const Standard_Integer T);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:param T:
	:type T: int
	:rtype: None
") ShapeType;
		void ShapeType (const Standard_Integer T);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:param Args:
	:type Args: Handle_PNaming_HArray1OfNamedShape &
	:rtype: None
") Arguments;
		void Arguments (const Handle_PNaming_HArray1OfNamedShape & Args);
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:param arg:
	:type arg: Handle_PNaming_NamedShape &
	:rtype: None
") StopNamedShape;
		void StopNamedShape (const Handle_PNaming_NamedShape & arg);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: int
") Type;
		Standard_Integer Type ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:rtype: int
") ShapeType;
		Standard_Integer ShapeType ();
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:rtype: Handle_PNaming_HArray1OfNamedShape
") Arguments;
		Handle_PNaming_HArray1OfNamedShape Arguments ();
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") StopNamedShape;
		Handle_PNaming_NamedShape StopNamedShape ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") Index;
		void Index (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") ContextLabel;
		Handle_PCollection_HAsciiString ContextLabel ();
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "	:param theLab:
	:type theLab: Handle_PCollection_HAsciiString &
	:rtype: None
") ContextLabel;
		void ContextLabel (const Handle_PCollection_HAsciiString & theLab);
		%feature("compactdefaultargs") PNaming_Name_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_Name_1;
		 PNaming_Name_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_1myType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_Name_1myType;
		Standard_Integer _CSFDB_GetPNaming_Name_1myType ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_1myType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_Name_1myType;
		void _CSFDB_SetPNaming_Name_1myType (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_1myShapeType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_Name_1myShapeType;
		Standard_Integer _CSFDB_GetPNaming_Name_1myShapeType ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_1myShapeType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_Name_1myShapeType;
		void _CSFDB_SetPNaming_Name_1myShapeType (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_1myArgs;
		%feature("autodoc", "	:rtype: Handle_PNaming_HArray1OfNamedShape
") _CSFDB_GetPNaming_Name_1myArgs;
		Handle_PNaming_HArray1OfNamedShape _CSFDB_GetPNaming_Name_1myArgs ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_1myArgs;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_HArray1OfNamedShape &
	:rtype: None
") _CSFDB_SetPNaming_Name_1myArgs;
		void _CSFDB_SetPNaming_Name_1myArgs (const Handle_PNaming_HArray1OfNamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_1myStop;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPNaming_Name_1myStop;
		Handle_PNaming_NamedShape _CSFDB_GetPNaming_Name_1myStop ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_1myStop;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPNaming_Name_1myStop;
		void _CSFDB_SetPNaming_Name_1myStop (const Handle_PNaming_NamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_1myIndex;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_Name_1myIndex;
		Standard_Integer _CSFDB_GetPNaming_Name_1myIndex ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_1myIndex;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_Name_1myIndex;
		void _CSFDB_SetPNaming_Name_1myIndex (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_1myContextLabel;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPNaming_Name_1myContextLabel;
		Handle_PCollection_HAsciiString _CSFDB_GetPNaming_Name_1myContextLabel ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_1myContextLabel;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPNaming_Name_1myContextLabel;
		void _CSFDB_SetPNaming_Name_1myContextLabel (const Handle_PCollection_HAsciiString & p);
};


%extend PNaming_Name_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_Name_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_Name_1::Handle_PNaming_Name_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_Name_1;
class Handle_PNaming_Name_1 : public Handle_Standard_Persistent {

    public:
        // constructors
        Handle_PNaming_Name_1();
        Handle_PNaming_Name_1(const Handle_PNaming_Name_1 &aHandle);
        Handle_PNaming_Name_1(const PNaming_Name_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_Name_1 DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_Name_1 {
    PNaming_Name_1* _get_reference() {
    return (PNaming_Name_1*)$self->Access();
    }
};

%extend Handle_PNaming_Name_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_Name_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_Name_2;
class PNaming_Name_2 : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PNaming_Name_2;
		%feature("autodoc", "	:rtype: None
") PNaming_Name_2;
		 PNaming_Name_2 ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param T:
	:type T: int
	:rtype: None
") Type;
		void Type (const Standard_Integer T);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:param T:
	:type T: int
	:rtype: None
") ShapeType;
		void ShapeType (const Standard_Integer T);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:param Args:
	:type Args: Handle_PNaming_HArray1OfNamedShape &
	:rtype: None
") Arguments;
		void Arguments (const Handle_PNaming_HArray1OfNamedShape & Args);
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:param arg:
	:type arg: Handle_PNaming_NamedShape &
	:rtype: None
") StopNamedShape;
		void StopNamedShape (const Handle_PNaming_NamedShape & arg);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param Or:
	:type Or: int
	:rtype: None
") Orientation;
		void Orientation (const Standard_Integer Or);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: int
") Type;
		Standard_Integer Type ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:rtype: int
") ShapeType;
		Standard_Integer ShapeType ();
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:rtype: Handle_PNaming_HArray1OfNamedShape
") Arguments;
		Handle_PNaming_HArray1OfNamedShape Arguments ();
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") StopNamedShape;
		Handle_PNaming_NamedShape StopNamedShape ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") Index;
		void Index (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") ContextLabel;
		Handle_PCollection_HAsciiString ContextLabel ();
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "	:param theLab:
	:type theLab: Handle_PCollection_HAsciiString &
	:rtype: None
") ContextLabel;
		void ContextLabel (const Handle_PCollection_HAsciiString & theLab);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: int
") Orientation;
		Standard_Integer Orientation ();
		%feature("compactdefaultargs") PNaming_Name_2;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_Name_2;
		 PNaming_Name_2 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_2myType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_Name_2myType;
		Standard_Integer _CSFDB_GetPNaming_Name_2myType ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_2myType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_Name_2myType;
		void _CSFDB_SetPNaming_Name_2myType (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_2myShapeType;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_Name_2myShapeType;
		Standard_Integer _CSFDB_GetPNaming_Name_2myShapeType ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_2myShapeType;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_Name_2myShapeType;
		void _CSFDB_SetPNaming_Name_2myShapeType (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_2myArgs;
		%feature("autodoc", "	:rtype: Handle_PNaming_HArray1OfNamedShape
") _CSFDB_GetPNaming_Name_2myArgs;
		Handle_PNaming_HArray1OfNamedShape _CSFDB_GetPNaming_Name_2myArgs ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_2myArgs;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_HArray1OfNamedShape &
	:rtype: None
") _CSFDB_SetPNaming_Name_2myArgs;
		void _CSFDB_SetPNaming_Name_2myArgs (const Handle_PNaming_HArray1OfNamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_2myStop;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPNaming_Name_2myStop;
		Handle_PNaming_NamedShape _CSFDB_GetPNaming_Name_2myStop ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_2myStop;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPNaming_Name_2myStop;
		void _CSFDB_SetPNaming_Name_2myStop (const Handle_PNaming_NamedShape & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_2myIndex;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_Name_2myIndex;
		Standard_Integer _CSFDB_GetPNaming_Name_2myIndex ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_2myIndex;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_Name_2myIndex;
		void _CSFDB_SetPNaming_Name_2myIndex (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_2myContextLabel;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPNaming_Name_2myContextLabel;
		Handle_PCollection_HAsciiString _CSFDB_GetPNaming_Name_2myContextLabel ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_2myContextLabel;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPNaming_Name_2myContextLabel;
		void _CSFDB_SetPNaming_Name_2myContextLabel (const Handle_PCollection_HAsciiString & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Name_2myOrientation;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_Name_2myOrientation;
		Standard_Integer _CSFDB_GetPNaming_Name_2myOrientation ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Name_2myOrientation;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_Name_2myOrientation;
		void _CSFDB_SetPNaming_Name_2myOrientation (const Standard_Integer p);
};


%extend PNaming_Name_2 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_Name_2(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_Name_2::Handle_PNaming_Name_2 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_Name_2;
class Handle_PNaming_Name_2 : public Handle_Standard_Persistent {

    public:
        // constructors
        Handle_PNaming_Name_2();
        Handle_PNaming_Name_2(const Handle_PNaming_Name_2 &aHandle);
        Handle_PNaming_Name_2(const PNaming_Name_2 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_Name_2 DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_Name_2 {
    PNaming_Name_2* _get_reference() {
    return (PNaming_Name_2*)$self->Access();
    }
};

%extend Handle_PNaming_Name_2 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_Name_2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_NamedShape;
class PNaming_NamedShape : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PNaming_NamedShape;
		%feature("autodoc", "	* Creates a mutable NamedShape from PNaming.

	:rtype: None
") PNaming_NamedShape;
		 PNaming_NamedShape ();
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	* Returns the number of shapes.

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") OldShapes;
		%feature("autodoc", "	* Sets the field <myOldShapes>.

	:param theShapes:
	:type theShapes: Handle_PTopoDS_HArray1OfShape1 &
	:rtype: None
") OldShapes;
		void OldShapes (const Handle_PTopoDS_HArray1OfShape1 & theShapes);
		%feature("compactdefaultargs") OldShapes;
		%feature("autodoc", "	* Returns the field <myOldShapes>.

	:rtype: Handle_PTopoDS_HArray1OfShape1
") OldShapes;
		Handle_PTopoDS_HArray1OfShape1 OldShapes ();
		%feature("compactdefaultargs") NewShapes;
		%feature("autodoc", "	* Sets the field <myNewShapes>.

	:param theShapes:
	:type theShapes: Handle_PTopoDS_HArray1OfShape1 &
	:rtype: None
") NewShapes;
		void NewShapes (const Handle_PTopoDS_HArray1OfShape1 & theShapes);
		%feature("compactdefaultargs") NewShapes;
		%feature("autodoc", "	* Returns the field <myNewShapes>.

	:rtype: Handle_PTopoDS_HArray1OfShape1
") NewShapes;
		Handle_PTopoDS_HArray1OfShape1 NewShapes ();
		%feature("compactdefaultargs") ShapeStatus;
		%feature("autodoc", "	* Sets the field <myShapeStatus>.

	:param theShapeStatus:
	:type theShapeStatus: int
	:rtype: None
") ShapeStatus;
		void ShapeStatus (const Standard_Integer theShapeStatus);
		%feature("compactdefaultargs") ShapeStatus;
		%feature("autodoc", "	* Returns the field <myShapeStatus>.

	:rtype: int
") ShapeStatus;
		Standard_Integer ShapeStatus ();
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "	* Sets the field <myVersion>.

	:param theVersion:
	:type theVersion: int
	:rtype: None
") Version;
		void Version (const Standard_Integer theVersion);
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "	* Returns the field <myVersion>.

	:rtype: int
") Version;
		Standard_Integer Version ();
		%feature("compactdefaultargs") PNaming_NamedShape;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_NamedShape;
		 PNaming_NamedShape (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamedShapemyOldShapes;
		%feature("autodoc", "	:rtype: Handle_PTopoDS_HArray1OfShape1
") _CSFDB_GetPNaming_NamedShapemyOldShapes;
		Handle_PTopoDS_HArray1OfShape1 _CSFDB_GetPNaming_NamedShapemyOldShapes ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamedShapemyOldShapes;
		%feature("autodoc", "	:param p:
	:type p: Handle_PTopoDS_HArray1OfShape1 &
	:rtype: None
") _CSFDB_SetPNaming_NamedShapemyOldShapes;
		void _CSFDB_SetPNaming_NamedShapemyOldShapes (const Handle_PTopoDS_HArray1OfShape1 & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamedShapemyNewShapes;
		%feature("autodoc", "	:rtype: Handle_PTopoDS_HArray1OfShape1
") _CSFDB_GetPNaming_NamedShapemyNewShapes;
		Handle_PTopoDS_HArray1OfShape1 _CSFDB_GetPNaming_NamedShapemyNewShapes ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamedShapemyNewShapes;
		%feature("autodoc", "	:param p:
	:type p: Handle_PTopoDS_HArray1OfShape1 &
	:rtype: None
") _CSFDB_SetPNaming_NamedShapemyNewShapes;
		void _CSFDB_SetPNaming_NamedShapemyNewShapes (const Handle_PTopoDS_HArray1OfShape1 & p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamedShapemyShapeStatus;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_NamedShapemyShapeStatus;
		Standard_Integer _CSFDB_GetPNaming_NamedShapemyShapeStatus ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamedShapemyShapeStatus;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_NamedShapemyShapeStatus;
		void _CSFDB_SetPNaming_NamedShapemyShapeStatus (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamedShapemyVersion;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPNaming_NamedShapemyVersion;
		Standard_Integer _CSFDB_GetPNaming_NamedShapemyVersion ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamedShapemyVersion;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPNaming_NamedShapemyVersion;
		void _CSFDB_SetPNaming_NamedShapemyVersion (const Standard_Integer p);
};


%extend PNaming_NamedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_NamedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_NamedShape::Handle_PNaming_NamedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_NamedShape;
class Handle_PNaming_NamedShape : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PNaming_NamedShape();
        Handle_PNaming_NamedShape(const Handle_PNaming_NamedShape &aHandle);
        Handle_PNaming_NamedShape(const PNaming_NamedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_NamedShape DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_NamedShape {
    PNaming_NamedShape* _get_reference() {
    return (PNaming_NamedShape*)$self->Access();
    }
};

%extend Handle_PNaming_NamedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_NamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_Naming;
class PNaming_Naming : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PNaming_Naming;
		%feature("autodoc", "	:rtype: None
") PNaming_Naming;
		 PNaming_Naming ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_PNaming_Name &
	:rtype: None
") SetName;
		void SetName (const Handle_PNaming_Name & aName);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_PNaming_Name
") GetName;
		Handle_PNaming_Name GetName ();
		%feature("compactdefaultargs") PNaming_Naming;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_Naming;
		 PNaming_Naming (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_NamingmyName;
		%feature("autodoc", "	:rtype: Handle_PNaming_Name
") _CSFDB_GetPNaming_NamingmyName;
		Handle_PNaming_Name _CSFDB_GetPNaming_NamingmyName ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_NamingmyName;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_Name &
	:rtype: None
") _CSFDB_SetPNaming_NamingmyName;
		void _CSFDB_SetPNaming_NamingmyName (const Handle_PNaming_Name & p);
};


%extend PNaming_Naming {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_Naming(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_Naming::Handle_PNaming_Naming %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_Naming;
class Handle_PNaming_Naming : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PNaming_Naming();
        Handle_PNaming_Naming(const Handle_PNaming_Naming &aHandle);
        Handle_PNaming_Naming(const PNaming_Naming *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_Naming DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_Naming {
    PNaming_Naming* _get_reference() {
    return (PNaming_Naming*)$self->Access();
    }
};

%extend Handle_PNaming_Naming {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_Naming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_Naming_1;
class PNaming_Naming_1 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PNaming_Naming_1;
		%feature("autodoc", "	:rtype: None
") PNaming_Naming_1;
		 PNaming_Naming_1 ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_PNaming_Name_1 &
	:rtype: None
") SetName;
		void SetName (const Handle_PNaming_Name_1 & aName);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_PNaming_Name_1
") GetName;
		Handle_PNaming_Name_1 GetName ();
		%feature("compactdefaultargs") PNaming_Naming_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_Naming_1;
		 PNaming_Naming_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Naming_1myName;
		%feature("autodoc", "	:rtype: Handle_PNaming_Name_1
") _CSFDB_GetPNaming_Naming_1myName;
		Handle_PNaming_Name_1 _CSFDB_GetPNaming_Naming_1myName ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Naming_1myName;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_Name_1 &
	:rtype: None
") _CSFDB_SetPNaming_Naming_1myName;
		void _CSFDB_SetPNaming_Naming_1myName (const Handle_PNaming_Name_1 & p);
};


%extend PNaming_Naming_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_Naming_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_Naming_1::Handle_PNaming_Naming_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_Naming_1;
class Handle_PNaming_Naming_1 : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PNaming_Naming_1();
        Handle_PNaming_Naming_1(const Handle_PNaming_Naming_1 &aHandle);
        Handle_PNaming_Naming_1(const PNaming_Naming_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_Naming_1 DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_Naming_1 {
    PNaming_Naming_1* _get_reference() {
    return (PNaming_Naming_1*)$self->Access();
    }
};

%extend Handle_PNaming_Naming_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_Naming_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_Naming_2;
class PNaming_Naming_2 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PNaming_Naming_2;
		%feature("autodoc", "	:rtype: None
") PNaming_Naming_2;
		 PNaming_Naming_2 ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_PNaming_Name_2 &
	:rtype: None
") SetName;
		void SetName (const Handle_PNaming_Name_2 & aName);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_PNaming_Name_2
") GetName;
		Handle_PNaming_Name_2 GetName ();
		%feature("compactdefaultargs") PNaming_Naming_2;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_Naming_2;
		 PNaming_Naming_2 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_Naming_2myName;
		%feature("autodoc", "	:rtype: Handle_PNaming_Name_2
") _CSFDB_GetPNaming_Naming_2myName;
		Handle_PNaming_Name_2 _CSFDB_GetPNaming_Naming_2myName ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_Naming_2myName;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_Name_2 &
	:rtype: None
") _CSFDB_SetPNaming_Naming_2myName;
		void _CSFDB_SetPNaming_Naming_2myName (const Handle_PNaming_Name_2 & p);
};


%extend PNaming_Naming_2 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_Naming_2(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_Naming_2::Handle_PNaming_Naming_2 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_Naming_2;
class Handle_PNaming_Naming_2 : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PNaming_Naming_2();
        Handle_PNaming_Naming_2(const Handle_PNaming_Naming_2 &aHandle);
        Handle_PNaming_Naming_2(const PNaming_Naming_2 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_Naming_2 DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_Naming_2 {
    PNaming_Naming_2* _get_reference() {
    return (PNaming_Naming_2*)$self->Access();
    }
};

%extend Handle_PNaming_Naming_2 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_Naming_2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
class PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape : public PStandard_ArrayNode {
	public:
		%feature("compactdefaultargs") PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:rtype: None
") PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
		 PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape ();
		%feature("compactdefaultargs") PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PNaming_NamedShape &
	:rtype: None
") PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
		 PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape (const Handle_PNaming_NamedShape & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PNaming_NamedShape &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PNaming_NamedShape & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
		%feature("compactdefaultargs") PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
		 PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPNaming_VArrayNodeOfFieldOfHArray1OfNamedShapemyValue;
		%feature("autodoc", "	:rtype: Handle_PNaming_NamedShape
") _CSFDB_GetPNaming_VArrayNodeOfFieldOfHArray1OfNamedShapemyValue;
		Handle_PNaming_NamedShape _CSFDB_GetPNaming_VArrayNodeOfFieldOfHArray1OfNamedShapemyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPNaming_VArrayNodeOfFieldOfHArray1OfNamedShapemyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PNaming_NamedShape &
	:rtype: None
") _CSFDB_SetPNaming_VArrayNodeOfFieldOfHArray1OfNamedShapemyValue;
		void _CSFDB_SetPNaming_VArrayNodeOfFieldOfHArray1OfNamedShapemyValue (const Handle_PNaming_NamedShape & p);
};


%extend PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape::Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape;
class Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape : public Handle_PStandard_ArrayNode {

    public:
        // constructors
        Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape();
        Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape(const Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape &aHandle);
        Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape(const PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape {
    PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape* _get_reference() {
    return (PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape*)$self->Access();
    }
};

%extend Handle_PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PNaming_VArrayNodeOfFieldOfHArray1OfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape;
class PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape {
	public:
		%feature("compactdefaultargs") PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:rtype: None
") PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape;
		 PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape ();
		%feature("compactdefaultargs") PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PNaming_NamedShape &
	:rtype: None
") PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape;
		 PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape (const Handle_PNaming_NamedShape & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PNaming_NamedShape &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PNaming_NamedShape & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
};


%extend PNaming_VArrayTNodeOfFieldOfHArray1OfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
