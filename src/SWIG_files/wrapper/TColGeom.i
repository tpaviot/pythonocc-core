/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tcolgeom.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
%wrap_handle(TColGeom_HArray1OfSurface)
%wrap_handle(TColGeom_HArray1OfBezierCurve)
%wrap_handle(TColGeom_HArray1OfCurve)
%wrap_handle(TColGeom_HArray1OfBSplineCurve)
%wrap_handle(TColGeom_HArray2OfSurface)
%wrap_handle(TColGeom_HSequenceOfBoundedCurve)
%wrap_handle(TColGeom_HSequenceOfCurve)
/* end handles declaration */

/* templates */
%template(TColGeom_Array1OfBSplineCurve) NCollection_Array1<opencascade::handle<Geom_BSplineCurve>>;
Array1ExtendIter(opencascade::handle<Geom_BSplineCurve>)

%template(TColGeom_Array1OfBezierCurve) NCollection_Array1<opencascade::handle<Geom_BezierCurve>>;
Array1ExtendIter(opencascade::handle<Geom_BezierCurve>)

%template(TColGeom_Array1OfCurve) NCollection_Array1<opencascade::handle<Geom_Curve>>;
Array1ExtendIter(opencascade::handle<Geom_Curve>)

%template(TColGeom_Array1OfSurface) NCollection_Array1<opencascade::handle<Geom_Surface>>;
Array1ExtendIter(opencascade::handle<Geom_Surface>)

%template(TColGeom_Array2OfSurface) NCollection_Array2<opencascade::handle<Geom_Surface>>;
%template(TColGeom_SequenceOfBoundedCurve) NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>>;

%extend NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColGeom_SequenceOfCurve) NCollection_Sequence<opencascade::handle<Geom_Curve>>;

%extend NCollection_Sequence<opencascade::handle<Geom_Curve>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColGeom_SequenceOfSurface) NCollection_Sequence<opencascade::handle<Geom_Surface>>;

%extend NCollection_Sequence<opencascade::handle<Geom_Surface>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Geom_BSplineCurve>> TColGeom_Array1OfBSplineCurve;
typedef NCollection_Array1<opencascade::handle<Geom_BezierCurve>> TColGeom_Array1OfBezierCurve;
typedef NCollection_Array1<opencascade::handle<Geom_Curve>> TColGeom_Array1OfCurve;
typedef NCollection_Array1<opencascade::handle<Geom_Surface>> TColGeom_Array1OfSurface;
typedef NCollection_Array2<opencascade::handle<Geom_BezierSurface>> TColGeom_Array2OfBezierSurface;
typedef NCollection_Array2<opencascade::handle<Geom_Surface>> TColGeom_Array2OfSurface;
typedef NCollection_HArray1<opencascade::handle<Geom_BSplineCurve>> TColGeom_HArray1OfBSplineCurve;
typedef NCollection_HArray1<opencascade::handle<Geom_BezierCurve>> TColGeom_HArray1OfBezierCurve;
typedef NCollection_HArray1<opencascade::handle<Geom_Curve>> TColGeom_HArray1OfCurve;
typedef NCollection_HArray1<opencascade::handle<Geom_Surface>> TColGeom_HArray1OfSurface;
typedef NCollection_HArray2<opencascade::handle<Geom_Surface>> TColGeom_HArray2OfSurface;
typedef NCollection_HSequence<opencascade::handle<Geom_BoundedCurve>> TColGeom_HSequenceOfBoundedCurve;
typedef NCollection_HSequence<opencascade::handle<Geom_Curve>> TColGeom_HSequenceOfCurve;
typedef NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>> TColGeom_SequenceOfBoundedCurve;
typedef NCollection_Sequence<opencascade::handle<Geom_Curve>> TColGeom_SequenceOfCurve;
typedef NCollection_Sequence<opencascade::handle<Geom_Surface>> TColGeom_SequenceOfSurface;
/* end typedefs declaration */

/* harray1 classes */

