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
%define TCOLGPDOCSTRING
"TColgp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tcolgp.html"
%enddef
%module (package="OCC.Core", docstring=TCOLGPDOCSTRING) TColgp


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
#include<TColgp_module.hxx>

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
%wrap_handle(TColgp_HArray1OfVec)
%wrap_handle(TColgp_HArray1OfXY)
%wrap_handle(TColgp_HArray1OfCirc2d)
%wrap_handle(TColgp_HArray1OfPnt2d)
%wrap_handle(TColgp_HArray1OfDir)
%wrap_handle(TColgp_HArray1OfLin2d)
%wrap_handle(TColgp_HArray1OfPnt)
%wrap_handle(TColgp_HArray1OfXYZ)
%wrap_handle(TColgp_HArray1OfVec2d)
%wrap_handle(TColgp_HArray1OfDir2d)
%wrap_handle(TColgp_HArray2OfLin2d)
%wrap_handle(TColgp_HArray2OfVec)
%wrap_handle(TColgp_HArray2OfCirc2d)
%wrap_handle(TColgp_HArray2OfPnt2d)
%wrap_handle(TColgp_HArray2OfDir2d)
%wrap_handle(TColgp_HArray2OfDir)
%wrap_handle(TColgp_HArray2OfPnt)
%wrap_handle(TColgp_HArray2OfVec2d)
%wrap_handle(TColgp_HArray2OfXYZ)
%wrap_handle(TColgp_HArray2OfXY)
%wrap_handle(TColgp_HSequenceOfXY)
%wrap_handle(TColgp_HSequenceOfPnt2d)
%wrap_handle(TColgp_HSequenceOfPnt)
%wrap_handle(TColgp_HSequenceOfXYZ)
%wrap_handle(TColgp_HSequenceOfVec2d)
%wrap_handle(TColgp_HSequenceOfDir2d)
%wrap_handle(TColgp_HSequenceOfVec)
%wrap_handle(TColgp_HSequenceOfDir)
/* end handles declaration */

/* templates */
%template(TColgp_Array2OfXYZ) NCollection_Array2 <gp_XYZ>;
%template(TColgp_SequenceOfVec) NCollection_Sequence <gp_Vec>;
%template(TColgp_Array1OfCirc2d) NCollection_Array1 <gp_Circ2d>;

