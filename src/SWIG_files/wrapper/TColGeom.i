/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%define TCOLGEOMDOCSTRING
"TColGeom module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tcolgeom.html"
%enddef
%module (package="OCC.Core", docstring=TCOLGEOMDOCSTRING) TColGeom


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
#include<TColGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Standard_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TColGeom_HArray1OfSurface)
%wrap_handle(TColGeom_HArray1OfBezierCurve)
%wrap_handle(TColGeom_HArray1OfBSplineCurve)
%wrap_handle(TColGeom_HArray1OfCurve)
%wrap_handle(TColGeom_HArray2OfSurface)
%wrap_handle(TColGeom_HSequenceOfBoundedCurve)
%wrap_handle(TColGeom_HSequenceOfCurve)
/* end handles declaration */

/* templates */
%template(TColGeom_Array2OfBezierSurface) NCollection_Array2 <opencascade::handle <Geom_BezierSurface>>;
%template(TColGeom_Array1OfBezierCurve) NCollection_Array1 <opencascade::handle <Geom_BezierCurve>>;

%extend NCollection_Array1 <opencascade::handle <Geom_BezierCurve>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TColGeom_Array1OfSurface) NCollection_Array1 <opencascade::handle <Geom_Surface>>;

%extend NCollection_Array1 <opencascade::handle <Geom_Surface>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TColGeom_Array2OfSurface) NCollection_Array2 <opencascade::handle <Geom_Surface>>;
%template(TColGeom_SequenceOfBoundedCurve) NCollection_Sequence <opencascade::handle <Geom_BoundedCurve>>;
%template(TColGeom_SequenceOfSurface) NCollection_Sequence <opencascade::handle <Geom_Surface>>;
%template(TColGeom_Array1OfCurve) NCollection_Array1 <opencascade::handle <Geom_Curve>>;

%extend NCollection_Array1 <opencascade::handle <Geom_Curve>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TColGeom_SequenceOfCurve) NCollection_Sequence <opencascade::handle <Geom_Curve>>;
%template(TColGeom_Array1OfBSplineCurve) NCollection_Array1 <opencascade::handle <Geom_BSplineCurve>>;

%extend NCollection_Array1 <opencascade::handle <Geom_BSplineCurve>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2 <opencascade::handle <Geom_BezierSurface>> TColGeom_Array2OfBezierSurface;
typedef NCollection_Array1 <opencascade::handle <Geom_BezierCurve>> TColGeom_Array1OfBezierCurve;
typedef NCollection_Array1 <opencascade::handle <Geom_Surface>> TColGeom_Array1OfSurface;
typedef NCollection_Array2 <opencascade::handle <Geom_Surface>> TColGeom_Array2OfSurface;
typedef NCollection_Sequence <opencascade::handle <Geom_BoundedCurve>> TColGeom_SequenceOfBoundedCurve;
typedef NCollection_Sequence <opencascade::handle <Geom_Surface>> TColGeom_SequenceOfSurface;
typedef NCollection_Array1 <opencascade::handle <Geom_Curve>> TColGeom_Array1OfCurve;
typedef NCollection_Sequence <opencascade::handle <Geom_Curve>> TColGeom_SequenceOfCurve;
typedef NCollection_Array1 <opencascade::handle <Geom_BSplineCurve>> TColGeom_Array1OfBSplineCurve;
/* end typedefs declaration */

/* harray1 classes */
class TColGeom_HArray1OfSurface : public  TColGeom_Array1OfSurface, public Standard_Transient {
  public:
    TColGeom_HArray1OfSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColGeom_Array1OfSurface::value_type& theValue);
    TColGeom_HArray1OfSurface(const  TColGeom_Array1OfSurface& theOther);
    const  TColGeom_Array1OfSurface& Array1();
     TColGeom_Array1OfSurface& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfSurface)


class TColGeom_HArray1OfBezierCurve : public  TColGeom_Array1OfBezierCurve, public Standard_Transient {
  public:
    TColGeom_HArray1OfBezierCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfBezierCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColGeom_Array1OfBezierCurve::value_type& theValue);
    TColGeom_HArray1OfBezierCurve(const  TColGeom_Array1OfBezierCurve& theOther);
    const  TColGeom_Array1OfBezierCurve& Array1();
     TColGeom_Array1OfBezierCurve& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfBezierCurve)


class TColGeom_HArray1OfBSplineCurve : public  TColGeom_Array1OfBSplineCurve, public Standard_Transient {
  public:
    TColGeom_HArray1OfBSplineCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfBSplineCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColGeom_Array1OfBSplineCurve::value_type& theValue);
    TColGeom_HArray1OfBSplineCurve(const  TColGeom_Array1OfBSplineCurve& theOther);
    const  TColGeom_Array1OfBSplineCurve& Array1();
     TColGeom_Array1OfBSplineCurve& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfBSplineCurve)


class TColGeom_HArray1OfCurve : public  TColGeom_Array1OfCurve, public Standard_Transient {
  public:
    TColGeom_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColGeom_Array1OfCurve::value_type& theValue);
    TColGeom_HArray1OfCurve(const  TColGeom_Array1OfCurve& theOther);
    const  TColGeom_Array1OfCurve& Array1();
     TColGeom_Array1OfCurve& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfCurve)


/* harray2 classes */
class TColGeom_HArray2OfSurface : public  TColGeom_Array2OfSurface, public Standard_Transient {
  public:
    TColGeom_HArray2OfSurface(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColGeom_HArray2OfSurface(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColGeom_Array2OfSurface::value_type& theValue);
    TColGeom_HArray2OfSurface(const  TColGeom_Array2OfSurface& theOther);
    const  TColGeom_Array2OfSurface& Array2 ();
     TColGeom_Array2OfSurface& ChangeArray2 (); 
};
%make_alias(TColGeom_HArray2OfSurface)


/* hsequence classes */
class TColGeom_HSequenceOfBoundedCurve : public  TColGeom_SequenceOfBoundedCurve, public Standard_Transient {
  public:
    TColGeom_HSequenceOfBoundedCurve();
    TColGeom_HSequenceOfBoundedCurve(const  TColGeom_SequenceOfBoundedCurve& theOther);
    const  TColGeom_SequenceOfBoundedCurve& Sequence();
    void Append (const  TColGeom_SequenceOfBoundedCurve::value_type& theItem);
    void Append ( TColGeom_SequenceOfBoundedCurve& theSequence);
     TColGeom_SequenceOfBoundedCurve& ChangeSequence();
};
%make_alias(TColGeom_HSequenceOfBoundedCurve)


class TColGeom_HSequenceOfCurve : public  TColGeom_SequenceOfCurve, public Standard_Transient {
  public:
    TColGeom_HSequenceOfCurve();
    TColGeom_HSequenceOfCurve(const  TColGeom_SequenceOfCurve& theOther);
    const  TColGeom_SequenceOfCurve& Sequence();
    void Append (const  TColGeom_SequenceOfCurve::value_type& theItem);
    void Append ( TColGeom_SequenceOfCurve& theSequence);
     TColGeom_SequenceOfCurve& ChangeSequence();
};
%make_alias(TColGeom_HSequenceOfCurve)