class TColGeom_HArray1OfSurface : public NCollection_Array1<opencascade::handle<Geom_Surface>>, public Standard_Transient {
  public:
    TColGeom_HArray1OfSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<Geom_Surface>>::value_type& theValue);
    TColGeom_HArray1OfSurface(const NCollection_Array1<opencascade::handle<Geom_Surface>>& theOther);
    const NCollection_Array1<opencascade::handle<Geom_Surface>>& Array1();
    NCollection_Array1<opencascade::handle<Geom_Surface>>& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfSurface)


class TColGeom_HArray1OfBezierCurve : public NCollection_Array1<opencascade::handle<Geom_BezierCurve>>, public Standard_Transient {
  public:
    TColGeom_HArray1OfBezierCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfBezierCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<Geom_BezierCurve>>::value_type& theValue);
    TColGeom_HArray1OfBezierCurve(const NCollection_Array1<opencascade::handle<Geom_BezierCurve>>& theOther);
    const NCollection_Array1<opencascade::handle<Geom_BezierCurve>>& Array1();
    NCollection_Array1<opencascade::handle<Geom_BezierCurve>>& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfBezierCurve)


class TColGeom_HArray1OfCurve : public NCollection_Array1<opencascade::handle<Geom_Curve>>, public Standard_Transient {
  public:
    TColGeom_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<Geom_Curve>>::value_type& theValue);
    TColGeom_HArray1OfCurve(const NCollection_Array1<opencascade::handle<Geom_Curve>>& theOther);
    const NCollection_Array1<opencascade::handle<Geom_Curve>>& Array1();
    NCollection_Array1<opencascade::handle<Geom_Curve>>& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfCurve)


class TColGeom_HArray1OfBSplineCurve : public NCollection_Array1<opencascade::handle<Geom_BSplineCurve>>, public Standard_Transient {
  public:
    TColGeom_HArray1OfBSplineCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom_HArray1OfBSplineCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<Geom_BSplineCurve>>::value_type& theValue);
    TColGeom_HArray1OfBSplineCurve(const NCollection_Array1<opencascade::handle<Geom_BSplineCurve>>& theOther);
    const NCollection_Array1<opencascade::handle<Geom_BSplineCurve>>& Array1();
    NCollection_Array1<opencascade::handle<Geom_BSplineCurve>>& ChangeArray1();
};
%make_alias(TColGeom_HArray1OfBSplineCurve)

/* harray2 classes */
class TColGeom_HArray2OfSurface : public NCollection_Array2<opencascade::handle<Geom_Surface>>, public Standard_Transient {
  public:
    TColGeom_HArray2OfSurface(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColGeom_HArray2OfSurface(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<opencascade::handle<Geom_Surface>>::value_type& theValue);
    TColGeom_HArray2OfSurface(const NCollection_Array2<opencascade::handle<Geom_Surface>>& theOther);
    const NCollection_Array2<opencascade::handle<Geom_Surface>>& Array2 ();
    NCollection_Array2<opencascade::handle<Geom_Surface>>& ChangeArray2 (); 
};
%make_alias(TColGeom_HArray2OfSurface)


/* hsequence classes */
class TColGeom_HSequenceOfBoundedCurve : public NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>>, public Standard_Transient {
  public:
    TColGeom_HSequenceOfBoundedCurve();
    TColGeom_HSequenceOfBoundedCurve(const NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>>& theOther);
    const NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>>& theSequence);
    NCollection_Sequence<opencascade::handle<Geom_BoundedCurve>>& ChangeSequence();
};
%make_alias(TColGeom_HSequenceOfBoundedCurve)


class TColGeom_HSequenceOfCurve : public NCollection_Sequence<opencascade::handle<Geom_Curve>>, public Standard_Transient {
  public:
    TColGeom_HSequenceOfCurve();
    TColGeom_HSequenceOfCurve(const NCollection_Sequence<opencascade::handle<Geom_Curve>>& theOther);
    const NCollection_Sequence<opencascade::handle<Geom_Curve>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<Geom_Curve>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<Geom_Curve>>& theSequence);
    NCollection_Sequence<opencascade::handle<Geom_Curve>>& ChangeSequence();
};
%make_alias(TColGeom_HSequenceOfCurve)


/* class aliases */
%pythoncode {
}
