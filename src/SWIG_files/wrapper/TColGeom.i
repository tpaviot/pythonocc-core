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
%module (package="OCC") TColGeom

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


%include TColGeom_headers.i


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

%nodefaultctor TColGeom_Array1OfBSplineCurve;
class TColGeom_Array1OfBSplineCurve {
	public:
		%feature("compactdefaultargs") TColGeom_Array1OfBSplineCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfBSplineCurve;
		 TColGeom_Array1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_Array1OfBSplineCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BSplineCurve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfBSplineCurve;
		 TColGeom_Array1OfBSplineCurve (const Handle_Geom_BSplineCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BSplineCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BSplineCurve & V);
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
	:type Other: TColGeom_Array1OfBSplineCurve &
	:rtype: TColGeom_Array1OfBSplineCurve
") Assign;
		const TColGeom_Array1OfBSplineCurve & Assign (const TColGeom_Array1OfBSplineCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBSplineCurve &
	:rtype: TColGeom_Array1OfBSplineCurve
") operator =;
		const TColGeom_Array1OfBSplineCurve & operator = (const TColGeom_Array1OfBSplineCurve & Other);
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
	:type Value: Handle_Geom_BSplineCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BSplineCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BSplineCurve
") Value;
		Handle_Geom_BSplineCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BSplineCurve
") ChangeValue;
		Handle_Geom_BSplineCurve ChangeValue (const Standard_Integer Index);
};


%extend TColGeom_Array1OfBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_Array1OfBezierCurve;
class TColGeom_Array1OfBezierCurve {
	public:
		%feature("compactdefaultargs") TColGeom_Array1OfBezierCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfBezierCurve;
		 TColGeom_Array1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_Array1OfBezierCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BezierCurve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfBezierCurve;
		 TColGeom_Array1OfBezierCurve (const Handle_Geom_BezierCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BezierCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BezierCurve & V);
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
	:type Other: TColGeom_Array1OfBezierCurve &
	:rtype: TColGeom_Array1OfBezierCurve
") Assign;
		const TColGeom_Array1OfBezierCurve & Assign (const TColGeom_Array1OfBezierCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBezierCurve &
	:rtype: TColGeom_Array1OfBezierCurve
") operator =;
		const TColGeom_Array1OfBezierCurve & operator = (const TColGeom_Array1OfBezierCurve & Other);
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
	:type Value: Handle_Geom_BezierCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BezierCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BezierCurve
") Value;
		Handle_Geom_BezierCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BezierCurve
") ChangeValue;
		Handle_Geom_BezierCurve ChangeValue (const Standard_Integer Index);
};


%extend TColGeom_Array1OfBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_Array1OfCurve;
class TColGeom_Array1OfCurve {
	public:
		%feature("compactdefaultargs") TColGeom_Array1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfCurve;
		 TColGeom_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_Array1OfCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_Curve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfCurve;
		 TColGeom_Array1OfCurve (const Handle_Geom_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & V);
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
	:type Other: TColGeom_Array1OfCurve &
	:rtype: TColGeom_Array1OfCurve
") Assign;
		const TColGeom_Array1OfCurve & Assign (const TColGeom_Array1OfCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfCurve &
	:rtype: TColGeom_Array1OfCurve
") operator =;
		const TColGeom_Array1OfCurve & operator = (const TColGeom_Array1OfCurve & Other);
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
	:type Value: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") Value;
		Handle_Geom_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") ChangeValue;
		Handle_Geom_Curve ChangeValue (const Standard_Integer Index);
};


%extend TColGeom_Array1OfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_Array1OfSurface;
class TColGeom_Array1OfSurface {
	public:
		%feature("compactdefaultargs") TColGeom_Array1OfSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfSurface;
		 TColGeom_Array1OfSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_Array1OfSurface;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_Surface &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_Array1OfSurface;
		 TColGeom_Array1OfSurface (const Handle_Geom_Surface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
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
	:type Other: TColGeom_Array1OfSurface &
	:rtype: TColGeom_Array1OfSurface
") Assign;
		const TColGeom_Array1OfSurface & Assign (const TColGeom_Array1OfSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfSurface &
	:rtype: TColGeom_Array1OfSurface
") operator =;
		const TColGeom_Array1OfSurface & operator = (const TColGeom_Array1OfSurface & Other);
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
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface ChangeValue (const Standard_Integer Index);
};


%extend TColGeom_Array1OfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_Array2OfBezierSurface;
class TColGeom_Array2OfBezierSurface {
	public:
		%feature("compactdefaultargs") TColGeom_Array2OfBezierSurface;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColGeom_Array2OfBezierSurface;
		 TColGeom_Array2OfBezierSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColGeom_Array2OfBezierSurface;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BezierSurface &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColGeom_Array2OfBezierSurface;
		 TColGeom_Array2OfBezierSurface (const Handle_Geom_BezierSurface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BezierSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BezierSurface & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBezierSurface &
	:rtype: TColGeom_Array2OfBezierSurface
") Assign;
		const TColGeom_Array2OfBezierSurface & Assign (const TColGeom_Array2OfBezierSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBezierSurface &
	:rtype: TColGeom_Array2OfBezierSurface
") operator =;
		const TColGeom_Array2OfBezierSurface & operator = (const TColGeom_Array2OfBezierSurface & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_Geom_BezierSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BezierSurface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Geom_BezierSurface
") Value;
		Handle_Geom_BezierSurface Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Geom_BezierSurface
") ChangeValue;
		Handle_Geom_BezierSurface ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColGeom_Array2OfBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_Array2OfSurface;
class TColGeom_Array2OfSurface {
	public:
		%feature("compactdefaultargs") TColGeom_Array2OfSurface;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColGeom_Array2OfSurface;
		 TColGeom_Array2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColGeom_Array2OfSurface;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_Surface &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColGeom_Array2OfSurface;
		 TColGeom_Array2OfSurface (const Handle_Geom_Surface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfSurface &
	:rtype: TColGeom_Array2OfSurface
") Assign;
		const TColGeom_Array2OfSurface & Assign (const TColGeom_Array2OfSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfSurface &
	:rtype: TColGeom_Array2OfSurface
") operator =;
		const TColGeom_Array2OfSurface & operator = (const TColGeom_Array2OfSurface & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_Surface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColGeom_Array2OfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_HArray1OfBSplineCurve;
class TColGeom_HArray1OfBSplineCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom_HArray1OfBSplineCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_HArray1OfBSplineCurve;
		 TColGeom_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_HArray1OfBSplineCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Geom_BSplineCurve &
	:rtype: None
") TColGeom_HArray1OfBSplineCurve;
		 TColGeom_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BSplineCurve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BSplineCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BSplineCurve & V);
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
	:type Value: Handle_Geom_BSplineCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BSplineCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BSplineCurve
") Value;
		Handle_Geom_BSplineCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BSplineCurve
") ChangeValue;
		Handle_Geom_BSplineCurve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBSplineCurve
") Array1;
		const TColGeom_Array1OfBSplineCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBSplineCurve
") ChangeArray1;
		TColGeom_Array1OfBSplineCurve & ChangeArray1 ();
};


%extend TColGeom_HArray1OfBSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_HArray1OfBSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_HArray1OfBSplineCurve::Handle_TColGeom_HArray1OfBSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_HArray1OfBSplineCurve;
class Handle_TColGeom_HArray1OfBSplineCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfBSplineCurve();
        Handle_TColGeom_HArray1OfBSplineCurve(const Handle_TColGeom_HArray1OfBSplineCurve &aHandle);
        Handle_TColGeom_HArray1OfBSplineCurve(const TColGeom_HArray1OfBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBSplineCurve {
    TColGeom_HArray1OfBSplineCurve* _get_reference() {
    return (TColGeom_HArray1OfBSplineCurve*)$self->Access();
    }
};

%extend Handle_TColGeom_HArray1OfBSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_HArray1OfBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_HArray1OfBezierCurve;
class TColGeom_HArray1OfBezierCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom_HArray1OfBezierCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_HArray1OfBezierCurve;
		 TColGeom_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_HArray1OfBezierCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Geom_BezierCurve &
	:rtype: None
") TColGeom_HArray1OfBezierCurve;
		 TColGeom_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BezierCurve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BezierCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BezierCurve & V);
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
	:type Value: Handle_Geom_BezierCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BezierCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BezierCurve
") Value;
		Handle_Geom_BezierCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BezierCurve
") ChangeValue;
		Handle_Geom_BezierCurve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBezierCurve
") Array1;
		const TColGeom_Array1OfBezierCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBezierCurve
") ChangeArray1;
		TColGeom_Array1OfBezierCurve & ChangeArray1 ();
};


%extend TColGeom_HArray1OfBezierCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_HArray1OfBezierCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_HArray1OfBezierCurve::Handle_TColGeom_HArray1OfBezierCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_HArray1OfBezierCurve;
class Handle_TColGeom_HArray1OfBezierCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfBezierCurve();
        Handle_TColGeom_HArray1OfBezierCurve(const Handle_TColGeom_HArray1OfBezierCurve &aHandle);
        Handle_TColGeom_HArray1OfBezierCurve(const TColGeom_HArray1OfBezierCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfBezierCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBezierCurve {
    TColGeom_HArray1OfBezierCurve* _get_reference() {
    return (TColGeom_HArray1OfBezierCurve*)$self->Access();
    }
};

%extend Handle_TColGeom_HArray1OfBezierCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_HArray1OfBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_HArray1OfCurve;
class TColGeom_HArray1OfCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom_HArray1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_HArray1OfCurve;
		 TColGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_HArray1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Geom_Curve &
	:rtype: None
") TColGeom_HArray1OfCurve;
		 TColGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_Curve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & V);
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
	:type Value: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") Value;
		Handle_Geom_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") ChangeValue;
		Handle_Geom_Curve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfCurve
") Array1;
		const TColGeom_Array1OfCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfCurve
") ChangeArray1;
		TColGeom_Array1OfCurve & ChangeArray1 ();
};


%extend TColGeom_HArray1OfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_HArray1OfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_HArray1OfCurve::Handle_TColGeom_HArray1OfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_HArray1OfCurve;
class Handle_TColGeom_HArray1OfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfCurve();
        Handle_TColGeom_HArray1OfCurve(const Handle_TColGeom_HArray1OfCurve &aHandle);
        Handle_TColGeom_HArray1OfCurve(const TColGeom_HArray1OfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfCurve {
    TColGeom_HArray1OfCurve* _get_reference() {
    return (TColGeom_HArray1OfCurve*)$self->Access();
    }
};

%extend Handle_TColGeom_HArray1OfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_HArray1OfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_HArray1OfSurface;
class TColGeom_HArray1OfSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom_HArray1OfSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColGeom_HArray1OfSurface;
		 TColGeom_HArray1OfSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColGeom_HArray1OfSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") TColGeom_HArray1OfSurface;
		 TColGeom_HArray1OfSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_Surface & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
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
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfSurface
") Array1;
		const TColGeom_Array1OfSurface & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColGeom_Array1OfSurface
") ChangeArray1;
		TColGeom_Array1OfSurface & ChangeArray1 ();
};


%extend TColGeom_HArray1OfSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_HArray1OfSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_HArray1OfSurface::Handle_TColGeom_HArray1OfSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_HArray1OfSurface;
class Handle_TColGeom_HArray1OfSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfSurface();
        Handle_TColGeom_HArray1OfSurface(const Handle_TColGeom_HArray1OfSurface &aHandle);
        Handle_TColGeom_HArray1OfSurface(const TColGeom_HArray1OfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfSurface {
    TColGeom_HArray1OfSurface* _get_reference() {
    return (TColGeom_HArray1OfSurface*)$self->Access();
    }
};

%extend Handle_TColGeom_HArray1OfSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_HArray1OfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_HArray2OfSurface;
class TColGeom_HArray2OfSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom_HArray2OfSurface;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColGeom_HArray2OfSurface;
		 TColGeom_HArray2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColGeom_HArray2OfSurface;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") TColGeom_HArray2OfSurface;
		 TColGeom_HArray2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_Surface & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_Surface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColGeom_Array2OfSurface
") Array2;
		const TColGeom_Array2OfSurface & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColGeom_Array2OfSurface
") ChangeArray2;
		TColGeom_Array2OfSurface & ChangeArray2 ();
};


%extend TColGeom_HArray2OfSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_HArray2OfSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_HArray2OfSurface::Handle_TColGeom_HArray2OfSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_HArray2OfSurface;
class Handle_TColGeom_HArray2OfSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray2OfSurface();
        Handle_TColGeom_HArray2OfSurface(const Handle_TColGeom_HArray2OfSurface &aHandle);
        Handle_TColGeom_HArray2OfSurface(const TColGeom_HArray2OfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray2OfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfSurface {
    TColGeom_HArray2OfSurface* _get_reference() {
    return (TColGeom_HArray2OfSurface*)$self->Access();
    }
};

%extend Handle_TColGeom_HArray2OfSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_HArray2OfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_HSequenceOfBoundedCurve;
class TColGeom_HSequenceOfBoundedCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom_HSequenceOfBoundedCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom_HSequenceOfBoundedCurve;
		 TColGeom_HSequenceOfBoundedCurve ();
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
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_BoundedCurve & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_BoundedCurve & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
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
	:rtype: Handle_TColGeom_HSequenceOfBoundedCurve
") Split;
		Handle_TColGeom_HSequenceOfBoundedCurve Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom_BoundedCurve
") Value;
		Handle_Geom_BoundedCurve Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom_BoundedCurve
") ChangeValue;
		Handle_Geom_BoundedCurve ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfBoundedCurve
") Sequence;
		const TColGeom_SequenceOfBoundedCurve & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfBoundedCurve
") ChangeSequence;
		TColGeom_SequenceOfBoundedCurve & ChangeSequence ();
};


%extend TColGeom_HSequenceOfBoundedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_HSequenceOfBoundedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_HSequenceOfBoundedCurve::Handle_TColGeom_HSequenceOfBoundedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_HSequenceOfBoundedCurve;
class Handle_TColGeom_HSequenceOfBoundedCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HSequenceOfBoundedCurve();
        Handle_TColGeom_HSequenceOfBoundedCurve(const Handle_TColGeom_HSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom_HSequenceOfBoundedCurve(const TColGeom_HSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfBoundedCurve {
    TColGeom_HSequenceOfBoundedCurve* _get_reference() {
    return (TColGeom_HSequenceOfBoundedCurve*)$self->Access();
    }
};

%extend Handle_TColGeom_HSequenceOfBoundedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_HSequenceOfBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_HSequenceOfCurve;
class TColGeom_HSequenceOfCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColGeom_HSequenceOfCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom_HSequenceOfCurve;
		 TColGeom_HSequenceOfCurve ();
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
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_Curve & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_Curve & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfCurve & aSequence);
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
	:rtype: Handle_TColGeom_HSequenceOfCurve
") Split;
		Handle_TColGeom_HSequenceOfCurve Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom_Curve
") Value;
		Handle_Geom_Curve Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Geom_Curve
") ChangeValue;
		Handle_Geom_Curve ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfCurve
") Sequence;
		const TColGeom_SequenceOfCurve & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfCurve
") ChangeSequence;
		TColGeom_SequenceOfCurve & ChangeSequence ();
};


%extend TColGeom_HSequenceOfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_HSequenceOfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_HSequenceOfCurve::Handle_TColGeom_HSequenceOfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_HSequenceOfCurve;
class Handle_TColGeom_HSequenceOfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HSequenceOfCurve();
        Handle_TColGeom_HSequenceOfCurve(const Handle_TColGeom_HSequenceOfCurve &aHandle);
        Handle_TColGeom_HSequenceOfCurve(const TColGeom_HSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfCurve {
    TColGeom_HSequenceOfCurve* _get_reference() {
    return (TColGeom_HSequenceOfCurve*)$self->Access();
    }
};

%extend Handle_TColGeom_HSequenceOfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_HSequenceOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
class TColGeom_SequenceNodeOfSequenceOfBoundedCurve : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom_BoundedCurve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
		 TColGeom_SequenceNodeOfSequenceOfBoundedCurve (const Handle_Geom_BoundedCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedCurve
") Value;
		Handle_Geom_BoundedCurve Value ();
};


%extend TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve::Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
class Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve();
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve(const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve(const TColGeom_SequenceNodeOfSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
    TColGeom_SequenceNodeOfSequenceOfBoundedCurve* _get_reference() {
    return (TColGeom_SequenceNodeOfSequenceOfBoundedCurve*)$self->Access();
    }
};

%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_SequenceNodeOfSequenceOfCurve;
class TColGeom_SequenceNodeOfSequenceOfCurve : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColGeom_SequenceNodeOfSequenceOfCurve;
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom_Curve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom_SequenceNodeOfSequenceOfCurve;
		 TColGeom_SequenceNodeOfSequenceOfCurve (const Handle_Geom_Curve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Value;
		Handle_Geom_Curve Value ();
};


%extend TColGeom_SequenceNodeOfSequenceOfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_SequenceNodeOfSequenceOfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_SequenceNodeOfSequenceOfCurve::Handle_TColGeom_SequenceNodeOfSequenceOfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfCurve;
class Handle_TColGeom_SequenceNodeOfSequenceOfCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom_SequenceNodeOfSequenceOfCurve();
        Handle_TColGeom_SequenceNodeOfSequenceOfCurve(const Handle_TColGeom_SequenceNodeOfSequenceOfCurve &aHandle);
        Handle_TColGeom_SequenceNodeOfSequenceOfCurve(const TColGeom_SequenceNodeOfSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_SequenceNodeOfSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfCurve {
    TColGeom_SequenceNodeOfSequenceOfCurve* _get_reference() {
    return (TColGeom_SequenceNodeOfSequenceOfCurve*)$self->Access();
    }
};

%extend Handle_TColGeom_SequenceNodeOfSequenceOfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_SequenceNodeOfSequenceOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_SequenceNodeOfSequenceOfSurface;
class TColGeom_SequenceNodeOfSequenceOfSurface : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColGeom_SequenceNodeOfSequenceOfSurface;
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom_Surface &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom_SequenceNodeOfSequenceOfSurface;
		 TColGeom_SequenceNodeOfSequenceOfSurface (const Handle_Geom_Surface & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value ();
};


%extend TColGeom_SequenceNodeOfSequenceOfSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColGeom_SequenceNodeOfSequenceOfSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColGeom_SequenceNodeOfSequenceOfSurface::Handle_TColGeom_SequenceNodeOfSequenceOfSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfSurface;
class Handle_TColGeom_SequenceNodeOfSequenceOfSurface : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom_SequenceNodeOfSequenceOfSurface();
        Handle_TColGeom_SequenceNodeOfSequenceOfSurface(const Handle_TColGeom_SequenceNodeOfSequenceOfSurface &aHandle);
        Handle_TColGeom_SequenceNodeOfSequenceOfSurface(const TColGeom_SequenceNodeOfSequenceOfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_SequenceNodeOfSequenceOfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfSurface {
    TColGeom_SequenceNodeOfSequenceOfSurface* _get_reference() {
    return (TColGeom_SequenceNodeOfSequenceOfSurface*)$self->Access();
    }
};

%extend Handle_TColGeom_SequenceNodeOfSequenceOfSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColGeom_SequenceNodeOfSequenceOfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_SequenceOfBoundedCurve;
class TColGeom_SequenceOfBoundedCurve : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColGeom_SequenceOfBoundedCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom_SequenceOfBoundedCurve;
		 TColGeom_SequenceOfBoundedCurve ();
		%feature("compactdefaultargs") TColGeom_SequenceOfBoundedCurve;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") TColGeom_SequenceOfBoundedCurve;
		 TColGeom_SequenceOfBoundedCurve (const TColGeom_SequenceOfBoundedCurve & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfBoundedCurve &
	:rtype: TColGeom_SequenceOfBoundedCurve
") Assign;
		const TColGeom_SequenceOfBoundedCurve & Assign (const TColGeom_SequenceOfBoundedCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfBoundedCurve &
	:rtype: TColGeom_SequenceOfBoundedCurve
") operator =;
		const TColGeom_SequenceOfBoundedCurve & operator = (const TColGeom_SequenceOfBoundedCurve & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_BoundedCurve & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") Append;
		void Append (TColGeom_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_BoundedCurve & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (TColGeom_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_BoundedCurve & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_BoundedCurve & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedCurve
") First;
		Handle_Geom_BoundedCurve First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedCurve
") Last;
		Handle_Geom_BoundedCurve Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BoundedCurve
") Value;
		Handle_Geom_BoundedCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Geom_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedCurve & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_BoundedCurve
") ChangeValue;
		Handle_Geom_BoundedCurve ChangeValue (const Standard_Integer Index);
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


%extend TColGeom_SequenceOfBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_SequenceOfCurve;
class TColGeom_SequenceOfCurve : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColGeom_SequenceOfCurve;
		%feature("autodoc", "	:rtype: None
") TColGeom_SequenceOfCurve;
		 TColGeom_SequenceOfCurve ();
		%feature("compactdefaultargs") TColGeom_SequenceOfCurve;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfCurve &
	:rtype: None
") TColGeom_SequenceOfCurve;
		 TColGeom_SequenceOfCurve (const TColGeom_SequenceOfCurve & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfCurve &
	:rtype: TColGeom_SequenceOfCurve
") Assign;
		const TColGeom_SequenceOfCurve & Assign (const TColGeom_SequenceOfCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfCurve &
	:rtype: TColGeom_SequenceOfCurve
") operator =;
		const TColGeom_SequenceOfCurve & operator = (const TColGeom_SequenceOfCurve & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_Curve & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Append;
		void Append (TColGeom_SequenceOfCurve & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_Curve & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (TColGeom_SequenceOfCurve & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_Curve & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfCurve & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_Curve & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfCurve & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") First;
		Handle_Geom_Curve First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Last;
		Handle_Geom_Curve Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColGeom_SequenceOfCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfCurve & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") Value;
		Handle_Geom_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") ChangeValue;
		Handle_Geom_Curve ChangeValue (const Standard_Integer Index);
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


%extend TColGeom_SequenceOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColGeom_SequenceOfSurface;
class TColGeom_SequenceOfSurface : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColGeom_SequenceOfSurface;
		%feature("autodoc", "	:rtype: None
") TColGeom_SequenceOfSurface;
		 TColGeom_SequenceOfSurface ();
		%feature("compactdefaultargs") TColGeom_SequenceOfSurface;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfSurface &
	:rtype: None
") TColGeom_SequenceOfSurface;
		 TColGeom_SequenceOfSurface (const TColGeom_SequenceOfSurface & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfSurface &
	:rtype: TColGeom_SequenceOfSurface
") Assign;
		const TColGeom_SequenceOfSurface & Assign (const TColGeom_SequenceOfSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfSurface &
	:rtype: TColGeom_SequenceOfSurface
") operator =;
		const TColGeom_SequenceOfSurface & operator = (const TColGeom_SequenceOfSurface & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") Append;
		void Append (const Handle_Geom_Surface & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") Append;
		void Append (TColGeom_SequenceOfSurface & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_Surface & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") Prepend;
		void Prepend (TColGeom_SequenceOfSurface & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfSurface & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfSurface & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") First;
		Handle_Geom_Surface First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Last;
		Handle_Geom_Surface Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColGeom_SequenceOfSurface &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfSurface & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Surface
") Value;
		Handle_Geom_Surface Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface ChangeValue (const Standard_Integer Index);
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


%extend TColGeom_SequenceOfSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
