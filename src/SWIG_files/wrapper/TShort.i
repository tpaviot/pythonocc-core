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
%define TSHORTDOCSTRING
"TShort module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tshort.html"
%enddef
%module (package="OCC.Core", docstring=TSHORTDOCSTRING) TShort


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
#include<TShort_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Standard_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};

/*
numpy support for Geom, Geom2d, Poly, TColStd, TColgp, TShort see
https://github.com/tpaviot/pythonocc-core/pull/1381
*/
%{
#define SWIG_FILE_WITH_INIT
%}
%include ../common/numpy.i

%init %{
        import_array();
%}

%pythoncode {
    import numpy as np
}
%apply (double* IN_ARRAY1, int DIM1) { (double* numpyArrayU, int nRowsU) };
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArrayUV, int nRowsUV, int nColUV) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArrayResultArgout, int aSizeArgout) };

/*
end of numpy support section
*/
%import Standard.i
%import NCollection.i

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
%wrap_handle(TShort_HArray1OfShortReal)
%wrap_handle(TShort_HArray2OfShortReal)
%wrap_handle(TShort_HSequenceOfShortReal)
/* end handles declaration */

/* templates */
%apply (float* IN_ARRAY1, int DIM1) { (float* numpyArray1, int nRows1) };
%apply (float* ARGOUT_ARRAY1, int DIM1) { (float* numpyArray1Argout, int nRows1Argout) };
Array1NumpyTemplate(TShort_Array1OfShortReal, float, float)
%apply (float* IN_ARRAY2, int DIM1, int DIM2) { (float* numpyArray2, int nRows2, int nCols2) };
%apply (float* ARGOUT_ARRAY1, int DIM1) { (float* numpyArray2Argout, int aSizeArgout) };
Array2NumpyTemplate(TShort_Array2OfShortReal, float, float)
%template(TShort_SequenceOfShortReal) NCollection_Sequence<float>;

%extend NCollection_Sequence<float> {
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
typedef NCollection_Array1<float> TShort_Array1OfShortReal;
typedef NCollection_Array2<float> TShort_Array2OfShortReal;
typedef NCollection_HArray1<float> TShort_HArray1OfShortReal;
typedef NCollection_HArray2<float> TShort_HArray2OfShortReal;
typedef NCollection_HSequence<float> TShort_HSequenceOfShortReal;
typedef NCollection_Sequence<float> TShort_SequenceOfShortReal;
/* end typedefs declaration */

/* harray1 classes */

class TShort_HArray1OfShortReal : public NCollection_Array1<float>, public Standard_Transient {
  public:
    TShort_HArray1OfShortReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    TShort_HArray1OfShortReal(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<float>::value_type& theValue);
    TShort_HArray1OfShortReal(const NCollection_Array1<float>& theOther);
    const NCollection_Array1<float>& Array1();
    NCollection_Array1<float>& ChangeArray1();
};
%make_alias(TShort_HArray1OfShortReal)

/* harray2 classes */
class TShort_HArray2OfShortReal : public NCollection_Array2<float>, public Standard_Transient {
  public:
    TShort_HArray2OfShortReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TShort_HArray2OfShortReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<float>::value_type& theValue);
    TShort_HArray2OfShortReal(const NCollection_Array2<float>& theOther);
    const NCollection_Array2<float>& Array2 ();
    NCollection_Array2<float>& ChangeArray2 (); 
};
%make_alias(TShort_HArray2OfShortReal)


/* hsequence classes */
class TShort_HSequenceOfShortReal : public NCollection_Sequence<float>, public Standard_Transient {
  public:
    TShort_HSequenceOfShortReal();
    TShort_HSequenceOfShortReal(const NCollection_Sequence<float>& theOther);
    const NCollection_Sequence<float>& Sequence();
    void Append (const NCollection_Sequence<float>::value_type& theItem);
    void Append (NCollection_Sequence<float>& theSequence);
    NCollection_Sequence<float>& ChangeSequence();
};
%make_alias(TShort_HSequenceOfShortReal)


/* class aliases */
%pythoncode {
}
