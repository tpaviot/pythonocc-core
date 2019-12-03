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
%define TCOLQUANTITYDOCSTRING
"TColQuantity module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tcolquantity.html"
%enddef
%module (package="OCC.Core", docstring=TCOLQUANTITYDOCSTRING) TColQuantity


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
#include<TColQuantity_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
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
%wrap_handle(TColQuantity_HArray1OfLength)
%wrap_handle(TColQuantity_HArray2OfLength)
/* end handles declaration */

/* templates */
%template(TColQuantity_Array1OfLength) NCollection_Array1 <Quantity_Length>;

%extend NCollection_Array1 <Quantity_Length> {
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
%template(TColQuantity_Array2OfLength) NCollection_Array2 <Quantity_Length>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <Quantity_Length> TColQuantity_Array1OfLength;
typedef NCollection_Array2 <Quantity_Length> TColQuantity_Array2OfLength;
/* end typedefs declaration */

/* harray1 classes */
class TColQuantity_HArray1OfLength : public  TColQuantity_Array1OfLength, public Standard_Transient {
  public:
    TColQuantity_HArray1OfLength(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColQuantity_HArray1OfLength(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColQuantity_Array1OfLength::value_type& theValue);
    TColQuantity_HArray1OfLength(const  TColQuantity_Array1OfLength& theOther);
    const  TColQuantity_Array1OfLength& Array1();
     TColQuantity_Array1OfLength& ChangeArray1();
};
%make_alias(TColQuantity_HArray1OfLength)


/* harray2 classes */
class TColQuantity_HArray2OfLength : public  TColQuantity_Array2OfLength, public Standard_Transient {
  public:
    TColQuantity_HArray2OfLength(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColQuantity_HArray2OfLength(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColQuantity_Array2OfLength::value_type& theValue);
    TColQuantity_HArray2OfLength(const  TColQuantity_Array2OfLength& theOther);
    const  TColQuantity_Array2OfLength& Array2 ();
     TColQuantity_Array2OfLength& ChangeArray2 (); 
};
%make_alias(TColQuantity_HArray2OfLength)


/* hsequence classes */
