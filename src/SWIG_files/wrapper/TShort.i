/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_tshort.html"
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

%{
#define SWIG_FILE_WITH_INIT
%}
%include ../common/numpy.i
%include ../common/ArrayMacros.i

%init %{
	import_array();
%}

%import Standard.i
%import NCollection.i

%pythoncode {
import numpy as np

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
Array1Template(TShort_Array1OfShortReal, float, Standard_ShortReal)

%apply (float* IN_ARRAY2, int DIM1, int DIM2) { (float* numpyArray2, int nRows2, int nCols2) };
%apply (float* ARGOUT_ARRAY1, int DIM1) { (float* numpyArray2Argout, int aSizeArgout) };
Array2Template(TShort_Array2OfShortReal, float, Standard_ShortReal)
%template(TShort_SequenceOfShortReal) NCollection_Sequence<Standard_ShortReal>;

%extend NCollection_Sequence<Standard_ShortReal> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Standard_ShortReal> TShort_Array1OfShortReal;
typedef NCollection_Array2<Standard_ShortReal> TShort_Array2OfShortReal;
typedef NCollection_Sequence<Standard_ShortReal> TShort_SequenceOfShortReal;
/* end typedefs declaration */

/* harray1 classes */

class TShort_HArray1OfShortReal : public TShort_Array1OfShortReal, public Standard_Transient {
  public:
    TShort_HArray1OfShortReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    TShort_HArray1OfShortReal(const Standard_Integer theLower, const Standard_Integer theUpper, const TShort_Array1OfShortReal::value_type& theValue);
    TShort_HArray1OfShortReal(const TShort_Array1OfShortReal& theOther);
    const TShort_Array1OfShortReal& Array1();
    TShort_Array1OfShortReal& ChangeArray1();
};
%make_alias(TShort_HArray1OfShortReal)

/* harray2 classes */
class TShort_HArray2OfShortReal : public TShort_Array2OfShortReal, public Standard_Transient {
  public:
    TShort_HArray2OfShortReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TShort_HArray2OfShortReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const TShort_Array2OfShortReal::value_type& theValue);
    TShort_HArray2OfShortReal(const TShort_Array2OfShortReal& theOther);
    const TShort_Array2OfShortReal& Array2 ();
    TShort_Array2OfShortReal& ChangeArray2 (); 
};
%make_alias(TShort_HArray2OfShortReal)


/* hsequence classes */
class TShort_HSequenceOfShortReal : public TShort_SequenceOfShortReal, public Standard_Transient {
  public:
    TShort_HSequenceOfShortReal();
    TShort_HSequenceOfShortReal(const TShort_SequenceOfShortReal& theOther);
    const TShort_SequenceOfShortReal& Sequence();
    void Append (const TShort_SequenceOfShortReal::value_type& theItem);
    void Append (TShort_SequenceOfShortReal& theSequence);
    TShort_SequenceOfShortReal& ChangeSequence();
};
%make_alias(TShort_HSequenceOfShortReal)


/* class aliases */
%pythoncode {
}
