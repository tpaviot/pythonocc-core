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
%define TSHORTDOCSTRING
"TShort module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tshort.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
%import Standard.i
%import NCollection.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TShort_HArray1OfShortReal)
%wrap_handle(TShort_HArray2OfShortReal)
%wrap_handle(TShort_HSequenceOfShortReal)
/* end handles declaration */

/* templates */
%template(TShort_SequenceOfShortReal) NCollection_Sequence <Standard_ShortReal>;
%template(TShort_Array2OfShortReal) NCollection_Array2 <Standard_ShortReal>;
%template(TShort_Array1OfShortReal) NCollection_Array1 <Standard_ShortReal>;

%extend NCollection_Array1 <Standard_ShortReal> {
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
typedef NCollection_Sequence <Standard_ShortReal> TShort_SequenceOfShortReal;
typedef NCollection_Array2 <Standard_ShortReal> TShort_Array2OfShortReal;
typedef NCollection_Array1 <Standard_ShortReal> TShort_Array1OfShortReal;
/* end typedefs declaration */

/* harray1 classes */
class TShort_HArray1OfShortReal : public  TShort_Array1OfShortReal, public Standard_Transient {
  public:
    TShort_HArray1OfShortReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    TShort_HArray1OfShortReal(const Standard_Integer theLower, const Standard_Integer theUpper, const  TShort_Array1OfShortReal::value_type& theValue);
    TShort_HArray1OfShortReal(const  TShort_Array1OfShortReal& theOther);
    const  TShort_Array1OfShortReal& Array1();
     TShort_Array1OfShortReal& ChangeArray1();
};
%make_alias(TShort_HArray1OfShortReal)


/* harray2 classes */
class TShort_HArray2OfShortReal : public  TShort_Array2OfShortReal, public Standard_Transient {
  public:
    TShort_HArray2OfShortReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TShort_HArray2OfShortReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TShort_Array2OfShortReal::value_type& theValue);
    TShort_HArray2OfShortReal(const  TShort_Array2OfShortReal& theOther);
    const  TShort_Array2OfShortReal& Array2 ();
     TShort_Array2OfShortReal& ChangeArray2 (); 
};
%make_alias(TShort_HArray2OfShortReal)


/* hsequence classes */
class TShort_HSequenceOfShortReal : public  TShort_SequenceOfShortReal, public Standard_Transient {
  public:
    TShort_HSequenceOfShortReal();
    TShort_HSequenceOfShortReal(const  TShort_SequenceOfShortReal& theOther);
    const  TShort_SequenceOfShortReal& Sequence();
    void Append (const  TShort_SequenceOfShortReal::value_type& theItem);
    void Append ( TShort_SequenceOfShortReal& theSequence);
     TShort_SequenceOfShortReal& ChangeSequence();
};
%make_alias(TShort_HSequenceOfShortReal)


