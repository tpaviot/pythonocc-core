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
%module (package="OCC") TColGeom2d

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


%include TColGeom2d_headers.i


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

%nodefaultctor TColGeom2d_Array1OfBSplineCurve;
class TColGeom2d_Array1OfBSplineCurve {
	public:
		%feature("compactdefaultargs") TColGeom2d_Array1OfBSplineCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_Array1OfBSplineCurve;
		 TColGeom2d_Array1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom2d_Array1OfBSplineCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom2d_BSplineCurve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_Array1OfBSplineCurve;
		 TColGeom2d_Array1OfBSplineCurve (const Handle_Geom2d_BSplineCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom2d_BSplineCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_BSplineCurve & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_Array1OfBSplineCurve &
	:rtype: TColGeom2d_Array1OfBSplineCurve
") Assign;
		const TColGeom2d_Array1OfBSplineCurve & Assign (const TColGeom2d_Array1OfBSplineCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_Array1OfBSplineCurve &
	:rtype: TColGeom2d_Array1OfBSplineCurve
") operator =;
		const TColGeom2d_Array1OfBSplineCurve & operator = (const TColGeom2d_Array1OfBSplineCurve & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Geom2d_BSplineCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BSplineCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BSplineCurve
") Value;
		Handle_Geom2d_BSplineCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BSplineCurve
") ChangeValue;
		Handle_Geom2d_BSplineCurve ChangeValue (const Standard_Integer Index);
};


%extend TColGeom2d_Array1OfBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_Array1OfBezierCurve;
class TColGeom2d_Array1OfBezierCurve {
	public:
		%feature("compactdefaultargs") TColGeom2d_Array1OfBezierCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_Array1OfBezierCurve;
		 TColGeom2d_Array1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom2d_Array1OfBezierCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom2d_BezierCurve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_Array1OfBezierCurve;
		 TColGeom2d_Array1OfBezierCurve (const Handle_Geom2d_BezierCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom2d_BezierCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_BezierCurve & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_Array1OfBezierCurve &
	:rtype: TColGeom2d_Array1OfBezierCurve
") Assign;
		const TColGeom2d_Array1OfBezierCurve & Assign (const TColGeom2d_Array1OfBezierCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_Array1OfBezierCurve &
	:rtype: TColGeom2d_Array1OfBezierCurve
") operator =;
		const TColGeom2d_Array1OfBezierCurve & operator = (const TColGeom2d_Array1OfBezierCurve & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Geom2d_BezierCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BezierCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BezierCurve
") Value;
		Handle_Geom2d_BezierCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BezierCurve
") ChangeValue;
		Handle_Geom2d_BezierCurve ChangeValue (const Standard_Integer Index);
};


%extend TColGeom2d_Array1OfBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_Array1OfCurve;
class TColGeom2d_Array1OfCurve {
	public:
		%feature("compactdefaultargs") TColGeom2d_Array1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_Array1OfCurve;
		 TColGeom2d_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom2d_Array1OfCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom2d_Curve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_Array1OfCurve;
		 TColGeom2d_Array1OfCurve (const Handle_Geom2d_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom2d_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_Array1OfCurve &
	:rtype: TColGeom2d_Array1OfCurve
") Assign;
		const TColGeom2d_Array1OfCurve & Assign (const TColGeom2d_Array1OfCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_Array1OfCurve &
	:rtype: TColGeom2d_Array1OfCurve
") operator =;
		const TColGeom2d_Array1OfCurve & operator = (const TColGeom2d_Array1OfCurve & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Geom2d_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Curve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") Value;
		Handle_Geom2d_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") ChangeValue;
		Handle_Geom2d_Curve ChangeValue (const Standard_Integer Index);
};


%extend TColGeom2d_Array1OfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_HArray1OfBSplineCurve;
class TColGeom2d_HArray1OfBSplineCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom2d_HArray1OfBSplineCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_HArray1OfBSplineCurve;
		 TColGeom2d_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom2d_HArray1OfBSplineCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Geom2d_BSplineCurve &
	:rtype: None
") TColGeom2d_HArray1OfBSplineCurve;
		 TColGeom2d_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_BSplineCurve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom2d_BSplineCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_BSplineCurve & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Geom2d_BSplineCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BSplineCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BSplineCurve
") Value;
		Handle_Geom2d_BSplineCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BSplineCurve
") ChangeValue;
		Handle_Geom2d_BSplineCurve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColGeom2d_Array1OfBSplineCurve
") Array1;
		const TColGeom2d_Array1OfBSplineCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColGeom2d_Array1OfBSplineCurve
") ChangeArray1;
		TColGeom2d_Array1OfBSplineCurve & ChangeArray1 ();
};


%extend TColGeom2d_HArray1OfBSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_HArray1OfBSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_HArray1OfBSplineCurve::Handle_TColGeom2d_HArray1OfBSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_HArray1OfBSplineCurve;
class Handle_TColGeom2d_HArray1OfBSplineCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfBSplineCurve();
        Handle_TColGeom2d_HArray1OfBSplineCurve(const Handle_TColGeom2d_HArray1OfBSplineCurve &aHandle);
        Handle_TColGeom2d_HArray1OfBSplineCurve(const TColGeom2d_HArray1OfBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfBSplineCurve {
    TColGeom2d_HArray1OfBSplineCurve* _get_reference() {
    return (TColGeom2d_HArray1OfBSplineCurve*)$self->Access();
    }
};

%extend Handle_TColGeom2d_HArray1OfBSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_HArray1OfBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_HArray1OfBezierCurve;
class TColGeom2d_HArray1OfBezierCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom2d_HArray1OfBezierCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_HArray1OfBezierCurve;
		 TColGeom2d_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom2d_HArray1OfBezierCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Geom2d_BezierCurve &
	:rtype: None
") TColGeom2d_HArray1OfBezierCurve;
		 TColGeom2d_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_BezierCurve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom2d_BezierCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_BezierCurve & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Geom2d_BezierCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BezierCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BezierCurve
") Value;
		Handle_Geom2d_BezierCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BezierCurve
") ChangeValue;
		Handle_Geom2d_BezierCurve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColGeom2d_Array1OfBezierCurve
") Array1;
		const TColGeom2d_Array1OfBezierCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColGeom2d_Array1OfBezierCurve
") ChangeArray1;
		TColGeom2d_Array1OfBezierCurve & ChangeArray1 ();
};


%extend TColGeom2d_HArray1OfBezierCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_HArray1OfBezierCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_HArray1OfBezierCurve::Handle_TColGeom2d_HArray1OfBezierCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_HArray1OfBezierCurve;
class Handle_TColGeom2d_HArray1OfBezierCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfBezierCurve();
        Handle_TColGeom2d_HArray1OfBezierCurve(const Handle_TColGeom2d_HArray1OfBezierCurve &aHandle);
        Handle_TColGeom2d_HArray1OfBezierCurve(const TColGeom2d_HArray1OfBezierCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfBezierCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfBezierCurve {
    TColGeom2d_HArray1OfBezierCurve* _get_reference() {
    return (TColGeom2d_HArray1OfBezierCurve*)$self->Access();
    }
};

%extend Handle_TColGeom2d_HArray1OfBezierCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_HArray1OfBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_HArray1OfCurve;
class TColGeom2d_HArray1OfCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom2d_HArray1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom2d_HArray1OfCurve;
		 TColGeom2d_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom2d_HArray1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Geom2d_Curve &
	:rtype: None
") TColGeom2d_HArray1OfCurve;
		 TColGeom2d_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_Curve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom2d_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Geom2d_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Curve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") Value;
		Handle_Geom2d_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") ChangeValue;
		Handle_Geom2d_Curve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColGeom2d_Array1OfCurve
") Array1;
		const TColGeom2d_Array1OfCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColGeom2d_Array1OfCurve
") ChangeArray1;
		TColGeom2d_Array1OfCurve & ChangeArray1 ();
};


%extend TColGeom2d_HArray1OfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_HArray1OfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_HArray1OfCurve::Handle_TColGeom2d_HArray1OfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_HArray1OfCurve;
class Handle_TColGeom2d_HArray1OfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfCurve();
        Handle_TColGeom2d_HArray1OfCurve(const Handle_TColGeom2d_HArray1OfCurve &aHandle);
        Handle_TColGeom2d_HArray1OfCurve(const TColGeom2d_HArray1OfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfCurve {
    TColGeom2d_HArray1OfCurve* _get_reference() {
    return (TColGeom2d_HArray1OfCurve*)$self->Access();
    }
};

%extend Handle_TColGeom2d_HArray1OfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_HArray1OfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_HSequenceOfBoundedCurve;
class TColGeom2d_HSequenceOfBoundedCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom2d_HSequenceOfBoundedCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom2d_HSequenceOfBoundedCurve;
		 TColGeom2d_HSequenceOfBoundedCurve ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom2d_BoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_Geom2d_BoundedCurve & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfBoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom2d_BoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom2d_BoundedCurve & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfBoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom2d_BoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom2d_BoundedCurve & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfBoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom2d_BoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom2d_BoundedCurve & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfBoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColGeom2d_HSequenceOfBoundedCurve
") Split;
		Handle_TColGeom2d_HSequenceOfBoundedCurve Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom2d_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom2d_BoundedCurve & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom2d_BoundedCurve
") Value;
		Handle_Geom2d_BoundedCurve Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom2d_BoundedCurve
") ChangeValue;
		Handle_Geom2d_BoundedCurve ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfBoundedCurve
") Sequence;
		const TColGeom2d_SequenceOfBoundedCurve & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfBoundedCurve
") ChangeSequence;
		TColGeom2d_SequenceOfBoundedCurve & ChangeSequence ();
};


%extend TColGeom2d_HSequenceOfBoundedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_HSequenceOfBoundedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_HSequenceOfBoundedCurve::Handle_TColGeom2d_HSequenceOfBoundedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_HSequenceOfBoundedCurve;
class Handle_TColGeom2d_HSequenceOfBoundedCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HSequenceOfBoundedCurve();
        Handle_TColGeom2d_HSequenceOfBoundedCurve(const Handle_TColGeom2d_HSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom2d_HSequenceOfBoundedCurve(const TColGeom2d_HSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HSequenceOfBoundedCurve {
    TColGeom2d_HSequenceOfBoundedCurve* _get_reference() {
    return (TColGeom2d_HSequenceOfBoundedCurve*)$self->Access();
    }
};

%extend Handle_TColGeom2d_HSequenceOfBoundedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_HSequenceOfBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_HSequenceOfCurve;
class TColGeom2d_HSequenceOfCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom2d_HSequenceOfCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom2d_HSequenceOfCurve;
		 TColGeom2d_HSequenceOfCurve ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom2d_Curve &
	:rtype: None
") Append;
		void Append (const Handle_Geom2d_Curve & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfCurve &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom2d_Curve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom2d_Curve & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom2d_Curve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom2d_Curve & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom2d_Curve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom2d_Curve & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom2d_HSequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColGeom2d_HSequenceOfCurve
") Split;
		Handle_TColGeom2d_HSequenceOfCurve Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom2d_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom2d_Curve & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom2d_Curve
") Value;
		Handle_Geom2d_Curve Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom2d_Curve
") ChangeValue;
		Handle_Geom2d_Curve ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfCurve
") Sequence;
		const TColGeom2d_SequenceOfCurve & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfCurve
") ChangeSequence;
		TColGeom2d_SequenceOfCurve & ChangeSequence ();
};


%extend TColGeom2d_HSequenceOfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_HSequenceOfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_HSequenceOfCurve::Handle_TColGeom2d_HSequenceOfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_HSequenceOfCurve;
class Handle_TColGeom2d_HSequenceOfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HSequenceOfCurve();
        Handle_TColGeom2d_HSequenceOfCurve(const Handle_TColGeom2d_HSequenceOfCurve &aHandle);
        Handle_TColGeom2d_HSequenceOfCurve(const TColGeom2d_HSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HSequenceOfCurve {
    TColGeom2d_HSequenceOfCurve* _get_reference() {
    return (TColGeom2d_HSequenceOfCurve*)$self->Access();
    }
};

%extend Handle_TColGeom2d_HSequenceOfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_HSequenceOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve;
class TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve;
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom2d_BoundedCurve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve;
		 TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve (const Handle_Geom2d_BoundedCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BoundedCurve
") Value;
		Handle_Geom2d_BoundedCurve Value ();
};


%extend TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve::Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve;
class Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve();
        Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve(const Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve(const TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
    TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve* _get_reference() {
    return (TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve*)$self->Access();
    }
};

%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_SequenceNodeOfSequenceOfCurve;
class TColGeom2d_SequenceNodeOfSequenceOfCurve : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColGeom2d_SequenceNodeOfSequenceOfCurve;
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom2d_Curve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom2d_SequenceNodeOfSequenceOfCurve;
		 TColGeom2d_SequenceNodeOfSequenceOfCurve (const Handle_Geom2d_Curve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") Value;
		Handle_Geom2d_Curve Value ();
};


%extend TColGeom2d_SequenceNodeOfSequenceOfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve::Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve;
class Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve();
        Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve(const Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve &aHandle);
        Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve(const TColGeom2d_SequenceNodeOfSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve {
    TColGeom2d_SequenceNodeOfSequenceOfCurve* _get_reference() {
    return (TColGeom2d_SequenceNodeOfSequenceOfCurve*)$self->Access();
    }
};

%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_SequenceNodeOfSequenceOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_SequenceNodeOfSequenceOfGeometry;
class TColGeom2d_SequenceNodeOfSequenceOfGeometry : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColGeom2d_SequenceNodeOfSequenceOfGeometry;
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom2d_Geometry &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom2d_SequenceNodeOfSequenceOfGeometry;
		 TColGeom2d_SequenceNodeOfSequenceOfGeometry (const Handle_Geom2d_Geometry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Geometry
") Value;
		Handle_Geom2d_Geometry Value ();
};


%extend TColGeom2d_SequenceNodeOfSequenceOfGeometry {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry::Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry;
class Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry();
        Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry(const Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry &aHandle);
        Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry(const TColGeom2d_SequenceNodeOfSequenceOfGeometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry {
    TColGeom2d_SequenceNodeOfSequenceOfGeometry* _get_reference() {
    return (TColGeom2d_SequenceNodeOfSequenceOfGeometry*)$self->Access();
    }
};

%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom2d_SequenceNodeOfSequenceOfGeometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_SequenceOfBoundedCurve;
class TColGeom2d_SequenceOfBoundedCurve : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColGeom2d_SequenceOfBoundedCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom2d_SequenceOfBoundedCurve;
		 TColGeom2d_SequenceOfBoundedCurve ();
		%feature("compactdefaultargs") TColGeom2d_SequenceOfBoundedCurve;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: None
") TColGeom2d_SequenceOfBoundedCurve;
		 TColGeom2d_SequenceOfBoundedCurve (const TColGeom2d_SequenceOfBoundedCurve & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: TColGeom2d_SequenceOfBoundedCurve
") Assign;
		const TColGeom2d_SequenceOfBoundedCurve & Assign (const TColGeom2d_SequenceOfBoundedCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: TColGeom2d_SequenceOfBoundedCurve
") operator =;
		const TColGeom2d_SequenceOfBoundedCurve & operator = (const TColGeom2d_SequenceOfBoundedCurve & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom2d_BoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_Geom2d_BoundedCurve & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: None
") Append;
		void Append (TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom2d_BoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom2d_BoundedCurve & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom2d_BoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom2d_BoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BoundedCurve
") First;
		Handle_Geom2d_BoundedCurve First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BoundedCurve
") Last;
		Handle_Geom2d_BoundedCurve Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColGeom2d_SequenceOfBoundedCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom2d_SequenceOfBoundedCurve & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BoundedCurve
") Value;
		Handle_Geom2d_BoundedCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Geom2d_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_BoundedCurve
") ChangeValue;
		Handle_Geom2d_BoundedCurve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColGeom2d_SequenceOfBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_SequenceOfCurve;
class TColGeom2d_SequenceOfCurve : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColGeom2d_SequenceOfCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom2d_SequenceOfCurve;
		 TColGeom2d_SequenceOfCurve ();
		%feature("compactdefaultargs") TColGeom2d_SequenceOfCurve;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfCurve &
	:rtype: None
") TColGeom2d_SequenceOfCurve;
		 TColGeom2d_SequenceOfCurve (const TColGeom2d_SequenceOfCurve & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfCurve &
	:rtype: TColGeom2d_SequenceOfCurve
") Assign;
		const TColGeom2d_SequenceOfCurve & Assign (const TColGeom2d_SequenceOfCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfCurve &
	:rtype: TColGeom2d_SequenceOfCurve
") operator =;
		const TColGeom2d_SequenceOfCurve & operator = (const TColGeom2d_SequenceOfCurve & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom2d_Curve &
	:rtype: None
") Append;
		void Append (const Handle_Geom2d_Curve & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColGeom2d_SequenceOfCurve &
	:rtype: None
") Append;
		void Append (TColGeom2d_SequenceOfCurve & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom2d_Curve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom2d_Curve & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColGeom2d_SequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (TColGeom2d_SequenceOfCurve & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom2d_Curve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom2d_Curve & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom2d_SequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom2d_SequenceOfCurve & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom2d_Curve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom2d_Curve & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom2d_SequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom2d_SequenceOfCurve & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") First;
		Handle_Geom2d_Curve First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") Last;
		Handle_Geom2d_Curve Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColGeom2d_SequenceOfCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom2d_SequenceOfCurve & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") Value;
		Handle_Geom2d_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Geom2d_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Curve & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") ChangeValue;
		Handle_Geom2d_Curve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColGeom2d_SequenceOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom2d_SequenceOfGeometry;
class TColGeom2d_SequenceOfGeometry : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColGeom2d_SequenceOfGeometry;
		%feature("autodoc", "	:rtype: None
") TColGeom2d_SequenceOfGeometry;
		 TColGeom2d_SequenceOfGeometry ();
		%feature("compactdefaultargs") TColGeom2d_SequenceOfGeometry;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") TColGeom2d_SequenceOfGeometry;
		 TColGeom2d_SequenceOfGeometry (const TColGeom2d_SequenceOfGeometry & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfGeometry &
	:rtype: TColGeom2d_SequenceOfGeometry
") Assign;
		const TColGeom2d_SequenceOfGeometry & Assign (const TColGeom2d_SequenceOfGeometry & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom2d_SequenceOfGeometry &
	:rtype: TColGeom2d_SequenceOfGeometry
") operator =;
		const TColGeom2d_SequenceOfGeometry & operator = (const TColGeom2d_SequenceOfGeometry & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom2d_Geometry &
	:rtype: None
") Append;
		void Append (const Handle_Geom2d_Geometry & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") Append;
		void Append (TColGeom2d_SequenceOfGeometry & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom2d_Geometry &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom2d_Geometry & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") Prepend;
		void Prepend (TColGeom2d_SequenceOfGeometry & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom2d_Geometry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom2d_Geometry & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom2d_SequenceOfGeometry & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom2d_Geometry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom2d_Geometry & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom2d_SequenceOfGeometry & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Geometry
") First;
		Handle_Geom2d_Geometry First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Geometry
") Last;
		Handle_Geom2d_Geometry Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom2d_SequenceOfGeometry & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Geometry
") Value;
		Handle_Geom2d_Geometry Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Geom2d_Geometry &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Geometry & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Geometry
") ChangeValue;
		Handle_Geom2d_Geometry ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColGeom2d_SequenceOfGeometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