%extend NCollection_Array1 <gp_Circ2d> {
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
%template(TColgp_Array1OfLin2d) NCollection_Array1 <gp_Lin2d>;

%extend NCollection_Array1 <gp_Lin2d> {
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
%template(TColgp_SequenceOfPnt2d) NCollection_Sequence <gp_Pnt2d>;
%template(TColgp_SequenceOfVec2d) NCollection_Sequence <gp_Vec2d>;
%template(TColgp_Array1OfDir) NCollection_Array1 <gp_Dir>;

%extend NCollection_Array1 <gp_Dir> {
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
%template(TColgp_SequenceOfPnt) NCollection_Sequence <gp_Pnt>;
%template(TColgp_Array1OfPnt2d) NCollection_Array1 <gp_Pnt2d>;

%extend NCollection_Array1 <gp_Pnt2d> {
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
%template(TColgp_Array1OfDir2d) NCollection_Array1 <gp_Dir2d>;

%extend NCollection_Array1 <gp_Dir2d> {
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
%template(TColgp_SequenceOfDir2d) NCollection_Sequence <gp_Dir2d>;
%template(TColgp_Array2OfVec2d) NCollection_Array2 <gp_Vec2d>;
%template(TColgp_Array2OfXY) NCollection_Array2 <gp_XY>;
%template(TColgp_Array2OfLin2d) NCollection_Array2 <gp_Lin2d>;
%template(TColgp_SequenceOfXY) NCollection_Sequence <gp_XY>;
%template(TColgp_Array1OfXYZ) NCollection_Array1 <gp_XYZ>;

%extend NCollection_Array1 <gp_XYZ> {
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
%template(TColgp_Array2OfPnt2d) NCollection_Array2 <gp_Pnt2d>;
%template(TColgp_Array1OfVec2d) NCollection_Array1 <gp_Vec2d>;

%extend NCollection_Array1 <gp_Vec2d> {
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
%template(TColgp_SequenceOfAx1) NCollection_Sequence <gp_Ax1>;
%template(TColgp_SequenceOfDir) NCollection_Sequence <gp_Dir>;
%template(TColgp_SequenceOfArray1OfPnt2d) NCollection_Sequence <opencascade::handle <TColgp_HArray1OfPnt2d>>;
%template(TColgp_Array1OfVec) NCollection_Array1 <gp_Vec>;

%extend NCollection_Array1 <gp_Vec> {
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
%template(TColgp_Array2OfPnt) NCollection_Array2 <gp_Pnt>;
%template(TColgp_Array2OfVec) NCollection_Array2 <gp_Vec>;
%template(TColgp_Array2OfCirc2d) NCollection_Array2 <gp_Circ2d>;
%template(TColgp_Array1OfXY) NCollection_Array1 <gp_XY>;

%extend NCollection_Array1 <gp_XY> {
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
%template(TColgp_Array2OfDir2d) NCollection_Array2 <gp_Dir2d>;
%template(TColgp_Array1OfPnt) NCollection_Array1 <gp_Pnt>;

%extend NCollection_Array1 <gp_Pnt> {
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
%template(TColgp_SequenceOfXYZ) NCollection_Sequence <gp_XYZ>;
%template(TColgp_Array2OfDir) NCollection_Array2 <gp_Dir>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2 <gp_XYZ> TColgp_Array2OfXYZ;
typedef NCollection_Sequence <gp_Vec> TColgp_SequenceOfVec;
typedef NCollection_Array1 <gp_Circ2d> TColgp_Array1OfCirc2d;
typedef NCollection_Array1 <gp_Lin2d> TColgp_Array1OfLin2d;
typedef NCollection_Sequence <gp_Pnt2d> TColgp_SequenceOfPnt2d;
typedef NCollection_Sequence <gp_Vec2d> TColgp_SequenceOfVec2d;
typedef NCollection_Array1 <gp_Dir> TColgp_Array1OfDir;
typedef NCollection_Sequence <gp_Pnt> TColgp_SequenceOfPnt;
typedef NCollection_Array1 <gp_Pnt2d> TColgp_Array1OfPnt2d;
typedef NCollection_Array1 <gp_Dir2d> TColgp_Array1OfDir2d;
typedef NCollection_Sequence <gp_Dir2d> TColgp_SequenceOfDir2d;
typedef NCollection_Array2 <gp_Vec2d> TColgp_Array2OfVec2d;
typedef NCollection_Array2 <gp_XY> TColgp_Array2OfXY;
typedef NCollection_Array2 <gp_Lin2d> TColgp_Array2OfLin2d;
typedef NCollection_Sequence <gp_XY> TColgp_SequenceOfXY;
typedef NCollection_Array1 <gp_XYZ> TColgp_Array1OfXYZ;
typedef NCollection_Array2 <gp_Pnt2d> TColgp_Array2OfPnt2d;
typedef NCollection_Array1 <gp_Vec2d> TColgp_Array1OfVec2d;
typedef NCollection_Sequence <gp_Ax1> TColgp_SequenceOfAx1;
typedef NCollection_Sequence <gp_Dir> TColgp_SequenceOfDir;
typedef NCollection_Sequence <opencascade::handle <TColgp_HArray1OfPnt2d>> TColgp_SequenceOfArray1OfPnt2d;
typedef NCollection_Array1 <gp_Vec> TColgp_Array1OfVec;
typedef NCollection_Array2 <gp_Pnt> TColgp_Array2OfPnt;
typedef NCollection_Array2 <gp_Vec> TColgp_Array2OfVec;
typedef NCollection_Array2 <gp_Circ2d> TColgp_Array2OfCirc2d;
typedef NCollection_Array1 <gp_XY> TColgp_Array1OfXY;
typedef NCollection_Array2 <gp_Dir2d> TColgp_Array2OfDir2d;
typedef NCollection_Array1 <gp_Pnt> TColgp_Array1OfPnt;
typedef NCollection_Sequence <gp_XYZ> TColgp_SequenceOfXYZ;
typedef NCollection_Array2 <gp_Dir> TColgp_Array2OfDir;
/* end typedefs declaration */

/* harray1 classes */
class TColgp_HArray1OfVec : public  TColgp_Array1OfVec, public Standard_Transient {
  public:
    TColgp_HArray1OfVec(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfVec(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfVec::value_type& theValue);
    TColgp_HArray1OfVec(const  TColgp_Array1OfVec& theOther);
    const  TColgp_Array1OfVec& Array1();
     TColgp_Array1OfVec& ChangeArray1();
};
%make_alias(TColgp_HArray1OfVec)


class TColgp_HArray1OfXY : public  TColgp_Array1OfXY, public Standard_Transient {
  public:
    TColgp_HArray1OfXY(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfXY(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfXY::value_type& theValue);
    TColgp_HArray1OfXY(const  TColgp_Array1OfXY& theOther);
    const  TColgp_Array1OfXY& Array1();
     TColgp_Array1OfXY& ChangeArray1();
};
%make_alias(TColgp_HArray1OfXY)


class TColgp_HArray1OfCirc2d : public  TColgp_Array1OfCirc2d, public Standard_Transient {
  public:
    TColgp_HArray1OfCirc2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfCirc2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfCirc2d::value_type& theValue);
    TColgp_HArray1OfCirc2d(const  TColgp_Array1OfCirc2d& theOther);
    const  TColgp_Array1OfCirc2d& Array1();
     TColgp_Array1OfCirc2d& ChangeArray1();
};
%make_alias(TColgp_HArray1OfCirc2d)


class TColgp_HArray1OfPnt2d : public  TColgp_Array1OfPnt2d, public Standard_Transient {
  public:
    TColgp_HArray1OfPnt2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfPnt2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfPnt2d::value_type& theValue);
    TColgp_HArray1OfPnt2d(const  TColgp_Array1OfPnt2d& theOther);
    const  TColgp_Array1OfPnt2d& Array1();
     TColgp_Array1OfPnt2d& ChangeArray1();
};
%make_alias(TColgp_HArray1OfPnt2d)


class TColgp_HArray1OfDir : public  TColgp_Array1OfDir, public Standard_Transient {
  public:
    TColgp_HArray1OfDir(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfDir(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfDir::value_type& theValue);
    TColgp_HArray1OfDir(const  TColgp_Array1OfDir& theOther);
    const  TColgp_Array1OfDir& Array1();
     TColgp_Array1OfDir& ChangeArray1();
};
%make_alias(TColgp_HArray1OfDir)


class TColgp_HArray1OfLin2d : public  TColgp_Array1OfLin2d, public Standard_Transient {
  public:
    TColgp_HArray1OfLin2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfLin2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfLin2d::value_type& theValue);
    TColgp_HArray1OfLin2d(const  TColgp_Array1OfLin2d& theOther);
    const  TColgp_Array1OfLin2d& Array1();
     TColgp_Array1OfLin2d& ChangeArray1();
};
%make_alias(TColgp_HArray1OfLin2d)


class TColgp_HArray1OfPnt : public  TColgp_Array1OfPnt, public Standard_Transient {
  public:
    TColgp_HArray1OfPnt(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfPnt(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfPnt::value_type& theValue);
    TColgp_HArray1OfPnt(const  TColgp_Array1OfPnt& theOther);
    const  TColgp_Array1OfPnt& Array1();
     TColgp_Array1OfPnt& ChangeArray1();
};
%make_alias(TColgp_HArray1OfPnt)


class TColgp_HArray1OfXYZ : public  TColgp_Array1OfXYZ, public Standard_Transient {
  public:
    TColgp_HArray1OfXYZ(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfXYZ(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfXYZ::value_type& theValue);
    TColgp_HArray1OfXYZ(const  TColgp_Array1OfXYZ& theOther);
    const  TColgp_Array1OfXYZ& Array1();
     TColgp_Array1OfXYZ& ChangeArray1();
};
%make_alias(TColgp_HArray1OfXYZ)


class TColgp_HArray1OfVec2d : public  TColgp_Array1OfVec2d, public Standard_Transient {
  public:
    TColgp_HArray1OfVec2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfVec2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfVec2d::value_type& theValue);
    TColgp_HArray1OfVec2d(const  TColgp_Array1OfVec2d& theOther);
    const  TColgp_Array1OfVec2d& Array1();
     TColgp_Array1OfVec2d& ChangeArray1();
};
%make_alias(TColgp_HArray1OfVec2d)


class TColgp_HArray1OfDir2d : public  TColgp_Array1OfDir2d, public Standard_Transient {
  public:
    TColgp_HArray1OfDir2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfDir2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColgp_Array1OfDir2d::value_type& theValue);
    TColgp_HArray1OfDir2d(const  TColgp_Array1OfDir2d& theOther);
    const  TColgp_Array1OfDir2d& Array1();
     TColgp_Array1OfDir2d& ChangeArray1();
};
%make_alias(TColgp_HArray1OfDir2d)


/* harray2 classes */
class TColgp_HArray2OfLin2d : public  TColgp_Array2OfLin2d, public Standard_Transient {
  public:
    TColgp_HArray2OfLin2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfLin2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfLin2d::value_type& theValue);
    TColgp_HArray2OfLin2d(const  TColgp_Array2OfLin2d& theOther);
    const  TColgp_Array2OfLin2d& Array2 ();
     TColgp_Array2OfLin2d& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfLin2d)


class TColgp_HArray2OfVec : public  TColgp_Array2OfVec, public Standard_Transient {
  public:
    TColgp_HArray2OfVec(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfVec(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfVec::value_type& theValue);
    TColgp_HArray2OfVec(const  TColgp_Array2OfVec& theOther);
    const  TColgp_Array2OfVec& Array2 ();
     TColgp_Array2OfVec& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfVec)


class TColgp_HArray2OfCirc2d : public  TColgp_Array2OfCirc2d, public Standard_Transient {
  public:
    TColgp_HArray2OfCirc2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfCirc2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfCirc2d::value_type& theValue);
    TColgp_HArray2OfCirc2d(const  TColgp_Array2OfCirc2d& theOther);
    const  TColgp_Array2OfCirc2d& Array2 ();
     TColgp_Array2OfCirc2d& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfCirc2d)


class TColgp_HArray2OfPnt2d : public  TColgp_Array2OfPnt2d, public Standard_Transient {
  public:
    TColgp_HArray2OfPnt2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfPnt2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfPnt2d::value_type& theValue);
    TColgp_HArray2OfPnt2d(const  TColgp_Array2OfPnt2d& theOther);
    const  TColgp_Array2OfPnt2d& Array2 ();
     TColgp_Array2OfPnt2d& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfPnt2d)


class TColgp_HArray2OfDir2d : public  TColgp_Array2OfDir2d, public Standard_Transient {
  public:
    TColgp_HArray2OfDir2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfDir2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfDir2d::value_type& theValue);
    TColgp_HArray2OfDir2d(const  TColgp_Array2OfDir2d& theOther);
    const  TColgp_Array2OfDir2d& Array2 ();
     TColgp_Array2OfDir2d& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfDir2d)


class TColgp_HArray2OfDir : public  TColgp_Array2OfDir, public Standard_Transient {
  public:
    TColgp_HArray2OfDir(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfDir(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfDir::value_type& theValue);
    TColgp_HArray2OfDir(const  TColgp_Array2OfDir& theOther);
    const  TColgp_Array2OfDir& Array2 ();
     TColgp_Array2OfDir& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfDir)


class TColgp_HArray2OfPnt : public  TColgp_Array2OfPnt, public Standard_Transient {
  public:
    TColgp_HArray2OfPnt(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfPnt(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfPnt::value_type& theValue);
    TColgp_HArray2OfPnt(const  TColgp_Array2OfPnt& theOther);
    const  TColgp_Array2OfPnt& Array2 ();
     TColgp_Array2OfPnt& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfPnt)


class TColgp_HArray2OfVec2d : public  TColgp_Array2OfVec2d, public Standard_Transient {
  public:
    TColgp_HArray2OfVec2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfVec2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfVec2d::value_type& theValue);
    TColgp_HArray2OfVec2d(const  TColgp_Array2OfVec2d& theOther);
    const  TColgp_Array2OfVec2d& Array2 ();
     TColgp_Array2OfVec2d& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfVec2d)


class TColgp_HArray2OfXYZ : public  TColgp_Array2OfXYZ, public Standard_Transient {
  public:
    TColgp_HArray2OfXYZ(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfXYZ(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfXYZ::value_type& theValue);
    TColgp_HArray2OfXYZ(const  TColgp_Array2OfXYZ& theOther);
    const  TColgp_Array2OfXYZ& Array2 ();
     TColgp_Array2OfXYZ& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfXYZ)


class TColgp_HArray2OfXY : public  TColgp_Array2OfXY, public Standard_Transient {
  public:
    TColgp_HArray2OfXY(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfXY(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColgp_Array2OfXY::value_type& theValue);
    TColgp_HArray2OfXY(const  TColgp_Array2OfXY& theOther);
    const  TColgp_Array2OfXY& Array2 ();
     TColgp_Array2OfXY& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfXY)


/* hsequence classes */
class TColgp_HSequenceOfXY : public  TColgp_SequenceOfXY, public Standard_Transient {
  public:
    TColgp_HSequenceOfXY();
    TColgp_HSequenceOfXY(const  TColgp_SequenceOfXY& theOther);
    const  TColgp_SequenceOfXY& Sequence();
    void Append (const  TColgp_SequenceOfXY::value_type& theItem);
    void Append ( TColgp_SequenceOfXY& theSequence);
     TColgp_SequenceOfXY& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfXY)


class TColgp_HSequenceOfPnt2d : public  TColgp_SequenceOfPnt2d, public Standard_Transient {
  public:
    TColgp_HSequenceOfPnt2d();
    TColgp_HSequenceOfPnt2d(const  TColgp_SequenceOfPnt2d& theOther);
    const  TColgp_SequenceOfPnt2d& Sequence();
    void Append (const  TColgp_SequenceOfPnt2d::value_type& theItem);
    void Append ( TColgp_SequenceOfPnt2d& theSequence);
     TColgp_SequenceOfPnt2d& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfPnt2d)


class TColgp_HSequenceOfPnt : public  TColgp_SequenceOfPnt, public Standard_Transient {
  public:
    TColgp_HSequenceOfPnt();
    TColgp_HSequenceOfPnt(const  TColgp_SequenceOfPnt& theOther);
    const  TColgp_SequenceOfPnt& Sequence();
    void Append (const  TColgp_SequenceOfPnt::value_type& theItem);
    void Append ( TColgp_SequenceOfPnt& theSequence);
     TColgp_SequenceOfPnt& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfPnt)


class TColgp_HSequenceOfXYZ : public  TColgp_SequenceOfXYZ, public Standard_Transient {
  public:
    TColgp_HSequenceOfXYZ();
    TColgp_HSequenceOfXYZ(const  TColgp_SequenceOfXYZ& theOther);
    const  TColgp_SequenceOfXYZ& Sequence();
    void Append (const  TColgp_SequenceOfXYZ::value_type& theItem);
    void Append ( TColgp_SequenceOfXYZ& theSequence);
     TColgp_SequenceOfXYZ& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfXYZ)


class TColgp_HSequenceOfVec2d : public  TColgp_SequenceOfVec2d, public Standard_Transient {
  public:
    TColgp_HSequenceOfVec2d();
    TColgp_HSequenceOfVec2d(const  TColgp_SequenceOfVec2d& theOther);
    const  TColgp_SequenceOfVec2d& Sequence();
    void Append (const  TColgp_SequenceOfVec2d::value_type& theItem);
    void Append ( TColgp_SequenceOfVec2d& theSequence);
     TColgp_SequenceOfVec2d& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfVec2d)


class TColgp_HSequenceOfDir2d : public  TColgp_SequenceOfDir2d, public Standard_Transient {
  public:
    TColgp_HSequenceOfDir2d();
    TColgp_HSequenceOfDir2d(const  TColgp_SequenceOfDir2d& theOther);
    const  TColgp_SequenceOfDir2d& Sequence();
    void Append (const  TColgp_SequenceOfDir2d::value_type& theItem);
    void Append ( TColgp_SequenceOfDir2d& theSequence);
     TColgp_SequenceOfDir2d& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfDir2d)


class TColgp_HSequenceOfVec : public  TColgp_SequenceOfVec, public Standard_Transient {
  public:
    TColgp_HSequenceOfVec();
    TColgp_HSequenceOfVec(const  TColgp_SequenceOfVec& theOther);
    const  TColgp_SequenceOfVec& Sequence();
    void Append (const  TColgp_SequenceOfVec::value_type& theItem);
    void Append ( TColgp_SequenceOfVec& theSequence);
     TColgp_SequenceOfVec& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfVec)


class TColgp_HSequenceOfDir : public  TColgp_SequenceOfDir, public Standard_Transient {
  public:
    TColgp_HSequenceOfDir();
    TColgp_HSequenceOfDir(const  TColgp_SequenceOfDir& theOther);
    const  TColgp_SequenceOfDir& Sequence();
    void Append (const  TColgp_SequenceOfDir::value_type& theItem);
    void Append ( TColgp_SequenceOfDir& theSequence);
     TColgp_SequenceOfDir& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfDir)


